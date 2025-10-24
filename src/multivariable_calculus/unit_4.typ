#import "/helpers/template.typ": *
#show: set_unit_number.with(4)

= Multivariate Integrals

== Double Integrals

- *Recall:* If we have a function $f(x)$, we can find the area "under the curve" over the interval $[a, b]$ by computing the integral $integral_a^b f(x) dd(x)$.

- Now, imagine that we have a function with two independent variables $f(x, y)$. In a three-dimensional coordinate plane, the function $f$ would describe a surface. 

- A *double integral* can be used to find the _volume_ "under the surface" defined by $f$.

=== Limit Definition of a Double Integral

*Recall:* The limit definition of the definite integral of $f(x)$ from $x=a$ to $x=b$ is: $
  integral_a^b f(x) dd(x) = 
  display(lim_(n -> oo) sum_(k=0)^n f(x_k) Delta x)
$
#align(right)[
  #subtext[where $Delta x = (b-a)/n$ and $x_k = a + k Delta x$]
]

#define("Limit Definition of a Double Integral")[
  $
    integral.double_R f(x, y) dd(A) = lim_(m,n->oo) sum_(i=0)^m sum_(j=0)^n f(x_(i j)^*, y_(i j)^*) Delta A_(i j)
  $
]

== Partial Integration

== Interpretations of Double Integrals

=== Double Integrals over General Regions

=== Double Integrals in Polar Coordinates

== Applications of Double Integrals

=== Surface Area

== Triple Integrals

== Interpretations of Triple Integrals

=== Triple Integrals in Cylindrical Coordinates

=== Triple Integrals in Spherical Coordinates

== The Jacobian