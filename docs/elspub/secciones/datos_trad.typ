#import "@preview/tablem:0.3.0": tablem, three-line-table
#import "@preview/booktabs:0.0.4": *
#import "@preview/mitex:0.2.5": *

#show: booktabs-default-table-style


= Model calibration and parametrization

The model considers two types of parameters: those that can be directly observed in the data and those that can be estimated indirectly. The first group of parameters includes variables such as survival probabilities and capital ratios. The second group of variables includes those that are estimated through a calibration procedure. The calibration procedure usually consists of adjusting the parameter values ​​until one or more model outputs are sufficiently close to their observed real-world values.

== Exogenous parameters

Each period in the model corresponds to 5 years in real life. Households are assumed to begin their economic life at age 20 $(j=1)$ and face a life expectancy of 100 years, so the life cycle in the model covers $J J=16$ periods. The mandatory retirement age is defined as 65, which in the model means that the retirement age corresponds to $J R=10$ periods, so households spend the last 7 periods as retirees and receive a pension.

Since we are considering a period to correspond to 5 years, some annual rates must be converted. Considering the case of the population growth rate, assuming an annual growth rate of 1 percent, the conversion to a 5-year compound annual growth rate would be equal to $n_p=1.01^5-1 ~ 0.05$.

The capital-to-product ratio and the labor-to-income ratio were obtained from PWT 10.01, Penn World Table. The age-specific productivity profile was calculated using the National Survey of Occupation and Employment (ENOE) for the second quarter of 2021.

Total government spending as a fraction of GDP is obtained from the World Bank and corresponds to government final consumption expenditure#footnote[https://data.worldbank.org/indicator/NE.CON.GOVT.ZS], while the public debt-GDP ratio was obtained from the ECLAC database.

For the calibration of the model we consider 2021 as the base year, so that all exogenous parameters correspond to this year.


== Calibrated parameters

The parameters to be calibrated corresponding to production were the level of technology $Omega$ and the depreciation rate $delta$. At the authors' suggestion, the wage rate is normalized to one, $w=1$. The parameter $Omega$ It was numerically calibrated until the wage rate values ​​closest to one were obtained. Meanwhile, The depreciation rate did not need to be calibrated because the rate for all three countries is presented in PWT 10.01, Penn World Table.

The parameter $nu$ It represents the trade-off of individual preferences regarding consumption and leisure. The larger the value of $nu$, It is more attractive for households to consume goods and services that are paid for in the market than to consume leisure time. The parameter $nu$, Therefore, it has a significant influence on the number of hours a household works in the market. It adjusts $nu$ to a target of an average ratio of work time to total allocated time that represents approximately 33 percent. This value is calculated for each country assuming a maximum weekly work time allocation of 110 hours, as well as 50 work weeks per week. This annual average of hours worked per employee, which is available in PWT 10.01, Penn World Table for the countries under study, is then compared.

The following parameters to be calibrated correspond to the formation process and variance of the logarithm of wage income over the household life cycle. Empirical studies indicate that around age 25, the variance of income is 0.3 and tends to increase almost linearly to a value of 0.9 by age 60. In the model presented here, the variance of the logarithm of labor earnings is determined by two components: through exogenous processes that affect labor productivity in an idiosyncratic way $theta$ and $eta_j$, as well as by individual decisions about how many hours of work are offered in the market. We have information about the structure of the labor productivity process and how this might influence the variance of the logarithm of labor earnings. The logarithm of an individual's labor earnings is defined as

==  Tax system and pension system
The tax and pension systems still need to be defined. The government has four tax schemes to define in order to balance its budget:
1. Define exogenously the value of $tau_t^w$ and $tau_t^r$, calculate the value of $tau_t^c$.
2. Define exogenously the value of $tau_t^c$, calculate the value of $tau_t^w$ and $tau_t^r$
3. Define exogenously the value of $tau_t^c$ and $tau_t^r$, calculate the value of $tau_t^w$.
4. Define exogenously the value of $tau_t^c$ and $tau_t^w$, calculate the value of $tau_t^r$.

For the model executions, scheme 4 was defined, meaning we exogenously assign a value for the consumption and labor income tax rates, and the model calculates the capital tax rate. The calculations for the effective consumption and income tax rates performed by the CIEP were used.

With respect to the pension system, we have to define the replacement rate $kappa$. The observed replacement rate value for the three countries was obtained from OECD-Founded Pension Indicators-Contributions.

The value of the intertemporal discount factor $beta$ was the same as that used by the authors.

For the initial equilibrium, we consider the pension system to be regressive, meaning the progressivity factor $lambda=0$.

The mortality probability rates were estimated using the population pyramids by age cohort from the 2020 Population and Housing Census.  

== Summary of Exogenous (*E*), Calibrated (*C*), and Target (*T*) Parameters

The following table presents the model parameters. They are classified according to parameters that are obtained directly from the data (exogenous parameters) and those that are calibrated. The calibration process is briefly described. For more detail, see the Model Parameterization and Calibration section.

The model outputs that are defined as calibration targets are also shown. For the case of these targets, as well as the exogenous parameters, the data source used in the present analysis is indicated.


#three-line-table[
| *Parameter* | *Description* | *E* | *C* | *T* | *Description* |
| :---: | :--- | :--- | :--- | :--- | :--- |
| TT | Number of transition periods. Each period is equivalent to 5 real-life years. | X |  |  | Defined by numerical criterion |
| JJ | Number of years a household lives. Households begin their economic life at 20 years old ( $j=1$ ). They live until 100 years old ( $J J=16$ ). | X |  |  | |
| JR | Mandatory retirement age. Households retire at 65 years old ( $j_r=10$ ) | X |  |  |  |
| $gamma$ | Coefficient of relative risk aversion (reciprocal of the intertemporal substitution elasticity) |  | X |  | The parameter was calibrated until the outputs closest to the observed values of the Consumption and Investment ratios with respect to GDP were obtained. |
| $nu$ | Leisure preference intensity parameter. | X |  |  | Consulted PWT 10.01, Penn World Table |
| $beta$ | Time discount factor. |  | X |  | Calibrated by Fehr and Kindermann (2018). |
| $sigma_theta^2$ | Variance of the fixed effect $theta$ on productivity. |  | X |  | Calibrated by Fehr and Kindermann (2018). |
| $sigma_epsilon^2$ | Variance of the autoregressive component $eta$. | X | |  | Calibrated by Fehr and Kindermann (2018). |
| $alpha$ | Capital elasticity in the production function. Corresponds to the capital-output ratio. | X | | | Consulted PWT 10.01, Penn World Table. |
| $delta$ | Capital depreciation rate. | X | | | Consulted PWT 10.01, Penn World Table |
| $Omega$ | Technology level. |  | | | Numerically calibrated to adjust the wage rate to $w_t=1$. |
| $n_p$ | Population growth rate. | X | | | Consulted OECD, Fertility rates |
| gy | Public expenditure as a percentage of GDP. | X | | | Consulted World Bank, General government final consumption expenditure (% of GDP) |
| by | Public debt as a percentage of GDP. | X | | | CEPAL database |
| $kappa$ | Pension system replacement rate. | X | | | Consulted OECD-Founded Pension Indicators-Contributions |
| $psi_j$ | Survival rates by age cohort. | X | | | Calculated using the population pyramids from the 2020 Population Census |
| $e_j$ | Labor income efficiency profile by age cohort. | X | | | ENOE Q2 2021 |
| $tau_t^c$ | Consumption tax rate. | X |  | | Effective rate calculated by CIEP |
| $tau_t^w$ |Labor income tax rate. | X |  | | Effective rate calculated by CIEP |
| $tau_t^r$ | Capital income tax rate. |  | X | | Consulted OECD Tax Database |
| $tau_t^p$ | Pension system payroll contribution rate. |  | X | | Consulted OECD-Founded Pension Indicators-Contributions |
| $tau_(j, t)^(i m p l)$ | Implicit tax rate of the pension system payroll contribution. |  | X | |  |
| $lambda$ | Pension system progressivity factor. | X |  | |  |
| PEN/GDP | Pension payment as a percentage of GDP. |  | X | | Consulted OECD-Pensions at Glance-Public expenditure on pensions |
| C/GDP. | Private consumption as a percentage of GDP. |  | X | | Consulted PWT 10.01, Penn World Table |
| I/GDP | Investment as a percentage of GDP. |  | X | | Consulted PWT 10.01, Penn World Table |
]

== Model parameters
The following table summarizes the model parameter values:
#table(
  columns: 3,
  align: (left, center, center),
  toprule(), // added by this package
  table.header(
    [*Description*],
    [*Parameter*],
    [*México*],
  ),
  midrule(), // added by this package
  table.cell(colspan: 3)[*Función de Utilidad*],
  
  [Relative risk aversion coefficient (reciprocal of the intertemporal elasticity of substitution)],
  [$gamma$],
  [0.18],

  [Parameter of leisure preference intensity.],
  [$nu$],
  [0.45],

  [Time discount factor.], 
  [$beta$],
  [0.998],

  cmidrule(start: 0, end: -1), // added by this package

  table.cell(colspan: 3)[*Production Function*],
  
  [Elasticity of capital in the production function. It corresponds to the capital-output ratio.],
  [$alpha$],
  [0.619],

  [Capital depreciation rate.],
  [$delta$],
  [3.8 %],

  [Technology level.],
  [$Omega$], 
  [1.65], 

  cmidrule(start: 0, end: -1), // added by this package

  table.cell(colspan: 3)[*Risk in labor productivity*],
  [Autoregressive component of the shock in productivity.],
  [$rho$],
  [0.98],

  [Variance of the autoregressive component $eta$], 
  [$sigma_epsilon^2$], 
  [0.05],

  cmidrule(start: 0, end: -1), // added by this package

  table.cell(colspan: 3)[*Government*],
  [Public spending as a percentage of GDP.], 
  [gy], 
  [11.02 %],

  [Public debt as a percentage of GDP.], 
  [by], 
  [52.3 %],

  [Consumption tax rate.], 
  [$tau_t^c$], 
  [5.73 %],

  [Income tax rate.], 
  [$tau_t^w$], 
  [12.73 %],

  cmidrule(start: 0, end: -1), // added by this package

  table.cell(colspan: 3)[*Pension System*],

  [Pension system replacement rate.],
  [$kappa$],
  [64.3%],

  [Progressivity Factor of the pension system.],
  [$lambda$],
  [0.0],

  cmidrule(start: 0, end: -1), // added by this package

  table.cell(colspan: 3)[*Demography*],

  [Population growth rate],
  [$n_p$],
  [1.8 %],

  bottomrule() // added by this package
)

== Initial Equilibrium

#table(
  columns: 3,
  align: (left, center, center),
  toprule(), // added by this package
  table.header(
    [],
    [Model],
    [Observed],
  ),
  midrule(), // added by this package
  table.cell(colspan: 3)[*Mercado de Bienes ( % PIB)*],
  
  [- Private Consumption],
  [69.04],
  [70.2],
  [- Public Spending],
  [11.02],
  [11.02],

  [- Investment], 
  [19.94],
  [18.39],

  cmidrule(start: 0, end: -1), // added by this package

  table.cell(colspan: 3)[*Tasas de impuestos (en %)*#footnote[Effective Rates vs Nominal Rate]],
  
  [- Consumption],
  [5.73],
  [16.0],

  [- Income],
  [12.73],
  [1.92 - 35.0],

  [- Capital],
  [14.58],
  [12.13#footnote[Effective Rate]],

  cmidrule(start: 0, end: -1), // added by this package

  table.cell(colspan: 3)[*Tax revenue (% of GDP)*],
  
  [- Consumption],
  [3.96],
  [4.07],

  [- Income],
  [4.85],
  [3.91#footnote[Income taxes applied to wages and mixed income]],

  [- Capital], 
  [8.14],
  [5.33],

  cmidrule(start: 0, end: -1), // added by this package

  table.cell(colspan: 3)[*Pension System*],
  
  [- Replacement rate],
  [64.3],
  [64.3],

  [- Pension payments (% of GDP)],
  [2.44],
  [18.2],

  cmidrule(start: 0, end: -1), // added by this package

  table.cell(colspan: 3)[*Demography*],
  
  [- Population growth rate],
  [1.82],
  [1.82],


  bottomrule() // added by this package
)
