*** Settings ***
Documentation  Login Test
Library  SeleniumLibrary
Suite Setup  Open browser of  chrome
Suite Teardown  End session and close browser
Resource  ../PO/generic.robot
Resource  ../PO/login_page_mail.robot
Resource  ../PO/login_page_password.robot
Resource  ../PO/main_page.robot
Resource  ../PO/searched_products_page.robot
Resource  ../PO/product_page.robot

*** Test Cases ***
Add a Product to the Cart
    # Precondition
    Login with test account
    # Actual Test
    Search from search bar to  microsoft arc mouse
    Select the first product
    Check if product title contains  microsoft arc
    Add to cart
    # Postcondition
    Clear Chart

# add verification of the cart
