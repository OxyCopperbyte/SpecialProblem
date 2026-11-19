#import "@preview/touying:0.8.0": *
#import themes.stargazer : *
#import "@preview/cetz:0.3.2": canvas, draw

#show: stargazer-theme.with(
  aspect-ratio: "4-3",
  footer-a: [Cuatriz, Macabantad],
  footer-b: [],
  align: horizon,

  config-info(
    title: [Mussel Larval Dispersal with 3D Hydrodynamic Modelling and Graph Theory],
    short-title: [Larval Dispersal Modelling],
    // subtitle: [A Proposal for Collaboration with UPV Fisheries],
    author: [Rany Cuatriz, James Daniel Macabantad],
    institution: [BS in Applied Mathematics],
    date: datetime.today(),
  )
)

#set text(font: "New Computer Modern Sans", size: 1.1em)
#set list(spacing: 1.5em)
#set enum(spacing: 1em)

#title-slide()

= Introduction

== Context

- Marine life contributes about 19% to 36% to Philippine food security (David et al., 2021)
- The country needs about 1.67 million MT more fish per year by 2050 to keep per capita consumption at 34.27 kg (Cabral et al., 2023)
#pause
- Green mussel (*tahong*) is one of the two major cultured bivalves in the Philippines, alongside slipper oysters
#pause
- Production reached 26,300 MT in 2018 and 19,229 MT in 2020 (Pimentel, 2025): output is volatile, not steadily rising

== Wild seed collection

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [

    - Mussel farms depend on wild spat (juvenile mussels) collected from the sea
    - Collectors are placed where larvae settle
    - Unoptimized site location may decrease harvest output
  ],
  [
    #figure(
      image("../assets/spatfallUK.webp", height: 80%),
      caption: [Spatfall in 2022 was later and thinner than in 2021 (Isle of Skye Mussel Company)],
    )
  ],
)

== The problem

- Settlement drivers \
  *Physical*: ocean currents, turbulence, temperature\
  *Biological*: recruitment dynamics, mortality, food, swimming behaviour
- Current approaches (genetic markers, particle tracking, field deployment) work, but are slow, labour-intensive, and costly
- Existing models simplify the biology, and concerns surface drifters.

== Primary Objectives

  *This study aims to identify mussel spat settlement locations and to characterise larval dispersal patterns, specifically asian green mussels (_P. viridis_) using three dimensional Eulerian advection-diffusion biophysical model.*

// *Can a three-dimensional Eulerian advection-diffusion model, with biological terms, predict where mussel spat are likely to settle, and can the predicted connectivity be turned into a network that guides site selection?*

== Objectives

1. Extend a 2D advection-diffusion biophysical model to 3D, with vertical diffusivity
2. Build a directed, weighted connectivity network from simulated larval transport
3. Identify network configurations that maximise spatial coverage and connectivity
4. Identify configurations that maximise long-term sustainability of spat supply

== Gains from this research

- A transparent tool that ranks collection sites before deployment
- Evidence to support seed collection planning and funding
- Opportunity to use mathematics in other field applications.

= Background

== Advection and diffusion

- *Advection:* transport of a substance, carried by the flow
- *Diffusion:* spreading of a substance due to mixing
- Turbulence is difficult to model, so it is summarised by an *eddy diffusivity* $K$, which grows with the scale of the patch (Okubo, 1971)

== Eulerian and Lagrangian views

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [*Lagrangian*],
  [*Eulerian*],
  [
    - Follows each individual particle as it moves
    - Suits tagged animals via gps tracking
    - Impractical for millions of microscopic larvae
  ],
  [
    - Tracks concentration at fixed points
    - Easier to model and interpret
    - shown to match plankton dispersal in sampling sites
  ],
)

== Biophysical modelling
- Combines ocean physics with biology of the larva: duration (PLD), behaviour, and mortality (Treml et al., 2008).
According to Fickian Law's.
$
  (partial C)/(partial t) = - arrow(u) (partial C)/(partial x) + kappa (partial ^2 C) / (partial x^2)
$
$C$ : Concentration of larvae in an area \
$t$ : time \
$arrow(u)$ :  velocity in the $x$ direction \
$kappa$ : diffusion coefficient

== Two dimensional advection-diffusion biophysical model
- In study's of Treml et al. (2008), they used the model:
$
  (partial C)/(partial t) = - arrow(u) (partial C)/(partial x) - arrow(v) (partial C)/(partial y) + kappa_x (partial ^2 C)/(partial x^2) + kappa_y (partial ^2 C)/(partial y^2) - mu C
$

$C$ : Concentration of larvae in an area \
$t$ : time \
$arrow(u)$ :  velocity in the $x$ direction \
$arrow(v)$ :  velocity in the $y$ direction \
$kappa_x$ : diffusion coefficient in $x$ direction \
$kappa_y$ : diffusion coefficient in $y$ direction \
$mu$ : mortality coefficient

== Three dimensional Biophysical Model

- In the present study, we propose the model:
#text(size: 0.9em)[
  $
    bold((partial C)/(partial t) = -arrow(u)(partial C)/(partial x) - arrow(v)(partial C)/(partial y) - arrow(w)(partial C)/(partial z) + kappa_x (partial^2 C)/(partial x^2) + kappa_y (partial^2 C)/(partial y^2) + kappa_z (partial^2 C)/(partial z^2) + R(C))
  $
]
#v(2em)
#columns(2)[
  #set text(size: 0.8em)
  $C$ : Concentration of larvae in an area \
  $t$ : time \
  $arrow(u)$ :  velocity in the $x$ direction \
  $arrow(v)$ :  velocity in the $y$ direction \
  $arrow(w)$ : velocity in the $z$ direction \

  #colbreak()

  $kappa_x$ : diffusion coefficient in $x$ direction \
  $kappa_y$ : diffusion coefficient in $y$ direction \
  $kappa_z$ : diffusion coefficient in $z$ direction \
  $R(C)$ : Biological factors (mortality coeff.)
]


= Methodology

== Study area

- Domain and candidate collection sites: to be identified
*Considerations: *
- Visayan waters, Philippines. _Capiz ranks first in aquaculture supplier._ Mussel production in 2024 is 3,028.97 MT (Francisco, 2025)

== Hydrodynamic data

#grid(
  columns: 2,
  column-gutter: 2em,
  align: horizon,

  [
    - Compared OSCAR, HYCOM, and CMEMS on coverage, resolution, and depth
    - CMEMS selected for recent coverage and 3D resolution (about 8 km)
  ],
  [
    #figure(
      image("../assets/cmemsVisayasColored.png"),
      caption: [Visayan Sea currents from the Copernicus Marine Environment Monitoring Service (CMEMS)],
    )
  ],
)



== Biological parameters

*Known (adult stocks)*
- Natural mortality $M$: 1.68 yr⁻¹ (Malaysia), 0.42 yr⁻¹ (India)
- Used only as a bounded reference for larval mortality

== Input to Output
  Recall the equation
  #text(size: 0.8em)[
    $
      bold((partial C)/(partial t) = -arrow(u)(partial C)/(partial x) - arrow(v)(partial C)/(partial y) - arrow(w)(partial C)/(partial z) + kappa_(h) ((partial^2 C)/(partial x^2) + (partial^2 C)/(partial y^2)) + kappa_v (partial^2 C)/(partial z^2) + R(C))
    $
  ]
  *Inputs*: \
  $(arrow(u), arrow(v) , arrow(w))$ : velocity data from Copernicus Monitoring Service \
  $kappa_h , kappa_v$ : Coefficients from related studies. $50  m^2\/s$ , $0.01 m^2\/s$ \
  $R(C)$ : mortality function \
  Initial condition : $C$ matrix of spat producing areas

  *Output*:

  Matrix of concentration values




// #import "illustration.typ" : *

== Graph theory
- A network has *nodes* and *edges* that captures relationships.
- *Directed* edges capture who supplies whom; *weighted* edges capture how strongly
- *Centrality measures* identify critical nodes that hold the network together or non-critical nodes.
  - Betweenness Centrality and Out-forward Centrality

== Graph theory in marine ecology

- Graph-based connectivity has already been used for marine reserve design (Abecasis et al., 2023)

#figure(
  image("../assets/graphTheoryMarineReserve.png"),
  caption: [Key connectivity hubs in the Mediterranean reserve network, Bryozoa, Mollusca and Polychaeta group]
)

== Expected output
#grid(
  columns: 2,
  column-gutter: 2em,
  [
    - The 3 dimensional advection-diffusion model can sufficiently predict settlement locations
    - Network centrality identifies a small set of sites that can supply most of the network's spat
  ],
  [
    // #figure(
      // expected-network,
      // caption: [Illustrative example of an expected output. Nodes are candidate collection sites. Node size are highly anticipated collection sites. Arrow thickness shows connectivity supply weight.]
    // )

  ]
)

== Validation plan

- Validation needs observed spat data, which we do not yet have
- *If collection records exist:* compare predicted and observed settlement by site.

== Feasibility of the idea
*Feasibility and Direction*
- The framework is established and used in other studies.
- Data is availlable _subject for assessment_.
- Objective is straightforward and aligned.

*Main Gaps to address*
- No validation data for comparison of results.
- Larval biological processes are unknown to us.


= Closing

== Moving forward

Suggestions and plans in moving on forward with the study.
