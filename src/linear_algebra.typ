#import "../helpers/template.typ": *

#show: template.with(title: "Linear Algebra", font: "times")
#set math.mat(delim: "(")
#set math.vec(delim: "(")

#show math.equation.where(block: true): eq => {
  block(width: 100%, inset: 0pt, align(center, eq))
}

= Linear Equations

== Systems of Linear Equations

#define("Linear Function")[
  A function $f$ is *linear* in the variables $x_1, x_2, ..., x_n$ if it can be written in the form: 
  $
    f(x_1, x_2, ..., x_n, ...) = a_1 x_1 + a_2 x_2 + ... + a_n x_n
  $
  #rsubtext[where $a_1, a_2, ..., a_n$ are constants with respect to $x_1, x_2, ..., x_n$.]
]

- To put it simply, a function is *linear* in the variables $x_1, x_2, ..., x_n$ if it can be written as the sum of constant multiples of $x_1, x_2, ..., x_n$. These constant multiples are called the *coefficients*.

- For example, the function $f(x, y) = 2x y^2$ is linear in $x$ but not linear in $y$.

#define("Linear Equation")[
  A *linear equation* in the variables $x_1, x_2, ..., x_n$ can be written in the form: 
  $
    f(x_1, x_2, ..., x_n, ...) = b
  $
  where $f$ is linear in $x_1, x_2, ..., x_n$ and $b$ is constant with respect to $x_1, x_2, ..., x_n$.
]

- A *linear equation* in the variables $x_1, x_2, ..., x_n$ can be written in the form:
  $
    a_1 x_1 + a_2 x_2 + ... + a_n x_n = b
  $
  where $a_i$ is the coefficient of the variable $x_i$ for all $1 <= i <= n$, and $b$ is a constant.

- For example, the equation $2x + 5y = 6z^2$ is linear in $x$ and $y$ but not linear in $z$. 

#define("System of Linear Equations")[
  A *system of linear equations* (or *linear system*) is a collection of one or more linear equations involving the same set of variables. 
  
  A *solution* of a linear system in the variables $x_1, x_2, ..., x_n$ is an ordered $n$-tuple $(s_1, s_2, ..., s_n)$ that, when substituted for $(x_1, x_2, ..., x_n)$ respectively, makes each equation in the system a true statement.
]

- The *solution set* of a system of equations is the set of all possible solutions for that system.
  - Two systems are *equivalent* if they have the same solution set.

- A linear system can have one solution, no solution, or infinitely many solutions.
  - A linear system is *consistent* if it has at least one solution (i.e., one or infinite)
  - A linear system is *inconsistent* if it has no solutions.

#example("Solving and Classifying a Linear System")[
  Find the solution set to the following system of equations, and classify the system as consistent or inconsistent:
  $
    x_1 - 2x_2 &= -1 \
    -x_1 + 3x_2 &= 3
  $

  #lorange

  Adding the two equations together, we get $x_2 = 2$, which implies $x_1 - 2(2) = -1 ==> x_1 = 3$.

  Thus, one solution to the system is $(3, 2)$. Since it is the only solution, the solution set is $\{(3, 2)\}$, and the system is consistent.
]

#example("Textbook Exercise 1.1.P4")[
  For what values of $h$ and $k$ make the following system consistent?
  $
    2x_1  && - &&  x_2   &= h \
    -6x_1 && + && 3x_2 &= k
  $
  #lorange
  
  We can multiply the first equation by $3$ and add it to the second equation:
  $
    0x_1 + 0x_2 = k + 3h ==> 0 = k + 3h
  $
  For the system to be consistent, we need $k + 3h = 0 ==> cgreen(k = -3h)$.  \
  #subtext[Otherwise, if $k + 3h != 0$, the system is inconsistent because there would be no solutions (i.e., a contradiction).]
]

=== Introduction to Matrices

- A *matrix* is a collection of numbers arranged into a rectangular array of rows and columns.
  - A matrix with $m$ rows and $n$ columns is called an $m times n$ matrix.
  - If $A$ is a matrix, then $a_(i j)$ denotes the entry in the $i$-th row and $j$-th column of $A$.

- To distinguish between scalars, vectors, and matrices, multiple notations are used:
  - Scalars are lowercase and italicized, e.g., $a, b, c$.
  - Vectors can either be:
    - lowercase and bolded: $bf(v), bf(w)$, or 
    - lowercase with an arrow on top: $bf(v), bf(w)$. 
    - unit vectors are sometimes denoted with a hat: $hat(i), hat(j), hat(k)$.
  - Matrices are uppercase and (usually) bolded, e.g., $bf(A), bf(B), bf(C)$.
    - sometimes they are simply italicized: $A, B, C$ (as in $P D P^(-1)$)

- A vector $ang(v_1, v_2, v_3, ...)$ can be represented as a matrix (or made "compatible" with matrices) by writing it as either a *column matrix* (or *column vector*): $bf(v) = mat(v_1; v_2; v_3; dots.v)$ \ or a *row matrix* (or *row vector*): $bf(v) = mat(v_1, v_2, v_3, ...)$


- The *coefficient matrix* of a linear system is the matrix consisting of the coefficients of the variables in the system.
  For example, the system:
  $
    &&  x_1 && - 2x_2 && + &&  x_3 &= & 0 \
    &&      &&   2x_2 && - && 8x_3 &= & 8 \
    && 5x_1 &&        && - && 5x_3 &= & 10
  $
  can be represented by the coefficient matrix $mat(align: #right, 1, -2, 1; 0, 2, -8; 5, 0, -5)$.

- The *augmented matrix* of a linear system is the matrix consisting of the coefficient matrix with an additional column that contains the constants from the right-hand side of each equation.
  
  For example, the augmented matrix for the above system is $mat(align: #right, 1, -2, 1, 0; 0, 2, -8, 8; 5, 0, -5, 10)$.

=== Solving Linear Systems

One strategy to solve a linear system is to perform *elementary row operations* on the associated augmented matrix,  eliminating variables one at a time until we arrive at a trivial form.

An example of a trivial form is the *triangular form*, where all entries below the main diagonal are zero. Below
is a template for a $3 times 4$ triangular matrix:
$
  mat(cblue(*), *, *, *; 0, cblue(*), *, *; 0, 0, cblue(*), *)
$
#rsubtext[The main diagonal is highlighted in blue.]

#define("Elementary Row Operations")[
    There are three *elementary row operations* which operate on individual rows of a matrix (which can
    correspond to equations in a linear system):  
  
  + _Swap_ two rows $R_i <-> R_j$
  + _Multiply_ by a nonzero scalar: $R_i -> k R_i$ where $k != 0$
  + _Add_ a multiple of one row to another: $R_i -> R_i + k R_j$

  #rsubtext[Note: Operation 3 is sometimes $R_i -> a R_i + b R_j$]
]

- Row operations can be applied to any matrix.

- Two matrices are *row equivalent* if there exists a sequence of elementary row operations that transforms one matrix into the other.
  - If the augmented matrices of two linear systems are row equivalent, then the two systems are equivalent (i.e., have the same solution set).

- Row operations are _reversible_, and the following lists inverse operations:
  - $R_i <-> R_j$ is its own inverse.
  - $R_i -> k R_i$ is inverted by $R_i -> 1/k R_i$.
  - $R_i -> R_i + k R_j$ is inverted by $R_i -> R_i - k R_j$.



#example("Solving a Linear System")[
  Solve the following system of equations:
  $
    &&  x_1 && - 2x_2 && + &&  x_3 &= & 0 \
    &&      &&   2x_2 && - && 8x_3 &= & 8 \
    && 5x_1 &&        && - && 5x_3 &= & 10
  $
  #lorange
  We can use the augmented matrix to represent the system, and label the rows: 
  $
    mat(align: #right, row-gap: #0.45em,
      1, -2, 1, 0;
      0, 2, -8, 8;
      5, 0, -5, 10
    ) space #stack[$R_1$ \ $R_2$ \ $R_3$]
  $

  Start with the equation with the most leading zeros, which is $R_2$. We can use this to eliminate $x_2$ from $R_1$ by adding $R_2$ to $R_1$ ($R_1 -> R_1 + R_2$):
  $
    mat(align: #right, row-gap: #0.45em,
      1, 0, -7, 8;
      0, 2, -8, 8;
      5, 0, -5, 10
    ) space #stack[$R_1$ \ $R_2$ \ $R_3$]
  $

  Notice that only $R_1$ changed, and that we targeted $R_1$ because it had the most nonzero entries.

  Next, we can use $R_1$ to eliminate $x_1$ from $R_3$ by performing the operation $R_3 -> R_3 - 5 R_1$:
  $
    mat(align: #right, row-gap: #0.45em,
      1, 0, -7, 8;
      0, 2, -8, 8;
      0, 0, 30, -30
    ) space #stack[$R_1$ \ $R_2$ \ $R_3$]
  $

  Finally, we can use $R_3$ to eliminate $x_3$ from $R_2$ by performing the operation $R_2 -> R_2 + 4/15 R_3$:
  $
    mat(align: #right, row-gap: #0.45em,
      1, 0, -7, 8;
      0, 2, 0, 0;
      0, 0, 30, -30
    ) space #stack[$R_1$ \ $R_2$ \ $R_3$]
  $

  We have achieved triangular form, so we can start back-substitution. Here, we see the final matrix corresponds to the system of equations:
  $
    x_1 - 7x_3 &= 8 \
    2x_2 &= 0    &&==> x_2 = 0 \
    30x_3 &= -30 &&==> x_3 = -1
  $
  Finally, $x_1 - 7(-1) = 8 ==> x_1 + 7 = 8 ==> x_1 = 1$. Thus, the solution is $cgreen((1, 0, -1))$.
]

#pagebreak()

== Row Reduction & Echelon Forms

#define("Echelon Form")[
  A rectangular matrix is in *echelon form* or *row echelon form* (REF) if it is:
  + _Separated_: nonzero rows are above any rows of all zeros.
  + _Ordered_: the leading entry (or *pivot*) of each nonzero row is to the right of the leading entry of the previous row.
  + _Normalized Below_: all entries below a leading entry are zeros.

  #rsubtext[The leading entry (or *pivot*) of a nonzero row is the first nonzero entry from the left in that row.]

  A matrix is in *reduced row echelon form* (or *row reduced echelon form*, RREF) if it is in echelon form and also meets the following additional properties:
  + _Leading 1s_: the leading entry in each nonzero row is $1$.
  + _Normalized Everywhere_: all entries above and below a leading $1$ are zeros.
]

- A matrix in echelon form must be in triangular form, but the converse is not necessarily true.

- A matrix in echelon form is called an *echelon matrix*, and a matrix in RREF is called a *reduced echelon matrix*.

#define("Existence and Uniqueness of Reduced Row Echelon Form")[
  Every matrix is row equivalent to one and only one reduced echelon matrix. \
  #subtext[_In other words, each matrix has *exactly one* reduced row echelon form._]
]

=== Pivots and Free Variables

- The *pivot* positions of a matrix are the locations of the leading entries in its nonzero rows.
  - The columns that contain pivot positions are called *pivot columns*.
  - The number of pivot positions is called the *rank* of the matrix.

- The columns that do not contain pivot positions are called *free columns*.
  - The variables corresponding to free columns are called *free variables*. \
    #subtext[
      As their name suggests, these variables can take on any value in the solution set.
    ]
  - The other variables (variables in pivot columns) are called *basic variables*.

- Basic variables may be expressed in terms of the free variables in a linear system.
  This way of expressing the solution set is called the *parametric description* (or form) of the solution set.
  - The following are two equivalent parametric descriptions: 
    $
      {(x_1, x_1 + 2) lr(|, size: #200%) x_1 in RR} equiv cases(
        x_1 "is free", x_2 = x_1 + 2
      )
    $ 

#define("Existence Theorem")[
  Let $A$ be the augmented matrix of a linear system. If the rightmost column of $A$ is #underline[not] 
  a pivot column, then the linear system must be consistent (and there must exist at least one solution).
]

- The Existence Theorem is intuitive to understand. The only way to have the rightmost column be a pivot is to have
  a row in the form $(0, 0, ..., b)$ with $b != 0$. This corresponds to the equation $0 = b$, which is a contradiction and thus makes the system inconsistent.

#define("Uniqueness Theorem")[
  Let $A$ be the augmented matrix of a _consistent_ linear system. If every variable in the system is a basic variable (i.e., there are no free variables), then the linear system has a #underline[unique] solution.
]

=== The Row Reduction Algorithm

Let's consider the following matrix:
$
  mat(align: #right,
    1, 2, -1, -4;
    2, 3, 3, 3;
    4, 5, 1, 6
  )
$

To reduce this matrix into *echelon form* (ref), we can follow these steps (the *forward phase*):

+ Choose the leftmost column as the *pivot column*.
  Our goal with a pivot column is to turn it into a column with a pivot position in the first row. That is, we want to have a leading entry in the first row and zeros below it.

  $
    mat(align: #right,
      cred(1), 2, -1, -4;
      cblue(2), 3, 3, 3;
      cblue(4), 5, 1, 6
    )
  $
  #rsubtext[
    The pivot column is highlighted in blue, and the pivot position is highlighted in red. \
    Only focusing on the blue column, we want to use row operations to make everything below the red entry equal to zero.
  ]

+ If necessary, swap rows to move a nonzero entry into the pivot position (first row of the pivot column).
  In this case, the first entry is already nonzero, so we can skip this step.

+ Use row operations to create zeros below the pivot position.
  We can eliminate the entries below the pivot by performing the following row operations:
  $
    R_2 -> R_2 - 2 R_1 #h(4em) mat(
      align: #right,
      cred(1), 2, -1, -4;
      cblue(0), -1, 5, 11;
      cblue(4), 5, 1, 6
    ) \
    R_3 -> R_3 - 4 R_1 #h(4em) mat(
      align: #right,
      cred(1), 2, -1, -4;
      cblue(0), -1, 5, 11;
      cblue(0), -3, 5, 22
    )
  $

+ Now, consider the pivot column as the next column to the right (that contains a nonzero entry). The row of our pivot position will also move down one row.

  In this case, we can use the second column as the next pivot column:
  $
    mat(align: #right,
      1, cblue(2), -1, -4;
      0, cred(-1), 5, 11;
      0, cblue(-3), 5, 22
    )
  $
  Performing row operations to create the zero below the pivot position:
  $
    R_3 -> R_3 - 3 R_2 #h(4em) mat(
      align: #right,
      1, cblue(2), -1, -4;
      0, cred(-1), 5, 11;
      0, cblue(0), -10, -11
    )
  $

+ Finally, we can use the third column as the next pivot column:
  $
    mat(align: #right,
      1, 2, cblue(-1), -4;
      0, -1, cred(5), 11;
      0, 0, cblue(-10), -11
    )
  $
  Since there are no entries below the pivot position, we have achieved echelon form (REF). This process was called *Gaussian Elimination*.

To convert the matrix into *reduced row echelon form* (RREF), we can follow these steps (the *backward phase*):


+ Starting from the _last_ pivot column, use row operations to create zeros _above_ the pivot position.
  Starting with the third column:
  $
    R_2 -> R_2 + 1/2 R_3 #h(4em) mat(
      align: #right,
      1, 2, cblue(-1), -4;
      0, -1, cblue(0), 5.5;
      0, 0, cred(-10), -11
    )
  $
  $
    R_1 -> R_1 - 1/10 R_3 #h(4em) mat(
      align: #right,
      1, 2, cblue(0), -2.9;
      0, -1, cblue(0), 5.5;
      0, 0, cred(-10), -11
    )
  $

+ If the pivot is not $1$, scale accordingly:
  $
    R_3 -> -1/10 R_3 #h(4em) mat(
      align: #right,
      1, 2, cblue(0), -2.9;
      0, -1, cblue(0), 5.5;
      0, 0, cred(1), 1.1
    )
  $
+ Repeat steps 1 and 2 for the remaining pivot columns, moving leftward:
  $
    R_1 -> R_1 + 2 R_2 #h(4em) & mat(
      align: #right,
      1, cblue(0), 0, 8.1;
      0, cred(-1), 0, 5.5;
      0, cblue(0), 1, 1.1
    ) \
    R_2 -> -1 R_2 #h(4em) & mat(
      align: #right,
      1, cblue(0), 0, 8.1;
      0, cred(1), 0, -5.5;
      0, cblue(0), 1, 1.1
    ) \
    "left column is good" #h(4em) & mat(
      align: #right,
      cred(1), 0, 0, 8.1;
      cblue(0), 1, 0, -5.5;
      cblue(0), 0, 1, 1.1
    )
  $

This is now in reduced row echelon form (RREF), and we can read off the solution directly:
$
  (x_1, x_2, x_3) = (8.1, -5.5, 1.1).
$

This backward process is called *Jordan Elimination*, and the entire process of converting a matrix into RREF is called *Gauss-Jordan Elimination*.

#pagebreak()

== Vector & Matrix Equations

- A *column vector* is a matrix with a single column.
  - The set of all $n$-dimensional column vectors with real entries is denoted by $RR^n$.

- Vectors in $RR^2$ can be thought of as points or arrows in the Cartesian $x y$-plane, while vectors in $RR^3$ can be thought of as points or arrows in three-dimensional space.

#resource([Algebraic Properties of Vector Spaces])[
  + Commutative under addition: $bf(v)_1 + bf(v)_2 = bf(v)_2 + bf(v)_1$.
  + Associative under addition: $(bf(v)_1 + bf(v)_2) + bf(v)_3 = bf(v)_1 + (bf(v)_2 + bf(v)_3)$.
  + Additive identity: There exists a zero vector $bf(0)$ such that $bf(v) + bf(0) = bf(v)$ for all $bf(v) in RR^n$.
  + Additive inverses: For every $bf(v) in RR^n$, there exists a vector $-bf(v)$ such that $bf(v) + (-bf(v)) = bf(0)$.
  + Distributive properties: $c(bf(v)_1 + bf(v)_2) = c bf(v)_1 + c bf(v)_2$ and $(c_1 + c_2) bf(v) = c_1 bf(v) + c_2 bf(v)$.
  + Compatibility with scalar multiplication: $c_1 (c_2 bf(v)) = (c_1 c_2) bf(v)$.
  + Multiplicative identity: $1 bf(v) = bf(v)$ for all $bf(v) in RR^n$.
]

- A *vector space* is _any_ set of vectors that satisfies all the algebraic properties listed above. \ For example, $RR^n$ all subsets of $RR^n$ are vector spaces (for any $n$).
  - A *subspace* is a vector space that is contained within another vector space \
    #subtext[i.e., a vector space that is a subset of another vector space.]

- A *linear combination* of vectors $bf(v)_1, bf(v)_2, ..., bf(v)_n$ is an expression of the form:
  $
    c_1 bf(v)_1 + c_2 bf(v)_2 + ... + c_n bf(v)_n
  $
  where $c_1, c_2, ..., c_n$ are scalars. These scalars are called the *weights* of the linear combination.

- The *span* of a set of vectors is the set of all possible linear combinations of those vectors. The span of a set of vectors in $RR^n$ is always a subspace of $RR^n$.

#define("Span of a Set of Vectors")[
  Let $V = {bf(v)_1, bf(v)_2, ..., bf(v)_n} subset.eq RR^n$. The *span* of $V$, denoted $"span"(V)$ or $"span"{bf(v_1), bf(v)_2, ..., bf(v)_n}$, is the set of all linear combinations of the vectors in $V$:
  $
    "span"(V) = {bf(v) in RR^n | bf(v) = c_1 bf(v)_1 + c_2 bf(v)_2 + ... + c_n bf(v)_n "for" c_1, c_2, ..., c_n in RR}.
  $
  It holds that $"span"(V)$ is a subspace of $RR^n$.
]

- A matrix can be written in terms of column vectors representing its columns as follows:
  $
    A = mat(align: #right, bf(a)_1, bf(a)_2, ..., bf(a)_n)
  $
  where $bf(a)_i$ is the $i$#th column of $bf(A)$ for $i = 1, 2, ..., n$.

- A *vector equation* in the vectors $bf(v)_1, bf(v)_2, ..., bf(v)_n$ is an equation of the form:
  $
    c_1 bf(v)_1 + c_2 bf(v)_2 + ... + c_n bf(v)_n = bf(b)
  $
  where $c_1, c_2, ..., c_n$ are scalars and $bf(b)$ is a vector. It has the same solution set as the linear system whose augmented matrix is $mat(bf(v)_1, bf(v)_2, ..., bf(v)_n, bf(b))$.


=== Matrix Equations

Let $A$ be the $m times n$ matrix $display(mat(bf(a)_1, bf(a)_2, ..., bf(a)_n))$, such that $bf(a)_i$ is the $i$#th column of $A$. Let $bf(x)$ be the vector $vec(x_1, x_2, dots.v, x_n)$.

Then the *matrix product* $A bf(x)$ is defined as the linear combination of the columns of $A$ with weights given by the entries of $bf(x)$:
$
  A bf(x) = x_1 bf(a)_1 + x_2 bf(a)_2 + ... + x_n bf(a)_n.
$

Realize that $A bf(x)$ is a vector in $RR^m$. We can constrain this vector to equal another vector $bf(b)$ in $RR^m$ to get a *matrix equation*:
$
  A bf(x) = bf(b).
$

This matrix equation has the same solution set as the linear system whose augmented matrix is $display(mat(bf(a)_1, bf(a)_2, ..., bf(a)_n, bf(b)))$. In other words, a matrix equation is another way of representing a linear system.

So, we have four ways to represent a linear system: as a system of a linear equations, as an augmented matrix, as a vector equation, and as a matrix equation.

The coefficient matrix can tell us a few things:
- if all columns are pivot columns, there are no free variables. if the system is also consistent, then it has a unique solution. (i.e., if all columns are pivot columns, the system has at most one solution)
  - if there are free variables, then the system has infinitely many solutions (if it is consistent).

- if all rows are pivot rows, then the system MUST be consistent (at least one solution)

=== Transition Matrices

A *transition matrix*, *migration matrix*, or *Markov chain* $P$ describes the probabilities of each state transitioning to every other state in a system. They 
have the following properties:
- All entries are nonnegative: $P_(i j) >= 0$ for all $i, j$.
- The entries in each column sum to $1$.

Each column represents a probability distribution of one
state in the system transitioning to other states. 
For example, if $P_(i j) = p$, then there is a $p$ probability of transitioning from state $j$ to state $i$.

When multiplied by a vector $bf(v)$ representing the distribution of states at a given time, we get the distribution of those states at the next time step. Thus, transition matrices can be used to model the evolution of systems over time:
$
  bf(v)_"next" &= P bf(v) \
  bf(v)_("after" k "steps") &= P^k bf(v).
$

Some transition matrices have a special property that when multiplied by a vector representing the distribution of states, the distribution does not change. In other words, there may exist a vector $bf(v)$ such that $P bf(v) = bf(v)$. Such a vector is called a *steady state* or *equilibrium* of the system.

We can find a potential steady-state for the system by solving the equation $P bf(v) = bf(v)$, which is equivalent to solving the homogeneous system $(P - I) bf(v) = bf(0)$, where $I$ is the identity matrix.

// If $bf(v)_e$ is the steady-state of a system with transition matrix $P$, then for any starting distribution $bf(v)_0$:
// $
//   "If" P bf(v)_e = bf(v)_e,  lim_(k -> oo) P^k bf(v)_0 = bf(v)_e.
// $


#example("Applying a Transition Matrix")[
  $18000$ students live on campus. Each day, each student either brings their lunch or goes to the cafeteria to buy lunch.
  + On day 0, $9000$ brought lunch and $9000$ went to the cafeteria.
  + About $80%$ of students who brought lunch the previous day bring lunch again the next day.
  + About $60%$ of students who went to the cafeteria the previous day go to the cafeteria again the next day.

  How many students will bring lunch and how many will go to the cafeteria on day 1? On day 2? On day $k$? After an infinite number of days?

  #lorange

  We can represent the distribution of students on day $k$ as a vector $bf(v)_k = vec(b_k, c_k)$. \
  We are given $bf(v)_0 = vec(9000, 9000)$. \
  #subtext[$b_k$ is the number of students who bring lunch on day $k$ and $c_k$ is the number of students who go to the cafeteria on day $k$.]

  We can set up a grid to determine the transition probabilities:
  $$
]

#pagebreak()

== Solution Sets of Linear Systems

- A system of linear equations is *homogeneous* if it can be written in the form $A bf(x) = bf(0)$, where $A$ is the coefficient matrix and $bf(0)$ is the zero vector.
  - A homogeneous system is _always_ consistent because the *trivial solution* $bf(x) = bf(0)$ always satisfies the equation.

- For homogeneous systems, we are often interested in finding the *nontrivial solutions*.

#define("Existence of a Nontrivial Solution")[
  Let $A$ be the coefficient matrix of a homogeneous linear system. The system has a nontrivial solution if and only if the equation $A bf(x) = bf(0)$ has at least one free variable.
]

1. Let $bf(x) = bf(x)_h$ solve $A bf(x) = bf(0)$. Then, for any constant $c in RR$, $bf(x) = c bf(x)_h$ is also a solution to $A bf(x) = bf(0)$.
2. If $bf(x) = bf(p)$ solves $A bf(x) = bf(b)$, then the solution set of $A bf(x) = bf(b)$ is given by:
   $
     {bf(x) = bf(p) + bf(x)_h | A bf(x)_h = bf(0)}.
   $
   In other words, the solution set of a nonhomogeneous linear system with solution $bf(x) = bf(p)$ is a translation of the solution set of the corresponding homogeneous linear system by $bf(p)$. This is often referred to as the *Translation Theorem*.

#derivation("Proof: Translation Theorem")[
  Say $bf(x) = bf(x)_h$ is a solution for $A bf(x) = bf(0)$ and $bf(x) = bf(p)$ is a solution for $A bf(x) = bf(b)$. Then $bf(x) = bf(p) + bf(x)_h$ is also a solution for $A bf(x) = bf(b)$ because:
  $
    A bf(x) = A (bf(p) + bf(x)_h) = A
    bf(p) + A bf(x)_h = bf(b) + bf(0) = bf(b).
  $
]

#define("Uniqueness of Solutions")[
If the _only_ solution to $A bf(x) = bf(0)$ is the trivial solution $bf(x)_h = bf(0)$, then $A bf(x) = bf(b)$ has exactly one solution.
]

=== Summary

- Homogeneous systems $A bf(x) = bf(0)$ are always consistent, they have at least one _trivial_ solution $bf(x) = bf(0)$.

  - A homogeneous system has a _nontrivial_ solution if and only if it has at least one free variable, in which case it 
    will have _infinitely many_ solutions.

- Any system $A bf(x) = bf(b)$ with a known solution $bf(x) = bf(p)$ will _also_ have  the solution $bf(x) = bf(x)_h + bf(p)$ where $bf(x)_h$ is a solution to the corresponding homogeneous system $A bf(x) = bf(0)$.

  - If the homogeneous system only has the trivial solution, then the nonhomogeneous system will have a unique solution.
  -  Otherwise, if the homogeneous system has a nontrivial solution, then the nonhomogeneous system will have infinitely many solutions.

#pagebreak()

== Linear Independence

- Two vectors $bf(v)_1$ and $bf(v)_2$ in $RR^n$ are *linearly independent* if the only solution to the equation:
  $
    c_1 bf(v)_1 + c_2 bf(v)_2 = bf(0)
  $
  is the trivial solution $c_1 = 0$ and $c_2 = 0$.

- A set of vectors ${bf(v)_1, bf(v)_2, ..., bf(v)_n}$ in $RR^n$ is *linearly independent* if the only solution to the equation:
  $
    c_1 bf(v)_1 + c_2 bf(v)_2 + ... + c_n bf(v)_n = bf(0)
  $
  is the trivial solution $c_1 = c_2 = ... = c_n = 0$.

  - In other words, a set of vectors ${bf(v)_1, bf(v)_2, ..., bf(v)_n}$ is linearly independent if \ $"span"{bf(v)_1, bf(v)_2, ..., bf(v)_n} = RR^n$.

  - A set of one vector ${bf(v)}$ is linearly independent if and only if $bf(v) != bf(0)$.

  - Two vectors are linearly independent if and only if one is _any_ scalar multiple of the other.

- Conversely, a set of vectors is *linearly dependent* if there exists a nontrivial solution to the equation $c_1 bf(v)_1 + c_2 bf(v)_2 + ... + c_n bf(v)_n = bf(0)$.

  - If a set of vectors $V$ is linearly dependent, then at least one vector in $V$ is a linear combination of the others. Formally, $exists bf(v) in V$ such that $bf(v) in "span"(V without {bf(v)})$.

    In other words, if we can remove a vector from $V$ such that $"span"(V)$ remains the same, then (the original) $V$ is linearly dependent. 

- The columns of a matrix $A$ are linearly independent iff the only solution to $A bf(x) = bf(0)$ is the trivial solution $bf(x) = bf(0)$.

  - The only way a homogeneous system has a nontrivial solution is if it has infinite solutions, which only happens if there is at least one free variable. 
  
    Thus, the columns of $A$ are linearly independent iff there are no free variables (i.e., every column is a pivot column).
- If a set of vectors contains the zero vector, then the set is linearly dependent. This is because we can have a nontrivial solution by setting the weight of the zero vector to be any nonzero scalar and setting the weights of all other vectors to be zero.

- If a set of vectors contains more vectors than the number of entries in each vector, then the set is linearly dependent. This is because there must be at least one free variable.

  - That is, if a vector space $V subset.eq RR^n$ contains more than $n$ vectors, then $V$ is linearly dependent.
#derivation([Proof: If $V subset.eq RR^n$ and $abs(V) > n$, then $V$ is linearly dependent])[
  Let $V = {bf(v)_1, bf(v)_2, ..., bf(v)_m} subset.eq RR^n$ where $m > n$, so $abs(V) = m > n$. Consider the equation:
  $
    c_1 bf(v)_1 + c_2 bf(v)_2 + ... + c_m bf(v)_m = bf(0).
  $ 

  This is a linear system with $m$ variables and $n$ equations, with its coefficient matrix
  having $m$ columns and $n$ rows. Each row can only have at most one pivot, so there can be
  at most $n$ pivots. Since $m > n$, there are more variables than pivots, so there must be at least one variable without a pivot, i.e. a free variable. Thus, there is a nontrivial solution to the equation, so $V$ is linearly dependent. 
]

#pagebreak()

== Linear Transformations

- A *transformation* is a function from one vector space to another. $T: RR^n -> RR^m$
  - Here, $RR^n$ is called the *domain* of $T$, and $RR^m$ is called the *codomain* of $T$.
  - The transformation of a vector $bf(v)$ by $T$ is denoted by $T(bf(v))$, and is called the *image* of $bf(v)$ under $T$.
  - The set of all images of vectors in the domain of $T$ is called the *range* of $T$.
  - If $T(bf(u)) = bf(v)$, then we can use the shorthand notation $bf(u) |-> bf(v)$.

- A transformation $T$ is *linear* if two properties are satisfied:
  - $T(bf(u) + bf(v)) = T(bf(u)) + T(bf(v))$ for all vectors $bf(u)$ and $bf(v)$ in the domain of $T$.
  - $T(c bf(v)) = c T(bf(v))$ for all vectors $bf(v)$ in the domain of $T$ and all scalars $c$.

- A linear transformation $T$ thus have the following properties, all of which can be derived from the two properties above:
  - Identity element: $T(bf(0)) = bf(0)$
  - Superposition: $T(c_1 bf(u) + c_2 bf(v)) = c_1 T(bf(u)) + c_2 T(bf(v))$

- Common linear transformations include:
  - The *zero transformation* $T(bf(v)) = bf(0)$ for all $bf(v)$ in the domain of $T$.
  - The *identity transformation* $T(bf(v)) = bf(v)$ for all $bf(v)$ in the domain of $T$.
  - The *contraction* or *dilation* transformation $T(bf(v)) = c bf(v)$.

=== Introduction to Matrix Transformations

- The transformation $T(bf(v)) = A bf(v)$ is called a *matrix transformation*, where $A$ is called the *standard matrix* of $T$.

  - An $m times n$ standard matrix results in a linear transformation from $RR^n -> RR^m$.
    - In fact, _any_ linear transformation from $RR^n -> RR^m$ can be represented as a matrix transformation with a UNIQUE $m times n$ standard matrix:
    $
      T "is linear" <==> exists! A "such that" T(bf(v)) = A bf(v) "for all" bf(v) in RR^n.
    $

  - The range of a matrix transformation $T(bf(v)) = A bf(v)$ is equal to the column space of $A$. \
    #subtext[The column space of $A$ is the span of the columns of $A$.]

- The columns of the standard matrix are what transformation does to the *standard basis vectors*.
  - The standard basis vectors in $RR^n$ are the vectors $bf(e)_1, bf(e)_2, ..., bf(e)_n$ where $bf(e)_i$ has a $1$ in the $i$#th entry and $0$ in all other entries. For example, in $RR^2$, the standard basis vectors are $bf(e)_1 = vec(1, 0)$ and $bf(e)_2 = vec(0, 1)$. \
    #subtext[The standard basis vectors are the columns of the identity matrix $I_n$.]

  - Multiplying a matrix $A$ by the standard basis vector $bf(e)_i$ gives us the $i$#th column of $A$: $A bf(e)_i = bf(a)_i$ where $bf(a)_i$ is the $i$#th column of $A$.

  - If $A$ is the standard matrix of a linear transformation $T: RR^n -> RR^m$, then:
    $
      A = mat(T(bf(e)_1), T(bf(e)_2), ..., T(bf(e)_n)).
    $
    In other words, the $i$#th column of $A$ is $T(bf(e)_i)$. 

#pagebreak()

=== One-to-One and Onto Transformations

Let $T: RR^n -> RR^m$ be a linear transformation with standard matrix $A$, so $T(bf(v)) = A bf(v)$.

- $T$ is *one-to-one* or *injective* if every vector in the codomain is the image of _at most_ one vector in the domain.

  - This is a question of _uniqueness_. If $bf(x) = bf(v)$ is a solution to $A bf(x) = bf(b)$, is $bf(v)$ the only solution? Either it is the only solution or it has infinitely many solutions. The latter is only possible if there is a free variable, i.e. if there is a nonpivot column. Applying the contrapositive, *if all columns of $A$ are pivot columns, then $T$ is one-to-one*.

- $T$ is *onto* or *surjective* if every vector in the codomain is the image of _at least_ one vector in the domain. In other words, the range of $T$ is equal to the codomain of $T$.

  - This is a question of _existence_. For every $bf(b)$ in the codomain, does there exist a solution to $A bf(x) = bf(b)$? In other words, is the matrix $display(mat(A, bf(b)))$ consistent for all $bf(b)$? We cannot have a pivot in $bf(b)$, so we _must_ have a pivot in every row of $A$. So, *if all rows of $A$ are pivot rows, then $T$ is onto*.  
 
- $T$ is *bijective* if it is both *one-to-one and onto*, i.e. every vector in the codomain is the image of _exactly one_ vector in the domain.  

  - This is a question of _existence and uniqueness_. *If there is a pivot in every row and every column of $A$, then $T$ is one-to-one and onto*.
  - If $n = m$, i.e. if $T: RR^n -> RR^n <==> A$ is a square matrix, then $T$ is either _both_
    one-to-one and onto, or _neither_ one-to-one nor onto. 

=== Common Matrix Transformations

_Recall that ALL linear transformations can be represented as matrix transformations._

- The *identity transformation* $"Id"(bf(v)) = bf(v)$. This means $"Id"(bf(e)_1) = bf(e)_1$, $"Id"(bf(e)_2) = bf(e)_2$, ..., $"Id"(bf(e)_n) = bf(e)_n$.
  - The standard matrix of the identity transformation is the *identity matrix* $I_n$. It is the $n times n$ square matrix with ones in the diagonal and zeros everywhere else.
  $
    "Id"(bf(v)) = I_n bf(v) "  where  " I_n = mat(align: #right,
      1, 0, ..., 0;
      0, 1, ..., 0;
      dots.v, dots.v, dots.down, dots.v;
      0, 0, ..., 1
    )_(n times n)
  $

- The *rotation transformation* $T(bf(v)) = R bf(v)$, where $R$ is a rotation matrix. For example, in $RR^2$, the rotation transformation that rotates vectors by an angle of $theta$ counterclockwise about the origin has the standard matrix:
  $
    R = mat(cos theta, -sin theta; sin theta, cos theta).
  $

- The *shear transformation* $T(bf(v)) = S bf(v)$, where:
  $
    S = mat(1, k; 0, 1) "or" S = mat(1, 0; k, 1).
  $
  One axis is fixed, while the other axis is shifted.

=== Summary

- Every linear transformation can be represented as a matrix transformation $T(bf(v)) = A bf(v)$, where $A$ is the standard matrix of $T$.
  - To find $A$, apply $T$ to the standard basis vectors $bf(e)_1, bf(e)_2, ..., bf(e)_n$ and use the resulting vectors as the columns of $A$.

- The range of a matrix transformation is equal to
  the column space of its standard matrix.

- A matrix transformation with standard matrix $A$ is:
  - *one-to-one* if $A$ has a pivot in every column (satisfies uniqueness) 
  - *onto* if $A$ has a pivot in every row (satisfies existence)
  - *bijective* if $A$ is both one-to-one and onto (satisfies uniqueness and existence)


#pagebreak()

= Matrix Algebra

== Matrix Operations

#define("Matrix Multiplication")[
  Let $A$ be an $m times p$ matrix and $B$ be an $p times n$ matrix. The *matrix product* $A B$ is the $m times n$ matrix where the entry in the $i$#th row and $j$#th column is given by:
  $
    (A B)_(i j) = sum_(k=1)^p a_(i k) b_(k j).
  $
  $A B$ represents the transformation that results from first applying the transformation represented by $B$, followed by the transformation represented by $A$.
]

- In other words, to compute the entry in the $i$#th row and $j$#th column of the product matrix $A B$, we take the dot product of the $i$#th row of $A$ with the $j$#th column of $B$:
  $
    (A B)_(i j) = bf(a)_(i *) dot bf(b)_(* j).
  $

- Another way to think about matrix multiplication is that each column of the product matrix $A B$ is obtained by multiplying $A$ by the corresponding column of $B$:
  $
    A B = mat(A bf(b)_1, A bf(b)_2, ..., A bf(b)_n)
  $
  where $bf(b)_j$ is the $j$#th column of $B$ for $j = 1, 2, ..., n$.

- If $A$ and $B$ are matrices with appropriate dimensions, $A B$ is the standard matrix of the transformation $T(U(bf(v)))$ where $T(bf(v)) = A bf(v)$ and $U(bf(v)) = B bf(v)$.
  - The transformation with standard matrix $A^n$ is the transformation that results from applying the transformation with standard matrix $A$ $n$ times in a row. This is only valid if $A$ is square.

- Matrix multiplication does *not* commute. In other words, $A B$ is not necessarily equal to $B A$, and in some cases, $B A$ may not even be defined.

- Matrix multiplication is associative, so $(A B) C = A (B C)$.

- If $A B = A C$, $B = C$ *only if* $A$ is invertible. \ Otherwise, $A B = A C$ does not necessarily imply $B = C$.

#resource("Algebraic Properties of Matrix Spaces")[
  + Commutative under addition: $A + B = B + A$.
  + Associative under addition: $(A + B) + C = A + (B + C)$.
  + Additive identity: There exists a zero matrix $O$ such that $A + O = A$ for all matrices $A$.
  + Additive inverses: For every matrix $A$, there exists a matrix $-A$ such that $A + (-A) = O$.
  + Distributive under scalar multiplication: $c (A + B) = c A + c B$ and $(c_1 + c_2) A = c_1 A + c_2 A$.
  + Distributive under matrix multiplication: $A (B + C) = A B + A C$ and $(A + B) C = A C + B C$.
  + Compatibility with scalar multiplication: $c_1 (c_2 A) = (c_1 c_2) A$.
]

=== Properties of Matrix Transposes

#define("Matrix Transpose")[
  The *transpose* of an $m times n$ matrix $A$, denoted $A^transpose$, is the $n times m$ matrix obtained by 
  interchanging the rows and columns of $A$. In other words, the entry in the $i$#th row and 
  $j$#th column of $A^transpose$ is equal to the entry in the $j$#th row and $i$#th 
  column of $A$: $
    (A^transpose)_(i j) = A_(j i).
  $
]

- The transpose of an $m times n$ matrix is an $n times m$ matrix.

- It holds that $(A^transpose)^transpose = A$.

- If $A$ and $B$ have the same size, $(A + B)^transpose = A^transpose + B^transpose$.

- If $A$ is an $m times p$ matrix and $B$ is a $p times n$ matrix, then $(A B)^transpose = B^transpose A^transpose$ is an $n times m$ matrix.

=== Properties of Inner and Outer Products

#define("Inner Product of Two Vectors")[
  The *inner product* of two (column) vectors $bf(u)$ and $bf(v)$ in $RR^n$ is given by:
  $
    bf(u) dot bf(v) = bf(u)^transpose bf(v) = u_1 v_1 + u_2 v_2 + ... + u_n v_n.
  $
  In other words, the inner product is simply the dot product.
]

#define("Outer Product of Two Vectors")[
  The *outer product* of two (column) vectors $bf(u)$ and $bf(v)$ in $RR^n$ is given by:
  $
    bf(u) times.o bf(v) = bf(u) bf(v)^transpose = mat(
      u_1 v_1, u_1 v_2, ..., u_1 v_n; u_2 v_1, u_2 v_2, ..., u_2 v_n; 
      dots.v, dots.v, dots.down, dots.v; 
      u_n v_1, u_n v_2, ..., u_n v_n).
  $
]

- Inner and outer products only exist for vectors with the same number of components.

- Only inner products commute:
  $bf(u) dot bf(v) = bf(v) dot bf(u)$.

- Outer products don't commute, flipping the order gives you the transpose:
  $bf(u) times.o bf(v) = (bf(v) times.o bf(u))^transpose$.

=== Partitioned Matrices

#pagebreak()

== The Inverse of a Matrix

- An $n times n$ matrix $A$ is *invertible* (or *nonsingular*) if there exists an $n times n$ matrix $B$ such that:
  $
    A B = I_n "and" B A = I_n,
  $
  where $I_n$ is the $n times n$ identity matrix.
  - The matrix $B$ is called the *inverse* of $A$, denoted $A^(-1)$.
  - The inverse of a matrix is unique (if it exists).

- If a matrix is not invertible, it is called *singular*.

- If $A$ is invertible, then the transformation $bf(x) |-> A bf(x)$ is both _one to one and onto_.
  - In other words, $forall bf(b) in RR^n$, the equation $A bf(x) = bf(b)$ has _exactly one_ solution given by $bf(x) = A^(-1) bf(b)$.

#derivation([Proof: If $A$ is invertible, then $A bf(x) = bf(b)$ has exactly one solution for $bf(x) space forall bf(b)$])[
  Let $A$ be an invertible matrix with inverse $A^(-1)$. Then, for any $bf(b)$ in $RR^n$, we can multiply both sides of the equation $A bf(x) = bf(b)$ by $A^(-1)$ to get:
  $
    A^(-1) A bf(x) & = A^(-1) bf(b) \
    I_n bf(x) & = A^(-1) bf(b) \
    bf(x) & = A^(-1) bf(b).
  $
  Thus, there is at least one solution to the equation. To show that there is at most one solution, say $bf(x)_1$ and $bf(x)_2$ are two solutions to the equation. Then:
  $
    A bf(x)_1 & = A bf(x)_2 \
    A (bf(x)_1 - bf(x)_2) & = bf(0).
  $
  Since $A$ is invertible, the only solution to the equation $A bf(x) = bf(0)$ is the trivial solution $bf(x) = bf(0)$, so we must have $bf(x)_1 - bf(x)_2 = bf(0)$, which means $bf(x)_1 = bf(x)_2$. Thus, there is at most one solution to the equation.
]

- An $m times n$ matrix is *left invertible* if there exists an $n times m$ matrix $B$ such that $B A = I_n$. An $m times n$ matrix is *right invertible* if there exists an $n times m$ matrix $C$ such that $A C = I_m$. 

  - While _only_ square matrices can be invertible, non-square matrices can be either left or right invertible, but not both.

=== Properties of Inverses

- Let $display(A = mat(a, b; c, d))$ be a $2 times 2$ matrix. $A$ is invertible iff $a d - b c != 0$, where its inverse is given by:
  $
    A^(-1) = 1 / (a d - b c) mat(align: #right, d, -b; -c, a).
  $

- If $A$ is invertible, then $A^(-1)$ is also invertible and its inverse is $A$: $(A^(-1))^(-1) = A$.

- The inverse of a matrix transformation $T(bf(x)) = A bf(x)$ is $T^(-1)(bf(x)) = A^(-1) bf(x)$.
  - By the definition of an inverse, $T(T^(-1)(bf(x))) = T^(-1)(T(bf(x))) = bf(x).$

- $(A B)^(-1) = B^(-1) A^(-1)$ (the combined transformation happens in reverse order)

- $(A^transpose)^(-1) = (A^(-1))^transpose$

#pagebreak()

#resource("Invertible Matrix Theorem")[
  Let $A$ be an $n times n$ matrix. The following statements are equivalent (i.e. all true or all false):
  + $A$ and/or $A^transpose$ is invertible.
  + $A$ is row-reducible to $I_n$.
  + $A$ has $n$ pivot positions.
  + The equation $A bf(x) = bf(0)$ only has the solution $bf(x) = bf(0)$.
  + The columns of $A$ are linearly independent.
  + The linear transformation $bf(x) |-> A bf(x)$ is one-to-one and/or onto (in/sur/bijective).
  + The equation $A bf(x) = bf(b)$ has at least one solution for each $bf(b)$ in $RR^n$.
  + The columns of $A$ span $RR^n$.
  + There exists an $n times n$ matrix $C$ such that $C A = I_n$.
  + There exists an $n times n$ matrix $D$ such that $A D = I_n$.
]

=== Elementary Matrices & Finding Inverses By Hand

- An *elementary matrix* that is at most one elementary row operation away from the associated identity matrix. All elementary matrices are invertible.

- Let $E$ be the elementary matrix obtained by performing the elementary row operation $R$ on the identity matrix. Then for any matrix $A$, $E A$ is the matrix obtained by performing the elementary row operation $R$ on $A$.

  - In other words, the elementary matrix is the standard matrix for the transformation that performs the row operation $R$. 

  - Thus, it can be interpreted that an elementary matrix represents or corresponds with a certain elementay row operation.

- If a matrix $A$ is invertible, then $A$ is *row equivalent* to the identity matrix $I$.
  - In other words, there exists a sequence of elementary row operations that transforms $A$ into $I$. When the same sequence of elementary row operations is applied to $I$, we get $A^(-1)$.

#derivation([Proof: A sequence of row operations $S$ s.t. $S(A) = I$ also satisfies $S(I) = A^(-1)$])[
  Suppose $A$ is invertible, so there exists a sequence of elementary row operations $S$ such that $S(A) = I$. Let $E_1, E_2, ..., E_k$ be the elementary matrices corresponding to the row operations in $S$, so $S(A) = E_k ... E_2 E_1 A = I$. Then, we can multiply both sides of the equation by $A^(-1)$ to get:
  $
    E_k ... E_2 E_1 A A^(-1) & = I A^(-1) \
    cgreen(E_k ... E_2 E_1 I & = A^(-1)).
  $
]

- To find the inverse of a matrix $A$, perform and record a sequence of elementary row operations to bring $A$ into $I$. Then, apply the same sequence of elementary row operations to $I$ to get $A^(-1)$.

  - To do these steps at the same time, we can invert matrix $A$ by *row reducing the augmented matrix $display(mat(A, I))$ to $display(mat(I, A^(-1)))$*.

== $L U$ Factorization

- A matrix $A$ can be factored into the product of a lower triangular matrix $L$ and an upper triangular matrix $U$, such that $A = L U$. This is called the *$L U$ factorization* of $A$.

  - The LU factorization of a matrix $A$ can be used to solve the equation $A bf(x) = bf(b)$ by first solving $L bf(y) = bf(b)$ for $bf(y)$ using forward substitution, and then solving $U bf(x) = bf(y)$ for $bf(x)$ using back substitution. \
    #subtext[If we let $A = L U$ and $bf(y) = U bf(x)$, then $A bf(x) = (L U) bf(x) = L (U bf(x)) = L bf(y)$. So, the equation $A bf(x) = bf(b)$ becomes $L bf(y) = bf(b)$.]

#table(align: horizon + center, columns: (1fr, 1fr), 
  stroke: none,
  table.header[==== Lower Triangular Matrix $L$][==== Upper Triangular Matrix $U$],
  subtext[Used for *forward* substitution, $L bf(y) = bf(b)$], 
  subtext[Used for *back* substitution, $U bf(x) = bf(y)$],
  $
    mat(
      cblue(*), cgray(0), cgray(0), cgray(dots.h), cgray(0);
      *, cblue(*), cgray(0), cgray(dots.h), cgray(0);
      *, *, cblue(*), cgray(dots.h), cgray(0);
      dots.v, dots.v, dots.v, cblue(dots.down), cgray(dots.v);
      *, *, *, dots.h, cblue(*)
    )
  $,
  $
    mat(
      cblue(*), *, *, ..., *;
      cgray(0), cblue(*), *, ..., *;
      cgray(0), cgray(0), cblue(*), ..., *;
      cgray(dots.v), cgray(dots.v), cgray(dots.v), cblue(dots.down), dots.v;
      cgray(0), cgray(0), cgray(0), cgray(...), cblue(*)
    )
  $
)
The upper triangular matrix $U$ can be obtained by reducing matrix $A$ to row echelon form. 
Let the $i$#th row operation used to achieve $U$ be represeted using the elementary matrix $E_i$. Then:
$
  U = E_k ... E_2 E_1 A.
$

If we let $A = L U$, then $U = E_k ... E_2 E_1 A = L^(-1) A$. 

=== Finding the $L U$ Factorization of a Matrix

Any invertible matrix $A$ can be factored into $L U$ by reducing $A$ to row echelon form to get $U$, and then using the row operations used to get $U$ to construct $L$.

Start with the identity matrix $I$ and the original matrix $A$. Reduce $A$ to row echelon form $U$ by performing *only row replacement operations*. Every time the operation $R_i <- R_i - k R_j$ is performed, record $k$ as the entry in the $i$#th row of $L$, in the same column we are reducing.

A shortcut is to take the subcolumn of the column we are reducing, starting from the pivot and going down, and scale it by $1 / "pivot"$ to get the entries in the corresponding column of $L$. This should be done _before_ we begin reducing such column.

//  using *only row replacement operations* (operations of the type $R_i <- R_i + m R_j$ where $i > j$)

// Every time we finish reducing a column, record the elements at and below the pivot. These elements, scaled by $1 / "pivot"$, will be the entries in the corresponding column of $L$.

#example([Finding and using the $L U$ factorization of a matrix])[
  Find the $L U$ factorization of the matrix $A = display(mat(align: #right, 2, -1, 1; 3, 3, 9; 4, 2, 2))$, and use it to solve $display(A bf(x) = vec(2, 2, 2))$ for $bf(x)$.
  #lorange
  To find the $L U$ factorization of $A$, we first reduce $A$ to row echelon form to get $U$. 

  To reduce the first column:

]

#pagebreak()

== Homogeneous Coordinates

- A transformation which shifts/translates points geometrically cannot be done with a matrix transformation. That is, a translation is not a linear transformation.
  - This is easy to see: $T(bf(0)) = bf(0)$ if $T$ is linear. The origin cannot shift.

- *Homogeneous coordinates* add an extra dimension to ordinary coordinates so that they can capture translations in linear transformations.

  - The coordinate $(x, y)$ in $RR^2$ is equivalent to the homogeneous coordinate $(x, y, 1)$ in $RR^3$

  - The homogeneous coordinate $(x, y, z)$ is equivalent to the coordinate $display((x / z, y / z))$ in $RR^2$ ($z != 0$).

  #define("Homogeneous Coordinates")[
    The coordinate $(x_1, x_2, ..., x_n)$ in $RR^n$ is equivalent to the homogeneous coordinate in $RR^(n+1)$: $
      (lambda x_1, lambda x_2, ..., lambda x_n, lambda) "for any nonzero" lambda.
    $
  ]

  - Homogeneous coordinates work because they treat ordinary coordinates as a leveled "plane" in a higher dimension such that any translations in the plane can be reached from the origin. 

- In homogeneous coordinates, we can represent translations as matrix transformations. For example, the translation that shifts points by $vec(h, k)$ can be represented by the matrix transformation with standard matrix:
  $
    mat(
      align: #right,
      1, 0, h; 0, 1, k; 0, 0, 1
    ) 
    mat(x; y; 1) = mat(x + h; y + k; 1).
  $ 

  #define("Standard Translation Matrix")[
    The *standard translation matrix* that shifts points in $RR^n$ by $bf(h) = (h_1, h_2, ..., h_n)$ is given by the standard _homogeneous_ transformation matrix:
    $
      A = mat(
        align: #right,
        I_n, bf(h); bf(0), 1
      ) "where" I_n "is the" n times n "identity matrix".
    $
    It holds that $display(A vec(bf(x), 1) = vec(bf(x) + bf(h), 1))$.
  ]

- For example, in $RR^3$, the translation that shifts points by $(h, k, l)$ can be represented by the matrix transformation with standard matrix:
  $
    mat(
      align: #right,
      1, 0, 0, h; 0, 1, 0, k; 0, 0, 1, l; 0, 0, 0, 1
    ) 
    mat(x; y; z; 1) = mat(x + h; y + k; z + l; 1).
  $

- Any standard transformation matrix $A$ has an equivalent matrix to transform homogeneous coordinates given by $display(mat( A, bf(0); bf(0), 1))$. For example, the standard rotation matrix $R_theta$ is equivalent to:
  $
    mat(
      align: #right,
      cos theta, -sin theta, 0;
      sin theta, cos theta, 0;
      0, 0, 1
    )
  $

=== Affine Transformations



=== Projective Transformations

- A *projection* or a *projective transformation* is a transformatio that maps points from $RR^n$ to a lower dimension $RR^m$, where $m < n$. 

- A *perspective projection* is a type of projective transformation that maps points from $RR^n$ to $RR^(n-1)$. In $RR^3$, a perspective projection maps points from $RR^3$ to $RR^2$---that is---onto a plane.

  - A perspective projection in $RR^3$ maps a coordinate $(x, y, z)$ onto an image point $(x^*, y^*, 0)$ such that a chosen *center point*, is colinear with the original point and its image.

    - In other words, if a projective projection of a point $(x, y, z)$ through a center point $(a, b, c)$ is $(x^*, y^*, 0)$, then we can draw line through ${(x, y, z), (a, b, c), (x^*, y^*, 0)}$.
  
  - This way, if the center point is $(a, b, c)$, then the projection of the center point is just $(a, b, 0)$.

- Let a perspective projection in $RR^3$ have center point $(0, 0, d)$. Then, the perspective projection of a point $(x, y, z)$ is given by the homogeneous matrix:
  $
    mat(
      align: #right,
      1, 0, 0, 0;
      0, 1, 0, 0;
      0, 0, 0, 0;
      0, 0, -1 slash d, 1
    )
  $

#pagebreak()

= Determinants

== Introduction to Determinants 

- The *determinant* of a square matrix is a scalar value which represents the factor by which the area/volume of a region is scaled when the linear transformation associated with the matrix is applied to that region.

- If the determinant of a matrix is zero, the linear transformation compresses the area/volume to zero and we cannot reverse the transformation (i.e., the matrix is not invertible). 

  - In fact, the determinant is nonzero *iff* the matrix is invertible.

#define("Determinant of a Matrix")[
  The *determinant* ($det A$ or $abs(A)$) of an $n times n$ matrix $A$ ($n >= 2$) is: 
  $
    det A = sum_(j=1)^n (-1)^(1+j) a_(1 j) det(M_(1 j))
  $ 
  where $M_(1 j)$ is the *minor* of $A$ at row $1$, column $j$, which is the $(n-1) times (n-1)$ matrix that results from deleting row $1$ and column $j$ from $A$.
]

- The determinant of a $2 times 2$ matrix $mat(a, b; c, d)$ is $a d - b c$. (We can write $mat(delim: "|", a, b; c, d) = a d - b c$.)

=== Cofactor Expansion

We can actually expand along any row or column, not just the first row: 
$
  det A = sum_(j=1)^n (-1)^(i+j) a_(i j) det(M_(i j)) & #h(3em) "expansion along" i#super("th") "row" \
  det A = sum_(i=1)^n (-1)^(i+j) a_(i j) det(M_(i j)) & #h(3em) "expansion along" j#super("th") "column"
$

All expansions will yield the same determinant. Notice the sign $(-1)^(i+j)$ follows a checkerboard pattern,
allowing us to easily determine whether to add or subtract each term: 
$
  mat(+, -, +, -; -, +, -, +; +, -, +, -; -, +, -, +) #h(3em)
$ 

The *cofactor* of an entry $a_(i j)$ is defined as $c_(i j) = (-1)^(i+j) det(M_(i j))$, capturing what we multiply by $a_(i j)$ in the determinant expansion. The *cofactor matrix* $C$ of an $n times n$ matrix $A$ is the matrix where each entry $c_(i j)$ is the cofactor of $a_(i j)$.

Computing determinants using cofactors is known as the method of *cofactor expansion*:
$
  det A = sum_(i=1)^n a_(i j) c_(i j) "for any" j 
        = sum_(j=1)^n a_(i j) c_(i j) "for any" i.
$

#example("Using the Cofactor Expansion")[
  Show that the cofactor expansion along the first row of a $3 times 3$ matrix results in the same determinant as the expansion along the second column.
  #lorange
  Let $A = mat(a, b, c; d, e, f; g, h, i)$. The cofactor expansion along the first row is:
  $
    det A &= a mat(delim: "|", e, f; h, i) - b mat(delim: "|", d, f; g, i) + c mat(delim: "|", d, e; g, h) \
          &= a(e i - f h) - b(d i - f g) + c(d h - e g) \
          &= a e i - a f h - b d i + b f g + c d h - c e g.
  $
  The cofactor expansion along the second column is:
  $
    det A &= -b mat(delim: "|", d, f; g, i) + e mat(delim: "|", a, c; g, i) - h mat(delim: "|", a, c; d, f) \
          &= -b(d i - f g) + e(a i - c g) - h(a f - c d) \
          &= -b d i + b f g + e a i - e c g - h a f + h c d \
          &= a e i - a f h - b d i + b f g + c d h - c e g.
  $
  Thus, both expansions yield the same determinant.
]

#note[
  Cofactor expansion is an inefficient method, as it requires computing the determinant of many smaller matrices. It is an $cal(O)(n!)$ operation.
]

#pagebreak()

== Properties of Determinants

=== Determinant of a Triangular Matrix

Let $L$ be a lower triangular matrix, and let $U$ be an upper triangular matrix:
$
  L = mat(
    align: #right,
    l_1, 0, 0, ..., 0;
    *, l_2, 0, ..., 0;
    *, *, l_3, ..., 0;
    dots.v, dots.v, dots.v, dots.down, dots.v;
    *, *, *, ..., l_n
  ) #h(4em) U = mat(
    align: #right,
    u_1, *, *, ..., *;
    0, u_2, *, ..., *;
    0, 0, u_3, ..., *;
    dots.v, dots.v, dots.v, dots.down, dots.v;
    0, 0, 0, ..., u_n
  )
$

Then: $
  det L &= l_1 l_2 l_3 ... l_n. \
  det U &= u_1 u_2 u_3 ... u_n.
$ 

That is, the determinant of a triangular matrix is the product of the entries on its main diagonal.

#derivation([Proof: $det L$ is the product of the entries on the main diagonal of $L$])[
  Let $L$ be a lower triangular matrix as defined above. We can compute $det L$ by expanding along the first row:
  $
    det L = l_1 det(M_(1 1)) + 0 + 0 + ... + 0 = l_1 det(M_(1 1)).
  $
  The minor $M_(1 1)$ is also a lower triangular matrix with main diagonal entries $l_2, l_3, ..., l_n$. Thus, we can apply the same reasoning to compute $det(M_(1 1))$ by expanding along its first row, and so on until we reach a $1 times 1$ matrix. This gives us:
  $
    det L = l_1 det(M_(1 1)) = l_1 l_2 det(M_(2 2)) = ... = l_1 l_2 ... l_n.
  $
]

=== Effects of Row Operations on the Determinant

- The three elementary row operations affect the determinant as follows:
  + Swapping two rows multiplies the determinant by $-1$.
  + Multiplying a row by a scalar $k$ multiplies the determinant by $k$.
  + Adding a multiple of one row to another row does not change the determinant.

- Using these properties, the determinant of a matrix is nonzero *iff* the matrix is row-reducible to a triangular matrix with no zeros on the main diagonal.

- $det(k A) = k^n det(A)$ for an $n times n$ matrix $A$, as it is equivalent to multiplying each row of $A$ by $k$.

=== Determinant of Matrix Products

Let $A$ and $B$ be $n times n$ matrices. Then: $
  det(A B) = det A det B.
$

Using these properties, the determinant of a matrix $A$ can be computed by factorizing the matrix into $A = L U$, and then using $det A = det L det U$ to compute the determinant of $A$ in $cal(O)(n^3)$ time, which is more efficient than the $cal(O)(n!)$ time required by cofactor expansion.

=== Determinant of Matrix Transposes

- Transposing a matrix does not change its determinant: $
    det A = det A^transpose
  $

=== Determinant of Matrix Inverses

If $A$ is invertible, then:
$
  det(A^(-1)) = 1 / (det A)
$
Thus, if $det A = 0$, then $det(A^(-1))$ is undefined and $A^(-1)$ cannot exist. In fact, the determinant of a matrix is nonzero *iff* the matrix is invertible.

#derivation([Proof: $det(A^(-1)) = 1 / (det A)$])[
  Assume $A$ is an invertible matrix. Then, we can write $A$ as a product of elementary matrices acting on the identity $I_n$: $
    A = E_k ... E_2 E_1 cgray(I_n) #h(4em) A^(-1) = E_1^(-1) E_2^(-1) ... E_k^(-1) cgray(I_n)
  $
  where $E_i$ are elementary matrices. Then:
  $
    det(A^(-1)) & = det(E_1^(-1) E_2^(-1) ... E_k^(-1)) \
                & = det(E_1^(-1)) det(E_2^(-1)) ... det(E_k^(-1)).
  $
  Each elementary matrix is invertible, and the determinant of an elementary matrix is either $-1$, $k$, or $1$ depending on the type of row operation it corresponds to. Thus, the determinant of the inverse of an elementary matrix is either $-1$, $1/k$, or $1$. Therefore, we have:
  $
    det(A^(-1)) & = det(E_1^(-1)) det(E_2^(-1)) ... det(E_k^(-1)) \
                & = (det E_1)^(-1) (det E_2)^(-1) ... (det E_k)^(-1) \
                & = 1 / (det E_1 det E_2 ... det E_k) \
                & = 1 / (det A).
  $
]

=== Linearity of (a) Determinant Function

Let $A$ be an $n times n$ matrix, and let $f$ be a function of each of the $n$ column vectors of $A$, such that the domain of $f$ is $RR^n$. Then, if we define $f$ to be the following:
$
  f(bf(x)) = det mat(bf(a)_1, bf(a)_2, ..., bf(a)_(i - 1), bf(x), bf(a)_(i + 1), ..., bf(a)_n)
$

Then $f: RR^n -> RR$ is a linear transformation. That is, we take the _determinant_ of the matrix formed by replacing a particular chosen column, say the $i$#th column, of $A$ with the input vector $bf(x)$. 

In other words, we can treat the determinant as a linear function *iff* all but one columns are fixed in the matrices we provide as inputs, in which case it is linear with respect to the unfixed column.

#pagebreak()

== Cramer's Rule

#define("Cramer's Rule")[
  Let $A$ be an invertible $n times n$ matrix, and $bf(b) in RR^n$. Then the unique solution $bf(x)$ to the equation $A bf(x) = bf(b)$ has entries given by:
  $
    x_i = (det A_i)/(det A) "for" i = 1, 2, ..., n
  $
  where $A_i$ is the matrix that results from replacing the $i$#th column of $A$ with the column vector $bf(b)$, or in other words: 
  $
    (A_i)_(j k) = cases(
      b_j & "if" k = i,
      a_(j k) & "otherwise"
    )
  $
]

- To put it simply, Cramer's Rule allows us to solve for a particular variable in a system of linear equations.
  + Take the determinant of the coefficient matrix $A$, this is the denominator ($det A$).
  + Replace the $i$#th column of $A$ with the constants from the right-hand side of the equations to form $A_i$, and take its determinant, this is the numerator ($det A_i$).
  + The solution for the variable whose coefficients were in the $i$#th column ($x_i$) is $x_i = (det A_i)/(det A)$.

- Realize that the coefficient matrix must be square, i.e. we must have the same number of equations as unknowns. 
  - Additionally, the coefficient matrix must be invertible (i.e., $det A != 0$) for Cramer's Rule to be applicable.
    Otherwise, the system may have no solutions or infinitely many solutions.

- Cramer's Rule is most efficient for solving one variable in large systems, but may not be the best method for
  solving for all variables (since it involves calculating $n + 1$ determinants).

=== The Adjugate Matrix

#let adj = $"adj" thin$

Recall that if $A$ is invertible, then the vector $bf(x)_j$ whcih satisfies $A bf(x)_j = bf(e)_j$ is the $j$#th column of $A^(-1)$. This is because if $B = A^(-1)$, then $A B = I$ and $display(mat(A bf(b)_1, A bf(b)_2, ..., A bf(b)_n) = mat(bf(e)_1, bf(e)_2, ..., bf(e)_n))$.

By Cramer's Rule, the $j$#th column of $A^(-1)$ is given by:
$
  (A^(-1))_(i j) = (det A_i)/(det A) "for" i = 1, 2, ..., n
$

The $j$#th column of $A_i$ is just $bf(e)_j$, so a cofactor expansion down that column is:
$
  det A_i = 0 + 0 + ... + (-1)^(j + i) (1) det(M_(j i))  + ... + 0 = (-1)^(j + i) det(M_(j i)) = c_(j i) = "cofactor of" a_(j i).
$

Note that it is the $j$#th row of $bf(e)_j$ that is 1, and it is the $i$#th column that is replaced. Thus, if we transpose the cofactor matrix $C$, we get thee *adjugate* of a matrix $A$, denoted $adj A$. The entries of $adj A$ are:
$
  (adj A)_(j i) = c_(i j) = (-1)^(i+j) det(M_(i j)) "for" i, j = 1, 2, ..., n.
$

Finally, by dividing each cofactor in the adjugate by $det A$, we get the entries of $A^(-1)$:

#define("Inverse of a Matrix via Adjugates")[
  If $A$ is an invertible $n times n$ matrix and $adj A$ is its *adjugate*, then:
  $
    A^(-1) = (adj A) / (det A).
  $
]

#pagebreak()

= Vector Spaces

== Introduction to Subspaces 

- A *vector space* $V$ is a nonempty set of objects called _vectors_  defined under the following axioms:

  #resource("Axioms of Vector Spaces")[
    _Define two closed operations on $V$: *vector addition* and *scalar multiplication*._
    
    + $forall bf(u), bf(v) in V, bf(u) + bf(v) in V$ #h(1fr) (closed under addition)
    + $forall bf(u), bf(v) in V, bf(u) + bf(v) = bf(v) + bf(u)$ #h(1fr) (vector addition is commutative)
    + $forall bf(u), bf(v), bf(w) in V, (bf(u) + bf(v)) + bf(w) = bf(u) + (bf(v) + bf(w))$ #h(1fr) (vector addition is associative)
    + $exists bf(0) in V "s.t." forall bf(v) in V, bf(v) + bf(0) = bf(0) + bf(v) = bf(v)$ #h(1fr) (existence of additive identity)
    + $forall bf(v) in V, exists (bf(-v)) in V "s.t." bf(v) + (bf(-v)) = (bf(-v)) + bf(v) = bf(0)$ #h(1fr) (existence of additive inverses)
    + $forall k in RR, forall bf(v) in V, k bf(v) in V$ #h(1fr) (closed under scalar multiplication)
    + $forall k in RR, forall bf(u), bf(v) in V, k(bf(u) + bf(v)) = k bf(u) + k bf(v)$ #h(1fr) (distributive property 1)
    + $forall m, n in RR, forall bf(v) in V, (m + n) bf(v) = m bf(v) + n bf(v)$ #h(1fr) (distributive property 2)
    + $forall m, n in RR, forall bf(v) in V, (m n) bf(v) = m (n bf(v))$ #h(1fr) (scalar multiplication is associative)
    + $forall bf(v) in V, 1 bf(v) = bf(v)$ #h(1fr) (scalar multiplicative identity)
  ]

- A *subspace* $H$ of a vector space $V$ is a subset of $V$ that is itself a vector space.

  - $H$ must satisfy the ten axioms of vector spaces under the _same_ vector addition and scalar multiplication defined on $V$:
    - Vector addition and scalar multiplication must _also_ be closed on $H$. 
    - The zero vector must be _also_ an element of $H$. 

#define("Subspace")[
  A *subspace* $H$ of a vector space $V$ is a subset of $V$ such that $H$ is itself a vector space under the same vector addition and scalar multiplication defined on $V$. 
  
  If $H subset.eq V$, then $H$ is a subspace of $V$ *iff* $H$ follows three conditions:
  + The zero vector of $V$ is in $H$.
  + $H$ is closed under vector addition: $forall bf(u), bf(v) in H, bf(u) + bf(v) in H$.
  + $H$ is closed under scalar multiplication: $forall k in RR, forall bf(v) in H, k bf(v) in H$.
]

- ${bf(0)}$ is a subspace of every vector space, and every vector space is a subspace of itself.


- The span of any set of vectors ${v_1, v_2, ..., v_p}$ in a vector space $V$ is a subspace of $V$. Conversely, every subspace of $V$ can be expressed as the span of a set of $p$ vectors ${v_1, v_2, ..., v_p}$ from $V$.
  - We say $V$ is the subspace _spanned by_ or _generated by_ ${v_1, v_2, ..., v_p}$.
  - We call ${v_1, v_2, ..., v_p}$ the _spanning set_ of $V$.

#let col = "col"
#let nul = "nul"
#let rank = "rank"
#let span = "span"

=== Special Subspaces

#define("Column Space")[
  The *column space* of an $m times n$ matrix $A$, denoted $col(A)$, is the set of all linear combinations of the columns of $A$, i.e. the span of the columns of $A$. *It holds that $col(A)$ is a subspace of $RR^m$*. 

  - If $col(A) = RR^m$, then the transformation $bf(v) |-> A bf(v)$ is surjective (onto).
]

#define("Null Space and Kernel")[

  The *null space* of an $m times n$ matrix $A$, denoted $nul(A)$, is the set of all solutions to the homogeneous equation $A bf(x) = bf(0)$. *It holds that $nul(A)$ is a subspace of $RR^n$*. \

  The *kernel* of a _linear transformation_ $T: V -> W$ is the set of all vectors in its domain $V$ that are mapped to the zero vector in its codomain $W$: $
    ker(T) = {bf(v) in V | T(bf(v)) = bf(0)}.
  $
    - $ker(T)$ is a subspace of its domain $V$.
    - If $A$ is the standard matrix of $T$, then $ker(T) = nul(A)$.
    - If $ker(T) = {bf(0)}$, then $T$ is injective (one-to-one).
]


#pagebreak()

== Basis Vectors, Rank, and Dimension

#define("Basis")[
  A *basis* $varcal(B)$ of a vector space $V$ is a linearly independent subset of $V$ such that $varcal(B)$ spans $V$:
  $
    span(varcal(B)) = V "where" varcal(B) subset.eq V.
  $
  That is, we can take any linear combination of vectors in $varcal(B)$ to get any vector in $V$, and no vector in $varcal(B)$ can be written as a linear combination of the other vectors in $varcal(B)$.
]

- A basis for the column space of a matrix $A$ can be found by taking the columns of $A$ that correspond to the pivot columns in the row echelon form of $A$. That is, _a basis for $col(A)$ are the pivot columns of $A$_.

#define("Dimension of a Vector Space")[
  The *dimension* of a vector space $H$ is the number of vectors in a basis for $H$. That is, it is the minimum number of vectors needed to span $H$.
  We denote the dimension of $H$ as $dim(H)$.
]

- It holds that although a vector space may have many different bases, all bases for a vector space have the same number of vectors. In other words, _all bases for a vector space have the same dimension_.

  - If we can find _any_ linearly independent set of $n$ vectors $S$ in a vector space $V$ with dimension $n$, then $S$ is a basis for $V$ (i.e. we imply that $S$ spans $V$) 

  - If we can find _any_ spanning set of $n$ vectors $S$ in a vector space $V$ with dimension $n$, then $S$ is a basis for $V$ (i.e. we imply linear independence of $S$)

- The dimension of $RR^n$ is simply $n$, as the standard unit vectors $bf(e)_1, bf(e)_2, ..., bf(e)_n$ form a basis for $RR^n$.

#define("Rank and Nullity of a Matrix")[
  The *rank* of a matrix $A$, denoted $rank(A)$, is the dimension of the column space of $A$ (or equivalently, the row space of $A$). It is the number of pivot positions in $A$:
  $
    rank(A) = dim(col(A)) = "number of pivot positions in" A.
  $

  The *nullity* of a matrix $A$, denoted $"nullity"(A)$, is the dimension of the null space of $A$. It is the number of free variables in the homogeneous equation $A bf(x) = bf(0)$:
  $
    "nullity"(A) = dim(nul(A)) = "number of free variables in" A.
  $
]

#define("Rank-Nullity Theorem")[
  Let $A$ be an $m times n$ matrix. Then:
  $
    rank(A) + "nullity"(A) = n.
  $

  This is simply saying that "_\# pivot columns in $A$ + \# non-pivot columns in $A$ = \# columns in $A$_."
]

#pagebreak()

== Change of Basis

- The *standard basis vectors* for $RR^n$ are the vectors $bf(e)_1, bf(e)_2, ..., bf(e)_n$.

- Given a basis $varcal(B) = {b_1, b_2, ..., b_n}$ for a vector space $V$, _any_ vector in the vector space can be written as a *unique* linear combination of the basis vectors. This the *Unique Representation Theorem*.

  - If $bf(v) in V$, then there exist _unique_ scalars $c_1, c_2, ..., c_n$ such that:
    $
      bf(v) = c_1 b_1 + c_2 b_2 + ... + c_n b_n.
    $
    In which case we can call the scalars $c_1, c_2, ..., c_n$ the *coordinates* of $bf(v)$ relative to the basis $varcal(B)$. The *coordinate vector* of $bf(v)$ relative to $varcal(B)$ is denoted $[bf(v)]_varcal(B)$ and is given by:
    $
      [bf(v)]_varcal(B) = mat(c_1; c_2; ; c_n).
    $

  - The linear transformation $bf(v) |-> [bf(v)]_varcal(B)$ is the *change of basis transformation* from the standard basis to the basis $varcal(B)$. It holds that this transformation is *one-to-one and onto* (bijective). We could also say that the change of basis transformation is an *isomorphism* between $V$ and $RR^n$.

    - This fact allows us to treat any vector space as if it were $RR^n$ by using the change of basis transformation to convert vectors in the vector space to their coordinate vectors in $RR^n$.



#pagebreak()

= Eigeneverything

== Eigenvectors and Eigenvalues

#define("Eigenvector and Eigenvalue")[
  Let $A$ be an $n times n$ matrix. A nonzero vector $bf(v) in RR^n$ is an *eigenvector* of $A$ if there exists a scalar $lambda$ such that:
  $
    A bf(v) = lambda bf(v).
  $
  The scalar $lambda$ is called the *eigenvalue* corresponding to the eigenvector $bf(v)$. $A$ may have multiple pairs of eigenvectors and eigenvalues.
]

== The Characteristic Equation

#derivation("Derivation: Characteristic Equation")[
  Let $A$ be an $n times n$ matrix, and let $bf(v)$ be an eigenvector of $A$ with corresponding eigenvalue $lambda$. Then:
  + By the definitions of eigenvector and eigenvalue, $A bf(v) = lambda bf(v)$.
  + Rearranging gives $A bf(v) - lambda bf(v) = bf(0)$.
  + It can be shown that for a column vector $bf(v)$ and scalar $k$, $k bf(v) = k I bf(v)$, \
    where $I = I_n$ is the $n times n$ identity matrix.
  + Thus, $A bf(v) - lambda I bf(v) = bf(0)$, and by the distributive property, we have $(A - lambda I) bf(v) = bf(0).$
  + Since $bf(v)$ is nonzero, by the Invertible Matrix Theorem, $A - lambda I$ must be invertible \ 
    and $cgreen(det(A - lambda I) = 0)$.
]


== Diagonalization

$
  A = P D P^(-1)
$

#define("Diagonalization of a Matrix")[
  An $n times n$ matrix $A$ is *diagonalizable* if there exists an invertible matrix $P$ and a diagonal matrix $D$ such that:
  $
    A = P D P^(-1)
  $

  where, given $lambda_i$ is the eigenvalue for the $i$#th eigenvector $bf(v)_i$ of $A$: $
    P = mat(dots.v, dots.v, dots, dots.v; bf(v)_1, bf(v)_2, dots, bf(v)_n; dots.v, dots.v, dots, dots.v)
    #h(40pt)
    D = mat(align: #center, lambda_1; , lambda_2; , , dots.down; , , , lambda_n).
  $
  #rsubtext[The columns of $P$ are the eigenvectors of $A$, and the entries on the main diagonal of $D$ are the corresponding eigenvalues.]
]

For example, if $A$ has eigenvalues $lambda_1 = 3, lambda_2 = 2, lambda_3 = 5$ with corresponding eigenvectors $bf(v)_1 = ang(1, 0, 0), bf(v)_2 = ang(0, 1, 0), bf(v)_3 = ang(0, 0, 1)$ respectively, then: 

$
  P = mat(1, 0, 0; 0, 1, 0; 0, 0, 1)
  #h(40pt)
  D = mat(align: #center, 3, 0, 0; 0, 2, 0; 0, 0, 5)
$

== Eigenvectors in Linear Transformations

== Complex Eigenvalues

== Discrete Dynamical Systems
