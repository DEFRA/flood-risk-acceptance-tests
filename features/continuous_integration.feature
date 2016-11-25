@ci
Feature: Continuous integration check of the project
  As a contributor to this project
  I want to know a change I made hasn't broken it (though it may have failing tests)
  So that we have a reliable base on which to build our acceptance tests

  Scenario: Check Quke is working
    Given a cucumber that is 30 cm long
     When I cut it in halves
     Then I have two cucumbers
      And both are 15 cm long
