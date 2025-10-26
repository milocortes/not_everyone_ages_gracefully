
###############################################################################
# PROGRAM SOLG_TR_PEN
#
# ## Implicit tax rates in the pension system
#
# This code is published under the GNU General Public License v3
#                         (https://www.gnu.org/licenses/gpl-3.0.en.html)
#
# Authors: Hans Fehr, Maurice Hofmann and Fabian Kindermann
#          contact@ce-fortran.com
#
###############################################################################
using Pkg

Pkg.activate("env")

include("src/utils_dsge_olg_model.jl")

using OffsetArrays
#using Plots
using DataFrames
using CSV 

# Obten parámetros
pais = "MEX"
OLG_params = build_parameters(pais, "parametros_olg.csv")

# number of transition periods
global TT = 40

# number of years the household lives
global JJ = 16

# number of years the household retires
global JR = 10

# number of persistent shock process values
global NP = 1

# number of transitory shock process values
global NS = 5

# number of points on the asset grid
global NA = 100

# number of points on the earnings points grid for retirement
global NR = 10

# household preference parameters
global gamma = 0.18
global egam = 1.0 - 1.0/gamma
global nu    = 0.45 #OLG_params["nu"]# 2015 -- 0.3890
global beta  = 0.998^5

# household risk process
global sigma_eps   = 0.05
global rho         = 0.98

# health cost parameters
global phi_l = 0.0
global chi = 0.80
global varrho = 0.20

# production parameters
global alpha = OLG_params["alpha"] # 2015 -- 0.6220
global delta = 1.0-(1.0-OLG_params["delta"])^5 # 2015 -- 0.1776
global Omega = 1.65

# size of the asset grid
global a_l    = 0.0
global a_u    = 55.0
global a_grow = 0.05

# size of the earnings point grid
global ep_l    = 0.0
global ep_u    = 10.0
global ep_grow = 0.02

# demographic parameters
global n_p   = (1.0+OLG_params["np"])^5-1.0 # 2015 -- 0.11167

# simulation parameters
global damp    = 0.30
global sig     = 1e-4
global itermax = 50

# counter variables
#integer :: iter

# macroeconomic variables
for param = [:r, :rn, :w, :wn, :wn_inf_intensivo, :p, :KK, :AA, :BB, :LL, :LL_FORMAL, :LL_INFORMAL, :WORKPOP, :WORKPOP_FORMAL, :WORKPOP_INFORMAL, :HH, :YY, :CC, :II, :GG, :BQ]
    @eval global $param = OffsetArray(zeros(TT+1), 0:TT)
end

# government variables
global gy
global by

for param = [:tauc , :tauw, :taur, :taup, :kappa, :lambda, :PP, :tax]
    @eval global $param = OffsetArray(zeros(TT+1), 0:TT)
end

global tau_impl = OffsetArray(zeros(JJ, TT+1), 1:JJ, 0:TT)
global taxrev = OffsetArray(zeros(4,TT+1), 1:4,0:TT)


# LSRA variables
for param = [:BA, :SV]
    @eval global $param = OffsetArray(zeros(TT+1),0:TT)
end

global lsra_comp
global lsra_all
global Lstar
global lsra_on

# cohort aggregate variables
for param = [:c_coh, :l_coh, :y_coh, :a_coh, :v_coh, :VV_coh, :frac_phi, :beq_coh]
    @eval global $param = OffsetArray(zeros(JJ, NP+1, TT+1), 1:JJ, 0:NP, 0:TT)
end

global pen = OffsetArray(zeros(JJ, TT+1), 1:JJ, 0:TT)

# Bequest params
global omega = zeros(JJ)
global GAM = OffsetArray(zeros(JJ, TT+1), 1:JJ, 0:TT)
global beq = OffsetArray(zeros(JJ, TT+1), 1:JJ, 0:TT)

# Survival params
global psi = OffsetArray(zeros(JJ+1, TT+1), 1:JJ+1, 0:TT)

# the shock process
global dist_theta = OffsetArray(zeros(NP+1), 0:NP)
global theta = OffsetArray(zeros(NP+1), 0:NP)
global pi = zeros(NS, NS)
global eta = zeros(NS)

global pi_m = OffsetArray(zeros(JJ, NP+1, NP+1), 1:JJ, 0:NP, 0:NP)

global is_initial = 4

# demographic and other model parameters
for param = [:m, :pop, :m_adjusted]
    @eval global $param = OffsetArray(zeros(JJ, NP+1, TT+1), 1:JJ, 0:NP, 0:TT)
end

global workpop = OffsetArray(zeros(TT+1), 0:TT)
global INC = OffsetArray(zeros(TT+1), 0:TT)

global eff =  OffsetArray(zeros(JJ, NP+1), 1:JJ, 0:NP)

# individual variables
global a = OffsetArray(zeros(NA+1), 0:NA)
global ep = OffsetArray(zeros(NR+1), 0:NR)

for param = [:aplus, :epplus, :c, :l, :phi, :VV, :v]
    @eval global $param = OffsetArray(zeros(JJ, NA+1, NR+1, NP+1, NS, TT+1), 1:JJ, 0:NA, 0:NR, 0:NP, 1:NS, 0:TT)
end

global penp = OffsetArray(zeros(JJ, TT+1, NR+1), 1:JJ, 0:TT, 0:NR)
#global penp = OffsetArray(zeros(JJ, TT+1, NR+1, NP+1), 1:JJ, 0:TT, 0:NR, 0:NP)

global FLC = OffsetArray(zeros(JJ, NP+1, TT+1), 1:JJ, 0:NP, 0:TT)


# numerical variables
global RHS = OffsetArray(zeros(JJ, NA+1, NR+1, NP+1, NS, TT+1), 1:JJ, 0:NA, 0:NR, 0:NP, 1:NS, 0:TT)
global EV = OffsetArray(zeros(JJ, NA+1, NR+1, NP+1, NS, TT+1), 1:JJ, 0:NA, 0:NR, 0:NP, 1:NS, 0:TT)

for param = [:ij_com, :ia_com, :ir_com, :ip_com, :is_com, :it_com, :cons_com, :lab_com, :epplus_com]
    @eval global $param
end

global DIFF = OffsetArray(zeros(TT+1), 0:TT)

## Auxiliares para grid de ahorro
global ial_v = Array{Int64}(undef, 1)
global iar_v = Array{Int64}(undef, 1)
global varphi_v = zeros(1)

## Auxiliares para grid de earning points
global ial_ep = Array{Int64}(undef, 1)
global iar_ep = Array{Int64}(undef, 1)
global varphi_ep = zeros(1)

# Taxes
# tax and transfers
tax   .= 0
tauc  .= 0.05737 # Tasa efectiva de recaudación 5.737%
tauw  .= 0.12733 # Tasa efectiva de recaudación 12.733%
taur  .= 0.0 # Tasa efectiva de recaudación 12.131%
taup  .= 0.12
kappa .= OLG_params["kappa"]# 2015 - 0.643
#lambda = 1d0
lambda .= 0.0
penp .= 0.0
gy    = 0.11 # Gasto de consumo final del gobierno general (% del PIB) . https://datos.bancomundial.org/indicador/NE.CON.GOVT.ZS  || OLG_params["gy"] # 2015 -- 0.1820 
by    = 0.523/5.0 # 2015 0.442/5.0

# Proportion of formal employment
global formal_employment = 0.7596

## Escoge el indice del servidor
using HTTP.WebSockets
global id
WebSockets.open("ws://127.0.0.1:8081") do ws
        send(ws, "Hello")
        global id = parse(Int,receive(ws))
        
    end;


## Files
global file_output
global file_summary

# open files
file_output = open("output_"*string(id)*".out", "w");
file_summary = open("summary_"*string(id)*".out", "w");

## Compute Steady State
get_SteadyState()


# set reform parameters 

## Carga diseño experimental
experimental_design = CSV.read("datos/experimental_design/experimental_design.csv", DataFrame)



kappa[1:TT] .= experimental_design[id,:]["kappa"]
lambda[1:TT] .= experimental_design[id,:]["lambda"]

# calculate transition path without lsra
lsra_on = false
get_transition()

## Guardamos resultados de las Variables agregadas

results_1D_df = []

for param = [:r, :rn, :w, :wn, :p, :KK, :AA, :BB, :LL, :HH, :YY, :CC, :II, :GG, :INC, :BQ, :tauc, :tauw, :taur, :taup, :kappa, :PP]
    push!(results_1D_df,
        @eval DataFrame($param = [$param...])  
    )
end

results_1D_df = hcat(results_1D_df...)

## Variables por cohorte

results_2D_df = []


for param = [:c_coh, :y_coh, :l_coh, :a_coh, :v_coh, :VV_coh]
    for (ind_skill, name_skill) in enumerate(["formal","informal"])
        var_name = string(param)
        @eval col_names = [string($var_name,"_cohort_",i,"_",$name_skill) for i in 1:size($param.parent)[1]]
        push!(results_2D_df,
            @eval DataFrame(OffsetArrays.no_offset_view($param[:,$ind_skill - 1, :])', col_names)
        )
    end
end

results_2D_df = hcat(results_2D_df...)

## Pensiones
df_pensiones = DataFrame(pen.parent', :auto)
rename!(df_pensiones, ["pension_coho_"*string(j) for j in 1:JJ])

## Recaudación de impuestos
df_tax_rev = DataFrame(OffsetArrays.no_offset_view(taxrev)', ["tauc_rev", "tauw_rev", "taur_rev", "total_tax_rev"])

results_all = hcat([ DataFrame(time = 0:TT, lambda = [lambda[2] for i in 0:TT]), results_1D_df, results_2D_df, df_tax_rev, df_pensiones]...)


# TODO
# calculate transition path with lsra
lsra_on = true
get_transition()

# Agrega ganancia de eficiencia
results_all[:, :hicksian] .= (Lstar^(1.0/egam)-1.0)*100.0

# Agrega id de ejecución
results_all[:, "id"] .= id

# close files
close(file_output)
close(file_summary)


## Guardamos el diseño experimental
CSV.write(joinpath(pwd(),"output" , "results_all_"*string(id)*".csv"), results_all)

