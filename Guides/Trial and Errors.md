# Trial and Error
This markdown file is used to document some things I've tried during this project and didn't work for one reason or another. This isn't an attempt at transparency or anything, since I don't feel there is anyone I'm directly responsible to for this project. I'm documenting these hurdles as they may aid me in future projects or endavors.

**List of Trials & Errors**
1. Tesseract (PyTesseract)

## Tesseract
For a future part of this project I wanted to take betting lines from FanDuel and have them added to a csv file. Depending on how much data that I wanted to collect, it could take from a few minutes to a few hours. Initially, I thought about scraping the data; however, since the site has a ton of JavaScript elements it would be hard to scrape the data without knowing more about JavaScript. I didn't think it was a good use of time to learn a bit of another programming language just to scrape some data. The alternative to this was to use OCR (optical character recognition) to extract the data from images. This would allow me to gather a lot of data in as little time as possible. Python has a library called PyTesseract that allows you to scrape data from images. Using this an other libraries such as Pandas, I could get and shape the data I needed for increase the depth of my analysis.

While using PyTesseract, I ran into a major problem. There was inconsistencies with the text being extracted from the images. For example,
1. Scraping all 5 data points and placing them in seperate columns (desired outcome)
2. Scraping all 5 data points not in separate columns
3. Scraping 1-4 data points

Since there was variance in the inconsistencies using OCR wasn't a viable solution to the challenge I was facing. I tried to mitigate these inconsistencies by trying to standardize the way I took the images or how they were formated; however, this proved to be an inadequate solution. **As a result of the issues using Tesseract, I'll have to compromise on the amount of data from FanDuel that I can collect. I'll only collect main odds for each game (ex: Outcome Lines, Cover Lines, Over/Under Lines).**