#import "../../helpers/template.typ": *
#import "@preview/unify:0.7.1": unit, qty
#import "@preview/zap:0.5.0"
#import "@preview/cetz:0.4.2"
#import "@preview/wrap-it:0.1.1": wrap-content

#show: set_unit_number.with(2)

= Electric Potential and Capacitors

== Electric Potential Energy

Let $arrow(F)_e$ be the electrostatic force on a charge $q$ moving from point $A$ to point $B$. The *electric potential energy* $U_e$ is defined as the work done by an external agent to move the charge from $A$ to $B$ against the electrostatic force: $
  U_e = W_"external" = - W_"electrostatic" = - integral arrow(F)_e dot dd(arrow(ell)).
$

If we assume $q$ is only affected by one other point charge $Q$, we can substitute in Coulomb's Law: $
  U_e &= - integral k_e (q Q)/r^2 hat(r) dot dd(arrow(ell)).
$ 

Realize that $hat(r)$ and $dd(arrow(ell))$ are always in the same direction (since we are moving along the line between the two charges). Thus, we can let $dd(r) = hat(r) dot dd(arrow(ell))$: $
  U_e &= - k_e q Q integral 1/r^2 dd(r).
$

Solving the integral: $
  U_e &= - k_e q Q [-1/r]_(r_A)^(r_B) \
  &= k_e q Q (1/r_A - 1/r_B).
$

If we let final point be infinitely far away from point $A$ ($r_B -> oo$), then the electric potential energy at point $A$ is: $
  U_e = k_e (q Q) / r_A.
$

Thus, we arrive at the general formula for electric potential energy between two point charges:

#define("Electric Potential Energy from a Point Charge")[
  The electric potential energy of a point charge $q$ a distance $r$ from another point charge $Q$ is: $
    U_e = k_e (q Q) / r.
  $
  This is the amount of work available to move the charge $q$ from distance $r$ to an infinite distance away from $Q$.
]

- Just like all forms of energy, electric potential energy is a _scalar quantity_ and is measured in _Joules_ (J).

- If both charges have the same sign, then $U_e$ is positive, indicating that work wants to be done to separate the charges (they repel each other). 

- If the charges have opposite signs, then $U_e$ is negative, indicating that work is released when the charges come together (they attract each other).

- The reference point used for electric potential energy is that as $r -> oo, U_e -> 0$.

#example("Electric Potential Energy of a Discrete System")[
  #grid(
    columns: (1fr, 4fr),
    align: (center, horizon),
    cetz.canvas({
      import cetz.draw: *
      
      // Define vertices
      let v_top = (0, 1)
      let v_left = (-1, -0.5)
      let v_right = (1, -0.8)

      // Draw the triangle
      line(v_left, v_top, v_right, close: true, stroke: 1pt)

      // Draw the charges
      let charge_radius = 0.3
      let draw_charge(pos, label_text, color) = {
        circle(pos, radius: charge_radius, fill: color)
        content(pos, text(white, size: 9pt)[#label_text])
      }
      draw_charge(v_top, $+q$, red)
      draw_charge(v_left, $-2q$, blue)
      draw_charge(v_right, $+3q$, red)

      content(midpoint(v_left, v_top), anchor: "east", padding: 0.2)[$a$]
      content(midpoint(v_right, v_top), anchor: "west", padding: 0.2)[$b$]
      content(midpoint(v_left, v_right), anchor: "north", padding: 0.05)[$c$]
    }),
    [
      A system of three point charges $+q$, $-2q$, and $+3q$ are arranged in a triangle with side lengths
      $a$, $b$, and $c$ as shown. Calculate the total electric potential energy of the system.
    ],
  )

  #lorange

  The total potential energy in a system of discrete objects is the sum of
  potential energies between all pairs of objects.

  Between $+q$ and $-2q$: $display(U_1 = k_e ((+q)(-2q))/a = -2 k_e q^2 / a)$.

  Between $+q$ and $+3q$: $display(U_2 = k_e ((+q)(+3q))/b = 3 k_e q^2 / b)$.

  Between $-2q$ and $+3q$: $display(U_3 = k_e ((-2q)(+3q))/c = -6 k_e q^2 / c)$.

  Thus, the total electric potential energy of the system is: $
    U_e = U_1 + U_2 + U_3 &= -2 k_e q^2 / a + 3 k_e q^2 / b - 6 k_e q^2 / c
    &= cgreen(k_e q^2 (-2/a + 3/b - 6/c)).
  $
]



#example("Electric Potential Energy of a Continuous System")[
  A uniformly charged rod of length $L$ and linear charge density $lambda$ lies along the $x$-axis from $x=0$ to $x=L$. What is the electric potential energy of a point charge $q$ located a distance $d$ from the left end of the rod on the $x$-axis?

  #align(center)[
    #cetz.canvas({
      import cetz.draw: *

      // Draw the rod
      rect((0, -0.2), (rel: (4, 0.4)), name: "rod", fill: rgb(255, 120, 60), radius: 0.1)
      content("rod", anchor: "center", padding: 0.1)[$lambda$]

      // Draw distance L
      line(
        (0, 0.3), (4, 0.3), name: "Lline", 
        stroke: (paint: gray), mark: (start: "straight", end: "straight", length: 0.1)
      )
      content("Lline", anchor: "south", padding: 0.1)[$L$]

      // Draw point P
      circle((-1, 0), name: "P", radius: 0.1, fill: black)
      content("P", anchor: "east", padding: 0.2)[$q$]

      // Draw distance d
      line(
        (-1, 0.3), (0, 0.3), name: "dline", 
        stroke: (paint: gray), mark: (start: "straight", end: "straight", length: 0.1)
      )
      content("dline", anchor: "south", padding: 0.1)[$d$]
    })
  ]

  #lorange

  Since we are dealing with a continuous charge distribution, we use integration to find the total electric potential energy: $
    U_e = k_e q integral_(x=0)^(x=L) 1/r cblue(dd(q))
  $
  where $r$ is the distance from the point charge to each small portion of charge on the rod.

  Let $x$ be how far from the left side of the rod we are (so we integrate from $0$ to $L$). Then, $cred(r = d + x)$ and $cblue(dd(q) = lambda dd(x))$: $
    U_e = k_e q integral_0^L 1/(d+x) cblue(lambda dd(x)).
  $
  Since we know that the rod is _uniformly charged_, $lambda$ is constant, and we can now solve the integral and simplify: $
    U_e &= k_e q lambda integral_0^L 1/(d+x) dd(x) \
    &= k_e q lambda evaluated(ln(d+x), size: #200%)_(x=0)^(x=L) \
    &= k_e q lambda (ln(d+L) - ln(d)) \
    &= cgreen(k_e q lambda ln((d+L)/d)).
  $
]


=== Electric Potential Energy and Electrostatic Force

The electrostatic force is a *conservative force*. The work done by the force over a path
 only depends on the starting and ending positions, not the path taken.

The change in electric potential energy after following a path $C$ is: $
  Delta U_e = - integral_C arrow(F)_e dot dd(arrow(ell)).
$

By the fundamental theorem of line integrals, we know that if a vector field $arrow(F)$ is the gradient of a scalar field $f$ ($arrow(F) = grad f$), then: $
  integral_C arrow(F) dot dd(arrow(ell)) = integral_C grad f dot dd(arrow(ell)) = Delta f.
$

This property only holds for conservative vector fields. Since the electrostatic force is conservative, we can apply this theorem: $
  integral_C grad U_e dot dd(ell) = Delta U_e = integral_C -arrow(F)_e dot dd(arrow(ell)).                                                                                                                                     
$

Here, we see that $grad U_e = - arrow(F)_e$. This is the general definition of electric potential energy:

#define("Electric Potential Energy")[
  The electrostatic force $arrow(F)_e$ on a charge is equal to the negative gradient of its *electric potential energy* $U_e$: $
    arrow(F)_e = - grad U_e.
  $
  In one dimension, this simplifies to: $
    F_e_x = - dv(U_e, x).
  $
]

=== Things to Recall

- $W = -Delta U$ ONLY if the work is done by a *conservative force*.

- $"ME"_i + W_"nc" = "ME"_f$ in an isolated system

  - The total energy in an isolated system  is conserved, just like all other forms of energy: 
  $ Delta E = Delta U + Delta K = 0 " " ==> " " Delta K = - Delta U. $

- $"ME"_i + W_"ext" = "ME"_f$ in a non-isolated system

#pagebreak()

== Electric Potential

#define("Electric Potential from a Point Charge")[
  Let $q$ be a charge in an electric field $arrow(E)$. The electric potential energy $U_e$ of the charge is: $
    U_e = q V
  $
  where $V$ is the *electric potential* at the position of the charge.
]
- Electric potential is the electric potential energy per unit charge ($V = U_e slash q$).
  - This is similar to how electric field is defined as force per unit charge.
  - Place a charge in a potential field. The potential "energizes" the charge.

- The unit of electric potential is the _volt_ ($"V"$). 
  - A volt is defined as one joule per coulomb ($"V" = "J/C"$).
  - An _electron-volt_ ($"eV"$) is a unit of _energy_, which is the magnitude of potential energy of an electron in a $1 "V"$ potential: $1 "eV" = (#qty("1.6e-19", "C"))(#qty(1, "V")) = #qty("1.6e-19", "J")$.

- The electric potential $V$ due to a point charge $Q$ at a distance $r$ is: $
    V = U_e / q = k_e Q / r.
  $

  This can be applied to the principle of superposition, where given a collection of point charges ${q_i}$,
  $
    V = k_e sum_i q_i / r_i.
  $

- Electric potential is a _scalar quantity_.

- Electric potential is often referred to as just "potential".

- An *equipotential line* is a line along which the electric potential is constant. 
  - Equipotential lines are always perpendicular to electric field lines (since $arrow(E) = - grad V$).
  - Electric field lines flow from high potential to low potential

- Since $-grad U_e = arrow(F)_e$, we can derive a relationship between electric potential and electric field: $
    arrow(F)_e = - grad (q V) = - q grad V ==> arrow(E) = arrow(F)_e / q = - grad V.
  $

#define("Electric Field from Electric Potential")[
  The electric field $arrow(E)$ at any point is equal to the negative gradient of the
  electric potential $V$ at that point: $
    arrow(E) = - grad V = ang(-pdv(V, x), -pdv(V, y), -pdv(V, z)).
  $
  In one dimension, this simplifies to: $
    E_x = - dv(V, x).
  $
]

=== Potential Difference

- The *potential difference* $Delta V$ between two points is the change in electric potential between them: $
    Delta V = V_B - V_A.
  $
  From this, we can also derive the following relationship: $
    Delta U_e = q Delta V " " ==> " " Delta V = (Delta U_e) / q.
  $
  
  _The potential difference between two points is the change in electric potential energy per unit charge between those two points._

- The electric field points in the direction of decreasing potential (simply because $arrow(E) = - grad V$)

Since $Delta U_e = - integral_C arrow(F)_e dot dd(arrow(ell))$ and $arrow(F)_e = q arrow(E)$, we can write:
$
  Delta U_e &= - integral_C q arrow(E) dot dd(arrow(ell)) = - q integral_C arrow(E) dot dd(arrow(ell)) \
  Delta V = (Delta U_e) / q &= - integral_C arrow(E) dot dd(arrow(ell)).
$

#define("Potential Difference from Electric Field")[
  The potential difference $Delta V$ between two points is equal to the negative line integral of the electric field $arrow(E)$ along any path $C$ between those two points: $
    Delta V = - integral_C arrow(E) dot dd(arrow(ell)).
  $
]

- Since $arrow(E) dot dd(arrow(ell)) = 0$ when $arrow(E)$ is perpendicular to the path, *equipotential lines are always perpendicular to the electric field*.

  - Similarly, the magnitude potential difference is maximized along the direction of the electric field (positive if against, negative if along).

=== Electric Potential with Conductors

- Recall that inside a conductor, there is zero net electric field: $arrow(E) = arrow(0)$. Thus, the potential difference between any two points _inside_ a conductor is zero: $Delta V = 0$.

- Since the electric field resides on the surface of a conductor, the electric potential _inside_ a conductor is equal to the electric potential on its surface (no $Delta V$).

#pagebreak()

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
