*** Settings ***
Documentation     As the Clerk, I should be able to insert more than one working class hero into database via an API.
...
...               Keywords are imported from the resource file
Resource          keywords.robot
#Suite Setup       Open Browser To launch app
#Suite Teardown    Close Browser session

*** Test Cases ***
AC1:Validate inserting multiple records via API
    [Tags]  Functional Test
    [Documentation]    Enhancement of test case (1), with the ability to insert a list
    Insert multiple working class hero records via API