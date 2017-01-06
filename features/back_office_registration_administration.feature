Feature: NCCC user administers a flood risk activity exemptions on behalf of a customer
  As a member of NCCC
  I want to administer flood risk activity exemption requests on behalf of a customer
  So that anyone needing to have digital assistance can have help with their flood risk activity exemption requests

  Background:
  	Given I am an internal user
  	And I have a valid username and password
  	And I register a flood risk activity exemption for a customer

  @backoffice @smoke @wip
  Scenario: Back office user withdraws registration
     When I withdraw a submitted registration

     