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
    Copyright © 2023 Flavio Barisi

    PUBLISHED BY PUBLISHER

    #link("https://github.com/milocortes/not_everyone_ages_gracefully", "TEMPLATE-WEBSITE")

    Licensed under the Apache 2.0 License (the “License”).
    You may not use this file except in compliance with the License. You may obtain a copy of
    the License at https://www.apache.org/licenses/LICENSE-2.0. Unless required by
    applicable law or agreed to in writing, software distributed under the License is distributed on an
    “AS IS” BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and limitations under the License.

    _First printing, July 2023_
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
#index("intro_modelo")

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


#chapter("Mathematics", image: image("./orange2.jpg"))

#mitext(`
\begin{aligned}
\mathcal{L}= & \frac{\left[c^\nu(1-l)^{1-\nu}\right]^{1-\frac{1}{\gamma}}}{1-\frac{1}{\gamma}}+\beta E\left[V\left(z^{+}\right) \mid \eta\right]+ \\
& +\mu_1\left[\left(1+r_t^n\right) a+w_t^n h l+\mathbb{1}_{j \geq j_r} \kappa_t \bar{y}_t e p-a^{+}-p_t c\right] \\
& +\mu_2 \mathbb{1}_{j<j_r}\left[\frac{j-1}{j} \cdot e p+\frac{1}{j} \cdot\left[\lambda+(1-\lambda) \cdot \frac{w_t h l}{\bar{y}_t}\right]-e p^{+}\right] \\
& +\mu_2 \mathbb{1}_{j \geq j_r}\left[e p-e p^{+}\right]
\end{aligned}
`)

== Theorems
#index("Theorems")
=== Several equations<heading2>
#index("Theorems!Several equations")
This is a theorem consisting of several equations.
#theorem(name: "Name of the theorem")[
  In $E=bb(R)^n$ all norms are equivalent. It has the properties:
  $ abs(norm(bold(x)) - norm(bold(y))) <= norm(bold(x-y)) $
  $ norm(sum_(i=1)^n bold(x)_i) <= sum_(i=1)^n norm(bold(x)_i) quad "where" n "is a finite integer" $
]

=== Single Line
#index("Theorems!Single Line")
This is a theorem consisting of just one line.
#theorem()[
  A set $scr(D)(G)$  in dense in $L^2(G)$, $|dot|_0$.
]
== Definitions
#index("Definitions")
A definition can be mathematical or it could define a concept.
#definition(name: "Definition name")[
  Given a vector space $E$, a norm on $E$ is an application, denoted $norm(dot)$, $E$ in $bb(R)^+ = [0,+∞[$ such that:
  $ norm(bold(x)) = 0 arrow.r.double bold(x) = bold(0) $
  $ norm(lambda bold(x)) = abs(lambda) dot norm(bold(x)) $
  $ norm(bold(x) + bold(y)) lt.eq norm(bold(x)) + norm(bold(y))  $
]
== Notations
#index("Notations")

#notation()[
  Given an open subset $G$ of $bold(R)^n$, the set of functions $phi$ are:
  #v(0.5em, weak: true)
  + Bounded support $G$;
  + Infinitely differentiable;
  #v(0.5em, weak: true)
	a vector space is denoted by $scr(D)(G)$. 
]
== Remarks
#index("Remarks")
This is an example of a remark.

#remark()[
  The concepts presented here are now in conventional employment in mathematics. Vector spaces are taken over the field $bb(K)=bb(R)$, however, established properties are easily extended to $bb(K)=bb(C)$.
]

== Corollaries
#index("Corollaries")
#corollary(name: "Corollary name")[
	The concepts presented here are now in conventional employment in mathematics. Vector spaces are taken over the field $bb(K)=bb(R)$, however, established properties are easily extended to $bb(K)=bb(C)$.
]
== Propositions
#index("Propositions")
=== Several equations
#index("Propositions!Several equations")

#proposition(name: "Proposition name")[
	It has the properties:
  $ abs(norm(bold(x)) - norm(bold(y))) <= norm(bold(x-y)) $
  $ norm(sum_(i=1)^n bold(x)_i) <= sum_(i=1)^n norm(bold(x)_i) quad "where" n "is a finite integer" $
]
=== Single Line
#index("Propositions!Single Line")

#proposition()[
  	Let $f,g in L^2(G)$; if $forall phi in scr(D) (G)$, $(f,phi)_0=(g,phi)_0$ then $f = g$. 
]
== Examples
#index("Examples")
=== Equation Example
#index("Examples!Equation")
#example()[
  Let $G=\(x in bb(R)^2:|x|<3\)$ and denoted by: $x^0=(1,1)$; consider the function:

  $ f(x) = cases(
    e^(abs(x)) quad & "si" |x-x^0| lt.eq 1 slash 2,
    0 & "si" |x-x^0| gt 1 slash 2
  ) $
	
	The function $f$ has bounded support, we can take $A={x in bb(R)^2:|x-x^0| lt.eq 1 slash 2+ epsilon}$ for all $epsilon in lr(\] 0\;5 slash 2-sqrt(2) \[, size: #70%) $.
]

=== Text Example 
#index("Examples!Text")

#example(name: "Example name")[
  Aliquam arcu turpis, ultrices sed luctus ac, vehicula id metus. Morbi eu feugiat velit, et tempus augue. Proin ac mattis tortor. Donec tincidunt, ante rhoncus luctus semper, arcu lorem lobortis justo, nec convallis ante quam quis lectus. Aenean tincidunt sodales massa, et hendrerit tellus mattis ac. Sed non pretium nibh. Donec cursus maximus luctus. Vivamus lobortis eros et massa porta porttitor.
]

== Exercises
#index("Exercises")
#exercise()[
  This is a good place to ask a question to test learning progress or further cement ideas into students' minds.
]
== Problems
#index("Problems")

#problem()[
  What is the average airspeed velocity of an unladen swallow?
]

== Vocabulary
#index("Vocabulary")

Define a word to improve a students' vocabulary.

#vocabulary(name: "Word")[
  Definition of word.
]

#chapter("Presenting Information and Results with a Long Chapter Title", image: image("./orange3.jpg"))
== Table
#index("Table")
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent porttitor arcu luctus, imperdiet
urna iaculis, mattis eros. Pellentesque iaculis odio vel nisl ullamcorper, nec faucibus ipsum molestie.
Sed dictum nisl non aliquet porttitor. Etiam vulputate arcu dignissim, finibus sem et, viverra nisl.
Aenean luctus congue massa, ut laoreet metus ornare in. Nunc fermentum nisi imperdiet lectus
tincidunt vestibulum at ac elit. Nulla mattis nisl eu malesuada suscipit.

#figure(
  table(
  columns: (auto, auto, auto),
  inset: 10pt,
  align: horizon,
  [*Treatments*], [*Response 1*], [*Response 2*],
  [Treatment 1],
  [0.0003262],
  [0.562],
  [Treatment 2],
  [0.0015681],
  [0.910],
  [Treatment 3],
  [0.0009271],
  [0.296],
  ),
  caption: [Table caption.],
) <table>

Referencing @table in-text using its label.

== Figure
#index("Figure")

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent porttitor arcu luctus, imperdiet
urna iaculis, mattis eros. Pellentesque iaculis odio vel nisl ullamcorper, nec faucibus ipsum molestie.
Sed dictum nisl non aliquet porttitor. Etiam vulputate arcu dignissim, finibus sem et, viverra nisl.
Aenean luctus congue massa, ut laoreet metus ornare in. Nunc fermentum nisi imperdiet lectus
tincidunt vestibulum at ac elit. Nulla mattis nisl eu malesuada suscipit.

#figure(
  image("creodocs_logo.svg", width: 50%),
  caption: [Figure caption.],
) <figure>

Referencing @figure in-text using its label and referencing @figure1 in-text using its label.

#figure(
  placement: top,
  table(
  columns: (auto, auto, auto),
  inset: 10pt,
  align: horizon,
  [*Treatments*], [*Response 1*], [*Response 2*],
  [Treatment 1],
  [0.0003262],
  [0.562],
  [Treatment 2],
  [0.0015681],
  [0.910],
  [Treatment 3],
  [0.0009271],
  [0.296],
  ),
  caption: [Floating table.],
) <table1>

#figure(
  placement: bottom,
  image("creodocs_logo.svg", width: 100%),
  caption: [  ting figure.],
) <figure1>

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
