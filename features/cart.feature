Feature: Cart feature which can store the folders that users want to download

Scenario: The user can add the folder into the cart
    Given The user is on the main page
    When The user enters "soviet" in the search bar
    And The user clicks search button
    And The user clicks add button of a first folder
    Then A yellow notice that says "The folder is added to your cart!" is seen below the navigation bar
    And The user should see "Soviet Power Collapse in Eastern Europe - Strategic Arms Control (June 1990)" in the cart
    
Scenario: The user can remove the folder from the cart
    Given The user is on the main page
    When The user enters "soviet" in the search bar
    And The user clicks search button
    And The user clicks add button of a first folder
    And The user clicks the Cart button in the navigation bar
    And The user clicks remove button of the folder in the cart.
    Then The user should not see "Soviet Power Collapse in Eastern Europe - Strategic Arms Control (June 1990)" in the cart
    And A yellow notice that says "The folder is removed from your cart!" is seen below the navigation bar


    