#import "../../helpers/template.typ": *
#import "../../src/electromagnetism/helpers.typ": battery
#import "../helpers.typ": *
#import "@preview/cetz:0.4.2"
#import "@preview/cetz:0.4.2": canvas
#import "@preview/cetz-plot:0.1.3": plot
#import "@preview/zero:0.6.1": zi, set-unit
#import "@preview/zap:0.5.0"
#import "@preview/wrap-it:0.1.1": wrap-content
#import "../regression.typ": *

#show: hw-template

#let name = [
  Lab 12: Fast LRC Decay
]
#let date = "April 24, 2026"
#let author = "Jaysen Tsao"
#let labmates = "Alex Yue"
#let prof = "Professor Szwerc"
#let course = "PHYS 262"
#let crn = "30949"
#let submission_date = "April xx, 2026"

#align(horizon + center)[
  #title(name)
  #v(1em)
  #date
  #v(4em)
  #author

  Lab Partner: #labmates

  #course CRN #crn

  #prof
  #v(2em)
  #subtext[Submitted #submission_date]
]

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
#let unit-Wb = zi.declare("Wb")

#set-unit(fraction: "inline")

/**
 * Section I: Pre-lab
 */

= Pre-lab Questions

#let then = $#h(1em) -> #h(1em)$
#line(length: 100%, stroke: 0.5pt)

_Derive the relationship between the time constant in an LRC circuit and the half life of the
voltage across the resistor._

From the general solution for the voltage across the resistor in an LRC circuit, we have:
$
  V(t) = V_0 e^(-R/(2L) t) cos(omega t + phi),
$
where $omega = sqrt(1/(L C) - R^2/(4L^2))$ is the angular frequency of the oscillation. The time constant $tau$ is defined as the time it takes for the voltage to decay to $1 slash e$ of its initial value, which occurs when the exponential is $1 slash e$:
$
  e^(-R/(2L) tau) = 1/e
  then -R/(2L) tau = -1
  then tau = cgreen((2L)/R).
$

This allows us to rewrite the voltage as:
$
  V(t) = V_0 e^(-t slash tau) cos(omega t + phi).
$

The half-life $t_(1 slash 2)$ is defined as the time it takes for the voltage to decay to half of its initial value, which occurs when the exponential is $1 slash 2$:
$
  e^(-t_(1 slash 2) slash tau) = 1/2
  then -t_(1 slash 2) slash tau = ln(1/2)
  then t_(1 slash 2) = cgreen(tau ln 2 = (2 L ln 2)/R).
$