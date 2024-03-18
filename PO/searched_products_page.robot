*** Settings ***
Documentation    PO of the login page
Library          SeleniumLibrary
Resource         generic.robot

*** Variables ***
${first_product}  xpath:(//span[contains(@class,'a-size-base-plus')])[1]

*** Keywords ***
Select the first product
    Wait Until Element Is Visible  ${first_product}
    Click Element  ${first_product}