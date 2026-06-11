library(tidyverse)
setwd('/Users/camsmithers/Desktop/Camalytics/NBA')
current_date <- format(Sys.Date(), '%m_%d_%y')
teamvisdata <- readRDS('Data-NBA/Current/teamvisdata.rds')

data_years <- unique(teamvisdata$season)

for (data_year in data_years) {
    plot1 <- ggplot(teamvisdata %>%
                        filter(season==data_year),
                    aes(y=fourleveloc,
                        fill=fourleveloc)) +
        geom_bar(position='dodge', color='black') +
        theme_bw() +
        facet_wrap(~team) +
        labs(
            title=paste(data_year,':Four Level Outcome'),
            fill='Outcome Type',
            x='Count',
            y='Outcome Type')
    
    ggsave(
        filename=paste0('fourleveloc',data_year,'.png'),
        plot=plot1,
        path='Images',
        width=35, height=20, units='cm')
}
