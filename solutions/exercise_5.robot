*** Settings ***
Library     ./Customlib.py


*** Test Cases ***
Execute some mathematical operations
    [TAGS]  fifth_exercise
    Sum two numbers
    Subtract two numbers


*** Keywords ***
Sum Two Numbers
    Plus    2    4

Subtract Two Numbers
    Minus    4    2
