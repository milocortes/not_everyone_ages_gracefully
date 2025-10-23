using DataFrames
using CSV 

using LatinHypercubeSampling

## Definimos los limites de los parametros lambda y kappa
lambda_limites = (0,1.0)
kappa_limites = (0,1.0)

## Definimos plan de muestreo
plan, _ = LHCoptim(200,2,1000)

## Ejecutamos el plan
scaled_plan = scaleLHC(plan,[kappa_limites, lambda_limites])

## Construimos un dataframe con el muestreo
muestreo = DataFrame(scaled_plan, ["kappa", "lambda"])

## Guardamos el diseño experimental
CSV.write(joinpath(pwd(),"datos" , "experimental_design", "experimental_design.csv"), muestreo)


