#set text(font: "XITS")
#show math.equation: set text(font: "XITS Math")

#set page("us-letter", header: align(right)[
  Jaysen Tsao \
  CMSC 207 CRN 32950
])

= CMSC 207: Chapter 5 Homework
April 5, 2026 

#stack(
  line(length: 100%, stroke: 1.0pt),
  line(length: 100%, stroke: 1.0pt),
  spacing: 2pt,
)

#show math.equation.where(block: true): eq => {
  block(width: 100%, inset: 0pt, align(center, eq))
}

#set enum(numbering: "1.a.")

+ Use Mathematical Induction to prove that for all integers $n >= 3$,
  $
    2 dot 3 + 3 dot 4 + ... + (n-1) dot n = ((n - 2)(n^2 + 2n + 3))/3.
  $

#line(length: 100%, stroke: 0.5pt)

Let $P(n)$ be the statement: $
  2 dot 3 + 3 dot 4 + ... + (n-1) dot n = ((n - 2)(n^2 + 2n + 3))/3.
$

*Base case:* Let $n = 3$. Then:
$
  2 dot 3 &= ((3 - 2)(3^2 + 2(3) + 3))/3 \
        6 &= (1(9 + 6 + 3))/3 \
        6 &= (1(18))/3 \
        6 &= 6.
$
Since the left hand side equals the right hand side, $P(3)$ is true.

*Inductive hypothesis:* Assume $P(k)$ is true for some integer $k >= 3$. That is, assume:
$
  2 dot 3 + 3 dot 4 + ... + (k-1) dot k = ((k - 2)(k^2 + 2k + 3))/3.
$

*Inductive step:* We want to show that $P(k + 1)$ is true, i.e. we want to show:
$
  2 dot 3 + 3 dot 4 + ... + (k-1) dot k + k dot (k + 1) = (((k + 1) - 2)((k + 1)^2 + 2(k + 1) + 3))/3.
$

Starting with the left hand side of $P(k + 1)$, we can use the inductive hypothesis to rewrite it as:
$
  2 dot 3 + 3 dot 4 + ... + (k-1) dot k + k dot (k + 1) & = ((k - 2)(k^2 + 2k + 3))/3 + k dot (k + 1) \
  & = ((k - 2)(k^2 + 2k + 3))/3 + (3k(k + 1))/3 \
  & = (((k - 2)(k^2 + 2k + 3)) + (3k(k + 1)))/3.
$

Expanding the numerator, we have:
$
  ((k - 2)(k^2 + 2k + 3)) + (3k(k + 1)) & = (k^3 + 2k^2 + 3k) - (2k^2 + 4k + 6) + (3k^2 + 3k) \
  & = k^3 + 3k^2 + 2k - 6.
$

Thus, the left hand side of $P(k + 1)$ can be rewritten as:
$
  2 dot 3 + 3 dot 4 + ... + (k-1) dot k + k dot (k + 1) & = (k^3 + 3k^2 + 2k - 6)/3.
$

Now, we can simplify the right hand side of $P(k + 1)$:
$
(((k + 1) - 2)((k + 1)^2 + 2(k + 1) + 3))/3 & = ((k - 1)(k^2 + 4k + 6))/3 \
  & = (k^3 + 3k^2 + 2k - 6)/3.
$

Since the left hand side and right hand side of $P(k + 1)$ are equal, $P(k + 1)$ is true. 

Since assuming the truth of $P(k)$ for some integer $k >= 3$ leads to the truth of $P(k + 1)$, $P(n)$ is true for all integers $n >= 3$ by mathematical induction. $qed$

#pagebreak()

#set enum(start: 2)
+ Use Mathematical Induction to prove that for all integers $n >= 5$,
  $
    1 + 4n < 2^n.
  $

#line(length: 100%, stroke: 0.5pt)

Let $P(n)$ be the statement: $
  1 + 4n < 2^n.
$

*Base case:* Let $n = 5$. Then the inequality can be rewritten as:
$
  1 + 4(5) & < 2^5 \
  21 & < 32.
$
Since $21 < 32$, $P(5)$ is true.

*Inductive hypothesis:* Assume $P(k)$ is true for some integer $k >= 5$. That is, assume:
$  1 + 4k < 2^k. $

*Inductive step:* We want to show that $P(k + 1)$ is true, i.e. we want to show:
$
  1 + 4(k + 1) < 2^(k + 1).
$
Starting from the inductive hypothesis:
$
  1 + 4k &< 2^k & #h(2em) "assumed by inductive hypothesis"\
  1 + 4k + 4 &< 2^k + 4 & #h(2em) "by adding" 4 "to both sides" \
  1 + 4(k + 1) &< 2^k + 4 & #h(2em) "by algebra of lhs" \
  1 + 4(k + 1) &< 2^k + 2^k & #h(2em) "since" 4 < 2^k "for all" k >= 5 \
  1 + 4(k + 1) &< 2^(k + 1) & #h(2em) "by algebra of rhs"
$
Since assuming the truth of $P(k)$ for $k >= 5$ leads to the truth of $P(k + 1)$, $P(n)$ is true for all integers $n >= 5$ by mathematical induction. $qed$