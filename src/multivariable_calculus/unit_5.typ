#import "/helpers/template.typ": *
#show: set_unit_number.with(5)

= Vector Calculus

== Vector Fields

== Line Integrals

== Fundamental Theorem of Line Integrals

Recall the *Fundamental Theorem of Calculus*, which says that the integral of a function's derivative is the difference of the function's values at the endpoints: $
  integral_a^b f'(x) dd(x) = f(b) - f(a)
$

We can generalize this theorem by noticing that:
- the _integral_ is the _sum of little changes_ from $a$ to $b$
  - each _little change_ in $f$ is the differential $dd(f) = f'(x) dd(x)$
- $f(b) - f(a)$ is the _total change_ in $f$ from $a$ to $b$, which we can call $Delta f$
- so, the sum of little changes in $f$ from $a$ to $b$ is equal to the total change in $f$ from $a$ to $b$:  $ display(integral_a^b dd(f) = Delta f = f(b) - f(a)). $ 

The fundamental theorem would imply that given some function $f$, the sum of little changes in $f$ over some curve is equal to the total change in $f$ from the start of the curve to the end. 

We know the total differential of $f(x, y, z)$ is $dd(f) = pdv(f,x) dd(x) + pdv(f,y) dd(y) + pdv(f,z) dd(z)$. Each total differential $dd(f)$ can be interpreted as a "little change in $f$". If $arrow(p)$ and $arrow(q)$ are the start and end points of some curve $C$, then by the fundamental theorem, we can say: $
  integral_C dd(f) = Delta f = f(arrow(q)) - f(arrow(p)).
$

Realize that the $dd(f) = pdv(f,x) dd(x) + pdv(f,y) dd(y) + pdv(f,z) dd(z)$ can be represented as the dot product $grad f dot dd(arrow(r))$, since $grad f = ang(pdv(f,x), pdv(f,y), pdv(f,z))$ and $dd(arrow(r)) = ang(dd(x), dd(y), dd(z))$. 
Thus, this gives us the form:

#define("Fundamental Theorem of Calculus for Line Integrals")[
  Let $C$ be a curve that starts at displacement $arrow(p)$ and ends at displacement $arrow(q)$, and $f$ is a function such that $grad f$ is continuous on $C$. Then: 
  $
    integral_C grad f dot dd(arrow(r)) = f(arrow(q)) - f(arrow(p))
  $
  #align(right)[for any function $f(arrow(r))$.]
]

We can think of $grad f$ as the "little changes in $f$" and integrating over $grad f$ over the curve $C$ gives us the net change of $f$ over the boundary of $C$, which are the endpoints.

If $C$ is parameterized using $t$, then since $dd(arrow(r)) = arrow(r')(t) dd(t)$, we can write: $
  integral_a^b grad f(arrow(r)(t)) dot arrow(r')(t) dd(t) = f(arrow(r)(b)) - f(arrow(r)(a)).
$

Note that if $C$ is piecewise-defined, even though the integral over $C$ is improper, the gradient theorem would hold due to properties of integrals (we can split the integral apart).

=== Conservative Vector Fields

The gradient theorem tells us that the line integral of $grad f$ along two different paths is equal, as long as the paths start and end in the same position. In other words, if $C_1$ and $C_2$ have the same initial and terminal points, then: $
  integral_(C_1) grad f dot dd(arrow(r)) = integral_(C_2) grad f dot dd(arrow(r)).
$

In other words, if a vector field $bf(F)$ can be represented as the gradient of some function $f$ (if there exists an $f$ such that $bf(F) = grad f$), then the line integral $integral_C bf(F) dot dd(arrow(r)) = integral_C grad f dot dd(arrow(r))$ is independent of path and only depends on the initial and terminal points of $C$. 

Vector fields which meet this condition ($bf(F) = grad f$) are known as *conservative vector fields*. 

== Green's Theorem

Often, line integrals can be difficult to compute. *Green's Theorem* states that a line integral can be evaluated as the result of a double integral.

#define("Green's Theorem")[  
  Let $D$ be the region bounded by the curve $C$ and $bf(F) = chevron.l F_x, F_y chevron.r$. Then:
  $
    integral.cont_C bf(F) dot dd(bf(r)) = integral.cont_C (F_x dd(x) + F_y dd(y)) = integral.double_D ( pdv(F_y, x) - pdv(F_x, y) ) dd(A)
  $
  #align(right)[#subtext[if $C$ is *simple, closed, and positively-oriented*.]]
]

=== Constraints of Green's Theorem

- *Simple closed curves.* Recall that _simple_ means the curve does not cross itself. _Closed_ means the curve will start and end at the same point.

- *Orientation.* The definition above applies only for _positively oriented_ curves, i.e. those that move counterclockwise. If you followed the curve, its interior should be to your left. If the curve is _negatively oriented_, then we must negate the sign of the double integral: $
    integral.cont_C bf(F) dot dd(bf(r)) = -integral.double_D (pdv(F_y,x) - pdv(F_x,y)) dd(A)
  $
  #align(right)[#subtext[if $C$ is *simple, closed, and #underline[negatively]-oriented*.]]

== Divergence and Curl

Recall 

#define("Divergence of a Vector Field")[
  The divergence of a vector field $bf(F)(x, y, z) = ang(F_x, F_y, F_z)$ is: $
    "div" thin bf(F) = grad dot bf(F) = pdv(F_x, x) + pdv(F_y, y) + pdv(F_z, z). 
  $
]

The notation $grad dot bf(F)$ can be used to represent divergence, treating $grad$ as a vector of partial derivative operators: $
  grad dot bf(F) = ang(pdv(,x), pdv(,y), pdv(,z)) dot ang(F_x, F_y, F_z) = pdv(,x)F_x + pdv(,y)F_y + pdv(,z). 
$

We will use this definition of $grad$ to derive the _curl_ of a vector field:

#define("Curl of a Vector Field")[
  The curl of a vector field $bf(F)(x, y, z) = ang(F_x, F_y, F_z)$ is: $
    "curl" thin bf(F) = grad times bf(F) = ang(pdv(,x), pdv(,y), pdv(,z)) times ang(F_x, F_y, F_z).
  $

  By the determinant definition of the cross product, this gives: $
    grad times bf(F) = mat(delim: "|", hat(i), hat(j), hat(k); pdv(,x), pdv(,y), pdv(,z); F_x, F_y, F_z) = mat(pdv(F_z,y) - pdv(F_y,z); pdv(F_x,z)-pdv(F_z,x); pdv(F_y,x)-pdv(F_x,y))
  $
]

== Surface and Volume Integrals

== Stokes' Theorem

#define("Stokes' Theorem")[
  $
    integral.double_D (grad times bf(F)) dot hat(n) dd(A) = integral.cont_C bf(F) dot dd(arrow(r))
  $
]

#define("Generalized Stokes' Theorem")[
  Let $S$ be some $n$-dimensional orientable manifold and $partial S$ be the boundary of that manifold in $n-1$ dimensions. Then: $
    integral_S dd(omega) = integral_(partial S) omega.
  $
]

This theorem generalizes the general theme of the fundamental theorems of calculus, which always go something along the lines of "the integral of some differential ("sum of little changes") over some boundary is equal to the total change over the boundary.

== Flux Integrals and the Divergence Theorem

#define("Divergence Theorem")[
  $
    integral.triple_V (grad dot bf(F)) dd(V) = integral.surf_S bf(F) dot hat(n) dd(A).
  $
  
]
