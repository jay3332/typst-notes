#set text(font: "XITS")
#show math.equation: set text(font: "XITS Math")

#set page("us-letter", header: align(right)[
  Jaysen Tsao \
  CMSC 207 CRN 32950
])

= CMSC 207: Chapter 9 Homework
May 10, 2026 

#stack(
  line(length: 100%, stroke: 1.0pt),
  line(length: 100%, stroke: 1.0pt),
  spacing: 2pt,
)

#show math.equation.where(block: true): eq => {
  block(width: 100%, inset: 0pt, align(center, eq))
}

#set enum(numbering: "1.a.")

+ Prove that for all integers $n$, $k$, and $r$ for $r <= k <= n$ that:
  $
    binom(n, k) dot binom(k, r) = binom(n, r) dot binom(n - r, k - r).
  $

#line(length: 100%, stroke: 0.5pt)

_Proof._
#pad(left: 1.33em)[
  *Lemma 1.* The factorial expansion of $binom(n, r)$ is: <lemma-1>
  $
    binom(n, r) = n!/(r! (n - r)!).
  $

  By #link(<lemma-1>)[Lemma 1], we can rewrite the left-hand side of the equation as follows:
  $
    binom(n, k) dot binom(k, r) 
    &= (n!/(k! (n - k)!)) dot (k!/(r! (k - r)!)) \
    &= (n! k!)/(k! r! (n - k)! (k - r)!) \
    &= n!/(r! (n - k)! (k - r)!).
  $

  By #link(<lemma-1>)[Lemma 1], we can rewrite the right-hand side of the equation as follows:
  $
    binom(n, r) dot binom(n - r, k - r) 
    &= (n!/(r! (n - r)!)) dot ((n - r)!/((k - r)! ((n - r) - (k - r))!)) \
    &= (n! (n - r)!)/(r! (n - r)! (k - r)! ((n - r) - (k - r))!) \
    &= n!/(r! (k - r)! (n - k)!).
  $

  Since multiplication is commutative under $ZZ$, we have:
  $
    n!/(r! (n - k)! (k - r)!) = n!/(r! (k - r)! (n - k)!).
  $
  Thus, the LHS and RHS of the equation are equal, so $display(binom(n, k) dot binom(k, r) = binom(n, r) dot binom(n - r, k - r))$. $qed$
]

#pagebreak()

2. The binomial theorem states that for any numbers $a$ and $b$:
  $
    (a + b)^n = sum_(k = 0)^n binom(n, k) a^(n - k) b^k "for any integer" n >= 0.
  $
  Use this theorem to show that for any integer $n >= 0$:
  $
    sum_(k = 0)^n (-1)^k binom(n, k) 3^(n - k) 2^k = 1.
  $
  #line(length: 100%, stroke: 0.5pt)

_Proof._

#pad(left: 1.33em)[
  By the binomial theorem, we have:
  $
    (3 - 2)^n = sum_(k = 0)^n binom(n, k) 3^(n - k) (-2)^k.
  $
  Since $3 - 2 = 1$, we have:
  $
    1^n = sum_(k = 0)^n binom(n, k) 3^(n - k) (-2)^k.
  $
  Since $1^n = 1$ for all integers $n >= 0$, we have:
  $
    sum_(k = 0)^n binom(n, k) 3^(n - k) (-2)^k = 1.
  $
  Since $(-2)^k = (-1)^k dot 2^k$ for all integers $k >= 0$, we have:
  $
    sum_(k = 0)^n binom(n, k) 3^(n - k) (-1)^k dot 2^k = sum_(k = 0)^n (-1)^k binom(n, k) 3^(n - k) dot 2^k.
  $
  Thus, we have shown that:
  $
    sum_(k = 0)^n (-1)^k binom(n, k) 3^(n - k) 2^k = 1. #h(1em) qed
  $
]