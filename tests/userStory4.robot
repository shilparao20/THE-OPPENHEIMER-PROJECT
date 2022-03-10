*** Settings ***
Documentation     As the Bookkeeper, I should be able to query the amount of tax
...               relief for each person in the database so that I can report the
...               figures to my Bookkeeping Manager.
...
...               Keywords are imported from the resource file
Library           String
Resource          keywords.robot

*** Test Cases ***
AC1:Verify taxRelief endpoint return a list consist of natid, tax relief amount and name
    [Tags]  Functional Test
    [Documentation]    A GET endpoint which returns a list consist of natid, tax relief amount and name
    Retrieve list of Tax Relief amount details via API
    #verify the list consists of three keys

AC2:Verify natid is masked from 5th character onwards
    [Tags]  Functional Test
    [Documentation]    natid field must be masked from the 5th character onwards with dollar sign ‘$’
    ${response}=   Retrieve list of Tax Relief amount details via API
    ${value}=   Verify natid Masking        ${response}