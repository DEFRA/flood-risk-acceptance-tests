@backoffice
Feature: NCCC user administers a flood risk activity exemptions on behalf of a customer
  As a member of NCCC
  I want to register flood risk activity exemptions for calling customers
  So that they can be assisted registering their activities

  Background:
  	Given I have signed in as "super_agent@frae.gov.uk"
    And I start a new registration

  @happy_path
  Scenario: Registration of a flood risk activity exemption by NCCC staff using the backoffice system
     When I register a flood risk activity exemption for a customer
     Then I will see confirmation the registration has been submitted

  Scenario: Registration in the backoffice where the user goes back and re-enters the address manually
    Given I get to the check your answers page
     And The user wishes to correct their address
     When I enter the address manually and complete the registration
     Then I should see just one result when searching for the registration

  Scenario: Partnership registration displays correct information in the registration page
    Given I complete a partnership registration
    When I search for the registration
    And I select the registration from the search results
    Then the registration details are shown
