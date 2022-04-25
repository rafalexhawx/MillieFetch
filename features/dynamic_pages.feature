Feature: Paginate the search results into various pages

    Given I am on the main page
    So that I can easily navigate through various search results
    I should see the search results, corresponding to my search query, paginated



Scenario: Should be able to nagivate across various pages
    Given I am on the main page
    When I enter "soviet's loss of power in eastern europe" in the search bar
    And I click search
    Then I should be redirected to "search" page
    And I should land by default in page 1
    When I click "Next" button on the page navigator
    Then I should see the "search" page with page 2 results
    When I click "Last" button on the page navigator
    Then I should see the "search" page with page 4 results
    When I click "Prev" button on the page navigator
    Then I should see the "search" page with page 3 results
    When I click "First" button on the page navigator
    Then I should be on the "search" page with page 1 results

    



