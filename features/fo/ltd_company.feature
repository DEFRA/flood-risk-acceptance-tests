@frontoffice 
Feature: Limited company registers a flood risk activity exemption
  As a limited company
  I want to register a location for a flood risk activity exemptions
  So that I can check that my activity does not harm the environment in that area

  @happy_path
  Scenario: Registration by a limited company
    Given I start a registration
      And I register exemption FRA16
      And I am a limited company
     When I confirm my registration
     Then I will see confirmation my registration has been submitted
