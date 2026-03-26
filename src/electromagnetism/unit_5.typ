#import "../../helpers/template.typ": *
#import "helpers.typ": *
#import "@preview/unify:0.7.1": unit, qty
#import "@preview/zap:0.5.0"
#import "@preview/cetz:0.4.2"

#show: set_unit_number.with(5)

= Magnetic Fields and Electromagnetism

== Introduction to Magnetism

- Magnetism is a fundamental force of nature that arises from the motion of electric charges. 

- Magnetic fields are produced by moving charges (currents) and exert forces on other moving charges.

- There are two types of magnetic materials: 
  - *ferromagnetic* materials (e.g. iron) can be permanently magnetized
  - *paramagnetic* (or _diamagnetic_) materials are only weakly attracted or repelled by magnetic fields.

- A *magnet* is an object that produces a magnetic field. All magnets (that we know of) have two poles: a *north pole* and a *south pole*. 
  - Like poles repel each other, while opposite poles attract each other.
  - The magnetic field lines of a magnet form *closed loops* from the north pole to the south pole.

- The Earth itself is a magnet. Technically, the Earth's North pole is a magnetic south pole, for the north end of a compass needle is attracted to it.

== Magnetic Fields and Magnetic Force

- Magnetic fields are produced by moving charges (currents). They exert forces on moving charges.

- The magnetic field is represented by the vector $arrow(B)$, measured in _Teslas_ (T).
  - A 1 Tesla magnetic field exerts a force of 1 Newton on a 1 Coulomb point charge moving at $1 "m/s"$ *perpendicular* to the field. \
    #subtext[$unit("T") = unit("N s / C / m") = unit("kg / s^2 / A")$ in SI base units.]

- The direction of the magnetic field is the direction in which the north pole of a compass needle would point if placed in the field. 

- *Magnetic field lines* are a visual representation of the magnetic field.
  - The direction of the magnetic field at any point is tangent to the magnetic field line at that point
  - Stronger magnetic fields have more closely spaced field lines.
  - _Unlike_ electric field lines, magnetic field lines form _closed loops_!
    - _Outside_ of a bar magnet, magnetic field lines point from the north pole to the south pole.
    - _Inside_ of a bar magnet, magnetic field lines point from the south pole to the north pole.

#define("Magnetic Force")[
  Let $q$ be a charge moving with velocity $arrow(v)$ in a magnetic field $arrow(B)$. \ The *magnetic force* $arrow(F)_b$ on the charge is: $
    arrow(F)_b = q arrow(v) times arrow(B).
  $
]
- The magnetic force is always perpendicular to both the velocity of the charge and the magnetic field.

- The magnetic force does no work on the charge, since it is always perpendicular to the velocity of the charge.

- If the charge is moving in a straight line (e.g. a straight wire), then the velocity is constant and we can write the magnetic force as: $
   arrow(F)_b = (q arrow(L))/t times arrow(B) = I arrow(L) times arrow(B).
$
  - Here, $arrow(L)$ is the length of a wire segment, and if it takes the charge $q$ a time $t$ to pass through the wire segment, then the current $I = q slash t$.

  - The magnetic force on a charge moving through a wire segment is proportional to the length of that segment, the current through that segment, and the magnetic field strength.

  - For a wire that isn't straight, we can divide the wire into tiny segments of length $dd(arrow(s))$ to get:
    $
      dd(arrow(F)_b) = I dd(arrow(s)) times arrow(B) #h(1em) -> #h(1em) arrow(F)_b = integral_C I dd(arrow(s)) times arrow(B).
    $

- We can also calculate the magnetic force using current density $arrow(J)$: $
  dd(arrow(F)_b) = (arrow(J) times arrow(B)) dd(V) #h(1em) -> #h(1em) arrow(F)_b = integral.triple_E (arrow(J) times arrow(B)) dd(V).
$

#define("Lorentz Force Law")[
  The *Lorentz force* $arrow(F)$ on a charge $q$ moving with velocity $arrow(v)$ in both electric and magnetic fields $arrow(E)$ and $arrow(B)$ is: $
    arrow(F) = arrow(F)_e + arrow(F)_b = q arrow(E) + q arrow(v) times arrow(B) = q (arrow(E) + arrow(v) times arrow(B)).
  $
]

The Lorentz force describes how charged particles behave in electromagnetic fields.

#pagebreak()

== Magnetic Fields of Current-Carrying Wires

#define("Biot-Savart Law")[
  Let $I$ be the current through a small wire segment $dd(arrow(s))$. The magnetic field $dd(arrow(B))$ at a point $P$ due to this wire segment is: $
    dd(arrow(B)) = (mu_0)/(4pi) (I dd(arrow(s)) times hat(r))/r^2
  $
  where:
  - $mu_0$ is the *permeability of free space*
  - $hat(r)$ is the unit vector from the wire segment to point $P$
  - $r$ is the distance from the wire segment to point $P$

  If a wire is curved in a path $C$, then the total magnetic field at point $P$ is: $
    arrow(B) = (mu_0)/(4pi) integral_C (I dd(arrow(s)) times hat(r))/r^2.
  $
]

By the definition of the cross product, the magnitude of the magnetic field contribution from the wire segment is: $
  abs(dd(arrow(B))) = dd(B) = (mu_0)/(4pi) (I dd(arrow(s)) sin theta)/r^2
$ where $theta$ is the angle between $dd(arrow(s))$ and $hat(r)$.

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

== Magnetic Dipoles

- _Recall:_ an electric dipole consists of two equal and opposite charges separated by a small distance.

- Unlike charges which can exist independently, magnetic poles always come in pairs #footnote[Although we aren't able to _disprove_ magnetic monopoles, none have been discovered.] (north and south). Thus, all magnets are *magnetic dipoles*.

- The magnetic field of a magnetic dipole is similar to the electric field of an electric dipole, but with some differences:

  - The magnetic field lines of a magnetic dipole form closed loops, while the electric field lines of an electric dipole start at the positive charge and end at the negative charge.
  
  - The magnetic field of a magnetic dipole decreases with distance by the cube ($B prop 1 slash r^3$), while the electric field of an electric dipole decreases with distance by the square ($B prop 1 slash r^2$).

- The *magnetic dipole moment* $arrow(mu)$ of a magnetic dipole is a vector that points from the south pole to the north pole. 

== Ampere's Law

#define("Ampere's Law")[
  $
    integral.cont_C arrow(B) dot dd(arrow(ell)) = mu_0 I_"enclosed"
  $
]
