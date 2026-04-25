#set text(font: "XITS")
#show math.equation: set text(font: "XITS Math")

#set page("us-letter", header: align(right)[
  Jaysen Tsao \
  CMSC 207 CRN 32950
])

= CMSC 207: Chapter 7 Homework
April 26, 2026 

#stack(
  line(length: 100%, stroke: 1.0pt),
  line(length: 100%, stroke: 1.0pt),
  spacing: 2pt,
)

#show math.equation.where(block: true): eq => {
  block(width: 100%, inset: 0pt, align(center, eq))
}

#set enum(numbering: "1.a.")
/*A function, F: R × R → R × R has been defined as follows: F(x, y) = (3y − 1,
1 − x) for all (x, y) in R × R. Prove that F is a one-to-one correspondence
that is, F is both One-to-one and Onto.*/
+ A function $F: RR times RR -> RR times RR$ is defined as follows:
  $
    F(x, y) = (3y - 1, 1 - x) "for all" (x, y) in RR times RR.
  $
  Prove that $F$ is a one-to-one correspondence, that is, $F$ is both one-to-one and onto.

#line(length: 100%, stroke: 0.5pt)

#set enum(numbering: "a.")

_Proof: $F$ is one-to-one._
#pad(left: 1.33em)[
  Suppose that $F(x_1, y_1) = F(x_2, y_2)$ for some $(x_1, y_1)$ and $(x_2, y_2)$ in $RR^2$.

  Evaluating $F(x_1, y_1)$ gives:
  $
    F(x_1, y_1) = (3y_1 - 1, 1 - x_1).
  $
  Evaluating $F(x_2, y_2)$ gives:
  $
    F(x_2, y_2) = (3y_2 - 1, 1 - x_2).
  $

  Since $F(x_1, y_1) = F(x_2, y_2)$, we have:
  $
    (3y_1 - 1, 1 - x_1) = (3y_2 - 1, 1 - x_2).
  $
  For ordered pairs to be equal, their corresponding components must be equal. Thus:
  $
    3y_1 - 1 = 3y_2 - 1 #h(6em) 1 - x_1 = 1 - x_2.
  $
  Using elementary algebra, we find that $y_1 = y_2$ and $x_1 = x_2$.
  Therefore, $(x_1, y_1) = (x_2, y_2)$. 

  Since $F(x_1, y_1) = F(x_2, y_2)$ implies that $(x_1, y_1) = (x_2, y_2)$, $F$ is one-to-one.
]

_Proof: $F$ is onto._
#pad(left: 1.33em)[
  Let $(a, b)$ be an arbitrary element of $RR^2$. 
  Let $x = 1 - b$ and $y = (a + 1) slash 3$. It is trivial to
  see that $x$ and $y$ remain in $RR^2$.

  Evaluating $F(x, y)$ gives:
  $
    F(x, y) = F(1 - b, (a + 1) / 3) 
    = (3((a + 1) / 3) - 1, 1 - (1 - b)) = (a, b).
  $

  Since $F(x, y) = (a, b)$, we have shown that $(x, y)$ is the preimage of $(a, b)$ under $F$.
  Thus, for any $(a, b) in RR^2$, there exists a preimage $(x, y)$ under $F$.
  Therefore, $F$ is onto.
]

Since $F$ is both one-to-one and onto, $F$ is a one-to-one correspondence. $qed$

#pagebreak()
#set enum(numbering: "1.a.", start: 2)
/*Let S be the set of all even integers, and define a function, f: Z → S as
follows: f(n) = 2n for all integers n. Prove that f is one-to-one and onto.*/
+ Let $S$ be the set of all even integers, and define a function $f: ZZ -> S$ as follows:
  $
    f(n) = 2n "for all integers" n.
  $
  Prove that $f$ is one-to-one and onto.

#line(length: 100%, stroke: 0.5pt)

_Proof: $f$ is one-to-one._
#pad(left: 1.33em)[
  Suppose that $f(n_1) = f(n_2)$ for some $n_1, n_2 in ZZ$. 
  Evaluating $f(n_1)$ and $f(n_2)$ gives:
  $
    f(n_1) = 2n_1 #h(3em) "and" #h(3em) f(n_2) = 2n_2.
  $
  Since $f(n_1) = f(n_2)$, we have $2n_1 = 2n_2$. Using elementary algebra, we find that $n_1 = n_2$.
  Therefore, $f$ is one-to-one. $qed$
]

_Proof: $f$ is onto._
#pad(left: 1.33em)[
  Let $s$ be an arbitrary element of $S$. By the definition of $S$, $s$ is an even number,
  so $s = 2k$ for some integer $k$. Evaluating $f(k)$ gives:
  $
    f(k) = 2k = s.
  $
  Since $f(k) = s$, we have shown that $k$ is the preimage of $s$ under $f$.
  Therefore, $f$ is onto. $qed$
]

