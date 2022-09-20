*** Settings ***
Library             SeleniumLibrary
Suite Teardown      Close all Browsers

*** Variables ***
${SERVER}         verkkokauppa.com
${BROWSER}        Chrome
${PAGE URL}       http://${SERVER}/

*** Test Cases ***
Find Iphone price
    Open Browser    ${PAGE URL}    ${BROWSER}
    Maximize Browser Window
    Set Window Size  1920  1080
    Page Should Be Open
    Input Text      //input[@type="search"]     776425
    Wait Until Element Does Not Contain   //button[@name="submit"]      //button[@name="submit"][@aria-disabled="true"]
    Click Element   //button[@name="submit"]
    Wait Until Page Contains Element    //a[@title="Apple iPhone 13 Pro 256 Gt -puhelin, vuorimännynvihreä (MNE33)"]
    Click Element   //a[@title="Apple iPhone 13 Pro 256 Gt -puhelin, vuorimännynvihreä (MNE33)"]
    Wait Until Page Contains    Maksa myöhemmin Tilillä
    Wait Until Page Contains Element    //data[1][@data-price="current"]
    Element Should Contain      //data[1][@data-price="current"]    1 248,99

*** Keywords ***
Page Should Be Open
    Title Should Be    Verkkokauppa.com - todennäköisesti aina halvempi
