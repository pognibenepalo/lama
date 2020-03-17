Feature: Main screen validation

  Scenario: When I launch the app I should have the default word from today
      When I click on "gesture0"
      And I click on "gesture0"
      And I click on "gesture0"
      Then I should have a field "wordDesc0" with the value "a small animal with fur, four legs, a tail, and claws, usually kept as a pet or for catching mice"
      Then I should have a field "wordQuote0" with the value "My cat likes dozing in front of the fire."
      Then I should see the date of the current day

  Scenario: A user should be able to add a new word
      Given I click on "addTextButton"
      When I put the text "Hello" on the field "newWordInput"
      And I put the text "Hello is the greeting word" on the field "newDefinitionInput"
      And I put the text "Hello World !!!" on the field "newQuoteInput"
      And I click on "saveButton"
      Then I should have a field "word1" with the value "Hello"