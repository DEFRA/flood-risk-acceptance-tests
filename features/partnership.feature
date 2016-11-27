@functional
Feature: Partnership specific functionality
  As a partnership
  I have to provide details of at least two partners
  And therefore have extra functionality to manage this
  To help ensure what I provide is complete and correct

  @frontoffice
  Scenario: Add 3 partners then remove one
    Given I am an external user
      And I select exemption FRA17
      And add 3 partners
      But then remove one
     Then I will just see the remaining 2 partners
