library(tidyverse)
setwd('/Users/camsmithers/Desktop/Camalytics/NBA')
#-----------------Team Box Scores------------------------#
og_team_box <- readRDS(
    'Data-NBA/Original-2025/team_box_scores_updated.rds')
add_team_box_2526 <- readRDS(
    'Data-NBA/Adding-2526/team_box_scores_2526.rds')

team_box_scores_updated <- rbind(og_team_box, 
                                 add_team_box_2526)

saveRDS(
    team_box_scores_updated,
    file = 'Data-NBA/Current/team_box_scores_current.rds')

#-----------------Team Season Statistics-----------------#
og_team_season_stats <- readRDS(
    'Data-NBA/Original-2025/team_season_stats_updated.rds')
add_team_season_stats_2526 <- readRDS(
    'Data-NBA/Adding-2526/team_season_stats_2526.rds')

team_season_stats_updated <- rbind(og_team_season_stats, 
                                   add_team_season_stats_2526)

saveRDS(
    team_season_stats_updated,
    file = 'Data-NBA/Current/team_season_stats_current.rds')

#--------------Player Box Scores--------------------------#
og_player_box <- readRDS(
    'Data-NBA/Original-2025/full_box_player_updated.rds')
add_player_box_2526 <- readRDS(
    'Data-NBA/Adding-2526/full_box_player_2526.rds')



full_box_player_updated <- rbind(og_player_box, add_player_box_2526)

saveRDS(
    full_box_player_updated,
    file = 
        'Data-NBA/Current/full_box_player_current.rds')

#-------------Player Season Statistics------------------#
og_player_full_stats <-readRDS(
    'Data-NBA/Original-2025/player_season_stats_updated.rds')

add_player_rgsn_stats <- readRDS(
    'Data-NBA/Adding-2526/plyr_regsn_stats_2526.rds')

add_player_pstsn_stats <- readRDS(
    'Data-NBA/Adding-2526/plyr_pstsn_stats_2526.rds')

full_add_player_stats <- add_player_rgsn_stats %>%
    left_join(add_player_pstsn_stats, by = c('year','team','name')) %>%
    mutate(year = 2026)

player_season_stats_updated <- rbind(og_player_full_stats, 
                                     full_add_player_stats)

saveRDS(
    player_season_stats_updated,
    file = 'Data-NBA/Current/player_season_stats_current.rds')