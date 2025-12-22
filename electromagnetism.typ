#import "helpers/template.typ": *
#import "@preview/unify:0.7.1": unit, qty
#import "@preview/zap:0.2.0"

#show: template.with(title: "Electricity & Magnetism", font: "informal")

= Electric Charges and Fields

== Electric Charge and Electric Force

=== Electric Charge

- *Electric charge* ($q$ or $Q$) is a fundamental property of matter.

- Electric charge is measured in the SI derived unit _Coulombs_ ($"C"$).

  - Coulombs are equal to _ampere seconds_, being the amount of charge transferred in a $qty("1", "A")$ current in one second ($"C" = "A" dot "s"$).

- Electric charge comes from *charge carriers*: protons ($p^+$) and electrons ($e^-$)

  - The magnitude of charge of both protons and electrons are equal to the _elementary charge_: $
      "Elementary Charge" = cblue(e = qty("1.6e-19", "C")) \
      abs(q_"proton") = abs(q_"electron") = e. 
    $

  - Protons $p^+$ carry a positive charge of $+e$, and electrons $e^-$ carry a negative charge of $-e$.
  
- Electric charge is a *quantized scalar*.

  - *Quantized:* electric charge can only be integer multiples of the elementary charge $e$. \
    #subtext[In other words, something can only have a charge of $q = k e$, where $k in ZZ$ and $e$ is the elementary charge.]

  - *Scalar:* charge does not have direction, but it can be either positive or negative.

#example("")[
  An object consists of 4 protons and 6 electrons. What is its charge in Coulombs?
  
  $
    Q = (n_"protons" - n_"electrons")e = (4 - 6)e &= -2e \
    &= -2(qty("1.60e-19", "C")) \
    &= cgreen(qty("-3.20e-19", "C")).
  $
]

#define("Law of Charges")[
  Two charges of opposing signs _attract_, and two charges of the same sign _repel_.
]

- A *point charge* refers to an object or system which has charge, but has negligible physical size. Point charges are easy to deal with because the direction from the charge to any object solely depends on the position of the object.

=== Coulomb's Law

#define("Coulomb's Law")[
  Let $q_1$ and $q_2$ be the charges of two point charges a distance $r$ between their centers of charge. Then, the _electrostatic force_ $arrow(F)_e$ exerted by $q_2$ on $q_1$ is: $
    "Electrostatic Force" = arrow(F)_e = k_e (q_1 q_2)/r^2 hat(r)
  $ where:
  - $k_e$ is *Coulomb's constant*, defined as $k_e = 1/(4pi epsilon_0) approx qty("8.99e9", "N m^2 / C^2")$
    - $epsilon_0$ is the *permittivity of free space*, which is a constant which we will define later.  
    
  - $hat(r)$ is the unit vector directed _away_ from the location of $q_1$.
    - in other words, if $q_1$ and $q_2$ are the same sign, the force will repel the charges _away_ from each other.
]

- By Newton's Third Law, $arrow(F)_e_"1,2" = -arrow(F)_e_"2,1"$. Two charges will always exert a pair of electrostatic forces on each other.

- Notice that Coulomb's Law mirrors the Universal Law of Gravitation, $arrow(F)_G = G (m_1 m_2)/r^2 hat(r)$.

  - $G approx qty("6.67e-11", "N m^2/kg^2")$, the gravitational constant, is _much_ smaller than $k_e$. This means that for large scale objects which are _charged_, gravitational force is negligible compared to the electrostatic force.

    However, it is often the case that large objects _aren't_ charged (they are neutral since), which is why we still see the effects of gravitational force.

  - In the case of $arrow(F)_G$, $hat(r)$ points _towards_ the other object rather than _away_. Gravity is always an attractive force. In contrast, electrostatic force can be either attractive or repulsive.
  
#define("Law of Superposition for Coulomb's Law (Discrete)")[
  Let $q_1, q_2, ..., q_n$ be a discrete set of charges in space. A particle of charge $Q$ will have its electrostatic force be the vector sum of all individual electrostatic forces: $
    arrow(F)_e = sum_i arrow(F)_e_(i,Q) = sum_i k_e (q_i Q) / r^2 hat(r). 
  $
  In other words, the net electrostatic force is the sum of all individual electrostatic forces.
]

We can generalize this law to continuous charge distributions. For every small change in charge along a charged object $cblue(dd(q))$, the change in electrostatic force $dd(arrow(F)_e)$ is: $
  dd(arrow(F)_e) = k_e ( Q cblue(dd(q)) )/r^2 hat(r). 
$
Thus, by the law of superposition: 

#define("Law of Superposition for Coulomb's Law (Continuous)")[
  Let $Q$ be a point charge and let an object have a continuous charge distribution $cal(D)$. Then,
  the net electrostatic force $arrow(F)_e$ must be: $
    arrow(F)_e = k_e integral_cal(D) Q/r^2 hat(r) cblue(dd(q)). 
  $ 
]

#pagebreak()

== Conservation of Electric Charge

=== Conservation of Charge

#define("The Law of Conservation of Charge")[
  For isolated systems, net charge is _conserved_: $
    Sigma Q_i = Sigma Q_f .
  $
  This law holds because in an isolated system, charge carriers (i.e. electrons) cannot enter or leave the system.
]

- Charge cannot be created or destroyed, only _transferred_ between objects or particles.

- Applies at all scales: subatomic (e.g., particle interactions), macroscopic (e.g., charging a balloon), and circuit-level.

=== Methods of Charging

- An object can have a change in charge when they are introduced into a new system, allowing the charge of the system to distribute into the object.

  - In almost all cases, only electrons freely move and cause charge transfers.

- When a previously neutral object obtains charge, we say that the object has been _charged_.

#define("Insulators and Conductors")[
  - It is difficult to change the charge of an *insulator*. Electrons are bound tightly to the atomic nuclei, and cannot easily move. (Electrons are _localized_).
    - We say that the electrons _resist_ movement.
    - The degree to which the electrons of a material resist movement is called _resistivity_.

  - It is easy to change the charge of a *conductor*. Electrons can freely move (they are _delocalized_).  
      - The degree to which the electrons of a material are able to move is called _conductivity_. It is the inverse of resistivity ($"conductivity" = 1/"resistivity"$).

  - *Semiconductors* have properties resembling both conductors and insulators. Electrons are somewhat bound to the atomic nuclei, and conductivity _varies_ based on the composition of materials.
]

==== Charging by Conduction (Contact)

- When an object touches a _conductor_ charge can be directly transferred through physical contact. The total charge of the object-conductor system is conserved.

- The distribution of charges between the individual objects depend _only_ on their *initial charges* and their *sizes (charge capacities)*.

- Two _identical_ objects of this manner will evenly distribute charge. \
  #subtext[ex: sphere $A$ ($+qty("4", "uC")$) and sphere $B$ ($qty("0", "uC")$) make contact with each other. \ If spheres $A$ and $B$ are identical in size, then the final charge on each is $+qty("2", "uC")$.]
  
  - To generalize, the final charge of each object after the _conduction_ of $n$ identical objects of initial charges $q_1, q_2, ..., q_n$ is simply the average charge: $
    q_"individual object after conduction" = (q_1 + q_2 + ... + q_n)/n.
  $

==== Charging by Induction (Contactless)

- A nearby conductor may _induce_ a redistribution of charge in an object. We call this process *induction*. 

#pagebreak()

== Electric Fields

#define("Electric Field")[
  Let $arrow(E)$ be the net *electric field* at any point $P$. Then, if a particle with charge $q$ is placed at point $P$, then the net electrostatic force on the particle is: $
    arrow(F)_e = q arrow(E).
  $

  By Coulomb's Law, the electric field at a point $P$ induced by a point charge $Q$ is: $
    arrow(E)_P = arrow(F)_e/q = k_e Q/r^2 hat(r)
  $
  where $arrow(r)$ is the distance vector from the position of $Q$ to $P$.
]

- The *electric field* is the _electrostatic force per unit charge_.

  - Take a test charge $q$ and place it a distance $r$ from another charge $Q$. The charge $Q$ induces an electrostatic force $arrow(F)_e$ on $q$ and the electric field from $Q$ is $arrow(F)_e slash q$.

- The electric field is a vector function of position ($arrow(E)(x, y, z)$), making it a vector field \ (the electric field at every point is a vector).

- Electric field has units of _newtons per coulomb_, $"N" slash "C"$
  - $unit("N/C") = unit("kg m/s^3/A")$ in SI base units.

=== Electric Field Lines

- Electric field lines generalize the electric field to general regions in space.

- Electric field lines will always move away from positive charges and into negative charges.

- Electric field lines will never cross, and by convention, lines drawn closer together indicate a greater magnitude of electric field.

#pagebreak()

== Electric Fields of Charge Distributions

We can apply the law of superposition for electrostatic force to electric fields.

=== Discrete Charge Distributions

For discrete charge distributions (a finite set of point charges): $
  arrow(E) = arrow(F)_e/Q = (sum_i arrow(F)_e_(i,q))/(sum_i q_i) = sum_i arrow(E)_i.
$

In other words, the net electric field at a given position is the sum of the electric fields induced by all individual point charges.

=== Continuous Charge Distributions

Often times, we will deal with objects with non-negligible sizes where we must consider the *distribution of charge* throughout the object. 

If we split an object into many small, negligibly-sized portions, we can consider each small portion its own point charge that contributes a small amount towards the total electric field.

Let $cblue(dd(q))$ be the additional charge of one of these negligibly-sized point charges. Then the additional electric field $dd(arrow(E))$ induced by this point charge is: $
  dd(arrow(E)) = k_e cblue(dd(q))/r^2 hat(r).
$

The law of superposition allows us integrate both sides to obtain the net electric field: $
  arrow(E) = k_e integral 1/r^2 hat(r) cblue(dd(q)).
$

#note[
  The fact that $hat(r)$ appears inside our integral can make calculations difficult, since the direction of each $hat(r)$ can vary as we integrate through different positions along our object.

  Luckily, at this level, we will only consider scenarios where $hat(r)$ can be considered constant or where there is symmetry.
]

Often times, the charge differential $dd(q)$ is not directly given to us, but rather indirectly using a *charge density*. There are three charge densities:

- *Linear charge density* ($lambda$), charge per unit length.
  - By definition, $lambda = dv(q,ell) ==> cblue(dd(q) = lambda dd(ell))$ where $dd(ell)$ is a small change in length.
  - SI units are _coulombs per meter_, $"C/m"$

- *Surface charge density* ($sigma$), charge per unit surface area.
  - By definition, $sigma = dv(q,A) ==> cblue(dd(q) = sigma dd(A))$ where $dd(A)$ is a small change in surface area.
  - SI units are _coulombs per square meter_, $"C/m"^2$

- *Volumetric charge density* ($rho$), charge per unit volume.
  - By definition, $rho = dv(q,V) ==> cblue(dd(q) = rho dd(V))$ where $dd(V)$ is a small change in volume.
  - SI units are _coulombs per cubic meter_, $"C/m"^3$

If charge density is constant, the object is *uniformly charged*.

#import "@preview/cetz:0.4.2"

#example("Finding the Electric Field from Discrete Charges")[
  #grid(
    columns: (1fr, 3fr),
    align: (center, horizon),
    cetz.canvas({
      import cetz.draw: *

      let s = 2.3
      let h = s * calc.sqrt(3) / 2
      
      // Define vertices
      let v_top = (0, h * 2/3)
      let v_left = (-s/2, -h/3)
      let v_right = (s/2, -h/3)
      let center = (0, 0)

      // Draw the triangle
      line(v_left, v_top, v_right, close: true, stroke: 1pt)

      // Draw the charges
      let charge_radius = 0.3
      let draw_charge(pos, label_text, color) = {
        circle(pos, radius: charge_radius, fill: color)
        content(pos, text(white)[#label_text])
      }
      draw_charge(v_top, $q$, red)
      draw_charge(v_left, $2q$, red)
      draw_charge(v_right, $3q$, red)

      // Mark the center
      circle(center, radius: 0.05, fill: black)
      content(center, anchor: "north-west", padding: 0.05)[$P$]

      content(midpoint(v_left, v_top), anchor: "east", padding: 0.2)[$a$]
      content(midpoint(v_left, v_right), anchor: "north", padding: 0.05)[$a$]
      content(midpoint(v_right, v_top), anchor: "west", padding: 0.2)[$a$]

      // Optional: Draw distance r (dashed)
      line(center, v_top, stroke: (dash: "dashed", paint: gray))
      content((0.1, h/3), anchor: "west", text(gray)[$r$])
    }),
    [
      Three point charges $q$, $2q$, and $3q$ are arranged in an equilateral triangle of side length $a$ as shown. Find the electric field at the center of the triangle.
    ],
  )
  #lorange

  The distance $r$ from a vertex to point $P$ is $r = a / sqrt(3)$. By Coulomb's law, the electric field magnitude due to a charge $Q$ a distance $r$ away is: $
    E = (k_e Q) / r^2 = (k_e Q) / (a / sqrt(3))^2 = (3 k_e Q) / a^2.
  $
  #rsubtext[where $k_e$ is Coulomb's constant.]

  Thus, the magnitudes of electric field caused by each charge is: $
    E_1 = (3 k_e q) / a^2 #h(40pt) E_2 = (6 k_e q) / a^2 #h(40pt) E_3 = (9 k_e q) / a^2.
  $

  By the law of superposition, $arrow(E)_P = arrow(E)_1 + arrow(E)_2 + arrow(E)_3$. However, we only have magnitudes, so
  we have to use trigonometry to break each magnitude into basis components.

  Recall the electric field points _away_ from the charge. For example, at point $P$, $arrow(E)_1$ would point downwards.
  This means $arrow(E)_1$ has no $x$-component and a negative $y$-component, so we derive $arrow(E)_1 = -E_1 hat(j)$.

  $arrow(E)_2$ makes a $30 degree$ angle with the positive $x$-axis, so $arrow(E)_2 = E_2 (hat(i) cos 30 degree + hat(j) sin 30 degree)$. Similarly, $arrow(E)_3$ makes a $30 degree$ angle with the _negative_ $x$-axis, so $arrow(E)_3 = E_3 (-hat(i) cos 30 degree + hat(j) sin 30 degree)$.

  Writing out the components: $
    arrow(E)_P &= (E_2 cos 30 degree - E_3 cos 30 degree) hat(i) + (-E_1 + E_2 sin 30 degree + E_3 sin 30 degree) hat(j) \
    &= (E_2 - E_3) sqrt(3)/2 hat(i) + (-E_1 + (E_2 + E_3)/2) hat(j) \
    &= (-(3 k_e q) / a^2) sqrt(3)/2 hat(i) + (-3 + (6 + 9)/2) (k_e q)/a^2 hat(j)
    = cgreen(- (3 sqrt(3) k_e q) / (2 a^2) hat(i) + (9 k_e q)/(2 a^2) hat(j)).
  $
]

#example("Electric Field from a Continuous Charge Distribution")[
  Point $P$ is a distance $b$ directly to the left of a uniformly charged rod of length $L$ with linear mass density $lambda$. Derive an expression for the electric field at $P$.

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
      content("P", anchor: "east", padding: 0.2)[$P$]

      // Draw distance b
      line(
        (-1, 0.3), (0, 0.3), name: "bline", 
        stroke: (paint: gray), mark: (start: "straight", end: "straight", length: 0.1)
      )
      content("bline", anchor: "south", padding: 0.1)[$b$]
    })
  ]
  
  #lorange

  First, since the rod is not a point charge, we are dealing with a _continuous charge distribution_: 
  $
    arrow(E)_P = k_e integral_(x=0)^(x=L) 1/r^2 hat(r) cblue(dd(q)).
  $
  Let $x$ be how far from the left side of the rod we are (so we integrate from $0$ to $L$).

  Realize that the direction of the electric field is always to the left. So, $cred(hat(r))$ must be constant and equal to $cred(-hat(i))$ (left-pointing unit vector). Also recognize that $r$ is the distance from $P$ to the left side plus $x$ ($cred(r = b + x)$): $
    arrow(E)_P = k_e cred((-hat(i))) integral_(x=0)^(x=L) 1/cred((b+x))^2 cblue(dd(q))
  $

  Since we are given a linear mass density, use $cblue(dd(q) = lambda dd(x))$: $
    arrow(E)_P = -k_e hat(i) integral_0^L cblue(lambda)/(b+x)^2 cblue(dd(x)).
  $

  Since we know that the rod is _uniformly charged_, $lambda$ is constant, and we can now solve the integral and simplify: $
    arrow(E)_P &= -k_e lambda hat(i) integral_0^L 1/(b+x)^2 dd(x) \
    &= -k_e lambda hat(i) [-1/(b+x)]_0^L \ 
    &= k_e lambda (1/(b+L) - 1/b) hat(i) \
    &= cgreen(-(k_e lambda L)/b(b+L) hat(i)).
  $

  Since total charge $Q = integral_0^L dd(q) = integral_0^L lambda dd(x) = lambda L$, we can simplify in terms of $Q$: $
    cgreen(arrow(E)_P = -(k_e Q)/(b(b+L))hat(i))
  $
]
  
== Electric Flux

#define("Electric Flux")[
  Let $arrow(E)$ be the electric field and $dd(arrow(A))$ be a vector element of area on a surface $S$. The *electric flux* $Phi_E$ through the surface is:  
  $
    Phi_E = integral.double_S arrow(E) dot dd(arrow(A))
  $
  - $arrow(E)$ is the electric field at each point on the surface.
  - $dd(arrow(A))$ is the vector with its magnitude being a small change in surface area, pointing perpendicularly outwards from the surface \ 
    #subtext[($dd(arrow(A)) = hat(n) dd(A)$ where $hat(n)$ is the unit normal to $S$)]
]

- *Electric flux* measures how much electric field "passes through" a given surface.

  - If $arrow(E)$ is parallel to $dd(arrow(A))$, the flux is maximized.
  - If $arrow(E)$ is perpendicular to $dd(arrow(A))$, the flux is zero.
  - The dot product ensures that only the component of the electric field perpendicular to the surface contributes to flux.
  - The surface here does not need to be an actual physical surface. It can be an imaginary surface which we use to 
    analyze flux with, called a *Gaussian surface*.

- The symbol $Phi_E$ or $phi_E$ is used to refer to electric flux. It is a scalar quantity. \
  #subtext[(or just $Phi$ if no need to clarify which type of flux)]

- The preferred unit for electric flux is the _volt-meter_, $"V" dot "m"$.

  - The unit derived from the equation is _newton-meter squared per coulomb_, $unit("N m^2/C")$. 
  - A _volt_ ($"V"$) is a measure of _electrical potential energy per unit charge_ (which will be covered later), so volts have units of $"J/C" = unit("N m / C")$ (unit of energy divided by unit of charge).
  - Thus, a _volt-meter_ is equivalent to a _newton-meter squared per coulomb_.

- If electric field is constant everywhere on the surface AND our surface is flat, then our equation simplifies: $
    Phi_E = arrow(E) dot integral.double_S dd(arrow(A)) = arrow(E) dot arrow(A).
  $

- By the definition of the dot product, the electric field for flat surfaces is:

  - $Phi_E = E A cos theta$, if electric field is constant
  - $Phi_E = integral.double_S E cos theta dd(A)$, if electric field is not constant

  $E$ is the magnitude of the electric field, $A$ is surface area, and $theta$ is the angle between the outwards-pointing normal vector to the surface and the electric field vector.

#example("")[
  #grid(
    columns: (3fr, 1.6fr),
    align: (horizon, center),
    [
        A non-uniform electric field $arrow(E) = ang(2x y, z^2, 2x + 3y) "N/C"$ passes through a flat, rectangular surface $S$ as shown in the diagram. What is the electric flux passing through $S$? Assume $x,y,z$ are specified in meters.
    ],
    [
      #align(center)[
        #cetz.canvas(length: 20pt, {
          import cetz.draw: *

          ortho(x: -65deg, y: 0deg, z: 17deg, {
            on-xy({

              circle((0, 0), radius: 0.05, fill: black)
              content((0, 0), anchor: "south-east", padding: 0.05)[$cal(O)$]

              rect((0, 0), (rel: (5, 4)), name: "surface", fill: rgb(100, 150, 255, 128))
              content("surface", anchor: "center", padding: 0.1)[$S$]

              content((0, 2), anchor: "east", padding: 0.1)[$4 space "m"$]
              content((2.5, 0), anchor: "south", padding: 0.1)[$5 space "m"$]
            })

            line((2.5, 2, 0), (2.5, 2, 2), stroke: black, name: "Efield", mark: (end: "straight"))
            content((2.5, 2, 2.0), anchor: "west", padding: 0.15)[$arrow(E)$]
          })
        })
      ]
    ]
  )

  #lorange

  First, since we are only concerned about the component of the electric field that is perpendicular to $S$, we know that our effective electric field is $E = 2x + 3y$ (i.e. we only consider the $z$-component of the electric field).

  Now, this becomes a simple double integral: $
    Phi_E &= integral.double_S (2x + 3y) dd(A) \
    &= integral_(y=0)^4 integral_(x=0)^5 (2x + 3y) dd(x) dd(y) \
    &= integral_0^4 evaluated(lr((x^2 + 3x y), size: #150%))_(x=0)^(x=5) dd(y) \
    &= integral_0^4 (25 + 15y) dd(y) \
    &= evaluated(lr((25y + 7.5y^2), size: #150%))_0^4 = cgreen(220 space "V" dot "m").
  $
]

#pagebreak()

== Gauss' Law 

Assume an isolated point charge of magnitude $q$ is situated at the center of a sphere of radius $r$. What is the total electric flux over the surface $S$ of the sphere?

Using Coulomb's Law, we see that the magnitude of electric field $arrow(E)$ at any point on the sphere (i.e. a distance $r$ from the charge) is: $
  abs(arrow(E)) = k_e q / r^2.
$

Also realize that:
- the magnitude electric field is constant for all points on the surface of the sphere
- the electric field $arrow(E)$ points in the same direction as $dd(arrow(A))$ for all points on the surface

Thus, the formula for electric flux simplifies: $
  Phi_E = integral.double_S arrow(E) dot dd(arrow(A)) = integral.double_S abs(arrow(E)) dd(A) = E integral.double_S dd(A) = E A
$

Since $A$ would simply be the surface area of the sphere $A = 4pi r^2$: $
  Phi_E = E A &= (k_e q/r^2) (4pi r^2) \
  &= (1/(cancel(4pi) epsilon_0) q/cancel(r^2)) cancel(4pi r^2) \
  &= cgreen(q/epsilon_0)
$

It turns out that _all closed surfaces_ which enclose a volume ("*Gaussian surfaces*") can be projected as spheres, and thus this formula applies to all such surfaces. Formally:

#define("Gauss' Law (Integral Form)")[
  Let $Phi_E$ be the _electric flux_ through a *closed surface* $S$. Then: $
    Phi_E = integral.surf_S arrow(E) dot dd(arrow(A)) = Q_"enclosed"/epsilon_0 
  $
  where:
  - $arrow(E)$ is the electric field
  - $dd(arrow(A))$ is the area vector differential ($dd(arrow(A)) = hat(n) dd(A)$ where $hat(n)$ is the unit normal to $S$)
  - $Q_"enclosed"$ is the total charge *inside* the volume enclosed by $S$ 
  - $epsilon_0$ is the permittivity of free space. 
]

Gauss' Law is typically the first equation introduced in the set of four equations fundamental to electromagnetism known as _Maxwell's Equations_:

#resource("Maxwell's Equations")[
  #text(size: 0.9em)[
    #table(columns: 3, inset: 1em,
      [*Name*], [*Integral Form*], [*Differential Form*],
      tblue[Gauss' Law], tblue[$display(integral.surf_S arrow(E) dot dd(arrow(A)) = Q_"enclosed"/epsilon_0)$], tblue[$display(grad dot arrow(E) = rho/epsilon_0)$],
      [Gauss' Law for Magnetism], [$display(integral.surf_S arrow(B) dot dd(arrow(A)) = 0)$], [$display(grad dot arrow(B) = 0)$],
      [Faraday's Law of Induction], [$display(integral.cont_C arrow(E)dot dd(arrow(ell)) = - dv(Phi_B,t))$], [$display(grad times arrow(E) = - pdv(arrow(B),t))$],
      [Ampere-#text(fill: gray)[Maxwell] Law], [$display(integral.cont_C arrow(B) dot dd(arrow(ell)) = mu_0 I_"enclosed" cgray(+ mu_0 epsilon_0 dv(Phi_E, t)))$], [$display(grad times arrow(B) = mu_0 arrow(J) cgray(+ mu_0epsilon_0 pdv(arrow(E), t)))$]
    )
  ]
]

=== Differential Form of Gauss' Law

The *divergence theorem* tells us that if $V$ is the volume enclosed by a closed surface $S$, then the total flux through $S$ ("total outwards flow through the surface") is equal to the sum of all "small outward flows" (divergences) contained in $V$. Mathematically: $
  integral.surf_S arrow(F) dot dd(arrow(A)) = integral.triple_V grad dot arrow(F) dd(V).
$

So, following Gauss' Law: $
  integral.surf_S arrow(E) dot dd(arrow(A)) = integral.triple_V grad dot arrow(E) dd(V) &= Q/epsilon_0 \
  dv(,V) integral.triple_V grad dot arrow(E) dd(V) &= dv(Q,V) 1/epsilon_0 \
  cgreen(grad dot arrow(E) &= rho/epsilon_0).
$

#define("Gauss' Law (Differential Form)")[
  The divergence of the electric field, $grad dot arrow(E)$, at any point is: $
    grad dot arrow(E) = rho/epsilon_0
  $
  where:
  - $rho$ is volumetric charge density, charge per unit volume ($cblue(dd(q) = rho dd(V))$)
  - $epsilon_0$ is the permittivity of free space.
]

#pagebreak()

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
  &= k_e q Q (1/r_B - 1/r_A).
$

If we let final point be infinitely far away from point $A$ ($r_B -> oo$), then the electric potential energy at point $A$ is: $
  U_e = k_e q Q / r_A.
$

#define("Electric Potential Energy")[
  Let $q$ be a charge in an electric field $arrow(E)$. The *electric potential energy* $U_e$ of the charge is: $
    U_e = q V
  $
  where $V$ is the *electric potential* at the position of the charge.
]

== Electric Potential

== Conservation of Electric Energy

= Conductors and Capacitors

== Electrostatics with Conductors

== Redistribution of Charge Between Conductors

== Capacitors

== Dielectrics

= Electric Current and Circuits

== Electric Current

== Electric Circuits

#zap.canvas({
    import zap: *

    vsource("v", (0,0), (5,0), label: $qty("9", "V")$, variant: "ieee")
    resistor("r", (0,2), (5,2), label: $qty("1", "kO")$, variant: "ieee")
    wire("v.in", "r.in")
    wire("v.out", "r.out")
})

== Resistance and Ohm's Law

== Electric Power

== Compound Direct Current Circuits

== Kirchhoff's Loop Rule

== Kirchhoff's Junction Rule

== Resistor-Capacitor (RC) Circuits

An *RC circuit* is a circuit consisting of resistors and capacitors connected to a voltage source.

- The voltage source provides an electromotive force (emf) that drives current through the circuit.
- The resistors impede the flow of current, while the capacitors store and release energy.

By Kirchhoff's Loop Rule, the potential differences across the circuit must sum to zero: $
  cal(E) - V_R - V_C = 0 space ==> space cal(E) = V_R + V_C.
$

The potential difference across the resistor is given by Ohm's Law: $V_R = I R$, and the potential difference across the capacitor is given by $V_C = q / C$.

Thus, the equation for an RC circuit becomes: $
  cal(E) = I R + q / C.
$

Since current $I$ is the time derivative of charge $dv(q, t)$, we can rewrite the equation as: $
  cal(E) = R dv(q, t) + 1 / C q.
$

This is a first-order linear differential equation. If we assume the capacitor is initially uncharged ($q(0) = 0$), we can solve for $q(t)$: $
  q(t) = C cal(E) (1 - e^(-t / (R C))).
$

#pagebreak()

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

= Electromagnetic Induction

== Magnetic Flux

== Electromagnetic Induction

== Induced Currents and Magnetic Forces

== Inductance

== Circuits with Resistors and Inductors (LR)

== Circuits with Capacitors and Inductors (LC)

== Circuits with Resistors, Inductors, and Capacitors (RLC)

$
  L ndv(q, t, 2) + R dv(q, t) + 1/C q = cal(E)
$