#import "@preview/mitex:0.2.5": *

== Introducción

Se desarró un Modelo de Generaciones Traslapadas de Agentes Heterogéneos Dinámico y Estocástico (DSOLG) para estimar cambios en la polı́tica fiscal.


Al contrario de los modelos de horizonte infinito de agente representativo,
este enfoque permite incorporar @nishiyama2014analyzing : 

- Propiedades del ciclo de vida que son importantes para determinar las elecciones de ahorro y oferta de trabajo.
- Heterogeneidad intra-generacional en los hogares, que es necesaria para analizar el impacto de cambios de polı́tica en la distribución de ingreso y la riqueza.
- Heterogeneidad inter -generacional en los hogares para analizar el timing de los impuestos y sus efectos sobre la distribución intergeneracional.

Una generación de modelos OLG son los que incorporan incertidumbre en
forma de shocks idiosincráticos a nivel de los hogares (ingresos laborales,
riesgo de longevidad, etc) y determinismo en las variables agregadas @nishiyama2014analyzing

Los shocks idiosincráticos afectan de forma diferenciada a los agentes, de
manera que responden de forma heterogénea dentro de un cohorte @fehr2018introduction #footnote[Al contrario del enfoque de agente representativo donde implı́citamente se define
que los individuos pueden cubrirse contra cualquier forma shock idiosincrático]

Estos modelos son utilizados para calcular efectos de transición de cambios
de polı́tica de un estado estacionario al siguiente.

Con la dinámica de la transición se utiliza también para analizar los
impactos en el bienestar de reformas de la polı́tica fiscal que pueden
beneficiar a futuras generaciones a costa de las generaciones de la transición.

El modelo aquı́ presentado pertenece a esta generación de modelos OLG. Es un modelo de equilibrio general dinámico y estocástico que incorpora riesgos idiosincráticos en la productividad laboral.

Las cantidades agregadas de la economı́a crecen en una trayectoria de
crecimiento balanceado dada por la tasa de crecimiento de la
población $n_p$.


== Demografía
En cada periodo $t$, la economía está poblada por $J$ generaciones traslapadas indizadas por $j=1, dots, J$. 


El modelo integra el llamado *margen intensivo de la informalidad*, específicamente a los trabajadores que se emplean en unidades económicas formales pero que no cuentan con una relación patronal ni beneficios laborales definidos en la Ley, ni seguridad social#footnote[El *margen intensivo de la informalidad* es aún mas grande, pues contempla a las trabajadoras que se emplean en el *sector informal*. El INEGI define al sector informal como las actividades económicas que operan con recursos del hogar, sin constituirse formalmente como empresas, donde no se logra distinguir entre la unidad económica y el hogar. Es decir, hay dos formas de conceptualizar la informalidad : de acuerdo al sector económico donde se emplea la trabajadora y por la condición laboral]. El modelo incorpora trabajadores *informales* que laboran en unicades económicas formales y trabajadores *formales*#footnote[El modelo podría considerar a los trabajadores informales que se emplean en el sector informal al considerar unidades económicas que enfrentan una función de producción que usa unicamente el factor trabajo]. Cuando los individuos entran al mercado laboral, son asignados como trabajor informal o formal de acuerdo a una distribución de probabilidad $omega_s$#footnote[Esta distribución es calculada empiricamente mediante la matriz de hussmans del INEGI] . La variable indicadora  $m_s in [0,1]$ denota el estado laboral del trabajador, donde $m_s=0$ corresponde a trabajadoras formales y $m_s = 1$ a trabajadoras informales. Las probabilidades de transición entre ambos estados es fija y no depende de la edad:

#mitext(`
\begin{equation}
\pi_{j, m, m^{+}}=\operatorname{Pr}\left(m_{j+1}=m^{+} \mid m_j=m\right) \quad \text { con } \quad m, m^{+} \in\{0,1\},
\end{equation}
 `)

Se asume que la supervivencia de un periodo al siguiente es estocástica y que $psi_j$ es la probabilidad que un agente sobreviva de la edad $j-1$ a la edad $j$, condicional a que vive en la edad $j-1$#footnote[Se asume que los trabajadores formales e informales tienen la misma tasa de supervivencia].

          #mitext(`
 La probabilidad incondicional de sobrevivir a la edad $j$ está dada por $\Pi_{i=1}^j \psi_i$ con $\psi_1=1$. Dado que el número de miembros de cada cohorte declina con respecto a la edad, el tamaño del cohorte correspondiente a la edad $j$ en el periodo $t$ es

$$
N_{j, s, t}=\psi_{j, t} N_{j-1, s, t-1} \quad \text { con } \quad N_{1, s, t}=\left(1+n_{p, t}\right) N_{1, s, t-1}
$$


En consecuencia, los pesos de los cohortes (las razones relativas de población) se definen como $m_{1, s, t}=1$ y $m_{j, s, t}= \frac{\psi_{j, t}}{1+n_{p, t}} m_{j-1, s, t-1}$.

Se asume que la población crece a una tasa constante $n_{p,t} = n_p$ y es la misma para ambos grupos de la población.

La trayectoria de crecimiento balanceado, es decir donde todas las variables agregadas crecen a una misma tasa, se fija a la tasa de crecimiento del cohorte más joven. Se normalizan dichas variables agregadas al tiempo $t$ por el tamaño del cohorte más joven que está viviendo en ese periodo.
          `)

Todos los agentes se retiran a la edad $j_r$. Los agentes que laboraron en el sector formal  comienzan a recibir una pensión la cual es financiada por el impuesto a nómina. Durante la edad laboral de los trabajadores formales acumulan *earning points* $e p_j$ que definen sus pagos de pensión cuando se retiran.

Por simplicidad, omitiremos el índice $s$ en la medida de lo posible.
 
== Decisiones de los hogares

=== Preferencias de los hogares
#mitext(`
Los individuos tienen preferencias sobre consumo $c_{j, t}$ y ocio $l_{j, t}$, además que pagan impuestos sobre el consumo, ingreso así como también un impuesto sobre nómina al sistema de pensiones. Se asume que la asignación de tiempo es igual a 1.

Con $l_{j, t}$ denotando la cantidad de trabajo en horas ofrecido a mercado en el periodo $t$, tenemos $\mathrm{l}_{j, t}+ l_{j, t}=1$. La función de utilidad de los hogares se define como

$$
E\left[\sum_{j=1}^J \beta^{j-1}\left(\Pi_{i=2}^j \psi_{i, s} m_{i-1,s}\right) u\left(c_{j, s}, 1-l_{j, s}\right)\right]
$$

donde $\beta$ denota el factor de descuento de tiempo. Como puede verse, en la utilidad marginal esperada del consumo futuro es también condicional al actual estado laboral $m$.

La función de utilidad de los hogares está dada por

$$
u\left(c_{j, t}, 1-l_{j, t}\right)=\frac{\left[\left(c_{j, t}\right)^\nu\left(1-l_{j, t}\right)^{(1-\nu)}\right]^{\left(1-\frac{1}{\gamma}\right)}}{1-\frac{1}{\gamma}}
$$


La utilidad de consumo y ocio toma la forma de una función Cobb-Douglas con un parámetro $\nu$ de preferencia entre ocio y consumo. La elasticidad de sustitución intertemporal es constante e igual a $\gamma$, donde $\frac{1}{\gamma}$ es la aversión al riesgo del hogar.
`)

=== Riesgo de supervivencia y herencias
#mitext(`
Dado que no hay mercados de rentas vitalicias (annuity markets), el retorno a activos individuales corresponde a la tasa de interés neta. 

En un marco donde no hay riesgo de longevidad los agentes conocen con certeza en qué momento su vida terminará. En consecuencia, son capaces de planear perfectamente en qué punto del tiempo quieren consumir todos sus ahorros. 

Aquí existe incertidumbre de supervivencia, así que los agentes pueden morir antes que la máxima duración de vida $J$ y, como consecuencia, dejar una herencia. Se define $b_{j, t}$ como la herencia que un agente en la edad $j$ recive en el periodo $t$.

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


=== Riesgo en la productividad laboral
#mitext(`
Los individuos difieren respecto a su productividad laboral $h_{j, t}$, la cual depende de un perfil (determinístico) de ingresos por edad $e_{j,s}$ que depende del tipo de trabajo, un efecto de productividad fijo $\theta$ que es definido al comienzo del ciclo de vida y que, de igual forma, depende del tipo de trabajo (formal e informal) al que son asignados\footnote{Representa un shock permanente}. Además, se agrega un shock idiosincrático mediante un componente autoregresivo $\eta_{j, t}$ que evoluciona en el tiempo y que tiene una estructura autoregresiva de orden 1, de manera que

$$
\eta_j=\rho \eta_{j-1}+\epsilon_j \quad \text { con } \quad \epsilon_j \sim N\left(0, \sigma_\epsilon^2\right) \quad \text { y } \quad \eta_1=0
$$


Dada esta estructura, la productividad laboral del hogar es

$$
h_j= \begin{cases}e_j \exp \left[\eta_j\right] & \text { si } j<j_r \\ 0 & \text { si } j \geq j_r\end{cases}
$$
`)

=== Problema de Decisión de los Consumidores
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

== Problema de programación dinámica

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

donde $z=(j, a, ep, s, \eta)$ es el vector de variables de estado individuales. Nótese que se colocó un índice de tiempo en la función de valor y en los precios. Esto es necesario para calcular la dinámica de la transición entre dos estados estacionarios. La condición terminal de la función de valor es

$$
V_t(z)=0 \quad \text { para } \quad z=(J+1, a, ep, s, \eta)
$$

que significa que se asume que los agentes no valoran lo que sucede después de la muerte.

Formulamos la solución de problema de los hogares al reconocer que podemos escribir las funciones de horas laborales y de consumo como funciones de $a^{+}$:

$$
\begin{aligned}
l=l\left(a^{+}\right) & =\min \left\{\max \left[\nu+\frac{1-\nu}{(w_t^n * (1-m) + w_t *m) h}\left(a^{+}-\left(1+r_t^n\right) a -  \text { pen }*( 1-m) \right), 0\right], 1\right\} \\
c & =c\left(a^{+}\right)=\frac{1}{p_t}\left[\left(1+r_t^n\right) a+(w_t^n * (1-m) + w_t *m)  h l\left(a^{+}\right)+\text {pen }*(1-m)-a^{+}\right]
\end{aligned}
$$



Con la definición de la \textbf{implicit tax rate} (Ver siguiente sección), las condiciones de primer orden de los hogares se definen como

\begin{equation}
\begin{aligned}
& \frac{v}{p_t} \cdot \frac{\left[c^\nu(1-l)^{1-\nu}\right]^{1-\frac{1}{\gamma}}}{c}=\beta E\left[V_{a^{+}}\left(z^{+}\right) \mid \eta\right] \\
& \frac{1-\nu}{v} \cdot p_t c=w_t h(1-l)\left\{1-\tau_t^w-\tau_{j, t}^{i m p l}\right\}
\end{aligned}
\end{equation}

donde $a^{+}$es desconocido. Nótese que $\tau_{j, t}^{i m p l} = \tau_{t}^p$ para $\lambda = 1$, lo que se reduce al modelo original.
`)

=== Ingresos y egresos de los hogares por el sistema de pensiones
A la edad obligatoria de retiro $j_r$, la productividad laboral cae a cero y 
los hogares reciben una pensión $p e n_(j,t)$ , la cual está en función del historial salarial del individuo. Con el objetivo de hacer un seguimiento y contabilizar los salarios pasados así como las contribuciones a pensiones, se agrega un estado *earning points*, $e p$, el cual captura los ingresos brutos individuales relativos al ingreso promedio de la economía completa para cada año de contribución#footnote[Este mecanismo de seguimiento de ingresos es tomado de @fehr2013should, el cual es como funciona el sistema de pensiones alemán.] @fehr2013should


#mitext(`
\begin{equation}
e p_{j+1}=\left[e p_j \times(j-1)+\left(\lambda+(1-\lambda) \frac{w h l_j}{\bar{y}}\right)\right] / j
\end{equation}
`)

donde el parámetro $lambda$ indica el nivel de *progresividad* del sistema de pensiones @fehr2018introduction. Cuando $lambda = 1$ la pensión es independiente de las contribuciones previas y es igual a la fracción de la tasa de reemplazo $kappa$ del sistema de pensiones del ingreso laboral promedio en el periodo $t$, esto es:


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

La restricción presupuestaria de los hogares cambia a :

#mitext(`
\begin{equation}
a^{+}+p_t c=\left(1+r_t^n\right) a+w_t^n h l+\mathbb{1}_{j \geq j_r} \kappa_t \bar{y}_t e p
\end{equation}
`)

El beneficio de la pensión se obtiene hasta que se alcanza la edad de retiro $j_r$ y es igual al producto de la tasa de reemplazo actual $kappa_t$, el ingreso promedio $overline(y)$ así como también los puntos de ingreso acumulado por la trabajadora $e p$.

El Lagrangeano del problema de optimización del hogar se escribe : 

#mitext(`
\begin{equation}
\begin{aligned}
\mathcal{L}= & \frac{\left[c^v(1-l)^{1-v}\right]^{1-\frac{1}{\gamma}}}{1-\frac{1}{\gamma}}+\beta E\left[V\left(z^{+}\right) \mid \eta\right]+ \\
& +\mu_1\left[\left(1+r_t^n\right) a+w_t^n h l+\mathbb{1}_{j \geq j_r} \kappa_t \bar{y}_t e p-a^{+}-p_t c\right] \\
& +\mu_2 \mathbb{1}_{j<j_r}\left[\frac{j-1}{j} \cdot e p+\frac{1}{j} \cdot\left[\lambda+(1-\lambda) \cdot \frac{w_t h l}{\bar{y}_t}\right]-e p^{+}\right] \\
& +\mu_2 \mathbb{1}_{j \geq j_r}\left[e p-e p^{+}\right]
\end{aligned}
\end{equation}
`)

con las siguientes condiciones de primer orden:

#mitext(`
\begin{equation}
\begin{aligned}
& \frac{\nu}{p_t} \cdot \frac{\left[c^\nu(1-l)^{1-\nu}\right]^{1-\frac{1}{\gamma}}}{c}=\beta E\left[V_{a^{+}}\left(z^{+}\right) \mid \eta\right] \\
& \frac{1-\nu}{\nu} \cdot p_t c=w_t h(1-l)\left\{1-\tau_t^w-\tau_t^p+\frac{1-\lambda}{j \cdot \bar{y}} \cdot \frac{\beta E\left[V_{e p^{+}}\left(z^{+}\right) \mid \eta\right]}{\frac{\nu}{p_t} \cdot \frac{\left[c^\nu(1-l)^{1-\nu}\right]^{1-\frac{1}{\gamma}}}{c}}\right\}
\end{aligned}
\end{equation}
`)

Cuando $lambda = 1$, la parte de la ecuación

#mitext(`
\begin{equation}
\frac{1-\lambda}{j \cdot \bar{y}} \cdot \frac{\beta E\left[V_{e p^{+}}\left(z^{+}\right) \mid \eta\right]}{\frac{\nu}{p_t} \cdot \frac{\left[c^\nu(1-l)^{1-\nu}\right]^{1-\frac{1}{\gamma}}}{c}}
\end{equation}
`)

Se hace cero, y nos enfrentamos al caso base de una pensión flat, independiente de las contribuciones previas.

Del teorema del envolvente se obtiene:

#mitext(`
\begin{equation}
\begin{aligned}
V_{a^{+}}\left(z^{+}\right)= & \left(1+r_{t+1}^n\right) \cdot \frac{v}{p_{t+1}} \cdot \frac{\left[\left(c^{+}\right)^\nu\left(1-l^{+}\right)^{1-\nu}\right]^{1-\frac{1}{\gamma}}}{c^{+}} \\
V_{e p^{+}}\left(z^{+}\right)= & \mathbb{1}_{j+1 \geq j_r} \cdot \kappa_{t+1} \bar{y}_{t+1} \cdot \frac{\nu}{p_{t+1}} \cdot \frac{\left[\left(c^{+}\right)^\nu\left(1-l^{+}\right)^{1-\nu}\right]^{1-\frac{1}{\gamma}}}{c^{+}} \\
& +\left[\mathbb{1}_{j+1<j_r} \cdot \frac{j}{j+1}+\mathbb{1}_{j+1 \geq j_r}\right] \cdot \beta E\left[V_{e p^{++}}\left(z^{++}\right) \mid \eta\right] .
\end{aligned}
\end{equation}
`)

Iterando la condición de primer orden hacia adelante, obtenemos:

#mitext(`
\begin{equation}
\beta^{i-j} E\left[\left.\frac{v}{p_{t+i-j}} \cdot \frac{\left[\left(c_i\right)^v\left(1-l_i\right)^{1-v}\right]^{1-\frac{1}{\gamma}}}{c_i} \right\rvert\, \eta_j\right]=\frac{\frac{v}{p_t} \cdot \frac{\left[\left(c_j\right)^v\left(1-l_j\right)^{1-v}\right]^{1-\frac{1}{\gamma}}}{c_j}}{\prod_{k=j+1}^i\left(1+r_{t+k-j}\right)}(I)
\end{equation}
`)

para $i lt.small j$.

Para la edad $j+1 = j_r$, la segunda ecuación del envolvente se reduce a

#mitext(`
\begin{equation}
V_{e p}\left(z_{j_r}\right)=\kappa_{t+1} \bar{y}_{t+1} \cdot \frac{v}{p_{t+1}} \cdot \frac{\left[\left(c_{j_r}\right)^\nu\left(1-l_{j_r}\right)^{1-\nu}\right]^{1-\frac{1}{\gamma}}}{c_{j_r}}+\beta E\left[V_{e p}\left(z_{j_r+1}\right) \mid \eta_j\right] (II)
\end{equation}
`)

con $s = t +1 +i -j_r$. Para cualquier $j+1 lt.small j_r$, tenemos

#mitext(`
\begin{equation}
\begin{aligned}
V_{e p}\left(z_{j+1}\right) & =\frac{j}{j+1} \cdot \beta E\left[V_{e p}\left(z_{j+2}\right) \mid \eta_j\right] \\
& =\frac{j}{j+1} \cdot \beta E\left[\left.\frac{j+1}{j+2} \cdot \beta E\left[V_{e p}\left(z_{j+3}\right) \mid \eta_j\right] \right\rvert\, \eta_j\right] \\
& =\frac{j}{j+2} \cdot \beta^2 E\left[V_{e p}\left(z_{j+3}\right) \mid \eta_j\right]=\ldots \\
& =\frac{j}{j_r-1} \cdot \beta^{j_r-(j+1)} E\left[V_{e p}\left(z_{j_r}\right) \mid \eta_j\right]
\end{aligned}
\end{equation}
`)

Sustituyendo $(II)$ tenemos 

#mitext(`
\begin{equation}
\beta E\left[V_{e p^{+}}\left(z^{+}\right) \mid \eta_j\right]=\frac{j}{j_r-1} \sum_{i=j_r}^J \kappa_s \bar{y}_s \cdot \beta^{i-j} E\left[\left.\frac{v}{p_s} \cdot \frac{\left[\left(c_i\right)^v\left(1-l_i\right)^{1-v}\right]^{1-\frac{1}{\gamma}}}{c_i} \right\rvert\, \eta_j\right],
\end{equation}
`)

con $s = t+i-j$. Sustituyendo ahora la ecuación $(I)$, tenemos:


#mitext(`
\begin{equation}
\frac{1-\lambda}{j \cdot \bar{y}_t} \cdot \frac{\beta E\left[V_{e p^{+}}\left(z^{+}\right) \mid \eta\right]}{\frac{\nu}{p_t} \cdot \frac{\left[c^\nu(1-l)^{1-\nu}\right]^{1-\frac{1}{\gamma}}}{c}}=\frac{1-\lambda}{\left(j_r-1\right) \cdot \bar{y}_t} \cdot \sum_{i=j_r}^J \frac{\kappa_s \bar{y}_s}{\prod_{k=j+1}^i\left(1+r_{t+k-j}\right)}
\end{equation}
`)

con $s = t+i-j$. 


En consecuencia, definimos la *tasa de impuesto implícita* del sistema de pensiones como

#mitext(`
\begin{equation}
\tau_{j, t}^{i m p l}=\tau_t^p-\frac{1-\lambda}{\left(j_r-1\right) \cdot \bar{y}_t} \cdot \sum_{i=j_r}^J \frac{\kappa_s \bar{y}_s}{\prod_{k=j+1}^i\left(1+r_{t+k-j}\right)}
\end{equation}
`)

Esta tasa de impuesto implícita toma en cuenta que, si $lambda lt.small 1$, los pagos a pensiones se incrementan al incrementarse los ingresos laborales y, como consecuencia, las contribuiciones a pensiones también se incrementan. Por lo tanto, las contribuciones  $tau_t^p$ son distintas para cada hogar.

/*
== Agregación

Con el objetivo de agregar las decisiones individuales para cada elemento del espacio de estados a las cantidades agregadas de la economía, necesitamos determinar la distribución de los hogares ϕt(z)ϕt​(z) en el espacio de estados. Se asume que, de alguna manera, hemos discretizado el espacio de estados. Podemos aplicar el procedimiento descrito por @fehr2018introduction.

#mitext(`
Se sabe  que a la edad $j=1$ los hogares mantienen cero activos, y que experimentan shock de productividad permanente $\hat{\theta}_i$ con probabilidad $\pi_i^\theta$, como también un shock transitorio en la productividad de $\eta_1=0$. De manera que tenemos:

$$
\phi_t\left(1,0, \hat{\theta}_i, \hat{\eta}_g\right)= \begin{cases}\pi_i^\theta & \text { si } g=\frac{m+1}{2} \\ 0 & \text { en otro caso. }\end{cases}
$$


Conociendo la distribución de los hogares sobre el espacio de estados a la edad 1 podemos calcular la distribución de cualquier combinación sucesiva edad-año al utilizar la función de política $a_t^{+}(z)$. Específicamente, para cada elemento del espacio de estados $z$ a la edad $j$ y tiempo $t$, podemos calcular los nodos de interpolación izquierdo y derecho, $\hat{a}_l$ y $\hat{a}_r$, como también el correspondiente peso de interpolación $\varphi$. Los nodos y el peso satisfacen

$$
a_t^{+}(z)=\varphi \hat{a}_l+(1-\varphi) \hat{a}_r
$$


Tomando en cuenta las probabilidades de transición para el shock de productividad transitorio $\eta_{g g^{+}}$, se distribuye la masa de individuos en el estado $z$ al espacio de estados correspondiente a la edad y periodo siguientes $j+1$ y $t+$ 1 de acuerdo a la siguiente expresión:

$$
\begin{aligned}
& \phi_{t+1}\left(z^{+}\right)=\left\{\begin{array}{lll}
\phi_{t+1}\left(z^{+}\right)+\varphi \pi_{g g^{+}} \phi_t(z) & \text { si } & \nu=l \\
\phi_{t+1}\left(z^{+}\right)+(1-\varphi) \pi_{g g^{+}} \phi_t(z) & \text { si } & \nu=r
\end{array}\right)
\end{aligned}
$$

con $z^{+}=\left(j+1, \hat{a}_\nu, \hat{\theta}_i, \hat{\eta}_{g^{+}}\right)$

La medida de distribución $\phi_t(z)$ satisface

$$
\sum_{\nu=0}^n \sum_{i=1}^2 \sum_{g=1}^m \phi_t(z)=1
$$

para cualquier edad $j$ al tiempo $t$. De manera que podemos calcular agregados específicos a cada cohorte

$$
\begin{gathered}
\bar{c}_{j, t}=\sum_{\nu=0}^n \sum_{i=1}^2 \sum_{g=1}^m \phi_t(z) c_t(z) \\
\bar{l}_{j, t}=\sum_{\nu=0}^n \sum_{i=1}^2 \sum_{g=1}^m \phi_t(z) h_t(z) l_t(z) \\
\bar{a}_{j, t}=\sum_{\nu=0}^n \sum_{i=1}^2 \sum_{g=1}^m \phi_t(z) \hat{a}_\nu
\end{gathered}
$$

Para cada una de esas agregaciones a nivel de cohorte, podemos calcular las cantidades para el conjunto de la economía. Para esto, tenemos que ponderar las variables de cada cohorte con el respectivo tamaño relativo de cada cohorte $m_j$ y su probabilidad de supervivencia $\psi_j$. En consecuencia, tenemos

$$
\begin{aligned}
C_t & =\sum_{j=1}^J \frac{m_{j, t}}{\psi_{j, t}} \bar{c}_{j, t} \\
L_t^s & =\sum_{j=1}^J \frac{m_{j, t}}{\psi_{j, t}} \bar{l}_{j, t} \\
A_t & =\sum_{j=1}^J \frac{m_{j, t}}{\psi_{j, t}} \bar{a}_{j, t}
\end{aligned}
$$
`)
*/
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

== Gobierno
#mitext(`
El gobierno administra dos sistemas : un sistema de impuestos y un sistema de pensiones, ambos operando en equilibrio presupuestario.

El gobierno recolecta impuestos sobre el el gasto en consumo, ingreso laboral e ingreso de capital con el objetivo de financiar su gasto público $G_t$ y pagos relacionados al stock de deuda $B_t$. En el equilibrio inicial, el gasto público es igual a una razón constante del GDP, esto es, $G=g_y Y$. En periodos posteriores, el nivel de bienes públicos se mantiene constante (per cápita), lo que significa que $G_t=G$. Lo mismo aplica para la deuda pública, donde la razón inicial es denominada $b_y$. En cualquier punto en el tiempo el presupuesto del sistema de impuestos es balanceado si se cumple la igualdad

$$
\tau_t^c C_t+\tau_t^w w_t L_t^s+\tau_t^r r_t A_t+\left(1+n_p\right) B_{t+1}=G_t+\left(1+r_t\right) B_t
$$


Además de los ingresos por impuestos, el gobierno financia su gasto al contratar nueva deuda $\left(1+n_p\right) B_{t+1}$. Sin embargo, debe repagar la actual deuda incluyendo intereses sobre los pagos de manera que tenemos que agregar $\left(1+r_t\right) B_t$ al consumo de gobierno en el lado del gasto. De manera que, en un equilibrio de estado estacionario, el gasto $\left(r-n_p\right) B$ refleja el costo necesitado para mantener el nivel de deuda constante. Nótese que no se ha hecho ninguna restricción a priori acerca de que tasa de impuesto tiene que ajustarse con el objetivo de balancear el presupuesto en el tiempo.

El sistema de pensiones opera en un esquema pay-as-you-go, lo que significa que recolecta contribuciones de las generaciones en edad de trabajar y directamente las distribuye a los retirados actuales. La ecuación de balance del presupuesto del sistema de pensiones está dada por

$$
\tau_t^p w_t L_t^{\text{supply}, s=0}=\text{pen}_t N^R \quad \text { con } \quad N^R=\sum_{j=j_r}^J m_{j, s=0} \psi_j
$$

donde $N^R$ denota la cantidad de retirados formales.

Se asume que la tasa de reemplazo $\kappa$ está dada de forma exógena mientras que la tasa de contribución $\tau_t^p$ se ajusta con el objetivo de balancear el presupuesto.

El beneficio de la pensión se calcula por la suma de earnings points acumulados durante el periodo laboral y el \textit{monto actual de pensión}, APA\footnote{Actual Pension Amount.} que refleja el valor monetario de cada earning point, multiplicado por la tasa de reemplazo $\kappa$ 

\begin{equation}
p_j = \kappa \times \text{ep}_{j_r} \times \text{APA}
\end{equation}

Con el tiempo, APA crece con los ingresos laborales brutos.
`)

== Mercados
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
