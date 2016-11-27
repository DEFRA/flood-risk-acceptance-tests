@functional
Feature: The 'Check your answers' page
  As a user
  I want to see the details I've entered
  Before I complete it
  So that I can be confident I am submitting the correct information

  @frontoffice
  Scenario: Simple individual registration
    Given I am an external user
     When I select exemption FRA2 as an individual
     Then I will see all the details I entered as an individual
