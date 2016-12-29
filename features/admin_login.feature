@backoffice
Feature: The login page for the service's admin area
  As the service manager
  I want to know that administrative access is secured
  But also easy for authentic users to use
  So that I know my service is secure and simple to use

  @happy_path
  Scenario: Valid user login
    Given I am an internal user
      And I have a valid username and password
     Then I will be able to login

  @happy_path
  Scenario: Invalid user login
    Given I am an unknown user
      And I have an invalid username and password
     Then I will NOT be able to login
