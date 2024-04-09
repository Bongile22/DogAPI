Feature:
Feature:
  Background:
    * url URL
    * header x-api-key = TOKEN
Scenario:
  Given path 'votes/' + 195348
  When method get
  Then status 200
  * def responseJsonString = karate.eval('JSON.stringify(response)')
  * def responseJson = JSON.parse(responseJsonString)
  * print 'RRRRRRRRRR' + responseJsonString
