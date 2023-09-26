*** Settings ***
Documentation    PO of the login page
Library          SeleniumLibrary
Resource         generic.robot

*** Variables ***
${product_title}  productTitle
${add_cart_button}  add-to-cart-button

*** Keywords ***
Check if product title contains
    [Arguments]  ${title}
    ${product_title_text}  Get Text  ${product_title}
    Should Contain  ${product_title_text}  ${title}  ignore_case=True

Add to cart
    Click Button  ${add_cart_button}