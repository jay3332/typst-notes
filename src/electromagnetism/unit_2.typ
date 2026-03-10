#import "../../helpers/template.typ": *
#import "@preview/unify:0.7.1": unit, qty
#import "@preview/zap:0.5.0"
#import "@preview/cetz:0.4.2"

#show: set_unit_number.with(2)

= Electric Potential

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

#pagebreak()

== Potential Difference

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