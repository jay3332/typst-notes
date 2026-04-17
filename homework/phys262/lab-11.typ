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

#let name = [
  Lab 11: Faraday's Law
]
#let date = "April 17, 2026"
#let author = "Jaysen Tsao"
#let labmates = "xxx"
#let prof = "Professor Szwerc"
#let course = "PHYS 262"
#let crn = "30949"
#let submission_date = "April xx, 2026"

// #align(horizon + center)[
//   #title(name)
//   #v(1em)
//   #date
//   #v(4em)
//   #author

//   Lab Partner: #labmates

//   #course CRN #crn

//   #prof
//   #v(2em)
//   #subtext[Submitted #submission_date]
// ]

#set page(numbering: "1", header: align(right)[
  #author \
  #course CRN #crn \
])

// constants
#let epsilon0 = 8.85e-12

// units
#let unit-m = zi.declare("m")
#let unit-cm = zi.declare("cm")
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

#let unit-T = zi.declare("T")
#let unit-mT = zi.declare("mT")

#set-unit(fraction: "inline")

/**
 * Section I: Pre-lab
 */

// = Pre-lab Questions

= Prelab 11: Faraday's Law
#date

#let unit-Wb = zi.declare("Wb")

#line(length: 100%, stroke: 0.5pt)

+ _The first graph shows that the magnetic flux has maximum magnitude when the center of the magnet
  is at the center of the loop. What is the induced emf at this instant?_

  The induced emf when the flux reaches its maximum is #unit-V(0). Since the magnetic flux reaches an extremum at this instant, its derivative with respect to time is zero. By Faraday's law, the induced emf is equal to the negative rate of change of magnetic flux, so the emf is zero at this instant. Alternatively, we can reason that at this instant, the magnetic flux through the loop goes from increasing to decreasing in magnitude, so there is a point at which the flux is not changing at all, which is where the emf is zero.

+ _In the simulation, positive flux corresponds to field lines passing from left to right through the loop.
  Would either of the graphs change if the magnet was turned around and the south pole passed through
  the loop first?_

  The graphs would be flipped. Magnetic field lines on a bar magnet emerge from the north pole and enter the south pole. When the north pole passes through the loop from right to left, the magnetic field emerging from the north pole points from right to left, causing a negative magnetic flux. If we flip the magnet, the south pole would pass through the loop first, and the magnetic field lines would point from left to right, causing a positive magnetic flux. The emf graph would also flip because the emf is proportional to the rate of change of flux.

+ _If the velocity of the magnet is doubled, would the graph of magnetic flux change?_

  The magnetic flux graph would be "compressed" horizontally by a factor of two. That is, the time at which we reach maxmimum magnetic flux magnitude will be #unit-s(2.5) instead of #unit-s(5), and the width of the peak will be half as wide. However, the height of the peak will not change.

+ _Would the graph of induced emf change?_

  The emf graph would also be compressed horizontally by a factor of two, but it would also be stretched vertically by a factor of two. This is because the emf is proportional to the rate of change of flux, so doubling the velocity doubles the slope of the flux graph at every point, doubling the emf.

  Sketch of graphs for answers to questions 3 and 4:

#align(center, image("lab-11-0.png", height: 160pt))

// == Magnetic Flux Derivation

// The function generator creates a potential $V(t)$ which follows:
// $
//   V(t) = V_0 sin(omega t) "where" omega = 2 pi f.
// $
// $V_0$ is the amplitude (max potential), and $f$ is the frequency set on the function generator.

// If the coil has resistance $R$ 