#import "../../helpers/template.typ": *
#import "helpers.typ": *
#import "@preview/unify:0.7.1": unit, qty
#import "@preview/zap:0.5.0"
#import "@preview/cetz:0.4.2"

#show: set_unit_number.with(5)

= Magnetic Fields and Electromagnetism

== Magnetic Fields

- Magnetic fields are produced by moving charges (currents).

- Magnetic fields exert forces on moving charges.

- The magnetic field is represented by the vector $arrow(B)$, measured in _Teslas_ (T).
  - A 1 Tesla magnetic field exerts a force of 1 Newton on a 1 Coulomb point charge moving at $1 "m/s"$ perpendicular to the field. \
    #subtext[$unit("T") = unit("N s / C / m") = unit("kg / s^2 / A")$ in SI base units.]

#pagebreak()

== Magnetism and Moving Charges

#define("Magnetic Force")[
  Let $q$ be a charge moving with velocity $arrow(v)$ in a magnetic field $arrow(B)$. The *magnetic force* $arrow(F)_b$ on the charge is: $
    arrow(F)_b = q arrow(v) times arrow(B).
  $
]
- The magnetic force is always perpendicular to both the velocity of the charge and the magnetic field.

- The magnetic force does no work on the charge, since it is always perpendicular to the velocity of the charge.

- If the charge is moving in a straight line (e.g. a straight wire), then the velocity is constant and we can write the magnetic force as: $
   arrow(F)_b = (q L)/t B sin theta = I L B sin theta.
$
  - Here, $L$ is the length of a wire segment, and if it takes the charge $q$ a time $t$ to pass through the wire segment, then the current $I = q/t$.

  - The magnetic force on a charge moving through a wire segment is proportional to the length of that segment, the current through that segment, and the magnetic field strength.

#define("Lorentz Force Law")[
  The *Lorentz force* $arrow(F)$ on a charge $q$ moving with velocity $arrow(v)$ in both electric and magnetic fields $arrow(E)$ and $arrow(B)$ is: $
    arrow(F) = arrow(F)_e + arrow(F)_b = q arrow(E) + q arrow(v) times arrow(B) = q (arrow(E) + arrow(v) times arrow(B)).
  $
]

The Lorentz force describes how charged particles behave in electromagnetic fields.

== Magnetic Fields of Current-Carrying Wires

#define("Biot-Savart Law")[
  Let $I$ be the current through a wire segment $dd(arrow(ell))$. The magnetic field $dd(arrow(B))$ at a point $P$ due to this wire segment is: $
    dd(arrow(B)) = (mu_0)/(4pi) (I dd(arrow(ell)) times hat(r))/r^2
  $
  where:
  - $mu_0$ is the *permeability of free space*
  - $hat(r)$ is the unit vector from the wire segment to point $P$
  - $r$ is the distance from the wire segment to point $P$

  If a wire is curved in a path $C$, then the total magnetic field at point $P$ is: $
    arrow(B) = (mu_0)/(4pi) integral_C (I dd(arrow(ell)) times hat(r))/r^2.
  $
]

By the definition of the cross product, the magnitude of the magnetic field contribution from the wire segment is: $
  abs(dd(arrow(B))) = dd(B) = (mu_0)/(4pi) (I dd(ell) sin theta)/r^2
$ where $theta$ is the angle between $dd(arrow(ell))$ and $hat(r)$.

#example("Magnetic Field from a Straight Current-Carrying Wire")[
  A long, straight wire carries a current $I$. What is the magnetic field $arrow(B)$ at a point $P$ a distance $r$ away from the wire?

  #lorange

  #grid(
    columns: (3fr, 1.6fr),
    align: (horizon, center),
    [
      #align(center)[
        #cetz.canvas({
          import cetz.draw: *


        })
      ]
    ],
    [
      A long, straight wire carries a current $I$. What is the magnetic field $arrow(B)$ at a point $P$ a distance $r$ away from the wire?
    ]
  )

  Consider a small wire segment $dd(ell)$ at an angle $theta$ from the horizontal axis. The distance from this wire segment to point $P$ is $r / (cos theta)$. Thus, by the Biot-Savart Law: $
    dd(B) = (mu_0)/(4pi) (I dd(ell) sin theta)/(r/(cos theta))^2 = (mu_0 I)/(4pi r^2) dd(ell) sin theta cos^2 theta.
  $

]

#pagebreak()

== Ampere's Law

#define("Ampere's Law")[
  $
    integral.cont_C arrow(B) dot dd(arrow(ell)) = mu_0 I_"enclosed"
  $
]
