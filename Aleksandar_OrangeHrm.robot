*** Settings ***
Suite Setup
Suite Teardown
Library           ExtendedSelenium2Library

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

TC_8_ForgotPass
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Wait Until Page Contains    Login
    Click Element    xpath=//body/div[@id='app']/div[1]/div[1]/div[1]/div[1]/div[2]/div[2]/form[1]/div[4]/p[1]
    Wait Until Page Contains    Reset Password
    Input Text    name=username    Admin
    Click element    xpath=//body/div[@id='app']/div[1]/div[1]/div[1]/form[1]/div[2]/button[2]
    Wait Until Page Contains    Reset Password link sent successfully
    ${att}    Get Text    xpath=//html/body/div/div[1]/div[1]/div/h6
    Should Be Equal    Reset Password link sent successfully    ${att}
    Log To Console    ${att}
    Close Browser

TC_9_ForgotPass_cancel
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Wait Until Page Contains    Login
    Click Element    xpath=//body/div[@id='app']/div[1]/div[1]/div[1]/div[1]/div[2]/div[2]/form[1]/div[4]/p[1]
    Wait Until Page Contains    Reset Password
    Input Text    name=username    Admin
    Click Element    xpath=//body/div[@id='app']/div[1]/div[1]/div[1]/form[1]/div[2]/button[1]
    Wait Until Page Contains    Login
    ${att}    Get Title
    Should Be Equal    OrangeHRM    ${att}
    Log To Console    ${att}
    Close Browser

TC_11_Search_Admin
    Go to home page
    Login
    Wait Until Page Contains    Dashboard
    Input Text    xpath=//body/div[@id='app']/div[1]/div[1]/aside[1]/nav[1]/div[2]/div[1]/div[1]/input[1]    Admin
    Click Link    /web/index.php/admin/viewAdminModule
    Wait Until Page Contains    Admin
    ${att}    Get text    xpath=//header/div[1]/div[1]/span[1]/h6[1]
    Should Be Equal    Admin    ${att}
    Close Browser

TC_12_Search_PIM
    Go to home page
    Login
    Wait Until Page Contains    Dashboard
    Input Text    xpath=//body/div[@id='app']/div[1]/div[1]/aside[1]/nav[1]/div[2]/div[1]/div[1]/input[1]    PIM
    Click Link    /web/index.php/pim/viewPimModule
    Wait Until Page Contains    PIM
    ${att}    Get text    xpath=//header/div[1]/div[1]/span[1]/h6[1]
    Should Be Equal    PIM    ${att}
    Close Browser

TC_13_Search_Leave
    Go to home page
    Login
    Wait Until Page Contains    Dashboard
    Input Text    xpath=//body/div[@id='app']/div[1]/div[1]/aside[1]/nav[1]/div[2]/div[1]/div[1]/input[1]    Leave
    Click Link    /web/index.php/leave/viewLeaveModule
    Wait Until Page Contains    Leave
    ${att}    Get text    xpath=//header/div[1]/div[1]/span[1]/h6[1]
    Should Be Equal    Leave    ${att}
    Close Browser

TC_14_Search_TIme
    Go to home page
    login
    Wait Until Page Contains    Dashboard
    Input Text    xpath=//body/div[@id='app']/div[1]/div[1]/aside[1]/nav[1]/div[2]/div[1]/div[1]/input[1]    Time
    click link    /web/index.php/time/viewTimeModule
    Wait Until Page Contains    Time
    ${att}    get text    xpath=//header/div[1]/div[1]/span[1]/h6[1]
    Should Be Equal    Time    ${att}
    Close Browser

TC_15_Search_Recruitment
    Go to home page
    Login
    Wait Until Page Contains    Dashboard
    Input Text    xpath=//body/div[@id='app']/div[1]/div[1]/aside[1]/nav[1]/div[2]/div[1]/div[1]/input[1]    Recruitment
    Click Link    /web/index.php/recruitment/viewRecruitmentModule
    Wait Until Page Contains    Recruitment
    ${att}    Get text    xpath=//header/div[1]/div[1]/span[1]/h6[1]
    Should Be Equal    Recruitment    ${att}
    Close Browser

TC_16_Search_MyInfo
    Go to home page
    Login
    Wait Until Page Contains    Dashboard
    Input Text    xpath=//body/div[@id='app']/div[1]/div[1]/aside[1]/nav[1]/div[2]/div[1]/div[1]/input[1]    My info
    Click Link    /web/index.php/pim/viewMyDetails
    Wait Until Page Contains    PIM
    ${att}    Get text    xpath=//header/div[1]/div[1]/span[1]/h6[1]
    Should Be Equal    PIM    ${att}
    Close Browser

TC_17_Search_Performance
    Go to home page
    Login
    Wait Until Page Contains    Dashboard
    Input Text    xpath=//body/div[@id='app']/div[1]/div[1]/aside[1]/nav[1]/div[2]/div[1]/div[1]/input[1]    Performance
    Click Link    /web/index.php/performance/viewPerformanceModule
    Wait Until Page Contains    Performance
    ${att}    Get text    xpath=//header/div[1]/div[1]/span[1]/h6[1]
    Should Be Equal    Performance    ${att}
    Close Browser

TC_18_Search_Dashboard
    Go to home page
    Login
    Wait Until Page Contains    Dashboard
    Input Text    xpath=//body/div[@id='app']/div[1]/div[1]/aside[1]/nav[1]/div[2]/div[1]/div[1]/input[1]    Dashboard
    Click Link    /web/index.php/dashboard/index
    Wait Until Page Contains    Dashboard
    ${att}    Get text    xpath=//header/div[1]/div[1]/span[1]/h6[1]
    Should Be Equal    Dashboard    ${att}
    Close Browser

TC_19_Search_Directory
    Go to home page
    Login
    Wait Until Page Contains    Dashboard
    Input Text    xpath=//body/div[@id='app']/div[1]/div[1]/aside[1]/nav[1]/div[2]/div[1]/div[1]/input[1]    Directory
    Click Link    /web/index.php/directory/viewDirectory
    Wait Until Page Contains    Directory
    ${att}    Get text    xpath=//header/div[1]/div[1]/span[1]/h6[1]
    Should Be Equal    Directory    ${att}
    Close Browser

TC_20_Search_buzz
    Go to home page
    Login
    Wait Until Page Contains    Dashboard
    Input Text    xpath=//body/div[@id='app']/div[1]/div[1]/aside[1]/nav[1]/div[2]/div[1]/div[1]/input[1]    Buzz
    Click Link    /web/index.php/buzz/viewBuzz
    Wait Until Page Contains    Buzz
    ${att}    Get text    xpath=//header/div[1]/div[1]/span[1]/h6[1]
    Should Be Equal    Buzz    ${att}
    Close Browser

TC_21_Search_maintenance
    Go to home page
    Login
    Wait Until Page Contains    Dashboard
    click link    /web/index.php/maintenance/viewMaintenanceModule
    Wait Until Page Contains    Administrator Access
    Input Password    name=password    admin123
    click element    xpath=//body/div[@id='app']/div[1]/div[1]/form[1]/div[4]/button[2]
    Wait Until Page Contains    Maintenance
    ${att}    get text    //header/div[1]/div[1]/span[1]/h6[1]
    Should Be Equal    Maintenance    ${att}
    Close Browser

TC_22_AdminM_WrongUN
    Go to home page
    Login
    wait until page contains    Dashboard
    click element    xpath=//html/body/div/div[1]/div[1]/aside/nav/div[2]/ul/li[1]/a/span
    wait until page contains    Admin
    ${att}    get text    xpath=//header/div[1]/div[1]/span[1]/h6[1]
    Should Be Equal    Admin    ${att}
    input text    xpath=//body/div[@id='app']/div[1]/div[2]/div[2]/div[1]/div[1]/div[2]/form[1]/div[1]/div[1]/div[1]/div[1]/div[2]/input[1]    Aleksandar
    click element    xpath=//body/div[@id='app']/div[1]/div[2]/div[2]/div[1]/div[1]/div[2]/form[1]/div[2]/button[2]
    Wait Until Page Contains    No Records Found
    ${att}    get text    xpath=//body/div[@id='app']/div[1]/div[2]/div[2]/div[1]/div[2]/div[2]/div[1]/span[1]
    Should Be Equal    No Records Found    ${att}
    Close Browser

TC_23_AdminM_CorUN
    Go to home page
    Login
    wait until page contains    Dashboard
    click element    xpath=//html/body/div/div[1]/div[1]/aside/nav/div[2]/ul/li[1]/a/span
    wait until page contains    Admin
    ${att}    get text    xpath=//header/div[1]/div[1]/span[1]/h6[1]
    Should Be Equal    Admin    ${att}
    input text    xpath=//body/div[@id='app']/div[1]/div[2]/div[2]/div[1]/div[1]/div[2]/form[1]/div[1]/div[1]/div[1]/div[1]/div[2]/input[1]    David.Morris
    click element    xpath=//body/div[@id='app']/div[1]/div[2]/div[2]/div[1]/div[1]/div[2]/form[1]/div[2]/button[2]
    Wait Until Page Contains    (1) Record Found
    ${att}    get text    xpath=//html/body/div/div[1]/div[2]/div[2]/div/div[2]/div[2]/div/span
    Should Be Equal    (1) Record Found    ${att}
    ${data}    get text    xpath=//html/body/div/div[1]/div[2]/div[2]/div/div[2]/div[3]/div/div[2]/div/div/div[2]/div
    Should Be Equal    David.Morris    ${data}
    Log To Console    ${data}
    Close Browser

TC_23_AdminM_CorEn
    Go to home page
    Login
    wait until page contains    Dashboard
    click element    xpath=//html/body/div/div[1]/div[1]/aside/nav/div[2]/ul/li[1]/a/span
    wait until page contains    Admin
    ${att}    get text    xpath=//header/div[1]/div[1]/span[1]/h6[1]
    Should Be Equal    Admin    ${att}
    input text    xpath=//body/div[@id='app']/div[1]/div[2]/div[2]/div[1]/div[1]/div[2]/form[1]/div[1]/div[1]/div[3]/div[1]/div[2]/div[1]/div[1]/input[1]    Cassidy \ Hope
    click element    xpath=//body/div[@id='app']/div[1]/div[2]/div[2]/div[1]/div[1]/div[2]/form[1]/div[2]/button[2]
    Wait Until Page Contains    (1) Record Found
    ${att}    get text    xpath=//html/body/div/div[1]/div[2]/div[2]/div/div[2]/div[2]/div/span
    Should Be Equal    (1) Record Found    ${att}
    ${data}    get text    xpath=//div[contains(text(),'Alice Duval')]
    Should Be Equal    Cassidy \ Hope    ${data}
    Log To Console    ${data}
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
