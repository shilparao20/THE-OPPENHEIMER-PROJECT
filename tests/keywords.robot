*** Settings ***
Documentation     This is a resource file, that can contain variables and keywords.
...               Keywords defined here can be used where this keywords.resource in loaded.
Library           SeleniumLibrary
Library           OperatingSystem
Library           RequestsLibrary
Library           String
Library           Collections
#Library           ../inputs/variables.py
Library           ../customLibrary/RestAPIs.py
Library           ../customLibrary/PatternMatching.py

*** Variables ***

${BASE_URL}              http://localhost:8080
${BROWSER}               Chrome
${EXECUTABLE_PATH}       webDrivers/chromedriver
${INPUT_FILES_PATH}     ${CURDIR}${/}..${/}inputs
#${INPUT_FILES_PATH}      ${CURDIR}${/}inputs
${LOGIN_PAGE_TITLE}      Technical Challenge for CDS
${BUTTON_COLOR}          rgba(220, 53, 69, 1)
${BUTTON_NAME}           Dispense Now
${BUTTON_LOCATOR}        xpath=//*[@id="contents"]/a[2]
${BUTTON_CSS_LOCATOR}    css:.btn-danger
${DISPENSE_PAGE}         Dispense!!
${DISPENSE_PAGE_TEXT}    Cash dispensed
${HEADERS}               {\"Content-Type\": \"application\/json\", \"accept\": "*\/*"}
${PATTERN_TO_MATCH}      \^[a-zA-Z0-9]\{4\}(\\$+)\$
${UPLOAD_CSV_LOCATOR}    //label[contains(text(),'Choose file')]
${UPLOAD_CSV_CLICKABLE}  //body/div[1]/div[2]/div[1]/div[1]/div[2]/input[1]
#${expected_csv_header}   Create List    natid   name    gender  salary  birthday    tax

*** Keywords ***

Open Browser To launch app
    [Documentation]     Create a webdriver
...                     Then navigate to the application URL
...                     Verify if the title matches the desired login page title
    Log     ${EXECUTABLE_PATH}
    Create Webdriver    ${BROWSER}  executable_path=${EXECUTABLE_PATH}
    Go To   ${BASE_URL}
    Title Should Be    ${LOGIN_PAGE_TITLE}

Convert String to JSON
    [Documentation]     This keyword is used to convert any string to JSON
    [Arguments]     ${object}  # input string object 
    ${headers}=     Evaluate    json.loads("""${object}""")      json
    [Return]    ${headers}  # return the converted JSON object

Read JSON File and return request body
    [Documentation]     Takes a file as input
...                     Read the file content and converts to JSON
    [Arguments]     ${INPUT_FILE}
    ${json}=   Get file     ${INPUT_FILE} 
    ${req_body}=   Convert String to JSON    ${json}
    [Return]    ${req_body}  # return the converted request JSON object

Insert a working class hero record via API
    [Documentation]      Calls the function to read JSON file and returns request body
...                      Execute the POST request to insert single record
...                      Verify the status code returned   
    ${req_body}=    Read JSON File and return request body  ${INPUT_FILES_PATH}/userStory1.json
    ${headers}=   Convert String to JSON    ${HEADERS}
    ${response}=    POST    ${BASE_URL}/calculator/insert   json=${req_body}    headers=${headers}      expected_status=202 
    Status Should Be    202     ${response}

Insert multiple working class hero records via API
    [Documentation]      Calls the function to read JSON file and returns request body
...                      Execute the POST request to insert multiple records
...                      Verify the status code returned     
    ${req_body}=    Read JSON File and return request body  ${INPUT_FILES_PATH}/userStory2.json
    ${headers}=   Convert String to JSON    ${headers}
    ${response}=    POST    ${BASE_URL}/calculator/insertMultiple   json=${req_body}    headers=${headers}  expected_status=202 
    Status Should Be    202     ${response}

Retrieve list of Tax Relief amount details via API
    [Documentation]     It is used to execute a endpoint API 
...                     and return a list consist of natid, tax relief amount and name
...                     Verify the status code returned 
    ${headers}=   Convert String to JSON    ${HEADERS}
    ${response}     ${status}=      RestAPIs.get_request    ${BASE_URL}/calculator/taxRelief
    Should Be Equal    200    ${status}
    [Return]    ${response}

Verify natid Masking 
    [Documentation]     Calls a custom library to verify if the natid is masked from 5th character onwards
    [Arguments]     ${response}     
    ${value}=   PatternMatching.verify_natid_masking        ${response}     ${PATTERN_TO_MATCH}

Read CSV File
    [Documentation]     Takes input CSV file and reads the contents into a list
...                     Returns the CSV data in the form of list for further computation  
    ${csv}=     Get File    ${INPUT_FILES_PATH}/Input_Data.csv
    @{read}=    Create List     ${csv}
    [Return]    @{read}

Retrieve the first row from CSV
    [Documentation]     Reads the CSV content from a list
...                     Returns the CSV header 
    [Arguments]     @{read}
    @{lines}=    Split To Lines  @{read}     0   -1
    ${actual_csv_header}=    Create List
    @{csv_header}=   Split String    ${lines}[0]    ,
    FOR    ${header}    IN    @{csv_header}
            Append to List    ${actual_csv_header}    ${header}
    END
    Log      ${actual_csv_header}
    [Return]    ${actual_csv_header}
    
Verify the CSV headers
    [Documentation]     Verify if the CSV header is as expected and matchs the requirement
    [Arguments]     ${actual_csv_header}
    ${expected_csv_header}=  Create List    natid   name    gender  salary  birthday    tax 
    Lists Should Be Equal   ${actual_csv_header}   ${expected_csv_header} 

Check if upload CSV button placeholder is present
    [Documentation]     This is used to check if the placeholder to upload CSV is present on the portal
    Page Should Contain Element   ${UPLOAD_CSV_LOCATOR}  

Verify uploading a CSV to portal
    [Documentation]     Verify uploading CSV is successful 
    ${NORMAL_PATH_UPLOAD_FILE_NAME}    Normalize Path  ${INPUT_FILES_PATH}/Input_Data.csv
    Choose file     ${UPLOAD_CSV_CLICKABLE}     ${NORMAL_PATH_UPLOAD_FILE_NAME}       

Validate a button exists with red color
    [Documentation]     Check if a red color button is present on the portal
    Page Should Contain Button    ${BUTTON_CSS_LOCATOR}
    ${bg}=  Get WebElement     ${BUTTON_CSS_LOCATOR}
    ${bg_color}=    Call Method    ${bg}    value_of_css_property    background-color
    Should Be Equal    ${BUTTON_COLOR}    ${bg_color}

Validate the button text
    [Documentation]     Verify the button text
    Element Text Should Be    ${BUTTON_LOCATOR}  ${BUTTON_NAME}  ignore_case: bool = True
    
Verify on button click a new page opens and validate the text 
    [Documentation]     Checks on clicking the Dispense button, it opens a new page
...                     Validate the text present on new page
    Click Element    ${BUTTON_LOCATOR}
    Title Should Be        ${DISPENSE_PAGE}
    Page Should Contain    ${DISPENSE_PAGE_TEXT}    

Close Browser session
    [Documentation]     Used to close the browser
    Close Browser