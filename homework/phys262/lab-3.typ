#import "../../helpers/template.typ": *
#import "@preview/unify:0.7.1": unit, qty
#import "@preview/cetz:0.4.2": canvas
#import "@preview/cetz-plot:0.1.3": plot

#set text(font: "XITS")
#show math.equation: set text(font: "XITS Math")

#set page("us-letter")

#let name = "Lab 3: Electric Field Mapping"
#let date = "February 13, 2026"
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

/**
 * Section I: Pre-lab
 */

= Pre-lab Questions

#lthin

6. #[
  #set enum(numbering: "a.")
  + What do you observe about the geometric relationship between the electric field vector and the equipotential lines?

    The electric field vector always points perpendicular to the equipotential lines.

  + Calculate the magnitude of the electric field vectors at at least three points on your grid.

    - We know that the magnitude of electric field due to a point charge $q$ is $E = (k q) / r^2$.

    - Since $V = - integral arrow(E) dot dd(arrow(r)) $, we can deduce that $abs(V) = abs(- integral E dd(r)) = abs(- integral (k q)/r^2 dd(r)) = (k q)/r$.

    - Thus, we can rewrite the formula for the magnitude of electric field as $E = V / r$.

    #set enum(numbering: "1.")

    Here were the three points I chose:
    + At $r = #qty(100, "cm") = #qty("1.00", "m")$, $V = #qty(9.017, "V")$ so $E = V / r = #qty(9.017, "V") / #qty("1.00", "m") = #qty(9.017, "V/m")$.

    + At $r = #qty(158.5, "cm") = #qty("1.585", "m")$, $V = #qty(5.674, "V")$ so $E = V / r = #qty(5.674, "V") / #qty("1.585", "m") = #qty(3.579, "V/m")$.

    + At $r = #qty(211.8, "cm") = #qty("2.118", "m")$, $V = #qty(4.258, "V")$ so $E = V / r = #qty(4.258, "V") / #qty("2.118", "m") = #qty("2.010", "V/m")$.
]

7. How does the electric field of 1 positive and 1 negative charge compare with the field from a single positive charge?

  Since $arrow(E) = - arrow(nabla) V = - ang(pdv(V, x), pdv(V, y))$, the magnitude $abs(E) = sqrt((pdv(V, x))^2 + (pdv(V, y))^2)$.

  We can use the approximations $pdv(V, x) approx (V_2 - V_1) / (Delta x)$ and $pdv(V, y) approx (V_2 - V_1) / (Delta y)$ to get 
  $
    abs(E) approx sqrt(((V_2 - V_1) / (Delta x))^2 + ((V_2 - V_1) / (Delta y))^2).
  $

  + The electric field perfectly in the center of the two charges is $E = (2k q)/r^2$ where $r$ is the distance from the center to each charge and $q = #qty(1, "nC")$. Using the ruler tool, $r = #qty(75, "cm") = #qty("0.75", "m")$, which makes $E approx #qty(32, "N/C")$.

  + For two points with distance components $(Delta x, Delta y) = (#qty(0.2, "m"), #qty(0.2, "m"))$, we have $V_1 = #qty(-3.981, "V")$ and $V_2 = #qty(-2.867, "V")$. Plugging these values in, we get $E approx #qty(7.88, "N/C")$.

  + At another location with the same $Delta x$ and $Delta y$, I measured $V_1 = #qty(13.63, "V")$ and $V_2 = #qty(19.79, "V")$, which gives us $E approx #qty(41.1, "N/C")$.

  The electric field shoots out from the positive charge and curves towards the negative charge in all directions. 

8. How does the electric field of a vertical line of positive charges and a negative charge at some distance from the line charge compare with the field from a single positive charge?

  The electric field shooting out from the line of positive charges is dominant, and as I increase the length of the line charge, the electric field becomes more uniform, stronger, and straight. There is a slight curve in towards the negative charge, especially when we are near it.

#pagebreak()

/**
 * Section II: Report
 */

= Report

#lthin

== Data Collection

#let frame(stroke) = (x, y) => (
  left: if x > 0 { 0pt } else { stroke },
  right: stroke,
  top: if y < 2 or calc.rem((y - 1), 5) == 0 { stroke } else { 0pt },
  bottom: stroke,
)

#let data = (
  // coord, x (cm), y (cm), electric potential (V)
  ("A1", 1.0, 8.4, 1.08),
  ("B1", 1.0, 6.4, 1.25),
  ("C1", 1.0, 4.4, 1.14),
  ("D1", 1.0, 2.4, 0.99),
  ("E1", 1.0, 0.4, 1.31),

  ("A2", 2.0, 8.4, 1.96),
  ("B2", 2.0, 6.4, 1.85),
  ("C2", 2.0, 4.4, 1.80),
  ("D2", 2.0, 2.4, 1.96),
  ("E2", 2.0, 0.4, 2.11),

  ("A3", 3.0, 8.4, 2.75),
  ("B3", 3.0, 6.4, 2.66),
  ("C3", 3.0, 4.4, 2.69),
  ("D3", 3.0, 2.4, 2.63),
  ("E3", 3.0, 0.4, 3.50),

  ("A5", 5.0, 8.4, 4.26),
  ("B5", 5.0, 6.4, 4.29),
  ("C5", 5.0, 4.4, 4.33),
  ("D5", 5.0, 2.4, 4.51),
  ("E5", 5.0, 0.4, 4.74),

  ("A6", 6.0, 8.4, 5.03),
  ("B6", 6.0, 6.4, 5.14),
  ("C6", 6.0, 4.4, 5.47),
  ("D6", 6.0, 2.4, 5.48),
  ("E6", 6.0, 0.4, 5.52),
)

#let unique_sorted(values) = {
  let sorted = values.sorted()
  let out = ()
  for value in sorted {
    if out.len() == 0 or out.at(out.len() - 1) != value {
      out.push(value)
    }
  }
  out
}

#let mean(values) = if values.len() == 0 { 0.0 } else { values.sum() / values.len() }

#let stddev(values) = {
  if values.len() == 0 {
    return 0.0
  }
  let mu = mean(values)
  calc.sqrt(values.map(v => (v - mu) * (v - mu)).sum() / (values.len() - 1))
}

#let max_of(values) = {
  let m = values.at(0)
  for value in values {
    if value > m {
      m = value
    }
  }
  m
}

#let value_at(x_query, y_query) = {
  for row in data {
    let x = row.at(1)
    let y = row.at(2)
    let v = row.at(3)
    if x == x_query and y == y_query {
      return v
    }
  }
  none
}

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

#let x_raw = ()
#let y_raw = ()
#let v_values = ()
#for row in data {
  let x = row.at(1)
  let y = row.at(2)
  let v = row.at(3)
  x_raw.push(x)
  y_raw.push(y)
  v_values.push(v)
}

#let x_values = unique_sorted(x_raw)
#let y_values = unique_sorted(y_raw)

#let x_stats = ()
#for x in x_values {
  let col = ()
  for row in data {
    let dx = row.at(1)
    let v = row.at(3)
    if dx == x {
      col.push(v)
    }
  }
  x_stats.push((mean(col), stddev(col)))
}

#let avg_points = ()
#for (i, x) in x_values.enumerate() {
  let (mu, sigma_unused) = x_stats.at(i)
  avg_points.push((x, mu))
}

#let e_slope_v_per_cm = slope_through_origin(avg_points)
#let e_slope_v_per_m = e_slope_v_per_cm * 100

#let plot_colors = (
  orange, green.darken(30%), teal.darken(10%), blue, purple
)

#let v_max_plot = max_of(v_values) + 0.5
#let x_max_plot = x_values.at(x_values.len() - 1) + 1
#let fit_plot = [
  === Average Electric Potential vs. Horizontal Distance from Left Electrode
  #canvas({
    import plot: *
    plot(
      size: (9.2, 5.3),
      axis-style: "scientific-auto",
      x-min: 0,
      x-max: calc.ceil(x_max_plot),
      x-tick-step: 1,
      x-grid: true,
      x-label: [Horizontal distance from left electrode, $x$ (cm)],
      y-min: 0,
      y-max: calc.ceil(v_max_plot),
      y-tick-step: 1,
      y-grid: true,
      y-label: [Electric Potential, $V$ (V)],
      legend: "inner-north-west",
      {
        add(
          avg_points,
          line: "raw",
          style: (stroke: none),
          mark: "o",
          mark-style: (stroke: black, fill: black),
        )
        add(
          ((0, 0), (x_max_plot, e_slope_v_per_cm * x_max_plot)),
          line: "raw",
          mark: none,
          style: (stroke: (paint: blue, thickness: 1.5pt)),
          label: $V = (#nfmt(e_slope_v_per_cm, digits: 4) "V/cm") x$,
        )
      },
    )
  })
]

#let _footnote1 = footnote[Origin is assumed to be at the lower-right corner of the left electrode]

#table(
  columns: (1fr, 1fr, 1fr),
  stroke: frame(1pt + rgb("21222C")),
  table.header(
    [*Coordinate*],
    [*Equivalent Position #_footnote1* (cm)],
    [*Electric Potential*, $V$ (volts)],
  ),
  ..data.map(((coord, x, y, e-potential)) => {
    (
      coord,
      $(#qty(nfmt(x, digits: 1), "cm"), #qty(nfmt(y, digits: 1), "cm"))$, 
      qty(nfmt(e-potential, digits: 2), "V"),
    )
  }).flatten()
)

#pagebreak()

== Data Analysis

#let summary_columns = (1.4fr,)
#for x in x_values {
  summary_columns.push(1fr)
}

#let summary_cells = ()
#for (u, y) in y_values.enumerate() {
  summary_cells.push([
    #if u == 0 [$y = #nfmt(y, digits: 1) "cm"$] else [$#nfmt(y, digits: 1) "cm"$]
  ])
  for (i, x) in x_values.enumerate() {
    let v = value_at(x, y)
    let (mu, sigma) = x_stats.at(i)
    let inner = $#nfmt(v, digits: 2) "V"$
    let cell = if calc.abs(v - mu) > sigma {
      text(fill: red)[#inner]
    } else {
      [#inner]
    }
    summary_cells.push(cell)
  }
}

#let avg_cells = (
  table.cell[*Average potential*],
)
#for stat in x_stats {
  let (mu, sigma_unused) = stat
  avg_cells.push(table.cell[$#nfmt(mu, digits: 2) "V"$])
}

#let std_cells = (
  table.cell[*Standard deviation*],
)
#for stat in x_stats {
  let (mu_unused, sigma) = stat
  std_cells.push(table.cell[$#nfmt(sigma, digits: 4) "V"$])
}

#table(
  columns: summary_columns,
  stroke: frame(1pt),
  align: right,
  table.header(
    [],
    ..x_values.enumerate().map(((i, x)) => table.cell[
      #if i == 0 [ $x = #nfmt(x, digits: 1) "cm"$ ] else [ $#nfmt(x, digits: 1) "cm"$ ]      
    ]),
  ),
  ..summary_cells,
  ..avg_cells,
  ..std_cells,
)
#v(-0.5em)
#rsubtext[Values highlighted in red have a standard deviation of $> 1 sigma$]

#v(0.5em)
#align(center, fit_plot)

#v(0.5em)

=== Theoretical Calculation

Since the electric field is approximately uniform between the two electrodes and points in the same direction as the horizontal path $Delta arrow(r)$, the formula for potential difference $display(abs(Delta V) = abs(integral arrow(E) dot dd(arrow(r))))$ degrades to $display(Delta V = arrow(E) dot Delta arrow(r) = E Delta x " " ==> " " cgreen(E = (Delta V) / (Delta x)))$.

Using $Delta V = 6 "V"$ and $Delta x = 6.7 "cm" = 0.067 "m"$, we get $display(E = (Delta V) / (Delta x) = #qty(6, "V") / #qty("0.067", "m") = #cgreen($89.55 "V/m"$))$.

=== Experimental Calculation

Start with $Delta V = E Delta x$ from above. Since the electric potential is zero at $x = 0 "cm"$ from the left electrode, we can simply write $V = E x$. From the line of best fit, I see that:
$
  E approx "slope of best fit line" = #nfmt(e_slope_v_per_cm, digits: 4) "V/cm" 
  = #cgreen($#nfmt(e_slope_v_per_m, digits: 2) "V/m"$).
$

#let pe = nfmt(calc.abs(e_slope_v_per_m - 89.55) / 89.55 * 100, digits: 2)
#box(width: 100%, inset: 0.5em, stroke: 1pt,
  align(center, table(columns: 2, stroke: none, align: (right, left), column-gutter: 1em,
    [*Experimental Electric Field*], $#nfmt(e_slope_v_per_m, digits: 2) "V/m"$,
    [*Theoretical Electric Field*], $89.55 "V/m"$,
  ))
)

#pagebreak()

== Measurement Grids
\
#box(inset: -12pt)[
  #show par: set text(size: 0.7em)
  #show table.cell: set text(size: 0.7em)

  #grid(
    columns: (3.2fr, 1fr),
    align: (left, horizon + center),
    image("lab-3-2.png"),
    box(inset: 1em, stroke: 1pt, width: 1fr)[
      === Parallel Plate Configuration
    ],
  )

  #grid(
    columns: (3.2fr, 1fr),
    align: horizon,
    image("lab-3-1.png"),
    box(inset: 1em, stroke: 1pt, width: 1fr, align(center)[
      === Dipole Configuration
      From $arrow(E) = - grad V$, I used the approximation $E approx -Delta V slash Delta s$ to estimate the electric field at various points in the grid.

      For $P_1, P_2, P_3$, $Delta V = 1 "V"$.

      #table(
        stroke: (x, y) => (
          bottom: if y == 0 { 0.5pt } else { 0pt },
          left: if x == 0 { 0pt } else { 0.5pt }
        ),
        columns: (0.6fr, 0.6fr, 1fr),
        table.header[Point][$Delta s$][$E approx 1 "V" slash Delta s$],
        $P_1$, $0.6 "cm"$, $1.67 "V/cm"$,
        $P_2$, $1.9 "cm"$, $0.54 "V/cm"$,
        $P_3$, $2.5 "cm"$, $0.40 "V/cm"$,
      )
    ]),
  )
]

#pagebreak()

/**
 * Section III: Conclusion
 */

= Conclusion

#lthin

+ What general statements can be made about the strength and characteristics of electric fields for the electrode plates that you mapped in the lab?

  The electric field between the two plates is approximately uniform since the equipotential lines seemed to be evenly spaced. This behavior was most apparent in the middle of the plates, but field lines began to slightly curve outward near the edges of the plates.

+ If a volt is a joule/coulomb, show that a newton/coulomb and volt/meter are equivalent.

  Since a Joule is defined as a Newton-meter ($"J" = "N" dot "m"$):
  $
    cblue("V") / "m" = cblue("J") / (cblue("C") dot "m") = ("N" dot cancel("m")) / ("C" dot cancel("m")) = cgreen("N" / "C").
  $

+ Why is it not possible for two different equipotential lines to cross?

  If two equipotential lines crossed at some point $P$, there would be two different directions for the electric field at $P$, which would not make sense. A test charge placed at $P$ either moves in one direction or the other, but not both.
 
+ Under what conditions will the electric field between the electrodes of a parallel plate configuration be uniform?

  In the lab, I found that the electric field was the "most" uniform towards the center of the plates, where differing components of electric field could cancel out with each other. Thus, a parallel plate configuration where the plates are much larger than the distance (where it would be reasonable to call the size of the plates "infinite") between them will result in a uniform electric field between the plates. Each plate should also have a uniform charge distribution.

+ Why are the equipotential lines near a conducting surface parallel to the surface? \
  #subtext[Hint: since charges are free to move on a conductor, the electric field near a conductor is perpendicular to the conductor's surface]

  The electric field near the conductor's surface is perpendicular to the surface, and equipotential lines are always perpendicular to electric field lines. Equipotential lines are perpendicular to lines that are perpendicular, i.e. parallel, to the conductor's surface. 

+ Describe how a uniform electric field might be used to measure distance. \
  #subtext[Hint: in the parallel electrode arrangement, what parameter(s) varied with distance between the electrodes?]

  In a uniform electric field, the potential difference $Delta V$ between two points is directly proportional to the distance $Delta x$ between those points (we found $Delta V = E Delta x$). Thus, if we know the magnitude of the uniform electric field $E$, we can measure the distance between two points by measuring the potential difference $Delta V$ between those points and use:
  $
    Delta V = E Delta x " " ==> " " cgreen(Delta x = (Delta V) / E).
  $
