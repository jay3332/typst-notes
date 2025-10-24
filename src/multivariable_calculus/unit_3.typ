#import "/helpers/template.typ": *
#import "@preview/cetz:0.4.2": canvas, draw, tree
#show: set_unit_number.with(3)

= Multivariate Limits and Derivatives

== Graphs of Multivariate Functions

- The *level curves* of a surface $z = f(x, y)$ are the curves of intersection at the level planes \ $z = k$, or in
  other words, the curves defined by $f(x, y) = k$. A level curve may not exist for all values of $k$.

- Similarly, the *level surfaces* of a volume $w = f(x, y, z)$ are the surfaces defined by \ $f(x, y, z) = k$.

- The *contour plot* is a way of representing a 3D surface on a 2D plane, by drawing all level curves on one plane. In
  other words, the contour plot of a surface $z = f(x, y)$ can be drawn by drawing lines which join the points $(x, y)$
  where $f(x, y)$ is equal.

== Limits and Continuity in Multiple Variables

=== Summary
- *To show a limit does not exist,* check multiple paths and show result is $!=$
- *To show and find a limit exists:*
  - Direct substitution (if function is continuous over its domain)
  - Algebraic manipulation (cancel factors/multiply by conjugates)
  - Squeeze Theorem
  - Convert to polar/spherical coordinates, then check if limit is constant \
    #subtext[$(x,y) -> (0,0)$ becomes $r -> 0^+, #h(10pt) (x, y, z) -> (0,0,0)$ becomes $rho -> 0^+$]
  - Use $delta-epsilon$ proof

=== Limits & Continuity

- Recall that for single-variable functions: $display(lim_(x->a) f(x) = L)$ means that by approaching $x=a$ from both
  the left and right, $f(x)$ approaches the same value $L$. When $display(lim_(x->a) f(x) = f(a))$, the function is
  _continuous_.

- For a function of two variables $f(x, y)$, we can approach some point $(x,y)=(a,b)$ from an infinite number of paths.
  If $f$ approaches the same limit $L$, then $display(lim_((x, y) -> (a,b)) f(x, y) = L)$.

  - To show a limit exists, we must prove that by approaching the point from all paths, we get the same limit. If even
    one of the paths yield a different limit than another path, the limit does not exist.

  - $f$ is *continuous* at $(a, b)$ if $display(lim_((x, y) -> (a, b)) f(x,y) = f(a, b))$.

    We can use this definition in reverse to find limits of continuous functions (i.e. if we know a function is
    continuous and defined at $(a, b)$, then we can just plug in $(a,b)$ into the function to find its limit)

#example([Show that $display(lim_((x, y) -> (0, 0)) (x^2 + sin^2 y)/(2x^2 + y^2))$ does not exist.])[
  \
  Check that approaching the limit from at least two paths yield different values:

  From the line $y=0$:
  $
    lim_((x, y) -> (0, 0) \ y -> 0) (x^2 + sin^2 y)/(2x^2 + y^2)
    = lim_(x -> 0) (x^2)/(2x^2) = 1/2.
  $

  From the line $x = 0$:
  $
    lim_((x, y) -> (0, 0) \ x -> 0) (x^2 + sin^2 y)/(2x^2 + y^2)
    = lim_(y -> 0) (sin^2 y)/y^2 = (lim_(y -> 0) (sin y) / y)^2 = 1.
  $

  $
    therefore lim_((x, y) -> (0, 0)) (x^2 + sin^2 y)/(2x^2 + y^2) "DNE".
  $
]

=== Squeeze Theorem

- Let there be three functions of two variables $alpha, f, beta$.

  If, for a finite region $D$, $alpha(x, y) <= f(x, y) <= beta(x, y)$, then for any point $(a, b)$ in $D$ where
  $display(lim_((x, y) -> (a, b)) alpha(x, y) = lim_((x, y) -> (a, b)) beta(x, y) = L)$, the *squeeze theorem* says that
  $display(lim_((x, y) -> (a, b)) f(x, y)) = L.$

=== Extension: Limits by Changing Coordinate Systems

- If our multivariate limit approaches the origin, we can convert our function into polar coordinates (for two
  variables) or spherical coordinates (for three variables).

  This decays our limit into a single-variable limit (the limit as distance from the origin approaches zero).

- For polar coordinates: as $(x, y) -> (0, 0)$, $r -> 0^+$. \
  For spherical coordinates: as $(x, y, z) -> (0, 0, 0)$, $rho -> 0^+$.

#boxed(stroke: gray)[
  ===== Rectangular to Polar Coordinates
  Let $g(r, theta)$ be the polar transformation of $f(x, y)$, i.e. $g(r, theta) = f(r cos theta, r sin theta)$. Then:
  $
    lim_((x, y) -> (0, 0)) f(x, y) = lim_(r -> 0^+) g(r, theta).
  $
  ===== Rectangular to Spherical Coordinates
  Let $g(rho, theta, phi)$ be the spherical transformation of $f(x, y, z)$, i.e. \
  $g(rho, theta, phi) = f(rho sin phi cos theta, rho sin phi sin theta, rho cos phi)$. Then:
  $
    lim_((x, y, z) -> (0, 0, 0)) f(x, y, z) = lim_(rho -> 0^+) g(rho, theta, phi).
  $
]

- $theta$ (or $phi$) is the angle of the path we approach the origin from. If our limit depends on $theta$ or $phi$, our
  limit would depend on the angle of the path and thus our limit does not exist.

#example("Limit using Polar Coordinates")[
  Determine if $display(lim_((x, y) -> (0,0)) (x^2 - y^2)/(x^2 + y^2))$ exists.

  #lorange

  Converting into polar coordinates:
  $
    (x^2 - y^2)/(x^2 + y^2) |-> (cancel(r^2) (cos^2 theta - sin^2 theta)) / cancel(r^2) = cos 2 theta.
  $

  As $(x, y) -> (0, 0)$, $r -> 0^+$. Thus, our limit is equivalent to:
  $
    lim_((x, y) -> (0, 0)) (x^2 - y^2)/(x^2 + y^2) = lim_(r -> 0^+) cos 2theta = cos 2theta.
  $

  The limit depends on $theta$, which is the angle of the path we approach the origin from. In other words, the limit is
  different depending on the path, meaning our limit #tgreen[does not exist].
]

=== Extension: Delta-Epsilon Definitions of Limits

The definition of a single-variable limit is:
$
  lim_(x->a) f(x) = L "means" forall epsilon > 0, exists delta > 0 "s.t." 0 < abs(x-a) < delta ==> abs(f(x) - L) < epsilon.
$

In other words, for any desired vertical distance $epsilon$, we must be able to find an $x$ a horizontal distance
$delta$ away from $x=a$ where evaluating $f(x)$ is at most $epsilon$ away from $y=L$.

We can extend this to 3D: if $epsilon$ is the desired "error", then there must exist a point $(x, y)$ a radial distance
$delta$ away from $(a, b)$ where evaluating $f(x, y)$ is at most $epsilon$ away from $L$.

#define("Delta-Epsilon Definition of a Multivariate Limit")[
  Let $f(x, y)$ be a function of two variables. If $display(lim_((x, y) -> (a, b)) f(x,y) = L)$, then:
  $
    forall epsilon > 0, exists delta > 0 "s.t." 0 < sqrt((x-a)^2 + (y-b)^2) < delta ==> abs(f(x, y) - L) < epsilon.
  $
]

#pagebreak()

== Partial Derivatives

- Recall that the derivative $f'(x)$ of a single-variable function $f(x)$ at some point $x=a$ is the rate of change of
  the output $f$ as the input $x$ changes near $x=a$.

- For a function of multiple independent variables, the variables can change independently. One variable can change at
  once, or multiple can change at the same time.

- The *partial derivative* $pdv(f, x) = f_x (x, y, ...)$ of a function of several variables $f(x, y, ...)$ is the rate
  of change of $f$ as only one of the variables (in this case $x$) changes, and the other variables are held constant.

  - If $f$ is a function of $x$ and $y$, the partial derivative w.r.t. $x$ of $f$ at a point $(x, y) = (a, b)$,
    $evaluated(pdv(f, x))_((a, b)) = f_x (a, b)$ is the rate of change of $f$ as $x$ varies while other $y$ is held
    constant near $(a, b)$.

- *Notations:* $pdv(f, x) = f_x = partial_x f$ (Leibniz, Lagrange, and Euler notations respectively)

#define("Limit Definition of a Partial Derivative")[
  ===== For Functions of Two Variables

  The *partial derivative* of a function $f(x, y)$ with respect to $x$ is:
  $
    pdv(f, x) = f_x (x, y) = lim_(h->0) (f(x + h, y) - f(x, y)) / h.
  $
  Similarly, the partial derivative of $f$ with respect to $y$ is:
  $
    pdv(f, y) = f_y (x, y) = lim_(h->0) (f(x, y + h) - f(x, y)) / h.
  $

  It is the change in $f$ as the variable we are differentiating with respect to changes while all other variables are
  held constant.

  ===== General Case
  Let $f(x_1, x_2, ..., x_n)$ be a function of $n$ variables. Then the *partial derivative* of $f$ with respect to $x_i$
  is:
  $
    pdv(f, x_i) = f_(x_i)(x_1, x_2, ..., x_n) = lim_(h -> 0) (f(x_1, x_2, ..., x_i+h, ..., x_n) - f(x_1, x_2, ..., x_n))/h.
  $
]

#example([Find the Partial Derivatives of $f(x, y, z) = x e^y + y^2 e^z + z e^(-x).$])[
  To find each partial derivative, differentiate normally, treating other variables constant.
  $
    pdv(f, cblue(x)) & = pdv(, cblue(x)) (cblue(x) e^y + cgray(y^2 e^z) + z e^(-cblue(x))) & = e^y + -z e^(-x).
  $
  $
    pdv(f, cgreen(y)) & = pdv(, cgreen(y)) (x e^cgreen(y) + cgreen(y)^2 e^z + cgray(z e^(-x))) & = x e^y + 2y e^z.
  $
  $
    pdv(f, cpurple(z)) & = pdv(, cpurple(z)) (cgray(x e^y) + y^2 e^cpurple(z) + cpurple(z) e^(-x)) & = y^2 e^z + e^(-x).
  $
]

=== Higher-Order Partial Derivatives

A *second-order partial derivative* of a function of two variables $f(x, y)$ is the partial derivative of one of the
partial derivatives of $f$. This means that there are *four* total second-order partial derivatives of f:
$
  & f_(x x) = npdv(f, x, 2) #h(100pt)                       && f_(x y) = (partial^2 f)/(partial y partial x) \
  & f_(y x) = (partial^2 f)/(partial x partial y) #h(100pt) && f_(y y) = npdv(f, y, 2) \
$

Generally, a function of $n$ variables has $n^2$ second-order partial derivatives.

#note[
  For Leibniz notation, the order of differentiation is read right to left, whereas with the subscript (Lagrange)
  notation, the order is from left to right.
]
#define("Clairaut's Theorem")[
  Suppose a function $f(x, y)$ is _defined_ over a finite region $D$. If $f_(x y)$ and $f_(y x)$ are _continuous_
  throughout $D$, then for all points $(x, y) in D$:
  $
    f_(x y) = f_(y x) #h(40pt) "or" #h(40pt) (partial^2 f)/(partial y partial x) = (partial^2 f)/(partial x partial y).
  $
  In other words, for continuous functions, the order of partial derivatives does not matter. This theorem can be
  extended to higher-order derivatives.

  #rsubtext[This property is often referred to as the *symmetry of second partial derivatives*.]
]

- In a similar vein, a *third-order partial derivative* of a function is a partial derivative of one of the second-order
  partial derivatives of $f$. Generally, a function of $n$ variables has $n^3$ third-order partial derivatives. \
  #subtext[e.g. $f(x, y)$ has $8$ third-order partial derivatives:
    $f_(x x x), f_(x x y), f_(x y x), f_(x y y), f_(y x x), f_(y x y), f_( y y x), f_( y y y)$.]

- An $n$th-order partial derivative of a function of $m$ variables is a partial derivative of one of the $(n-1)$th-order
  partial derivatives of $f$. Generally, a function of $m$ variables has $m^n$ $n$th-order partial derivatives.

=== Differentiability

#define("Differentiability by Partial Derivatives")[
  A function $f(x, y)$ is *differentiable* at a point $(a, b)$ if $f$ is both *continuous* on some closed finite region
  $D$ which includes $(a, b)$ and the partial derivatives $pdv(f, x)$ and $pdv(f, y)$ are both *defined* on the open
  region $D$. \
  #rsubtext[This can be extended to more than 2 variables.]
]

=== Partial Differential Equations

- An equation consisting of partial derivatives is called a *partial differential equation* (PDE). For example,
  $pdv(u, t) = alpha^2 npdv(u, x, 2)$ is a partial differential equation called the _wave equation_.

- A *solution* to a partial differential equation is a function which satisfies the equation.

  - To verify a solution, find necessary partial derivatives and plug them into the equation to see if it holds true.

#example("Verifying a solution to a PDE")[
  Verify that the function $u(x, y) = e^x sin y$ is a solution to the PDE $npdv(u, x, 2) + npdv(u, y, 2) = 0$.
  #lorange
  Find the necessary partial derivatives:
  $
        pdv(u, x) & = e^x sin y #h(60pt)
                    pdv(u, y)     && = e^x cos y \
    npdv(u, x, 2) & = e^x sin y #h(60pt)
                    npdv(u, y, 2) && = -e^x sin y.
  $

  Plugging into the PDE:
  $
    npdv(u, x, 2) + npdv(u, y, 2) = e^x sin y - e^x sin y cgreen(=^checkmark) 0.
  $
]

#pagebreak()

== Tangent Planes & Approximations

Recall that the derivative of a single-variable function can be interpreted as the _slope of the tangent line_ to the
curve. A function of two variables defines a surface, there are an infinite number of tangent lines to the surface at
any given point, however there exists a _plane_ that consists of all tangent lines. This plane is called the *tangent
  plane*.

Consider a curve defined by single-variable function $y = f(x)$. Recall that the linearization of $f$ at a point $x=x_0$
can be used to approximate $f$ at points near $x_0$. Such linearization is:
$
  y - y_0 = f'(x) (x - x_0).
$


#define("Tangent Plane to a Surface")[
  Let the surface $S$ be defined by the equation $z = f(x, y)$. Then the *tangent plane* to $S$ at a point
  $(x_0, y_0, f(x_0, y_0))$ is the plane defined by:
  $
    z - f(x_0, y_0) = f_x (x_0, y_0) (x - x_0) + f_y (x_0, y_0) (y - y_0).
  $
]

We can use this tangent plane to derive a general function called the _linearization function_ which can be used to
approximate values of $f$ near the point: #define("Linearization of a Function of Two Variables")[
  The *linearization* of a function $f(x, y)$ at $(x_0, y_0)$ is:
  $
    L(x, y) = f(x_0, y_0) + f_x (x_0, y_0)(x-x_0) + f_y (x_0, y_0)(y-y_0).
  $
]

The *linear approximation* of a function $f(x, y)$ at a point $P$ is the linearization at that point.

#example("Linear Approximation")[
  Use the linearization of $f(x, y) = sqrt(x^2 + y^2)$ at $(1, 1)$ to approximate $f(1.1, 1.2)$.

  #lorange
  Find the partial derivatives of $f$:
  $
    pdv(f, x) = x/sqrt(x^2 + y^2) #h(60pt) pdv(f, y) = y/sqrt(x^2 + y^2)
  $

  Plugging into each at $(1, 1)$ yields $f_x (1, 1) = f_y (1, 1) = sqrt(2) / 2.$

  Find the linearization using the formula above:
  $
    f(x, y) approx L(x, y) = sqrt(2) + sqrt(2)/2 (x - 1) + sqrt(2)/2 (y - 1).
  $

  Thus:
  $
    f(1.1, 1.2) approx L(1.1, 1.2) = sqrt(2) + sqrt(2)/2(0.1) + sqrt(2)/2 (0.2) = cgreen((23 sqrt(2))/20).
  $
]

=== Differentials

Recall the tangent plane equation. If the point of interest $(x_0, y_0, z_0)$ is made infinitesimally close to an
arbitrary point $(x, y, z)$, then the difference of each component is also infinitesimally small. That is, if
$x - x_0 -> 0$, we can call this difference $dd(x)$, called the *differential* of $x$.

Thus, our equation becomes:
$
  dd(z) = f_x dd(x) + f_y dd(y) = pdv(f, x) dd(x) + pdv(f, y) dd(y).
$

So if $z = f(x, y)$, the above expression $dd(z)$ is the *total differential* of $z$.

#define("Total Differential")[
  Let $f$ be a function of $n$ variables: $f(x_1, x_2, ..., x_n)$. Then the *total differential* of $f$ is:
  $
    dd(f) = pdv(f, x_1) dd(x_1) + pdv(f, x_2) dd(x_2) + ... + pdv(f, x_n) dd(x_n.)
  $
]

#example([Find the total differential of $V(r, h) = 1/3 pi r^2 h$.])[
  The partial derivatives of $V$ are:
  $
    pdv(V, r) = 2/3 pi r h #h(60pt) pdv(V, h) = 1/3 pi r^2
  $
  Thus, the total differential is:
  $
    dd(V) = 2/3 pi r h dd(r) + 1/3 pi r^2 dd(h).
  $
]

Using a finite interpretation of a differential, we interpret let each differential as an "error" or finite difference.
Then, the total differential becomes an equation relating relatively small changes in each of the variables to the total
change in function.

#example([Interpreting differentials as finite errors])[
  A ruler is used to measure the height of a cone to an accuracy of $3 "mm"$. A separate ruler is used to measure the
  radius of the cone to an accuracy of $4 "mm"$.

  The cone is measured this way to have a height of $14 "mm"$ and a radius of $6 "mm"$, resulting in an estimated volume
  of $168 pi space.quarter "mm"^3$. What is the approximate max error of the estimate?

  #lorange

  Using the total differential from the other example, we can estimate the error $dd(V)$ from the measurement. Since
  $dd(r)$ can be interpreted as the "error in $r$", we can set $dd(r) = 4 "mm"$. Similarly, $dd(h) = 3 "mm"$. Finally,
  $r = 6 "mm"$ and $h = 14 "mm"$.

  Plugging all four values into the expression for $dd(V)$:
  $
    Delta V_"max" approx dd(V) = 2/3 pi (6 "mm")(14 "mm") (4 "mm") + 1/3 pi (6 "mm")^2 (3 "mm") = cgreen(260 pi space.quarter "mm"^3).
  $
]

#note(title: "Differentials vs. Increments")[
  The *increment* of a function $f$, represented $Delta f$ is the _true_ change in $f$ over some change in its variables
  $arrow(r)$, represented $Delta arrow(r)$. A *differential* uses a tangent line to approximate the increment
  ($dd(f) approx Delta f$), and the approximation gets better as $dd(arrow(r)) -> arrow(0)$.
]

=== Tangent Planes to Parametric Surfaces

- Recall that a parametric surface is defined by a vector function of two variables, for example
  $arrow(r)(u, v) = ang(x(u, v), y(u, v), z(u, v))$.

- The tangent plane to a parametric surface at a point $P$ can be found using the cross product of the two tangent
  vectors $pdv(arrow(r), u)$ and $pdv(arrow(r), v)$.

  - Originating from $P$, all tangent vectors can be thought of as "lying on the tangent plane"

  - Thus normal vector $arrow(n)$ to the tangent plane is orthgonal to any two tangent vectors at $P$. We can choose the
    two most convenient ones, $pdv(arrow(r), u)$ and $pdv(arrow(r), v)$:
    $
      arrow(n) = pdv(arrow(r), u) times pdv(arrow(r), v).
    $

  - If $arrow(n) = ang(a, b, c)$, then the equation of the tangent plane at point $P(x_0, y_0, z_0)$ is
    $a(x - x_0) + b(y - y_0) + c(z - z_0) = 0$ by the standard normal-point form of a plane.

#example("Tangent Plane to a Parametric Surface")[
  Find the equation of the plane tangent to the surface defined by $arrow(r)(u, v) = ang(u cos v, u sin v, v)$ at the
  point $(0, 1, pi/2)$.

  #lorange

  First, find the values of $u$ and $v$ at the point:
  $
    u cos v = 0 #h(60pt) u sin v = 1 #h(60pt) v = pi/2.
  $
  From the first two equations, we can see that $u=1$ and $v=pi/2$.

  Next, find the tangent vectors:
  $
    pdv(arrow(r), u) = arrow(r)_u = ang(cos v, sin v, 0) #h(40pt) pdv(arrow(r), v) = arrow(r)_v = ang(-u sin v, u cos v, 1).
  $
  Plugging in $u=1$ and $v=pi/2$ yields:
  $
    arrow(r)_u (1, pi/2) = ang(0, 1, 0) #h(60pt) arrow(r)_v (1, pi/2) = ang(-1, 0, 1).
  $

  The normal vector is:
  $
    arrow(n) = arrow(r)_u times arrow(r)_v = ang(0, 1, 0) times ang(-1, 0, 1) = ang(1, 0, 1).
  $

  Finally, plug the point and normal vector into the point-normal form of a plane:
  $
    1(x - 0) + 0(y - 1) + 1(z - pi/2) = 0 #h(20pt) "or" #h(20pt) cgreen(x + z = pi/2).
  $
]

=== Extension: Quadratic Approximations

Recall: the quadratic approximation formula for a single-variable function $f(x)$ from a known point $(a, f(a))$ is just
the second-degree Taylor polynomial centered at $x = a$:
$
  f(x) approx Q(x) = f(a) + f'(a) (x - a) + (f''(a))/2 (x-a)^2.
$

We can extend this to functions of two variables:
$
  f(x, y) approx Q(x, y) = &
  f(a, b) + f_x (a, b) (x - a) + f_y (a, b) (y - b) \
  & plus space (f_(x x)(a, b))/2 (x - a)^2 + f_(x y)(a, b) (x - a)(y - b) + (f_(y y)(a, b))/2 (y - b)^2.
$

- The first term is just the function plugged in at the point, just like the single-variable approximation.

- The next two terms are just the linearization of $f$ at $(a, b)$. These are the parts of the approximation involving
  the "first-derivative", just like the single-variable approximation.

- The last three terms are the parts of the approximation involving the "second-derivative". There are actually four
  terms, but since $f_(x y) = f_(y x)$, the two mixed partial derivative terms can be combined (hence why there is no
  division by $2$)

#pagebreak()

== Chain Rule

The *chain rule* computes the derivative of a function of other functions.

- For single-variable functions $y = f(x)$, $dv(y, x) = dv(y, u) dv(u, x)$ if there is an "intermediate function" $u(x)$
  where $y$ is a function of $u$.

- For multivariate functions $f(x, y, ...)$, there are two "cases" of composite functions:
  - *Case 1:* if each variable is a function of a single variable, e.g. $x = g(t), y = h(t)$, then:
    $
      dv(f, t) = pdv(f, x) dv(x, t) + dv(f, y) dv(y, t) + ...
    $
  - *Case 2:* if each variable is a function of several variables, e.g. $x = g(u, v), y = h(u, v)$, then $f$ has partial
    derivatives in both $u$ and $v$:
    $
      pdv(f, u) & = pdv(f, x) pdv(x, u) + pdv(f, y)pdv(y, u) + ... \
      pdv(f, v) & = pdv(f, x) pdv(x, v) + pdv(f, y)pdv(y, v) + ...
    $

#example("Chain Rule")[
  Let $z = x^2 + y^2 + x y$, where $x = ln t$ and $y = cos t$. What is $dv(z, t)$?
  #lorange
  By the formula for case 1:
  $
    dv(z, t) = pdv(z, x) dv(x, t) + pdv(z, y) dv(y, t).
  $

  The partial derivatives of $z$ are:
  $
    pdv(z, x) = 2x + y #h(60pt) pdv(z, y) = 2y + x.
  $
  The derivatives of $x$ and $y$ are:
  $
    dv(x, t) = 1/t #h(60pt) dv(y, t) = -sin t.
  $

  Thus:
  $
    dv(z, t) = (2x + y)(1/t) + (2y + x)(-sin t) = cgreen((2 ln t + cos t)/t - (2 cos t + ln t) sin t).
  $
]

#let draw_tree(tree_arr, direction: "down") = canvas({
  import draw: *

  set-style(content: (padding: 0.3em))
  tree.tree(
    tree_arr,
    direction: direction,
    draw-edge: (from, to, parent, child, ..args) => {
      line(from, to, name: "line", stroke: gray)

      let deriv = if parent.children.len() == 1 [
        $dv(#parent.content, #child.content)$
      ] else [
        $pdv(#parent.content, #child.content)$
      ]

      content("line", [
        #box(deriv, outset: (top: 2pt, bottom: 4pt), fill: white)
      ])
    },
  )
})

#grid(
  columns: 2,
  [
    - We can use a *tree diagram* to help visualize the chain rule. Each node is a variable, and each edge represents a
      partial derivative.

      - The path from the root to a leaf node represents the full "chain" between variables.
      - Find all paths that connect the root to the leaf node of interest, and sum the products of each path.
  ],
  draw_tree(([$z$], ([$x$], $s$, $t$), ([$y$], $s$, $t$))),
)

#example("Chain Rule for Tree Diagram")[
  Use a tree diagram to find a formula for $pdv(f, t)$ if the following functions are given: \
  $f(x, y, z)$, $x(u, v)$, $y(t)$, $z(u, w)$, $u(t)$, $v(a, t)$, $a(t)$, and $w(s, t)$.

  #lorange

  Find all nodes with $t$, then trace each path leading to each node:
  #align(center)[#draw_tree((
    [$f$],
    ([$x$], ([$u$], [$cblue(t)$]), ([$v$], ([$a$], [$cblue(t)$]), [$cblue(t)$])),
    ([$y$], [$cblue(t)$]),
    ([$z$], ([$u$], [$cblue(t)$]), ([$w$], [$s$], [$cblue(t)$])),
  ))]

  There are 6 paths from $f$ to $t$:
  + $f -> x -> u -> t$ becomes the "chain" $pdv(f, x) pdv(x, u) dv(u, t)$. \
    #subtext["_$f$ is a function of $x$, which is a function of $u$, which is a function of $t$_"]
  + $f -> x -> v -> a -> t$
  + $f -> x -> v -> t$
  + $f -> y -> t$
  + $f -> z -> u -> t$
  + $f -> z -> w -> t$

  Thus, by the chain rule:
  $
    pdv(f, t) = cgreen(pdv(f, x) pdv(x, u) dv(u, t) + pdv(f, x) pdv(x, v) pdv(v, a) dv(a, t) + pdv(f, x) pdv(x, v) pdv(v, t) + pdv(f, y) dv(y, t) + pdv(f, z) pdv(z, u) dv(u, t) + pdv(f, z) pdv(z, w) pdv(w, t)).
  $
]

=== Implicit Differentiation

- A function can be either *explicitly* defined (e.g. $z = f(x, y)$) or *implicitly* defined (e.g. $F(x, y, z) = 0$,
  where $z$ is a function of $x$ and $y$).
  - For example, $sin(y) = x^2$ implicitly defines $y$ as a function of $x$.

- To differentiate an implicitly defined function, we use the chain rule just like with single-variable functions.
  - Recall: if $y(x)$ is implicitly defined by $sin(y) = x^2$, we can find $dv(y, x)$ by:
    + taking $dv(, x)$ of both sides: $dv(, x) sin(y) = 2x$
    + using the chain rule if we see a $y$: $dv(, x) sin(y) = dv((sin(y)), y) dv(y, x) = cos(y) dv(y, x)$
    + solving for $dv(y, x)$: $dv(y, x) = (2x) / cos(y)$.

  - If $z(x, y)$ is implicitly defined, then there are two derivatives we can find: $pdv(z, x)$ or $pdv(z, y)$.
    - To find $pdv(z, x)$, take $pdv(, x)$ of both sides, use the chain rule when you see a $z$, then solve for
      $pdv(z, x)$.
    - To find $pdv(z, y)$, take $pdv(, y)$ of both sides, use the chain rule when you see a $z$, then solve for
      $pdv(z, y)$.

#example("Implicit Differentiation")[
  Let $z(x, y)$ be a function of $x$ and $y$. If $x^3 + y^3 + z^3 + 6 x y z = 1$, what is $pdv(z, x)$?
  #lorange
  To find $pdv(z, x)$, take the partial derivative w.r.t. $x$ of both sides:
  $
             pdv(, x)( x^3 + y^3 + z^3 + 6x y z) & = pdv(, x) (1) \
    3x^2 + 0 + pdv(, x)(z^3) + pdv(, x)(6 x y z) & = 0. \
  $
  Let $u = z^3$. To find $pdv(, x) (z^3) = pdv(u, x)$, we must use the chain rule, since $u$ is not an independent
  variable. Since $u$ is a function of $z$ is a function of $x$, the chain rule tells us that:
  $
    pdv(u, x) = pdv(u, z) pdv(z, x).
  $

  Since $pdv(u, z) = 3z^2$, $pdv(u, x) = pdv(, x) (z^3) = 3z^2 pdv(z, x)$. Similarly we can find using the product rule
  that $pdv(, x)(6 x y z) = 6y pdv(, x) (x z) = 6y z + 6 x y pdv(z, x)$:
  $
    3x^2 + 3z^2 pdv(z, x) + 6y z + 6x y pdv(z, x) & = 0 \
                                        pdv(z, x) & = -(3x^2 + 6y z)/(3z^2 + 6x y) = cgreen(- (x^2 + 2y z)/(z^2 + 2x y)).
  $
]

=== Implicit Function Theorem

We can also use partial differentiation directly to find the derivative of implicitly-defined functions (alternative to
implicit differentiation).

Let $y(x)$ be implicitly defined by the equation $F(x, y) = 0$. By taking the partial derivative of both sides w.r.t.
$x$, we get:
$
              pdv(, x) (F(x, y)) & = 0 \
  pdv(F, x) + pdv(F, y) dv(y, x) & = 0 \
                        dv(y, x) & = - (partial F slash partial x) / (partial F slash partial y).
$

#define("Implicit Function Theorem for Single-Variable Functions")[
  Let $y = f(x)$ be defined implicitly by the equation $F(x, y) = 0$. Then:
  $
    dv(y, x) = - (partial F slash partial x) / (partial F slash partial y).
  $
]

#example([If $x^2 + y^2 + x y = 7$, what is $dv(y, x)$?])[
  #lorange
  Let $F(x, y) = x^2 + y^2 + x y - 7$. The partial derivatives of $F$ are:
  $
    pdv(F, x) = 2x + y #h(60pt) pdv(F, y) = 2y + x.
  $
  Thus:
  $
    dv(y, x) = - (partial F slash partial x) / (partial F slash partial y) = cgreen(- (2x + y)/(2y + x)).
  $
]

If we have a function $z(x, y)$ implicitly defined by the equation $F(x, y, z) = 0$, we can find both $pdv(z, x)$ and
$pdv(z, y)$ by taking the partial derivative of both sides w.r.t. $x$ and $y$, respectively:
$
  pdv(F, x) + pdv(F, y) pdv(y, x) + pdv(F, z) pdv(z, x) &= 0 space ==> space
  pdv(z, x) &= - (partial F slash partial x) / (partial F slash partial z). \
  pdv(F, x) pdv(x, y) + pdv(F, y) + pdv(F, z) pdv(z, y) &= 0 space ==> space pdv(z, y) &= - (partial F slash partial y) / (partial F slash partial z). \
$

#rsubtext[Since $x$ is independent of $y$, $pdv(y, x) = 0$ and $pdv(x, y) = 0$.]

#define("Implicit Function Theorem for Multivariable Functions")[
  Let $z = f(x, y)$ be defined implicitly by the equation $F(x, y, z) = 0$. Then:
  $
    pdv(z, x) = - (partial F slash partial x) / (partial F slash partial z) #h(60pt) pdv(z, y) = - (partial F slash partial y) / (partial F slash partial z).
  $
]

#example("Implicit Function Theorem for Multivariable Functions")[
  Let $z(x, y)$ be defined implicitly by the equation $x^3 + y^3 + z^3 + 6 x y z = 1$. Find $pdv(z, x)$ and $pdv(z, y)$.
  #lorange
  Let $F(x, y, z) = x^3 + y^3 + z^3 + 6 x y z - 1$. The partial derivatives of $F$ are:
  $
    pdv(F, x) = 3x^2 + 6y z #h(60pt) pdv(F, y) = 3y^2 + 6x z #h(60pt) pdv(F, z) = 3z^2 + 6x y.
  $
  Thus:
  $
    pdv(z, x) = - (partial F slash partial x) / (partial F slash partial z) = cgreen(- (3x^2 + 6y z)/(3z^2 + 6x y)) #h(60pt) pdv(z, y) = - (partial F slash partial y) / (partial F slash partial z) = cgreen(- (3y^2 + 6x z)/(3z^2 + 6x y)).
  $
  This is the same answer we got using implicit differentiation.
]

#pagebreak()

== Gradients

The *gradient* is a vector of all partial derivatives of a function. If $f$ is a function that takes in $n$ parameters,
then the gradient of $f$, typically denoted $grad f$, is an $n$-dimensional vector.

#define("Gradient of a Function")[
  Let $f$ be a function of $n$ variables: $f(x_1, x_2, ..., x_n)$. Then the *gradient* of $f$ is:
  $
    grad f(x_1, x_2, ..., x_n) = ang(pdv(f, x_1), pdv(f, x_2), ..., pdv(f, x_n)).
  $
]

For example, $grad f(x, y) = ang(pdv(f, x), pdv(f, y))$ and $grad f(x, y, z) = ang(f_x, f_y, f_z)$.

The _nabla_ operator, $grad$, can be interpreted as a vector of partial derivative operators:
$
  grad = ang(pdv(, x), pdv(, y), pdv(, z)).
$

This is why $grad f$ can be used to represent the gradient of $f$:
$
  grad f = ang(pdv(, x), pdv(, y), pdv(, z))f = ang(pdv(f, x), pdv(f, y), pdv(f, z)).
$

This definition of $grad$ will be helpful in future units.

==== Total Differential in terms of the Gradient

Take the total differential of a function $f(x, y)$, $dd(f) = pdv(f, x) dd(x) + pdv(f, y) dd(y)$. We can represent this
as the following dot product:
$
  dd(f) = ang(pdv(f, x), pdv(f, y)) dot ang(dd(x), dd(y)).
$
If we let $dd(arrow(r)) = ang(dd(x), dd(y))$ (a change in "position"), then the total differential can be written as
just:
$
  dd(f) = grad f dot dd(arrow(r)).
$

=== Directional Derivatives

- Suppose a surface $z = f(x, y)$ is graphed in the 3D-plane. Each partial derivative is the slope of the tangent line
  in the direction of the respective axis. For example, $pdv(z, x)$ is the slope of the tangent line in the direction of
  $+x$.

- With partial derivatives, we can only represent the slope in two directions ($+x$ and $+y$). To represent the slope in
  any direction, we use a *directional derivative*

- The directional derivative $D_arrow(v) space f(x, y)$ is the slope of the line tangent to the surface _in the
    direction_ of $arrow(v)$ is denoted $D_arrow(v) f(x, y)$.

#define("Directional Derivative")[
  Let $z = f(x, y)$ be a surface in the 3D-plane, and $hat(v) = ang(v_1, v_2)$ is a 2D #underline[unit] vector. The
  *directional derivative* in the direction of $hat(v)$ is:
  $
    D_hat(v) space f(x, y) = grad f(x, y) dot hat(v) = pdv(f, x) v_1 + pdv(f, y) v_2.
  $
]

- Notice that the definition above only works when $arrow(v)$ is a unit vector.

- An $n$-dimensional manifold has a directional derivative in the direction of an $(n-1)$-dimensional vector (e.g. a 4D
  shape has a 3D directional vector)

- The notation $nabla_arrow(v)$ is sometimes used to denote $D_arrow(v)$. (e.g. $nabla_arrow(v) f$).

=== Properties of Gradients

==== Direction of Steepest Ascent

- The direction for which the directional derivative is highest (direction of *steepest ascent*) is in the direction of
  the gradient vector. The maximum value of the directional derivative is the magnitude of the gradient:
  $
    max D_hat(v) space f(x, y) = abs(grad f(x, y)).
  $

- In the same way, the direction of *steepest descent* is in the direction of $-grad f(x, y)$, and the minimum value of
  the directional derivative is $-abs(grad f(x, y))$.

- If the angle between the direction vector and the gradient vector is $theta$, then by the definition of the dot
  product,
  $
    D_hat(v) space f(x, y) = abs(grad f(x, y)) abs(hat(v)) cos theta = abs(grad f(x, y)) cos theta.
  $
  - Note: this $theta$ is *not* the angle between the x-axis and the direction vector!

==== Normal Lines and Tanget Planes

- The gradient vector at a point is *orthogonal* (perpendicular) to the level curve of the function at that point (or
  level surface if $f$ is a function of 3 variables).

  - A level curve of $f$ is in the form $f(x, y) = c$, where $c$ is a constant. A level surface of $f$ is in the form
    $f(x, y, z) = c$.

- The *tangent line* to a level _curve_ using $grad f$ is $grad f(arrow(r)) dot (arrow(r) - arrow(r)_0) = 0$.

- We can find the *normal line* and *tangent plane* to a level _surface_ using $grad f$:

  - The normal line at point $arrow(r)_0 = ang(x_0, y_0, z_0)$ is given by:
  $
    arrow(r) = arrow(r)_0 + t space grad f(arrow(r)).
  $

  - The tangent plane at $arrow(r)_0 = ang(x_0, y_0, z_0)$ is given by:
  $
    grad f(arrow(r)) dot (arrow(r) - arrow(r)_0) = 0.
  $

=== Generalization of a Linear Approximation

Using the gradient vector, we can generalize the linear approximation for a multivariate function $f$, given its
"center" $arrow(r)_0 = ang(x_0, y_0, z_0, ...)$ (i.e. the "given point"):
$
  L(arrow(r)) = f(arrow(r)_0) + grad f(arrow(r)_0) dot (arrow(r) - arrow(r)_0).
$

This is a first-order Taylor polynomial for $f$. It is similar to the formula for single-variable functions, but instead
of derivatives, gradients are used.

Note that we pass in a position vector $arrow(r) = ang(x, y, z, ...)$ to represent all parameters passed into $f$.

=== Extension: The Hessian Matrix


If represent $grad$ as a column vector and perform matrix multiplication:

#define("Hessian Operator (Gradient Definition)")[
  The *hessian operator* $bf(H)$, when applied to a function, returns a matrix of its second-order partial derivatives.
  The operator is defined as:
  $
    bf(H) = grad space grad^"T".
  $
]

For example, the Hessian operator applied to a function $f(x, y)$ is:
$
  bf(H)(f) = grad space grad^"T" f = mat(partial_x; partial_y)mat(partial_x, partial_y) f = mat(f_(x x), f_(y x); f_(x y), f_(y y)).
$

The resulting matrix is known as the *Hessian matrix* of $f$:

#define("Hessian Matrix")[
  Let $f(x_1, x_2, ..., x_n)$ be a function of $n$ variables. Then the *Hessian matrix* of $f$ is the matrix of all
  partial derivatives:
  $
    bf(H)(f) = mat(
      (partial^2 f) / (partial x_1^2), (partial^2 f) / (partial x_1 partial x_2), ..., (partial^2 f) / (partial x_1 partial x_n);
      (partial^2 f) / (partial x_2 partial x_1), (partial^2 f) / (partial x_2^2), ..., (partial^2 f) / (partial x_2 partial x_n);
      dots.v, dots.v, dots.down, dots.v;
      (partial^2 f) / (partial x_n partial x_1), (partial^2 f) / (partial x_n partial x_2), ..., (partial^2 f) / (partial x_n^2)
    )
  $
  Or, more compactly, it is the $n times n$ matrix $bf(H)$ where
  $bf(H)_(i, j) = (partial^2 f)/(partial x_i partial x_j)$.
]

The Hessian matrix can be thought of as a "second-order gradient" and the analog to the second derivative in the Taylor
polynomial.

Thus, the quadratic approximation of $f$ at $arrow(r)_0$ is:
$
  Q(arrow(r)) = f(arrow(r)_0) + grad f(arrow(r)_0) dot (arrow(r) - arrow(r)_0) + 1/2 (arrow(r) - arrow(r)_0)^"T" bf(H)(f(arrow(r)_0)) (arrow(r) - arrow(r)_0).
$

#pagebreak()

== Extreme Values

=== Local Extrema

- A function $f(x, y)$ has a _local maximum_ at $(a, b)$ if $f(a, b) >= f(x, y)$ for all points $(x, y)$ near $(a, b)$.
- A function $f(x, y)$ has a _local minimum_ at $(a, b)$ if $f(a, b) <= f(x, y)$ for all points $(x, y)$ near $(a, b)$.
- Collectively, these are called _local extrema_.

Just like univariate functions, multivariate functions can only attain local extrema at *critical points*. This is where
the function has a derivative that is either zero or undefined:

#define("Critical Points")[
  Let $f$ be a function of several variables: $f(x, y, ...)$. $f$ has a *critical point* at $(a, b, ...)$ if
  $grad f(a, b, ...) = arrow(0)$ or it is not differentiable at $(a, b, ...)$ (i.e. $grad f$ is undefined).
]

A local extrema does not exist at every critical point. To determine if a critical point is a local extrema, we can use
the _second partial derivative test_:

#define("Second Partial Derivative Test")[
  Let $f(x, y)$ be a function of two variables whose second-order partial derivatives are *continuous*. Let
  $D = det(bf(H)(f))$ be the determinant of the _Hessian matrix_ of $f$. \ In other words:
  $D = mat(delim: "|", f_(x x), f_(y x); f_(x y), f_(y y)) = f_(x x) f_(y y) - f_(x y)^2$.

  If $(a, b)$ is a *critical point* of $f$, then:
  - if $D(a, b) > 0$:
    - ...and $f_(x x) > 0$, then there is a _local minimum_ at $(a, b)$.
    - ...and $f_(x x) < 0$, then there is a _local maximum_ at $(a, b)$.
  - if $D(a, b) < 0$, there is a _saddle point_ at $(a, b)$.
  - if $D(a, b) = 0$, the test is _inconclusive_.
]

#example("Finding Local Extrema using Second Partial Derivative Test")[
  Find and classify all local extrema of the function $f(x, y) = x^3 + y^3 - 3x - 12y + 5$.
  #lorange
  First, find the critical points by setting $grad f = arrow(0)$:
  $
    grad f(x, y) = ang(pdv(f, x), pdv(f, y)) = ang(3x^2 - 3, 3y^2 - 12).
  $
  Setting each component equal to zero gives:
  $
    3x^2 - 3 = 0 #h(60pt) 3y^2 - 12 = 0 \
    x = plus.minus 1 #h(60pt) y = plus.minus 2.
  $
  Thus, the critical points are $(1, 2), (1, -2), (-1, 2), (-1, -2)$.

  Next, compute the second-order partial derivatives:
  $
    f_(x x) = 6x #h(60pt) f_(y y) = 6y #h(60pt) f_(x y) = 0.
  $

  Thus, $D = abs(bf(H)(f)) = mat(delim: "|", 6x, 0; 0, 6y) = 36x y$.

  Now evaluate $D$ at each critical point:
  #table(
    [$(x, y)$], [$D(x, y)$], [$f_(x x) (x, y)$], [*Classification*],
    [$(1, 2)$], [$36$], [$6$], [Local Minimum since $D>0$ and $f_(x x) > 0$],
    [$(1, -2)$], [$-36$], [], [Saddle Point since $D<0$],
    [$(-1, 2)$], [$-36$], [], [Saddle Point since $D<0$],
    [$(-1, -2)$], [$36$], [$-6$], [Local Maximum since $D>0$ and $f_(x x) < 0$],
    columns: 4,
  )
]

#pagebreak()

=== Absolute Extrema

- A function $f(x, y)$ as an _absolute maximum_ at $(a, b)$ on a region $D$ if $f(a, b) >= f(x, y)$ for all points
  $(x, y)$ in $D$.
- A function $f(x, y)$ as an _absolute minimum_ at $(a, b)$ on a region $D$ if $f(a, b) <= f(x, y)$ for all points
  $(x, y)$ in $D$.
- Collectively, these are called _absolute extrema_.

#define("Extreme Value Theorem")[
  Let $f(x, y)$ be a function of two variables that is *continuous* on a _closed_ and _bounded_ region $D$. Then $f$
  attains both an absolute maximum and an absolute minimum on $D$.
]

==== Candidates Test

Recall the candidates test for single-variable functions: to find absolute extrema on a closed interval $[a, b]$:

+ Evaluate the function at all critical points in $(a, b)$
+ Evaluate the function at the endpoints $x=a$ and $x=b$.
+ The largest value is the absolute maximum, and the smallest value is the absolute minimum.

For multivariate functions $f(x, y)$ on a closed and bounded region $D$:

+ Evaluate the function at all critical points in the interior of $D$ (where $grad f = arrow(0)$ or undefined).
+ Evaluate the function on all candidates on the _boundary_ of $D$.
+ The largest value is the absolute maximum, and the smallest value is the absolute minimum.

#subtext[Essentially, the absolute extrema can occur either in the interior of the region (which we can easily find
  candidates for using $grad f = arrow(0)$) or on the boundary of the region. Unlike single-variable functions, there
  are an infinite number of points at the boundary.

  We must find a way to find candidates on the boundary which _may_ contain the extrema.]

For step two, there are two primary methods of finding these candidates:

- Find the absolute extrema of $f$ on parts of the boundary where we can reduce $f$ to a single-variable function (e.g.
  along line segments) --- this is called the _closed interval method_.
- Use the method of *Lagrange Multipliers* to find candidates on more complex boundaries (this is the next section)

#example("Closed Interval Method with Line Segments")[
  Find the absolute extrema of $f(x, y) = x^2 - 2x y + 2y$ on the triangular region with vertices at
  $(0, 0), (2, 0), (0, 2)$.
  #lorange

  First, find the critical points in the interior of the region by setting $grad f = arrow(0)$:
  $
    grad f(x, y) = ang(pdv(f, x), pdv(f, y)) = ang(2x - 2y, -2x + 2).
  $

  This is a linear system with only one solution: $(1, 1)$. This is our first _candidate_.

  Next, evaluate $f$ on each side of the triangle ($L_1$, $L_2$, and $L_3$):

  - $L_1$ is the line segment from $(0, 0)$ to $(2, 0)$. Here, $y = 0$, so $f(x, 0) = x^2$.

    To find the extrema on $L_1$ we consider critical points _and_ endpoints as candidates.
    - $f(x, 0)$ has a critical point at $x=0$ since it satisfies $dv(, x) f(x,0) = 2x = 0$. We must also consider
      endpoints at $x=0$ and $x=2$. Add $(0, 0), (2, 0)$ as candidates.

  - $L_2$ is the line segment from $(2, 0)$ to $(0, 2)$. Here, $y = -x + 2$, so
    $f(x, -x + 2) = x^2 - 2x(-x + 2) + 2(-x + 2) = 3x^2 - 6x + 4$.

    There is a critical point at $x=1$ ($dv(, x) f(x, -x + 2) = 6x - 6 = 0 ==> x=1$) and endpoints at $x=0$ and $x=2$.
    Add $(1, 1), (2, 0), (0, 2)$ as candidates.

  - $L_3$ is the line segment from $(0, 2)$ to $(0, 0)$. Here, $x = 0$, so $f(0, y) = 2y$.

    There is no critical point and endpoints at $y=0$ and $y=2$. Add $(0, 0), (0, 2)$ as candidates.

  Now evaluate $f$ at all candidates:
  #table(
    [*Source*], [$(x, y)$], [$f(x, y)$],
    [$grad f = arrow(0)$ and $L_2$], [$(1, 1)$], [$1$],
    [$L_1, L_3$], [$(0, 0)$], [$0$],
    [$L_1, L_2$], [$(2, 0)$], [$4$],
    [$L_2, L_3$], [$(0, 2)$], [$4$],
    columns: 3,
  )
  The absolute minimum is $0$ at $(0, 0)$ and the absolute maximum is $4$ at $(2, 0)$ and $(0, 2)$.
]
#pagebreak()

== Lagrange Multipliers

- When trying to find absolute extrema in a closed region, we had to find the minima and maxima of a known _boundary_.
  - For boundaries of single variable functions, all we need is a left boundary and a right boundary, so we only have to
    test two values
  - For boundaries of multivariate functions, there could be an infinite number of points on the boundary.

- The _closed interval method_ works when the boundary can be reduced to single-variable functions (e.g. line segments),
  allowing us to determine a finite set of _candidates_ for which we can test the function at to find the absolute
  extrema.
  - However, this method does not work for more complex boundaries (e.g. circles, ellipses, curves, etc.).

- The method of *Lagrange Multipliers* allows us to achieve this step. It is an alternative method of finding a finite
  set of _candidates_ on the boundary.

=== Method of Lagrange Multipliers with One Constraint

==== Intuition

- Suppose we want to find the absolute extrema of a function $f(x, y)$ subject to a constraint $g(x, y) = c$ (where $c$
  is a constant). The constraint is a level curve of $g$.

- At the points where $f$ attains its absolute extrema on the constraint, the level curve of $f$ is _tangent_ to the
  level curve of $g$.
  - This means that the two curves have the same slope at these points.

- The gradients of $f$ and $g$ are orthogonal to their respective level curves. Thus, at the points where $f$ attains
  its absolute extrema on the constraint, the gradients of $f$ and $g$ are _parallel_.
  - In other words, there exists a scalar $lambda$ (called a *Lagrange multiplier*) such that:
    $
      grad f(x, y) = lambda space grad g(x, y).
    $

==== Procedure

+ The first constraint is that the gradients of $f$ and $g$ are parallel: $grad f(x, y) = lambda grad g(x, y)$ \
  This can be rewritten as two equations:
  $
    f_x = lambda g_x #h(60pt)
    f_y = lambda g_y.
  $

+ The second constraint is the original constraint: $g(x, y) = c$.

  Together, we have a system of three scalar equations with three unknowns $(x, y, lambda)$:
  $
    f_x = lambda g_x \
    f_y = lambda g_y \
    g(x, y) = c.
  $

+ Solving this system gives us a finite number of _candidates_ $(x, y)$ for which we can evaluate $f(x, y)$ to find the
  absolute extrema subject to the constraint.

#define("Method of Lagrange Multipliers with One Constraint")[
  The _candidates_ for the absolute extrema of a function $f(x, y)$ subject to the constraint $g(x, y) = c$ occur for
  all $(x, y, lambda)$ that satisfy the system of equations:
  $
    grad f = lambda space grad g \
    g(x, y) = c.
  $
  For a solution $(x, y, ..., lambda)$, $lambda$ is called the *Lagrange multiplier* for the candidate $(x, y, ...)$.
]

#example("Lagrange Multipliers with One Constraint")[
  Find the absolute extrema of $f(x, y) = x^2 + y^2$ subject to the constraint $x + y = 1$.
  #lorange

  First, compute the gradients of $f$ and $g(x, y) = x + y$:
  $
    grad f(x, y) = ang(pdv(f, x), pdv(f, y)) = ang(2x, 2y) #h(60pt) grad g(x, y) = ang(pdv(g, x), pdv(g, y)) = ang(1, 1).
  $

  Next, set up the system of equations:
  $
    2x = lambda #h(60pt) 2y = lambda #h(60pt) x + y = 1.
  $

  Solving this system gives two candidates: $(0, 1)$ and $(1, 0)$.

  Finally, evaluate $f$ at each candidate:
  #table(
    [$(x, y)$], [$f(x, y)$],
    [$(0, 1)$], [$1$],
    [$(1, 0)$], [$1$],
    columns: 2,
  )
  Thus, the absolute minimum is $1$ at both $(0, 1)$ and $(1, 0)$. There is no absolute maximum since $f$ is unbounded
  on the constraint.
]

We can combine this with the standard candidates test from the previous section to find absolute extrema on closed and
bounded regions with more complex boundaries:

+ Find the critical points in the interior of the region by setting $grad f = arrow(0)$ or where $grad f$ is undefined.
+ Suppose the boundary of $f$ is the constraint $g(x, y) = c$. Then, we can use the method of Lagrange multipliers to
  find candidates on the boundary.
+ Evaluate $f$ at all candidates from the interior and boundary, and determine the absolute extrema.

=== Method of Lagrange Multipliers with Multiple Constraints

The method of Lagrange multipliers can be extended to work with multiple constraints.

+ Suppose we want to find the absolute extrema of a function $f(x, y, z)$ subject to two constraints: $g(x, y, z) = c_1$
  and $h(x, y, z) = c_2$ (where $c_1$ and $c_2$ are constants).
  - Each constraint reduces the dimensionality of the domain by one. Thus, with two constraints, we are restricting $f$
    to a curve in 3D space. (Whereas with only one, we were restricting $f$ to a surface in 3D space.)
  - The constraint can also be thought of as the _curve of intersection_ between the two surfaces defined by
    $g(x, y, z) = c_1$ and $h(x, y, z) = c_2$.

+ At the points where $f$ attains its absolute extrema on the constraints, the level surface of $f$ is tangent to both
  constraint surfaces.
  - This means that the gradients of $f$, $g$, and $h$ are all parallel.\
    In other words, there exists scalars $lambda$ and $mu$ such that:
  $
    grad f(x, y, z) = lambda grad g(x, y, z) + mu grad h(x, y, z).
  $

+ The second and third constraints are the original constraints: $g(x, y, z) = c_1$ and $h(x, y, z) = c_2$. Together, we
  have a system of five scalar equations with five unknowns $(x, y, z, lambda, mu)$:
  $
    f_x = lambda g_x + mu h_x \
    f_y = lambda g_y + mu h_y \
    f_z = lambda g_z + mu h_z \
    g(x, y, z) = c_1 \
    h(x, y, z) = c_2.
  $

#define("Method of Lagrange Multipliers with Multiple Constraints")[
  The _candidates_ for the absolute extrema of a function $f(x, y, z)$ subject to the constraints $g(x, y, z) = c_1$ and
  $h(x, y, z) = c_2$ occur for all $(x, y, z, lambda, mu)$ that satisfy the system of equations:
  $
    grad f = lambda space grad g + mu space grad h \
    g(x, y, z) = c_1 \
    h(x, y, z) = c_2.
  $
  For a solution $(x, y, z, lambda, mu)$, $lambda$ and $mu$ are called the *Lagrange multipliers* for $(x, y, z)$.
]

#example("Absolute Extrema of a Function of Three Variables")[
  Let $f(x, y, z) = x^2 + 2y^2 - 3 x y + z^2$. The closed curve $C$ is defined by the intersection of the surfaces
  defined by $x^2 + y^2 + z^2 = 6$ and $x + y + z = 0$. The region $D$ is the set of all points on and inside the curve
  $C$. Find the absolute extrema of $f$ on the region $D$.
  #lorange
  First, find the critical points in the interior of the region by setting $grad f = arrow(0)$.
  $
    grad f(x, y, z) = ang(pdv(f, x), pdv(f, y), pdv(f, z)) = ang(2x - 3y, 4y - 3x, 2z).
  $
  Setting each component equal to zero gives:
  $
    2x - 3y = 0 #h(60pt) 4y - 3x = 0 #h(60pt) 2z = 0 \ (x, y, z) = (0, 0, 0).
  $
  Thus, the only critical point in the interior is $(0, 0, 0)$. Next, use the method of Lagrange multipliers to find
  candidates on the boundary defined by the constraints $g(x, y, z) = x^2 + y^2 + z^2 = 6$ and
  $h(x, y, z) = x + y + z = 0$. The gradients of $f$, $g$, and $h$ are:
  $
    grad f(x, y, z) = ang(2x - 3y, 4y - 3x, 2z) \
    grad g(x, y, z) = ang(2x, 2y, 2z) #h(60pt) grad h(x, y, z) = ang(1, 1, 1).
  $
  Setting up the system of equations gives:
  $
    2x - 3y = 2x lambda + mu \
    4y - 3x = 2y lambda + mu \
    2z = 2z lambda + mu \
    x^2 + y^2 + z^2 = 6 \
    x + y + z = 0.
  $
  Solving this system gives the following candidates on the boundary:
  $
    (sqrt(6), -sqrt(6), 0), (-sqrt(6), sqrt(6), 0), (sqrt(3), sqrt(3), -2 sqrt(3)), \
    (-sqrt(3), -sqrt(3), 2 sqrt(3)), (0, sqrt(6), -sqrt(6)), (0, -sqrt(6), sqrt(6)).
  $
  Finally, evaluate $f$ at all candidates:
  #table(
    [$(x, y, z)$], [$f(x, y, z)$],
    [$(0, 0, 0)$], [$0$],
    [$(sqrt(6), -sqrt(6), 0)$ and $(-sqrt(6), sqrt(6), 0)$], [$12$],
    [$(sqrt(3), sqrt(3), -2 sqrt(3))$ and $(-sqrt(3), -sqrt(3), 2 sqrt(3))$], [$-3$],
    [$(0, sqrt(6), -sqrt(6))$ and $(0, -sqrt(6), sqrt(6))$], [$6$],
    columns: 2,
  )
  Thus, the absolute minimum is $-3$ at both $(sqrt(3), sqrt(3), -2 sqrt(3))$ and $(-sqrt(3), -sqrt(3), 2 sqrt(3))$. \
  The absolute maximum is $12$ at both $(sqrt(6), -sqrt(6), 0)$ and $(-sqrt(6), sqrt(6), 0)$.
]
