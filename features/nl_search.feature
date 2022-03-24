Feature: Search folders relevant to a topic

    Given I am on the main page
    So that I find relevant information to a seach topic of interest
    I should be able to enter the query and search to see relevant results

@wip

Scenario: Show all the folder names related to Donald Trump's Foreign policy
    Given I am on the main page
    When I enter "Trump's foreign policy" in the search bar
    And I click search
    Then I should be redirected to "search" page
    And I should see "Donald Trump's Foreign Policy"
    And I should see "President Donald J. Trump's Foreign Policy Puts America First"
    And I should see "The Hill: The Memo: Tillerson Flap Puts Spotlight ON TRUMP's FOreign POLICY moves" names listed in the results
    And I should not see "G20 SUbsidies TOK oil, gas and coal production china"
    And I should not see "U.S. views on global climate change" names in the results
