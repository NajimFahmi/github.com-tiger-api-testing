Feature: Create account with Data generator
  # We are going to re-use a generate token feature.
  Background: Prepare for test. generate token.
    Given url "https://tek-insurance-api.azurewebsites.net"
   * def result = callonce read('GeneratToken.feature')
   And print result
    * def generatedToken = result.response.token
    And print generatedToken
    
    
    Scenario: Create New Account using Data generator; 
        * def generator = Java.type('tek.karate.test.faker.DataGenerator')
        * def email = generator.getEmail()
        * def firstName = generator.getFirstName()
        * def lastName = generator.getLastName()
        * def dob = generator.getDoB()
        Given path "/api/accounts/add-primary-account"
    And request
    """ 
    {
    "email": "#(email)",
    "title": "Mr.",
    "firstName": "#(firstName)",
    "lastName": "#(lastName)",
    "gender": "MALE",
    "maritalStatus": "MARRIED",
    "employmentStatus": "student",
    "dateOfBirth": "#(dob)"
    }
    """
    And header Authorization = "Bearer " + generatedToken
    When method post
    Then status 201
