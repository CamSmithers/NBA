import seaborn as sns
import pandas as pd
from faicons import icon_svg
from pathlib import Path


from shiny import reactive
from shiny.express import input, render, ui

ui.page_opts(title='NBA Dashboard', fillable=True)

@render.data_frame
def read_data():
    df = pd.read_csv(
        Path(__file__).parent / "tbs.csv")
    return df.head(100)