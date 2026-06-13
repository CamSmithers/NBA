#namecheck <- data.frame(unique(player_box_scores$name))
playoffcheck <- team_box_scores_3 %>%
    select(gamedate, gametype)