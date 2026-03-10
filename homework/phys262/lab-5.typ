#import "../../helpers/template.typ": *
#import "../../src/electromagnetism/helpers.typ": battery
#import "../helpers.typ": *
#import "@preview/cetz:0.4.2"
#import "@preview/cetz:0.4.2": canvas
#import "@preview/cetz-plot:0.1.3": plot
#import "@preview/zero:0.6.1": zi, set-unit
#import "@preview/zap:0.5.0"

#show: hw-template

#let name = "Lab 5: Ohm's Law"
#let date = "March 7, 2026"
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

  vsource("v_in", (0, 0), (0, 2), variant: "ieee", label: (content: $V_"in"$, anchor: "north"), i: $i$)
  wire((0, 2), (2, 2))
  resistor("R1", (2, 2), (2, 1), width: 0.7, variant: "ieee", label: $R_1$)
  resistor("R2", (2, 1), (2, 0), width: 0.7, variant: "ieee", label: $R_2$)
  wire((2, 0), (0, 0))
})

+ #grid(columns: (1fr, 0.5fr), align: (left, right))[
  A resistor with a green-blue-orange-gold color code has resistance:
  $
    R = 56 dot #unit-kOhm(1) plus.minus 5% = bf(#unit-kOhm(56) plus.minus #unit-kOhm(0.05 * 56, digits: 1)).
  $
][
  #image("lab-5-0.png", width: 100pt)
]

+ If $R_1, R_2, R_3$ are the resistances of three resistors in parallel, their equivalent resistance is:
  $
    1/R_"eq" = 1/R_1 + 1/R_2 + 1/R_3 #h(1em) -> cgreen(R_"eq" = (1/R_1 + 1/R_2 + 1/R_3)^(-1)).
  $

  If they are instead connected in series, then:
  $
    R_"eq" = cgreen(R_1 + R_2 + R_3).
  $

  In the PhET Lab, I used three resistors with resistances $R_1 = #unit-Ohm(10), R_2 = #unit-Ohm(15), R_3 = #unit-Ohm(20)$.

  - #grid(columns: (1fr, 0.3fr), align: (left, right))[
      In parallel, the voltmeter measured a potential difference of #unit-V("12.00") across the resistors, and the ammeter measured a current of #unit-A("2.60") flowing through the circuit. Thus, the equivalent resistance of the parallel combination is:
      $
        R_"eq" = (Delta V) / i = #unit-Ohm(12 / 2.6, digits: 2).
      $
      Using the equation from above, the calculated equivalent resistance of the parallel combination is:
      $
        R_"eq" = (1/R_1 + 1/R_2 + 1/R_3)^(-1) = (1/#unit-Ohm(10) + 1/#unit-Ohm(15) + 1/#unit-Ohm(20))^(-1) = #unit-Ohm(4.62).
      $
      This is consistent with the measured value.
    ][
      #image("lab-5-1.png", width: 100pt)
    ]


  - #grid(columns: (1fr, 0.3fr), align: (left, right))[
      In series, the voltmeter measured $Delta V = #unit-V("12.00")$ across the resistors, and the ammeter measured $i = #unit-A("0.27")$:
      $
        R_"eq" = (Delta V) / i = #unit-Ohm(12 / 0.27, digits: 2).
      $
      Using the equation from earlier:
      $
        R_"eq" = R_1 + R_2 + R_3 = #unit-Ohm(10) + #unit-Ohm(15) + #unit-Ohm(20) = #unit-Ohm(45).
      $
      This is consistent with the measured value.
    ][
      #image("lab-5-2.png", width: 100pt)
    ]

+ #grid(columns: (1fr, 0.5fr), align: (left, center + horizon))[
    Using Kirchhoff's Loop Rule, the current through the circuit is:
    $
      +V_"in" - i R_1 - i R_2 &= 0 \
      i (R_1 + R_2) &= V_"in" ->
      i &= V_"in" / (R_1 + R_2).
    $

    The potential difference across $R_1$, $V_"out" (R_1)$, is:
    $
      V_"out" (R_1) = i R_1 = cgreen((V_"in" R_1) / (R_1 + R_2)).
    $
  ][
    #prelab-circuit
  ]

#set text(size: 11pt)
#pagebreak()

/**
 * Part 1
 */

= Part 1: Resistor Color Code, Voltage, and the DMM

#lthin

#let frame(stroke) = (x, y) => (
  left: if x > 0 { 0pt } else { stroke },
  right: stroke,
  top: if y < 2 { stroke } else { 0pt },
  bottom: stroke,
)

#let r1-color-ohms = 510
#let r1-color-tol = 0.05
#let r1-meas-ohms = 517

#let r2-color-kohms = 75
#let r2-color-tol = 0.05
#let r2-meas-kohms = 74.4

#let within-tol-r1 = calc.abs(r1-meas-ohms - r1-color-ohms) <= r1-color-ohms * r1-color-tol
#let within-tol-r2 = calc.abs(r2-meas-kohms - r2-color-kohms) <= r2-color-kohms * r2-color-tol


#table(
  columns: (0.6fr, 1.2fr, 1.2fr, 1fr),
  stroke: frame(1pt),
  table.header[][*Color Code Resistance*][*Measured Resistance*][*Within Tolerance?*],
  [$R_1$],
  [#qty(r1-color-ohms, 3, unit-Ohm) $plus.minus$ 5%],
  [#qty(r1-meas-ohms, 3, unit-Ohm)],
  [#if within-tol-r1 { tgreen[Yes] } else { tred[No] }],
  [$R_2$],
  [#qty(r2-color-kohms, 3, unit-kOhm) $plus.minus$ 5%],
  [#qty(r2-meas-kohms, 3, unit-kOhm)],
  [#if within-tol-r2 { tgreen[Yes] } else { tred[No] }],
)

#pagebreak()

= Part 2: Ohm's Law Graph and Power Calculations

#lthin

#let R-ohms = 1500
#let R-measured-ohms = 1479
#let max-safe-P-Watts = 0.5
#let max-safe-V = calc.sqrt(R-ohms * max-safe-P-Watts)

#quantity-table(
  [*Color Code Resistance*], qty(R-ohms, 4, unit-Ohm),
  [*Measured Resistance*], qty(R-measured-ohms, 4, unit-Ohm),
)

== Safe Voltage Calculation

Let $P_"max" = 0.5 "W"$. Since $P = V^2 slash R -> V = sqrt(P R)$, 
$
  V_"max" = sqrt(P_"max" R) = sqrt((0.5 "W")(#qty(R-measured-ohms, 4, unit-Ohm))) = #qty(max-safe-V, 3, unit-V).
$

== Data Collection & Analysis

#let data = (
  // emf (V), V_R (V), current (mA)
  (6.0, 6.1, 5.0),
  (9.0, 9.09, 6.7),
  (12.0, 12.1, 9.5),
  (15.0, 15.04, 11.1),
  (18.0, 18.04, 13.3),
  (21.0, 20.9, 15.2),
  (24.0, 23.9, 17.1),
  (27.0, 27.0, 19.2),
)

// current in A for calculations
#let data-si = data.map(((emf, vr, i-ma)) => (emf, vr, i-ma * 1e-3))

// slope through origin: V vs I
#let slope-ohms = {
  let sum-vi = 0.0
  let sum-i2 = 0.0
  for (emf, vr, i) in data-si {
    sum-vi += vr * i
    sum-i2 += i * i
  }
  sum-vi / sum-i2
}

#table(
  columns: (1fr, 1fr, 1fr),
  stroke: frame(1pt),
  table.header[*Voltage $V_R$*][*Current $I$*][*Power $P = V_R I$*],
  ..data.map(((emf, vr, i-ma)) => {
    let p-mw = vr * i-ma
    (
      [#qty(vr, 3, unit-V)],
      [#qty(i-ma, 4, unit-mA)],
      [#qty(p-mw, 4, unit-mW)],
    )
  }).flatten()
)

#let i-max-ma = 21.0
#let v-max = 29.0

#let data-plot = data.map(((emf, vr, i-ma)) => (i-ma, vr))

#let part-1-graph = [
  === Potential Difference vs. Current through Resistor
  #canvas({
    import plot: *
    plot(
      size: (8.0, 5.0),
      axis-style: "scientific-auto",
      x-min: 0,
      x-max: i-max-ma,
      x-tick-step: 5,
      x-grid: true,
      x-label: [Current, $I$ (mA)],
      y-min: 0,
      y-max: v-max,
      y-tick-step: 5,
      y-grid: true,
      y-label: [Voltage across Resistor, $V_R$ (V)],
      legend: "inner-north-west",
      {
        add(
          data-plot,
          line: "raw",
          style: (stroke: none),
          mark: "o",
          mark-style: (stroke: black, fill: black),
        )
        add(
          domain: (0, i-max-ma),
          i => (slope-ohms * 1e-3) * i,  // slope in Ohm, i in mA -> V
          style: (stroke: blue + 1.5pt),
          mark: none,
          label: [$V_R = (#qty(slope-ohms, 4, unit-Ohm)) I$],
        )
      },
    )
  })
]

#align(center, part-1-graph)

The slope of the best-fit line through the origin is #qty(slope-ohms, 4, unit-Ohm). Since $V_R = R I$ by Ohm's Law, the slope estimates the resistance $R$. Thus, $R approx #qty(slope-ohms, 4, unit-Ohm)$.

#quantity-table(
  [*Resistance from Slope*], qty(slope-ohms, 4, unit-Ohm),
  [*Measured Resistance*], [#unit-Ohm(R-measured-ohms)],
  [*Percent Difference*], [#nfmt(calc.abs(slope-ohms - R-measured-ohms) / ((slope-ohms + R-measured-ohms) / 2) * 100, digits: 2)%],
)

#pagebreak()

/**
 * Part 3
 */

= Part 3: Resistors in Series, Parallel, and Series/Parallel

#lthin

#let R1-ohms = 220  // +/- 5%
#let R2-ohms = 820  // +/- 5%
#let R3-ohms = 1000 // +/- 5%

#let R1-measured-ohms = 217
#let R2-measured-ohms = 821
#let R3-measured-ohms = 979

#table(
  columns: (1fr, 1fr, 1fr),
  stroke: frame(1pt),
  table.header[*Resistor*][*Color Code Value*][*Measured Resistance*],
  [$R_1$], [#unit-Ohm(R1-ohms) $plus.minus$ 5%], [#unit-Ohm(R1-measured-ohms)],
  [$R_2$], [#unit-Ohm(R2-ohms) $plus.minus$ 5%], [#unit-Ohm(R2-measured-ohms)],
  [$R_3$], [#unit-Ohm(R3-ohms) $plus.minus$ 5%], [#unit-Ohm(R3-measured-ohms)],
)

== Series ($R_1$ and $R_2$)

#let R-series-measured-ohms = 1039
#let R-series-calculated-ohms = R1-measured-ohms + R2-measured-ohms
#let R-series-percent-diff = calc.abs(R-series-calculated-ohms - R-series-measured-ohms) / ((R-series-calculated-ohms + R-series-measured-ohms) / 2) * 100

$
  R_"series" = R_1 + R_2 = #unit-Ohm(R1-measured-ohms) + #unit-Ohm(R2-measured-ohms) = cgreen(#unit-Ohm(R-series-calculated-ohms)).
$

#quantity-table(
  [*Calculated $R_"series"$*], [#unit-Ohm(R-series-calculated-ohms)],
  [*Measured $R_"series"$*],   [#unit-Ohm(R-series-measured-ohms)],
  [*Percent Difference*],      [#nfmt(R-series-percent-diff, digits: 2)%],
)

== Parallel ($R_1$ and $R_2$)

#let R-parallel-measured-ohms = 172
#let R-parallel-calculated-ohms = 1 / (1 / R1-measured-ohms + 1 / R2-measured-ohms)
#let R-parallel-percent-diff = calc.abs(R-parallel-calculated-ohms - R-parallel-measured-ohms) / ((R-parallel-calculated-ohms + R-parallel-measured-ohms) / 2) * 100

$
  R_"parallel" = (1/R_1 + 1/R_2)^(-1) = (1/#unit-Ohm(R1-measured-ohms) + 1/#unit-Ohm(R2-measured-ohms))^(-1) = cgreen(#unit-Ohm(R-parallel-calculated-ohms, digits: 3)).
$

#quantity-table(
  [*Calculated $R_"parallel"$*], [#unit-Ohm(R-parallel-calculated-ohms, digits: 3)],
  [*Measured $R_"parallel"$*],   [#unit-Ohm(R-parallel-measured-ohms)],
  [*Percent Difference*],        [#nfmt(R-parallel-percent-diff, digits: 2)%],
)

== Series/Parallel ($R_1$ and $R_2$ in series, $R_3$ in parallel)

#let R-complex-measured-ohms = 504
#let R-complex-calculated-ohms = {
  let _R-eq-series-ohms = R1-measured-ohms + R2-measured-ohms
  1 / (1 / _R-eq-series-ohms + 1 / R3-measured-ohms)
}
#let R-complex-percent-diff = calc.abs(R-complex-calculated-ohms - R-complex-measured-ohms) / ((R-complex-calculated-ohms + R-complex-measured-ohms) / 2) * 100

$
  R_"eq" = ((R_1 + R_2)^(-1) + R_3^(-1))^(-1)
  = ((#unit-Ohm(R1-measured-ohms) + #unit-Ohm(R2-measured-ohms))^(-1) + 1/#unit-Ohm(R3-measured-ohms))^(-1)
  = cgreen(#unit-Ohm(R-complex-calculated-ohms, digits: 3)).
$

#quantity-table(
  [*Calculated $R_"eq"$*], [#unit-Ohm(R-complex-calculated-ohms, digits: 3)],
  [*Measured $R_"eq"$*],   [#unit-Ohm(R-complex-measured-ohms)],
  [*Percent Difference*],  [#nfmt(R-complex-percent-diff, digits: 2)%],
)

#pagebreak()

/**
 * Part 4
 */

= Part 4: Voltage Divider w/ Potentiometer

#lthin

#let R-pot-total-ohms = 10000
#let V-in = 10.0

The potentiometer has a total resistance of $R_"tot" = #unit-kOhm(10)$, and $V_"in" = #unit-V(V-in)$.


$
  V_"out"(R_1) = V_"in" dot R_1 / (R_1 + R_2).
$

== Demonstration: $R_1 + R_2 = 10 "k"#sym.Omega$

#let R-pot-positions-ohms = (
  // label, R1 (Ohm), R2 (Ohm)
  ("Left",   0,    9750),
  ("Center", 3150, 6960),
  ("Right",  9730, 0),
)

#table(
  columns: (1fr, 1fr, 1fr, 1fr),
  stroke: frame(1pt),
  table.header[*Position*][*$R_1$*][*$R_2$*][*$R_1 + R_2$*],
  ..R-pot-positions-ohms.map(((label, r1, r2)) => {
    (label, unit-Ohm(r1), unit-Ohm(r2), unit-Ohm(r1 + r2))
  }).flatten()
)

In all three positions, $R_1 + R_2 approx #unit-kOhm(10)$.

== Data Collection & Analysis

#let pot-data = (
  // V_out(R1) (V), R1 (Ohm), V_out(R2) (V), R2 (Ohm)
  (2.44, 2220, 7.56, 7550),
  (5.41, 5470, 4.59, 4680),
  (7.79, 7830, 2.19, 2410),
  (9.64, 9530, 0.38, 560)
)

#table(
  columns: (1fr, 1fr, 1fr, 1fr),
  stroke: frame(1pt),
  table.header[*$R_1$*][*$V_"out" (R_1)$*][*$R_2$*][*$V_"out" (R_2)$*],
  ..pot-data.map(((vr1, r1, vr2, r2)) => {
    (unit-kOhm(r1 / 1000), unit-V(vr1, digits: 2), unit-kOhm(r2 / 1000), unit-V(vr2, digits: 2))
  }).flatten()
)

// slope through origin for Vout(R1) vs R1: Vout = (Vin / R_total) * R1
#let slope-r1 = {
  let sum-rv = 0.0
  let sum-r2 = 0.0
  for (vr1, r1, vr2, r2) in pot-data {
    sum-rv += r1 * vr1
    sum-r2 += r1 * r1
  }
  sum-rv / sum-r2
}

#let slope-r2 = {
  let sum-rv = 0.0
  let sum-r2 = 0.0
  for (vr1, r1, vr2, r2) in pot-data {
    sum-rv += r2 * vr2
    sum-r2 += r2 * r2
  }
  sum-rv / sum-r2
}

// theoretical slope = Vin / R_total
#let slope-theoretical = V-in / R-pot-total-ohms

#let r1-max-kohms = 10.5
#let r2-max-kohms = 10.5
#let v-plot-max = 11.0

// slope-r1/r2 are in V/Ω; convert to V/kΩ for kΩ x-axis
#let slope-r1-v-per-kohm = slope-r1 * 1000
#let slope-r2-v-per-kohm = slope-r2 * 1000
#let slope-theoretical-v-per-kohm = slope-theoretical * 1000

#let graph-pot-r1 = [
  === $V_"out" (R_1)$ vs. $R_1$
  #canvas({
    import plot: *
    plot(
      size: (6.5, 4.5),
      axis-style: "scientific-auto",
      x-min: 0,
      x-max: r1-max-kohms,
      x-tick-step: 2,
      x-grid: true,
      x-label: [$R_1$ (k#sym.Omega)],
      y-min: 0,
      y-max: v-plot-max,
      y-tick-step: 2,
      y-grid: true,
      y-label: [$V_"out" (R_1)$ (V)],
      legend: "inner-north-west",
      {
        add(
          pot-data.map(((vr1, r1, vr2, r2)) => (r1 / 1000, vr1)),
          line: "raw",
          style: (stroke: none),
          mark: "o",
          mark-style: (stroke: black, fill: black),
        )
        add(
          domain: (0, r1-max-kohms),
          r => slope-r1-v-per-kohm * r,
          style: (stroke: blue + 1.5pt),
          mark: none,
          label: [$V = (#nfmt(slope-r1-v-per-kohm, digits: 3) "V/k"#sym.Omega) R_1$],
        )
      },
    )
  })
]

#let graph-pot-r2 = [
  === $V_"out" (R_2)$ vs. $R_2$
  #canvas({
    import plot: *
    plot(
      size: (6.5, 4.5),
      axis-style: "scientific-auto",
      x-min: 0,
      x-max: r2-max-kohms,
      x-tick-step: 2,
      x-grid: true,
      x-label: [$R_2$ (k#sym.Omega)],
      y-min: 0,
      y-max: v-plot-max,
      y-tick-step: 2,
      y-grid: true,
      y-label: [$V_"out" (R_2)$ (V)],
      legend: "inner-north-west",
      {
        add(
          pot-data.map(((vr1, r1, vr2, r2)) => (r2 / 1000, vr2)),
          line: "raw",
          style: (stroke: none),
          mark: "o",
          mark-style: (stroke: black, fill: black),
        )
        add(
          domain: (0, r2-max-kohms),
          r => slope-r2-v-per-kohm * r,
          style: (stroke: blue + 1.5pt),
          mark: none,
          label: [$V = (#nfmt(slope-r2-v-per-kohm, digits: 3) "V/k"#sym.Omega) R_2$],
        )
      },
    )
  })
]

#grid(
  columns: (1fr, 1fr),
  align: horizon + center,
  graph-pot-r1, graph-pot-r2,
)

Using the voltage divider formula from the pre-lab:
$
  V_"out" (R_1) = V_"in" / R_"total" dot R_1 = (#unit-V(V-in)) / (#unit-kOhm(10)) dot R_1
  = (#nfmt(slope-theoretical-v-per-kohm, digits: 3) "V/k"#sym.Omega) R_1.
$
If $V_"out"$ is treated as a function of $R_1$, the slope of the graph should be around $1 "V/k"#sym.Omega$. Indeed, in the graph for $R_1$, the slope of the line of best fit is $1.005 "V/k"#sym.Omega$ which is very close to the expected result. Qualitatively, this means the voltage output through $R_1$ is proportional to the resistance $R_1$, which can vary as I turn the knob. The same logic can be applied to $R_2$: the slope of $0.989 "V/k"#sym.Omega$ is very close to $1 "V/k"#sym.Omega$.

// #box(width: 100%, inset: 0.5em, stroke: 1pt, align(center, table(
//   columns: 2,
//   stroke: none,
//   align: (right, left),
//   column-gutter: 1em,
//   [*Theoretical slope ($V_"in" slash R_"total"$)*], [#nfmt(slope-theoretical-v-per-kohm, digits: 3) V/k#sym.Omega],
//   [*Experimental slope ($R_1$ graph)*],              [#nfmt(slope-r1-v-per-kohm, digits: 3) V/k#sym.Omega],
//   [*Experimental slope ($R_2$ graph)*],              [#nfmt(slope-r2-v-per-kohm, digits: 3) V/k#sym.Omega],
// )))

#pagebreak()

= Conclusion Questions

#lthin

+ The circuit is called a voltage divider. Why?

  The circuit splits, or "divides", the voltage among each of the two resistors. This allows two parts of the circuit to receive different parts of the total supplied $V_"in"$.

+ Does it represent a practical method of getting low voltages from very high voltages? Why or why not? (Hint: Think about power being lost or wasted by $R_1$ or $R_2$.)

  I dont think this method is practical for large voltage drops. Power is dissipated in $R_1$ and $R_2$ at a rate $P = V^2 slash R$, so for large input voltages, energy is wasted as heat at a significant rate (the rate increases by the square), which would cause a significantly lower $V_"out"$.

+ The DMM has an input impedance (resistance) of #unit-MOhm(10), so it does not draw an appreciable amount of current from this circuit. What would happen if the input resistance of the voltmeter were about #unit-kOhm(25)? How would this affect your measurement of $V_"out"$?

  The DMM is placed in parallel with the resistor being measured. If the DMM's resistance were only #unit-kOhm(25), it would draw a significant amount of current, acting as an additional parallel resistor that lowers the effective resistance of that branch. This would cause a smaller potential drop across the branch (since $Delta V = I R_"eff"$ and $R_"eff"$ is reduced), resulting in a measured $V_"out"$ that is significantly lower than the true value.
