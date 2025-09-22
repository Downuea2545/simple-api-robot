*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    JSONLibrary
Resource   ../common/variables.robot

*** Test Cases ***
Verify Plus API
    [Documentation]    Test the /plus endpoint to ensure it returns the correct sum.
    Create Session    api_session    http://localhost:5000
    ${response}=    GET On Session    api_session    /plus/5/6
    Log To Console    ${response.json()}
    Should Be Equal As Strings    ${response.status_code}    200
    ${json_data}=    Convert String To JSON    ${response.text}
    ${result}=    Get JSON Value    ${json_data}    $.result
    Should Be Equal As Integers    ${result}    11
