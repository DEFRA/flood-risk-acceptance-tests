@frontoffice
Feature: Dredging distance is required for certain exemptions
  As a business
  For certain exemptions
  I need to know the approximate dredging length
  To help ensure they are not exceeding the maximum length of 1500 metres

  Scenario: External user adds an exemption which requires dredging length is captured
    Given I start a registration
      And I select exemption FRA23
     Then I will be asked to give the approximate length of dredging planned

  Scenario: External user adds an exemption which does not require a dredging length
   Given I start a registration
     And I select exemption FRA24
    Then I will NOT be asked to give the approximate length of dredging planned
