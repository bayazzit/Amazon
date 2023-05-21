*** Settings ***
Documentation  Tests for filtering features
Library  SeleniumLibrary
Library  String
Library  Collections
Test Setup  Open browser of  chrome
Test Teardown  Close Browser
Resource  ../PO/generic.robot
Resource  ../keywords/all_keywords.robot

*** Variables ***
${first_item}  (//div[@class='a-section a-spacing-base'])[1]
${fifth_item}  (//div[@class='a-section a-spacing-base'])[5]
${ninth_item}  (//div[@class='a-section a-spacing-base'])[9]

*** Test Cases ***
Sorting Price as Decreasing
    [Documentation]  In this test, a group of items will be sorted in decreasing price
    ...              and tested if the sorting is correct or not

    # Initialization
    Allow Cookies for Amazon
    Search from search bar to  toy

    Select between 200 and 500 price filter
    Sort in Decreasing Price

    Select the first item
    ${first_item_price}  Get the price
    go back

    Select the fifth item
    ${fifth_item_price}  Get the price
    go back

    Select the ninth item
    ${ninth_item_price}  Get the price

    should be true  ${fifth_item_price} <= ${first_item_price}
    should be true  ${ninth_item_price} <= ${fifth_item_price}

Sorting Price as Increasing
    [Documentation]  In this test, a group of items will be sorted in increasing price
    ...              and tested if the sorting is correct or not

    # Initialization
    Allow Cookies for Amazon
    Search from search bar to  toy

    Select between 200 and 500 price filter
    Sort in Increasing Price

    Select the first item
    ${first_item_price}  Get the price
    go back

    Select the fifth item
    ${fifth_item_price}  Get the price
    go back

    Select the ninth item
    ${ninth_item_price}  Get the price

    should be true  ${first_item_price} <= ${fifth_item_price}
    should be true  ${fifth_item_price} <= ${ninth_item_price}

*** Keywords ***
Select the first item
    wait until element is visible  ${first_item}  5 s
    click element  ${first_item}

Select the fifth item
    wait until element is visible  ${fifth_item}  5 s
    click element  ${fifth_item}

Select the ninth item
    wait until element is visible  ${ninth_item}  5 s
    click element  ${ninth_item}

