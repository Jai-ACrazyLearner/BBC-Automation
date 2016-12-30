Feature: list of networks and stations
  AS A user
  I WANT to be naviagted to right source of link with my choice of network
  So THAT I can easily find what I am looking for

  Scenario: Selecting Local Radio displays all local stations links
    Given I can see the radio nav
    When I select "Stations" in the radio nav
    Then I can see the radio stations with following links
      | stations                  | links                                  |
      | Radio 1                   | http://www.bbc.co.uk/radio1            |
      | Radio 1Xtra               | http://www.bbc.co.uk/1xtra             |
      | Radio 2                   | http://www.bbc.co.uk/radio2            |
      | Radio 3                   | http://www.bbc.co.uk/radio3            |
      | Radio 4                   | http://www.bbc.co.uk/radio4            |
      | Radio 4 Extra             | http://www.bbc.co.uk/radio4extra       |
      | Radio 5 live              | http://www.bbc.co.uk/5live             |
      | Radio 5 live sports extra | http://www.bbc.co.uk/5livesportsextra  |
      | Radio 6 Music             | http://www.bbc.co.uk/6music            |
      | Asian Network             | http://www.bbc.co.uk/asiannetwork      |
      | World Service             | http://www.bbc.co.uk/worldserviceradio |
      | Radio Scotland            | http://www.bbc.co.uk/radioscotland     |
      | Radio nan Gàidheal        | http://www.bbc.co.uk/radionangaidheal  |
      | Radio Ulster              | http://www.bbc.co.uk/radioulster       |
      | Radio Foyle               | http://www.bbc.co.uk/radiofoyle        |
      | Radio Wales               | http://www.bbc.co.uk/radiowales        |
      | Radio Cymru               | http://www.bbc.co.uk/radiocymru        |
      | Local Radio               | http://www.bbc.co.uk/radio/stations    |
    When I select Local Radio in the stations drawer
    And I am on the all stations page
    Then I can see the following local networks
      | BBC Radio Berkshire         |
      | BBC Radio Bristol           |
      | BBC Radio Cambridgeshire    |
      | BBC Radio Cornwall          |
      | BBC Coventry & Warwickshire |
      | BBC Radio Cumbria           |
      | BBC Radio Derby             |
      | BBC Radio Devon             |
      | BBC Essex                   |
      | BBC Radio Gloucestershire   |
      | BBC Radio Guernsey          |
      | BBC Hereford & Worcester    |
      | BBC Radio Humberside        |
      | BBC Radio Jersey            |
      | BBC Radio Kent              |
      | BBC Radio Lancashire        |
      | BBC Radio Leeds             |
      | BBC Radio Leicester         |
      | BBC Radio Lincolnshire      |
      | BBC Radio London            |
      | BBC Radio Manchester        |
      | BBC Radio Merseyside        |
      | BBC Newcastle               |
      | BBC Radio Norfolk           |
      | BBC Radio Northampton       |
      | BBC Radio Nottingham        |
      | BBC Radio Oxford            |
      | BBC Radio Sheffield         |
      | BBC Radio Shropshire        |
      | BBC Radio Solent            |
      | BBC Somerset                |
      | BBC Radio Stoke             |
      | BBC Radio Suffolk           |
      | BBC Surrey                  |
      | BBC Sussex                  |
      | BBC Tees                    |
      | BBC Three Counties Radio    |
      | BBC Wiltshire               |
      | BBC WM 95.6                 |
      | BBC Radio York              |

@bbc_stations_list
  Scenario Outline: On click on the network should redirect ot correct URL
    Given I can see the radio nav
    When I select "Stations" in the radio nav
    And I select "<network>" in the stations drawer
    Then I am on the following "<page>"
    Examples:
      | network                   | page                                   |
      | Radio 1                   | http://www.bbc.co.uk/radio1            |
      | Radio 1Xtra               | http://www.bbc.co.uk/1xtra             |
      | Radio 2                   | http://www.bbc.co.uk/radio2            |
      | Radio 3                   | http://www.bbc.co.uk/radio3            |
      | Radio 4                   | http://www.bbc.co.uk/radio4            |
      | Radio 4 Extra             | http://www.bbc.co.uk/radio4extra       |
      | Radio 5 live              | http://www.bbc.co.uk/5live             |
      | Radio 5 live sports extra | http://www.bbc.co.uk/5livesportsextra  |
      | Radio 6 Music             | http://www.bbc.co.uk/6music            |
      | Asian Network             | http://www.bbc.co.uk/asiannetwork      |
      | World Service             | http://www.bbc.co.uk/worldserviceradio |
      | Radio Scotland            | http://www.bbc.co.uk/radioscotland     |
      | Radio nan Gàidheal        | http://www.bbc.co.uk/radionangaidheal  |
      | Radio Ulster              | http://www.bbc.co.uk/radioulster       |
      | Radio Foyle               | http://www.bbc.co.uk/radiofoyle        |
      | Radio Wales               | http://www.bbc.co.uk/radiowales        |
      | Radio Cymru               | http://www.bbc.co.uk/radiocymru        |
      | Local Radio               | http://www.bbc.co.uk/radio/stations    |

@jai
  Scenario: Clicking on iPlayer Radio logo redirects to the radio homepage
    Given I navigated to all stations page
    When I click on the iPlayer Radio logo
    Then I should be on the radio homepage




