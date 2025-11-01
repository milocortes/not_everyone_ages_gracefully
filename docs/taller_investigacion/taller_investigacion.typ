// Get Polylux from the official package repository
#import "@preview/polylux:0.4.0": *
#import "@preview/pinit:0.2.2": *
#import "@preview/colorful-boxes:1.4.3":*
#import "@preview/thmbox:0.3.0": *
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

//#show: thmbox-init()
// Make the paper dimensions fit for a presentation and the text larger
#let ukj-blue = rgb(0, 84, 163)


//#show link: underline

#let my-stroke = stroke(
  thickness: 2pt,
  paint: blue.lighten(50%),
  cap: "round",
)

#let new-section-slide(title) = slide[
  #set page(footer: none, header: none)
  #set align(horizon)
  #set text(size: 1.5em)
  #strong(title)
  #line(stroke: my-stroke, length: 50%)
  #toolbox.register-section(title)
]


#set page(paper: "presentation-16-9",
  margin: 5cm,
  footer: [
    #set text(size: .6em)
    #set align(horizon)
    
    //Andreas Kröpelin, January 2025 #h(1fr) #toolbox.slide-number
    #h(1fr) #box(image("images/tecnologico-de-monterrey-blue.png", height: 2em)) | #toolbox.slide-number
  ],
  header: box(stroke: (bottom: my-stroke), inset: 8pt)[
    #set text(size: .6em)
    #set align(horizon)
    #toolbox.current-section
    #h(1fr)
    //Polylux demo | #toolbox.current-section
    //#box(image("images/lader.jpg", height: 4em))
  ]
)


#set text(size: 15pt, font: "Lato")
#set page(margin: 0.6in)

#show table.cell.where(y: 0): set text(weight: "bold")

#show figure: set block(breakable: true)

// Use #slide to create a slide and style it using your favourite Typst functions
#slide[
  #set align(horizon)
  = Not Everyone Ages Gracefully: Fiscal Adjustments to Exogenous Shocks in Three Latin American Countries

  Judith Méndez, 

  3 de Noviembre 2025
]


#new-section-slide("Métodos")
#slide[
  = Métodos
Se desarrolló un #text(fill: ukj-blue)[*Modelo de Generaciones Traslapadas de Agentes Heterogéneos Dinámico y Estocástico (DSOLG)*] para estimar cambios en la polı́tica fiscal.


Al contrario de los modelos de horizonte infinito de agente representativo,
este enfoque permite incorporar @nishiyama2014analyzing : 

- #text(fill: ukj-blue)[*Propiedades del ciclo de vida*] que son importantes para determinar las elecciones de ahorro y oferta de trabajo.
- #text(fill: ukj-blue)[*Heterogeneidad intra-generacional*] en los hogares, que es necesaria para analizar el impacto de cambios de polı́tica en la distribución de ingreso y la riqueza.
- #text(fill: ukj-blue)[*Heterogeneidad inter -generacional*] en los hogares para analizar el timing de los impuestos y sus efectos sobre la distribución intergeneracional.

Una generación de modelos OLG son los que incorporan incertidumbre en forma de #text(fill: ukj-blue)[*shocks idiosincráticos a nivel de los hogares*] (ingresos laborales,
riesgo de longevidad, etc) y #text(fill: ukj-blue)[*determinismo en las variables agregadas*] @nishiyama2014analyzing

Los shocks idiosincráticos afectan de forma diferenciada a los agentes, de manera que responden de forma heterogénea dentro de un cohorte @fehr2018introduction #footnote[Al contrario del enfoque de agente representativo donde implı́citamente se define que los individuos pueden cubrirse contra cualquier forma shock idiosincrático]

]

#slide[
  = Métodos

Estos modelos son utilizados para calcular #text(fill: ukj-blue)[*efectos de transición de cambios de polı́tica de un estado estacionario al siguiente*].

Con la dinámica de la transición se utiliza también para analizar los #text(fill: ukj-blue)[*impactos en el bienestar de reformas de la polı́tica fiscal*] que pueden beneficiar a futuras generaciones a costa de las generaciones de la transición.

El modelo aquı́ presentado pertenece a esta generación de modelos OLG. 

Es un modelo de equilibrio general dinámico y estocástico que incorpora riesgos idiosincráticos en la productividad laboral.

]

#new-section-slide("Modelo")
#slide[
  = Demografía

- En cada periodo $t$, la economía está poblada por $J$ generaciones traslapadas indizadas por $j=1, dots, J$. 
- El modelo integra el llamado *margen intensivo de la informalidad*, específicamente a los trabajadores que se emplean en unidades económicas formales pero que no cuentan con una relación patronal ni beneficios laborales definidos en la Ley, ni seguridad social#footnote[El *margen intensivo de la informalidad* es aún mas grande, pues contempla a las trabajadoras que se emplean en el *sector informal*. El INEGI define al sector informal como las actividades económicas que operan con recursos del hogar, sin constituirse formalmente como empresas, donde no se logra distinguir entre la unidad económica y el hogar. Es decir, hay dos formas de conceptualizar la informalidad : de acuerdo al sector económico donde se emplea la trabajadora y por la condición laboral]. 
- El modelo incorpora trabajadores *informales* que laboran en unicades económicas formales y trabajadores *formales*#footnote[El modelo podría considerar a los trabajadores informales que se emplean en el sector informal al considerar unidades económicas que enfrentan una función de producción que usa unicamente el factor trabajo]. 

]

#slide[
  = Matriz Hussmanns

    #figure(
      image("images/husmanns_basico.png", width: 100%),
      caption : [Tomado de INEGI]
    ) 
]

#slide[
  = Matriz Hussmanns

    #figure(
      image("images/husmanns_ampliado.png", width: 90%),
      caption : [Tomado de INEGI]
    ) 
]

#slide[
  = Demografía

- Cuando los individuos entran al mercado laboral, son asignados como trabajor informal o formal de acuerdo a una distribución de probabilidad $omega_s$#footnote[Esta distribución es calculada empiricamente mediante la matriz de hussmans del INEGI] . 
- La variable indicadora  $m_s in [0,1]$ denota el estado laboral del trabajador, donde $m_s=0$ corresponde a trabajadoras formales y $m_s = 1$ a trabajadoras informales. 

- Las probabilidades de transición entre ambos estados es fija y no depende de la edad:

#mitext(`
\begin{equation}
\pi_{j, m, m^{+}}=\operatorname{Pr}\left(m_{j+1}=m^{+} \mid m_j=m\right) \quad \text { con } \quad m, m^{+} \in\{0,1\},
\end{equation}
 `)

]

#slide[
  = Probabilidades de Supervivencia
Se asume que la supervivencia de un periodo al siguiente es estocástica y que $psi_j$ es la probabilidad que un agente sobreviva de la edad $j-1$ a la edad $j$, condicional a que vive en la edad $j-1$#footnote[Asumimos que los trabajadores formales e informales tienen la misma tasa de supervivencia].

          #mitext(`
 La probabilidad incondicional de sobrevivir a la edad $j$ está dada por $\Pi_{i=1}^j \psi_i$ con $\psi_1=1$. Dado que el número de miembros de cada cohorte declina con respecto a la edad, el tamaño del cohorte correspondiente a la edad $j$ en el periodo $t$ es

$$
N_{j, s, t}=\psi_{j, t} N_{j-1, s, t-1} \quad \text { con } \quad N_{1, s, t}=\left(1+n_{p, t}\right) N_{1, s, t-1}
$$


En consecuencia, los pesos de los cohortes (las razones relativas de población) se definen como $m_{1, s, t}=1$ y $m_{j, s, t}= \frac{\psi_{j, t}}{1+n_{p, t}} m_{j-1, s, t-1}$.

Se asume que la población crece a una tasa constante $n_{p,t} = n_p$.
          `)

]

#slide[
  = Demografía

- Todos los agentes se retiran a la edad $j_r$. 

- Los agentes que laboraron en el sector formal  comienzan a recibir una pensión la cual es financiada por el impuesto a nómina. 

- Durante la edad laboral de los trabajadores formales acumulan *earning points* $e p_j$ que definen sus pagos de pensión cuando se retiran.

- Por simplicidad, omitiremos el índice $s$ en la medida de lo posible.

]


#slide[
= Preferencias de los hogares
#mitext(`
Los individuos tienen preferencias sobre consumo $c_{j, t}$ y ocio $l_{j, t}$, además que pagan impuestos sobre el consumo, ingreso así como también un impuesto sobre nómina al sistema de pensiones. Se asume que la asignación de tiempo es igual a 1.

Con $l_{j, t}$ denotando la cantidad de trabajo en horas ofrecido a mercado en el periodo $t$, tenemos $\mathrm{l}_{j, t}+ l_{j, t}=1$. 

La función de utilidad de los hogares se define como

$$
E\left[\sum_{j=1}^J \beta^{j-1}\left(\Pi_{i=2}^j \psi_{i} m_{i-1}\right) u\left(c_{j}, 1-l_{j}\right)\right]
$$

donde $\beta$ es el factor de descuento de tiempo.

Como puede verse, en la utilidad marginal esperada del consumo futuro es también condicional al actual estado laboral $m$.
`)

]

#slide[
= Preferencias de los hogares
#mitext(`
La función de utilidad de los hogares está dada por

$$
u\left(c_{j, t}, 1-l_{j, t}\right)=\frac{\left[\left(c_{j, t}\right)^\nu\left(1-l_{j, t}\right)^{(1-\nu)}\right]^{\left(1-\frac{1}{\gamma}\right)}}{1-\frac{1}{\gamma}}
$$


La utilidad de consumo y ocio toma la forma de una función Cobb-Douglas con un parámetro $\nu$ de preferencia entre ocio y consumo. 

La elasticidad de sustitución intertemporal es constante e igual a $\gamma$, donde $\frac{1}{\gamma}$ es la aversión al riesgo del hogar.
`)

]


#slide[
= Riesgo de supervivencia y herencias
#mitext(`
Dado que no hay mercados de rentas vitalicias (annuity markets), el retorno a activos individuales corresponde a la tasa de interés neta. 

En un marco donde no hay riesgo de longevidad los agentes conocen con certeza en qué momento su vida terminará. 

En consecuencia, son capaces de planear perfectamente en qué punto del tiempo quieren consumir todos sus ahorros. 

Aquí existe incertidumbre de supervivencia, así que los agentes pueden morir antes que la máxima duración de vida $J$ y, como consecuencia, dejar una herencia. 

`)
]

#slide[
= Riesgo de supervivencia y herencias
#mitext(`

Se define $b_{j, t}$ como la herencia que un agente en la edad $j$ recive en el periodo $t$.

La cantidad de herencia para cada cohorte puede ser calculado mediante la expresión:

$$
b_{j, t}=\Gamma_{j, t} B Q_t
$$

donde $B Q_t$ define la herencia agregada en el periodo $t$, o simplemente la fracción del total de activos que pueden ser atribuidos a quienes fallecieron al final del período anterior (incluidos los intereses).

$$
B Q_t=r_t^n \sum_{j=2}^J a_{j, t} \frac{m_{j, t}}{\psi_{j, t}}\left(1-\psi_{j, t}\right)
$$

donde $r_t^n$ es la tasa de interés neta en $t$ y $a_{j,s,t}$ son los activos del cohorte $j$, del grupo $s$, en $t$.
`)
]


#slide[
= Riesgo en la productividad laboral
#mitext(`
Los individuos difieren respecto a su productividad laboral $h_{j, t}$, la cual depende de un perfil (determinístico) de ingresos por edad $e_{j,s}$ que depende del tipo de trabajo, un efecto de productividad fijo $\theta_s$ que es definido al comienzo del ciclo de vida y que, de igual forma, depende del tipo de trabajo (formal e informal) al que son asignados\footnote{Representa un shock permanente}. 

Además, se agrega un shock idiosincrático mediante un componente autoregresivo $\eta_{j, t}$ que evoluciona en el tiempo y que tiene una estructura autoregresiva de orden 1, de manera que

$$
\eta_j=\rho \eta_{j-1}+\epsilon_j \quad \text { con } \quad \epsilon_j \sim N\left(0, \sigma_\epsilon^2\right) \quad \text { y } \quad \eta_1=0
$$


Dada esta estructura, la productividad laboral del hogar es

$$
h_{j,s}= \begin{cases}e_{j,s} \exp \left[\eta_j\right] & \text { si } j<j_r \\ 0 & \text { si } j \geq j_r\end{cases}
$$
`)
]


#slide[
= Problema de Decisión de los Consumidores
El estado de los individuos se carateriza por el vector de estado#footnote[Se asume que los shocks de productividad son independientes entre individuos e identicamente distribuidos entre individuos de un tipo de trabajo en específico.]
#mitext(`
\begin{equation}
z_j = (J, a, ep, s, \eta)
\end{equation}
`)

Los hogares maximizan la función de utilidad sujeta a la restricción presupuestaria intertemporal

#mitext(`
\begin{equation}
a_{j+1, s, t}=\left\{\begin{array}{l}
\left(1+r_t^n\right) a_{j, s, t-1}+w_t^n h_{j, s, t} l_{j, s, t}+b_{j, s, t}+p e n_{j, s, t}-p_t c_{j, s, t} \quad \text { si }  s=0 \\
\left(1+r_t^n\right) a_{j, s, t-1}+w_t h_{j, s, t} l_{j, s, t}+b_{j, s, t}-p_t c_{j, s, t} \text{ si } s=1
\end{array}\right.
\end{equation}
`)

donde:

- #mitext(`$a_{j, t}$ son los ahorros-activos del agente en el periodo t ,`)
- #mitext(`$w_t^n=w_t\left(1-\tau_t^w-\tau_{j, t}^{i m p l} \right)$ es la tasa de salario neto, la cual es igual al salario de mercado $w_t$ menos los impuestos por ingreso laboral $\tau_{j, t}^{i m p l}$ y el impuesto de nómina para financiar el sistema de pensión $\tau_t^p$`)
- #mitext(`$r_t^n=r_t\left(1-\tau_t^r\right)$ es la tasa de interés neta, que es igual a la tasa de interés de mercado $r_t$ descontando el impuesto por ingresos de capital $\tau_t^r$,`)
- #mitext(`$p_t=1+\tau_t^c$ es el precio al consumidor el cual se normaliza a uno y se agregan los impuestos al consumo $\tau_t^c$.`)


Se agrega una restricción adicional de no negatividad de los ahorros #mitext(`$a_{j+1, s} \geq 0$`)

]

#slide[

= Problema de programación dinámica

El problema de optimización de los agentes es el siguiente:

#mitext(`


\begin{equation}
\begin{aligned}
V_t(j, a, ep, s, \eta) & =\max _{c, l, a^{+}, ep^{+}} u(c, 1-l)+\beta \psi_{j+1}(m_s) E\left[V\left(j+1, a^{+}, ep^{+}, s^{+}, \eta^{+}\right) \mid \eta, m_s\right] \\
\text { s.t. } a^{+} & =\left\{\begin{array}{l}
\left(1+r_t^n\right) a_{j, s, t-1}+w_t^n h_{j, s, t} l_{j, s, t}+b_{j, s, t}+p e n_{j, s, t}-p_t c_{j, s, t} \quad \text { si }  s=0 \\
\left(1+r_t^n\right) a_{j, s, t-1}+w_t h_{j, s, t} l_{j, s, t}+b_{j, s, t}-p_t c_{j, s, t} \text{ si } s=1
\end{array}\right., \\
\eta^{+} & =\rho \eta+\epsilon^{+} \quad \text { con } \quad \epsilon^{+} \sim N\left(0, \sigma_\epsilon^2\right) \\
\pi_{j, m, m^{+}} & =\operatorname{Pr}\left(m_{j+1, s}=m^{+}_{s} \mid m_{j, s}=m_s\right) \quad \text { con } \quad m_s, m_s^{+} \in\{0,1\} .
\end{aligned}
\end{equation}

donde $z=(j, a, ep, s, \eta)$ es el vector de variables de estado individuales. 

Nótese que se colocó un índice de tiempo en la función de valor y en los precios. Esto es necesario para calcular la dinámica de la transición entre dos estados estacionarios. 

La condición terminal de la función de valor es

$$
V_t(z)=0 \quad \text { para } \quad z=(J+1, a, ep, s, \eta)
$$

que significa que se asume que los agentes no valoran lo que sucede después de la muerte.
`)

]

#slide[
= Problema de programación dinámica

  Formulamos la solución de problema de los hogares al reconocer que podemos escribir las funciones de horas laborales y de consumo como funciones de $a^+$:

#mitex(
  `
\begin{aligned}
l=l\left(a^{+}\right) & =\min \left\{\max \left[\nu+\frac{1-\nu}{(w_t^n * (1-m) + w_t *m) h}\left(a^{+}-\left(1+r_t^n\right) a -  \text { pen }*( 1-m) \right), 0\right], 1\right\} \\
c & =c\left(a^{+}\right)=\frac{1}{p_t}\left[\left(1+r_t^n\right) a+(w_t^n * (1-m) + w_t *m)  h l\left(a^{+}\right)+\text {pen }*(1-m)-a^{+}\right]
\end{aligned}
  `
)

Con la definición de la *implicit tax rate* , las condiciones de primer orden de los hogares se definen como

#mitex(
  `
\begin{equation}
\begin{aligned}
& \frac{v}{p_t} \cdot \frac{\left[c^\nu(1-l)^{1-\nu}\right]^{1-\frac{1}{\gamma}}}{c}=\beta E\left[V_{a^{+}}\left(z^{+}\right) \mid \eta\right] \\
& \frac{1-\nu}{v} \cdot p_t c=w_t h(1-l)\left\{1-\tau_t^w-\tau_{j, t}^{i m p l}\right\}
\end{aligned}
\end{equation}

  `
)

donde $a^+$ es desconocido. Nótese que $tau_(j, t)^(i m p l) = tau_t^p$ para $lambda = 1$, lo que se reduce al modelo baseline sin progresividad en el sistema.

]

#slide[

= Ingresos y egresos de los hogares por el sistema de pensiones
- A la edad obligatoria de retiro $j_r$, la productividad laboral cae a cero y  los hogares reciben una pensión $p e n_(j,t)$ , la cual está en función del historial salarial del individuo. 

- Con el objetivo de hacer un seguimiento y contabilizar los salarios pasados así como las contribuciones a pensiones, se agrega un estado *earning points*, $e p$, el cual captura los ingresos brutos individuales relativos al ingreso promedio de la economía completa para cada año de contribución#footnote[Este mecanismo de seguimiento de ingresos es tomado de @fehr2013should, el cual es como funciona el sistema de pensiones alemán.] @fehr2013should


#mitext(`
\begin{equation}
e p_{j+1}=\left[e p_j \times(j-1)+\left(\lambda+(1-\lambda) \frac{w h l_j}{\bar{y}}\right)\right] / j
\end{equation}
`)

- donde el parámetro $lambda$ indica el nivel de *progresividad* del sistema de pensiones @fehr2018introduction.
]

#slide[

= Ingresos y egresos de los hogares por el sistema de pensiones

Cuando $lambda = 1$ la pensión es independiente de las contribuciones previas y es igual a la fracción de la tasa de reemplazo $kappa$ del sistema de pensiones del ingreso laboral promedio en el periodo $t$, esto es:

#mitext(`
$$
\text { pen }_j= \begin{cases}0 & \text { si } j<j_r \\ \kappa_t \frac{w_t}{j_r-1} \sum_{j=1}^{j_r-1} e_j, & \text { si } j \geq j_r\end{cases}
$$
`)

Cuando $lambda = 0$, la pensión depende enteramente del historial salarial. Durante la fase de retiro de la trabajadora $j gt.eq j_r $, los puntos salariales quedan constantes y la pensión se calcula como 

#mitext(`
\begin{equation}
\operatorname{pen}_j=\kappa_t \times e p_{j_r} \times \bar{y}
\end{equation}
`)

Los earning points evolucionan de acuerdo a la ecuación:

#mitext(`
\begin{equation}
e p^{+}= \begin{cases}\frac{j-1}{j} \cdot e p+\frac{1}{j} \cdot\left[\lambda+(1-\lambda) \cdot \frac{w_t h l}{y_t}\right] & \text { si } j<j_r,  \\ e p & \text { en caso contrario. }\end{cases}
\end{equation}
`)

Esta ecuación integre dos partes:
- La fase de acumulación, $j lt.small j_r $
- La fase de rendimientos, $j gt.eq j_r $

]

#slide[
= Ingresos y egresos de los hogares por el sistema de pensiones

Definimos la *tasa de impuesto implícita* del sistema de pensiones como

#mitext(`
\begin{equation}
\tau_{j, t}^{i m p l}=\tau_t^p-\frac{1-\lambda}{\left(j_r-1\right) \cdot \bar{y}_t} \cdot \sum_{i=j_r}^J \frac{\kappa_s \bar{y}_s}{\prod_{k=j+1}^i\left(1+r_{t+k-j}\right)}
\end{equation}
`)

Esta tasa de impuesto implícita toma en cuenta que, si $lambda lt.small 1$, los pagos a pensiones se incrementan al incrementarse los ingresos laborales y, como consecuencia, las contribuiciones a pensiones también se incrementan. 

Por lo tanto, las contribuciones  $tau_t^p$ son distintas para cada hogar.

]

#slide[

== Tecnología 
#mitext(`
Las empresas contratan capital $K_t$ y trabajo $L_t$ en un mercado de factores perfectamente competitivo para producir un único bien $Y_t$ de acuerdo a una tecnología de producción dada por una función de producción Cobb-Douglas

$$
Y_t=\Omega K_t^\alpha L_t^{1-\alpha}
$$

donde $\Omega$ es el nivel de tecnología que es constante en el tiempo. El capital se deprecia a una tasa $\delta$, de manera que el stock de capital evoluciona de acuerdo a la siguiente expresión

$$
\left(1+n_p\right) K_{t+1}=(1-\delta) K_t+I_t
$$


Bajo el supuesto de competencia perfecta, las funciones inversas a la demanda de capital y trabajo de la empresa están dadas por

$$
\begin{aligned}
& r_t=\alpha \Omega\left[\frac{L_t}{K_t}\right]^{(1-\alpha)}-\delta \\
& w_t=(1-\alpha) \Omega\left[\frac{K_t}{L_t}\right]^\alpha
\end{aligned}
$$

`)
]

#slide[
= Gobierno
El gobierno administra dos sistemas : un sistema de impuestos y un sistema de pensiones, ambos operando en equilibrio presupuestario.

En cualquier punto en el tiempo el presupuesto del sistema de impuestos es balanceado si se cumple la igualdad#footnote[El gobierno tiene 4 esquemas tributarios a definir con el objetivo de balancear su presupuesto:
1. Definir exógenamente el valor de $tau_t^w$ y $tau_t^r$, calcular el valor de $tau_t^c$.
2. Definir exógenamente el valor de $tau_t^c$, calcular el valor de $tau_t^w$ y $tau_t^r$
3. Definir exógenamente el valor de $tau_t^c$ y $tau_t^r$, calcular el valor de $tau_t^w$.
4. Definir exógenamente el valor de $tau_t^c$ y $tau_t^w$, calcular el valor de $tau_t^r$.

Para las ejecuciones del modelo se definió el esquema 4 , es decir, de forma exógena asignamos un valor de la tasa de impuesto al consumo y al ingreso laboral, y el modelo calcula la tasa de impuesto del capital. Se utilizaron los cálculos de las tasas efectivas de los impuestos al consumo y al ingreso realizados por el CIEP.
]
#mitext(`


$$
\tau_t^c C_t+\tau_t^w w_t L_t^s+\tau_t^r r_t A_t+\left(1+n_p\right) B_{t+1}=G_t+\left(1+r_t\right) B_t
$$


Además de los ingresos por impuestos, el gobierno financia su gasto al contratar nueva deuda $\left(1+n_p\right) B_{t+1}$. 

Sin embargo, debe repagar la actual deuda incluyendo intereses sobre los pagos de manera que tenemos que agregar $\left(1+r_t\right) B_t$ al consumo de gobierno en el lado del gasto. 
  `
)

]

#slide[
  = Gobierno : Sistema de Pensiones 
#mitext(`
El sistema de pensiones opera en un esquema pay-as-you-go, lo que significa que recolecta contribuciones de las generaciones en edad de trabajar y directamente las distribuye a los retirados actuales. 

El beneficio de la pensión se calcula por la suma de earnings points acumulados durante el periodo laboral y el \textit{monto actual de pensión}, APA\footnote{Actual Pension Amount.} que refleja el valor monetario de cada earning point, multiplicado por la tasa de reemplazo $\kappa$ 

\begin{equation}
p_j = \kappa \times \text{ep}_{j_r} \times \text{APA}
\end{equation}

Con el tiempo, APA crece con los ingresos laborales brutos.
`)
]

#slide[
= Mercados
#mitext(`
Hay tres mercados en la economía : mercado de capital, mercado de trabajo y el mercado de bienes. Con respecto a los mercados de factores, el precio del capital $r_t$ y del trabajo $w_t$ se ajustan para limpiar el mercado, esto es:

$$
K_t+B_t=A \quad \text { y } \quad L_t=L_t^s
$$


Nótese que hay dos sectores que demandan ahorro de los hogares. El sector de empresas emplea ahorro como capital en el proceso de producción, mientras que el gobierno lo usa como deuda pública con el objetivo de financiar su gasto. El gobierno y las empresas compiten en competencia perfecta en el mercado de capital.

Con respecto al mercado de bienes, todos los productos producidos deben ser utilizados ya sea como consumo por parte del sector privado o por el gobierno, o en forma de inversión en el futuro stock de capital. Así, el equilibrio en el mercado de bienes está dado por

$$
Y_t=C_t+G_t+I_t
$$
`)

]


#new-section-slide("Parametrización y Calibración del Modelo")

#slide[
= Parametrización y Calibración del Modelo
La siguiente tabla presenta los parámetros del modelo. Se clasifican de acuerdo a parámetros que son obtenidos directamente de los datos (parámetro exógenos) y aquellos que son calibrados. 



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

]

#slide[
 = Parámetros del Modelo 
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
]

#new-section-slide("Aspectos Computacionales")

#slide[
= Solución al problema de los hogares 
Para encontrar la solución al problema de los hogares se necesita discretizar el espacio de estados $z$. Se tiene que calcular tres conjuntos de nodos #mitex(`\hat{\mathcal{A}}=\left\{a^1, \ldots, a^{n_A}\right\}, \hat{\mathcal{P}}=\left\{e p^1, \ldots, e p^{n_P}\right\}, \hat{\mathcal{E}}=\left\{\eta^1, \ldots, \eta^{n_E}\right\}`)

Se usa el método de @rouwenhorst1995asset para obtener una aproximación de la distribución de $eta$, el cual sigue un proceso AR(1), mediante una Cadena de Markov discreta. 

Para cada uno de los valores discretizados de $z_j$ se calcula la decisión óptima de los hogares a partir del problema de optimización (función de política) mediante el algoritmo de iteración de la función de política el cual utiliza una interpolación spline multidimensional @habermann2007multidimensional del nivel de ahorro y earning points de los hogares así como el método de Newton para encontrar las raíces de la condición de primer orden.
]

#slide[
= Algoritmo para el equilibrio macroeconómico del cálculo del equilibrio inicial y transición

Las series de tiempo de precios de los factores así como los valores de las variables de política de la transición del estado de equilibrio inicial al siguiente se obtienen mediante el algoritmo iterativo Gauss-Seidel @alma99576423502432.

Se fijan las condiciones iniciales de las variables de stock $K_1$, $B Q_1$, $B_1$, capital, herencias y deuda respectivamente. Se asignan iguales a los valores del equilibrio inicial $K_0$, $B Q_0$ $B_0$. 

El valor de dichos stocks es calibrado a lo largo de la transición mediante un parámetro de velocidad de ajuste *damp factor*. 

]

#new-section-slide("Equilbrio Inicial")

#slide[

== Equlibrio Inicial 

#text(size: 14pt, font: "Lato")[
#table(
  columns: (290pt, 200pt, 200pt),
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

  table.cell(colspan: 3)[*Tasas de impuestos (en %)*(Tasas Efectivas vs Tasa Nominal)],
  
  [- Consumo],
  [5.73],
  [16.0],

  [- Ingreso],
  [12.73],
  [1.92 - 35.0],

  [- Capital],
  [14.58],
  [12.13],

  cmidrule(start: 0, end: -1), // added by this package

  table.cell(colspan: 3)[*Ingresos por impuestos ( % PIB)*],
  
  [- Consumo],
  [3.96],
  [4.07],

  [- Ingreso],
  [4.85],
  [3.91 ],

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
]
]

#new-section-slide("Experimentos de Política")
#slide[
= Incremento de la Progresividad del Sistema de Pensiones 
En esta sección se detallarán los efectos macroeconómicos, de bienestar y de eficiencia, así como sostenibilidad fiscal del incremento de la progresividad del sistema de pensiones. 

Partimos del equilibrio inicial obtenido en la sección previa el cual se definió como $t=2021$. 

Cambiamos progresivamente el valor de $lambda$ a partir de $t=2022$ y calculamos la trayectoria de transición hacía el nuevo estado de equilibrio $t = infinity$.

Nos interesa conocer los efectos en los agregados macroeconómicos, así como en el bienestar y eficiencia, entre ambos estados de equilibrio. 

]

#slide[
= Cálculos de efectos en el bienestar y eficiencia 

Con el objetivo de contabilizar cambios en bienestar de los agentes, utilizaremos la denominada *Equivalencia #footnote[Variación de Compensación] Hicksiana*.

Dado que la función de utilidad de los hogares es homogénea @fehr2013should, tenemos que se mantiene la siguiente igualdad

#mitex(
  `
\begin{equation}
u\left[(1+\phi) c_j,(1+\phi) \ell_j\right]=(1+\phi) u\left[c_j, \ell_j\right]
\end{equation}
  `
)

Si el consumo y el ocio simultaneamente se incrementaran por un factor $1 + phi.alt$ en cualquier edad, la utilidad a lo largo de la vida se incrementaría en el mismo factor. 
]

#slide[
= Cálculos de efectos en el bienestar y eficiencia 
Si asumimos que un individuo en el estado $z_j$ tiene una utilidad $V_(2021)(z_j)$ en el equilibrio inicial y $V_(t)(z_j)$ en el segundo equilibrio de largo plazo después de la política, $t > 2021$, la variación de compensación entre el escenario de reforma y el escenario baseline para el individuo con estado $z_j$ sería 

#mitex(
  `
\begin{equation}
\phi=\frac{V_t\left(z_j\right)}{V_{2021}\left(z_j\right)}-1
\end{equation}
  `
)

donde $phi.alt$ indica el porcentaje de cambio tanto en consumo como en ocio que el individuo en estado $z_j$ requeriría en el estado inicial para estar al menos tan bien como después de la reforma de la política. 

#text(fill: ukj-blue)[*Si $phi.alt > 0$, la reforma mejora el bienestar de este individuo y viceversa*]. 
]

#slide[
= Lump-Sum Redistribution Authority (LSRA)

- Para aislar los efectos obtenido unicamente por efectos de eficiencia de la reforma, @alma99576423502432 fueron pioneros en proponer introducir un agente nuevo al modelo : #text(fill: ukj-blue)[*Lump-Sum Redistribution Authority (LSRA)*]. 
- Dicho agente realiza una tarea hipotética en una simulación independiente en la que redistribuye-compensa los beneficios o pérdidas generados por la política.
- En primer lugar, este agente realiza transferencias o impone impuestos a todas las generaciones que son económicamente activas en el año inmediatamente precedente a año de aplicación de la política con el objetivo de hacerlos que estén tan bien como en el estado de equilibrio inicial después de la política. De manera que su varición de compensación es igual a 0. 
- Posteriormente, como consecuencia de esta operación redistributiva, el LSRA pudo haber contraido deuda o acumular activos. El LSRA redistribuye esta deuda o activos a las generaciones futuras de tal manera que todos obtengan a la misma variación compensatoria. 
- Esta variación se puede interpretar como una medida de eficiciencia@fehr2013should. 
- #text(fill: ukj-blue)[*Si esta variación es positiva, la reforma se considera que mejora en sentido de Pareto tras la compensación*]. 

]

#slide[
= Efectos del incremento de la progresividad

- Nos interesa calcular los efectos de incrementar la progresividad  del sistema de pensiones calcular la trayectoria hacia el segundo estado de equilibrio para un #text(fill: ukj-blue)[*completamente progresivo, i.e. $lambda = 1.0$*]. 

- Esta intervención tiene dos efectos latentes en el sistema. 
  - El primero : Bajo el sistema de earning points una parte de las contribuciones a pensiones de las trabajadoras se reconocen como un *ahorro implícito*. Bajo el sistema en que la pensión es independiente del historial de ingresos $lambda = 1$, la contribución se considera un *impuesto implícito*. De manera que la transición a un sistema de pensiones con pensión *plana* incrementa las distorsiones de la oferta laboral y disminuye el bienestar. 
  - El segundo : el sistema de pensiones independiente del historial de ingresos $lambda = 1$, también funciona como un seguro contra riesgos del mercado laboral, lo que tiende a mejorar el bienestar. 
]

#slide[

= Efectos del incremento de la progresividad

Usamos la variación Hicksiana como medida de los efectos en bienestar para diferentes cohortes. Nos gustaría responder:

- ¿Se benefician-afectan los retirados? ¿Cómo son afectados por los incrementos en los impuestos al consumo? ¿formales o informales se benefician-perjudican más?
- ¿Se benefician-afectan las generaciones actuales en edad de trabajar?
- Here the intra-generational redistribution from rich towards poor households induced by the progressive pension formula becomes most obvious.
- ¿Se benefician-afectan las nuevas generaciones?
- ¿Qué pasa con la medida global del LSRA? Es decir, los efectos en bienestar después de pagos de compensación.
]

#slide[
= Efectos macroeconómicos
#text(size: 14pt, font: "Lato")[
#table(
  columns: (200pt, 60pt, 60pt, 60pt, 60pt, 60pt, 60pt, 60pt, 60pt, 60pt) ,
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
]
]

#slide[
= Bienestar y Eficiencia
#text(size: 14pt, font: "Lato")[
#table(
  columns: (145pt, 110pt, 130pt, 130pt, 130pt) ,
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
]
]


#slide[
= Efectos macroeconómicos y eficiencia para distintas $lambda$
#text(size: 14pt, font: "Lato")[
#table(
  columns: (200pt, 60pt, 60pt, 60pt, 60pt, 60pt, 60pt, 60pt, 60pt, 60pt) ,
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
]
]

#slide[
= Efectos macroeconómicos y eficiencia para distintas $lambda$
#text(size: 14pt, font: "Lato")[
#table(
  columns: (200pt, 60pt, 60pt, 60pt, 60pt, 60pt, 60pt, 60pt, 60pt, 60pt) ,
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
]
]


#slide[
  == Podemos pensar los diagramas relatedness-complexity en término de 4 cuadrantes

    #figure(
      image("images/formal_share.svg", width: 100%),
      caption: [Elaboracion Propia]
    ) 

]

#slide[
  #bibliography("references.bib",  style: "apa")
]