#import "../../helpers/template.typ": *
#import "../../src/electromagnetism/helpers.typ": battery
#import "../helpers.typ": *
#import "@preview/cetz:0.4.2"
#import "@preview/cetz:0.4.2": canvas
#import "@preview/cetz-plot:0.1.3": plot
#import "@preview/zero:0.6.1": zi, set-unit
#import "@preview/zap:0.5.0"
#import "@preview/wrap-it:0.1.1": wrap-content

#show: hw-template

#let name = "Lab 8: Fast Decay with RC Circuits"
#let date = "March 27, 2026"
#let author = "Jaysen Tsao"
#let labmates = "Alex Yue"
#let prof = "Professor Szwerc"
#let course = "PHYS 262"
#let crn = "30949"

#align(horizon + center)[
  #title(name)
  #date

  #v(4em)

  #author

  Lab Partner: #labmates

  #course CRN #crn

  #prof
]

#set page(header: align(right)[
  #author \
  #course CRN #crn \
])

// constants
#let epsilon0 = 8.85e-12
#let pi = calc.pi

// units
#let unit-m = zi.declare("m")
#let unit-s = zi.declare("s")
#let unit-ms = zi.declare("ms")
#let unit-uF = zi.declare("muF")
#let unit-kg = zi.declare("kg")

#let unit-A = zi.declare("A")
#let unit-mA = zi.declare("mA")
#let unit-Ohm = zi.declare(sym.Omega)
#let unit-kOhm = zi.declare([k#sym.Omega])
#let unit-MOhm = zi.declare([M#sym.Omega])
#let unit-V = zi.declare("V")
#let unit-W = zi.declare("W")
#let unit-mW = zi.declare("mW")

#set-unit(fraction: "inline")

/**
 * Section I: Pre-lab
 */

= Pre-lab Questions

#lthin
#set text(size: 10.5pt)

#let prelab-circuit = zap.circuit({
  import zap: *
  let south(x) = (content: x, anchor: "south")

  battery(
    "v1", (0, 4), (0, 0), cells: 2, show-polarity: true, width: 0.15, cell-gap: 0.15,
    label: south(unit-V(3))
  )
  wire((0, 4), (6, 4))
  wire((0, 0), (2, 0))
  switch("s1", (2, 0), (4, 0), label: south($S_1$), closed: true)
  switch("s2", (4, 0), (6, 0), label: south($S_2$))
  wire((6, 0), (6, 4))
  resistor("r1", (4, 2), (4, 4), label: unit-Ohm(100), variant: "ieee")
  capacitor("c1", (4, 0), (4, 2), label: unit-uF(5), variant: "ieee")

  node("n1", (2.6, 0))
  node("n2", (3.4, 0))
  node("n3", (4.6, 0))
  node("n4", (5.4, 0))
})

+
  #wrap-content(image("lab-8-0.png"), align: right)[
    _You have constructed an RC circuit and you see the trace to the 
    right on your oscilloscope screen.
    You have set the vertical scale to #unit-V(1) per square and the horizontal to 
    #unit-ms(20) per square.
    What is the time constant of the RC circuit?_

    The time constant $tau = R C$ is equivalent to the "$1 slash e$ life" of the voltage
    across the capacitor. That is, at what time $t$ after discharging does the voltage 
    across the capacitor drop to $1 slash e approx 36.8%$ of its initial value?
 
    The range of the voltage is from the line at $-10%$ to the line at $110%$. 
    $1 slash e approx 36.8%$ between $-10%$ and $110%$ is approximately $34.2%$, which
    intersects with the curve about $1$ division past the $y$-axis. 
    \
    \
    This corresponds to a time constant of approximately: $
      tau approx 1 "division" dot 20 "ms/division" = #cgreen(unit-ms(20)).
    $
  ]

\
#set enum(start: 2)

+ 

  #wrap-content(prelab-circuit, align: right)[
    The RC circuit is constructed as shown on the right.

    #set enum(numbering: "a.")

    + _You then change the resistance to #unit-Ohm(200). How does the time constant change?_

      The time constant is proportional to the resistance: $tau prop R$. Thus, doubling the resistance will double the time constant: $ tau' = 2 tau. $ 

    #set enum(start: 2)

    + _You then change the capacitance to #unit-uF(20). How does the time constant change?_

      The time constant is proportional to the capacitance: $tau prop C$. Thus, quadrupling the capacitance will quadruple the time constant: $
        tau' = 4 tau.
      $

    + _You then change to a #unit-V(9) battery. How does the time constant change?_
  
      The time constant is independent of voltage, so the time constant will not change: $ tau' = tau. $
  ]
