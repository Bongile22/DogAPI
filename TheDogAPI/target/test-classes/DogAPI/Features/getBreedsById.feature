Feature:

  Background:
    * url URL
    * header x-api-key = TOKEN

  Scenario: get image by breed id
    Given path '/v1/images' + $breedID
    And param sub_id = 'Images'
    When method get
