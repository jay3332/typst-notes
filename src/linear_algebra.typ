#import "../helpers/template.typ": *

#show: template.with(title: "Linear Algebra", font: "times")

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
  
  We can multiply the first equation by $-3$ and add it to the second equation:
  $
    0x_1 + 0x_2 = k - 3h ==> 0 = k - 3h
  $
  For the system to be consistent, we need $k - 3h = 0 ==> cgreen(k = 3h)$.  \
  #subtext[Otherwise, if $k - 3h != 0$, the system is inconsistent because there would be no solutions (i.e., a contradiction).]
]

=== Introduction to Matrices

- A *matrix* is a collection of numbers arranged into a rectangular array of rows and columns.
  - A matrix with $m$ rows and $n$ columns is called an $m times n$ matrix.
  - If $bf(A)$ is a matrix, then $bf(A)_(i j)$ denotes the entry in the $i$-th row and $j$-th column of $bf(A)$.

- To distinguish between scalars, vectors, and matrices, multiple notations are used:
  - Scalars are lowercase and italicized, e.g., $a, b, c$.
  - Vectors can either be:
    - lowercase and bolded: $bf(v), bf(w)$, or 
    - lowercase with an arrow on top: $arrow(v), arrow(w)$. 
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
  Since there are no entries below the pivot position, we have achieved echelon form (REF).


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

#pagebreak()

== Vector Equations

#define("Span of a Set of Vectors")[
  Let $V = {arrow(v)_1, arrow(v)_2, ..., arrow(v)_n} subset.eq RR^n$. The *span* of $V$, denoted $"span"(V)$ or $"span"{arrow(v_1), arrow(v)_2, ..., arrow(v)_n}$, is the set of all linear combinations of the vectors in $V$:
  $
    "span"(V) = {arrow(v) in RR^n | arrow(v) = c_1 arrow(v)_1 + c_2 arrow(v)_2 + ... + c_n arrow(v)_n "for" c_1, c_2, ..., c_n in RR}.
  $
  It holds that $"span"(V)$ is a subspace of $RR^n$.
]

== The Matrix Equation $A bf(x) = bf(b)$

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
     {bf(x) = bf(p) + bf(x)_h | A bf(x)_h = bf(0)}
   $

== Applications of Linear Systems

== Linear Independence

== Linear Transformations

== The Matrix of a Linear Transformation

= Matrix Algebra

== Matrix Operations

#define("Matrix Multiplication")[
  Let $bf(A)$ be an $m times p$ matrix and $bf(B)$ be an $p times n$ matrix. The *product* $bf(A B)$ is the $m times n$ matrix where the entry in the $i$#super[th] row and $j$#super[th] column is given by:
  $
    (bf(A B))_(i j) = sum_(k=1)^p A_(i k) B_(k j).
  $
  $bf(A B)$ represents the transformation that results from first applying the transformation represented by $bf(B)$, followed by the transformation represented by $bf(A)$.
]

- In other words, to compute the entry in the $i$#super[th] row and $j$#super[th] column of the product matrix $bf(A B)$, we take the dot product of the $i$#super[th] row of $bf(A)$ with the $j$#super[th] column of $bf(B)$:
  $
    (bf(A B))_(i j) = arrow(A)_(i *) dot arrow(B)_(* j).
  $

#define("Matrix Transpose")[
  The *transpose* of an $m times n$ matrix $bf(A)$, denoted $bf(A)^transpose$, is the $n times m$ matrix obtained by 
  interchanging the rows and columns of $bf(A)$. In other words, the entry in the $i$#super[th] row and 
  $j$#super[th] column of $bf(A)^transpose$ is equal to the entry in the $j$#super[th] row and $i$#super[th] 
  column of $bf(A)$: $
    (bf(A)^transpose)_(i j) = bf(A)_(j i).
  $
]

== The Inverse of a Matrix

== Invertible Matrices

#define("Invertible Matrix Theorem")[
  Let $A$ be an $n times n$ matrix. The following statements are equivalent (i.e. all true or all false):
  + $A$ and/or $A^transpose$ is invertible.
  + The set of rows in $A$ is equal to the set of rows in $I_n$.
  + $A$ has $n$ pivot positions.
  + The equation $A arrow(x) = arrow(0)$ only has the solution $arrow(x) = arrow(0)$.
  + The columns of $A$ are linearly independent.
  + The linear transformation $arrow(x) |-> A arrow(x)$ is one-to-one and/or onto (in/sur/bijective).
  + The equation $A arrow(x) = arrow(b)$ has at least one solution for each $arrow(b)$ in $RR^n$.
  + The columns of $A$ span $RR^n$.
  + There exists an $n times n$ matrix $C$ such that $C A = I_n$.
  + There exists an $n times n$ matrix $D$ such that $A D = I_n$.
]

== Partitioned Matrices

== Matrix Factorizations

=== LU Factorization

== The Leontief Input-Output Model

== Subspaces of $RR^n$

== Dimension and Rank

#define("Dimension of a Subspace")[
  The *dimension* of a subspace $bf(W)$ of $RR^n$ is the number of vectors in a basis for $bf(W)$. 
  We denote the dimension of $bf(W)$ as $dim(bf(W))$.
]

#define("Rank of a Matrix")[
  The *rank* of a matrix $A$, denoted $"rank"(A)$, is the dimension of the column space of $A$ (or equivalently, the row space of $A$). 
]

#pagebreak()

= Determinants

== Introduction to Determinants 

- The *determinant* of a square matrix is a scalar value which represents the factor by which the area/volume of a region is scaled when the linear transformation associated with the matrix is applied to that region.

- If the determinant of a matrix is zero, the linear transformation compresses the area/volume to zero and we cannot reverse the transformation (i.e., the matrix is not invertible). 

#define("Determinant of a Matrix")[
  The *determinant* ($det A$ or $abs(A)$) of an $n times n$ matrix $A$ ($n >= 2$) is: 
  $
    det A = sum_(j=1)^n (-1)^(1+j) A_(1 j) det(M_(1 j))
  $ 
  where $M_(1 j)$ is the minor of $A$ at row $1$, column $j$, which is the $(n-1) times (n-1)$ matrix that results from deleting row $1$ and column $j$ from $A$
]

- The determinant of a $2 times 2$ matrix $mat(a, b; c, d)$ is $a d - b c$. (We can write $mat(delim: "|", a, b; c, d) = a d - b c$.)

=== Cofactor Expansion

We can actually expand along any row or column, not just the first row: 
$
  det A = sum_(j=1)^n (-1)^(i+j) A_(i j) det(M_(i j)) & #h(3em) "expansion along" i#super("th") "row" \
  det A = sum_(i=1)^n (-1)^(i+j) A_(i j) det(M_(i j)) & #h(3em) "expansion along" j#super("th") "column"
$

All expansions will yield the same determinant. Notice the sign $(-1)^(i+j)$ follows a checkerboard pattern,
allowing us to easily determine whether to add or subtract each term: 
$
  mat(+, -, +, -; -, +, -, +; +, -, +, -; -, +, -, +) #h(3em)
$ 

The *cofactor* of an entry $A_(i j)$ is defined as $C_(i j) = (-1)^(i+j) det(M_(i j))$, capturing what we multiply by $A_(i j)$ in the determinant expansion. The *cofactor matrix* $C$ of an $n times n$ matrix $A$ is the matrix where each entry $C_(i j)$ is the cofactor of $A_(i j)$.

Computing determinants using cofactors is known as the method of *cofactor expansion*.

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

== Properties of Determinants

- The three elementary row operations affect the determinant as follows:
  + Swapping two rows multiplies the determinant by $-1$.
  + Multiplying a row by a scalar $k$ multiplies the determinant by $k$.
  + Adding a multiple of one row to another row does not change the determinant.

- $det A = det A^transpose$
#pagebreak()

== Cramer's Rule

#define("Cramer's Rule")[
  Let $A$ be an invertible $n times n$ matrix, and $bf(b) in RR^n$. Then the unique solution $bf(x)$ to the equation $A bf(x) = bf(b)$ has entries given by:
  $
    x_i = (det A_i)/(det A) "for" i = 1, 2, ..., n
  $
  where $A_i$ is the matrix that results from replacing the $i$#super[th] column of $A$ with the column vector $bf(b)$, or in other words: 
  $
    (A_i)_(j k) = cases(
      b_j & "if" k = i,
      A_(j k) & "otherwise"
    )
  $
]

- To put it simply, Cramer's Rule allows us to solve for a particular variable in a system of linear equations.
  + Take the determinant of the coefficient matrix $A$, this is the denominator ($det A$).
  + Replace the $i$#super[th] column of $A$ with the constants from the right-hand side of the equations to form $A_i$, and take its determinant, this is the numerator ($det A_i$).
  + The solution for the variable whose coefficients were in the $i$#super[th] column ($x_i$) is $x_i = (det A_i)/(det A)$.

- Realize that the coefficient matrix must be square, i.e. we must have the same number of equations as unknowns. 
  - Additionally, the coefficient matrix must be invertible (i.e., $det A != 0$) for Cramer's Rule to be applicable.
    Otherwise, the system may have no solutions or infinitely many solutions.

- Cramer's Rule is most efficient for solving one variable in large systems, but may not be the best method for
  solving for all variables (since it involves calculating $n + 1$ determinants).

= Vector Subspaces

= Eigeneverything

== Eigenvectors and Eigenvalues

#define("Eigenvector and Eigenvalue")[
  Let $bf(A)$ be an $n times n$ matrix. A nonzero vector $bf(v) in RR^n$ is an *eigenvector* of $bf(A)$ if there exists a scalar $lambda$ such that:
  $
    bf(A) bf(v) = lambda bf(v).
  $
  The scalar $lambda$ is called the *eigenvalue* corresponding to the eigenvector $bf(v)$. $bf(A)$ may have multiple pairs of eigenvectors and eigenvalues.
]

== The Characteristic Equation

#derivation("Derivation: Characteristic Equation")[
  Let $bf(A)$ be an $n times n$ matrix, and let $bf(v)$ be an eigenvector of $bf(A)$ with corresponding eigenvalue $lambda$. Then:
  + By the definitions of eigenvector and eigenvalue, $bf(A) bf(v) = lambda bf(v)$.
  + Rearranging gives $bf(A) bf(v) - lambda bf(v) = bf(0)$.
  + It can be shown that for a column vector $bf(v)$ and scalar $k$, $k bf(v) = k bf(I) bf(v)$, \
    where $bf(I) = bf(I)_n$ is the $n times n$ identity matrix.
  + Thus, $bf(A) bf(v) - lambda bf(I) bf(v) = bf(0)$, and by the distributive property, we have $(bf(A) - lambda bf(I)) bf(v) = bf(0).$
  + Since $bf(v)$ is nonzero, by the Invertible Matrix Theorem, $bf(A) - lambda bf(I)$ must be invertible \ 
    and $cgreen(det(bf(A) - lambda bf(I)) = 0)$.
]


== Diagonalization

$
  bf(A) = bf(P) bf(D) bf(P)^(-1)
$

#define("Diagonalization of a Matrix")[
  An $n times n$ matrix $bf(A)$ is *diagonalizable* if there exists an invertible matrix $bf(P)$ and a diagonal matrix $bf(D)$ such that:
  $
    bf(A) = bf(P) bf(D) bf(P)^(-1)
  $

  where, given $lambda_i$ is the eigenvalue for the $i$#super[th] eigenvector $bf(v)_i$ of $bf(A)$: $
    bf(P) = mat(dots.v, dots.v, dots, dots.v; bf(v)_1, bf(v)_2, dots, bf(v)_n; dots.v, dots.v, dots, dots.v)
    #h(40pt)
    bf(D) = mat(align: #center, lambda_1; , lambda_2; , , dots.down; , , , lambda_n).
  $
  #rsubtext[The columns of $bf(P)$ are the eigenvectors of $bf(A)$, and the entries on the main diagonal of $bf(D)$ are the corresponding eigenvalues.]
]

For example, if $bf(A)$ has eigenvalues $lambda_1 = 3, lambda_2 = 2, lambda_3 = 5$ with corresponding eigenvectors $arrow(v)_1 = ang(1, 0, 0), arrow(v)_2 = ang(0, 1, 0), arrow(v)_3 = ang(0, 0, 1)$ respectively, then: 

$
  bf(P) = mat(1, 0, 0; 0, 1, 0; 0, 0, 1)
  #h(40pt)
  bf(D) = mat(align: #center, 3, 0, 0; 0, 2, 0; 0, 0, 5)
$

== Eigenvectors in Linear Transformations

== Complex Eigenvalues

== Discrete Dynamical Systems
