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

+ 

+ 

#pagebreak()
#set enum(numbering: "1.a.", start: 2)

+ Prove by contradiction that for all sets $A$ and $B$, $(A - B) inter B = emptyset$.

#line(length: 100%, stroke: 0.5pt)