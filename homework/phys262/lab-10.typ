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
  Lab 10: Magnetic Field of a Solenoid
]
#let date = "April 10, 2026"
#let author = "Jaysen Tsao"
#let labmates = "Daniella Howusu"
#let prof = "Professor Szwerc"
#let course = "PHYS 262"
#let crn = "30949"
#let submission_date = "April 17, 2026"

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

#set-unit(fraction: "inline")

/**
 * Section I: Pre-lab
 */

= Pre-lab Questions

#line(length: 100%, stroke: 0.5pt)

+ Use Ampere's Law to develop an expression for the magnetic field $B$ inside a solenoid as a function of the number of coils $N$, the length of the solenoid $L$, and the current through the solenoid $I$.

  Consider a rectangular Amperian loop $C$ that extends across the entire solenoid, so its horizontal sides span a length $L$. 
  Its two horizontal sides are parallel to the axis of the solenoid, and its two vertical sides are perpendicular to the axis of the solenoid. One of the horizontal sides is inside the solenoid, and the other horizontal side is outside the solenoid.

  By Ampere's Law:
  $
    integral.cont_C arrow(B) dot dd(arrow(s)) = mu_0 I_"enclosed".
  $ 

  Over the entire solenoid, we have $N$ turns of wire, so the total current enclosed by the Amperian loop is $I_"enclosed" = N I$:
  $
    integral.cont_C arrow(B) dot dd(arrow(s)) = mu_0 N I.
  $

  Since $C$ is piecewise smooth (it is a rectangle), break $C$ up into its four segments:
  $
    integral.cont_C arrow(B) dot dd(arrow(s)) = integral_"top" arrow(B) dot dd(arrow(s)) + integral_"bottom" arrow(B) dot dd(arrow(s)) + integral_"left" arrow(B) dot dd(arrow(s)) + integral_"right" arrow(B) dot dd(arrow(s)).
  $

  There are two important properties of solenoids:
  - The magnetic field outside the solenoid is negligible. 
    #footnote[...for an infinitely long solenoid. Since our solenoid is finite, we only make this assumption if we are "vertically" outside the solenoid.]
  - The magnetic field inside the solenoid is approximately uniform.

  Assume the top side of $C$ is outside the solenoid, and the bottom side of $C$ is inside the solenoid. The magnetic field outside the solenoid is negligible, so the contribution to the line integral from the top side of $C$ is approximately zero: $
    integral_"top" arrow(B) dot dd(arrow(s)) approx 0.
  $
  The magnetic field inside the solenoid is approximately uniform, so the contribution to the line integral from the bottom side of $C$ is:
  $
    integral_"bottom" arrow(B) dot dd(arrow(s)) approx B integral_"bottom" dd(s) = B L.
  $

  Along the left and right sides of $C$, the magnetic field is perpendicular to the path of integration, so the contribution to the line integral from the left and right sides of $C$ is zero (since dot products of perpendicular vectors are zero): $
    integral_"left" arrow(B) dot dd(arrow(s)) = integral_"right" arrow(B) dot dd(arrow(s)) = 0.
  $

  Thus, we have: $
    integral.cont_C arrow(B) dot dd(arrow(s)) = B L = mu_0 N I #h(1em) -> #h(1em) cgreen(B = (mu_0 N I)/L).
  $


+ Assuming $N = 30$ and $L = #unit-cm(30)$, make a properly labeled plot of the magnetic field $B$ as a function of the current through the solenoid $I$ for $#unit-A(0.5) < I < #unit-A(4)$.

  #let N = 30
  #let L = 0.3
  #let mu_0 = 4 * calc.pi * 1e-7

    #align(center)[
    === Magnetic Field inside $bf(#unit-cm(30))$ Solenoid with 30 turns at Varying Currents
    #canvas({
      import plot: *
      plot(
        size: (8.0, 5.0),
        axis-style: "scientific-auto",
        x-min: 0,
        x-max: 4.5,
        x-tick-step: 1,
        x-grid: true,
        x-label: [Current through Solenoid, $I$ (A)],
        y-min: 0,
        y-max: 600,
        y-tick-step: 100,
        y-grid: true,
        y-label: [Magnetic Field Inside Solenoid, $B$ (#{sym.mu}T)],
        legend: "inner-north-west",
        {
          add(
            domain: (0.5, 4),
            I => mu_0 * N * I / L * 1e6,
            style: (stroke: blue + 1.5pt),
            mark: none,
          )
        },
      )
    })
  ]

+ Does the magnetic field $B$ inside the solenoid depend on the position within the solenoid coils?

  The magnetic field $B$ inside the solenoid does not depend on the position within the solenoid coils, since the magnetic field inside the solenoid is approximately uniform. This is one of the important properties of solenoids.

+ If the left end of the solenoid lies at $x = 0$, then derive an expression for the magnetic field $B$ along the axis of the solenoid as a function of $x$, where $x > L$ (outside the solenoid).

  If the solenoid has radius $R$, then it is a distance $r = sqrt(a^2 + R^2)$ from the current source at $x = L - a$. 
  The Biot-Savart Law gives the magnetic field at $x$ from the current source at $x = L - a$ as: $
    dd(arrow(B)) = mu_0 / (4pi) (I dd(arrow(s)) times hat(r)) / r^2.
  $

  Consider just a loop of current at $x = L - a$. $dd(arrow(s)) times hat(r)$ is just $hat(n) dd(s)$ since $dd(arrow(s))$ is always perpendicular to $hat(r)$:
  $
    dd(arrow(B)) = mu_0 / (4pi) (I dd(s)) / r^2 thin hat(n).
  $

  Splitting $dd(arrow(B))$ into components:
  $
    dd(B_x) &= mu_0 / (4pi) (I dd(s)) / r^2 cos theta \
    &= mu_0 / (4pi) (I dd(s)) / (a^2 + R^2) R / sqrt(a^2 + R^2) \
    B_x = integral_"loop" dd(B_x) & = integral_"loop" (mu_0 I)/(4pi) R / (a^2 + R^2)^(3 slash 2) dd(s) \
    &= (mu_0 I R)/(4pi (a^2 + R^2)^(3 slash 2)) integral_0^(2pi R) dd(s) \
    &= (mu_0 I R^2)/(2 (a^2 + R^2)^(3 slash 2)).
  $

  #rsubtext[$B_y = 0$ due to symmetry.]

  Since there is a turn density of $n = N/L$ loops, as $a$ ranges from $x - L$ to $x$, we have:
  $
    B &= integral_(x-L)^x (mu_0 I R^2 n)/(2 (a^2 + R^2)^(3 slash 2)) dd(a) \ 
    &= (mu_0 I R^2 n)/2 integral_(x-L)^x 1/(a^2 + R^2)^(3 slash 2) dd(a) \
    &= (mu_0 I R^2 n)/2 evaluated((a/(R^2 sqrt(a^2 + R^2))))_(a=x-L)^(a=x) \
    &= (mu_0 I R^2 n)/2 (x/(R^2 sqrt(x^2 + R^2)) - (x-L)/(R^2 sqrt((x-L)^2 + R^2))) \
    &= cgreen((mu_0 I n)/2 (x/sqrt(x^2 + R^2) - (x-L)/sqrt((x-L)^2 + R^2))).
  $

#pagebreak()

#let unit-uT = zi.declare("muT")

#let bg-B-field-mT = 0.015
#let bg-B-field-T = bg-B-field-mT / 1000

== Background Magnetic Field

The magnetic field caused by the Earth and other sources was measured as $B_"bg"$.

#quantity-table(
  [*Background Magnetic Field*], $B_"bg" = #unit-uT(bg-B-field-mT * 1000)$
)

= Part 1: Magnetic Field as a Function of Current
#lthin

#let L-cm = 16
#let L-m = L-cm / 100

#let N-turns = 28
#let n-turns-per-cm = N-turns / L-cm
#let n-turns-per-m = N-turns / L-m

// current A, abs. B-field mT
#let _rawdata-1 = (
  (0.27, 0.055),
  (0.57, 0.118),
  (1.00, 0.210),
  (1.91, 0.402),
  (2.58, 0.546),
)

#let mu0 = 4 * calc.pi * 1e-7

#let data-1 = _rawdata-1.enumerate().map(
  ((idx, (current-A, B-field-mT))) => {
    let rel-B-field-mT = B-field-mT - bg-B-field-mT
    let rel-B-field-T = rel-B-field-mT / 1000
    let calculated-B-field-T = mu0 * n-turns-per-m * current-A
    let percent-diff = calc.abs(calculated-B-field-T - rel-B-field-T) / rel-B-field-T * 100
    
    (
      trial: idx + 1,
      current-A: current-A,
      abs-B-field-mT: B-field-mT,
      rel-B-field-mT: rel-B-field-mT,
      rel-B-field-T: rel-B-field-T,
      calculated-B-field-T: calculated-B-field-T,
      percent-diff: percent-diff,
    )
  }
)

#let unit-turns-per-cm = zi.declare("turns/cm")

#quantity-table(
  [*Number of Turns*], $N = #N-turns$,
  [*Length of Solenoid*], $L = #unit-cm(L-cm)$,
  [*Turn Density*], $n = N slash L = #unit-turns-per-cm(n-turns-per-cm)$,
)

Over 5 trials, different currents $I$ were sent through the solenoid via a DC power supply. For each trial, the
magnetic field $B_"measured"$ inside the solenoid was measured using the magnetic field probe.

The correct magnetic field $B_"corrected"$ was calculated by subtracting the background magnetic field $B_"bg"$ from the measured magnetic field $B_"measured"$:
$
  B_"corrected" = B_"measured" - B_"bg".
$

The expected magnetic field $B_"calculated"$ was calculated using the formula derived in the pre-lab: $
  B_"calculated" = mu_0 n I.
$

#let frame(stroke) = (x, y) => (
  left: if x > 0 { 0pt } else { stroke },
  right: stroke,
  top: if y < 2 { stroke } else { 0pt },
  bottom: stroke,
)

#table(
  columns: (0.5fr, 1fr, 1fr, 1fr, 1fr, 1fr),
  stroke: frame(1pt),
  table.header[*\#*][*Current $I$*][*$B_"measured"$*][*$B_"corrected"$*][*$B_"calculated"$*][*% Difference*],
  ..data-1.map(r => (
    str(r.trial),
    qty(r.current-A, 2, unit-A, mode: "places"),
    qty(r.abs-B-field-mT * 1000, 0, unit-uT, mode: "places"),
    qty(r.rel-B-field-mT * 1000, 0, unit-uT, mode: "places"),
    qty(r.calculated-B-field-T * 1000000, 0, unit-uT, mode: "places"),
    nfmt(r.percent-diff, digits: 2) + "%",
  )).flatten()
)

/**1. Plot the magnetic field at the center of the solenoid as a function of the current, B(I).
2. Perform a linear fit and determine the slope and the y-intercept (including units).
3. Write the theoretical equation describing the graph and clearly indicate the independent
variable, the dependent one, and the slope.
4. Use the slope of the linear fit to calculate the magnetic permeability of the air/vacuum, mu_0.
5. Calculate the percent uncertainty.
6. Comment and identify ways to reduce this uncertainty.*/

// Linear regression: B(I) for Part 1

#let linear-regression = (data, x-key, y-key) => {
  let n-pts = data.len()
  let sum-x = data.fold(0.0, (a, r) => a + r.at(x-key))
  let sum-y = data.fold(0.0, (a, r) => a + r.at(y-key))
  let sum-xy = data.fold(0.0, (a, r) => a + r.at(x-key) * r.at(y-key))
  let sum-x2 = data.fold(0.0, (a, r) => a + r.at(x-key) * r.at(x-key))

  let slope = (n-pts * sum-xy - sum-x * sum-y) / (n-pts * sum-x2 - sum-x * sum-x)
  let intercept = (sum-y - slope * sum-x) / n-pts

  (slope: slope, intercept: intercept)
}

#let regression-1 = linear-regression(data-1, "current-A", "rel-B-field-T")
#let slope-fit = regression-1.slope
#let intercept-fit = regression-1.intercept

#let unit-uT-per-A = zi.declare("muT/A")
#let unit-T-per-A = zi.declare("T/A")
#let unit-turns-per-m = zi.declare("turns/m")
#let unit-H-per-m = zi.declare("T/A/m")

// mu_0 from slope: slope (T/A) / n (turns/m) = T·m/A = H/m
#let mu0-measured = slope-fit / n-turns-per-m
#let mu0-pct-uncertainty = calc.abs(mu0-measured - mu0) / mu0 * 100

== Data Analysis

#align(center)[
  === Magnetic Field Inside Solenoid with Varying Current
  #canvas({
    import plot: *
    plot(
      size: (9.0, 5.5),
      axis-style: "scientific-auto",
      x-min: 0,
      x-max: 3.0,
      x-tick-step: 0.5,
      x-grid: true,
      x-label: [Current, $I$ (A)],
      y-min: 0,
      y-max: 650,
      y-tick-step: 100,
      y-grid: true,
      y-label: [Corrected Magnetic Field, $B$ (#{sym.mu}T)],
      legend: "inner-north-west",
      {
        add(
          data-1.map(r => (r.current-A, r.rel-B-field-T * 1e6)),
          line: "raw",
          style: (stroke: none),
          mark: "o",
          mark-style: (stroke: black, fill: black),
        )
        add(
          domain: (0, 3.0),
          I => (slope-fit * I + intercept-fit) * 1e6,
          style: (stroke: blue + 1.5pt),
          mark: none,
          label: [$B = (#qty(slope-fit * 1e6, 4, unit-uT-per-A)) I + (#qty(intercept-fit * 1e6, 3, unit-uT))$],
        )
      },
    )
  })
]

Performing a linear regression, the best-fit line for $B(I)$ is:
$
  B = m I + b, #h(2em) m = #qty(slope-fit * 1e6, 4, unit-uT-per-A), #h(1em) b = #qty(intercept-fit * 1e6, 3, unit-uT).
$

From the equation $B = mu_0 n I$, we can see that $m approx mu_0 n -> mu_0 approx m slash n$:
$
  m approx mu_0 n #h(1em) => #h(1em) mu_0 approx m / n = #sci-qty(slope-fit, 4, unit-T-per-A) / #unit-turns-per-m(n-turns-per-m) = cgreen(#sci-qty(mu0-measured, 4, unit-H-per-m)).
$

The accepted value is $mu_0 = 4pi dot 10^(-7) "T/(A m)" = #sci-qty(mu0, 4, unit-H-per-m)$. The percent uncertainty is:
$
  "% uncertainty" = abs(hat(mu)_0 - mu_0) / mu_0 dot 100% = cgreen(#nfmt(mu0-pct-uncertainty, digits: 2)%).
$

To reduce this uncertainty, we could use a more ideal solenoid (i.e., longer) such that the magnetic field inside is more uniform. We could also
take a more accurate reading of the background magnetic field, since that would cause systematic error in our calculated $mu_0$.

#pagebreak()

= Part 2: Magnetic Field as a Function of Position
#lthin

#let L-cm = 26
#let N-turns = 28
#let n-turns-per-cm = N-turns / L-cm
#let I-A = 2.71

// distance from center cm, abs. B-field mT
#let _rawdata-2 = (
  (0, 0.408),
  (3, 0.371),
  (6, 0.336),
  (9, 0.284),
  (12, 0.214),
  (15, 0.118),
  (18, 0.058),
  (21, 0.028),
)

#let data-2 = _rawdata-2.enumerate().map(
  ((idx, (dist-cm, abs-B-field-mT))) => {
    let rel-B-field-mT = abs-B-field-mT - bg-B-field-mT
    let rel-B-field-T = rel-B-field-mT / 1000
    
    (
      trial: idx + 1,
      dist-cm: dist-cm,
      abs-B-field-mT: abs-B-field-mT,
      rel-B-field-mT: rel-B-field-mT,
      rel-B-field-T: rel-B-field-T,
    )
  }
)

#quantity-table(
  [*Current*], $I = #unit-A(I-A)$,
  [*Number of Turns*], $N = #N-turns$,
  [*Length of Solenoid*], $L = #unit-cm(L-cm)$,
  [*Turn Density*], $n = N slash L = #qty(n-turns-per-cm, 3, unit-turns-per-cm)$,
)

The axial distance from the center of the solenoid $x$ was varied across 8 trials.
For each trial, the magnetic field $B_"measured"$ along the axis of the solenoid was measured using the magnetic field probe.
The corrected magnetic field $B_"corrected"$ was calculated via $B_"corrected" = B_"measured" - B_"background"$.

#table(
  columns: (0.5fr, 1fr, 1fr, 1fr),
  stroke: frame(1pt),
  table.header[*\#*][*Distance from Center $x$*][*$B_"measured"$*][*$B_"corrected"$*],
  ..data-2.map(r => (
    str(r.trial),
    qty(r.dist-cm, 0, unit-cm, mode: "places"),
    qty(r.abs-B-field-mT * 1000, 0, unit-uT, mode: "places"),
    qty(r.rel-B-field-mT * 1000, 0, unit-uT, mode: "places"),
  )).flatten(),
)

/*1. Plot the magnetic field as a function of the distance from the center of the solenoid, B_out
2. Write the equations for the magnetic field inside and outside the coils (but still along the
central axis).
B_in = _______________ B_out = ___________________
3. Do these equations agree with your data? Compare theoretical and experimental values,
comment, and suggest possible explanations.
4. Compare results from Part I and Part II. Which one better and why?*/

// Part 2 calculations
#let n-2-per-m = N-turns / (L-cm / 100)
#let B-in-theory-2 = mu0 * n-2-per-m * I-A
#let B-in-exp-2 = data-2.first().rel-B-field-T
#let pct-diff-2 = calc.abs(B-in-exp-2 - B-in-theory-2) / B-in-theory-2 * 100
#let half-L-cm = L-cm / 2  // 13 cm — solenoid edge from center

== Data Analysis

#align(center)[
  === Magnetic Field Along Axis of Solenoid
  #canvas({
    import plot: *
    plot(
      size: (9.0, 5.5),
      axis-style: "scientific-auto",
      x-min: 0,
      x-max: 24,
      x-tick-step: 3,
      x-grid: true,
      x-label: [Distance from Center, $x$ (cm)],
      y-min: 0,
      y-max: 430,
      y-tick-step: 100,
      y-grid: true,
      y-label: [Corrected Magnetic Field, $B$ (#{sym.mu}T)],
      legend: "inner-north-east",
      {
        add(
          data-2.map(r => (r.dist-cm, r.rel-B-field-T * 1e6)),
          line: "raw",
          style: (stroke: none),
          mark: "o",
          mark-style: (stroke: black, fill: black),
        )
        add-hline(
          B-in-theory-2 * 1e6,
          style: (stroke: (paint: gray, dash: "dashed")),
          label: [$B_"in" = #qty(B-in-theory-2 * 1e6, 3, unit-uT)$],
        )
      },
    )
  })
]

#pagebreak()

The magnetic field *inside* the solenoid (along the central axis) is approximately uniform:
$
  B_"in" = mu_0 n I.
$

The magnetic field *outside* the solenoid but still along the central axis is (derived in pre-lab Q4, with $x_L$ measured from the left end of the solenoid, $L$ the solenoid length, and $R$ the solenoid radius):
$
  B_"out" = (mu_0 n I)/2 (x_L/sqrt(x_L^2 + R^2) - (x_L - L)/sqrt((x_L - L)^2 + R^2)).
$

These equations don't perfectly agree with my data. Within the solenoid, the magnetic field does not seem to stay constant. Outside the solenoid, the equation better predicts the decreasing behavior of the magnetic field strength, but it creates a discontinuity for $B(x)$ at the solenoid edge. 

Plugging in the values for $mu_0$, $n$, and $I$ into the equation for $B_"in"$, we get a theoretical value of $B_"in" = #qty(B-in-theory-2 * 1e6, 3, unit-uT)$. Taking the measured $B$ at the center of the solenoid, it is about
#qty(B-in-exp-2 * 1e6, 3, unit-uT), which is about #nfmt(pct-diff-2, digits: 2)% different from the theoretical value.

#pagebreak()

= Part 3: Magnetic Field as a Function of Turn Density
#lthin

#let I-A = 3.00
#let N-turns = 30

// length of solenoid cm, abs. B-field mT
#let _rawdata-3 = (
  (32, 0.434),
  (27, 0.581),
  (22, 0.751),
  (17, 0.885),
  (12, 0.992),
  (7, 1.172),
)

#let data-3 = _rawdata-3.enumerate().map(
  ((idx, (length-cm, abs-B-field-mT))) => {
    let rel-B-field-mT = abs-B-field-mT - bg-B-field-mT
    let rel-B-field-T = rel-B-field-mT / 1000
    let n-turns-per-cm = N-turns / length-cm
    let n-turns-per-m = N-turns / (length-cm / 100)
    let calculated-B-field-T = mu0 * n-turns-per-m * I-A
    
    (
      trial: idx + 1,
      length-cm: length-cm,
      abs-B-field-mT: abs-B-field-mT,
      rel-B-field-mT: rel-B-field-mT,
      rel-B-field-T: rel-B-field-T,
      n-turns-per-cm: n-turns-per-cm,
      n-turns-per-m: n-turns-per-m,
      calculated-B-field-T: calculated-B-field-T,
      percent-diff: calc.abs(calculated-B-field-T - rel-B-field-T) / rel-B-field-T * 100,
    )
  }
)

#quantity-table(
  [*Current*], $I = #unit-A(I-A)$,
  [*Number of Turns*], $N = #N-turns$,
)

The solenoid remained at #N-turns turns, while the length of the solenoid $L$ was varied across 6 trials,
thus varying the turn density $n$.
For each trial, the magnetic field $B_"measured"$ along the axis of the solenoid was measured using the magnetic field probe.
The corrected magnetic field $B_"corrected"$ was calculated via $B_"corrected" = B_"measured" - B_"background"$.

#table(
  columns: (0.3fr, 0.6fr, 1fr, 0.8fr, 0.8fr),
  stroke: frame(1pt),
  table.header[*\#*][*Length $L$*][*Turn Density $n = N slash L$*][*$B_"measured"$*][*$B_"corrected"$*],
  ..data-3.map(r => (
    str(r.trial),
    qty(r.length-cm, 0, unit-cm, mode: "places"),
    qty(r.n-turns-per-cm, 2, unit-turns-per-cm, mode: "places"),
    qty(r.abs-B-field-mT * 1000, 0, unit-uT, mode: "places"),
    qty(r.rel-B-field-mT * 1000, 0, unit-uT, mode: "places"),
  )).flatten(),
)

/*1. Plot the magnetic field as a function of the number of windings per unit length, B(n).
2. Perform a linear fit and determine the slope and the y-intercept (including units)
3. Write the theoretical equation describing the graph and clearly indicate the independent
variable, the dependent one, and the slope.
4. Use the slope of the linear fit to calculate mu_0
5. Calculate the percent uncertainty.
6. Comment and identify ways to reduce this uncertainty.*/

// Linear regression: B(n) for Part 3
#let n-pts-3 = data-3.len()
#let sum-n-3 = data-3.fold(0.0, (a, r) => a + r.n-turns-per-m)
#let sum-B-3 = data-3.fold(0.0, (a, r) => a + r.rel-B-field-T)
#let sum-nB-3 = data-3.fold(0.0, (a, r) => a + r.n-turns-per-m * r.rel-B-field-T)
#let sum-n2-3 = data-3.fold(0.0, (a, r) => a + r.n-turns-per-m * r.n-turns-per-m)

#let denom-3 = n-pts-3 * sum-n2-3 - sum-n-3 * sum-n-3
#let slope-3 = (n-pts-3 * sum-nB-3 - sum-n-3 * sum-B-3) / denom-3
#let intercept-3 = (sum-B-3 - slope-3 * sum-n-3) / n-pts-3

#let unit-T-m = zi.declare("T m")

// mu_0 from slope: B = (mu_0 * I) * n → slope [T·m] / I [A] = mu_0 [H/m]
#let mu0-3-measured = slope-3 / I-A
#let mu0-3-pct-uncertainty = calc.abs(mu0-3-measured - mu0) / mu0 * 100

== Data Analysis

#align(center)[
  === Corrected Magnetic Field inside Solenoid vs. Turn Density
  #canvas({
    import plot: *
    plot(
      size: (9.0, 5.5),
      axis-style: "scientific-auto",
      x-min: 0,
      x-max: 500,
      x-tick-step: 100,
      x-grid: true,
      x-label: [Turn Density, $n$ (turns/m)],
      y-min: 0,
      y-max: 1500,
      y-tick-step: 200,
      y-grid: true,
      y-label: [Corrected Magnetic Field, $B$ (#{sym.mu}T)],
      legend: "inner-north-west",
      {
        add(
          data-3.map(r => (r.n-turns-per-m, r.rel-B-field-T * 1e6)),
          line: "raw",
          style: (stroke: none),
          mark: "o",
          mark-style: (stroke: black, fill: black),
        )
        add(
          domain: (0, 500),
          n => (slope-3 * n + intercept-3) * 1e6,
          style: (stroke: blue + 1.5pt),
          mark: none,
          label: [$B = (#sci-qty(slope-3, 3, unit-T-m)) n + (#qty(intercept-3 * 1e6, 3, unit-uT))$],
        )
      },
    )
  })
]

Performing a linear regression, the best-fit line for $B(n)$ is:
$
  B = m n + b, #h(2em) m = #sci-qty(slope-3, 4, unit-T-m), #h(1em) b = #qty(intercept-3 * 1e6, 3, unit-uT).
$

Theoretically, the magnetic field inside the solenoid is $B = mu_0 I n$ with $I$ fixed at $#unit-A(I-A)$. \
So, the slope $m = mu_0 I$. Solving for $mu_0$:
$
  mu_0 = m / I = #sci-qty(slope-3, 4, unit-T-m) / #unit-A(I-A) = cgreen(#sci-qty(mu0-3-measured, 4, unit-H-per-m)).
$

The accepted value is $mu_0 = #sci-qty(mu0, 4, unit-H-per-m)$. The percent uncertainty is:
$
  "% uncertainty" = abs(hat(mu)_0 - mu_0) / mu_0 times 100% = cgreen(#nfmt(mu0-3-pct-uncertainty, digits: 1)%).
$

The large percent uncertainty reflects that the data does not follow a perfectly linear $B(n)$ relationship. In the graph, the data points are not close to the line of best-fit, indicating a poor fit (poor $r$-value). This is likely because our solenoid was far from ideal. We can make our solenoid "more ideal" by increasing the length or decreasing the radius of the solenoid.


Part I is the better method for determining $mu_0$ because it fixes the probe position at the center of the solenoid, where the magnetic field is most uniform (approximating an ideal solenoid). Part II varies the probe position, including outside the solenoid, which means we have to use a much more complicated equation for $B$.
