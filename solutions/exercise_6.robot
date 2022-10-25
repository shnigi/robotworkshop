*** Settings ***
Library     ./Customlib.py


*** Variables ***
${LOCALNUM1} =      5
${LOCALNUM2} =      8


*** Test Cases ***
Execute some mathematical operations
    [Tags]    sixth_exercise
    Sum Two Numbers
    Subtract Two Numbers


*** Keywords ***
Sum Two Numbers
    Plus    ${GLOBAL_NUM1}    ${LOCALNUM1}

Subtract Two Numbers
    Minus    ${GLOBAL_NUM2}    ${LOCALNUM2}
