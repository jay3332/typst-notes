#set text(font: "XITS")
#show math.equation: set text(font: "XITS Math")

#set page("us-letter", header: align(right)[
  Jaysen Tsao \
  CMSC 207 CRN 32950
])

= CMSC 207: Chapter 10 Homework
February 16, 2026 

#stack(
  line(length: 100%, stroke: 1.0pt),
  line(length: 100%, stroke: 1.0pt),
  spacing: 2pt,
)

+ Prove that having $n$ vertices (where $n in ZZ^+$) is an invariant for a *graph isomorphism*.

#line(length: 100%, stroke: 0.5pt)

Let $G$ and $H$ be graphs, and let $G$ be isomorphic to $H$. \ Let $V_G$ be the vertex set of $G$ and $V_H$ be the vertex set of $H$. \
Let $n$ be the number of vertices in $G$, so $abs(V_G) = n$.

By the definition of a graph isomorphism, there exists a bijection $f: V_G -> V_H$.

Since $f$ is a bijection, it is both one-to-one and onto.
- Since $f$ is one-to-one, no two vertices in $G$ can map to the same vertex in $H$. Thus, the number of vertices in $H$ must be at least the number of vertices in $G$: $abs(V_H) >= abs(V_G)$.

- Since $f$ is onto, every vertex in $H$ must correspond to some vertex in $G$. Thus, the number of vertices in $H$ cannot exceed the number of vertices in $G$: $abs(V_H) <= abs(V_G)$.

- Combining the two inequalities, we have $abs(V_H) = abs(V_G)$. If $G$ and $H$ are isomorphic, then the number of vertices in $G$ must be equal to the number of vertices in $H$. 

Since $abs(V_G) = n$, then $abs(V_H) = n$. Thus, having $n$ vertices is an invariant for a graph isomorphism. $qed$

#pagebreak()

#set enum(start: 2)
+ Prove that the sum of degrees of the vertices of any finite graph is even.

#line(length: 100%, stroke: 0.5pt)

Let $G = (V, E)$ be a finite graph.


Each edge $e in E$ has either one or two endpoints:
- If $e$ has one endpoint, then it contributes $2$ to the sum of degrees, since it is incident to the same vertex twice.
- If $e$ has two endpoints $u$ and $v$, then it contributes $1$ to the degree of $u$ and $1$ to the degree of $v$, for a total contribution of $2$ to the sum of degrees.

Since each edge in $E$ contributes $2$ to the sum of degrees, the total sum of degrees of all vertices in $G$ is $2 abs(E)$. Since $abs(E) in ZZ$, then $2 abs(E)$ is even. 

Thus, the sum of degrees of the vertices of any finite graph is even. $qed$

#pagebreak()

#set enum(start: 3)
+ Show that every simple finite graph has two vertices of the same degree.

_Note:_ A simple graph is an undirected graph with no loops and no parallel edges.

#line(length: 100%, stroke: 0.5pt)

Let $G = (V, E)$ be a simple finite graph with $n$ vertices.

Since $G$ is simple, a vertex in $G$ cannot be adjacent to itself, and it cannot be adjacent to another vertex through more than one edge. 
- That is, a vertex in $G$ can only be adjacent to at most $n - 1$ other vertices.
- Thus, the degree of any vertex $v$ in $G$ must satisfy $0 <= deg(v) <= n - 1$.

A vertex with degree $0$ cannot coexist with a vertex with degree $n - 1$, since the vertex with degree $n - 1$ would have to be adjacent to every other vertex, including the vertex with degree $0$, which is a contradiction.
- Thus, the possible degrees of the vertices in $G$ are either $0, 1, 2, ..., n - 2$ or $1, 2, ..., n - 1$. In both cases, there are only $n - 1$ possible degrees for $n$ vertices.

By the pigeonhole principle, since there are more vertices than possible degrees, at least two vertices in $G$ must take on the same degree. $qed$