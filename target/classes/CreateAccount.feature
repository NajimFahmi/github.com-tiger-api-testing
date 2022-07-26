
Feature: create account

Background: 
 Given url "https://tek-insurance-api.azurewebsites.net"
 And path "/api/token"
 And request {"username": "supervisor", "password": "tek_supervisor"}
 When method post
 Then status 200 
 * def generatedToken = response.token

Scenario: test creating add primary account 

Given url "https://tek-insurance-api.azurewebsites.net/"
And path "/api/accounts/add-primary-account"
And request {"email": "ahmadjannim3@gmail.com", "title": "Mr.", "firstName": "Ahmad", "lastName": "Mahmood", "gender": "MALE", "maritalStatus": "MARRIED", "employmentStatus": "Employed", "dateOfBirth": "12/15/2007"}
And header Authorization = "Bearer " + generatedToken
And method post
Then status 201
And print response 


Scenario: test api end point creating new account with existing email
Given path "/api/accounts/add-primary-account"
And request {"email": "ahmadjannim3@gmail.com", "title": "Mr.", "firstName": "Ahmad", "lastName": "Mahmood", "gender": "MALE", "maritalStatus": "MARRIED", "employmentStatus": "Employed", "dateOfBirth": "12/15/2007"}
And header Authorization = "Bearer " + generatedToken
And method post
Then print response 
Then status 400



