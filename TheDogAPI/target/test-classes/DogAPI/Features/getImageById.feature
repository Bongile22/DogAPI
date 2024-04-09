Feature: get test
  Background:
    * url URL
    * header x-api-key = TOKEN

  @TagOne
  Scenario: reads an image with sub_id
    * def imgId = $imageId
    Given path '/v1/images/' + imgId
    And param sub_id = 'Images'
    When method get
    Then status 200
    * match response.id == imgId
    * print 'BBBBBBBBBBBB'+response.id
    * call read('getLimitedImages.feature@TagTwo')