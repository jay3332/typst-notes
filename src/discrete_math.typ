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
  - Existential Universal Statement: _there exists ... such that for all ..._ ($exists ... "s.t." forall ...$)
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
  We call $A$ the *domain* of the relation and $B$ the *codomain* of the relation.
  
  - If $(a, b) in R$, we say that "$a$ is related to $b$ by $R$," denoted by $a space R space b$. \
  - If $(a, b) in.not R$, we say that "$a$ is _not_ related to $b$ by $R$," denoted by $a space cancel(R) space b$.
]

==== Arrow Diagrams

We can represent relations using *arrow diagrams*, where elements of the domain and codomain are represented as points, and an arrow drawn from a point $A$ to a point $B$ indicates that $(A, B) in R$.

=== Functions

- A *function* $f$ from $A$ to $B$ is a relation that associates each element of $A$ with _exactly one_ element of $B$. We can denote this relation as $f: A -> B$.
  - The set $A$ is called the *domain* of the function.
  - The set $B$ is called the *codomain* of the function.
  - The elements in $B$ that are associated with elements in $A$ is called the *range* of the function.

- If $(x, y) in f$, then we can denote this relationship as $f(x) = y$.

#define("Function")[
  A *function* $f$ from the *domain* $A$ to the *codomain* $B$ is a relation from $A$ to $B$ such that:
  + $forall x in A, exists y in B "s.t." (x, y) in f$ (completeness)
  + $forall x in A, forall y_1, y_2 in B, {(x, y_1), (x, y_2)} subset.eq f ==> y_1 = y_2$ (uniqueness)
]

- Two functions $f$ and $g$ from $A$ to $B$ are equal, denoted by $f = g$, if and only if for every element $x in A$, $f(x) = g(x)$.

=== Injections, Surjections, and Bijections
- A function is *one-to-one* or *injective* if different elements in the domain map to different elements in the codomain (no two inputs share the same output)
  - Formally, $f$ is injective if $forall x_1, x_2 in A, f(x_1) = f(x_2) ==> x_1 = x_2$.
  
- A function is *onto* or *surjective* if every element in the codomain is the image of at least one element in the domain (all outputs are covered)
  - Formally, $f$ is surjective if $forall y in B, exists x in A "s.t." f(x) = y$.

- A function is *bijective* if it is both one-to-one and onto.
  - Bijective functions have inverses that are also functions.

#pagebreak()

== Introduction to Graphs

- A *graph* $G$ is specified using two sets $V$ and $E$ where:
  - $V$ is a non-empty set of *vertices*
  - $E$ is a set of *edges*, where each edge is a pair of vertices from $V$
    - Edges can be unordered (as in a set ${u, v}$), as in an *undirected graph*
    - Edges can be ordered (as in a tuple $(u, v)$), as in a *directed graph* or *digraph*

- Each edge is associated with either one or two vertices $in V$ called its *endpoints*.
  - If an edge $e$ has endpoints ${u, v}$, then the *edge-endpoint function* maps $e$ to ${u, v}$.
  - An edge with just one endpoint is called a *loop*.
  - Two edges with the same endpoints are called *parallel edges*.
  - Two vertices connected by an edge are called *adjacent vertices*.

- Two edges that share a common endpoint are called *adjacent edges*.
  - An edge is *incident* to its endpoints, and a vertex is *incident* to its edges.

- The *degree* of a vertex $v$, denoted by $deg(v)$, is the number of edges incident to $v$, with loops counted twice.
  - A vertex with no incident edges (i.e., $deg(v) = 0$) is called an *isolated vertex*. 

/*
Walk: Any sequence of vertices and edges; both can repeat.
Trail: A walk with no repeated edges. Vertices can repeat.
Circuit: A closed trail (starts/ends at same vertex) with no repeated edges.
Closed Walk: A walk that starts and ends at the same vertex.
Path: A walk with no repeated vertices (implies no repeated edges).
Simple Circuit (Cycle): A path that starts and ends at the same vertex, with no other vertices repeated. 
*/




#pagebreak()

= Logic with Statements

== Logical Form & Equivalence

- An *argument* is a sequence of statements where the last statement is called the *conclusion* and the preceding statements are called *premises*.
  - An argument is *valid* if the conclusion logically follows from the premises, meaning that if the premises are true, then the conclusion must also be true.
  - An argument is *invalid* if the conclusion does not logically follow from the premises.

- A *statement* or *proposition* is a declarative sentence that is either true or false, but not both.

- A *tautology* ($bf(t)$) is a statement that is _always_ true. It is logically equivalent to the statement "true."
  - For example, the statement "$P$ or not $P$" is a tautology.

- A *contradiction* ($bf(c)$) is a statement that is _always_ false. It is logically equivalent to the statement "false."
  - For example, the statement "$P$ and not $P$" is a contradiction. 

- Two statements are *logically equivalent* if they have the same truth value in every possible scenario.
  - We denote logical equivalence between a statement $P$ and another statement $Q$ by writing $P equiv Q$. 

=== Compound Statements

- A *compound statement* is a statement formed by combining one or more statements using logical connectives such as "and," "or," and "not."

- The following are common logical connectives (in the order they should be applied):
  - *Negation* ($not P$): the opposite truth value of statement $P$.
  - *Conjunction* ($P and Q$): true if both $P$ and $Q$ are true; false otherwise.
  - *Disjunction* ($P or Q$): true if at least one of $P$ or $Q$ is true; false only if both are false.

#resource("Logical Equivalences")[
  #table(
    columns: 2,
    [*Name*], [*Equivalence*],
    [Commutative Law], [$ P or Q equiv Q or P \ P and Q equiv Q and P $],
    [Associative Law], [$ (P or Q) or R equiv P or (Q or R) \ (P and Q) and R equiv P and (Q and R) $],
    [Distributive Law], [$ P or (Q and R) equiv (P or Q) and (P or R) \ P and (Q or R) equiv (P and Q) or (P and R) $],
    [Identity Law], [$ P or bf(c) equiv P \ P and bf(t) equiv P $],
    [Negation Law], [$ P and not P equiv bf(c) \ P or not P equiv bf(t) $],
    [Double Negative Law], [$ not (not P) equiv P $],
    [Idempotent Law], [$ P or P equiv P \ P and P equiv P $],
    [Absorption Law], [$ P or (P and Q) equiv P \ P and (P or Q) equiv P $],
    [De Morgan's Laws], [$ not (P and Q) equiv (not P) or (not Q) \ not (P or Q) equiv (not P) and (not Q) $],
    [Standard Negations], [$ not bf(t) equiv bf(c) \ not bf(c) equiv bf(t) $]
  )
]

#pagebreak()

== Conditional Statements

- A *conditional statement* is a logical statement that has the form "if $P$, then $Q$," where $P$ is the *hypothesis* and $Q$ is the *conclusion*. It is denoted by $P => Q$.

  - $P$ is a *sufficient condition* for $Q$ if $P => Q$ is true.
  - $P$ is a *necessary condition* for $Q$ if $not P => not Q$ is true.

- A conditional statement is always true if the hypothesis is false, regardless of the truth value of the conclusion. This is known as *true by default* or *vacuously true*.

- The conditional statement $P => Q$ is logically equivalent to $not P or Q$.

- The statement $P or Q => R$ is logically equivalent to $(P => R) and (Q => R)$.

=== Biconditionals

- A *biconditional statement* is a logical statement that has the form "$P$ if and only if $Q$," denoted by $P <=> Q$. It is true only when both $P$ and $Q$ have the same truth value (both true or both false).

  - $P$ is a *necessary and sufficient condition* for $Q$ if $P <=> Q$ is true.
  - $P <=> Q$ is logically equivalent to $(P => Q) and (Q => P)$.


=== Related Statements to Conditional Statements

Let $P$ and $Q$ be statements. The following related statements can be derived from the conditional statement $P => Q$:

#table(
  columns: 3,
  [*Name*], [*Form*], [*Logical Equivalence*],
  [contrapositive], [$not Q => not P$], [logically equivalent to $P => Q$],
  [converse], [$Q => P$], [NOT logically equivalent],
  [inverse], [$not P => not Q$], [NOT logically equivalent],
  [negation], [$P and not Q$], [logically equivalent to $not (P => Q)$],
)

#pagebreak()

== Valid & Invalid Arguments

- Modus Ponens: If $P => Q$ is true and $P$ is true, then $Q$ must be true.
- Modus Tollens: If $P => Q$ is true and $not Q$ is true, then $not P$ must be true.

#resource("Summary of Inferences")[
  #grid(
    columns: (1fr, 1fr),
    align: top + center,  
    table(
      columns: 2,
      [*Inference*], [*Form*],
      [Modus Ponens], [$ P => Q \ P \ therefore Q $],
      [Modus Tollens], [$ P => Q \ not Q \ therefore not P $],
      [Generalization], [$P therefore  P or Q$],
      [Specialization], [$P and Q therefore P$],
      [Conjunction], [$ P \ Q \ therefore P and Q $],
    ),
    table(
      columns: 2,
      [*Inference*], [*Form*],
      [Elimination], [$ P or Q \ not P \ therefore Q $],
      [Transitivity], [$ P => Q \ Q => R \ therefore P => R $],
      [Proof by Cases], [$ P or Q \ P => R \ Q => R \ therefore R $],
      [Contradiction], [$ not P => bf(c) \ therefore P $]
    ),
  )
]

== Digital Logic Circuits

== Number Systems & Addition Circuits

#pagebreak()

= Logic with Predicates & Quantifiers

== Predicates & Quantifiers

=== Negations of Quantified Statements

$
  not(forall x in S, P(x)) & equiv exists x in S "s.t." not P(x) \
  not(exists x in S "s.t." P(x)) & equiv forall x in S, not P(x)
$

= Number Theory & Proofs

= Sequences, Induction, & Recursion

= Set Theory

= Properties of Functions

= Properties of Relations

= Probability Theory

#pagebreak()

= Graph Theory

== Trails, Paths, & Circuits

- A *walk* in a graph is a sequence of vertices and edges where each edge connects the vertices immediately before and after it in the sequence.

  - walk -> *trail* (no repeated edges) -> *path* (no repeated edges & vertices)
  - *closed walk* -> *circuit* (closed trail) -> *simple circuit* (closed path)
    - for circuits/simple circuits, must contain at least one edge
    - for simple circuits, only the start/end vertex is repeated

  - The *trivial walk* from a vertex $v$ to itself is the walk that consists of just the vertex $v$ and no edges. It is considered a closed walk but not a circuit or simple circuit.

- A walk can be denoted by listing the vertices and edges in order, for example: $v_1 e_1 v_2 e_2 v_3$.
  - The notation $v_1 v_2 v_3 ...$ can be ambiguous if there are multiple edges between adjacent vertices.
  - The notation $e_1 e_2 e_3 ...$ can be ambiguous for undirected graphs.

- A graph is *simple* if it is undirected and has no loops or parallel edges.

=== Connectedness

- A graph $H = (V_H, E_H)$ is a *subgraph* of a graph $G = (V_G, E_G)$ if $V_H subset.eq V_G$ and $E_H subset.eq E_G$.

- A graph is *connected* if there is a walk between every pair of vertices in the graph.
  - Formally, $G "is connected" <==> forall "vertices" u, v in G, exists "walk from" u "to" v$

- A *connected component* of a graph is a maximal connected subgraph. 

  - In other words, it is a connected subgraph that cannot be extended by including any additional vertices or edges from the original graph without losing its connectedness.

  - Formally, a subgraph $C$ of a graph $G$ is a connected component if and only if:
    - $C$ is connected.
    - There is no connected subgraph $C'$ of $G$ such that $C subset C'$.

=== Euler and Hamiltonian Circuits

- An *Euler trail* is a trail that passes through every edge and vertex of a graph at least once.

- An *Euler circuit* is an Euler trail that starts and ends at the same vertex.
  - A graph has an Euler circuit iff it is connected and every vertex has an #underline[even degree].

  - A graph has an Euler trail (but not an Euler circuit) iff it is connected and exactly two vertices $u, v$ have #underline[odd degree] and all other vertices have even degree. Then, the trail starts at $u$ and ends at $v$.

- A *Hamiltonian path* is a path that visits each vertex exactly once.
  - A *Hamiltonian circuit* is a Hamiltonian path that is also a simple circuit.

- The *Traveling Salesman Problem* is the problem of finding a Hamiltonian circuit with the minimum total weight in a weighted graph.
  - _Which route should a salesman take to visit each city exactly once and return to the starting city, while minimizing the total distance traveled?_

#pagebreak()

== Matrix Representations of Graphs

- An *adjacency matrix* $A$ for a graph with $n$ vertices is an $n times n$ matrix where the entry $a_(i j)$ indicates the #underline[number of edges] between vertex $i$ and vertex $j$.
  - For undirected graphs, the adjacency matrix is symmetric.
  - For directed graphs, the entry $a_(i j)$ indicates the number of edges from vertex $i$ to vertex $j$.

- The number of walks of length $n$ from $v_i$ to $v_j$ in a graph is the $i j$#th entry of the matrix $A^n$, where $A$ is the adjacency matrix of the graph.

#pagebreak()

== Graph Isomorphisms

- Two graphs $G_1 = (V_1, E_1)$ and $G_2 = (V_2, E_2)$ are *isomorphic* if there exists a bijection $f: V_1 -> V_2$ such that any two vertices $u$ and $v$ in $V_1$ are adjacent in $G_1$ if and only if $f(u)$ and $f(v)$ are adjacent in $G_2$.
  - In other words, the structure of the graphs is the same, even if the labels of the vertices are different.
  
  - If we can map each vertex of $G_1$ to a unique vertex of $G_2$ such that the adjacency relationships are preserved, then the two graphs are isomorphic.

- Graph isomorphisms follow an equivalence relation:
  - Reflexive: Every graph is isomorphic to itself.
  - Symmetric: If $G_1$ is isomorphic to $G_2$, then $G_2$ is isomorphic to $G_1$.
  - Transitive: If $G_1$ is isomorphic to $G_2$ and $G_2$ is isomorphic to $G_3$, then $G_1$ is isomorphic to $G_3$.

- A graph *invariant* is a property that remains unchanged under graph isomorphisms. The following are the invariants listed in the textbook:
  + number of vertices and edges
  + existence of $n$ vertices of a certain degree
  + existence of a circuit of a certain length
  + existence of $n$ simple circuits of a certain length
  + connectedness
  + existence of Euler circuits
  + existence of Hamiltonian circuits

- We can prove that two graphs are not isomorphic by showing that they have different invariants. \ For example, a graph with 5 vertices _cannot_ be isomorphic to a graph with 4 vertices. \
  #subtext[However, we cannot prove that two graphs are isomorphic just by showing that they have the same invariants, since there may be non-isomorphic graphs that share the same invariants.]

#pagebreak()

== Trees

- A *tree* is a graph that is both #underline[circuit-free and connected].
  - A tree with $n$ vertices has exactly $n - 1$ edges.
  
- A vertex in a tree with degree 1 is called a *leaf* or *terminal vertex*.
  - All nontrivial trees have at one leaf.
  - If a vertex in a tree is not a leaf, it is called a *branch vertex* or *internal vertex*.



- A graph that is circuit-free and _not_ connected is called a *forest*.

- A *trivial tree* is a tree with a single vertex and no edges.

=== Rooted Trees

- A *rooted tree* is a tree in which one vertex has been designated as the *root*.
  - The *level* of a vertex in a rooted tree is the length of the unique path from the root to that vertex.
  - The *height* of a rooted tree is the maximum level of any vertex in the tree.

- For any vertex in a rooted tree, the vertices adjacent to it that are one level farther away from the root are called its *children*, and the vertex one level closer to the root is called its *parent*.
  - A vertex with no children is a *leaf* or *terminal vertex*.
  - A vertex with at least one child is a *branch vertex*.
  - In other words, if $u$ is a child of $v$, then $v$ is the parent of $u$.
  - Two vertices with the same parent are called *siblings*.

- If the path from the root to a vertex $v$ contains the vertex $u$, then $u$ is an *ancestor* of $v$, and $v$ is a *descendant* of $u$.
  - The *subtree* rooted at a vertex $v$ is the tree consisting of $v$ and all its descendants.

=== Binary Trees

- A *binary tree* is a rooted tree in which each vertex has at most two children.
  - The children of a vertex in a binary tree are referred to as the *left child* and the *right child*.
  - The *left subtree* of a vertex is the subtree rooted at its left child, and the *right subtree* is the subtree rooted at its right child.
  
- A *full binary tree* is a binary tree in which every vertex has either 0 or 2 children.
  - A full binary tree with $n$ leaves has exactly $2n - 1$ vertices.

=== Spanning Trees

- A *spanning tree* of a graph $G$ is a subgraph of $G$ that is a tree and contains all the vertices of $G$.
  - A graph may have multiple spanning trees, but every spanning tree of a graph has the same number of edges, which is equal to the number of vertices in the graph minus one.

- A *minimum spanning tree* of a weighted graph is a spanning tree with the minimum total weight among all spanning trees of the graph.

