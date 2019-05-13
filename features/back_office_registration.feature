@backoffice
Feature: NCCC user administers a flood risk activity exemptions on behalf of a customer
  As a member of NCCC
  I want to register flood risk activity exemptions for calling customers
  So that they can be assisted registering their activities

  Background:
  	Given I am an internal user
  	And I have a valid username and password

  @happy_path
  Scenario: Registration of a flood risk activity exemption by NCCC staff using the backoffice system
     When I register a flood risk activity exemption for a customer
     Then I will see confirmation the registration has been submitted

  # Multiple organisation addresses against applications
  #
  # Initially reported by NCCC that there were duplicate exemption records in
  # the system. We found that there is no duplication of application or
  # enrolment records, but the records that appear twice do so because they have
  # multiple addresses listed as their ‘organisation’ address.
  #
  # This scenario covers the steps necessary to reproduce the problem. See
  # https://eaflood.atlassian.net/browse/RIP-359 for more details.

  # @fix
  # Scenario: Registration in the backoffice where the user goes back and re-enters the address manually
  #   Given I get to the check your answers page
  #    And The user wishes to correct their address
  #    When I enter the address manually and complete the registration
  #    Then I should see just one result when searching for the registration
