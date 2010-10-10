Feature: When to the admin site
  In order to maintain the categories the admin user 
  should be able to add, edit and destroy categories

  Scenario: A not logged in user goes to the categories page.
	  Given I am not logged in
	  And I am a registered user with email "test@test.com"
	  When I go to the categories page
	  Then I should see "Login"
	  And I should see "You must be logged in to access this page"
	  And I should see "Email"
	  And I should see "Password"
	 
  Scenario Outline: checking the index table headers
	  Given I am a registered user with email "test@test.com"
	  And I login with valid credentials
	  And the following categories exists:
	    |  name  |
	    |  cat1  |
	    |  cat2  |
	  When I go to the categories page
	  Then I should see <header>

	 Examples:
      | header  |
      |"Name"   |
      |"Parent" |
      |"Actions"|

  Scenario Outline: checking the links
	  Given I am a registered user with email "test@test.com"
	  And I login with valid credentials
	  And the following categories exists:
	    |  name  |
	    |  cat1  |
	    |  cat2  |
	  And I go to the categories page
	  When I follow <link>
	  Then I should see <title>
	  And I should see <back link>
	  
	  Examples:
       |   link     |       title      | back link |
       |  "Edit"    |  "Edit"          |  "Cancel"   |
       |  "Add new" |  "New category"  |  "Cancel"   |
      
  Scenario: Creating a category
    Given I am a registered user with email "test@test.com"
  	And I login with valid credentials
  	And I go to the categories page
  	And I follow "Add new"
  	And I fill in "category_name" with "first category"
  	When I press "Create"
  	Then I should see "Successfully Created"

  Scenario: Updating a category
    Given I am a registered user with email "test@test.com"
  	And I login with valid credentials
  	And the following categories exists:
  	   |  name  |
  	   |  cat1  |
  	And I go to the categories page
  	And I follow "Edit"
  	And I fill in "category_name" with "first category"
  	When I press "Update"
  	Then I should see "Successfully Updated"
  	And I go to the categories page
  	Then I should see "first category"
  