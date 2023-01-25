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

TC_1_With_U_P
    Go to home page
    Maximize Browser Window
    Sleep    2
    Login

TC_2_WIthout_U
    Go to home page
    input text    name:password    admin123
    click element    xpath://html/body/div/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button

TC_3_Without_P
    Go to home page
    input text    name:username    Admin
    click element    xpath://html/body/div/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button

TC_4_Without_P_U
    Go to home page
    click element    xpath://html/body/div/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button

TC_4_Admin_Menue
    Go to home page
    Login
    sleep    2
    click element    xpath://html/body/div/div[1]/div[1]/aside/nav/div[2]/ul/li[1]/a/span

TC_5_Menue
    Go to home page
    Set Selenium Speed    2
    login
    click element    xpath://html/body/div/div[1]/div[1]/aside/nav/div[2]/ul/li[1]/a/span
    click element    xpath://html/body/div/div[1]/div[1]/aside/nav/div[2]/ul/li[2]/a/span
    click element    xpath://html/body/div/div[1]/div[1]/aside/nav/div[2]/ul/li[3]/a/span

TC_6_AdminClick
    Go to home page
    Login
    sleep    2
    click element    xpath://html/body/div/div[1]/div[1]/aside/nav/div[2]/ul/li[1]/a/span
    sleep    2
    click element    xpath://html/body/div/div[1]/div[2]/div[2]/div/div[1]/div[2]/form/div[1]/div/div[2]/div/div[2]/div/div
    sleep    2
    Select From List By Label    role:listbox    Admin
    sleep    2
    Close Browser

TC_7_DropDown
    Open browser    http://localhost/st/robot.html    chrome
    Maximize Browser Window
    Set Selenium Speed    2
    Select From List By Value    id:city    bitola
    Select From List By Label    name:months    April
    Select From List By Index    name:days    10
    Select From List By Value    name:year    10

TC_8_Pinterest
    Open browser    https://www.pinterest.com/    chrome
    Maximize Browser Window
    Set Selenium Speed    3
    click element    xpath://html/body/div[1]/div/div[1]/div/div/div/div/div/div/div[1]/div/div/div[1]/div/div[2]/div[3]/button/div/div
    wait until page contains    Welcome to Pinterest
    input text    id:email    aleksandar_presilskiz@yahoo.com
    input text    id:password    aleksandar
    input text    id:age-input    32
    click element    xpath://html/body/div[1]/div/div[1]/div/div[2]/div/div/div/div/div[1]/div[5]/div/div[1]/form/div[8]/button/div
    sleep    10
    click element    xpath://body/div[3]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]/button[1]/div[1]
    Select Radio Button    genderOptions    female
    sleep    10
    Select From List By Value    name:locale    en-GB
    Select From List By Value    name:country    AL
    click element    xpath://html/body/div[3]/div/div/div/div[2]/div/div/div/div[3]/div/div[2]/button
    wait until page contains    Tell us what you're interested in
    click element    xpath://html/body/div[3]/div/div/div/div[2]/div/div/div/div[3]/div/div[3]/div/div[1]/div/div/div/div/div/div/div/div[1]/div/div
    click element    xpath://html/body/div[3]/div/div/div/div[2]/div/div/div/div[3]/div/div[3]/div/div[2]/div/div/div/div/div/div/div/div[2]/div[1]
    click element    xpath://html/body/div[3]/div/div/div/div[2]/div/div/div/div[3]/div/div[3]/div/div[3]/div/div/div/div/div/div/div/div[2]/div[1]
    click element    xpath://html/body/div[3]/div/div/div/div[2]/div/div/div/div[3]/div/div[3]/div/div[4]/div/div/div/div/div/div/div/div[2]/div[1]
    click element    xpath://html/body/div[3]/div/div/div/div[2]/div/div/div/div[3]/div/div[3]/div/div[5]/div/div/div/div/div/div/div/div[2]/div[1]
    click element    xpath://html/body/div[3]/div/div/div/div[2]/div/div/div/div[3]/div/div[4]/div[2]/button
    wait until page contains    Get Pinterest on your phone
    click element    xpath://html/body/div[3]/div/div/div/div[2]/div/div/div/div[3]/div/div[2]/button/div
    Close Browser

TC9_Facebook
    open browser    https://www.facebook.com/    chrome
    Maximize Browser Window
    sleep    5
    Set Selenium Speed    1
    click element    xpath://html/body/div[1]/div[1]/div[1]/div/div/div/div[2]/div/div[1]/form/div[5]/a
    sleep    2
    click element    xpath://html/body/div[3]/div[2]/div/div/div[2]/div/div/div[1]/form/div[1]/div[1]/div[1]/div[1]/div/input
    sleep    2
    input text    xpath://html/body/div[3]/div[2]/div/div/div[2]/div/div/div[1]/form/div[1]/div[1]/div[1]/div[1]/div/input    Aleksandarr
    sleep    2
    input text    id:password    Presilskii
    inout text    name:reg_email__    aleksandar@yahoo.com
    input text    id:password_step_input    javenadvertajzing
    Select From List By Value    id:month    4
    Select From List By Value    id:day    11
    Select From List By Value    id:year    1979
    Select Radio Button    name:sex    1
    click element    name:websubmit

*** Keywords ***
Login
    input text    name:username    Admin
    input text    name:password    admin123
    click element    xpath://html/body/div/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button

Go to home page
    open browser    ${url}    chrome
    Maximize Browser Window
    sleep    2
