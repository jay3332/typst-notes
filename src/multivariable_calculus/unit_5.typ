#import "/helpers/template.typ": *
#show: set_unit_number.with(5)

= Vector Calculus

== Vector Fields

- A *vector field* assigns a vector to every point in space.
  - In other words, it maps $RR^n -> RR^n$. It is a function that takes in $n$ inputs and outputs a vector
    with $n$ components.

- A vector field in two-dimensions ($RR^2$) can be represented as: $
    arrow(F)(x, y) = ang(P(x, y), Q(x, y)).
  $
  Here, $P$ and $Q$ are called the *component functions* of $arrow(F)$.

- Similarly, a vector field in three-dimensions ($RR^3$) can be represented as: $
    arrow(F)(x, y, z) = ang(P(x, y, z), Q(x, y, z), R(x, y, z)).
  $

- In a general sense, a "field" assigns quantities to every point in space.
  - We can generalize this by saying a *scalar field* assigns a scalar to every point in space.
    It is a function $RR^n -> RR$ that takes in $n$ inputs and outputs a single scalar value. 

- Examples of where vector fields are used:
  - Fluid flow: the velocity of a fluid at different points in space
  - Electromagnetism: electric and magnetic fields
  - Force fields: the force at different points in space (such as gravitational)
  - *Gradient fields*: the gradient of a scalar function is a vector field

=== Introduction to Conservative Vector Fields

A recurring theme in vector calculus is the idea of *conservative vector fields*. These are vector fields that can be represented as the gradient of some scalar function. Conservative vector fields have special properties that make them easier to work with.

Formally, a vector field $arrow(F)$ is *conservative* if there exists a scalar function $f$ such that $arrow(F) = grad f$. The function $f$ is called a *potential function* for the vector field.

We will explore conservative vector fields further beginning in Section 5.3.

#example("Is a Vector Field Conservative?")[
  Show that the vector field $arrow(F)(x, y) = $
]

#pagebreak()

== Line Integrals

- Line integrals allow us to integrate along any curve in space, rather than just along one axis.
  - Instead of integrating over an interval $[a, b]$, we integrate along a curve $C$.
  - Moving along $C$ can involve changes in multiple dimensions at once.

- A line integral is 

#define("Line Integral of Scalar Fields")[
  The line integral of a scalar field $f(arrow(r)(t))$ from $t=a$ to $t=b$ along a curve $C$ parameterized by $arrow(r)(t)$ is given by: $
    integral_C f(arrow(r)) dd(s) = integral_a^b f(arrow(r)(t)) abs(arrow(r')(t)) dd(t).
  $
]

- Examples of where line integrals are used:
  - Calculating work done by a force field along a path
  - The mass of a wire with varying density.

#example("Evaluating a Line Integral")[
  Evaluate the line integral $display(integral_C (2 + x^2 y) dd(s))$, where $C$ is the upper half of the circle $x^2 + y^2 = 1$ from $(1,0)$ to $(-1,0)$.

  #lorange

  First, parameterize the curve $C$. A suitable parameterization is: $
    arrow(r)(t) = ang(cos t, sin t) #h(60pt) 0 <= t <= pi.
  $

  Use this parameterization to find $dd(s) = abs(arrow(r')(t)) dd(t)$:
  $
    arrow(r')(t) = ang(-sin t, cos t) \ dd(s) = abs(arrow(r')(t)) dd(t) = sqrt((-sin t)^2 + (cos t)^2) = sqrt(sin^2 t + cos^2 t) dd(t) = cblue(1 dd(t)).
  $

  Plug in $cred(x = cos t)$ and $cpurple(y = sin t)$ from the parameterization into the integrand: $
    2 + cred(x)^2 cpurple(y) = 2 + (cred(cos t))^2 cpurple(sin t).
  $

  Thus, the line integral becomes: $
    integral_C (2 + cred(x)^2 cpurple(y)) cblue(dd(s)) = integral_0^(pi) (2 + (cred(cos t))^2 cpurple(sin t)) cblue(1 dd(t)) = integral_0^(pi) (2 + cos^2 t sin t) dd(t).
  $

  Evaluate the integral: $
    integral_0^(pi) (2 + cos^2 t sin t) dd(t) = evaluated((2t - (cos^3 t)/3))_0^(pi) = (2pi + 1/3) + 1/3 = cgreen(2pi + 2/3).
  $
]

=== Classifying Curves

It important to classify curves correctly when working with line integrals, since some properties and theorems
of line integrals are only valid for line integrals over certain types of curves.

- A curve is *simple* if it does not cross itself.

- A curve is *closed* if it starts and ends at the same point.
  - A closed curve divides the plane into an "interior" and "exterior" region.

- A curve is *positively oriented* if it moves counterclockwise around its interior region.
  - If you followed the curve, its interior should be to your left.
  - A curve that moves clockwise is *negatively oriented*.

- A curve is *smooth* if its parameterization $arrow(r)(t)$ is differentiable (and $arrow(r')(t) != arrow(0)$ for all $t$).
  - A curve is *piecewise-smooth* if it can be broken into a finite number of smooth segments.

=== Classifying Regions

- A region is *open* if we do not include its boundary. (think of a $<$ inequality instead of $<=$)
  - Otherwise, the region is *closed*.

- A region is *connected* if any two points in the region can be connected by a path that lies entirely within the region.
  (Think connected graph) 

- A region is *simply connected* if it is connected and has no holes.
  - In other words, any closed curve within the region can be continuously shrunk to a point without leaving the region.

=== Line Integrals of Vector Fields

When moving along a curve, we originally defined infinitesimal movements along the curve as $dd(s) = sqrt(dd(x)^2 + dd(y)^2)$ (in 2D at least). This was suitable for line integrals of scalar fields.

Integrating over a vector field means we must somehow sum up the product of the vector field and the movement along the curve as we move along it. There are many ways we can do this:

1. Continue using $dd(s)$: $integral_C arrow(F) dd(s)$. This gives us a vector result.

2. Use the component of the vector field aligned with the direction of movement along the curve (the tangent vector): $integral_C arrow(F) dot dd(arrow(r))$. This gives us a scalar result.

These are all line integrals over vector fields, but the one which has the most applicability is the second one,
which is interpreted as the work done by the vector field along the curve.

When moving along a curve $C$ parameterized by $arrow(r)(t)$, the infinitesimal displacement vector is given by $dd(arrow(r)) = ang(dd(x), dd(y))$. We find that $dd(arrow(r)) = arrow(r')(t) dd(t) = ang(x'(t), y'(t)) dd(t)$ by the fundamental theorem.

#define("Line Integral of Vector Fields")[
  The line integral of a vector field $arrow(F)$ from $t=a$ to $t=b$ along a curve $C$ parameterized by $arrow(r)(t)$ is given by: $
    integral_C arrow(F) dot dd(arrow(r)) = integral_a^b arrow(F)(arrow(r)(t)) dot arrow(r')(t) dd(t).
  $
  In the case of $RR^2$, if $arrow(F) = ang(P, Q)$, then we can also write out the dot product: $
    integral_C arrow(F) dot dd(arrow(r)) = integral_C P dd(x) + Q dd(y).
  $
]

We can turn a line integral of a vector field into a normal integral by realizing that $P$ is a function of $x(t)$ and $y(t)$ and $dd(x)$ and $dd(y)$ can be expanded to be in terms of $t$: $
  integral_C P dd(x) + Q dd(y) = integral_a^b lr((P(x(t), y(t)) x'(t) dd(t) + Q(x(t), y(t)) y'(t)), size: #200%) dd(t).                                                                     
$

#example("Evaluating Line Integral of a Vector Field")[

]

#example("Work Done by a Force Field")[]

#pagebreak()

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

#define("Fundamental Theorem of Calculus for Line Integrals (Gradient Theorem)")[
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

In other words, if a vector field $arrow(F)$ can be represented as the gradient of some function $f$ (if there exists an $f$ such that $arrow(F) = grad f$), then the line integral $integral_C arrow(F) dot dd(arrow(r)) = integral_C grad f dot dd(arrow(r))$ is independent of path and only depends on the initial and terminal points of $C$. 

Vector fields which meet this condition ($arrow(F) = grad f$) are known as *conservative vector fields*. We call the function $f$ a *potential function* for the vector field $arrow(F)$.

#define("Conservative Vector Field")[
  A vector field $arrow(F)$ is *conservative* if there exists a function $f$ such that $arrow(F) = grad f$. In this case, $f$ is called a *potential function* for $arrow(F)$.
]

==== Applying the Gradient Theorem to Conservative Vector Fields

If $arrow(F)$ is conservative,
we can apply the gradient theorem to find line integrals over $arrow(F)$ easily by evaluating the potential function $f$
at the endpoints of the curve.

In $RR^2$, this means if we can define $arrow(F) = ang(P, Q)$, then $grad f = arrow(F) ==> ang(pdv(f,x), pdv(f,y)) = ang(P, Q)$. This is a system of equations that we can solve to find $f$.

#example("Finding a Potential Function")[
  Find a potential function for the conservative vector field $arrow(F)(x, y) = ang(2x y, x^2)$.
  #lorange
  We need to find $f$ such that $grad f = arrow(F)$. This gives us the system of equations: $
    pdv(f,x) = 2x y #h(60pt) pdv(f,y) = x^2
  $

  Partial integratation of the first equation with respect to $x$ gives: $
    f(x, y) = integral 2x y dd(x) = x^2 y + g(y).
  $

  Next, we differentiate this expression for $f$ with respect to $y$: $
    pdv(f,y) = x^2 + g'(y).
  $

  Setting this equal to the second equation from our system, we have: $
    x^2 + g'(y) = x^2 ==> g'(y) = 0.
  $

  Integrating this gives $g(y) = C$. Thus, a potential function for the vector field is: $
    cgreen(f(x, y) = x^2 y + C).
  $
]

#pagebreak()

== Green's Theorem

Often, line integrals can be difficult to compute. *Green's Theorem* states that a line integral over a closed path can be evaluated as a double integral over the region enclosed by the path.

#define("Green's Theorem")[  
  Let $D$ be the region bounded by the closed curve $C$ and $arrow(F) = ang(P, Q)$. Then:
  $
    integral.cont_C arrow(F) dot dd(arrow(r)) = integral.cont_C (P dd(x) + Q dd(y)) = integral.double_D ( pdv(Q, x) - pdv(P, y) ) dd(A)
  $
  #align(right)[#subtext[if $C$ is *simple, closed, and positively-oriented*.]]
]

=== Constraints of Green's Theorem

- *Simple closed curves.* Recall that _simple_ means the curve does not cross itself. _Closed_ means the curve will start and end at the same point.

- *Orientation.* The definition above applies only for _positively oriented_ curves, i.e. those that move counterclockwise. If you followed the curve, its interior should be to your left. If the curve is _negatively oriented_, then we must negate the sign of the double integral: $
    integral.cont_C arrow(F) dot dd(arrow(r)) = -integral.double_D (pdv(Q,x) - pdv(P,y)) dd(A) "if" C "is negatively oriented."
  $

#example("Evaluating a Line Integral using Green's Theorem")[
  Use Green's Theorem to evaluate the line integral $display(integral.cont_C (x^2 - y) dd(x) + (x + y^2) dd(y))$, where $C$ is the positively-oriented triangle with vertices at $(0,0)$, $(1,0)$, and $(1,1)$.

  #lorange

  First, we identify $P(x,y) = x^2 - y$ and $Q(x,y) = x + y^2$. Next, we compute the partial derivatives: $
    pdv(Q,x) = pdv(, x)(x + y^2) = 1 #h(60pt) pdv(P,y) = pdv(, y)(x^2 - y) = -1.
  $

  Thus, $pdv(Q,x) - pdv(P,y) = 1 - (-1) = 2$. 

  Next, we need to find the area of the triangular region $D$ bounded by $C$. The triangle has a base and height of length $1$, so its area is $A_D = (1 dot 1)/2 = 1/2$.

  Finally, we can apply Green's Theorem: $
    integral.cont_C (x^2 - y) dd(x) + (x + y^2) dd(y) = integral.double_D 2 dd(A) = 2 A_D = 2 (1/2) = 1.
  $
]

#example("Green's Theorem with a Polar Integral")[
  Let $arrow(F) = ang(y^2, 3x y)$. Use Green's Theorem to evaluate the line integral $display(integral.cont_C arrow(F) dot dd(arrow(r)))$, where $C$ is the positively-oriented circle of radius $2$ centered at the origin.

  #lorange

  First, identify $P = y^2$ and $Q = 3x y$ and compute the partial derivatives: $
    pdv(Q,x) = pdv(, x)(3x y) = 3y #h(60pt) pdv(P,y) = pdv(, y)(y^2) = 2y.
  $

  Thus, $pdv(Q,x) - pdv(P,y) = 3y - 2y = y$.

  Next, set up the polar integral for the right side of Green's Theorem: $
    integral.cont_C arrow(F) dot dd(arrow(r)) = integral.double_D y dd(A) = integral_0^(2pi) integral_0^2 underbrace(r sin theta, y) underbrace(r dd(r) dd(theta), dd(A)).
  $

  #rsubtext[We are integrating over the whole circle of radius $2$, so $theta$ goes from $0$ to $2pi$ and $r$ goes from $0$ to $2$.]

  Evaluate the integral: $
    integral_0^(2pi) integral_0^2 r^2 sin theta dd(r) dd(theta) 
    &= integral_0^(2pi) sin theta dd(theta) integral_0^2 r^2 dd(r) \
    &= evaluated(lr((-cos theta), size: #200%))_0^(2pi) evaluated(((r^3)/3))_0^2 \
    &= ( -cos(2pi) + cos(0) ) ( (8/3) - 0 ) = 0.
  $
]

#example("Deriving the Area of an Ellipse using Green's Theorem")[
  An ellipse centered at the origin is given by the parametric representation $arrow(r)(t) = ang(a cos t, b sin t)$ for $0 <= t < 2pi$. Use Green's Theorem to find the area of the ellipse.

  #lorange

  If we want the right-hand side of Green's Theorem to equal the area of the enclosed region, we want $pdv(Q,x) - pdv(P,y) = 1$. _Any_ functions $P$ and $Q$ that satisfy this will work.

  Let's choose $P = 0$ and $Q = x$. This gives $pdv(Q,x) - pdv(P,y) = 1 - 0 = 1$.

  Thus, by Green's Theorem: $
    integral.cont_C 0 dd(x) + x dd(y) = integral.double_D 1 dd(A) = A_"ellipse" ==> A_"ellipse" = integral.cont_C x dd(y).
  $ 

  We know $x = a cos t$ and $y = b sin t ==> dd(y) = b cos t dd(t)$. Thus: $
    A_"ellipse" = integral_0^(2pi) a cos t (b cos t) dd(t) = a b integral_0^(2pi) cos^2 t dd(t).
  $

  Using the identity $cos^2 t = (1 + cos(2t))/2$, we have: $
    A_"ellipse" = (a b)/2 integral_0^(2pi) (1 + cos(2t)) dd(t) = (a b)/2 [ t + (1/2) sin(2t) ]_0^(2pi) = (a b)/2 (2pi - 0) = cgreen(pi a b).
  $
]

#pagebreak()

== Divergence and Curl

Scalar fields have gradients to describe how they change in space. Vector fields have two analogous operations to describe how they change in space: *divergence* and *curl*.

#define("Divergence of a Vector Field")[
  The divergence of a vector field $arrow(F)(x, y, z) = ang(P, Q, R)$ is: $
    "div" thin arrow(F) = grad dot arrow(F) = pdv(P, x) + pdv(Q, y) + pdv(R, z). 
  $
]

The notation $grad dot arrow(F)$ can be used to represent divergence, treating $grad$ as a vector of partial derivative operators: $
  grad dot arrow(F) = ang(pdv(,x), pdv(,y), pdv(,z)) dot ang(P, Q, R) = pdv(P, x) + pdv(Q, y) + pdv(R, z). 
$

We will use this definition of $grad$ to derive the _curl_ of a vector field:

#define("Curl of a Vector Field")[
  The curl of a vector field $arrow(F)(x, y, z) = ang(P, Q, R)$ is: $
    "curl" thin arrow(F) = grad times arrow(F) = ang(pdv(,x), pdv(,y), pdv(,z)) times ang(P, Q, R).
  $

  By the determinant definition of the cross product, this gives: $
    grad times arrow(F) = mat(delim: "|", hat(i), hat(j), hat(k); pdv(,x), pdv(,y), pdv(,z); P, Q, R) = mat(pdv(R,y) - pdv(Q,z); pdv(P,z)-pdv(R,x); pdv(Q,x)-pdv(P,y))
  $
]

#example("Finding Divergence and Curl")[
  Find the divergence and curl of the vector field $arrow(F)(x, y, z) = ang(x^2 y, y^2 z, z^2 x)$.
  #lorange
  The divergence is: $
    grad dot arrow(F) = pdv(x^2 y, x) + pdv(y^2 z, y) + pdv(z^2 x, z) = 2x y + 2y z + 2z x.
  $

  The curl is: $
    grad times arrow(F) = mat(delim: "|", hat(i), hat(j), hat(k); pdv(,x), pdv(,y), pdv(,z); x^2 y, y^2 z, z^2 x) = ang(-2y z, -2x z, 2x y).
  $
]

=== Properties of Divergence and Curl

- The divergence of a vector field is scalar, while the curl of a vector field is a vector.
- The divergence and curl operators are linear:
  - $"div" (a arrow(F) + b arrow(G)) = a "div" arrow(F) + b "div" arrow(G)$
  - $"curl" (a arrow(F) + b arrow(G)) = a "curl" arrow(F) + b "curl" arrow(G)$
- *The curl of a conservative vector field is zero.* (see derivation below)
  - If $arrow(F) = grad f$, then $"curl" thin arrow(F) = grad times grad f = arrow(0)$.

#derivation("Proof: Conservative vector fields have zero curl")[
  Let $arrow(F) = grad f$ be a conservative vector field. Then, by the definition of curl: $
    "curl" thin arrow(F) = grad times arrow(F) = grad times (grad f) = mat(delim: "|", hat(i), hat(j), hat(k); pdv(,x), pdv(,y), pdv(,z); pdv(f,x), pdv(f,y), pdv(f,z)).
  $

  Evaluating this determinant gives: $
    grad times (grad f) = ang(
      (partial^2 f)/(partial y partial z) - (partial^2 f)/(partial z partial y),
      (partial^2 f)/(partial z partial x) - (partial^2 f)/(partial x partial z),
      (partial^2 f)/(partial x partial y) - (partial^2 f)/(partial y partial x)
    ).
  $

  By Clairaut's Theorem, the mixed partial derivatives are equal, so each component of this vector is zero. Thus: $
    cgreen("curl" arrow(F) = ang(0, 0, 0) = arrow(0)).
  $
]

==== 2D Curl

In two dimensions, we can treat a vector field $arrow(F)(x, y) = ang(P, Q)$ as a three-dimensional vector field with the third component equal to zero: $arrow(F)(x, y, z) = ang(P, Q, 0)$. The curl of this is: $
  grad times arrow(F) = mat(delim: "|", hat(i), hat(j), hat(k); pdv(,x), pdv(,y), pdv(,z); P, Q, 0) = ang(0, 0, pdv(Q,x) - pdv(P,y)).
$

The magnitude of this curl vector is simply $pdv(Q,x) - pdv(P,y)$, which is a scalar. Thus, in two dimensions, we can define the curl as a scalar quantity: $
  "2d-curl" thin arrow(F) = pdv(Q,x) - pdv(P,y).
$

- In 2D, vector fields can only curl along one plane (the plane of the field itself), so there is no need
  to represent the curl as a vector.
- 


=== Interpreting Divergence and Curl

- *Divergence* measures how much a vector field is "spreading out" or "converging" at a point.
  - A positive divergence indicates a "source" where vectors are spreading out ("diverging").
  - A negative divergence indicates a "sink" where vectors are converging.
  - A vector field with zero divergence is called a *solenoidal* or *incompressible* vector field.

- *Curl* measures the tendency of a vector field to rotate around a point.
  - A non-zero curl indicates rotational behavior in the field.
  - The direction of the curl vector indicates the axis of rotation, following the right-hand rule. 
  - A vector field with zero curl is called an *irrotational* vector field.

=== Extension: Laplacian Operator

The *Laplacian* of a scalar function $f$, $nabla^2 f$, is the divergence of its gradient: $
  nabla^2 thin f = grad dot grad f = npdv(f,x,2) + npdv(f,y,2) + npdv(f,z,2).
$

A function $f$ is called *harmonic* if its Laplacian is zero: $
  nabla^2 thin f = 0 space ==> space f"is harmonic."
$

#pagebreak()

== Surface and Flux Integrals

=== Surface Integrals

Recall that we can take line integrals over scalar fields by integrating along little pieces of length $dd(s)$ along a curve $C$.
These pieces $dd(s)$ represent little changes in displacement along the curve, and we derived that $dd(s) = abs(arrow(r')(t)) dd(t)$ in the arc length unit.

Similarly, we can take *surface integrals* over scalar fields by summing up little pieces of surface area $dd(S)$ over a surface $S$. In the surface area unit, we derived the two formulas for $dd(S)$:
 - For a parametric surface $arrow(r)(u, v)$: $dd(S) = abs(arrow(r)_u times arrow(r)_v) dd(u) dd(v).$
 - For a surface defined as $z = g(x, y)$: $dd(S) = sqrt(1 + (g_x)^2 + (g_y)^2) dd(A).$

#define("Surface Integral")[
  The surface integral of a scalar field $f(arrow(r)(u, v))$ over a parametric surface $S$ parameterized by $arrow(r)(u, v)$ is given by: $
    integral.double_S f(arrow(r)(u,v)) dd(S) = integral.double_D f(arrow(r)(u, v)) abs(arrow(r)_u times arrow(r)_v) dd(u) dd(v).
  $
  #rsubtext[where $D$ is the domain of the parameters $u$ and $v$.]

  If we let $arrow(r)(x,y) = ang(x,y,g(x,y))$ which defines the surface $z = g(x,y)$, we find that: 
  $ integral.double_S f(x,y,z) dd(S) = integral.double_D f(x,y,g(x,y)) sqrt(1 + (g_x)^2 + (g_y)^2) dd(A). $
]

#example("Surface Integral over a Parametric Surface")[
  Find $display(integral.double_S) x y z dd(S)$ if $S$ is the cone $arrow(r)(u, v) = ang(u cos v, u sin v, u)$
  ($0 <= u <= 3$ and $0 <= v <= pi/2$).
  #lorange
  First, compute $dd(S) = abs(arrow(r)_u times arrow(r)_v) dd(u) dd(v)$: $
    arrow(r)_u = ang(cos v, sin v, 1) #h(60pt) arrow(r)_v = ang(-u sin v, u cos v, 0) \
    arrow(r)_u times arrow(r)_v = mat(delim: "|", hat(i), hat(j), hat(k); cos v, sin v, 1; -u sin v, u cos v, 0) = ang(-u cos v, -u sin v, u)
  $
  $
    dd(S) = abs(arrow(r)_u times arrow(r)_v) dd(u) dd(v) &= sqrt((-u cos v)^2 + (-u sin v)^2 + u^2) dd(u) dd(v) \
    & = sqrt(u^2 (cos^2 v + sin^2 v + 1)) dd(u) dd(v) = sqrt(2 u^2) = cblue(sqrt(2) u dd(u) dd(v)). 
  $

  Next, plug in the parameterization into the integrand: $
    x y z = (u cos v)(u sin v)(u) = u^3 cos v sin v.
  $

  Thus, the surface integral becomes: $
    integral.double_S x y z cblue(dd(S)) = integral_0^(pi/2) integral_0^3 (u^3 cos v sin v) (cblue(sqrt(2) u dd(u) dd(v))) = sqrt(2) integral_0^(pi/2) cos v sin v dd(v) integral_0^3 u^4 dd(u).
  $

  Evaluate the integral: $
    sqrt(2) evaluated((sin^2 v)/2)_0^(pi/2) evaluated((u^5)/5)_0^3 = sqrt(2) (1/2 - 0) (243/5 - 0) = cgreen((243 sqrt(2))/10).
  $
]

#example("Surface Integral over a Function-Defined Surface")[]

=== Flux Integrals

Just like how we were able to take line integrals not only over scalar fields but also over vector fields, we can do the same with surface integrals.

- For a line integral, we chose to take the component of each vector field aligned with the direction it is moving along the curve (the tangent vector).

- For a surface integral, we instead take the component of each vector field aligned with the normal vector to the tangent plane at that point. This has the effect of measuring how much of the vector field is "flowing through" the surface, rather than along it, so it is often called a *flux integral*.

#define("Flux in 3D")[
  The flux of a vector field $arrow(F)$ through a surface $S$ is given by the surface integral: $
    "flux" = Phi = integral.double_S arrow(F) dot hat(n) dd(S) = integral.double_S arrow(F) dot dd(arrow(S)).
  $
  Where $hat(n)$ is the unit normal vector to the surface at each point. Note that $dd(arrow(S)) = hat(n) dd(S)$.
]

Note that each tangent plane has two possible normal vectors (pointing in opposite directions). Thus, when computing flux integrals, it is important to specify the orientation of the surface (which normal vector to use).

- A *positively oriented* surface is one where the normal vectors point outward from the enclosed volume.
- A *negatively oriented* surface is one where the normal vectors point inward toward the enclosed volume.

#resource("Classifying Surfaces of Integration", _align: left)[
- A surface is *smooth* if it can be parameterized by a differentiable function $arrow(r)(u, v)$
  with continuous partial derivatives (and $arrow(r)_u times arrow(r)_v != arrow(0)$ for all $(u, v)$).
  - A surface is *piecewise-smooth* if it can be broken into a finite number of smooth segments.

- A surface is *orientable* if we can consistently define a normal vector at every point on the surface.
  - Intuitively, this means we can choose one side of the surface to be the "top" side and the other to be the "bottom" side
    without any contradictions (e.g., a Mobius strip is not orientable)
]

If $S$ is parametrically defined using $arrow(r)(u, v)$, then recall that the normal vector to the surface is given by $arrow(r)_u times arrow(r)_v$. The unit normal vector is then: $
  hat(n) = (arrow(r)_u times arrow(r)_v) / abs(arrow(r)_u times arrow(r)_v).
$

Pluginging this into the flux integral definition gives:
$
  integral.double_S arrow(F) dot cblue(hat(n)) dd(S) 
  = integral.double_S arrow(F) dot cblue((arrow(r)_u times arrow(r)_v) / abs(arrow(r)_u times arrow(r)_v)) abs(arrow(r)_u times arrow(r)_v) dd(u) dd(v)
  = integral.double_D arrow(F)(arrow(r)(u, v)) dot (arrow(r)_u times arrow(r)_v) dd(u) dd(v).
$

#define("Flux Integral over a Parametric Surface")[
  The flux $Phi$ of a vector field $arrow(F)$ through a positively oriented parametric surface $S$ parameterized by $arrow(r)(u, v)$ is: $
    Phi = integral.double_D arrow(F) dot (arrow(r)_u times arrow(r)_v) dd(u) dd(v). 
  $
  #rsubtext[If $S$ is negatively oriented, then use $arrow(r)_v times arrow(r)_u$ instead.]
]

For a surface defined as $z = g(x, y)$, the parametric
representation is $arrow(r)(x,y) = ang(x,y,g(x,y))$, and
$arrow(r)_x times arrow(r)_y = ang(-g_x, -g_y, 1)$. Thus, the flux integral becomes: $
  Phi = integral.double_S arrow(F) dot (arrow(r)_x times arrow(r)_y) dd(A) &= integral.double_D arrow(F)(x,y,g(x,y)) dot ang(-g_x, -g_y, 1) dd(A).
$

If we let $arrow(F) = ang(P, Q, R)$, then computing the dot product gives: $
  Phi = integral.double_D ( -P g_x - Q g_y + R ) dd(A).
$

Note that this assumes the surface is positively oriented. If the surface is negatively oriented, we must negate the flux integral: $
  Phi &= -integral.double_D ( -P g_x - Q g_y + R ) dd(A)
  = integral.double_D ( P g_x + Q g_y - R ) dd(A).
$

#define("Flux Integral over a Function-Defined Surface")[
  The flux $Phi$ of a vector field $arrow(F) = ang(P, Q, R)$ through a positively oriented surface $S$ defined by $z = g(x, y)$ above a region $D$ is: $
    Phi = integral.double_S arrow(F) dot dd(arrow(S)) = integral.double_D ( -P g_x - Q g_y + R ) dd(A).
  $
  #rsubtext[If $S$ is negatively oriented, then: $Phi = integral.double_D ( P g_x + Q g_y - R ) dd(A)$.]  
]

#example("Computing a Flux Integral")[]

==== Flux in 2D

We can generalize flux to two dimensions as well. 

When taking a line integral over a curve in 2D, we used to take
the component of the vector field aligned with the tangent vector: $integral_C arrow(F) dot arrow(r')(t) dd(t)$. What if
instead, we took the component of the vector field aligned with the normal vector to the curve at each point? This is flux.

 In 2D, flux measures how much of a vector field _passes through_ a curve $C$. The flux through a curve is given by the line integral: $
  "flux" = Phi = integral_C arrow(F) dot hat(n) dd(s).
$

Again, when computing flux integrals, it is important to specify the orientation of the curve (which normal vector to use). 

We can use $hat(n) = arrow(N)$, the unit normal vector to the curve at each point (recall from unit 2 that the unit normal vector
is found by first finding the unit tangent vector $arrow(T) = arrow(r')/abs(arrow(r'))$ and then taking $arrow(N) = (arrow(T)')/abs(arrow(T)')$). $arrow(N)$ points towards the interior of curvature $C$, which is a negative orientation.

Thus, we should use $hat(n) = - arrow(N)$ if we desire a positive orientation ("outwards flux"): $
  Phi = -integral_C arrow(F) dot arrow(N)dd(s).                   
$

#derivation("Derivation: 2D Flux Integral Formula")[
  // show that 2d flux = integral P dy - Q dx
  // or that n ds = <-dy, dx>

  Let $arrow(F) = ang(P, Q)$ and $arrow(N)(t)$ be the unit normal vector to the curve $C$ parameterized by $arrow(r)(t)$.

  Also, $dd(s) = abs(arrow(r')(t)) dd(t) = ang(dd(x), dd(y)) ==> dd(s)/dd(t) = arrow(r')(t)$ by definition.

  $
    arrow(T) = arrow(r')/abs(arrow(r')) = ang(dv(x,t),dv(y,t))/inlinedv(s,t) = ang(dv(x,s), dv(y,s)) \

    arrow(T)' = ang(dv(,t) dv(x,s), dv(,t) dv(y,s)) = dv(t,s) ang(ndv(x,s,2), ndv(y,s,2)) = 1/inlinedv(s,t) ang(ndv(x,s,2), ndv(y,s,2)) \

    abs(arrow(T)') = 1/inlinedv(s,t)  
  $
  $
    arrow(N) = (arrow(T)')/abs(arrow(T)') = 
  $
]

#define("Flux Integral in 2D")[
  The flux $Phi$ of a vector field $arrow(F)$ through a closed curve $C$ in $RR^2$ is given by the line integral: $
    Phi = integral_C arrow(F) dot hat(n) dd(s) = integral_C P dd(y) - Q dd(x).
  $
]

==== Green's Theorem for Flux

#define("Flux-Divergence Form of Green's Theorem")[
  Let $D$ be the region bounded by the closed curve $C$ and $arrow(F) = ang(P, Q)$. Then:
  $
    integral.cont_C arrow(F) dot arrow(N) dd(s) = integral.cont_C P dd(y) - Q dd(x) = integral.double_D ( pdv(P,x) + pdv(Q,y) ) dd(A).
  $
]

== Stokes' Theorem



#define("Stokes' Theorem (Curl Theorem)")[
  Let $C$ be a closed curve that encloses a surface $D$. Then Stokes' Theorem states that:
  $
    integral.cont_C arrow(F) dot dd(arrow(r)) = integral.double_D ("curl" arrow(F)) dot hat(n) dd(S).
  $

  #rsubtext[where $C$ is *simple, closed, and positively-oriented*, and $hat(n)$ is the unit normal vector to the surface $D$.]

  In other words, the circulation of a vector field around a curve is equal to adding all the little curls over the surface enclosed by that curve.
]

Notice that if use 2D curl instead of 3D curl in Stokes' Theorem, we get Green's Theorem. Thus, Green's Theorem can be interpreted as a special case of Stokes' Theorem in two dimensions: $                                     
  integral.cont_C arrow(F) dot dd(arrow(r)) = integral.double_D ("2d-curl" arrow(F)) dd(A) = integral.double_D (pdv(Q,x) - pdv(P,y)) dd(A).
$

=== Constraints of Stokes' Theorem

- *Simple closed curves.* Recall that _simple_ means the curve does not cross itself. _Closed_ means the curve will start and end at the same point.

- *Orientation.* The definition above applies only for _positively oriented_ curves, i.e. those that move counterclockwise. If you followed the curve, its interior should be to your left. If the curve is _negatively oriented_, then we must negate the sign of the surface integral: $
  integral.cont_C arrow(F) dot dd(arrow(r)) = -integral.double_D ("curl" arrow(F)) dot hat(n) dd(S)
$
  #align(right)[#subtext[if $C$ is *simple, closed, and #underline[negatively]-oriented*.]]

#example("Using Stokes' Theorem to Evaluate a Line Integral")[
  
]

#example("Using Stokes' Theorem to Evaluate a Surface Integral")[
  
]

== Divergence Theorem

#define("Divergence Theorem (Gauss' Theorem)")[
  Let $S$ be a positively-oriented, closed surface that encloses a solid region $V$. Then:
  $
    integral.surf_S arrow(F) dot hat(n) dd(S) = integral.triple_V ("div" arrow(F)) dd(V).
  $
  In simpler terms, the total flux out of the volume's boundary is the result of adding up all the little "divergences" inside the volume.
]

=== Constraints of the Divergence Theorem

- *Closed surface.* The surface $S$ must be closed, meaning it completely encloses a volume without any gaps or holes.

- *Orientation.* The surface $S$ must be positively oriented, meaning the normal vectors point outward from the enclosed volume.

- *Continuity.* The vector field $arrow(F)$ must have continuous partial derivatives on an open region containing the volume $V$.

#example("Using the Divergence Theorem to find Flux")[
  Use the Divergence Theorem to evaluate the flux integral $display(integral.surf_S arrow(F) dot hat(n) dd(S))$, where $arrow(F) = ang(x^2, x y, z)$ and $S$ is the part of the paraboloid $z = 1 - x^2 - y^2$ above the $x y$-plane, oriented upwards.
  #lorange
  First, we need to find the divergence of $arrow(F)$: $
    "div" thin arrow(F) = pdv(x^2, x) + pdv(x y, y) + pdv(z, z) = 2x + x + 1 = 3x + 1.
  $
  Thus, by the Divergence Theorem: $
    integral.surf_S arrow(F) dot hat(n) dd(S) = integral.triple_V ("div" arrow(F)) dd(V) = integral.triple_V (3x + 1) dd(V).
  $
  Let's set up the triple integral in cylindrical coordinates. The volume $V$ is bounded by the paraboloid $z = 1 - r^2$ and the $x y$-plane ($z = 0$), so: $
    integral.triple_V (3x + 1) dd(V) = integral_0^(2pi) integral_0^1 integral_0^(1 - r^2) (3(r cos theta) + 1) r dd(z) dd(r) dd(theta).
  $
  Evaluate the integral: $
    integral_0^(2pi) integral_0^1 integral_0^(1 - r^2) (3(r cos theta) + 1) r dd(z) dd(r) dd(theta) = cgreen(pi/2).
  $
]

#example("Using the Divergence Theorem to Evaluate a Triple Integral")[
  
]

==== Divergence Theorem in Other Dimensions

We can also generalize the divergence theorem to flux integrals in $RR^2$: $
  integral.cont_C arrow(F) dot hat(n) dd(s) = integral.double_D ("div" arrow(F)) dd(A).         
$

Let $arrow(F) = ang(P, Q)$. Then we can alternatively write: $ integral.cont_C P dd(y) - Q dd(x) = integral.double_ D (pdv(P,x) + pdv(Q,y)) dd(A) $.

This is simply the flux-divergence form of Green's Theorem. In other words, Green's Theorem can also be interpreted as a special case of the Divergence Theorem in two dimensions.

We can also generalize into higher dimensions. For example:

$
  integral.vol_S arrow(F) dot dd(arrow(V)) = integral.quad_W ("div" arrow(F)) dd(W).
$

#pagebreak()

== Generalizing Vector Calculus

=== Summary of this Unit

1. Line integrals integrate scalar or vector fields over space curves.

  - Line integrals over scalar fields sum up little pieces of length $dd(s) = sqrt(dd(x)^2 + dd(y)^2 + dd(z)^2)$ weighted by the scalar field: $
      integral_C f(arrow(r)) dd(s) = integral_a^b f(arrow(r)(t)) abs(arrow(r')(t)) dd(t).
    $
  - Line integrals over vector fields sum up little pieces of displacement $dd(arrow(r)) = ang(dd(x), dd(y), dd(z))$ weighted by the component of the vector field aligned with the curve's tangent vector: $
      integral_C arrow(F) dot dd(arrow(r)) = integral_a^b arrow(F)(arrow(r)(t)) dot arrow(r')(t) dd(t).
    $

2. Surface integrals integrate scalar or vector fields over surfaces.

  - Surface integrals over scalar fields sum up little pieces of surface area $dd(S)$ weighted by the scalar field: $
      integral.double_S f(arrow(r)(u,v)) dd(S) = integral.double_D f(arrow(r)(u,v)) abs(arrow(r)_u times arrow(r)_v) dd(u) dd(v).
    $
    If a surface is defined as $z = g(x,y)$, then: $
      integral.double_S f(x,y,z) dd(S) = integral.double_D f(x,y,g(x,y)) sqrt(1 + (g_x)^2 + (g_y)^2) dd(A).
    $
  - Flux integrals over vector fields sum up little pieces of surface area $dd(S)$ weighted by the component of the vector field aligned with the surface's normal vector: $
      integral.double_S arrow(F) dot hat(n) dd(S) = integral.double_D arrow(F)(arrow(r)(u,v)) dot (arrow(r)_u times arrow(r)_v) dd(u) dd(v).
    $

3. Four Big Theorems of Vector Calculus:

  - Fundamental Theorem of Calculus for Line Integrals (Gradient Theorem) \
    #subtext[Sum of small changes of a scalar field over a curve equals the net change over the endpoints.]
    $
      integral_C grad f dot dd(arrow(r)) = f(arrow(q)) - f(arrow(p))
    $
  - Green's Theorem \
    #subtext[Generalization of Stokes' and Divergence Theorems to 2D.]
    $
      integral.cont_C P dd(x) + Q dd(y) = integral.double_D ( pdv(Q, x) - pdv(P, y) ) dd(A) #h(20pt) &"(circulation-curl form)" \
      integral.cont_C P dd(y) - Q dd(x) = integral.double_D ( pdv(P,x) + pdv(Q,y) ) dd(A) #h(20pt) &"(flux-divergence form)"
    $
  - Stokes' Theorem (Curl Theorem) \
    #subtext[Sum of little curls enclosed by a curve equals the circulation around the curve.]
    $
      integral.cont_C arrow(F) dot dd(arrow(r)) = integral.double_D ("curl" arrow(F)) dot hat(n) dd(S)
    $
  - Divergence Theorem (Gauss' Theorem) \
    #subtext[Sum of little divergences inside a volume equals the flux through the volume's boundary.]
    $
      integral.surf_S arrow(F) dot hat(n) dd(S) = integral.triple_V ("div" arrow(F)) dd(V)
    $

Notice that all four theorems follow the same general pattern of relating an integral over a boundary to an integral (or net change) over the region enclosed by that boundary.

=== Generalizing the Theorems

#define("Generalized Stokes' Theorem")[
  Let $S$ be some $n$-dimensional orientable manifold and $partial S$ be the boundary of that manifold in $n-1$ dimensions. Then: $
    integral_S dd(omega) = integral_(partial S) omega.
  $
]

This theorem generalizes the general theme of the fundamental theorems of calculus, which always go something along the lines of "the integral of some differential ("sum of little changes") over some boundary is equal to the total change over the boundary.

=== Differential Forms

#define("Differential k-Form")[
  A _differential k-form_ $omega$ is an expression that can be integrated over a $k$-dimensional manifold. Examples include:
  - A differential 1-form in $RR^2$: $omega = P dd(x) + Q dd(y)$
  - A differential 2-form in $RR^3$: $omega = P dd(y) dd(z) + Q dd(z) dd(x) + R dd(x) dd(y)$
]

#define("Exterior Derivative")[
  The _exterior derivative_ $dd(omega)$ of a differential form $omega$ is a new differential form that represents the infinitesimal change of $omega$. Examples include:
  - If $omega = P dd(x) + Q dd(y)$ is a differential 1-form in $RR^2$, then: 
  $
    dd(omega) = (pdv(Q,x) - pdv(P,y)) dd(x) dd(y).
  $
  - If $omega = P dd(y) dd(z) + Q dd(z) dd(x) + R dd(x) dd(y)$ is a differential 2-form in $RR^3$, then: 
  $
    dd(omega) = (pdv(P,x) + pdv(Q,y) + pdv(R,z)) dd(x) dd(y) dd(z).
  $
]

=== Heimholtz Decomposition

We can decompose any vector field into a sum of a zero-curl vector field $arrow(G)$ and a zero-divergence vector field $arrow(R)$: $
  arrow(F) = arrow(G) + arrow(R).
$

- The zero-curl vector field $arrow(G)$ is called the *irrotational* component of $arrow(F)$.
  It is called $arrow(G)$ because it has curl zero, meaning it is conservative and can be written as the gradient of
  some scalar potential function $f$: $arrow(G) = grad f$.

- The zero-divergence vector field $arrow(R)$ is called the *solenoidal* component of $arrow(F)$.

#define("Heimholtz Decomposition Theorem")[
  Let $arrow(F)$ be some differentiable vector field on $RR^3$. Then there must exist a potential function $phi$ and a vector potential $arrow(A)$ such that: $
    arrow(F) = -grad phi + "curl" arrow(A).
  $
  It follows that: 
  - $-grad phi$ is the irrotational (zero-curl) component of $arrow(F)$.
  - $"curl" arrow(A)$ is the solenoidal (zero-divergence) component of $arrow(F)$. 
]