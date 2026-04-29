#import "../../helpers/template.typ": *
#import "helpers.typ": inline-circuit, battery
#import "@preview/unify:0.7.1": unit, qty
#import "@preview/zap:0.5.0"
#import "@preview/cetz:0.4.2"

#show: set_unit_number.with(6)
#show math.ell: varell

= Alternating Current (AC) Circuits

== AC Signals and Phasors

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

- A sinusoidal signal $V_0 cos (omega t + phi)$ is completely described by:
  - its *amplitude* $V_0$,
  - its *angular frequency* $omega$ (or equivalently, its frequency $f = omega slash (2 pi)$ or its period $T = 1 slash f$),
  - its *phase* or *phase shift* $phi$.

  The phase $phi$ represents a horizontal shift of the signal. If $phi > 0$, then the signal is shifted to the left by $abs(phi) slash omega$ seconds, and if $phi < 0$, then the signal is shifted to the right by $abs(phi) slash omega$ seconds.

#pagebreak()

=== Phasors

To analyze a sinusoidal AC circuit, we can use *phasors*, which encode both the amplitude and phase of 
sinusoidal signals into complex numbers. 

#rsubtext[Visually, a phasor can be thought of as a vector in the complex plane.]

#note[
  Since $i$ is already used to represent current, we will use $j$ to represent the imaginary number.
]

#let Re = "Re"
#let Im = "Im"

Take a sinusoidal signal $V(t) = V_0 cos(omega t)$. The phasor for this signal is $tilde(V) (t) = V_0 e^(j omega t)$.
Realize that $V(t) = Re(tilde(V)(t)) = Re(V_0 e^(j omega t))$, since by Euler's formula:
$
  Re(tilde(V)(t)) = Re(V_0 e^(j omega t)) = V_0 Re(cos(omega t) + j sin(omega t)) = V_0 cos(omega t).
$

Similarly, if our signal has a phase shift $phi$ ($V(t) = V_0 cos(omega t + phi)$), the phasor is $tilde(V)(t) = V_0 e^(j (omega t + phi))$.
We can also write this phasor in *polar form* as $tilde(V) = V_0 thin angle phi$, writing both the amplitude $V_0$ and phase $phi$
in a compact way. The term $angle phi$ implicitly represents $e^(j (omega t + phi))$.

#define("Phasor Representation of Sinusoidal Signals")[
  A sinusoidal signal $V(t) = V_0 cos(omega t + phi)$ can be represented as its *phasor* $tilde(V)(t)$ 
  by adding an imaginary component $V_0 sin(omega t + phi) j$ to $V(t)$:
  $
    tilde(V) (t) = V_0 e^(j (omega t + phi)).
  $
  The *polar form* of the phasor is $tilde(V) = V_0 thin angle phi$, where $V_0$ is the magnitude and $phi$ is the _phase_, and the frequency $omega$ is inferred from the context of the circuit. The term $angle phi$ implicitly represents $e^(j (omega t + phi))$.
]

- Visually, the phasor $tilde(V)$ is a "vector" of length $V_0$ that rotates counterclockwise in the complex plane at an angular velocity of $omega$. By projecting $tilde(V)$ onto the real axis, we obtain the voltage $V(t)$ at any given time.

  - Two phasors $tilde(u)(t) = u_0 thin angle phi_1$ and $tilde(y)(t) = v_0 thin angle phi_2$ with the same angular velocity $omega$ can be added together as follows:
    $
      tilde(u)(t) + tilde(v)(t) &= u_0 e^(j (omega t + phi_1)) + v_0 e^(j (omega t + phi_2)) \
      &= (u_0 e^(j phi_1) + v_0 e^(j phi_2)) e^(j omega t) \
      &= (u_0 cos phi_1 + v_0 cos phi_2 + j (u_0 sin phi_1 + v_0 sin phi_2)) e^(j omega t) \
      &= (u_0 cos phi_1 + v_0 cos phi_2) e^(j omega t) + j (u_0 sin phi_1 + v_0 sin phi_2) e^(j omega t) \
      &= (Re(tilde(u)) + Re(tilde(v))) + j (Im(tilde(u)) + Im(tilde(v))). \
    $
    On the complex plane, this is just the vector sum of the two phasors $tilde(u)$ and $tilde(v)$. That is,
    phasors can be added together using vector addition.

- Realize that if $tilde(V) (t) = V_0 e^(j omega t)$, then $inlinedv(tilde(V), t) = j omega V_0 e^(j omega t)$. This means that taking the time-derivative of a phasor corresponds to multiplying it by $j omega$. Since $j = e^(j pi slash 2)$, the phase is shifted counterclockwise by $pi slash 2$ radians (i.e. 90 degrees) when we take the time derivative of a phasor. In general,

  $
    dv(, t) (V_0 thin angle phi) = cblue(j omega) V_0 thin angle phi = V_0 omega thin angle (phi + pi / 2).
  $

  - Conversely, _integrating_ a phasor corresponds to _dividing_ by $j omega$, i.e. phase shift _clockwise_ by $pi slash 2$:
    $
      integral V_0 thin angle phi dd(t) = V_0 / cblue(j omega) thin angle phi = V_0 / omega thin angle (phi - pi / 2).
    $
    This comes from the fact that $1 slash j = -j = -e^(j pi slash 2)$.

- If two phasors have the same phase shift, then they are said to be *in phase*.
  - If a phasor $tilde(u)$ is shifted counterclockwise by $theta$ relative to another phasor $tilde(v)$, then
    $tilde(u)$ is said to *lead* $tilde(v)$ by $theta$, and $tilde(v)$ is said to *lag* $tilde(u)$ by $theta$, and if $theta equiv.not 0 thin(mod 2 pi)$, then $tilde(u)$ and $tilde(v)$ are said to be *out of phase*.

  - If $tilde(u)$ and $tilde(v)$ have a phase difference of $pi$ radians, then $tilde(u)$ and $tilde(v)$ are _perfectly_ out of phase.

#pagebreak()

== Reactance and Impedance

=== Reactance

The *reactance* $X$ of a circuit element measures how much it opposes the flow of _alternating_ current.

If $V(t)$ and $I(t)$ have an absolute phase difference of exactly $theta$, then the reactance $X$ of the circuit element is defined as:
$
  X = V_0 / I_0 sin theta.
$

If $V(t)$ and $I(t)$ are exactly $90 degree$ out of phase, then $sin theta = 1$, and the reactance is simply the ratio of the voltage amplitude to the current amplitude: $X = V_0 slash I_0$, so we get an Ohm-like relationship:
$
   X = V_0 / I_0 #h(1em) -> #h(1em) V_0 = I_0 X
$

- *Reactance of a resistor.* Let an AC circuit provide a voltage source given by $V_R (t) = V_0 cos(omega t).$ If the circuit contains a resistor with resistance $R$, then by Ohm's Law, the current through the resistor is:
  $
    I_R (t) = (V_R (t)) / R = V_0 / R cos(omega t).
  $

  Since $V_R (t)$ and $I(t)$ are in phase, the reactance of a resistor is $0$ ($sin 0 = 0$). This means that a resistor does not oppose the flow of _alternating_ current, i.e. it doesn't prevent the current from oscillating back and forth in the circuit.
  #rsubtext[This can be thought of as the fact that a resistor dissipates energy as heat and never returns any power back to the circuit, \ unlike capacitors or inductors.]

  Since $V_R (t)$ is in phase with $i(t)$, their phasors $tilde(V)_R$ and $tilde(i)$ are also in phase.

- *Reactance of a capacitor.* Let an AC circuit provide a potential difference across a capacitor $C$ given by $V_C (t) = V_0 cos(omega t).$
  Then, the charge stored on a capacitor at time $t$ is given by $q(t) = C V_C (t)$, so:
  $
    i(t) = dv(q, t) = C dv(V_C, t) = -C V_0 omega sin(omega t) = C V_0 omega cos(omega t + pi / 2) -> I_0 = C V_0 omega.
  $

  Since $V_C (t)$ and $i(t)$ are $90 degree$ out of phase, the reactance of a capacitor is $X_C = V_0 slash I_0 = 1 slash (C omega)$:

  #define("Capacitive Reactance")[
    The *capacitive reactance* $X_C$ of a capacitor with capacitance $C$ 
    in an AC circuit with angular frequency $omega$ is:
    $
      X_C = 1 / (C omega).
    $
  ]

  Realize that $i (t)$ is exactly $90 degree$ _ahead_ of $V_C (t)$. Since $tilde(i)$ is in phase with $tilde(V)_R$, in 
  a circuit with both a resistor and a capacitor, $tilde(V)_R$ _leads_ $tilde(V)_C$ by $90 degree$ (voltage across resistor leads voltage across capacitor by $90 degree$).

- *Reactance of an inductor.* The voltage across an inductor is given by $V_L (t) = L inlinedv(i, t)$. 
  Let a voltage source provide an AC voltage $V_L (t) = V_0 cos(omega t)$ across an inductor with inductance $L$, so:
  $
    L dv(i, t) = V_0 cos(omega t) #h(1em) -> #h(1em) dv(i, t) &= V_0 / L cos(omega t) \
    i(t) &= V_0 / L integral cos(omega t) dd(t) \
    &= V_0 / (L omega) sin(omega t) = V_0 / (L omega) cos(omega t - pi / 2) -> I_0 = V_0 / (L omega).
  $

  Since $V_L (t)$ and $i(t)$ are $90 degree$ out of phase, the reactance of an inductor is $X_L = V_0 slash I_0 = L omega$:

  #define("Inductive Reactance")[
    The *inductive reactance* $X_L$ of an inductor with inductance $L$ 
    in an AC circuit with angular frequency $omega$ is:
    $
      X_L = L omega.
    $
  ]

  Realize that $V_L (t)$ is exactly $90 degree$ _ahead_ of $i(t)$, so $tilde(V)_L$ _leads_ $tilde(i)$ by $90 degree$.
  Since $tilde(i)$ is in phase with $tilde(V)_R$, in a circuit with both a resistor and an inductor, $tilde(V)_L$ _leads_ $tilde(V)_R$ by $90 degree$ (voltage across inductor leads voltage across resistor by $90 degree$).

In a circuit with a resistor, capacitor, and inductor, the voltage across the inductor leads the voltage across the resistor by $90 degree$, which leads the voltage across the capacitor by $90 degree$. 
- In other words, $tilde(V)_L$ leads $tilde(V)_R$ by $90 degree$, which leads $tilde(V)_C$ by $90 degree$. 
- This also means that $tilde(V)_L$ leads $tilde(V)_C$ by $180 degree$, i.e. $tilde(V)_L$ and $tilde(V)_C$ are perfectly out of phase.

=== Impedance

The *impedance* $Z$ of a circuit element is a generalization of resistance that applies to AC circuits. It is defined as the ratio of the voltage phasor to the current phasor:
$
  Z = tilde(V) / tilde(I) #h(1em) -> #h(1em) tilde(V) = Z tilde(I).
$

Since $tilde(V)$ and $tilde(I)$ are complex functions, the impedance $Z$ is a complex number! In fact, the impedance of a circuit element can be expressed in terms of its resistance $R$ and reactance $X$ as follows:
$
  Z = R + j X.
$

Thus, we can redefine the reactance $X$ of a circuit element as the imaginary part of its impedance:
$
  X = Im(Z).
$

- *Impedance of a resistor.* Let an AC circuit provide a voltage source given by $V(t) = V_0 cos(omega t + phi)$ across a resistor with resistance $R$, so the phasor for this voltage is $tilde(V)_R = V_0 thin angle phi$. Then:
  $
    tilde(i) = tilde(V)_R / R = V_0 / R thin angle phi.
  $
  By the definition of impedance:
  $
    Z_R = tilde(V)_R / tilde(i) = (V_0 thin angle phi) / (V_0 slash R thin angle phi) = cgreen(R).
  $
  Since $Z_R$ has no imaginary part, we prove that reactance of a resistor is $0$.

- *Impedance of a capacitor.* Let an AC circuit provide a potential difference across a capacitor $C$ given by $V_C (t) = V_0 cos(omega t + phi)$, so the phasor for this voltage is $tilde(V)_C = V_0 thin angle phi$. Then, the charge stored on a capacitor at time $t$ is given by $q(t) = C V_C (t)$, so:
  $
    tilde(i) = dv(q, t) = C dv(tilde(V)_C, t) = C dv(, t) V_0 e^(j (omega t + phi)) = C V_0 cblue(j omega) e^(j (omega t + phi)) = C V_0 j omega thin angle phi.
  $

  Then the impedance of the capacitor is:
  $
    Z_C = tilde(V)_C / tilde(i) = (V_0 thin angle phi) / (C V_0 j omega thin angle phi) = cgreen(1 / (j omega C) = -j / (omega C)).
  $

  Since $Z_C$ has no real part, we prove that the resistance of a capacitor is $0$ (it dissipates no energy) and the reactance of a capacitor is $-1 slash (omega C)$. #footnote[Use the absolute value to obtain $X_C = 1 slash (omega C)$.]

- *Impedance of an inductor.* Let a voltage source provide an AC voltage $V_L (t) = V_0 cos(omega t + phi)$ across an inductor with inductance $L$, so the phasor for this voltage is $tilde(V)_L = V_0 thin angle phi$. Then:
  $
    V_0 thin angle phi = L dv(tilde(i), t) #h(1em) -> #h(1em) dv(tilde(i), t) &= V_0 / L thin angle phi \
    tilde(i) &= V_0 / L integral angle phi dd(t) 
    &= V_0 / L integral e^(j (omega t + phi)) dd(t)
    &= V_0 / (L j omega) e^(j (omega t + phi)) = V_0 / (L j omega) thin angle phi.
  $
  Then the impedance of the inductor is:
  $
    Z_L = tilde(V)_L / tilde(i) = (V_0 thin angle phi) / (V_0 slash (L j omega) thin angle phi) = cgreen(j omega L).
  $

  Since $Z_L$ has no real part, we prove that the resistance of an inductor is $0$ (it dissipates no energy) and the reactance of an inductor is $omega L$.



#pagebreak()

== LRC Circuits with AC Sources

#define("Impedance in LRC Circuits")[
  Let an AC circuit provide a voltage source $V(t) = V_0 cos(omega t + phi)$ across a series LRC circuit with resistance $R$, inductance $L$, and capacitance $C$. Then, the impedance of the circuit is:
  $
    Z = R + j (X_L - X_C) = R + j (omega L - 1 / (omega C)).
  $
  The magnitude of the impedance is:
  $
    abs(Z) = sqrt(R^2 + (X_L - X_C)^2)
    = sqrt(R^2 + (omega L - 1 / (omega C))^2).
  $
]

$arg Z = arctan((X_L - X_C) / R)$

=== Resonance in AC Circuits

$
  omega_r = 1 / sqrt(L C)
$

$
  Q = omega_r / (Delta omega) = 1 / R sqrt(L / C)
$

== Power in AC Circuits



=== AC Transformers

#pagebreak()