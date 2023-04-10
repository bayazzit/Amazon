*** Settings ***
Documentation  Invalid Login Test
Library  SeleniumLibrary
Library  DataDriver  file=resources/invalid_login_data.csv  encoding=utf_8  #dailect=unix
Test Setup  Open chrome to login page
Test Teardown  End session and close browser
Resource  ../PO/generic.robot
Resource  ../PO/login_page_mail.robot
Resource  ../PO/login_page_password.robot
#Test Template  Invalid Login
#*** Variables ***
#${error_box}  auth-error-message-box
#${email_bar}  ap_email
#${password_bar}  ap_password

*** Test Cases ***
My test case
    [Template]  Invalid Login
    ${username}  ${password}=  DataDriver.GetDataRow
    Invalid Login  ${username}  ${password}
#Login with user ${username} and with password ${password}  not found  not found

*** Keywords ***
Invalid Login
    [Arguments]  ${username}  ${password}
    log to console  ${username}
    log to console  ${password}
    #Run Keyword And Ignore Error  Click Element  sp-cc-accept
    #Click element  nav-link-accountList-nav-line-1
    #input text  auth-error-message-box  ${username}
    #click button  continue
    #Wait Until Keyword Succeeds  20s  2s  Page Should Contain Element  auth-error-message-box