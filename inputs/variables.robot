*** Settings ***
Documentation     This is a resource file, that can contain variables.
...               Variables defined here can be used where this variables.robot in loaded.

*** Variables ***

${BASE_URL}              http://localhost:8080
${BROWSER}               Chrome
${EXECUTABLE_PATH}       /Users/sumanth/Downloads/GovTech_Assignment/WebDrivers/chromedriver
${INPUT_FILES_PATH}      /Users/sumanth/Downloads/GovTech_Assignment/oppenheimer-project-dev/Oppenheimer_Project/inputs
${LOGIN_PAGE_TITLE}      Technical Challenge for CDS
#${BUTTON_COLOR}         #dc3545
${BUTTON_COLOR}          rgba(220, 53, 69, 1)
${BUTTON_NAME}           Dispense Now
${BUTTON_LOCATOR}        xpath=//*[@id="contents"]/a[2]
${BUTTON_CSS_LOCATOR}    css:.btn-danger
${DISPENSE_PAGE}         Dispense!!
${DISPENSE_PAGE_TEXT}    Cash dispensed
${headers}               {\"Content-Type\": \"application\/json\", \"accept\": "*\/*"}
${pattern_to_match}      \^[a-zA-Z0-9]\{4\}(\\$+)\$
${upload_csv_locator}    //label[contains(text(),'Choose file')]
${upload_csv_clickable}  //body/div[1]/div[2]/div[1]/div[1]/div[2]/input[1]
#${expected_csv_header}   Create List    natid   name    gender  salary  birthday    tax