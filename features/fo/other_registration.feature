@frontoffice 
Feature: 'Other' registers a flood risk activity exemption
  As an charity
  I want to register a location for a flood risk activity exemption
  So that I can check that my activity does not harm the environment in that area

  @happy_path
  Scenario: Registration by an 'Other' organisation (eg trust, charity or club)
    Given I start a registration
      And I register exemption FRA16
      And I am a charity
     When I confirm my registration
     Then I will see confirmation my registration has been submitted
