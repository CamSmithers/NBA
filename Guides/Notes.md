# Notes

## Shiny
Running Shiny in Browser
* `shiny run --reload --launch-browser app_dir/app.py`
  * The `--reload` flag enables automatic reloading. When you save changes to your source files, the app will automatically restart and update in the browser.
  * The `--launch-browser` flag opens the app in a browser as soon as it starts.

## R Programming
Checking for Observations in Another Dataframe Using Multiple Columns
* I'm trying to code an outcome variable that determines whether a team won or lost based on their best player's availability. I'm trying to use this variable to determine whether the best player missing a game has a statistically significant impact on its outcome.
* An issue I was having was using `%in%` to check if dates and player names were in another data set. The main issue with this is that it checks one by one not simultaneously. For instance the date could be there for another player while the player name I need is in there, which would create a false positive.
* A fix for this is to create a unique string for each best player (by a specific metric), this will allow me to only check one column to determin if the string is there. Doing it this way also allows for me to perform more accurate checks (can't do major checks the data set is too large to comb through row-by-row).
  * Ex: metric_season_team_playerid_gamedate = per_2023_TOR_513_2022-12-07
    1. PER: Player Efficiency Rating is the metric
    2. 2023: This is the year the season will end
    3. Team: Is the name of the team the player is currently on
    4. 513: This is the best player metric id for that specific season
    5. 2022-12-07: December 12th, 2022 is the date

## Python