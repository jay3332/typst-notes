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

#let name = "Lab 8: Fast Decay with RC Circuits"
#let date = "March 27, 2026"
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

#set-unit(fraction: "inline")

/**
 * Section I: Pre-lab
 */

= Pre-lab Questions

#lthin
#set text(size: 10.5pt)

#let prelab-circuit = zap.circuit({
  import zap: *
  let south(x) = (content: x, anchor: "south")

  battery(
    "v1", (0, 4), (0, 0), cells: 2, show-polarity: true, width: 0.15, cell-gap: 0.15,
    label: south(unit-V(3))
  )
  wire((0, 4), (6, 4))
  wire((0, 0), (2, 0))
  switch("s1", (2, 0), (4, 0), label: south($S_1$), closed: true)
  switch("s2", (4, 0), (6, 0), label: south($S_2$))
  wire((6, 0), (6, 4))
  resistor("r1", (4, 2), (4, 4), label: unit-Ohm(100), variant: "ieee")
  capacitor("c1", (4, 0), (4, 2), label: unit-uF(5), variant: "ieee")

  node("n1", (2.6, 0))
  node("n2", (3.4, 0))
  node("n3", (4.6, 0))
  node("n4", (5.4, 0))
})

+
  #wrap-content(image("lab-8-0.png"), align: right)[
    _You have constructed an RC circuit and you see the trace to the 
    right on your oscilloscope screen.
    You have set the vertical scale to #unit-V(1) per square and the horizontal to 
    #unit-ms(20) per square.
    What is the time constant of the RC circuit?_

    The time constant $tau = R C$ is equivalent to the "$1 slash e$ life" of the voltage
    across the capacitor. That is, at what time $t$ after discharging does the voltage 
    across the capacitor drop to $1 slash e approx 36.8%$ of its initial value?
 
    The range of the voltage is from the line at $-10%$ to the line at $110%$. 
    $1 slash e approx 36.8%$ between $-10%$ and $110%$ is approximately $34.2%$, which
    intersects with the curve about $1$ division past the $y$-axis. 
    \
    \
    This corresponds to a time constant of approximately: $
      tau approx 1 "division" dot 20 "ms/division" = #cgreen(unit-ms(20)).
    $
  ]

\
#set enum(start: 2)

+ 

  #wrap-content(prelab-circuit, align: right)[
    The RC circuit is constructed as shown on the right.

    #set enum(numbering: "a.")

    + _You then change the resistance to #unit-Ohm(200). How does the time constant change?_

      The time constant is proportional to the resistance: $tau prop R$. Thus, doubling the resistance will double the time constant: $ tau' = 2 tau. $ 

    #set enum(start: 2)

    + _You then change the capacitance to #unit-uF(20). How does the time constant change?_

      The time constant is proportional to the capacitance: $tau prop C$. Thus, quadrupling the capacitance will quadruple the time constant: $
        tau' = 4 tau.
      $

    + _You then change to a #unit-V(9) battery. How does the time constant change?_
  
      The time constant is independent of voltage, so the time constant will not change: $ tau' = tau. $
  ]

#pagebreak()

= Procedure
#lthin

#let R1-ohms = 5600
#let C1-uF = 0.1
#let C1-F = C1-uF * 1e-6

#let percent-error(observed, calculated) = nfmt(calc.abs(observed - calculated) / calc.abs(calculated) * 100, digits: 2)

#let percent-difference(a, b) = nfmt(calc.abs(a - b) / ((calc.abs(a) + calc.abs(b)) / 2) * 100, digits: 2)

#let half-life1-observed-ms = 0.4
#let half-life1-calculated-ms = calc.ln(2) * R1-ohms * C1-F * 1000


#set enum(start: 1)

+ An $R C$ circuit was constructed with a $#unit-Ohm(R1-ohms)$ resistor and a $#unit-uF(C1-uF)$ capacitor. 

  *Observed half-life:* $ t_(1 slash 2, "observed") = 1 "ms"/"division" dot 0.4 "divisions" = #cgreen(unit-ms(half-life1-observed-ms)). $

  *Calculated half-life:* $ t_(1 slash 2, "calculated") = R C ln 2 = #unit-Ohm(R1-ohms) dot #unit-uF(C1-uF) dot ln 2 = #cgreen(qty(half-life1-calculated-ms, 3, unit-ms)). $

  *Percent error:* #percent-error(
    half-life1-observed-ms,
    half-life1-calculated-ms
  )%

#let R2-ohms = 10000
#let half-life2-observed-ms = 0.6
#let half-life2-calculated-ms = calc.ln(2) * R2-ohms * C1-F * 1000

+ Switching resistance and capacitance:

  #set enum(numbering: "a.")

  + The old resistor is swapped with a #unit-Ohm(R2-ohms) resistor, and the same #unit-uF(C1-uF) capacitor is used.

    *Observed half-life:* $ t_(1 slash 2, "observed") = 1 "ms"/"division" dot 0.6 "divisions" = #cgreen(unit-ms(half-life2-observed-ms)). $

    *Calculated half-life:* $ t_(1 slash 2, "calculated") = R C ln 2 = #unit-Ohm(R2-ohms) dot #unit-uF(C1-uF) dot ln 2 = #cgreen(qty(half-life2-calculated-ms, 3, unit-ms)). $

    *Percent error:* #percent-error(
      half-life2-observed-ms,
      half-life2-calculated-ms
    )%

  #let C2-uF = 0.05
  #let C2-F = C2-uF * 1e-6

  #let half-life3-observed-ms = 0.36
  #let half-life3-calculated-ms = calc.ln(2) * R2-ohms * C2-F * 1000

  + The old capacitor is swapped with a #unit-uF(C2-uF) capacitor #footnote[Since there was no #unit-uF(0.05) capacitor, we connected two #unit-uF(0.1) capacitors in series to get an equivalent capacitance of #unit-uF(0.05).], and the #unit-Ohm(R2-ohms) resistor from part (a) is used. We chose a capacitance that was half of the previous capacitance to "reverse" the effect of (approximately) doubling the resistance in part (a).

    *Observed half-life:* $ t_(1 slash 2, "observed") = 1 "ms"/"division" dot 0.36 "divisions" = #cgreen(unit-ms(half-life3-observed-ms)). $

    *Calculated half-life:* $ t_(1 slash 2, "calculated") = R C ln 2 = #unit-Ohm(R2-ohms) dot #unit-uF(C2-uF) dot ln 2 = #cgreen(qty(half-life3-calculated-ms, 3, unit-ms)). $

    *Percent error:* #percent-error(
      half-life3-observed-ms,
      half-life3-calculated-ms
    )%

#let half-life4-observed-ms = 0.10
#let R-partial-calculated = half-life4-observed-ms / 1000 / (calc.ln(2) * C2-F)
#let R-partial-measured = 3360

+ The resistor is replaced with a potentiometer with maximum resistance of #unit-Ohm(10000). At an arbitrary position of the potentiometer, the *observed half-life* is:
  $
    t_(1 slash 2) approx 0.5 "ms"/"division" dot 0.2 "divisions" = #cgreen(unit-ms(half-life4-observed-ms)).
  $

  From this observed half-life, we can *calculate the resistance* of the potentiometer at this position:
  $
    t_(1 slash 2) = R C ln 2 #h(1em) -> #h(1em) R = t_(1 slash 2) / (C ln 2) = #unit-ms(half-life4-observed-ms)/(#unit-uF(C2-uF) dot ln 2) = #cgreen(qty(R-partial-calculated, 4, unit-Ohm)).
  $
  *Measured Resistance with DMM:* #cgreen(unit-Ohm(R-partial-measured)) (#percent-difference(R-partial-measured, R-partial-calculated)% difference)

= Conclusion

#lthin

_Examine the shapes of the exponential voltage signals across the resistor. Give a
qualitative explanation for this shape in a manner similar to that presented above (in
the METHOD section) for the RC circuit. Do these two voltages in fact add up to a
square wave as demanded by Kirchoff's rule? Explain your answer!_

The voltage signals on the oscilloscope model exponential growth/decay, depending on if the square 
wave signal is high or low. 

When the square wave is high, the capacitor is charged, so the voltage across the capacitor increases expontentially (more and more
net charge builds up on the plates of the capacitor.) By Kirchhof's loop rule, the voltage across
the resistor + voltage across capacitor _must_ sum to a constant voltage (until the square wave is low), so the voltage across the _resistor_ will decay exponential such that the sum is constant.

An opposite effect is observed when the square wave is low: the capacitor discharges, so the voltage across the capacitor decreases exponentially, and thus the voltage across the resistor increases exponentially such that the sum is constant. Thus, the two voltages do add up to a square wave as demanded by Kirchhoff's rule.
