#import "@preview/mitex:0.2.5": *

= Model
== Introduction

A Dynamic Stochastic Heterogeneous Agent Overlapping Generations (DSOLG) Model was developed to estimate changes in fiscal policy.


Unlike infinite-horizon representative-agent models,
this approach allows for the incorporation of @nishiyama2014analyzing : 

- Life cycle characteristics that are important for determining savings and labor supply choices.
- Intra-generational heterogeneity in households, which is necessary to analyze the impact of policy changes on income and wealth distribution.
- Inter-generational heterogeneity in households to analyze the timing of taxes and their effects on intergenerational distribution.

One generation of OLG models are those that incorporate uncertainty in
form of idiosyncratic shocks at the household level (labor income,
longevity risk, etc.) and determinism in aggregate variables @nishiyama2014analyzing

Idiosyncratic shocks affect agents in different ways,
respond heterogeneously within a cohort @fehr2018introduction #footnote[In contrast to the representative agent approach where it is implicitly defined
that individuals can protect themselves against any form of idiosyncratic shock]

These models are used to calculate transition effects of policy changes from one steady state to the next.

The dynamics of the transition are also used to analyze the
welfare impacts of fiscal policy reforms that may
benefit future generations at the expense of the transition generations.

The model presented here belongs to this generation of OLG models. It is a dynamic and stochastic general equilibrium model that incorporates idiosyncratic risks in labor productivity.
The aggregate quantities of the economy grow on a balanced growth path given by the population growth rate. $n_p$.

== Demography
In each period $t$, The economy is populated by $J$ overlapping generations indexed by $j=1, dots, J$. 

The model integrates the so-called *intensive margin of informality*, specifically workers who are employed in formal economic units but who do not have an employer relationship, labor benefits defined by law, or social security.#footnote[The *intensive margin of informality* is even larger, as it includes workers employed in the *informal sector*. INEGI defines the informal sector as economic activities that operate with household resources, without being formally constituted as businesses, where it is impossible to distinguish between the economic unit and the household. In other words, there are two ways to conceptualize informality: according to the economic sector where the worker is employed and according to their employment status. The model incorporates *informal* workers employed in formal economic units and *formal* workers. The model could consider informal workers employed in the informal sector by considering economic units that face a production function that uses only the labor factor.] When individuals enter the labor market, they are assigned as informal or formal workers according to a probability distribution $omega_s$#footnote[This distribution is calculated empirically using the INEGI Hussmans matrix] . The indicator variable $m_s in [0,1]$ denotes the worker's employment status, where $m_s=0$ This applies to formal workers and $m_s = 1$ to informal workers. The probability of transition between both states is fixed and does not depend on age:

#mitext(`
\begin{equation}
\pi_{j, m, m^{+}}=\operatorname{Pr}\left(m_{j+1}=m^{+} \mid m_j=m\right) \quad \text { con } \quad m, m^{+} \in\{0,1\},
\end{equation}
 `)

It is assumed that survival from one period to the next is stochastic and that $psi_j$ is the probability that an agent will survive to old age $j-1$ at the age $j$, conditional on living at the age $j-1$#footnote[It is assumed that formal and informal workers have the same survival rate].

          #mitext(`
 The unconditional probability of surviving to old age $j$ is given by $\Pi_{i=1}^j \psi_i$ with $\psi_1=1$. Since the number of members in each cohort declines with age, the cohort size corresponding to age $j$ in the period $t$ is

$$
N_{j, s, t}=\psi_{j, t} N_{j-1, s, t-1} \quad \text { con } \quad N_{1, s, t}=\left(1+n_{p, t}\right) N_{1, s, t-1}
$$


Consequently, cohort weights (relative population ratios) are defined as $m_{1, s, t}=1$ y $m_{j, s, t}= \frac{\psi_{j, t}}{1+n_{p, t}} m_{j-1, s, t-1}$.

It is assumed that the population grows at a constant rate. $n_{p,t} = n_p$ and it is the same for both population groups.

The balanced growth trajectory, where all aggregate variables grow at the same rate, is set to the growth rate of the youngest cohort. These aggregate variables are then normalized over time $t$ due to the size of the younger cohort living during that period.
          `)

All officers retire at age $j_r$. Agents who worked in the formal sector begin receiving a pension, which is funded by payroll tax. During their working years, formal sector employees accumulate earning points $e p_j$ that define their pension payments when they retire.

For simplicity, we will omit the index $s$ as much as possible.
 
== Household decisions

=== Phousehold references
#mitext(`
Individuals have consumption preferences $c_{j, t}$ and leisure $l_{j, t}$, They also pay consumption and income taxes, as well as a payroll tax to the pension system. It is assumed that the time allocation is equal to 1.

With $l_{j, t}$ denoting the amount of labor hours offered to the market in the period $t$, we have $\mathrm{l}_{j, t}+ l_{j, t}=1$. The utility function of households is defined as

$$
E\left[\sum_{j=1}^J \beta^{j-1}\left(\Pi_{i=2}^j \psi_{i, s} m_{i-1,s}\right) u\left(c_{j, s}, 1-l_{j, s}\right)\right]
$$

where $\beta$ denotes the time discount factor. As can be seen, the expected marginal utility of future consumption is also conditional on the current employment status $m$.

The household utility function is given by

$$
u\left(c_{j, t}, 1-l_{j, t}\right)=\frac{\left[\left(c_{j, t}\right)^\nu\left(1-l_{j, t}\right)^{(1-\nu)}\right]^{\left(1-\frac{1}{\gamma}\right)}}{1-\frac{1}{\gamma}}
$$


The consumption and leisure utility takes the form of a Cobb-Douglas function with one parameter $\nu$ preference between leisure and consumption. The intertemporal elasticity of substitution is constant and equal to $\gamma$, where $\frac{1}{\gamma}$ It is the household's risk aversion.
`)

=== Risk of survival and inheritance
#mitext(`
Since there are no annuity markets, the return on individual assets corresponds to the net interest rate.

In a scenario where there is no risk of longevity, individuals know with certainty when their lives will end. Consequently, they are able to perfectly plan when they want to spend all their savings.

There is uncertainty about survival here, so agents may die before reaching their maximum lifespan $J$ and, as a consequence, leave an inheritance. It is defined $b_{j, t}$ like the inheritance that an agent at age $j$ receives in the period $t$.

The amount of inheritance for each cohort can be calculated using the expression:

$$
b_{j, t}=\Gamma_{j, t} B Q_t
$$

where $B Q_t$ defines the aggregate inheritance in the period $t$, or simply the fraction of total assets that can be attributed to those who died at the end of the previous period (including interest).

$$
B Q_t=r_t^n \sum_{j=2}^J a_{j, t} \frac{m_{j, t}}{\psi_{j, t}}\left(1-\psi_{j, t}\right)
$$

where $r_t^n$ is the net interest rate in $t$ and $a_{j,s,t}$ are the cohort's assets $j$, of the group $s$, in $t$.
`)


=== Risk to labor productivity
#mitext(`
Individuals differ with respect to their work productivity $h_{j, t}$, which depends on a (deterministic) income profile by age $e_{j,s}$ which depends on the type of work, a fixed productivity effect $\theta$ which is defined at the beginning of the life cycle and which, likewise, depends on the type of work (formal and informal) to which they are assigned\footnote{It represents a permanent shock}. In addition, an idiosyncratic shock is added through an autoregressive component $\eta_{j, t}$ that evolves over time and has an autoregressive structure of order 1, so that

$$
\eta_j=\rho \eta_{j-1}+\epsilon_j \quad \text { con } \quad \epsilon_j \sim N\left(0, \sigma_\epsilon^2\right) \quad \text { y } \quad \eta_1=0
$$


Given this structure, household labor productivity is

$$
h_j= \begin{cases}e_j \exp \left[\eta_j\right] & \text { si } j<j_r \\ 0 & \text { si } j \geq j_r\end{cases}
$$
`)

=== Consumer Decision Problem
The state of individuals is characterized by the state vector#footnote[It is assumed that productivity shocks are independent between individuals and identically distributed among individuals of a specific type of work.]
#mitext(`
\begin{equation}
z_j = (J, a, ep, s, \eta)
\end{equation}
`)


Households maximize the utility function subject to the intertemporal budget constraint

#mitext(`
\begin{equation}
a_{j+1, s, t}=\left\{\begin{array}{l}
\left(1+r_t^n\right) a_{j, s, t-1}+w_t^n h_{j, s, t} l_{j, s, t}+b_{j, s, t}+p e n_{j, s, t}-p_t c_{j, s, t} \quad \text { si }  s=0 \\
\left(1+r_t^n\right) a_{j, s, t-1}+w_t h_{j, s, t} l_{j, s, t}+b_{j, s, t}-p_t c_{j, s, t} \text{ si } s=1
\end{array}\right.
\end{equation}
`)

where:

- #mitext(`$a_{j, t}$ These are the agent's savings assets in the period t ,`)
- #mitext(`$w_t^n=w_t\left(1-\tau_t^w-\tau_{j, t}^{i m p l} \right)$ It is the net wage rate, which is equal to the market wage $w_t$ less taxes on employment income $\tau_{j, t}^{i m p l}$ and the payroll tax to finance the pension system $\tau_t^p$`)
- #mitext(`$r_t^n=r_t\left(1-\tau_t^r\right)$ It is the net interest rate, which is equal to the market interest rate. $r_t$ deducting the capital gains tax $\tau_t^r$,`)
- #mitext(`$p_t=1+\tau_t^c$ It is the consumer price which is normalized to one and the consumption taxes are added $\tau_t^c$.`)


An additional non-negativity restriction on savings is added. #mitext(`$a_{j+1, s} \geq 0$`)

== Dynamic programming problem

The agent optimization problem is as follows:

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

where $z=(j, a, ep, s, \eta)$ is the vector of individual state variables. Note that a time index was placed on the value function and on the prices. This is necessary to calculate the dynamics of the transition between two stationary states. The terminal condition of the value function is

$$
V_t(z)=0 \quad \text { para } \quad z=(J+1, a, ep, s, \eta)
$$

which means that it is assumed that the agents do not value what happens after death.

We formulate the solution to the household problem by recognizing that we can write the working hours and consumption functions as functions of $a^{+}$:

$$
\begin{aligned}
l=l\left(a^{+}\right) & =\min \left\{\max \left[\nu+\frac{1-\nu}{(w_t^n * (1-m) + w_t *m) h}\left(a^{+}-\left(1+r_t^n\right) a -  \text { pen }*( 1-m) \right), 0\right], 1\right\} \\
c & =c\left(a^{+}\right)=\frac{1}{p_t}\left[\left(1+r_t^n\right) a+(w_t^n * (1-m) + w_t *m)  h l\left(a^{+}\right)+\text {pen }*(1-m)-a^{+}\right]
\end{aligned}
$$



With the definition of the \textbf{implicit tax rate} (See next section), The first-order conditions of households are defined as

\begin{equation}
\begin{aligned}
& \frac{v}{p_t} \cdot \frac{\left[c^\nu(1-l)^{1-\nu}\right]^{1-\frac{1}{\gamma}}}{c}=\beta E\left[V_{a^{+}}\left(z^{+}\right) \mid \eta\right] \\
& \frac{1-\nu}{v} \cdot p_t c=w_t h(1-l)\left\{1-\tau_t^w-\tau_{j, t}^{i m p l}\right\}
\end{aligned}
\end{equation}

where $a^{+}$ is unknown. Note that $\tau_{j, t}^{i m p l} = \tau_{t}^p$ para $\lambda = 1$, which reduces to the original model.
`)

=== Household income and expenses through the pension system
At the mandatory retirement age $j_r$, labor productivity falls to zero and
Households receive a pension $p e n_(j,t)$ , which is based on the individual's salary history. In order to track and account for past salaries as well as pension contributions, an *earning points* statement is added, $e p$, which captures individual gross incomes relative to the average income of the entire economy for each year of contribution#footnote[This revenue tracking mechanism is taken from @fehr2013should, which is how the German pension system works.] @fehr2013should


#mitext(`
\begin{equation}
e p_{j+1}=\left[e p_j \times(j-1)+\left(\lambda+(1-\lambda) \frac{w h l_j}{\bar{y}}\right)\right] / j
\end{equation}
`)

where the parameter $lambda$ indicates the level of *progressivity* of the pension system @fehr2018introduction. When $lambda = 1$ The pension is independent of previous contributions and is equal to the fraction of the pension system's replacement rate $kappa$ of the average labor income in the period $t$, this is:


#mitext(`
$$
\text { pen }_j= \begin{cases}0 & \text { si } j<j_r \\ \kappa_t \frac{w_t}{j_r-1} \sum_{j=1}^{j_r-1} e_j, & \text { si } j \geq j_r\end{cases}
$$
`)

When $lambda = 0$, The pension depends entirely on the worker's salary history. During the worker's retirement phase $j gt.eq j_r $, Salary points remain constant and the pension is calculated as

#mitext(`
\begin{equation}
\operatorname{pen}_j=\kappa_t \times e p_{j_r} \times \bar{y}
\end{equation}
`)

The earning points evolve according to the equation:
#mitext(`
\begin{equation}
e p^{+}= \begin{cases}\frac{j-1}{j} \cdot e p+\frac{1}{j} \cdot\left[\lambda+(1-\lambda) \cdot \frac{w_t h l}{y_t}\right] & \text { si } j<j_r,  \\ e p & \text { en caso contrario. }\end{cases}
\end{equation}
`)

This equation integrates two parts:
- The accumulation phase, $j lt.small j_r $
- The yield phase, $j gt.eq j_r $

The household budget constraint changes to:

#mitext(`
\begin{equation}
a^{+}+p_t c=\left(1+r_t^n\right) a+w_t^n h l+\mathbb{1}_{j \geq j_r} \kappa_t \bar{y}_t e p
\end{equation}
`)

The pension benefit is received until retirement age is reached $j_r$ and is equal to the product of the current replacement rate $kappa_t$, the average income $overline(y)$ as well as the points of income accumulated by the worker $e p$.

The Lagrangian of the household optimization problem is written:

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

with the following first-order conditions:

#mitext(`
\begin{equation}
\begin{aligned}
& \frac{\nu}{p_t} \cdot \frac{\left[c^\nu(1-l)^{1-\nu}\right]^{1-\frac{1}{\gamma}}}{c}=\beta E\left[V_{a^{+}}\left(z^{+}\right) \mid \eta\right] \\
& \frac{1-\nu}{\nu} \cdot p_t c=w_t h(1-l)\left\{1-\tau_t^w-\tau_t^p+\frac{1-\lambda}{j \cdot \bar{y}} \cdot \frac{\beta E\left[V_{e p^{+}}\left(z^{+}\right) \mid \eta\right]}{\frac{\nu}{p_t} \cdot \frac{\left[c^\nu(1-l)^{1-\nu}\right]^{1-\frac{1}{\gamma}}}{c}}\right\}
\end{aligned}
\end{equation}
`)

When $lambda = 1$, the part of the equation

#mitext(`
\begin{equation}
\frac{1-\lambda}{j \cdot \bar{y}} \cdot \frac{\beta E\left[V_{e p^{+}}\left(z^{+}\right) \mid \eta\right]}{\frac{\nu}{p_t} \cdot \frac{\left[c^\nu(1-l)^{1-\nu}\right]^{1-\frac{1}{\gamma}}}{c}}
\end{equation}
`)

It becomes zero, and we are faced with the base case of a flat pension, independent of previous contributions.

From the envelope theorem we obtain:

#mitext(`
\begin{equation}
\begin{aligned}
V_{a^{+}}\left(z^{+}\right)= & \left(1+r_{t+1}^n\right) \cdot \frac{v}{p_{t+1}} \cdot \frac{\left[\left(c^{+}\right)^\nu\left(1-l^{+}\right)^{1-\nu}\right]^{1-\frac{1}{\gamma}}}{c^{+}} \\
V_{e p^{+}}\left(z^{+}\right)= & \mathbb{1}_{j+1 \geq j_r} \cdot \kappa_{t+1} \bar{y}_{t+1} \cdot \frac{\nu}{p_{t+1}} \cdot \frac{\left[\left(c^{+}\right)^\nu\left(1-l^{+}\right)^{1-\nu}\right]^{1-\frac{1}{\gamma}}}{c^{+}} \\
& +\left[\mathbb{1}_{j+1<j_r} \cdot \frac{j}{j+1}+\mathbb{1}_{j+1 \geq j_r}\right] \cdot \beta E\left[V_{e p^{++}}\left(z^{++}\right) \mid \eta\right] .
\end{aligned}
\end{equation}
`)

Iterating the first-order condition forward, we obtain:

#mitext(`
\begin{equation}
\beta^{i-j} E\left[\left.\frac{v}{p_{t+i-j}} \cdot \frac{\left[\left(c_i\right)^v\left(1-l_i\right)^{1-v}\right]^{1-\frac{1}{\gamma}}}{c_i} \right\rvert\, \eta_j\right]=\frac{\frac{v}{p_t} \cdot \frac{\left[\left(c_j\right)^v\left(1-l_j\right)^{1-v}\right]^{1-\frac{1}{\gamma}}}{c_j}}{\prod_{k=j+1}^i\left(1+r_{t+k-j}\right)}(I)
\end{equation}
`)

For $i lt.small j$.

For age $j+1 = j_r$, the second equation of the envelope reduces to

#mitext(`
\begin{equation}
V_{e p}\left(z_{j_r}\right)=\kappa_{t+1} \bar{y}_{t+1} \cdot \frac{v}{p_{t+1}} \cdot \frac{\left[\left(c_{j_r}\right)^\nu\left(1-l_{j_r}\right)^{1-\nu}\right]^{1-\frac{1}{\gamma}}}{c_{j_r}}+\beta E\left[V_{e p}\left(z_{j_r+1}\right) \mid \eta_j\right] (II)
\end{equation}
`)

with $s = t +1 +i -j_r$. For any $j+1 lt.small j_r$, we have

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

Substituting $(II)$ we have

#mitext(`
\begin{equation}
\beta E\left[V_{e p^{+}}\left(z^{+}\right) \mid \eta_j\right]=\frac{j}{j_r-1} \sum_{i=j_r}^J \kappa_s \bar{y}_s \cdot \beta^{i-j} E\left[\left.\frac{v}{p_s} \cdot \frac{\left[\left(c_i\right)^v\left(1-l_i\right)^{1-v}\right]^{1-\frac{1}{\gamma}}}{c_i} \right\rvert\, \eta_j\right],
\end{equation}
`)

with $s = t+i-j$. Now substituting the equation $(I)$, we have:


#mitext(`
\begin{equation}
\frac{1-\lambda}{j \cdot \bar{y}_t} \cdot \frac{\beta E\left[V_{e p^{+}}\left(z^{+}\right) \mid \eta\right]}{\frac{\nu}{p_t} \cdot \frac{\left[c^\nu(1-l)^{1-\nu}\right]^{1-\frac{1}{\gamma}}}{c}}=\frac{1-\lambda}{\left(j_r-1\right) \cdot \bar{y}_t} \cdot \sum_{i=j_r}^J \frac{\kappa_s \bar{y}_s}{\prod_{k=j+1}^i\left(1+r_{t+k-j}\right)}
\end{equation}
`)

with $s = t+i-j$. 


Therefore, we define the *implicit tax rate* of the pension system as

#mitext(`
\begin{equation}
\tau_{j, t}^{i m p l}=\tau_t^p-\frac{1-\lambda}{\left(j_r-1\right) \cdot \bar{y}_t} \cdot \sum_{i=j_r}^J \frac{\kappa_s \bar{y}_s}{\prod_{k=j+1}^i\left(1+r_{t+k-j}\right)}
\end{equation}
`)

This implicit tax rate takes into account that, if $lambda lt.small 1$, Pension payments increase as employment income increases, and consequently, pension contributions also increase. Therefore, contributions $tau_t^p$ They are different for each household.

/*
== Aggregation

In order to aggregate individual decisions for each element of the state space to the aggregate quantities of the economy, we need to determine the distribution of households ϕt(z)ϕt​(z) in the state space. It is assumed that we have somehow discretized the state space. We can apply the procedure described by @fehr2018introduction.

#mitext(`
It is known that at the age $j=1$ Households maintain zero assets, and experience a permanent productivity shock $\hat{\theta}_i$ with probability $\pi_i^\theta$, as well as a transient shock in productivity from $\eta_1=0$. So we have:

$$
\phi_t\left(1,0, \hat{\theta}_i, \hat{\eta}_g\right)= \begin{cases}\pi_i^\theta & \text { si } g=\frac{m+1}{2} \\ 0 & \text { en otro caso. }\end{cases}
$$


Knowing the distribution of households over state space at age 1, we can calculate the distribution of any successive age-year combination using the policy function $a_t^{+}(z)$. Specifically, for each element of the state space $z$ at age $j$ and time $t$, we can calculate the left and right interpolation nodes, $\hat{a}_l$ and $\hat{a}_r$, as well as the corresponding interpolation weight $\varphi$. The nodes and weight satisfy

$$
a_t^{+}(z)=\varphi \hat{a}_l+(1-\varphi) \hat{a}_r
$$


Taking into account the transition probabilities for the transient productivity shock $\eta_{g g^{+}}$, The mass of individuals in state $z$ is distributed to the state space corresponding to the following age and period $j+1$ and $t+1 according to the following expression:

$$
\begin{aligned}
& \phi_{t+1}\left(z^{+}\right)=\left\{\begin{array}{lll}
\phi_{t+1}\left(z^{+}\right)+\varphi \pi_{g g^{+}} \phi_t(z) & \text { si } & \nu=l \\
\phi_{t+1}\left(z^{+}\right)+(1-\varphi) \pi_{g g^{+}} \phi_t(z) & \text { si } & \nu=r
\end{array}\right)
\end{aligned}
$$

with $z^{+}=\left(j+1, \hat{a}_\nu, \hat{\theta}_i, \hat{\eta}_{g^{+}}\right)$

The distribution measure $\phi_t(z)$ satisfies

$$
\sum_{\nu=0}^n \sum_{i=1}^2 \sum_{g=1}^m \phi_t(z)=1
$$

for any age $j$ at time $t$. So we can calculate aggregates specific to each cohort

$$
\begin{gathered}
\bar{c}_{j, t}=\sum_{\nu=0}^n \sum_{i=1}^2 \sum_{g=1}^m \phi_t(z) c_t(z) \\
\bar{l}_{j, t}=\sum_{\nu=0}^n \sum_{i=1}^2 \sum_{g=1}^m \phi_t(z) h_t(z) l_t(z) \\
\bar{a}_{j, t}=\sum_{\nu=0}^n \sum_{i=1}^2 \sum_{g=1}^m \phi_t(z) \hat{a}_\nu
\end{gathered}
$$

For each of these cohort-level aggregations, we can calculate the quantities for the entire economy. To do this, we need to weight the variables of each cohort by its respective relative size $m_j$ and its survival probability $\psi_j$. Consequently, we have

$$
\begin{aligned}
C_t & =\sum_{j=1}^J \frac{m_{j, t}}{\psi_{j, t}} \bar{c}_{j, t} \\
L_t^s & =\sum_{j=1}^J \frac{m_{j, t}}{\psi_{j, t}} \bar{l}_{j, t} \\
A_t & =\sum_{j=1}^J \frac{m_{j, t}}{\psi_{j, t}} \bar{a}_{j, t}
\end{aligned}
$$
`)
*/
== Technology 
#mitext(`
Firms hire capital $K_t$ and labor $L_t$ in a perfectly competitive factor market to produce a single good $Y_t$ according to a production technology given by a Cobb-Douglas production function

$$
Y_t=\Omega K_t^\alpha L_t^{1-\alpha}
$$

where $\Omega$ It is the level of technology that is constant over time. Capital depreciates at a rate $\delta$, so the capital stock evolves according to the following expression

$$
\left(1+n_p\right) K_{t+1}=(1-\delta) K_t+I_t
$$


Under the assumption of perfect competition, the inverse functions of the firm's demand for capital and labor are given by

$$
\begin{aligned}
& r_t=\alpha \Omega\left[\frac{L_t}{K_t}\right]^{(1-\alpha)}-\delta \\
& w_t=(1-\alpha) \Omega\left[\frac{K_t}{L_t}\right]^\alpha
\end{aligned}
$$

`)

== Government
#mitext(`
The government manages two systems: a tax system and a pension system, both operating in budgetary balance.

The government collects taxes on consumption expenditure, labor income, and capital income to finance its public spending $G_t$ and debt-related payments $B_t$. In the initial equilibrium, public spending equals a constant ratio of GDP, that is, $G=g_y Y$. In subsequent periods, the level of public goods remains constant (per capita), meaning that $G_t=G$. The same applies to public debt, where the initial ratio is denoted $b_y$. At any point in time, the tax system's budget is balanced if the following equality holds:

$$
\tau_t^c C_t+\tau_t^w w_t L_t^s+\tau_t^r r_t A_t+\left(1+n_p\right) B_{t+1}=G_t+\left(1+r_t\right) B_t
$$


In addition to tax revenues, the government finances its spending by taking on new debt $\left(1+n_p\right) B_{t+1}$. However, it must repay the existing debt, including interest on the payments, so we have to add $\left(1+r_t\right) B_t$ to government consumption on the expenditure side. Thus, in a steady-state equilibrium, spending $\left(r-n_p\right) B$ reflects the cost needed to keep the debt level constant. Note that no a priori constraint has been placed on which tax rate needs to be adjusted to balance the budget over time.

The pension system operates on a pay-as-you-go scheme, meaning it collects contributions from the working-age generation and distributes them directly to current retirees. The pension system's budget balance equation is given by

$$
\tau_t^p w_t L_t^{\text{supply}, s=0}=\text{pen}_t N^R \quad \text { con } \quad N^R=\sum_{j=j_r}^J m_{j, s=0} \psi_j
$$

where $N^R$ denotes the number of formal retirees.

It is assumed that the replacement rate $\kappa$ is given exogenously while the contribution rate $\tau_t^p$ is adjusted with the aim of balancing the budget.

The pension benefit is calculated by the sum of earnings points accumulated during the working period and the \textit{current pension amount}, APA\footnote{Actual Pension Amount.} which reflects the monetary value of each earning point, multiplied by the replacement rate $\kappa$ 

\begin{equation}
p_j = \kappa \times \text{ep}_{j_r} \times \text{APA}
\end{equation}

Over time, APA grows with gross labor income.
`)

== Market
#mitext(`
There are three markets in the economy: the capital market, the labor market, and the goods market. With respect to the factor markets, the price of capital $r_t$ and labor $w_t$ adjust to clear the market; that is:

$$
K_t+B_t=A \quad \text { y } \quad L_t=L_t^s
$$


Note that there are two sectors that demand savings from households. The business sector uses savings as capital in the production process, while the government uses them as public debt to finance its spending. The government and businesses compete in perfect competition in the capital market.

With respect to the goods market, all products produced must be used either for consumption by the private sector or the government, or as investment in the future capital stock. Thus, equilibrium in the goods market is given by

$$
Y_t=C_t+G_t+I_t
$$
`)
