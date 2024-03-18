*** Settings ***
Documentation    PO of the login page
Library          SeleniumLibrary
Resource         generic.robot

*** Variables ***
${email_bar}  ap_email

*** Keywords ***
Enter mail address and continue
    [Arguments]  ${username}
    Run Keyword And Ignore Error  Click Element  sp-cc-accept
    Click element  ${accounts_and_lists_tab}
    input text  ${email_bar}  ${username}
    click button  continue