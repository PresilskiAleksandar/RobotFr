*** Settings ***
Library           DatabaseLibrary

*** Variables ***
${dbname}         presilski
${dbuser}         root
${dbpasswd}       ${EMPTY}
${dbhost}         localhost
${dbport}         3306
@{queryResults}

*** Test Cases ***
TC1
    [Tags]    1
    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Table Must Exist    modeli
    Check If Exists In Database    SELECT * FROM modeli
    @{queryResults}    Query    SELECT * FROM modeli
    FOR    ${row}    IN    @{queryResults}
        Log    ${row}
    END

TC2_Setup_Teardown
    [Tags]    2
    [Setup]    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Table Must Exist    marki
    Check If Exists In Database    SELECT * FROM marki
    @{queryResults}=    Query    SELECT * FROM marki
    [Teardown]    Disconnect From Database

TC3_Insert
    [Tags]    3
    [Setup]    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Table Must Exist    marki
    ${Output}=    Execute SQL String    Insert into marki values(27,'Audi','MKD','N');
    log to console    ${output}
    Should Be Equal As Strings    ${output}    None
    [Teardown]    Disconnect From Database

TC4_Insert_Multiple
    [Tags]    4
    [Setup]    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Table Must Exist    marki
    ${Output}=    Execute SQL String    Insert into marki values(27,'Audi','MKD','N'),(28,'Audi','MKD','Y');
    log to console    ${output}
    Should Be Equal As Strings    ${output}    None
    [Teardown]    Disconnect From Database

TC5_Select_
    [Tags]    5
    [Setup]    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Table Must Exist    marki
    Check If Exists In Database    SELECT marki_id FROM marki WHERE marki_name='BMW';
    [Teardown]    Disconnect From Database

TC6_Row_count_0
    [Tags]    6
    [Setup]    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Table Must Exist    modeli
    Row Count Is 0    SELECT * FROM modeli WHERE modeli_name='FICO';
    [Teardown]    Disconnect From Database

TC7_Row_Count_Equal_x
    [Tags]    7
    [Setup]    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Table Must Exist    marki
    Row Count Is Equal To X    SELECT * FROM marki WHERE marki_name LIKE 'honda';    2
    [Teardown]    Disconnect From Database

TC8_Row_count_equal_greater
    [Tags]    8
    [Setup]    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Table Must Exist    Modeli
    Row Count Is Greater Than X    SELECT * FROM modeli WHERE modeli_name like 'A4';    2
    [Teardown]    Disconnect From Database

TC9_Update
    [Tags]    9
    [Setup]    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Table Must Exist    Marki
    ${output}    Execute Sql String    UPDATE marki SET marki_name='BMW' WHERE marki_id=24;
    Log To Console    ${output}
    [Teardown]    Disconnect From Database

TC10_Logmany
    [Tags]    10
    [Setup]    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    @{queryResults}=    Query    SELECT * FROM marki;
    Log Many    @{queryResults}
    [Teardown]    Disconnect From Database

TC11_Delete
    [Tags]    11
    [Setup]    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    ${output}=    Execute Sql String    DELETE FROM marki WHERE marki_id=26;
    Should Be Equal As Strings    ${output}    None
    [Teardown]    Disconnect From Database

TC12_Select_DESC
    [Tags]    12
    [Setup]    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Table Must Exist    marki
    Check If Exists In Database    Select * From marki WHERE marki_name='audi' order by marki_name DESC;
    @{queryResults}    Query    Select * From marki WHERE marki_name='audi' order by marki_name DESC;
    Log Many    @{queryResults}
    [Teardown]    Disconnect From Database

TC13_Select_Dsc
    [Tags]    13
    [Setup]    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    @{queryResults}=    Query    Select * From marki WHERE marki_name='audi' order by marki_name DESC;
    Log Many    @{queryResults}
    [Teardown]    Disconnect From Database

TC14_Sel_Cou_Asc
    [Tags]    14
    [Setup]    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    @{queryResults}    Query    Select * \ From marki WHERE country LIKE 'D' ORDER BY marki_name ASC;
    Log Many    @{queryResults}
    [Teardown]    Disconnect From Database

TC15_Sel_Eu_N
    [Tags]    15
    [Setup]    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    @{queryResults}    Query    SELECT * FROM marki WHERE eu='N';
    Log Many    @{queryResults}
    [Teardown]    Disconnect From Database

TC16_Cou_D_H
    [Tags]    16
    [Setup]    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    @{queryResults}    Query    Select * \ From marki WHERE country LIKE 'D' or country like 'H';
    Log Many    @{queryResults}
    [Teardown]    Disconnect From Database

TC17_Count_Groupby
    [Tags]    17
    [Setup]    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    @{queryResults}    Query    SELECT country, COUNT(marki_id) AS Br_na_fabriki FROM marki GROUP BY country \ ORDER BY br_na_fabriki DESC, country ASC ;
    Log Many    @{queryResults}
    [Teardown]    Disconnect From Database

TC18_Join_SUM_GroupBY
    [Tags]    18
    [Setup]    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    @{queryResults}    Query    SELECT country, SUM(price) AS Vk_prodazba FROM modeli right JOIN marki ON modeli.marki_id=marki.marki_id GROUP BY country ORDER BY vk_prodazba DESC;
    Log Many    @{queryResults}
    [Teardown]    Disconnect From Database

TC19_StoreProcedure
    [Tags]    19
    [Setup]    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Table Must Exist    marki
    Check If Exists In Database    CALL _select_marki();
    @{queryResults}    Query    CALL _select_marki();
    Log Many    @{queryResults}
    [Teardown]    Disconnect From Database

TC20_IF
    [Tags]    20
    [Setup]    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Table Must Exist    marki
    Check If Exists In Database    CALL _select_marki();
    @{queryResults}    Query    CALL _select_marki();
    ${row}    Set Variable    "Marki_name"
    FOR    ${row}    IN    @{queryResults}
        IF    ${row}=="BMW"
            Log    ${row}
    END    END
    END
    [Teardown]    Disconnect From Database
