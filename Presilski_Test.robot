*** Settings ***
Library           ExtendedSelenium2Library

*** Variables ***
${url}            https://demo.nopcommerce.com/
${browser}        chrome

*** Test Cases ***
TC1_ElementSHouldBe
    [Tags]    Sel_1
    open browser    ${url}    ${browser}
    Maximize Browser Window
    title should be    nopCommerce demo store
    sleep    2
    click link    xpath=//a[contains(text(),'Log in')]
    ${"email_text"}    Set Variable    id:Email
    Element Should Be Visible    ${"email_text"}
    Element Should Be Enabled    ${"email_text"}
    sleep    2
    input text    ${"email_text"}    aleksandarpresilski@gmail.com
    sleep    2
    Clear Element Text    ${"email_text"}
    sleep    3
    Close Browser

TC2_RadioButton
    [Tags]    Sel_2
    open browser    http://practice.cybertekschool.com/radio_buttons    chrome
    Maximize Browser Window
    Set Selenium Speed    1 second
    Select Radio Button    color    yellow
    sleep    2
    Select Radio Button    sport    hockey
    Close Browser

TC3_CheckBOxes
    [Tags]    Sel_3
    open browser    http://practice.cybertekschool.com/checkboxes    chrome
    Maximize Browser Window
    Set Selenium Speed    1second
    Select Checkbox    checkbox1
    Unselect Checkbox    checkbox2
    Close Browser

TC4_DropDown
    [Tags]    Sel_4
    open browser    https://chercher.tech/practice/practice-dropdowns-selenium-webdriver    chrome
    Maximize Browser Window
    Select From List By Label    id=first    Yahoo
    sleep    2
    Select From List By Index    id=first    2
    sleep    2
    Select From List By Value    id=first    Microsoft
    Sleep    2
    Close Browser

TC5_ListBoxes
    [Tags]    Sel_5
    open browser    https://chercher.tech/practice/practice-dropdowns-selenium-webdriver    chrome
    Maximize Browser Window
    Set Selenium Speed    1second
    Select From List By Index    id=second    2
    Select From List By Label    id=second    Pizza
    Select From List By Value    id=second    bonda
    Unselect From List By Label    id=second    Pizza
    Close Browser

TC6_Reg_test_SelSpeed
    [Tags]    Sel_6
    ${speed}    Get Selenium Speed
    Log To Console    ${speed}
    open browser    https://demowebshop.tricentis.com/register    chrome
    Maximize Browser Window
    Set Selenium Speed    2 seconds
    Select Radio Button    Gender    M
    input text    id=FirstName    Aleksandar
    input text    id=LastName    Presilski
    input text    id=Email    aleksandarpresilski@gmail.com
    input text    id=Password    aleksandar
    input text    id=ConfirmPassword    aleksandar
    click button    id=register-button
    ${speed}    Get Selenium Speed
    Log To Console    ${speed}
    Close Browser

TC7_SelTimeout
    [Tags]    Sel_7
    open browser    https://demowebshop.tricentis.com/register    chrome
    Maximize Browser Window
    Set Selenium Timeout    7 seconds
    wait until page contains    register1
    Select Radio Button    Gender    M
    input text    id=FirstName    Aleksandar
    input text    id=LastName    Presilski
    input text    id=Email    aleksandarpresilski@gmail.com
    input text    id=Password    aleksandar
    input text    id=ConfirmPassword    aleksandar
    click button    id=register-button
    Close Browser

TC8_ImplicitWait
    [Tags]    Sel_8
    open browser    https://demowebshop.tricentis.com/register    chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    5 seconds
    Select Radio Button    Gender    M
    input text    id=FirstName1    Aleksandar
    input text    id=LastName    Presilski
    input text    id=Email    aleksandarpresilski@gmail.com
    input text    id=Password    aleksandar
    input text    id=ConfirmPassword    aleksandar
    click button    id=register-button
    Close Browser

TC9_Alerts_dissmis
    [Tags]    Sel_9
    open browser    https://testautomationpractice.blogspot.com/    chrome
    Maximize Browser Window
    sleep    2
    click element    xpath=//html/body/div[4]/div[2]/div[2]/div[2]/div[2]/div[2]/div[2]/div/div[4]/div[2]/div/aside/div/div[2]/div[1]/button
    sleep    2
    Alert Should Be Present    Press a button!
    sleep    2
    handle alert    dissmis
    Close Browser

TC10_Alerts_accept
    [Tags]    Sel_10
    open browser    https://testautomationpractice.blogspot.com/    chrome
    Maximize Browser Window
    click element    xpath=//html/body/div[4]/div[2]/div[2]/div[2]/div[2]/div[2]/div[2]/div/div[4]/div[2]/div/aside/div/div[2]/div[1]/button
    sleep    2
    handle alert    accept
    Close Browser

TC11_Alerts_Leave
    [Tags]    Sel_11
    open browser    https://testautomationpractice.blogspot.com/    chrome
    Maximize Browser Window
    click element    xpath=//html/body/div[4]/div[2]/div[2]/div[2]/div[2]/div[2]/div[2]/div/div[4]/div[2]/div/aside/div/div[2]/div[1]/button
    sleep    2
    handle alert    leave
    Close Browser

TC12_Frames
    [Tags]    Sel_12
    open browser    https://www.selenium.dev/selenium/docs/api/java/index.html?overview-summary.html    chrome
    Maximize Browser Window
    Set Selenium Speed    1second
    Select Frame    packageListFrame
    click link    org/openqa/selenium/package-frame.html
    Unselect Frame
    Select Frame    packageFrame
    click link    WebDriver.html
    Unselect Frame
    select frame    classFrame
    click link    Help
    Unselect Frame
    Close Browser

TC13_TabbedWindows
    [Tags]    Sel_13
    open browser    https://demo.automationtesting.in/Windows.html    chrome
    Maximize Browser Window
    Set Selenium Speed    1 second
    Click Element    xpath=//html/body/div[1]/div/div/div/div[2]/div[1]/a/button
    select window    title=Selenium
    Click Element    xpath=//html/body/header/nav/div/ul/li[3]/a
    Close All Browsers

TC14_MultipleBrowsers
    [Tags]    Sel_14
    open browser    https://www.google.com/    chrome
    Maximize Browser Window
    Set Selenium Speed    1 second
    open browser    https://www.bing.com/    chrome
    Maximize Browser Window
    Switch Browser    1
    input text    name:q    aleksandar
    Click Element    name:btnK
    Switch Browser    2
    Click link    /images?FORM=Z9LH
    Close All Browsers

TC15_CaptureSreen
    [Tags]    Sel_15
    open browser    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login    chrome
    sleep    2
    Maximize Browser Window
    sleep    2
    input text    xpath=//html/body/div/div[1]/div/div[1]/div/div[2]/div[2]/form/div[1]/div/div[2]/input    Admin
    sleep    2
    input text    xpath=//html/body/div/div[1]/div/div[1]/div/div[2]/div[2]/form/div[2]/div/div[2]/input    admin123
    sleep    2
    capture element screenshot    xpath=//*[@id="app"]/div[1]/div/div[1]/div/div[1]/img    C:/Users/Aleksandar/Desktop/Demo_Project/logo.png
    sleep    2
    capture page screenshot    C:/Users/Aleksandar/Desktop/Demo_Project/CapturePage.png
    Close Browser

TC16_RightClick
    [Tags]    Sel_16
    open browser    https://swisnl.github.io/jQuery-contextMenu/demo.html    chrome
    Maximize Browser Window
    Open Context Menu    xpath=//html/body/div/section/div/div/div/p/span
    sleep    2

TC17_DoubleClick
    [Tags]    Sel_17
    open browser    https://testautomationpractice.blogspot.com/    chrome
    Maximize Browser Window
    Double Click Element    xpath=//html/body/div[4]/div[2]/div[2]/div[2]/div[2]/div[2]/div[2]/div/div[4]/div[3]/div/aside/div/div[1]/div[1]/button
    sleep    2
    Close Browser

TC18_Drag_Drop
    [Tags]    Sel_18
    open browser    http://www.dhtmlgoodies.com/scripts/drag-drop-custom/demo-drag-drop-3.html    chrome
    Maximize Browser Window
    Drag And Drop    id=box6    id:box106
    sleep    2
    Close Browser

TC19_ScrollPage
    [Tags]    Sel_19
    open browser    https://www.countries-ofthe-world.com/flags-of-the-world.html    chrome
    Maximize Browser Window
    Execute Javascript    window.scrollTo(0,1500)
    sleep    3
    Scroll Element Into View    xpath=//html/body/div[1]/div[2]/div[2]/div[2]/div[2]/div[2]/table[1]/tbody/tr[73]/td[1]/img
    sleep    2
    Execute Javascript    window.scrollTo(0,document.body.scrollHeight)
    sleep    2
    Close Browser

TC20_TableDemo
    [Tags]    Sel_20
    open browser    https://testautomationpractice.blogspot.com/    chrome
    Maximize Browser Window
    sleep    3
    ${rows}=    get element count    xpath=//body/div[4]/div[2]/div[2]/div[2]/footer[1]/div[1]/div[2]/div[2]/div[1]/div[1]/div[1]/table[1]/tbody/tr
    sleep    3
    ${coloms}=    get element count    xpath=//body/div[4]/div[2]/div[2]/div[2]/footer[1]/div[1]/div[2]/div[2]/div[1]/div[1]/div[1]/table[1]/tbody/tr[1]/th
    sleep    3
    log to console    ${rows}
    log to console    ${coloms}

TC21_Web
    [Tags]    Sel_21
    open browser    https://www.techlistic.com/p/selenium-practice-form.html    chrome
    Maximize Browser Window
    Set Selenium Speed    1
    input text    name=firstname    Aleksandar
    input text    name=lastname    Presilski
    Select Radio Button    sex    Male
    Select Radio Button    exp    1
    input text    id=datepicker    16.12.2022
    Select Checkbox    Automation Tester
    Select Checkbox    Selenium Webdriver
    Select From List By Label    id=continents    Africa
    Select From List By Label    id=selenium_commands    Switch Commands
    Choose File    id=photo    C:\\Users\\Aleksandar\\Desktop\\Demo_Project\\New folder\\logo.png

TC22_UploadFile
    [Tags]    Sel_22
    open browser    https://the-internet.herokuapp.com/upload    chrome
    Maximize Browser Window
    sleep    2
    Wait Until Element Is Visible    xpath=//html/body/div[2]/div/div[1]/h3
    sleep    2
    Choose File    id=file-upload    C:\\Users\\Aleksandar\\Desktop\\Demo_Project\\New folder\\logo.png
    sleep    2
    Click Element    id=file-submit
    sleep    2
    wait until page contains    File Uploaded!
    Close Browser

TC23_Twitter
    [Tags]    Sel_23
    open browser    https://twitter.com/    chrome
    Maximize Browser Window
    Set Selenium Speed    2
    click element    xpath=//html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/main[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/section[1]/div[3]/a[1]/div[1]/span[1]/span[1]
    wait until page contains    Create your account
    input text    name=name    Aleksandar
    click element    xpath=//html/body/div[1]/div/div/div[1]/div[2]/div/div/div/div/div/div[2]/div[2]/div/div/div[2]/div[2]/div[1]/div/div[2]/div[3]/span
    input text    name=email    aleksandarpresilski@gmail.com
    Select From List By Label    xpath=//html/body/div[1]/div/div/div[1]/div[2]/div/div/div/div/div/div[2]/div[2]/div/div/div[2]/div[2]/div[1]/div/div[2]/div[4]/div[3]/div/div[1]/select    September
    Select From List By Label    xpath=//html/body/div[1]/div/div/div[1]/div[2]/div/div/div/div/div/div[2]/div[2]/div/div/div[2]/div[2]/div[1]/div/div[2]/div[4]/div[3]/div/div[2]/select    23
    Select From List By Label    xpath=//html/body/div[1]/div/div/div[1]/div[2]/div/div/div/div/div/div[2]/div[2]/div/div/div[2]/div[2]/div[1]/div/div[2]/div[4]/div[3]/div/div[3]/select    1990
    click element    xpath=//html/body/div[1]/div/div/div[1]/div[2]/div/div/div/div/div/div[2]/div[2]/div/div/div[2]/div[2]/div[2]/div/div/div/div/div
    wait until page contains    Customize your experience
    click element    xpath=//*[@id="layers"]/div[2]/div/div/div/div/div/div[2]/div[2]/div/div/div[2]/div[2]/div[2]/div/div/div/div/div
    wait until page contains    Create your account
    click element    xpath=//*[@id="layers"]/div[2]/div/div/div/div/div/div[2]/div[2]/div/div/div[2]/div[2]/div[2]/div/div/div[2]/div/div
    close browser

TC24_W3school
    Open browser    https://www.w3schools.com/    chrome
    Maximize Browser Window
    Set Selenium Speed    1
    Input text    id=search2    Html
    Click Element    id=learntocode_searchbtn
    Close Browser

TC33
    open browser    https://www.tutorialspoint.com/    chrome
    Maximize Browser Window
    sleep    2
    click element    xpath=//button[@class='f-button fc-cta-consent fc-primary-button' and @aria-label='Consent']

TC44
    open browser    https://www.tutorialspoint.com/    chrome
    Maximize Browser Window
    sleep    2
    wait until element is visible    xpath=//button[@class='f-button fc-cta-consent fc-primary-button' and @aria-label='Consent']
    Click Element    xpath=//button[@class='f-button fc-cta-consent fc-primary-button' and @aria-label='Consent']
