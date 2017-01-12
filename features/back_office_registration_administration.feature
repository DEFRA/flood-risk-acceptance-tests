@backoffice
Feature: NCCC user administers a flood risk activity exemptions on behalf of a customer
  As a member of NCCC
  I want to administer flood risk activity exemption activities
  So that I can mark each activity exemptions state before or after internal screening

  Background:
  	Given I am an internal user
  	And I have a valid username and password
  	And I register a flood risk activity exemption for a customer

  @smoke
  Scenario: Back office user withdraws registration
     When I "withdraw" a submitted registration
     Then I will see the registration is "Withdrawn"

  Scenario: Back office user approves registration
     When I "approve" a submitted registration
     Then I will see the registration is "Approved"

  Scenario: Back office user rejects registration
     When I "reject" a submitted registration
     Then I will see the registration is "Rejected"
