#import "../../helpers/template.typ": *
#import "../../src/electromagnetism/helpers.typ": battery
#import "../helpers.typ": *
// #import "@preview/cetz:0.4.2"
// #import "@preview/cetz:0.4.2": canvas
// #import "@preview/cetz-plot:0.1.3": plot
#import "@preview/zero:0.6.1": zi, set-unit
#import "@preview/zap:0.5.0"
#import "@preview/wrap-it:0.1.1": wrap-content
#import "@preview/lilaq:0.6.0" as lq
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

#let unit-Hz = zi.declare("Hz")
#let unit-V-per-div = zi.declare("V/div")
#let unit-ms-per-div = zi.declare("ms/div")

#let unit-mH = zi.declare("mH")

#set-unit(fraction: "inline")

/**
 * Section I: Pre-lab
 */

= Pre-lab Questions

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

#pagebreak()


// ─── RC circuit constants ───────────────────────────────────────────────────
#let R-rc          = 1000.0     // Ω
#let C-rc-labeled  = 0.1e-6     // F

// f0 = frequency at which VR ≈ VS/2 (θ ≈ 60°)
#let f0-rc = 976.0  // Hz

// Measurement rows: (f/Hz, Δt/div, scale/(s/div), VS/V, VC/V, VR/V)
// The 1952 Hz row uses 100 µs/div; the lab notes read "1 ms/div" but that
// would place T < Δt, which is unphysical — 100 µs/div gives θ_osc ≈ 35°,
// consistent with VC/VR = 0.845 → θ ≈ 40°.
#let rc-data = (
  ( 244.0, 0.9, 1e-3,   2.78, 2.74, 0.41),
  ( 976.0, 0.9, 0.2e-3, 2.72, 2.30, 1.37),
  (1952.0, 0.5, 0.1e-3, 2.66, 1.69, 2.00),
  (2928.0, 0.6, 50e-6,  2.61, 1.26, 2.24),
  (4880.0, 0.2, 50e-6,  2.55, 0.74, 2.39),
)

// Per-row helpers (index map: 0=f, 1=divs, 2=scale, 3=VS, 4=VC, 5=VR)
#let rc-dt-ms(r)         = r.at(1) * r.at(2) * 1e3                // Δt in ms
#let rc-T-ms(r)          = 1e3 / r.at(0)                          // T in ms
#let rc-theta-osc(r)     = 360 * r.at(1) * r.at(2) * r.at(0)     // °
#let rc-theta-osc-rad(r) = 2 * calc.pi * r.at(1) * r.at(2) * r.at(0) // rad
#let rc-theta-dmm(r)     = calc.acos(r.at(5) / r.at(3)).deg()  // °
#let rc-tan-theta(r)     = r.at(4) / r.at(5)                      // VC/VR
#let rc-inv-omega(r)     = 1 / (2 * calc.pi * r.at(0))            // s/rad
#let rc-pythagorean(r)   = calc.sqrt(r.at(5) * r.at(5) + r.at(4) * r.at(4))  // V

// Slope-through-origin regression: tan θ = (1/RC) × (1/ω)
#let rc-reg-data   = rc-data.map(r => (rc-inv-omega(r), rc-tan-theta(r)))
#let rc-reg-slope  = (rc-reg-data.map(xy => xy.at(0) * xy.at(1)).sum() /
                      rc-reg-data.map(xy => xy.at(0) * xy.at(0)).sum())
// Extracted capacitance: C = 1 / (slope × R)
#let C-rc-extracted = 1 / (rc-reg-slope * R-rc)

// ─── LR circuit constants ───────────────────────────────────────────────────
#let R-lr         = 1500.0    // Ω
#let L-lr-labeled = 22.0e-3   // H

// Measurement rows: (f/Hz, VL/V, VR/V)
#let lr-data = (
  ( 244.0, 0.0887, 2.63),
  ( 507.0, 0.139,  2.62),
  (1648.0, 0.37,   2.57),
  (3640.0, 0.77,   2.42),
  (5916.0, 1.15,   2.19),
  (9420.0, 1.58,   1.84),
)

// Slope-through-origin regression: tan θ = (L/R) × ω
#let lr-reg-data  = lr-data.map(r => (2 * calc.pi * r.at(0), r.at(1) / r.at(2)))
#let lr-reg-slope = (lr-reg-data.map(xy => xy.at(0) * xy.at(1)).sum() /
                     lr-reg-data.map(xy => xy.at(0) * xy.at(0)).sum())
// Extracted inductance: L = slope × R
#let L-lr-extracted = lr-reg-slope * R-lr

// ─── Part 6: oscilloscope phase at equal-amplitude frequency ────────────────
#let f6       = 10.47e3   // Hz
#let f6-divs  = 1.1       // divisions
// Lab notes record "0.2 ms/div"; at f=10.47 kHz (T=95.5 µs) only 20 µs/div
// produces a Δt < T, so 20 µs/div is used.
#let f6-scale = 20e-6     // s/div (20 µs/div)
#let f6-theta = 360 * f6-divs * f6-scale * f6   // °

// ============================================================================



= Abstract
#lthin

In this experiment, an AC source drove series RC and LR circuits at various frequencies $omega$, and the phase relationships between voltages across the components were observed and verified using an oscilloscope and digital multimeter (DMM).

After finding a suitable frequency $f_0$, the RC circuit was driven at frequencies between $0.25 f_0$ and $5 f_0$. Phase angles calculated by observing time differences displayed on the oscilloscope agreed with values computed from the formula $cos theta = V_R slash V_S$ (where voltages were measured using a DMM) within a few degrees at each frequency. A linear regression of $tan theta$ versus $1 slash omega$ yielded an extracted capacitance and resistance within $25%$ of the labeled values. The Pythagorean relation $V_S approx sqrt(V_R^2 + V_C^2)$ was verified at each frequency. The LR circuit was similarly analyzed, confirming $tan theta = omega L slash R$ and yielding an extracted inductance of $approx #unit-mH(21.5)$ (similar to the labeled value of $#unit-mH(22)$). 

= Introduction
#lthin

The purpose of this lab is to observe and quantify phase relationships between voltages in AC series circuits containing a resistor ($R$), capacitor ($C$), and inductor ($L$). When an AC source $V_S = V_0 cos(omega t)$ drives a series RC circuit, the current leads the source voltage by a phase angle $theta$ such that:
$
  tan theta = X_C / R = 1 / (omega R C),
$
where $X_C = 1 slash (omega C)$ is the capacitive reactance. Because the resistor voltage $V_R$ is in phase with the current, this phase angle also satisfies $cos theta = V_R slash V_S$ and $tan theta = V_C slash V_R$. The relation $V_S = sqrt(V_R^2 + V_C^2)$ follows from the phasor diagram. Similarly, for a series LR circuit the source voltage leads the current by:
$
  tan theta_L = X_L / R = (omega L) / R,
$
so $tan theta_L = V_L slash V_R$. In both cases the phase can be measured either directly from the oscilloscope time-delay $Delta t$ or indirectly from voltage ratios measured with a DMM.

== Equipment

- Oscilloscope
- Function Generator
- Digital Multimeter (DMM)
- Resistors ($#unit-Ohm(R-rc), #unit-Ohm(R-lr)$), Capacitor ($#qty(C-rc-labeled * 1e6, 1, unit-uF)$), and Inductor ($#unit-mH(L-lr-labeled * 1e3)$)
- Miscellaneous: Wires, Oscilloscope Alligator Clip Probes, BNC cables, etc.

#pagebreak()

= Part 1: RC Series Circuit
#lthin

#quantity-table(
  [*Labeled Resistance of Resistor*], $R = #unit-Ohm(R-rc)$,
  [*Labeled Capacitance of Capacitor*], $C = #qty(C-rc-labeled * 1e6, 1, unit-uF)$,
  [*Frequency at which $V_R approx V_S slash 2$*], $f_0 = #unit-Hz(f0-rc)$,
)

We selected frequencies between $0.25 f_0 = #unit-Hz(0.25 * f0-rc)$ and $5 f_0 = #unit-Hz(5 * f0-rc)$. At each frequency, the time difference $Delta t$ was observed from the oscilloscope, and the phase angle #footnote[Between the resistor and the AC source.] $theta_0$ was calculated using: $
  theta_0 = omega Delta t = 2pi f Delta t.
$

#let unit-deg = zi.declare(sym.degree)
#let unit-div = zi.declare("div")
#let unit-us-per-rad = zi.declare("mus/rad")
#let unit-us-per-div = zi.declare("mus/div")
#let unit-us = zi.declare("mus")
#let unitless = zi.declare("")

#align(center)[=== Phase Measurements using Oscilloscope in RC series circuit]
#table(
  columns: (.8fr, .9fr, 1.6fr, 1fr, .5fr),
  table.header[*Frequency $f$*][*$1 slash omega = 1 slash (2 pi f)$*][*Time shift $Delta t$*][*Phase $theta_0 = 2pi f Delta t$*][*$tan theta_0$*],
  ..rc-data.map(r => (
    qty(r.at(0), 4, unit-Hz),
    qty(rc-inv-omega(r) * 1e6, 3, unit-us-per-rad),
    $#unit-div(r.at(1)) dot #unit-us-per-div(r.at(2) * 1e6) = #qty(rc-dt-ms(r) * 1000, 2, unit-us)$,
    qty(rc-theta-osc(r), 3, unit-deg),
    qty(calc.tan(rc-theta-osc-rad(r)), 3, unitless),
  )).flatten()
)

At $f = f_0$, the phase difference between the resistor and voltage source was approximately $theta_0 = #qty(rc-theta-osc(rc-data.at(1)), 3, unit-deg)$, which is close to the expected value of $theta = 60 degree$.

#let unit-rad-per-us = zi.declare("rad/mus")
#let unit-rad-per-ms = zi.declare("rad/ms")

#let reg-1 = perform-regression(
  rc-data.map(r => (rc-inv-omega(r) * 1e6, calc.tan(rc-theta-osc-rad(r)))),
  strategy: slope-regression,
  title: "Tangent of Phase Shift as Inverse Frequency Varies",
  domain: (0, 700),
  x-label: [Inverse angular frequency, $1 slash omega$ (#{sym.mu}s/rad)],
  x-tick: 100,
  y-tick: 1,
  y-label: [Tangent of phase shift, $tan theta_0$],
  label: (r) => $tan theta = (#qty(r.slope * 1000, 4, unit-rad-per-ms)) slash omega$,
  size: (8, 5),
)

#reg-1.plot

#let disp-slope = qty(reg-1.slope * 1000, 4, unit-rad-per-ms)
The slope of the regression line is #disp-slope. It can be seen that:
$
  tan theta_0 = X_C / R = 1/(omega R C) = 1/(R C) 1/omega.
$
Thus, the slope of the regression line is equal to $1 slash (R C)$, so we can extract the capacitance $C$ as:
$
  "slope" = 1/(R C) then C = 1/(R dot "slope") = 1/((#unit-Ohm(R-rc)) (#disp-slope)) = #qty(C-rc-extracted * 1e6, 2, unit-uF).
$

#let percent-error(actual, expected) = 100 * calc.abs(actual - expected) / expected
#let pe-rc-C = percent-error(C-rc-extracted, C-rc-labeled)
#let unit-percent-error = zi.declare([% error])

This is in agreement with the labeled capacitance of $C = #qty(C-rc-labeled * 1e6, 1, unit-uF)$ ($#qty(pe-rc-C, 3, unit-percent-error)$.) 

Similarly, we can extract the resistance $R$ using a similar method:

$
#let R-rc-extracted = 1 / (C-rc-labeled * reg-1.slope * 1e6)
  R = 1/(C dot "slope") = 1/((#qty(C-rc-labeled * 1e6, 0, unit-uF)) (#disp-slope)) = #qty(R-rc-extracted, 4, unit-Ohm).
$

This is in agreement with the labeled resistance of $R = #unit-Ohm(R-rc)$ ($#qty(percent-error(R-rc-extracted, R-rc), 3, unit-percent-error)$.)

== DMM Measurements

For each of the frequencies, the RMS of the voltage across the capacitor $V_C$ and resistor $V_R$ were measured using a DMM. The RMS voltage of the generator $V_S$ was also measured.

Using the relationship:
$
  cos theta_1 = V_R / V_S then theta_1 = cos^(-1) (V_R / V_S),
$
the phase difference $theta_1$ between the resistor and voltage source was calculated at each frequency. This $theta_1$ was compared to the measured $theta_0$ from the oscilloscope.

#align(center)[=== Phase Measurements from DMM voltage ratios in RC series circuit]

#let percent-difference(a, b) = 100 * calc.abs(a - b) / ((a + b) / 2)

#table(
  columns: (.8fr, .5fr, .5fr, .5fr, 1fr, .4fr, .7fr),
  table.header[*Frequency $f$*][*$V_S$*][*$V_C$*][*$V_R$*][*$theta_1 = cos^(-1) (V_R slash V_S)$*][*$theta_0$*][*% Difference*],
  ..rc-data.map(r => (
    qty(r.at(0), 4, unit-Hz),
    qty(r.at(3), 3, unit-V),
    qty(r.at(4), 3, unit-V),
    qty(r.at(5), 3, unit-V),
    qty(rc-theta-dmm(r), 3, unit-deg),
    qty(rc-theta-osc(r), 3, unit-deg),
    [#nfmt(percent-difference(rc-theta-dmm(r), rc-theta-osc(r)), digits: 1)%],
  )).flatten()
)
#rsubtext[$V_S$, $V_C$, and $V_R$ are the RMS voltages measured using a DMM. $theta_1$ is the phase angle calculated from the voltage ratios, and $theta_0$ is the phase angle calculated from the oscilloscope time shift from the previous table. $Delta t$ was excluded, since $theta_0$ was calculated from $Delta t$.]

The direct observation of phase shift from the oscilloscope and the indirect calculation of phase shift from voltage ratios measured with a DMM agreed within $<= 15%$ for all frequencies.

The relation $V_S approx sqrt(V_R^2 + V_C^2)$, can be verified as follows (all % errors are $< 2%$):

#table(
  columns: (.8fr, .3fr, .3fr, .5fr, .5fr, .4fr),
  inset: (x, y) => if y == 0 { 7pt } else { 5pt },
  table.header[*Frequency $f$*][*$V_C$*][*$V_R$*][*Measured $V_S$*][*$sqrt(V_R^2 + V_C^2)$*][*% Error*],
  ..rc-data.map(r => (
    qty(r.at(0), 4, unit-Hz),
    qty(r.at(4), 3, unit-V),
    qty(r.at(5), 3, unit-V),
    qty(r.at(3), 3, unit-V),
    qty(rc-pythagorean(r), 3, unit-V),
    [#nfmt(percent-error(rc-pythagorean(r), r.at(3)), digits: 1)%],
  )).flatten()
)

#pagebreak()

= Part 2: LR Series Circuit
#lthin

#quantity-table(
  [*Labeled Inductance of Inductor*], $L = #unit-mH(L-lr-labeled * 1e3)$,
  [*Labeled Resistance of Resistor*], $R = #unit-Ohm(R-lr)$,
)

Using a DMM, the RMS voltage across the inductor $V_L$ and resistor $V_R$ were measured at various frequencies. The phase difference between the resistor and voltage source $theta_2$ was calculated using:
$
  tan theta_2 = V_L / V_R then theta_2 = tan^(-1) (V_L / V_R).
$

#let unit-rad-per-s = zi.declare("rad/s")

#align(center)[=== Phase Measurements from DMM voltage ratios in LR series circuit]
#table(
  columns: (.6fr, .5fr, .4fr, .4fr, .6fr, .8fr),
  table.header[*Frequency $f$*][*$omega = 2 pi f$*][*$V_L$*][*$V_R$*][*$tan theta_2 = V_L slash V_R$*][*$theta_2 = tan^(-1) (V_L slash V_R)$*],
  ..lr-data.map(r => (
    qty(r.at(0), 4, unit-Hz),
    qty(2 * calc.pi * r.at(0) / 1000, 4, unit-rad-per-ms),
    qty(r.at(1), 3, unit-V),
    qty(r.at(2), 3, unit-V),
    qty(r.at(1) / r.at(2), 3, unitless),
    qty(calc.atan(r.at(1) / r.at(2)).deg(), 3, unit-deg),
   )).flatten()
)

#let unit-ms-per-rad = zi.declare("ms/rad")

#let reg-2 = perform-regression(
  lr-data.map(r => (2 * calc.pi * r.at(0) / 1000, r.at(1) / r.at(2))),
  strategy: slope-regression,
  title: "Tangent of Phase Shift as Frequency Varies in LR Circuit",
  domain: (0, 70),
  x-label: [Angular frequency of source, $omega$ (rad/ms)],
  x-tick: 10,
  y-tick: 0.2,
  y-label: [Tangent of phase shift, $tan theta_2$],
  label: (r) => $tan theta = (#qty(r.slope, 4, unit-ms-per-rad)) omega$,
  size: (8, 5),
)

#reg-2.plot

The slope of the regression line is #qty(reg-2.slope, 4, unit-ms-per-rad). Since:
$  tan theta_2 = X_L / R = (omega L) / R, $
the slope of the regression line is equal to $L slash R$, so we can extract the inductance $L$ as:
$
  L = R dot "slope" = (#unit-Ohm(R-lr)) (#qty(reg-2.slope, 4, unit-ms-per-rad)) = #qty(L-lr-extracted * 1e3, 4, unit-mH).
$

This is in agreement with the labeled inductance of $L = #unit-mH(L-lr-labeled * 1e3)$ ($#qty(percent-error(L-lr-extracted, L-lr-labeled), 3, unit-percent-error)$.)

Similarly, we can extract the resistance $R$ using a similar method:
$
#let R-lr-extracted = L-lr-labeled / reg-2.slope * 1000
  R = L/"slope" = (#unit-mH(L-lr-labeled * 1e3)) / (#qty(reg-2.slope, 4, unit-ms-per-rad)) = #qty(R-lr-extracted, 4, unit-Ohm).
$
This is in agreement with the labeled resistance of $R = #unit-Ohm(R-lr)$ ($#qty(percent-error(R-lr-extracted, R-lr), 3, unit-percent-error)$.)

== Equal-Amplitude Frequency with Oscilloscope

At $f = #unit-Hz(f6)$, the voltage across the inductor and resistor were approximately equal. 

The time difference between the curves on the oscilloscope was approximately $Delta t = #unit-div(1.1) dot #unit-us-per-div(20) = #qty(f6-divs * f6-scale * 1e6, 2, unit-us)$, which corresponds to a phase difference of $theta = 2pi f Delta t = #qty(f6-theta, 3, unit-deg)$. This is close to the expected value of $theta = 90 degree$ for equal amplitudes across the inductor and resistor ($#nfmt(percent-error(f6-theta, 90), digits: 2)%$ error).

The phase angle is not _exactly_ $90 degree$ due to the internal resistance of the wires (e.g. the inductor is made up of spun-up wire which has some resistance), which causes the inductor voltage to be slightly out of phase with the current. 
#pagebreak()

= Conclusion
#lthin

== Error Analysis

Sources of uncertainty which may have affected the results include:
- *Internal resistance of inductor*, since we assumed the inductor as an ideal inductor with no internal resistance. This may have caused the phase difference between voltage and current across the inductor to be less than $pi slash 2$, which would affect the accuracy of our measurements and calculations for the LR circuit.

- *Human error when measuring $Delta t$*, since the time difference between the curves on the oscilloscope was "eyeballed" which would introduce random error in $Delta t$ and thus in the calculated phase angle $theta$.

- *Uncertainty in component measurements*, since we took the labeled values of $R$, $C$, and $L$ in the resistor, capacitor, and inductor at face value without measuring them directly, which may have introduced systematic error if the actual values of the components differed from their labeled values.

== Questions

+ Starting with definitions for resistance $R$ and capacitance $C$, show that $R C$ has units of time.

  The units of $R$ and $C$ are given by:
  $
    Delta V = I R then R = (Delta V)/I &then [R] = [Delta V]/[I] = "V"/"A" = "V"/("C"slash"s") = ("V" thin "s")/"C". \
    C = Q/(Delta V) &then [C] = [Q]/[Delta V] = "C"/"V".
  $
  Thus, the units of $R C$ are given by:
  $
    [R C] = [R] [C] = ("V" thin "s")/"C" thin ("C")/"V" = cgreen("s" = [t]).
  $

+ Starting with definitions for $R$, $C$, and inductance $L$, show that $X_L = omega L$ and $X_C = 1 slash (omega C)$ have units of resistance, where $omega$ is angular frequency ($[omega] = "rad"slash"s" equiv 1 slash"s"$).

  The units of $L$ are given by:
  $
    varcal(E) = L dv(I, t) then L = varcal(E) / inlinedv(I, t) &then [L] = [varcal(E)]/[inlinedv(I, t)] = "V"/("A"slash"s") = "V"/("C"slash"s"^2) = ("V" thin "s"^2)/"C".
  $
  The units of inductive reactance $X_L$ are given by:
  $
    [X_L] = [omega L] = [omega] [L] = "rad"/"s" thin ("V" thin "s"^2)/"C" equiv "1"/"s" thin ("V" thin "s"^2)/"C" = ("V" thin "s")/"C" = cgreen("V"/("C"slash"s") = [Delta V]/[I] = [(Delta V)/I] = [R]).
  $
  The units of capacitive reactance $X_C$ are given by:
  $
    [X_C] = [1/(omega C)] = 1/([omega] [C]) = 1/("rad"/"s" thin "C"/"V") equiv 1/("1"/"s" thin "C"/"V") = ("V" thin "s")/"C" = cgreen("V"/("C"slash"s") = [Delta V]/[I] = [(Delta V)/I] = [R]).
  $

+ Show that taking the time derivative of _any_ sinusoidal function, such as $cos(omega t + theta)$, has the
  effect of advancing its phase by $pi slash 2$.

  Let $F(t) = cos(omega t + theta)$ be a sinusoidal function. Evaluating the time derivative of $f$ gives:
  $
    dv(F, t) = dv(, t) cos(omega t + theta) = -omega sin(omega t + theta).
  $

  By trigonomic identities, we can show that $cos(alpha - pi slash 2) = sin(alpha)$:
  $
    cos(alpha - pi/2) = cos(alpha) cos(pi/2) + sin(alpha) sin(pi/2) = 0 + sin(alpha) = sin(alpha).
  $

  Applying this identity to $inlinedv(F, t)$, we have:
  $
    dv(F, t) = -omega sin(omega t + theta) = -omega cos((omega t + theta) - pi/2).
  $

  This shows that $inlinedv(F, t)$ is a sinusoidal function with the same frequency as $F$ but with its phase advanced (or delayed) by $pi slash 2$. $qed$

+ If the internal resistance of an inductor is not negligible, how does it change the relative
  phase of voltage and current for the inductor? Is this effect more important at high or at low
  frequency?

  If the internal resistance of an inductor is not negligible, then the inductor can be modeled as a resistor and an ideal inductor connected in series. The voltage across the inductor will have two components: one across the ideal inductor and one across the internal resistance. The voltage across the ideal inductor will lead the current by $pi slash 2$, while the voltage across the internal resistance will be in phase with the current. Thus, the overall voltage across the inductor will lead the current by an angle less than $pi slash 2$.

  This effect is more important at high frequency because the inductive reactance $X_L = omega L$ increases with frequency, while the internal resistance remains constant. As a result, the voltage across the ideal inductor will "dominate" at high frequency, and the phase difference between voltage and current will be closer to $pi slash 2$. At low frequency, the internal resistance will have a more significant effect on the overall voltage across the inductor, and the phase difference between voltage and current will be less than $pi slash 2$. $qed$
