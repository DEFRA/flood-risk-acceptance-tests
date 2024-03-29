@frontoffice
Feature: The 'Check your answers' page
  As a user
  I want to see the details I've entered
  Before I complete it
  So that I can be confident I am submitting the correct information

  Scenario: Simple individual registration
    Given I start a registration
     When I select exemption FRA2 as a "soleTrader"
      And complete the remaining steps as an individual
     Then I will see all the details I entered as an individual

  Scenario: Multiple partners partnership registration
   Given I start a registration
    When I select exemption FRA2 as a "partnership"
     And add "Steve Rogers" as the first partner
     And add "Bruce Banner" as a partner
     And add "Tony Stark" as the last partner
     And give "Nick Fury" as the contact
    Then I will see all the details I entered as a partnership
