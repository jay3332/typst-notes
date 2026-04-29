#import "../../helpers/template.typ": *
#import "@preview/unify:0.7.1": unit, qty
#import "@preview/zap:0.5.0"
#import "@preview/cetz:0.4.2"

#show: set_unit_number.with(7)
#show math.ell: varell

= Electromagnetic Waves

== Displacement Current

Recall Ampere's Law

#define("Displacement Current")[
  Let $S$ be a surface with a time-varying electric flux $Phi_E$. The *displacement current* $I_"disp"$ passing through $S$ is defined as:
  $
    I_"disp" = epsilon_0 pdv(Phi_E, t) = epsilon_0 pdv(, t) integral.double_S arrow(E) dot dd(arrow(A)).
  $
]

#define("Ampere's Law with Maxwell's Correction")[
  Let $S$ be a surface bounded by a closed curve $C$. Let $I_"enc"$ be the current passing through $S$ and $Phi_E$ be the electric flux through $S$. Then, the *Ampere-Maxwell* law states that:
  $
    integral.cont_C arrow(B) dot dd(arrow(ell)) = mu_0(I_"enc" + I_"disp") = mu_0(I_"enc" + epsilon_0 pdv(Phi_E, t)).
  $
  This is the fourth of Maxwell's equations.
]

=== Differential Form of Ampere-Maxwell Law

Using the definition of $Phi_E$ gives:
$
  integral.cont_C arrow(B) dot dd(arrow(ell)) = mu_0 (I_"enc" + epsilon_0 pdv(, t) integral.double_S arrow(E) dot dd(arrow(A))).
$

We can also rewrite $I_"enc"$ as a surface integral of the current density $arrow(J)$ over $S$:
$
  integral.cont_C arrow(B) dot dd(arrow(ell)) &= mu_0 (integral.double_S arrow(J) dot dd(arrow(A)) + epsilon_0 pdv(, t) integral.double_S arrow(E) dot dd(arrow(A))) \
  &= integral.double_S mu_0 (arrow(J) + epsilon_0 pdv(arrow(E), t)) dot dd(arrow(A)).
$

By Stokes' theorem, the left-hand side can be rewritten as a surface integral of the curl of $arrow(B)$:
$
  integral.double_S (grad times arrow(B)) dot dd(arrow(A))
  = integral.double_S mu_0 (arrow(J) + epsilon_0 pdv(arrow(E), t)) dot dd(arrow(A)).
$

The integrands must be equal, so we have the differential form of Ampere-Maxwell law:
$
  grad times arrow(B) = mu_0 (arrow(J) + epsilon_0 pdv(arrow(E), t)).
$

Since $arrow(D) = epsilon_0 arrow(E)$ is the _displacement field_, we can also realize that:
$
  epsilon_0 pdv(arrow(E), t) = pdv(arrow(D), t) = arrow(J)_"disp",
$
so the Ampere-Maxwell law can also be written as:
$
  grad times arrow(B) = mu_0 (arrow(J) + arrow(J)_"disp"),
$
where $arrow(J)_"disp"$ is the *displacement current density*.

#define("Ampere-Maxwell Law (Differential Form)")[
  Let $S$ be a surface over which the electric field $arrow(E)$ is changing with time, and let $arrow(J)$ be the current density at each point on $S$. Then, the *Ampere-Maxwell law in differential form* states that for any point on $S$:
  $
    grad times arrow(B) = mu_0 (arrow(J) + arrow(J)_"disp") = mu_0 (arrow(J) + epsilon_0 pdv(arrow(E), t)).
  $
]

#pagebreak()

== Deriving the Wave Equation

In a vaccum, there are no free charges or currents, so Maxwell's equations reduce to:
$
  grad dot arrow(E) &= 0 \ 
  grad dot arrow(B) &= 0 \
  grad times arrow(E) &= -pdv(arrow(B), t) \
  grad times arrow(B) &= mu_0 epsilon_0 pdv(arrow(E), t).
$

Taking the curl of both sides of the third equation, we have:
$
  grad times (grad times arrow(E)) &= grad times (-pdv(arrow(B), t)) \
    &= -pdv(, t) (grad times arrow(B)) \
    &= -pdv(, t) (mu_0 epsilon_0 pdv(arrow(E), t)) \
    &= -mu_0 epsilon_0 (partial^2 arrow(E))/(partial t^2).
$

Using the vector identity $grad times (grad times arrow(E)) = grad (grad dot arrow(E)) - nabla^2 arrow(E)$, we can rewrite the left-hand side as
$
  grad times (grad times arrow(E)) = grad (grad dot arrow(E)) - nabla^2 arrow(E) = -nabla^2 arrow(E).
$

Thus, we have the wave equation for the electric field in a vacuum:
$
  nabla^2 arrow(E) = mu_0 epsilon_0 (partial^2 arrow(E))/(partial t^2).
$


== Energy and Momentum of Electromagnetic Waves

== Electromagnetic Spectrum