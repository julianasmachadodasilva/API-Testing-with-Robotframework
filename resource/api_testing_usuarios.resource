*** Settings ***
Library        RequestsLibrary
Library        String
Library        Collections

*** Keywords ***
Create a new user 
    ${randomword}    Generate Random String    length=4    chars=[LETTERS]
    ${randomword}    Convert To Lower Case    ${randomword}
    Set Test Variable    ${EMAILTEST}     ${randomword}@automation.com  
    Log    ${EMAILTEST}  

Register the new user into ServeReest
    [Arguments]    ${email}    ${status_code_desire}
    ${body}    Create Dictionary    
    ...    nome=Fulano da Silva    
    ...    email=${EMAILTEST}    
    ...    password=1234    
    ...    administrador=true
    Log    ${body}

    Create ServeRest session 

    ${response}    POST On Session  
    ...            alias=ServeRest
    ...            url=/usuarios
    ...            json=${body}
    ...            expected_status=${status_code_desire}
    Log            ${response.json()}  

    IF    ${response.status_code} == 201
          Set Test Variable    ${ID_USER}     ${response.json()["_id"]}      
    END
    
    Set Test Variable    ${RESPONSE}    ${response.json()}

# È uma sessão onde você faz todas as chamadas em comum para a API, por exemplo endpoint, url, headers etc
Create ServeRest session
    ${headers}    Create Dictionary    accept=application/json    Content-Type=application/json
    Create Session    alias=ServeRest    url=https://serverest.dev    headers=${headers}

Verify if user was registered successfully
    Log    ${RESPONSE}
    Dictionary Should Contain Item    ${RESPONSE}    message     Cadastro realizado com sucesso 
    Dictionary Should Contain Key     ${RESPONSE}    _id

# Scenario 2: Try to register an user already registered into ServeRest
Repeat the user resgistration 
    Register the new user into ServeReest    email=${EMAILTEST}     status_code_desire=400
Verify if API did not allow the duplicate resgistration
    Dictionary Should Contain Item    ${RESPONSE}    message     Este email já está sendo usado

# Scenario 3: Verifying new user data
Verify the new user data
    ${verify_response}    GET On Session
    ...            alias=ServeRest
    ...            url=/usuarios/${ID_USER} 
    Log    ${verify_response.status_code} 
    Log    ${verify_response.reason} 
    Log    ${verify_response.headers} 
    Log    ${verify_response.elapsed} 
    Log    ${verify_response.text} 
    Set Test Variable    ${VERIFY_RESPONSE}    ${verify_response.json()}                 
Validate the user data returned
    Log    ${VERIFY_RESPONSE}
    Dictionary Should Contain Item     ${VERIFY_RESPONSE}    nome             Fulano da Silva
    Dictionary Should Contain Item     ${VERIFY_RESPONSE}    email            ${EMAILTEST}
    Dictionary Should Contain Item     ${VERIFY_RESPONSE}    password         1234
    Dictionary Should Contain Item     ${VERIFY_RESPONSE}    administrador    true
    Dictionary Should Contain Item     ${VERIFY_RESPONSE}    _id             ${ID_USER}