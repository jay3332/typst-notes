#import "../../helpers/template.typ": *
#import "helpers.typ": *
#import "@preview/unify:0.7.1": unit, qty
#import "@preview/zap:0.5.0"
#import "@preview/cetz:0.4.2"
#import "@preview/wrap-it:0.1.1": wrap-content

#show: set_unit_number.with(3)

#pagebreak()

= Electric Current and Circuits

== Electric Current

#define("Average and Instantaneous Electric Current")[
  Let $q$ be the amount of charge that passes through an arbitrary surface in a time interval $Delta t$. The *average electric current* $I_"avg"$ is: $
    I_"avg" = q / (Delta t).
  $
  The *instantaneous electric current* $I$ is the time-derivative of flowing charge:
  $
    I = dv(q, t).
  $
]

- Electric current can be thought of as the rate of flow of _positive_ electric charge.
  - But electrons are the charge carriers that actually moving, and they are negative. So, electric current is the _negative_ rate of flow of electrons.

- Often, current is interpreted as the charge that moves through the cross section of a conductor, since charges can't really "flow" through nonconductors anyways.

- The SI unit of electric current is the _Ampere_ ($"A"$, "amp"), where $1 "A" = 1 "C/s"$.
  - In fact, the Ampere is an SI _base unit_, and Coulombs are defined in terms of Amperes ($"C" = "A" dot "s"$).

=== Current Density

- The *current density* $arrow(J)$ is describes the _electric current per unit area_: $J = I slash A$.

- *Current density is a vector* which points in the direction of positive current flow.

- Combining these properties, we can roughly see that $display(arrow(J) = dv(I, A) hat(v))$, where $hat(v)$ is a unit vector in the direction of current flow. Formally:

#define("Electric Current (Current Density Definition)")[
  Let $I$ be the electric current through a surface $S$. Then: $
    I = integral.double_S arrow(J) dot dd(arrow(A))
  $
  where:
  - $arrow(J)$ is the *current density* vector, which points in the direction of current flow and has magnitude equal to the current per unit area ($J = dv(I, A)$).
  - $dd(arrow(A))$ is the area vector differential, which points perpendicular to the surface and has magnitude equal to the area of the differential element.
]

- Current density is measured in _amperes per square meter_ ($"A/m"^2$).

=== Drift Velocity

- Each charge carrier (e.g. electron) has a certain *drift velocity* $arrow(v)_d$ which is the average velocity of the charge carriers in the direction of current flow. The current density can also be expressed as: $
    arrow(J) = n q arrow(v)_d
  $
  where $n$ is the number of charge carriers per unit volume, and $q$ is the charge of each carrier. \
  #subtext[It can be interpreted that $rho = n q$, where $rho$ is volumetric charge density. However, since charges are moving, we can only give an "average" charge carrier density which we call $n$.]

  - Drift velocities are often very small (on the order of $10^(-4) "m/s"$), but the electric field that causes the drift propagates at nearly the speed of light, so the effect of turning on a current is almost instantaneous.

  - The current density is proportional to drift velocity by a factor of $n q$.

- By the definition of current density, we can also express current as: $
    I = integral.double_S arrow(J) dot dd(arrow(A)) = integral.double_S n q arrow(v)_d dot dd(arrow(A)).
  $
  In a wire, the current density is usually uniform across the cross-sectional area, and the drift velocity is parallel to the $dd(arrow(A))$ (i.e. we are taking a perpendicular cross section), so this simplifies to: $
    I = n q v_d A.
  $

#pagebreak()

== Electric Circuits

- An *electric circuit* is a closed loop of conductive material through which electric current can flow.
  - This conductive material is called a *wire* and along an #underline[isolated] piece of wire, electric potential is constant (this makes sense because $Delta V = 0$ inside a conductor)

- The *circuit elements* are the components of a circuit that affect the flow of current, such as resistors, capacitors, inductors, and voltage sources.
  - Circuit elements have the ability to create potential differences, and thus an electric field within wires to move charges.

=== Voltage Sources & Electromotive Force

#let bat = zap.circuit(battery("bat", (0, 0), (1, 0)))
#let bat2 = zap.circuit(
  battery("bat", (0, 0), (1, 0), width: .15, cells: 2)
)
#let bat3 = zap.circuit(
  battery("bat", (0, 0), (1, 0), width: .12, cells: 3)
)

- A *voltage source* is a circuit element that creates a potential difference $Delta V$ between the two *terminals*. The side with the higher potential is usually referred to as the *positive terminal*, and the other end is called the *negative terminal*.  
  - An example of a voltage source is a *battery* #inline-circuit(bat), which maintains the potential difference via a chemical reaction. 
    - In a circuit diagram, the positive terminal of a voltage source is usually denoted by a longer line, while the negative terminal is denoted by a shorter line.

    - A battery may consist of multiple *cells* connected together, where each cell contributes a certain amount of potential difference. For example, a 9V battery may consist of six 1.5V cells connected in series. *Multicell batteries* are denoted by multiple pairs of lines, e.g. #inline-circuit(bat2) for two cells or #inline-circuit(bat3) for three cells.

  - By the conservation of charge, the same amount of charge pushed through one terminal must eventually return back on the other terminal. 


#define("Electromotive Force")[
  The *electromotive force* (emf) $varcal(E)$ of a voltage source is the amount of work done by the source to move a unit charge from the negative terminal to the positive terminal: $
    varcal(E) = W / q.
  $
  It is the "ideal" potential difference that the voltage source would create if no current were flowing (i.e. if there was no internal resistance). 
]
- The emf is a measure of the energy provided by the voltage source per unit charge.

- The emf of a voltage source is the voltage across the two terminals when _no current is flowing_.
  - When current flows, some energy is lost due to heat (#link(<internal-resistance>)[internal resistance]), meaning the actual effective potential difference across the terminals is less than the emf.

- Electromotive force is also measured in Volts (energy per unit charge)!

#pagebreak()

== Ohm's Law and Resistors

- *Conductivity* $sigma$ is a measure of how easily electric current can flow through a material. The higher the conductivity, the easier it is for current to flow.

- The *resistivity* $rho$ is the reciprocal of conductivity ($rho = 1 slash sigma$) and is a measure of how much a material resists the flow of electric current. 

#define("Ohm's Law (Microscopic)")[
  Let $arrow(J)$ be the current density through a material with conductivity $sigma$, and let $arrow(E)$ be the electric field within that material. Then:
  $
    arrow(J) = sigma arrow(E) #h(1em) <--> #h(1em) arrow(E) = rho arrow(J).
  $
  _The current density within a wire is proportional to the magnitude of the electric field by a factor $sigma$ called the *conductivity*._
]

- Ohm's Law tells us that an electric field will drive current through a material, and more conductive materials will allow more current to flow per unit electric field.

  - Conversely, a material with higher resistivity will require a stronger electric field to drive the same amount of current.

- We can find the conductivity or resistivity of a material by comparing the current density and electric field within the material:
  $
    sigma = J / E #h(1em) <--> #h(1em) rho = E / J.
  $

- Certain materials have a resistivity that changes with temperature. For example, the resistivity of a metal increases with temperature, while the resistivity of a semiconductor decreases with temperature.

  - Take a material with resistivity $rho_0$ at some temperature $T_0$. If the temperature changes to $T$ and the new resistivity is $rho$, then $rho$ follows the following relation:
    $
      rho = rho_0 (1 + alpha (T - T_0)).
    $
    We call $alpha$ the *temperature coefficient of resistivity* of the material. 


#pagebreak()

=== Resistance

From the equation $E = rho J$, we can derive the concept of *resistance* $R$ for a wire. Consider a wire with length $L$ and cross-sectional area $A$. The current density is $J = I slash A$, and the electric field is $E = Delta V slash L$. Substituting these into the equation: $
  (Delta V) / L = (rho I) / A #h(1em) -> #h(1em) Delta V = cblue((rho L) / A) I.
$ 

We can then define $R = rho L slash A$:

#define("Resistance")[
  The *resistance* $R$ of a wire describes how much the wire resists the flow of electric current. It depends on the resistivity $rho$ of the wire's material, the wire's length $L$, and cross-sectional area $A$: $
    R = (rho L) / A = L / (sigma A).
  $
]

- That is, the longer wires have more resistance and thicker wires have less resistance.

- Substituing $R$ back into the equation used to derive it, we get $Delta V = cblue(R) I$. This is another form of Ohm's Law, measuring the voltage required to drive a unit of current through the wire.
  
#define("Ohm's Law (Macroscopic)")[
  The current $I$ flowing across a wire with voltage $Delta V$ across it is given by *Ohm's Law*: $
    I = (Delta V) / R #h(1em) <--> #h(1em) Delta V = I R #h(1em) <--> #h(1em) R = (Delta V) / I.
  $
]
  
- The unit of resistance is the _ohm_ ($Omega$), where $1 Omega = 1 "V/A"$.

  - From this definition, we get the units for resistivity and conductivity: #unit("O m") and $1 / #unit("O m")$ respectively.  

- *Conductance* $G$ is the reciprocal of resistance ($G = 1 slash R$) and is a measure of how easily electric current can flow through a wire:
  $
    I = G Delta V #h(1em) <--> #h(1em) Delta V = I / G #h(1em) <--> #h(1em) G = I / (Delta V).
  $

==== Internal Resistance & Terminal Voltage <internal-resistance>

- Batteries in real life have an *internal resistance* $r$. This means that the battery itself resists the flow of current, and thus the potential difference across the terminals is not equal to the emf $varcal(E)$ of the battery. The true potential difference across the terminals, called the *terminal voltage*, is: $
  Delta V = V_"terminal" = varcal(E) - I r.
$
  - We can technically represent internal resistance by coupling together an ideal battery and a resistor with resistance $r$. The "fake" resistor is drawn on the side of the _positive_ terminal.

  - An *ideal battery* is one without internal resistance.

#note[
  While resistivity and conductivity are inherent properties of _materials_, resistance
  and conductance further depend on geometric properties of the wire.
  
   For example, 
  while the _resistivity_ of copper is always the same, a long thin copper wire will have more _resistance_ than a short thick copper wire.
]

#let resistor-symbol = zap.circuit(
  zap.resistor("res", (0, 0), variant: "ieee")
)
#let resistor-series = zap.circuit({
  zap.resistor("res", (-1, 0), (1, 0), variant: "ieee", label: $R_1$)
  zap.resistor("res", (1, 0), (3, 0), variant: "ieee", label: $R_2$)
})
#let resistor-parallel = zap.circuit({
  let h = 0.7
  zap.resistor("res", (0, h), (3, h), variant: "ieee", label: $R_1$)
  zap.resistor("res", (0, -h), (3, -h), variant: "ieee", label: (content: $R_2$, anchor: "south"))
  zap.wire((-1, 0), (0, 0))
  zap.wire((0, -h), (0, h))
  zap.wire((3, -h), (3, h))
  zap.wire((3, 0), (4, 0))
})

=== Resistors

- A *resistor* #inline-circuit(resistor-symbol) is a circuit element that has a specific resistance $R$ and is used to control the flow of electric current in a circuit.

- Only _some_ resistors obey Ohm's Law, meaning that current through the resistor increases linearly with supplied voltage (i.e. $I prop Delta V$, and we call the constant of proportionality the resistance $R$). In other words, the resistance is constant, no matter the voltage supplied.

  - A resistor that obeys Ohm's Law is an *ohmic* resistor. Otherwise, it is a *non-ohmic* resistor.

  - Non-ohmic resistors have a resistance that changes with the voltage across them. For example, a light bulb is a non-ohmic resistor because its filament heats up as current flows through it, which increases its resistance.


  - To check if a resistor is ohmic, check if $inlinedv(V, R) = "some constant" I$.
==== Resistors in Series

Resistors placed in series have their potential differences add up, which means that:

$
  Delta V_"eq" = I & R_"eq" = Delta V_1 + Delta V_2 + ... + Delta V_n &&= I R_1 + I R_2 + ... + I R_n \
  &cgreen(R_"eq" &&= R_1 + R_2 + ... + R_n).
$

*In series, resistors share the same current but have different potential differences.*
$ #scale(resistor-series, 80%, reflow: true) $

==== Resistors in Parallel

Resistors placed in parallel have their currents add up but share the same potential difference, which means that:
#grid(
  columns: (1fr, 1fr),
  align: horizon + center,
  $
    I_"eq" &= I_1 + I_2 + ... + I_n \
    (Delta V) / R_"eq" &= (Delta V) / R_1 + (Delta V) / R_2 + ... + (Delta V) / R_n \
    cgreen(1/R_"eq" &= 1/R_1 + 1/R_2 + ... + 1/R_n).
  $,
  scale(resistor-parallel, 80%, reflow: true)
)

*In parallel, resistors share the same potential difference but have different currents.*
#pagebreak()

=== Electrical Measuring Instruments

#let ammeter-symbol = zap.circuit(zap.ammeter("i1", (0, 0), (2, 0)))
#let voltmeter-symbol = zap.circuit(zap.voltmeter("i1", (0, 0), (2, 0)))
#let ohmmeter-symbol = zap.circuit(zap.ohmmeter("i1", (0, 0), (2, 0)))

- An *ammeter* #inline-circuit(ammeter-symbol) is a tool used to measure a current at a specific point in a circuit.
  - Ammeters should be connected in series with the circuit element whose current we are measuring
  - Ideal ammeters have zero resistance (such that there is no current drop)

- A *voltmeter* #inline-circuit(voltmeter-symbol) is a tool used to measure the potential difference between two points in a circuit.
  - Voltmeters should be connected in parallel with the circuit element across which we are measuring the potential difference.
  - Ideal voltmeters have infinite resistance (such that no current wants to flow through them) 

- An *ohmmeter* #inline-circuit(ohmmeter-symbol) is a tool used to measure the resistance of a circuit element. It works by sending a small current through the element and measuring the potential difference across it, then using Ohm's Law to calculate the resistance.
  - Effectively, an ohmmeter is a combination of an ammeter and a voltmeter.

#pagebreak()

== Electric Power

- Recall that mechanical *power* $P$ is the rate at which work is done: $P = inlinedv(W, t)$.

- *Electrical power* $P_e$ is the rate at which electrical energy is transferred by an electric circuit: $
  P_e = dv(W_e, t) = -dv(U_e, t).
$

  - The electrical power delivered to a circuit element is the rate at which the element "absorbs" electrical energy, causing the element's electric potential energy to decrease.

- We know that when charges move through a potential difference $Delta V$, they lose potential energy according to $Delta U_e = q Delta V$. In other words, the electric field does $-q Delta V$ amount of work on the charges.

  Thus, the power delivered to a circuit element is: $
    P_e = dv(W_e, t) = -dv(U_e, t) = dv(, t)(q Delta V) = cgreen(-I Delta V).
  $

- If a circuit element is _supplying_ power, then the power is positive, so:

#define("Electrical Power")[
  The *electrical power* $P_e$ supplied by a circuit element is given by: $
    P_e = I Delta V.
  $
  Note that $Delta V$ is the potential difference across the circuit element, *not* the emf!
]

- Using Ohm's Law, we can also express power in terms of current and resistance: $
  P_e = I Delta V &= I (I R)                 &&= cgreen(I^2 R). \
                  &= ((Delta V) / R) Delta V &&= cgreen((Delta V)^2 / R).
$

#pagebreak()

== Kirchhoff's Rules

=== Kirchhoff's Loop Rule

*Kirchhoff's Loop Rule* is a statement about conservation of energy. Because the electric force is conservative, if a charge starts and ends at the same place in a circuit, it must have the same amount of mechanical energy: $Delta U_e = 0$.

This means that the sum of the potential differences across all circuit elements in a _closed_ loop is zero: $
  sum_i Delta V_i = 0.
$

This is simply an application of the FTC for line integrals: $
  integral.cont_C dd(V) = -integral.cont_C arrow(E) dot dd(arrow(r)) = - integral.cont_C grad V dot dd(arrow(r)) = V(arrow(r)) - V(arrow(r)) = 0.
$

In this case, it is important to keep track of the signs of $Delta V_i$. Sometimes, voltage _gains_ (from emfs like batteries) are separated from voltage _drops_ (from resistors and capacitors):
$
  sum_i Delta V_i = sum_i Delta V_"gain" - sum_i Delta V_"drop" = 0 #h(1em) -> #h(1em) sum_i Delta V_"gain" = sum_i Delta V_"drop".
$
#rsubtext[_The sum of all voltage gains is equal to the sum of all voltage drops._]

Again, circuit components can cause either voltage gains or drops:

- Passing from the negative terminal to the positive terminal of a voltage source causes a voltage gain, while passing from the positive terminal to the negative terminal causes a voltage drop.

- Passing through a resistor or capacitor in the direction of current flow causes a voltage drop
  - If we pass through a resistor or capacitor _against_ the direction of current flow, then it causes a voltage gain.

=== Kirchhoff's Junction Rule

*Kirchhoff's Junction Rule* is a statement about conservation of charge. The total current flowing into a junction must equal the total current flowing out of the junction: $
  sum_i I_"in" = sum_i I_"out".
$

A *junction* is a point in a circuit where charges have to possibility of taking more than one path.

#let junction = zap.circuit({
  zap.wire((-1, 0), (0, 0))
  zap.wire((0, -1), (0, 1))
  zap.wire((0, 1), (2, 1))
  zap.wire((0, -1), (2, -1))
  zap.node("junct1", (0, 0))
  
})

#junction

#let example-circuit = zap.circuit({
  zap.resistor("r1", (0, 0), (0, 4), variant: "ieee", label: $R_1$)
  zap.resistor("r2", (1, 1.5), (1, 4), variant: "ieee", label: (content: $R_2$, anchor: "south"))
  battery("bat2", (1, 1.5), (1, 0), label: $varcal(E)$, show-polarity: true)
  zap.wire((0, 4), (2, 4))
  zap.resistor("r3", (2, 4), (4, 4), variant: "ieee", label: $R_3$)
  zap.wire((0, 0), (7, 0))
  zap.wire((4, 4), (5, 4))
  battery("bat", (4, 4), (4, 2), label: $varcal(E)_1$, show-polarity: true)
  zap.ammeter("amm", (5, 4), (7, 4))
  zap.resistor("r4", (7, 4), (7, 0), label: (content: $R_4$, anchor: "south"), variant: "ieee")
  zap.switch("sw", (4, 2), (4, 0), variant: "ieee", closed: false, label: $S$)
  zap.node("n1", (4, 1.4))
  zap.node("n2", (4, 0.6))
  zap.wire((7, 0.7), (8, 0.7))
  zap.wire((7, 3.3), (8, 3.3))
  zap.voltmeter("vm", (8, 0.7), (8, 3.3))
})

#pagebreak()

== Resistor-Capacitor (RC) Circuits

#let rc-circuit = zap.circuit({
  battery("bat", (0, 0), (0, -2), label: (content: $varcal(E)$, anchor: "south"), cells: 2, width: .15, show-polarity: true)
  zap.capacitor("cap", (3, 0), (3, -2), variant: "ieee", label: $C$)
  zap.resistor("res", (0, 0), (3, 0), variant: "ieee", label: $R$)
  zap.switch("sw", (0, -2), (3, -2), variant: "ieee", closed: true)
})

=== Charging an RC Circuit

#wrap-content(rc-circuit, align: right, [
  An *RC-circuit* is a circuit which is equivalent to one with a resistor and a capacitor.

  Let's assume that before we close the circuit, the capacitor is uncharged. We can assign $q(t)$ to represent the charge on the capacitor, so $q(0) = 0$.

  When we close the circuit, the battery will start pushing charge through the circuit, and the capacitor will start charging up. We call this *charging the capacitor*.
])

As the capacitor charges, it creates a voltage drop across itself, which reduces the current flowing through the circuit. *Eventually, the capacitor will become fully charged and the current will stop flowing.*
That is, the capacitor will act as an open wire once it has reached capacity!

By Kirchhoff's Loop Rule, we can write an equation for the circuit: $
  varcal(E) - Delta V_R - Delta V_C = 0 space ==> space varcal(E) = Delta V_R + Delta V_C.
$
We closed the switch, so there should be some current $i = inlinedv(q, t)$. The voltage drop across the resistor is $V_R = I R$, and the voltage drop across the capacitor is $V_C = q slash C$. Substituting these into the equation, we get a first-order differential equation which allows us to solve for $q(t)$: 
$
  varcal(E) = i R + q / C 
  #h(1em) -> #h(1em) varcal(E) = R dv(q, t) + 1 / C q
  #h(1em) -> #h(1em) cblue(q(t) = C varcal(E) (1 - e^(-t / (R C)))).
$

Similarly, we can find the current at any time $t$ by taking the time derivative of $q(t)$: $
  i(t) = dv(, t)q(t) = varcal(E) / R e^(-t / (R C)).
$

Since the potential difference across the capacitor is $Delta V_C = q slash C$, we can also find $Delta V_C$ at any time $t$: $
  Delta V_C (t) = q(t) / C = varcal(E) (1 - e^(-t / (R C))).
$

The quantity $tau = R C$ is called the *RC time constant* of the circuit.
- After a time $t = tau$, the charge on the capacitor will have reached about 63% of its final value, and the current will have dropped to about 37% of its initial value.
- Using the time constant, we can rewrite our equations:
  $
    q(t) = C varcal(E) (1 - e^(-t slash tau)) 
    #h(3em) i(t) = varcal(E) / R e^(-t slash tau)
    #h(3em) Delta V_C (t) = varcal(E) (1 - e^(-t slash tau))
  $

Note the following limits:
- $display(lim_(t -> oo) q(t)) = C varcal(E)$: After a very long time, the capacitor approaches its maximum charge of $q_"max" = C varcal(E)$.

- $i(0) = varcal(E) slash R "and" display(lim_(t -> oo) i(t)) = 0$: The current starts at its maximum value of $i_"max" = varcal(E) slash R$ and eventually drops to zero.

- $display(lim_(t -> oo) Delta V_C (t)) = varcal(E)$: After a very long time, the voltage across the capacitor approaches its maximum value of $Delta V_"C,max" = varcal(E)$.

=== Discharging an RC Circuit

#let rc-circuit-2 = zap.circuit({
  zap.wire((0, 0), (0, -2))
  zap.capacitor("cap", (3, 0), (3, -2), variant: "ieee", label: $C$)
  zap.resistor("res", (0, 0), (3, 0), variant: "ieee", label: $R$)
  zap.switch("sw", (0, -2), (3, -2), variant: "ieee", closed: true)
})

#wrap-content(rc-circuit-2, align: right, [
  Now, let's assume that we have an RC-circuit with a fully charged capacitor, so $q(0) = q_0$. Then, the battery used to charge the capactor is removed, and now the capacitor is allowed to discharge through the resistor. We call this *discharging the capacitor*.

  By Kirchhoff's Loop Rule, we can write an equation for the circuit: $
    Delta V_R + Delta V_C = 0.
  $
  Substituting $Delta V_R = I R$ and $Delta V_C = q slash C$ into the equation, we get: $
    R dv(q, t) + 1 / C q = 0 #h(1em) -> #h(1em) cblue(q(t) = q_0 e^(-t / (R C))).
  $
])

If we assume we started from a fully charged capacitor via emf $varcal(E)$, then $q_0 = C varcal(E)$, so we can rewrite as: $
  q(t) = C varcal(E) e^(-t / (R C)).
$

Using $i = inlinedv(q, t)$ and $Delta V_C = q slash C$, we can find the current and voltage across the capacitor at any time $t$: 
$
  i(t) = dv(, t)q(t) = -varcal(E) / R e^(-t / (R C)) 
  #h(3em) Delta V_C (t) = q(t) / C = varcal(E) e^(-t / (R C)).
$

Using the time constant $tau = R C$, we can rewrite our equations:
$
  q(t) = C varcal(E) e^(-t slash tau) 
  #h(3em) i(t) = -varcal(E) / R e^(-t slash tau)
  #h(3em) Delta V_C (t) = varcal(E) e^(-t slash tau)
$

Realize that:
- $display(lim_(t -> oo) q(t)) = 0$: After a very long time, the capacitor will be fully discharged and have zero charge.

- $i_"discharging" (t) = -i_"charging" (t)$: The current during discharging is the same as the current during charging, but in the opposite direction. It still decays to zero over time.

- $display(lim_(t -> oo) Delta V_C (t)) = 0$: After a very long time, the voltage across the capacitor will drop to zero.

#import "@preview/cetz-plot:0.1.3": plot

#let graph-q-max = 1
#let graph-t-max = 4

#let q-graph = cetz.canvas({
  plot.plot(size: (6, 3),
    x-min: 0,
    x-max: graph-t-max,
    x-tick-step: 1,
    x-format: (x) => if x == 0 [0] else if x == 1 [$tau$] else [$#x tau$],
    x-grid: true,
    x-label: [Time since charging, $t$],
    y-min: 0,
    y-max: 1.2 * graph-q-max,
    y-tick-step: none,
    y-ticks: ((graph-q-max, $C varcal(E)$),),
    y-label: [Charge on capacitor, $q$],
    {
      plot.add(
        domain: (0, graph-t-max),
        style: (stroke: blue + 1pt),
        (t) => graph-q-max * (1 - calc.exp(-t))
      )
      // Asymptote at 1.0
      plot.add-hline(graph-q-max, style: (stroke: (paint: gray, dash: "dashed")))
    }
  )
})

#v(3em)
#align(center, q-graph)

#pagebreak()