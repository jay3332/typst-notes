#set text(font: "XITS")
#show math.equation: set text(font: "XITS Math")

#set page("us-letter", header: align(right)[
  Jaysen Tsao \
  CMSC 207 CRN 32950
])

= CMSC 207: Chapter 6 Homework
April 13, 2026 

#stack(
  line(length: 100%, stroke: 1.0pt),
  line(length: 100%, stroke: 1.0pt),
  spacing: 2pt,
)

#show math.equation.where(block: true): eq => {
  block(width: 100%, inset: 0pt, align(center, eq))
}

#set enum(numbering: "1.a.")

+ Sets $A$ and $B$ are defined as follows:
  $
    A &= {n in ZZ | n = 8r - 3 "for some integer" r} \
    B &= {m in ZZ | m = 4s + 1 "for some integer" s}.
  $
  + Prove that $A subset.eq B$.
  + Disprove that $B subset.eq A$.

#line(length: 100%, stroke: 0.5pt)

#set enum(numbering: "a.")

+ $A subset.eq B$. _Proof._

  Suppose $x$ is an element of set $A$, so $x = 8r - 3$ for some integer $r$. To prove $A subset.eq B$, we must show that $x$ is also an element of set $B$, so $x = 4s + 1$ for some integer $s$.

  We can rewrite $x$ as follows:
  $
    x = 8r - 3 = 4(2r - 1) + 1.
  $
  If we set $s = 2 r - 1$, then we have $x = 4 s + 1$. $s$ is an integer since $r$ is an integer, and the products and differences of integers are integers. Thus, $x$ is an element of $B$. Since $x$ was an arbitrary element of $A$, we have shown that every element of $A$ is also an element of $B$, so $A subset.eq B$. $qed$

+ $B subset.eq.not A$. _Proof._

  #box(stroke: (left: 1pt), inset: (left: 1em))[
    _Lemma: Parity Theorem for Even Integers._ 
    #pad(x: 1.33em)[
        If $x$ is even, then $x + 1$ is odd. \
        _Proof._ If $x$ is even, then $x = 2k$ for some integer $k$. Then $x + 1 = 2k + 1$, so $x + 1$ is odd.
    ]
  ]

  For the sake of contradiction, suppose $B subset.eq A$. Then for all elements $x in B$, $x in A$.

  Suppose that $s$ is an even integer, which means $s$ is an integer. If we let $x = 4s + 1$, then $x in B$ by satisfying the predicate for $B$.

  Since $x in B$, by the assumption that $B subset.eq A$, we have $x in A$. Thus, there exists some integer $r$ such that $x = 8r - 3$. Equating the expressions for $x$ in terms of $r$ and $s$, we have:
  $
    8r - 3 &= 4s + 1 \
    8r &= 4s + 4 \
    2r &= s + 1.
  $

  Since $s + 1$ can be written as $2r$ for an integer $r$, $s + 1$ is an even integer by the definition of even integers. However, we assumed that $s$ is even. By the Parity Theorem for Even Integers, since $s$ is even, $s + 1$ must be odd.
  
  $s$ cannot be even and odd at the same time. This is a contradiction, so our assumption that $B subset.eq A$ must be false. Thus, $B subset.eq A$ is false. $qed$

#pagebreak()
#set enum(numbering: "1.a.", start: 2)

+ Prove by contradiction that for all sets $A$ and $B$, $(A - B) inter B = emptyset$.

#line(length: 100%, stroke: 0.5pt)

_Proof._

#pad(left: 1.33em)[
Suppose for the sake of contradiction that there exist sets $A$ and $B$
such that $(A - B) inter B != emptyset$. That is, there exists some 
element $x$ such that $x in (A - B) inter B$.

By the definition of intersection, $x in A - B$ and $x in B$.

By the definition of set difference, $x in A$ and $x in.not B$. However, we have 
already assumed that $x in B$, so we arrive at a contradiction. 

Thus, there cannot exist an element $x in A - B$ while also having $x in B$, 
so $(A - B) inter B = emptyset$. $qed$
]