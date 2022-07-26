Feature: Add address

Background: create new account.

Given url "https://tek-insurance-api.azurewebsites.net/"
* def createAccountresult = callonce read('CreateAccountWithdataGene.feature')
  And print createAccountresult
 * def primaryPersonId = createAccountresult.response.id
 And print primaryPersonId
 * def token = createAccountresult.result.response.token
 
 Scenario: Add address to an account 
 Given path "/api/accounts/add-account-address"
 Given param primaryPersonId = primaryPersonId
 Given header Authorization = "Bearer " + token
 Given request 
"""
{"addressType": "Home",
  "addressLine1": "123 abc street",
  "city": "Pittsburgh",
  "state": "PA",
  "postalCode": "15214",
  "countryCode": "1",
  "current": true}"""

Given method post
Then status 201
And print response