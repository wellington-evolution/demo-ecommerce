Feature: Item management
  Scenario: View item details from Items Page
    Given I am on the Items Page
    When I select an item
    Then I should see the Item Details Page with all item data

  Scenario: Add item to cart from Item Details Page
    Given I am on the Item Details Page
    When I click "Add to Cart"
    Then the item should be added to my cart

  Scenario: Buy item from Item Details Page
    Given I am on the Item Details Page
    When I click "Buy"
    Then the item should be added to my cart and I should be redirected to the Order Page
