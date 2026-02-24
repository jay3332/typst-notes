#set text(font: "XITS")
#show math.equation: set text(font: "XITS Math")

#set page("us-letter", header: align(right)[
  Jaysen Tsao \
  CMSC 207 CRN 32950
])

= CMSC 207: Chapter 2 Homework
March 2, 2026 

#stack(
  line(length: 100%, stroke: 1.0pt),
  line(length: 100%, stroke: 1.0pt),
  spacing: 2pt,
)

#show math.equation.where(block: true): eq => {
  block(width: 100%, inset: 0pt, align(center, eq))
}

+ Given the following premises:
  $
    p \
    (p or r) -> s \
    not s or q
  $
  Prove $q$.

#line(length: 100%, stroke: 0.5pt)

$
  p & #h(4em) "given" \
  p or r & #h(4em) "by generalization" \
  s & #h(4em) "by modus ponens" \
  not s or q & #h(4em) "given" \
  q & #h(4em) "by elimination." qed
$

#pagebreak()

#set enum(start: 2)
+ Given the following premises:
  $
    not p or s \
    s -> not r \
    r or q
  $
  Prove $p -> q$ using a conditional world proof. 

#line(length: 100%, stroke: 0.5pt)

$ "Assume" p. $
$
  not p or s & #h(4em) "given" \
  s & #h(4em) "by elimination" \
  not r & #h(4em) "by modus ponens" \
  r or q & #h(4em) "given" \
  q & #h(4em) "by elimination".
$
$
  "Thus", p -> q "by conditional proof." qed
$