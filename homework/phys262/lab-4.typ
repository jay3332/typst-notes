#import "../../helpers/template.typ": *
#import "../helpers.typ": hw-template, qty as hqty, sci-qty, num as unitless, quantity-table
#import "@preview/unify:0.7.1": qty, unit
#import "@preview/cetz:0.4.2": canvas
#import "@preview/cetz-plot:0.1.3": plot
#import "@preview/zero:0.6.1": zi, set-unit

#show: hw-template

#let name = "Lab 4: Capacitance"
#let date = "February 20, 2026"
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

// units
#let unit-cm = zi.declare("cm")
#let unit-m = zi.declare("m")
#let unit-cm2 = zi.declare("cm^2")
#let unit-m2 = zi.declare("m^2")
#let unit-mm = zi.declare("mm")
#let unit-inv-mm = zi.declare("mm^-1")

#let unit-F = zi.declare("F")
#let unit-uF = zi.declare("muF")
#let unit-nF = zi.declare("nF")
#let unit-F-m = zi.declare("F m")
#let unit-F-per-m = zi.declare("F/m")
#let unit-nF-mm = zi.declare("nF mm")
#let unit-nF-per-m2 = zi.declare("nF/m^2")
#let unit-F-per-m2 = zi.declare("F/m^2")

#set-unit(fraction: "inline")

/**
 * Section I: Pre-lab
 */

#set text(size: 10pt)

= Pre-lab Questions

#lthin

The capacitance of a parallel plate capacitor is given by:
$
  C^* = kappa epsilon_0 A / d = kappa C,
$
where $epsilon_0$ is the permittivity of free space, $kappa$ is the relative permittivity of the dielectric material, $A$ is the area of each plate, and $d$ is the distance of separation. For paper, $kappa approx 3.7$.

+ Calculate the capacitance for plates that are separated by $1/4 "inch"$ of paper, and that have the area of an $8.5\" times 11\"$ piece of paper.

  The area of the plates is $A = (8.5 "in")(11 "in") = (0.2159 "m")(0.2794 "m") = #qty(0.06032, "m^2")$. \
  The separation of the plates is $d = 0.25 "in" = 0.00635 "m"$.

  The capacitance is:
  $
    C^* & = kappa epsilon_0 A / d \
    & = (3.7)(#qty("8.85e-12", "F/m"))(#qty(0.06032, "m^2")) / (0.00635 "m") \
    & approx #cgreen(qty("3.111e-10", "F")).
  $

+ Calculate the capacitance if the area and separation are halved.

  Since $C^* prop A/d$, multiplying both $A$ and $d$ by the same factor $1/2$ will multiply $C^*$ by a factor of $(1 slash 2) / (1 slash 2) = 1$.
  So, the capacitance will remain the same: $C^* approx #cgreen(qty("3.111e-10", "F"))$.

Let there be two capacitors $C_1$ and $C_2$, each with capacitance #qty(1, "uF").

3. What is the equivalent capacitance of a series combination of $C_1$ and $C_2$?

  The potential difference across $C_1$ is $Delta V_1 = q slash C_1$ and the potential difference across $C_2$ is $Delta V_2 = q slash C_2$. \
  So, the total potential difference across the series combination is:
  $
    Delta V = Delta V_1 + Delta V_2 = q/C_1 + q/C_2 = q (1/C_1 + 1/C_2).
  $

  Assuming the equivalent capacitance of the series combination is $C_"series"$, then:
  $
    Delta V = cancel(q)/C_"series" &= cancel(q) (1/C_1 + 1/C_2) \
    cgreen(1/C_"series" &= 1/C_1 + 1/C_2).
  $

+ What is the equivalent capacitance of a parallel combination of $C_1$ and $C_2$?

  Since $C_1$ and $C_2$ are in parallel, they have the same potential difference: $Delta V = Delta V_1 = Delta V_2$. \
  The total charge stored in the parallel combination is:
  $
    q = q_1 + q_2 = C_1 Delta V + C_2 Delta V = (C_1 + C_2) Delta V.
  $

  Assuming the equivalent capacitance of the parallel combination is $C_"parallel"$, then:
  $
    q = C_"parallel" Delta V &= (C_1 + C_2) Delta V \
    cgreen(C_"parallel" &= C_1 + C_2).
  $

#set text(size: 11pt)
#pagebreak()

/**
 * Section II: Report
 */
#let nqty(n, unit, digits) = qty(nfmt(n, digits: digits), unit)

#let slope_through_origin(points) = {
  let sum_xv = 0.0
  let sum_x2 = 0.0
  for point in points {
    let x = point.at(0)
    let v = point.at(1)
    sum_xv += x * v
    sum_x2 += x * x
  }
  sum_xv / sum_x2
}

= Part I: Parallel Plate with Constant Area

#lthin

#let foil-width-cm = 21.59
#let foil-length-cm = 27.94
#let foil-area-cm2 = foil-width-cm * foil-length-cm
#let foil-area-m2 = foil-area-cm2 / 10000
#let separation-mm-per-paper = 0.1

#let data = (
  // (sheets of paper, capacitance in nF)
  (5, 2.57),
  (7, 1.90),
  (10, 1.43),
  (14, 1.09),
  (17, 0.93),
  (20, 0.79),
)
#let data-mm-to-nf = data.map(((sheets, capacitance)) => (sheets * separation-mm-per-paper, capacitance))
#let slope-nf-per-mm = slope_through_origin(data-mm-to-nf)
#let slope-f-per-m = slope-nf-per-mm * 1e-9 * 1000

#let plot-d-mm = ()
#let plot-c-nf = ()
#for (mm, nf) in data-mm-to-nf {
  plot-d-mm.push(mm)
  plot-c-nf.push(nf)
}
#let plot-d-max = 2.50
#let plot-c-max = 3.00

#let data-inv-d = data-mm-to-nf.map(((mm, nf)) => (1.0 / mm, nf))
#let slope-linearized = slope_through_origin(data-inv-d)

// slope is in nF*mm = nF*(1e-3 m) = 1e-9 F * 1e-3 m = 1e-12 F*m
#let slope-fm = slope-linearized * 1e-12  // F*m
#let kappa-1 = slope-fm / (epsilon0 * foil-area-m2)

#let inv-d-max = 1.0 / (5 * separation-mm-per-paper) + 0.5
#let inv-d-tick = 1.0

#let graph-1 = [
  === Capacitance vs. Separation of Plates
  #canvas({
    import plot: *
    plot(
      size: (6.5, 4.8),
      axis-style: "scientific-auto",
      x-min: 0,
      x-max: plot-d-max,
      x-tick-step: 0.5,
      x-grid: true,
      x-label: [Thickness of Sheets of Paper, $d$ (mm)],
      y-min: 0,
      y-max: plot-c-max,
      y-tick-step: 0.5,
      y-grid: true,
      y-label: [Capacitance, $C$ (nF)],
      {
        add(
          data-mm-to-nf,
          line: "raw",
          style: (stroke: none),
          mark: "o",
          mark-style: (stroke: black, fill: black),
        )
      },
    )
  })
]

#let graph-2 = [
  === Linearized Graph
  #canvas({
    import plot: *
    plot(
      size: (6.5, 4.8),
      axis-style: "scientific-auto",
      x-min: 0,
      x-max: inv-d-max,
      x-tick-step: 0.5,
      x-grid: true,
      x-label: [Inverse Separation, $1\/d$ ($"mm"^(-1)$)],
      y-min: 0,
      y-max: plot-c-max,
      y-tick-step: 0.5,
      y-grid: true,
      y-label: [Capacitance, $C$ (nF)],
      legend: "inner-north-west",
      {
        add(
          data-inv-d,
          line: "raw",
          style: (stroke: none),
          mark: "o",
          mark-style: (stroke: black, fill: black),
        )
        add(
          domain: (0, inv-d-max),
          x => slope-linearized * x,
          style: (stroke: blue + 1pt),
          label: [$C = (#hqty(slope-linearized, 4, unit-nF-mm))(1 slash d)$],
        )
      },
    )
  })
]

#quantity-table(
  [*Measured Width*],  $#hqty(foil-width-cm, 4, unit-cm)$,
  [*Measured Length*], $#hqty(foil-length-cm, 4, unit-cm)$,
  [*Computed Area* ($A$)], $#hqty(foil-area-cm2, 4, unit-cm2) "=" #hqty(foil-area-m2, 4, unit-m2)$,
)

== Data Collection & Analysis

#let frame(stroke) = (x, y) => (
  left: if x > 0 { 0pt } else { stroke },
  right: stroke,
  top: if y < 2 { stroke } else { 0pt },
  bottom: stroke,
)

#table(
  columns: (1fr, 1fr, 1fr),
  stroke: frame(1pt),
  table.header[*Sheets of Paper*][*Thickness $d$*][*Measured Capacitance $C$*],
  ..data.map(((sheets, capacitance)) => {
    let separation = sheets * separation-mm-per-paper
    return ([#sheets], nqty(separation, "mm", 1), nqty(capacitance, "nF", 2))
  }).flatten()
)

#v(0.8em)
#grid(
  columns: (1fr, 1fr),
  align: horizon + center,
  graph-1, graph-2,
)
#v(0.8em)

The formula for capacitance is $display(C = kappa epsilon_0 A / d = cblue((kappa epsilon_0 A)) 1/d).$ 

The slope of the line of best fit estimates $kappa epsilon_0 A$. From the $C$ vs. $1 slash d$ graph:
$
  "slope" approx kappa epsilon_0 A = #hqty(slope-linearized, 4, unit-nF-mm) = #cblue(sci-qty(slope-fm, 4, unit-F-m)).
$
Solving for $kappa$:
$
  kappa = "slope" / (epsilon_0 A) = (#cblue(sci-qty(slope-fm, 4, unit-F-m))) / ((#sci-qty(epsilon0, 3, unit-F-per-m))(#hqty(foil-area-m2, 4, unit-m2))) approx #cgreen(hqty(kappa-1, 4, unitless)).
$

#quantity-table[*Dielectric Constant for Part I*][$kappa_1 = #hqty(kappa-1, 4, unitless)$]

#pagebreak()

= Part II: Parallel Plate with Constant Separation

#let data2 = (
  // (length (cm), width (cm), capacitance (nF))
  (27.94, 21.59, 1.43),
  (13.97, 21.59, 0.70),
  (13.97, 10.80, 0.33),
  (13.97, 5.40, 0.16),
  (6.99, 5.40, 0.07),
  (6.99, 2.70, 0.04),
)

#let separation2-mm = 10 * separation-mm-per-paper
#let separation2-m = separation2-mm * 1e-3

// area in m^2 and capacitance in nF
#let data2-area-to-nf = data2.map(((l, w, c)) => (l * w / 10000, c))
#let slope2-linearized = slope_through_origin(data2-area-to-nf)

// slope is in nF/m^2 = 1e-9 F/m^2
#let slope2-f-per-m2 = slope2-linearized * 1e-9
#let kappa-2 = slope2-f-per-m2 * separation2-m / epsilon0

#let kappa-percent-diff = calc.abs(kappa-1 - kappa-2) / ((kappa-1 + kappa-2) / 2) * 100

#let plot2-a-max = data2-area-to-nf.fold(0.0, (acc, (a, _)) => calc.max(acc, a)) * 1.2
#let plot2-c-max = 1.8

#lthin

The separation is fixed at 10 sheets of paper, which we measured to be $d = #hqty(separation2-mm, 2, unit-mm).$

== Data Collection & Analysis

#table(
  columns: (1fr, 1fr, 1fr, 1.2fr),
  stroke: frame(1pt),
  table.header[*Length*][*Width*][*Computed Area $A$*][*Measured Capacitance $C$*],
  ..data2.map(((l, w, c)) => {
    let area = l * w
    return (hqty(l, 4, unit-cm), hqty(w, 4, unit-cm), hqty(area, 4, unit-cm2), nqty(c, "nF", 2))
  }).flatten()
)

#let graph-3 = align(center)[
  === Measured Capacitance vs. Area of Folded Aluminum Sheets
  #canvas({
    import plot: *
    plot(
      size: (7.2, 5.0),
      axis-style: "scientific-auto",
      x-min: 0,
      x-max: plot2-a-max,
      x-tick-step: 0.02,
      x-grid: true,
      x-label: [Area of each Folded Plate, $A$ ($"m"^2$)],
      y-min: 0,
      y-max: plot2-c-max,
      y-tick-step: 0.5,
      y-grid: true,
      y-label: [Capacitance, $C$ (nF)],
      legend: "inner-north-west",
      {
        add(
          data2-area-to-nf,
          line: "raw",
          style: (stroke: none),
          mark: "o",
          mark-style: (stroke: black, fill: black),
        )
        add(
          domain: (0, plot2-a-max),
          a => slope2-linearized * a,
          style: (stroke: blue + 1pt),
          label: [$C = (#hqty(slope2-linearized, 4, unit-nF-per-m2))A$],
        )
      },
    )
  })
]

#graph-3

Using the equation for capacitance: $display(C = kappa epsilon_0 A / d = cblue((kappa epsilon_0) / d) A)$. The slope of the line of best fit estimates $display((kappa epsilon_0) / d)$. From the $C$ vs. $A$ graph:
$
  "slope" approx #hqty(slope2-linearized, 4, unit-nF-per-m2) = #cblue(sci-qty(slope2-f-per-m2, 4, unit-F-per-m2)).
$

Solving for $kappa$:
$
  kappa = "slope" dot d / epsilon_0
  = #cblue(sci-qty(slope2-f-per-m2, 4, unit-F-per-m2)) dot (#hqty(separation2-m, 1, unit-m)) / (#sci-qty(epsilon0, 3, unit-F-per-m)) 
  approx #cgreen(hqty(kappa-2, 4, unitless)).
$
Percent difference:
$
  Delta% = (abs(kappa_1 - kappa_2)) / (1/2 (kappa_1 + kappa_2)) dot 100%
  approx #cgreen(nfmt(kappa-percent-diff, digits: 2) + "%").
$

#quantity-table(
  [*Dielectric Constant for Part II*], [$kappa_2 = #hqty(kappa-2, 4, unitless)$],
  [*Percent Difference*], [$Delta% = #hqty(kappa-percent-diff, 3, unitless) %$],
)

#pagebreak()

= Part III: Parallel Plate with Dielectric Plate

#let d3-mm = 2.1
#let d3-m = d3-mm * 1e-3
#let c3-nf = 0.80
#let c3-f = c3-nf * 1e-9
#let kappa3-measured = c3-f * d3-m / (8.85e-12 * foil-area-m2)
#let kappa3-known = 3.4
#let kappa3-percent-error = calc.abs(kappa3-measured - kappa3-known) / kappa3-known * 100

#lthin
#quantity-table(
  [*Original Area* ($A$)], [#hqty(foil-area-m2, 4, unit-m2)],
  [*Measured Thickness* ($d$)], [#hqty(d3-mm, 2, unit-mm)],
  [*Measured Capacitance* ($C$)], [#hqty(c3-nf, 2, unit-nF)],
)

The measured capacitance with the dielectric plate ($C = #nqty(c3-nf, "nF", 2)$) is different from Part I because the dielectric plate is made from a different material than the paper and would have a different actual dielectric constant.

Since $display(C = kappa epsilon_0 A / d)$, rearranging gives:
$
  kappa = (C d) / (epsilon_0 A)
  = ((#nqty(c3-nf, "nF", 2)) (#hqty(d3-m, 2, unit-m))) / ((#sci-qty(epsilon0, 3, unit-F-per-m))(#hqty(foil-area-m2, 4, unit-m2)))
  approx #cgreen(hqty(kappa3-measured, 4, unitless)).
$

The known dielectric constant for the dielectric plate is $kappa_"known" = #kappa3-known$. The percent error is:
$
  % "Error" = (abs(kappa - kappa_"known")) / kappa_"known" dot 100%
  approx #cgreen(nfmt(kappa3-percent-error, digits: 2) + "%").
$

#quantity-table(
  [*Calculated Dielectric Constant*], [$kappa_3 = #hqty(kappa3-measured, 4, unitless)$],
  [*Percent Error*], [$#hqty(kappa3-percent-error, 3, unitless) %$],
)

= Part IV: Capacitors in Series and Parallel

#let c1-uf = 9.96
#let c2-uf = 9.79
#let c-series-calc-uf = 1.0 / (1.0 / c1-uf + 1.0 / c2-uf)
#let c-parallel-calc-uf = c1-uf + c2-uf
#let c-series-meas-uf = 4.95
#let c-parallel-meas-uf = 19.71
#let c-series-percent-diff = calc.abs(c-series-calc-uf - c-series-meas-uf) / ((c-series-calc-uf + c-series-meas-uf) / 2) * 100
#let c-parallel-percent-diff = calc.abs(c-parallel-calc-uf - c-parallel-meas-uf) / ((c-parallel-calc-uf + c-parallel-meas-uf) / 2) * 100

#lthin
#grid(
  columns: (.7fr, 1fr),
  column-gutter: 1em,
  quantity-table(
    [*Capacitor 1*], [$C_1 = #hqty(c1-uf, 3, unit-uF)$],
    [*Capacitor 2*], [$C_2 = #hqty(c2-uf, 3, unit-uF)$],
  ),
  quantity-table(
    [*Measured Capaitance, Series*], [$C = #hqty(c-series-meas-uf, 4, unit-uF)$],
    [*Measured Capaitance, Parallel*], [$C = #hqty(c-parallel-meas-uf, 4, unit-uF)$],
  )
)

== Calculated Effective Capacitances
$
  bf("Series") #h(4em) & 1/C_"series" = 1/C_1 + 1/C_2 = 1/#hqty(c1-uf, 3, unit-uF) + 1/#hqty(c2-uf, 3, unit-uF) = 1/#hqty(c-series-calc-uf, 4, unit-uF) 
  #h(1em) => #h(1em) C_"series" = #cgreen(hqty(c-series-calc-uf, 4, unit-uF)). \ \
  bf("Parallel") #h(4em) & C_"parallel" = C_1 + C_2 = #hqty(c1-uf, 3, unit-uF) + #hqty(c2-uf, 3, unit-uF) = #cgreen(hqty(c-parallel-calc-uf, 4, unit-uF)).
$

== Comparison

#table(
  columns: (1fr, 1fr, 1fr, 1fr),
  stroke: frame(1pt),
  table.header[*Configuration*][*Calculated*][*Measured*][*Percent Difference*],
  [Series], hqty(c-series-calc-uf, 4, unit-uF), hqty(c-series-meas-uf, 4, unit-uF), nfmt(c-series-percent-diff, digits: 3) + "%",
  [Parallel], hqty(c-parallel-calc-uf, 4, unit-uF), hqty(c-parallel-meas-uf, 4, unit-uF), nfmt(c-parallel-percent-diff, digits: 3) + "%",
)

#pagebreak()

= Conclusion

#lthin

+ What is the relationship between the capacitance and the separation of the plates?

  The capacitance is inversely proportional to the separation of the plates: $display(C prop 1/d)$. As the separation increased, the capacitance decreased.

+ What is the relationship between the capacitance and the area?

  The capacitance is directly proportional to the area of each conducting aluminum sheet: $C prop A$. As the area increased, the capacitance also increased.

+ How does the use of a dielectric between the foil sheets change the capacitance?

  The dielectric increased the capacitance by a factor $kappa$, where $kappa > 1$. 

+ What were possible sources of errors in the experiment?

  - The aluminum foil sheets were not perfectly flat/pressed down, which may have caused uneven separation and air gaps between the foil plates and introduced variation in $d$. This would have also reduced the actual contact area $A$. 
  
  - The two conducting aluminum sheets may not have been perfectly aligned, which would have reduced the contact area $A$.

+ Why does the total capacitance of two capacitors depend upon whether they are connected in series or in parallel?

  - In a parallel connection, both capacitors share the same voltage but accumulate charge independently, so the total charge stored is: $
    q = q_1 + q_2 = (C_1 + C_2) Delta V = C Delta V.
  $
  This gives $C = C_1 + C_2$. The effective plate area is increased (charge can accumulate on each capacitor).

  - In a series connection, the potential differences accumulate: 
    $
      Delta V = Delta V_1 + Delta V_2 space ==> space q/C =  q/C_1 + q/C_2.
    $
    This gives $1 \/ C = 1 \/ C_1 + 1 \/ C_2$. The effective separation is increased.