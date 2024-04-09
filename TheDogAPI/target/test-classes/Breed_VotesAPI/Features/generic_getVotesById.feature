Feature:
  Background:
    * url URL
    * header x-api-key = TOKEN

  Scenario: gets the id of the breed
   #* def voteID = $voteId
    * def jsonId = {voteID: $voteId}

    * print 'OGGGGGGGGG' + voteId

    Given path '/votes/' , voteId

    When method get

    * print 'RRRRRRRRRR' + response