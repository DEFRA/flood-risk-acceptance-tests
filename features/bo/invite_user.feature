@backoffice
Feature: Inviting user to access the back office

Scenario: New user can be invited to use the back office
 Given I have signed in as "system@frae.gov.uk"
 When I invite a new user to access the service
 Then I will get confirmation that an invite email has been sent