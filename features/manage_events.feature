Feature: Manage events
  In order to Manage events
  User
  wants to create new events
  
  Background:
    Given I am logged in as organizer
  
  Scenario: Register new event
    Given I am on the new event page
    When I fill in "Title" with "Rails event"
    And I fill in "Start at" with "4 May, 2012 10:00"
    And I fill in "End at" with "5 May, 2012 11:30"
    And I fill in "Description" with "description 1"
    And I check "Published"
    And I press "Create Event"
    Then I should see "Rails event"
    And I should see "2012-05-04"
    And I should see "2012-05-05"
    And I should see "description 1"
    And I should see "true"

  Scenario: Delete event
    Given the following events:
      |title|start_at|end_at|description|published|
      |title 1|2012-05-04|2012-05-05|description 1|false|
      |title 2|2012-05-04|2012-05-06|description 2|true|
      |title 3|2012-05-04|2012-05-07|description 3|false|
      |title 4|2012-05-04|2012-05-08|description 4|true|
    When I delete the 3rd event
    Then I should see the following events:
      |Title|Start at|End at|Description|Published|
      |title 1|2012-05-04|2012-05-05|description 1|false|
      |title 2|2012-05-04|2012-05-06|description 2|true|
      |title 4|2012-05-04|2012-05-08|description 4|true|