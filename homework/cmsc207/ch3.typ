#set text(font: "XITS")
#show math.equation: set text(font: "XITS Math")

#set page("us-letter", header: align(right)[
  Jaysen Tsao \
  CMSC 207 CRN 32950
])

= CMSC 207: Chapter 3 Homework
March 9, 2026 

#stack(
  line(length: 100%, stroke: 1.0pt),
  line(length: 100%, stroke: 1.0pt),
  spacing: 2pt,
)

#show math.equation.where(block: true): eq => {
  block(width: 100%, inset: 0pt, align(center, eq))
}

#set enum(numbering: "1.a.")

+ Prove that the following two statements are not logically equivalent. In your proof, completely justify your answer.

  +  A real number is less than 1 only if its reciprocal is greater than 1.

  + Having a reciprocal greater than 1 is a sufficient condition for a real number to be less than 1.

#line(length: 100%, stroke: 0.5pt)

Let $P(x)$ be the statement $x < 1$, and let $Q(x)$ be the statement $display(1/x) > 1$.

Statement (a) can be rewritten as "for any $x$, $P(x) "only if" Q(x)$" which is equivalent to:
$
  forall x, not Q(x) -> not P(x).
$

Statement (b) can be rewritten as "for any $x$, $Q(x) "is sufficient for" P(x)$" which is equivalent to:
$
  forall x, Q(x) -> P(x).
$

The conclusions of each of these conditional statements are inverses of each other, which are not logically equivalent. $qed$

== Alternative Proof

Choose $x = -1 in RR$. Then:
  - $P(x)$ is the statement $-1 < 1$, which is true.
  - $Q(x)$ is the statement $display(1/(-1)) > 1$, which is false since $display(1/(-1)) = -1 < 1$. 

Since there exists an $x in RR$ s.t. $P(x)$ is true but $Q(x)$ is false, the two statements are not logically equivalent. $qed$

#pagebreak()

#set enum(start: 2)
+ Prove that the following is a valid argument:
  $    
    "All real numbers have nonnegative squares." \
    "The number" i "has a negative square." \
    therefore "The number" i "is not a real number."
  $

#line(length: 100%, stroke: 0.5pt)

Let $P(x)$ be the statement "$x$ is a real number", and let $Q(x)$ be the statement "$x^2$ is nonnegative".

The argument can be rewritten as:
$
  forall x, P(x) -> Q(x) & #h(4em) "given" \
  not Q(i) & #h(4em) "given" \
  therefore not P(i) & #h(4em) "by universal modus tollens." qed
$