Feature:
  Background:
    * url URL
    * header x-api-key = TOKEN

  @TagFive
    Scenario Outline:
    * def imgId = $id
    * def updateImage =
      """
      {
        "breed_id": <BreedNo>
      }
      """
    Given path '/v1/images/' + imgId
    And request updateImage
    When method patch
    And status 204
    * match response.breed_Id == <BreedNo>

      * call read(deleteByImage_BreedId.feature){ 'imgId': '#(imageId)', 'brNo': '#(<BreedNo>)' }

      Examples:
        |BreedNo|
        |10     |