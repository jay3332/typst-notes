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

+ The binomial theorem states that for any numbers $a$ and $b$:
  $
    (a + b)^n = sum_(k = 0)^n binom(n, k) a^(n - k) b^k "for any integer" n >= 0.
  $
  Use this theorem to show that for any integer $n >= 0$:
  $
    sum_(k = 0)^n (-1)^k binom(n, k) 3^(n - k) 2^k = 1.
  $
