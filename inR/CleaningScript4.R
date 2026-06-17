library(tidyverse)
setwd('/Users/camsmithers/Desktop/Camalytics/NBA')
og_player_box <- readRDS(
    'Data-NBA/Original-2025/full_box_player_updated.rds')
add_player_box_2526 <- readRDS(
    'Data-NBA/Adding-2526/full_box_player_2526.rds')

add_player_box_2526 <- add_player_box_2526 %>%
    mutate(season = 2026)

full_box_player_updated <- rbind(og_player_box, add_player_box_2526)

saveRDS(
    full_box_player_updated,
    file = 
        'Data-NBA/Current/full_box_player_current.rds')

og_team_season_stats <- readRDS(
    'Data-NBA/Original-2025/team_season_stats_updated.rds')
add_team_season_stats_2526 <- readRDS(
    'Data-NBA/Adding-2526/team_season_stats_2526.rds')

team_season_stats_updated <- rbind(og_team_season_stats, 
                                   add_team_season_stats_2526)

saveRDS(
    team_season_stats_updated,
    file = 'Data-NBA/Current/team_season_stats_current.rds')

og_player_full_stats <-readRDS(
    'Data-NBA/Original-2025/player_season_stats_updated.rds')

add_player_rgsn_stats <- readRDS(
    'Data-NBA/Adding-2526/plyr_regsn_stats_2526.rds')

add_player_pstsn_stats <- readRDS(
    'Data-NBA/Adding-2526/plyr_pstsn_stats_2526.rds')

#full_og_player_stats <- og_player_full_stats %>%
#    left_join(og_player_pstsn_stats, by = c('year','team','name'))

full_add_player_stats <- add_player_rgsn_stats %>%
    left_join(add_player_pstsn_stats, by = c('year','team','name'))

player_season_stats_updated <- rbind(og_player_full_stats, 
                                     full_add_player_stats)

saveRDS(
    player_season_stats_updated,
    file = 'Data-NBA/Current/player_season_stats_current.rds')
