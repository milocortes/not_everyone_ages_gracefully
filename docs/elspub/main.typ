#import "@preview/elspub:0.2.0": *
#import "@preview/mitex:0.2.5": *

// Journal list
#let jedc = (
  name: "Journal of Economic Dynamics and Control",
  address: "https://www.sciencedirect.com/journal/journal-of-economic-dynamics-and-control",
  logo: image("jedc-logo.jpg"),
  font: default-font,
  numcol: 1,
  foot-info: [Elsevier Ltd. All rights reserved, including those for text and data mining, AI training, and similar technologies.]
)


#show: elspub.with(
  journal: jedc,
  paper-type: none,
  title: [Not Everyone Ages Gracefully: Fiscal Adjustments to Exogenous Shocks in Three Latin American Countries],
  keywords: (
    "Elsevier",
    "Typst",
    "Template",
  ),
  authors: (
    (name: [], institutions: ("a",), corresponding: true, orcid: "0000-0001-2345-6789", email:""),
    (name: [], institutions: ("b", )),
  ),
  institutions: (
    "a": [],
    "b": [],
  ),  
  abstract: lorem(100),
  paper-info: (
    year: [510 BCE],
    paper-id: [123456],
    volume: [1],
    issn: [1234-5678],
    received: [01 June 510 BCE],
    revised: [01 July 510 BCE],
    accepted: [01 August 510 BCE],
    online: [01 September 510 BCE],
    doi: "https://doi.org/10.1016/j.aam.510bce.101010",
    open: cc-by,
    extra-info: [Communicated by C. Eratosthenes],
  )
)

= Introduction
- Motivation
  - Global challenges in fiscal sustainability.
  - Importance on focusiig on latin-american economies 
  - Unique economic and demographic profiles of Mexico, Chile, and Costa Rica.
  - Importance of worker heterogeneity in fiscal adjustments.

- Research Questions
-  How should public expenditure be adjusted to minimize fiscal imbalances considering different skill groups?
-  What replacement rate minimizes the fiscal gap without altering contribution rates?
-  How do pension reforms affect different worker types (high vs. low skill)?
-  What are the policy trade-offs for Latin American countries with different fiscal constraints?



#include "secciones/modelo_trad.typ"

#include "secciones/datos_trad.typ"

#include "secciones/resultados_simulacion_trad.typ"

#include "secciones/conclusiones_trad.typ"

#show: appendix

= Appendix A


== Solución al problema de los hogares 
Para encontrar la solución al problema de los hogares se necesita discretizar el espacio de estados $z$. Se tiene que calcular tres conjuntos de nodos #mitex(`\hat{\mathcal{A}}=\left\{a^1, \ldots, a^{n_A}\right\}, \hat{\mathcal{P}}=\left\{e p^1, \ldots, e p^{n_P}\right\}, \hat{\mathcal{E}}=\left\{\eta^1, \ldots, \eta^{n_E}\right\}`)

Se usa el método de @rouwenhorst1995asset para obtener una aproximación de la distribución de $eta$, el cual sigue un proceso AR(1), mediante una Cadena de Markov discreta. 

Para cada uno de los valores discretizados de $z_j$ se calcula la decisión óptima de los hogares a partir del problema de optimización (función de política) mediante el algoritmo de iteración de la función de política el cual utiliza una interpolación spline multidimensional @habermann2007multidimensional del nivel de ahorro y earning points de los hogares así como el método de Newton para encontrar las raíces de la condición de primer orden.




== Algoritmo para el equilibrio macroeconómico del cálculo del equilibrio inicial y transición

Las series de tiempo de precios de los factores así como los valores de las variables de política de la transición del estado de equilibrio inicial al siguiente se obtienen mediante el algoritmo iterativo Gauss-Seidel @alma99576423502432.

Se fijan las condiciones iniciales de las variables de stock $K_1$, $B Q_1$, $B_1$, capital, herencias y deuda respectivamente. Se asignan iguales a los valores del equilibrio inicial $K_0$, $B Q_0$ $B_0$. 

El valor de dichos stocks es calibrado a lo largo de la transición mediante un parámetro de velocidad de ajuste *damp factor*. 

El pseudocódigo del programa de la transición es el siguiente:
#bibliography("refs.bib")