from selenium import webdriver
from selenium.webdriver.chrome.service import Service 
from selenium.webdriver.common.by import By
import time
import random
import os
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

print(f'Current: {os.getcwd()}')
os.chdir('/Users/camsmithers/Desktop/Camalytics/NBA')
print(f'Current: {os.getcwd()}')

service = Service(executable_path="chromedriver")
driver = webdriver.Chrome(service=service)

# Getting the URLs for every game from each month

nba_months = ["october", "november", "december", "january",
               "february", "march", "april", "may", "june"]

season_26_links = []

options = webdriver.ChromeOptions()
driver = webdriver.Chrome(service=Service(), options=options)

for month in nba_months:
    url = f"https://www.basketball-reference.com/leagues/NBA_2026_games-{month}.html"
    print(f"Scraping {url}")
    driver.get(url)
    time.sleep(5)

    links = driver.find_elements(By.XPATH, '//a[contains(@href, "/boxscores/") and contains(text(), "Box Score")]')
    for link in links:
        href = link.get_attribute('href')
        if href:
            season_26_links.append(href)


driver.quit()

# Check results
print(season_26_links[:10])

#----------------------------------------------------------------------#

# Going through the list of links and saving the page as an HTML file

game_folder = "Data-NBA/Games/Games_2025-26"
os.makedirs(game_folder, exist_ok=True)

options = webdriver.ChromeOptions()
prefs = {
    "profile.managed_default_content_settings.images": 2,
    "profile.managed_default_content_settings.stylesheets": 2,
    "profile.managed_default_content_settings.plugins": 2,
    "profile.managed_default_content_settings.popups": 2,
    "profile.managed_default_content_settings.geolocation": 2,
    "profile.managed_default_content_settings.notifications": 2
}
options.add_experimental_option("prefs", prefs)

driver = webdriver.Chrome(service=Service(), options=options)

for game in season_26_links[1246:]:
    print(f"Saving {game}")
    driver.get(game)

    WebDriverWait(driver, 10).until(
        EC.presence_of_all_elements_located((By.ID, "content"))
    )

    html = driver.page_source
    filename = os.path.join(game_folder, game.split("/")[-1])

    with open(filename, "w", encoding="utf-8") as f:
        f.write(html)

    time.sleep(random.uniform(1, 4))

driver.quit()

#----------------------------------------------------------------------#
# Getting the season data for individual teams.

nba_team_abb_east = ["CLE", "BOS", "NYK", "IND", "MIL", "DET", "ORL", "ATL", "CHI", "MIA", "TOR", "BRK", "PHI", "CHO", "WAS"]
nba_team_abb_west = ["OKC", "HOU", "LAL", "DEN", "LAC", "GSW", "MIN", "MEM", "SAC", "DAL", "PHO", "POR", "SAS", "NOP", "UTA"]

team_folder = "Data-NBA/Archive/Teams/Teams_2526"
os.makedirs(team_folder, exist_ok=True)

options = webdriver.ChromeOptions()
prefs = {
    "profile.managed_default_content_settings.images": 2,
    "profile.managed_default_content_settings.stylesheets": 2,
    "profile.managed_default_content_settings.plugins": 2,
    "profile.managed_default_content_settings.popups": 2,
    "profile.managed_default_content_settings.geolocation": 2,
    "profile.managed_default_content_settings.notifications": 2
}
options.add_experimental_option("prefs", prefs)

driver = webdriver.Chrome(service=Service(), options=options)

for team in nba_team_abb_east:
    print(f"Saving {team}")
    driver.get(f"https://www.basketball-reference.com/teams/{team}/2026.html")

    WebDriverWait(driver, 10).until(
        EC.presence_of_all_elements_located((By.ID, "content"))
    )

    html = driver.page_source
    filename = os.path.join(team_folder, f"{team}-2025.html")

    with open(filename, "w", encoding="utf-8") as f:
        f.write(html)
    
    time.sleep(random.uniform(1, 5))

driver.quit()