*** Settings ***
Library     OperatingSystem


*** Test Cases ***
Example operating system test case
  [Tags]  fourth_exercise
  Create File  ${CURDIR}/example.txt  Hello, world!
  File Should Exist  ${CURDIR}/example.txt
  Copy File  ${CURDIR}/example.txt  ${CURDIR}/copy.txt
