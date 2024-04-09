Feature: delete test
  Background:
    * url URL
    * header x-api-key = TOKEN

  @TagOne
  Scenario: delete image without a body using response image & breed id
    * def id = $imgId
    * def bId = $brNo
    Given path '/v1/images' + id + bId
    When method delete
    Then status 200
    * def expectedDeletedId = <ExpectedDeletedId>
    * def deletedIds = karate.map(response, function(item){ return item.id })
    * match deletedIds contains expectedDeletedId
    * match response == null