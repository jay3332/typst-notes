#import "/helpers/template.typ": *
#show: set_unit_number.with(4)

= Multivariate Integrals

== Double Integrals

- *Recall:* If we have a function $f(x)$, we can find the area "under the curve" over the interval $[a, b]$ by computing the integral $integral_a^b f(x) dd(x)$.

- A *double integral* can be used to find the _volume_ "under the surface" defined by $z = f(x, y)$.

=== Riemann Sums to Approximate a Double Integral

*Recall:* The _Riemann sum_ used to approximate the area under $f(x)$ from $x=a$ to $x=b$ is:
$
  A approx sum_(k=0)^n f(x_k) Delta x
$
where $Delta x = (b-a)/n$, the width of each subinterval, and $x_k$ is a "sample point" in the $k^"th"$ subinterval.

#derivation("Riemann Sum for Two Variables")[
  + *Define a region and partition*
    
    Let $R$ be a rectangular region in the $x y$-plane defined by $R = [a, b] times [c, d]$. We can partition $R$ into $m$ subintervals along the $x$-axis and $n$ subintervals along the $y$-axis, creating a grid of rectangles. 

    If we use equal subintervals, we can call $Delta x = (b - a)/m$ and $Delta y = (d - c)/n$.

  + *Define sample points*
    
    For each subrectangle, we can choose a sample point $(x_i, y_j)$ within that subrectangle. 
    Then the approximate height to the surface is given by $z_(i j) = f(x_i, y_j)$.

    For example, we could choose the sample point to be the lower-left corner of each subrectangle, meaning
      $x_i = a + i Delta x$ and $y_j = c + j Delta y$.

  + *Define volume of each box*

    The area of each subrectangle is given by $Delta A = Delta x Delta y$.

    The volume of the box approximating the volume under the surface over each subrectangle is thus 
    $f(x_i, y_j) Delta A = f(x_i, y_j) Delta x Delta y$. 

  + *Definition of Riemann sum*

   The *Riemann sum* approximating the volume under the surface over the region $R$ is given by summing the volumes of all the boxes:
    $
      V approx sum_(i=0)^m sum_(j=0)^n f(x_i, y_j) Delta A = sum_(i=0)^m sum_(j=0)^n f(x_i, y_j) Delta x Delta y.
    $
]

The definite integral of $f(x)$ from $x=a$ to $x=b$ (the actual area) is when $n -> oo$: $
  integral_a^b f(x) dd(x) = 
  display(lim_(n -> oo) sum_(k=0)^n f(x_k) Delta x).
$


#define("Limit Definition of a Double Integral")[
  The double integral of $f(x, y)$ over the rectangular region $R = [a, b] times [c, d]$ is defined as:
  $
    integral.double_R f(x, y) dd(A) = 
    display(lim_(m, n -> oo) sum_(i=0)^m sum_(j=0)^n f(x_i, y_j) Delta A)
  $
  where $Delta A = Delta x Delta y$ is the area of each subrectangle, and $(x_i, y_j)$ is a sample point in each subrectangle.

  It is simply when we take infinitely many partitions using the Riemann sum. 
]

#example("Riemann Sum for Volume")[
  Use a Riemann Sum to approximate the volume under the surface $z = 9x e^(-x y)$ over the rectangular region $R = [0, 2] times [0, 1]$ using 2 subintervals in each direction and choosing the sample points to be the upper-right corners of each subrectangle.

  #lorange

  The upper-right corners of each subrectangle are given by:
  - For $i=1, j=1$: $(x_1, y_1) = (1, 0.5)$
  - For $i=1, j=2$: $(x_1, y_2) = (1, 1)$
  - For $i=2, j=1$: $(x_2, y_1) = (2, 0.5)$
  - For $i=2, j=2$: $(x_2, y_2) = (2, 1)$
  
]

== Iterative Integration

#define("Fubini's Theorem")[
  If $f(x, y)$ is continuous on the rectangle $R = [a, b] times [c, d]$, then the double integral of $f$ over $R$ can be computed as an iterated integral in either order:
  $
    integral.double_R f(x, y) dd(A) = 
    integral_a^b integral_c^d f(x, y) dd(y) dd(x) = 
    integral_c^d integral_a^b f(x, y) dd(x) dd(y)
  $


  Similarly, if we can write $f(x, y)$ as a product of functions of $x$ and $y$, then we can separate the double integral:
  $
    integral_a^b integral_c^d g(x) h(y) dd(y) dd(x) =
    integral_a^b g(x) dd(x) integral_c^d h(y) dd(y).
  $
]

=== Partial Integration

- The indefinite integral of a function with multiple variables can be computed by integrating with respect to one variable at a time, treating the other variables as constants. This is known as *partial integration*.

- For example, to compute the partial integral of $f(x, y)$ with respect to $x$:
  $
    integral f(x, y) dd(x) = F(x, y) + C(y)
  $
  where $C(y)$ is an arbitrary function of $y$.
- Similarly, to compute the partial integral of $f(x, y)$ with respect to $y$:
  $
    integral f(x, y) dd(y) = G(x, y) + D(x)
  $
  where $D(x)$ is an arbitrary function of $x$.

== Double Integrals as Volume

=== Double Integrals over Rectangular Regions

- The volume under the surface $z = f(x, y)$ over a rectangular region $R = [a, b] times [c, d]$ is given by the double integral:
  $
    V = integral_R f(x, y) dd(A) = integral_a^b integral_c^d f(x, y) dd(y) dd(x)
  $

=== Double Integrals over General Regions


=== Double Integrals in Polar Coordinates

== Applications of Double Integrals

=== Surface Area

== Triple Integrals

== Interpretations of Triple Integrals

=== Triple Integrals in Cylindrical Coordinates

=== Triple Integrals in Spherical Coordinates

== The Jacobian