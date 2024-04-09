Feature:

  Background:
    * url URL
    * header x-api-key = TOKEN
    * header Content-Type = 'application/json'

  @TagOne
  Scenario Outline: positive tests of the vote was created
    * def inputData = <VoteID>
    * def getVoteResponse = call read('classpath:Breed_VotesAPI/generics/generic_getVotesById.feature') {'voteId' : '#(inputData)'}
    * match getVoteResponse.responseStatus == OK
    * match getVoteResponse.response.id == inputData
    * match getVoteResponse.response.image_id == <ImageID>
    * match getVoteResponse.response.sub_id == <SubId>

    Examples:
      |VoteID  |Value  |ImageId|SubId          |Status|
      |195354  |2      |  asf3 |'my-user-1234' |200   |
      |194584  |  ''   | 'asf' |'my-user-1234' |200   |
      |194585  |'4'    |asf2   | my-user-1234  |200   |

  @TagTwo
  Scenario Outline: negative tests if the vote was created
    * def voteId = <VoteID>
    * def getVoteResponse = call read('generic_getVotesById.feature') { 'voteId': '#(voteId)' }
    * match getVoteResponse.responseStatus == <Status>
    * match getVoteResponse.response.id == <VoteID>
    * match getVoteResponse.response.image_id == <ImageID>
    * match getVoteResponse.response.sub_id == <SubId>

    Examples:
      |VoteID  |Value  |ImageId|SubId          |Status|
      |243655  |1      |'asf2' |'my-user-1234' |404   |
      |123645  |'3'    | 'asf' |'my-user-1234' |404   |
