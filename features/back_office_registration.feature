Feature: NCCC user administers a flood risk activity exemptions on behalf of a customer
  As a member of NCCC
  I want to register flood risk activity exemptions for calling customers
  So that they can be assisted registering their activities

  Background:
  	Given I am an internal user
  	And I have a valid username and password

  @backoffice @happy_path
  Scenario: Registration of a flood risk activity exemption by NCCC staff using the backoffice system
     When I register a flood risk activity exemption for a customer
     Then I will see confirmation the registration has been submitted
     