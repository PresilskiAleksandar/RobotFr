*** Settings ***
Suite Setup
Suite Teardown
Library           Selenium2Library

*** Variables ***
${url}            https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
@{Credentials}    Admin    admin123
&{Login}          username=Admin    password=admin123

*** Test Cases ***
Open_Test
    [Tags]    1
    open browser    https://robotframework.org/    chrome
    Close Browser

Login_Test
    [Tags]    2
    open browser    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login    chrome
    input text    name=username    Admin
    input text    name=password    admin123
    click element    xpath=//html/body/div/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button
    close browser

Log_Test_Cre
    [Tags]    3
    Open browser    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login    chrome
    sleep    2
    input text    name=username    @{credentials}
    sleep    2
    input text    name=pasword    &{Login}[password]
    sleep    2
    click element    xpath=//html/body/div/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button
    Close Browser

Log_test_Var
    [Tags]    4
    open browser    ${url}    chrome
    sleep    2
    input text    name=username    Admin
    sleep    2
    input text    name=password    admin123
    sleep    2
    click element    xpath=//html/body/div/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button
    sleep    2
    Close Browser

Log_Credentials
    [Tags]    5
    open browser    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login    chrome
    sleep    2
    input text    name=username    @{credentials}
    sleep    2
    input text    name=password    @{credentials}
    sleep    2
    click button    xpath=//html/body/div/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button
    Sleep    2
    Close Browser
    Log To Console    Aleksandar run this test for Windows OS

LoginKEY
    [Tags]    6
    [Setup]    Go to home page
    sleep    2
    login
    sleep    2
    [Teardown]    Close Browser

*** Keywords ***
Login
    input text    name=username    Admin
    input text    name=password    admin123
    click element    xpath=/html/body/div/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button

Go to home page
    open browser    ${url}    chrome
