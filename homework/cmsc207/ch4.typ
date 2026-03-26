#set text(font: "XITS")
#show math.equation: set text(font: "XITS Math")

#set page("us-letter", header: align(right)[
  Jaysen Tsao \
  CMSC 207 CRN 32950
])

= CMSC 207: Chapter 4 Homework
March 30, 2026 

#stack(
  line(length: 100%, stroke: 1.0pt),
  line(length: 100%, stroke: 1.0pt),
  spacing: 2pt,
)

#show math.equation.where(block: true): eq => {
  block(width: 100%, inset: 0pt, align(center, eq))
}

#set enum(numbering: "1.a.")

+ Disprove the following statement. Then write the negation of the following statement, and prove that the negation of the statement is true.

  $
    forall "integers" m "and" n, "if" 2m + n "is odd then" m "and" n "are both odd."
  $

#line(length: 100%, stroke: 0.5pt)

_Counterexample:_

#box(inset: (x: 4em / 3))[
  Choose integers $m = 0$ and $n = 1$. Then:
  $
    2m + n &= 2(0) + 1 && #h(2em) "by substitution" \
           &= 1        && #h(2em) "by arithmetic of rhs"
  $

  $m = 0$ is an even integer since it can be represented in the form $2k$ for some integer $k$. \
  $1$ is an odd integer since it can be represented in the form $2k + 1$ for some integer $k$.
  
  Thus, we have found integers $m$ and $n$ such that $2m + n$ is odd but $m$ is not odd. Therefore, by counterexample, the statement is false. $qed$
]

== Negation

$
  exists "integers" m "and" n "such that" 2m + n "is odd and" (m "is even or" n "is even").
$

_Proof:_

#box(inset: (x: 4em / 3))[
  Choose integers $m = 0$ and $n = 1$. Then $2m + n = 1$.

  $m = 0$ is an even integer since it can be represented in the form $2k$ for some integer $k$. \
  $1$ is an odd integer since it can be represented in the form $2k + 1$ for some integer $k$.
  
  Thus, we have found integers $m$ and $n$ such that $2m + n$ is odd and $m$ is even. Therefore, the negation of the statement is true. $qed$
]

#pagebreak()

#set enum(start: 2)
+ Prove that the following statement is false: 

  $ "The product of any two irrational numbers is irrational." $

#line(length: 100%, stroke: 0.5pt)

_Counterexample:_

#box(inset: (x: 4em / 3))[
  It is known that $sqrt(2)$ is irrational. Consider the product of $sqrt(2)$ with itself:
  $
    sqrt(2) sqrt(2) = 2.
  $
  Since $2$ is a rational number, we have found two irrational numbers whose product is rational. Therefore, the statement is false. $qed$
]