Feature: Provider Types Report
  Users wish to access the Provider Types report

  Scenario: Can Access Provider Types Page
    Given I am logged in as an admin
    And I am on the provider types page
    Then I should see the provider types page

  Scenario: Download Provider Types CSV
    Given I am logged in as an admin
    And I am on the provider types page
    And I download the provider types report
    Then I should have no errors
