#import "../../helpers/template.typ": *
#import "@preview/unify:0.7.1": unit, qty
#import "@preview/zap:0.5.0"
#import "@preview/cetz:0.4.2"

#show: set_unit_number.with(1)

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
    Q = (n_"protons" - n_"electrons")e = (4 - 6)e = -2e
    &= -2(qty("1.60e-19", "C")) \
    &= cgreen(qty("-3.20e-19", "C")).
  $
]

#define("Law of Charges")[
  Two charges of opposing signs _attract_, and two charges of the same sign _repel_.
]

- A *point charge* refers to an object or system which has charge, but has negligible physical size. Point charges are easy to deal with because the direction from the charge to any object solely depends on the position of the object.

#resource("Atomic Constants")[
  - Mass of a Proton and Neutron #footnote[$m_p != m_n$, but their difference is negligible.]: 
    $m_p approx m_n approx #qty("1.67e-27", "kg")$ 
  - Mass of an Electron: $m_e approx #qty("9.11e-31", "kg")$
  - Elementary Charge: $e approx #qty("1.60e-19", "C")$
]

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

#let coulomb-diagram = cetz.canvas({
  import cetz.draw: *

  let charge_radius = 0.3
  let draw_charge(pos, label_text, color) = {
    circle(pos, radius: charge_radius, fill: color)
    content(pos, text(white)[#label_text])
  }

  // Draw charges
  let q1_pos = (-1, 0)
  let q2_pos = (1, 0)
  on-layer(1, {
    draw_charge(q1_pos, $q_1$, red)
    draw_charge(q2_pos, $q_2$, red)
  })

  // Draw distance r
  line(q1_pos, q2_pos, stroke: (paint: gray, dash: "dashed"))
  content((0, 0.1), anchor: "south", padding: 0.1)[$r$]

  // Draw force arrows
  line(q1_pos, (q1_pos.at(0) - 1, q1_pos.at(1)), stroke: blue, mark: (end: "straight"))
  content((q1_pos.at(0) - 1, q1_pos.at(1)), anchor: "east", padding: 0.1)[$arrow(F)_e_"2,1"$]

  line(q2_pos, (q2_pos.at(0) + 1, q2_pos.at(1)), stroke: blue, mark: (end: "straight"))
  content((q2_pos.at(0) + 1, q2_pos.at(1)), anchor: "west", padding: 0.1)[$arrow(F)_e_"1,2"$]
})

#align(center, coulomb-diagram)

- By Newton's Third Law, $arrow(F)_e_"1,2" = -arrow(F)_e_"2,1"$. Two charges will always exert a pair of electrostatic forces on each other.

- Notice that Coulomb's Law mirrors the Universal Law of Gravitation, $arrow(F)_G = G (m_1 m_2)/r^2 hat(r)$.

  - $G approx qty("6.67e-11", "N m^2/kg^2")$, the gravitational constant, is _much_ smaller than $k_e$. This means that for large scale objects which are _charged_, gravitational force is negligible compared to the electrostatic force.

    However, it is often the case that large objects _aren't_ charged (they are neutral since), which is why we still see the effects of gravitational force.

  - In the case of $arrow(F)_G$, $hat(r)$ points _towards_ the other object rather than _away_. Gravity is always an attractive force. In contrast, electrostatic force can be either attractive or repulsive.

#example("Relative Electrostatic Force")[
  Two charges of magnitude $q$ placed a distance $d$ from each other exhibit 
  a repulsive force of magnitude $F$. What is the electrostatic force of two
  charges of magnitude $3q$ placed a distance $2d$ from each other?
  #lorange
  By Coulomb's Law, the initial force is: $
    F = k_e (q^2)/d^2.
  $
  For the new charges, the force is: $
    F_"new" = k_e (3q)^2/(2d)^2 = k_e (9q^2)/(4d^2) = cgreen(9/4 F).
  $ 
]

#example("Charged Bobs on a Pendulum")[
  #let charged-bobs-diagram = cetz.canvas({
    import cetz.draw: *

    let string_length = 2.0
    let angle = 30deg
    let half_angle = angle / 2

    let bob_radius = 0.25
    let bob_color = red.darken(10%)
    let string_color = black

    // Calculate bob positions
    let left_bob_pos = (
      -string_length * calc.sin(half_angle),
      -string_length * calc.cos(half_angle)
    )
    let right_bob_pos = (
      string_length * calc.sin(half_angle),
      -string_length * calc.cos(half_angle)
    )

    // Draw strings
    line((0, 0), left_bob_pos, stroke: string_color)
    line((0, 0), right_bob_pos, stroke: string_color)
    content(midpoint((0, 0), left_bob_pos), anchor: "east", padding: 0.1)[$L$]
    content(midpoint((0, 0), right_bob_pos), anchor: "west", padding: 0.1)[$L$]

    // Draw bobs
    circle(left_bob_pos, radius: bob_radius, fill: bob_color)
    content(left_bob_pos, text(white)[$q$])
    
    circle(right_bob_pos, radius: bob_radius, fill: bob_color)
    content(right_bob_pos, text(white)[$q$])
    
    // Draw ceiling and hang point
    line((-1.2, 0.4), (-1.2, 0), (1.2, 0), (1.2, 0.4), fill: gray.darken(70%))
    circle((0, 0), radius: 0.05, fill: black)

    // Draw angle and theta label
    cetz.angle.angle((0, 0), left_bob_pos, right_bob_pos, radius: 0.8)
    content((0, -0.8), anchor: "north", padding: 0.1)[$theta$]
  })
  #grid(
    columns: (3fr, 1fr),
    align: (horizon, center),
    [
      Two identically charged balls of mass $m$ are in static equilibrium while hanging from the 
      ceiling on strings of length $L$. The total angle between them is $theta$ ($0 degree <= theta < 180 degree$). 
      Find the charge $q$ on each ball.
      #lorange
    ],
    charged-bobs-diagram,
  )

  #let fbd = cetz.canvas(length: 34pt, {
    import cetz.draw: *

    let bob_radius = 0.25
    let bob_color = red.darken(10%)

    // Draw bob
    on-layer(1, {
      circle((0, 0), name: "bob", radius: bob_radius, fill: bob_color)
      content("bob", text(white)[$q$])
    })

    // Gravitational force
    line( // mg
      (0, 0), (0, -1.5), 
      name: "mg", stroke: blue, mark: (end: "straight")
    )
    content("mg.end", anchor: "south-west", padding: 0.2)[$m arrow(g)$]
    
    // Electrostatic force
    line( // Fe
      (0, 0), (-1.0, 0), 
      name: "Fe", stroke: purple, mark: (end: "straight")
    )
    content("Fe.end", anchor: "south-west", padding: 0.2)[$arrow(F)_e$]

    // Tension force
    line(
      (0, 0), (1.0, 1.5), 
      name: "T", stroke: green, mark: (end: "straight")
    )
    content("T.end", anchor: "north-west", padding: 0.1)[$arrow(T)$]
    // Components of T
    line( // T cos(theta/2)
      (0, 0), (1.0, 0), 
      name: "Tx", stroke: (paint: green.transparentize(30%), dash: "densely-dashed"), mark: (end: "straight")
    )
    content("Tx.end", anchor: "north", padding: 0.1, text(size: 8pt)[$T_x$])

    line( // T sin(theta/2)
      (0, 0), (0, 1.5), 
      name: "Ty", stroke: (paint: green.transparentize(30%), dash: "densely-dashed"), mark: (end: "straight")
    )
    content("Ty.end", anchor: "east", padding: 0.1, text(size: 8pt)[$T_y$])

    // angle
    line("T.end", (1.0, 0.6), name: "ang", stroke: (dash: "dashed"))
    content("ang", anchor: "north-east", padding: 0.1, text(size: 7pt)[$theta/2$]) 
  })

  #grid(
    columns: (1fr, 3fr),
    align: (center, horizon),
    [
      #fbd
      #subtext("FBD for the left-hanging ball")
    ],
    [
      For vertical forces to balance, set $T_y = m g$: $
        T_y = T cos(theta/2) = m g space ==> space T = (m g) / cos(theta/2).
      $

      For horizontal forces to balance, set $T_x = F_e$, where $F_e$ is
      the magnitude of electrostatic repulsion: $
        T_x = T sin(theta/2) = F_e = k_e (q^2) / r^2.                                      
      $
    ]
  )

  $r$ is the distance between the two balls. Since each ball is a distance $L sin(theta/2)$ from the center, $cblue(r = 2L sin(theta/2))$. Thus: $
    T sin(theta/2) = k_e (q^2) / (cblue(2L sin(theta/2)))^2 = k_e (q^2) / (4L^2 sin^2(theta/2)).
  $

  Replace the expression for tension $corange(T)$ from earlier and substitute $cpurple(k_e = 1/(4pi epsilon_0))$: $
    corange((m g) / cos(theta / 2)) sin(theta / 2) &= cpurple(k_e) (q^2) / (4L^2 sin^2(theta/2)) \
    m g tan(theta / 2) &= cpurple(1/(4pi epsilon_0)) (q^2) / (4L^2 sin^2(theta/2)).
  $

  Solving for $q$: $
    q^2 &= 16 L^2 sin^2 (theta/2) pi epsilon_0 m g tan(theta / 2) \
    cgreen(q &= 4L sin(theta / 2) sqrt(pi epsilon_0 m g tan (theta / 2))).
  $
]

=== Charge Distributions

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

- The _charge distribution_ of an isolated system may change, but the _net charge_ of the system remains constant.

=== Insulators and Conductors

- It is difficult to redistribute charges in an *insulator*. Electrons are bound tightly to the atomic nuclei, and cannot easily move. (Electrons are _localized_).
  - We say that the electrons _resist_ movement.
  - The degree to which the electrons of a material resist movement is called _resistivity_.

- It is easy to redistribute charges in a *conductor*. Electrons can freely move (they are _delocalized_).  
    - The degree to which the electrons of a material are able to move is called _conductivity_. It is the inverse of resistivity ($"conductivity" = 1/"resistivity"$).

- *Semiconductors* have properties resembling both conductors and insulators. Electrons are somewhat bound to the atomic nuclei, and conductivity _varies_ based on the composition of materials.

=== Methods of Charging

- An object can have a change in charge when they are introduced into a new system, allowing the charge of the system to distribute into the object.

- When a previously neutral object obtains charge, we say that the object has been _charged_.

==== Charging by Friction

- When two _insulating_ objects are rubbed together, electrons can be transferred from one object to another. This process is called _charging by friction_.

- The object that _gains_ electrons becomes _negatively charged_, and the object that _loses_ electrons becomes _positively charged_.

==== Charging by Conduction (Contact)

- When an object touches a _conductor_, charge can be directly transferred through physical contact. The total charge of the object-conductor system is conserved.

- The distribution of charges between the individual objects depend _only_ on their *initial charges* and their *sizes (charge capacities)*.

- Two _identical_ objects of this manner will evenly distribute charge. \
  #subtext[ex: sphere $A$ ($+qty("4", "uC")$) and sphere $B$ ($qty("0", "uC")$) make contact with each other. \ If spheres $A$ and $B$ are identical in size, then the final charge on each is $+qty("2", "uC")$.]
  
  - To generalize, the final charge of each object after the _conduction_ of $n$ identical objects of initial charges $q_1, q_2, ..., q_n$ is simply the average charge: $
    q_"individual object after conduction" = (q_1 + q_2 + ... + q_n)/n.
  $

==== Charging by Induction (Contactless)

- A nearby #underline[conductor] may _induce_ a redistribution of charge in an object. We call this process *induction* (_or *polarization*_).
  - It is very difficult to induce charge in an insulator, since electrons are not free to move.

- For example, bringing a negatively charged object to the left of a neutral conductor 
  will induce a positive charge on the left side of the conductor and a negative charge on the right side of the conductor.

  - The net charge of the conductor remains _zero_ since no charge was added or removed.
  - Taking away the charged object will cause the conductor to return to its original neutral state.

#example("Permanent Induction")[
  Two neutral conducting spheres $A$ and $B$ are placed next to and are touching each other.
  A negatively charged rod is brought close to sphere $A$ without touching it. After charge 
  distribution reaches equilibrium, sphere $B$ is separated from sphere $A$. Finally, the rod is removed. Describe the final charges on spheres $A$ and $B$.

  #lorange
  When the negatively charged rod is brought close to sphere $A$, it induces a positive charge on the left side of sphere $A$ and a negative charge on the right side of sphere $A$.

  Since spheres $A$ and $B$ are touching, the negative charge on the right side of sphere $A$ repels electrons into sphere $B$, causing sphere $B$ to become negatively charged.

  After separation, sphere $A$ retains a net positive charge since it lost electrons to sphere $B$.

  Finally, when the rod is removed, #tgreen[sphere $A$ remains positively charged and sphere $B$ remains negatively charged].
]

=== Grounding 

#let ground-symbol = zap.circuit(zap.earth("ground", (0, 0)))

- A *ground* #box(scale(60%, reflow: true)[#ground-symbol]) is a relatively large conductor which can accept or supply an essentially infinite amount of charge.

  - Examples of grounds include the Earth, your body, or a large metal rod connected to the Earth.

- If electrons are able to freely move between a system and a ground, that system is *grounded*. 
  A grounded system is allowed to reach equilibrium by transferring charge between the system and the ground. 

  - If a system gains excess charge, that charge is transferred to the ground, allowing the
    system to return to a neutral state.



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

// #import "../helpers/efield.typ": net-Efield, draw_streamlines, points-around

// #let efield-1 = cetz.canvas(length: 20pt, {
//   import cetz.draw: *

//   let (p, q) = net-Efield(
//     (1, (-1.5, 0)),
//     (-1, (1.5, 0)),
//   )

//   let charge-radius = 0.4
//   draw_streamlines(
//     p, q,
//     step-size: 0.02,
//     max-steps: 3000,
//     color: black,
//     direction: "forward",
//     arrows: true,
//     seeds: points-around((-1.5, 0), radius: charge-radius, count: 16),
//     dead-zones: ((1.5, 0),),
//   )
//   draw_streamlines(
//     p, q,
//     step-size: 0.02,
//     max-steps: 3000,
//     color: black,
//     direction: "backward",
//     arrows: true,
//     seeds: points-around((1.5, 0), radius: charge-radius, count: 7, start: -67.5deg, step: 22.5deg),
//     dead-zones: ((-1.5, 0),),
//   )

//   circle((1.5, 0), name: "neg", radius: charge-radius, fill: blue)
//   circle((-1.5, 0), name: "pos", radius: charge-radius, fill: red)

//   content("neg", anchor: "center", text(fill: white)[$-q$])
//   content("pos", anchor: "center", text(fill: white)[$+q$])
  
//   // Frame
//   rect((-4, -4), (4, 4), stroke: black)
// })

// #align(center, efield-1)

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

  - If $arrow(E)$ is perpendicular to $dd(arrow(A))$, the flux is maximized.
  - If $arrow(E)$ is parallel to $dd(arrow(A))$, the flux is zero.
  - The dot product ensures that only the component of the electric field perpendicular to the surface contributes to flux.
  - The surface here does not need to be an actual physical surface. It can be an imaginary surface which we use to 
    analyze flux with, called a *Gaussian surface*.

- The symbol $Phi_E$ or $phi_E$ is used to refer to electric flux. It is a scalar quantity. \
  #subtext[(or just $Phi$ if no need to clarify which type of flux)]

- The units for electric flux are $("N" dot "m"^2)/"C"$ which is equivalent to the _volt-meter_, $"V" dot "m"$.

  - The latter unit is taken directly, _newton-meter squared per coulomb_, $unit("N m^2/C")$. 
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
    columns: (3fr, 1.3fr),
    align: (horizon, center),
    [
        A non-uniform electric field $arrow(E) = ang(alpha x y, beta z^2, gamma x + delta y)$ passes through a flat, rectangular surface $S$ as shown in the diagram. What is the electric flux passing through $S$? Assume $x,y,z$ are specified in meters and $alpha, beta, gamma, delta$ are constants with appropriate units.
        #lorange
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

              content((0, 2), anchor: "east", padding: 0.1)[#qty(4, "m")]
              content((2.5, 0), anchor: "south", padding: 0.1)[#qty(5, "m")]
            })

            line((2.5, 2, 0), (2.5, 2, 2), stroke: black, name: "Efield", mark: (end: "straight"))
            content((2.5, 2, 2.0), anchor: "west", padding: 0.15)[$arrow(E)_perp$]
          })
        })
      ]
    ]
  )

  First, since we are only concerned about the component of the electric field that is perpendicular to $S$, we know that our effective electric field is $E = gamma x + delta y$ (i.e. we only consider the $z$-component of the electric field).

  Now, this becomes a simple double integral: $
    Phi_E &= integral.double_S (gamma x + delta y) dd(A) \
    &= integral_(y=0)^#qty(4, "m") integral_(x=0)^#qty(5, "m") (gamma x + delta y) dd(x) dd(y) \
    &= integral_0^#qty(4, "m") evaluated(lr((gamma/2 x^2 + delta y x), size: #150%))_(x=0)^(x=#qty(5, "m")) dd(y) \
    &= integral_0^#qty(4, "m") (25 gamma/2 + 5 delta y) dd(y) \
    &= evaluated(lr((25 gamma/2 y + 5 delta/2 y^2), size: #150%))_0^#qty(4, "m") = cgreen(50 gamma + 40 delta).
  $
]

=== Projection Principle

#let projection-principle-diagram = cetz.canvas({
  import cetz.draw: *

  // Adjusted view angle to match the reference perspective better
  ortho(x: 20deg, y: -35deg, z: 0deg, {
    // --- 1. CONFIGURATION ---
    let flow-len = 4      // Distance between A1 and A2
    let s-size = 1.2      // Half-size of the square surfaces
    
    // Define the 4 corners of A1 (Flat Plane at x=0)
    let a1-tl = (0, -s-size,  s-size)
    let a1-bl = (0, -s-size, -s-size)
    let a1-tr = (0,  s-size,  s-size)
    let a1-br = (0,  s-size, -s-size)

    // Define the 4 corners of A2 (Curved Surface base at x=flow-len)
    // These match A1's y/z coordinates but are shifted down the X-axis
    let a2-tl = (flow-len, -s-size,  s-size)
    let a2-bl = (flow-len, -s-size, -s-size)
    let a2-tr = (flow-len,  s-size,  s-size)
    let a2-br = (flow-len,  s-size, -s-size)

    // Control Point Offsets for the "Bulge" of A2
    // We push the midpoints of the edges OUTWARD in +X and away from center
    let bulge-x = 0.5 // How much it puffs out downstream
    let bulge-y = -0.2 // How much it puffs sideways
    
    let surf-color = gray.lighten(30%).transparentize(30%)

    // --- 2. BACKGROUND (Dashed Lines) ---
    // Connect corners of A1 to corners of A2
    group({
      set-style(stroke: (dash: "dashed", thickness: 1pt, paint: black.lighten(40%)))
      line(a1-tl, a2-tl)
      line(a1-bl, a2-bl)
      line(a1-tr, a2-tr)
      line(a1-br, a2-br)
    })

    // --- 3. DRAW ARROW (Part 1: Entering) ---
    let efield-color = blue.darken(10%)
    let arr-style = (stroke: (thickness: 2pt, paint: efield-color), mark: (end: "triangle", fill: efield-color, scale: 1.2))
    // Arrow from left into A1
    on-layer(-1, {
      line((0, 0, 0), (2, 0, 0), ..arr-style)
      content((2, 0, 0), anchor: "west", padding: 0.1, text(fill: efield-color)[$arrow(E)$])
    })

    // --- 4. SURFACE A1 (Flat) ---
    // Simple polygon
    line(a1-tl, a1-tr, a1-br, a1-bl, close: true, fill: surf-color, stroke: 1.5pt)
    // Label

    // --- 6. SURFACE A2 (Curved "Sail") ---
    // We construct this using 4 bezier curves connecting the 4 corners.
    // The control points are calculated to make it bulge outward.
    
    merge-path(fill: surf-color, stroke: 1.5pt, close: true, {
      // Edge 1: Top (TL -> TR) - Bulges Up (+Z) and Out (+X)
      // Control points: 1/3 and 2/3 along the edge, lifted up/out
      let cp1 = (flow-len + bulge-x, -s-size/2, s-size + bulge-y)
      let cp2 = (flow-len + bulge-x,  s-size/2, s-size + bulge-y)
      bezier(a2-tl, a2-tr, cp1, cp2)

      // Edge 2: Right (TR -> BR) - Bulges Right (+Y) and Out (+X)
      let cp3 = (flow-len + bulge-x, s-size + bulge-y, s-size/2)
      let cp4 = (flow-len + bulge-x, s-size + bulge-y, -s-size/2)
      bezier(a2-tr, a2-br, cp3, cp4)

      // Edge 3: Bottom (BR -> BL) - Bulges Down (-Z) and Out (+X)
      let cp5 = (flow-len + bulge-x,  s-size/2, -(s-size + bulge-y))
      let cp6 = (flow-len + bulge-x, -s-size/2, -(s-size + bulge-y))
      bezier(a2-br, a2-bl, cp5, cp6)

      // Edge 4: Left (BL -> TL) - Bulges Left (-Y) and Out (+X)
      let cp7 = (flow-len + bulge-x, -(s-size + bulge-y), -s-size/2)
      let cp8 = (flow-len + bulge-x, -(s-size + bulge-y),  s-size/2)
      bezier(a2-bl, a2-tl, cp7, cp8)
    })
    
    // Label
    let pos = midpoint3d(a2-tl, a2-br)
    pos.at(0) += bulge-x
  
    on-layer(2, {
      content(midpoint3d(a1-tl, a1-br), anchor: "north", text(fill: black)[$A_1$])
      content(pos, text(fill: black)[$A_2$])
    })

    // --- 7. DRAW ARROW (Part 3: Exiting) ---
    // Start slightly inside A2 so it looks like it emerges from the surface
    on-layer(-1, {
      line((flow-len + bulge-x, 0, 0), (flow-len + bulge-x + 2, 0, 0), ..arr-style)
      content((flow-len + bulge-x + 2, 0, 0), anchor: "west", padding: 0.1, text(fill: efield-color)[$arrow(E)$])
    })
  })
})

#grid(
  columns: (5fr, 4fr),
  align: (horizon, center),
  [
    The _projection principle_ states that the electric flux through a curved surface is equal to the electric flux through the projection of that surface onto a plane perpendicular to the electric field.

    If the direction of the electric field is not constant, we can break the curved surface into many small flat surfaces where the electric field is approximately constant, and apply the projection principle to each small surface.

    This principle holds because for every small patch of area $dd(A)$, the contribution to flux is: $
      dd(Phi_E) = arrow(E) dot dd(arrow(A)) = E dd(A) cos theta = E dd(A_perp).
    $
  ],
  align(center)[
    #projection-principle-diagram
    #subtext[The electric flux through $A_1$ is equal to the electric flux through $A_2$.]
  ]
)

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

- The electric flux through any closed surface is proportional to the net charge enclosed within that surface.

- We can choose any closed surface we want (even imaginary ones) to take advantage of this law. 

- A common strategy is to choose a Gaussian surface which takes advantage of symmetry to make calculating the electric field easier.

  - Where the electric field is perfectly perpendicular to our surface, then it is parallel to $hat(n)$ and $arrow(E) dot dd(arrow(A)) = E dd(A)$ (or $-E dd(A)$ if the field points inwards).

  - Where the electric field is perfectly parallel to our surface, then it is perpendicular to $hat(n)$ and $arrow(E) dot dd(arrow(A)) = 0$.

#let gauss-law-diagram = cetz.canvas({
  import cetz.draw: *
  // standard ortho: x: -45deg, y: 0deg, z: 225deg

  let view-x = -70deg
  let view-y = 0deg
  let view-z = 225deg
  let r = 0.6

  ortho(x: view-x, y: view-y, z: view-z, {
    // Draw the sheet
    on-xz({
      on-layer(-2, {
        rect((-2, -2), (rel: (4, 4)), name: "sheet", fill: red.transparentize(40%))
      })
      content((-1, 1), text(fill: red)[$sigma$])
      // draw a bunch of + on the sheet
      on-layer(-1, {
        for i in (-1, -1/3, 1/3, 1) {
          for j in (-1, -1/3, 1/3, 1) {
            content((i * 1.5, j * 1.5), text(red.transparentize(20%))[$+$])
          }
        }
      })
      // Cross section
      on-layer(1, 
        circle((0, 0), radius: r, stroke: (dash: "dashed"), fill: purple.transparentize(50%))
      )
    })

    // Draw the cylinder
    // Cylinder Body Calculation
    let vx = calc.sin(view-x) * calc.sin(view-z)
    let vz = calc.cos(view-x)

    // Calculate Silhouette Angle
    // The edge is exactly 90 degrees offset from the view direction
    let a = calc.atan2(vx, vz) + 90deg

    let x1 = r * calc.cos(a) 
    let z1 = r * calc.sin(a)
    
    let x1 = r * calc.cos(a)
    let z1 = r * calc.sin(a)
    let x2 = r * calc.cos(a + 180deg)
    let z2 = r * calc.sin(a + 180deg)

    // Define the 4 corners of the cylinder body in 3D (x, y, z)
    // Note: The cylinder extends from y = -2 to y = 2
    let p-bot-1 = (x1, -2, z1)
    let p-mid-1 = (x1,  0, z1)
    let p-top-1 = (x1,  2, z1)
    let p-bot-2 = (x2, -2, z2)
    let p-mid-2 = (x2,  0, z2)
    let p-top-2 = (x2,  2, z2)

    // Draw the shaded body
    on-layer(1, {
      line(p-mid-1, p-top-1, stroke: 1pt)
      line(p-mid-2, p-top-2, stroke: 1pt)
    })
    merge-path(fill: blue.transparentize(20%), stroke: none, {
      line(p-mid-1, p-top-1, p-top-2, p-mid-2)
      on-xz(arc((x2, z2), start: 180deg + a, delta: 180deg, radius: r))
    })

    on-layer(-3, {
      line(p-mid-1, p-bot-1, stroke: 1pt)
      line(p-mid-2, p-bot-2, stroke: 1pt)
    })
    on-layer(-4, {
      merge-path(fill: blue.transparentize(20%), stroke: none, {
        line(p-mid-1, p-bot-1)
        on-xz(y: -2, arc((x2, z2), start: 180deg + a, delta: 180deg, radius: r))
        line(p-bot-2, p-mid-2)
        on-xz(arc((x2, z2), start: 180deg + a, delta: 180deg, radius: r))
      })
    })

    // circular ends
    on-xz(y: 2, {
      circle((0, 0), radius: r, stroke: black, name: "l", fill: blue)
    })
    on-layer(-3, on-xz(y: -2, {
      arc((x2, z2), start: 180deg + a, delta: 180deg, radius: r, stroke: black, name: "r")
      arc((x1, z1), start: a, delta: 180deg, radius: r, 
        stroke: (paint: black.transparentize(90%)), name: "r")
    }))

    on-layer(5, {
      // Label surface
      let start = (-0.2, 2.2, r + 0.6)
      let end = (0, 1.8, r)
      line(start, end, stroke: blue, mark: (end: "straight"))
      content(start, anchor: "north-west", padding: 0.05, text(fill: blue)[$S$])

      // Label cross-sectional area
      let a-start = (r + 0.6, 0, 0)
      let a-end = (r, 0, 0)
      line(a-start, a-end, stroke: purple, mark: (end: "straight"))
      content(a-start, anchor: "south-east", padding: 0.05, text(fill: purple)[$A$])

      // E field arrows
      line((0, 2, 0), (0, 3, 0), stroke: black, mark: (end: "straight"))
      content((0, 3, 0), anchor: "west", padding: 0.1)[$arrow(E)$]

      // Distance d
      let dlabel-z = -r - 0.2
      line((0, 0, 0), (0, 0, dlabel-z), stroke: (dash: "dotted"))
      line((0, 2, 0), (0, 2, dlabel-z), stroke: (dash: "dotted"))
      line((0, 0, dlabel-z), (0, 2, dlabel-z), mark: (start: "straight", end: "straight", length: 0.1))
      content((0, 1, dlabel-z), anchor: "south", padding: 0.1)[$d$]
    })
    on-layer(-5, {
      line((0, -2, 0), (0, -3, 0), stroke: black, mark: (end: "straight"))
      content((0, -3, 0), anchor: "east", padding: 0.1)[$arrow(E)$]
    })
  })
})

#example("Using Gauss' Law to find Electric Field")[
  An infinite sheet of charge has a uniform surface charge density $sigma$. Use Gauss' Law to derive an expression for the electric field a distance $d$ from the sheet. <ex-sheet-of-charge>
  #lorange

  #grid(
    columns: (3fr, 1.6fr),
    align: (horizon, center),
    [
      The first step is to choose the Gaussian surface.
      - The electric field points directly away from the sheet on both sides 
          
      - We can choose a cylindrical surface where the electric field pierces through
            the two circular ends perpendicularly, and is parallel to the curved side of the cylinder. This way, we only have to consider the flux through the two circular ends of the cylinder.
    ],
    gauss-law-diagram,
  )

  Let the area of each circular end be $A$, and have the cylinder extend a distance $d$ on either side of the sheet. We can then let the magnitude of electric field at each end be $E$.

  Let's evaluate the left-hand side of Gauss' Law, the flux integral.

  The electric field is parallel to the curved side of the cylinder, so they contribute no flux. At each circular end, the electric field is perpendicular to the surface, so the flux through each end is simply $E A$. Since there are two ends, the total flux is: $
    Phi_E = E A + E A = 2 E A.
  $

  For the right-hand side, the total charge enclosed by the cylinder is simply the charge on the portion of the sheet inside the cylinder. Since the sheet has a uniform surface charge density $sigma$, the total charge enclosed is: $
    Q_"enclosed" = sigma A.
  $

  Finally, applying Gauss' Law: $
    Phi_E &= Q_"enclosed"/epsilon_0 \
    2 E A &= (sigma A)/epsilon_0 \
    cgreen(E &= sigma/(2 epsilon_0)).
  $
]

=== Conductors in Electrostatic Equilibrium

/*
Describe the electric field within a conductor at equilibrium
Describe the electric field immediately outside the surface of a charged conductor at equilibrium
Explain why if the field is not as described in the first two objectives, the conductor is not at equilibrium
*/

- Remember that in a conductor, electrons are free to move

- If there is an electric field inside the conductor, electrons in the conductor will accelerate.
  - For our conductor to be in *electrostatic equilibrium*, charges cannot be accelerating, or in other words there cannot be an electric field.
  - Thus, _inside_ a conductor at electrostatic equilibrium, $arrow(E) = arrow(0)$.

- By Gauss' Law extra charges in the conductor will be distributed to its surfaces.
  - Choose the Gaussian surface to be any surface completely within the conductor. Since there is no net electric field, there is no electric flux and since $Phi_E prop Q_"enc"$, $Q_"enc" = 0$.
  
- External charges can induce polarization on the conducting object, causing one side of the surface to have an opposite charge than the other side.

=== Introduction to Maxwell's Equations

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

Recall the Divergence Theorem: $
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
  where $rho$ is volumetric charge density, charge per unit volume ($cblue(dd(q) = rho dd(V))$).
]

#pagebreak()

== Electric Dipoles

- An _electric dipole_ consists of two equal and opposite charges of magnitude $q$ separated by a distance $d$.

- The *electric dipole moment* $arrow(p)$ is a vector that points from the negative charge to the positive charge, with magnitude $p = q d$.

  - Thus, the quantity $d$ is often expressed as $arrow(d)$, with its direction pointing from the negative charge to the positive charge. This way, we can express the dipole moment as: $
    arrow(p) = q arrow(d).
  $

#define("Electric Dipole Moment")[
  Let two charges $+q$ and $-q$ be separated by a distance $d$. Then the *electric dipole moment* of the system is:
  $
    arrow(p) = q arrow(d)
  $
  Such that $arrow(d)$ has magnitude $d$ and points from $-q$ to $+q$.
]

- An electric dipole is *permanent* if the two charges are fixed in place #footnote[That is, they will always remain a fixed distance $d$ apart], and *induced* (or _temporary_) if the two charges are free to move and are induced by an external electric field.

- A permanent electric dipole can then be treated as a rigid "rod" which experiences a torque when placed in an external electric field $arrow(E)$. Specifically, the torque $arrow(tau)$ is given by: $
  arrow(tau) = arrow(p) times arrow(E) = q arrow(d) times arrow(E).
$

  - Notice that the dipole experiences rotational equilibrium $tau = 0$ when $arrow(p)$ is parallel, or _aligned with_, the electric field. 

  - The potential energy $U_p$ of a dipole in an electric field is given by: $
      U_p = -arrow(p) dot arrow(E) = -q arrow(d) dot arrow(E).
    $
    It represents the work available to rotate the dipole from its current orientation to a state of zero potential energy (alignment).


#pagebreak()