*** Settings ***
Documentation  Login Test
Library  SeleniumLibrary
Suite Setup  Open browser of  chrome
# Suite Teardown  End session and close browser
Resource  ../PO/generic.robot
Resource  ../PO/login_page_mail.robot
Resource  ../PO/login_page_password.robot
Resource  ../PO/main_page.robot

*** Variables ***
${price_filter_at_most_20}  (//i[@class='a-icon a-icon-checkbox'])[4]
${price_filter_at_most_20_checkbox}  (//input[@type='checkbox'])[4]
${price_filter_between_100_200}  (//i[@class='a-icon a-icon-checkbox'])[6]
${price_filter_between_100_200_checkbox}  (//input[@type='checkbox'])[6]
${price_filter_at_least_500}  (//i[@class='a-icon a-icon-checkbox'])[8]
${price_filter_at_least_500_checkbox}  (//input[@type='checkbox'])[8]
${filter_low_price}  low-price
${filter_high_price}  high-price

*** Test Cases ***
Filter Test for Price
    [Documentation]  The aim of this test is to check if price filteration is working.

    # Initialization
    Allow Cookies for Amazon
    Search from search bar to  book

    # Price at most 20
    Select at most 20 price filter
    Unselect at most 20 price filter

    # Price between 100-200
    Select between 100 and 200 price filter
    Unselect between 100 and 200 price filter

    # Price at least 500
    Select at least 500 price filter
    Unselect at least 500 price filter

    # Custom price between 27-512

    sleep  10 s

*** Keywords ***
Select at most 20 price filter
    wait until element is visible  ${price_filter_at_most_20}  10 s
    click element  ${price_filter_at_most_20}
    wait until keyword succeeds  15 s  3 s  checkbox should be selected  ${price_filter_at_most_20_checkbox}

Unselect at most 20 price filter
    wait until element is visible  ${price_filter_at_most_20}  10 s
    click element  ${price_filter_at_most_20}
    wait until keyword succeeds  15 s  3 s  checkbox should not be selected  ${price_filter_at_most_20_checkbox}

Select between 100 and 200 price filter
    wait until element is visible  ${price_filter_between_100_200}  10 s
    click element  ${price_filter_between_100_200}
    wait until keyword succeeds  15 s  3 s  checkbox should be selected  ${price_filter_between_100_200_checkbox}

Unselect between 100 and 200 price filter
    wait until element is visible  ${price_filter_between_100_200}  10 s
    click element  ${price_filter_between_100_200}
    wait until keyword succeeds  15 s  3 s  checkbox should not be selected  ${price_filter_between_100_200_checkbox}

Select at least 500 price filter
    wait until element is visible  ${price_filter_at_least_500}  10 s
    click element  ${price_filter_at_least_500}
    wait until keyword succeeds  15 s  3 s  checkbox should be selected  ${price_filter_at_least_500_checkbox}

Unselect at least 500 price filter
    wait until element is visible  ${price_filter_at_least_500}  10 s
    click element  ${price_filter_at_least_500}
    wait until keyword succeeds  15 s  3 s  checkbox should not be selected  ${price_filter_at_least_500_checkbox}