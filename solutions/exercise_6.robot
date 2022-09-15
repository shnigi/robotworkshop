*** Settings ***
Library      ./Customlib.py

*** Variables ***
${localnum1} =  5
${localnum2} =  8

*** Test Cases ***
Execute some mathematical operations
    Sum two numbers
    Subtract two numbers

*** Keywords ***
Sum two numbers
    plus    ${GLOBAL_NUM1}    ${localnum1}

Subtract two numbers
    minus    ${GLOBAL_NUM2}    ${localnum2}
