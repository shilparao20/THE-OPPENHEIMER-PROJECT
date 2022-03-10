*** Settings ***
Documentation     As the Governor, I should be able to see a button on the screen so that I can dispense tax relief for my working class heroes.
...
...               Keywords are imported from the resource file
Library           SeleniumLibrary
Resource          keywords.robot
Suite Setup       Open Browser To launch app
Suite Teardown    Close Browser session

*** Test Cases ***
AC1:Validate a red color button exists
    [Tags]  Functional Test
    [Documentation]    The button on the screen must be red-colored
    Validate a button exists with red color

AC2:Validate the red button text
    [Tags]  Functional Test
    [Documentation]     The text on the button must be exactly “Dispense Now”
    Validate the button text

AC3:Verify on button click the page opens new page with text "Cash dispensed"
    [Tags]  Functional Test
    [Documentation]     After clicking on the button, it should direct me to a page with a text that says “Cash dispensed”
    Verify on button click a new page opens and validate the text



