Feature: Merge Articles
  As a admin of my blog
  In order to merge the contents and comments of two articles
  I want to merge two articles into one article

  Background:
    Given the blog is set up
    Given the following article exists:
        | title | author | body           | published | id  |
        | sang  | me     | awesome blog   | t         | 3   |
        | bye   | you    | byebye         | t         | 4   |
        | 3rd   | nobody | noone          | t         | 5   |
        | 4th   | fourth | nothing        | t         | 6   |
        | hi    | fifth  | ppppp          | t         | 7   |

  Scenario: A blog admin can merge two articles into one
    Given I am logged into the admin panel
    And I am on the admin content page
    And I follow "sang"
    Then I should see "Merge Articles"

  Scenario: General user cannot make merges
    Given I am logged into the admin panel
    Then I follow "Users"
    And I follow "New User"
    And I fill in "user_login" with "sangyoon"
    And I fill in "user_password" with "1111"
    And I fill in "Password confirmation" with "1111"
    And I fill in "user_email" with "user@user.com"
    And I select "Blog publisher" from "user[profile_id]"
    And I fill in "user_firstname" with "Sangyoon"
    And I fill in "user_lastname" with "Park"
    And I fill in "user_nickname" with "Sang"
    And I press "Save"
    And I follow "Log out"    


  Scenario: Merged article should have both article's combined bodies
    Given I am logged into the admin panel 
    And I am on the admin content page
    Then I follow "sang"
    When I fill in "merge_with" with "4"
    And I press "Merge"
    Then I should be on the admin content page
    Then I follow "sang"
    And I should see "awesome blog"
    And I should see "byebye"
  
  Scenario: Merged article should have one author (of original article)
    Given I am logged into the admin panel 
    And I am on the admin content page
    Then I follow "sang"
    When I fill in "merge_with" with "5"
    And I press "Merge"
    Then I should be on the admin content page
    And I should see "me"
    And I should not see "nobody"

  Scenario: Comments on each of the two original articles need to all carry over and point to the new, merged article.
#    Given I am logged into the admin panel
#    And I am on the admin content page
#    Then I follow "4th"
#    And I follow "Preview"
#    Then I fill in "comment_author" with "iamcommentauthor"
#    And I fill in "comment_email" with "eee@test.com"
#    And I fill in "comment_url" with "no.url"
#    And I fill in "comment_body" with "this is comment body"
#    Then I press "form-submit-button"
#    And I am on the admin content page
#    Then I follow "sang"
#    When I fill in "merge_with" with "6"
#    And I press "Merge"
#    Then I am on the admin content page
#    And I follow "sang"
#    And I follow "Preview"
#    Then I should see "this is comment body"

  Scenario: The title of the new article should be the title from either one of the merged articles.
    Given I am logged into the admin panel 
    Then I am on the admin content page
    When I follow "sang"
    And I fill in "merge_with" with "7"
    And I press "Merge"
    Then I should be on the admin content page
    And I should see "sang"
    And I should not see "hi"
