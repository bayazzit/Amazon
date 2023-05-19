*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${price_filter_at_most_20}  (//i[@class='a-icon a-icon-checkbox'])[4]
${price_filter_at_most_20_checkbox}  (//input[@type='checkbox'])[4]
${price_filter_between_100_200}  (//i[@class='a-icon a-icon-checkbox'])[6]
${price_filter_between_100_200_checkbox}  (//input[@type='checkbox'])[6]
${price_filter_at_least_500}  (//i[@class='a-icon a-icon-checkbox'])[8]
${price_filter_at_least_500_checkbox}  (//input[@type='checkbox'])[8]
${filter_low_price}  low-price
${filter_high_price}  high-price
${go_for_price_filter}  a-autoid-1

*** Keywords ***
Select at most 20 price filter
    wait until element is visible  ${price_filter_at_most_20}  5 s
    click element  ${price_filter_at_most_20}
    wait until keyword succeeds  15 s  3 s  checkbox should be selected  ${price_filter_at_most_20_checkbox}

Unselect at most 20 price filter
    wait until element is visible  ${price_filter_at_most_20}  5 s
    click element  ${price_filter_at_most_20}
    wait until keyword succeeds  15 s  3 s  checkbox should not be selected  ${price_filter_at_most_20_checkbox}

Select between 100 and 200 price filter
    wait until element is visible  ${price_filter_between_100_200}  5 s
    click element  ${price_filter_between_100_200}
    wait until keyword succeeds  15 s  3 s  checkbox should be selected  ${price_filter_between_100_200_checkbox}

Unselect between 100 and 200 price filter
    wait until element is visible  ${price_filter_between_100_200}  5 s
    click element  ${price_filter_between_100_200}
    wait until keyword succeeds  15 s  3 s  checkbox should not be selected  ${price_filter_between_100_200_checkbox}

Select at least 500 price filter
    wait until element is visible  ${price_filter_at_least_500}  5 s
    click element  ${price_filter_at_least_500}
    wait until keyword succeeds  15 s  3 s  checkbox should be selected  ${price_filter_at_least_500_checkbox}

Unselect at least 500 price filter
    wait until element is visible  ${price_filter_at_least_500}  5 s
    click element  ${price_filter_at_least_500}
    wait until keyword succeeds  15 s  3 s  checkbox should not be selected  ${price_filter_at_least_500_checkbox}

Filter minimum price at
    [Arguments]  ${value}
    input text  ${filter_low_price}  ${value}

Filter maximum price at
    [Arguments]  ${value}
    input text  ${filter_low_price}  ${value}

Apply price filter
    wait until keyword succeeds  15 s  3 s  click element  ${go_for_price_filter}