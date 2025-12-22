#import "helpers/template.typ": *

#show: template.with(title: "Differential Equations")

= Fundamentals of Differential Equations

== What are Differential Equations?

- A *differential equation* (DE) is an equation which expresses the relationship between expressions which are expressed using derivatives.

  For example, Newton's Second Law, $arrow(F) = m arrow(a)$, is a differential equation since acceleration $arrow(a)$ is the time-derivative of velocity ($arrow(a) = dv(arrow(v), t)$) and the second time-derivative of position ($a = ndv(arrow(x), t, 2)$): $
    arrow(F) = m arrow(a) = m dv(arrow(v), t) = m ndv(arrow(x), t, 2)
  $
  
- The solutions to differential equations are _functions_:

  - The *general solution* to a differential equation represents all possible functions that satisfy the equation without initial conditions. \
    #subtext[For example, the general solution to $dv(y,t) = y$ is $y = C e^t$, where $C$ can be any constant]

  - If *initial/boundary conditions* are given, we may be able to determine a *particular solution* which is a form of the general solution that also satisfies the conditions. \
    #subtext[For example, if given the condition $y(0) = 10$, then the particular solution to $dv(y,t)=y$ is $10e^t$]

    - An *initial value problem (IVP)* is a differential equation constrained by as many *initial  conditions* (known derivatives at one given time) needed to allow us to achieve a particular solution. The number of initial conditions required is the order of the differential equation. \
      #subtext[ex: $f(0) = 0, f'(0) = 1, f''(0) = 5$ are a set of conditions for a second-order IVP.]
      
    - A *boundary value problem (BVP)* is a differential equation constrained by as many *boundary conditions* (known values at many different times) as needed. The number of boundary conditions required is also equal to the order of the DE. \
      #subtext[ex: $f(0) = 0, f(1) = 10, f(2) = 5$ are a set of conditions for a second-order BVP.]
    
    - The *interval of validity* for the solution to an IVP or BVP is the largest possible continuous interval on which the solution is defined and satisfies the conditions.

  - *Explicit solutions* are written in "function form", where the dependent variable is isolated completely ($y = f(t)$)

    *Implicit solutions* is any solution not written explicitly (e.g. $y^2 = ...$ or $x^2 + y^2 = ...$)
      
== Classifying Differential Equations

Differential equations can be classified according to a number of properties:

=== Ordinary vs. Partial

- A differential equation is *ordinary* (an _ordinary differential equation_ or _ODE_) if there are no partial derivatives anywhere in the function (i.e., we only deal with one independent variable) \
  #subtext[ex: $dv(y,t) + t^2 y = 0$ is an ODE because the only independent variable is $t$.]

- A differential equation is *partial* (a _partial differential equation_ or _PDE_) if it contains partial derivatives (i.e. we deal with multiple independent variables) \
  #subtext[ex: $pdv(T,t) = k npdv(T,x,2)$ is a PDE because there are multiple independent variables, $x$ and $t$.]

=== Order
  
The *order* of a differential equation is the order of the highest-order derivative present anywhere in the equation.

#subtext[ex: The order of $dv(y, x) + y^10 = x$ is $1$, and the order of $y^2 ndv(y, x, 3) + x ndv(y, x, 2) = 0$ is $3$.]

=== Linear

A differential equation is *linear* if all derivatives of the dependent variable ($y$, $dv(y, x)$, $ndv(y, x, 2)$, etc.) are represented linearly. That is, we can represent the DE in the form: $
  a_0(x) y + a_1(x) y' + a_2(x) y'' + ... + a_n (x) y^((n)) = f(x),
$
#rsubtext[where $a_n (x)$ and $f(x)$ are arbitrary functions of $x$.]

==== Examples
- $cos(x) ndv(y, x, 2) + dv(y, x) = 2x^2y$ is linear

- $(dv(y, x))^2 + y^2 = 0$ is nonlinear because $(dv(y, x))^2$ and $y^2$ are nonlinear in $dv(y, x)$ and $y$.

- $dv(y, x) + cos(y) = 0$ is nonlinear because $cos(y)$ is nonlinear in $y$.

=== Degree

The *degree* of a differential equation is the polynomial degree of the highest-order derivative of the dependent variable.

#rsubtext[This means that all linear differential equations are of the first-degree!]

==== Examples
- $y' + y^2 = 1$ is first-degree because the highest-order derivative, $y'$, is first-degree.

- $(y')^2 + y^2 = 1$ is second-degree because the highest-order derivative, $y'$, is squared.

- $(ndv(y, x, 2))^3 + (dv(y, x))^2 + y^2 = x^6$ is third-degree because the highest-order derivative, $ndv(y,x,2)$, is cubed.

=== Autonomous

An *autonomous* differential equation is only governed by the current state of the variables. That is, it only contains the dependent variable or function.

More generally, for first-order DEs, autonomous differential equations take the form: $
  dv(y,x) = f(y).
$ If $x$ appears in an autonomous DE, it should appear as a function of $y$.

#rsubtext[
  Higher-order autonomous DEs take the form $a_0(y) y + a_1(y) y' + a_2(y) y'' ... + a_n (y) y^((n)) = f(y)$.
]

==== Examples

- An exponential function can be represented by the DE $dv(y,x) = k y$. It is autonomous because its rate of change at any $x$ is _only_ governed by the value of $y(x)$.

- The DE which models a logistic function is also autonomous: $dv(P,t) = k P(L - P)$ where $k, P$ are constants. The rate at which the population is growing at any time _only_ depends on the population and not what time it is.

- The DE $y'(t) = t^2$ is _not_ autonomous because the rate of change can vary based on the time $t$. 

=== Homogeneous

A differential equation is *homogeneous* if it is linear AND it has no terms that _only_ contain either the independent variable or a constant. They may, however, be coefficients of the derivatives of the dependent variable.

In other words, a homogeneous DE takes the form: $
  a_0 (x) + a_1(x) y' + a_2 (x) y'' + ... + a_n (x) y^((n)) = 0.
$

==== Examples

- The DE $dv(y,t) = 2x y$ is homogeneous because it is both linear, and there are no terms which only contain $x$.

- The DE $dv(y,t) = 2x y + 1$ is _not_ homogeneous because there is the constant term $1$.

== Solving by Antidifferentiation

- The most fundamental differential equation relates some *rate of change* of a dependent variable with respect to an independent variable to another function. 

- If we say $f'(t) = 2t$, we are saying that the rate of change of $f$ at a time $t$ is $2t$.

  - In other words, we are saying that the derivative of $f$ is $2t$, so to find $f$, we take the antiderivative of $2t$ with respect to $t$: $
      f'(t) &= 2t \
      integral f'(t) dd(t) &= integral 2t dd(t) \
      f(t) + C_0 &= t^2 + C_1
    $

  - Since we took two indefinite integrals, we ended up with two constants of integration. Usually, we implicitly drop one of the constants to simplify the work: $
      cgreen(f(t) = t^2 + C).
    $
    #rsubtext[where $C = C_1 - C_0$]

- The DE above is _first-order_ since we only work with $f'$ in the equation. If it was made into an _IVP_, we would only need one constraint:

  - Let's add the initial value $f(0) = 4$. Then we can find a particular solution by plugging into $f$: $
      f(0) = 0^2 + C = 4 ==> C = 4 \
      cgreen(f(t) = t^2 + 4).
    $

- Higher-order DEs may be represented in the form $f^((n))(t) = ...$
  
  - Our constant of integration would become an $(n-1)$#super[th]-degree polynomial as we integrate $n$ times.

  - An IVP for a DE of that form would require at least $n$ boundary conditions.

#example($f'''(t) = 24x^3 + 6x, f(0) = 2, f'(0) = 5, f''(0) = 10$)[
  Find the general solution:
  $
    integral f'''(t) dd(t) &= integral (24x^3 + 6x) dd(x) \
    integral f''(t) dd(t) &= integral (6x^4 + 3x^2 + C_0) dd(t) \
    integral f'(t) dd(t) &= integral (6/5 x^5 + x^3 + C_0 x + C_1) dd(t) \
    cgreen(f(t) &= 1/5 x^6 + 1/4 x^ 4 + C_0 x^2 + C_1 x + C_2)
  $

  Solve for $C_0, C_1, C_2$: $
    f(0) = ... +  C_2 = 2 ==> C_2 = 2 \
    f'(0) = ... + C_1 + ... = 5 ==> C_1 = 5 \
    f''(0) = ... + 2C_0 + ... = 10 ==> C_0 = 5 
  $

  Write the particular solution: $
    cgreen(f(t) = 1/5 x^6 + 1/4 x^4 + 5x^2 + 5x + 2).
  $
]

== Intervals of Validity

#pagebreak()

== Existence and Uniqueness Theorems

- Often, when considering an IVP, we must first decide whether an solution exists to the IVP at all (existence), and whether if a solution to the IVP is the _only_ solution (uniqueness).

- For example, the IVP $dv(y,x) = y^(2/3), y(0) = 0$ can have two solutions: $y = x^3$ and $y = 0$.

=== Existence Theorem

#define("Existence Theorem for First Order IVPs")[
   Assume the initial value problem $dv(y,x) = f(x,y), space y(x_0) = y_0$. If we select a rectangular interval $R$ on $f(x, y)$ containing $(x_0,y_0)$, where $R = (a,b) times (c,d)$, and $f(x,y)$ is *continuous* along $R$, then there must exist *at least* one solution to the IVP, $y(x)$, which is valid along a subinterval of $(a,b)$, $(x_0-h, x_0+h)$.
]

In simpler terms, let us have a DE in the form $dv(y,x) = f(x,y)$, and we want to find a solution passing through the point $(x_0, y_0)$.

Consider all pairs of values $(x, y)$ in the intervals $x in (a, b)$ and $y in (c, d)$ which create a rectangular region $R$. If $f(x,y)$ is continuous throughout these intervals, and $(x_0, y_0)$ is a point contained in $R$, then the existence theorem holds, and there must exist at least one function $y(x)$ that solves the initial value problem.

The solution $y(x)$ will have an interval of validity that is a subset of $(a, b)$, \ denoted $(x_0 - h, x_0 + h)$.

=== Uniqueness Theorem

#define("Uniqueness Theorem for First Order IVPs")[
  Let an IVP $dv(y,x) = f(x,y), y(x_0) = y_0$ satisfy the existence theorem over $R = (a,b) times (c,d)$. Then if $pdv(f, y)$ is *continuous* over $R$, there must exist *exactly* one solution to the IVP, $y(x)$, which is valid along a subinterval of $(a, b)$.
]

Assume we have an IVP that already satisfies the existence theorem involving the DE in the form \ $dv(y,x) = f(x,y)$, meaning $f(x,y)$ is continuous over some interval $R$ containing $(x_0, y_0)$. If $pdv(f,y)$ is _also continuous_ over $R$, then the uniqueness theorem holds, and there exists _exactly_ one solution for the IVP.

== Analyzing Differential Equations

Recall the the following form of a first-order DE: $
  dv(y,x) = f(x,y).
$
The function $f$ in this case is known as the *slope function*, where the slope of the tangent line at $(x, y(x))$ on any solution curve to the DE.

We can sketch a *slope field* which represents

=== Analyzing Autonomous DEs

There are even simpler ways to represent an autonomous DE. Recall that an autonomous DE is one where the derivative only depends on the dependent variable: $
  dv(y,x) = f(y).
$

==== Phase Portraits and Asymptotic Stability

Since an autonomous DE $dv(y,x) = f(y)$ _only_ depends on $y$, we can draw a one-dimensional "number line" to analyze the DE. This number line is known as a *phase portrait*. Where $dv(y,x)$ is positive, draw an arrow 

#pagebreak()

= First-Order Differential Equations

== Separable First-Order ODEs

A _separable first-order differential equation_ is in the form: $
  f(y) dv(y, x) = g(x).
$

This is the most simple type of differential equation to solve. _Separate_ all functions and differentials in $y$ to one side of the equation and all functions and differentials in $x$ to the other, then integrate both sides: $
  integral f(y) dd(y) = integral g(x) dd(x)
$

Finally, solve for $y$ in terms of $x$.

#example($dv(y,x) = 6y^2x$)[
  ===== 1. Separate
  $
      1/y^2 dd(y) = 6x dd(x)
  $
  ===== 2. Integrate
  $
    integral 1/y^2 dd(y) &= integral 6x dd(x) \
    -1/y &= 3x^2 + C
  $
  ===== 3. Solve for _y_
  $
    cgreen(y = -1/(3x^2 + C) = 1/(C - 3x^2))
  $
]
=== Loss of a Solution

Let us solve the separable DE $dv(y,x) = g(x) h(y)$, and let $h(r) = 0$, where $r$ is a constant. Then, $y = r$ is a solution to the DE as it makes both sides $0$.

However, when we separate, we will get the DE $dd(y)/(h(y))$, where we would implicitly have to assume $h(y) != 0$, causing us to "lose" the solution $y = r$. Thus, if a separable DE is in the aforementioned form and does not satisfy the existence and uniqueness theorem, we must check if there exists a $r$ such that $y = r$ is a solution to the DE.

#pagebreak()

== Linear First-Order ODEs

A _linear first-order differential equation_ is in the form: $
  dv(y, x) + P(x) y = Q(x).
$

These types of equations are typically solved using an *integrating factor*. This is some function $mu(x)$ which is multiplied to both sides of the equation: $
  mu(x) dv(y, x) + mu(x) P(x) y = mu(x)Q(x)
$

_But why is this useful?_ In our original equation, notice we see both $y$ and its derivative in: $
  cred(dv(y, x)) + P(x) cred(y) = Q(x)
$

Then, recall that the product rule would imply that for some function $f(x)$, $
  cblue(f(x))cred(dv(y, x)) + cblue(f'(x))cred(y) = dv(,x) cblue(f(x)) cred(y).
$

However, since we lack some $f(x)$ in front of our $dv(y,x)$ term, we use $mu(x)$, the _integrating factor_, to help us get into the product rule form and find a general solution: $
  cblue(mu(x)) cred(dv(y, x)) + cblue(mu(x) P(x)) cred(y) &= mu(x)Q(x) \
  dv(,x)cblue(mu(x) cred(y)) &= mu(x) Q(x) \
  mu(x)y &= integral mu(x) Q(x) dd(x) \
  cgreen(y &= 1/(mu(x)) integral mu(x) Q(x) dd(x)).
$

#rsubtext[
  Note that we are only dealing with the general case. When working with an actual equation, we must still remember the constant of integration: $y = 1/mu(x) (integral mu(x) Q(x) dd(x) cred(+ C)).$
]

We can solve for $mu(x)$ by recalling the assumptions made by the product rule: $
  cancel(cblue(mu(x)) cred(dv(y, x))) + cblue(mu(x) P(x)) cred(y) &= cancel(cblue(mu(x))cred(dv(y, x))) + &&cblue(mu'(x))cred(y) = dv(,x)cblue(mu(x))cred(y) \
  
  cblue(mu(x) P(x))cancel(cred(y)) &= && cblue(mu'(x))cancel(cred(y))
$

From this, we get $mu'(x) = mu(x)P(x)$. We can now solve for the integrating factor: $
  mu'(x) &= mu(x)P(x) \
  (mu'(x))/mu(x) &= P(x) \
  integral (mu'(x))/mu(x) dd(x) &= integral P(x) dd(x) \
  ln(mu(x)) &= integral P(x) dd(x) \
  mu(x) &= e^(integral P(x) dd(x))
$

So, the expanded general solution to a linear ODE in the form $dv(y,x) + P(x)y = Q(x)$ is: $
  cgreen(y = 1/(e^(integral P(x) dd(x))) integral e^(integral P(x) dd(x)) Q(x) dd(x)).
$

#define("First-Order Linear Differential Equation")[
  The general solution to the differential equation $dv(y,x) + P(x)y + Q(x)$ is: $
    y = 1/mu(x) integral mu(x)Q(x)dd(x) cgray(+ C / mu(x))
  $
  where $mu(x) = e^(integral P(x) dd(x))$, the integrating factor.
]

#example($display(x dv(y,x) + 2y = x^2 - x + 1)$)[
  \
  First, rewrite the DE in the form $dv(y,x) + P(x)y = Q(x)$ by dividing both sides by $x$: $
    dv(y,x) + 2/x y = x - 1 + 1/x
  $

  We see that $P(x) = 2/x$ and $Q(x) = x - 1 + 1/x$. Find the integrating factor: $
    mu(x) = e^(integral 2/x dd(x)) = e^(2 ln x) = x^2.
  $

  Now, multiplying the equation by $mu(x)$ on both sides: $
    cred(x^2) cblue(dv(y,x)) + cred(2x) cblue(y) &= x^3 - x^2 + x \
    dv(,x)(cred(x^2) cblue(y)) &= x^3 - x^2 + x \
    x^2 y &= integral (x^3 - x^2 + x) dd(x) \
    x^2 y&= 1/4 x^4 - 1/3 x^3 + 1/2 x^2 + C \
    cgreen(y &= 1/4 x^2 - 1/3 x + 1/2 + C/x^2).
  $
]

== Exact First-Order ODEs

We can rearrange certain differential equations to be in the following form: $
  f(x,y) dd(x) + g(x,y) dd(y) = 0.
$

Rearranging, we see that many DEs can be represented in the above form: $
  g(x,y) dd(y) &= -f(x,y) dd(x) \
  dv(y,x) &= -f(x,y)/g(x,y) \
  f(x,y) + g(x,y) dv(y,x) &= 0
$

*Exact differential equations* are DEs derived from implicit differentiation. \
For example, here is the exact DE derived from the implicit solution $x^2y^4 + y^3 = 8$: $
  x^2y^4 + y^3 &= 8 \
  2x y^4 + 4x^2y^3 dv(y, x) + 3y^2 dv(y,x) &= 0 \
  dv(y, x)(4x^2y^3 + 3y^2) &= -2x y^4 \
  cblue(2x y^4 dd(x) + (4x^2y^3 + 3y^2) dd(y) &= 0)
$

So, if implicit differentiation takes us from an implicit solution to an exact DE, how do we go from an exact DE to an implicit solution?

Conveniently, if we represent $x$ as independent of $y$ and set the function $F(x, y)$ equal to the solution, its *total differential* is the same as the differential equation: $
  "Let" F(x, y) &= x^2 y^4 + y^3 = 8 \
  dd(F) &= underbrace(cblue(2x y^4), pdv(F,x)) cblue(dd(x) +) underbrace(cblue((4x^2 y^3 + 3y^2)), pdv(F,y)) cblue(dd(y))
$ 

#align(right)[
  #subtext[Recall: the total differential $dd(F)$ of a function $F(x, y)$ is $dd(F) = pdv(F,x)dd(x) + pdv(F,y)dd(y)$.]
]

In other words, if $F(x, y) = 0$ is a solution to the DE, then the exact DE we began with represents the total differential of $F$, $dd(F)$. We use the implied equality for $pdv(F,x)$ to find an expression for $F(x, y)$: $
  pdv(F,x) &= 2x y^4 \
  integral pdv(F,x) dd(x) &= integral 2x y^4 dd(x) \
  F &= x^2 y^4 + cred(c(y))\
$
#align(right)[
  #subtext[Any function of $y$ which we call $cred(c(y))$ will vanish when computing $pdv(F,x)$]
]

We can then use the equality for $pdv(F,y)$ to solve for $cred(c(y))$ and thus find a solution for $F(x, y)$: $
  F = x^2 y^4 + cred(c(y)) ==> pdv(F,y) = 4x^2y^3 + cred(g'(y)) = 4x^2 y^3 + cred(3y^2) \
  g'(y) = 3y^2 ==> c(y) = integral 3y^2 dd(y) = y^3 + C \
  ==> cgreen(F(x, y) = x^2 y^4 + y^3 + C).
$

We can then write the implicit solution to the differential equation as $F(x, y) = 0$: $
  cblue(2x y^4 dd(x) + (4x^2y^3 + 3y^2) dd(y)) & ==> cgreen(x^2 y^4 + y^3 + C = 0) \
  & ==> cgreen(x^2 y^4 + y^3 = C).
$

=== Is my DE exact?

Generally, we call a differential equation in the form $f(x, y)dd(x) + g(x, y)dd(y) = 0$ *exact* if there exists a function $F(x, y)$ such that $dd(F) = f(x, y)dd(x) + g(x, y)dd(y)$. 

We can check if any DE is exact without actually knowing $F$ by using the symmetry of second derivatives, which states that: $
  pdv(,y)(pdv(F,x)) = pdv(,x)(pdv(F,y)).
$
Since the total differential implies that $pdv(F,x) = f(x, y)$ and $pdv(F,y) = g(x,y)$, then we arrive at the following definition: 
#define("Exact Differential Equation")[
  The differential equation $f(x, y)dd(x) + g(x, y)dd(y)$ is *exact* if: $
    pdv(,y) f(x, y) = pdv(,x) g(x, y).
  $
]

#example($display((cos x + x cos y)dv(y,x) = y sin x - sin y)$)[
  First, rearrange into $f(x,y) dd(x) + g(x,y) dd(y) = 0$ form: $
    (cos x + x cos y) dd(y) &= (y sin x - sin y) dd(x) \
    -(y sin x - sin y) dd(x) + (cos x + x cos y) dd(y) &= 0 \
    (sin y - y sin x) dd(x) + (cos x + x cos y) dd(y) &= 0.
  $

  Next, check if our DE is an exact DE: $
    pdv(,y) (sin y - y sin x) &=^? pdv(,x) (cos x + x cos y) \
    cos y - sin x &=^? -sin x + cos y \
    cos y - sin x &=^checkmark cos y - sin x
  $

  Now that we know our DE is exact, we can assume the DE has a solution $F(x, y) = C$. 
  
  Taking the total differential of both sides: $
    dd(F) &= cred(pdv(F,x)) && dd(x) + cblue(pdv(F,y)) &&& dd(y) &&&&= 0 \
    &= cred((sin y - y sin x)) && dd(x) + cblue((cos x + x cos y)) &&& dd(y) &&&&= 0
  $

  We can then find $F$ using either $pdv(F,x)$ or $pdv(F,y)$. Let's use $pdv(F,x)$: $
    pdv(F,x) &= sin y - y sin x \
    integral pdv(F,x) dd(x) &= integral (sin y - y sin x) dd(x) \
    F &= x sin y + y cos x + c(y)
  $

  We can resolve $c(y)$ by using what we know about $pdv(F,y)$:$
    pdv(F,y) &= x cos y + cos x + && c'(y) = cos x + x cos y \
    & && c'(y) = 0 ==> c(y) = C_0
  $

  Finally, write the solution: $
    x sin y + y cos x + C_0 &= C \
    cgreen(x sin y + y cos x &= C)
  $
]

=== Inexact Differential Equations

Sometimes, a differential equation can be "almost exact", i.e. it can be made exact with an _integrating factor_ $mu$. 

For a differential equation in the form $f(x, y) dd(x) + g(x, y) dd(y) = 0$:

- *Case 1:* if we can find a $mu(x)$ such that $pdv(,y)mu(x)f(x,y) = pdv(,x)mu(x)g(x,y)$, then the differential equation $mu(x)f(x,y) dd(x) + mu(y)f(x,y)dd(y) = 0$ is exact.

  $
    pdv(,y)mu(x)f(x,y) &= pdv(,x)mu(x)g(x,y) \
    mu(x)pdv(,y)f(x,y) &= mu'(x)g(x,y) + mu(x)pdv(,x)g(x,y) \
    mu(x) (pdv(,y)f(x,y) - pdv(,x)g(x,y)) &= mu'(x) g(x,y) \
    (pdv(,y)f(x,y) - pdv(,x)g(x,y))/g(x,y) &= (mu'(x))/mu(x) \
    integral (pdv(,y)f(x,y) - pdv(,x)g(x,y))/g(x,y) dd(x) &= integral (mu'(x))/mu(x) dd(x) \
    integral (pdv(,y)f(x,y) - pdv(,x)g(x,y))/g(x,y) dd(x) &= ln abs(mu(x)) + C \
    cgreen(e^small(display(integral (pdv(,y)f(x,y) - pdv(,x)g(x,y))/g(x,y) dd(x))) &= mu(x)).
  $

- *Case 2:* if we can find a $mu(y)$ such that $pdv(,y)mu(y)f(x,y) = pdv(,x)mu(y)g(x,y)$, then the differential equation $mu(y)f(x,y) dd(x) + mu(y)f(x,y)dd(y) = 0$ is exact.

  $
    pdv(,y)mu(y)f(x,y) &= pdv(,x)mu(y)g(x,y) \
    mu'(y)f(x,y) + mu(y)pdv(,y)f(x,y) &= mu(y)pdv(,x)g(x,y) \
    & dots.v \
    cgreen(e^small(display(integral (pdv(,x)g(x,y) - pdv(,y)f(x,y))/f(x,y) dd(y))) &= mu(y)).
  $

#note[
  When computing the integrating factor, *make sure it is a function of only the correct variable*. For example, $mu(x) = 2y$ would be a contradiction: $mu$ cannot be a function of $y$.
  
  If computing both $mu(x)$ and $mu(y)$ result in a contradiction, then our differential equation cannot be solved using this integrating factor.
]


#example($(4 sin y + 6/x) dd(x) + x cos y dd(y) = 0$)[
  First, check if this DE is exact: $
    pdv(,y) (4 sin y + 6/x) &=^? pdv(,x) x cos y \
    4 cos y cred(&!=) cos y.
  $

  Since our DE is not exact, we will check if an integrating factor $mu(x)$ exists.

  Compute the integrating factor: $
    mu(x) &= e^small(display(integral (pdv(,y)(4 sin y + 6/x) - pdv(,x)x cos y)/(x cos y) dd(x))) \
    &= e^small(display(integral (4 cos y - cos y)/(x cos y) dd(x))) \
    &= e^small(display(integral 3/x dd(x))) = e^(3 ln x) = cblue(x^3).
  $

  Since $x^3$ is a function of only $x$, $mu(x)$ is a valid integrating factor.

  Multiply both sides of the DE by $x^3$ to make it exact, then solve: $
    (4x^3 sin y + 6x^2) dd(x) + x^4 cos y dd(y) = 0
  $
  $
    pdv(F,x) = 4x^3 sin y + 6x^2 ==> F &= integral (4x^3 sin y + 6x^2) dd(x) \
    &=x^4 sin y + 2x^3 + c(y)
  $
  $
    pdv(F,y) &= x^4 cos y + c'(y) = x^4 cos y \
      &==> c'(y) = 0 ==> c(y) = C \
      &==> F = x^4 sin y + 2x^3 + C \
  $
  $
    cgreen(x^4 sin y + 2x^3 = C).
  $
]

== Homogeneous First-Order ODEs

#define("Homogeneous Function")[
  A function $f(x_1, x_2, ..., x_n)$ is *homogeneous* of order $k$ (where $k in ZZ$) if for any $t$, $
    f(t x_1, t x_2, ..., t x_n) = t^k f(x_1, x_2, ..., x_n).
  $
  #rsubtext[
    For example, $f(x, y) = y^2 + x y$ is a homogeneous function of the second order because\ $f(t x, t y) = (t y) ^2 + (t x)(t y) = t^2 y^2 + t^2 x y = t^2(y^2 + x y) = t^2 f(x, y)$. 
  ]
]

A first-order differential equation is *homogeneous* if it can be written in the form: $
  f(x, y) dd(x) = g(x, y) dd(y)
$
#align(right)[
  where $f$ and $g$ are homogeneous functions of the same order.
]

#rsubtext[
  This is different than the definition of "homogeneous" for linear first-order ODEs.
]

Conveniently, as we will see, all homogeneous first-order DEs can be solved using a simple substitution.
If we rearrange the differential equation, we get: $
  dv(y, x) = f(x,y)/g(x,y).
$

We can use the fact that $f$ and $g$ are homogeneous of the same order to see that: $
  f(t x,t y)/g(t x,t y) = (cancel(t^k) f(x, y))/(cancel(t^k) g(x, y)). 
$

Thus, if we let $t = 1/x$, we see that $f(x, y)/g(x, y)$ can be represented in terms of $y/x$: $
  dv(y,x) = f(x,y) / g(x,y) = f(1, y/x)/g(1, y/x) = h(y/x)
$

In fact, an easier way to check if a differential equation in the form $dv(y, x) = ...$ is homogeneous is to check if the RHS can be written in as a function of $y/x$. In other words, all differential equations of the form $dv(y,x) = h(y/x)$ are homogeneous.

Next, we can use the substitution $u = y/x$ to help us simplify the differential equation: $
  cblue(dv(y, x)) = h(cred(y/x)) = h(cred(u)) \
$ 

We can write $dv(y, x)$ in terms of $u$ and $dv(u, x)$ using the product rule: $
  u = y/x ==> y = u x \
  therefore cblue(dv(y, x)) = dv(u, x) x + u dv(x, x) = cblue(dv(u, x) x + u)
$

This way, our differential equation becomes separable: $
  cblue(dv(u, x) x + u) &= h(cred(u)) \
  dv(u,x)x &= h(u) - u \
  cgreen(dd(u)/(h(u) - u) &= dd(x)/x)
$

We can then solve for $u$ via integration and then back-substitute $u = y/x$.

#example($display(dv(y,x) = (y^3 + x^2y)/(x y^2 + x^3))$)[
  \
  First, realize that the DE is indeed homogeneous because we can rearrange it into: $
  (y^3 + x^2y) dd(x) = (x y^2 + x^3) dd(y),
  $
  and both $y^3 + x^2 y$ and $x y^2 + x^3$ are homogeneous of order $3$. 

  Make the substitution $u = y/x ==> y = u x ==> dv(y,x) = dv(u,x)x + u$: $
    dv(u,x)x + u &= (u^3 x^3 + x^3 u)/(x^3 u^2 + x^3) \
    &= (cancel(x^3) (u^3 + u))/(cancel(x^3) (u^2 + 1))
  $

  Conveniently, $(u^3 + u)/(u^2 + 1) = u$, so our DE becomes extremely simple: $
    dv(u,x) x + cancel(u) &= cancel(u) \
    dv(u,x) x &= 0
  $
  Assuming $x != 0$, then $dv(u, x)$ must be $0$ and thus $u$ must a constant: $
    dv(u, x) = 0 ==> u = C
  $

  Back-substitute $u = y/x$: $
    y/x = C ==> cgreen(y = C x).
  $
]

== Bernoulli Differential Equations

A *Bernoulli* differential equation is _almost_ a first-order linear DE, as it is in the form: $
  dv(y,x) + P(x) y = Q(x) y^n.
$

Since we have $y^n$, our differential equation is no longer linear and cannot be immediately solved using an integrating factor.

We can divide both sides by $y^n$ to eliminate $y$ from the RHS: $
  y^(-n)dv(y,x) + P(x)y^(1-n) = Q(x)
$

If we make the substitution $cblue(u = y^(1-n)) ==> dv(u,x) = (1-n)y^(-n) dv(y,x) ==> cblue(dv(y,x) = y^n/(1-n)dv(u,x))$, we can eliminate $y$ from the equation entirely: $
  y^(-n) cblue(y^n/(1-n) dv(u,x)) + P(x) cblue(u) &= Q(x) \
$

In fact, we can rearrange to see that our substitution has transformed our DE into a regular linear first-order DE which we can solve using an integrating factor: $
  1/(1-n) dv(u,x) + P(x) u &= Q(x) \
  dv(u,x) + (1-n)P(x) u &= (1-n) Q(x).
$

Given the integrating factor $mu(x)= e^(integral (1-n)P(x) dd(x))$, we get an implicit solution: $
  u = cgreen(y^(1-n) = (1-n)/mu(x) integral mu(x) Q(x) dd(x)). \
$

== Numerical Methods

=== Euler's Method 

=== Newton's Method

= Higher-Order Differential Equations

== Introduction to Second-Order Differential Equations

=== Second-Order Initial Value Problems

- A *second-order IVP* is an initial value problem involving a second-order differential equation.

- These require at least two initial conditions (or two boundary counditions): \
  $y(x_0)= alpha, y'(x_0) = beta$.
  
=== Existence and Uniqueness for Higher-Order Linear ODEs

Recall that an $n$th-order linear ODE can be written in the form: $
  a_n
  (x) y^((n)) + a_(n - 1)(x) y^(n - 1) + ... + a_2 (x) y'' + a_1 (x) y' + a_0 (x) y = f(x).
$

Let us subject it to the initial conditions $y(x_0) = y_0, y'(x_0) = y'_0, ..., y^((n)) = y^((n))_0$.

The *existence and uniqueness theorem for an $n$th-order linear ODEs* requires that:
- #underline[all] _coefficient functions_ $a_i (x)$ #underline[and] $f(x)$ are continuous on a finite open interval $I$ containing $x_0$ 
- the _#underline[leading] coefficient function_ $a_n (x)$ is never $0$ on that interval $I$

If both conditions are met, then the theorem guarantees that there must exist a solution $y(x)$ which satisfies the IVP on the open interval $I$.

#define("Existence and Uniqueness Theorem for Higher-Order ODEs")[
  Consider an $n$th-order linear ODE in the form: $
    a_n
    (x) y^((n)) + a_(n - 1)(x) y^(n - 1) + ... + a_2 (x) y'' + a_1 (x) y' + a_0 (x) y = f(x).
  $
  Let this ODE be subject to the initial conditions $y(x_0) = c_0, y'(x_0) = c_1, ..., y^((n))(x_0) = c_n$, where $x_0$ and ${c_i}$ are constants.

  Then if #underline[all] $a_i (x)$ are continuous on a finite open interval $I$ where $x_0 in I$, and the leading coefficient function $a_n (x) != 0$ for all $x in I$, then the *existence and uniqueness theorem* asserts that there _must_ exist a solution $y(x)$ which satisfies the IVP, and this solution is the _only_ solution.
]

=== Second-Order Linear ODEs

A *second-order linear ODE* is one which can be written in the form: $
  a(x) y'' + b(x) y' + c(x) y = f(x).
$

If $f(x) = 0$, the ODE is also *homogeneous* (i.e. we can write it as $a(x)y'' + b(x) y' + c(x) y = 0$).

=== Principle of Superposition

#define("Principle of Superposition for Homogeneous DEs")[
  If $y_1$ and $y_2$ are both solutions to the same *linear and homogeneous* differential equation, then $C_1 y_1 + C_2 y_2$ must also be a solution to the differential equation $forall C_1, C_2 in RR$.
]

=== Fundamental Sets of Solutions

- A *fundamental solution set* of a DE is the #underline[smallest] set of solutions where the most general solution is a linear combination of all solutions in the set.

  In other words, it is the smallest set of solutions where after applying the principle of superposition, we achieve the _most general_ solution to the DE.

- A *linear and homogeneous* $n$th-order ODE will have a fundamental solution set with *exactly* $n$ solutions.

#define("Fundamental Solution Sets")[
  Let $Y = {y_i}$ be a set of solutions which satisfy a differential equation. $Y$ is a *fundamental solution set* if: 
  1. $exists.not y_i, y_j in Y "s.t." y_i = c y_j$ where $c$ is a constant
  2. $sum_i c_i y_i$ is the most general solution to the differential equation, where ${c_i}$ is an arbitrary sequence of constant coefficients
]

#define("The Wronskian")[
  $
    W(y_1, y_2) = mat(
      delim: "|",
      y_1, y_2;
      y_1 ', y_2 '
    )
  $
]

#define("Validating Solution Sets")[
  Let $Y = {y_i}$ be a set of solutions which satisfy a differential equation. \ 
  If $W(y_1, y_2, ..., y_n) != 0$, then $Y$ is a *fundamental solution set* to the differential equation.
]


== Homogeneous Second-Order ODEs with Constant Coefficients

- If $r = lambda_1, lambda_2$, then $y = C_1 e^(lambda_1 t) + C_2 e^(lambda_2 t)$
- If $r = lambda$, then $y = C_1 e^(lambda t) + C_2 lambda e^(lambda t)$
- If $r = alpha + beta i$, then $y = e^(alpha t) (C_1 cos(beta t) + C_2 sin(beta t))$

== Nonhomogeneous Second-Order ODEs: Undetermined Coefficients

== Nonhomoeneous Second-Order ODEs: Variation of Parameters

#pagebreak()

== Nonconstant Coefficients: Reduction of Order

A second order linear homogeneous ODE with nonconstant coefficients is in the form: $
  y'' + P(x) y' + Q(x) y = 0.
$

If we have a second-order linear homogeneous ODE _in standard form_ with a known solution $y_1(x)$ and the coefficient $P(x)$, we can find a second solution $y_2(x)$ using the method of *reduction of order*. This is the analog of the integrating factor for second-order ODEs.

We assume a solution of the form: $
  y_2(x) = v(x) y_1(x)
$

Thus the derivatives of $y_2$ are:
$
  y_2 '(x) &= v'(x) y_1(x) + v(x) y_1 '(x) \
  y_2 ''(x) &= v''(x) y_1(x) + 2 v'(x) y_1 '(x) + v(x) y_1 ''(x).
$

== Euler Differential Equations

== Power Series Solutions

= Modeling Differential Equations

== First-Order Linear Models

=== Population Dynamics

=== Radioactive Decay

=== Salt Mixing Problems

== Second-Order Linear Models

=== Spring-Mass Systems

=== Electrical Circuits

== Nonlinear Models

=== Predator-Prey Models

=== Chemical Reactions

= Laplace Transforms

#define("Laplace Transform")[
  Let $f(t)$ be function in the time domain $t$. Then the Laplace transform of $f(t)$ is: $
    cal(L){f(t)} = F(s) = integral_0^oo e^(-s t) f(t) dd(t).
  $
]



= Systems of Differential Equations

== Matrix Methods for Systems of DEs

=== Writing Systems of DEs in Matrix Form

== Numerical Methods

= Fourier Series

== Deriving the Fourier Series

=== Periodic & Orthogonal Functions

#define("Periodic Function")[
  A function $f(x)$ is *periodic* with period $T$ if $f(x + T) = f(x)$ for all $x$.

  #align(right)[
    #subtext[
      _ex:_ $sin(omega x)$ and $cos(omega x)$ are periodic with period $T = (2 pi) / omega.$
    ]
  ]
]

#define("Orthogonal Functions")[
  If the functions $f(x)$ and $g(x)$ are non-zero, they are *orthogonal* for $a <= x <= b$ if: $
    integral_a^b f(x) g(x) dd(x) = 0.
  $
]

#define("Fourier Transform")[
  $
    cal(F){f(t)} = hat(f)(xi) = integral_0^oo e^(-2pi i xi t) f(t) dd(t)
  $
]