@functional
Feature: Partnership specific functionality
  As a partnership
  I have to provide details of at least two partners
  And therefore have extra functionality to manage this
  To help ensure what I provide is complete and correct

  @frontoffice @iphone
  Scenario: Add 3 partners then remove one
  Given I am an external user
   When I select exemption FRA17 as a "partnership"
    And add "Steve Rogers" as the first partner
    And add "Bruce Banner" as a partner
    And add "Tony Stark" as a partner
    But then remove "Bruce Banner" from the partners list
   Then I will just see the remaining 2 partners
