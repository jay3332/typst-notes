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
  Lab 11: Faraday's Law
]
#let date = "April 17, 2026"
#let author = "Jaysen Tsao"
#let labmates = "Alex Yue"
#let prof = "Professor Szwerc"
#let course = "PHYS 262"
#let crn = "30949"
#let submission_date = "April 23, 2026"

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

#line(length: 100%, stroke: 0.5pt)

+ _The first graph shows that the magnetic flux has maximum magnitude when the center of the magnet
  is at the center of the loop. What is the induced emf at this instant?_

  The induced emf when the flux reaches its maximum is #unit-V(0). Since the magnetic flux reaches an extremum at this instant, its derivative with respect to time is zero. By Faraday's law, the induced emf is equal to the negative rate of change of magnetic flux, so the emf is zero at this instant. Alternatively, we can reason that at this instant, the magnetic flux through the loop goes from increasing to decreasing in magnitude, so there is a point at which the flux is not changing at all, which is where the emf is zero.

+ _In the simulation, positive flux corresponds to field lines passing from left to right through the loop.
  Would either of the graphs change if the magnet was turned around and the south pole passed through
  the loop first?_

  The graphs would be flipped. Magnetic field lines on a bar magnet emerge from the north pole and enter the south pole. When the north pole passes through the loop from right to left, the magnetic field emerging from the north pole points from right to left, causing a negative magnetic flux. If we flip the magnet, the south pole would pass through the loop first, and the magnetic field lines would point from left to right, causing a positive magnetic flux. The emf graph would also flip because the emf is proportional to the rate of change of flux.

+ _If the velocity of the magnet is doubled, would the graph of magnetic flux change?_

  The magnetic flux graph would be "compressed" horizontally by a factor of two. That is, the time at which we reach maxmimum magnetic flux magnitude will be #unit-s(2.5) instead of #unit-s(5), and the width of the peak will be half as wide. However, the height of the peak will not change.

+ _Would the graph of induced emf change?_

  The emf graph would also be compressed horizontally by a factor of two, but it would also be stretched vertically by a factor of two. This is because the emf is proportional to the rate of change of flux, so doubling the velocity doubles the slope of the flux graph at every point, doubling the emf.

  Sketch of graphs for answers to questions 3 and 4:

#align(center, image("lab-11-0.png", height: 160pt))

#pagebreak()

= Part 1: Time-dependent Magnetic Flux from Permanent Magnet Dropped through a Coil of Wire
#lthin

== Data Table

#let rawdata = (
  // (magnet number, pole down, drop height (cm), 
  //  peak1 (V), area1 (Wb), peak2 (V), area2 (Wb))
  (1, $N$, 2, 3.454, 0.2630, -5.508, -0.2674),
  (1, $S$, 2, -3.207, -0.2645, 5.392, 0.2664),
  (1, $N$, 10, 4.667, 0.2670, -6.250, -0.2662),
  (2, $N$, 2, 1.168, 0.05740, -1.461, -0.05781),
  (2, $S$, 2, -1.045, -0.06926, 1.522, 0.06893),
  (2, $N$, 10, 2.325, 0.06768, -1.485, -0.07021),
)

#table(
  columns: (auto, auto, auto, 30pt, 1fr, 1fr, 30pt, 1fr, 1fr),
  align: center + horizon,
  stroke: 0.5pt,
  
  // Header section
  table.header(
    table.cell(rowspan: 2)[*Magnet*],
    table.cell(rowspan: 2)[*Pole Down*],
    table.cell(rowspan: 2)[*Drop Height*],
    table.cell(colspan: 3)[*Peak 1*],
    table.cell(colspan: 3)[*Peak 2*],
    
    // Sub-headers
    $+ thin "/" thin -$, [$abs(varcal(E))_"max"$], [Area],
    $+ thin "/" thin -$, [$abs(varcal(E))_"max"$], [Area],
  ),

  // Data Rows
  ..for row in rawdata {
    let (mag, pole, h, v1, a1, v2, a2) = row
    (
      if mag == 1 [ Strong ] else [ Weak ],
      [#pole], qty(h, 1, unit-cm),
      if v1 >= 0 [ $+$ ] else [ $-$ ], 
      qty(calc.abs(v1), 3, unit-V, mode: "places"), qty(calc.abs(a1), 4, unit-Wb, mode: "places"),
      if v2 >= 0 [ $+$ ] else [ $-$ ], 
      qty(calc.abs(v2), 3, unit-V, mode: "places"), qty(calc.abs(a2), 4, unit-Wb, mode: "places")
    )
   }
)


== Questions

+ _When the magnet is dropped through the coil with the south pole down, why do we see two peaks and why are the two peaks in opposite directions?_

  When the magnet enters the coil, the magnetic flux through the coil increases, so the induced emf 
  opposes this increase in flux, resulting in a negative peak. When the magnet leaves the coil, the magnetic flux through the coil decreases, so the induced emf opposes this decrease in flux, resulting in a positive peak. The two peaks are in opposite directions because they correspond to opposite changes in magnetic flux. 

+ _How do the two peaks change if the magnet is dropped with the north pole down?_

  The two peaks flip, since the magnetic field from the magnet would point in the opposite direction,
  flipping the sign of the magnetic flux and thus the induced emf.

+ _Why is the second peak higher than the incoming peak?_

  Gravity causes the magnet to accelerate as it falls, so the magnet is moving faster when it leaves the coil than when it enters the coil. Since the emf is proportional to the _rate of change_ of flux, and the flux changes more rapidly when the magnet is moving faster, the second peak is higher than the first peak.

+ _What does the area under the curve Potential vs. Time represent?_

  Faraday's law can be rearranged as follows:
  $
    varcal(E) = N dv(Phi_B, t) #h(1em) -> #h(1em) varcal(E) dd(t) = N dd(Phi_B) 
    #h(1em) -> #h(1em) integral varcal(E) dd(t) = N Delta Phi_B.
  $
  The area under a potential vs. time graph is the net change in magnetic flux through the coil as
  the magnet passes through the coil, times the number of turns in the coil. 

+ _Are the two areas the same? Why or why not?_

  The areas enclosed by the two peaks are approximately the same, meaning the net change
  in magnetic flux was zero. This was reflected in our experiment, which makes sense because the magnet
  is not inside our coil before and after every trial, so there should be no change in magnetic flux.

+ _How does the magnitude of the induced EMF depend on the speed of the magnet?_

  The magnitude of the induced emf is directly proportional to the speed of the magnet.

+ _How does the magnitude of the induced EMF depend on the strength of the magnet?_

  The magnitude of the induced emf is directly proportional to the strength of the magnet.

+ _How would the magnitude of the induced EMF change if two magnets were taped together so that:_
  #set enum(numbering: "a.")
  + _both south ends were together?_
    
    Since the magnets face each other in opposite directions, their magnetic fields will cancel each other 
    out. This results in a much weaker magnetic field, which means the magnitude of the induced emf will be much smaller.

  + _south end of one magnet is taped to north end of the other?_

    Since the magnets face each other in the same direction, their magnetic fields will reinforce each other. This results in a much stronger magnetic field, which means the magnitude of the induced emf will be much larger.
  
+ _Would the experiment give similar results if the magnet would be stationary and the coil would be dropped?_

  Yes, the experiment would give similar results. The relative motion between the magnet and the coil is what causes the change in magnetic flux, so it does not matter whether the magnet is moving and the coil is stationary or vice versa.

+ _Using your data and the known geometries, estimate the strength of the magnetic field of the two bar magnets? Assume magnetic field is confined to the magnet. What extra measurements do you need? Compare your estimate with an actual measurement of the magnetic field using the magnetic field sensor._

  From the derivation in (4), the magnetic flux through the coil changes from approximately zero when the magnet is outside the coil to $N Phi_B = integral varcal(E) dd(t)$ when the magnet is fully inside the coil.
  So:
  $
    Phi_B = 1 / N integral varcal(E) dd(t).
  $
  That is, the maximum magnetic flux through the coil is approximated by one of the two peak areas divided by the number of turns in the coil.

  Since the magnetic field is approximately uniform across and perpendicular to the area of the coil, we can assume that $Phi_B approx B A$:
  $
    Phi_B approx B A = 1 / N integral varcal(E) dd(t) #h(1em) -> #h(1em)
    B = 1 / (N A) integral varcal(E) dd(t) = "area enclosed by one peak" / (N A).
  $

  #let primary-N = 3300
  #let primary-diam-m = 0.023
  #let primary-area-m2 = (calc.pi / 4) * primary-diam-m * primary-diam-m
  #let unit-m2 = zi.declare("m^2")
  #let unit-per-m2 = zi.declare("m^-2")
  #let alpha-per-m2 = 1 / (primary-N * primary-area-m2)

  #set-unit(fraction: "power")

  From the additional data in the instructions, we have $N = #primary-N$ 
  and $A = #sci-qty(primary-area-m2, 4, unit-m2)$, so let \
  $alpha = 1 slash (N A) = #qty(alpha-per-m2, 4, unit-per-m2)$.

  #let _strong-entries = rawdata.filter(it => it.at(0) == 1)
  #let avg-peak-area-strong = _strong-entries.map(
    it => calc.abs(it.at(4)) + calc.abs(it.at(6))).sum() / _strong-entries.len() / 2
  #let approx-Bfield-strong-T = alpha-per-m2 * avg-peak-area-strong

  #let _weak-entries = rawdata.filter(it => it.at(0) == 2)
  #let avg-peak-area-weak = _weak-entries.map(
    it => calc.abs(it.at(4)) + calc.abs(it.at(6))).sum() / _weak-entries.len() / 2
  #let approx-Bfield-weak-T = alpha-per-m2 * avg-peak-area-weak

  Then, $B = alpha dot "area enclosed by one peak"$. The average of the six peak areas from the strong magnet
  is approximately #qty(avg-peak-area-strong, 4, unit-Wb), so the estimated magnetic field strength of the strong magnet is:
  $
    B_"strong" approx alpha dot #qty(avg-peak-area-strong, 4, unit-Wb) 
    = #cgreen(qty(approx-Bfield-strong-T, 4, unit-T)).
  $
  The average of the six peak areas from the weak magnet is approximately #qty(avg-peak-area-weak, 4, unit-Wb), so the estimated magnetic field strength of the weak magnet is:
  $
    B_"weak" approx alpha dot #qty(avg-peak-area-weak, 4, unit-Wb) 
    = #cgreen(qty(approx-Bfield-weak-T, 4, unit-T)).
  $
  _Note:_ We were unable to measure the actual strengths of the magnets.

#set-unit(fraction: "inline")

#pagebreak()

= Part 2: Primary and Secondary Coils
#lthin

#let unit-mV = zi.declare("mV")
#let unit-Hz = zi.declare("Hz")

== Induced Voltage, Primary Voltage Fixed

=== Without Iron Core ($mu approx mu_0$)

#let peak-primary-mV = 40
#quantity-table(
  [*Amplitude of Primary Voltage Signal*], $V_0 = #unit-mV(peak-primary-mV)$
)

#let rawdata = (
  // (frequency (Hz), induced voltage (mV))
  (50, 50),
  (200, 180),
  (350, 320),
  (500, 480),
  (650, 600),
  (800, 740),
  (900, 850),
  (1000, 950),  
)
#table(
  columns: (1fr, 1fr),
  align: center + horizon,
  table.header[*Frequency $f$*][*Induced Voltage $varcal(E)_"max"$*],
  ..rawdata.map(r => (
    qty(r.at(0), 1, unit-Hz),
    qty(r.at(1), 3, unit-mV)
  )).flatten(),
)

#let unit-mV-per-Hz = zi.declare("mV/Hz")
#let reg1 = perform-regression(
  rawdata,
  title: "Amplitude of Induced Voltage with Varying Frequency",
  x-label: [Frequency, $f$ (Hz)],
  y-label: [Induced Voltage, $varcal(E)_"max"$ (mV)],
  strategy: slope-regression,
  domain: (0, 1100),
  x-tick: 200,
  y-tick: 200,
  label: reg => [$varcal(E)_"max" = (#qty(reg.slope, 4, unit-mV-per-Hz)) f$],
)

#reg1.plot
#pagebreak()

// iron core
=== With Iron Core ($mu >> mu_0$)

#let peak-primary-mV = 190
#quantity-table(
  [*Amplitude of Primary Voltage Signal*], $V_0 = #unit-mV(peak-primary-mV)$
)

#let rawdata = (
  // (frequency (Hz), induced voltage (mV))
  (50, 800),
  (200, 1300),
  (350, 1500),
  (500, 1600),
  (650, 1650),
  (800, 1700),
  (900, 1725),
  (1000, 1750),  
)

#table(
  columns: (1fr, 1fr),
  align: center + horizon,
  table.header[*Frequency $f$*][*Induced Voltage $varcal(E)_"max"$*],
  ..rawdata.map(r => (
    qty(r.at(0), 1, unit-Hz),
    qty(r.at(1), 3, unit-mV)
  )).flatten(),
)

#let reg2 = perform-regression(
  rawdata,
  title: "Amplitude of Induced Voltage with Varying Frequency",
  x-label: [Frequency, $f$ (Hz)],
  y-label: [Induced Voltage, $varcal(E)_"max"$ (mV)],
  domain: (0, 1100),
  x-tick: 200,
  y-tick: 400,
  y-min: 0,
  label: reg => [$varcal(E)_"max" = (#qty(reg.slope, 4, unit-mV-per-Hz)) f + #qty(reg.intercept, 4, unit-mV)$],
  legend: "inner-south-east",
)
#reg2.plot

#pagebreak()

== Induced Voltage, Frequency Fixed

#let freq-Hz = 500
#quantity-table(
  [*Frequency*], $f = #unit-Hz(freq-Hz)$
)

=== Without Iron Core ($mu approx mu_0$)

#let rawdata = (
  // (peak primary voltage (mV), induced voltage (mV))
  (15, 125),
  (25, 200),
  (50, 400),
  (75, 660),
  (100, 850),  
)

#table(
  columns: (1fr, 1fr),
  align: center + horizon,
  table.header[*Peak Primary Voltage $V_0$*][*Induced Voltage $varcal(E)_"max"$*],
  ..rawdata.map(r => (
    qty(r.at(0), 3, unit-mV),
    qty(r.at(1), 3, unit-mV)
  )).flatten(),
)

#let unitless = zi.declare()
#let reg3 = perform-regression(
  rawdata,
  title: "Amplitude of Induced Voltage with Varying Primary Voltage",
  x-label: [Peak Primary Voltage, $V_0$ (mV)],
  y-label: [Induced Voltage, $varcal(E)_"max"$ (mV)],
  strategy: slope-regression,
  domain: (0, 110),
  x-tick: 20,
  y-tick: 200,
  label: reg => [$varcal(E)_"max" = #qty(reg.slope, 4, unitless) V_0$],
)

#reg3.plot

#pagebreak()

=== With Iron Core ($mu >> mu_0$)

#let rawdata = (
  // (peak primary voltage (mV), induced voltage (mV))
  (15, 130),
  (25, 230),
  (50, 460),
  (75, 730),
  (100, 925),  
)

#table(
  columns: (1fr, 1fr),
  align: center + horizon,
  table.header[*Peak Primary Voltage $V_0$*][*Induced Voltage $varcal(E)_"max"$*],
  ..rawdata.map(r => (
    qty(r.at(0), 3, unit-mV),
    qty(r.at(1), 3, unit-mV)
  )).flatten(),
)

#let reg4 = perform-regression(
  rawdata,
  title: "Amplitude of Induced Voltage with Varying Primary Voltage",
  x-label: [Peak Primary Voltage, $V_0$ (mV)],
  y-label: [Induced Voltage, $varcal(E)_"max"$ (mV)],
  domain: (0, 110),
  x-tick: 20,
  y-tick: 200,
  strategy: slope-regression,
  label: reg => [$varcal(E)_"max" = #qty(reg.slope, 4, unitless) V_0$],
)

#reg4.plot

#pagebreak()

== Questions

+ _Derive an expression for the magnetic flux in the primary/inner coil._

  Let $f$ be the frequency of the function generator, so $omega = 2pi f$ is the angular frequency of the potential.
  Let $V_0$ be the amplitude of the potential created by the function generator.

  The function generator creates a potential $V(t)$ which follows:
  $
    V(t) = V_0 sin(omega t) = V_0 sin(2pi f t).
  $

  Let the primary solenoid have turn density $n_1$, resistance $R$, and cross-sectional area $A$.
  To account for the possibility of an iron core, we will also include the relative permeability $mu_r$ of the core in our expression for the magnetic field.

  The current through the primary coil is given by Ohm's law:
  $
    I(t) = V(t) / R = (V_0 sin(2pi f t)) / R.
  $

  The magnetic field inside the solenoid is:
  $
    B(t) = mu_r mu_0 n_1 I(t) = (mu_r mu_0 n_1 V_0 sin(2pi f t)) / R.
  $

  The magnetic flux through one turn of the coil is:
  $
    Phi_B (t) = B(t) A = (mu_r mu_0 n_1 A V_0 sin(2pi f t)) / R.
  $

  Since we are given $n_1 = N_1 slash varell$, where $N_1$ is the number of turns and $varell$ is the length of the solenoid, we can rewrite the magnetic flux as:
  $
    Phi_B (t) = cgreen((mu_r mu_0 A N_1 V_0 sin(2pi f t)) / (varell R)).
  $

+ _Use the expression from (1) to derive an expression for the induced emf in the secondary/outer coil._

  The secondary coil will experience the same magnetic flux over its $N_2$ turns, so by Faraday's law, the emf induced in the secondary coil is:
  $
    varcal(E)(t) = N_2 dv(Phi_B, t) = N_2 dv(, t) (mu_r mu_0 n_1 A V_0 sin(omega t)) / R &= (mu_r mu_0 n_1 N_2 A V_0 omega cos(omega t)) / R \
    &= (mu_r mu_0 A N_1 N_2 V_0 2 pi f cos(2pi f t)) / (varell R) \
    &= (2 pi mu_r mu_0 A N_1 N_2 V_0 f cos(2pi f t)) / (varell R).
  $

  This means the amplitude of the induced emf is:
  $
    varcal(E)_"max" = cgreen((2 pi mu_r mu_0 A N_1 N_2 V_0 f) / (varell R)).
  $

#pagebreak()

3. _Use the expression from (2) to interpret the two graphs you produced in Part 2._

  In the first phase, we fixed the amplitude of the primary voltage $V_0$ while varying the frequency $f$. From the expression in (2), we see that the
  amplitude of the induced voltage $varcal(E)_"max"$ is directly proportional to the frequency $f$, which means the best fit line for the first two graphs should approximate:
  $
    "slope" approx (2 pi mu_r mu_0 A N_1 N_2 V_0) / (varell R).
  $

  In the second phase, we fixed the frequency $f$ while varying the amplitude of the primary voltage $V_0$. From the expression in (2), we see that the amplitude of the induced voltage $varcal(E)_"max"$ is directly proportional to the amplitude of the primary voltage $V_0$, which means the best fit line for the second two graphs should approximate:
  $
    "slope" approx (2 pi mu_r mu_0 A N_1 N_2 f) / (varell R).
  $

  Finally, we see that $varcal(E)_max$ is also directly proportional to the relative permeability $mu_r$, which is why the induced voltage is much higher with the iron core than without the iron core.

+ _Does the data from your measurements match your theoretical expressions?_

  #let d-inner-m = 0.018
  #let A-inner-m = (calc.pi / 4) * d-inner-m * d-inner-m
  #let primary-N = 150
  #let secondary-N = 3300
  #let resistance-Ohm = 0.4
  #let length-m = 0.11
  
  For all calculations below, use the following values:
  - $A = pi r_"inner"^2 = pi d_"inner"^2 slash 4 = #sci-qty(A-inner-m, 4, unit-m2)$
  - $N_1 = #primary-N$
  - $N_2 = #secondary-N$
  - $R = #qty(resistance-Ohm, 2, unit-Ohm)$
  - $varell = #qty(length-m, 2, unit-m)$

  #let ppv-mV = 40
  #let mu0 = 4 * calc.pi * 1e-7
  #let slope1-theoret = (2 * calc.pi * mu0 * A-inner-m * primary-N * secondary-N * ppv-mV) / (length-m * resistance-Ohm)
  #let percent-error = calc.abs(slope1-theoret - reg1.slope) / slope1-theoret * 100

  For the first graph, the primary voltage was fixed at $V_0 = #unit-mV(ppv-mV)$.
  Since no iron core was used, we can assume $mu_r approx 1$. The theoretical slope is:
  $
    "slope" approx (2 pi mu_r mu_0 A N_1 N_2 V_0) / (varell R) 
    = #qty(slope1-theoret, 4, unit-mV-per-Hz).
  $
  The slope of the best fit line was approximately #qty(reg1.slope, 4, unit-mV-per-Hz).  
  This is a percent error of approximately #nfmt(percent-error, digits: 2)%, which means 
  the data matches the theoretical expression in (3) very well.

  #let freq-Hz = 500
  #let slope3-theoret = (2 * calc.pi * mu0 * A-inner-m * primary-N * secondary-N * freq-Hz) / (length-m * resistance-Ohm)
  #let percent-error3 = calc.abs(slope3-theoret - reg3.slope) / slope3-theoret * 100

  For the third graph, the frequency was fixed at $f = #unit-Hz(freq-Hz)$.
  Since no iron core was used, we can assume $mu_r approx 1$. The theoretical slope is:
  $
    "slope" approx (2 pi mu_r mu_0 A N_1 N_2 f) / (varell R) 
    = #nfmt(slope3-theoret, digits: 2).
  $
  The slope of the best fit line was approximately #nfmt(reg3.slope, digits: 2).
  This is a percent error of approximately #nfmt(percent-error3, digits: 2)%, which means 
  the data matches the theoretical expression in (3). This is a relatively good match.

  For the second and fourth graphs, since we are not given the exact $mu_r$ of the iron core, we cannot calculate a theoretical slope to compare to our data. However, we can see that the slopes of the second and fourth graphs are much higher than the slopes of the first and third graphs, which is consistent with our theoretical expression in (3) since $mu_r$ is much greater than 1 for an iron core.