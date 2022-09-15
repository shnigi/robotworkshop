*** Settings ***
Library             SeleniumLibrary
Suite Teardown      Close all Browsers

*** Variables ***
${SERVER}         verkkokauppa.com
${BROWSER}        Chrome
${PAGE URL}       http://${SERVER}/

*** Test Cases ***
Open Browser To Page
    Open Browser    ${PAGE URL}    ${BROWSER}
    Maximize Browser Window
    Page Should Be Open

*** Keywords ***
Page Should Be Open
    Title Should Be    Verkkokauppa.com - todennäköisesti aina halvempi
