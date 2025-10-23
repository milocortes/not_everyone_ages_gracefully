import marimo

__generated_with = "0.17.0"
app = marimo.App(width="medium")


@app.cell
def _():
    import marimo as mo
    import pandas as pd
    import os
    from pathlib import Path
    import warnings

    warnings.filterwarnings("ignore")
    return Path, mo, pd


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""# Cálculo de probabilidades de muerte y supervivencia""")
    return


@app.cell
def _(Path, pd):
    # Definimos Path del archivo
    FP = Path(".")

    # Cargamos pirámides poblacionales de 1950 y 2020
    piramide_1950 = pd.read_csv(FP/"data/piramide_poblacional_mexico_1950.csv").rename(columns={"total" : "lx"})
    piramide_2020 = pd.read_csv(FP/"data/piramide_poblacional_mexico_2020.csv").rename(columns={"total" : "lx"}).iloc[5:].reset_index(drop=True)
    return (piramide_2020,)


@app.cell
def _(piramide_2020):
    piramide_2020
    return


@app.cell(hide_code=True)
def _(mo):
    mo.md(
        r"""
    ## Calculamos $dx$

    $dx$ represents the number of persons who die aged x last birthday.
    """
    )
    return


@app.cell
def _(piramide_2020):
    piramide_2020["dx"] = 0

    for x in range(piramide_2020.shape[0]):

         if x >=piramide_2020.shape[0]-1:
             piramide_2020["dx"][x] = piramide_2020["lx"][x]
         else:
             piramide_2020["dx"][x] = piramide_2020["lx"][x]-piramide_2020["lx"][x+1]
    piramide_2020
    return


@app.cell(hide_code=True)
def _(mo):
    mo.md(
        r"""
    Assumption of uniform of distribution of deaths between exact ages $x$ and $(x+1)$: The $dx$ deaths between ages $x$ and $(x+1)$ are assumed uniformly spread across the year of age. Hence

    \begin{equation}
    l(x+t) = lx - t \times dx
    \end{equation}
    """
    )
    return


@app.cell(hide_code=True)
def _(mo):
    mo.md(
        r"""
    ## Calculamos $qx$

    $qx$ represents the probability that a person aged exactly $x$ dies before exact age $(x+1)$, i.e. the probability of dying in the next year. Hence

    \begin{equation}
    qx = \dfrac{dx}{lx}
    \end{equation}
    """
    )
    return


@app.cell
def _(piramide_2020):
    piramide_2020["qx"] = piramide_2020["dx"]/piramide_2020["lx"]
    piramide_2020
    return


@app.cell(hide_code=True)
def _(mo):
    mo.md(
        r"""
    ## Calculamos $px$ 

    $px$ represents the probability that a person aged exactly $x$ survives one year to exactly age $(x+1)$ i.e. the probability of surviving one year. Hence

    \begin{equation}
    px  = (1 - qx)
    \end{equation}
    """
    )
    return


@app.cell
def _(piramide_2020):
    piramide_2020["px"] = 1 - piramide_2020["qx"]
    piramide_2020
    return


@app.cell
def _(piramide_2020):
    ## Normalizamos para que el cohorte la probabilidad sea igual a 1
    piramide_2020["px"] = piramide_2020["px"]/piramide_2020.iloc[0]["px"]
    piramide_2020
    return


@app.cell
def _(piramide_2020):
    for id_px, px in enumerate(piramide_2020["px"]):
        print(f"psi[{id_px+1},0:TT] .= {px}")
    return


@app.cell
def _():
    return


if __name__ == "__main__":
    app.run()
