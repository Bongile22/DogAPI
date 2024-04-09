Feature:
  Background:
    * url URL
    * header x-api-key = TOKEN

  Scenario: gets all the votes created
    Given path '/votes'
    When method get
