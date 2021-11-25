@backoffice @export
Feature: Back office users can export registrations
  As a back office user
  I need the ability to see all the registrations for a given period
  So that I can report on registration numbers and exemption types

  Background:
    Given I have signed in as "super_agent@frae.gov.uk"

  @happy_path
  Scenario: Back office user exporting registrations
     When I export registrations for today
     Then I will see the exported registrations file status as complete
