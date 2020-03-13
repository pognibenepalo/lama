Feature: Main screen validation

  Scenario: When I launch the app I should have the default word
      When I click on "gesture0"
      And I click on "gesture0"
      And I click on "gesture0"
      Then I should have a field "wordDesc0" with the value "a small animal with fur, four legs, a tail, and claws, usually kept as a pet or for catching mice"
      Then I should have a field "wordQuote0" with the value "My cat likes dozing in front of the fire."
