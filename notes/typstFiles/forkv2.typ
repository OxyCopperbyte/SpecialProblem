#import "formatting.typ" : *

#show: template

#title(
  [
    Mussel Larvae Dispersal with Advection-Diffusion Biophysical Model and Graph Theory
  ]
)

= Introduction

  == Background of the Study

    Marine life plays a vital role in the food security of a community, especially in archipelagic countries. In the Philippines, marine resources contribute to the country’s food supply. According to #cite(<david2016>, form: "prose"), approximately 19% to 36% is the contribution of marine life in food security. Asian green mussels (_P. viridis_), locally known as “tahong”, are small but strategically vital in the Philippine's aquaculture industry. It is widely regarded as one of the two major bivalves cultured in the Philippines alongside slipper oysters. The production of Asian green mussels grew each year showing signs of improvement in the local aquaculture industry. Asian green mussel production grew from 16,000 MT in 2015, 26,300 MT in 2018, and 19,229 MT in 2020 @pimentel2025.

    Green mussel farm operation starts by collecting mussel spats from settlement locations or provided by hatcheries. The spats are then attached to ropes, poles, or nets as substrate materials that will harness the mussel until they acquire the required size for harvesting (Velez-Henao et al., 2021). With that given, wild mussel spats remain dependent on ocean currents and other environmental factors for natural dispersal and survival during its planktonic stage (Haye & Segovia, 2023). Due to variation of ocean current's speed and direction, the source location of planktonic particles and organisms and collection and settlement locations can be geographically separated and has variety for different seasons (Pastor et al., 2021). Thus, determining the natural dispersal patterns of green mussels for different temperature, current speed, and depth is vital in anticipating possible green mussel spat settlement locations.

    Emperical methods such as genetic tracing, mark-recapture tagging, and direct field sampling can reveal patterns of organism behavior; hoever, their physical deployment remains logistically constrained, and costly @treml2008. To overcome these limitations, mathematical modelling coupled with biophysical transport are increasingly utilized to quantify spatial dispersal dynamics across diverse marine taxa, including reef corals, reef fishes, and bivalves @cowen2000 @north2008 @treml2008. Dipersal studies could help in locating vital locations that can be subject for enhanced marine conservation efforts as well as identifying possible spat settlement areas using mathematical equations.

  == Statement of the Problem

    Mussel cultivation for aquaculture heavily depends on wild seed (mussel spat) collection. Identification of settlement areas is difficult due to factors such as ocean current, temperature, and turbulence that make spat dispersal unpredictable. Current approaches such as genetic and particle tracking, which are used in locating collection sites, provide feasible solutions, however physical deployment of these methods are slow, labour-intensive, and costly. Mathematical modelling is continuously used in current studies to simulate dispersal subject to flow dynamics. However, most studies are performed on a global and broad-regional scale. Also few larval dispersal modelling studies have exists in the Philippines. Consequently, the aquaculture sector lacks fast and reliable ways to anticipate collection sites.

  == Objectives of the Study

  This study aims to identify mussel spat settlement locations and to characterise larval dispersal patterns, specifically asian green mussels (_P. viridis_) using passive Lagrangian advection-diffusion biophysical model.

  #pp[The study specifically aim to:]
  #pd[
    + Simulate larval passive dispersal using passive Lagrangian advection-diffusion random walk model in mesoscale domains;
    + Construct directed and weighted network from the result of passive Lagrangian biophysical model;
    + Formulate network configurations for optimizing spatial coverage/connectivity; and
    + Formulate network configuration for optimizing long-term sustainability.
  ]

  == Significance of the Study

  The results of this study primarily benefits the Asian green mussel farmers by identifying spat collection locations that may possibly make mussel farming more efficient. By determining spat collection locations as vertices, farmers may improve their operational efficiency and boost their income. In addition to that, the findings of this study may benefit the locale by providing them with a constant supply of Asian green mussels which can support food security.

  == Scope and Limitation

  The study focused on determining Asian green mussel spat location using three-dimensional Eulerian advection-diffusion biophysical model in the (Visayan waters). Specifically, the study sought to construct a directed and weighted network from the result of passive dispersal and spatially explicit biophysical model and formulate network configurations for optimizing spatial connectivity and long-term sustainability.

#pagebreak()
= Review of Related Literatures

This section discusses the theoretical background and foundational concepts of the current study, and explores related research findings from other studies.

== Advection and Diffusion Models

Advection refers to the transport of a substance by the flow of a fluid, while diffusion refers to the scattering of a concentration due to turbulent motion @fischer1979. In the study of larval dispersal, advection describes how mussel larvae are carried by ocean currents from one location to another, and diffusion describes how they spread from turbulent mixing, the irregular and swirling motion of water, and is considered as a random motion that is spatially and temporally complicated @okubo2001. Because turbulence is difficult to define in detail, it is often represented as a single value called eddy diffusivity @csanady1973. Simplified models presumes horizontal mixing is to be equal to transversal mixing, though vertical oceanic diffusion has not been explored very well, there are attempts that try to capture nature through statistical theory. To complicate things further, large scale ocean mixing is not homogeneous in all directions @csanady1973.

Models of larval transport can be classified into two approaches @cowen2000 @okubo2001. The Eulerian approach yields a field equation for larval density over the whole domain. The Eulerian approach is a deterministic mathematical model, that is –given a flow field, initial conditions, and parameters, the model will only yield one unified answer @okubo2001. The Lagrangian approach is a stochastic framework that traces each particle as it moves. Similar to the Eulerian viewpoint, the individual trajectories are carried by a flow field, however diffusion is presented by random displacements. Lagrangian models are well suited in dispersal modelling because nearly all biological processes are stochastic. The trajectories can be used directly to count how many larvae released at one site reach another, which is the basic quantity needed to construct a connectivity network (Treml et al., 2008; Abecasis et al., 2023).

Both approaches have been used in dispersal studies @treml2008 @north2008. It has also been proved that diffusion is an essential part of modelling @cowen2000 and the vertical position of larva influences the dispersal because currents are not uniform at different depths @north2008.

== Biophysical Modelling

Biophysical models combine the physical laws and biological behavior of the organism being studied. In larval dispersal studies, these models are driven by ocean currents and the characteristics of the larvae, such as gestation period, lifespan, and behavior. Early studies treated larvae as passive particles, and biological factors are then introduced later on @north2008. There are several biological factors influence dispersal. These include pelagic larval duration (PLD), the ability of the larvae to swim or stay afloat on the water column, and mortality during the larval period.

== Graph Theory

Graph theory is a branch of mathematics that studies networks @newman2010. A network consists of nodes, which represent locations, and edges, which represent connections between locations. In larval population ecology, nodes can represent sites such as possible settlement areas, while edges represent the movement of organisms between these sites @treml2008.

A network can be directed or weighted. A directed network indicates the direction of relationship, while a weighted network indicates the strength of the connection. The mentioned properties of defining a graph can be useful for describing larval dispersal because of the direct translation from physical transport of population and its affiliated concentration.

Graph theory also provides measures for identifying important nodes in a network. Degree centrality measures the number of connections of a node and betweenness centrality measures how often a node lies on the path between other nodes @newman2010. Betweenness identifies the nodes that act as bridges or stepping-stones, whose loss would fragment the network (Freeman, 1977). Out-strength, the total weight of connections leaving a node, identifies node that are major sources of propagules for the network (Barrat et al., 2004). These measures help characterize the critical nodes that maintain connectivity in a network. Measures of centrality has been proven to be an effective tool in marine conservation planning and efforts @treml2008.

Urban and Keitt (2001) applied graph theory to landscape connectivity and used the removal of nodes (cut-nodes) to test how fragile the network is. Abecasis et al. (2023) used the same test, removing reserves in order of betweenness and out-strength and comparing the result with random removal. The approach has been used in multiple studies, namely those concerning conservation planning (Treml et al., 2008; Abecasis et al., 2023) and offers a direct method for ranking candidate collection sites in the context of this study.

#pagebreak()

= Methodology

    This section describes the study area, the transport model, the data, and the procedures used to identify candidate spat collection sites and evaluate the resulting connectivity network.

  == 3.1 Research Design

  == 3.2 Research Inputs

  === 3.2.1 Hydrodynamic Data

    Sea water velocity from the Copernicus Marine Environmental Monitoring Service, Global Ocean Physics (reanalysis / real-time) (CMEMS) is selected because it has the most recent coverage and the finest three-dimensional resolution of the three. Land cells are masked, and coastal velocities are filled from the nearest water cells. The 8 km resolution is coarse relative to the spacing of candidate sites, so predictions apply at the grid scale. This is acknowledged as a limitation.

    #figure(
      grid(
        columns: 1,
        gutter: 1em,
        image("figures/cmems.png", width: 100%),
      ),
      caption: [Surface current speed and direction for the Philippines (left) and the Visayas (right) CMEMS GLORYS12V1.],
    ) <fig_hydro>

  === 3.2.2 Biological Parameters (Subject for consultation)

    Mortality enters the model through the reaction term $R$. Published estimates for the green mussel _P. viridis_ come from fisheries assessments of adult stocks. In Malaysia, total mortality was 2.48 yr⁻¹, with natural mortality $M = 1.68$ yr⁻¹ and fishing mortality $F = 0.79$ yr⁻¹. In India, total mortality was 1.18 yr⁻¹, with $M = 0.42$ yr⁻¹ and $F = 0.76$ yr⁻¹. No comparable estimate was found for the Philippines.

    According to Nair & Appukuttan (2003), the Pelagic Larval Duration (PLD) for Asian green mussels is estimated to be 13–41 days. On the other hand, Alagarswami (n.d.) claims that the estimated PLD of an Asian green mussel is between 15–35 days. Thus, in this study, the PLD that will be used is 14–35 days or 2–5 weeks for simplicity.

  === 3.3 Mathematical Methods

There are two ways to describe motion of a population:

#pd[
  + Lagrangian viewpoint: individuals are identified (marked) and their trajectories are followed through time.
  + Eulerian viewpoint: The flow of individuals that pass a fixed point is observed.
]

Both frameworks originate in fluid dynamics, and the advection is relatively governed by the same mechanics. In the Eulerian framework, the diffusion is derived from Fickian laws where the diffusion of population is strictly down-gradient. However, this is not the case in mussel dispersal. Therefore the present study adapts a Lagrangian framework to simulate dispersal in the domain of interest. It is noted that Lagrangian observation of particles is difficult and sometimes impossible, but it suits biological organisms because animals can be tagged and tracked by telemetry.

Consider a population carried by a mean velocity $u(x,t)$, where diffusion is subject to a random walk, or random flight model. The displacement in the $x$ direction is the sum of an advective part and a diffusive part subject to a random stochastic value, quantified by a distance coefficient. A similar explanation describes the motion in the $y$ direction:

$ x(t + Delta t) = x(t) + integral_t^(t + Delta t) (upright(d) x)/(upright(d) t) thin upright(d) t + sqrt(6 D Delta t) thin U_x $

$ y(t + Delta t) = y(t) + integral_t^(t + Delta t) (upright(d) y)/(upright(d) t) thin upright(d) t + sqrt(6 D Delta t) thin U_y $

where $x(t)$ is the current position of the larva, $x(t + Delta t)$ is its future position, $Delta t$ is the change in time, $(upright(d) x)/(upright(d) t)$ is the velocity in the $x$ direction (zonal) and $(upright(d) y)/(upright(d) t)$ the velocity in the $y$ direction (meridional). $U_x$ and $U_y$ are independent random numbers drawn uniformly from $[-1, 1]$, and $sqrt(6 D Delta t)$ is the maximum distance from diffusion, where $D = 10$ m² s⁻¹. $R(t)$ is the biological function that models the pelagic larval duration and mortality of the larva.


=== 3.4 Research Procedure

=== 3.5 Validation and Evaluation (subject for assessment)

Results of the passive Lagrangian advection-diffusion random walk model will be validated by comparing multiple ocean current data from the CMEMS ocean current flow.

#pagebreak()
#bibliography("../references/works.bib", style: "apa")
