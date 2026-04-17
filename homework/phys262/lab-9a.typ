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
  Lab 9a: Charge to Mass Ratio of an Electron
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

/*
Trial	Voltage (V)	Current (A)	Radius (cm)	Radius (m)
1	400	1.8	9	0.09
2	273	1.4	9	0.09
3	224	1.6	7	0.07
4	199	1.8	6	0.06
5	249	1.6	8	0.08
*/

#let _rawdata = (
  // voltage (V), current (A), radius (cm)
  (400, 1.8, 9),
  (273, 1.4, 9),
  (224, 1.6, 7),
  (199, 1.8, 6),
  (249, 1.6, 8)
)

#let R-m = 0.273
#let N-coils = 130
#let mu0 = 4 * calc.pi * 1e-7
#let k = 0.7155

#let q-proton-C = 1.602e-19
#let m-electron-kg = 9.109e-31
#let qm-accepted = q-proton-C / m-electron-kg

#let data = _rawdata.enumerate().map(((idx, (V, i, r))) => {
  let r-m = r / 100
  let Bfield-T = k * N-coils * mu0 * i / R-m
  let qm-ratio = (2 * V) / (Bfield-T * Bfield-T * r-m * r-m)
  let percent-error = calc.abs(qm-ratio - qm-accepted) / qm-accepted * 100

  (
    trial: idx + 1,
    voltage-V: V,
    current-A: i,
    radius-cm: r,
    radius-m: r-m,
    B-field-T: Bfield-T,
    qm-ratio: qm-ratio,
    percent-error: percent-error
  )
})

#pagebreak()

= Data Collection & Analysis
#line(length: 100%, stroke: 0.5pt)

== Table of Data

#let frame(stroke) = (x, y) => (
  left: if x > 0 { 0pt } else { stroke },
  right: stroke,
  top: if y < 2 { stroke } else { 0pt },
  bottom: stroke,
)
#table(
  columns: (0.5fr, 1fr, 1fr, 1fr),
  stroke: frame(1pt),
  table.header[*$k$*][*Voltage $Delta V_k$*][*Current $I_k$*][
    *Radius #footnote[
      This is the radius of the electron's circular path, 
      #underline[NOT] the radius of the solenoid coils!
    ] $r_k$*
  ],
  ..data.map(r => (
    str(r.trial),
    qty(r.voltage-V, 2, unit-V),
    qty(r.current-A, 2, unit-A),
    qty(r.radius-m, 2, unit-m),
  )).flatten(),
)

For each trial $k$, the magnetic field strength $B_k$ was approximated using:
$
  B_k = (alpha N mu_0 I_k) / R,
$
where $N = 130$ is the number of turns in the solenoid, $I_k$ is the current for trial $k$, $R = #unit-m(R-m)$ is the measured
radius of the _solenoid_, and $alpha = 0.7155$ is a unitless constant for our specific apparatus.

The charge-to-mass ratio $q slash m$ for each trial was calculated using the formula:
$
  q/m = (2 Delta V_k) / (B_k^2 r_k^2),
$
where $(Delta V_k, r_k)$ are the accelerating voltage and electron path radius for trial $k$. \
The formula above is derived #link(<q2m>)[in the conclusion].

The calculated $B_k$ and $q slash m$ values for each trial are as follows:

#let unit-C-per-kg = zi.declare("C/kg")
#table(
  columns: (0.5fr, 1fr, 1fr),
  stroke: frame(1pt),
  table.header[*$k$*][*Magnetic Field Strength $B_k$*][*Charge-to-Mass Ratio $q slash m$*],
  ..data.map(r => (
    str(r.trial),
    qty(r.B-field-T * 1000, 2, unit-mT),
    sci-qty(r.qm-ratio, 4, unit-C-per-kg)
  )).flatten(),
)

#pagebreak()

== Comparison with Accepted Value
// #line(length: 100%, stroke: 0.5pt)

#let unit-C = zi.declare("C")

Recall that an electron has a charge of #sci-qty(-q-proton-C, 4, unit-C) and a mass of #sci-qty(m-electron-kg, 4, unit-kg). 

Thus, the theoretical charge-to-mass ratio for an electron is: $
  q/m = #sci-qty(q-proton-C, 4, unit-C) / #sci-qty(m-electron-kg, 4, unit-kg) = #sci-qty(qm-accepted, 4, unit-C-per-kg).
$

The percent error for each trial is:

#table(
  columns: (0.5fr, 1fr, 1fr),
  stroke: frame(1pt),
  table.header[*$k$*][*Experimental $q slash m$*][*Percent Error*],
  ..data.map(r => (
    str(r.trial),
    sci-qty(r.qm-ratio, 4, unit-C-per-kg),
    nfmt(r.percent-error, digits: 2) + "%"
  )).flatten(),
)

#pagebreak()

#let unit-uT = zi.declare("muT")

= Conclusion
#line(length: 100%, stroke: 0.5pt)

+ *What are the possible sources of error in the $e slash m$ experiment?*

  - Human error in measuring $r_k$, the radius of the electron's path, which was difficult to measure accurately due to the "fuzzyness" of the electron trail and parallax error.

  - The solenoid is not ideal, so the magnetic field is not perfectly uniform and does not perfectly follow the formula $B = alpha N mu_0 I slash R$.

  - We are not in a perfect vaccum, so magnetic permeability is not exactly $mu_0$.

+ *Will the Earth's magnetic field be a factor in $e slash m$ experiment? Explain.*

  Although it would have an effect on the net magnetic field, the effect would be so miniscule
  compared to the magnetic field generated by the solenoid that it can be safely ignored.

  Earth's magnetic field is around $#unit-uT(25)$, while the magnetic field generated by our solenoid is around $#unit-mT(0.7) = #unit-uT(700)$. Thus, the Earth's magnetic field is about 25 times weaker than the solenoid's magnetic field, so its effect on the experiment is negligible.

+ *Using your values for accelerating voltage and magnetic field, determine the theoretical radius for a proton in the apparatus.*

  Take the equation for $q slash m$ and rearrange it to solve for $r$:
  $
    q / m &= (2 Delta V) / (B^2 r^2) \
    r^2 &= (2 Delta V) / (B^2 (q slash m)) \
    r &= sqrt((2 Delta V) / (B^2 (q slash m))) = cblue(
      sqrt((2 Delta V m) / (B^2 q))
    ).
  $

  #let m-proton-kg = 1.673e-27

  We know that a proton has the same magnitude of charge as an electron, $q = #sci-qty(q-proton-C, 4, unit-C)$, and a mass of $m = #sci-qty(m-proton-kg, 4, unit-kg)$.

  Applying this formula to the data from our 5 trials:
  #table(
    columns: (0.5fr, 1fr, 1fr, 1fr),
    stroke: frame(1pt),
    table.header[*$k$*][*$Delta V_k$*][*$B_k$*][*Theoretical Radius $r$*],
    ..data.map(r => (
      str(r.trial),
      qty(r.voltage-V, 2, unit-V),
      qty(r.B-field-T * 1000, 2, unit-mT),
      qty(calc.sqrt((2 * r.voltage-V * m-proton-kg) / (r.B-field-T * r.B-field-T * q-proton-C * 100)), 3, unit-m)
    )).flatten(),
  )

#pagebreak()

4. *Derive the $q slash m$ equation.* <q2m>

  Let a particle with charge $q$ and mass $m$ be accelerated through a potential
  difference $Delta V$. By energy conservation, the kinetic energy gained by the particle is equal to the electric potential energy lost:
  $
    q Delta V = 1/2 m v^2.
  $ 

  This means that the speed $v$ of the particle after being accelerated is: $
    v = sqrt((2 q Delta V) / m).
  $

  Now, if the particle enters a region with a uniform magnetic field $B$ that is perpendicular to its velocity, it will experience a magnetic force $F = q v B$ that causes it to move in a circular path. That is, $F$ is also the centripetal force which keeps the particle moving in a circle of radius $r$:
  $
    q v B &= (m v^2) / r \
    q B &= (m v) / r.
  $ 

  Substituting the expression for $v$ from the energy equation into the magnetic force equation, we have:
  $
    q B &= m / r sqrt((2 q Delta V) / m) \
    q^2 B^2 &= m^2 / r^2 (2 q Delta V) / m \
    q^2 B^2 &= (2 m q Delta V) / r^2 \
    q B^2 r^2 &= 2 m Delta V \
    cgreen(q / m &= (2 Delta V) / (B^2 r^2)).
  $


5. *Pre-lab: Why is it important to measure charge-to-mass ratio ($e slash m$)?*

  Measuring the charge-to-mass ratio $e slash m$ of the electron is important because the charge $e$ and the mass $m$ are difficult to measure independently. The ratio $e slash m$ can be used to determine the motion of charged particles in electric and magnetic fields without needing to know that individual values of $e$ and $m$.