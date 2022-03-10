*** Settings ***
Documentation     As the Clerk, I should be able to upload a csv file to a portal 
...               so that I can populate the database from a UI
...
...               Keywords are imported from the resource file
Resource          keywords.robot
Suite Setup       Open Browser To launch app
Suite Teardown    Close Browser session

*** Test Cases ***
AC1:Verify first row of csv contains mandatory headers
    [Tags]  Functional Test
    [Documentation]   First row of the csv file must be 
...                   natid, name, gender, salary, birthday, tax
    @{read_csv}=   Read CSV File
    ${actual_csv_header}=   Retrieve the first row from CSV     @{read_csv}
    Verify the CSV headers      ${actual_csv_header}

AC2:Verify the CVS consists of relevant details
    [Tags]  Functional Test
    [Documentation]   Subsequent rows of csv are the relevant details 
...                   of each working class hero
    @{read_csv}=   Read CSV File
    #Verify all CSV data     @{read_csv}

AC3:Verify upload of CSV is working in portal
    [Tags]  Functional Test
    [Documentation]   A simple button that allows me to upload a 
...                   file on my pc to the portal
    Open Browser To launch app
    Check if upload CSV button placeholder is present
    Verify uploading a CSV to portal
    Close Browser session

