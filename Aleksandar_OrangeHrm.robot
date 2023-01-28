*** Settings ***
Suite Setup
Suite Teardown
Library           Selenium2Library

*** Variables ***
${url}            https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
@{Credentials}    Admin    admin123
&{Login}          username=Admin    password=admin123
${browser}        chrome

*** Test Cases ***
Open_Test
    [Tags]    1
    open browser    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login    chrome
    Maximize Browser Window
    sleep    6
    Input Text    xpath=//html/body/div/div[1]/div/div[1]/div/div[2]/div[2]/form/div[1]/div/div[2]/input    Admin

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

LoginKEY
    [Tags]    6
    [Setup]    Go to home page
    sleep    5
    login
    [Teardown]    Close Browser

TC_1_With_U_P
    Go to home page
    Maximize Browser Window
    Login
    wait until page contains    Dashboard
    ${att}    Get Text    xpath=//html[1]/body[1]/div[1]/div[1]/div[1]/header[1]/div[1]/div[1]/span[1]/h6[1]
    Should Be Equal    Dashboard    ${att}
    Close Browser

TC_2_WIthout_U
    Go to home page
    input text    name:password    admin123
    click element    xpath=//html/body/div/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button
    ${att}    get text    xpath=//span[@class='oxd-text oxd-text--span oxd-input-field-error-message oxd-input-group__message']
    log    ${att}
    Should Be Equal    Required    ${att}
    Close Browser

TC_3_Without_P
    Go to home page
    wait until page contains    Login
    input text    name=username    Admin
    click element    xpath=//html/body/div/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button
    ${att}    get text    xpath=//body/div[@id='app']/div[1]/div[1]/div[1]/div[1]/div[2]/div[2]/form[1]/div[2]/div[1]/span[1]
    log    ${att}
    Should Be Equal    Required    ${att}
    Close Browser

TC_4_Without_P_U
    Go to home page
    click element    xpath=//html/body/div/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button
    ${att}    Get Text    xpath=//body/div[@id='app']/div[1]/div[1]/div[1]/div[1]/div[2]/div[2]/form[1]/div[1]/div[1]/span[1]
    ${att}    get text    xpath=//body/div[@id='app']/div[1]/div[1]/div[1]/div[1]/div[2]/div[2]/form[1]/div[2]/div[1]/span[1]
    Should Be Equal    Required    ${att}
    Close Browser

TC_4_Admin_Menue
    Go to home page
    Login
    wait until page contains    Dashboard
    click element    xpath=//html/body/div/div[1]/div[1]/aside/nav/div[2]/ul/li[1]/a/span
    wait until page contains    Admin
    ${att}    get text    xpath=//header/div[1]/div[1]/span[1]/h6[1]
    Should Be Equal    Admin    ${att}
    Close Browser

TC_5_Menue
    Go to home page
    login
    wait until page contains    Dashboard
    click element    xpath=//html/body/div/div[1]/div[1]/aside/nav/div[2]/ul/li[1]/a/span
    wait until page contains    Admin
    ${att}    get text    xpath=//header/div[1]/div[1]/span[1]/h6[1]
    Should Be Equal    Admin    ${att}
    click element    xpath=//html/body/div/div[1]/div[1]/aside/nav/div[2]/ul/li[2]/a/span
    wait until page contains    PIM
    ${att}    get text    xpath=//header/div[1]/div[1]/span[1]/h6[1]
    Should Be Equal    PIM    ${att}
    click element    xpath=//html/body/div/div[1]/div[1]/aside/nav/div[2]/ul/li[3]/a/span
    wait until page contains    Leave
    ${att}    get text    xpath=//header/div[1]/div[1]/span[1]/h6[1]
    Should Be Equal    Leave    ${att}
    Close Browser

TC_6_AdminClick
    Go to home page
    wait until page contains    Login
    Login
    wait until page contains    Dashboard
    click element    xpath=//html/body/div/div[1]/div[1]/aside/nav/div[2]/ul/li[1]/a/span
    wait until page contains    Admin
    click element    xpath=//html/body/div/div[1]/div[2]/div[2]/div/div[1]/div[2]/form/div[1]/div/div[2]/div/div[2]/div/div
    sleep    2
    Select From List By Value    xpath=//html/body/div/div[1]/div[2]/div[2]/div/div[1]/div[2]/form/div[1]/div/div[2]/div/div[2]/div/div/div[1]    Admin
    sleep    2
    click element    xpath=//body/div[@id='app']/div[1]/div[2]/div[2]/div[1]/div[1]/div[2]/form[1]/div[2]/button[2]

TC_7_Logout
    Open browser    ${url}    ${browser}
    Maximize Browser Window
    wait until page contains    Login
    Login
    wait until page contains    Dashboard
    ${att}    Get Text    xpath=//header/div[1]/div[1]/span[1]/h6[1]
    Should Be Equal    Dashboard    ${att}
    click element    xpath=//header/div[1]/div[2]/ul[1]/li[1]/span[1]
    Element should be visible    xpath=//header/div[1]/div[2]/ul[1]/li[1]/span[1]
    click link    /web/index.php/auth/logout
    ${att}    Get Title
    Should Be Equal    OrangeHRM    ${att}
    Close Browser

*** Keywords ***
Login
    input text    name=username    Admin
    input text    name=password    admin123
    click element    xpath=//html/body/div/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button

Go to home page
    open browser    ${url}    ${browser}
    Maximize Browser Window
    Wait Until Page Contains    Login
