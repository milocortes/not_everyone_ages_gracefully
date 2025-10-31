import pandas as pd 
from pathlib import Path

FP = Path("./ouput/baseline_lambda")

FP_OUTPUT = FP / "results_all_baseline_lambda_1_0.csv"

pd.read_csv(FP_OUTPUT)


def build_macroeconomics_effects(
    file_name : str
    ) -> pd.DataFrame:




df = pd.read_csv("output/results_all_razon_formal_0_95_lambda_1_0.csv")
df = pd.read_csv("/home/milo/Downloads/output/results_all_lsra_baseline_lambda_1.0.csv")
df["pension_pib"] = df["PP"]/df["YY"]*100

mapeo_anios_indices = {i : j for i,j in enumerate(range(2021,2101))}

anios_interes = [2022, 2030, 2040, 2050, 2060, 2070, 2080, 2090, 2100]


macro_data = pd.DataFrame()

for anio_index, anio in mapeo_anios_indices.items():

    if anio in anios_interes:
        df_subset = (df[["YY","LL", "KK", "w", "r", "taur", "taup"]].iloc[[0, anio_index]].pct_change()*100).T

        df_subset = df_subset.rename(
            columns = {
                anio_index : str(anio)
            }
        ).drop(columns=0)

        df_pension = df["pension_pib"].iloc[[anio_index]].to_frame().T.rename(
            columns = {
                anio_index : str(anio)
            }
        )

        df_subset = pd.concat([df_subset, df_pension])

        macro_data = pd.concat([macro_data, df_subset], axis = 1)


macro_data.round(2)


df[[f"VV_coh_cohort_{i}_informal" for i in range(1, 17 )]].iloc[0]

dict(df[[f"v_coh_cohort_{i}_formal" for i in range(1, 17 )]].iloc[1]*100)


mapeo_anio_nacimiento = lambda empleo :  {fr'v_coh_cohort_{i+1}_{empleo}':j for i,j in enumerate(range(2001, 1925, -5))}

anios_nacimiento = [1931, 1951, 1961, 1971, 1981, 1991, 2001]

datos = []

for anio in anios_nacimiento:
    coho_formal = df[[i  for i,j in mapeo_anio_nacimiento("formal").items() if j == anio]].iloc[1].to_list()[0]
    coho_informal = df[[i  for i,j in mapeo_anio_nacimiento("informal").items() if j == anio]].iloc[1].to_list()[0]

    datos.append(
        [anio, coho_formal*100, coho_informal*100, df["hicksian"].iloc[0]]
    )

hicksian_variation = pd.DataFrame(datos, columns = ["anio", "formal", "informal", "lsra"])
hicksian_variation

