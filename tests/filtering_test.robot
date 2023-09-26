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
${top_item}  (//a[@class='a-link-normal s-underline-text s-underline-link-text s-link-style a-text-normal'])[1]

*** Test Cases ***
Filter Test for Price
    [Documentation]  The aim of this test is to check if price filteration is working.

    # Initialization
    Allow Cookies for Amazon
    Search from search bar to  book

    # Price at most 20
    Select at most 20 price filter
    Sort in Decreasing Price
    Select the top item
    Price should be less than  20
    Go back
    Unselect at most 20 price filter

    # Price between 100-200
    Select between 100 and 200 price filter
    Select the top item
    Price should be less than  200
    Go back
    Sort in Increasing Price
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
    Sort in Increasing Price
    Select the top item
    Price should be more than  27
    Go back
    Sort in Decreasing Price
    select the top item
    price should be less than  712

*** Keywords ***
Select the top item
    wait until keyword succeeds  15 s  3 s  click element  ${top_item}