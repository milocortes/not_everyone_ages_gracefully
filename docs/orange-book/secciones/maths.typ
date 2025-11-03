
/*
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
*/