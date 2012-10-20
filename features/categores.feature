Feature: Categories add/edit
  As a admin of my blog
  In order to manage categories for articles
  I want to add/edit/delete categories for articles

  Background:
    Given the blog is set up    

  Scenario: A blog admin can create/edit a category
    Given I am logged into the admin panel
    And I follow "Categories"
    Then I should be going to new admin category page
    And I fill in "category_name" with "categorytest1"
    And I fill in "category_keywords" with "keyword1"
    And I fill in "category_permalink" with "perma1"
    And I fill in "category_description" with "this is a new category for test"
    And I press "Save"
    Then I should see "Category was successfully saved."
    And I should see "categorytest1"
    And I follow "categorytest1"
    Then I should see "this is a new category for test"
    And I fill in "category_name" with "edited_cate1"
    And I fill in "category_description" with "edited!! this is a new category for test"
    And I press "Save"
    Then I should see "Category was successfully saved."
    And I should see "edited_cate1"
    And I should not see "categorytest1"
