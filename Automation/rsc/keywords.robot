*** Settings ***
Library    RequestsLibrary
Library    DateTime
Library    nbpscrp2.py
*** Keywords ***
Get Some Currency Values From The Last x Days And Expect Status Code 400
    [Arguments]    ${x}
    ${today}=    Get Current Date    result_format=%Y-%m-%d
    ${date_before_x_days}=    subtract time from date    ${today}    ${x} days    result_format=%Y-%m-%d
    GET    http://api.nbp.pl/api/exchangerates/rates/c/usd/${date_before_x_days}/${today}/   expected_status=400

Get Last Currency Value From Api
    ${api_value}=    GET    http://api.nbp.pl/api/exchangerates/rates/a/EUR
    [Return]    ${api_value.json()["rates"][0]["mid"]}

Get Last Currency Value From The Website
    ${response}=    GET    url=https://www.nbp.pl/home.aspx?f=/kursy/kursya.html
    ${website_value}=    Find Euro Currency    ${response}
    [Return]    ${website_value}



