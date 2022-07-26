
Feature: Verify valid Token

Scenario: Verify valid token

 Given url "https://tek-insurance-api.azurewebsites.net/"
 And path "/api/token"
 And request {"username": "supervisor", "password": "tek_supervisor"}
 When method post
 Then status 200 
 * def generatedToken = response.token
 Given path "/api/token/verify"
 And param username = "supervisor"
 And param token = generatedToken
 When method get
 Then status 200
 And print response 

 Scenario: Verify with invalid token

 Given url "https://tek-insurance-api.azurewebsites.net/"
 

 
  Given path "/api/token/verify"
 And param username = "supervisor"
 And param token = "invalidtoken"
 When method get
 Then status 400
 And print response 
 * def errormessage2 = response.errorMessage
 And assert errormessage2 =="Token Expired or Invalid Token"
 
 Scenario: Verify token with invalid username and valid Token

Given url "https://tek-insurance-api.azurewebsites.net"
 And path "/api/token"
 And request {"username": "supervisor", "password": "tek_supervisor"}
 When method post
 Then status 200 
 * def generatedToken = response.token
 Given path "/api/token/verify"
 And param username = "invalidUsername"
 And param token = generatedToken
 When method get
 Then status 400
 * def errorMessage = response.errorMessage
 And print response 
 And assert errorMessage == "Wrong Username send along with Token"
 
 
 
 