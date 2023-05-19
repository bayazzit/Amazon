*** Settings ***
Library  SeleniumLibrary
Resource  ../PO/login_page_mail.robot
Resource  ../PO/login_page_password.robot

*** Variables ***
${login_url}                 https://www.amazon.com.tr/
${valid_username}            bahadirbayazit.test@gmail.com
${valid_password}            amazon.test
${home_button}               nav-logo-sprites
${accounts_and_lists_tab}    nav-link-accountList-nav-line-1
${exit_button}               nav-item-signout
${search_bar}                twotabsearchtextbox
${search_button}             nav-search-submit-button
${cart_button}               nav-cart-count-container
${delete_button}             //input[@data-action='delete']

*** Keywords ***
Open browser of
    [Documentation]  Browser can be -> (headless)chrome , (headless)firefox
    [Arguments]  ${browser}
    Open Browser  ${login_url}  ${browser}

End session and close browser
    [Documentation]  Ends the session and closes the browser
    Wait Until Element Is Visible  ${home_button}
    click element  ${home_button}
    Sleep  1
    mouse over  ${accounts_and_lists_tab}
    # exit button'u bulamıyor
    Wait Until Element Is Visible  ${exit_button}
    click element  ${exit_button}
    Close Browser

Wait for the element
    [Arguments]  ${element}
    Wait Until Element Is Visible  ${element}  30

Login with test account
    [Tags]  SMOKE
    Allow Cookies for Amazon
    Enter mail address and continue  ${valid_username}
    Enter password and sign in  ${valid_password}
    
Search from search bar to
    [Documentation]  Search any text -> String from the search bar at any page
    [Arguments]  ${text}
    Wait Until Element Is Visible  ${search_bar}
    Input Text  ${search_bar}  ${text}
    Click Button  ${search_button}
    Sleep  1

Clear Chart
    [Documentation]  This keyword clears all products into the Cart
    Click Element  ${cart_button}
    FOR  ${_}  IN RANGE  100
        ${status}  Run Keyword And Return Status  Click Element  ${delete_button}
        exit for loop if  not ${status}
        Sleep  2
    END

Allow Cookies for Amazon
    Run Keyword And Ignore Error  Click Element  sp-cc-accept