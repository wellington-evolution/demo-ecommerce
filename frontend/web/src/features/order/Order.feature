Feature: Order management
  Scenario: View cart and update quantities
    Given I am on the Order Page
    When I increase the quantity of an item
    Then the cart should update the item quantity

    When I decrease the quantity of an item
    Then the cart should update the item quantity

  Scenario: Remove item from cart
    Given I am on the Order Page
    When I remove an item from the cart
    Then the item should no longer appear in the cart

  Scenario: Apply coupon code
    Given I am on the Order Page
    When I attach a coupon code
    Then the discount should be applied to the order

  Scenario: Proceed to payment
    Given I am on the Order Page
    When I click "Buy"
    Then I should be redirected to the Payment Page
