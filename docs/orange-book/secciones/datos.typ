#import "@preview/tablem:0.3.0": tablem, three-line-table
#import "@preview/booktabs:0.0.4": *
#import "@preview/mitex:0.2.5": *

#show: booktabs-default-table-style


= Parametrización y calibración del modelo

El modelo contempla dos tipos de parámetros: aquellos que pueden ser directamente observados en los datos y aquellos que puedes ser estimados de forma indirecta. En el primer grupo de parámetros tenemos variables como las probabilidades de supervivencia y las razones de capital. En el segundo grupo de variables se encuentran aquellas que son estimadas mediante algún procedimiento de calibración. El procedimiento de calibración usualmente consiste en ajustar el valor de los parámetros hasta que una o varias salidas del modelo sean lo suficientemente cercanas a su valor registrado en el mundo real.

== Parámetros exógenos

Cada periodo del modelo corresponde a 5 años en la vida real. Se supone que los hogares inician su vida económica a la edad de 20 años $(j=1)$ y enfrentan una esperanza de vida de 100 años, de manera que el ciclo de vida en el modelo cubre $J J=16$ periodos. Se define la edad obligatoria de retiro a los 65 años de edad, lo que significa en el modelo que la edad de retiro corresponde a $J R=10$, de manera que los hogares gastan los últimos 7 periodos como retirados del mercado de trabajo y reciben una pensión.

Dado que estamos considerando que un periodo corresponde a 5 años, algunas tasas anuales deben ser convertidas. Pensando el caso de la tasa de crecimiento de la población, suponiendo una tasa de crecimiento anual de 1 por ciento, la conversión a una tasa compuesta a 5 años sería igual a $n_p=1.01^5-1 ~ 0.05$.

La razón de capital así como la razón de ingreso laboral en el producto es obtenida de PWT 10.01, Penn World Table. El perfil de productividad dada la edad se calculó con la Encuesta Nacional de Ocupación y Empleo (ENOE), para el segundo trimestre de 2021.

El gasto público total como fracción del GDP es obtenido del Banco Mundial y corresponde al gasto en consumo final del gobierno#footnote[https://data.worldbank.org/indicator/NE.CON.GOVT.ZS], mientras que la razón deuda pública-GDP fue obtenido de banco de datos de CEPAL.

Para la calibración del modelo consideramos 2021 como el año base, de manera que todos los parámetros exógenos corresponden a este año.

== Parámetros calibrados

Los parámetros a calibrar correspondientes a la producción fueron el nivel de tecnología $Omega$ y la tasa de depreciación $delta$. A sugerencia de los autores, se normaliza la tasa de salarios igual a uno, $w=1$. El parámetro $Omega$ fue calibrado numéricamente hasta obtener los valores más cercanos de la tasa de salarios a la unidad. Por su parte, la tasa de depreciación no fue necesario calibrar pues en PWT 10.01, Penn World Table se presenta la tasa para los tres países.

El parámetro $nu$ representa el trade off de las preferencias individuales con respecto al consumo y al ocio. Entre más grande el valor de $nu$, es más atractivo para los hogares consumir bienes y servicios que son pagados en el mercado que consumir tiempo de ocio. El parámetro $nu$, por tanto, tiene una influencia importante en la cantidad de horas que un hogar trabaja en el mercado. Se ajusta $nu$ a un objetivo de una razón promedio de tiempo de trabajo en el total de tiempo asignado que representa aproximadamente 33 por ciento. Este valor se calcúla para cada país al asumir una asignación máxima de tiempo de trabajo semanal de 110 horas, asi como también 50 semanas laborales por semana. Entonces se relaciona este promedio anual de horas trabajadas por trabajador, el cual está disponible en la PWT 10.01, Penn World Table para los países de estudio.

Los siguientes parámetros a calibrar corresponden al proceso de formación y varianza del logaritmo de los ingresos salariales a lo largo del ciclo de vida de los hogares. Estudios empíricos señalan que alrededor de los 25 años la varianza de los ingresos es de 0.3 y que tiende a incrementarse casi linealmente a un valor de 0.9 hasta la edad de 60 años. En modelo presentado aquí, la varianza del logaritmo de las ganancias laborales se determina por dos componentes : mediante procesos exógenos que afectan la productividad laboral de una forma idiosincrática $theta$ y $eta_j$, como también por las decisiones individuales acerca de cuántas horas de trabajo se oferta en el mercado. Contamos con información acerca de la estructura del proceso de productividad laboral y cómo este podría influir en la varianza del logaritmo de las ganancias laborales. El logaritmo de las ganancias laborales de un individuo se define como

==  Sistema de impuestos y del sistema de pensiones
Resta parametrizar el esquema del sistema de impuestos y del sistema de pensiones. El gobierno tiene 4 esquemas tributarios a definir con el objetivo de balancear su presupuesto:
1. Definir exógenamente el valor de $tau_t^w$ y $tau_t^r$, calcular el valor de $tau_t^c$.
2. Definir exógenamente el valor de $tau_t^c$, calcular el valor de $tau_t^w$ y $tau_t^r$
3. Definir exógenamente el valor de $tau_t^c$ y $tau_t^r$, calcular el valor de $tau_t^w$.
4. Definir exógenamente el valor de $tau_t^c$ y $tau_t^w$, calcular el valor de $tau_t^r$.

Para las ejecuciones del modelo se definió el esquema 4 , es decir, de forma exógena asignamos un valor de la tasa de impuesto al consumo y al ingreso laboral, y el modelo calcula la tasa de impuesto del capital. Se utilizaron los cálculos de las tasas efectivas de los impuestos al consumo y al ingreso realizados por el CIEP.

Con respecto al sistema de pensiones, tenemos que definir la tasa de reemplazo $kappa$. El valor observado de la tasa de reemplazo para los tres países fue obtenido de OECD-Founded Pension Indicators-Contributions.

El valor del factor de descuento intertemporal $beta$ fue el mismo que el usado por los autores.

Para el equilibrio inicial, consideramos que el sistema de pensiones es regresivo, es decir el factor de progresividad $lambda=0$.

Las tasas de probabilidad de muerte fueron estimadas con las pirámides poblacionales por cohorte de edad del Censo de Población y Vivienda de 2020.  

== Resumen de parámetros exógenos (*E*), calibrados (*C*) y objetivos (*T*) 

La siguiente tabla presenta los parámetros del modelo. Se clasifican de acuerdo a parámetros que son obtenidos directamente de los datos (parámetro exógenos) y aquellos que son calibrados. Se describe de forma breve el proceso de calibración. Para más detalle, véase la sección de Parametrización y calibración del modelo.

Se muestra también las salidas del modelo que son definidas como targets de calibración. Para el caso de estos targets así como de los parámetros exógenos, se señala la fuente de consulta de datos que se utilizó en el presente análisis.


#three-line-table[
| *Parámetro* | *Descripción* | *E* | *C* | *T* | *Descripción* |
| :---: | :--- | :--- | :--- | :--- | :--- |
| TT | Número de periodos de transición. Cada periodo equivale a 5 años en la vida real. | X |  |  | Definido por criterio numérico |
| JJ | Número de años que vive un hogar. Los hogares empiezan su vida económica a los 20 años ( $j=1$ ). Viven hasta los 100 años ( $J J=16$ ). | X |  |  | |
| JR | Edad obligatoria de retiro. Los hogares se retiran a los 65 años ( $j_r=10$ ) | X |  |  |  |
| $gamma$ | Coeficiente de aversión relativa al riesgo (recíproco de la elasticidad de sustitución intertemporal) |  | X |  | El parámetro fue calibrado hasta obtener las salidas más cercanas a los valores observados de las razones del Consumo e Inversión con respecto al PIB. |
| $nu$ | Parámetro de la intensidad de preferencia de ocio. | X |  |  | Se consultó PWT 10.01, Penn World Table |
| $beta$ | Factor de descuento de tiempo. |  | X |  | Calibrado por Fehr y Kindermann (2018). |
| $sigma_theta^2$ | Varianza del efecto fíjo $theta$ sobre la productividad. |  | X |  | Calibrado por Fehr y Kindermann (2018). |
| $sigma_epsilon^2$ | Varianza del componente autoregresivo $eta$. | X | |  | Calibrado por Fehr y Kindermann (2018). |
| $alpha$ | Elasticidad del capital en la función de producción. Corresponde a la razón capital en el producto. | X | | | Se consultó PWT 10.01, Penn World Table |
| $delta$ | Tasa de depreciación de capital. | X | | | Se consultó PWT 10.01, Penn World Table |
| $Omega$ | Nivel de tecnología. |  | | | Calibrado numéricamente para ajustar la tasa de salarios a $w_t=1$. |
| $n_p$ | Tasa de crecimiento poblacional. | X | | | Se consultó OECD, Fertility rates |
| gy | Gasto público como porcentage del PIB. | X | | | Se consultó Banco Mundial, General government final consumption expenditure (% of GDP) |
| by | Endeudamiento público como porcentage del PIB. | X | | | Banco de datos de CEPAL |
| $kappa$ | Tasa de reemplazo de sistema de pensiones. | X | | | Se consultó OECD-Founded Pension Indicators-Contributions |
| $psi_j$ | Tasas de supervivencia por cohorte de edad. | X | | | Calculado con las pirámides poblacionales del Censo de Población de 2020 |
| $e_j$ | Perfil de eficiencia de ingresos laborales por cohorte de edad. | X | | | ENOE Q2 2021 |
| $tau_t^c$ | Tasa de impuesto al consumo. | X |  | | Tasa efectiva calculada por CIEP |
| $tau_t^w$ | Tasa de impuesto al ingreso laboral. | X |  | | Tasa efectiva calculada por CIEP |
| $tau_t^r$ | Tasa de impuesto al ingreso de capital. |  | X | | Se consultó OECD Tax Database |
| $tau_t^p$ | Tasa de contribución sobre nómina al sistema de pensiones. |  | X | | Se consultó OECD-Founded Pension Indicators-Contributions |
| $tau_(j, t)^(i m p l)$ | Tasa de impuestos implícita de la contribución sobre nómina al sistema de pensiones. |  | X | |  |
| $lambda$ | Factor de progresividad del sistema de pensiones. | X |  | |  |
| PEN/GDP | Pago a pensiones como porcentaje del PIB. |  | X | | Se consultó OECD-Pensions at Glance-Public expenditure on pensions |
| C/GDP. | Consumo privado como porcentaje del PIB. |  | X | | Se consultó PWT 10.01, Penn World Table |
| I/GDP | Inversión como porcentaje del PIB. |  | X | | Se consultó PWT 10.01, Penn World Table |
]

== Parámetros del modelo
La siguiente tabla resume los valores de los parámetros del modelo:
#table(
  columns: 3,
  align: (left, center, center),
  toprule(), // added by this package
  table.header(
    [*Descripción*],
    [*Parámetro*],
    [*México*],
  ),
  midrule(), // added by this package
  table.cell(colspan: 3)[*Función de Utilidad*],
  
  [Coeficiente de aversión relativa al riesgo (recı́proco de la elasticidad de sustitución intertemporal)],
  [$gamma$],
  [0.18],

  [Parámetro de la intensidad de preferencia de ocio.],
  [$nu$],
  [0.45],

  [Factor de descuento de tiempo.], 
  [$beta$],
  [0.998],

  cmidrule(start: 0, end: -1), // added by this package

  table.cell(colspan: 3)[*Función de Producción*],
  
  [Elasticidad del capital en la función de producción. Corresponde a la razón capital-producto.],
  [$alpha$],
  [0.619],

  [Tasa de depreciación de capital.],
  [$delta$],
  [3.8 %],

  [Nivel de tecnologı́a.],
  [$Omega$], 
  [1.65], 

  cmidrule(start: 0, end: -1), // added by this package

  table.cell(colspan: 3)[*Riesgo en productividad laboral*],
  [Componente autoregresivo del shock en productividad.],
  [$rho$],
  [0.98],

  [Varianza del componente autoregresivo $eta$], 
  [$sigma_epsilon^2$], 
  [0.05],

  cmidrule(start: 0, end: -1), // added by this package

  table.cell(colspan: 3)[*Gobierno*],
  [Gasto público como porcentage del PIB.], 
  [gy], 
  [11.02 %],

  [Endeudamiento público como porcentaje del PIB.], 
  [by], 
  [52.3 %],

  [Tasa de impuesto al consumo.], 
  [$tau_t^c$], 
  [5.73 %],

  [Tasa de impuesto al ingreso.], 
  [$tau_t^w$], 
  [12.73 %],

  cmidrule(start: 0, end: -1), // added by this package

  table.cell(colspan: 3)[*Sistema de Pensiones*],

  [Tasa de reemplazo de sistema de pensiones.],
  [$kappa$],
  [64.3%],

  [Factor de Progresividad del sistema de pensiones.],
  [$lambda$],
  [0.0],

  cmidrule(start: 0, end: -1), // added by this package

  table.cell(colspan: 3)[*Demografía*],

  [Tasa de crecimiento poblacional],
  [$n_p$],
  [1.8 %],

  bottomrule() // added by this package
)

== Equlibrio Inicial 

#table(
  columns: 3,
  align: (left, center, center),
  toprule(), // added by this package
  table.header(
    [],
    [Modelo],
    [Observado],
  ),
  midrule(), // added by this package
  table.cell(colspan: 3)[*Mercado de Bienes ( % PIB)*],
  
  [- Consumo Privado],
  [69.04],
  [70.2],
  [- Gasto Público],
  [11.02],
  [11.02],

  [- Inversión], 
  [19.94],
  [18.39],

  cmidrule(start: 0, end: -1), // added by this package

  table.cell(colspan: 3)[*Tasas de impuestos (en %)*#footnote[Tasas Efectivas vs Tasa Nominal]],
  
  [- Consumo],
  [5.73],
  [16.0],

  [- Ingreso],
  [12.73],
  [1.92 - 35.0],

  [- Capital],
  [14.58],
  [12.13#footnote[Tasa Efectiva]],

  cmidrule(start: 0, end: -1), // added by this package

  table.cell(colspan: 3)[*Ingresos por impuestos ( % PIB)*],
  
  [- Consumo],
  [3.96],
  [4.07],

  [- Ingreso],
  [4.85],
  [3.91#footnote[Impuestos al ingreso aplicados a remuneraciones a asalariados e ingresos mixtos]],

  [- Capital], 
  [8.14],
  [5.33],

  cmidrule(start: 0, end: -1), // added by this package

  table.cell(colspan: 3)[*Sistema de pensiones*],
  
  [- Tasa de reemplazo],
  [64.3],
  [64.3],

  [- Pagos a pensiones ( % PIB)],
  [2.44],
  [18.2],

  cmidrule(start: 0, end: -1), // added by this package

  table.cell(colspan: 3)[*Demografía*],
  
  [- Tasa de crecimiento poblacional],
  [1.82],
  [1.82],


  bottomrule() // added by this package
)