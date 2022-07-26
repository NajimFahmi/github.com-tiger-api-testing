Feature: add phone to account
Background: 
 Given url "https://tek-insurance-api.azurewebsites.net"
 And path "/api/token"
 And request {"username": "supervisor", "password": "tek_supervisor"}
 When method post
 Then status 200 
 * def generatedToken = response.token

 Scenario: add account phone
 Given path "/api/accounts/add-account-phone"
 And request { "phoneNumber": "299545440", "phoneExtension": "110", "phoneTime": "11:00", "phoneType": "cell" }
 And header Authorization = "Bearer " + generatedToken
 When param primaryPersonId = 163
 Then method post 
 And status 201
 And print response 
 
 Scenario: add account car 
 
 Given path "/api/accounts/add-account-car"
 And request {"email": "akbarisdlfj@gmail.com", "title": "Mr", "firstName": "Abdul", "lastName": "Sediq", "gender": "MALE", "maritalStatus": "MARRIED", "employmentStatus": "unemployed", "dateOfBirth": "12/5/2000" }, "make": "Toyota", "model": "Corolla", "year": "2020", "licensePlate": "abc123" } 
 And param primaryPersonId = 163
  And header Authorization = "Bearer " + generatedToken
  When method post 
  And status 201
  Then print response
  
  Scenario: add account address
  Given path "/api/accounts/add-account-address"
  And request { "addressType": "Mailing", "addressLine1": "123 abc street", "city": "kabul", "state": "pa", "postalCode": "15221", "countryCode": "1" }
  And param primaryPersonId = 163
  And header Authorization = "Bearer " + generatedToken
  And method post
  And status 201
  Then print response 