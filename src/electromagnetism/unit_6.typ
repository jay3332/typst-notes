#import "../../helpers/template.typ": *
#import "@preview/unify:0.7.1": unit, qty
#import "@preview/zap:0.5.0"
#import "@preview/cetz:0.4.2"

#show: set_unit_number.with(6)

= Electromagnetic Waves

== Displacement Current

== Deriving the Wave Equation

In a vaccum, there are no free charges or currents, so Maxwell's equations reduce to:
$
  grad dot arrow(E) &= 0 \ 
  grad dot arrow(B) &= 0 \
  grad times arrow(E) &= -pdv(arrow(B), t) \
  grad times arrow(B) &= mu_0 epsilon_0 pdv(arrow(E), t)
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