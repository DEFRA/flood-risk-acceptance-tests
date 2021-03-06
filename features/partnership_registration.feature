Feature: Partnership registers a flood risk activity exemption
  As an partnership
  I want to register a location for a flood risk activity exemptions
  So that I can check that my activity does not harm the environment in that area

  @frontoffice @happy_path
  Scenario: Registration by a partnership
    Given I am an external user
      And I register exemption FRA16
      And I am a partnership
     When I confirm my registration
     Then I will see confirmation my registration has been submitted
