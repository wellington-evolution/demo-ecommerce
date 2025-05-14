Feature: Cart management
  Scenario: Add item to cart from Items Page
    Given I am on the Items Page
    When I click "Add to Cart" on an item
    Then the item should appear in my cart
