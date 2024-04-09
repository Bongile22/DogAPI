Feature:
  Background:
    * url URL
    * header x-api-key = TOKEN
    #* def headerParams = { 'x-api-key': TOKEN,'Content-Type': C_TYPE}

    @TagOne
    Scenario Outline: creates votes for negative tests
      * def votes =
        """
        {
          "value": <VoteId>,
          "image_id": <ImageId>,
          "sub_id": <SubId>
        }
        """
      Given path '/votes'
      And request votes
      When method post
      Then status <Status>

  #Add tests with incorrect data types & values
      Examples:
        |VoteId |ImageId|SubId          |Status|
        |3      |  ''   |'my-user-1234' |400   |
        |       |  ''   |'my-user-1234' |400   |
        |4      |  ''   |    ''         |400   |
        |       |'asf2' |''             |400   |
        |       |''     |''             |400   |
        |       |'asf2' |''             |400   |
        |       |''     |''             |400   |

  @TagTwo
  Scenario Outline: creates votes for positive tests
    #        "value": '#(karate.assertPresent(vId: <VoteId>))',
    #        "image_id": '#(karate.assertPresent(imgId: <ImageId>))',
    #        "sub_id": <SubId>
    * def votes =
      """
      {
        "value": <VoteId>,
        "image_id": <ImageId>,
        "sub_id": <SubId>
      }
      """
    Given path '/votes'
    And request votes
    When method post
    Then status <Status>
    * def resId = response.id
    * def voteIdString = resId + ''

    * match response contains { message: 'SUCCESS', value: <VoteId>, image_id: <ImageId> }
    * print 'IDDDDD' + response.id

    * def callGetAllVotes = call read('getAllVotes.feature')
    * match callGetAllVotes.responseStatus == OK

    #* def callGetVotesById = call read('generic_getVotesById.feature'){ voteId: '#(voteIdString)' }
    #* match callGetVotesById.responseStatus == OK
    #* match callGetVotesById.response.id == resId

    #* def callTestGetVotesById = call read('getVotesById.feature@TagOne')
   # * match callTestGetVotesById.responseStatus == OK

    #* def callTestGetVotesById = call read('getVotesById.feature@TagTwo')
    #* match callTestGetVotesById.responseStatus == NOT_FOUND

#    * def callDelVoteById = call read('generic_deleteVotesById.feature') { voteId: '#(voteIdString)' }
#    * match callDelVoteById.response status == NO_CONTENT
#    * match callDelVoteById.response.id == resId
#    * match callDelVoteById.response == null
#
#    * def testDelVoteById = call read('deleteVotesById.feature@TagOne')
#    * match testDelVoteById.response status == NO_CONTENT
#
#    * def testDelVoteById = call read('deleteVotesById.feature@TagTwo')
#    * match testDelVoteById.response status == NOT_FOUND

    Examples:
      |VoteId |ImageId|SubId          |Status|
      |1      |'asf2' |'my-user-1234' |  201 |
      |2      |  asf3 |'my-user-1234' |  201 |
      |'3'    | 'asf' |'my-user-1234' |  201 |
      |  ''   | 'asf' |'my-user-1234' |  201 |
      |'4'    |  asf2 | my-user-1234  |  201 |

