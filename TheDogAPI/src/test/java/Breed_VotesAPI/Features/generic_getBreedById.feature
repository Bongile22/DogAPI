Feature:
  Background:
    * url URL
    *  header x-api-key = TOKEN

  Scenario:
    * def brId = $breedId
    Given path '/breeds/' + brId
    When method get