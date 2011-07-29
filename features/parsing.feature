Feature: Parsing day class labels
  In order to know which days given label represent
  As a library user
  I want to parse strings

  Scenario Outline:
    Given label "<label>"
    When we are interested only in holidays between 1.04.2011 and 1.05.2011
    Then the weekdays should be "<weekdays>"
      And the holidays should be "<holidays>"

    Examples:
      | label                    | weekdays  | holidays              |
      | Dni Powszednie           | 1,2,3,4,5 |                       |
      | Soboty                   | 6         |                       |
      | Niedziele i Święta       | 0         | 24.04.2011,25.04.2011 |
      | Wielkanoc                |           | 24.04.2011,25.04.2011 |
      | Poniedziałek Wielkanocny |           | 25.04.2011            |
