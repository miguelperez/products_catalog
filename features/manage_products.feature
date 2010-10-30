Feature: When to the admin products site
  In order to maintain the products the admin user 
  should be able to add, edit and destroy products

  Scenario: A not logged in user goes to the products page.
	  Given I am not logged in
	  And I am a registered user with email "test@test.com"
	  When I go to the products page
	  Then I should see "Login"
	  And I should see "You must be logged in to access this page"
	  And I should see "Email"
	  And I should see "Password"

  Scenario Outline: checking the index table headers
 	  Given I am a registered user with email "test@test.com"
 	  And I login with valid credentials
 	  And the following products exists:
 	    |  name  |  description  |
 	    |  pro1  |  descrition1  |
 	    |  pro2  |  description2 |
 	  When I go to the products page
 	  Then I should see <header>

 	 Examples:
       | header                 |
       |"Is visible?"           |
       |"Name"                  |
       |"Description"           |
       |"Price"                 |
       |"Additional Information"|
       |"Actions"               |

  Scenario Outline: checking the links
	  Given I am a registered user with email "test@test.com"
	  And I login with valid credentials
	  And the following products exists:
	    |  name  |  description  |
	    |  pro1  |  descrition1  |
	    |  pro2  |  description2 |
	  And I go to the products page
	  When I follow <link>
	  Then I should see <title>
	  And I should see <back link>
	  
	  Examples:
       |   link     |       title      | back link |
       |  "Edit"    |  "Edit"          |  "Cancel"   |
       |  "Add new" |  "New product"   |  "Cancel"   |

  Scenario Outline: checking the will paginate links
    Given I am a registered user with email "test@test.com"
    And I login with valid credentials
    And there are 20 products created
    When I go to the products page
    Then I should see 'Next'
      
  Scenario: Creating a product
    Given I am a registered user with email "test@test.com"
  	And I login with valid credentials
  	And the following categories exists:
	    |  name  |
	    |  cat1  |
  	And I go to the products page
  	And I follow "Add new"
  	And I select "cat1" from "product_category_id"
  	And I fill in "product_name" with "first product"
  	And I fill in "product_description" with "description"
  	When I press "Create"
  	Then I should see "Successfully Created"

  Scenario: Updating a product
    Given I am a registered user with email "test@test.com"
  	And I login with valid credentials
  	And the following products exists:
  	   |  name  |  description  |
   	   |  pro1  |  descrition1  |
  	And I go to the products page
  	And I follow "Edit"
  	And I fill in "product_name" with "first product"
  	When I press "Update"
  	Then I should see "Successfully Updated"
  	And I go to the products page
  	Then I should see "first product"
  	
  Scenario: Viewing a product
    Given I am a registered user with email "test@test.com"
    And I login with valid credentials
    And the following products exists:
      |  name  |  description   |  price  |  additional_information  |
      |  pro1  |  description1  |   127   |      something here      |
    And I go to the products page
    And I follow "Show"
    Then I should see "pro1"
    And I should see "description1"
    And I should see "Price"
    And I should see "Additional Information"
    
  Scenario: Viewing a product
    Given I am a registered user with email "test@test.com"
    And I login with valid credentials
    And the following products exists:
      |  name  |  description   |
      |  pro1  |  description1  |
    And I go to the products page
    And I follow "Show"
    Then I should see "pro1"
    And I should see "description1"
    And I should not see "Price"
    And I should not see "Additional Information"
