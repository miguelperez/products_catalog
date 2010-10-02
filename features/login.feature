Feature: When entering the Login page
  In order to administrate the catalog a user must be able to login

  Scenario: A user goes to the login page.
	Given I am not logged in
	When I go to the login page
	Then I should see "Login"
	And I should see "Email"
	And I should see "Password"
	
  Scenario: A user goes to the login page after logging in, he should be redirected.
  	Given I am a registered user with email "test@test.com"
	When I login with valid credentials
  	And I go to the login page
  	Then I should see "Index"

  Scenario: A user goes to the logout page.
	Given I am a registered user with email "test@test.com"
	When I login with valid credentials
	And I go to the logout page
	Then I should be on the login page
	And I should see "Successfully logout"

  Scenario: A user logs in.
	Given I am a registered user with email "test@test.com"
	When I login with valid credentials
	Then I should be on the home page
	And I should see "Successfully logged in"