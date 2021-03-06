Feature: Entering the dashboard page
  In order to administrate the catalog a user must be able to access the dashboard

  Scenario: A user goes to the dashboard page.
    Given I am not logged in
    When I go to the dashboard page
    Then I should see "titles.login"
    And I should see "activerecord.attributes.user.email"
    And I should see "activerecord.attributes.user.password"
  
  Scenario: A user goes to the dashboard page after logging in
    Given I am a registered user with email "test@test.com"
    When I login with valid credentials
    And I go to the dashboard page
    Then I should see "navigation.dashboard"