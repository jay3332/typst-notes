#import "/helpers/template.typ": *
#show: set_unit_number.with(2)

= Vector Valued Functions

== Vector Functions

- We've looked at functions which took $n$ inputs and output one value, called scalar functions of $n$ variables. We
  also said that these functions satisfy the mapping $RR^n mapsto RR$.

- *Vector functions* (or vector-valued functions) are functions which take a certain amount of variables and output
  _many_ values. These values are represented as vectors.

  We say that a vector function $arrow(r)$ of $m$ variables which outputs $n$ values satisfies the mapping
  $RR^m mapsto RR^n$. We will only be dealing with vector functions of one variable: $arrow(r): RR mapsto RR^n$.

- The components of a vector function $arrow(r)$ are known as the *component functions* of $arrow(r)$. For example, $f$,
  $g$, and $h$ are the component functions of $arrow(r)$ if $arrow(r)(t) = ang(f(t), g(t), h(t))$.

#define("Domain of a Vector Function")[
  The domain $D$ of a vector function $arrow(r)(t) = ang(f_1 (t), f_2 (t), ..., f_n (t))$ is the *intersection* of the
  domains of $f_1, f_2, ..., f_n$ in $t$:
  $
    D = "Dom"(arrow(r)(t)) = inter.big_(k=1)^n "Dom"(f_k (t)).
  $
]

#define("Limit of a Vector Function")[
  The limit of a vector function of one variable $arrow(r)(t) = ang(f_1(t), f_2(t), ..., f_n(t))$ is the vector
  containing the limits of each component function of $arrow(r)$:
  $
    lim_(t -> c) arrow(r)(t) = ang(lim_(t -> c) f_1(t), lim_(t -> c) f_2(t), ..., lim_(t -> c) f_n (t)).
  $
]

=== Space Curves

Vector functions of one variable trace out *space curves* in $3$-space. If all component functions of a vector function
$arrow(r)(t) = ang(f(t), g(t), h(t))$ are continuous on some interval $I$, then we can define a *space curve* $C$ as the
set of points represented by the position vectors $forall t in I$.

The space curve $C$ will have parametric equations: $x = f(t), y = g(t), z = h(t)$, and this can be shown by simply
assuming $arrow(r)(t)$ represents the position vector of a point on $C$ at any time $t$:
$
  arrow(r)(t) = ang(x, y, z) = ang(f(t), g(t), h(t)).
$

=== Intersections of Planes

- *The intersection of two surfaces is a space curve.* We know that two planes in $3$-space can have a _line of
    intersection_. In a similar vein, any two surfaces in $3$-space can have a *curve of intersection*, which is a space
  curve.

#pagebreak()

== Calculus with Vector Functions

=== Derivatives of Vector Functions

The derivative $arrow(r')(t)$ of a vector function $arrow(r)(t)$ is defined the same way as for normal functions:
$
  dv(arrow(r), t) = arrow(r')(t) = lim_(h -> 0) (arrow(r)(t + h) - arrow(r)(t))/h.
$

#derivation("Derivation: Derivative of a Vector Function by Components")[
  Using basic laws of vectors and limits, we can also see that the derivative of a vector function is just a vector of
  the derivatives of each component function. If $arrow(r)(t) = ang(f_1(t), f_2(t), ..., f_n (t))$, then:
  $
    arrow(r')(t) & = lim_(h -> 0) (ang(f_1(t+h), f_2(t+h), ..., f_n (t+h)) - ang(f_1(t), f_2(t), ..., f_n (t))) / h \
                 & = lim_(h -> 0) ang(f_1(t+h) - f_1(t), f_2(t+h) - f_2(t), ..., f_n (t+h) - f_n (t)) / h \
                 & = lim_(h -> 0) ang(
                     (f_1 (t + h) - f_1 (t)) / h,
                     (f_2 (t + h) - f_2 (t)) / h, ...,
                     (f_n (t + h) - f_n (t)) / h
                   ) \
                 & = ang(
                     lim_(h -> 0) (f_1 (t + h) - f_1 (t)) / h,
                     lim_(h -> 0) (f_2 (t + h) - f_2 (t)) / h, ...,
                     lim_(h -> 0) (f_n (t + h) - f_n (t)) / h
                   ) \
                 & = cgreen(ang(f_1 '(t), f_2 '(t), ... f_n '(t))).
  $
]


#define("Derivative of a Vector Function")[
  Let the vector function $arrow(r)(t) = ang(f_1(t), f_2(t), ..., f_n (t))$ have differentiable components. Then the
  derivative of $arrow(r)$, $arrow(r')$ is a vector of the derivatives of each component:
  $
    dv(, t)arrow(r)(t) = arrow(r')(t) = ang(f_1 '(t), f_2 '(t), ..., f_n '(t)).
  $
  Similarly, the $k$th derivative of $arrow(r)$ is:
  $
    ndv(, t, k) arrow(r)(t) = arrow(r)^((k))(t) = ang(f_1^((k))(t), f_2^((k))(t), ..., f_n^((k))(t))
  $
]

Remember that in $3$-space, if the component functions of $arrow(r)(t)$ are continuous over an interval $I$, there
exists a *space curve* $C$ represented by $arrow(r)(t)$. For any given value of $t in I$, $arrow(r')(t)$ represents a
vector tangent to $C$ at the position represented by $arrow(r)(t)$. This vector is called the *tangent vector*.

Similarly, the *unit tangent vector* is often used to evaluate which direction the curve is moving in at any given
$t in I$, but not necessarily at what magnitude. This vector is represented:
$
  "Unit Tangent Vector" = arrow(T)(t) = (arrow(r')(t))/abs(arrow(r')(t)).
$

=== Differentiation Rules for Vector Functions

If $arrow(u)(t)$ and $arrow(v)(t)$ are differentiable vector functions, then:

- Linearity Rule: $dv(, t) (a arrow(u)(t) + b arrow(v)(t)) = a arrow(u')(t) + b arrow(v')(t)$ where $a$ and $b$ are
  constants.

- Scalar Product Rule: $dv(, t) f(t) arrow(u)(t) = f'(t) arrow(u)(t) + f(t) arrow(u')(t)$ where $f(t)$ is a scalar
  function.

- Dot Product Rule:
  $dv(, t) (arrow(u)(t) dot arrow(v)(t)) = arrow(u')(t) dot arrow(v)(t) + arrow(u)(t) dot arrow(v')(t)$.

- Cross Product Rule:
  $dv(, t) (arrow(u)(t) times arrow(v)(t)) = arrow(u')(t) times arrow(v)(t) + arrow(u)(t) times arrow(v')(t)$.

- Chain Rule: $dv(, t) arrow(u)(f(t)) = arrow(u')(f(t)) f'(t)$ where $f(t)$ is a scalar function.

=== Integrals of Vector Functions

#define("Definite Integral of a Vector Function")[
  The definite integral from $t=a$ to $t=b$ of a vector function $arrow(r)(t) = ang(f_1 (t), f_2 (t), ..., f_n (t))$ is
  the vector consisting of the definite integrals from $t=a$ to $t=b$ over each of its components:
  $
    integral_a^b arrow(r)(t) dd(t) = ang(integral_a^b f_1 (t) dd(t), integral_a^b f_2 (t) dd(t), ..., integral_a^b f_n (t) dd(t)).
  $
]

#define("Antiderivative of a Vector Function")[
  The antiderivative $arrow(R)(t)$ of a vector function $arrow(r)(t) = ang(f_1 (t), f_2 (t), ..., f_n (t))$ is one where
  $arrow(R)'(t) = arrow(r)(t)$. It is the vector consisting of the antiderivatives of component functions, but it can
  vary by a constant _vector_ $arrow(C)$ (since each component can vary independently):
  $
    arrow(R)(t) = integral arrow(r)(t) dd(t) = ang(integral f_1 (t) dd(t), integral f_2 (t) dd(t), ..., integral f_n (t) dd(t)) + arrow(C).
  $
]

#pagebreak()

== Arc Length and Curvature

=== Arc Length

#derivation("Derivation: Arc Length of a Space Curve")[
  Let's derive the arc length $s$ of a space curve $C$ in $RR^3$ defined by $arrow(r)(t) = ang(x(t), y(t), z(t))$ from
  $t=a$ to $t=b$.

  We know that an infinitesimally small movement along the curve $C$, $dd(arrow(r))$, is represented by their respective
  movements in the $x$, $y$, and $z$-axes:
  $
    dd(arrow(r)) = ang(dd(x), dd(y), dd(z)).
  $

  The magnitude of each small movement $dd(arrow(r))$ results in a small contribution to arc length:
  $
    dd(s) = abs(dd(arrow(r))) & = sqrt(dd(x)^2 + dd(y)^2 + dd(z)^2) \
                              & = sqrt((dv(x, t) dd(t))^2 + (dv(y, t) dd(t))^2 + (dv(z, t) dd(t))^2) \
                              & = sqrt((dv(x, t))^2 + (dv(y, t))^2 + (dv(z, t))^2) dd(t)
  $

  We can finally add up all small changes in arc length from $t = a$ to $t = b$ using an integral:
  $
    cgreen(s = integral_a^b dd(s) = integral_a^b abs(arrow(r')(t)) dd(t) = integral_a^b sqrt((dv(x, t))^2 + (dv(y, t))^2 + (dv(z, t))^2) dd(t)).
  $
]

#define("Arc Length of a Space Curve")[
  Let the space curve $C$ be defined by the vector function $arrow(r)(t) = ang(x(t), y(t), z(t))$. Then the *arc length*
  $s$ of $C$ from $t=a$ to $t=b$ is:
  $
    "Arc Length" = s = integral_a^b abs(arrow(r')(t)) dd(t) = integral_a^b sqrt((dv(x, t))^2 + (dv(y, t))^2 + (dv(z, t))^2) dd(t).
  $
]

=== Parameterizations

- We know that a space curve $C$ can be defined by a vector-valued function represented by a set of parametric
  equations, but there exists an infinite set of parametric equations for $C$ called the *parameterizations* of $C$.

  For example, let the curve $C$ be defined using the vector function $arrow(r)(t) = ang(t, t^2, sin t)$. We can apply
  the transformation $t = e^u$ to get a new curve $D$, $arrow(r)(u) = ang(e^u, e^(2u), sin(e^u))$. Since there exists a
  bijection from $t$ to $e^u$, all points on $C$ are also points on $D$, and vice-versa, so $C eq.triple D$.

- We can often make the definition of a curve independent of parameterization by defining it in terms of "how far we are
  along the curve", i.e. arc length:

  #define("Arc Length Function of a Curve")[
    If the curve $C$ is defined using the vector function $arrow(r)(t) = ang(x(t), y(t), z(t))$, its *arc length
      function* $arrow(R)(s)$ is parameterization of $arrow(r)$ using $s$, where $s(t)$ is the arc length from some
    starting point $t=a$ to $t$:
    $
      s(t) = integral_a^t abs(arrow(r')(tau)) dd(tau)
      = integral_a^t
      sqrt((dv(x, tau))^2 + (dv(y, tau))^2 + (dv(z, tau))^2)
      dd(tau).
    $
    It holds that $dv(s, t) = abs(arrow(r')(t))$ by the fundamental theorem of calculus. We can use this differential
    equation to determine a transformation from $t -> s$.
  ]

#example("Reparameterization using Arc Length")[
  The curve $C$ is defined by $arrow(r)(t) = ang(3t, 5-4t, 6+2t)$. \ Write an _arc length function_ $arrow(q)(s)$ for
  $C$.
  #lorange
  First, we know that $arrow(r')(t) = ang(3, -4, 2)$ and thus $abs(arrow(r')(t)) = sqrt(29).$

  We can find the arc length $s$ as a function of $t$, choosing $s=0$ at $t=0$:
  $
    s(t) = integral_0^t abs(arrow(r')(tau)) dd(tau) = integral_0^t sqrt(29) dd(tau) = sqrt(29) t \
    ==> cblue(t = s/sqrt(29)).
  $

  After solving for $t$ in terms of $s$, we perform the substitution, and the parameterization is:
  $
    cgreen(arrow(q)(s) = ang(3/sqrt(29) s, 5 - 4/sqrt(29) s, 6 + 2/sqrt(29) s)).
  $
]

=== Curvature

*Curvature* is a measure of how quickly a space curve changes direction at any given point. The measure is not concerned
about the magnitude of change; only direction.

Recall that the direction of the tangent vector can be represented using the *unit tangent vector*,
$arrow(T)(t) = (arrow(r')(t))/abs(arrow(r')(t))$. Then the curvature $kappa$ is how quickly this vector changes with
respect to where we are on the curve, $kappa = abs(dv(arrow(T), s))$.

Different parameterizations of $t$ can produce the same curve (for example $ang(t, 2t, 3t)$ and $ang(2t, 4t, 6t)$), but
the progression along the curve may be slower or faster if $t$ increases at given rate. Thus, we use the _arc length_ as
a measure of how far we are on the curve.

#define("Curvature of a Space Curve")[
  Let the space curve $C$ be defined by the vector function $arrow(r)(t)$. If an arc length parameterization
  $arrow(T)(s)$ of the unit tangent vector exists, then the *curvature* $kappa$ of $C$ is:
  $
    "Curvature" = kappa = abs(dv(arrow(T), s)) .
  $

  If $arrow(T)(t)$ is the unit vector tangent to $arrow(r)(t)$ at $t$, then the curvature $kappa$ of $C$ at $t$ is:
  $
    kappa(t) = abs(arrow(T)'(t))/abs(arrow(r')(t))
    = abs(arrow(r')(t) times arrow(r'')(t))/abs(arrow(r')(t))^3.
  $

  ==== Special Case: Curvature of 2D Curve
  If $C$ completely lies on a plane and can be defined by $y = f(x)$, then we can parameterize this into a vector valued
  function $arrow(r)(x) = ang(x, f(x), 0)$.

  Then $arrow(r')(x) = ang(1, f'(x), 0)$, $arrow(r'')(x) = ang(0, f''(x), 0)$, and
  $arrow(r')(x) times arrow(r'')(x) = ang(0, 0, f''(x))$:
  $
    kappa(x) = abs(f''(x)) / (1 + (f'(x))^2)^(3 slash 2).
  $
]

#example("Computing the Curvature of a Space Curve")[
  Find the curvature of the space curve defined by $arrow(r)(t) = t hat(i) + t^2 hat(j) + t^3 hat(k)$ as a function of
  $t$.
  #lorange
  Since we are only given $arrow(r)$, it would be most convenient to use the formula in terms of only $arrow(r)$ and its
  derivatives.

  Compute the derivatives of $arrow(r)$:
  $
      arrow(r)(t) & = ang(t, t^2, t^3) \
     arrow(r')(t) & = ang(1, 2t, 3t^2) \
    arrow(r'')(t) & = ang(0, 2, 6t).
  $

  Compute $abs(arrow(r') times arrow(r''))$:
  $
    abs(arrow(r') times arrow(r'')) & = abs(mat(delim: "|", hat(i), hat(j), hat(k); 1, 2t, 3t^2; 0, 2, 6t)) \
                                    & = abs(ang(6t^2, -6t, 2)) \
                                    & = sqrt(36t^4 + 36t^2 + 4) \
                                    & = 2sqrt(9t^4 + 9t^2 + 1).
  $
  Compute $abs(r')^3$:
  $
    abs(r')^3 & = abs(ang(1, 2t, 3t^2))^3 \
              & = abs(sqrt(1 + 4t^2 + 9t^4))^3 \
              & = (1 + 4t^2 + 9t^4)^(3 slash 2).
  $

  The quotient is the curvature:
  $
    cgreen(
      kappa =
      abs(arrow(r') times arrow(r'')) / abs(arrow(r'))^3
      = (2sqrt(9t^4 + 9t^2 + 1)) / (1 + 4t^2 + 9t^4)^(3 slash 2).
    )
  $
]

#derivation([Derivation: Curvature as functions of $t$])[
  By the chain rule:
  $
    cgreen(kappa = abs(dv(arrow(T), s)) = abs(inlinedv(arrow(T), t)/inlinedv(s, t)) = abs(arrow(T)'(t))/abs(arrow(r')(t))).
  $

  By the quotient rule:
  $
    arrow(T)'(t) = (arrow(r'')(t) abs(arrow(r')(t)) - arrow(r')(t)dv(, t)abs(arrow(r')(t))) / abs(arrow(r')(t))^2.
  $

  Recall that $dv(|x|, x) = x/abs(x)$. The same can be applied to vector magnitudes:
  $
    arrow(T)'(t) &= (arrow(r'')(t) abs(arrow(r')(t)) - arrow(r')(t) cblue((arrow(r')(t))/abs(arrow(r')(t)) dot arrow(r'')(t))) / abs(arrow(r')(t))^2 \
    &= (arrow(r'')(t) abs(arrow(r')(t))^2 - arrow(r')(t) cblue((arrow(r')(t) dot arrow(r'')(t)))) / abs(arrow(r')(t))^3 \
  $

  Recall the a property of _vector triple products_,
  $arrow(a) times (arrow(b) times arrow(c)) = (arrow(a) dot arrow(c)) arrow(b) - (arrow(a) dot arrow(b)) arrow(c)$. \
  Since $abs(arrow(r')(t))^2 = arrow(r')(t) dot arrow(r')(t)$:
  $
    arrow(r'')(t) abs(arrow(r')(t))^2 - arrow(r')(t) (arrow(r')(t) dot arrow(r'')(t))
    &= (arrow(r')(t) dot arrow(r')(t)) arrow(r'')(t) - (arrow(r')(t) dot arrow(r'')(t)) arrow(r')(t) \
    &= cblue(arrow(r')(t) times (arrow(r'')(t) times arrow(r')(t))).
  $
  Since $arrow(r'')(t) times arrow(r')(t)$ is orthogonal to $arrow(r')(t)$, the following holds:
  $
    abs(arrow(r')(t) times (arrow(r'')(t) times arrow(r')(t))) &= abs(arrow(r')(t)) abs(arrow(r'')(t) times arrow(r')(t)) \
    &= cblue(abs(arrow(r')(t)) abs(arrow(r')(t) times arrow(r'')(t))).
  $

  Finally,
  $
    abs(arrow(T)'(t)) &= cblue(abs(arrow(r')(t)) abs(arrow(r')(t) times arrow(r'')(t)))/abs(arrow(r')(t))^3 = ( abs(arrow(r')(t) times arrow(r'')(t)))/abs(arrow(r')(t))^2. \
    kappa(t) &= abs(arrow(T)'(t))/abs(arrow(r')(t)) = (
    abs(arrow(r')(t) times arrow(r'')(t))
    )/abs(arrow(r')(t))^2
    1/abs(arrow(r')(t)) = cgreen(abs(arrow(r')(t) times arrow(r'')(t))/abs(arrow(r')(t))^3).
  $
]

=== Normal Vectors and Planes

- We know that $arrow(T)$, the unit tangent vector, will always have a magnitude of 1. Thus, $abs(arrow(T))$ is always
  equal to $1$. Since $abs(arrow(T))$ is constant, then $abs(arrow(T)') = 0$ and
  $arrow(T) dot arrow(T)' = abs(arrow(T)) cred(abs(arrow(T)')) cos theta = 0$. Thus, $arrow(T)$ is always orthogonal to
  its derivative $arrow(T)'$.

  The unit vector of $arrow(T)'$ is known as the *principal unit normal vector*,
  $arrow(N)(t) = (arrow(T)'(t))/abs(arrow(T)'(t))$.

#derivation([Proof: A vector function $arrow(r)$ is orthogonal to $arrow(r')$ if $arrow(r)$ has a constant length])[
  If the statement above can be proved true, the we can be certain that because the unit tangent vector $arrow(T)$ has a
  constant length $1$, it must be orthogonal to $arrow(T)'$, and since $arrow(N)$ is parallel to $arrow(T)'$, $arrow(N)$
  is orthogonal to $arrow(T)$ and thus $arrow(r')$.

  #lgreen

  Let $arrow(r)(t)$ be a vector function in $n$-space with components
  $arrow(r)(t) = ang(f_1 (t), f_2 (t), ..., f_n (t))$. Then the tangent vector function is
  $arrow(r')(t) = ang(f_1 '(t), f_2 '(t), ... f_n '(t))$.

  If $arrow(r)(t)$ has a constant magnitude, then $f_1^2 (t) + f_2^2 (t) + ... + f_n^2 (t) = c$, where $c$ is a
  constant.

  By implicit differentiation:
  $
                           f_1^2 (t) + f_2^2 (t) + ... + f_n^2 (t) & = c \
    2f_1(t) f_1 '(t) + 2f_2 (t) f_2 '(t) + ... + 2f_n (t) f_n '(t) & = 0 \
       f_1(t) f_1 '(t) + f_2 (t) f_2 '(t) + ... + f_n (t) f_n '(t) & = 0 \
                                      arrow(r)(t) dot arrow(r')(t) & = 0. space space qed
  $

  This is exactly the dot product of $arrow(r)(t)$ and $arrow(r')(t)$. The dot product of two orthogonal vectors is $0$,
  so $arrow(r)$ must be orthogonal to $arrow(r')$ at all times if $arrow(r)$ has a constant magnitude.
]


- The *binormal vector* $arrow(B)$ is the unit vector orthogonal to both $arrow(T)$ and $arrow(N)$ at the same time, so
  it can be represented by $arrow(B)(t) = arrow(T)(t) times arrow(N)(t)$. Since both $arrow(T)$ and $arrow(N)$ are unit
  vectors, $arrow(B)$ is also a unit vector.

#define("The TNB Frame")[
  A *normal unit vector* $arrow(n)$ to a space curve $arrow(r)(t)$ at $t$ is orthogonal to
  $arrow(T)(t) = (arrow(r')(t))/abs(arrow(r')(t))$, the unit tangent vector at $t$. We typically deal with two normal
  unit vectors: the *principal normal unit vector* or *unit normal* $arrow(N)(t)$ and the *binormal vector*
  $arrow(B)(t)$, where:
  $
    arrow(N)(t) & = (arrow(T)'(t))/abs(arrow(T)'(t)) #h(72pt)
                  arrow(B)(t) & = arrow(T)(t) times arrow(N)(t).
  $

  The *TNB frame* is the set of unit vectors $arrow(T)$, $arrow(N)$, and $arrow(B)$ which define how a curve is behaving
  at a point, which are all components of the derivatives of $arrow(r)$, where:
  - $arrow(T)$ represents how the particle is _moving_, quantified using _speed_ $v = abs(dv(arrow(r), t))$
  - $arrow(N)$ represents how the particle is _turning_, quantified using _curvature_, $kappa = abs(dv(arrow(T), s))$
  - $arrow(B)$ represents how the particle is _twisting_, quantified using _torsion_,
    $tau = -dv(arrow(B), s) dot arrow(N)$.
]

- The plane $P$ which contains both $arrow(N)$ and $arrow(B)$ is called the *normal plane* because it is normal to the
  tangent vector $arrow(T)$, meaning the vector normal to $P$ is parallel to $arrow(T)$.

- The *rectifying plane* $R$ is the plane which contains both $arrow(T)$ and $arrow(B)$, lying normal to $arrow(N)$.

- The *osculating plane* $O$ is the plane that contains both $arrow(T)$ and $arrow(N)$, and is the plane which lies
  close to the curve near the point of tangency. The osculating plane is normal to $arrow(B)$.

- If we know the tangent and normal vectors to a space curve $C$ at a point $P$, we can determine the *circle of
    curvature* or *osculating circle* at $P$, which approximates the behavior $C$ using a circle (as opposed to a
  tangent line). They can useful as circles of curvature consider the curvature $kappa$ in the approximation:

  #define("Circle of Curvature")[
    #grid(
      columns: (3fr, 1fr),
      inset: (right: 6pt),
      [
        Let the space curve $C$ have curvature $kappa$ at a point $P$. Then the *circle of curvature* or *osculating
          circle* at $P$ is the circle which (1) lies on the osculating plane of $C$, (2) contains the point $P$, (3)
        has radius $R = 1/kappa$, and (4) has a center $Q$ a distance $1/kappa$ from $P$ along the principal normal
        vector $arrow(N)$:
      ],
      image("assets/circle_of_curvature.png"),
    )
    $
      arrow(Q) = arrow(P) plus arrow(N)/kappa #h(64pt) R = 1/kappa
    $

    $R$ is the known as the *radius of curvature*.
  ]

=== Extension: Torsion

_Torsion_ is a quantity $tau$ which measures how fast the osculating plane rotates as we move along the curve (i.e. with
respect to arc length $s$). Since the osculating plane is described using its normal vector $arrow(B)$, we can suppose
that $tau$ should be expressed in terms of $dv(arrow(B), s)$.

#define("Torsion of a Space Curve")[
  Let a space curve $arrow(r)$ have the TNB unit vectors $arrow(T), arrow(N), arrow(B)$ at some point $P$ on the curve.
  Then the *torsion $tau$* at $P$ is:
  $
    "Torsion" = tau = - dv(arrow(B), s) dot arrow(N).
  $
  ===== With Respect to Time
  The torsion can also be found using the following formula:
  $
    tau(t) = det(arrow(r'), arrow(r''), arrow(r'''))/(abs(arrow(r') times arrow(r''))^2).
  $
]

#example("Torsion of a Circular Helix")[
  Find the torsion of the circular helix $arrow(r)(t) = ang(a cos t, a sin t, b t)$ as a function of $t$, where $a$ and
  $b$ are constants.
  #lorange

  First, find relevant derivatives:
  $
      arrow(r') & = ang(-a sin t, a cos t, b) \
     arrow(r'') & = ang(-a cos t, -a sin t, 0) \
    arrow(r''') & = ang(a sin t, -a cos t, 0).
  $

  Then, $det(arrow(r'), arrow(r''), arrow(r'''))$ is the same as:
  $
    mat(
      delim: "|", align: #{ right },
      -a sin t, a cos t, b;
      -a cos t, -a sin t, 0;
      a sin t, -a cos t, 0
    ) = cblue(a^2 b).
  $

  Find: $abs(arrow(r') times arrow(r''))^2$:
  $
    abs(arrow(r') times arrow(r''))^2 = abs(
      mat(
        delim: "|",
        hat(i), hat(j), hat(k);
        -a sin t, a cos t, b;
        -a cos t, -a sin t, 0;
      )
    )^2 & = abs(ang(a b sin t, a b cos t, a^2 sin^2 t + a^2 cos^2 t))^2 \
        & = abs(ang(a b sin t, a b cos t, a^2))^2 \
        & = a^2 b^2 sin^2 t + a^2 b^2 cos^2 t + a^2
          = cpurple(a^2 (b^2 + 1)).
  $

  Take the quotient to find torsion:
  $
    tau = cblue(cancel(a^2) b)/cpurple(cancel(a^2) (b^2 + 1)) = cgreen(b/(b^2 + 1)).
  $
]

=== Summary

*Arc Length:*
$display(s = integral_a^b abs(arrow(r')(t)) dd(t) = integral_a^b sqrt((dv(x, t))^2 + (dv(y, t))^2 + (dv(z, t))^2) dd(t))$

*Curvature (3D):* $display(
  kappa = abs(dv(arrow(T), s))
  = abs(arrow(T)'(t))/abs(arrow(r')(t)) = abs(arrow(r') times arrow(r''))/abs(arrow(r'))^3
)$

*Curvature (2D):* $display(kappa = abs(f''(x)) / (1 + (f'(x))^2)^(3 slash 2))$

*Radius of Curvature:* $r = 1/kappa$

*TNB Frame:* $display(
  arrow(T) = arrow(r')/abs(arrow(r')) #h(48pt) arrow(N) = (arrow(T)')/abs(arrow(T)') #h(48pt)
  arrow(B) = arrow(T) times arrow(N)
)$

#rsubtext[$arrow(T)$ normal to *normal plane*; $arrow(N)$ normal to *rectifying plane*; $arrow(B)$ normal to *osculating
    plane*]

*Torsion:*
$display(tau = -dv(arrow(B), s) dot arrow(N) = det(arrow(r'), arrow(r''), arrow(r'''))/abs(arrow(r') times arrow(r'')))$

#pagebreak()

== Applications of Vector Functions

=== Particle Motion Definitions

If $arrow(r)(t)$ is the *position vector* of a particle at any time $t$, then:

- $arrow(v)(t) = arrow(r')(t)$ is the *velocity vector* at time $t$

  - Its magnitude $v(t) = abs(arrow(v)(t)) = abs(arrow(r')(t))$ is the *speed* at time $t$
  - We can also take the derivative of _distance traveled_, $s$, over time: $v(t) = s'(t) = dv(, t) abs(arrow(r)(t))$. \
    #subtext[From this, we can see that $abs(dv(, t) arrow(r)(t)) = dv(, t)abs(arrow(r)(t))$. This is a special property
      of the position vector.]

- $arrow(a)(t) = arrow(v')(t) = arrow(r'')(t)$ is the *acceleration vector* at time $t$.

=== Tangential and Centripetal Acceleration

- We have been able to come up with a scalar analog of velocity, _speed_, which is the derivative of arc length or the
  magnitude of velocity.

- However, the same cannot be said for acceleration. The derivative of speed is not necessarily equal to the magnitude
  of acceleration. In other words, $abs(arrow(v')(t)) != v'(t)$.

- When we only consider speed, the changing direction of the velocity vector is lost. The function $arrow(v)(t)$ would
  be the same whether we were moving straight at a constant rate or whether we are moving around in a circle at a
  constant rate.

- Thus, we must consider acceleration using at least two scalar components in order to properly represent the potential
  to change direction. When evaluating particle dynamics, it is useful to break down acceleration into two useful
  components:

  - *tangential acceleration*, $a_t$, which is the component of acceleration directed tangent to the curve (in the same
    direction as $arrow(T)$)

  - *centripetal acceleration*, $a_c$, which is the component of acceleration responsible for changing the direction of
    the particle, directed towards the center of the circle of curvature, which will always be normal to the curve (in
    the same direction as $arrow(N)$).

#define("Components of Accleration")[
  The acceleration vector $arrow(a)$ can be broken down into two components.

  - *Tangential Acceleration* $a_t$ is the derivative of speed,
    $a_t = dv(v, t) = ndv(s, t, 2) = (arrow(r') dot arrow(r''))/abs(arrow(r'))$.
  - *Centripetal Acceleration* $a_c$ is $a_c = kappa v^2 = abs(arrow(r') times arrow(r''))/abs(arrow(r'))$, where
    $kappa$ is curvature.

  If $arrow(T)$ is the unit tangent vector to the curve at $t$ and $arrow(N)$ is the unit normal at $t$, then:
  $
    arrow(a) = a_t arrow(T) + a_c arrow(N) = v' arrow(T) + kappa v^2 arrow(N).
  $
]

#derivation("Tangential and Centripetal Acceleration")[

  Since the tangent unit vector $arrow(T)(t)$ is just the unit vector of $arrow(v)(t)$, representing only the direction
  of the velocity, we can also write $arrow(v)(t) = v(t) arrow(T)(t)$ (_velocity = speed in the direction of
    $arrow(T)$_)

  From this, we can write a new expression for $arrow(a)(t)$. Since $arrow(a)(t) = arrow(v')(t)$, then:
  $
    arrow(a) = dv(, t) (v arrow(T)) = v' arrow(T) + v arrow(T)'.
  $

  We have already established in 2.3 that $arrow(T)'$ will always be orthogonal to $arrow(T)$, which is why its unit
  vector is known as the *normal vector* $arrow(N) = (arrow(T)')/abs(arrow(T)')$. So, we see that we have broken down
  $arrow(a)$ into a component pointing tangent to the curve and a component pointing normal to the curve.

  Since we are considering vector _components_, $a_t$ and $a_c$ are scalar values. We can now represent $arrow(a)(t)$
  using $a_t$ and $a_c$ pointing in their respective directions:
  $
    arrow(a) = a_t arrow(T) + a_c arrow(N).
  $

  We can also rewrite the first equation by using the fact that:
  - $kappa = abs(arrow(T)')/abs(arrow(r')) ==> abs(arrow(T)') = kappa abs(arrow(r')) = kappa v$, where $kappa$ is the
    curvature at $t$
  - $arrow(N) = arrow(T)'/abs(arrow(T)') ==> arrow(T)' = abs(arrow(T)') arrow(N) = kappa v arrow(N)$


  $
    arrow(a) = v' arrow(T) + kappa v^2 arrow(N)
  $

  Thus, we find that the components of acceleration are:
  $
    cgreen(a_t = v' #h(120pt) a_c = kappa v^2 = abs(arrow(r') times arrow(r''))/abs(arrow(r')).)
  $

  Since curvature is the reciprocal of the radius of curvature $R$, we can also write:
  $
    cgreen(a_c = v^2/R).
  $
  This is the equation typically introduced in a mechanics course.
]

#pagebreak()

== Parametric Surfaces

- A surface can be parameterized, but it must be done so using two variables, as points on the surface can vary
  independently in two "dimensions". Similarly, we would be able to parameterize a volume using three variables, and so
  on.

- Two _parameters_, say, $u$ and $v$, can independently vary throughout their domains, with each combination producing a
  point $P(x, y, z)$ on a surface $S$. Each coordinate of $P$ is a function of both parameters:
  $P(x(u,v), y(u,v), z(u,v))$. Then the parametric equations of $S$ are:
  $
    x = x(u,v) #h(50pt) y = y(u,v) #h(50pt) z = z(u,v).
  $

- We can also represent a parametric surface using a vector function of two variables. For $S$ as defined above, we can
  also use $arrow(r)(u,v) = x(u,v)hat(i) + y(u,v)hat(j) + z(u,v)hat(k)$. As $u$ and $v$ vary, the function $arrow(r)$
  outputs the position vector for some point on $S$.

=== Grid Curves

A method of graphing a parametric surface is by finding the *grid curves* of the surface. Each curve is achieved by
setting one of the parameters to a constant value. This results in a parametric equation of only one parameter, which
are space curves.

For example, from the surface $arrow(r)(u, v) = ang(u^2 + v^2, u, v)$, we can deduce the following grid curves:
- When $u=0$, $arrow(r)(v) = ang(v^2, 0, v)$ is the parabola $x = z^2$, opening along the $+x$-axis
- When $u=k$, $arrow(r)(v) = ang(k^2 + v^2, k, v)$ is the parabola above shifted $k^2$ units to the right and $k$ units
  along the $+y$-axis
- When $v=0$, $arrow(r)(u) = ang(u^2, u, 0)$ is a parabola opening to the right on the plane $z=0$
- When $v=k$, $arrow(r)(u) = ang(u^2 + k^2, u, k)$ is a parabola opening to the right, shifted $k^2$ units right and $k$
  units up, along the $+z$-axis

=== Parametric Equations of a Plane

To find the parametric equation of a plane, find a point $arrow(r)_0$ which lies on the plane as well as two nonparallel
vectors $arrow(u)$ and $arrow(v)$ which lie on the plane. We can step an arbitrary amount $mu$ and $nu$ in each of the
direction of the vectors to reach every point on the plane.\
#subtext[Since the vectors $arrow(u)$ and $arrow(v)$ are linearly independent, they can be considered basis vectors for
  the plane.]

#define("Vector and Parametric Equations of a Plane")[
  Let the plane $P$ contain point $arrow(r)_0 = ang(x_0, y_0, z_0)$ and the vectors $arrow(u) = ang(u_1, u_2, u_3)$ and
  $arrow(v) = ang(v_1, v_2, v_3)$ lie on $P$, and $arrow(u)$ is not parallel to $arrow(v)$.

  Then a vector equation of $P$ is
  $
    arrow(r)(mu, nu) = arrow(r)_0 + mu arrow(u) + nu arrow(v).
  $

  This can be decomposed into the following parametric equations:
  $
    x(mu, nu) & = x_0 + u_1mu + v_1nu \
    y(mu, nu) & = y_0 + u_2mu + v_2nu \
    z(mu, nu) & = z_0 + u_3mu + v_3nu.
  $
]
