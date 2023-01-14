*** Settings ***
Library           Selenium2Library
Variables         ../../../Users/Aleksandar/Desktop/New folder/Locators.py

*** Variables ***
${url}            https://demo.guru99.com/test/newtours/
${Browser}        chrome
${User}           tutorial
${password}       tutorial

*** Test Cases ***
TC1
    open
    Enter_Username    ${User}
    Enter_password    ${password}
    Click_signin
    Verify_login

*** Keywords ***
Open
    open browser    ${url}    ${Browser}
    Maximize Browser Window

Enter_Username
    [Arguments]    ${username}
    input text    ${txt_loginUserName}    ${username}

Enter_password
    [Arguments]    ${password}
    input text    ${txt_loginpassword}    ${password}

Click_signin
    click button    ${btn_signIn}

Verify_login
    wait until page contains    Login Successfully
