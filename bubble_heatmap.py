import marimo

__generated_with = "0.17.0"
app = marimo.App(width="medium")


@app.cell
def _():
    import marimo as mo
    return


@app.cell
def _():
    import altair as alt
    import pandas as pd 

    df = pd.read_csv("experimentos_formal_share.csv")
    return alt, df


@app.cell
def _(df):
    df
    return


@app.cell
def _(alt, df):

    alt.Chart(df).mark_circle().encode(
        alt.X('pension_pib').scale(zero=False).title('Razón Pensiones/PIB'),
        alt.Y('hicksian').scale(zero=False, padding=1).title('Eficiencia Agregada (LSRA)'),
        color=alt.Color('formal_share', scale=alt.Scale(domain=[0.85, 0.95])).legend(orient="bottom").title("Razón de Trabajadores Formales"),
        size=alt.Size('lambda').legend(orient="bottom").title("Lambda")
    )
    return


if __name__ == "__main__":
    app.run()
