Feature: delete test

  Background:
    * url URL
    * header x-api-key = TOKEN

  @TagFour
  Scenario: delete image without a body using response id
    * def id = $imgId
    Given path '/v1/images/' + id
    When method delete
    Then status 200
    * match response == ''
    * def expectedDeletedId = id
    * def deletedIds = karate.map(response, function(item){ return item.id })
    * match deletedIds contains expectedDeletedId

    * call read('updateImagesBreedId.feature@TagFive'){ id: '(#id)' }