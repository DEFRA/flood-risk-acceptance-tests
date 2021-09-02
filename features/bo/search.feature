@backoffice @wip
Feature: Registration searches in the back office

Scenario: Approved registrations are displayed when searched for
 Given I have signed in as "super_agent@frae.gov.uk"
 When I search for an "Approved" registration
 Then all search results will have an "Approved" status