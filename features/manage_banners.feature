Feature: When to the admin site
  In order to maintain the banners the admin user 
  should be able to add, edit and destroy banners

  Scenario: A not logged in user goes to the banners page.
    Given I am not logged in
    And I am a registered user with email "test@test.com"
    When I go to the banners page
    Then I should see "titles.login"
    And I should see "messages.you_must_login"
    And I should see "activerecord.attributes.user.email"
    And I should see "activerecord.attributes.user.password"
    
  Scenario Outline: checking the will paginate links
    Given I am a registered user with email "test@test.com"
    And I login with valid credentials
    And there are 20 banners created
    When I go to the banners page
    Then I should see 'Next'
   
  Scenario Outline: checking the index table headers
    Given I am a registered user with email "test@test.com"
    And I login with valid credentials
    And the following banners exists:
      |  name  |
      |  ban1  |
      |  ban2  |
    When I go to the banners page
    Then I should see <header>

   Examples:
      | header        |
      |"activerecord.attributes.banner.name"         |
      |"activerecord.attributes.banner.description"  |
      |"titles.actions"      |

  Scenario Outline: checking the links
    Given I am a registered user with email "test@test.com"
    And I login with valid credentials
    And the following banners exists:
      |  name  |
      |  ban1  |
      |  ban2  |
    And I go to the banners page
    When I follow <link>
    Then I should see <title>
    And I should see <back link>
    
    Examples:
       |   link           |       title                         |         back link |
       |  "forms.edit"    |  "titles.editing#{Banner}"          |  "forms.cancel"   |
       |  "forms.new"     |  "titles.new#{Banner}"              |  "forms.cancel"   |
      
  Scenario: Creating a banner
    Given I am a registered user with email "test@test.com"
    And I login with valid credentials
    And I go to the banners page
    And I follow "forms.new"
    And I fill in "banner_name" with "first banner"
    And I upload a valid file to "banner_graphic"
    When I press "forms.create"
    Then I should see "messages.successful_create#{Banner}"

  Scenario: Updating a banner
    Given I am a registered user with email "test@test.com"
    And I login with valid credentials
    And the following banners exists:
       |  name  |
       |  ban1  |
    And I go to the banners page
    And I follow "forms.edit"
    And I fill in "banner_name" with "first banner"
    When I press "forms.update"
    Then I should see "messages.successful_update#{Banner}"
    And I go to the banners page
    Then I should see "first banner"
