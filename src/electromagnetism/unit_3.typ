#import "../../helpers/template.typ": *
#import "@preview/unify:0.7.1": unit, qty
#import "@preview/zap:0.5.0"
#import "@preview/cetz:0.4.2"
#import "@preview/wrap-it:0.1.1": wrap-content

#show: set_unit_number.with(3)

= Conductors and Capacitors

// == Electrostatics with Conductors

// == Redistribution of Charge Between Conductors

// #pagebreak()

== Capacitors and Capacitance

#let capacitor-symbol = zap.circuit({
  zap.capacitor("cap", (0, 0))
  zap.wire((-0.5, 0), (0.5, 0))
})

- A *capacitor* $#scale(capacitor-symbol, 50%, reflow: true)$ is a device which "stores" electric charge, creating an electric field that 
  results in a potential difference.
  

- A capacitor involves two separate conductors separated by an insulating material called a *dielectric*. Charges are allowed to move to the edges of each conductor, charging the ends, creating a potential difference.

- The *capacitance* is the maximum charge each conductor can hold per unit potential difference:

#define("Capacitance")[
  The *capacitance* $C$ of a capacitor is defined as the ratio of the magnitude of charge $Q$ on each conductor to the potential difference $Delta V$ between them: $
    C = Q / (Delta V).
  $
]

- The unit of capacitance is the _farad_ ($"F"$), where $1 "F" = 1 "C/V"$.

=== Parallel Plate Capacitors

Two oppositely charged parallel plates a distance $d$ apart create an approximately uniform electric field $arrow(E)$ between them. Let the surface charge densities of the two plates be $+sigma$ and $-sigma$, and let each plate have an area $A$.

#link(<ex-sheet-of-charge>)[Remember that the electric field from an infinite sheet of charge with surface charge density $sigma$ is $display(sigma/(2 epsilon_0))$.] With two oppositely charged sheets, the electric field is double that: $display(E = sigma/epsilon_0)$.

The potential difference $Delta V$ between the two plates is:
$
  Delta V = - integral_C arrow(E) dot dd(arrow(ell)) = - E d = - (sigma d)/epsilon_0.
$

By the definition of capacitance:
$
  C = Q / (Delta V) = (sigma A) / ((sigma d)/epsilon_0) = cgreen(epsilon_0 A / d).
$

=== Cylindrical Capacitors

In a cylindrical capacitor, the two conductors are coaxial cylinders with radii $a$ and $b$ ($a < b$) and length $L$. Note that the electric field between the cylinders is not uniform.

Remember that both conductors must carry the same charge $Q$, so we can assume they have the same linear charge density $lambda = Q slash L -> Q = lambda L$.

Remember the electric field a distance $r$ away from an infinitely long wire is $E(r) = display(lambda/(2pi r epsilon_0))$. The potential difference between the inner and outer cylinders is:
$
  Delta V = - integral_C arrow(E) dot dd(arrow(ell)) = - integral_a^b lambda/(2pi r epsilon_0) dd(r) = -lambda/(2pi epsilon_0) ln(b/a).
$

Finally, by the definition of capacitance:
$
  C = Q/abs(Delta V) = (lambda L)/(lambda/(2pi epsilon_0) ln(b/a)) = cgreen((2pi epsilon_0 L) / ln(b/a)).
$

=== Spherical Capacitors

In a spherical capacitor, the two conductors are concentric spheres with radii $a$ and $b$ ($a < b$). The electric field outside a sphere with charge $Q$ is $E(r) = display(k_e Q / r^2)$. The potential difference between the inner and outer spheres is: $
  Delta V = - integral_C arrow(E) dot dd(arrow(ell)) = - integral_a^b k_e Q / r^2 dd(r) = - k_e Q (1/a - 1/b).
$

By the definition of capacitance: $
  C = Q/abs(Delta V) = Q/(k_e Q (1/a - 1/b)) = cgreen((4pi epsilon_0) / (1/a - 1/b)).
$


=== Energy of Capacitors

Capacitors store electric potential energy. Since charges want to move from one conductor to the other conductor in a capacitor, but can't, they have potential energy. 

The *potential energy* stored by a capacitor is the work which can be done to move the charges from one conductor to another through the electric field between the conductors.

To find the potential energy, we can calculate the work done to charge the capacitor. Let $Q$ be the final charge on each conductor, and let $q$ be the charge at some intermediate point in the charging process. The potential difference at that point is $Delta V = q slash C$. The work done to move an infinitesimal amount of charge $dd(q)$ from one conductor to another is: $
  dd(W) = Delta V dd(q) = q / C dd(q).
$

Integrating from $0$ to $Q$: $
  W = integral_0^Q q / C dd(q) = cgreen(Q^2 / (2C)).
$

Thus, the potential energy stored by a capacitor is: $
  U_C = Q^2 / (2C).
$

This can be rewritten as:
$
  U_C = 1/2 Q Delta V = 1/2 C (Delta V)^2.
$

==== Energy Density

The *energy density* $u$ is the amount of potential energy stored per unit volume: $
  u = U / "volume". 
$

For a parallel plate capacitor, the volume between the gap is $A d$, so: $
  u = U_C / (A d) = 1/2 C (Delta V)^2 = 1/2 (epsilon_0 A) / d (E d)^2 = cgreen(1/2 epsilon_0 E^2).
$

Realize that this formula no longer depends on any inherent property of the capacitor, _just_ electric field. This means that it holds that _all_ types of capacitors, not just parallel plate, have the same formula for energy density. In fact, the formula holds for _all_ electric fields.

#example("Energy Density of a Spherical Capacitor")[
  A spherical capacitor consists of two concentric spheres with radii $a$ and $b$ ($a < b$). A potential difference of $Delta V$ is maintained between the two spheres. Derive an expression for the energy density $u$ a distance $r$ from the shared center of the spheres.
  #lorange

  The energy density of the electric field is given by $u_e = 1/2 epsilon_0 E^2$. 

  The electric field $E$ a distance $r$ from the center of the spheres is $E(r) = display(k_e Q / r^2)$. We can find $Q$ by using the potential difference between the two spheres: $
    Delta V = k_e Q (1/a - 1/b) --> Q = (Delta V) / (k_e (1/a - 1/b)) = (Delta V a b)/(k_e (a - b)).
  $ 

  Substituting this into the formula for electric field: $
    E(r) = k_e Q / r^2 = cancel(k_e) (Delta V a b)/(cancel(k_e)(a - b) r^2) = (Delta V a b) / (r^2 (a - b)).
  $

  Finally, substituting this into the formula for energy density: $
    u(r) = 1/2 epsilon_0 E^2(r) = 1/2 epsilon_0 ((Delta V a b) / (r^2 (a - b)))^2 = cgreen((epsilon_0 (Delta V)^2 a^2 b^2) / (2 r^4 (a - b)^2)).
  $
]

#pagebreak()

=== Capacitors in Series & Parallel

- When multiple capacitors are placed together in a circuit, their overall effects can be simplified into an *equivalent capacitor*. That is, we can treat groups of capacitors in a circuit as single capacitors.

- The two main arrangements (configurations) of capacitors are *series and parallel*. 

#let capacitor-series = zap.circuit({
  zap.capacitor("cap", (0, 0), label: $C_1$)
  zap.capacitor("cap", (1, 0), label: $C_2$)
  zap.wire((-1, 0), (2, 0))
})

#let capacitor-parallel = zap.circuit({
  let h = 0.6
  zap.capacitor("cap", (0.75, h), label: $C_1$)
  zap.capacitor("cap", (0.75, -h), label: (content: $C_2$, anchor: "south"))
  zap.wire((-1, 0), (0, 0))
  zap.wire((0, -h), (0, h))
  zap.wire((0, -h), (1.5, -h))
  zap.wire((0, h), (1.5, h))
  zap.wire((1.5, -h), (1.5, h))
  zap.wire((1.5, 0), (2.5, 0))
})

==== Series

#wrap-content(capacitor-series, align: right)[
  In *series*, the capacitors are connected end to end, so *each capacitor has the same charge $Q$*. However, the potential difference across each capacitor can be different. \
  #rsubtext[Charge is the same on each capacitor due to conservation of charge.]

  The potential differences would add up to the equivalent potential difference:
  $
    Delta V_"eq" = Delta V_1 + Delta V_2 + ... + Delta V_n.
  $

  By the definition of capacitance, $C = Q slash Delta V -> Delta V = Q slash C$. Substituting this into the sum of potential differences: $
    Delta V_"eq" = Q/C_"eq" & = Q/C_1 + Q/C_2 + ... + Q/C_n \
    cgreen(1/C_"eq"&  = 1/C_1 + 1/C_2 + ... + 1/C_n).
  $
]

==== Parallel

In *parallel*, the capacitors are connected such that *they all share the same potential difference $Delta V$*, but the charge on each capacitor can be different.

The charges would add up to the equivalent charge: $
  Q_"eq" = Q_1 + Q_2 + ... + Q_n.
$

By the definition of capacitance, $C = Q slash Delta V -> Q = C Delta V$. Substituting this into the sum of charges: $
  Q_"eq" = C_"eq" Delta V & = C_1 Delta V + C_2 Delta V + ... + C_n Delta V \
  cgreen(C_"eq"&  = C_1 + C_2 + ... + C_n).
$

A parallel connection between $C_1$ and $C_2$ looks like the following: 
$
  #capacitor-parallel
$

#pagebreak()

== Dielectrics

- A *dielectric* is an insulating material placed between the conducting plates of a capacitor to _increase_ its capacitance.

- When a dielectric is placed in an electric field, it becomes polarized, meaning that the positive and negative charges within the dielectric are slightly separated. 
  
  This creates an induced electric field that _opposes_ the original electric field, effectively reducing the potential difference between the plates.
  
  Since potential difference is inversely proportional to capacitance, the capacitance increases. 
  
- Let a capacitor with capacitance $C_0$ be without a dielectric. When a dielectric is added, the new capacitance is $C$. The ratio $C slash C_0$ is called the *dielectric constant* of the material, denoted by $kappa$: $
    C = kappa C_0 --> cgreen(kappa = C / C_0).
  $
  The dielectric constant represents the factor by which capacitance increases when the dielectric is added. For example, with a parallel plate capacitor, the new capacitance with a dielectric is: $
    C = kappa epsilon_0 A / d.
  $

  As mentioned, a dielectric really _decreases the potential difference_, so it can be more directly interpreted as the factor by which $Delta V$ is decreased:
  $
    Delta V = 1/kappa Delta V_0.
  $

- *Permittivity* is a measure of how easy it is for an electric field to polarize an insulating material. 
  - The *permittivity of free space* or *vaccum permittivity* is $epsilon_0$.

  - The term $kappa epsilon_0$ is referred to as the *absolute permittivity*, and is denoted with $epsilon$.
    - Accordingly, the scaling factor $kappa$ is sometimes called *relative permittivity* and denoted $epsilon_r$ such that $epsilon = epsilon_r epsilon_0$.

  - When talking about conductors, the unit _farad per meter_ ($"F/m"$) is often used to describe permittivity instead of $"N m"^2 slash "C"^2$. They are equivalent.

=== Partial Dielectrics

- A dielectric can partially fill a gap, or multiple types of dielectrics can fill a gap. 
  - At the same time, dielectrics can fill gaps discretely or continuously.

- In the discrete case, we can simply treat partial dielectrics as conductors in parallel/series. 

#pagebreak()

=== Electric Potential Energy in Dielectrics

- If $U_0$ is the energy stored by a capacitor with capacitance $C_0$ in a vaccum, then the energy stored by the same capacitor in a material with : $
    U = 1/2 C (Delta V)^2 = 1/2 kappa C_0 (Delta V)^2 = cgreen(kappa U_0).
  $

- By the same logic, the energy density of an electric field in a dielectric is: $
    u = 1/2 epsilon E^2 = 1/2 kappa epsilon_0 E^2 = cgreen(kappa u_0).
  $


// #cetz.canvas({
//   import cetz.draw: *

//   // Set scale
//   let a = 1.2
//   let b = 3.0
  
//   // 1. Draw the dielectric region (shaded)
//   // Note: For a "1/r" variation, a radial gradient would be ideal, 
//   // but a soft fill visually represents the medium well.
//   circle((0,0), radius: b, fill: gradient.radial(blue.lighten(20%), blue.lighten(80%)), stroke: none)
//   circle((0,0), radius: a, fill: white, stroke: none)

//   // 2. Draw the conducting shells
//   circle((0,0), radius: b, stroke: 1.5pt + black, name: "outer")
//   circle((0,0), radius: a, stroke: 1.5pt + black, name: "inner")

//   // 3. Radius 'a' dimension line
//   line((0,0), (45deg, a), mark: (end: ">", fill: black), stroke: 0.8pt)
//   content((22deg, a * 0.6), [$a$])

//   // 4. Radius 'b' dimension line
//   line((0,0), (-30deg, b), mark: (end: ">", fill: black), stroke: 0.8pt)
//   content((-15deg, b * 0.7), [$b$])

//   // 5. Dielectric Label
//   // Positioned within the shaded region
//   content((150deg, (a + b) / 2), [$ kappa(r) = alpha/r $])
// })
