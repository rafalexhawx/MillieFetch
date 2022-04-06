Feature: Prompt for valid query, incase the user enters invalid query at first
    
    Given the user is on the MilleFetch main page
    When they enter an invalid query (blacnk or whitespaces)
    Then the user should be prompted to try again with valid query


    Scenario: Prompt to enter a valid query, incase they searched without enterting anything the first time
        Given I am on the main page
        When I click search
        #Then I should see the message "Enter valid query"
        #And I should be redirected to the main page
        Then I should be redirected to the main page
        And I should be prompted "Enter valid query"

    Scenario: Prompt to enter a valid query, incase the user searches with a whitespace query the first time
        Given I am on the main page
        When I enter "     " in the search bar
        And I click search
        Then I should be redirected to the main page
        And I should be prompted "Enter valid query"
        