*** Settings ***
Resource    ../Automation/rsc/keywords.robot
Library    SeleniumLibrary
Library    DateTime
Library    RequestsLibrary

*** Test Cases ***
NBP API Should Return Exchange Rates Within A Range Of Up To 93 Days.
    [Template]    Get Some Currency Values From The Last x Days And Expect Status Code 400
    10
    55
    93
    100
    367
    368
    387

#NBP API powinno zwracać kursy walut z przedziału składającego się z maksymalnie 93 dni. Natomiast test
#dowodzi, że jest to 367 dni.

Check That The Api Return The Same Value Such As A Table From Website
    ${api_value}=    Get Last Currency Value From Api
    ${website_value}=    Get Last Currency Value From The Website
    should be equal as numbers    ${api_value}    ${website_value}


