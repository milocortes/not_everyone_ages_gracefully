#import "@preview/tablem:0.3.0": tablem, three-line-table
#import "@preview/booktabs:0.0.4": *
#import "@preview/mitex:0.2.5": *

= Incremento de la Progresividad del Sistema de Pensiones 
En esta sección se detallarán los efectos macroeconómicos, de bienestar y de eficiencia, así como sostenibilidad fiscal del incremento de la progresividad del sistema de pensiones. 

Partimos del equilibrio inicial obtenido en la sección previa el cual se definió como $t=2021$. Cambiamos progresivamente el valor de $lambda$ a partir de $t=2022$ y calculamos la trayectoria de transición hacía el nuevo estado de equilibrio $t = infinity$.

Nos interesa conocer los efectos en los agregados macroeconómicos, así como en el bienestar y eficiencia, entre ambos estados de equilibrio. 

== Cálculos de efectos en el bienestar y eficiencia 

Con el objetivo de contabilizar cambios en bienestar de los agentes, utilizaremos la denominada *Equivalencia #footnote[Variación de Compensación] Hicksiana*.

Dado que la función de utilidad de los hogares es homogénea @fehr2013should, tenemos que se mantiene la siguiente igualdad

#mitex(
  `
\begin{equation}
u\left[(1+\phi) c_j,(1+\phi) \ell_j\right]=(1+\phi) u\left[c_j, \ell_j\right]
\end{equation}
  `
)

Si el consumo y el ocio simultaneamente se incrementaran por un factor $1 + phi.alt$ en cualquier edad, la utilidad a lo largo de la vida se incrementaría en el mismo factor. Si asumimos que un individuo en el estado $z_j$ tiene una utilidad $V_(2021)(z_j)$ en el equilibrio inicial y $V_(t)(z_j)$ en el segundo equilibrio de largo plazo después de la política, $t > 2021$.

La variación de compensación entre el escenario de reforma y el escenario baseline para el individuo con estado $z_j$ sería 

#mitex(
  `
\begin{equation}
\phi=\frac{V_t\left(z_j\right)}{V_{2021}\left(z_j\right)}-1
\end{equation}
  `
)

donde $phi.alt$ indica el porcentaje de cambio tanto en consumo como en ocio que el individuo en estado $z_j$ requeriría en el estado inicial para estar al menos tan bien como después de la reforma de la política. Si $phi.alt > 0$, la reforma mejora el bienestar de este individuo y viceversa. 

La línea sólida de la siguiente figura muestra una posible consecuencia específicas por cohorte en el bienestar que pueden experimentar los individuos como resultado de una política#footnote[Se considera un agente representativo para cada cohorte].  La política redistribuye la riqueza de los cohortes actuales a los cohortes futuros#footnote[El eje $x$ de la gráfica indica el año de nacimiento de los cohortes. Dado que los hogares comienzan su vida laboral a los 20 años, siguiendo el ejemplo de @fehr2013should, el último cohorte que está en el mercado de trabajo nació en 1998, pues el primer estado de equilibrio corresponde a 2008. Cuando se habla de generaciones futuras, se refiere a las generaciones nacidad después de 2009]. 


Para aislar los efectos obtenido unicamente por efectos de eficiencia de la reforma, @alma99576423502432 fueron pioneros en proponer introducir un agente nuevo al modelo : Lump-Sum Redistribution Authority (LSRA). Dicho agente realiza una tarea hipotética en una simulación independiente en la que redistribuye-compensa los beneficios o pérdidas generados por la política. En primer lugar, este agente realiza transferencias o impone impuestos a todas las generaciones que son económicamente activas en el año inmediatamente precedente a año de aplicación de la política con el objetivo de hacerlos que estén tan bien como en el estado de equilibrio inicial después de la política. De manera que su varición de compensación es igual a 0. Posteriormente, como consecuencia de esta operación redistributiva, el LSRA pudo haber contraido deuda o acumular activos. El LSRA redistribuye esta deuda o activos a las generaciones futuras de tal manera que todos obtengan a la misma variación compensatoria. Esta variación se puede interpretar como una medida de eficiciencia@fehr2013should. Si esta variación es positiva, la reforma se considera que mejora en sentido de Pareto tras la compensación. 

== Efectos del incremento de la progresividad

Nos interesa calcular los efectos de incrementar la progresividad  del sistema de pensiones calcular la trayectoria hacia el segundo estado de equilibrio para los valores de $lambda in {0.1, 0.2, dots , 1.0}$. Esta intervención tiene dos efectos latentes en el sistema. El primero : Bajo el sistema de earning points una parte de las contribuciones a pensiones de las trabajadoras se reconocen como un *ahorro implícito*. Bajo el sistema en que la pensión es independiente del historial de ingresos $lambda = 1$, la contribución se considera un *impuesto implícito*. De manera que la transición a un sistema de pensiones con pensión *plana* incrementa las distorsiones de la oferta laboral y disminuye el bienestar. El segundo : el sistema de pensiones independiente del historial de ingresos $lambda = 1$, también funciona como un seguro contra riesgos del mercado laboral, lo que tiende a mejorar el bienestar. 


=== Efectos macroeconómicos

=== Bienestar y Eficiencia

Usamos la variación Hicksiana como medida de los efectos en bienestar para diferentes cohortes. Nos gustaría responder:

- ¿Se benefician-afectan los retirados? ¿Cómo son afectados por los incrementos en los impuestos al consumo? ¿formales o informales se benefician-perjudican más?
- ¿Se benefician-afectan las generaciones actuales en edad de trabajar?
- Here the intra-generational redistribution from rich towards poor households induced by the progressive pension formula becomes most obvious.
- ¿Se benefician-afectan las nuevas generaciones?
- ¿Qué pasa con la medida global del LSRA? Es decir, los efectos en bienestar después de pagos de compensación.


The evolution of welfare after compensation is depicted in the right part of Table 5. We find that the
reform induces losses for any future generation of 0.46% of initial resources.


The introduction of flat pensions comes along with two major efficiency consequences: 
- on the one hand, insurance provision against labor market risk causes efficiency to rise while, 
- on the other hand, increasing labor market distortions reduce it. 


We find in this reform scenario that the latter outweighs the former and therefore the introduction of completely flat pension benefits is Pareto inferior.

#page(flipped: true)[
#figure(
table(
  columns: (170pt, 50pt, 50pt, 50pt, 50pt, 50pt, 50pt, 50pt, 50pt, 50pt) ,
  align: (left, center, center),
  toprule(), // added by this package
  table.header(
    [*Año*],
    [*2022*],
    [*2030*],
    [*2040*],
    [*2050*],
    [*2060*],
    [*2070*],
    [*2080*],
    [*2090*],
    [$infinity$],
  ),

  midrule(), // added by this package
  table.cell(colspan: 10)[*Agregados Macroeconómicos*],
  [PIB],[-0.32],[-2.15],[-3.56],[-4.34],[-5.15],[-5.17],[-5.19],[-5.19],[-5.19],        
  [Trabajo],[-0.82],[-1.35],[-1.29],[-1.26],[-1.25],[-1.24],[-1.23],[-1.23],[-1.23],     
  [Capital],[-0.0],[-2.63],[-4.93],[-6.18],[-7.05],[-7.3],[-7.53],[-7.51],[-7.51],
  [],[],[],[],[],[],[],[],[],[],
  
  cmidrule(start: 0, end: -1), // added by this package

  table.cell(colspan: 10)[*Precios*],
  [Salario],[0.51],[-0.81],[-2.3],[-3.11],[-3.58],[-4.01],[-4.03],[-4.03],[-4.03],
  [Tasa de interés],[-0.39],[0.63],[1.83],[2.49],[2.87],[3.09],[3.22],[3.21],[3.21],
  [Impuesto al capital],[0.36],[4.54],[8.18],[10.21],[11.38],[12.05],[12.08],[12.07],[12.07],
  [],[],[],[],[],[],[],[],[],[],

  cmidrule(start: 0, end: -1), // added by this package

  table.cell(colspan: 10)[*Sistema de Pensiones*],
  [Gasto en Pensiones#footnote[en % de PIB]],[2.44],[2.87],[2.84],[2.84],[2.84],[2.84],[2.84],[2.84],[2.84],
  [Tasa de Contribución],[-0.0],[17.62],[16.35],[16.35],[16.35],[16.35],[16.35],[16.35],[16.35],
  [],[],[],[],[],[],[],[],[],[],

  cmidrule(start: 0, end: -1), // added by this package

  bottomrule() // added by this package
  )
  , caption : [Welfare effects of flat pensions (base model version).]
) <table-flat-pension>

Referencing @table-flat-pension in-text using its label.
]



#page(flipped: true)[
#figure(
table(
  columns: (125pt, 90pt, 100pt, 100pt, 100pt) ,
  align: (center, center, center),
  toprule(), // added by this package
  table.header(
    [*Año de Nacimiento*],
    [*Años en 2021*],
    table.cell(colspan: 2)[*Sin LSRA*],
    [*Con LSRA*],

    cmidrule(start: 2, end: 4), // added by this package
    [],
    [],
    table.cell(colspan: 2)[*Por tipo de Empleo*],
    [],


  ),

  midrule(), // added by this package
  [*Retiradas*],[],[*Formal*],[*Informal*],[],
  
  [1930], [91], [1.19], [0.53], [0.0],
  [1956], [65], [3.93], [2.47], [0.0],

  [],[],[],[],[],
  cmidrule(start: 0, end: -1), // added by this package

  [*Trabajadoras*],[],[*Formal*],[*Informal*],[],
  [1960], [61], [-7.87], [2.01], [0.0],
  [1970], [51], [-4.43], [0.80], [0.0],
  [1980], [41], [-0.65], [0.52], [0.0],
  [1990], [31], [0.47], [0.28], [0.0],
  [2000], [21], [-0.73], [-0.73], [0.0],

  [],[],[],[],[],
  cmidrule(start: 0, end: -1), // added by this package

  [*Futuras Generaciones*],[],[],[],[],

  [2012], [19], [], [], [-0.13],
  [2020], [1], [], [], [-0.13],
  [2040], [-], [], [], [-0.13],
  [2060], [-], [], [], [-0.13],

  bottomrule() // added by this package


  )
  , caption : [Welfare effects of flat pensions (base model version).]
) 

ddedee
]



#page(flipped: true)[
#figure(
table(
  columns: (170pt, 50pt, 50pt, 50pt, 50pt, 50pt, 50pt, 50pt, 50pt, 50pt) ,
  align: (left, center, center),
  toprule(), // added by this package
  table.header(
    [*$lambda$*],
    [*0.1*],
    [*0.2*],
    [*0.3*],
    [*0.4*],
    [*0.5*],
    [*0.6*],
    [*0.7*],
    [*0.8*],
    [*0.9*]
  ),

  midrule(), // added by this package
  table.cell(colspan: 10)[*Agregados Macroeconómicos*],
  [PIB],[-0.56], [-1.12], [-1.69], [-2.26], [-2.82], [-3.39], [-3.96], [-4.51], [-5.03],      
  [Trabajo],[-0.11], [-0.24], [-0.36], [-0.48], [-0.6], [-0.73], [-0.85], [-0.98], [-1.1],
  [Capital],[-0.82], [-1.66], [-2.5], [-3.33], [-4.16], [-4.99], [-5.82], [-6.63], [-7.37],
  [],[],[],[],[],[],[],[],[],[],
  
  cmidrule(start: 0, end: -1), // added by this package

  table.cell(colspan: 10)[*Precios*],
  [Salario],[-0.44], [-0.88], [-1.33], [-1.78], [-2.23], [-2.68], [-3.13], [-3.57], [-3.97],
  [Tasa de interés], [0.34], [0.69], [1.05], [1.41], [1.77], [2.14], [2.5], [2.86], [3.2],
  [Impuesto al capital],[1.29], [2.61], [3.95], [5.3], [6.67], [8.06], [9.44], [10.83], [12.12],
  [],[],[],[],[],[],[],[],[],[],

  cmidrule(start: 0, end: -1), // added by this package

  table.cell(colspan: 10)[*Sistema de Pensiones*],
  [Gasto en Pensiones#footnote[en % de PIB]],[2.48], [2.52], [2.56], [2.6], [2.64], [2.68], [2.72], [2.76], [2.8],
  [Tasa de Contribución],[1.57], [3.16], [4.76], [6.37], [8.0], [9.64], [11.3], [12.97], [14.66],
  [],[],[],[],[],[],[],[],[],[],

  cmidrule(start: 0, end: -1), // added by this package

  table.cell(colspan: 10)[*Eficiencia Agregada*],
  [Con LSRA],[-0.01], [-0.02], [-0.03], [-0.041], [-0.053], [-0.065], [-0.079], [-0.094], [-0.111],
  [],[],[],[],[],[],[],[],[],[],

  bottomrule() // added by this package
  )
  , caption : [Aggregate efficiency effects of alternative progressivity levels.]
) 

]



#page(flipped: true)[
#figure(
table(
  columns: (170pt, 50pt, 50pt, 50pt, 50pt, 50pt, 50pt, 50pt, 50pt, 50pt) ,
  align: (left, center, center),
  toprule(), // added by this package
  table.header(
    [*Año*],
    [*2022*],
    [*2030*],
    [*2040*],
    [*2050*],
    [*2060*],
    [*2070*],
    [*2080*],
    [*2090*],
    [$infinity$],
  ),

  midrule(), // added by this package
  table.cell(colspan: 10)[*Agregados Macroeconómicos*],
  [PIB],[-0.25], [0.84], [0.38], [-0.0], [-0.22], [-0.34], [-0.41], [-0.44], [-0.47],        
  [Trabajo],[-0.65], [4.02], [3.69], [3.71], [3.71], [3.72], [3.72], [3.72], [3.72],    
  [Capital],[-0.0], [-1.06], [-1.61], [-2.22], [-2.56], [-2.75], [-2.86], [-2.92], [-2.96],
  [],[],[],[],[],[],[],[],[],[],
  
  cmidrule(start: 0, end: -1), // added by this package

  table.cell(colspan: 10)[*Precios*],
  [Salario],[0.4], [-3.06], [-3.2], [-3.58], [-3.79], [-3.91], [-3.98], [-4.02], [-4.04],
  [Tasa de interés],[-0.31], [2.44], [2.56], [2.87], [3.05], [3.15], [3.2], [3.23], [3.25],
  [Impuesto al capital],[0.11], [-0.59], [0.3], [1.23], [1.75], [2.05], [2.22], [2.31], [2.37],
  [],[],[],[],[],[],[],[],[],[],

  cmidrule(start: 0, end: -1), // added by this package

  table.cell(colspan: 10)[*Sistema de Pensiones*],
  [Gasto en Pensiones#footnote[en % de PIB]],[2.42], [2.71], [2.97], [2.97], [2.97], [2.97], [2.97], [2.97], [2.97],
  [Tasa de Contribución],[-4.16], [-2.05], [7.6], [7.6], [7.6], [7.6], [7.6], [7.6], [7.6],
  [],[],[],[],[],[],[],[],[],[],

  cmidrule(start: 0, end: -1), // added by this package

  table.cell(colspan: 10)[*Eficiencia Agregada*],
  [Con LSRA],[], [], [], [], [], [], [], [], [1.05],
  [],[],[],[],[],[],[],[],[],[],

  bottomrule() // added by this package
  )
  , caption : [Welfare effects of flat pensions (base model version) and Complete Formal Labor Market.]
)

]

