*** Settings ***
Library     ./Customlib.py


*** Variables ***
${LOCALNUM1} =      5
${LOCALNUM2} =      8


*** Test Cases ***
Execute some mathematical operations
    Sum two numbers
    Subtract two numbers


*** Keywords ***
Sum two numbers
    Plus    ${GLOBAL_NUM1}    ${LOCALNUM1}

Subtract two numbers
    Minus    ${GLOBAL_NUM2}    ${LOCALNUM2}
