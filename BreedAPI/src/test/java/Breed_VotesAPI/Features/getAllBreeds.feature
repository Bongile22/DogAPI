Feature:
  Background:
    * url URL
    * def headers = {'x-api-key': TOKEN, 'Content-Type': C_TYPE}

  Scenario Outline: retreives all dog breeds
    * def json =
    """
      {
        "weight": {
          "imperial": "6 - 13",
          "metric": "3 - 6"
        },
        "height": {
          "imperial": "9 - 11.5",
          "metric": "23 - 29"
        },
        "id": 1,
        "name": "Affenpinscher",
        "bred_for": "Small rodent hunting, lapdog",
        "breed_group": "Toy",
        "life_span": "10 - 12 years",
        "temperament": "Stubborn, Curious, Playful, Adventurous, Active, Fun-loving",
        "origin": "Germany, France",
        "reference_image_id": "BJa4kxc4X"
      }
      """
    Given path '/breeds'
    And params limit = <Limit>, page = <Page>
    When method get
    Then status <Status>
    * def brID = response[3].id
    * def responseJsonString = karate.eval('JSON.stringify(response)')
    * def responseJson = JSON.parse(responseJsonString)
    * match response != null
    * match json == responseJson[0]

    * def brIdString = brID + ''
    * def callGetBreedById = call read('classpath:Breed_VotesAPI/generics/generic_getBreedById.feature'){ 'breedId': '#(brIdString)'}

    # converts the response object to a JSON string
#    * def responseJsonString = karate.eval('JSON.stringify(response)')
#    * def responseJson = JSON.parse(responseJsonString)
    * match responseJson[3].id == brID
    * print 'AAAAAAAAAAa' + responseJson[3].id
    * match callGetBreedById.responseStatus == OK

    * def callTestGetBreedById = call read('getBreedById.feature')
    #* match callTestGetBreedById.responseStatus == OK

    * def callCreateVotes =  call read('createVotes.feature@TagOne')
    * match callCreateVotes.responseStatus == BAD_REQUEST

    * def callCreateVotes =  call read('createVotes.feature@TagTwo')
    * match callCreateVotes.responseStatus == CREATED


    Examples:
      |Limit|Page|Status|
      |5    |0   |200   |
      |5    |''  |200   |
      |''   |1   |200   |
      |''   |''  |200   |
      |'5'  |'0' |200   |
      |3    |'1' |200   |
      |'4'  | 1  |200   |