#import "/helpers/template.typ": *
#show: set_unit_number.with(1)

= Vectors and the Geometry of Space

== Three-Dimensional Coordinate Systems

- A *plane* is two-dimensional because any point $(x, y)$ on the plane can be represented using only two real numbers.

- A *space* is a three-dimensional collection of points, where each point is represented using three real numbers
  $(x, y, z)$.

  - We can set three orthogonal (perpendicular) lines that pass through a given origin \ $cal(O) = (0, 0, 0)$. We can
    then call each of these lines the $x$-, $y$-, and $z$-axes respectively.

  - Typically, we imagine that the $x y$-plane (the plane which lies on the $x$- and $y$-axes) is at the bottom:
    - the $x$- and $y$-axes are "horizontal".
    - the $z$-axis is "vertical", with "upwards" indicating the positive $z$-direction.

  - The direction of the $z$-axis can be determined using the *right-hand rule*:

    _Extend your right hand in the direction of $+x$, then curl your fingers in the direction of $+y$. \ Your thumb will
      point in the direction of $+z$._

  - There are three *coordinate planes*: the $x y$-, $x z$-, and $y z$-planes.

    - The *projection* of a point $P$ to a specific plane is the coordinates of $P$ with the "other" coordinate set to
      $0$. \
      #subtext[ex: the projection of $(2, 5, 3)$ to the $x z$-axis is $(2, 0, 3)$. The $y$-coordinate is set to $0$.]

- *$n$-space* is the $n$-dimensional space represented by the collection of points represented by a collection of $n$
  real numbers.

- $RR^n$ is the set of all points in $n$-space. \
  #subtext[$RR^2$ is the set of all points in a plane, and $RR^3$ is the set of all points in $3$-space.]

  - If there is a bijection from coordinates to points in space (if a point in space can only ever be represented with
    one coordinate and vice versa), the coordinate system is *rectangular*.

=== Graphs in 3-space

- In $2$-space, the set of points that satisfy an equation (e.g. one involving $x$ and $y$) is called a *curve* in
  $RR^2$.

- Similarly, the set of points that satisfy equation in $3$-space (e.g. one involving $x$, $y$, and $z$) is called a
  *surface* in $RR^3$.

- The following equations in $RR^3$ represent planes parallel to one of the coordinate planes:

  #h(4fr) $x = c$ #h(1fr) $y = c$ #h(1fr) $z = c$ #h(4fr) where $c$ is a constant. #h(4fr)

  For example, the equation $z = 3$ represents all points $(x, y, 3)$, which is the $x y$-plane translated $3$ units up
  (in the positive $z$-direction).

#define("Distance between Two Points")[
  The distance between two points $P(x_1, y_1, z_1)$ and $Q(x_2, y_2, z_2)$ in 3-space is:
  $ abs(P Q) = sqrt((x_2 - x_1)^2 + (y_2 - y_1)^2 + (z_2 - z_1)^2). $
]

Using the distance formula, we can derive the equation of the sphere of radius $r$ to be the set of all points
$P(x, y, z)$ a distance $r$ from some center $cal(C)(h, k, ell)$:
$
                                     |P cal(C)| & = r \
      sqrt((x - h)^2 + (y - k)^2 + (z - ell)^2) & = r \
  cgreen((x-h)^2 + (y-k)^2 + (z-ell)^2 &= r^2).
$

#example("Finding the center and radius of a sphere")[
  Find the center and radius of the sphere $x^2 + y^2 + z^2 + 4x - 6y + 2z + 6 = 0$.

  #lorange

  Rewrite into standard form by completing the squares:
  $
                                      (x^2 + 4x) + (y^2 - 6y) + (z^2 + 2z) + 6 & = 0 \
     (x^2 + 4x cblue(+ 4)) + (y^2 - 6y cblue(+ 9)) + (z^2 + 2z cblue(+ 1)) + 6 & = cblue(4 + 9 + 1) \
                                                 (x + 2)^2 + (y-3)^2 + (z+1)^2 & = 4 + 9 + 1 cred(- 6) \
    cgreen((x + 2)^2 + (y - 3)^2 + (z + 1)^2 & = 8 = underbrace(sqrt(8), r)^2)
  $

  Thus, the center is $cgreen((-2, 3, -1))$ and the sphere has radius $cgreen(r = sqrt(8) = 2 sqrt(2))$.
]

#pagebreak()

== Introduction to Vectors

- Vectors are either denoted with arrows or they are bolded.
  - If $v$ is a vector, then we can clarify so by writing $arrow(v)$ or $bf(v)$.

- If the points $A$ and $B$ are defined, the vector pointing from $A$ to $B$ can be written $arrow(A B)$.

- A vector in $n$-dimensions is composed of $n$ _components_. Each vector component represents a certain direction in
  space.

- A vector can be written in component form, either as a 1-D matrix (a "column vector") or by using angle brackets:
  $ arrow(v) = mat(v_1; v_2; dots.v; v_n) = ang(v_1, v_2, ..., v_n). $

- The *magnitude* of a vector is the distance from head to tail. The magnitude of a vector $arrow(v)$ is denoted
  $|arrow(v)|$ or $||arrow(v)||$. If $arrow(v) = ang(v_1, v_2, ..., v_n)$, then its magnitude
  $|arrow(v)| = sqrt(v_1^2 + v_2^2 + ... + v_n^2)$.

- A *unit vector* is a vector with magnitude $1$. If $arrow(v)$ is a well-defined unit vector, then it is typically
  denoted $hat(v)$ (_"v-hat"_), and $|hat(v)| = 1$.

  - The three _basis vectors_, or fundamental directional unit vectors, are $hat(i)$, $hat(j)$, and $hat(k)$. \
    It holds that $ang(x, y, z) = x hat(i) + y hat(j) + z hat(k)$.

  - The unit vector $hat(v)$ of a vector $arrow(v)$ points in the same direction as $arrow(v)$, and
    $hat(v) = arrow(v)/abs(arrow(v))$

- The *zero vector* is the only vector with a magnitude of $0$, denoted $arrow(0).$

- A vector only describes a displacement, not an absolute position. A vector has no way of describing where it starts
  and ends without some reference point.

=== Combining Vectors

- The sum of two vectors $arrow(a) = ang(a_1, a_2, ..., a_n)$ and $arrow(b) = ang(b_1, b_2, ..., b_n)$ is:
  $
    arrow(a) + arrow(b) = ang(a_1, a_2, ..., a_n) + ang(b_1, b_2, ..., b_n) = ang(a_1 + b_1, a_2 + b_2, ..., a_n + b_n).
  $
  In other words, it is just adding each corresponding component together.

- The difference of two vectors works the same way.

- It holds that $arrow(A B) + arrow(B C)$ = $arrow(A C)$ (triangle law) and $arrow(a) + arrow(b) = arrow(b) + arrow(a)$
  (parallelogram law), \ each named for how the property can be visualized on a graph.

=== Scalar Products

Multiplying a vector by a scalar (or vice-versa) is the equivalent of multiplying each component by the scalar:
$
  k arrow(v) = k ang(v_1, v_2, ..., v_n) = ang(k v_1, k v_2, ..., k v_n) space space space space "where" k "is any scalar."
$

It also holds that $abs(k arrow(v)) = k abs(arrow(v))$.

#pagebreak()

== Products of Vectors

There are two fundamental ways to "combine" two vectors: by using a *dot product* and by using a *cross product*.

=== The Dot Product

The dot product of two vectors $arrow(a)$ and $arrow(b)$, denoted $arrow(a) dot arrow(b)$, interprets the product as
both how much the two vectors point in the same direction as well as the scalar product of their magnitudes.

- Geometrically, if $theta$ is the angle between the vectors $arrow(a)$ and $arrow(b)$, then
  $arrow(a) dot arrow(b) = |arrow(a)|\|arrow(b)| cos theta$.
  - Thus, if $arrow(a)$ is orthogonal to $arrow(b)$, then $arrow(a) dot arrow(b) = 0$ because $cos 90 degree = 0$.
  - Additionally, if $arrow(a)$ points in the same direction as $arrow(b)$, then
    $arrow(a) dot arrow(b) = |arrow(a)|\|arrow(b)|$ because $cos 0 degree = 1$.

- For example, work can be defined as the dot product of force $bf(F)$ and displacement $bf(r)$, since only the
  component of force directed along the displacement should be considered ($W = bf(F) dot bf(r)$).

#derivation("Derivation: Dot Product using Components")[
  The first principles of the dot product is actually the geometric definition of the dot product:
  $ arrow(a) dot arrow(b) = a b cos theta $
  #align(right)[
    ...where $a = abs(arrow(a))$, $b = abs(arrow(b))$, and $theta$ is the angle between $arrow(a)$ and $arrow(b)$
    ($0 <= theta <= pi$).
  ]

  #grid(
    columns: (2fr, 1fr),
    [
      It turns out that $a$, $b$, and $abs(arrow(a) - arrow(b))$ are vectors that make up the side lengths of a triangle
      (see right figure).

      Let $arrow(a) = ang(a_1, a_2, ..., a_n)$ and $arrow(b) = ang(b_1, b_2, ..., b_n)$. \
      By the law of cosines:
      $
        abs(arrow(a) - arrow(b))^2 & = a^2 + b^2 - 2 cblue(a b cos theta) \
                                   & = a^2 + b^2 - 2(cblue(arrow(a) dot arrow(b))).
      $
    ],
    image("assets/dot_product.png"),
  )

  We can then isolate the dot product:
  $
    cblue(arrow(a) dot arrow(b)) &= 1/2 (&&a^2 + b^2 - abs(arrow(a) - arrow(b))^2) \
    &= 1/2 (&& a_1^2 + a_2^2 + ... + a_n^2 \ & && "" + b_1^2 + b_2^2 + ... + b_n^2 \ & && "" - (a_1 - b_1)^2 - (a_2 - b_2)^2 - ... - (a_n - b_n)^2) \
    &= 1/2 (&& cred(a_1^2 + a_2^2 + ... + a_n^2) \ & && "" + cpurple(b_1^2 + b_2^2 + ... + b_n^2) \ &
      && "" - (cred(a_1^2) - 2 a_1 b_1 + cpurple(b_1^2))
      - (cred(a_2^2) - 2 a_2 b_2 + cpurple(b_2^2))
      - corange(...) - (cred(a_n^2) - 2 a_n b_n + cpurple(b_n^2))) \
    &= 1/2(&& 2 a_1 b_1 + 2 a_2 b_2 + ... + 2a_n b_n) = cgreen(a_1 b_1 + a_2 b_2 + ... + a_n b_n).
  $
]

#define("Dot Product of Two Vectors (Component Form)")[
  Let $arrow(a) = chevron.l a_1,a_2,...,a_n chevron.r$ and $arrow(b) = chevron.l b_1,b_2,...,b_n chevron.r$ be vectors
  in $n$-dimensions. Then:
  $ arrow(a) dot arrow(b) = sum_(i=1)^n a_i b_i = a_1 b_1 + a_2 b_2 + ... + a_n b_n. $
]

=== The Cross Product

#define("Cross Product of Two Vectors in 3D")[
  Let $arrow(a) = chevron.l a_x, a_y, a_z chevron.r$ and $arrow(b) = chevron.l b_x, b_y, b_z chevron.r$. Then:
  $
    arrow(a) times arrow(b) = mat(delim: "|", hat(i), hat(j), hat(k); a_x, a_y, a_z; b_x, b_y, b_z) = mat(a_y b_z - a_z b_y; a_z b_x - a_x b_z; a_x b_y - a_y b_x)
  $
]

- Unlike dot products which output scalar values, cross products output vectors.
  - The _right hand rule_ can be used to determine the direction of the resulting vector. \
    If the vectors $arrow(a)$ and $arrow(b)$ lie on a plane $P$, then $arrow(a) times arrow(b)$ is orthogonal to $P$.

  - The unit vector pointing in the direction of the resulting vector is typically denoted $hat(n)$. This is called the
    _normal vector_ or the _unit normal_.

- Geometrically, if $theta$ is the angle between the vectors $arrow(a)$ and $arrow(b)$, then
  $arrow(a) times arrow(b) = (abs(arrow(a))\|arrow(b)|sin theta) hat(n)$.

  - Thus, if $arrow(a)$ points in the same direction as $arrow(b)$, then $arrow(a) times arrow(b) = 0$ because
    $sin 0 degree = 0$. \
    This makes sense because $arrow(a)$ and $arrow(b)$ no longer form a plane (they are not _coplanar_).

  - Additionally, if $arrow(a)$ is orthogonal to $arrow(b)$, then
    $abs(arrow(a) times arrow(b)) = abs(arrow(a))\|arrow(b)|$ because $sin 90 degree = 1$.

- *Cross products are not commutative*: $arrow(a) times arrow(b) = -arrow(b) times arrow(a)$ \
  #subtext[(if we flip the order, the cross product will point in the opposite direction)]

- *Cross products are not associative:*
  $(arrow(a) times arrow(b)) times arrow(c) != arrow(a) times (arrow(b) times arrow(c)).$

- Cross products are an interpretation of the area of the parallelogram formed by the vectors. \
  *$abs(arrow(a) times arrow(b))$ is the area of the parallelogram bounded by $arrow(a)$ and $arrow(b)$!*

#example([
  Area of a Triangle given Three Points
])[
  Find the area of the triangle $A B C$ with vertices $A(2, 1, 2)$, $B(3, 5, 4)$, and $C(1, 6, 7)$.
  #lorange
  Although we can try computing the lengths of each side of the triangle and apply triangle formulas to solve this
  problem, we can just as well use a cross product.

  The area of the parallelogram with adjacent sides $A B$ and $B C$ is $abs(arrow(A B) times arrow(B C))$.\
  Find $arrow(A B) times arrow(B C)$ and compute its magnitude:
  $
    arrow(A B) times arrow(B C) & = ang(3-2, 5-1, 4-2) times ang(1-3, 6-5, 7-4) \
                                & = ang(1, 4, 2) times ang(-2, 1, 3) \
                                & = mat(delim: "|", hat(i), hat(j), hat(k); 1, 4, 2; -2, 1, 3) = ang(10, -7, 9).
  $
  $
    cblue("Area"_"parallelogram" = abs(arrow(A B) times arrow(B C)) = sqrt(10^2 + (-7)^2 + 9^2) = sqrt(230).)
  $
  The area of the triangle is half the area of the parallelogram:
  $ "Area"_(triangle A B C) = 1/2 "Area"_"parallelogram" = cgreen(sqrt(230)/2). $
]

==== Cross Products of Basis Vectors

You should use the right-hand rule to memorize the following cross products:

#h(6fr) $hat(i) times hat(j) = hat(k)$ #h(4fr) $hat(j) times hat(i) = -hat(k)$ #h(6fr) \
#h(6fr) $hat(j) times hat(k) = hat(i)$ #h(4fr) $hat(k) times hat(j) = -hat(i)$ #h(6fr) \
#h(6fr) $hat(k) times hat(i) = hat(j)$ #h(4fr) $hat(i) times hat(k) = -hat(j)$ #h(6fr)

=== Triple Products

- The *scalar triple product* of three vectors $arrow(a)$, $arrow(b)$, and $arrow(c)$ is
  $arrow(a) dot (arrow(b) times arrow(c))$. The triple product is relevant since it is the volume of the parallelepiped
  (parallelogram prism) formed by the three vectors.

  If the volume of the parallelepiped is $0$, then the triple product is $0$ and our vectors lie on the same plane (the
  parallelepiped is flat). In other words, $arrow(a)$, $arrow(b)$, and $arrow(c)$ are *coplanar* if
  $arrow(a) dot (arrow(b) times arrow(c)) = 0$.

  Conveniently, it also holds that
  $arrow(a) dot (arrow(b) times arrow(c)) = (arrow(a) times arrow(b)) dot arrow(c) = mat(delim: "|", a_1, a_2, a_3; b_1, b_2, b_3; c_1, c_2, c_3)$.

- The *vector triple product* of three vectors $arrow(a)$, $arrow(b)$, and $arrow(c)$ is
  $arrow(a) times (arrow(b) times arrow(c)) = (arrow(a) dot arrow(c)) arrow(b) - (arrow(a) dot arrow(b))arrow(c)$.

#pagebreak()

== Projections of Vectors

The *projection* of a vector $arrow(a)$ along another vector $arrow(b)$ is the component of $arrow(a)$ which points in
the same direction as $arrow(b)$. There are two types of projections:

- The *scalar projection* is simply the magnitude of such component. We can derive it from the definition of the dot
  product:

  #derivation("Derivation: Scalar Projection")[
    1. Let $a = abs(arrow(a))$ and $b = abs(arrow(b))$.

    2. Since $arrow(a) dot arrow(b) = a b cos theta$, where $theta$ is the angle between $arrow(a)$ and $arrow(b)$,
      $cos theta = (arrow(a) dot arrow(b)) / (a b)$.

    3. Using trigonometry, $cos theta = x / a$, where $x$ is the scalar component of $arrow(a)$ along $arrow(b)$.

    4. $display(therefore x/a = (arrow(a) dot arrow(b)) / (a b) ==> x = (arrow(a) dot arrow(b))/b = (arrow(a) dot arrow(b)) / abs(arrow(b)))$.
  ]

  - The scalar projection is often represented using the syntax $"comp"_arrow(b) arrow(a)$, where $arrow(b)$, the
    subscript, is what we are projecting _onto_.

#define("Scalar Projection")[
  The *scalar projection* of $arrow(a)$ along ("onto") $arrow(b)$, $"comp"_arrow(b) arrow(a)$, is the signed magnitude
  of the component of $arrow(a)$ which is parallel to $arrow(b)$:
  $ "comp"_arrow(b) arrow(a) = (arrow(a) dot arrow(b))/abs(arrow(b)). $
]

- The *vector projection* of $arrow(a)$ along $arrow(b)$, $bf("proj")_arrow(b) arrow(a)$, is the vector component of
  $arrow(a)$ pointing in the same direction as $arrow(b)$. It is simply the scalar projection times the unit vector for
  $arrow(b)$:
  $
    bf("proj")_arrow(b) arrow(a) = "comp"_arrow(b) arrow(a) dot hat(b) = (arrow(a) dot arrow(b))/abs(arrow(b)) dot arrow(b)/abs(arrow(b)) = cgreen((arrow(a) dot arrow(b))/(abs(arrow(b))^2) arrow(b)).
  $

#define("Vector Projection")[
  The *vector projection* of $arrow(a)$ along ("onto") $arrow(b)$, $bf("proj")_arrow(b) arrow(a)$, is the vector
  component of $arrow(a)$ pointing in the same direction as $arrow(b)$:
  $ bf("proj")_arrow(b) arrow(a) = (arrow(a) dot arrow(b)) / abs(arrow(b))^2 arrow(b). $
]

- $bf("proj")$ is often bolded because the operation results in a vector.

- The result of the projection specified by $bf("proj")$ is in the direction of the _subscript_.

#pagebreak()

== Equations of Lines and Planes

=== Point-Slope Equations of Lines

We know that in the $x y$-plane, we can define a line using its _point-slope form_, which specifies a point through
which the line passes as well as the slope of the line.

A line which passes through the point $(x_0, y_0)$ with slope $m$ can be described using the equation
$y = m(x - x_0) + y_0$. This is derived from applying translations to $y = m x$.

In a similar way, we can define a line in $3$-space using a point through which the line passes as well as a _vector_
which lies parallel to the line. \
#subtext[(In a way, our line has "multiple" slopes, which are all contained in the vector.)]

#derivation("Derivation: Parametric Equations for a Line in 3-space")[
  1. Let the line $L$ in $3$-space pass through the point $(x_0, y_0, z_0)$. We can define the point using a *position
      vector*, $arrow(r)_0 = ang(x_0, y_0, z_0)$.

    Now, assume the same line $L$ points in the same direction as some vector $arrow(v) = ang(a, b, c)$. We call $a$,
    $b$, and $c$ the *direction numbers* for $L$.


    Finally, let $(x, y, z)$ be an arbitrary point on $L$, and $arrow(r) = ang(x, y, z)$ is its position vector.

  2. We can arrive at $arrow(r)$ by stepping in the direction of $arrow(v)$ starting from $arrow(r)_0$:
    $ arrow(r) = arrow(r)_0 + t arrow(v). $

    We introduce the parameter $t in RR$ as an arbitrary scale factor of $arrow(v)$, since $arrow(v)$ does not specify
    the correct magnitude, only direction. Writing out the vector components:
    $ mat(x; y; z) = mat(x_0; y_0; z_0) + t mat(a; b; c) = mat(x_0 + a t; y_0 + b t; z_0 + c t) $
  3. This is a set of *parametric equations* which define the line $L$:

  #h(4fr) $x(t) = x_0 + a t$ #h(2fr) $y(t) = y_0 + b t$ #h(2fr) $z(t) = z_0 + c t$ #h(4fr)
]
#define("Point-Slope Equation of a Line")[
  Let $L$ be the line which passes through the point $(x_0, y_0, z_0)$ and lies parallel to some vector
  $arrow(v) = ang(a, b, c)$. Then a point $(x, y, z)$ lies on $L$ iff:

  #h(4fr) $x(t) = x_0 + a t$ #h(2fr) $y(t) = y_0 + b t$ #h(2fr) $z(t) = z_0 + c t$ #h(3fr) $"where" t in RR.$ #h(4fr)

  If $arrow(r) = ang(x, y, z)$ and $arrow(r)_0 = ang(x_0, y_0, z_0)$, then $L$ can also be represented by this vector
  equation:

  $
    arrow(r) = arrow(r)_0 + t arrow(v).
  $
]

#note[
  There can be many different sets of parametric equations which define the same lines in $3$-space. We can change the
  point or choose a completely different direction vector.
]

#example("Equations of a Line from Point and Direction")[
  Write a set of parametric equations which define the line that passes through the point $(5, 1, 3)$ and points in the
  same direction as $hat(i) + 4 hat(j) - 2 hat(k)$.
  #lorange
  Write each vector in component form:
  $
      arrow(r) & = ang(x, y, z) \
    arrow(r)_0 & = ang(x_0, y_0, z_0) && = ang(5, 1, 3) \
      arrow(v) & = ang(a, b, c)       && = ang(1, 4, -2)
  $
  From $arrow(r) = arrow(r)_0 + t arrow(v)$, we get the following parametric equations:

  #h(4fr) $cgreen(x(t) = 5 + t)$ #h(2fr) $cgreen(y(t) = 1 + 4t)$ #h(2fr) $cgreen(z(t) = 3 - 2t)$ #h(4fr)
]

#example("Equations of a Line from two Points")[
  Write a set of parametric equations which define the line $L$ that passes through the points $(6, 2, 7)$ and
  $(1, 4, 5)$. At what point does $L$ intersect the $x y$-plane?

  #lorange

  This is a simple extension from the content above, since the direction vector of a line passing through two points
  represented by position vectors $arrow(a)$ and $arrow(b)$ is just $arrow(a) - arrow(b)$ or $arrow(b) - arrow(a)$.

  Let's choose $(1, 4, 5)$ as our given point, $arrow(r)_0 = ang(1, 4, 5)$.

  The direction vector can be computed as $arrow(v) = ang(6, 2, 7) - ang(1, 4, 5) = ang(5, -2, 2)$.

  We now have everything to write the parametric equations:

  #h(4fr) $cgreen(x(t) = 1 + 5t)$ #h(2fr) $cgreen(y(t) = 4 - 2t)$ #h(2fr) $cgreen(z(t) = 5 + 2t)$ #h(4fr)

  The line will intersect the $x y$-plane when $z = 0$:
  $ z(t) = 5 + 2t = 0 ==> cblue(t = -5/2). $
  Plug in $t = -5/2$ to every other equation in our parametric to find the point of intersection:
  $
    x(cblue(-5/2)) & = 1 + 5(cblue(-5/2)) && = -23/2 \
    y(cblue(-5/2)) & = 4 - 2(cblue(-5/2)) && = 9
  $
  #rsubtext[(we already know $z = 0$)]

  Thus, the point that lies on $L$ and intersects the $x y$-plane is $cgreen((-23/2, 9, 0))$.
]

==== Symmetric Equations of Lines

For each parametric equation, we can isolate $t$:

#[
  #show math.equation: it => math.display(it)
  #h(4fr) $t = (x - x_0) / a$ #h(2fr) $t = (y - y_0) / b$ #h(2fr) $t = (z - z_0) / c$ #h(4fr)

  This creates a three-way equality statement, known as the *symmetric equations* of the line:

  #h(4fr) $(x - x_0)/a = (y-y_0)/b =(z-z_0)/c$ #h(4fr) where $a, b, c != 0$ #h(4fr)
]

If any $x$, $y$, or $z$ is $0$, then we cannot include the respective expression in our equation. For example, if
$a = 0$, our symmetric equations become:
$ x=x_0, space (y-y_0)/b = (z-z_0)/c $

This means the line lies completely on $x=x_0$.

==== Equations of Line Segments

The parametric equations of line _segments_ are constrained by the endpoints. Specifically, we can turn a set of
parametric equations for a line into a line segment by constraining $t$ to an interval.

For example, the following describes a line segment:

#h(4fr) $x(t) = 5 + t$ #h(2fr) $y(t) = 1 + 4t$ #h(2fr) $z(t) = 3 - 2t$ #h(2fr) $cblue(0 <= t <= 1)$
#h(4fr)

This line segment has endpoints $arrow(r)(0) = (5, 1, 3)$ and $arrow(r)(1) = (6, 5, 1)$.

#derivation("Derivation: General Equation of a Line Segment")[
  When finding the equations for a line segment given two endpoints and a constraint for $t$, we must choose the correct
  direction vector such that the constraints are met.

  If given a direction vector $arrow(v)$, we must use $k arrow(v)$ where $k$ is some unknown scale of $arrow(v)$ that
  will allow our final equations to meet the constraint.

  #lgreen

  Let a line segment $L$ have endpoints $arrow(r)_0 = ang(x_0, y_0, z_0)$ and $arrow(r)_n = ang(x_n, y_n, z_n)$. There
  exists a vector $arrow(v) = ang(a, b, c)$ that is parallel to $L$. Find a set of parametric equations in $t$ which
  represent the line segment, where $0 <= t <= n$.

  $arrow(v) || L ==> k arrow(v) || L ==> ang(k a, k b, k c) || L$. Our vector equation is:

  #h(4fr)
  $arrow(r)(t) = arrow(r)_m + t k arrow(v)$ #h(2fr) $0 <= t <= n.$
  #h(4fr)

  which when written as a parametric is:

  #h(4fr) $x(t) = x_0 + a k t$ #h(2fr) $y(t) = y_0 + b k t$ #h(2fr) $z(t) = z_0 + c k t$ #h(4fr) $0 <= t <= n.$
  #h(4fr)

  Solve for $k$ when $t=n$ (only one of the below statements are needed):
  $
    k = (x_n - x_0) / (a n) = (y_n - y_0)/(b n) = (z_n -z_0)/(c n)
  $
  Thus, the equations become:

  #h(4fr) $x(t) = x_0 + (x_n - x_0)/n t$ #h(2fr) $y(t) = y_0 + (y_n - y_0)/n t$ #h(2fr) $z(t) = z_0 + (z_n - z_0)/n t$
  #h(4fr) $0 <= t <= n.$
  #h(4fr)

  In vector form:
  $ cgreen(arrow(r)(t) = arrow(r)_0 + (arrow(r)_n - arrow(r)_0)/n t = arrow(r)_0 + 1/n Delta arrow(r) t). $
]

=== Equations of Planes

A plane can also described using a point which lies on the plane and a direction vector. However, a vector parallel to a
plane is not sufficient to describe its direction (there are an infinite amount of planes that would satisfy such
condition). Instead, the direction vector is a vector perpendicular to the plane, called the *normal vector* $arrow(n)$.

#derivation("Derivation: Scalar Equation of a Plane")[
  1. Let the vector $arrow(r)_0 = ang(x_0, y_0, z_0)$ represent a point that lies on $P$. \
    Let the vector $arrow(n) = ang(a, b, c)$ be _orthogonal_ to $P$, indicating its direction. \
    Let the point represented by $arrow(r) = ang(x, y, z)$ be an arbitrary point which lies on $P$.

  2. The vector pointing from $arrow(r)_0$ to $arrow(r)$, $arrow(r) - arrow(r)_0$, must lie on $P$ because both
    $arrow(r)_0$ and $arrow(r)$ lie on $P$. \
    Since $arrow(n)$ is orthogonal to every vector which completely lies on $P$, $arrow(n)$ is orthogonal to
    $arrow(r) - arrow(r)_0$.

    The dot product of orthogonal vectors is always $0$:
    $
              arrow(n) dot (arrow(r) - arrow(r)_0) & = 0 space space "(vector equation)" \
         ang(a, b, c) dot ang(x-x_0, y-y_0, z-z_0) & = 0 \
      cgreen(a(x-x_0) + b(y-y_0) + c(z-z_0) &= 0).
    $

    This is the *scalar equation* of the plane $P$.
]

#define("Equation of a Plane")[
  If a plane $P$ in $3$-space contains the point represented by position vector $arrow(r)_0 = ang(x_0, y_0, z_0)$ and
  the vector $arrow(n) = ang(a, b, c)$ is orthogonal to $P$, then an arbitrary point represented by position vector
  $arrow(r) = ang(x, y, z)$ lies on $P$ iff:
  $
    arrow(n) dot (arrow(r) - arrow(r)_0) & = 0 space space "(vector equation)" \
      ==> a(x-x_0) + b(y-y_0) + c(z-z_0) & = 0 space space "(scalar equation)".
  $
]

#example("Equation of a Plane given Point and Normal Vector")[
  The plane $P$ that passes through the point $(2, 4, -1)$. If the vector $2hat(i) + 3hat(j) + 4hat(k)$ is orthogonal to
  $P$, find an equation for $P$.

  #lorange

  Using $arrow(r)_0 = ang(2, 4, -1)$ and $arrow(n) = ang(2, 3, 4)$, we get:
  $ 2(x-2) + 3(y-4) + 4(z+1) = 0. $
  This can be simplified into standard form ($a x + b y + c z = d$):
  $
      2x - 4 + 3y - 12 + 4z + 4 & = 0 \
    cgreen(2x + 3y + 4z &= 12).
  $
]

#example("Equation of a Plane given Three Points")[
  The plane $P$ passes through the following set of points: ${(1, 3, 2), (3, -1, 6), (5, 2, 0)}$. \ Find an equation for
  $P$.

  #lorange

  Any three points can be used to describe a plane, as long as they are not _colinear_. We can create two vectors out of
  the three points which are parallel to $P$:
  $
    arrow(a) & = ang(3, -1, 6) - ang(1, 3, 2) && = ang(2, -4, 4) \
    arrow(b) & = ang(5, 2, 0) - ang(3, -1, 6) && = ang(2, 3, -6)
  $

  The cross product of these two vectors will be orthogonal to $P$, and we can use it as our normal vector:
  $
    arrow(n) = arrow(a) times arrow(b) = ang(2, -4, 4) times ang(2, 3, -6)
    &= mat(delim: "|", hat(i), hat(j), hat(k); 2, -4, 4; 2, 3, -6) \
    &= mat(delim: "|", -4, 4; 3, -6) hat(i)
    - mat(delim: "|", 2, 4; 2, -6) hat(j)
    + mat(delim: "|", 2, -4; 2, 3) hat(k) \
    &= 12 hat(i) + 20 hat(j) + 14 hat(k) = cblue(ang(12, 20, 14)).
  $

  Finally, we can select one of the points again to write the equation of $P$. \
  Selecting $arrow(r)_0 = ang(1, 3, 2)$, we get:
  $
       12(x-1) + 20(y-3) + 14(z-2) & = 0 \
    12x - 12 + 20y - 60 + 14z - 28 & = 0 \
                   12x + 20y + 14z & = 100 \
      cgreen(6x + 10y + 7z &= 50).
  $
]

==== Intersections of Planes

- The angle of intersection between two planes is the angle between their normal vectors. If the normal vectors of two
  intersecting planes are $arrow(n)_1$ and $arrow(n)_2$, then the angle $theta$ between them is:
  $ theta = arccos((arrow(n)_1 dot arrow(n)_2)/(abs(arrow(n)_1)abs(arrow(n)_2))). $

- Two planes can either intersect nowhere, everywhere, or along a single line, called the _line of intersection_ between
  the two planes.
  - If two planes intersect nowhere or everywhere, they are parallel. Two planes are parallel if their normal vectors
    are also parallel.

- The equations of two intersecting planes create a system of two equations with three unknowns. This means one of our
  unknowns are free to vary, which is why the set of solutions to the system form a line.

  - The set of parametric equations for the line of intersection can be obtained by parameterizing the free variable.

#example("Line of Intersection of Two Planes")[
  $L$ is the line of intersection between the planes $2x + 3y + 5z = 1$ and $-x + 2y + 3z = 2$. \
  Find a set of parametric equations that represent $L$.

  #lorange

  This is a system of two equations with three unknowns:
  $
    2x & + 3y && + 5z & = 1 \
    -x & + 2y && + 3z & = 2
  $

  Choose to eliminate two variables. First let's eliminate $x$:
  $
    mat(
      delim: #none,
      align: #right,
      augment: #{ (hline: 2) },
      row-gap: #{ 4pt },
      2x & + & 3y & + & 5z & = 1;
      -2x & + & 4y & + & 6z & = 4;
      && 7y & + & 11z & = 5
    ) space space ==> space space
    cblue(y = 5/7 - 11/7 z).
  $
  Then, substitute $y$ in terms of $z$ into one of the original equations and solve for $x$:
  $
                 -x + 2cblue(y) + 3z & = 2 \
    -x + 2(cblue(5/7 - 11/7 z)) + 3z & = 2 \
                  10/7 - 22/7 z + 3z & = 2 + x \
          cpurple(-4/7 - 1/7 z&= x).
  $
  Now, we have two functions of $z$: $x(z)$ and $y(z)$. If we let $z = t$, then we have now have a set of three
  parametric equations for $L$:

  #h(4fr) $x(t) = -4/7 - 1/7 t$ #h(2fr) $y(t) = 5/7 - 11/7 t$ #h(2fr) $z(t) = t.$
  #h(4fr)

  Or, if we let $z = 7t$, we can eliminate a few fractions from our equations:

  #h(4fr) $cgreen(x(t) = -4/7 - t)$ #h(2fr) $cgreen(y(t) = 5/7 - 11t)$ #h(2fr) $cgreen(z(t) = 7t).$
  #h(4fr)
]

==== Distances Between Planes

The distance between a point and a plane can be calculated using a scalar projection. If $P$ is a point on a plane $S$,
then a vector pointing from $Q$ to $P$ is $arrow(P Q)$. The shortest distance from $Q$ to $S$ is the scalar component of
$arrow(P Q)$ that is parallel to the vector normal to $P$.

#define("Distance from a Point to a Plane")[
  Let $P$ and $Q$ be points in $RR^3$, and $S$ is a plane containing $P$ with normal vector $arrow(n)$. The distance
  from $Q$ to the plane $S$ is given by:
  $ |Q S| = abs("comp"_arrow(n) arrow(P Q)) = abs(arrow(n) dot arrow(P Q)) / abs(arrow(n)). $
]

Extending this, we can find the distance from a plane $A$ to another plane $B$ ($A || B$) by choosing an arbitrary point
on one of the planes and using the above formula.

=== Skew Lines

Two lines are *skew* if they are not parallel and they do not intersect. Thus, skew lines must lie on parallel but
separate _planes_. The distance between the two lines is equal to the distance between the respective parallel planes
they lie on.

#example("Verify Two Lines are Skew")[
  Show that the following lines $A$ and $B$ are _skew_:
  $
    A: #h(20pt) & x = 1 + t #h(50pt) && y = -2 + 3t #h(50pt) && z = 4 - t \
    B: #h(20pt) & x = 2s             && y = 3 + s            && z = -3 + 4s
  $
  #lorange

  1. First, we can verify that the two lines are not parallel to each other. The direction vectors of $A$ and $B$ are
    $ang(1, 3, -1)$ and $ang(2, 1, 4)$ respectively, which are not scalar multiples of each other.

  2. Next, we want to show that a point of intersection $(x, y, z)$ does not exist. We can write a system of equations
    in $t$ and $s$ by equating each component:
    $
        1 + t & = 2s \
      -2 + 3t & = 3+ s \
        4 - t & = -3 + 4s.
    $

    We can solve for $t$ and $s$ using two of the equations and verify that there is a contradiction when those values
    of $t$ and $s$ are plugged into the other.

    Using the first two equations, we get $t = 11/5$ and $s = 8/5$:
    $
                  1 + t = 2s & space ==> space t = 2s - 1 \
      -2 + 3(2s - 1) = 3 + s & space ==> space s = 8/5, t = 2(8/5) - 1 = 11/5
    $

    Those values of $t$ and $s$ give us a contradiction in the third equation:
    $
      4 - 11/5 & =^? -3 + 4(8/5) \
           9/5 & cred(!=) 17/5 #h(20pt) qed
    $

    Since we arrive at a contradiction, $A$ and $B$ do not intersect. Since they are also not parallel, $A$ and $B$ are
    #tgreen[_skew_].
]

==== Distances Between Skew Lines

#derivation("Derivation: Distance between Two Skew Lines")[
  1. Let lines $L_1$ and $L_2$ be skew and lie on planes $P_1$ and $P_2$. $P_1$ must be parallel to $P_2$. \
    Assume $L_1$ is parallel to $arrow(v)_1$ and $L_2$ is parallel to $arrow(v)_2$. \
    Finally, let $M$ be a known point on $L_1$ and thus $P_1$.

  2. The normal vectors of both $P_1$ and $P_2$ must be the same as they are parallel. Since the normal vectors are
    orthogonal to both $arrow(v)_1$ and $arrow(v_2)$. We can find a normal vector by computing the cross product
    $arrow(n) = arrow(v)_1 times arrow(v)_2$.

  3. We can now completely define the plane $P_1$ using point $M$ and normal vector $arrow(n)$. We can now find the
    distance from an arbitrary point $N$ on $L_2$ to $P_1$:
  $
    cgreen(
      abs(L_1 L_2) = abs("comp"_(arrow(v)_1 times arrow(v)_2) arrow(M N))
      = abs((arrow(v)_1 times arrow(v)_2) dot arrow(M N)) / abs(arrow(v)_1 times arrow(v)_2)
    ).
  $
]

#example("Distance between Two Lines")[
  Find the distance between the following two lines, assuming they are skew:

  #h(4fr)
  #h(2fr) $L_1: \ L_2:$ #h(1fr) $x(t) = 1 + t \ x(s) = 2s$ #h(2fr) $y(t) = -2 + 3t \ y(s) = 3 + s$ #h(2fr)
  $z(t) = 4 -t \ z(s) = -3 + 4s$
  #h(4fr)

  #lorange

  The first step is to find the necessary parts needed to define a plane and a point.

  Write out the direction vectors, $arrow(v)_1 = ang(1, 3, -1)$ and $arrow(v)_2 = ang(2, 1, 4)$. The normal vector to
  both planes containing $L_1$ and $L_2$ is:
  $
    arrow(n) = arrow(v)_1 times arrow(v)_2 &= ang(1, 3, -1) times ang(2, 1, 4) \
    &= mat(delim: "|", align: #{ right }, hat(i), hat(j), hat(k); 1, 3, -1; 2, 1, 4)= ang(13, -6, -5).
  $

  We can now define the plane that contains $L_1$ using the normal vector $arrow(n)$ and a point that lies on $L_1$,
  $ang(1, -2, 4)$. Now, find a vector from a point on $L_2$ to a point on $L_1$ (and thus the plane containing it):
  $ arrow(d) = ang(0, 3, -3) - ang(1, -2, 4) = ang(-1, 5, -7) $

  Finally, find the absolute value of the scalar projection of $arrow(d)$ along $arrow(n)$:
  $
    abs(L_1 L_2) = abs("comp"_arrow(n) arrow(d)) = abs(arrow(n) dot arrow(d)) / abs(arrow(n)) = abs(ang(13, -6, -5) dot ang(-1, 5, -7)) / sqrt(13^2 + (-6)^2 + (-5)^2) = cgreen(8/sqrt(230)).
  $
]

==== Extra: Distance from Point to Line
It can be shown that the distance from a point $P$ to a line $L$ with direction vector $arrow(v)$ is
$display(abs(arrow(v) times arrow(P_0P))/abs(arrow(v)))$.

#pagebreak()

== Functions and Surfaces

- A scalar function $f$ of $n$ variables assigns each ordered collection of $n$ real numbers $(x_1, x_2, ..., x_n)$ in a
  domain $D subset.eq RR^n$ to a single real number $f(x_1, x_2,..., x_n)$. \
  #subtext[The range of $f$ can be written in set notation as ${f(x_1, x_2, ..., x_n) | (x_1, x_2,..., x_n) in D}$.]

  - We say a scalar function $f$ of $n$ variables has a mapping $RR^n mapsto RR$.

- Surfaces in $3$-space are represented by functions of two variables, $z = f(x, y)$, where $z$ is a dependent variable
  and $x$ and $y$ are independent variables.

- We can use *traces* to sketch a graph. By finding the curve of intersection between the function and a set of basic
  planes ($x = a$, $y = b$, and/or $z = c$), we can sketch the rough shape of a graph.

  - A *horizontal trace* is a trace along a plane $z = c$.
  - A *vertical trace* is a trace along one of the other basic planes.

- A *contour curve* or a *level curve* at $k$ is the specific horizontal trace at $z = k$.

  - A *contour diagram*, where contour curves of varying values of $k$ are overlaid on top of another, can be an
    alternative way to display a 3D surface in flat contexts.

=== 3D Shapes

- A *cylinder* is defined to be any surface where the cross sectional curve along an axis is constant. In other words,
  it is a surface defined by at most two of the three variables.

  The equation of a cylinder parallel to the $x y$-plane is $z = f(x)$ or $z = g(y)$.

  - An *elliptical cylinder* is a cylinder where the horizontal cross section is an ellipse.
  - A *parabolic cylinder* is a cylinder where the horizontal cross section is a parabola.

- A *quadric surface* is any surface defined by a second degree linear equation of $x$, $y$, or $z$.

  - In other words, it is a surface defined by an equation which only contains terms that are constant multiples of some
    second (or lower) degree combination of $x$, $y$, and $z$ \ (ex. $x^2$, $y^2$, $z^2$, $x y$, $x z$, $y z$). \
    #subtext[General form of a quadric surface: $a x^2 + b y^2 + c y^2 + d x y + e x z + f y z + g x + h y + i z + j$
      where $a...j$ are constants]

  - An *ellipsoid* is a quadric surface where all traces are ellipses. A sphere is an example of an ellipsoid. They take
    the general form $x^2/a^2 + y^2/b^2 + z^2/c^2 = 1$.

  - An *elliptic paraboloid* is a quadric surface where horizontal traces are ellipses, but vertical traces are
    parabolas. They take the form $z/c = x^2/a^2 + y^2/b^2$. \ (Paraboloid opens on $z$-axis because $z$ is the linear
    term)

  - A *hyperbolic paraboloid* is a paraboloid where horizontal traces are hyperbolas. \
    They take the form $z/c = x^2/a^2 - y^2/b^2$.

  - A *hyperboloid* is a quadric surface where horizontal traces are ellipses and vertical traces are hyperbolas.
    Hyperboloids can have either one or two "sheets".

    They take the form $x^2/a^2 + y^2/b^2 - z^2/c^2 = k$, where $k$ can help determine the type of hyperboloid. \
    The hyperboloid will open along the axis whose term in the above equation is negative.

    - A hyperboloid has only one sheet if $k > 0$, and two sheets if $k < 0$.
    - A hyperboloid is a *cone* if $k=0$. The sheets meet at a single point.

== Alternative Coordinate Systems

=== Cylindrical Coordinates

In the *cylindrical coordinate system*, a point in $RR^3$ is represented by a polar coordinate as well as a
$z$-coordinate, represented by $(r, theta, z)$. The conversion between cylindrical and rectangular coordinates is very
similar to how it is done in 2D with polar coordinates:

$
  (x, y, z) -> (r, theta, z): #h(2em) & r^2 = x^2 + y^2 #h(3em) && tan theta = y/x #h(3em) & z = z \
  (r, theta, z) -> (x, y, z): #h(2em) & x = r cos theta #h(3em) && y = r sin theta #h(3em) & z = z
$

- Cylindrical coordinates are convenient to describe surfaces that are symmetrical about an axis.

- Cylindrical coordinates need not be oriented via $z$ (e.g. we could have $(r, theta, x)$)

=== Spherical Coordinates

In the *spherical coordinate system*, a point $P$ in $RR^3$ is described using the radial distance from the point to the
origin and two angles, represented by $(rho, theta, phi)$, where:

- $rho$ is the *radial distance* to the origin, which can be computed as $rho = abs(arrow(P))$.
  - It is important to distinguish this from $r$, the *polar distance*, which is the projection of the radial distance
    to the $x y$-plane: $r = rho sin theta$.
- $theta$ is the *polar angle*, the angle used in polar coordinates, computed when $P$ is projected onto the
  $x y$-plane.
- $phi$ is the *azimuthal angle*, the angle between the $+z$-axis and the line connecting $P$ to the origin.

It should also be noted that the restrictions $rho >= 0, 0 <= theta < 2pi, 0 <= phi < pi$ can be used if we want a set
of unique points.

Again, the line connecting $P$ to the origin with magnitude $rho$ makes an angle $phi$ with the $+z$-axis. We can derive
that $r = rho sin phi$ and $z = rho cos phi$ are the components of this line. This gives us the conversion into
cylindrical coordinates:

$
  (r, theta, z) -> (rho, theta, phi): #h(2em) & rho^2 = r^2 + z^2 #h(3em) && theta = theta #h(3em) & tan phi = r / z \
  (rho, theta, phi) -> (r, theta, z): #h(2em) & r = rho sin phi #h(3em)   && theta = theta #h(3em) & z = rho cos phi
$

We can then substitute into the conversions between cylindrical and rectangular coordinates to get the conversions
between spherical and rectangular coordinates:

$
  (x, y, z) -> (rho, theta, phi): #h(2em) & rho^2 = x^2 + y^2 + z^2 #h(3em) && tan theta = y/x #h(3em) && tan phi = sqrt(x^2 + y^2) / z \
  (rho, theta, phi) -> (x, y, z): #h(2em) & x = rho sin phi cos theta #h(3em) && y = rho sin phi sin theta #h(3em) && z = rho cos phi
$
