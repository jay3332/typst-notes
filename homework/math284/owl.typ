#import "../../helpers/template.typ": *
#import "../helpers.typ": *

#show: hw-template
#show raw.where(block: true): it => box(
  inset: 8pt,
  fill: luma(100%),
  radius: 4pt,
  width: 100%,
  stroke: 1pt + luma(80%),
  it
)

#set page("us-letter", header: align(right)[
  Jaysen Tsao \
  MATH 284 CRN 31674
])

= Modeling Owl Populations
April 17, 2026

#stack(
  line(length: 100%, stroke: 1.0pt),
  line(length: 100%, stroke: 1.0pt),
  spacing: 2pt,
)

== Background

#lthin

Spotted owls have three life stages: _juvenile_ (first year), _subadult_ (second year), and _adult_ ($>=$ third year).

Let $j_k$, $s_k$, and $a_k$ be the number of juvenile, subadult, and adult owls in year $k$, respectively. \
Let $bf(x)_k$ be a vector containing these three quantities:
$
  bf(x)_k = mat(j_k; s_k; a_k).
$
Also, let $A$ be the transition matrix such that $bf(x)_(k + 1) = A bf(x)_k$, where $A$ is given to be:
$
  A = mat(0, 0, 0.33; t, 0, 0; 0, 0.71, 0.94) space "for some parameter" t.
$

== Responses

#lthin

+ Explain the significance of each of the numbers $0.33$, $0.71$, $0.94$ and the parameter $t$ in $A$.

  After each year, $33%$ of adult owls give birth to a new juvenile owl, $71%$ of subadult owls turn into adults,
  $94%$ of adults remain adults (and the other $6%$ of adults die). $t$ is the proportion of juveniles that turn into subadults. 

+ Using MATLAB, find the eigenvalues of $A$ for $t = 0.2$. What is the dominant eigenvalue?

  The eigenvalues are:
  $
    lambda_1 &= -0.024 + 0.217i, \
    lambda_2 &= -0.024 - 0.217i, \
    lambda_3 &= 0.988. 
  $

  The pair of complex eigenvalues have magnitude $abs(lambda_1) = abs(lambda_2) = 0.2178$, whereas the real eigenvalue has magnitude $abs(lambda_3) = 0.988$. Thus, the dominant eigenvalue is $lambda_3 = 0.988$.

+ Find the dominant eigenvalues for $t = 0.22, 0.24, 0.26, 0.28, "and" 0.30$.

  #table(
    columns: (1fr,) * 5,
    table.header[$t = 0.22$][$t = 0.24$][$t = 0.26$][$t = 0.28$][$t = 0.30$],
    
    $0.992$,
    $0.997$,
    $1.001$,
    $1.005$,
    $1.009$,
  )

+ What is the smallest value of $t$ for which the dominant eigenvalue is $> 1$? \
 This is the _critical value_ of $t$.

  The critical value of $t$ is approximately $t_"crit" = 0.26$. It is the smallest value of $t$ such that the population of rabbits grows exponentially (rather than decaying exponentially). 

+ Let $j_0$ be the first 3 digits of my M\#, $s_0$ be the next 3 digits, and $a_0$ be the last 3 digits, and let the vector $bf(v)_0$ be:
  $
    bf(v)_0 = mat(j_0; s_0; a_0) = mat(212; 005; 02) = mat(212; 5; 2).
  $

  Choose $t = 0.2 < t_"crit"$:

  ```matlab
  clear all
  t = 0.20
  A = [0, 0, 0.33; t, 0, 0; 0, 0.71, 0.94]
  v0 = [212; 5; 2]

  x = v0;
  P = x;  % let P collect the population vectors over time as its columns

  N = 20; % simulate 20 years
  for i = 1:20
      x = A * x;  % next year's population vector
      P = [P x];  % append to the population matrix
  end
  
  plot(0:N, P)

  % plot formatting
  ylim([0 100])
  xlabel("Years")
  ylabel("Population")
  title("Owl Populations with t=0.20")
  legend("Juvenile", "Subadult", "Adult")
  ```

  #grid(
    columns: (1.8fr, 1fr),
    align: (horizon, horizon),
    gutter: 18pt,
    align(center, image("owl1.png")),
    [
      This graph shows that in the long run, 
      the populations of all owl groups begin to decay towards zero. This is what I anticipated, since $t < t_"crit"$. Not enough juveniles are turning into subadults each year to sustain the population growth.
    ]
  )

#pagebreak()

6. Choose $t = 0.3 > t_"crit"$:

  ```matlab
  clear all
  t = 0.30
  ...
  
  title("Owl Populations with t = 0.30")
  ...
  ```

    #grid(
    columns: (1.8fr, 1fr),
    align: (horizon, horizon),
    gutter: 18pt,
    align(center, image("owl2.png")),
    [
      This graph shows that in the long run, the populations of all owl groups grow. This is what I anticipated, since $t > t_"crit"$. Enough juveniles are turning into subadults each year to sustain the population growth, since those subadults will eventually turn into adults that give birth to new juveniles, and the cycle continues.
    ]
  )