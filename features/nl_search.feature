Feature: Search folders relevant to a topic

    Given I am on the main page
    So that I find relevant information to a seach topic of interest
    I should be able to enter the query and search to see relevant results



Scenario: Show all the folder names related to Donald Trump's Foreign policy
    Given I am on the main page
    When I enter "soviet's loss of power in eastern europe" in the search bar
    And I click search
    Then I should be redirected to "search" page
    And I should see "Soviet Power Collapse in Eastern Europe - Strategic  Arms Control (June 1990)"
    And I should see "USSR Collapse: U.S - Soviet Relations Thru 1991 (October 1990)"
    And I should see "Soviet Power Collapse in Eastern Europe (July - August 1990)" names listed in the results
    And I should not see "Presidential Meetings - Memorandum of Conversations 05/03/91 - 06/28/91"
    And I should not see "Desert Shield/Desert Storm (August 1990) Part I" names in the results
