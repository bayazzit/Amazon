*** Settings ***
Documentation  Login Test
Library  SeleniumLibrary
Library  String
Library  Collections
Suite Setup  Open browser of  chrome
# Suite Teardown  End session and close browser
Resource  ../PO/generic.robot
Resource  ../keywords/all_keywords.robot

*** Variables ***
${top_item}  (//a[@class='a-link-normal s-underline-text s-underline-link-text s-link-style a-text-normal'])[1]
${price_locator}  price

*** Test Cases ***
Filter Test for Price
    [Documentation]  The aim of this test is to check if price filteration is working.

    # Initialization
    Allow Cookies for Amazon
    Search from search bar to  book

    # Price at most 20
    Select at most 20 price filter
    Sort as Decreasing Price
    Select the top item
    Price should be less than  20
    Go back
    Unselect at most 20 price filter

    # Price between 100-200
    Select between 100 and 200 price filter
    Select the top item
    Price should be less than  200
    Go back
    Sort as Increasing Price
    Select the top item
    #Price should be more than  100
    Go back
    Unselect between 100 and 200 price filter

    # Price at least 500
    Select at least 500 price filter
    Select the top item
    Price should be more than  500
    Go back
    Unselect at least 500 price filter

    # Custom price between 27-712
    Filter minimum price at  27
    Filter maximum price at  712
    Apply price filter
    Sort as Increasing Price
    Select the top item
    Price should be more than  27
    Go back
    Sort as Decreasing Price
    select the top item
    price should be less than  712

*** Keywords ***
Select the top item
    wait until keyword succeeds  15 s  3 s  click element  ${top_item}

Price should be less than
    [Documentation]  Given limit should be an integer
    [Arguments]  ${upper_limit}
    ${upper_limit}  convert to integer  ${upper_limit}
    wait until page contains element  ${price_locator}
    ${price}  get text  ${price_locator}
    @{price}  split string  ${price}  ,
    ${price_beg}  get from list  ${price}  0
    ${price_end}  get from list  ${price}  1
    ${price_end}  get substring  ${price_end}  0  2
    ${price}  catenate  SEPARATOR=.  ${price_beg}  ${price_end}
    ${price}  convert to number  ${price}
    should be true  ${price} <= ${upper_limit}

Price should be more than
    [Documentation]  Given limit should be an integer
    [Arguments]  ${lower_limit}
    ${lower_limit}  convert to integer  ${lower_limit}
    wait until page contains element  ${price_locator}
    ${price}  get text  ${price_locator}
    @{price}  split string  ${price}  ,
    ${price_beg}  get from list  ${price}  0
    ${price_end}  get from list  ${price}  1
    ${price_end}  get substring  ${price_end}  0  2
    ${price}  catenate  SEPARATOR=.  ${price_beg}  ${price_end}
    ${price}  convert to number  ${price}
    should be true  ${lower_limit} <= ${price}