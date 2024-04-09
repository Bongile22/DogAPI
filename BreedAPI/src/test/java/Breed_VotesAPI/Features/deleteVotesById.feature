Feature:
  Background:
    * url URL
    * header x-api-key = TOKEN

    @TagOne
  Scenario Outline: deletes existing vote by id
    * def voteId = <VoteID>
    * def getVoteResponse = call read('generic_getVotesById.feature') { voteId: '#(voteId)' }
    * match getVoteResponse.response status == <Status>
    * match getVoteResponse.response.value == <VoteID>
    * match getVoteResponse.response.image_id == <ImageID>

    * def expectedDeletedId = voteId
    * def deletedIds = karate.map(response, function(item){ return item.id })
    * print 'DELETED' + deletedIds + expectedDeletedId
    * match deletedIds contains expectedDeletedId

    Examples:
      |VoteID  |Value  |ImageId|SubId          |Status|
      |194380  |2      |  asf3 |'my-user-1234' |201   |
      #|194383  |  ''   | 'asf' |'my-user-1234' |200   |
      #|194384  |'4'    |asf2   | my-user-1234  |200   |

  @TagTwo
  Scenario Outline: deletes non-existing vote by id
    * def voteId = <VoteID>
    * def getVoteResponse = call read('classpath:Breed_VotesAPI/generics/generic_getVotesById.feature') { voteId: '#(voteId)' }
    * match getVoteResponse.response status == <Status>
    * match getVoteResponse.response.value == <VoteID>
    * match getVoteResponse.response.image_id == <ImageID>

    Examples:
      |VoteID  |Value  |ImageId|SubId          |Status|
      |112266  |2      |  asf3 |'my-user-1234' |404   |
      |225588  |  ''   | 'asf' |'my-user-1234' |404   |
      |332255  |'4'    |asf2   | my-user-1234  |404   |