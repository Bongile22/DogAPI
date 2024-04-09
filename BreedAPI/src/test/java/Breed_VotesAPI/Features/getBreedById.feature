Feature:

  Background:
    * url URL
    * def headers = { 'x-api-key': TOKEN, 'Content-Type': C_TYPE }

  Scenario Outline: tests if the vote was created
    * def brId = <BreedID>
    * def brIdString = brId +''
    * def getBreedResponse = call read('classpath:Breed_VotesAPI/generics/generic_getBreedById.feature'){ 'breedId': '#(brIdString)'}
    * match responseJson[3].id == brID
    * match getBreedResponse.responseStatus == <Status>

    Examples:
      |BreedID|Status|
      |4      |200   |
      #|   ''  |400   |
      #|"3"    |400   |