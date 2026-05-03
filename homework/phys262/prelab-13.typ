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
  Lab 13: AC Circuits - Phase Relationships
]
#let date = "May 1, 2026"
#let author = "Jaysen Tsao"
#let labmates = "Alex Yue"
#let prof = "Professor Szwerc"
#let course = "PHYS 262"
#let crn = "30949"
#let submission_date = "May 8, 2026"

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
#let unit-Wb = zi.declare("Wb")

#let unit-Hz = zi.declare("Hz")
#let unit-V-per-div = zi.declare("V/div")
#let unit-ms-per-div = zi.declare("ms/div")

#let unit-mH = zi.declare("mH")

#set-unit(fraction: "inline")

/**
 * Section I: Pre-lab
 */

// = Pre-lab Questions
= Prelab 13: AC Circuits - Phase Relationships
#date

#let then = $#h(1em) -> #h(1em)$
#line(length: 100%, stroke: 0.5pt)

#wrap-content(image("lab-13-0.png"), align: right)[
  + _In the figure to the right, does curve $A$ lead or lag curve $B$?_

    Curve $B$ leads curve $A$ since $B$ reaches its peak before curve $A$ does.

  + _The oscilloscope vertical scale is set to #unit-V-per-div(5) and 
     the horizontal scale is set to #unit-ms-per-div(5)._

    #set enum(numbering: "a)")

    + _What is the time difference in the curves?_

      Curve $A$ reaches its peak approximately $2.5$ divisions after curve $B$ does, so:
      $
        Delta t approx (2.5 "div") (#unit-ms-per-div(5)) = bf(#unit-ms(12.5)).
      $

    + _What is the phase difference in the curves?_
]

#pad(left: 2.67em)[
  Assuming both curves have the same frequency, curve $B$ leads $A$ by approximately: $
    Delta phi = bf(90 degree = pi slash 2 "radians").
  $
  
  This is because curve $B$ reaches its peak approximately a quarter of a period before curve $A$ does. More precisely, if $t=0$ was fixed
  on the left side of the screen, curve $B$ roughly models $B_0 cos (omega t)$ whereas $A$ models $A_0 sin(omega t) = A_0 cos(omega t - pi slash 2).$
]

3. A resistor, inductor, and capacitor are connected in series and the potential difference across each are measured as $V_R = #unit-V(35)$, $V_L = #unit-V(45)$, and $V_C = #unit-V(55)$ respectively. What is the input voltage $V$? 

  The impedance of the circuit is given by:
  $
    Z = sqrt(R^2 + (X_L - X_C)^2).
  $
  By "Ohm's law for impedance", the potential difference across the LRC components is given by:
  $
    sum V = I Z &= I sqrt(R^2 + (X_L - X_C)^2) \
    &= sqrt(I^2 R^2 + I^2 (X_L - X_C)^2) \
    &= sqrt((I R)^2 + (I X_L - I X_C)^2) \
    &= sqrt(V_R^2 + (V_L - V_C)^2).
  $

  By Kirchhoff's voltage law, the input voltage $V$ must be equal to the sum of the potential differences across the components, so:

  $
    V = sqrt(V_R^2 + (V_L - V_C)^2) = sqrt((#unit-V(35))^2 + (#unit-V(45) - #unit-V(55))^2) = bf(#unit-V(calc.sqrt(35 * 35 + (45 - 55) * (45 - 55)), digits: 1)).
  $