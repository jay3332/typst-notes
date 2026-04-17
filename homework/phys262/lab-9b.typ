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
  Lab 9b: Magnetic Force on a Wire
]
#let date = "April 3, 2026"
#let author = "Jaysen Tsao"
#let labmates = "Jocelyn Granger"
#let prof = "Professor Szwerc"
#let course = "PHYS 262"
#let crn = "30949"
#let submission_date = "April 10, 2026"

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

= Pre-lab Questions

// = Prelab 9
// #date
#lthin

// == Prelab 9a: Charge to Mass Ratio

// Why is it important to measure charge-to-mass ratio ($e slash m$)?

// Measuring the charge-to-mass ratio $e slash m$ of the electron is important because the charge $e$ and the mass $m$ are difficult to measure independently. The ratio $e slash m$ can be used to determine the motion of charged particles in electric and magnetic fields without needing to know that individual values of $e$ and $m$.

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
  
#pagebreak()

// begin Lab 9b: Magnetic Force on a Wire

// nfmt wrapper that handles negative numbers
#let sfmt(number, digits: 3) = {
  if number < 0 {
    "-" + nfmt(-number, digits: digits)
  } else {
    nfmt(number, digits: digits)
  }
}

// ===== All data and computations for Lab 9b =====

#let base-mass-g = 166.71
#let base-mass-kg = base-mass-g / 1000

#let _promote-data(
  trial: 1,
  name: "",
  length-cm: 0,
  abs-mass-g: 0,
  current-A: 0,
) = {
  let length-m = length-cm / 100
  let rel-mass-g = abs-mass-g - base-mass-g
  let rel-mass-kg = rel-mass-g / 1000
  let B-force-N = rel-mass-kg * 9.81 // F = mg
  let B-field-T = B-force-N / (current-A * length-m) // B = F/IL
  (
    trial: trial,
    name: name,
    length-cm: length-cm,
    length-m: length-m,
    abs-mass-g: abs-mass-g,
    rel-mass-g: rel-mass-g,
    rel-mass-kg: rel-mass-kg,
    current-A: current-A,
    B-force-N: B-force-N,
    B-field-T: B-field-T,
  )
}
#let _avg_B-field-T(data) = data.map(r => r.B-field-T).sum() / data.len()

// table frame helper
#let frame(stroke) = (x, y) => (
  left: if x > 0 { 0pt } else { stroke },
  right: stroke,
  top: if y < 2 { stroke } else { 0pt },
  bottom: stroke,
)

// --- Part 1 data ---
#let _rawdata-1 = (
  // SF loop ID, length (cm), absolute mass (g)
  (42, 8.4, 167.54),
  (41, 6.4, 167.33),
  (38, 4.2, 167.04),
  (39, 3.2, 166.98),
  (37, 2.2, 166.89),
  (40, 1.2, 166.79),
)
#let current-1-A = 1.0
#let data-1 = _rawdata-1.enumerate().map(
  ((idx, (loop-id, length-cm, abs-mass-g))) => _promote-data(
    trial: idx + 1,
    name: [SF #loop-id],
    length-cm: length-cm,
    abs-mass-g: abs-mass-g,
    current-A: current-1-A,
  )
)
#let data-1-average-B-field-T = _avg_B-field-T(data-1)

// Part 1 linear regression: F vs L (through origin)
#let sum-LF1 = data-1.fold(0.0, (a, r) => a + r.length-m * r.B-force-N)
#let sum-L1sq = data-1.fold(0.0, (a, r) => a + r.length-m * r.length-m)
#let slope-1 = sum-LF1 / sum-L1sq // in N/m
#let slope-1-N-per-cm = slope-1 / 100 // in N/cm
#let B-from-part1 = slope-1 / current-1-A

// --- Part 2 data ---
#let _rawdata-2 = (
  // target current (A), measured current (A), absolute mass (g)
  (0.5, 0.52, 166.86),
  (1.0, 0.96, 167.03),
  (1.5, 1.46, 167.25),
  (2.0, 1.99, 167.41),
  (2.5, 2.479, 167.57),
  (3.0, 2.985, 167.78),
  (3.5, 3.477, 167.95),
  (4.0, 3.965, 168.2),
  (4.5, 4.448, 168.39),
  (5.0, 5.004, 168.61),
)
#let length-2-cm = 4.2
#let length-2-m = length-2-cm / 100
#let length-2-name = "SF 38"
#let data-2 = _rawdata-2.enumerate().map(
  ((idx, (target-current-A, measured-current-A, abs-mass-g))) => (
    .._promote-data(
      trial: idx + 1,
      name: length-2-name,
      length-cm: length-2-cm,
      abs-mass-g: abs-mass-g,
      current-A: measured-current-A,
    ),
    target-current-A: target-current-A,
  )
)
#let data-2-average-B-field-T = _avg_B-field-T(data-2)

// Part 2 linear regression: F vs I (through origin)
#let sum-IF2 = data-2.fold(0.0, (a, r) => a + r.current-A * r.B-force-N)
#let sum-I2sq = data-2.fold(0.0, (a, r) => a + r.current-A * r.current-A)
#let slope-2 = sum-IF2 / sum-I2sq
#let B-from-part2 = slope-2 / length-2-m

// --- Part 3 data ---
#let _rawdata-3 = (
  // measured B-field strength (mT)
  88.7,
  90.97,
  88.87,
)
#let data-3 = _rawdata-3.enumerate().map(
  ((idx, B-field-mT)) => (
    trial: idx + 1,
    B-field-mT: B-field-mT,
    B-field-T: B-field-mT / 1000,
  )
)
#let data-3-average-B-field-T = _avg_B-field-T(data-3)

// --- Comparison ---
#let pct-diff(a, b) = calc.abs(a - b) / ((a + b) / 2) * 100
#let pct-1-3 = pct-diff(B-from-part1, data-3-average-B-field-T)
#let pct-2-3 = pct-diff(B-from-part2, data-3-average-B-field-T)
#let pct-1-2 = pct-diff(B-from-part1, B-from-part2)

// ===== End data/computations =====

= Abstract
#lthin

/*Background necessary to motivate experiment. (Why is this experiment worth doing?)
• Description of experimental procedure and methodology for analysis (What exactly did you do, what did
you measure, how did you measure it and how did you extract your relevant results)
• A clear statement of the outcome. (The punchline: summarize quantitative results and explain what they
mean)
• Comparison to expectations. (Did your results agree with theoretical predictions? At what level (ie: %
difference) do they disagree? If your results disagree with expected, what are the likely reasons
for discrepancy – state sources of measurement uncertainty*/

In this lab, we attempted to determine the magnetic field inside the opening of a permanent magnet by measuring the vertical magnetic force exerted by the magnetic field on a current-carrying wire.
The magnitude of this magnetic force is given by $F = I L B$, where $I$ is the current flowing through the wire, $L$ is the length of the wire, and $B$ is the magnetic field strength. So, by fixing $I$ or $L$ and measuring $F$, we can extract the magnetic field strength $B$. This verifies the linear dependence of $I$ and $L$ on $F$.

For each trial, we lowered the current-carying wire into the opening of the permanent magnet. The scale was rebalanced, and a mass measurement was taken. The change in mass was recorded to calculate the change in vertical force (treated as the difference from gravitational force),
which we assumed to be the magnetic force $F$. Over multiple measurements of $F$, we performed a linear regression to extract the magnetic field strength $B$. This procedure was performed twice: once where current was fixed and once where wire length was fixed. 

Finally, we directly measured the magnetic field strength using a magnetic field sensor, and compared this value to our previous two estimates of $B$. With $I$ fixed, the estimate had a percent difference of #nfmt(pct-1-3, digits: 1)% from the sensor measurement. With $L$ fixed, the estimate had a percent difference of #nfmt(pct-2-3, digits: 1)%. These are both extremely close
to the sensor measurement, confirming the consistency of our experiment with the equation $F = I L B$. Possible sources of error include the volatility of the power supply and human error adjusting the scale.

// In this lab, we measured the magnetic force exerted by a magnetic field on a current-carrying wire to verify the relationship $F = I L B$ and to determine the strength of a permanent magnet. Using a PASCO current balance kit, we measured the apparent change in mass on a digital scale when current flowed through wires of varying lengths (Part 1) and at varying currents (Part 2). The magnetic force was calculated as $F = Delta m dot g$, and the magnetic field strength $B$ was extracted from the slopes of linear fits to $F$ vs. $L$ and $F$ vs. $I$ plots.

// From Part 1 (varying length at $I = #unit-A(current-1-A)$), the slope yielded $B = #qty(B-from-part1, 3, unit-T)$. From Part 2 (varying current with $L = #unit-cm(length-2-cm)$), $B = #qty(B-from-part2, 3, unit-T)$. The direct sensor measurement gave $B = #qty(data-3-average-B-field-T, 3, unit-T)$. These three values agree to within #nfmt(calc.max(pct-1-3, pct-2-3), digits: 1)%, confirming the theoretical model. Sources of uncertainty include scale resolution, current measurement precision, and possible magnetic field non-uniformity.

#pagebreak()

= Introduction
#lthin

The force on a straight current-carrying wire in a magnetic field is given by $arrow(F) = I arrow(L) times arrow(B)$, where $I$ is the current, $arrow(L)$ is the length vector of the wire, and $arrow(B)$ is the magnetic field. 

When the wire is perpendicular to the field, this simplifies to $F = I L B$. Using the right hand rule, we can determine that if the permanent magnet is placed with the "colorful" side facing up, palcing a current-carrying wire through the sides of the magnet opening will result in a vertical (upward/downward) force on the wire, called the _magnetic force_. 

This magnetic force will cause an apparent change in mass when the wire is placed on a scale, which can be used to experimentally determine the magnetic field strength $B$.

== Equipment

- Permanent Magnet from PASCO EM-8933 Kit

*Parts 1 and 2*:
- Manual Scale
- Current Loops (SF 37--42) from PASCO EM-8933 Kit
- Current-generating Power Supply
- Digital Multimeter (Ammeter)

*Part 3*:
- Magnetic Field Sensor

// - PASCO EM-8933 Current Balance Kit (with six current loops: SF 37--42)
// - Digital Scale
// - DC Power Supply
// - Ammeter (DMM)
// - Magnetic Field Sensor

== Procedure

+ *Part 1 (Force vs. Length):* With the current fixed at #unit-A(1.0), each of the six current loops (with different wire lengths) was placed in the magnetic field created by the permanent magnets. The scale reading was recorded for each loop. The magnetic force was calculated from the change in apparent mass. A linear regression was performed over multiple trials to estimate the magnetic field inside the permanent magnet.

+ *Part 2 (Force vs. Current):* Using the SF 38 loop ($L = #unit-cm(4.2)$), the current was varied from #unit-A(0.5) to #unit-A(5.0) in #unit-A(0.5) increments. The current loops were placed in the magnetic field, and the scale readings were recorded. The magnetic force was calculated, and a linear regression was performed to estimate the magnetic field.

+ *Part 3 (Direct Measurement):* The magnetic field between the permanent magnets was measured directly using a magnetic field sensor, with three measurements taken.

#pagebreak()

= Part 1: Magnetic Force w/ Varying Wire Length
#lthin

#let unit-g = zi.declare("g")

The current was fixed at $I = #unit-A(current-1-A)$. The base mass (no current) was $m_0 = #unit-g(nfmt(base-mass-g, digits: 2))$.

#let avg(data, key) = data.map(r => r.at(key)).sum() / data.len()
#let data-1-average-B-force-N = avg(data-1, "B-force-N")

#table(
  columns: (0.5fr, 0.7fr, 0.8fr, 1fr, 1fr, 1fr),
  // stroke: (x, y) => {
  //   let base = frame(1pt)(x, y)
  //   if y == data-1.len() + 1 { base.top = 1pt }
  //   base
  // },
  stroke: frame(1pt),
  table.header[*\#*][*Loop*][*$L$*][*$m$*][*$Delta m = m - m_0$*][*$F = (Delta m) g$*],
  ..data-1.map(r => (
    str(r.trial),
    r.name,
    qty(r.length-cm, 2, unit-cm),
    qty(r.abs-mass-g, 5, unit-g),
    qty(r.rel-mass-g, 2, unit-g),
    sci-qty(r.B-force-N, 3, unit-N),
  )).flatten(),
  // table.cell(colspan: 5, align: right)[*Average*], sci-qty(data-1-average-B-force-N, 3, unit-N)
)

Where $L$ is the "effective" length of each wire affected by the magnetic field, $m$ is the absolute mass
measured on the manual balance, and $Delta m$ is the extra apparent mass due to the magnetic force.

#let unit-N-per-m = zi.declare("N/m")
#let unit-N-per-cm = zi.declare("N/cm")

#align(center)[
  === Relative Magnetic Force with Varying Wire Length, fixed at #unit-A(current-1-A) of current
  #canvas({
    import plot: *
    plot(
      size: (9.0, 5.5),
      axis-style: "scientific-auto",
      x-min: 0,
      x-max: 10,
      x-tick-step: 2,
      x-grid: true,
      x-label: [Wire Length, $L$ (cm)],
      y-min: 0,
      y-max: data-1.first().B-force-N * 1.15 * 1000,
      y-tick-step: 2,
      y-grid: true,
      y-label: [Force, $F$ ($10^(-3)$ N)],
      legend: "inner-north-west",
      {
        add(
          data-1.map(r => (r.length-cm, r.B-force-N * 1000)),
          line: "raw",
          style: (stroke: none),
          mark: "o",
          mark-style: (stroke: black, fill: black),
        )
        add(
          domain: (0, 10),
          L => slope-1 * L * 10,
          style: (stroke: blue + 1.5pt),
          mark: none,
          label: [$F = (#qty(slope-1, 3, unit-N-per-m)) L$],
        )
      },
    )
  })
]

Performing a linear regression using Desmos, the slope of the best-fit line is #qty(slope-1, 3, unit-N-per-m). 

Since $F = I L B$, if $F$ varies with $L$, then the slope equals $I B$:
$
  "slope" = I B #h(1em) => #h(1em) B = "slope" / I = #qty(slope-1, 3, unit-N-per-m) / #unit-A(current-1-A) = cgreen(#qty(B-from-part1, 3, unit-T)).
$

#pagebreak()

= Part 2: Magnetic Force w/ Varying Current
#lthin

The wire length was fixed at $L = #unit-cm(length-2-cm)$ (#length-2-name). The base mass was $m_0 = #unit-g(nfmt(base-mass-g, digits: 2))$.

#table(
  columns: (0.4fr, 0.7fr, 0.8fr, 0.8fr, 0.8fr, 1fr),
  stroke: frame(1pt),
  table.header[*\#*][*$I_"target"$*][*$I_"DMM"$*][*$m$*][*$Delta m = m - m_0$*][*$F = (Delta m)g$*],
  ..data-2.map(r => (
    str(r.trial),
    qty(r.target-current-A, 1, unit-A, mode: "places"),
    qty(r.current-A, 2, unit-A, mode: "places"),
    qty(r.abs-mass-g, 5, unit-g),
    qty(r.rel-mass-g, 2, unit-g, mode: "places"),
    sci-qty(r.B-force-N, 3, unit-N),
  )).flatten()
)

Where $I_"target"$ was the current we tried to obtain on the power supply, $I_"DMM"$ was the actual current measured by the DMM, 
$m$ was the absolute mass measured on the balance, and $Delta m$ was the extra apparent mass due to the magnetic force.

#let unit-N-per-A = zi.declare("N/A")

#align(center)[
  === Relative Magnetic Force with Varying Current, fixed at #unit-cm(length-2-cm) of wire length
  #canvas({
    import plot: *
    plot(
      size: (9.0, 5.5),
      axis-style: "scientific-auto",
      x-min: 0,
      x-max: 5.5,
      x-tick-step: 1,
      x-grid: true,
      x-label: [Current, $I$ (A)],
      y-min: 0,
      y-max: data-2.last().B-force-N * 1000 * 1.15,
      y-tick-step: 5,
      y-grid: true,
      y-label: [Force, $F$ ($10^(-3)$ N)],
      legend: "inner-north-west",
      {
        add(
          data-2.map(r => (r.current-A, r.B-force-N * 1000)),
          line: "raw",
          style: (stroke: none),
          mark: "o",
          mark-style: (stroke: black, fill: black),
        )
        add(
          domain: (0, 5.5),
          I => slope-2 * I * 1000,
          style: (stroke: blue + 1.5pt),
          mark: none,
          label: [$F = (#qty(slope-2, 5, unit-N-per-A)) I$],
        )
      },
    )
  })
]

Performing a linear regression using Desmos, the slope of the best-fit line is #qty(slope-2, 5, unit-N-per-A). 

Since $F = I L B$, if $F$ varies with $I$, then the slope equals $L B$:
$
  "slope" = L B #h(1em) => #h(1em) B = "slope" / L = #qty(slope-2, 5, unit-N-per-A) / #unit-m(length-2-m) = cgreen(#qty(B-from-part2, 3, unit-T)).
$

#pagebreak()

= Part 3: Direct Measurement of Magnetic Field <p3>
#lthin

The magnetic field between the magnet was measured directly using a magnetic field sensor.

#table(
  columns: (1fr, 1fr),
  stroke: frame(1pt),
  table.header[*Trial*][*Measured Magnetic Field $B$*],
  ..data-3.map(r => (
    str(r.trial),
    qty(r.B-field-mT, 2, unit-mT, mode: "places"),
  )).flatten(),
  [*Average*], [#qty(data-3-average-B-field-T * 1000, 2, unit-mT, mode: "places")],
)

#v(2em)

= Comparison of Methods
#line(stroke: 0.5pt, length: 100%)

#table(
  columns: (1.5fr, 1fr, 1fr),
  stroke: frame(1pt),
  table.header[*Method*][*$B$ (T)*][*% Difference*],
  [Part 1 (Force vs. Length)], [#qty(B-from-part1, 3, unit-T)], [#nfmt(pct-1-3, digits: 1)%],
  [Part 2 (Force vs. Current)], [#qty(B-from-part2, 3, unit-T)], [#nfmt(pct-2-3, digits: 1)%],
  [Part 3 (Direct Measurement)], [#qty(data-3-average-B-field-T, 3, unit-T)], [---],
)

All three methods yield consistent results. The percent difference between the indirect measurements (Parts 1 and 2) and the direct measurement (Part 3) is small.

The small variation between the methods can be attributed to several sources of uncertainty which are detailed in the #link(<erranal>)[_Error Analysis_] below.

== Error Analysis <erranal>

Sources of uncertainty include:

- *human error from adjusting the scale*, since the scale was very sensitive to small vibrations.
  This would have caused random variations in the apparent mass $m$.

- *volatility of the current*, since the power supply had arbitrary fluctuations in current.
  This would have caused random variations in the measured current $I$.

- *human error adjusting the current of the power supply*, since the dial was extremely sensitive and it was rare that we are able to set the current to _exactly_ the desired current. This would have caused systematic errors in the measured current $I$.

- *resistance from the power supply to the wire*, which would would lower the actual current in the wire. Since this "mystery" resistance should remain relatively constant, this is a systematic error which would have caused a consistent underestimation of the measured current $I$.

#pagebreak()

= Conclusion
#lthin

/*1) Find out the typical magnetic field in Tesla associated with
a. A junkyard magnet (used to pick up cars)
b. A refrigerator magnet
c. The earth’s magnetic field
2) Assume that a square coil has 8 windings and has 2 amp current. For each of the
magnetic field strengths in question 1, calculate the magnetic force on each side of the
square coil if the field is parallel with the coil axis, and the length of a side of the
square coil is i) 1 cm and ii) 10 cm. Present your calculations in a table.
3) For B = 1 Tesla (perpendicular to the axis of the coil) and the 10 cm square coil with 8
windings with 2 amps current, draw the forces on each side of the coil and calculate the net
force on the coil.
4) What happens if the magnetic field is parallel to the axis of the coil? How does
the situation change? Illustrate your answer.
5) What is the definition of the magnetic dipole moment of the loop? Calculate it
for thes loops (l= 1 cm and l=10 cm).
6) Find the maximum magnitude of the torque that the coil can experience.*/

#set enum(numbering: "1ai.")
#let unit-uT = zi.declare("muT")

+ Find out the typical magnetic field in Tesla associated with: <conclusion-q1>
  + junkyard magnet (used to pick up cars): *#unit-T(1) to #unit-T(2)*
  + refrigerator magnet: *#unit-mT(5) to #unit-mT(10)*
  + Earth's magnetic field: *#unit-uT(25) to #unit-uT(65)*

+ Assume that a square coil has $8$ loops and #unit-A(2) of current: $N = 8$, $I = #unit-A(2)$.

  For each of the magnetic field strengths in #link(<conclusion-q1>)[Question 1], calculate
  the magnetic force on each side of the square coil if the field is parallel with the coil axis, 
  given the side length of the square coil is (i) #unit-cm(1) and (ii) #unit-cm(10).

  Let the side length of the square coil be $L$, and let $hat(k)$ be the unit vector
  piercing through the coil. At all times, $arrow(L)$ is orthogonal to $hat(k)$, so
  $abs(arrow(L) times hat(k)) = L$.

  // N=8 windings, I=2 A; F on each side = N*I*L*B (wire perp to B since B parallel to coil axis)
  #let q2-N = 8
  #let q2-I = 2

  + junkyard magnet: let $arrow(B) = #unit-T(1.5) hat(k)$.
    + $L = #unit-cm(1)$: $F = N I L B = 8 dot #unit-A(2) dot #unit-m(0.01) dot #unit-T(1.5) = cgreen(#sci-qty(q2-N * q2-I * 0.01 * 1.5, 3, unit-N))$
    + $L = #unit-cm(10)$: $F = N I L B = 8 dot #unit-A(2) dot #unit-m(0.10) dot #unit-T(1.5) = cgreen(#qty(q2-N * q2-I * 0.10 * 1.5, 3, unit-N))$

  + refrigerator magnet: let $arrow(B) = #unit-mT(7.5) hat(k) = #sci-qty(0.0075, 3, unit-T) hat(k)$.
    + $L = #unit-cm(1)$: $F = N I L B = 8 dot #unit-A(2) dot #unit-m(0.01) dot #unit-T(0.0075) = cgreen(#sci-qty(q2-N * q2-I * 0.01 * 0.0075, 3, unit-N))$
    + $L = #unit-cm(10)$: $F = N I L B = 8 dot #unit-A(2) dot #unit-m(0.10) dot #unit-T(0.0075) = cgreen(#sci-qty(q2-N * q2-I * 0.10 * 0.0075, 3, unit-N))$

  + Earth's magnetic field: let $arrow(B) = #unit-uT(45) hat(k) = #sci-qty(0.000045, 3, unit-T) hat(k)$.
    + $L = #unit-cm(1)$: $F = N I L B = 8 dot #unit-A(2) dot #unit-m(0.01) dot #sci-qty(0.000045, 2, unit-T) = cgreen(#sci-qty(q2-N * q2-I * 0.01 * 0.000045, 3, unit-N))$
    + $L = #unit-cm(10)$: $F = N I L B = 8 dot #unit-A(2) dot #unit-m(0.10) dot #sci-qty(0.000045, 2, unit-T) = cgreen(#sci-qty(q2-N * q2-I * 0.10 * 0.000045, 3, unit-N))$

  #let unit-mN = zi.declare("mN")

  \
  #align(center)[== Table of Calculations]
  #table(
    columns: (1.5fr, 1fr, 1fr),
    stroke: frame(1pt),
    table.header[*Magnet Type*][*$F$ ($L = #unit-cm(1)$)*][*$F$ ($L = #unit-cm(10)$)*],
    [Junkyard (#unit-T(1.5))], [#sci-qty(q2-N * q2-I * 0.01 * 1.5, 3, unit-N)], [#qty(q2-N * q2-I * 0.10 * 1.5, 3, unit-N)],
    [Refrigerator (#unit-mT(7.5))], [#sci-qty(q2-N * q2-I * 0.01 * 0.0075, 3, unit-N)], [#sci-qty(q2-N * q2-I * 0.10 * 0.0075, 3, unit-N)],
    [Earth (#unit-uT(45))], [#sci-qty(q2-N * q2-I * 0.01 * 0.000045, 3, unit-N)], [#sci-qty(q2-N * q2-I * 0.10 * 0.000045, 3, unit-N)],
  )

#let q3 = cetz.canvas(length: 36pt, {
  import cetz.draw: *

  // magnetic field lines
  // for i in range(-2, 3) {
  //   for j in range(-2, 3) {
  //     circle((i, j), fill: black, radius: 0.05)
  //   }
  // }
  // content((2, 2), anchor: "north-east", padding: (x: 0.3))[$arrow(B)$]
  
  let amark(fill: black) = (symbol: ">", fill: fill)

  for y in range(-2, 3) {
    line((-2, y), (2, y), stroke: gray, mark: (end: amark(fill: gray)))
  }
  content((2, 2), anchor: "north-west", padding: 0.1, text(fill: gray)[$arrow(B)$])
  
  rect((-1.5, -1.5), (1.5, 1.5))
  mark((-1.5, 0), (-1.5, -1), ..amark())
  content((-1.5, 0), anchor: "east", padding: 0.2)[$I$]
  mark((1.5, 0), (1.5, 1), ..amark())
  mark((0, 1.5), (-1, 1.5), ..amark())
  mark((0, -1.5), (1, -1.5), ..amark())


  let point(x, y, fill: black) = circle((x, y), fill: fill, stroke: fill, radius: 0.05)
  point(-1.5, -0.5, fill: red)
  circle((-1.5, -0.5), radius: 0.15, stroke: red)
  content((-1.5, -0.5), anchor: "west", padding: 0.2, text(fill: red)[
    $arrow(F) = I L B thin hat(k)$
  ])

  let cross(position, stroke: black, size: 0.2) = {
    let (x, y) = position
    line((x - size, y - size), (x + size, y + size), stroke: stroke)
    line((x - size, y + size), (x + size, y - size), stroke: stroke)
  }

  // point(1.5, 0.5, fill: blue)
  cross((1.5, 0.5), stroke: blue, size: 0.08)
  circle((1.5, 0.5), radius: 0.15, stroke: blue)
  content((1.5, 0.5), anchor: "east", padding: 0.2, text(fill: blue)[
    $arrow(F) = - I L B thin hat(k)$
  ])
})

#let list-align(a, eq) = {
  block(width: 100%, inset: 0pt, align(a, eq))
}

#pagebreak()

3. For the configuration $B = #unit-T(1)$, $L = #unit-cm(10)$, $N = 8$, and $I = #unit-A(2)$, with $arrow(B)$ perpendicular to the coil axis (i.e. in the plane of the coil), consider the four sides of the square coil.

  + Draw the forces acting on each side of the coil.

    #list-align(center, q3)

    #align(center)[_The magnetic force on the top and bottom sides are omitted because they are zero._ \ _The gravitational force is omitted because it is negligible._]

  + What is the net force on the coil?

    The two magnetic forces acting on the left and right sides of the coil in the diagram cancel out, so there is zero net force on the coil. 

    However, there is a net _torque_ that would rotate the coil since the magnetic forces act in opposite directions, and the points at which the forces are exerted are away from the coil's center of mass. (The torque would tend to rotate the coil counterclockwise.)

  // Let $arrow(B) = B hat(i)$ and let the coil lie in the $i j$-plane. The four sides have current directions along $plus.minus hat(i)$ and $plus.minus hat(j)$.

  // - *Sides parallel to $arrow(B)$ ($plus.minus hat(i)$):* $arrow(F) = N I arrow(L) times arrow(B) = 0$ since $hat(i) times hat(i) = 0$.
  // - *Side with current along $+hat(j)$:* $arrow(F) = N I L B (hat(j) times hat(i)) = -N I L B hat(k)$ (downward).
  // - *Side with current along $-hat(j)$:* $arrow(F) = N I L B (-hat(j) times hat(i)) = +N I L B hat(k)$ (upward).

  // The magnitude of the force on each active side is:
  // $
  //   F = N I L B = 8 dot #unit-A(2) dot #unit-m(0.10) dot #unit-T(1) = cgreen(#qty(q2-N * q2-I * 0.10 * 1.0, 3, unit-N)).
  // $

  // The two nonzero forces are equal in magnitude but opposite in direction. The *net force on the coil is zero*, but there is a net *torque* that tends to rotate the coil (aligning $arrow(mu)$ with $arrow(B)$).


#let q4 = cetz.canvas(length: 36pt, {
  import cetz.draw: *

  let point(x, y, fill: black) = circle((x, y), fill: fill, stroke: fill, radius: 0.05)

  // magnetic field lines
  for i in range(-2, 3) {
    for j in range(-2, 3) {
      point(i, j, fill: gray)
    }
  }
  content((2, 2), anchor: "north-east", padding: (x: 0.3), text(fill: gray)[$arrow(B)$])
  
  let amark(fill: black) = (symbol: ">", fill: fill)
  rect((-1.5, -1.5), (1.5, 1.5))
  mark((-1.5, 0), (-1.5, -1), ..amark())
  content((-1.5, 0), anchor: "east", padding: 0.2)[$I$]
  mark((1.5, 0), (1.5, 1), ..amark())
  mark((0, 1.5), (-1, 1.5), ..amark())
  mark((0, -1.5), (1, -1.5), ..amark())



  point(-1.5, -0.5, fill: red)
  line((-1.5, -0.5), (-2.2, -0.5), stroke: red, mark: (end: amark(fill: red)))
  content((-1.5, -0.5), anchor: "west", padding: 0.2, text(fill: red, size: 0.8em)[
    $arrow(F) = - I L B thin hat(i)$
  ])

  point(1.5, 0.5, fill: blue)
  line((1.5, 0.5), (2.2, 0.5), stroke: blue, mark: (end: amark(fill: blue)))
  content((1.5, 0.5), anchor: "east", padding: 0.2, text(fill: blue, size: 0.8em)[
    $arrow(F) = I L B thin hat(i)$
  ])

  let dgreen = green.darken(10%)
  point(-0.5, 1.5, fill: dgreen)
  line((-0.5, 1.5), (-0.5, 2.2), stroke: dgreen, mark: (end: amark(fill: dgreen)))
  content((-0.5, 1.5), anchor: "north", padding: 0.2, text(fill: dgreen, size: 0.8em)[
    $arrow(F) = I L B thin hat(j)$
  ])

  point(0.5, -1.5, fill: purple)
  line((0.5, -1.5), (0.5, -2.2), stroke: purple, mark: (end: amark(fill: purple)))
  content((0.5, -1.5), anchor: "south", padding: 0.2, text(fill: purple, size: 0.8em)[
    $arrow(F) = - I L B thin hat(j)$
  ])
})

+ What happens if the magnetic field is parallel to the axis of the coil?

  The net force on the wire is still zero:

  #list-align(center, q4)

  As observed, both the horizontal and vertical magnetic forces cancel on opposite sides of the coil. However, the difference from (q3) is that now, there is no more net torque on the coil.
  The coil is in rotational equilibrium as well.

  // When $arrow(B)$ is parallel to the coil axis ($arrow(B) = B hat(k)$), the magnetic field is perpendicular to every side of the square coil. Each side experiences a force $F = N I L B$ directed radially outward from the center of the coil. By symmetry, opposite sides experience equal and opposite forces that cancel. The *net force is zero and the net torque is also zero* --- the coil is in equilibrium. The coil would tend to expand slightly due to the outward forces, but there is no tendency to rotate.

  // When B is along the coil axis, every side is perpendicular to B. The forces on opposite sides
  // point in opposite directions (both radially outward), so they cancel. No net torque since
  // mu is parallel (or antiparallel) to B, so mu x B = 0.

#let unit-A-cm2 = zi.declare("A cm^2")
#let unit-N-m = zi.declare("N m")

#pagebreak()

5. Let $arrow(mu)$ be the _magnetic dipole moment_ of the loop.

  + What is the definition of the magnetic dipole moment $arrow(mu)$ of the loop? 

    Mathematically, the magnetic dipole moment of a current loop is defined as:
    $
      arrow(mu) = N I A thin hat(k).
    $
    The magnitude $mu$ is the ideal torque that can be exerted on the dipole per unit magnetic field strength. That is, if the dipole is placed in a magnetic field $B$, the maximum torque that can be exerted on the dipole is $mu B$.

    The direction $hat(k)$ is given by the right hand rule with respect to the current flow.

  + Calculate the magnetic moment for these loops ($L = #unit-cm(1)$ and $L = #unit-cm(10)$).
    + When $L = #unit-cm(1)$, $arrow(mu) = N I A hat(k) = N I L^2 hat(k) = 8 dot #unit-A(2) dot (#unit-cm(1))^2 hat(k) = cgreen(#unit-A-cm2(16) thin hat(k))$.
    + When $L = #unit-cm(10)$, $arrow(mu) = N I A hat(k) = N I L^2 hat(k) = 8 dot #unit-A(2) dot (#unit-cm(10))^2 hat(k) = cgreen(#unit-A-cm2(1600) thin hat(k))$.

+ Find the maximum magnitude of the torque that the coil can experience.
  
  The torque is given by $arrow(tau) = arrow(mu) times arrow(B)$, which means $abs(arrow(tau)) = mu B sin theta$, where $theta$ is the angle between $arrow(mu)$ and $arrow(B)$. The maximum magnitude of the torque occurs when $sin theta = 1$, i.e. when $theta = 90 degree$. Thus, the maximum magnitude of the torque is given by $mu B$.

  For the value of $mu = #unit-A-cm2(16)$ and $B = #unit-T(1)$, the maximum torque is: 
  $ tau_"max" = mu B = #unit-A-cm2(16) dot #unit-T(1) = cgreen(#unit-N-m(16)). $

  For the value of $mu = #unit-A-cm2(1600)$ and $B = #unit-T(1)$, the maximum torque is:
  $ tau_"max" = mu B = #unit-A-cm2(1600) dot #unit-T(1) = cgreen(#unit-N-m(1600)). $
