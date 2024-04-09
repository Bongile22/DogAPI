Feature:
  Background:
  * url URL
  * header x-api-key = TOKEN

  Scenario: search for an image using different params
    Given path '/v1/images/search'
    And params {size: 'med', mime_types: 'jpg', format: 'json', limit: 2, page: 0, has_breeds: 1, order: 'RAND'}
    When method get
    Then status 200
    * match response != null
    * def response_data = response[0]
    * def imgId = response_data.breeds[0].reference_image_id
    * match response_data.breeds[0].bred_for != null
    * match response_data.breeds[0].name contains { name: 'American Staffordshire Terrier' }

    * call read('getImageById.feature@TagOne'){ 'imageId': '#(imgId)' }
