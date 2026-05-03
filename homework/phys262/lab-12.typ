#import "../../helpers/template.typ": *
#import "../../src/electromagnetism/helpers.typ": battery
#import "../helpers.typ": *
#import "@preview/cetz:0.4.2"
#import "@preview/cetz:0.4.2": canvas
#import "@preview/cetz-plot:0.1.3": plot
#import "@preview/zero:0.6.1": zi, set-unit
#import "@preview/zap:0.5.0"
#import "@preview/wrap-it:0.1.1": wrap-content
#import "../regression.typ": *

#show: hw-template

#let name = [
  Lab 12: Fast LRC Decay
]
#let date = "April 24, 2026"
#let author = "Jaysen Tsao"
#let labmates = "Alex Yue"
#let prof = "Professor Szwerc"
#let course = "PHYS 262"
#let crn = "30949"
#let submission_date = "April 30, 2026"

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

#set-unit(fraction: "inline")

/**
 * Section I: Pre-lab
 */

= Pre-lab Questions

#let then = $#h(1em) -> #h(1em)$
#line(length: 100%, stroke: 0.5pt)

_Derive the relationship between the time constant in an LRC circuit and the half life of the
voltage across the resistor._

From the general solution for the voltage across the resistor in an LRC circuit, we have:
$
  V(t) = V_0 e^(-R/(2L) t) cos(omega t + phi),
$
where $omega = sqrt(1/(L C) - R^2/(4L^2))$ is the angular frequency of the oscillation. The time constant $tau$ is defined as the time it takes for the voltage to decay to $1 slash e$ of its initial value, which occurs when the exponential is $1 slash e$:
$
  e^(-R/(2L) tau) = 1/e
  then -R/(2L) tau = -1
  then tau = cgreen((2L)/R).
$

This allows us to rewrite the voltage as:
$
  V(t) = V_0 e^(-t slash tau) cos(omega t + phi).
$

The half-life $t_(1 slash 2)$ is defined as the time it takes for the voltage to decay to half of its initial value, which occurs when the exponential is $1 slash 2$:
$
  e^(-t_(1 slash 2) slash tau) = 1/2
  then -t_(1 slash 2) slash tau = ln(1/2)
  then t_(1 slash 2) = cgreen(tau ln 2 = (2 L ln 2)/R).
$


/*In the experiment, part 1, you are asked to select an appropriate frequency for the square wave. How do you know that you have an appropriate frequency?



In part 3, how do you know when your circuit is underdamped, critically damped, and overdamped?



In part 3, what happens to the potential across the resistor as the resistance in the circuit is increased from its lowest to its highest value?



There are multiple frequencies that are mentioned in this lab. The driven frequency is what you set with the function generator. The oscillation frequency (or the response frequency) is what is observed in the RLC circuit. How are these frequencies related?



Why does the value of the resistor change the oscillation of the potential? Your answer should include references to the power input to the circuit from the generator, and the power dissipated in the resistor.

*/

#pagebreak()

#let L-measured-1 = 22.8 / 1000
#let C-measured-1 = 9.6 / 1e9

#let R-internal = 36.4
#let R-generator = 50
#let R-total = R-internal + R-generator

#let L-labeled-1 = 22 / 1000
#let C-labeled-1 = 0.01 / 1e6

#let unit-mH = zi.declare("mH")
#let unit-nF = zi.declare("nF")

= Part 1: Driven LRC Series Circuit
#lthin

An LC circuit with an inductor of labeled inductance $#unit-mH(22)$ and a capacitor of labeled capacitance $#unit-uF(0.01) = #unit-nF(10)$ is driven by a function generator with a square wave output,
with some internal resistance $R$.

#quantity-table(
  [*Inductor value (measured)*], $L approx #unit-mH(L-measured-1 * 1e3)$,
  [*Capacitor value (measured)*], $C approx #unit-nF(C-measured-1 * 1e9)$,
  [*Total resistance (measured)*], $R approx #unit-Ohm(R-internal) + #unit-Ohm(R-generator) = #unit-Ohm(R-total)$,
)

From the derivation in the instructions, the critical resistance of the circuit is given by:
$
  R_"crit" = 2 sqrt(L / C) approx #unit-Ohm(2 * calc.sqrt(L-measured-1 / C-measured-1), digits: 1).
$
Our measured total resistance $R$ is much less than the critical resistance $R_"crit"$, so the circuit is severely underdamped. The damped angular frequency is given by:

#let damped-ang-freq(L, R, C) = calc.sqrt(1/(L * C) - (R*R) /(4*L*L))

#let unit-rad-per-s = zi.declare("rad/s")
#let damped-ang-freq-1 = damped-ang-freq(L-measured-1, R-total, C-measured-1)

$
  omega_d = sqrt(1/(L C) - R^2/(4L^2)) approx #unit-rad-per-s(damped-ang-freq-1, digits: 0).
$

Thus, the theoretical oscillation frequency of the circuit is given by:

#let damped-freq-1 = damped-ang-freq-1 / (2 * calc.pi)
#let unit-Hz = zi.declare("Hz")
#let unit-div = zi.declare("div")
#let unit-us-per-div = zi.declare("mus/div")
#let unit-us = zi.declare("mus")

$
  f_d = omega_d / (2 pi) approx #unit-Hz(damped-ang-freq-1 / (2 * calc.pi), digits: 0).
$

Using the derivation from the pre-lab, the theoretical half-life of the voltage across the resistor is:
#let half-life-1 = (2 * L-measured-1 * calc.ln(2)) / R-total
$
  t_(1 slash 2) = (2 L ln 2)/R approx #unit-ms(half-life-1 * 1000, digits: 4) = #unit-us(half-life-1 * 1e6, digits: 1).
$

#let f1 = 10526
#let t1 = 0.2 / 1000

#let perror-freq = calc.abs(f1 - damped-freq-1) / damped-freq-1 * 100
#let perror-half-life = calc.abs(t1 - half-life-1) / half-life-1 * 100

#table(
  columns: (0.8fr, 0.5fr, 1fr, 0.4fr),
  table.header[][*Theoretical*][*Experimental*][*% Error*],
  [*Oscillation Frequency, $f$*], 
  unit-Hz(damped-freq-1, digits: 0), 
  [
    $T = (#unit-div(1.9))(#unit-us-per-div(50)) = #unit-us(1.9 * 50)$ \
    $f = 1 slash T = #unit-Hz(1 / (1.9 * 50 * 1e-6), digits: 0)$
  ],
  $#nfmt(perror-freq)%$,
  [*Half life, $t_(1 slash 2)$*], 
  unit-us(half-life-1 * 1000000, digits: 1), 
  [
    $(#unit-div(2))(#unit-us-per-div(100)) = #unit-us(2 * 100)$
  ],
  $#nfmt(perror-half-life)%$,
)

#pagebreak()

= Part 2: Different Combinations of $L$ and $C$
#lthin

== Case 1: Decreased $L$, Same $C$

#let L-measured-2 = 3.3 / 1000
#let C-measured-2 = 9.6 / 1e9

#quantity-table(
  [*Inductor value (measured)*], $L approx #unit-mH(L-measured-2 * 1000)$,
  [*Capacitor value (measured)*], $C approx #unit-nF(C-measured-2 * 1e9)$
)

Since $f_d prop omega_d prop 1 slash sqrt(L)$, decreasing $L$ while keeping $C$ the same should increase the oscillation frequency of the circuit. The half-life should decrease, since $t_(1 slash 2) prop L$.

Calculating the new theoretical oscillation frequency gives:

#let damped-ang-freq-2 = damped-ang-freq(L-measured-2, R-total, C-measured-2)
#let damped-freq-2 = damped-ang-freq-2 / (2 * calc.pi)
#let half-life-2 = (2 * L-measured-2 * calc.ln(2)) / R-total

$
  f_d = omega_d / (2 pi) = 1/(2pi) sqrt(1/(L C) - R^2/(4L^2)) approx #unit-Hz(damped-freq-2, digits: 0).
$

Calculating the new theoretical half-life gives:
$
  t_(1 slash 2) = (2 L ln 2)/R approx #unit-ms(half-life-2 * 1000, digits: 4) = #unit-us(half-life-2 * 1e6, digits: 1).
$

Indeed, the oscillation frequency has increased and the half-life has decreased.

#let f2 = 27778
#let t2 = 0.068 / 1000

#let perror-freq-2 = calc.abs(f2 - damped-freq-2) / damped-freq-2 * 100
#let perror-half-life-2 = calc.abs(t2 - half-life-2) / half-life-2 * 100

#table(
  columns: (0.8fr, 0.5fr, 1fr, 0.4fr),
  table.header[][*Theoretical*][*Experimental*][*% Error*],
  [*Oscillation Frequency, $f$*], 
  unit-Hz(damped-freq-2, digits: 0), 
  [
    $T = (#unit-div(1.8))(#unit-us-per-div(20)) = #unit-us(1.8 * 20)$ \
    $f = 1 slash T = #unit-Hz(1 / (1.8 * 20 * 1e-6), digits: 0)$
  ],
  $#nfmt(perror-freq-2)%$,
  [*Half life, $t_(1 slash 2)$*], 
  unit-us(half-life-2 * 1000000, digits: 1), 
  [
    $(#unit-div(3.4))(#unit-us-per-div(20)) = #unit-us(3.4 * 20)$
  ],
  $#nfmt(perror-half-life-2)%$,
)

== Case 2: Original $L$, Increased  $C$

#let L-measured-3 = 22.8 / 1000
#let C-measured-3 = 0.1 / 1e6

#quantity-table(
  [*Inductor value (measured)*], $L approx #unit-mH(L-measured-3 * 1000)$,
  [*Capacitor value (measured)*], $C approx #unit-nF(C-measured-3 * 1e9, digits: 0)$
)

Since $f_d prop omega_d prop 1 slash sqrt(C)$, increasing $C$ while keeping $L$ the same should decrease the oscillation frequency of the circuit. The half-life should not change, since $t_(1 slash 2)$ does not depend on $C$.

#let damped-ang-freq-3 = damped-ang-freq(L-measured-3, R-total, C-measured-3)
#let damped-freq-3 = damped-ang-freq-3 / (2 * calc.pi)

$
  f_d = omega_d / (2 pi) = 1/(2pi) sqrt(1/(L C) - R^2/(4L^2)) approx #unit-Hz(damped-freq-3, digits: 0).
$

Calculating the new theoretical half-life gives:

#let half-life-3 = (2 * L-measured-3 * calc.ln(2)) / R-total
$
  t_(1 slash 2) = (2 L ln 2)/R approx #unit-ms(half-life-3 * 1000, digits: 4) = #unit-us(half-life-3 * 1e6, digits: 1).
$

#let f3 = 3125
#let t3 = 0.24 / 1000

#let perror-freq-3 = calc.abs(f3 - damped-freq-3) / damped-freq-3 * 100
#let perror-half-life-3 = calc.abs(t3 - half-life-3) / half-life-3 * 100

#table(
  columns: (0.8fr, 0.5fr, 1fr, 0.4fr),
  table.header[][*Theoretical*][*Experimental*][*% Error*],
  [*Oscillation Frequency, $f$*], 
  unit-Hz(damped-freq-3, digits: 0), 
  [
    $T = (#unit-div(1.6))(#unit-us-per-div(200)) = #unit-us(3.2 * 100)$ \
    $f = 1 slash T = #unit-Hz(1 / (1.6 * 200 * 1e-6), digits: 0)$
  ],
  $#nfmt(perror-freq-3)%$,
  [*Half life, $t_(1 slash 2)$*], 
  unit-us(half-life-3 * 1000000, digits: 1), 
  [
    $(#unit-div(1.2))(#unit-us-per-div(200)) = #unit-us(2.4 * 100)$
  ],
  $#nfmt(perror-half-life-3)%$,
)

= Part 3: Finding Critical Resistance using Potentiometer
#lthin

#let R-crit-measured = 2440
#let R-crit-measured-total = R-crit-measured + R-total
#quantity-table(
  [*Inductor value (measured)*], $L approx #unit-mH(L-measured-1 * 1e3)$,
  [*Capacitor value (measured)*], $C approx #unit-nF(C-measured-1 * 1e9)$,
  [*Critical resistance (measured)*], $R_"crit" approx #unit-Ohm(R-crit-measured) + #unit-Ohm(R-total) = #unit-Ohm(R-crit-measured-total)$,
)

With the original $L$ and $C$, the theoretical critical resistance is given by:
$
  R_"crit" = 2 sqrt(L / C) approx #unit-Ohm(2 * calc.sqrt(L-measured-1 / C-measured-1), digits: 1).
$

#let perror-crit-resistance = calc.abs(R-crit-measured-total - 2 * calc.sqrt(L-measured-1 / C-measured-1)) / (2 * calc.sqrt(L-measured-1 / C-measured-1)) * 100

This is a $#nfmt(perror-crit-resistance)%$ error compared to the theoretical critical resistance. 

When $R$ is less than the critical resistance, the circuit is underdamped and the potential across the resistor oscillates. When $R$ is greater than the critical resistance, the circuit is overdamped and the potential across the resistor decays to zero more slowly without oscillating. 

_Note:_ As $R$ nears zero, the decaying effect becomes less apparent, and our circuit begins to model a pure LC circuit, which exhibits SHM.

#pagebreak()

= Conclusion
#lthin

+ In part 1, you were asked to select an appropriate frequency for the square wave. How do you know that you have an appropriate frequency?

  To see a full "damped oscillation" on the oscilloscope, we should
  select a frequency where the period of the square wave is long enough 
  to see the voltage across the resistor decay. We used a period
  of 5 time constants, which is around $T = 5 tau = 10 L slash R = #unit-ms(6.26)$. This corresponds to a frequency of around $f = 1 slash T = #unit-Hz(160)$.

+ In part 3, how do you know when your circuit is underdamped, critically damped, and overdamped?

  When the circuit is underdamped, the potential across the resistor oscillates while decaying. When the circuit is critically damped, the potential across the resistor decays to zero as quickly as possible without oscillating. When the circuit is overdamped, the potential across the resistor decays to zero more slowly without oscillating.

+ In part 3, what happens to the potential across the resistor as the resistance in the circuit is increased from its lowest to its highest value?

  At low resistance values, the potential across the resistor oscillates while decaying. As the resistance increases, the oscillations become less pronounced and the potential decays more slowly. At the critical resistance, the potential decays to zero as quickly as possible without oscillating. Beyond the critical resistance, the potential decays to zero more slowly without oscillating.

+ There are multiple frequencies that are mentioned in this lab. The driven frequency is what you set with the function generator. The oscillation frequency (or the response frequency) is what is observed in the LRC circuit. How are these frequencies related?

  The driven frequency is the frequency of the input signal from the function generator, i.e. how often the voltage source oscillates between "high" and "low". The oscillation frequency is the natural frequency of the LRC circuit, which is determined by the values of $L$, $C$, and $R$. These frequencies are related since we must ensure
  that the driven frequency is low enough to allow us to see the oscillations in the circuit. If the driven frequency is too high, we may not be able to see the oscillations clearly on the oscilloscope, since the voltage across the resistor may not have enough time to decay before the next cycle of the square wave begins.

+ Why does the value of the resistor change the oscillation of the potential? Your answer should include references to the power input to the circuit from the generator, and the power dissipated in the resistor.

  The resistor dissipates power as heat (such power depends on resistance via $P = I^2 R$), which reduces the energy available for oscillation in the circuit. As the resistance increases, more power is dissipated in the resistor, which leads to a faster decay of the oscillations. At low resistance values, the power input from the generator is sufficient to sustain oscillations for a longer period of time, resulting in a slower decay. 