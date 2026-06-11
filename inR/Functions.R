library(tidyverse)
#Function Script
fixplayername <- function(dataset) {
    dataset %>%
        mutate(name = case_when(
            name == "Alen SmailagiÄ" |
                name == 'Alen SmailagiÃÂ' ~ "Alen Smailagic",
            name == "Alperen ÅengÃ¼n" | 
                name == "Alperen ÃÂengÃÂ¼n" |
                name == 'Alperen ÅengÃ¼n' ~ "Alperen Sengun",
            name == "AnÅ¾ejs PaseÄÅiks" |
                name == 'AnÃÂ¾ejs PaseÃÂÃÂiks' ~ "Anžejs Pasečņiks",
            name == "Anderson VarejÃ£o" | 
                name == 'Anderson VarejÃÂ£o'~ "Anderson Varejao",
            name == 'Armel TraorÃ©' ~ 'Armel Traoré',
            name == "Boban MarjanoviÄ" | 
                name == 'Boban MarjanoviÃÂ' ~ "Boban Marjanović",
            name == "Bogdan BogdanoviÄ" | 
                name == 'Bogdan BogdanoviÃÂ'~ "Bogdan Bogdanović",
            name == "Bojan BogdanoviÄ" | 
                name == "Bojan BogdanoviÃÂ" ~ "Bojan Bogdanović",
            name == "Cristiano FelÃ­cio" | 
                name == 'Cristiano FelÃÂ­cio' ~ "Cristiano Felicio",
            name == "Dario Å ariÄ" |
                name == 'Dario ÃÂ ariÃÂ' |
                name == 'Dario Å ariÄ' ~ "Dario Šarić", #No Fix
            name == "DÄvis BertÄns" | 
                name == 'DÃÂvis BertÃÂns'~ "Dāvis Bertāns",
            name == "Dennis SchrÃ¶der" | 
                name == 'Dennis SchrÃÂ¶der' ~ "Dennis Schröder",
            name == "Ersan Ä°lyasova" | 
                name == 'Ersan ÃÂ°lyasova'~ "Ersan Ilyasova",
            name == "Filip PetruÅ¡ev" |
                name == 'Filip PetruÃÂ¡ev'~ "Filip Petrusev",
            name == "Goran DragiÄ" | 
                name == 'Goran DragiÃÂ'~ "Goran Dragic",
            name == "Jonas ValanÄiÅ«nas" | 
                name == "Jonas ValanÃÂiÃÂ«nas" ~ "Jonas Valančiūnas",
            name == "Juancho HernangÃ³mez" |
                name == 'Juancho HernangÃÂ³mez'~ "Juancho Hernangomez",
            name == "Jusuf NurkiÄ" | 
                name == "Jusuf NurkiÃÂ" ~ "Jusuf Nurkić",
            name == "Karim ManÃ©" | 
                name == 'Karim ManÃÂ©'~ "Karim Mane",
            name == 'Karlo MatkoviÄ' ~ 'Karlo Matković',
            name == "Kristaps PorziÅÄ£is" | 
                name == "Kristaps PorziÃÂÃÂ£is"~ "Kristaps Porziņģis",
            name == "Lester QuiÃ±ones" | 
                name == 'Lester QuiÃÂ±ones'~ "Lester Quinones",
            name == "Luka Å amaniÄ" |
                name == 'Luka ÃÂ amaniÃÂ'~ "Luka Samanic", #No Fix?
            name == "Luka DonÄiÄ" | 
                name == "Luka DonÃÂiÃÂ" ~ "Luka Dončić",
            name == "MÃ£ozinha Pereira" | 
                name == 'MÃÂ£ozinha Pereira'~ "Maozinha Pereira",
            name == "Moussa DiabatÃ©" | 
                name == 'Moussa DiabatÃÂ©'~ "Moussa Diabaté",
            name == "NicolÃ² Melli" |
                name == 'NicolÃÂ² Melli'~ "Nicolo Melli",
            name == "Nikola JokiÄ" | 
                name == "Nikola JokiÃÂ" ~ "Nikola Jokić",
            name == "Nikola JoviÄ" | 
                name == 'Nikola JoviÃÂ'~ "Nikola Jović",
            name == "Nikola VuÄeviÄ" | 
                name == "Nikola VuÃÂeviÃÂ" ~ "Nikola Vučević",
            name == 'Skal LabissiÃ¨re' ~ 'Skal Labissière',
            name == "ThÃ©o Maledon" | 
                name == 'ThÃÂ©o Maledon'~ "Theo Maledon",
            name == "TimothÃ© Luwawu-Cabarrot" | 
                name == 'TimothÃÂ© Luwawu-Cabarrot'~"Timothe Luwawu-Cabarrot",
            name == "TomÃ¡Å¡ SatoranskÃ½" | 
                name == 'TomÃÂ¡ÃÂ¡ SatoranskÃÂ½'~ "Tomas Satoransky",
            name == "Vasilije MiciÄ" | 
                name == 'Vasilije MiciÃÂ'~ "Vasilije Micić",
            name == "Vlatko ÄanÄar" | 
                name == 'Vlatko ÃÂanÃÂar'~ "Vlatko Čančar",
            name == "Willy HernangÃ³mez" | 
                name == 'Willy HernangÃÂ³mez'~ "Willy Hernangomez",
            TRUE ~ name
        ))
}

best_player_metric <- function(dataset, main_col, x, y) {
    new_col <- paste0(as_label(enquo(main_col)), "_player_id")
    
    dataset %>%
        filter(minutes > x & usage_rate > y) %>%
        group_by(year, team) %>%
        slice_max(order_by = {{main_col}}, n = 1, with_ties = FALSE) %>%
        ungroup() %>%
        mutate(!!new_col := sample(1e1:1e3, n(), replace = FALSE)) %>%
        select(year, team, name, {{main_col}}, !!sym(new_col)) %>%
        mutate(year = as.numeric(year))
}

bp_on_court <- function(team_game_dataset, player_game_dataset,
                        bp_dataset, filter_by_col, best_by_id) {
    
    team_with_player <- team_game_dataset %>%
        select(team, gamedate, season, win) %>%
        left_join(bp_dataset, by = c("team", "season"="year"))
    
    only_best_players <- player_game_dataset %>%
        left_join(bp_dataset, by = c("team", "name", "season"="year")) %>%
        filter(!is.na({{filter_by_col}}) | {{filter_by_col}} > 12) %>%
        filter(!is.na({{best_by_id}})) %>%
        mutate(
            bp_ids_keys = 
                   paste(team, gamedate, !!sym(as_label(enquo(best_by_id))))
            ) %>%
        distinct(bp_ids_keys)
    
    team_bp_dataset <- team_with_player %>%
        mutate(best_by_player_avi = ifelse(
            paste(team, gamedate, !!sym(as_label(enquo(best_by_id)))) %in%
                only_best_players$bp_ids_keys, 1, 0))
    
    return(team_bp_dataset)
}

team_data_prep_keep <- function(dirty_data, cols_to_keep,
                      id_column, rename_str_pre = "",
                      rename_str_post = "") {
    clean_data <- dirty_data %>%
        filter(name == "Team Totals") %>%
        select({{cols_to_keep}}, {{id_column}}) %>%
        separate({{id_column}}, into = c("team", "year"), sep = "-") %>%
        mutate(year = sub("\\..*", "", year)) %>%
        select(team, year, everything()) %>%
        rename_with( ~paste0(rename_str_pre, .x, rename_str_post),
                     .cols = -c(team, year))
}

team_data_prep_drop <- function(dirty_data, cols_to_drop,
                      id_column, rename_str_pre = "",
                      rename_str_post = "") {
    clean_data <- dirty_data %>%
        filter(name == "Team Totals") %>%
        select(-{{cols_to_drop}}) %>%
        separate({{id_column}}, into = c("team", "year"), sep = "-") %>%
        mutate(year = sub("\\..*", "", year)) %>%
        select(team, year, everything()) %>%
        rename_with( ~paste0(rename_str_pre, .x, rename_str_post),
                     .cols = -c(team, year))
}

player_data_prep_keep <- function(dirty_data, cols_to_keep,
                                  id_column, rename_str_pre = "",
                                  rename_str_post = "") {
    clean_data <- dirty_data %>%
        select({{cols_to_keep}}, {{id_column}}) %>%
        separate({{id_column}}, into = c("team", "year"), sep = "-") %>%
        select(year, team, everything()) %>%
        mutate(year = sub("\\..*", "", year)) %>%
        filter(name != "Team Totals") %>%
        rename_with(~paste0(rename_str_pre, .x, rename_str_post),
                    .cols = -c(team, year, name))
}

player_data_prep_drop <- function(dirty_data, cols_to_drop,
                                  id_column, rename_str_pre = "",
                                  rename_str_post = "") {
    clean_data <- dirty_data %>%
        select(-{{cols_to_drop}}) %>%
        separate({{id_column}}, into = c("team", "year"), sep = "-") %>%
        select(year, team, everything()) %>%
        mutate(year = sub("\\..*", "", year)) %>%
        filter(name != "Team Totals") %>%
        rename_with(~paste0(rename_str_pre, .x, rename_str_post),
                    .cols = -c(team, year, name))
}

std_dev_mag <- function(dirty_data, new_colname,
                        og_value, avg_value, sd_value) {
    dirty_data %>%
        mutate(
            new_colname = case_when(
                #Outliers
                og_value < avg_value - 2 * sd_value ~ "Neg Outlier",
                og_value > avg_value + 2 * sd_value ~ "Pos Outlier",
                #Within 2SD
                og_value >= avg_value - 2 * sd_value &
                    og_value < avg_value - sd_value ~ "Within -2SD",
                og_value <= avg_value + 2 * sd_value &
                    og_value > avg_value + sd_value ~ "Within +2SD",
                #Within 1SD
                og_value >= avg_value - sd_value &
                    og_value < avg_value ~ "Within -1SD",
                og_value < avg_value + sd_value &
                    og_value > avg_value ~ "Within +1SD"))
}