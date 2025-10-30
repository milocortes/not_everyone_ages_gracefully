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
    [],
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
  [Trabajo],[],[],[],[],[],[],[],[],[],
  [Capital],[],[],[],[],[],[],[],[],[],
  [],[],[],[],[],[],[],[],[],[],
  
  cmidrule(start: 0, end: -1), // added by this package

  table.cell(colspan: 10)[*Precios*],
  [Salario],[],[],[],[],[],[],[],[],[],
  [Tasa de interés],[],[],[],[],[],[],[],[],[],
  [Impuesto al consumo],[],[],[],[],[],[],[],[],[],
  [Impuesto al ingreso],[],[],[],[],[],[],[],[],[],
  [],[],[],[],[],[],[],[],[],[],

  cmidrule(start: 0, end: -1), // added by this package

  table.cell(colspan: 10)[*Sistema de Pensiones*],
  [Gasto en Pensiones#footnote[en % de PIB]],[],[],[],[],[],[],[],[],[],
  [Tasa de Contribución],[],[],[],[],[],[],[],[],[],
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
  columns: (115pt, 90pt, 100pt, 100pt, 100pt) ,
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
  
  [1930], [91], [], [], [0.0],
  [1956], [65], [], [], [0.0],

  [],[],[],[],[],
  cmidrule(start: 0, end: -1), // added by this package

  [*Trabajadoras*],[],[*Formal*],[*Informal*],[],

  [1970], [51], [], [], [0.0],
  [1990], [31], [], [], [0.0],
  [2000], [21], [], [], [0.0],

  [],[],[],[],[],
  cmidrule(start: 0, end: -1), // added by this package

  [*Futuras Generaciones*],[],[],[],[],

  [2012], [19], [], [], [0.0],
  [2020], [1], [], [], [0.0],
  [2040], [-], [], [], [0.0],
  [2060], [-], [], [], [0.0],

  bottomrule() // added by this package


  )
  , caption : [Welfare effects of flat pensions (base model version).]
) 

]
