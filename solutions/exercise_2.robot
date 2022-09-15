*** Settings ***
Library             SeleniumLibrary
Suite Teardown      Close all Browsers

*** Variables ***
${SERVER}         verkkokauppa.com
${BROWSER}        Chrome
${PAGE URL}       http://${SERVER}/

*** Test Cases ***
Find Iphone price
    Given User has navigated to verkkokauppa.com and homepage is open
    When User types item id in the search field and presses search
    And When user finds correct item in the search list
    Then By clicking correct item price can be verified


*** Keywords ***
User has navigated to verkkokauppa.com and homepage is open
    Open Browser    ${PAGE URL}    ${BROWSER}
    Maximize Browser Window
    Page Should Be Open

User types item id in the search field and presses search
    Input Text      //input[@type="search"]     776425
    Wait Until Element Does Not Contain   //button[@name="submit"]      //button[@name="submit"][@aria-disabled="true"]
    Click Element   //button[@name="submit"]

When user finds correct item in the search list
    Wait Until Page Contains Element    //a[@title="Apple iPhone 13 Pro 256 Gt -puhelin, vuorimännynvihreä (MNE33)"]
    Click Element   //a[@title="Apple iPhone 13 Pro 256 Gt -puhelin, vuorimännynvihreä (MNE33)"]

By clicking correct item price can be verified
    Wait Until Page Contains    Maksa myöhemmin Tilillä
    Wait Until Page Contains Element    //data[1][@data-price="current"]
    Element Should Contain      //data[1][@data-price="current"]    1 248,99

Page Should Be Open
    Title Should Be    Verkkokauppa.com - todennäköisesti aina halvempi