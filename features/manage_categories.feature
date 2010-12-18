Feature: When to the admin site
  In order to maintain the categories the admin user 
  should be able to add, edit and destroy categories

  Scenario: A not logged in user goes to the categories page.
    Given I am not logged in
    And I am a registered user with email "test@test.com"
    When I go to the categories page
    Then I should see "titles.login"
    And I should see "messages.you_must_login"
    And I should see "activerecord.attributes.user.email"
    And I should see "activerecord.attributes.user.password"

  Scenario Outline: checking the will paginate links
    Given I am a registered user with email "test@test.com"
    And I login with valid credentials
    And there are 20 categories created
    When I go to the categories page
    Then I should see 'Next'
   
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
      |"activerecord.attributes.category.name"   |
      |"activerecord.attributes.category.parent" |
      |"titles.actions"|

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
       |   link           |       title                           | back link |
       |  "forms.edit"    |  "titles.editing#{Category}"          |  "forms.cancel"   |
       |  "forms.new"     |  "titles.new#{Category}"              |  "forms.cancel"   |
      
  Scenario: Creating a category
    Given I am a registered user with email "test@test.com"
    And I login with valid credentials
    And I go to the categories page
    And I follow "forms.new"
    And I fill in "category_name" with "first category"
    When I press "forms.create"
    Then I should see "messages.successful_create#{Category}"

  Scenario: Updating a category
    Given I am a registered user with email "test@test.com"
    And I login with valid credentials
    And the following categories exists:
       |  name  |
       |  cat1  |
    And I go to the categories page
    And I follow "forms.edit"
    And I fill in "category_name" with "first category"
    When I press "forms.update"
    Then I should see "messages.successful_update#{Category}"
    And I go to the categories page
    Then I should see "first category"
  