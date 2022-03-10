*** Settings ***
Documentation     As the Clerk, I should be able to insert a single record of working class hero into database via an API.
...
...               Keywords are imported from the resource file
Resource          keywords.robot
Suite Setup       Open Browser To launch app
Suite Teardown    Close Browser session

*** Test Cases ***
AC1:Validate inserting single record using API
    [Tags]  Functional Test
    [Documentation]    Single record of a working class hero should consist of Natural Id (natid), Name, Gender, Birthday, Salary and Tax paid
    Insert a working class hero record via API