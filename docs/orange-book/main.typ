#import "@preview/orange-book:0.6.1": book, part, chapter, my-bibliography, appendices, make-index, index, theorem, definition, notation,remark,corollary,proposition,example,exercise, problem, vocabulary, scr, update-heading-image
#import "@preview/algorithmic:1.0.6"
#import algorithmic: style-algorithm, algorithm-figure
//#set text(font: "Linux Libertine")
//#set text(font: "TeX Gyre Pagella")
//#set text(font: "Lato")
//#show math.equation: set text(font: "Fira Math")
//#show math.equation: set text(font: "Lato Math")
//#show raw: set text(font: "Fira Code")

#show: book.with(
  title: "Not Everyone Ages Gracefully: Fiscal Adjustments to Exogenous Shocks in Three Latin American Countries",
  subtitle: "",
  date: "Anno scolastico 2023-2024",
  author: "",
  main-color: rgb("#F36619"),
  lang: "es",
  cover: image("./background.svg"),
  image-index: image("./orange1.jpg"),
  list-of-figure-title: "List of Figures",
  list-of-table-title: "List of Tables",
  supplement-chapter: "Capítulo",
  supplement-part: "Part",
  part-style: 0,
  copyright: [
    Copyright © 2025

    PUBLISHED BY PUBLISHER

    #link("https://github.com/milocortes/not_everyone_ages_gracefully", "TEMPLATE-WEBSITE")

    Licensed under the Apache 2.0 License (the “License”).
    You may not use this file except in compliance with the License. You may obtain a copy of
    the License at https://www.apache.org/licenses/LICENSE-2.0. Unless required by
    applicable law or agreed to in writing, software distributed under the License is distributed on an
    “AS IS” BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and limitations under the License.

    _First printing, November 2025_
  ],
  lowercase-references: false
)

#set text(size : 12pt, font: "Lato")
//#set par(leading: 0.6em)
#set par(spacing: 1.2em)
#import "@preview/mitex:0.2.5": *
#import "@preview/tablem:0.3.0": tablem, three-line-table
#import "@preview/booktabs:0.0.4": *

#show: booktabs-default-table-style

#let three-line-table = tablem.with(
  render: (columns: auto, align: auto, ..args) => {
    table(
      columns: columns,
      stroke:  (x: none),
      //align: center + horizon,
      table.hline(y: 0),
      table.hline(y: 1, stroke: .5pt),
      ..args,
      table.hline(),
    )
  }
)

#part("Modelo de Generaciones Traslapadas Dinámico y Estocástico") 


#chapter("Modelo", image: image("./orange2.jpg"), l: "chap1")
//#index("intro_modelo")

// +++++++++++++++++++++++++++++++++++++++++++++
// +++++++++++++++++++++++++++++++++++++++++++++
// **********  MODELO
// +++++++++++++++++++++++++++++++++++++++++++++
// +++++++++++++++++++++++++++++++++++++++++++++


#include "secciones/modelo.typ"

// +++++++++++++++++++++++++++++++++++++++++++++
// +++++++++++++++++++++++++++++++++++++++++++++
// **********  DATOS
// +++++++++++++++++++++++++++++++++++++++++++++
// +++++++++++++++++++++++++++++++++++++++++++++

// Chapter can also be defined in this way
#update-heading-image(image: image("./orange2.jpg"))
#include "secciones/datos.typ"


// +++++++++++++++++++++++++++++++++++++++++++++
// +++++++++++++++++++++++++++++++++++++++++++++
// **********  Resultados de la Simulación
// +++++++++++++++++++++++++++++++++++++++++++++
// +++++++++++++++++++++++++++++++++++++++++++++
#part("Efectos Macroeconómicos, de Bienestar, Eficiencia y Sostenibilidad Fiscal de las Políticas")

#include "secciones/resultados_simulacion.typ"


// +++++++++++++++++++++++++++++++++++++++++++++
// +++++++++++++++++++++++++++++++++++++++++++++
// **********  Conclusiones
// +++++++++++++++++++++++++++++++++++++++++++++
// +++++++++++++++++++++++++++++++++++++++++++++

#update-heading-image(image: image("./orange2.jpg"))

#part("Conclusiones")

#include "secciones/conclusiones.typ"

#my-bibliography( bibliography("sample.bib",  style: "apa"))

#make-index(title: "Index")

#show: appendices.with("Appendices", hide-parent: false)

#chapter("Aspectos Computacionales", image: image("./orange2.jpg"))

== Solución al problema de los hogares 
Para encontrar la solución al problema de los hogares se necesita discretizar el espacio de estados $z$. Se tiene que calcular tres conjuntos de nodos #mitex(`\hat{\mathcal{A}}=\left\{a^1, \ldots, a^{n_A}\right\}, \hat{\mathcal{P}}=\left\{e p^1, \ldots, e p^{n_P}\right\}, \hat{\mathcal{E}}=\left\{\eta^1, \ldots, \eta^{n_E}\right\}`)

Se usa el método de @rouwenhorst1995asset para obtener una aproximación de la distribución de $eta$, el cual sigue un proceso AR(1), mediante una Cadena de Markov discreta. 

Para cada uno de los valores discretizados de $z_j$ se calcula la decisión óptima de los hogares a partir del problema de optimización (función de política) mediante el algoritmo de iteración de la función de política el cual utiliza una interpolación spline multidimensional @habermann2007multidimensional del nivel de ahorro y earning points de los hogares así como el método de Newton para encontrar las raíces de la condición de primer orden.




== Algoritmo para el equilibrio macroeconómico del cálculo del equilibrio inicial y transición

Las series de tiempo de precios de los factores así como los valores de las variables de política de la transición del estado de equilibrio inicial al siguiente se obtienen mediante el algoritmo iterativo Gauss-Seidel @alma99576423502432.

Se fijan las condiciones iniciales de las variables de stock $K_1$, $B Q_1$, $B_1$, capital, herencias y deuda respectivamente. Se asignan iguales a los valores del equilibrio inicial $K_0$, $B Q_0$ $B_0$. 

El valor de dichos stocks es calibrado a lo largo de la transición mediante un parámetro de velocidad de ajuste *damp factor*. 

El pseudocódigo del programa de la transición es el siguiente:

#show: style-algorithm
#algorithm-figure(
  "Equilibrio Inicial y Transición",
  vstroke: .5pt + luma(200),
  {
    import algorithmic: *
    Procedure(
      "eq-inicial-trans",
      (""),
      {
      For($i t e r in 1:max$, {
        Assign[$x_i$][$i$]
      })
        Return[*null*]
      },
    )
  }
)
