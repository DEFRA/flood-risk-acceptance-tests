@frontoffice 
Feature: Validations within the digital service
  As a user
  I want to know that if I make a mistake
  The service will tell me how to correct it
  So that I don't have to resort to calling someone

  Scenario: External user adds an exemption then changes their mind
    Given I start a registration
      And I select exemption FRA2
      But I then opt to change FRA2
     Then I will be taken back to the add exemptions page
