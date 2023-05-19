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

*** Test Cases ***
Sorting Price as Decreasing
    [Documentation]  In this test, a group of items will be sorted as decreasing
    ...              and tested if the sorting is correct or not

    # Initialization
    Allow Cookies for Amazon
    Search from search bar to  stanley

    Select between 200 and 500 price filter
    Sort as Decreasing Price

Sorting Price as Increasing

*** Keywords ***
Select the first item

Select the second item

Select the third item

