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

#let name = "Lab 6: Slow Decay with RC Circuits"
#let date = "March 13, 2026"
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

  #v(2em)
  #subtext[Submitted March 26, 2026]
]

#set page(numbering: "1", header: align(right)[
  #author \
  #course CRN #crn \
])

// constants
#let epsilon0 = 8.85e-12
#let pi = calc.pi
#let ln2 = calc.ln(2)

// units
#let unit-m = zi.declare("m")
#let unit-s = zi.declare("s")
#let unit-kg = zi.declare("kg")

#let unit-A = zi.declare("A")
#let unit-uA = zi.declare("muA")
#let unit-mA = zi.declare("mA")
#let unit-Ohm = zi.declare(sym.Omega)
#let unit-kOhm = zi.declare([k#sym.Omega])
#let unit-MOhm = zi.declare([M#sym.Omega])
#let unit-V = zi.declare("V")
#let unit-W = zi.declare("W")
#let unit-mW = zi.declare("mW")
#let unit-uF = zi.declare("muF")
#let unit-uC = zi.declare("muC")
#let unit-uJ = zi.declare("muJ")
#let unit-J = zi.declare("J")
#let unit-C = zi.declare("C")
#let unit-F = zi.declare("F")

#set-unit(fraction: "inline")

// nfmt wrapper that handles negative numbers
#let sfmt(number, digits: 3) = {
  if number < 0 {
    "-" + nfmt(-number, digits: digits)
  } else {
    nfmt(number, digits: digits)
  }
}

// table frame helper
#let frame(stroke) = (x, y) => (
  left: if x > 0 { 0pt } else { stroke },
  right: stroke,
  top: if y < 2 { stroke } else { 0pt },
  bottom: stroke,
)

// ===== Measured data =====

// Procedure step 1: direct measurement of 22 MOhm resistor
#let R-22M-direct-Mohm = 32

// Procedure step 2: parallel method
#let R-aux-measured-Mohm = 14.65
#let R-parallel-measured-Mohm = 8.90
// Calculate actual R_22M from parallel measurement: 1/R_par = 1/R_22M + 1/R_aux
// => R_22M = 1/(1/R_par - 1/R_aux) = R_par * R_aux / (R_aux - R_par)
#let R-22M-actual-Mohm = R-parallel-measured-Mohm * R-aux-measured-Mohm / (R-aux-measured-Mohm - R-parallel-measured-Mohm)

// Measured capacitance
#let C-measured-uF = 1.0

// Procedure step 4: voltage divider
#let emf-volts = 45
#let R-DMM-Mohm = 10
#let V-DMM-reading = 13.746

// Procedure step 5: half-life measurements
#let halflife-data = (
  // (V_start, V_end, t_start (s), t_end (s))
  (13.746, 6.856, 0, 24.7),
  (6.856, 3.388, 24.7, 49.9),
  (3.388, 1.711, 49.9, 75.1),
  (1.711, 0.853, 75.1, 99.3),
  (0.853, 0.429, 99.3, 124.4),
)
#let halflife-times = halflife-data.map(((vs, ve, ts, te)) => te - ts)
#let avg-halflife = halflife-times.fold(0.0, (a, b) => a + b) / halflife-times.len()

// 1/e lifetime from half-life: tau = t_1/2 / ln(2)
#let tau-from-halflife = avg-halflife / ln2

// Effective resistance in discharge circuit: R and DMM in series
// During discharge, current flows through R (22 MOhm) and DMM (10 MOhm) in series
#let R-eff-Mohm = R-22M-actual-Mohm + R-DMM-Mohm
// RC from measured components
#let RC-calculated = R-eff-Mohm * 1e6 * C-measured-uF * 1e-6

// ===== CSV Data =====
#let raw-csv = csv("lab-6-data.csv")
// skip header row; columns: frame, V, ln V
#let csv-data = raw-csv.slice(1).map(row => {
  let frame = float(row.at(0))
  let V = float(row.at(1))
  let lnV = float(row.at(2))
  (frame / 30.0, V, lnV)
})
// (t in seconds, V, ln V)

// Linear regression for ln(V) vs t: ln(V) = mt + b
// m = (n*sum(t*lnV) - sum(t)*sum(lnV)) / (n*sum(t^2) - (sum(t))^2)
// b = (sum(lnV) - m*sum(t)) / n
#let n-pts = csv-data.len()
#let sum-t = csv-data.fold(0.0, (a, d) => a + d.at(0))
#let sum-lnV = csv-data.fold(0.0, (a, d) => a + d.at(2))
#let sum-t-lnV = csv-data.fold(0.0, (a, d) => a + d.at(0) * d.at(2))
#let sum-t2 = csv-data.fold(0.0, (a, d) => a + d.at(0) * d.at(0))

#let slope-lnV = (n-pts * sum-t-lnV - sum-t * sum-lnV) / (n-pts * sum-t2 - sum-t * sum-t)
#let intercept-lnV = (sum-lnV - slope-lnV * sum-t) / n-pts

// RC from slope: slope = -1/RC => RC = -1/slope
#let RC-from-slope = -1.0 / slope-lnV

// V0 from intercept: intercept = ln(V0) => V0 = e^intercept
#let V0-from-fit = calc.exp(intercept-lnV)

// 1/e life from graph: time for V to drop to V0/e
#let V-at-1e = V0-from-fit / calc.e
// half-life from RC: t_1/2 = RC * ln(2)
#let halflife-from-RC = RC-from-slope * ln2

// Max voltage on capacitor = EMF (when fully charged, no current flows)
#let V-cap-max = float(emf-volts)
// Max charge
#let Q-max-uC = V-cap-max * C-measured-uF
// Max energy
#let U-max-uJ = Q-max-uC * Q-max-uC / (2.0 * C-measured-uF)

// V0 at t=0 for discharge (from data)
#let V0-discharge = csv-data.at(0).at(1)
// Max current through DMM at t=0
#let I-max-uA = V0-discharge / R-DMM-Mohm

// Mosquito comparison
#let mosquito-mass-kg = 2.5e-6
#let mosquito-v = 0.2
#let KE-mosquito = 0.5 * mosquito-mass-kg * mosquito-v * mosquito-v
#let U-max-J = U-max-uJ * 1e-6

// R_DMM from RC: RC = (R_22M + R_DMM) * C => R_DMM = RC/C - R_22M
#let R-DMM-from-RC-Mohm = RC-from-slope / (C-measured-uF * 1e-6) / 1e6 - R-22M-actual-Mohm
#let R-DMM-percent-diff = calc.abs(R-DMM-from-RC-Mohm - R-DMM-Mohm) / ((R-DMM-from-RC-Mohm + R-DMM-Mohm) / 2) * 100

// Percent diff between RC methods
#let RC-percent-diff = calc.abs(RC-from-slope - tau-from-halflife) / ((RC-from-slope + tau-from-halflife) / 2) * 100

/**
 * Section I: Pre-lab
 */

= Pre-lab Questions

// = Pre-lab Questions

#lthin
// #set text(size: 10.5pt)

#let prelab-circuit = zap.circuit({
  battery("b1", (0, 4), (0, 0), cells: 3, cell-gap: 0.2, width: 0.2, show-polarity: true, label: (content: $varcal(E)$, anchor: "south"))
  zap.switch("s1", (0, 4), (2, 4))
  zap.capacitor("c1", (2, 4), (2, 0), label: $C$, variant: "ieee")
  zap.wire((0, 0), (6, 0))
  zap.resistor("r1", (2, 4), (5, 4), label: $R$, variant: "ieee")
  zap.wire((5, 4), (6, 4))
  zap.voltmeter("vm", (6, 0), (6, 4))
})

#let prelab-emf-volts = 45
#let prelab-capacitance-uF = 1
#let prelab-resistance-Mohm = 22

+ #wrap-content(prelab-circuit, align: right)[
    Perform a Kirchhoff analysis of the following RC circuit (Resistor-Capacitor circuit) and determine an equation for the current in the circuit as a function of time, $i(t)$. Calculate the time constant for this circuit.

    Using KVL:
    $
      varcal(E) - i R - Q/C = 0.
    $
    Since $i = dif Q \/ dif t$, this becomes a first-order ODE:
    $
      varcal(E) - R (dif Q)/(dif t) - Q/C = 0
      #h(1em) => #h(1em)
      (dif Q)/(dif t) = (C varcal(E) - Q)/(R C).
    $
    Separating variables and integrating (with $Q(0) = 0$):
    $
      integral_0^Q (dif Q')/(C varcal(E) - Q') = integral_0^t (dif t')/(R C)
      #h(1em) => #h(1em)
      Q(t) = C varcal(E) lr((1 - e^(-t slash R C))).
    $
    Differentiating to get the current:
    $
      i(t) = (dif Q)/(dif t) = cgreen((varcal(E))/R e^(-t slash R C)).
    $ <prelab-current-derivation>
    The time constant is $tau = R C$. With $R = #prelab-resistance-Mohm "M"#sym.Omega$ and $C = #prelab-capacitance-uF "µF"$:
    $
      tau = R C = (#prelab-resistance-Mohm dot 10^6 space #sym.Omega)(#prelab-capacitance-uF dot 10^(-6) "F") = cgreen(#(prelab-resistance-Mohm * prelab-capacitance-uF) "s").
    $
  ]

+ Write a few sentences that explain what the time constant means. Do not use any equations.

  The time constant $tau$ describes how slowly the current in the circuit decays over time. A larger time constant means the current decreases slower, while a smaller time constant means it decays faster.

+ You should already know the definition of the half-life ($tau_(1 slash 2)$) of a decay. What is the $1 slash e$ life? Derive the formula for the $1 slash e$ life. Why is this quantity useful?

  The $1 slash e$ life, $tau_(1 slash e)$, is the time it takes for the quantity to fall to $1 slash e approx 36.8%$ of its initial value. For the current $i(t) = i_0 e^(-t slash tau)$, we set $i(tau_(1 slash e)) = i_0 slash e$:
  $
    i_0 e^(-tau_(1 slash e) slash tau) = i_0 / e = i_0 e^(-1)
    #h(1em) => #h(1em)
    tau_(1 slash e) / tau = 1
    #h(1em) => #h(1em)
    cgreen(tau_(1 slash e) = tau = R C).
  $
  The $1 slash e$ life is useful because it equals the time constant $tau$ directly, so it is more intuitive to calculate and interpret.

#pagebreak()


/**
 * Abstract: see the section below about the elements of a good abstract

Introduction: A sentence or two stating the purpose of the experiment and clarifying the motivation
and context.

Equipment and Procedure:
Explain briefly what procedure you followed. Do not simply repeat the lab instructions – summarize
the relevant portions. A list of equipment or parts used might be useful. Include relevant sketches or
circuit diagrams, or screen shots of your simulations as necessary*/


= Abstract
#lthin

/*

  Elements of a complete abstract
Most basic rule: Abstract should be a brief, fully self-contained, complete brief summary of
experiment. Generally it is not more than 2 brief paragraphs. Did I say 'brief'?
Must include:
• Background necessary to motivate experiment. (Why is this experiment worth doing?)
• Description of experimental procedure and methodology for analysis (What exactly did you do, what did
you measure, how did you measure it and how did you extract your relevant results)
• A clear statement of the outcome. (The punchline: summarize quantitative results and explain what they
mean)
• Comparison to expectations. (Did your results agree with theoretical predictions? At what level (ie: %
difference) do they disagree? If your results disagree with expected, what are the likely reasons
for discrepancy – state sources of measurement uncertainty)

*/

This experiment investigated the exponential decay of voltage across a capacitor $Delta V_C$ in a discharging RC circuit. A #unit-uF(1.0) capacitor was charged to approximately #unit-V(emf-volts) using a DC power supply and then discharged through a #unit-MOhm(22) resistor in series with a DMM (with some internal resistance $approx$ #unit-MOhm(R-DMM-Mohm)). The voltage across the DMM was recorded as a function of time, and the data was used to extract the RC time constant $tau$ via two independent methods: measuring the half-life of the decay, and performing a linear regression on a $ln(V)$ vs. $t$ plot.

From the half-life method, the average half-life (over five measurements) was #qty(avg-halflife, 3, unit-s), yielding $tau = t_(1 slash 2) slash ln 2 = $ #qty(tau-from-halflife, 3, unit-s). From the logarithmic plot, the slope gave $R C =$ #qty(RC-from-slope, 3, unit-s). These two values agree to within #nfmt(RC-percent-diff, digits: 1)%. The DMM internal resistance extracted from $tau = R C -> R = tau slash C$ was #qty(R-DMM-from-RC-Mohm, 3, unit-MOhm), which is within #nfmt(R-DMM-percent-diff, digits: 1)% of the known value of #unit-MOhm(R-DMM-Mohm). Sources of uncertainty include human error when starting the stopwatch (the moment at which $t=0$ may have varied) and the fact that the actual resistance of the DMM is not exactly #unit-MOhm(R-DMM-Mohm) (the document says it is "about" #unit-MOhm(R-DMM-Mohm)).

#pagebreak()

= Equipment & Procedure
#lthin

- Component Box
- Digital Multimeter (DMM)
- #unit-V(emf-volts) DC Power Supply
- Stopwatch #footnote[A video recording of the DMM with timestamp data was used in place of an actual stopwatch]
- #unit-MOhm(22) and #unit-MOhm(15) Resistors #footnote[For the #unit-MOhm(15) Resistor, the measured resistance was #unit-MOhm(R-aux-measured-Mohm)]
- #unit-uF(1.0) Capacitor

// *Procedure:*

// + *Measuring the 22 M#sym.Omega resistor.* The DMM can only measure resistance up to #unit-MOhm(20) accurately, so the #unit-MOhm(22) resistor was first measured directly (reading: #unit-MOhm(R-22M-direct-Mohm), inaccurate). To find the true resistance, a #unit-MOhm(R-aux-measured-Mohm) resistor was placed in parallel with it. The combined parallel resistance was measured as #unit-MOhm(R-parallel-measured-Mohm), from which the actual resistance of the #unit-MOhm(22) resistor was calculated using the parallel resistance formula.

// + *Charging and discharging.* The circuit was assembled with the capacitor, resistor, and DMM. Upon connecting the power supply, the DMM read approximately #unit-V(V-DMM-reading) --- about $1 slash 3$ of the battery voltage --- due to the voltage divider formed by the #unit-MOhm(22) resistor and the #unit-MOhm(R-DMM-Mohm) DMM in series. The connection to the power supply was then broken, and the voltage decay was recorded over time.

// + *Half-life measurement.* The time for the voltage to halve was measured over five consecutive intervals to verify that the half-life is independent of the initial voltage.

// + *Continuous data collection.* A video was taken of the DMM display alongside a stopwatch (at 30 FPS), and voltage readings were extracted at regular time intervals spanning more than five half-lives. The data was plotted as $V$ vs. $t$ (Cartesian) and $ln(V)$ vs. $t$ (logarithmic) to extract the time constant.
== Procedure

+ *Direct Measurement of #unit-MOhm(22) Resistor*

  #quantity-table(
    [*Measured Resistance*], [$R_"measured" = #unit-MOhm(32)$]
  )

  The DMM read #unit-MOhm(R-22M-direct-Mohm) when measuring the #unit-MOhm(22) resistor directly. This exceeds the DMM's limit of #unit-MOhm(20), so the measurement isn't considered "accurate". 
  
  This also read the DMM's internal resistance, so we can approximate $R_"DMM"$ from this measurement:
  $
    R_#unit-MOhm(22) + R_"DMM" = #unit-MOhm(R-22M-direct-Mohm) #h(1em) -> #h(1em)
    R_"DMM" approx #unit-MOhm(R-DMM-Mohm).
  $
  This agrees with the document which also states that the DMM internal resistance is about #unit-MOhm(R-DMM-Mohm).

+ *Parallel Measurement to Approximate Resistance*

  We used a resistor rated for #unit-MOhm(15) and connected it in parallel to the #unit-MOhm(22) resistor:

  #quantity-table(
    [*Measured Resistance of #unit-MOhm(15) Resistor *], $R_#unit-MOhm(15) = #unit-MOhm(R-aux-measured-Mohm)$,
    [*Measured Resistance of Equivalent Resistor*], $R_"par" = #unit-MOhm(R-parallel-measured-Mohm)$,
    [*Calculated Resistance*], $R_#unit-MOhm(22) = cgreen(#unit-MOhm(nfmt(R-22M-actual-Mohm, digits: 2)))$,
  )

  Using the parallel resistance formula to solve for $R_#unit-MOhm(22)$:
  $
    1/R_"par" = 1/R_#unit-MOhm(22) + 1/R_#unit-MOhm(15)
    #h(1em) => #h(1em)
    R_#unit-MOhm(22) = (R_"par" R_#unit-MOhm(15)) / (R_#unit-MOhm(15) - R_"par")
    = (#unit-MOhm(R-parallel-measured-Mohm) dot #unit-MOhm(R-aux-measured-Mohm)) / (#unit-MOhm(R-aux-measured-Mohm) - #unit-MOhm(R-parallel-measured-Mohm))
    = cgreen(#unit-MOhm(nfmt(R-22M-actual-Mohm, digits: 2))).
  $

+ *Voltage Measurement*

  #quantity-table(
    [*Measured Voltage from DMM*], unit-V(V-DMM-reading)
  )

  The DMM reads #unit-V(V-DMM-reading) from a #unit-V(emf-volts) source. The resistor (#unit-MOhm(nfmt(R-22M-actual-Mohm, digits: 2))) and DMM (#unit-MOhm(R-DMM-Mohm)) form a voltage divider, which is why we get about $1 slash 3$ of the voltage:
  $
    V_"DMM" = varcal(E) dot R_"DMM" / (R_#unit-MOhm(22) + R_"DMM")
    = #unit-V(emf-volts) dot #unit-MOhm(R-DMM-Mohm) / (#unit-MOhm(nfmt(R-22M-actual-Mohm, digits: 2)) + #unit-MOhm(R-DMM-Mohm))
    = cgreen(#unit-V(nfmt(emf-volts * R-DMM-Mohm / (R-22M-actual-Mohm + R-DMM-Mohm), digits: 2))).
  $

+ *Voltage vs. Time Table*

  A measurement was recorded every time the voltage dropped by approximately half.

  #let (lvs, lve, lts, lte) = halflife-data.last()
  #table(
    columns: (1fr, 1fr),
    stroke: frame(1pt),
    table.header[*$V$ (V)*][*$t$ (s)*],
    ..halflife-data.map(((vs, ve, ts, te)) => {
      (unit-V(vs), unit-s(ts))
    }).flatten(),
    unit-V(lve), unit-s(lte),
  )

+ *Half-Life Calculations*
  #table(
    columns: (0.5fr, 1fr, 1fr, 1fr),
    stroke: frame(1pt),
    table.header[*\#*][*$V_"start"$ (V)*][*$V_"end"$ (V)*][*Half-Life (s)*],
    ..halflife-data.enumerate().map(((i, (vs, ve, ts, te))) => {
      (str(i + 1), unit-V(vs), unit-V(ve), unit-s(nfmt(te - ts, digits: 1)))
    }).flatten()
  )

  #quantity-table(
    [*Average Half-Life*], [#qty(avg-halflife, 3, unit-s)],
    [*$1 slash e$ Lifetime* ($tau = t_(1 slash 2) slash ln 2$)], [#qty(tau-from-halflife, 3, unit-s)],
    [*$R C$ (calculated)*], [$(#unit-MOhm(nfmt(R-22M-actual-Mohm, digits: 2)) + #unit-MOhm(R-DMM-Mohm)) dot #unit-uF(C-measured-uF) = #qty(RC-calculated, 3, unit-s)$],
  )

  The half-life is approximately constant across all intervals regardless of the starting voltage, confirming the exponential nature of the decay.

+ *DMM Internal Resistance from Half-Life*

  $
    R C = tau = #qty(tau-from-halflife, 3, unit-s)
    #h(1em) -> #h(1em)
    R_"eff" = tau / C = #qty(tau-from-halflife, 3, unit-s) / #unit-uF(C-measured-uF) = #qty(tau-from-halflife / (C-measured-uF * 1e-6) / 1e6, 3, unit-MOhm).
  $
  Since $R_"eff" = R_(22 "M") + R_"DMM"$:
  #let dmm-qty = qty(tau-from-halflife / (C-measured-uF * 1e-6) / 1e6 - R-22M-actual-Mohm, 3, unit-MOhm)
  $
    R_"DMM" = R_"eff" - R_(22 "M") = #qty(tau-from-halflife / (C-measured-uF * 1e-6) / 1e6, 3, unit-MOhm) - #unit-MOhm(nfmt(R-22M-actual-Mohm, digits: 2)) = #cgreen(dmm-qty).
  $

  #quantity-table(
    [*Calculated DMM Internal Resistance*], $R_"DMM" = #dmm-qty$
  )

#pagebreak()

/*

Analysis:
Explain your results. Interpret any graph. (Slope? meaning of slope? intercept meaning?),
(straight line? curve?) What did you expect?
Compare to theory. Convince the reader (someday your boss or manager) that you know what you
are talking about. Compare your results to accepted or expected values.
You should include one sample for each type of calculation
Use and explain error bars where appropriate


Summary and Conclusions
Error analysis: are your results in agreement with expected/accepted values
What are sources of error: list sources of error and quantitatively describe how big each would
have to be to yield your reported values in the data section. It is generally not acceptable to cite
Human Error. Even though human error (such as inexact reading of measurements) are real,
there are techniques to minimize such error.
Discussion of answers to all questions posed in the handout. Label the answers as (Q1), (Q2), (Q3) ...
Suggestions for further work; how would you improve the experiment?

*/

= Data Analysis
#lthin

#let t-max = csv-data.last().at(0) * 1.05
#let V-max = csv-data.first().at(1) * 1.1

== $V$ vs. $t$ (Cartesian Graph)

#align(center)[
  #canvas({
    import plot: *
    plot(
      size: (10.0, 6.0),
      axis-style: "scientific-auto",
      x-min: 0,
      x-max: t-max,
      x-tick-step: 20,
      x-grid: true,
      x-label: [Time, $t$ (s)],
      y-min: 0,
      y-max: V-max,
      y-tick-step: 2,
      y-grid: true,
      y-label: [Voltage across DMM, $V$ (V)],
      legend: "inner-north-east",
      {
        // data points
        add(
          csv-data.map(d => (d.at(0), d.at(1))),
          line: "raw",
          style: (stroke: none),
          mark: "o",
          mark-size: 0.1,
          mark-style: (stroke: black, fill: black),
        )
        // exponential fit: V = V0 * exp(slope * t)
        add(
          domain: (0, t-max),
          t => V0-from-fit * calc.exp(slope-lnV * t),
          style: (stroke: blue.opacify(50%) + 1.5pt),
          mark: none,
          label: [$V = (#qty(V0-from-fit, 3, unit-V)) exp(#sfmt(slope-lnV, digits: 5)t)$],
        )
        // half-life line
        add(
          domain: (0, halflife-from-RC),
          t => V0-from-fit / 2,
          style: (stroke: (paint: red, dash: "dashed")),
          mark: none,
          label: [$t_(1 slash 2) = #qty(halflife-from-RC, 3, unit-s)$],
        )
        // 1/e life line
        add(
          domain: (0, RC-from-slope),
          t => V-at-1e,
          style: (stroke: (paint: rgb("#108010"), dash: "dashed")),
          mark: none,
          label: [$tau_(1 slash e) = #qty(RC-from-slope, 3, unit-s)$],
        )
      },
    )
  })
]

The graph shows the expected exponential decay shape. The dashed lines indicate the half-life (red, at $V_0 slash 2 approx #qty(V0-from-fit / 2, 3, unit-V)$) and the $1 slash e$ life (green, at $V_0 slash e approx #qty(V-at-1e, 3, unit-V)$).

_Note:_ the coefficients in the exponential fit are obtained from the logarithmic graph in the next section.

== $ln(V)$ vs. $t$ (Logarithmic Graph)

Taking the natural logarithm of both sides of $V(t) = V_0 e^(-t slash R C)$ gives:
$
  ln V = ln V_0 - t / (R C).
$
This equation tells us that the relation ship between $ln V$ and $t$ is linear with slope $m = -1 slash R C$ and intercept $b = ln V_0$.

#align(center)[
  #canvas({
    import plot: *
    plot(
      size: (10.0, 6.0),
      axis-style: "scientific-auto",
      x-min: 0,
      x-max: t-max,
      x-tick-step: 20,
      x-grid: true,
      x-label: [Time, $t$ (s)],
      y-min: csv-data.last().at(2) - 0.3,
      y-max: csv-data.first().at(2) + 0.3,
      y-tick-step: 0.5,
      y-grid: true,
      y-label: [$ln(V)$],
      legend: "inner-north-east",
      {
        add(
          csv-data.map(d => (d.at(0), d.at(2))),
          line: "raw",
          style: (stroke: none),
          mark: "o",
          mark-size: 0.1,
          mark-style: (stroke: black, fill: black),
        )
        add(
          domain: (0, t-max),
          t => slope-lnV * t + intercept-lnV,
          style: (stroke: blue + 1.5pt),
          mark: none,
          label: [$ln V = #sfmt(slope-lnV, digits: 5)t + #nfmt(intercept-lnV, digits: 4)$],
        )
      },
    )
  })
]

Performing a linear regression with Desmos, we see that the best fit line for the data has: 
$
  "slope" = m = #sfmt(slope-lnV, digits: 5) "s"^(-1),
  #h(2em)
  "intercept" = b = #nfmt(intercept-lnV, digits: 4).
$
The line fits the data very well ($r approx 0.99$), confirming the exponential decay model. 

From the slope:
$
  R C = -1/m = -1 / (-#sfmt(calc.abs(slope-lnV), digits: 5) thin "s"^(-1)) = cgreen(#qty(RC-from-slope, 3, unit-s)).
$

From the intercept:
$
  V_0 = e^b = e^(#nfmt(intercept-lnV, digits: 4)) = cgreen(#qty(V0-from-fit, 3, unit-V)).
$

== Comparison of Methods

#table(
  columns: (1.2fr, 1fr, 1fr, 1fr),
  stroke: frame(1pt),
  table.header[*Method*][*$R C$ (s)*][*Half-Life (s)*][*$R_"DMM"$ (M#sym.Omega)*],
  [Half-Life Method],
  [#qty(tau-from-halflife, 3, unit-s)],
  [#qty(avg-halflife, 3, unit-s)],
  [#qty(tau-from-halflife / (C-measured-uF * 1e-6) / 1e6 - R-22M-actual-Mohm, 3, unit-MOhm)],
  [Logarithmic Regression],
  [#qty(RC-from-slope, 3, unit-s)],
  [#qty(halflife-from-RC, 3, unit-s)],
  [#qty(R-DMM-from-RC-Mohm, 3, unit-MOhm)],
  [Calculated ($R C$)],
  [#qty(RC-calculated, 3, unit-s)],
  [#qty(RC-calculated * ln2, 3, unit-s)],
  [\~ #unit-MOhm(R-DMM-Mohm) (given)],
)

Both experimental methods produce consistent results. The logarithmic slope method is more reliable as it uses more data points over a broader time interval.

#pagebreak()

= Conclusion 
#lthin

== Questions

#let unit-m-per-s = zi.declare("m/s")
#let unit-mg = zi.declare("mg")

+ Why was the DMM placed in series with the #unit-MOhm(22) resistor instead of in parallel across it?

  The DMM has an internal resistance of about #unit-MOhm(R-DMM-Mohm). If placed in parallel with the #unit-MOhm(22) resistor, the combined resistance would be $R_"eq" = (#unit-MOhm(22) dot #unit-MOhm(R-DMM-Mohm)) slash (#unit-MOhm(22) + #unit-MOhm(R-DMM-Mohm)) approx #unit-MOhm(nfmt(22.0 * R-DMM-Mohm / (22.0 + R-DMM-Mohm), digits: 1))$, drastically altering the circuit's time constant (since $tau prop R$). In series, the DMM measures the voltage across itself (which is proportional to the capacitor voltage through the voltage divider), without significantly changing the total resistance of the discharge path.

+ Start with the defining equations for the Ohm and the Farad and prove that the quantity $R C$ has dimensions of time.

  By Ohm's Law $V = I R -> R = V slash I$, we get $1 space Omega = 1 "V"slash"A"$. Also, $1 "A" = 1 "C"slash"s"$ since $I = inlinedv(q,t)$. \
  From the definition of capacitance $C = Q slash V$, the Farad can be written as $1 "F" = 1 "C"slash"V"$. Therefore:
  $
    [R C] = Omega dot "F" = "V"/"A" dot "C"/"V" = "C"/"A" = "C"/("C/s") = cgreen("s").
  $
  Thus, $R C$ has dimensions of time.

+ Use your Cartesian graph of $V$ vs. $t$ and write down the mathematical relationship between $V$ (across the DMM) and $t$ and $V_0$. Assume that the switch is opened at time $t=0$ so $V_0$ is the voltage across the DMM at $t=0$.

  From the Cartesian graph, the voltage decays exponentially:
  $
    cgreen(V(t) = V_0 e^(-t slash R C)),
  $
  where we found that $V_0 = #qty(V0-from-fit, 3, unit-V)$ and $R C = #qty(RC-from-slope, 3, unit-s)$ was the best fit our data.

#show link: underline.with(offset: 2pt, stroke: 0.5pt)

+ Use your mathematical result from question 3 and find a mathematical expression for $I(t)$, the current through the DMM.

  By Ohm's Law, the current through the DMM is $I = V slash R_"DMM"$:
  $
    cgreen(I(t) = V_0/R_"DMM" e^(-t slash R C)).
  $
  This uses the expression we derived in the #link(<prelab-current-derivation>)[pre-lab].

#pagebreak()
#set enum(start: 5)

+ Assume that the switch opens at $t=0$. Sketch $I(t)$ vs. $t$ and find a value for the maximum current. Express in microamperes.

  The maximum current occurs at $t = 0$:
  $
    I_"max" = I(0) = V_0 / R_"DMM" = #qty(V0-from-fit, 3, unit-V) / (#unit-MOhm(R-DMM-Mohm)) = cgreen(#qty(I-max-uA, 3, unit-uA)).
  $

  #align(center)[
    === $I(t)$ vs. $t$
    #canvas({
      import plot: *
      import cetz.draw: *
      plot(
        name: "plot",
        size: (8.0, 4.5),
        axis-style: "scientific-auto",
        x-min: 0,
        x-max: t-max / 2,
        x-tick-step: 20,
        x-grid: true,
        x-label: [Time, $t$ (s)],
        y-min: 0,
        y-max: I-max-uA * 1.1,
        y-tick-step: 0.2,
        y-grid: true,
        y-label: [Current, $I$ (#sym.mu#[A])],
        {
          add(
            domain: (0, t-max / 2),
            t => I-max-uA * calc.exp(slope-lnV * t),
            style: (stroke: blue + 1.5pt),
            mark: none,
          )
          add-hline(
            I-max-uA,
            min: 0,
            max: t-max / 2,
            style: (stroke: (paint: purple, dash: "dashed")),
          )
          add-anchor("max", (t-max / 2, I-max-uA))
        },
      )
      content("plot.max", text(fill: purple)[$I_"max" = #qty(I-max-uA, 3, unit-uA)$], anchor: "south-east", padding: .1)
    })
  ]

+ Determine the value of the maximum voltage on the capacitor?

  When fully charged, no current flows through the circuit. With no current, there is no voltage drop across the resistor or the DMM, so ideally, $V_"max"$ is just the EMF from the DC power source:
  $
    V_"max" = varcal(E) = cgreen(#unit-V(V-cap-max)).
  $

+ What is the value of the maximum charge stored in the capacitor?

  $
    Q_"max" = C V_"max" = (#unit-uF(C-measured-uF))(#unit-V(V-cap-max)) = cgreen(#unit-uC(Q-max-uC)).
  $

+ $U = Q^2 slash 2C$. Find the maximum value of the energy stored in the capacitor. Use a ratio to compare this energy to the kinetic energy of a mosquito with a velocity of #unit-m-per-s(0.2). The mass of a mosquito is about #unit-mg(2.5).

  $
    U = Q^2 / (2C) = (#sci-qty(Q-max-uC * 1e-6, 3, unit-C))^2 / (2 dot #sci-qty(C-measured-uF * 1e-6, 3, unit-F)) = cgreen(#sci-qty(U-max-J, 3, unit-J)).
  $

  The kinetic energy of the mosquito is:
  $
    K = 1/2 m v^2 = 1/2 (#sci-qty(mosquito-mass-kg, 2, unit-kg))(#unit-m-per-s(mosquito-v))^2 = #sci-qty(KE-mosquito, 2, unit-J).
  $

  The ratio is:
  $
    U / K = #sci-qty(U-max-J, 3, unit-J) / #sci-qty(KE-mosquito, 2, unit-J) = cgreen(#nfmt(U-max-J / KE-mosquito, digits: 0)).
  $
  The energy stored in the capacitor is roughly $2 dot 10^4$ times the kinetic energy of a mosquito.

== Error Analysis

Sources of uncertainty include: 

#set enum(start: 1)

+ Human error when starting the stopwatch (the moment at which $t=0$ may have varied) 

  - This would affect all time measurements (half-life, $1 slash e$ life, and slope) by a constant shift.

+ The actual resistance of the DMM is not exactly #unit-MOhm(R-DMM-Mohm) (the document says it is "about" #unit-MOhm(R-DMM-Mohm)).

  - This would affect the voltage divider ratio, which would change the initial voltage $V_0$ across the DMM and thus affect the current and time constant calculations.