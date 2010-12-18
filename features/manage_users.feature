Feature: When entering the admin user's page
  In order to maintain his account the admin user 
  should be able to edit his information

  Scenario: A not logged in user goes to the edit admin users page.
  Given I am not logged in
  And I am a registered user with email "test@test.com"
  When I go to that user's edit page
  Then I should see "titles.login"
  And I should see "messages.you_must_login"
  And I should see "activerecord.attributes.user.email"
  And I should see "activerecord.attributes.user.password"

  Scenario: A log in user goes to the edit page.
  Given I am a registered user with email "test@test.com"
  And I login with valid credentials
  When I go to that user's edit page
  Then I should see "forms.edit"
  And I should see "activerecord.attributes.user.email"
  And I should see "activerecord.attributes.user.password"
  
  Scenario: A log in user updates his profile
  Given I am a registered user with email "test@test.com"
  And I login with valid credentials
  And I go to that user's edit page
  When I fill in "user_password" with "updated"
  And I fill in "user_password_confirmation" with "updated"
  And I press "forms.update"
  Then I should see "messages.successful_update#{User}"
  