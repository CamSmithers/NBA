#From -> Import
from pathlib import Path

#Basic Import
import pandas as pd

app_dir = Path(__file__).parent
teamdata = pd.read_csv(app_dir / 'teamvisdata.csv')