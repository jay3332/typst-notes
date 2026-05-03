#import "../../helpers/template.typ": *
#import "../helpers.typ": *

#show: hw-template
#set raw(lang: "matlab")


#set math.mat(align: right)
#set page("us-letter", header: align(right)[
  Jaysen Tsao \
  MATH 284 CRN 31674
])

#title[MATLAB Project: Angles]
April 17, 2026

#stack(
  line(length: 100%, stroke: 1.0pt),
  line(length: 100%, stroke: 1.0pt),
  spacing: 2pt,
)

The matrix $A$ and vector $bf(b)$ are stored into MATLAB:
$
  A = mat(1, 3, -6, 1; -1, 1, 5, -6; -2, 2, -2, 3; 4, 0, 5, 2), #h(3em) bf(b) = vec(1, 2, 3, 4).
$

#show raw: set text(size: 1.1em)
#table(
  columns: (1fr, 1fr, 1fr),
  table.header[*MATLAB Expression*][*Output*][*Effect*],
  align: (x, y) => {
    if y == 0 { left + horizon } else {
      if x == 2 { left + horizon } else { center + horizon }
    }
  },
  inset: 6pt,
  `A * A`,
  $
    mat(14, -6, 26, -33; -36, 8, -29, -4; 12, -8, 41, -14; 2, 22, -24, 23)
  $,
  [Computes $A A = A^2$, the matrix product of $A$ with itself.],

  `A .* A`,
  $
    mat(1, 9, 36, 1; 1, 1, 25, 36; 4, 4, 4, 9; 16, 0, 25, 4)
  $,
  [Computes the element-wise product of $A$ with itself, $A dot.o A$, squaring every entry of $A$.],

  `sum(A)`,
  $
    mat(2, 6, 2, 0)
  $,
  [Computes the sum of the row vectors of $A$.],

  `sum(A .* A)`,
  $
    mat(22, 14, 90, 50)
  $,
  [
    Computes a row vector whose $i$#th entry 
    is the norm-squared of the $i$#th column of $A$.

    If $display(A = mat(bf(a)_1, bf(a)_2, bf(a)_3, bf(a)_4))$,
    then the output is $display(mat(abs(bf(a)_1)^2, abs(bf(a)_2)^2, abs(bf(a)_3)^2, abs(bf(a)_4)^2))$.

    The norm-squared represents the squared length of the vector,
    and it shows up in the denominator of the orthogonal 
    projection formula.
  ],

  `[A b]`,
  $
    mat(augment: #4, 1, 3, -6, 1, 1; -1, 1, 5, -6, 5; -2, 2, -2, 3, 3; 4, 0, 5, 2, 2)
  $,
  [Computes the augmented matrix $display(mat(A, bf(b)))$ by concatenating $bf(b)$ as a new column to the right of $A$.],

  [
    `vertcat(A, b')`
    #v(0.8em)
    `[A; b']`
  ],
  $
    mat(augment: #(hline: 4), 1, 3, -6, 1; -1, 1, 5, -6; -2, 2, -2, 3; 4, 0, 5, 2; 1, 5, 3, 2)
  $,
  [Computes the vertically augmented matrix $display(mat(align: #center, A; bf(b)^transpose))$ by concatenating $bf(b)$ as a row vector to the bottom of $A$.],

  `R = rand(4, 6)`,
  $
    R = mat(
      0.8147, 0.6324, ..., 0.6557;
      0.9058, 0.0975, ..., 0.0357;
      0.1270, 0.2785, ..., 0.8491;
      0.9134, 0.5469, ..., 0.9340
    )
  $,
  [Generates a $4 times 6$ matrix $R$ whose entries are pseudorandom numbers between $0$ and $1$, exclusive.],

  `sortrows(A)`,
  $
    mat(-2, 2, -2, 3; -1, 1, 5, -6; 1, 3, -6, 1; 4, 0, 5, 2)
  $,
  [Computes a new matrix whose rows are the rows of $A$ sorted in ascending order by their first entry.],

  [
    `[E, index] = sortrows(A)`
    #subtext[Let $bf(p)$ be the `index` vector.]
  ],
  $
    E = mat(-2, 2, -2, 3; -1, 1, 5, -6; 1, 3, -6, 1; 4, 0, 5, 2), #h(1em)
    bf(p) = vec(3, 1, 4, 2)
  $,
  [
    Computes the same sorted matrix $E$ as `sortrows(A)` and an index vector $bf(p)$ which encodes how the rows of $A$ were rearranged to get $E$. The $i$#th row of $E$ is the $p_i$#th row of $A$. 
  ],

  `sortrows(A, "descend")`,
  $
    mat(4, 0, 5, 2; 1, 3, -6, 1; -1, 1, 5, -6; -2, 2, -2, 3)
  $,
  [
    Same as `sortrows(A)`, but sorts the rows of $A$ in descending order by their first entry (instead of ascending order.)
  ],

  `sortrows(A, 2)`,
  $
    mat(4, 0, 5, 2; -1, 1, 5, -6; -2, 2, -2, 3; 1, 3, -6, 1)
  $,
  [
    Sorts the rows of $A$ in ascending order by their _second_ entry (instead of the first entry.)
  ],

  text(size: 0.9em)[
    ```matlab
    R = rand(4,6);
    S = sqrt(sum(R .* R));
    for i = 1:6
      R(:,i) = R(:,i) / S(i);
    end
    ```
  ],
  $
    R = mat(
      0.5795, 0.2200, ..., 0.4201;
      0.5683, 0.9073, ..., 0.3822;
      0.3000, 0.0409, ..., 0.5543;
      0.5013, 0.3559, ..., 0.6084
    )
  $,
  [Generates a $4 times 6$ matrix $R$ whose entries are pseudorandom numbers between $0$ and $1$, exclusive, and then normalizes each column of $R$ to have length $1$. 
  
  The output is a matrix $R$ whose columns are unit vectors in $RR^4$.]

)


#pagebreak()
#show raw.where(block: true): it => box(
  inset: 8pt,
  fill: luma(100%),
  radius: 4pt,
  width: 100%,
  stroke: 1pt + luma(80%),
  it
)

= Cosine Similarity Live Script
#lthin

Generates a random matrix $A$, then ranks each column vector of $A$ by their cosine similarity with a reference vector $bf(v)$, where:
$
  bf(v) = vec(1, 2, 3).
$

#show raw: set text(size: 9pt) 
```matlab
A = rand(3, 10)
v = [1; 2; 3] 

% Formula: cos(theta) = dot(a, v) / (norm(a) * norm(v))
norms = sqrt(sum(A .* A));        % 1. Compute norms of every column 
denominators = norms * norm(v);   % 2. Compute denominators 
prods = A' * v;                   % 3. Compute dot products
cosines = prods' ./ denominators; % 4. Compute cosines

% Rank cosines in descending order
[cosines, index] = sort(cosines, "descend");
% Display ranks
for rank = 1:width(A)
    idx = index(rank);
    disp(compose("%2d. (column %d, cosine = %.4f)", rank, idx, cosines(rank)));
    disp(A(:, idx));
end
```