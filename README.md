# NBA Model Building & Machine Learning V2

## Files in Repository
R & RMD Files
1. Data Prep
   * Used to load data and mass apply column names to ensure consistent formating, especially as new data is added.
2. Data Checking
   * Used to check certain data frames or object while writing various lines of code. Allows me to look at tiny set of data to check for errors or if the code produced the intended output.
3. Cleaning Script 3
   * Applys pre-existing functions from other packages and self-created functions to clean the data prior to analysis. Various actions are performed to get the data ready to be analyzed. **See script for further details**
4. Cleaning Script 4
   * Script is used to contatenate data frames from different scrapping sessions together. The data that's saved as RDS files is what'll be used for analysis.
5. Functions
   * Contains fuctions that I've written that are specifically tailored to address issues for this project.
     * Fixing Player Name (Foreign players names have special characters that can create issues when trying to filter for them)
     * Making it easier to drop or keep certain columns, then naming them after doing so.
     * Determine the best player on a team, based on whatever specific metric I'm interested in looking at.
     * Other mathematical functions for analysis.
6. Analysis
   * Used to analyze data and create visualizations.

Python & PyNB Flies
1. SeleniumScraping
   * Scraping data from the web using the Selenium library. The change was made as the webpage I was scraping was rejecting my request as they determined I was using automated software. To get around this issue, Selenium was used to automate Chrome to appear more human enable scraping to take place.
2. HTMLParsing
   * Going through the webpages saved as HTML files and grabbing the necessary data that I need from them to analyze data.

## Goals & Aims

## Task