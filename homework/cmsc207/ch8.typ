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

+ Let $S$ be the set of all strings of $0$s and $1$s of length $3$. Define a relation $R$ on $S$ as follows:
  $
    "for all strings" s "and" t in S,
    s thin R thin t <==> "the two left-most characters of" s "and" t "are the same".
  $
  Prove that $R$ is an equivalence relation on $S$.