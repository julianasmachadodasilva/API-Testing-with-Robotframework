*** Settings ***
Resource    ../resource/api_testing_usuarios.resource

*** Variables ***


*** Test Cases ***
Scenario 1: Register a new user into ServeRest
    Create a new user 
    Register the new user into ServeReest    email=${EMAILTEST}    status_code_desire=201
    Verify if user was registered successfully 

Scenario 2: Try to register an user already registered into ServeRest
    Create a new user 
    Register the new user into ServeReest    email=${EMAILTEST}    status_code_desire=201
    Repeat the user resgistration 
    Verify if API did not allow the duplicate resgistration   

Scenario 3: Verifying new user data
    Create a new user 
    Register the new user into ServeReest    email=${EMAILTEST}    status_code_desire=201
    Verify the new user data
    Validate the user data returned