Feature: When subscribing
  In order to maintain a list of potential customers
  the user should be able to subscribe a mailing list.

  Scenario: A not logged in user goes to the subscribers page.
    Given I am not logged in
    And I am a registered user with email "test@test.com"
    When I go to the subscribers admin page
    Then I should see "titles.login"
    And I should see "messages.you_must_login"
    And I should see "activerecord.attributes.user.email"
    And I should see "activerecord.attributes.user.password"

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
       | header                                    |
       |"activerecord.attributes.subscriber.name"        |
       |"activerecord.attributes.subscriber.email"       |
       |"titles.actions"                           |

  Scenario: Creating a subscriber
    Given I am a registered user with email "test@test.com"
    And I login with valid credentials
    And I go to the new subscriber admin page
    And I fill in "subscriber_name" with "name"
    And I fill in "subscriber_email" with "some@email.com"
    When I press "forms.create"
    Then I should see "messages.successful_subscription"