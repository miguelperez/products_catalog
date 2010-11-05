Feature: When subscribing
  In order to maintain a list of potential customers
  the user should be able to subscribe a mailing list.

  Scenario: Creating a subscriber
    Given I go to the new subscriber page
    And I fill in "subscriber_name" with "name"
    And I fill in "subscriber_email" with "some@email.com"
    When I press "Create"
    Then I should see "Successfully Subscribed"