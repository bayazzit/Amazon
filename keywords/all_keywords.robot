*** Settings ***
Library  SeleniumLibrary
Library  String
Library  Collections
Resource  ../keywords/filtering_keywords.robot
Resource  ../keywords/sorting_keywords.robot

*** Variables ***
${price_locator}  price
${price_locator_backup}  //div[@id='apex_desktop_dealsAccordionRow']//span[@class='a-price-whole']

*** Keywords ***
Price should be less than
    [Documentation]  Given limit should be an integer
    ...              * This keyword should be used when the item's page is opened
    [Arguments]  ${upper_limit}
    ${upper_limit}  convert to integer  ${upper_limit}
    ${price}  Get the price
    should be true  ${price} <= ${upper_limit}  FAIL: Price is higher than the limit!

Price should be more than
    [Documentation]  Given limit should be an integer
    ...              * This keyword should be used when the item's page is opened
    [Arguments]  ${lower_limit}
    ${lower_limit}  convert to integer  ${lower_limit}
    ${price}  Get the price
    should be true  ${lower_limit} <= ${price}  FAIL: Price is lower than the limit!

Get the price
    [Documentation]  This keyword gets the exact price of an item as a number solely
    ...              * Should be used when the item's page is opened
    ${status}  run keyword and return status  wait until page contains element  ${price_locator}
    IF  ${status} == True
        ${price}  get text  ${price_locator}
        @{price}  split string  ${price}  ,
    ELSE
        ${price}  get text  ${price_locator_backup}
        @{price}  split to lines  ${price}
    END
    ${price_beg}  get from list  ${price}  0
    ${price_end}  get from list  ${price}  1
    ${price_end}  get substring  ${price_end}  0  2
    ${price}  catenate  SEPARATOR=.  ${price_beg}  ${price_end}
    ${price}  convert to number  ${price}
    [Return]  ${price}