#import "../../helpers/template.typ": *
#import "helpers.typ": inline-circuit
#import "@preview/unify:0.7.1": unit, qty
#import "@preview/zap:0.5.0"
#import "@preview/cetz:0.4.2"

#show: set_unit_number.with(5)

= Electromagnetic Induction

== Magnetic Flux and Faraday's Law

=== Magnetic Flux

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

The work done by the induced electric field to move a unit charge $q$ around the coil is: $ W = integral.cont_"coil" q arrow(E) dot dd(arrow(s)). $

By the definition of emf:
 $ varcal(E) = W/q = integral.cont_"coil" arrow(E) dot dd(arrow(s)). $ 


This allows us to rewrite Faraday's Law as:
$
  integral.cont_"coil" arrow(E) dot dd(arrow(s)) = -N dv(Phi_B, t).
$

For a coil with $N=1$ turn, we can expand the magnetic flux as follows:
$
  integral.cont_"coil" arrow(E) dot dd(arrow(s)) = -dv(, t) integral.double_S arrow(B) dot dd(arrow(A)).
$
#rsubtext[where $S$ is the surface enclosed by the coil.]

In a general sense, $arrow(B)$ and consequently $Phi_B$ 
can vary not only with time but also with position, so
it is more accurate to use a partial time derivative instead:
$
  integral.cont_"coil" arrow(E) dot dd(arrow(s)) = -pdv(, t) integral.double_S arrow(B) dot dd(arrow(A)).
$

This is the *integral form* of Faraday's Law of Induction, which is one of Maxwell's Equations. We can also write it in *differential form* using Stokes' Theorem:
$
  grad times arrow(E) = -pdv(arrow(B), t).
$

#define("Faraday's Law of Induction (Integral and Differential Forms)")[
  Let $C$ be a closed curve representing a loop of current, 
  and let $S$ be a surface enclosed by $C$. Then Faraday's Law of Induction can be expressed in two equivalent forms:
  $
    integral.cont_C arrow(E) dot dd(arrow(s)) &= -integral.double_S pdv(arrow(B), t) dot dd(arrow(A)). & #h(2em) bf("(integral form)") \

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

#define("Motional Emf")[
  When a conductor of length $L$ moves with velocity $arrow(v)$ perpendicularly through a uniform magnetic field $arrow(B)$, the induced emf across the conductor is given by: $
    varcal(E) = -arrow(v) dot (arrow(B) times arrow(L)).
  $
]

=== Deriving Motional Emf using Faraday's Law

Let a conductor of length $L$ move with velocity $arrow(v) = v hat(i)$ perpendicularly through a uniform magnetic field $arrow(B) = B hat(k)$. Its ends form a closed loop with a stationary conductor, forming a circuit whose
area is increasing as the conductor moves.

Let the moving conductor be a distance $x$ from the left
side of the loop. Then the area of the loop is $A = L x$,
and the magnetic flux through the loop is $Phi_B = B A = B L x$. The rate of change of magnetic flux is: $
  dv(Phi_B, t) = dv(, t) (B A) = B dv(A, t) = B L dv(x, t) = B L v.
$ Thus, by Faraday's Law, the induced emf is: $
  varcal(E) = -B L v.
$

We call this the *motional emf* since it is caused by the _motion_ of the conductor through a magnetic field.

Realize that as the conductor moves, it feels a magnetic force $arrow(F) = q arrow(v) times arrow(B)$ that pushes charges in the conductor along the direction of $hat(j)$. This is the induced current that creates the motional emf.

#example("Square Coil Falling into a Magnetic Field")[
  A square coil with mass $m$, side length $s$, and resistance $R$ falls in a gravitational field $-g hat(j)$ into a region with a uniform magnetic field $B hat(k)$. As the square coil is entering the magnetic field, what is its terminal speed $v$?

  #lorange

  As the coil falls, the magnetic flux through 
]

=== Deriving Motional Emf using Newton's Second Law <emf-n2law>

We can arrive at the same result without ever invoking Faraday's Law, by looking directly at the forces on the charges inside the moving rod.

Consider a free charge $q$ inside the rod. Because the rod moves with velocity $arrow(v) = v hat(i)$ through $arrow(B) = B hat(k)$, the charge feels a magnetic force $
  arrow(F)_b = q arrow(v) times arrow(B),
$ of magnitude $q v B$, directed along the length of the rod. This force drives positive charges toward one end and negative charges toward the other.

As charge accumulates at the ends, an electric field $arrow(E)$ builds up along the rod, pointing opposite to $arrow(F)_b$. Charges stop accumulating once the electric force balances the magnetic force: $
  q E = q v B #h(1em) -> #h(1em) E = v B.
$ 

The potential difference across the rod is then just $E$ integrated along its length: $
  varcal(E) = integral_0^L E dd(s) = integral_0^L v B dd(s) = B L v,
$ matching the result from Faraday's Law. The sign simply depends on which end we call positive.

This derivation makes clear where the emf physically comes from: it is the magnetic force on the charge carriers, reinterpreted as an effective electric field along the rod.

=== Power Dissipated by Motional Emf

To maintain a constant velocity $v$ of the conductor, an external force must be applied to counteract the magnetic force on the charges in the conductor.

As current flows along the $hat(j)$ direction in the conductor, the magnetic force on the wire is $arrow(F) = I L hat(j) times B hat(k) = I L B thin hat(i)$. We must apply an external force $arrow(F)_a = -I L B thin hat(i)$ to maintain a constant velocity. The power dissipated by the motional emf is: $
  P = arrow(F) dot arrow(v) = -I L B thin hat(i) dot v thin hat(i) = I L B v.
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

- The *sign* of $V_H$ reveals whether the carriers are positive or negative (electrons vs. holes).
- Measuring $V_H$ for a known $I$ and $B$ allows direct determination of $n$, the carrier density.
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

== Inductors and Inductance

#let inductor-diagram = zap.circuit({
  zap.inductor("l1", (-1, 0), (1, 0), variant: "ieee")
})

- An *inductor* #inline-circuit(inductor-diagram) is a circuit element that resists changes in current. A common example of an inductor is a solenoid, which stores energy in its magnetic field.

- *Inductance* is a property of a circuit element that quantifies how much it resists changes in current. The higher the inductance, the more it resists changes in current.

  - The unit of inductance is the *Henry* ("H"), where $1 "H" = 1 "Wb/A"$.


=== Self Inductance

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
    Phi_B = L I / N.
  $
  Solving for the self-inductance gives:

  #define("Self-Inductance")[
    If running a current $I$ through a coil of $N$ turns creates a magnetic flux $Phi_B$ through the coil, then the *self-inductance* $L$ of the coil is: $
      L = N Phi_B / I.
    $
  ]
  
- Solving for $Phi_B$ gives $Phi_B = L I slash N$. This allows us to find the self-induced emf:
  $
    varcal(E) = -N dv(Phi_B, t) = -N dv(, t) (L I / N) = cgreen(-L dv(I, t)).
  $

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

=== Mutual Inductance

Now consider two nearby coils. A current $I_1$ in coil 1 produces a magnetic field, some fraction of whose flux $Phi_(2 1)$ passes through coil 2. Just as before, this flux linkage is proportional to the current: $
  N_2 Phi_(2 1) = M_(2 1) thin I_1,
$ where $M_(2 1)$ is called the *mutual inductance* of coil 2 with respect to coil 1.

#note[
  For a coil with $N$ turns, if the flux through each turn is $Phi_B$, then the
  "total flux" through the entire coil is $N Phi_B$, and this quantity is 
  called *flux linkage*.
]

Mutual inductance is symmetric: $
  M_(1 2) = M_(2 1) = M.
$

The idea behind mutual inductance is that if $I_1$ changes, an emf is induced in coil 2: $
  varcal(E)_2 = -M dv(I_1, t).
$

// === Energy in a Magnetic Field

// To build up a current $I$ in an inductor from zero, the source must do work against the back emf. The instantaneous power delivered to the inductor is $
//   P = I thin varcal(E)_L = L thin I dv(I, t).
// $ Integrating from 0 to the final current $I$: $
//   U = integral_0^I L thin I' thin d I' = 1/2 L I^2.
// $

// Where is this energy stored? _Inside the magnetic field itself._ For the solenoid above, substituting $L = mu_0 n^2 ell A$ and $I = B \/ (mu_0 n)$ into $U = 1/2 L I^2$ and dividing by the interior volume $ell A$, we obtain the *magnetic energy density*: $
//   u_B = B^2 / (2 mu_0).
// $ Although we derived this from a solenoid, the result holds for _any_ magnetic field configuration in vacuum.

// === Electric Power Absorbed by an Inductor

// Unlike a resistor, an ideal inductor does not _dissipate_ energy — it stores it and returns it. The voltage across an inductor is $V_L = L thin d I \/ d t$, so the instantaneous power absorbed is $
//   P = I thin V_L = L thin I dv(I, t) = dv(, t) (1/2 L I^2).
// $

// The sign tells the full story:
// - When $I$ is _increasing_, $P > 0$: the inductor absorbs energy from the circuit, building up its magnetic field.
// - When $I$ is _decreasing_, $P < 0$: the inductor _returns_ energy to the circuit as the field collapses.

// Averaged over a full cycle of a sinusoidal AC current, an ideal inductor absorbs _zero_ net power — it is a purely reactive element.

== Circuits with Inductors

=== Inductor-Resistor (LR) Circuits

=== Inductor-Capacitor (LC) Circuits

=== Inductor-Resistor-Capacitor (LRC) Circuits

== Alternating Current (AC) Circuits

== Electromagnetic Transformers

#pagebreak()