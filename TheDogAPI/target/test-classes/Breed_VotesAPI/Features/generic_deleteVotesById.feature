Feature: delete test
  Background:
    * url URL
    * header x-api-key = TOKEN

  Scenario: deletes vote by id
    * def voteID = $voteId
    Given path '/votes' + voteID
    When method delete