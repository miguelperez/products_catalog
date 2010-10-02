Feature: When entering the admin user's page
  In order to maintain his account the admin user 
  should be able to edit his information

  Scenario: A not logged in user goes to the edit admin users page.
	Given I am not logged in
	And I am a registered user with email "test@test.com"
	When I go to that user's edit page
	Then I should see "Login"
	And I should see "Email"
	And I should see "Password"

  Scenario: A log in user goes to the edit page.
	Given I am a registered user with email "test@test.com"
	And I login with valid credentials
	When I go to that user's edit page
	Then I should see "Edit"
	And I should see "Email"
	And I should see "Password"
	
  Scenario: A log in user updates his profile
	Given I am a registered user with email "test@test.com"
	And I login with valid credentials
	And I go to that user's edit page
	When I fill in "user_password" with "updated"
	And I fill in "user_password_confirmation" with "updated"
	And I press "Update"
	Then I should see "Successfully updated"
	