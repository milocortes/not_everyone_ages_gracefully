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
    (name: [S. Pythagoras], institutions: ("a",), corresponding: true, orcid: "0000-0001-2345-6789", email:"s.pythagoras@croton.edu"),
    (name: [M. Thales], institutions: ("b", )),
  ),
  institutions: (
    "a": [School of Pythagoreans, Croton, Magna Graecia],
    "b": [Milesian School of Natural Philosophy, Miletus, Ionia],
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


= Model and Methodology

== Novel Contributions of the Model

- Unlike traditional OLG models that assume homogeneous agents, ours explicitly incorporates *high-skill and low-skill workers*, capturing:
    - *Differences in income, labor supply decisions, and pension contributions*.
    - Distinct fiscal impacts of reforms on each group.
- Inclusion of heterogeneous agents: high-skill and low-skill workers.
- Calibration for three Latin American countries, ensuring relevance for emerging economies.

== Overlapping Generations Model (OLG)

=== Dynamic stochastic general equilibrium (DSGE) framework.
The model presented here is based on and belongs to this generation of OLG models. It is a dynamic and stochastic general equilibrium model that incorporates idiosyncratic risks into labor productivity. The price of factors responds to changes in the behavior of agents, and the government enters as an agent that collects tax revenue to finance its spending. The aggregate amounts of the economy grow on a balanced growth trajectory given by the rate of population growth $n_p$. 

==== Demographic dynamics (survival probabilities, intergenerational transfers).
In each period $t$, the economy is populated by $J$ overlapping generations indexed by $j = 1, ..., J$. In each generation $J$, there are two groups of households: low and high skills, indexed by $s=1$ for the most qualified households and $s=2$ the least qualified households, if otherwise indicated, both skill groups have the same parameters. Survival from one period to the next is assumed to be stochastic and that $psi_(j,s)$ is the probability that an agent will survive from age $j-1$ to age $j$, conditional on living in the age $j-1$, for the skill class $s$. 

The size of the cohort corresponding to age $j$ in the period $t$ is

#mitext(`
		\begin{equation}
 		 N_{j,s,t} =  \psi_{j,s,t}N_{j-1, s,t-1} \quad \text{con} \quad N_{1,t} = (1+n_{p,t})N_{1,s,t-1}
		\end{equation}
`)



#lorem(150) (see Eq.~@eq1).

$
c^2 = a^2 + b^2
$ <eq1>
where ...

$
  x = integral_0^x d x #<eqa>\
  (u v)' = u' v + v' u #<eqb>
$ <eq2>

Eq.~@eqa is a simple integral, while Eq.~@eqb is the derivative of a product of two functions. These equations are grouped in Eq.~@eq2.

#lorem(50)

== Section
#lorem(50) @Tha600 @Pyt530 @Pyt520.

=== Subsection
#lorem(50)

= Tables

Below is Table~@tab:tab1.

#let tab1 = {
  table(
  columns: 3,
  table.header(
    [*Header 1*],
    [*Header 2*],
    [*Header 3*],
  ),
  [Row 1], [12.0], [92.1],
  [Row 2], [16.6], [104],
)
}

#figure(
    tab1,
    kind: table,
    caption : [Example]
) <tab:tab1>

= Figures

== Simple figure

Below is Fig.~@fig:logo.

#figure(
  image("images/typst-logo.svg", width: 50%),
  caption : [Typst logo - Credit: \@fenjalien]
) <fig:logo>

== Subfigures

=== Subfigures

Below are Figs.~@figa and~@figb, which are part of Fig.~@fig:typst.

#subfigure(
figure(image("images/typst-logo.svg"), caption: []), <figa>,
figure(image("images/typst-logo.svg"), caption: []), <figb>,
columns: (1fr, 1fr),
caption: [(a) Left image and (b) Right image],
label: <fig:typst>,
)

#show: appendix

= Appendix A

#lorem(50) (see Eq.~@eq:app-eq1 and Fig.~@fig:logo-app).

$
  y = x^2
$ <eq:app-eq1>

#figure(
  image("images/typst-logo.svg", width: 50%),
  caption : [Typst logo - Credit: \@fenjalien]
) <fig:logo-app>

#bibliography("refs.bib")