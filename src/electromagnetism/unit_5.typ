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

#pagebreak()

== Magnetic Fields and Magnetic Force

- Magnetic fields are produced by moving charges (currents). They exert forces on moving charges.
  - _Moving charges create magnetic fields. Magnetic fields exert forces on moving charges. This is the fundamental principle of electromagnetism._

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

=== Magnetic Force on Current-Carrying Wires

- If charge is moving in a straight line (e.g. a straight wire), then the velocity is constant and we can write the magnetic force as: $
   arrow(F)_b = (q arrow(L))/t times arrow(B) = I arrow(L) times arrow(B).
$
  - Here, $arrow(L)$ is the length of a wire segment, and if it takes the charge $q$ a time $t$ to pass through the wire segment, then the current $I = q slash t$.

  - The magnetic force on a charge moving through a wire segment is proportional to the length of that segment, the current through that segment, and the magnetic field strength.

  - For a wire that isn't straight, we can divide the wire into tiny segments of length $dd(arrow(s))$ to get:
    $
      dd(arrow(F)_b) = I dd(arrow(s)) times arrow(B) #h(1em) -> #h(1em) arrow(F)_b = integral_C I dd(arrow(s)) times arrow(B).
    $

- A *coil* has no net magnetic force on it, since the magnetic forces on opposite sides of the coil cancel each other out ($display(integral.cont I dd(arrow(s)) times arrow(B)) = 0$). However, a coil can still _produce_ a magnetic field.

- A *solenoid* is a long coil of wire (a wire formed from multiple coils). The magnetic field inside a solenoid is approximately uniform and parallel to the axis of the solenoid, while the magnetic field outside a solenoid is weak and non-uniform.

=== Magnetic Flux and Gauss's Law for Magnetism

#define("Magnetic Flux")[
  The *magnetic flux* $Phi_B$ through a surface $S$ is defined as: $
    Phi_B = integral.double_S arrow(B) dot dd(arrow(A)).
  $
]

- The magnetic flux through a surface is a measure of the amount of magnetic field passing through that surface.

- The units of magnetic flux are Webers (Wb), where $1 "Wb" = 1 "T" "m"^2$.

- The magnetic flux through a closed surface is always zero, since magnetic field lines form closed loops. This is known as *Gauss's Law for Magnetism*: $
    integral.surf_S arrow(B) dot dd(arrow(A)) = 0 #h(1em) -> #h(1em) grad dot arrow(B) = 0 "by the Divergence Theorem".
  $

#pagebreak()

== Magnetic Dipoles

- _Recall:_ an electric dipole consists of two equal and opposite charges separated by a small distance.

- Unlike charges which can exist independently, magnetic poles always come in pairs #footnote[Although we aren't able to _disprove_ magnetic monopoles, none have been discovered.] (north and south). Thus, all magnets are *magnetic dipoles*.

- The magnetic field of a magnetic dipole is similar to the electric field of an electric dipole, but with some differences:

  - The magnetic field lines of a magnetic dipole form closed loops, while the electric field lines of an electric dipole start at the positive charge and end at the negative charge.
  
  - The magnetic field of a magnetic dipole decreases with distance by the cube ($B prop 1 slash r^3$), while the electric field of an electric dipole decreases with distance by the square ($B prop 1 slash r^2$).

- The *magnetic dipole moment* $arrow(mu)$ of a magnetic dipole is a vector that points from the south pole to the north pole.

  In a region enclosed by a current-carrying coil with area $A$, the magnetic dipole moment is:
  $
    arrow(mu) = I A hat(n) = I underbrace(arrow(A), A hat(n)).
  $
  where:
  - $I$ is the current through the coil
  - $A$ is the area of the coil
  - $hat(n)$ is the unit vector perpendicular to the plane of the coil, pointing in the direction given by the right-hand rule (curl your hands in the direction of current, and your thumb will point in $hat(n)$)

  For a solenoid with $N$ loops, the magnetic dipole moment is: $
    arrow(mu) = N I arrow(A).
  $

- A magnetic field exerts a torque $arrow(tau)$ on a magnetic dipole: $
    arrow(tau) = arrow(mu) times arrow(B).
  $
  The magnetic dipole will experience a torque that tends to align it with the magnetic field. 
  
  This means that there is the potential for work to be done to align a magnetic dipole with a magnetic field, given by the potential energy $U_mu$ of the dipole:
  $
    U_mu = -arrow(mu) dot arrow(B).
  $

In summary,
- if we place a current-carrying coil in a magnetic field, it will experience a torque that tends to align it with the field.
- the potential energy associated with this dipole is the work required to align the dipole with the field.

#pagebreak()

== Biot-Savart Law

Whereas the formulas above allow us to find the magnetic force on a moving charge in an _existing_ magnetic field (the first part of electromagnetism), moving charges also create their _own_ magnetic fields (the second part of electromagnetism). 

The *Biot-Savart Law* allows us to calculate the magnetic field _created_ by a moving charge or current.

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

  For point charge $q$ with velocity $arrow(v)$, the Biot-Savart Law can be simplified as: $
    arrow(B) = (mu_0)/(4pi) (q arrow(v) times hat(r))/r^2.
  $
]

By the definition of the cross product, the magnitude of the magnetic field contribution from the wire segment is: $
  abs(dd(arrow(B))) = dd(B) = (mu_0)/(4pi) (I dd(s) sin theta)/r^2
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

== Ampere's Law

The Biot-Savart Law allows us to calculate the magnetic field created by a current, but it can be difficult to apply in practice.

*Ampere's Law* provides an alternative way to calculate magnetic fields, especially for cases with high symmetry.

#define("Ampere's Law")[
  $
    integral.cont_C arrow(B) dot dd(arrow(s)) = mu_0 I_"enclosed"
  $
  where:
  - $C$ is a closed, often imaginary loop (called an *Amperian loop*)
  - $I_"enclosed"$ is the current passing through the area enclosed by loop $C$
]

#example("Magnetic field produced by a straight current-carrying wire")[
  A long, straight wire with radius $R$ carries a current $I$. What is the magnetic field $arrow(B)$ at a point $P$ a distance $r$ away from the center of the wire?

  #lorange

  Create a circular Amperian loop of radius $r > R$ centered on the wire. By symmetry, the magnetic field $arrow(B)$ has the same magnitude at every point on the loop and is tangent to the loop, so $B$ is constant.
  
  Thus, by Ampere's Law: $
    integral.cont_C arrow(B) dot dd(arrow(s)) = B integral.cont_C dd(s) = B (2pi r) = mu_0 I.
  $
  Solving for $B$ gives: $
    cgreen(B = (mu_0 I)/(2pi r)) "for" r > R.
  $
  This is the same result we would get from the Biot-Savart Law, but Ampere's Law is much easier to apply in this case due to the symmetry of the problem. 

  Ampere's Law also allows us to find the magnetic field inside the wire (where $r < R$), which is: $
    cgreen(B = (mu_0 I r)/(2pi R^2)) "for" r < R.
  $
]

#pagebreak()

=== Magnetic Fields of Solenoids

- A solenoid is a wire formed from multiple coils, called *turns*. 
  - The magnetic field inside a solenoid is approximately uniform and parallel to the axis of the solenoid
  - The magnetic field outside a solenoid is weak and non-uniform.

- The magnetic field _inside_ a solenoid with current $I$ can be calculated using Ampere's Law: 
  - Consider a rectangular Amperian loop that extends inside and outside the solenoid.

  - The magnetic field outside the solenoid is negligible, so the contribution to the line integral from the outside part of the loop is approximately zero.

  - The magnetic field inside the solenoid is approximately uniform, so the contribution to the line integral from the inside part of the loop is approximately $B L$, where $L$ is the length of the section of the Amperian loop that is inside the solenoid.

  - Along the sides, the magnetic field is perpendicular to the path of integration, so the contribution to the line integral from the sides is zero.

  - If our loop encloses $N$ turns of the solenoid, then the total current enclosed by the loop is $N I$.

  Thus, by Ampere's Law: $
    integral.cont_C arrow(B) dot dd(arrow(s)) = B L = mu_0 N I #h(1em) -> #h(1em) cgreen(B = (mu_0 N I)/L).
  $ 

- We call $n = N/L$ the number of turns per unit length of the solenoid, called the *turn density*. \
  This allows us to rewrite the formula for the magnetic field inside a solenoid as: $
    cgreen(B = mu_0 n I).
  $