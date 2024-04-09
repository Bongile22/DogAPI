Feature:
  Background:
    * url URL
    * header x-api-key = TOKEN

  @TagTwo
  Scenario: gets a limited number of dog images
    Given path '/v1/images'
    And params { limit: 10, page: 1, order: 'DESC' }
    When method get
    Then status 200
    And def limitResponse = response
    * match limitResponse != null
    * match limitResponse.meta.pagination.page == 1

  * call read ('postImages.feature@TagThree')
