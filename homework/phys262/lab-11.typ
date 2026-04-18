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
  Lab 11: Faraday's Law
]
#let date = "April 17, 2026"
#let author = "Jaysen Tsao"
#let labmates = "xxx"
#let prof = "Professor Szwerc"
#let course = "PHYS 262"
#let crn = "30949"
#let submission_date = "April xx, 2026"

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

== Questions

+ When the magnet is dropped through the coil with the south pole down, why do we see two peaks and why are the two peaks in opposite directions?

+ How do the two peaks change if the magnet is dropped with the north pole down?

+ Why is the second peak higher than the incoming peak?

+ What does the area under the curve Potential vs. Time represent?

+ Are the two areas the same? Why or why not?

+ How does the magnitude of the induced EMF depend on the speed of the magnet?

+ How does the magnitude of the induced EMF depend on the strength of the magnet?

+ How would the magnitude of the induced EMF change it two magnets were taped together so that:
  #set enum(numbering: "a.")
  + both south ends were together?
  + south end of one magnet is taped to north end of the other?
  
+ Would the experiment give similar results if the magnet would be stationary and the coil would be dropped?

+ Using your data and the known geometries, estimate the strength of the magnetic field of the two bar magnets? Assume magnetic field is confined to the magnet. What extra measurements do you need? Compare your estimate with an actual measurement of the magnetic field using the magnetic field sensor.

#pagebreak()

= Part 2: Primary and Secondary Coils
#lthin

== Magnetic Flux Derivation

Let $f$ be the frequency of the function generator, so $omega = 2pi f$ is the angular frequency of the potential.
Let $V_0$ be the amplitude of the potential created by the function generator.

The function generator creates a potential $V(t)$ which follows:
$
  V(t) = V_0 sin(omega t) = V_0 sin(2pi f t).
$

Let the primary solenoid have turn density $n_1$, resistance $R$, and cross-sectional area $A$.

The current through the primary coil is given by Ohm's law:
$
  I(t) = V(t) / R = (V_0 sin(2pi f t)) / R.
$

The magnetic field inside the solenoid is:
$
  B(t) = mu_0 n_1 I(t) = (mu_0 n_1 V_0 sin(2pi f t)) / R.
$

The magnetic flux through one turn of the coil is:
$
  Phi_B (t) = B(t) A = (mu_0 n_1 A V_0 sin(2pi f t)) / R.
$

Since we are given $n_1 = N_1 slash L$, where $N_1$ is the number of turns and $L$ is the length of the solenoid, as well as $A = pi r^2$ for the cross-sectional area (our solenoid is circular with radius $r$), we can rewrite the magnetic flux as:
$
  Phi_B (t) = cgreen((mu_0 pi r^2 N_1 V_0 sin(2pi f t)) / (L R)).
$

== Questions

+ Write the expression for the magnetic flux in the primary/inner coil.

+ Use the expression from (1) to derive an expression for the induced emf in the secondary/outer coil.

  The secondary coil will experience the same magnetic flux over its $N_2$ turns, so by Faraday's law, the emf induced in the secondary coil is:
  $
    varcal(E)(t) = -N_2 dv(Phi_B, t) = -N_2 dv(, t) (mu_0 n_1 A V_0 sin(omega t)) / R &= - (mu_0 n_1 N_2 A V_0 omega cos(omega t)) / R \
    &= - (mu_0 pi r^2 N_1 N_2 V_0 2 pi f cos(2pi f t)) / (L R) \
    &= cgreen(-(2 mu_0 pi^2 r^2 N_1 N_2 V_0 f cos(2pi f t)) / (L R)).
  $

+ Use the expression from (2) to interpret the two graphs you produced in Part II.

+ Does the data from your measurements match your theoretical expressions?