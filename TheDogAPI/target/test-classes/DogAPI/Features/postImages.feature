Feature:
  Background:
    * url URL
    * header x-api-key = TOKEN
    * header Content-Type = 'multipart/form-data'

  Scenario Outline: upload an image to the DogAPI

    Given path '/v1/images/upload'
    And multipart file file = { read: 'Images/Resources/Spotie.jpeg', filename: 'Spotie.jpeg', contentType: 'image/jpeg' }
    And multipart field sub_id = <SubID>
    And multipart field breed_Ids = <BreedID>
    When method post
    Then status 201
    * match response == [ { filename: 'Spotie.jpeg', contentType: 'image/jpeg'} ]
    And def id1 = response[0].id

    * call read('deleteImageById.feature@TagFour'){'imgId': '#(id1)'}

    Examples:
      |SubID   |BreedID|
      |'Images'| 10    |
      | ''     |       |


