Feature: displaying the breadcrumbs
  In order to navigate correctly in the application, the user must be able to see the breadcrumb

  Scenario: A user goes to a product page that belongs to a root category.
    Given I am not logged in
    When I go to the frontend products page
    Then I should see "Home"
    And I should see "Products"

  Scenario: A user goes to a product page that belongs to a child category.
    Given I am not logged in
    And a product exists
    When I go to that product's frontend page
    Then I should see "Home"
    And I should see "Products"
    And I should see that product category name
    
  Scenario: A user goes to a product page that belongs to a child category that has 2 ancestors.
    Given I am not logged in
    And a product exists
    And that product category has 2 ancestors
    When I go to that product's frontend page
    Then I should see "Home"
    And I should see "Products"
    And I should see that product category names