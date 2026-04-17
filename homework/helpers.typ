#import "@preview/zero:0.6.1": num, zi, set-unit

#let hw-template(body) = [
  #show math.equation.where(block: true): eq => {
    block(width: 100%, inset: 0pt, align(center, eq))
  }

  #set text(font: "XITS")
  #show math.equation: set text(font: "XITS Math")
  #set page("us-letter")

  #show figure: it => {
    html.elem("figure", attrs: (class: "typst"), html.frame(it))
  }

  #body
]

#let qty(n, sigfigs, unit, mode: "figures", ..args) = unit(
  n,
  round: (mode: mode, precision: sigfigs),
  group: (threshold: calc.inf),
  product: sym.dot,
  ..args 
)
#let sci-qty(n, sigfigs, unit, ..args) = qty(n, sigfigs, unit, exponent: "sci", ..args)

#let quantity-table(..args) = box(width: 100%, inset: 0.5em, stroke: 1pt, align(center, table(
  columns: 2,
  stroke: none,
  align: (right, left),
  column-gutter: 1em,
  ..args
)))