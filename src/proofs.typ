#import "../helpers/template.typ": *

#show: template.with(title: "A Collection of Proofs", font: "times")
#set math.mat(delim: "(")
#set math.vec(delim: "(")

#show math.equation.where(block: true): eq => {
  block(width: 100%, inset: 0pt, align(center, eq))
}

#set enum(numbering: "1.a.")

= Discrete Mathematics

== Logic, Sets, Quantifiers

+ *Cardinality of Power Sets.* If $A$ is a finite set, then $abs(cal(P)(A)) = 2^abs(A)$.

+ *Commutability of Nested Quantifiers.* If $exists x space forall y space P(x, y)$, then $forall y space exists x space P(x, y)$. However, the converse is not necessarily true.

+ *Functional Completeness of ${not, and}$.* The set of logical connectives ${not, and}$ is functionally complete, every Boolean function ${0, 1}^n -> {0, 1}$ can be expressed using only the connectives $not$ and $and$.

+ *Russell's Paradox.* For any set $A$, the set ${x in A | x in.not x}$ is not an element of $A$.

== Functions, Inverses, Composition

+ Let $f: A -> B$ and $g: B -> C$ be functions. The following are true:
  + If $f$ and $g$ are both injective, then the composition $g compose f$ is also injective. 
  + If $f$ and $g$ are both surjective, then the composition $g compose f$ is also surjective.
  + If $g compose f$ is injective, then $f$ is injective, but not necessarily $g$.
  + If $g compose f$ is surjective, then $g$ is surjective, but not necessarily $f$.

+ *Characteristic Function.* For any set $A subset.eq U$, define its characteristic function $chi_A: U -> {0, 1}$ by:
  $
    chi_A (x) = cases(
      1 #h(1em) & "if" x in A,
      0 #h(1em) & "if" x in.not A
    )
  $
  The following are true:
  + $chi_(A inter B) = chi_A chi_B$.
  + $chi_(A union B) = chi_A + chi_B - chi_A chi_B$.
  + $chi_(A^complement) = 1 - chi_A$.
  + The map $A |-> chi_A$ is a bijection from $cal(P)(U)$ and the set of functions $U -> {0, 1}$.

== Induction, Well-Ordering

+ *Bernoulli's Inequality.* For any real number $x >= -1$ and any integer $n >= 0$, we have: $
    (1 + x)^n >= 1 + n x.
  $

+ *Fundamental Theorem of Arithmetic.* Every integer $n >= 2$ has a unique prime factorization.

+ *AM-GM Inequality.* For any nonnegative real numbers $a_1, a_2, ..., a_n$, we have: $
    (a_1 a_2 ... a_n)^(1 slash n) <= (a_1 + a_2 + ... + a_n) / n.
  $

+ *Towers of Hanoi.* For any integer $n >= 1$, the minimum number of moves required to solve the Towers of Hanoi puzzle with $n$ disks is $2^n - 1$.

== Relations, Equivalence Relations, Partitions

== Finite, Countable, Uncountable Sets

== Number Theory

== Combinatorics, Probability

+ *Pascal's Identity.* For any integers $n >= 1$ and $0 < k <= n$: $
    binom(n, k) = binom(n - 1, k - 1) + binom(n - 1, k).
  $

+ *Binomial Theorem.* For any numbers $a$ and $b$, and integer $n >= 0$:
  $
    (a + b)^n = sum_(k = 0)^n binom(n, k) a^(n - k) b^k.
  $

+ *Inclusion-Exclusion Principle.* For any finite sets $A_1, A_2, ..., A_n$:
  $
    abs(A_1 union A_2 union ... union A_n) = sum_(i = 1)^n abs(A_i) - sum_(1 <= i < j <= n) abs(A_i inter A_j) + ... + (-1)^(n + 1) abs(A_1 inter A_2 inter ... inter A_n).
  $

+ *Bayes' Theorem.* Let $A$ and $B$ be events with $P(B) > 0$. Then: $
    P(A|B) = (P(B|A) thin P(A)) / P(B).
  $

== Real Numbers, Inequalities, Convergence

== Orders, Lattices

== Recursion, Algorithms

== Graph Theory

+ *Handshake Lemma.* Let $G = (V, E)$ be a finite graph. Then the total degree of the vertices in $G$ is twice the number of edges in $G$, i.e. $
    sum_(v in V) deg(v) = 2 abs(E).
  $

+ A graph is bipartite *iff* it contains no odd cycles.

#pagebreak()

= Linear Algebra

== Vector Spaces, Subspaces, Linear Independence

#let span = "span"
#let col = "col"
#let ker = "ker"
#let nul = "nul"
#let row = "row"
#let nullity = "nullity"
#let rank = "rank"
#let inner(u, v) = $lr(chevron.l #u, #v chevron.r)$

Let $V$ be a vector space.

+ Let $V_1, V_2, ..., V_p$ be subspaces of $V$. The intersection $V_1 inter V_2 inter ... inter V_p$ is a subspace of $V$.

+ Let $V_1$ and $V_2$ be subspaces of $V$. The union $V_1 union V_2$ is a subspace *iff* $V_1 subset.eq V_2$ or $V_2 subset.eq V_1$.

+ Let $S subset.eq V$. Then $span(S)$ is the smallest subspace of $V$ containing $S$. That is, $S subset.eq span(S)$, and $forall "subspaces" W "of" V, W supset.eq S => span(S) subset.eq W$.

+ A set $S = {bf(v)_1, bf(v)_2, ..., bf(v)_n}$ with $n >= 2$ is linearly dependent *iff* $exists bf(v)_i in S$ such that $bf(v)_i$ is a linear combination of the other vectors in $S$.

+ If ${bf(v)_1, bf(v)_2, ..., bf(v)_n}$ is linearly independent but ${bf(v)_1, bf(v)_2, ..., bf(v)_n, bf(w)}$ is linearly dependent, then \ $bf(w) in span{bf(v)_1, bf(v)_2, ..., bf(v)_n}$.

+ *Steinitz Exchange Lemma.* Let $U = {bf(u)_1, bf(u)_2, ..., bf(u)_m} subset.eq V$ and $W = {bf(w)_1, bf(w)_2, ..., bf(w)_n} subset.eq V$. If $U$ is linearly independent and $W$ spans $V$, then $m <= n$, and we can replace $m$ vectors from $W$ with the $m$ vectors from $U$ to get a spanning set for $V$.

+ *Basis Theorem.* If $V$ has dimension $n$, then:
  + If $varcal(B)$ is a linearly independent set of $n$ vectors from $V$, then $varcal(B)$ is a basis for $V$.
  + If $varcal(B)$ is a set of $n$ vectors from $V$ that span $V$, then $varcal(B)$ is a basis for $V$.

+ If $S$ spans $V$, then a basis $varcal(B)$ for $V$ can be formed using only vectors in $S$, i.e. $varcal(B) subset.eq S$.

+ For any two subspaces $V_1$ and $V_2$ of $V$, $dim(V_1) + dim(V_2) = dim(V_1) + dim(V_2) - dim(V_1 inter V_2)$.

#pagebreak()

=== Solutions

#pagebreak()

== Linear Maps, Kernel, Image, Rank-Nullity

_Note:_ A linear map is also called a linear transformation. The image of a linear map $T$, denoted $im(T)$, is sometimes called the range of $T$.

+ *Rank-Nullity Theorem for Matrices.* For any $m times n$ matrix $A$, $rank(A) + nullity(A) = n$.

+ *Rank-Nullity Theorem for Linear Maps.* Let $T: V -> W$ be a linear map, where $V$ is finite-dimensional. Then: $ dim(ker T)) + dim(im thick T)) = dim(V). $

+ *Equivalence of Column and Row Ranks.* If $A$ is an $m times n$ matrix, then: $ dim(col thin A) = dim(row thin A) = rank(A). $

+ *Frobenius Rank Inequality.* For matrices $A, B, C$ of compatible dimensions:
  $
    rank(A B) + rank(B C) <= rank(B) + rank(A B C).
  $

+ *Existence and Uniqueness of Linear Maps.* 
  + *Uniqueness.* Suppose $T, S: V -> W$ are linear maps, and $varcal(B) = {bf(v)_1, bf(v)_2, ..., bf(v)_n}$ is a basis of $V$ such that $T(bf(v)_i) = S(bf(v)_i)$ for $i = 1, 2, ..., n$. Then $T = S$.
  + *Existence.* Let $varcal(B) = {bf(v)_1, bf(v)_2, ..., bf(v)_n}$ be a basis of $V$, and let $bf(w)_1, bf(w)_2, ..., bf(w)_n$ be any vectors in $W$. Then there exists a linear map $T: V -> W$ such that $T(bf(v)_i) = bf(w)_i$ for $i = 1, 2, ..., n$.

+ Let $T: V -> W$ be linear. Then:
  + $ker(T)$ is a subspace of $V$ and $im(T)$ is a subspace of $W$.
  + Then $T$ is injective *iff* $ker(T) = {bf(0)}$.
  + Then $T$ is surjective *iff* $im(T) = W$.

+ Let $V$ and $W$ be finite-dimensional vector spaces over the same field $FF$. Then $V$ and $W$ are isomorphic *iff* $dim(V) = dim(W)$.

+ *Adjoints of Linear Maps.* Let $T: V -> V$ be a linear map on a finite-dimensional inner product space $V$, and $T^*$ is the adjoint of $T$, i.e. $inner(bf(u), T(bf(v))) = inner(T^* (bf(u)), bf(v))$ for all $bf(u), bf(v) in V$. Show that:
  + $T^*$ exists and is unique.
  + $(T^*)^* = T$.
  + $(S T)^* = T^* S^*$ for another linear map $S: V -> V$.
  + $ker(T^*) = (im T)^perp$.
  + $T$ is self-adjoint ($T^* = T$) *iff* the associated matrix of $T$ is a Hermitian matrix.

#pagebreak()

== Matrix Operations, Inverses, Determinants

+ *Existence of Row Echelon Form.* For any $m times n$ matrix $A$, there must exist a row-equivalent matrix $B$ in row echelon form.

+ *Uniqueness and Existence of Reduced Row Echelon Form.* For any $m times n$ matrix $A$, there is a unique row-equivalent matrix $B$ in reduced row echelon form.

+ For $n times n$ matrices $A$ and $B$, $det(A B) = det(A) det(B)$.

+ If $A$ is invertible, then $display(det(A^(-1)) = 1 / det(A))$.

+ If $A$ is an $n times n$ real matrix, then for some $k in RR$, $display(det(k A) = k^n det(A))$.

+ *Cramer's Rule.* Let $A$ be an invertible $n times n$ matrix, and let $bf(b)$ be a vector in $RR^n$. Then the unique solution to the equation $A bf(x) = bf(b)$ is given by:
  $
    x_i = det(A_i) / det(A) "for" i = 1, 2, ..., n.
  $
  where $A_i$ is the matrix obtained from $A$ by replacing the $i$#th column of $A$ with the vector $bf(b)$.

+ *Determinant of a Block Matrix.* Let $M$ be the following block matrix:
  $
    M = mat(A, B; C, D)
  $
  where $A$ and $D$ are square matrices, and $A$ is invertible. Then $det(M) = det(A) det(D - C A^(-1) B)$.

+ *Invertible Matrix Theorem.* Let $A$ be an $n times n$ matrix. Then the following are equivalent:
  + $A$ is invertible.
  + For some $bf(x) in RR^n$, if $A bf(x) = bf(0)$, then $bf(x) = bf(0)$.
  + $A bf(x) = bf(b)$ has a solution $bf(x)$ for every $bf(b) in RR^n$.
  + The columns of $A$ form a basis for $RR^n$.
  + $rank A = n.$
  + $det A != 0$.
  + $nul A = {bf(0)}$.
  + $A^transpose$ is invertible.
  + $0$ is not an eigenvalue of $A$.
  + $A$ is row equivalent to the $n times n$ identity matrix $I_n$.
  + The linear map $bf(x) |-> A bf(x)$ is an isomorphism from $RR^n$ to $RR^n$.
  + $A^transpose A$ is positive definite.

+ *Convergence of Matrix Exponential.* Let $A$ be any $n times n$ complex matrix. Then the Taylor expansion of $display(e^A = sum_(k=0)^oo A^k / k!)$ converges.

+ *Determinant of Matrix Exponential.* Let $A$ be any $n times n$ complex matrix. Then $display(det(e^A) = e^tr(A))$.

#pagebreak()

== Eigenvalues, Eigenvectors, Diagonalization

+ *Eigenvectors Corresponding to Distinct Eigenvalues are Linearly Independent.* Let $lambda_1, lambda_2, ..., lambda_p$ be distinct eigenvalues of a matrix $A$, and let $bf(v)_1, bf(v)_2, ..., bf(v)_p$ be their corresponding eigenvectors. Then ${bf(v)_1, bf(v)_2, ..., bf(v)_p}$ is a linearly independent set.

+ *Diagonalization Theorem.* Let $A$ be an $n times n$ matrix. Then the following are equivalent: 
  + $A$ is diagonalizable. 
  + There exists a basis for $RR^n$ consisting of eigenvectors from $A$.
  + The sum of the dimensions of the eigenspaces of $A$ is $n$.
  + For each eigenvalue $lambda$ of $A$, the geometric multiplicity of $lambda$ equals the algebraic multiplicity of $lambda$.

+ Let $lambda$ be an eigenvalue of an $n times n$ matrix $A$. Let $m_g$ be the geometric multiplicity of $lambda$, and let $m_a$ be the algebraic multiplicity of $lambda$. Then $1 <= m_g <= m_a <= n$.

+ If $A$ and $B$ are similar matrices, then:
  + $A$ and $B$ have the same characteristic polynomial.
  + $det A = det B$.
  + $tr A = tr B$.

+ *Cayley-Hamilton Theorem.* Let $A$ be an $n times n$ matrix, and let $p(lambda) = det(lambda I_n - A)$ be the characteristic polynomial of $A$. Then $p(A) = 0_(n times n)$, where $0_(n times n)$ is the $n times n$ zero matrix.

+ Let $A$ be a real matrix, and let $lambda = a + b i$ ($b != 0$) be a complex eigenvalue of $A$. If $bf(v) = bf(u) + i bf(w)$ is a corresponding eigenvector for $lambda$, then:
  + The complex conjugate $lambda^* = a - b i$ is also an eigenvalue of $A$, with corresponding eigenvector $bf(v)^* = bf(u) - i bf(w)$.
  + $A$ is similar to a block-diagonal matrix containing the block $C = mat(a, -b; b, a)$, where $C$ is a rotation-scaling matrix in the basis ${bf(u), bf(w)}$.

+ Let $A$ have eigenvalues $lambda_1, lambda_2, ..., lambda_n$, counting algebraic multiplicities. Then:
  + $ det A = lambda_1 lambda_2 ... lambda_n = product_(i=1)^n lambda_i. $ 
  + $ tr A = lambda_1 + lambda_2 + ... + lambda_n = sum_(i=1)^n lambda_i. $

#pagebreak()

== Inner Product Spaces, Orthogonality

Let $V$ be an inner product space.

+ An orthogonal set of nonzero vectors is linearly independent.

+ *Completeness of Orthogonal Complements.* Let $W subset.eq V$ be finite-dimensional. Then: 
  + $(W^perp)^perp = W$.
  + $dim(W) + dim(W^perp) = dim(V)$.

+ *Triangle Inequality.* Let $bf(u)$ and $bf(v)$ be vectors in $V$. Then $norm(bf(u) + bf(v)) <= norm(bf(u)) + norm(bf(v))$.

+ *Cauchy-Schwarz Inequality.* Let $bf(u)$ and $bf(v)$ be vectors in $V$. Then $abs(inner(bf(u), bf(v))) <= norm(bf(u)) norm(bf(v))$.

+ *Fundamental Theorem of Linear Algebra.* Let $A$ be an $m times n$ matrix. Then:
  + $nul(A) = (row A)^perp$ in the auxiliary inner product space $RR^n$.
  + $nul(A^transpose) = (col A)^perp$ in the auxiliary inner product space $RR^m$.

+ *Existence and Uniqueness of Orthogonal Decomposition.* Let $W$ be a finite-dimensional subspace of $V$.
  Then, for any vector $bf(v) in V$, there is a unique $hat(bf(v)) in W$ and $bf(z) in W^perp$ such that $bf(v) = hat(bf(v)) + bf(z)$.

+ Let $Q$ be an $n times n$ real matrix. Then the following are equivalent:
  + $Q$ is orthogonal, i.e. $Q^transpose = Q^(-1)$.
  + The columns of $Q$ form an orthonormal set.
  + $inner(bf(u), bf(v)) = inner(Q bf(u), Q bf(v))$ for all $bf(u), bf(v) in RR^n$. (preserves inner products)
  + $norm(Q bf(v)) = norm(bf(v))$ for all $bf(v) in RR^n$. (preserves norms)

+ *Normal Equation.* Let $A$ be an $m times n$ matrix, and let $bf(b)$ be a vector in $RR^m$. Then the least-squares solutions to the equation $A bf(x) = bf(b)$ are the solutions to the normal equation $A^transpose A hat(bf(x)) = A^transpose bf(b)$.

== Symmetric & Complex Matrices, Quadratic Forms

+ *Spectral Theorem.* Let $A$ be a real symmetric matrix. Then there exists an orthogonal matrix $Q$ and a diagonal matrix $D$ such that $A = Q D Q^transpose$.

+ If $A$ is a real symmetric matrix, then $A$ only has real eigenvalues.
 
+ Let $A$ be an $n times n$ complex matrix. Then the following are equivalent:
  + $A$ is normal, i.e. $A^dagger A = A A^dagger$.
  + $A$ is unitarily diagonalizable.
  + A basis for $CC^n$ can be formed from eigenvectors of $A$.

== Applications of Linear Algebra

= Vector Analysis
