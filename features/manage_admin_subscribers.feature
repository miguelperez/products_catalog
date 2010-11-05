Feature: When subscribing
  In order to maintain a list of potential customers
  the user should be able to subscribe a mailing list.

  Scenario: A not logged in user goes to the subscribers page.
    Given I am not logged in
    And I am a registered user with email "test@test.com"
    When I go to the subscribers admin page
    Then I should see "Login"
    And I should see "You must be logged in to access this page"
    And I should see "Email"
    And I should see "Password"

  Scenario Outline: checking the index table headers
    Given I am a registered user with email "test@test.com"
    And I login with valid credentials
    And the following subscribers exists:
      |  name  |  email         |
      |  pro1  |  email@sd.com  |
      |  pro2  |  email@sd.com  |
    When I go to the subscribers admin page
    Then I should see <header>

   Examples:
       | header       |
       |"Name"        |
       |"email"       |
       |"Actions"     |

  Scenario: Creating a subscriber
    Given I am a registered user with email "test@test.com"
    And I login with valid credentials
    And I go to the new subscriber admin page
    And I fill in "subscriber_name" with "name"
    And I fill in "subscriber_email" with "some@email.com"
    When I press "Create"
    Then I should see "Successfully Subscribed"