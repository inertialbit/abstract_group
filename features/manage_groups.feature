Feature: Manage groups

  Scenario: create a new group
    Given I am on the groups page
    When I follow "Create New Group"
    And I fill in "Name" with "New Group"
    And I press "Create Group"
    Then I should see "Group successfully created!"
    
  Scenario: create a new sub-group
    Given I am on the groups page
    When I follow "Create New Group"
    And I select "Groupie Group" from "Group"
    And I fill in "Name" with "New Group"
    And I press "Create Group"
    Then I should see "Group successfully created!"
    
  Scenario: update a group
    Given I am on the groups page
    When I follow "edit" within "table.nice_table>tbody>tr:first-child"
    And I fill in "Name" with "Updated Group"
    And I press "Update Group"
    Then I should see "Group successfully updated!"
    
  Scenario: delete a group
    Given I am on the groups page
    When I follow "delete" within "table.nice_table>tbody>tr:first-child"
    Then I should see "Group deleted."