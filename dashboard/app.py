#Other From -> Import
from faicons import icon_svg
from needed import teamdata

#Other Basic Import
import seaborn as sns
import pandas as pd

#Shiny Imports
from shiny import reactive
from shiny.express import input, render, ui

ui.page_opts(title='NBA Dashboard', fillable=True)
ui.input_action_button("reset_sorting", "Reset sorting")

@render.code
def _():
    return teamdata_df.sort()

@render.data_frame
def teamdata_df():
    return render.DataGrid(teamdata, filters=True)

@reactive.effect
@reactive.event(input.reset_sorting)
async def _():
    await teamdata_df.update_sort([])