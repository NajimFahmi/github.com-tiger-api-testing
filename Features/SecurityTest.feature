Feature: Security test. Token Generation test 
 
 Scenario: generate token with valid username and password. 
 Given url "https://tek-insurance-api.azurewebsites.net"
 And path "/api/token"
 And request {"username": "supervisor", "password": "tek_supervisor"}
 When method post
 Then status 200 
 
 Scenario: Test API with invalid username and password
  Given url "https://tek-insurance-api.azurewebsites.net/"
 And path "/api/token"
 And request {"username": "ahmad", "password": "tek_supervisor"}
 When method post
 Then status 404 
 * def errorMessage = response.errorMessage
 And assert errorMessage == "USER_NOT_FOUND"

	Scenario:Test API with Valid Username and Invalid Password
	
  Given url "https://tek-insurance-api.azurewebsites.net/"
 And path "/api/token"
 And request {"username": "supervisor", "password": "invalid_Password"}
 When method post
 Then status 400 
 * def errorMessage1 = response.errorMessage
 And assert errorMessage1 == "Password Not Matched" 
 
