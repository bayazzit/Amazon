*** Settings ***
Documentation    PO of the login page
Library          SeleniumLibrary
Resource         generic.robot

*** Variables ***
${password_bar}  ap_password

*** Keywords ***
Enter password and sign in
    [Arguments]  ${password}
    input text  ${password_bar}  ${password}
    click button  signInSubmit
