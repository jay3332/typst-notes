#set text(font: "XITS")
#show math.equation: set text(font: "XITS Math")

#set page("us-letter", header: align(right)[
  Jaysen Tsao \
  CMSC 207 CRN 32950
])

= CMSC 207: Chapter 1 Homework
February 2, 2026 

#stack(
  line(length: 100%, stroke: 1.0pt),
  line(length: 100%, stroke: 1.0pt),
  spacing: 2pt,
)

#show math.equation.where(block: true): eq => {
  block(width: 100%, inset: 0pt, align(center, eq))
}

+ The functions $F$ and $G$ from $RR -> RR$ are defined by the following formulas:
  $
    F(x) = (x + 1)(x-3) #h(4em) G(x) = (x - 2)^2 - 7
  $
  Prove that $F != G$.

#line(length: 100%, stroke: 0.5pt)

$F != G$ means $exists x in RR "such that" F(x) != G(x).$ Choose $x = 1 in RR.$ Then:
$
  F(x) & = F(1) = (1 + 1)(1-3) = 2 (-2) & = -4. \
  G(x) & = G(1) = (1 - 2)^2 - 7 = (-1)^2 - 7 = 1 - 7 & = -6.
$

Since $F(1) = -4$ and $G(1) = -6$ and $-4 != -6$, we have $F(1) != G(1)$. Thus, $F != G$. $qed$

#pagebreak()

#set enum(start: 2)
+ The relation $R$ from $RR -> RR$ is defined as follows: 
  $
    "for all" (x, y) in RR times RR, (x, y) in R "iff" x = y^2 + 1. 
  $
  Prove that $(17, -4) in R$.

#line(length: 100%, stroke: 0.5pt)

By the definition of $R$,
$
  (x, y) in R <==> x = y^2 + 1.
$
Substituting $(x, y) = (17, -4) in RR times RR$ we have:
$
  (17, -4) in R <==> 17 &= (-4)^2 + 1 \
    &= 16 + 1 & #h(2em) "by arithmetic of rhs" \
    &= 17.    & #h(2em) "by arithmetic of rhs"
$

Since the $17 = 17$ is a true statement, $(17, -4) in R$ must also be true. $qed$