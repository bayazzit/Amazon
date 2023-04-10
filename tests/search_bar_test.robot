*** Settings ***
Documentation  Login Test
Library  SeleniumLibrary
Suite Setup  Open chrome to login page
Suite Teardown  End session and close browser
Resource  ../PO/generic.robot
Resource  ../PO/login_page_mail.robot
Resource  ../PO/login_page_password.robot
Resource  ../PO/main_page.robot

*** Test Cases ***
Search a Keyword in Search Bar
    Login with test account
    Search from search bar to  book