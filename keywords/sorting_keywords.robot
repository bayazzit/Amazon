*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${sort_menu}  css:.a-dropdown-prompt
${sort_price_increasing}  s-result-sort-select_1
${sort_price_decreasing}  s-result-sort-select_2

*** Keywords ***
Sort in Decreasing Price
    wait until page contains element  ${sort_menu}  5 s
    click element  ${sort_menu}
    wait until element is visible  ${sort_price_decreasing}  5 s
    click element  ${sort_price_decreasing}

Sort in Increasing Price
    wait until page contains element  ${sort_menu}  5 s
    click element  ${sort_menu}
    wait until element is visible  ${sort_price_increasing}  5 s
    click element  ${sort_price_increasing}