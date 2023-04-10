*** Settings ***
Documentation    PO of the main page which is opened by default
Library          SeleniumLibrary
Resource         generic.robot

*** Variables ***
${login_page_director}  id:nav-link-accountList-nav-line-1

*** Keywords ***
Go to login page
    click button  ${login_page_director}