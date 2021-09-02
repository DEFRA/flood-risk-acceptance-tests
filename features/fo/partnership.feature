@frontoffice 
Feature: Partnership specific functionality
  As a partnership
  I have to provide details of at least two partners
  And therefore have extra functionality to manage this
  To help ensure what I provide is complete and correct

  Scenario: Add 3 partners then remove one
  Given I start a registration
   When I select exemption FRA17 as a "partnership"
    And add "Steve Rogers" as the first partner
    And add "Bruce Banner" as a partner
    And add "Tony Stark" as a partner
    But then remove "Bruce Banner" from the partners list
   Then I will just see the remaining 2 partners

     @happy_path
  Scenario: Registration by a partnership
    Given I start a registration
      And I register exemption FRA16
      And I am a partnership
     When I confirm my registration
     Then I will see confirmation my registration has been submitted
