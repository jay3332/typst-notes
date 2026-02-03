#import "../helpers/template.typ": *
#import "@preview/cetz:0.4.2"

#show: template.with(title: "Discrete Mathematics", font: "times")

= Speaking Mathematically

== Introduction to Variables

- A *variable* is a placeholder used to represent an unknown or arbitrary value.

- Variables can be introduced to reduce repetition or clarify relationships between quantities.
  
  For example, instead of asking:
  #box(inset: (x: 1em))[_is there a number where doubling it and adding 3 gives us the same result as squaring it?_] \
  we can introduce a variable $x$ and ask: \
  #box(inset: (x: 1em))[_is there a number $x$ such that $2x + 3 = x^2$?_]

- A variable in the context of computers represent a named storage location (e.g. a memory address) that holds a value. 

=== Types of Mathematical Statements

- A *universal statement* makes a claim about all elements of particular nature. It is often expressed using phrases like "for all" or "for every."

  For example, "*for all* integers $n$, $n + 0 = n$" is a universal statement.

- A *conditional statement* asserts that if one statement, called the *hypothesis*, is true, then another statement,
  called the *conclusion*, is also true. It is often expressed in the form "if...then..."

  For example, "*if* $n$ is an even integer, *then* $n^2$ is also even" is a conditional statement.

- An *existential statement* claims that there is at least one thing that satisfies a certain property.
  It is often expressed using phrases like "there exists" or "there is at least one."

  For example, "*there exists* an integer $n$ such that $n^2 = 4$" is an existential statement.

==== Universal Conditional Statements

- A *universal conditional statement* combines both a universal statement (which generalizes over many things)
  and a conditional statement (which specifies a condition for the generalization), applying the claim
  only to elements "in the set" that meet the condition.

  - This allows us to specify the condition under the assumption that the element has "satisfied" the universal statement check. For example, if we say "for all integers ...," our check will only consider integers.

- These statements are often expressed in the form "for all...if...then..."

  For example, "*for all* integers $n$, *if* $n$ is even, *then* $n^2$ is also even" is a universal conditional statement.

==== Universal Existential Statements

- A *universal existential statement* combines both a universal statement (which generalizes over many things)
  and an existential statement (which asserts the existence of at least one thing), stating that out of everything which may satisfy the universal condition, there is at least one that meets the existential claim.

- These statements are often expressed in the form "for all...there exists..."

  For example, "*for all* integers $n$, *there exists* an integer $m$ such that $m = n + 1$" is a universal existential statement.

==== Existential Universal Statements

- An *existential universal statement* combines both an existential statement (which asserts the existence of at least one thing)
  and a universal statement (which generalizes over many things), stating that there is at least one thing such that for all elements of a certain nature, a claim holds true.

- These statements are often expressed in the form "there exists...for all..."

  For example, "*there exists* an integer $k$ such that *for all* integers $n$, $n + k = n$" is an existential universal statement.

#resource("Types of Mathematical Statements", [
  - Universal Statement: _for all ..._ ($forall ...$)
  - Conditional Statement: _if ... then ..._ ($... => ...$)
  - Existential Statement: _there exists ..._ ($exists ...$)
  - Universal Conditional Statement: _for all ... if ... then ..._ ($forall ..., ... => ...$)
  - Universal Existential Statement: _for all ... there exists ..._ ($forall ..., exists ...$)
  - Existential Universal Statement: _there exists ... for all ..._ ($exists ..., forall ...$)
])

#pagebreak()

== Introduction to Sets

- A *set* is a well-defined collection of _distinct_ objects.
  - The objects in a set are called *elements* or *members* of the set.

- The notation $x in S$ indicates that $x$ is an element of the set $S$.
  - Similarly, $x in.not S$ indicates that $x$ is _not_ an element of the set $S$.

- *Axiom of Extension*: a set is defined solely by its elements, and the order or repetition of those elements does not matter.
  - For example, the sets $\{1, 2, 3\}$, $\{3, 2, 1\}$, and $\{1, 2, 2, 3\}$ are all considered the same set.

- The *cardinality* of a set is the number of elements in the set, denoted by $|A|$ for a set $A$.

=== Describing Sets

- *Set-roster notation* is a way to specify a set by explicitly listing its elements between curly braces.

  - For example, the set of primary colors can be represented as $C = {"red", "blue", "yellow"}$.


  - Ellipses ($...$) can be used to indicate:
    - a continuing pattern, such as in ${1, 2, 3, ..., 100}$
    - an infinite set, such as in ${1, 2, 3, ...}$ or ${..., -2, -1, 0, 1, 2, ...}$

- *Set-builder notation* is a way to specify a set using a condition that its elements satisfy.
  - This notation takes the form: $A = {x in S | P(x)}$ where:
    - $x$ is a variable we introduce to represent an arbitrary element of $S$
    - $S$ is a larger set from which we are selecting elements
    - $P(x)$ is the condition that elements must satisfy to be included in set $A$
  - In English, set $A$ is _the set of elements $x$ in $S$ such that $P(x)$ holds true._

  - For example, the set of real numbers between $1$ and $3$ (inclusive) can be represented as \
    $A = {x in RR | 1 <= x <= 3}$.

- Common numeric sets are given special symbols:
  - The set of natural numbers, $NN = {1, 2, 3, ...}$ (may or may not include $0$)
  - The set of integers, $ZZ = {..., -2, -1, 0, 1, 2, ...}$
  - The set of rational numbers, $QQ$
  - The set of real numbers, $RR$
  #subtext[
    We can also add superscripts to further narrow these sets, for example:
    - $RR^+$ denotes the set of positive real numbers.
    - $ZZ^-$ denotes the set of negative integers.
    - $RR^"nonneg"$ denotes the set of non-negative real numbers.
  ]

- The *empty set* is also given a special symbol: $emptyset = {}$.

=== Relations Between Sets

- The relation between sets is described using _subsets_ and _supersets_.
  - A set $A$ is a *subset* of set $B$, denoted $A subset.eq B$, if for every element $x in A$, $x in B$.
    - $A$ is a *proper subset* of $B$, denoted $A subset B$, if $A subset.eq B$ _and_ there exists a $y in B$ such that $y in.not A$

  - A set $B$ is a superset of set $A$, denoted $B supset.eq A$, if $A subset.eq B$.
    - $B$ is a *proper superset* of $A$, denoted $B supset A$, if $A subset B$.

#define("Subset")[
  A set $A$ is a *subset* of set $B$, denoted by $A subset.eq B$, if every element of $A$ is also an element of $B$:
  $
    (forall x in A, x in B) <==> A subset.eq B.
  $
  $A$ is a *proper subset* of $B$, denoted by $A subset B$, if $A subset.eq B$ and there exists at least one element in $B$ that is not in $A$:
  $
    (A subset.eq B) and (exists y in B "s.t." y in.not A) <==> A subset B.
  $
]

- We can also say $A subset.eq.not B$ to indicate that $A$ is _not_ a subset of $B$.
  - This means there exists at least one element in $A$ that does not belong to $B$.

=== Cartesian Products

- The *Cartesian product* of two sets $A$ and $B$, denoted by $A times B$, is the set of all ordered pairs $(a, b)$ where $a in A$ and $b in B$.
  - Formally, $A times B = {(a, b) | a in A and b in B}$.
  - For example, if $A = {1, 2}$ and $B = {x, y}$, then $A times B = {(1, x), (1, y), (2, x), (2, y)}$.
  - The cardinality of the Cartesian product is $|A times B| = |A| |B|$.
 
- An *ordered $n$-tuple* is a sequence of $n$ elements treated as a distinct object, denoted by $(a_1, a_2, ..., a_n)$, where the order and count of elements matters.

  - The Cartesian product can be extended to multiple sets, such as $A_1 times A_2 times ... times A_n$, resulting in ordered $n$-tuples.
    - Formally, $A_1 times A_2 times ... times A_n = {(a_1, a_2, ..., a_n) | a_i in A_i "for each" i = 1, 2, ..., n}$.
    - The cardinality of this Cartesian product is $|A_1 times A_2 times ... times A_n| = |A_1| |A_2| ... |A_n|$.

  - Two $n$-tuples $(a_1, a_2, ..., a_n)$ and $(b_1, b_2, ..., b_n)$ are considered equal if and only if $a_i = b_i$ for all $i$ from $1$ to $n$.

- Cartesian products are neither commutative nor associative. That is, if $A$, $B$, and $C$ are sets, then:
  - $A times B != B times A$ (since pairs are ordered)
  - $A times B times C != (A times B) times C != A times (B times C)$ (since the grouping affects the structure of the tuples)

=== Strings

- In mathematics, a *string* is a finite sequence of symbols from a given set called an *alphabet*.
  - The set of all strings that can be formed from an alphabet $A$ is denoted by $A^*$.

- The *length* of a string is the number of symbols it contains.
  - The set of all strings of length $n$ from an alphabet $A$ is denoted by $A^n$.
  - The cardinality of the set of all strings of length $n$ from an alphabet $A$ is $|A^n| = |A|^n$.

#define("Fixed-Length Strings")[
  A *string* wrapped over $A$ of length $n$ is an ordered sequence of $n$ elements from the *alphabet* $A$.
  The set of all strings of length $n$ that can be formed from the alphabet $A$ is denoted by:
  $
    A^n = underbrace(A times A times ... times A, n "times").
  $
]

- For example, $RR^2 = RR times RR$ can be interpreted as the set of all strings of length $2$ from the alphabet $RR$.

- *Null strings* or *empty strings* are strings of length $0$, denoted by $epsilon$ (in the textbook it's $lambda$)
  - The set of all null strings over any alphabet $A$ is $A^0 = {epsilon}$.

- *Bit strings* wrap over the alphabet ${0, 1}$.

#pagebreak()

== Introduction to Relations & Functions

#define("Set Relations")[
  A *relation* $R$ from set $A$ to set $B$ is a subset of the Cartesian product $A times B$:
  $
    R subset.eq A times B.
  $
  If $(a, b) in R$, we say that "$a$ is related to $b$ by $R$," denoted by $a space R space b$. \
  If $(a, b) in.not R$, we say that "$a$ is _not_ related to $b$ by $R$," denoted by $a space cancel(R) space b$.
]

For example, if we define a relation $C$ from $RR$ to $RR$ as follows:
$
  C = {(x, y) in RR^2 | y = x^2}
$



== Introduction to Graphs

- A *graph* $G$ is specified using two sets $V$ and $E$ where:
  - $V$ is a non-empty set of *vertices*
  - $E$ is a set of *edges*, where each edge is a pair of vertices from $V$
    - Edges can be unordered (as in a set ${u, v}$), as in an *undirected graph*
    - Edges can be ordered (as in a tuple $(u, v)$), as in a *directed graph*

- Formally, $G = (V, E)$ where $E subset.eq {{u, v} | u in V, v in V}$.