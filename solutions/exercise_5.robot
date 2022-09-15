*** Settings ***
Library      ./Customlib.py

*** Test Cases ***
Execute some mathematical operations
    Sum two numbers
    Subtract two numbers

*** Keywords ***
Sum two numbers
    plus    2    4

Subtract two numbers
    minus    4    2
