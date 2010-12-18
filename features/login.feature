Feature: When entering the Login page
  In order to administrate the catalog a user must be able to login

  Scenario: A user goes to the login page.
    Given I am not logged in
    When I go to the login page
    Then I should see "titles.login"
    And I should see "activerecord.attributes.user.email"
    And I should see "activerecord.attributes.user.password"
  
  Scenario: A user goes to the login page after logging in, he should be redirected.
    Given I am a registered user with email "test@test.com"
    When I login with valid credentials
    And I go to the login page
    Then I should be on the dashboard page

  Scenario: A user goes to the logout page.
    Given I am a registered user with email "test@test.com"
    When I login with valid credentials
    And I go to the logout page
    Then I should be on the login page
    And I should see "messages.successful_logout"

  Scenario: A user logs in.
    Given I am a registered user with email "test@test.com"
    When I login with valid credentials
    Then I should be on the dashboard page
    And I should see "messages.successful_logged_in"