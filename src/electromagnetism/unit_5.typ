#import "../../helpers/template.typ": *
#import "helpers.typ": inline-circuit, battery
#import "@preview/unify:0.7.1": unit, qty
#import "@preview/zap:0.5.0"
#import "@preview/cetz:0.4.2"

#show: set_unit_number.with(5)
#show math.ell: varell

= Electromagnetic Induction

== Magnetic Flux and Faraday's Law

=== Magnetic Flux <mflux>

#define("Magnetic Flux")[
  The *magnetic flux* $Phi_B$ through a surface $S$ is defined as: $
    Phi_B = integral.double_S arrow(B) dot dd(arrow(A)).
  $
]

- The magnetic flux through a surface is a measure of the amount of magnetic field passing through that surface.

- The units of magnetic flux are Webers (Wb), where $1 "Wb" = 1 "T" "m"^2$.

#import "@preview/ouset:0.2.0": underset

#define("Gauss' Law for Magnetism")[
  The magnetic flux through a closed surface is always zero, since magnetic field lines form closed loops. This is known as *Gauss's Law for Magnetism*: 
  $
    underset(Phi_B, "closed" \ "surface") = integral.surf_S arrow(B) dot dd(arrow(A)) = 0 #h(1em) -> #h(1em) grad dot arrow(B) = 0 "by the Divergence Theorem".
  $

  This is one of Maxwell's Equations.
]

=== Faraday's Law of Induction

- When the magnetic flux through a loop of current changes, current begins flowing in the loop.
  This phenomenon is called *electromagnetic induction*, and the current that flows is *induced current*.

- The effective electromotive force $varcal(E)$ that would have caused the induced current is called the
  *induced electromotive force* (or just _induced emf_). 
  - That is, if the induced current is $I$ and the resistance of the loop is $R$, then $varcal(E) = I R$.
  - If the loop has $N$ turns, then the total induced emf is the sum of the emf from each turn: $varcal(E) = N I R$.

- Michael Faraday that this induced emf is proportional to the rate of change of magnetic flux through the loop. This is known as *Faraday's Law of Induction*:
  $ abs(varcal(E)) = abs(dv(Phi_B, t)). $

  If our loop has $N$ turns, then we must consider each of the turns: $ abs(varcal(E)) = N abs(dv(Phi_B, t)). $

- The induced current always flows in a direction that opposes the change in magnetic flux. That is, the induced current will create its own magnetic field to oppose the change. This is known as *Lenz's Law*.

  - For example, if the magnetic flux through a loop is increasing, then the induced current will create a magnetic field that would decrease the flux.

  - If the magnetic flux through a loop is decreasing, then the induced current will create a magnetic field that would increase the flux.

  - A negative sign is used in Faraday's Law of Induction to indicate this opposition: $ varcal(E) = -N dv(Phi_B, t). $

#define("Faraday's Law of Induction")[
  Let a coil with $N$ turns be placed in a magnetic field such that its flux through the coil is $Phi_B (t)$.
  Then the _induced emf_ $varcal(E)$ in the coil is given by *Faraday's Law of Induction*:
  $
    varcal(E) = -N dv(Phi_B, t).
  $
  The negative sign is described by *Lenz's Law*. 
]

=== Induced Electric Fields

If an emf is induced in a circuit, then there is work being done on charges in the circuit. Since magnetic forces do no work on charges, the work must be done by an electric field. Thus, there must be an *induced electric field*  in the circuit that causes the induced current to flow.

The work done by the induced electric field to move a unit charge $q$ around the coil is: $ W = integral.cont_"coil" q arrow(E) dot dd(arrow(ell)). $

By the definition of emf:
 $ varcal(E) = W/q = integral.cont_"coil" arrow(E) dot dd(arrow(ell)). $ 


This allows us to rewrite Faraday's Law as:
$
  integral.cont_"coil" arrow(E) dot dd(arrow(ell)) = -N dv(Phi_B, t).
$

For a coil with $N=1$ turn, we can expand the magnetic flux as follows:
$
  integral.cont_"coil" arrow(E) dot dd(arrow(ell)) = -dv(, t) integral.double_S arrow(B) dot dd(arrow(A)).
$
#rsubtext[where $S$ is the surface enclosed by the coil.]

In a general sense, $arrow(B)$ and consequently $Phi_B$ 
can vary not only with time but also with position, so
it is more accurate to use a partial time derivative instead:
$
  integral.cont_"coil" arrow(E) dot dd(arrow(ell)) = -pdv(, t) integral.double_S arrow(B) dot dd(arrow(A)).
$

This is the *integral form* of Faraday's Law of Induction, which is one of Maxwell's Equations. We can also write it in *differential form* using Stokes' Theorem:
$
  grad times arrow(E) = -pdv(arrow(B), t).
$

#define("Faraday's Law of Induction (Integral and Differential Forms)")[
  Let $C$ be a closed curve representing a loop of current, 
  and let $S$ be a surface enclosed by $C$. Then Faraday's Law of Induction can be expressed in two equivalent forms:
  $
    integral.cont_C arrow(E) dot dd(arrow(ell)) &= -integral.double_S pdv(arrow(B), t) dot dd(arrow(A)). & #h(2em) bf("(integral form)") \

    grad times arrow(E) &= - pdv(arrow(B), t). & #h(2em) bf("(differential form)") \
  $
]

=== Eddy Currents

So far we have considered conductors shaped like wires, where induced currents are confined to a one-dimensional path. But if a _bulk_ (extended) conductor moves through a non-uniform magnetic field -- or sits in a time-varying one -- the induced emfs drive closed loops of current _within the body of the conductor itself_. These are called *eddy currents*.

By Lenz's Law, eddy currents flow in whichever direction opposes the change in flux that produced them. 

In other words, _a changing magnetic flux through a bulk conductor induces eddy currents, which are small, isolated loops of current that create magnetic fields to oppose the change in flux._

#pagebreak()

== Motional Electromotive Force

When a conductor moves through a magnetic field #footnote[or, the magnetic field can be moving relative to the conductor.], the magnetic flux through the conductor can change, which induces an emf in the conductor. This is known as *motional emf*.

In this way, a potential difference is created across the conductor, allowing us to treat the conductor as a circuit element with an emf. _By moving a conductor through a magnetic field, we convert mechanical energy into electrical energy!_

Recall that the fundamental definition of emf is the work done per unit charge to move a charge around a closed loop, $varcal(E) = W slash q$. In the case of motional emf, the work is done by the _magnetic force_ #footnote[It is true that magnetic force can _never_ do work on moving charges, but in this case the conductor itself is moving. That is, the magnetic force does mechanical work on the conductor, and the energy gained from that work is converted into electrical energy (the actual EMF).] on the conductor as it moves through the magnetic field:
$
  varcal(E) = W/q = 1/q integral.cont_"loop" arrow(F)_b dot dd(arrow(ell)) 
  = 1/q = integral.cont_"loop" (q arrow(v) times arrow(B)) dot dd(arrow(ell))
  = cgreen(integral.cont_"loop" (arrow(v) times arrow(B)) dot dd(arrow(ell))).
$

#define("Motional Emf")[
  When a conductor along a path $C$ moves through a magnetic field $arrow(B)$ at velocity $arrow(v)_"conductor"$, the *motional emf* $varcal(E)$ induced in the conductor is given by:
  $
    varcal(E) = integral.cont_C (arrow(v)_"conductor" times arrow(B)) dot dd(arrow(ell)).
  $
  For a straight conductor of length $ell$ moving perpendicularly through a uniform magnetic field
  #footnote[The conductor of length $ell$ should be connected to another conductor to form a closed loop which is not influenced by the magnetic field.]:
  $ varcal(E) = B ell v_"conductor". $
]

=== Deriving Motional Emf using Faraday's Law

Let a conductor of length $ell$ move with velocity $arrow(v) = v hat(i)$ perpendicularly through a uniform magnetic field $arrow(B) = B hat(k)$. Its ends form a closed loop with a stationary conductor, forming a circuit whose
area is increasing as the conductor moves.

Let the moving conductor be a distance $x$ from the left
side of the loop. Then the area of the loop is $A = ell x$,
and the magnetic flux through the loop is $Phi_B = B A = B ell x$. The rate of change of magnetic flux is: $
  dv(Phi_B, t) = dv(, t) (B A) = B dv(A, t) = B ell dv(x, t) = B ell v.
$ Thus, by Faraday's Law, the induced emf is: $
  varcal(E) = -B ell v.
$

We call this the *motional emf* since it is caused by the _motion_ of the conductor through a magnetic field.

Realize that as the conductor moves, it feels a magnetic force $arrow(F) = q arrow(v) times arrow(B)$ that pushes charges in the conductor along the direction of $hat(j)$. This is the induced current that creates the motional emf.

#example("Square Coil Falling into a Magnetic Field")[
  A square coil with mass $m$, side length $s$, and resistance $R$ falls in a gravitational field $-g hat(j)$ into a region with a uniform magnetic field $B hat(k)$. As the square coil is entering the magnetic field, what is its terminal speed $v$?

  #lorange

  As the coil enters the magnetic field, the magnetic flux through the loop increases. 
  Let $y$ be the distance the bottom edge of the coil has penetrated into the field, so the area of the coil within the magnetic field is $A = s y$.

  Thus, the magnetic flux is:
  $
    Phi_B = B A = B s y.
  $
  By Faraday's Law:
  $
    abs(varcal(E)) = dv(Phi_B, t) = dv(, t) (B s y) = B s dv(y, t).
  $
  Since $v = inlinedv(y, t)$, we have:
  $
    varcal(E) = B s v. #h(2em) "(motional emf!)"
  $
  Using Ohm's Law, the induced current $I$ flowing through the coil is:
  $
    I = varcal(E)/R = (B s v)/R.
  $
  Only the bottom side of the coil contributes to its net magnetic force, 
  which is given by:
  $
    arrow(F)_b = I (-s hat(i)) times B hat(k) = I s B hat(j) 
    = (B s v)/R s B hat(j)
    = (B^2 s^2 v)/R hat(j).
  $
  At terminal velocity, the upward magnetic force balances the downward gravitational force $-m g hat(j)$:
  $
    (B^2 s^2 v)/R = m g #h(1em) -> #h(1em) cgreen(v = (m g R)/(B^2 s^2)).
  $
]

#pagebreak()

=== Deriving Motional Emf using Newton's Second Law <emf-n2law>

We can arrive at the same result without ever invoking Faraday's Law, by looking directly at the forces on the charges inside the moving rod.

Consider a free charge $q$ inside the rod. Because the rod moves with velocity $arrow(v) = v hat(i)$ through $arrow(B) = B hat(k)$, the charge feels a magnetic force $
  arrow(F)_b = q arrow(v) times arrow(B),
$ of magnitude $q v B$, directed along the length of the rod. This force drives positive charges toward one end and negative charges toward the other.

As charge accumulates at the ends, an electric field $arrow(E)$ builds up along the rod, pointing opposite to $arrow(F)_b$. Charges stop accumulating once the electric force balances the magnetic force: $
  q E = q v B #h(1em) -> #h(1em) E = v B.
$ 

The potential difference across the rod is then just $E$ integrated along its length: $
  varcal(E) = integral_0^ell E dd(s) = integral_0^ell v B dd(s) = B ell v,
$ matching the result from Faraday's Law. The sign simply depends on which end we call positive.

This derivation makes clear where the emf physically comes from: it is the magnetic force on the charge carriers, reinterpreted as an effective electric field along the rod.

=== Power Dissipated by Motional Emf

To maintain a constant velocity $v$ of the conductor, an external force must be applied to counteract the magnetic force on the charges in the conductor.

As current flows along the $hat(j)$ direction in the conductor, the magnetic force on the wire is $arrow(F) = I ell hat(j) times B hat(k) = I ell B thin hat(i)$. We must apply an external force $arrow(F)_a = -I ell B thin hat(i)$ to maintain a constant velocity. The power dissipated by the motional emf is: $
  P = arrow(F) dot arrow(v) = -I ell B thin hat(i) dot v thin hat(i) = I ell B v.
$

=== Electric Motors and Back Emf

- An *electric motor* is a device that converts electrical energy into mechanical energy. It consists of a current-carrying coil placed in a magnetic field. The magnetic field exerts a torque on the coil, causing it to rotate.

- As the coil rotates, the magnetic flux through it changes, and Faraday's Law tells us an emf must be induced. By Lenz's Law, this induced emf opposes the applied voltage driving the motor. This is called the *back emf*, $varcal(E)_"back"$.

- Applying Kirchhoff's voltage law around the motor circuit: $
    V - varcal(E)_"back" = I R #h(1em) -> #h(1em) I = (V - varcal(E)_"back") / R.
  $

=== Hall Effect

When a current-carrying conductor is placed in a magnetic field perpendicular to the current, the magnetic force $arrow(F)_b = q arrow(v) times arrow(B)$ pushes charge carriers sideways, causing them to accumulate on one face of the conductor. This charge buildup creates an electric field that opposes further accumulation. At equilibrium the electric and magnetic forces balance, producing a steady *Hall voltage* $V_H$ or *Hall emf* across the width of the conductor.

#define("Hall Voltage")[
  For a conductor of thickness $d$ carrying current $I$ in a magnetic field $arrow(B)$, the *Hall voltage* is:
  $
    V_H = (I B) / (n q d),
  $
  where $n$ is the charge-carrier number density and $q$ is the carrier charge.
]

#note[
  While the Hall emf is not a motional emf, it is derived the same way as the motional emf was derived using 
  #link(<emf-n2law>)[Newton's Second Law].
]

- The sign of $V_H$ reveals whether the carriers are (effectively) positive or negative.
- A *Hall-effect sensor* is a device that uses the Hall effect to measure magnetic field strength. By applying a known current $I$ and measuring the resulting Hall voltage $V_H$, we can calculate the magnetic field using the formula above:
  $
    B = (n q d V_H) / I.
  $

// An electric motor is, at its core, a current-carrying coil placed in a magnetic field. The field exerts a torque on the coil, causing it to rotate — electrical energy is converted into mechanical energy.

// But as the coil rotates, the magnetic flux through it _changes_, and Faraday's Law tells us an emf must be induced. By Lenz's Law, this induced emf _opposes_ the applied voltage driving the motor. This is called the *back emf*, $varcal(E)_"back"$.

// Applying Kirchhoff's voltage law around the motor circuit: $
//   V - varcal(E)_"back" = I R ==> I = (V - varcal(E)_"back") / R.
// $

// Consequences:
// - _At startup_, the coil is stationary, so $varcal(E)_"back" = 0$ and the current is at its maximum value $V\/R$. This is why motors draw large _inrush currents_ when first turned on.
// - _At steady state_, $varcal(E)_"back"$ grows until it nearly balances $V$, and the current settles to whatever value is needed to supply the mechanical load.
// - _Under sudden heavy load_ (or a stall), the rotation slows, $varcal(E)_"back"$ drops, and the current spikes.

#pagebreak()

== Inductors and Self-Inductance

#let inductor-diagram = zap.circuit({
  zap.inductor("l1", (-1, 0), (1, 0), variant: "ieee")
})

- An *inductor* #inline-circuit(inductor-diagram) is a circuit element that #underline[resists changes in current]. A common example of an inductor is a solenoid, which stores energy in its magnetic field.

  - While a resistor resists current by dissipating energy as heat, an inductor resists changes in current by storing energy in its magnetic field.
    This energy can then be released back into the circuit (as a source of EMF) when the current changes again.

- *Inductance* is a property of a circuit element that quantifies how much it resists changes in current. The higher the inductance, the more it resists changes in current.

  - The unit of inductance is the *Henry* ("H"), where $1 "H" = 1 "Wb/A" = 1 space #[#{sym.Omega} s]$.


=== Self-Inductance

- When a current $I$ flows through a coil, a magnetic field is produced around the wires of the coil. This creates a magnetic flux $Phi_B$ through the coil itself.

 If $I$ changes, so does $Phi_B$. By Faraday's Law, an emf is induced in the coil that opposes the change in current. This is called *self induction*. 
 _The current in the coil creates a magnetic field that opposes changes in the current itself._

- The magnetic flux through the coil itself that is generated by a current $I$ flowing through the coil depends on how the coil is shaped. 

  The magnetic flux $Phi_B$ created by running a current $I$ through the coil is proportional to that current:
  $
    Phi_B = L I.
  $

  The constant of proportionality $L$ is called the *self-inductance* of the coil. It is one form of _inductance_. It depends only on the geometry of the coil and the permeability of any material inside it. 

  _How well does the magnetic field generated by the current cause magnetic
  flux through the same coil?_

- For a coil with $N$ turns, we want to look at the current _per turn_, so use:
  $
    Phi_B = (L I) / N #h(1em) -> #h(1em) L = N Phi_B / I.
  $

  #define("Self-Inductance")[
    If running a current $I$ through a coil of $N$ turns creates a magnetic flux $Phi_B$ through the coil, then the *self-inductance* $L$ of the coil is: $
      L = N Phi_B / I.
    $

    Then, the *self-induced emf* from an inductor is given by: $
      varcal(E) = -N dv(Phi_B, t) = -N dv(, t) (L I / N) = cgreen(-L dv(I, t)).
    $
  ]


#example("Self-Inductance of a Solenoid")[
  What is the self-inductance of a long solenoid with turn density $n$ and volume $Omega$?
  #lorange

  Let the solenoid have $N$ turns, length $ell$, and cross-sectional area $A$. Then $n = N slash ell$ and $Omega = ell A$.

  The magnetic field inside a long solenoid is $B = mu_0 N I slash ell$. The magnetic flux through each turn of the solenoid is $Phi_B = B A = mu_0 N I A slash ell$. 

  The self-inductance is then: $
    L = N Phi_B / I = N (mu_0 N I A slash ell) / I = (mu_0 N^2 A) / ell.
  $

  We can rewrite this in terms of the turn density and volume: $
    L = (mu_0 N^2 A ell) / ell^2 = cgreen(mu_0 n^2 Omega).
  $
]

#note[
  The solenoid formula above assumed free space ($mu_0$) inside the coil. If the core is filled with a linear magnetic material of permeability $mu = mu_r mu_0$, the field inside becomes $arrow(B) = mu n I$, and the self-inductance is amplified by the same factor:
  $
    L = mu_r mu_0 n^2 Omega = mu_r L_0.
  $
]

#example("Self-Inductance of a Toroid")[
  A *circular toroid* is a solenoid bent into a circle. What is the self-inductance of a toroid with $N$ turns, _mean inner radius_ $r$, and cross-sectional area $A$?
  #lorange
  The magnetic field inside a toroid is $B = mu_0 N I slash (2 pi r)$. The magnetic flux through each turn of the toroid is $Phi_B = B A = mu_0 N I A slash (2 pi r)$.

  The self-inductance is then: $
    L = N Phi_B / I = N (mu_0 N I A slash (2 pi r)) / I = cgreen((mu_0 N^2 A) / (2 pi r)).
  $
]

#pagebreak()

=== Energy in an Inductor

To build up a current $I$ in an inductor from zero, the source must do work against the back emf. The instantaneous power delivered to the inductor is: $
  P = I thin varcal(E)_L = L thin I dv(I, t).
$ 

Since $abs(P) = inlinedv(U, t)$, $P dd(t) = dd(U)$, so:
$
  Delta U = integral P dd(t) = integral L I thin dd(I) = 1/2 L I^2.
$

Recall the definition of inductance: $L = N Phi_B slash I$. Substituting this into the energy formula gives: $
  U = 1/2 L I^2 = 1/2 N Phi_B I.
$

#define("Power and Energy in an Inductor")[
  The instantaneous power delivered to an inductor is: $
    P = I thin varcal(E)_L = L thin I dv(I, t).
  $
  The energy stored in an inductor with current $I$ is: $
    U = 1/2 L I^2 = 1/2 N Phi_B I.
  $
]

==== Energy Density of a Magnetic Field

This energy is stored inside the magnetic field itself. Just like how we derived the energy density of an electric field using a capacitor, we can derive the energy density of a magnetic field by looking at the energy stored in a solenoid.

Take a long solenoid with turn density $n$ and volume $Omega$. The energy stored in the solenoid is: $
  U = 1/2 L I^2 = 1/2 mu_0 n^2 Omega I^2.
$

The magnetic field inside the solenoid is $B = mu_0 n I$, so we can rewrite the energy as: $
  U = B^2 / (2 mu_0) Omega.
$

The energy density of the magnetic field is then: $
  u_B = U / Omega = cgreen(B^2 / (2 mu_0)).
$

== Mutual Inductance

Now consider two nearby coils. A current $I_1$ in coil 1 produces a magnetic field, some fraction of whose flux $Phi_(2 1)$ passes through coil 2 (say coil 2 has $N_2$ turns). $Phi_(2 1)$ is the magnetic flux through each turn of coil 2 _due to_ current in coil 1, "_flux through coil 2 due to coil 1_."

Just as before, the flux passing through coil 2 is proportional to the current: $
  N_2 Phi_(2 1) = M_(2 1) thin I_1.
$ 
The constant of proportionality $M_(2 1)$ is called the *mutual inductance* of coil 2 with respect to coil 1.

The idea behind mutual inductance is that if $I_1$ changes, an emf is induced in coil 2: $
  varcal(E)_2 = -M dv(I_1, t).
$

#define("Mutual Inductance")[
  Let coil 1 carry a current $I_1$ that produces a magnetic flux $Phi_(2 1)$ through coil 2. Then the *mutual inductance* $M$ of coil 2 with respect to coil 1 is defined as: $
    M = N_2 Phi_(2 1) / I_1.
  $
  The *mutually induced emf* in coil 2 due to a changing current $I_1$ in coil 1 is then: $
    varcal(E)_2 = -M dv(I_1, t).
  $
]

- Mutual inductance is symmetric (this is #link(<sym-mut-inductance>)[non-trivial]): $
    M_(1 2) = M_(2 1) = M.
  $

- Both self-inductance and mutual inductance depend only on the geometry of the coils and the permeability of any material inside them.

- The mutual inductance between two coils are related to their self-inductances by:
  $
    M = k sqrt(L_1 L_2), "where" k "is the" bf("coupling coefficient").
  $
    - $k$ ranges from 0 (_no coupling_) to 1 (_perfect coupling_).
    - The coupling coefficient depends on the relative positions and orientations of the coils (e.g. if coils are far apart, $k$ is closer to $0$, while if they are close together, $k$ is closer to $1$).

- Mutual inductance can cause unwanted interference between inductors in a circuit.
  Multiple inductors behave ideally when they have a very low coupling coefficient.

#pagebreak()

=== Inductors in Series

#let series-inductors = zap.circuit({
  zap.inductor("l1", (-1, 0), (1, 0), variant: "ieee", label: $L_1$)
  zap.inductor("l2", (1, 0), (3, 0), variant: "ieee", label: $L_2$)
})

The potential difference across inductors in series is the sum of the potential differences across each inductor.
If there is negligible coupling between then inductors, we can assume that the potential difference across each
inductor is $Delta V_i = L_i inlinedv(I, t)$:
#grid(
  columns: (1fr, 1fr),
  align: center + horizon,
  $
    Delta V_"eq" &= Delta V_1 + Delta V_2 + ... + Delta V_n \
    L_"eq" dv(I, t) &= L_1 dv(I, t) + L_2 dv(I, t) + ... + L_n dv(I, t) \
    cgreen(L_"eq" &= L_1 + L_2 + ... + L_n).
  $ ,
  series-inductors
)

Now, consider two _coupled_ inductors with mutual inductance $M$. The potential difference across each inductor is not just $Delta V_i = L_i inlinedv(I, t)$, but also includes the contribution from the other inductor: $
  Delta V_1 &= L_1 inlinedv(I, t) plus.minus M inlinedv(I, t) \
  Delta V_2 &= L_2 inlinedv(I, t) plus.minus M inlinedv(I, t).
$

The orientation of the coils determines the sign of the mutual inductance contribution. If the coils are oriented such that their magnetic fields reinforce each other, then the mutual inductance contribution is positive, and we have: $
  Delta V_"eq" = L_"eq" dv(I, t) &= (L_1 + L_2 + 2M) dv(I, t) \
  cgreen(L_"eq" &= L_1 + L_2 + 2M).
$
_That is, the flux created by coil 1 also increases the flux in coil 2._

However, if the coils are oriented such that their magnetic fields oppose each other, then the mutual inductance contribution is negative, and we have: $
  Delta V_"eq" = L_"eq" dv(I, t) &= (L_1 + L_2 - 2M) dv(I, t) \
  cgreen(L_"eq" &= L_1 + L_2 - 2M).
$

For many inductors in series, we must add or subtract the mutual inductance contributions from each pair of inductors, depending on their orientations:
$
  L_"eq" = L_1 + L_2 + ... + L_n plus.minus 2 M_(1 2) plus.minus 2 M_(1 3) plus.minus ...
$

#pagebreak()

=== Inductors in Parallel

#let inductor-parallel = zap.circuit({
  let h = 0.7
  zap.inductor("l1", (0, h), (3, h), variant: "ieee", label: $L_1$)
  zap.inductor("l2", (3, -h), (0, -h), variant: "ieee", label: (content: $L_2$, anchor: "south"))
  zap.wire((-1, 0), (0, 0))
  zap.wire((0, -h), (0, h))
  zap.wire((3, -h), (3, h))
  zap.wire((3, 0), (4, 0))
})

For uncoupled inductors in parallel, the potential difference across each inductor is the same, but the current through each inductor is
added together (KJL). Since $Delta V = L_i inlinedv(I_i, t)$, $I_i = Delta V slash L_i$:
#grid(
  columns: (1fr, 1fr),
  align: center + horizon,
  $
    I_"eq" &= I_1 + I_2 + ... + I_n \
    (Delta V) / L_"eq" &= (Delta V) / L_1 + (Delta V) / L_2 + ... + (Delta V) / L_n \
    cgreen(1 / L_"eq" &= 1 / L_1 + 1 / L_2 + ... + 1 / L_n).
  $,
  inductor-parallel
)

Now, consider two _coupled_ inductors in parallel with mutual inductance $M$. The potential difference across each inductor is not just $Delta V = L_i inlinedv(I_i, t)$, but also includes the contribution from the other inductor: $
  Delta V &= L_1 inlinedv(I_1, t) plus.minus M inlinedv(I_2, t) \
  Delta V &= L_2 inlinedv(I_2, t) plus.minus M inlinedv(I_1, t).
$

This is a system of two equations with two unknowns ($I_1$ and $I_2$), which solves to become:
$
  dv(I_1, t) &= (L_2 plus.minus M) / (L_1 L_2 - M^2) Delta V \
  dv(I_2, t) &= (L_1 plus.minus M) / (L_1 L_2 - M^2) Delta V. 
$

Since $I_"eq" = I_1 + I_2$, we have: $
  dv(I_"eq", t) = dv(I_1, t) + dv(I_2, t) = (L_1 + L_2 plus.minus 2M) / (L_1 L_2 - M^2) Delta V = (Delta V) / L_"eq" \
  #h(1em) -> #h(1em) cgreen(L_"eq" = (L_1 L_2 - M^2) / (L_1 + L_2 plus.minus 2M)).
$

Again, the sign of $2 M$ depends on the orientations of the coils. For many inductors in parallel, we would
have to set up larger systems. For example, with three inductors in parallel:
  $
    Delta V &= L_1 inlinedv(I_1, t) plus.minus M_(1 2) inlinedv(I_2, t) plus.minus M_(1 3) inlinedv(I_3, t) \
    Delta V &= L_2 inlinedv(I_2, t) plus.minus M_(2 1) inlinedv(I_1, t) plus.minus M_(2 3) inlinedv(I_3, t) \
    Delta V &= L_3 inlinedv(I_3, t) plus.minus M_(3 1) inlinedv(I_1, t) plus.minus M_(3 2) inlinedv(I_2, t).
  $
  In matrix form, this is:
  $
    mat(Delta V; Delta V; Delta V) = mat(L_1, plus.minus M_(1 2), plus.minus M_(1 3); plus.minus M_(2 1), L_2, plus.minus M_(2 3); plus.minus M_(3 1), plus.minus M_(3 2), L_3) mat(inlinedv(I_1, t); inlinedv(I_2, t); inlinedv(I_3, t)).
  $
  After solving for $inlinedv(I_1, t)$, $inlinedv(I_2, t)$, and $inlinedv(I_3, t)$, we can find $inlinedv(I_"eq", t)$ and thus $L_"eq"$.

=== Energy Stored in Multiple Inductors

The energy stored in multiple inductors is not just the sum of the energies stored in each inductor, but also includes contributions from the mutual inductance between the inductors. For two coupled inductors with mutual inductance $M$, the total energy stored is: $
  U = 1/2 L_1 I_1^2 + 1/2 L_2 I_2^2 plus.minus M I_1 I_2.
$

#derivation([Extension: Proof that Mutual Inductance is Symmetric <sym-mut-inductance>])[
  Let the current $I_1$ flow through loop $C_1$, and $Phi_(2 1)$ is the magnetic flux
  through loop $C_2$ due to $I_1$.

  The flux through the second coil can be expressed as:
  $
    Phi_(2 1) = integral.cont_(C_2) arrow(A)_1 dot dd(arrow(ell)_2),
  $
  where $arrow(A)_1$ is the #link(<magnetic-vector-potential>)[magnetic vector potential] created by the current $I_1$ in coil 1. 
  
  By the Biot-Savart Law in vector potential form, the current $I_1$ in coil 1 creates a vector potential:
  $
    arrow(A)_1(arrow(r)) = (mu_0 I_1) / (4 pi) integral.cont_(C_2) dd(arrow(ell)_1) / abs(arrow(r) - arrow(r)_1),
  $
  where $arrow(r)_1$ is the position vector of points on coil 1. Plugging this into the expression for $Phi_(2 1)$ gives:
  $
    Phi_(2 1) = integral.cont_(C_2) arrow(A)_1 (arrow(r)_2) dot dd(arrow(ell)_2) 
    &= integral.cont_(C_2) ((mu_0 I_1) / (4 pi) integral.cont_(C_1) dd(arrow(ell)_1) / abs(arrow(r)_2 - arrow(r)_1)) dot dd(arrow(ell)_2) \
    &= (mu_0 I_1) / (4 pi) integral.cont_(C_2) integral.cont_(C_1) (dd(arrow(ell)_2) dot dd(arrow(ell)_1)) / abs(arrow(r)_2 - arrow(r)_1).
  $

  Using definition of mutual inductance, we can find $M_(2 1)$:
  $
    M_(2 1) = Phi_(2 1) / I_1 = mu_0 / (4 pi) integral.cont_(C_2) integral.cont_(C_1) (dd(arrow(ell)_2) dot dd(arrow(ell)_1)) / abs(arrow(r)_2 - arrow(r)_1).
  $

  We can repeat the same process to find $Phi_(1 2)$ and thus $M_(1 2)$:
  $
    Phi_(1 2) &= integral.cont_(C_1) arrow(A)_2 dot dd(arrow(ell)_1) 
    = (mu_0 I_2) / (4 pi) integral.cont_(C_1) integral.cont_(C_2) (dd(arrow(ell)_1) dot dd(arrow(ell)_2)) / abs(arrow(r)_1 - arrow(r)_2), \
    M_(1 2) &= Phi_(1 2) / I_2 = mu_0 / (4 pi) integral.cont_(C_1) integral.cont_(C_2) (dd(arrow(ell)_1) dot dd(arrow(ell)_2)) / abs(arrow(r)_1 - arrow(r)_2).
  $

  Since the integrand is symmetric in $C_1$ and $C_2$, we have $M_(1 2) = M_(2 1)$.
]

#pagebreak()



== Circuits with Inductors (LR, LC, LRC)

- in the direction of current flow, if current is increasing, then the inductor will act like an opposing ("back") emf (voltage drop)
- in the direction of current flow, if current is decreasing, then the inductor will act like a source of emf (voltage gain)

#zap.circuit({
  import zap: *

  inductor("l1", (-1, 0), (1, 0), variant: "ieee")
})

=== Inductor-Resistor (LR) Circuits

#let lr-circuit = zap.circuit({
  battery("bat", (0, 0), (0, -2), label: (content: $varcal(E)$, anchor: "south"), cells: 2, width: .15, show-polarity: true)
  zap.inductor("ind", (3, 0), (3, -2), variant: "ieee", label: $L$)
  zap.resistor("res", (0, 0), (3, 0), variant: "ieee", label: $R$)
  zap.switch("sw", (0, -2), (3, -2), variant: "ieee", closed: false)
  zap.node("n1", (1.1, -2))
  zap.node("n2", (1.9, -2))
})

#lr-circuit

$tau = L / R$

=== Inductor-Capacitor (LC) Circuits

$
  q(t) = Q cos(omega t + phi) \
  i(t) = -omega Q sin(omega t + phi) \
  omega = 1 / sqrt(L C)
$
 derivation:
$
  varcal(E) &= -L dv(i, t) \
  q/C &= -L dv(i, t) \
  q/C &= -L ndv(q, t, 2) \
  1/(L C) q &= -ndv(q, t, 2) \
  // ndv(q, t, 2) + 1/(L C) q &= 0
$
characteristic equation:
$
  r^2 + 1/(L C) = 0 #h(1em) -> #h(1em) r = plus.minus 1 / sqrt(L C) i.
$
thus:
$
  q(t) = c_1 cos(1/sqrt(L C) t) + c_2 sin(1/sqrt(L C) t).
$
Let $Q = sqrt(c_1^2 + c_2^2)$ and $phi = arctan(c_2 slash c_1)$:
$
  q(t) = Q cos(1/sqrt(L C) t + phi).
$

=== Inductor-Resistor-Capacitor (LRC) Circuits

derivation:
$
  varcal(E) = integral.cont_"loop" dd(V) &= -L dv(i, t) \
  q/C + R i &= -L dv(i, t) \
  q/C + R dv(q, t) &= -L ndv(q, t, 2) \
  L ndv(q, t, 2) + R dv(q, t) + 1/C q &= 0 \
  ndv(q, t, 2) + R/L dv(q, t) + 1/(L C) q &= 0
$
characteristic equation:
$
  r^2 + R/L r + 1/(L C) = 0 #h(1em) -> #h(1em) r = 1/2(-R/L plus.minus sqrt(R^2/L^2 - 4/(L C))) = -R/(2L) plus.minus sqrt(R^2/(4 L^2) - 1/(L C)).
$
if $R^2 < (4 L)/C$, then the roots are complex and we have underdamped oscillations:
$
  q(t) = e^(-R/(2L) t) (c_1 cos(omega t) + c_2 sin(omega t)) \
  omega = sqrt(1/(L C) - R^2/(4 L^2)).
$
Let $Q = sqrt(c_1^2 + c_2^2)$, $phi = arctan(c_2 slash c_1)$, and $tau = 2L slash R$:
$
  q(t) = Q e^(-t slash tau) cos(omega t + phi).
$

if $R^2 = (4 L)/C$, then the roots are real and equal, and we have critically damped oscillations:
$
  q(t) = (c_1 + c_2 t) e^(-t slash tau).
$

if $R^2 > (4 L)/C$, then the roots are real and distinct, and we have overdamped oscillations:
$
  q(t) = c_1 e^(r_1 t) + c_2 e^(r_2 t) \
  r_1 = -R/(2L) + sqrt(R^2/(4 L^2) - 1/(L C)) \
  r_2 = -R/(2L) - sqrt(R^2/(4 L^2) - 1/(L C)) \
$

#pagebreak()

== Alternating Current (AC) Circuits

- An *alternating current* (AC) is a current that oscillates back and forth in a circuit, as opposed to a *direct current* (DC) which flows in only one direction.

#let ac-circuit-symbol = zap.circuit({
  zap.acvsource("ac", (-1, 0), (1, 0))
})

- An *alternating voltage source* #inline-circuit(ac-circuit-symbol) is a source of emf that produces an alternating current. A common example is the power outlet in your home, which provides an AC voltage.

- There are many types of *waveforms* for AC signals:
  
  - The *sinusoidal* waveform is the most common and is described by $V(t) = V_0 sin(omega t + phi)$, where $V_0$ is the amplitude, $omega$ is the angular frequency, and $phi$ is the phase.
  
  - A *rectangular wave* "jumps" between two levels with a _duty cycle_ $delta$, for $0 < delta < 1$.
    - The duty cycle is the fraction of one period in which the signal is "high".
    - A *square wave* has a duty cycle of $delta = 0.5$.
  
  - A *triangular wave* linearly ramps up and down between two levels.

- There are two common ways to describe the strength of an AC signal:
  - *Amplitude* or *peak*: the maximum value. If $V(t) = V_0 sin(omega t + phi)$, then the amplitude is $V_0$.
  - *Root mean square (RMS)*: typical way to quantify the "effective" value of an AC signal.
    Take the square of the signal, and find the mean value of the squared signal over one period, then take the square root of that mean:
    $
      V_"rms" = sqrt(1/T integral_0^T V^2 (t) dd(t)).
    $

    - For a sinusoidal signal, the RMS value is $V_"rms" = V_0 slash sqrt(2)$.
    - For a rectangular wave with duty cycle $delta$, the RMS value is $V_"rms" = V_0 sqrt(delta)$.
    - For a triangular wave, the RMS value is $V_"rms" = V_0 slash sqrt(3)$.

=== Phasors

To analyze a sinusoidal AC circuit, we can use *phasors*, which represent both the amplitude and phase of 
certain sinusoidal quantities (e.g. voltage and current) as complex numbers.
#rsubtext[Visually, a phasor can be thought of as a vector in the complex plane.]

#note[
  Since $i$ is already used to represent current, we will use $j$ to represent the imaginary number.
]

#let Re = "Re"
#let Im = "Im"

Take a sinusoidal voltage $V(t) = V_0 cos(omega t)$. The phasor for this voltage is $tilde(V) (t) = V_0 e^(j omega t)$.
Realize that $V(t) = Re(tilde(V)) = Re(V_0 e^(j omega t))$, since by Euler's formula:
$
  Re(tilde(V)) = Re(V_0 e^(j omega t)) = V_0 Re(cos(omega t) + j sin(omega t)) = V_0 cos(omega t).
$

#define("Phasor Representation of Sinusoidal Signals")[
  A sinusoidal signal $V(t) = V_0 cos(omega t + phi)$ can be represented as its *phasor* $tilde(V)(t)$ 
  by adding an imaginary component $V_0 sin(omega t + phi) j$ to $V(t)$:
  $
    tilde(V) (t) = V_0 e^(j (omega t + phi)).
  $
]

- Visually, the phasor $tilde(V)$ is a "vector" of length $V_0$ that rotates counterclockwise in the complex plane at an angular velocity of $omega$. By projecting $tilde(V)$ onto the real axis, we obtain the voltage $V(t)$ at any given time.

  - Two phasors $tilde(u)(t) = u_0 e^(j omega t + phi_1)$ and $tilde(y)(t) = v_0 e^(j omega t + phi_2)$ with the same angular velocity $omega$ can be added together as follows:
    $
      tilde(u)(t) + tilde(v)(t) &= u_0 e^(j (omega t + phi_1)) + v_0 e^(j (omega t + phi_2)) \
      &= (u_0 e^(j phi_1) + v_0 e^(j phi_2)) e^(j omega t) \
      &= (u_0 cos phi_1 + v_0 cos phi_2 + j (u_0 sin phi_1 + v_0 sin phi_2)) e^(j omega t) \
      &= (u_0 cos phi_1 + v_0 cos phi_2) e^(j omega t) + j (u_0 sin phi_1 + v_0 sin phi_2) e^(j omega t) \
      &= (Re(tilde(u)) + Re(tilde(v))) + j (Im(tilde(u)) + Im(tilde(v))). \
    $
    On the complex plane, this is just the vector sum of the two phasors $tilde(u)$ and $tilde(v)$. That is,
    phasors can be added together using vector addition.

- Realize that if $tilde(V) (t) = V_0 e^(j omega t)$, then $inlinedv(tilde(V), t) = j omega V_0 e^(j omega t)$. This means that taking the time-derivative of a phasor corresponds to multiplying it by $j omega$. Since $j = e^(j pi slash 2)$, the phase is shifted counterclockwise by $pi slash 2$ radians (i.e. 90 degrees) when we take the time derivative of a phasor. 

  - Conversely, _integrating_ a phasor corresponds to _dividing_ by $j omega$, i.e. phase shift _clockwise_ by $pi slash 2$.
  - Since the time-derivative of $sin(omega t)$ is $omega cos(omega t) = omega sin(omega t + pi slash 2)$, a transformation equivalent
    to what we achieved using phasors.

- If two phasors have the same phase shift, then they are said to be *in phase*.
  - If a phasor $tilde(u)$ is shifted counterclockwise by $theta$ relative to another phasor $tilde(v)$, then
    $tilde(u)$ is said to *lead* $tilde(v)$ by $theta$, and $tilde(v)$ is said to *lag* $tilde(u)$ by $theta$.



=== Reactance

- The *reactance* of a circuit element measures how much it resists the flow of non-linear current.
  - Recall that a resistor is _linear_ if the potential difference across it is directly proportional to the current through it, as described by Ohm's Law: $V = I R$.
  - A capacitor or inductor is _non-linear_ because the potential difference across it is

$
  q(t) = C V(t) = C V_0 sin(omega t + phi) \
  i(t) = dv(q, t) = C V_0 omega cos(omega t + phi)
$

The *capacitive reactance* $X_C$ is defined as the ratio of the voltage amplitude to the current amplitude in a capacitor:
$
  X_C = V_0 / I_0 = V_0 / (C V_0 omega) = 1 / (C omega).
$

- *inductive reactance*

$
  i(t) = I_0 sin(omega t + phi) \
  V_L (t) = L dv(i, t) = L I_0 omega cos(omega t + phi)
$

The *inductive reactance* $X_L$ is defined as the ratio of the voltage amplitude to the current amplitude in an inductor:
$
  X_L = V_0 / I_0 = (L I_0 omega) / I_0 = L omega.
$

=== Impedance



#pagebreak()