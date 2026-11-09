#import "formatting.typ" : *

#show: template

#title(
  [
    Mussel Larvae Dispersal with Advection-Diffusion Biophysical Model and Graph Theory
  ]
)

= Introduction
== Background of the Study

Marine life plays a vital role in the food security of a community, especially in archipelagic countries. In the Philippines, marine resources contribute to the country’s food supply. According to David et. al (2016), approximately 19% to 36% is the contribution of marine life in food security. However, this production rate can cause food scarcity if the rate of production is maintained. To ensure food security, the Philippines needs to produce 1.67 million metric tons (MT) more fish per year by the year 2050  to at least maintain the current per capita fish consumption of 34.27 kg per year (Geronimo et.al, 2023).

Asian green mussels (_Perna viridis_), locally known as “tahong”, are small but strategically vital in the Philippine's aquaculture industry. It is widely regarded as one of the two major bivalves cultured in the Philippines alongside slipper oysters. The production of Asian green mussels grew each year showing signs of improvement in the local aquaculture industry. According to Pimentel (2026), Asian green mussel production grew from 16,000 MT in 2015, 26,300 MT in 2018, and 19,229 MT in 2020 .


== Statement of the Problem

Mussel cultivation for aquaculture heavily depends on wild seed (mussel spat) collection. Identification of settlement areas is difficult due to factors such as ocean current, temperature, and turbulence that make spat dispersal unpredictable. Current approaches such as genetic and particle tracking, which are used in locating collection sites, provide feasible solutions, however physical deployment of these methods are slow, labour-intensive, and costly. Mathematical modelling is continuously used in current studies to simulate dispersal subject to flow dynamics, however these are limited to two-dimensional assumptions without accounting vertical diffusivity and biological capacities. Consequently, the aquaculture sector lacks fast and reliable ways to anticipate collection sites.

== Objectives of the study

This study aims to identify mussel spat settlement locations and to characterise larval dispersal patterns, specifically asian green mussels (_P. viridis_) using three dimensional Eulerian advection-diffusion biophysical model.

#par(first-line-indent: 0em)[
  The study specifically aim to:
]

#pad(left: 0.5in)[
  + Extend two-dimensional advection-diffusion Eulerian biophysical model into three-dimensional model accounting vertical diffusivity;
  + Construct directed and weighted network from the result of passive dispersal and spatially explicit biophysical model;
  + Formulate network configurations for optimizing spatial coverage/connectivity; and
  + Formulate network configuration for optimizing long-term sustainability.
]

== Significance of the Study

The results of this study primarily benefits the Asian green mussel farmers by identifying spat colelciton locations that may possibly make mussel farming more efficient. By determining spat collection locations as vertices, farmers may improve their operational efficiency and boost their income. In addition to that, the findings of this study may benefit the locale by providing them with a constant supply of Asian green mussels which can support food security.

== Scope and Limitations

The study focused on determining Asian green mussel spat location using three-dimensional Eulerian advection-diffusion biophysical model in the (Visayan waters). Specifically, this study seeks to construct a directed and weighted network from the result of passive dispersal and spatially explicit biophysical model and formulate netwoek configurations
#pagebreak()

= Methodology

This section describes the study area, the transport model, the data, and the procedures used to identify candidate spat collection sites and evaluate the resulting connectivity network.

== Study Domain
#lorem(20)

== Mathematical Model

#par(first-line-indent: 0em)[
There are two ways to describe motion of a population:
]

#pad(left:0.5in)[
  + Lagrangian viewpoint: individuals are identified (marked) and their trajectories are followed through time.
  + Eulerian viewpoint: The flow of individuals that pass a fixed point is observed.
]
Both frameworks originate in fluid mechanics. It is noted that Lagrangian observation of particles is difficult and sometimes impossible, but it suits biological organisms because animals can be tagged and tracked by telemetry. The Eulerian framework is one that yields a field equation that tracks dispersal over a spatial domain. The present study adapts an Eulerian framework primarily for two reasons: 1) mussel larvae are released in very large numbers, microscopic, and disperse continuously over time; 2) the aim of this study is to estimate candidate sites for spat collection sites and construct a connectivity network between them.

According to Fick’s Law, the amount of transport of matter $C$ in the $x$ direction across a unit normal area in a unit time, i.e. flux $J_x$,  is proportional to the gradient of the concentration of matter. Using this principle, we can obtain
$ (partial C)/(partial t) = - (partial J_x)/(partial x) = (partial)/(partial x) times D (partial C)/(partial x) $

#par(first-line-indent: 0em)[
  where D is the diffusivity. The equation is also known as the local conservation law.
]

Consider a population carried by a mean velocity $u(x,t)$ and subject to turbulent diffusion. The flux in the $x$ direction is the sum of an advective part and a diffusive part where $K$ is the eddy diffusivity. Substituting the local conservation law with no internal source no internal source gives
$ (partial C)/(partial t) = -(partial J_x)/(partial x) = -(partial (u C))/(partial x) + (partial)/(partial x) (K (partial C)/(partial x)) $
Extending the equation above to three dimensions, with a source term $R$ for mortality and settlement gives
$
  (partial C)/(partial t) = - u (partial C)/(partial x) - v (partial C)/(partial y) - w (partial C)/(partial z) + partial/(partial x)(K_x (partial C)/(partial x)) +  partial/(partial y)(K_y (partial C)/(partial y)) + partial/(partial z)(K_z (partial C)/(partial z)) - mu C \
$

== Hydrodynamic Data

OSCAR is satellite-derived and surface-only. Its 0.25° (about 28 km) resolution is too coarse for bays and farm sites, and it does not capture tidal or wind-driven flow near shore. HYCOM is three-dimensional at about 8 km, but its archive ends in 2015 and has gaps. CMEMS is three-dimensional at about 8 km, with 6-hourly output to the present, though some land cells contain anomalous velocities.

CMEMS was selected because it has the most recent coverage and the finest three-dimensional resolution of the three. Land cells are masked, and coastal velocities are filled from the nearest water cells. The 8 km resolution is coarse relative to the spacing of candidate sites, so predictions apply at the grid scale. This is acknowledged as a limitation.

== Biological Parameters

Mortality enters the model through the reaction term $R$. Published estimates for the green mussel _P. viridis_ come from fisheries assessments of adult stocks. In Malaysia, total mortality was 2.48 yr⁻¹, with natural mortality $M = 1.68$ yr⁻¹ and fishing mortality $F = 0.79$ yr⁻¹. In India, total mortality was 1.18 yr⁻¹, with $M = 0.42$ yr⁻¹ and $F = 0.76$ yr⁻¹. No comparable estimate was found for the Philippines.

// These values cannot be applied directly to larvae, which are generally subject to higher mortality than adults. Only the natural component is relevant to the transport model, because fishing mortality acts on harvested stock and not on larvae in the water column. The adult estimates are therefore used as a bounded reference, and the larval rate $mu(T)$ will be calibrated against Philippine collection data. The temperature dependence is assumed to follow a Q10 relationship, with the reference rate defined at 20 °C.
