library(tidyverse)
library(ggimage)
setwd('/Users/camsmithers/Desktop/Camalytics/NBA')
current_date <- format(Sys.Date(), '%m_%d_%y')
teamvisdata <- readRDS('Data-NBA/Current/teamvisdata.rds')
teamboxsummary <- readRDS('Data-NBA/Current/teamboxsummary.rds')
imagedata <- read_csv('Data-NBA/Current/TeamLogos.csv') %>%
    rename('fullname'='team')

teamvisdata <- teamvisdata %>%
    left_join(teamboxsummary, by=c('team', 'season')) %>%
    left_join(imagedata, by=c('team'='abbreviation'))

data_years <- unique(teamvisdata$season)

for (data_year in data_years) {
    plot1bar <- ggplot(teamvisdata %>%
                           filter(season==data_year),
                       aes(y=twoleveloc, 
                           fill=twoleveloc)) +
        geom_bar(position='dodge', color='black')+
        geom_text(stat = 'count',
                  aes(label=after_stat(count)),
                  position=position_dodge(width=0.8),
                  hjust=1.05) +
        scale_x_continuous(limits = c(0, 100)) +
        theme_bw() +
        facet_wrap(~team)+
        labs(
            title=paste0(data_year,': Win vs. Loss'),
            fill='Win/Loss',
            x='Count',
            y='Outcome Type')
    #print(plot1bar)
    ggsave(
        filename=paste0('twoleveloc',data_year,'.png'),
        plot=plot1bar,
        path='Images/BarPlots',
        width=35, height=20, units='cm')
}

for (data_year in data_years) {
    plot2bar <- ggplot(teamvisdata %>%
                        filter(season==data_year),
                    aes(y=fourleveloc,
                        fill=fourleveloc)) +
        geom_bar(position='dodge', color='black') +
        geom_text(stat = 'count',
                  aes(label=after_stat(count)),
                  position=position_dodge(width=0.8),
                  hjust=-.5) +
        scale_x_continuous(limits = c(0, 100)) +
        theme_bw() +
        facet_wrap(~team) +
        labs(
            title=paste0(data_year,': Four Level Outcome'),
            fill='Outcome Type',
            x='Count',
            y='Outcome Type')
    #print(plot2bar)
    ggsave(
        filename=paste0('fourleveloc',data_year,'.png'),
        plot=plot2bar,
        path='Images/BarPlots',
        width=35, height=20, units='cm')
}

for (data_year in data_years) {
    plot3bar <- ggplot(teamvisdata %>%
                           filter(season==data_year),
                       aes(y=ws_bpa_multi,
                           fill=ws_bpa_multi)) +
        geom_bar(position='dodge', color='black') +
        geom_text(stat = 'count',
                  aes(label=after_stat(count)),
                  position=position_dodge(width=0.8),
                  hjust=-.5) +
        scale_x_continuous(limits = c(0, 100)) +
        theme_bw() +
        facet_wrap(~team) +
        labs(
            title=paste0(data_year,
                         ': Missing Player w/ Most Win Shares'),
            fill='Outcome Type',
            x='Count',
            y='Outcome Type')
    #print(plot3bar)
    ggsave(
        filename=paste0('ws_bpa_multi',data_year,'.png'),
        plot=plot3bar,
        path='Images/BarPlots',
        width=35, height=20, units='cm')
}

for (data_year in data_years) {
    plot4bar <- ggplot(teamvisdata %>%
                           filter(season==data_year),
                       aes(y=vorp_bpa_multi,
                           fill=vorp_bpa_multi)) +
        geom_bar(position='dodge', color='black') +
        geom_text(stat = 'count',
                  aes(label=after_stat(count)),
                  position=position_dodge(width=0.8),
                  hjust=-.5) +
        scale_x_continuous(limits = c(0, 100)) +
        theme_bw() +
        facet_wrap(~team) +
        labs(
            title=paste0(data_year,
                         ': Missing Player w/ Highest VORP'),
            fill='Outcome Type',
            x='Count',
            y='Outcome Type')
    #print(plot4bar)
    ggsave(
        filename=paste0('vorp_bpa_multi',data_year,'.png'),
        plot=plot4bar,
        path='Images/BarPlots',
        width=35, height=20, units='cm')
}

for (data_year in data_years) {
    plot5bar <- ggplot(teamvisdata %>%
                           filter(season==data_year),
                       aes(y=per_bpa_multi,
                           fill=per_bpa_multi)) +
        geom_bar(position='dodge', color='black') +
        geom_text(stat = 'count',
                  aes(label=after_stat(count)),
                  position=position_dodge(width=0.8),
                  hjust=-.5) +
        scale_x_continuous(limits = c(0, 100)) +
        theme_bw() +
        facet_wrap(~team) +
        labs(
            title=paste0(data_year,
                         ': Missing Player w/ Highest PER'),
            fill='Outcome Type',
            x='Count',
            y='Outcome Type')
    #print(plot5bar)
    ggsave(
        filename=paste0('per_bpa_multi',data_year,'.png'),
        plot=plot5bar,
        path='Images/BarPlots',
        width=35, height=20, units='cm')
}


for (data_year in data_years) {
    plot1scatter <- ggplot(teamvisdata %>%
                               filter(season == data_year,
                                      gametype=='Regular Season Game'),
                           aes(x=gamedate,
                               y=roll_offrating)) +
        geom_line() +
        geom_point(aes(color=twoleveloc)) +
        geom_hline(aes(yintercept=avg_offrating)) +
        theme_bw() +
        facet_wrap(~team)
    plot1scatter
    ggsave(
        filename=paste0('move_offrtg',data_year,'.png'),
        plot=plot1scatter,
        path='Images/ScatterPlots',
        width=70, height=40, units='cm')
}
'
    You could use an interactive plot that is faceted by team to determine how 
teams are performing throughout the season, when compared to their previous 
seasons. This would allow you to see whether a team my be on an upward 
trend or not
'

plot2scatter <- ggplot(teamvisdata %>%
                           filter(gametype=='Regular Season Game'),
                       aes(x=gamedate,
                           y=roll_three_par)) +
    geom_point(aes(color=as.factor(season))) +
    theme_bw() +
    facet_wrap(~team)
plot2scatter
ggsave(filename='3parchange.png',
       plot=plot2scatter,
       path='Images/ScatterPlots',
       width=60, heigh=30, units='cm')