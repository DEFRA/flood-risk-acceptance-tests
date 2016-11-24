Feature: Local authority registers a flood risk activity exemption
  As a local authority
  I want to register a location for a flood risk activity exemption
  So that I can check that my activity does not harm the environment in that area

@frontoffice @happy_path
Scenario: Registration by a local authority
  Given I am an external user
    And I register exemption FRA5
    And I am a local authority
   When I confirm my registration
   Then I will see confirmation my registration has been submitted
