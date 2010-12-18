Feature: When to the admin products site
  In order to maintain the products the admin user 
  should be able to add, edit and destroy products

  Scenario: A not logged in user goes to the products page.
    Given I am not logged in
    And I am a registered user with email "test@test.com"
    When I go to the products page
    Then I should see "titles.login"
    And I should see "messages.you_must_login"
    And I should see "activerecord.attributes.user.email"
    And I should see "activerecord.attributes.user.password"

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
       |"activerecord.attributes.product.is_visible"                                           |
       |"activerecord.attributes.product.name"                  |
       |"activerecord.attributes.product.description"           |
       |"activerecord.attributes.product.price"                 |
       |"activerecord.attributes.product.additional_information"|
       |"titles.actions"                                         |

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
       |   link           |       title                          |         back link |
       |  "forms.edit"    |  "titles.editing#{Product}"          |  "forms.cancel"   |
       |  "forms.new"     |  "titles.new#{Product}"              |  "forms.cancel"   |

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
    And I follow "forms.new"
    And I select "cat1" from "product_category_id"
    And I fill in "product_name" with "first product"
    And I fill in "product_description" with "description"
    When I press "forms.create"
    Then I should see "messages.successful_create#{Product}"

  Scenario: Updating a product
    Given I am a registered user with email "test@test.com"
    And I login with valid credentials
    And the following products exists:
       |  name  |  description  |
       |  pro1  |  descrition1  |
    And I go to the products page
    And I follow "forms.edit"
    And I fill in "product_name" with "first product"
    When I press "forms.update"
    Then I should see "messages.successful_update#{Product}"
    And I go to the products page
    Then I should see "first product"
    
  Scenario: Viewing a product
    Given I am a registered user with email "test@test.com"
    And I login with valid credentials
    And the following products exists:
      |  name  |  description   |  price  |  additional_information  |
      |  pro1  |  description1  |   127   |      something here      |
    And I go to the products page
    And I follow "forms.show"
    Then I should see "pro1"
    And I should see "activerecord.attributes.product.description"
    And I should see "activerecord.attributes.product.price"
    And I should see "activerecord.attributes.product.additional_information"
    
  Scenario: Viewing a product
    Given I am a registered user with email "test@test.com"
    And I login with valid credentials
    And the following products exists:
      |  name  |  description   |
      |  pro1  |  description1  |
    And I go to the products page
    And I follow "forms.show"
    Then I should see "pro1"
    And I should see "activerecord.attributes.product.description"
    And I should not see "activerecord.attributes.product.price"
    And I should not see "activerecord.attributes.product.additional_information"
