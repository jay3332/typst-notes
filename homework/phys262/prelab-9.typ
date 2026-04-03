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
  Lab 9a: Charge to Mass Ratio of an Electron \
  Lab 9b: Magnetic Force on a Wire
]
#let date = "April 3, 2026"
#let author = "Jaysen Tsao"
#let labmates = "Alex Yue"
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

#set page(header: align(right)[
  #author \
  #course CRN #crn \
])

// constants
#let epsilon0 = 8.85e-12
#let pi = calc.pi

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

= Prelab 9
#date
#lthin

== Prelab 9a: Charge to Mass Ratio

Why is it important to measure charge-to-mass ratio ($e slash m$)?

Measuring the charge-to-mass ratio $e slash m$ of the electron is important because the charge $e$ and the mass $m$ are difficult to measure independently. The ratio $e slash m$ can be used to determine the motion of charged particles in electric and magnetic fields without needing to know that individual values of $e$ and $m$.

== Prelab 9b: Magnetic Force on a Wire

One consequence of placing a current carrying wire in a magnetic field is that the wire experiences
a force $arrow(F) = I arrow(L) times arrow(B)$ on it, where $I$ is the current, $L$ is the length
of the wire within the magnetic field, and $arrow(B)$ is the magnetic field vector.

Note the use of the cross product, which both modifies the magnitude of the force, and defines its direction.
If $I$, $L$, and $B$ are expressed in units of Amps, meters, Teslas respectively, then the force is expressed in Newtons.

// Given values
#let L-m = 0.01 // 1 cm in meters
#let B1-T = 2   // 2 T for question 1
#let I2-A = 2   // 2 A for question 2

// unit for Newtons
#let unit-N = zi.declare("N")

#let unit-T-m = zi.declare("T m")

+ Make a properly labeled plot of the Force on a wire of length of wire #unit-cm(1) long
  that is perpendicular to a magnetic field of #unit-T(2), as the current ranges from #unit-A(1) to #unit-A(10).
  What is the slope of this plot? What does that slope represent?

  Since the wire is perpendicular to the field, $sin theta = 1$, and the force simplifies to:
  $ F = I L B $
  With $L = #unit-cm(1) = #unit-m(0.01)$ and $B = #unit-T(2)$:
  $ F = I dot #unit-m(0.01) dot #unit-T(2) = (#unit-T-m(0.02)) I $

  #let slope1 = L-m * B1-T // 0.02 N/A
  #let data1 = range(1, 11).map(I => (I, I * slope1))

  #align(center)[
    === Force on a Wire as a Function of Current
    #canvas({
      import plot: *
      plot(
        size: (8.0, 5.0),
        axis-style: "scientific-auto",
        x-min: 0,
        x-max: 11,
        x-tick-step: 2,
        x-grid: true,
        x-label: [Current, $I$ (A)],
        y-min: 0,
        y-max: 0.25,
        y-tick-step: 0.05,
        y-grid: true,
        y-label: [Force, $F$ (N)],
        legend: "inner-north-west",
        {
          add(
            data1,
            line: "raw",
            style: (stroke: none),
            mark: "o",
            mark-style: (stroke: black, fill: black),
          )
          add(
            domain: (0, 11),
            I => slope1 * I,
            style: (stroke: blue + 1.5pt),
            mark: none,
            label: [$F = (#unit-T-m(slope1)) I$],
          )
        },
      )
    })
  ]

  The slope of this plot is $#unit-T-m(slope1)$. It represents the product $L B$, i.e.
  the length of the wire multiplied by the magnetic field strength.

#let unit-A-m = zi.declare("A m")

+ Make a properly labeled plot of the Force on a wire of length of wire #unit-cm(1) long
  with a current of #unit-A(2). The wire is perpendicular to a magnetic field that ranges from #unit-mT(1)
  to #unit-mT(10). What is the slope of this plot? What does that slope represent?

  With $L = #unit-m(0.01)$ and $I = #unit-A(2)$:
  $ F = I L B = #unit-A(2) dot #unit-m(0.01) dot B = (#unit-A-m(0.02)) B $

  #let slope2 = I2-A * L-m // 0.02 N/T
  #let data2 = range(1, 11).map(B => (B, B * 1e-3 * slope2 * 1e3)) // x in mT, y in mN

  #align(center)[
    === Force on a Wire as a Function of Magnetic Field Strength
    #canvas({
      import plot: *
      plot(
        size: (8.0, 5.0),
        axis-style: "scientific-auto",
        x-min: 0,
        x-max: 11,
        x-tick-step: 2,
        x-grid: true,
        x-label: [Magnetic Field, $B$ (mT)],
        y-min: 0,
        y-max: 0.25,
        y-tick-step: 0.05,
        y-grid: true,
        y-label: [Force, $F$ (mN)],
        legend: "inner-north-west",
        {
          add(
            data2,
            line: "raw",
            style: (stroke: none),
            mark: "o",
            mark-style: (stroke: black, fill: black),
          )
          add(
            domain: (0, 11),
            B => slope2 * B,
            style: (stroke: blue + 1.5pt),
            mark: none,
            label: [$F = (#unit-A-m(slope2)) B$],
          )
        },
      )
    })
  ]

  The slope of this plot is $#unit-A-m(slope2)$. This slope represents the product $I L$, i.e. the current through the wire multiplied by the length
  of the wire.