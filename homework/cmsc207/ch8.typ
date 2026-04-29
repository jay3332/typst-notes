#set text(font: "XITS")
#show math.equation: set text(font: "XITS Math")

#set page("us-letter", header: align(right)[
  Jaysen Tsao \
  CMSC 207 CRN 32950
])

= CMSC 207: Chapter 8 Homework
May 3, 2026 

#stack(
  line(length: 100%, stroke: 1.0pt),
  line(length: 100%, stroke: 1.0pt),
  spacing: 2pt,
)

#show math.equation.where(block: true): eq => {
  block(width: 100%, inset: 0pt, align(center, eq))
}

#set enum(numbering: "1.a.")

+ Let $R$ be a relation defined on the set of all integers $ZZ$ as follows:
  $
    "for all integers" m "and" "n",
    m thin R thin n <==> 5 | (m - n).
  $
  Prove that $R$ is an equivalence relation on $ZZ$.

#line(length: 100%, stroke: 0.5pt)


Let $m$, $n$, and $p$ be arbitrary integers.

_Proof: $R$ is reflexive._
#pad(left: 1.33em)[
  Since $5 | (m - m)$ is equivalent to the statement $5 | 0$, which is true, $m thin R thin m$, so $R$ is reflexive.  
]

_Proof: $R$ is symmetric._
#pad(left: 1.33em)[
  Suppose $m thin R thin n$. By the definition of $R$, we have $5 | (m - n)$. This means that there exists some integer $k$ such that $m - n = 5k$. By elementary algebra: 
  $
    m - n = 5k -> n - m = 5(-k).
  $
  Since $-k$ is an integer, by the definition of divisibility, $5 | (n - m)$. By the definition of $R$, we have $n thin R thin m$. Therefore, $R$ is symmetric.
]

_Proof: $R$ is transitive._
#pad(left: 1.33em)[
  Suppose $m thin R thin n$ and $n thin R thin p$. By the definition of $R$, we have $5 | (m - n)$ and $5 | (n - p)$. This means that there exist some integers $k_1$ and $k_2$ such that $m - n = 5k_1$ and $n - p = 5k_2$. By elementary algebra:
  $ 
    m - n &= 5k_1 -> m = n + 5k_1. \
    n - p &= 5k_2 -> n = p + 5k_2.
  $
  Substituting the second equation into the first gives:
  $
    m = (p + 5k_2) + 5k_1 &= p + 5(k_1 + k_2). \
    m - p &= 5(k_1 + k_2).
  $
  Since $k_1 + k_2$ is an integer, by the definition of divisibility, $5 | (m - p)$. By the definition of $R$, we have $m thin R thin p$. Therefore, $R$ is transitive.
]

Since $R$ is reflexive, symmetric, and transitive, $R$ is an equivalence relation on $ZZ$. $qed$

#pagebreak()

2. Let $S$ be the set of all strings of $0$s and $1$s of length $3$. Define a relation $R$ on $S$ as follows:
  $
    "for all strings" s "and" t in S,
    s thin R thin t <==> "the two left-most characters of" s "and" t "are the same".
  $
  Prove that $R$ is an equivalence relation on $S$.

#line(length: 100%, stroke: 0.5pt)

$S$ can be expanded as follows:
$
  S = {000, 001, 010, 011, 100, 101, 110, 111}.
$

By the definition of $R$, we can partition $S$ into the following equivalence classes:
$
  [000] &= {000, 001}. \
  [010] &= {010, 011}. \
  [100] &= {100, 101}. \
  [110] &= {110, 111}.
$

Let $s$, $t$, and $u$ be arbitrary strings in $S$.

_Proof: $R$ is reflexive._
#pad(left: 1.33em)[
  Since the two left-most characters of $s$ are the same as themselves, $s thin R thin s$, so $R$ is reflexive.  
]

