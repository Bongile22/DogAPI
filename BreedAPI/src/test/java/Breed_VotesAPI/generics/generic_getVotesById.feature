Feature:
  Background:
    * url URL
    * header x-api-key = TOKEN

  Scenario: gets the id of the vote
    Given path 'votes/', voteId
    When method get
