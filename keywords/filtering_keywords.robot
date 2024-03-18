*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${price_filter_at_most_20}  //span[contains(text(),'En Fazla 20 TL')]
${price_filter_at_most_20_checkbox}  //li[@id='p_36/13758218031']//i[@class='a-icon a-icon-checkbox']
${price_filter_between_20_100}  //span[contains(text(),'20 – 100 TL')]
${price_filter_between_20_100_checkbox}  //li[@id='p_36/13758219031']//i[@class='a-icon a-icon-checkbox']
${price_filter_between_100_200}  //span[contains(text(),'100 – 200 TL')]
${price_filter_between_100_200_checkbox}  //li[@id='p_36/13758220031']//i[@class='a-icon a-icon-checkbox']
${price_filter_between_200_500}  //span[contains(text(),'200 – 500 TL')]
${price_filter_between_200_500_checkbox}  //li[@id='p_36/13758221031']//i[@class='a-icon a-icon-checkbox']
${price_filter_at_least_500}  //span[contains(text(),'500 TL ve Üzeri')]
${price_filter_at_least_500_checkbox}  //li[@id='p_36/13758222031']//i[@class='a-icon a-icon-checkbox']
${filter_low_price}  low-price
${filter_high_price}  high-price
${go_for_price_filter}  //input[@class='a-button-input']

*** Keywords ***
Select at most 20 price filter
    [Documentation]  This keyword is specified especially for book search
    ...              So, it may not work for other searches
    wait until element is visible  ${price_filter_at_most_20}  5 s
    click element  ${price_filter_at_most_20}
    #wait until keyword succeeds  15 s  3 s  checkbox should be selected  ${price_filter_at_most_20_checkbox}

Unselect at most 20 price filter
    [Documentation]  This keyword is specified especially for book search
    ...              So, it may not work for other searches
    wait until element is visible  ${price_filter_at_most_20}  5 s
    click element  ${price_filter_at_most_20}
    #wait until keyword succeeds  15 s  3 s  checkbox should not be selected  ${price_filter_at_most_20_checkbox}

Select between 20 and 100 price filter
    [Documentation]  This keyword is specified especially for book search
    ...              So, it may not work for other searches
    wait until element is visible  ${price_filter_between_20_100}  5 s
    click element  ${price_filter_between_20_100}
    #wait until keyword succeeds  15 s  3 s  checkbox should be selected  ${price_filter_between_20_100_checkbox}

Unselect between 20 and 100 price filter
    [Documentation]  This keyword is specified especially for book search
    ...              So, it may not work for other searches
    wait until element is visible  ${price_filter_between_20_100}  5 s
    click element  ${price_filter_between_20_100}
    #wait until keyword succeeds  15 s  3 s  checkbox should not be selected  ${price_filter_between_20_100_checkbox}

Select between 100 and 200 price filter
    [Documentation]  This keyword is specified especially for book search
    ...              So, it may not work for other searches
    wait until element is visible  ${price_filter_between_100_200}  5 s
    click element  ${price_filter_between_100_200}
    #wait until keyword succeeds  15 s  3 s  checkbox should be selected  ${price_filter_between_100_200_checkbox}

Unselect between 100 and 200 price filter
    [Documentation]  This keyword is specified especially for book search
    ...              So, it may not work for other searches
    wait until element is visible  ${price_filter_between_100_200}  5 s
    click element  ${price_filter_between_100_200}
    #wait until keyword succeeds  15 s  3 s  checkbox should not be selected  ${price_filter_between_100_200_checkbox}

Select between 200 and 500 price filter
    [Documentation]  This keyword is specified especially for stanley search
    ...              So, it may not work for other searches
    wait until page contains element  ${price_filter_between_200_500}  5 s
    click element  ${price_filter_between_200_500}
    #wait until keyword succeeds  15 s  3 s  checkbox should be selected  ${price_filter_between_200_500_checkbox}

Unselect between 200 and 500 price filter
    [Documentation]  This keyword is specified especially for stanley search
    ...              So, it may not work for other searches
    wait until element is visible  ${price_filter_between_200_500}  5 s
    click element  ${price_filter_between_200_500}
    #wait until keyword succeeds  15 s  3 s  checkbox should not be selected  ${price_filter_between_200_500_checkbox}

Select at least 500 price filter
    [Documentation]  This keyword is specified especially for book search
    ...              So, it may not work for other searches
    wait until element is visible  ${price_filter_at_least_500}  5 s
    click element  ${price_filter_at_least_500}
    #wait until keyword succeeds  15 s  3 s  checkbox should be selected  ${price_filter_at_least_500_checkbox}

Unselect at least 500 price filter
    [Documentation]  This keyword is specified especially for book search
    ...              So, it may not work for other searches
    wait until element is visible  ${price_filter_at_least_500}  5 s
    click element  ${price_filter_at_least_500}
    #wait until keyword succeeds  15 s  3 s  checkbox should not be selected  ${price_filter_at_least_500_checkbox}

Filter minimum price at
    [Arguments]  ${value}
    wait until element is visible  ${filter_low_price}
    input text  ${filter_low_price}  ${value}

Filter maximum price at
    [Arguments]  ${value}
    wait until element is visible  ${filter_high_price}
    input text  ${filter_high_price}  ${value}

Apply price filter
    wait until element is visible  ${go_for_price_filter}  20 s
    click element  ${go_for_price_filter}