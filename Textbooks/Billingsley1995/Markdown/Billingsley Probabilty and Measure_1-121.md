# Probability and Measure 

## Third Edition

## Patrick Billingsley

![](https://cdn.mathpix.com/cropped/368b4b9b-2cc8-486a-b0be-6044ed5eb877-001.jpg?height=1796&width=1320&top_left_y=1096&top_left_x=267)

# Probability and Measure Third Edition 

PATRICK BILLINGSLEY

The University of Chicago

A Wiley-Interscience Publication JOHN WILEY \& SONS

This text is printed on acid-free paper.
Copyright © 1995 by John Wiley \& Sons, Inc.
All rights reserved. Published simultaneously in Canada.
Reproduction or translation of any part of this work beyond that permitted by Section 107 or 108 of the 1976 United States Copyright Act without the permission of the copyright owner is unlawful. Requests for permission or further information should be addressed tothe Permissions"Debartment, John Wiley \& Sons, Inc., 605 Thir-Avenue, New York NY 10158-0012.

Library of Congress Cataloging in Publication Data: Billingsley, Patrick.

Probability and measure / Patrick Billingsley. -3rd ed.
p. cm. -(Wiley series in probability and mathematical
statistics. Probability and mathematical statistics)
"A Wiley-Interscience publication."
Includes bibliographical references and index.
ISBN 0-471-00710-2

1. Probabilities. 2. Measure theory. I. Title. II. Series. QA273.B575 1995
519.2—dc20

94-28500
Printed in the United States of America
109

## Preface

Edward Davenant said he "would have a man knockt in the head that should write anything in Mathematiques that had been written of before." So reports John Aubrey in his Brief Lives. What is new here then?

To introduce the idea of measure the book opens with Borel's normal number theorem, proved by calculus alone. and there follow short sections establishing the existence and fundamental properties of probability measures, including Lebesgue measure on the unit interval. For simple random variables-ones with finite range-the expected value is a sum instead of an integral. Measure theory, without integration, therefore suffices for a completely rigorous study of infinite sequences of simple random variables, and this is carried out in the remainder of Chapter 1, which treats laws of large numbers, the optimality of bold play in gambling, Markov chains, large deviations, the law of the iterated logarithm. These developments in their turn motivate the general theory of measure and integration in Chapters 2 and 3.

Measure and integral are used together in Chapters 4 and 5 for the study of random sums, the Poisson process, convergence of measures, characteristic functions, central limit theory. Chapter 6 begins with derivatives according to Lebesgue and Radon-Nikodym-a return to measure theory-then applies them to conditional expected values and martingales. Chapter 7 treats such topics in the theory of stochastic processes as Kolmogorov's existence theorem and separability, all illustrated by Brownian motion.

What is new, then, is the alternation of probability and measure, probability motivating measure theory and measure theory generating further probability. The book presupposes a knowledge of combinatorial and discrete probability, of rigorous calculus, in particular infinite series, and of elementary set theory. Chapters 1 through 4 are designed to be taken up in sequence. Apart from starred sections and some examples, Chapters 5, 6, and 7 are independent of one another; they can be read in any order.

My goal has been to write a book I would myself have liked when I first took up the subject, and the needs of students have been given precedence over the requirements of logical economy. For instance, Kolmogorov's exis-
tence theorem appears not in the first chapter but in the last, stochastic processes needed earlier having been constructed by special arguments which, although technically redundant, motivate the general result. And the general result is, in the last chapter, given two proofs at that. It is instructive, I think, to see the show in rehearsal as well as in performance.

The Third Edition. The main changes in this edition are two For the theory of Hausdorff measures in Section 19 I have substituted an account of $L^{p}$ spaces, with applications to statistics. And for the queueing theory in Section 24 I have substituted an introduction to ergodic theory, with applications to continued fractions and Diophantine approximation. These sections now fit better with the rest of the book, and they illustrate again the connections probability theory has with applied mathematics on the one hand and with pure mathematics on the other.

For suggestions that have led to improvements in the new edition, I thank Raj Bahadur, Walter Philipp, Michael Wichura, and Wing Wong, as well as the many readers who have sent their comments.

Envoy. I said in the preface to the second edition that there would not be a third, and yet here it is. There will not be a fourth. It has been a very agreeable labor, writing these successive editions of my contribution to the river of mathematics. And although the contribution is small, the river is great: After ages of good service done to those who people its banks, as Joseph Conrad said of the Thames, it spreads out "in the tranquil dignity of a waterway leading to the uttermost ends of the earth."

Patrick Billingsley

Chicago, Illinois
December I994

## Contents

CHAPTER 1. PROBABILITY ..... 1

1. Borel's Normal Number Theorem, 1
The Unit Interval-The Weak Law of Large Numbers-The Strong Law of Large Numbers-Strong Law Versus Weak-Length- The Measure Theory of Diophantine Approximation*
2. Probability Measures, ..... 17
Spaces-Assigning Probabilities-Classes of Sets-Probability Measures-Lebesque Measure on the Unit Interval-Sequence Space*—Constructing $\sigma$-Fields*
3. Existence and Extension, ..... 36
Construction of the Extension-Uniqueness and the $\pi-\lambda$ Theorem -Monotone Classes-Lebesgue Measure on the Unit Interval- Completeness - Nonmeasurable Sets-Two Impossibility Theorems*
4. Denumerable Probabilities, ..... 51
General Formulas-Limit Sets-Independent Events- Subfields-The Borel-Cantelli Lemmas-The Zero-One Law
5. Simple Random Variables, ..... 67
Definition-Convergence of Random Variables-Independence- Existence of Independent Sequences-Expected Value-Inequalities
6. The Law of Large Numbers, ..... 85
The Strong Law-The Weak Law-Bernstein's Theorem- A Refinement of the Second Borel-Cantelli Lemma

[^0]7. Gambling Systems, ..... 92
Gambler's Ruin-Selection Systems-Gambling Policies- Bold Play*-Timid Play*
8. Markov Chains, ..... 111
Definitions-Higher-Order Transitions-An Existence Theorem- Transience and Persistence-Another Criterion for Persisience- Stationary Distributions—Exponential Convergence*—Optimal Stopping *
9. Large Deviations and the Law of the Iterated Logarithm,* ..... 145
Moment Generating Functions-Large Deviarions-Chernoff's Theorem-The Law of the Iterated Logarithm
CHAPTER 2. MEASURE ..... 158
10. General Measures, ..... 158
Classes of Sets-Conventions Involving $\infty$-Measures- Uniqueness
11. Outer Measure, ..... 165
Outer Measure-Extension-An Approximation Theorem
12. Measures in Euclidean Space, ..... 171
Lebesgue Measure-Regularity-Specifying Measures on the Line-Specifying Measures in $R^{k}$-Strange Euclidean Sets*
13. Measurable Functions and Mappings, ..... 182
Measurable Mappings-Mappings into $R^{k}$-Limits and Measureability—Transformations of Measures
14. Distribution Functions, ..... 187
Distribution Functions-Exponential Distributions-Weak Convergence-Convergence of Types*-Extremal Distributions*
CHAPTER 3. INTEGRATION ..... 199
15. The Integral, ..... 199
Definition-Nonnegative Functions-Uniqueness
16. Properties of the Integral, 206
Equalities and Inequalities-Integration to the Limit-Integration over Sets-Densities-Change of Variable-Uniform Integrability -Complex Functions
17. The Integral with Respect to Lebesgue Measure, ..... 221
The Lebesgue Integral on the Line-The Riemann Integral- The Fundamental Theorem of Calculus-Change of Variable- The Lebesgue Integral in $R^{k}$-Stieltjes Integrals
18. Product Measure and Fubini's Theorem, ..... 231
Product Spaces-Product Measure-Fubini's Theorem- Integration by Parts-Products of Higher Order
19. The $L^{p}$ Spaces,* ..... 241
Definitions-Completeness and Separability-Conjugate Spaces -Weak Compactness-Some Decision Theory-The Space $L^{2}-$ An Estimation Problem
CHAPTER 4. RANDOM VARIABLES AND EXPECTED VALUES254
20. Random Variables and Distributions, ..... 254
Random Variables and Vectors-Subfields-Distributions- Multidimensional Distributions-Independence-Sequences of Random Variables-Convolution-Convergence in Probability -The Glivenko-Cantelli Theorem*
21. Expected Values, ..... 273
Expected Value as Integral-Expected Values and Limits- Expected Values and Distributions-Moments-Inequalities- Joint Integrals-Independence and Expected Value-Moment Generating Functions
22. Sums of Independent Random Variables, ..... 282
The Strong Law of Large Numbers-The Weak Law and Moment Generating Functions-Kolmogorov's Zero-One Law-Maximal Inequalities-Convergence of Random Series-Random Taylor Series*
23. The Poisson Process, ..... 297
Characterization of the Exponential Distribution-The Poisson Process-The Poisson Approximation-Other Characterizations of the Poisson Process-Stochastic Processes
24. The Ergodic Theorem,* ..... 310
Measure-Preserving Transformations-Ergodicity-Ergodicity of Rotations-Proof of the Ergodic Theorem-The Continued- Fraction Transformation-Diophantine Approximation
CHAPTER 5. CONVERGENCE OF DISTRIBUTIONS ..... 327
25. Weak Convergence, ..... 327
Definitions—Uniform Distribution Modulo l*—Convergence in Distribution-ConDergence in Probability-Fundamental Theorems-Helly's Theorem-Integration to the Limit
26. Characteristic Functions, ..... 342
Definition-Moments and Derivatives-Independence-Inversion and the Uniqueness Theorem-The Continuity Theorem- Fourier Series*
27. The Central Limit Theorem, ..... 357
Identically Distributed Summands-The Lindeberg and Lyapounov Theorems-Dependent Variables*
28. Infinitely Divisible Distributions,* ..... 371
Vague Convergence-The Possible Limits-Characterizing the Limit
29. Limit Theorems in $R^{k}$, ..... 378
The Basic Theorems-Characteristic Functions-Normal Distributions in $R^{k}$-The Central Limit Theorem
30. The Method of Moments,* ..... 388
The Moment Problem-Moment Generating Functions-CentralLimit Theorem by Moments-Application to Sampling Theory-Application to Number Theory
CHAPTER 6. DERIVATIVES AND CONDITIONAL PROBABILITY ..... 400
31. Derivatives on the Line,* 400
The Fundamental Theorem of Calculus-Derivatives of Integrals -Singular Functions-Integrals of Derivatives-Functions of Bounded Variation
32. The Radon-Nikodym Theorem, ..... 419
Additive Set Functions-The Hahn Decomposition-Absolute Continuity and Singularity—The Main Theorem
33. Conditional Probability, ..... 427
The Discrete Case-The General Case-Properties of Conditional Probability-Difficulties and Curiosities-Conditional Probability Distributions
34. Conditional Expectation, ..... 445
Definition-Properties of Conditional Expectation-Conditional Distributions and Expectations—Sufficient Subfields *— Minimum-Variance Estimation*
35. Martingales, ..... 458
Definition-Submartingdales-Gambling-Functions of Martingales-Stopping Times-Inequalities-Convergence Theorems-Applications: Derivatives-Likelihood Ratios- Reversed Martingales-Applications : de Finetti's Theorem- Bayes Estimation-A Central Limit Theorem*
CHAPTER 7. STOCHASTIC PROCESSES ..... 482
36. Kolmogorov's Existence Theorem, ..... 482Stochastic Processes-Finite-Dimensional Distributions-ProductSpaces-Kolmogorov's Existence Theorem-The Inadequacyof $\mathscr{R}^{T}$-A Return to Ergodic Theory*-The Hewitt-SavageTheorem ${ }^{*}$
37. Brownian Motion, ..... 498
Definition-Continuity of Paths-Measurable Processes- Irregularity of Brownian Motion Paths-The Strong Markov Property—The Reflection Principle-Skorohod Embedding *- Invariance*
38. Nondenumerable Probabilities,* ..... 526
Introduction-Definitions-Existence Theorems-Consequences of Separability
APPENDIX ..... 536
NOTES ON THE PROBLEMS ..... 552
BIBLIOGRAPHY ..... 581
LIST OF SYMBOLS ..... 585
INDEX ..... 587

Probability and Measure

## CHAPTER1

## Probability

## SECTION 1. BOREL'S NORMAL NUMBER THEOREM

Although sufficient for the development of many interesting topics in mathematical probability, the theory of discrete probability spaces ${ }^{\dagger}$ does not go far enough for the rigorous treatment of problems of two kinds: those involving an infinitely repeated operation, as an infinite sequence of tosses of a coin, and those involving an infinitely fine operation, as the random drawing of a point from a segment. A mathematically complete development of probability, based on the theory of measure, puts these two classes of problem on the same footing, and as an introduction to measure-theoretic probability it is the purpose of the present section to show by example why this should be so.

## The Unit Interval

The project is to construct simultaneously a model for the random drawing of a point from a segment and a model for an infinite sequence of tosses of a coin. The notions of independence and expected value, familiar in the discrete theory, will have analogues here, and some of the terminology of the discrete theory will be used in an informal way to motivate the development. The formal mathematics, however, which involves only such notions as the length of an interval and the Riemann integral of a step function, will be entirely rigorous. All the ideas will reappear later in more general form.

Let $\Omega$ denote the unit interval $(0,1]$; to be definite, take intervals open on the left and closed on the right. Let $\omega$ denote the generic point of $\Omega$. Denote the length of an interval $I=(a, b]$ by $|I|$ :

$$
\begin{equation*}
|I|=|(a, b]|=b-a . \tag{1.1}
\end{equation*}
$$

[^1]If

$$
\begin{equation*}
A=\bigcup_{i=1}^{n} I_{i}=\bigcup_{i=1}^{n}\left(a_{i}, b_{i}\right], \tag{I.2}
\end{equation*}
$$

where the intervals $I_{i}=\left(a_{i}, b_{i}\right]$ are disjoint [ A 3$]^{\dagger}$ and are contained in $\Omega$, assign to $A$ the probability

$$
\begin{equation*}
P(A)=\sum_{i=1}^{n}\left|I_{i}\right|=\sum_{i=1}^{n}\left(b_{i}-a_{i}\right) . \tag{1.3}
\end{equation*}
$$

It is important to understand that in this section $P(A)$ is defined only if $A$ is a finite disjoint union of subintervals of $(0,1]$-never for sets $A$ of any other kind.

If $A$ and $B$ are two such finite disjoint unions of intervals, and if $A$ and $B$ are disjoint, then $A \cup B$ is a finite disjoint union of intervals and

$$
\begin{equation*}
P(A \cup B)=P(A)+P(B) . \tag{1.4}
\end{equation*}
$$

This relation, which is certainly obvious intuitively, is a consequence of the additivity of the Riemann integral:

$$
\begin{equation*}
\int_{0}^{1}(f(\omega)+g(\omega)) d \omega=\int_{0}^{1} f(\omega) d \omega+\int_{0}^{1} g(\omega) d \omega . \tag{1.5}
\end{equation*}
$$

If $f(\omega)$ is a step function taking value $c_{j}$ in the interval ( $x_{j-1}, x_{j}$ ], where $0=x_{0}< x_{1}<\cdots<x_{k}=1$, then its integral in the sense of Riemann has the value

$$
\begin{equation*}
\int_{0}^{1} f(\omega) d \omega=\sum_{j=1}^{k} c_{j}\left(x_{j}-x_{j-1}\right) . \tag{1.6}
\end{equation*}
$$

If $f=I_{A}$ and $g=I_{B}$ are the indicators [A5] of $A$ and $B$, then (1.4) follows from (1.5) and (1.6), provided $A$ and $B$ are disjoint. This also shows that the definition (1.3) is unambiguous-note that $A$ will have many representations of the form (1.2) because $(a, b] \cup(b, c]=(a, c]$. Later these facts will be derived anew from the general theory of Lebesgue integration. ${ }^{\ddagger}$

According to the usual models, if a radioactive substance has emitted a single $\alpha$-particle during a unit interval of time, or if a single telephone call has arrived at an exchange during a unit interval of time, then the instant at which the emission or the arrival occurred is random in the sense that it lies in (1.2) with probability (1.3). Thus (1.3) is the starting place for the
${ }^{\dagger}$ A notation $[\mathrm{A} \boldsymbol{n}]$ refers to paragraph $\boldsymbol{n}$ of the appendix beginning on p. 536 ; this is a collection of mathematical definitions and facts required in the text.
${ }^{\ddagger}$ Passages in small type concern side issues and technical matters, but their contents are sometimes required later.
description of a point drawn at random from the unit interval: $\Omega$ is regarded as a sample space, and the set (1.2) is identified with the event that the random point lies in it.

The definition (1.3) is also the starting point for a mathematical representation of an infinite sequence of tosses of a coin. With each $\omega$ associate its nonterminating dyadic expansion

$$
\begin{equation*}
\omega=\sum_{n=1}^{\infty} \frac{d_{n}(\omega)}{2^{n}}=. d_{1}(\omega) d_{2}(\omega) \ldots, \tag{1.7}
\end{equation*}
$$

each $d_{n}(\omega)$ being 0 or 1 [A31]. Thus

$$
\begin{equation*}
\left(d_{1}(\omega), d_{2}(\omega), \ldots\right) \tag{1.8}
\end{equation*}
$$

is the sequence of binary digits in the expansion of $\omega$. For definiteness, a point such as $\frac{1}{2}=.1000 \ldots=.0111 \ldots$, which has two expansions, takes the nonterminating one; 1 takes the expansion $111 \ldots$.

![](https://cdn.mathpix.com/cropped/368b4b9b-2cc8-486a-b0be-6044ed5eb877-017.jpg?height=282&width=474&top_left_y=1364&top_left_x=385)
Graph of $d_{1}(\omega)$

![](https://cdn.mathpix.com/cropped/368b4b9b-2cc8-486a-b0be-6044ed5eb877-017.jpg?height=276&width=474&top_left_y=1367&top_left_x=918)
Graph of $d_{2}(\omega)$

Imagine now a coin with faces labeled 1 and 0 instead of the usual heads and tails. If $\omega$ is drawn at random, then (1.8) behaves as if it resulted from an infinite sequence of tosses of a coin. To see this, consider first the set of $\omega$ for which $d_{i}(\omega)=u_{i}$ for $i=1, \ldots, n$, where $u_{1}, \ldots, u_{n}$ is a sequence of 0 's and 1's. Such an $\omega$ satisfies

$$
\sum_{i=1}^{n} \frac{u_{i}}{2^{i}}<\omega \leq \sum_{i=1}^{n} \frac{u_{i}}{2^{i}}+\sum_{i=n+1}^{\infty} \frac{1}{2^{i}},
$$

where the extreme values of $\omega$ correspond to the case $d_{i}(\omega)=0$ for $i>n$ and the case $d_{i}(\omega)=1$ for $i>n$. The second case can be achieved, but since the binary expansions represented by the $d_{i}(\omega)$ are nonterminating-do not end in 0 's-the first cannot, and $\omega$ must actually exceed $\sum_{i=1}^{n} u_{i} / 2^{i}$. Thus

$$
\begin{equation*}
\left[\omega: \dot{d}_{i}(\omega)=u_{i}, i=1, \ldots, n\right]=\left(\sum_{i=1}^{n} \frac{u_{i}}{2^{i}}, \sum_{i=1}^{n} \frac{u_{i}}{2^{i}}+\frac{1}{2^{n}}\right] . \tag{1.9}
\end{equation*}
$$

The interval here is open on the left and closed on the right precisely because the expansion (1.7) is the nonterminating one. In the model for coin tossing the set (1.9) represents the event that the first $n$ tosses give the outcomes $u_{1}, \ldots, u_{n}$ in sequence. By (1.3) and (1.9),

$$
\begin{equation*}
P\left[\omega: d_{i}(\omega)=u_{i}, i=1, \ldots, n\right]=\frac{1}{2^{n}}, \tag{1.10}
\end{equation*}
$$

which is what probabilistic intuition requires.

![](https://cdn.mathpix.com/cropped/368b4b9b-2cc8-486a-b0be-6044ed5eb877-018.jpg?height=309&width=1021&top_left_y=843&top_left_x=335)
Decompositions by dyadic intervals

The intervals (1.9) are called dyadic intervals, the endpoints being adjacent dyadic rationals $k / 2^{n}$ and $(k+1) / 2^{n}$ with the same denominator, and $n$ is the rank or order of the interval. For each $n$ the $2^{n}$ dyadic intervals of rank $n$ decompose or partition the unit interval. In the passage from the partition for $n$ to that for $n+1$, each interval (1.9) is split into two parts of equal length, a left half on which $d_{n+1}(\omega)$ is 0 and a right half on which $d_{n+1}(\omega)$ is 1 . For $u=0$ and for $u=1$, the set $\left[\omega: d_{n+1}(\omega)=u\right]$ is thus a disjoint union of $2^{n}$ intervals of length $1 / 2^{n+1}$ and hence has probability $\frac{1}{2}$ : $P\left[\omega: d_{n}(\omega)=u\right]=\frac{1}{2}$ for all $n$.

Note that $d_{i}(\omega)$ is constant over each dyadic interval of rank $i$ and that for $n>i$ each dyadic interval of rank $n$ is entirely contained in a single dyadic interval of rank $i$. Therefore, $d_{i}(\omega)$ is constant over each dyadic interval of rank $n$ if $i \leq n$.

The probabilities of various familiar events can be written down immediately. The sum $\sum_{i=1}^{n} d_{i}(\omega)$ is the number of 1's among $d_{1}(\omega), \ldots, d_{n}(\omega)$, to be thought of as the number of heads in $n$ tosses of a fair coin. The usual binomial formula is

$$
\begin{equation*}
P\left[\omega: \sum_{i=1}^{n} d_{i}(\omega)=k\right]=\binom{n}{k} \frac{1}{2^{n}}, \quad 0 \leq k \leq n . \tag{1.11}
\end{equation*}
$$

This follows from the definitions: The set on the left in (1.11) is the union of those intervals (1.9) corresponding to sequences $u_{1}, \ldots, u_{n}$ containing $k$ l's and $n-k 0$ 's; each such interval has length $1 / 2^{n}$ by (1.10) and there are $\binom{n}{k}$ of them, and so (1.11) follows from (1.3).

The functions $d_{n}(\omega)$ can be looked at in two ways. Fixing $n$ and letting $\omega$ vary gives a real function $d_{n}=d_{n}(\cdot)$ on the unit interval. Fixing $\omega$ and letting $n$ vary gives the sequence (1.8) of 0 's and 1 's. The probabilities (1.10) and (1.11) involve only finitely many of the components $d_{i}(\omega)$. The interest here, however, will center mainly on properties of the entire sequence (1.8). It will be seen that the mathematical properties of this sequence mirror the properties to be expected of a coin-tossing process that continues forever.

As the expansion (1.7) is the nonterminating one, there is the defect that for no $\omega$ is (1.8) the sequence $(1,0,0,0, \ldots)$, for example. It seems clear that the chance should be 0 for the coin to turn up heads on the first toss and tails forever after, so that the absence of $(1,0,0,0, \ldots)$-or of any other single sequence-should not matter. See on this point the additional remarks immediately preceding Theorem 1.2.

## The Weak Law of Large Numbers

In studying the connection with coin tossing it is instructive to begin with a result that can, in fact, be treated within the framework of discrete probability, namely, the weak law of large numbers:

Theorem 1.1. For each $\epsilon,^{\dagger}$

$$
\begin{equation*}
\lim _{n \rightarrow \infty} P\left[\omega:\left|\frac{1}{n} \sum_{i=1}^{n} d_{i}(\omega)-\frac{1}{2}\right| \geq \epsilon\right]=0 \tag{1.12}
\end{equation*}
$$

Interpreted probabilistically, (1.12) says that if $n$ is large, then there is small probability that the fraction or relative frequency of heads in $n$ tosses will deviate much from $\frac{1}{2}$, an idea lying at the base of the frequency conception of probability. As a statement about the structure of the real numbers, (1.12) is also interesting arithmetically.

Since $d_{i}(\omega)$ is constant over each dyadic interval of rank $n$ if $i \leq n$, the sum $\sum_{i=1}^{n} d_{i}(\omega)$ is also constant over each dyadic interval of rank $n$. The set in (1.12) is therefore the union of certain of the intervals (1.9), and so its probability is well defined by (1.3).

With the Riemann integral in the role of expected value, the usual application of Chevyshev's inequality will lead to a proof of (1.12). The argument becomes simpler if the $d_{n}(\omega)$ are replaced by the Rademacher functions,

$$
r_{n}(\omega)=2 d_{n}(\omega)-1= \begin{cases}+1 & \text { if } d_{n}(\omega)=1  \tag{1.13}\\ -1 & \text { if } d_{n}(\omega)=0\end{cases}
$$

[^2]![](https://cdn.mathpix.com/cropped/368b4b9b-2cc8-486a-b0be-6044ed5eb877-020.jpg?height=432&width=429&top_left_y=224&top_left_x=424)
Graph of $r_{1}(\omega)$

![](https://cdn.mathpix.com/cropped/368b4b9b-2cc8-486a-b0be-6044ed5eb877-020.jpg?height=420&width=417&top_left_y=230&top_left_x=1011)
Graph of $r_{2}(\omega)$

Consider the partial sums

$$
\begin{equation*}
s_{n}(\omega)=\sum_{i=1}^{n} r_{i}(\omega) \tag{1.14}
\end{equation*}
$$

Since $\sum_{i=1}^{n} d_{i}(\omega)=\left(s_{n}(\omega)+n\right) / 2$, (1.12) with $\epsilon / 2$ in place of $\epsilon$ is the same thing as

$$
\begin{equation*}
\lim _{n \rightarrow \infty} P\left[\omega:\left|\frac{1}{n} s_{n}(\omega)\right| \geq \epsilon\right]=0 \tag{1.15}
\end{equation*}
$$

This is the form in which the theorem will be proved.
The Rademacher functions have themselves a direct probabilistic meaning. If a coin is tossed successively, and if a particle starting from the origin performs a random walk on the real line by successively moving one unit in the positive or negative direction according as the coin falls heads or tails, then $r_{i}(\omega)$ represents the distance it moves on the $i$ th step and $s_{n}(\omega)$ represents its position after $n$ steps. There is also the gambling interpretation: If a gambler bets one dollar, say, on each toss of the coin, $r_{i}(\omega)$ represents his gain or loss on the $i$ th play and $s_{n}(\omega)$ represents his gain or loss in $n$ plays.

Each dyadic interval of rank $i-1$ splits into two dyadic intervals of rank $i$; $r_{i}(\omega)$ has value -1 on one of these and value +1 on the other. Thus $r_{i}(\omega)$ is -1 on a set of intervals of total length $\frac{1}{2}$ and +1 on a set of total length $\frac{1}{2}$. Hence $\int_{0}^{1} r_{i}(\omega) d \omega=0$ by (1.6), and

$$
\begin{equation*}
\int_{0}^{1} s_{n}(\omega) d \omega=0 \tag{1.16}
\end{equation*}
$$

by (1.5). If the integral is viewed as an expected value, then (1.16) says that the mean position after $n$ steps of a random walk is 0 .

Suppose that $i<j$. On a dyadic interval of rank $j-1, r_{i}(\omega)$ is constant and $r_{j}(\omega)$ has value -1 on the left half and +1 on the right. The product
$r_{i}(\omega) r_{j}(\omega)$ therefore integrates to 0 over each of the dyadic intervals of rank $j-1$, and so

$$
\begin{equation*}
\int_{0}^{1} r_{i}(\omega) r_{j}(\omega) d \omega=0, \quad i \neq j \tag{1.17}
\end{equation*}
$$

This corresponds to the fact that independent random variables are uncorrelated. Since $r_{i}^{2}(\omega)=1$, expanding the square of the sum (1.14) shows that

$$
\begin{equation*}
\int_{0}^{1} s_{n}^{2}(\omega) d \omega=n \tag{1.18}
\end{equation*}
$$

This corresponds to the fact that the variances of independent random variables add. Of course (1.16), (1.17), and (1.18) stand on their own, in no way depend on any probabilistic interpretation.

Applying Chebyshev's inequality in a formal way to the probability in (1.15) now leads to

$$
\begin{equation*}
P\left[\omega:\left|s_{n}(\omega)\right| \geq n \epsilon\right] \leq \frac{1}{n^{2} \epsilon^{2}} \int_{0}^{1} s_{n}^{2}(\omega) d \omega=\frac{1}{n \epsilon^{2}} \tag{1.19}
\end{equation*}
$$

The following lemma justifies the inequality.
Let $f$ be a step function as in (1.6): $f(\omega)=c_{j}$ for $\omega \in\left(x_{j-1}, x_{j}\right]$, where $0=x_{0}<\cdots<x_{k}=1$.

Lemma. If $f$ is a nonnegative step function, then $[\omega: f(\omega) \geq \alpha]$ is for $\alpha>0$ a finite union of intervals and

$$
\begin{equation*}
P[\omega: f(\omega) \geq \alpha] \leq \frac{1}{\alpha} \int_{0}^{1} f(\omega) d \omega \tag{1.20}
\end{equation*}
$$

![](https://cdn.mathpix.com/cropped/368b4b9b-2cc8-486a-b0be-6044ed5eb877-021.jpg?height=583&width=872&top_left_y=1903&top_left_x=470)

Proof. The set in question is the union of the intervals ( $x_{j-1}, x_{j}$ ] for which $c_{j} \geq \alpha$. If $\Sigma^{\prime}$ denotes summation over those $j$ satisfying $c_{j} \geq \alpha$, then $P[\omega: f(\omega) \geq \alpha]=\sum^{\prime}\left(x_{j}-x_{j-1}\right)$ by the definition (1.3). On the other hand,
since the $c_{j}$ are all nonnegative by hypothesis, (1.6) gives

$$
\begin{aligned}
\int_{0}^{1} f(\omega) d \omega & =\sum_{j=1}^{k} c_{j}\left(x_{j}-x_{j-1}\right) \geq \sum^{\prime} c_{j}\left(x_{j}-x_{j-1}\right) \\
& \geq \sum^{\prime} \alpha\left(x_{j}-x_{j-1}\right)
\end{aligned}
$$

Hence (1.20).
Taking $\alpha=n^{2} \epsilon^{2}$ and $f(\omega)=s_{n}^{2}(\omega)$ in (1.20) gives (1.19). Clearly, (1.19) implies (1.15), and as already observed, this in turn implies (1.12).

## The Strong Law of Large Numbers

It is possible with a minimum of technical apparatus to prove a stronger result that cannot even be formulated in the discrete theory of probability. Consider the set

$$
\begin{equation*}
N=\left[\omega: \lim _{n \rightarrow \infty} \frac{1}{n} \sum_{i=1}^{n} d_{i}(\omega)=\frac{1}{2}\right] \tag{1.21}
\end{equation*}
$$

consisting of those $\omega$ for which the asymptotic relative frequency* of 1 in the sequence (1.8) is $\frac{1}{2}$. The points in (1.21) are called normal numbers. The idea is to show that a real number $\omega$ drawn at random from the unit interval is "practically certain" to be normal, or that there is "practical certainty" that 1 occurs in the sequence (1.8) of tosses with asymptotic relative frequency $\frac{1}{2}$. It is impossible at this stage to prove that $P(N)=1$, because $N$ is not a finite union of intervals and so has been assigned no probability. But the notion of "practical certainty" can be formalized in the following way.

Define a subset $A$ of $\Omega$ to be negligible ${ }^{\dagger}$ if for each positive $\epsilon$ there exists a finite or countable ${ }^{\ddagger}$ collection $I_{1}, I_{2}, \ldots$ of intervals (they may overlap) satisfying

$$
\begin{equation*}
A \subset \bigcup_{k} I_{k} \tag{1.22}
\end{equation*}
$$

and

$$
\begin{equation*}
\sum_{k}\left|I_{k}\right|<\epsilon . \tag{1.23}
\end{equation*}
$$

A negligible set is one that can be covered by intervals the total sum of whose lengths can be made arbitrarily small. If $P(A)$ is assigned to such an
*The frequency of 1 (the number of occurrences of it) among $d_{1}(\omega), \ldots, d_{n}(\omega)$ is $\sum_{i=1}^{n} d_{i}(\omega)$, the relative frequency is $n^{-1} \sum_{i=1}^{n} d_{i}(\omega)$, and the asymptotic relative frequency is the limit in (1.21). ${ }^{\dagger}$ The term negligible is introduced for the purposes of this section only. The negligible sets will reappear later as the sets of Lebesgue measure 0 .
${ }^{\ddagger}$ Countably infinite is unambiguous. Countable will mean finite or countably infinite, although it will sometimes for emphasis be expanded as here to finite or countable.
$A$ in any reasonable way, then for the $I_{k}$ of (1.22) and (1.23) it ought to be true that $P(A) \leq \sum_{k} P\left(I_{k}\right)=\sum_{k}\left|I_{k}\right|<\epsilon$, and hence $P(A)$ ought to be 0 . Even without any assignment of probability at all, the definition of negligibility can serve as it stands as an explication of "practical impossibility" and "practical certainty": Regard it as practically impossible that the random $\omega$ will lie in $A$ if $A$ is negligible, and regard it as practically certain that $\omega$ will lie in $A$ if its complement $A^{c}$ [Al] is negligible.

Although the fact plays no role in the next proof, for an understanding of negligibility observe first that a finite or countable union of negligible sets is negligible. Indeed, suppose that $A_{1}, A_{2}, \ldots$ are negligible. Given $\epsilon$, for each $n$ choose intervals $I_{n 1}, I_{n 2}, \ldots$ such that $A_{n} \subset \mathrm{U}_{k} I_{n k}$ and $\Sigma_{k}\left|I_{n k}\right|<\epsilon / 2^{n}$. All the intervals $I_{n k}$ taken together form a countable collection covering $\mathrm{U}_{n} A_{n}$, and their lengths add to $\sum_{n} \sum_{k}\left|I_{n k}\right|<\sum_{n} \epsilon / 2^{n}=\epsilon$. Therefore, $U_{n} A_{n}$ is negligible.

A set consisting of a single point is clearly negligible, and so every countable set is also negligible. The rationals for example form a negligible set. In the coin-tossing model, a single point of the unit interval has the role of a single sequence of 0's and 1's, or of a single sequence of heads and tails. It corresponds with intuition that it should be "practicaliy impossible" to toss a coin infinitely often and realize any one particular infinite sequence set down in advance. It is for this reason not a real shortcoming of the model that for no $\omega$ is (1.8) the sequence $(1,0,0,0, \ldots)$. In fact, since a countable set is negligible, it is not a shortcoming that (1.8) is never one of the countably many sequences that end in 0 's.

Theorem 1.2. The set of normal numbers has negligible complement.
This is Borel's normal number theorem, ${ }^{\dagger}$ a special case of the strong law of large numbers. Like Theorem 1.1, it is of arithmetic as well as probabilistic interest.

The set $N^{c}$ is not countable: Consider a point $\omega$ for which $\left(d_{1}(\omega), d_{2}(\omega), \ldots\right)=\left(1,1, u_{3}, 1,1, u_{6}, \ldots\right)$-that is, a point for which $d_{i}(\omega)=1$ unless $i$ is a multiple of 3 . Since $n^{-1} \sum_{i=1}^{n} d_{i}(\omega) \geq \frac{2}{3}$, such a point cannot be normal. But there are uncountably many such points, one for each infinite sequence ( $u_{3}, u_{6}, \ldots$ ) of 0 's and 1's. Thus one cannot prove $N^{c}$ negligible by proving it countable, and a deeper argument is required.

Proof of Theorem 1.2. Clearly (1.21) and

$$
\begin{equation*}
N=\left[\omega: \lim _{n \rightarrow \infty} \frac{1}{n} s_{n}(\omega)=0\right] \tag{1.24}
\end{equation*}
$$

[^3]define the same set (see (1.14)). To prove $N^{c}$ negligible requires constructing coverings that satisfy (1.22) and (1.23) for $A=N^{c}$. The construction makes use of the inequality
$$
\begin{equation*}
P\left[\omega:\left|s_{n}(\omega)\right| \geq n \epsilon\right] \leq \frac{1}{n^{4} \epsilon^{4}} \int_{0}^{1} s_{n}^{4}(\omega) d \omega \tag{1.25}
\end{equation*}
$$

This follows by the same argument that leads to the inequality in (1.19)-it is only necessary to take $f(\omega)=s_{n}^{4}(\omega)$ and $\alpha=n^{4} \epsilon^{4}$ in (1.20). As the integral in (1.25) will be shown to have order $n^{2}$, the inequality is stronger than (1.19).

The integrand on the right in (1.25) is

$$
\begin{equation*}
s_{n}^{4}(\omega)=\sum r_{\alpha}(\omega) r_{\beta}(\omega) r_{\gamma}(\omega) r_{\delta}(\omega), \tag{1.26}
\end{equation*}
$$

where the four indices range independently from 1 to $n$. Depending on how the indices match up, each term in this sum reduces to one of the following five forms, where in each case the indices are now distinct:

$$
\left\{\begin{array}{l}
r_{i}^{4}(\omega)=1  \tag{1.27}\\
r_{i}^{2}(\omega) r_{j}^{2}(\omega)=1 \\
r_{i}^{2}(\omega) r_{j}(\omega) r_{k}(\omega)=r_{j}(\omega) r_{k}(\omega) \\
r_{i}^{3}(\omega) r_{j}(\omega)=r_{i}(\omega) r_{j}(\omega) \\
r_{i}(\omega) r_{j}(\omega) r_{k}(\omega) r_{i}(\omega)
\end{array}\right.
$$

If, for example, $k$ exceeds $i, j$, and $l$, then the last product in (1.27) integrates to 0 over each dyadic interval of rank $k-1$, because $r_{i}(\omega) r_{j}(\omega) r_{i}(\omega)$ is constant there, while $r_{k}(\omega)$ is -1 on the left half and +1 on the right. Adding over the dyadic intervals of rank $k-1$ gives

$$
\int_{0}^{1} r_{i}(\omega) r_{j}(\omega) r_{k}(\omega) r_{I}(\omega) d \omega=0
$$

This holds whenever the four indices are distinct. From this and (1.17) it follows that the last three forms in (1.27) integrate to 0 over the unit interval; of course, the first two forms integrate to 1 .

The number of occurrences in the sum (1.26) of the first form in (1.27) is $\boldsymbol{n}$. The number of occurrences of the second form is $3 n(n-1)$, because there are $n$ choices for the $\alpha$ in (1.26), three ways to match it with $\beta, \gamma$, or $\delta$, and $n-1$ choices for the value common to the remaining two indices. A term-byterm integration of (1.26) therefore gives

$$
\begin{equation*}
\int_{0}^{1} s_{n}^{4}(\omega) d \omega=n+3 n(n-1) \leq 3 n^{2} \tag{1.28}
\end{equation*}
$$

and it follows by (1.25) that

$$
\begin{equation*}
P\left[\omega:\left|\frac{1}{n} s_{n}(\omega)\right| \geq \epsilon\right] \leq \frac{3}{n^{2} \epsilon^{4}} . \tag{1.29}
\end{equation*}
$$

Fix a positive sequence $\left\{\epsilon_{n}\right\}$ going to 0 slowly enough that the series $\sum_{n} \epsilon_{n}^{-4} n^{-2}$ converges (take $\epsilon_{n}=n^{-1 / 8}$, for example). If $A_{n}=\left[\omega:\left|n^{-1} s_{n}(\omega)\right| \geq\right. \left.\epsilon_{n}\right]$, then $P\left(A_{n}\right) \leq 3 \epsilon_{n}^{-4} n^{-2}$ by (1.29), and so $\sum_{n} P\left(A_{n}\right)<\infty$.

If, for some $m, \omega$ lies in $A_{n}^{c}$ for all $n$ greater than or equal to $m$, then $\left|n^{-1} s_{n}(\omega)\right|<\epsilon_{n}$ for $n \geq m$, and it follows that $\omega$ is normal because $\epsilon_{n} \rightarrow 0$ (see (1.24)). In other words, for each $m, \bigcap_{n=m}^{\infty} A_{n}^{c} \subset N$, which is the same thing as $N^{c} \subset \cup_{n=m}^{\infty} A_{n}$. This last relation leads to the required covering: Given $\epsilon$, choose $m$ so that $\sum_{n=m}^{\infty} P\left(A_{n}\right)<\epsilon$. Now $A_{n}$ is a finite disjoint union $\bigcup_{k} I_{n k}$ of intervals with $\Sigma_{k}\left|I_{n k}\right|=P\left(A_{n}\right)$, and therefore $\bigcup_{n=m}^{\infty} A_{n}$ is a countable union $\mathrm{U}_{n=m}^{\infty} \mathrm{U}_{k} I_{n k}$ of intervals (not disjoint, but that does not matter) with $\sum_{n=m}^{\infty} \sum_{k}\left|I_{n k}\right|=\sum_{n=m}^{\infty} P\left(A_{n}\right)<\epsilon$. The intervals $I_{n k}(n \geq m, k \geq 1)$ provide a covering of $N^{c}$ of the kind the definition of negligibility calls for. $\square$

## Strong Law Versus Weak

Theorem 1.2 is stronger than Theorem 1.1. A consideration of the forms of the two propositions will show that the strong law goes far beyond the weak law.

For each $n$ let $f_{n}(\omega)$ be a step function on the unit interval, and consider the relation

$$
\begin{equation*}
\lim _{n \rightarrow \infty} P\left[\omega:\left|f_{n}(\omega)\right| \geq \epsilon\right]=0 \tag{1.30}
\end{equation*}
$$

together with the set

$$
\begin{equation*}
\left[\omega: \lim _{n \rightarrow \infty} f_{n}(\omega)=0\right] . \tag{1.31}
\end{equation*}
$$

If $f_{n}(\omega)=n^{-1} s_{n}(\omega)$, then (1.30) reduces to the weak law (1.15), and (1.31) coincides with the set (1.24) of normal numbers. According to a general result proved below (Theorem 5.2(ii)), whatever the step functions $f_{n}(\omega)$ may be, if the set (1.31) has negligible complement, then (1.30) holds for each positive $\epsilon$. For this reason, a proof of Theorem 1.2 is automatically a proof of Theorem 1.1.

The converse, however, fails: There exist step functions $f_{n}(\omega)$ that satisfy (1.30) for each positive $\epsilon$ but for which (1.31) fails to have negligible complement (Example 5.4). For this reason, a proof of Theorem 1.1 is not automatically a proof of Theorem 1.2; the latter lies deeper and its proof is correspondingly more complex.

## Length

According to Theorem 1.2, the complement $N^{c}$ of the set of normal numbers is negligible. What if $N$ itself were negligible? It would then follow that $(0,1]=N \cup N^{c}$ was negligible as well, which would disqualify negligibility as an explication of "practical impossibility," as a stand-in for "probability zero." The proof below of the "obvious" fact that an interval of positive
length is not negligible (Theorem 1.3(ii)), while simple enough, does involve the most fundamental properties of the real number system.

Consider an interval $I=(a, b]$ of length $|I|=b-a$; see (1.1). Consider also a finite or infinite sequence of intervals $I_{k}=\left(a_{k}, b_{k}\right]$. While each of these intervals is bounded, they need not be subintervals of $(0,1]$.

Theorem 1.3. (i) If $\bigcup_{k} I_{k} \subset I$, and the $I_{k}$ are disjoint, then $\Sigma_{k}\left|I_{k}\right| \leq|I|$.
(ii) If $I \subset \bigcup_{k} I_{k}$ (the $I_{k}$ need not be disjoint), then $|I| \leq \sum_{k}\left|I_{k}\right|$.
(iii) If $I=\bigcup_{k} I_{k}$, and the $I_{k}$ are disjoint, then $|I|=\Sigma_{k}\left|I_{k}\right|$.

Proof. Of course (iii) follows from (i) and (ii).

Proof of (i): Finite case. Suppose there are $n$ intervals. The result being obvious for $n=1$, assume that it holds for $n-1$. If $a_{n}$ is the largest among $a_{1}, \ldots, a_{n}$ (this is just a matter of notation), then $\bigcup_{k=1}^{n-1}\left(a_{k}, b_{k}\right] \subset$ ( $a, a_{n}$ ], so that $\sum_{k=1}^{n-1}\left(b_{k}-a_{k}\right) \leq a_{n}-a$ by the induction hypothesis, and hence $\sum_{k=1}^{n}\left(b_{k}-a_{k}\right) \leq\left(a_{n}-a\right)+\left(b_{n}-a_{n}\right) \leq b-a$.

Infinite case. If there are infinitely many intervals, each finite subcollection satisfies the hypotheses of (i), and so $\sum_{k=1}^{n}\left(b_{k}-a_{k}\right) \leq b-a$ by the finite case. But as $n$ is arbitrary, the result follows.

Proof of (ii): Finite case. Assume that the result holds for the case of $n-1$ intervals and that $(a, b] \subset \cup_{k=1}^{n}\left(a_{k}, b_{k}\right]$. Suppose that $a_{n}<b \leq b_{n}$ (notation again). If $a_{n} \leq a$, the result is obvious. Otherwise, $\left(a, a_{n}\right] \subset \bigcup_{k=1}^{n-1}\left(a_{k}, b_{k}\right]$, so that $\sum_{k=1}^{n-1}\left(b_{k}-a_{k}\right) \geq a_{n}-a$ by the induction hypothesis and hence $\sum_{k=1}^{n}\left(b_{k}-a_{k}\right) \geq\left(a_{n}-a\right)+\left(b_{n}-a_{n}\right) \geq b-a$. The finite case thus follows by induction.

Infinite case. Suppose that $(a, b] \subset \bigcup_{k=1}^{\infty}\left(a_{k}, b_{k}\right]$. If $0<\epsilon<b-a$, the open intervals $\left(a_{k}, b_{k}+\epsilon 2^{-k}\right)$ cover the closed interval $[a+\epsilon, b]$, and it follows by the Heine-Borel theorem [A13] that $[a+\epsilon, b] \subset \cup_{k=1}^{n}\left(a_{k}, b_{k}+\epsilon 2^{-k}\right)$ for some $n$. But then $(a+\epsilon, b] \subset \bigcup_{k=1}^{n}\left(a_{k}, b_{k}+\epsilon 2^{-k}\right]$, and by the finite case, $b-(a+\epsilon) \leq \sum_{k=1}^{n}\left(b_{k}+\epsilon 2^{-k}-a_{k}\right) \leq \sum_{k=1}^{\infty}\left(b_{k}-a_{k}\right)+\epsilon$. Since $\epsilon$ was arbitrary, the result follows. $\square$

Theorem 1.3 will be the starting point for the theory of Lebesgue measure as developed in Sections 2 and 3. Taken together, parts (i) and (ii) of the theorem for only finitely many intervals $I_{k}$ imply (1.4) for disjoint $A$ and $B$. Like (1.4), they follow immediately from the additivity of the Riemann integral; but the point is to give an independent development of which the Riemann theory will be an eventual by-product.

To pass from the finite to the infinite case in part (i) of the theorem is easy. But to pass from the finite to the infinite case in part (ii) involves compactness, a profound idea underlying all of modern analysis. And it is part (ii) that shows that an interval $I$ of positive length is not negligible: $|I|$ is
a positive lower bound for the sum of the lengths of the intervals in any covering of $I$.

## The Measure Theory of Diophantine Approximation*

Diophantine approximation has to do with the approximation of real numbers $x$ by rational fractions $p / q$. The measure theory of Diophantine approximation has to do with the degree of approximation that is possible if one disregards negligible sets of real $x$.

For each positive integer $q, x$ must lie between some pair of successive multiples of $1 / q$, so that for some $p,|x-p / q| \leq 1 / q$. Since for each $q$ the intervals

$$
\begin{equation*}
\left(\frac{p}{q}-\frac{1}{2 q}, \frac{p}{q}+\frac{1}{2 q}\right] \tag{1.32}
\end{equation*}
$$

decompose the line, the error of approximation can be further reduced to $1 / 2 q$ : For each $q$ there is a $p$ such that $|x-p / q| \leq 1 / 2 q$. These observations are of course trivial. But for "most" real numbers $x$ there will be many values of $p$ and $q$ for which $x$ lies very near the center of the interval (1.32), so that $p / q$ is a very sharp approximation to $x$.

Theorem 1.4. If $x$ is irrational, there are infinitely many irreducible fractions $p / q$ such that

$$
\begin{equation*}
\left|x-\frac{p}{q}\right|<\frac{1}{q^{2}} . \tag{1.33}
\end{equation*}
$$

This famous theorem of Dirichlet says that for infinitely many $p$ and $q, x$ lies in $\left(p / q-1 / q^{2}, p / q+1 / q^{2}\right)$ and hence is indeed very near the center of (1.32).

Proof. For a positive integer $Q$, decompose $[0,1)$ into the $Q$ subintervals $[(i-1) / Q, i / Q), i=1, \ldots, Q$. The points (fractional parts) $\{q x\}=q x-\lfloor q x\rfloor$ for $q= 0,1, \ldots, Q$ lie in $[0,1)$, and since there are $Q+1$ points ${ }^{\dagger}$ and only $Q$ subintervals, it follows (Dirichlet's drawer principle) that some subinterval contains more than one point. Suppose that $\left\{q^{\prime} x\right\}$ and $\left\{q^{\prime \prime} x\right\}$ lie in the same subinterval and $0 \leq q^{\prime}<q^{\prime \prime} \leq Q$. Take $q=q^{\prime \prime}-q^{\prime}$ and $p=\left\lfloor q^{\prime \prime} x\right\rfloor-\left\lfloor q^{\prime} x\right\rfloor$; then $1 \leq q \leq Q$ and $|q x-p|=\left|\left\{q^{\prime \prime} x\right\}-\left\{q^{\prime} x\right\}\right| <1 / Q:$

$$
\begin{equation*}
\left|x-\frac{p}{q}\right|<\frac{1}{q Q} \leq \frac{1}{q^{2}} . \tag{1.34}
\end{equation*}
$$

If $p$ and $q$ have any common factors, cancel them; this will not change the left side of (1.34), and it will decrease $q$.

For each $Q$, therefore, there is an irreducible $p / q$ satisfying (1.34). ${ }^{\ddagger}$ Suppose there are only finitely many irreducible solutions of (1.33), say $p_{1} / q_{1}, \ldots, p_{m} / q_{m}$. Since $x$ is irrational, the $\left|x-p_{k} / q_{k}\right|$ are all positive, and it is possible to choose $Q$ so that $Q^{-1}$ is smaller than each of them. But then the $p / q$ of (1.34) is a solution of (1.33), and since $|x-p / q|<1 / Q$, there is a contradiction.

[^4]In the measure theory of Diophantine approximation, one looks at the set of real $x$ having such and such approximation properties and tries to show that this set is negligible or else that its complement is. Since the set of rationals is negligible, Theorem 1.4 implies such a result: Apart from a negligible set of $x$, (1.33) has infinitely many irreducible solutions.

What happens if the inequality (1.33) is tightened? Consider

$$
\begin{equation*}
\left|x-\frac{p}{q}\right|<\frac{1}{q^{2} \varphi(q)}, \tag{1.35}
\end{equation*}
$$

and let $A_{\varphi}$ consist of the real $x$ for which (1.35) has infinitely many irreducible solutions. Under what conditions on $\varphi$ will $A_{\varphi}$ have negligible complement? If $\varphi(q) \leq 1$, then (1.35) is weaker than (1.33): $\varphi(q)>1$ in the interesting cases. Since $x$ satisfies (1.35) for infinitely many irreducible $p / q$ if and only if $x-\lfloor x\rfloor$ does, $A_{\varphi}$ may as well be redefined as the set of $x$ in $(0,1)$ (or even as the set of irrational $x$ in $(0,1)$ ) for which (1.35) has infinitely many solutions.

Theorem 1.5. Suppose that $\varphi$ is positive and nondecreasing. If

$$
\begin{equation*}
\sum_{q} \frac{1}{q \varphi(q)}=\infty \tag{1.36}
\end{equation*}
$$

then $A_{\varphi}$ has negligible complement.
Theorem 1.4 covers the case $\varphi(q) \equiv 1$. Although this is the natural place to state Theorem 1.5 in its general form, the proof, which involves continued fractions and the ergodic theorem, must be postponed; see Section 24, p. 324. The converse, on the other hand, has a very simple proof.

Theorem 1.6. Suppose that $\varphi$ is positive. If

$$
\begin{equation*}
\sum_{q} \frac{1}{q \varphi(q)}<\infty \tag{1.37}
\end{equation*}
$$

then $A_{\varphi}$ is negligible.
Proof. Given $\epsilon$, choose $q_{0}$ so that $\sum_{q \geq q_{0}} 1 / q \varphi(q)<\epsilon / 4$. If $x \in A_{\varphi}$, then (1.35) holds for some $q \geq q_{0}$, and since $0<x<1$, the corresponding $p$ lies in the range $0 \leq p \leq q$. Therefore,

$$
A_{\varphi} \subset \bigcup_{q \geq q_{0}} \bigcup_{p=0}^{q}\left(\frac{p}{q}-\frac{1}{q^{2} \varphi(q)}, \frac{p}{q}+\frac{1}{q^{2} \varphi(q)}\right] .
$$

The right side here is a countable union of intervals covering $A_{\varphi}$, and the sum of their lengths is

$$
\sum_{q \geq q_{0}} \sum_{p=0}^{q} \frac{2}{q^{2} \varphi(q)}=\sum_{q \geq q_{0}} \frac{2(q+1)}{q^{2} \varphi(q)} \leq \sum_{q \geq q_{0}} \frac{4}{q \varphi(q)}<\epsilon .
$$

Thus $A_{\varphi}$ satisfies the definition ((1.22) and (1.23)) of negligibility.

If $\varphi_{1}(q) \equiv 1$, then (1.36) holds and hence $A_{\varphi_{1}}$ has negligible complement (as follows also from Theorem 1.4). If $\varphi_{2}(q)=q^{\epsilon}$, however, then (1.37) holds and $A_{\varphi_{2}}$ itself is negligible Outside the negligible set $A_{\varphi_{1}}^{c} \cup A_{\varphi_{2}}$, therefore, $|x-p / q|< 1 / q^{2}$ has infinitely many irreducible solutions but $|x-p / q|<1 / q^{2+\epsilon}$ has only finitely many. Similarly, since $\Sigma_{q} 1 /(q \log q)$ diverges but $\Sigma_{q} 1 /\left(q \log ^{1+\epsilon} q\right)$ converges, outside a negligible set $|x-p / q|<1 /\left(q^{2} \log q\right)$ has infinitely many irreducible solutions but $|x-p / q|<1 /\left(q^{2} \log ^{1+\epsilon} q\right)$ has only finitely many.

Rational approximations to $x$ obtained by truncating its binary (or decimal) expansion are very inaccurate: see Example 4.17. The sharp rational approximations to $x$ come from truncation of its continued-fraction expansion: see Section 24.

## PROBLEMS

Some problems involve concepts not required for an understanding of the text, or concepts treated only in later sections; there are no problems whose solutions are used in the text itself. An arrow ↑ points back to a problem (the one immediately preceding if no number is given) the solution and terminology of which are assumed. See Notes on the Problems, p. 552.
1.1. (a) Show that a discrete probability space (see Example 2.8 for the formal definition) cannot contain an infinite sequence $A_{1}, A_{2}, \ldots$ of independent events each of probability $\frac{1}{2}$. Since $A_{n}$ could be identified with heads on the $n$th toss of a coin, the existence of such a sequence would make this section superfluous.
(b) Suppose that $0 \leq p_{n} \leq 1$, and put $\alpha_{n}=\min \left\{p_{n}, 1-p_{n}\right\}$. Show that, if $\sum_{n} \alpha_{n}$ diverges, then no discrete probability space can contain independent events $A_{1}, A_{2}, \ldots$ such that $A_{n}$ has probability $p_{n}$.
1.2. Show that $N$ and $N^{c}$ are dense [A15] in ( 0,1 ].
1.3. $\bullet$ Define a set $A$ to be triffing ${ }^{\dagger}$ if for each $\epsilon$ there exists a finite sequence of intervals $I_{k}$ satisfying (1.22) and (1.23). This definition and the definition of negligibility apply as they stand to all sets on the real line, not just to subsets of $(0,1]$.
(a) Show that a trifling set is negligible.
(b) Show that the closure of a trifling set is also trifling.
(c) Find a bounded negligible set that is not trifling.
(d) Show that the closure of a negligible set may not be negligible.
(e) Show that finite unions of trifling sets are trifling but that this can fail for countable unions.
1.4. $\uparrow$ For $i=0, \ldots, r-1$, let $A_{r}(i)$ be the set of numbers in ( 0,1$]$ whose nonterminating expansions in the base $r$ do not contain the digit $i$,
(a) Show that $A_{r}(i)$ is trifling.
(b) Find a trifling set $A$ such that every point in the unit interval can be represented in the form $x+y$ with $x$ and $y$ in $A$.
${ }^{\dagger}$ Like negligible, trifling is a nonce word used only here. The trifling sets are exactly the sets of content 0: See Problem 3.15
(c) Let $A_{r}\left(i_{1}, \ldots, i_{k}\right)$ consist of the numbers in the unit interval in whose base-r expansions the digits $i_{1}, \ldots, i_{k}$ nowhere appear consecutively in that order. Show that it is trifling. What does this imply about the monkey that types at random?
1.5. $\uparrow$ The Cantor set $C$ can be defined as the closure of $A_{3}(1)$
(a) Show that $C$ is uncountable but trifling.
(b) From $[0,1]$ remove the open middle third $\left(\frac{1}{3}, \frac{2}{3}\right)$; from the remainder, a union of two closed intervals, remove the two open middle thirds ( $\frac{1}{9}, \frac{2}{9}$ ) and $\left(\frac{7}{9}, \frac{8}{9}\right)$. Show that $C$ is what remains when this process is continued ad infinitum.
(c) Show that $C$ is perfect [A15]
1.6. Put $M(t)=\int_{0}^{1} e^{t s_{n}(\omega)} d \omega$, and show by successive differentiations under the integral that

$$
\begin{equation*}
M^{(k)}(0)=\int_{0}^{1} s_{n}^{k}(\omega) d \omega \tag{1.38}
\end{equation*}
$$

Over each dyadic interval of rank $n, s_{n}(\omega)$ has a constant value of the form $\pm 1 \pm 1 \pm \cdots \pm 1$, and therefore $M(t)=2^{-n} \sum \exp t( \pm 1 \pm 1 \pm \cdots \pm 1)$, where the sum extends over all $2^{n} n$-long sequences of +1 's and -1 's. Thus

$$
\begin{equation*}
M(t)=\left(\frac{e^{t}+e^{-1}}{2}\right)^{n}=(\cosh t)^{n} \tag{1.39}
\end{equation*}
$$

Use this and (1.38) to give new proofs of (1.16), (1.18), and (1.28). (This, the method of moment generating functions, will be investigated systematically in Section 9.)
1.7. ↑ By an argument similar to that leading to (1.39) show that the Rademacner functions satisfy

$$
\begin{aligned}
\int_{0}^{1} \exp \left[i \sum_{k=1}^{n} a_{k} r_{k}(\omega)\right] d \omega & =\prod_{k=1}^{n} \frac{e^{i a_{k}}+e^{-i a_{k}}}{2} \\
& =\prod_{k=1}^{n} \cos a_{k}
\end{aligned}
$$

Take $a_{k}=t 2^{-k}$, and from $\sum_{k=1}^{\infty} r_{k}(\omega) 2^{-k}=2 \omega-1$ deduce

$$
\begin{equation*}
\frac{\sin t}{t}=\prod_{k=1}^{\infty} \cos \frac{t}{2^{k}} \tag{1.40}
\end{equation*}
$$

by letting $n \rightarrow \infty$ inside the integral above. Derive Vieta's formula

$$
\frac{2}{\pi}=\frac{\sqrt{2}}{2} \frac{\sqrt{2+\sqrt{2}}}{2} \frac{\sqrt{2+\sqrt{2+\sqrt{2}}}}{2} \cdots
$$

1.8. A number $\omega$ is normal in the base 2 if and only if for each positive $\epsilon$ there exists an $n_{0}(\epsilon, \omega)$ such that $\left|n^{-1} \sum_{i=1}^{n} d_{i}(\omega)-\frac{1}{2}\right|<\epsilon$ for all $n$ exceeding $n_{0}(\epsilon, \omega)$.

Theorem 1.2 concerns the entire dyadic expansion, whereas Theorem 1.1 concerns only the beginning segment. Point up the difference by showing that for $\epsilon<\frac{1}{2}$ the $n_{0}(\epsilon, \omega)$ above cannot be the same for all $\omega$ in $N$-in other words, $n^{-1} \sum_{i=1}^{n} d_{i}(\omega)$ converges to $\frac{1}{2}$ for all $\omega$ in $N$, but not uniformly. But see Problem 13.9.
1.9. $1.3 \uparrow$ (a) Using the finite form of Theorem 1.3(ii), together with Problem 1.3(b), show that a trifling set is nowhere dense [A15].
(b) Put $B=\cup_{n}\left(r_{n}-2^{-n-2}, r_{n}+2^{-n-2}\right]$, where $r_{1}, r_{2}, \ldots$ is an enumeration of the rationals in $(0,1]$. Show that $(0,1]-B$ is nowhere dense but not trifling or even negligible.
(c) Show that a compact negligible set is trifling
1.10. ↑ A set of the first category [A15] can be represented as a countable union of nowhere dense sets; this is a topological notion of smallness, just as negligibility is a metric notion of smallness. Neither condition implies the other;
(a) Show that the nonnegligible set $N$ ef normal numbers is of the first category by proving that $A_{m}=\bigcap_{n=m}^{\infty}\left[\omega^{\cdot}\left|n^{-1} s_{n}(\omega)\right|<\frac{1}{2}\right]$ is nowhere dense and $N \subset \bigcup_{m} A_{m}$.
(b) According to a famous theorem of Baire, a nonempty interval is not of the first category. Use this fact to prove that the negligible set $N^{c}=(0,1]-N$ is not of the first category.
1.11. Prove:
(a) If $x$ is rational, (1.33) has only finitely many irreducible solutions
(b) Suppose that $\varphi(q) \geq 1$ and (1.35) holds for infinitely many pairs $p, q$ but only for finitely many relatively prime ones. Then $x$ is rational.
(c) If $\varphi$ goes to infinity too rapidly, then $A_{\varphi}$ is negligible (Theorem 1.6). But however rapidly $\varphi$ goes to infinity, $A_{\varphi}$ is nonempty, even uncountable. Hint. Consider $x=\sum_{k=1}^{\infty} 1 / 2^{\alpha(k)}$ for integral $\alpha(k)$ increasing very rapidiy to infinity.

## SECTION 2. PROBABILITY MEASURES

## Spaces

Let $\Omega$ be an arbitrary space or set of points $\omega$. In probability theory $\Omega$ consists of all the possible results or outcomes $\omega$ of an experiment or observation. For observing the number of heads in $n$ tosses of a coin the space $\Omega$ is $\{0,1, \ldots, n\}$; for describing the complete history of the $n$ tosses $\Omega$ is the space of all $2^{n} n$-long sequences of H's and T's; for an infinite sequence of tosses $\Omega$ can be taken as the unit interval as in the preceding section; for the number of $\alpha$-particles emitted by a substance during a unit interval of time or for the number of telephone calls arriving at an exchange $\Omega$ is $\{0,1,2, \ldots\}$; for the position of a particle $\Omega$ is three-dimensional Euclidean space; for describing the motion of the particle $\Omega$ is an appropriate space of functions; and so on. Most $\Omega$ 's to be considered are interesting from the point of view of geometry and analysis as well as that of probability.

Viewed probabilistically, a subset of $\Omega$ is an event and an element $\omega$ of $\Omega$ is a sample point.

## Assigning Probabilities

In setting up a space $\Omega$ as a probabilistic model, it is natural to try and assign probabilities to as many events as possible. Consider again the case $\Omega=(0,1]$ -the unit interval. It is natural to try and go beyond the definition (1.3) and assign probabilities in a systematic way to sets other than finite unions of intervals. Since the set of nonnormal numbers is negligible, for example, one feels it ought to have probability 0 . For another probabilistically interesting set that is not a finite union of intervals, consider

$$
\begin{equation*}
\bigcup_{n=1}^{\infty}\left[\omega:-a<s_{1}(\omega), \ldots, s_{n-1}(\omega)<b, s_{n}(\omega)=-a\right] \tag{2.1}
\end{equation*}
$$

where $a$ and $b$ are positive integers. This is the event that the gambler's fortune reaches $-a$ before it reaches $+b$; it represents ruin for a gambler with $a$ dollars playing against an adversary with $b$ dollars, the rule being that they play until one or the other runs out of capital.

The union in (2.1) is countable and disjoint, and for each $n$ the set in the union is itself a union of certain of the intervals (1.9). Thus (2.1) is a countably infinite disjoint union of intervals, and it is natural to take as its probability the sum of the lengths of these constituent intervals. Since the set of normal numbers is not a countable disjoint union of intervals, however, this extension of the definition of probability would still not cover all the interesting sets (events) in ( 0,1 ].

It is, in fact, not fruitful to try to predict just which sets probabilistic analysis will require and then assign probabilities to them in some ad hoc way. The successful procedure is to develop a general theory that assigns probabilities at once to the sets of a class so extensive that most of its members never actually arise in probability theory. That being so, why not ask for a theory that goes all the way and applies to every set in a space $\Omega$ ? In the case of the unit interval, should there not exist a well-defined probability that the random point $\omega$ lies in $A$, whatever the set $A$ may be? The answer turns out to be no (see p. 45), and it is necessary to work within subclasses of the class of all subsets of a space $\Omega$. The classes of the appropriate kinds-the fields and $\sigma$-fields-are defined and studied in this section. The theory developed here covers the spaces listed above, including the unit interval, and a great variety of others.

## Classes of Sets

It is necessary to single out for special treatment classes of subsets of a space $\Omega$, and to be useful, such a class must be closed under various of the
operations of set theory. Once again the unit interval provides an instructive example.

Example 2.1.* Consider the set $N$ of normal numbers in the form (1.24), where $s_{n}(\omega)$ is the sum of the first $n$ Rademacher functions. Since a point $\omega$ lies in $N$ if and only if $\lim _{n} n^{-1} s_{n}(\omega)=0, N$ can be put in the form

$$
\begin{equation*}
N=\bigcap_{k=1}^{\infty} \bigcup_{m=1}^{\infty} \bigcap_{n=m}^{\infty}\left[\omega:\left|n^{-1} s_{n}(\omega)\right|<k^{-1}\right] . \tag{22}
\end{equation*}
$$

Indeed, because of the very meaning of union and of intersection, $\omega$ lies in the set on the right here if and only if for every $k$ there exists an $m$ such that $\left|n^{-1} s_{n}(\omega)\right|<\dot{k}^{-1}$ holds for all $n \geq m$, and this is just the definition of convergence to 0 -with the usual $\epsilon$ replaced by $k^{-1}$ to avoid the formation of an uncountabie intersection. Since $s_{n}(\omega)$ is constant over each dyadic interval of rank $n$, the set $\left[\omega: n^{-1} s_{n}(\omega) \mid<k^{-1}\right]$ is a finite disjoint union of intervals. The formula (2.2) shows explicitly how $N$ is constructed in steps from these simpler sets. $\square$

A systematic treatment of the ideas in Section 1 thus requires a class of sets that contains the intervals and is closed under the formation of countable unions and intersections. Note that a singleton [A1] \{x\} is a countable intersection $\bigcap_{n}\left(x-n^{-1}, x\right]$ of intervals. If a class contains all the singletons and is closed under the formation of arbitrary unions, then of course it contains all the subsets of $\Omega$. As the theory of this section and the next does not apply to such extensive classes of sets, attention must be restricted to countable set-theoretic operations and in some cases even to finite ones.

Consider now a completely arbitrary nonempty space $\Omega$. A class $\mathscr{F}$ of subsets of $\Omega$ is called a field ${ }^{\dagger}$ if it contains $\Omega$ itself and is closed under the formation of complements and finite unions:
(i) $\Omega \in \mathscr{F}$;
(ii) $A \in \mathscr{F}$ implies $A^{c} \in \mathscr{F}$;
(iii) $A, B \in \mathscr{F}$ implies $A \cup B \in \mathscr{F}$.

Since $\Omega$ and the empty set $\varnothing$ are complementary, (i) is the same in the presence of (ii) as the assumption $\varnothing \in \mathscr{F}$. In fact, (i) simply ensures that $\mathscr{F}$ is nonempty: If $A \in \mathscr{F}$, then $A^{c} \in \mathscr{F}$ by (ii) and $\Omega=A \cup A^{c} \in \mathscr{F}$ by (iii).

By DeMorgan's law, $A \cap B=\left(A^{c} \cup B^{c}\right)^{c}$ and $A \cup B=\left(A^{c} \cap B^{c}\right)^{c}$. If $\mathscr{F}$ is closed under complementation, therefore, it is closed under the formation of finite unions if and only if it is closed under the formation of finite intersec-

[^5]tions. Thus (iii) can be replaced by the requirement
(iii') $A, B \in \mathscr{F}$ implies $A \cap B \in \mathscr{F}$.
A class $\mathscr{F}$ of subsets of $\Omega$ is a $\sigma$-field if it is a field and if it is also closed under the formation of countable unions:
(iv) $A_{1}, A_{2}, \ldots \in \mathscr{F}$ implies $A_{1} \cup A_{2} \cup \cdots \in \mathscr{F}$.

By the infinite form of DeMorgan's law, assuming (iv) is the same thing as assuming
(iv') $A_{1}, A_{2}, \ldots \in \mathscr{F}$ implies $A_{1} \cap A_{2} \cap \cdots \in \mathscr{F}$.
Note that (iv) implies (iii) because one can take $A_{1}=A$ and $A_{n}=B$ for $n \geq 2$. A field is sonnetimes called a finitely additive field to stress that it need not be a $\sigma$-field. A set in a given class $\mathscr{F}$ is said to be measurable $\mathscr{F}$ or to be an $\mathscr{F}$-set. A field or $\sigma$-field of subsets of $\Omega$ will sometimes be called a field or $\sigma$-field in $\Omega$.

Example 2.2. Section 1 began with a consideration of the sets (1.2), the finite disjoint unions of subintervals of $\Omega=(0,1]$. Augmented by the empty set, this class is a field $\mathscr{B}_{0}$ : Suppose that $A=\left(a_{1}, a_{1}^{\prime}\right] \cup \cdots \cup\left(a_{m}, a_{m}^{\prime}\right]$, where the notation is so chosen that $a_{1} \leq \cdots \leq a_{m}$. If the $\left(a_{i}, a_{i}^{\prime}\right]$ are disjoint, then $A^{\prime}$ is $\left(0, a_{1}\right] \cup\left(a_{1}^{\prime}, a_{2}\right] \cup \cdots \cup\left(a_{m-1}^{\prime}, a_{m}\right] \cup\left(a_{m}^{\prime}, 1\right]$ and so lies in $\mathscr{B}_{0}$ (some of these intervals may be empty, as $a_{i}^{\prime}$ and $a_{i+1}$ may coincide). If $B=\left(b_{1}, b_{1}^{\prime}\right] \cup \cdots \cup\left(b_{n}, b_{n}^{\prime}\right]$, the $\left(b_{j}, b_{j}^{\prime}\right]$ again disjoint, then $A \cap B= \bigcup_{i=1}^{m} \bigcup_{j=1}^{n}\left\{\left(a_{i}, a_{i}^{\prime}\right] \cap\left(b_{j}, b_{j}^{\prime}\right]\right\}$; each intersection here is again an interval or else the empty set, and the union is disjoint, and hence $A \cap B$ is in $\mathscr{B}_{0}$. Thus $\mathscr{B}_{0}$ satisfies (i), (ii), and (iii').

Although $\mathscr{B}_{0}$ is a field, it is not a $\sigma$-field: It does not contain the singletons $\{x\}$, even though each is a countable intersection $\cap_{n}\left(x-n^{-1}, x\right]$ of $\mathscr{B}_{0}$-sets. And $\mathscr{B}_{0}$ does not contain the set (2.1), a countable union of intervals that cannot be represented as a finite union of intervals. The set (2.2) of normal numbers is also outside $\mathscr{B}_{0}$.

The definitions above involve distinctions perhaps most easily made clear by a pair of artificial examples.

Example 2.3. Let $\mathscr{F}$ consist of the finite and the cofinite sets ( $A$ being cofinite if $A^{c}$ is finite). Then $\mathscr{F}$ is a field. If $\Omega$ is finite, then $\mathscr{F}$ contains all the subsets of $\Omega$ and hence is a $\sigma$-field as well. If $\Omega$ is infinite, however, then $\mathscr{F}$ is not a $\sigma$-field. Indeed, choose in $\Omega$ a set $A$ that is countably infinite and has infinite complement. (For example, choose a sequence $\omega_{1}, \omega_{2}, \ldots$ of distinct points in $\Omega$ and take $A=\left\{\omega_{2}, \omega_{4}, \ldots\right\}$.) Then $A \notin \mathscr{F}$, even though
$A$ is the union, necessarily countable, of the singletons it contains and each singleton is in $\mathscr{F}$. This shows that the definition of $\sigma$-field is indeed more restrictive than that of field. $\square$

Example 2.4. Let $\mathscr{F}$ consist of the countable and the cocountable sets ( $A$ being cocountable if $A^{c}$ is countable). Then $\mathscr{F}$ is a $\sigma$-field. If $\Omega$ is uncountable, then it contains a set $A$ such that $A$ and $A^{c}$ are both uncountable. ${ }^{\dagger}$ Such a set is not in $\mathscr{F}$, which shows that even a $\sigma$-field may not contain all the subsets of $\Omega$; furthermore, this set is the union (uncountable) of the singletons it contains and each singleton is in $\mathscr{F}$, which shows that a $\sigma$-field may not be closed under the formation of arbitrary unions. $\square$

The largest $\sigma$-fieid in $\Omega$ is the power class $2^{\Omega}$, consisting of all the subsets of $\Omega$; the smallest $\sigma$-field consists only of the empty set and $\Omega$ itself.

The elementary facts about fields and $\sigma$-fields are easy to prove: If $\mathscr{F}$ is a field, then $A, B \in \mathscr{F}$ implies $A-B=A \cap B^{c} \in \mathscr{F}$ and $A \Delta B=(A-B) \cup (B-A) \in \mathscr{F}$. Further, it follows by induction on $n$ that $A_{1}, \ldots, A_{n} \in \mathscr{F}$ implies $A_{1} \cup \cdots \cup A_{n} \in \mathscr{F}$ and $A_{1} \cap \cdots \cap A_{n} \in \mathscr{F}$.

A field is closed under the finite set-theoretic operations, and a $\sigma$-field is closed also under the countable ones. The analysis of a probability problem usually begins with the sets of some rather small class $\mathscr{A}$, such as the class of subintervals of ( 0,1 ]. As in Example 2.1, probabilistically natural constructions involving finite and countable operations can then lead to sets outside the initial class $\mathscr{A}$. This leads one to consider a class of sets that (i) contains $\mathscr{A}$ and (ii) is a $\sigma$-field; it is natural and convenient, as it turns out, to consider a class that has these two properties and that in addition (iii) is in a certain sense as small as possible. As will be shown, this class is the intersection of all the $\sigma$-fields containing $\mathscr{A}$; it is called the $\sigma$-field generated by $\mathscr{A}$ and is denoted by $\sigma(\mathscr{A})$.

There do exist $\sigma$-fields containing $\mathscr{A}$, the class of all subsets of $\Omega$ being one. Moreover, a completely arbitrary intersection of $\sigma$-fields (however many of them there may be) is itself a $\sigma$-field: Suppose that $\mathscr{F}=\bigcap_{\theta} \mathscr{F}_{\theta}$, where $\theta$ ranges over an arbitrary index set and each $\mathscr{F}_{\theta}$ is a $\sigma$-field. Then $\Omega \in \mathscr{F}_{\theta}$ for all $\theta$, so that $\Omega \in \mathscr{F}$. And $A \in \mathscr{F}$ implies for each $\theta$ that $A \in \mathscr{F}_{\theta}$ and hence $A^{c} \in \mathscr{F}_{\theta}$, so that $A^{c} \in \mathscr{F}$. If $A_{n} \in \mathscr{F}$ for each $n$, then $A_{n} \in \mathscr{F}_{\theta}$ for each $n$ and $\theta$, so that $\cup_{n} A_{n}$ lies in each $\mathscr{F}_{\theta}$ and hence in $\mathscr{F}$.

Thus the intersection in the definition of $\sigma(\mathscr{A})$ is indeed a $\sigma$-field containing $\mathscr{A}$. It is as small as possible, in the sense that it is contained in every $\sigma$-field that contains $\mathscr{A}$ : if $\mathscr{A} \subset \mathscr{G}$ and $\mathscr{G}$ is a $\sigma$-field, then $\mathscr{G}$ is one of

[^6]the $\sigma$-fields in the intersection defining $\sigma(\mathscr{A})$, so that $\sigma(\mathscr{A}) \subset \mathscr{A}$. Thus $\sigma(\mathscr{A})$ has these three properties:
(i) $\mathscr{A} \subset \sigma(\mathscr{A})$;
(ii) $\sigma(\mathscr{A})$ is a $\sigma$-field;
(iii) if $\mathscr{A} \subset \mathscr{G}$ and $\mathscr{A}$ is a $\sigma$-field, then $\sigma(\mathscr{A}) \subset \mathscr{G}$.

The importance of $\sigma$-fields will gradually become clear.
Example 2.5. If $\mathscr{F}$ is a $\sigma$-field, then obviously $\sigma(\mathscr{F})=\mathscr{F}$. If $\mathscr{A}$ consists of the singletons, then $\sigma(\mathscr{A})$ is the $\sigma$-field in Example 2.4. If $\mathscr{A}$ is empty or $\mathscr{A}=\{\varnothing\}$ or $\mathscr{A}=\{\Omega\}$, then $\sigma(\mathscr{A})=\{\varnothing, \Omega\}$. If $\mathscr{A} \subset \mathscr{A}^{\prime}$, then $\sigma(\mathscr{A}) \subset \sigma\left(\mathscr{A}^{\prime}\right)$. If $\mathscr{A} \subset \mathscr{A}^{\prime} \subset \sigma(\mathscr{A})$, then $\sigma(\mathscr{A})=\sigma\left(\mathscr{A}^{\prime}\right)$.

Example 2.6. Let $\mathscr{I}$ be the class of subintervals of $\Omega=(0,1]$, and define $\mathscr{B}=\sigma(\mathscr{I})$. The elements of $\mathscr{B}$ are called the Borel sets of the unit interval. The field $\mathscr{B}_{0}$ of Example 2.2 satisfies $\mathscr{I} \subset \mathscr{B}_{0} \subset \mathscr{B}$, and hence $\sigma\left(\mathscr{B}_{0}\right)=\mathscr{B}$.

Since $\mathscr{B}$ contains the intervals and is a $\sigma$-field, repeated finite and countable set-theoretic operations starting from intervals will never lead outside $\mathscr{B}$. Thus $\mathscr{B}$ contains the set (2.2) of normal numbers. It also contains for example the open sets in $(0,1]$ : If $G$ is open and $x \in G$, then there exist rationals $a_{x}$ and $b_{x}$ such that $x \in\left(a_{x}, b_{x}\right] \subset G$. But then $G=\bigcup_{x \in G}\left(a_{x}, b_{x}\right]$; since there are only countably many intervals with rational endpoints, $G$ is a countable union of elements of $\mathscr{I}$ and hence lies in $\mathscr{B}$.

In fact, $\mathscr{B}$ contains all the subsets of $(0,1]$ actually encountered in ordinary analysis and probability. It is large enough for all "practical" purposes. It does not contain every subset of the unit interval, however; see the end of Section 3 (p. 45). The class $\mathscr{B}$ will play a fundamental role in all that follows.

## Probability Measures

A set function is a real-valued function defined on some class of subsets of $\Omega$. A set function $P$ on a field $\mathscr{F}$ is a probability measure if it satisfies these conditions:
(i) $0 \leq P(A) \leq 1$ for $A \in \mathscr{F}$;
(ii) $P(\varnothing)=0, P(\Omega)=1$;
(iii) if $A_{1}, A_{2}, \ldots$ is a disjoint sequence of $\mathscr{F}$-sets and if $\bigcup_{k=1}^{\infty} A_{k} \in \mathscr{F}$, then ${ }^{\dagger}$

$$
\begin{equation*}
P\left(\bigcup_{k=1}^{\infty} A_{k}\right)=\sum_{k=1}^{\infty} P\left(A_{k}\right) . \tag{2.3}
\end{equation*}
$$

[^7]The condition imposed on the set function $P$ by (iii) is called countable additivity. Note that, since $\mathscr{F}$ is a field but perhaps not a $\sigma$-field, it is necessary in (iii) to assume that $\cup_{k=1}^{\infty} A_{k}$ lies in $\mathscr{F}$. If $A_{1}, \ldots, A_{n}$ are disjoint $\mathscr{F}$-sets, then $\cup_{k=1}^{n} A_{k}$ is also in $\mathscr{F}$ and (2.3) with $A_{n+1}=A_{n+2}=\cdots=\varnothing$ gives

$$
\begin{equation*}
P\left(\bigcup_{k=1}^{n} A_{k}\right)=\sum_{k=1}^{n} P\left(A_{k}\right) . \tag{2.4}
\end{equation*}
$$

The condition that (2.4) holds for disjoint $\mathscr{F}$-sets is finite additivity; it is a consequence of countable additivity. It follows by induction on $n$ that $P$ is finitely additive if (2.4) holds for $n=2$-if $P(A \cup B)=P(A)+P(B)$ for disjoint $\mathscr{F}$-sets $A$ and $B$.

The conditions above are redundant, because (i) can be replaced by $P(A) \geq 0$ and (ii) by $P(\Omega)=1$. Indeed, the weakened forms (together with (iii)) imply that $P(\Omega)=P(\Omega)+P(\varnothing)+P(\varnothing)+\cdots$, so that $P(\varnothing)=0$, and $1=P(\Omega)=P(A)+P\left(A^{c}\right)$, so that $P(A) \leq 1$.

Example 2.7. Consider as in Example 2.2 the field $\mathscr{B}_{0}$ of finite disjoint unions of subintervals of $\Omega=(0,1]$. The definition (1.3) assigns to each $\mathscr{B}_{0}$-set a number-the sum of the lengths of the constituent intervals-and hence specifies a set function $P$ on $\mathscr{B}_{0}$. Extended inductively, (1.4) says that $P$ is finitely additive. In Section 1 this property was deduced from the additivity of the Riemann integral (see (1.5)). In Theorem 2.2 below, the finite additivity of $P$ will be proved from first principles, and it will be shown that $P$ is, in fact, countably additive-is a probability measure on the field $\mathscr{B}_{0}$. The hard part of the argument is in the proof of Theorem 1.3, already done; the rest will be easy. $\square$

If $\mathscr{F}$ is a $\sigma$-field in $\Omega$ and $P$ is a probability measure on $\mathscr{F}$, the triple $(\Omega, \mathscr{F}, P)$ is called a probability measure space, or simply a probability space. A support of $P$ is any $\mathscr{F}$-set $A$ for which $P(A)=1$.

Example 2.8. Let $\mathscr{F}$ be the $\sigma$-field of all subsets of a countable space $\Omega$, and let $p(\omega)$ be a nonnegative function on $\Omega$. Suppose that $\Sigma_{\omega \in \Omega} p(\omega)=1$, and define $P(A)=\sum_{\omega \in A} p(\omega)$; since $p(\omega) \geq 0$, the order of summation is irrelevant by Dirichlet's theorem [A26]. Suppose that $A=\cup_{i=1}^{\infty} A_{i}$, where the $A_{i}$ are disjoint, and let $\omega_{i 1}, \omega_{i 2}, \ldots$ be the points in $A_{i}$. By the theorem on nonnegative double series [A27], $P(A)=\sum_{i j} p\left(\omega_{i j}\right)=\sum_{i} \sum_{j} p\left(\omega_{i j}\right)= \sum_{i} P\left(A_{i}\right)$, and so $P$ is countably additive. This ( $\Omega, \mathscr{F}, P$ ) is a discrete probability space. It is the formal basis for discrete probability theory. $\square$

Example 2.9. Now consider a probability measure $P$ on an arbitrary $\sigma$-field $\mathscr{F}$ in an arbitrary space $\Omega ; P$ is a discrete probability measure if there exist finitely or countably many points $\omega_{k}$ and masses $m_{k}$ such that $P(A)= \sum_{\omega_{t} \in A} m_{k}$ for $A$ in $\mathscr{F}$. Here $P$ is discrete, but the space itself may not be. In
terms of indicator functions, the defining condition is $P(A)=\sum_{k} m_{k} I_{A}\left(\omega_{k}\right)$ for $A \in \mathscr{F}$. If the set $\left\{\omega_{1}, \omega_{2}, \ldots\right\}$ lies in $\mathscr{F}$, then it is a support of $P$.

If there is just one of these points, say $\omega_{0}$, with mass $m_{0}=1$, then $P$ is a unit mass at $\omega_{0}$. In this case $P(A)=I_{A}\left(\omega_{0}\right)$ for $A \in \mathscr{F}$.

Suppose that $P$ is a probability measure on a field $\mathscr{F}$, and that $A, B \in \mathscr{F}$ and $A \subset B$. Since $P(A)+P(B-A)=P(B), P$ is monotone:

$$
\begin{equation*}
P(A) \leq P(B) \quad \text { if } A \subset B . \tag{2.5}
\end{equation*}
$$

It follows further that $P(B-A)=P(B)-P(A)$, and as a special case,

$$
\begin{equation*}
P\left(A^{c}\right)=1-P(A) . \tag{2.6}
\end{equation*}
$$

Other formulas familiar from the discrete theory are easily proved. For example,

$$
\begin{equation*}
P(A)+P(B)=P(A \cup B)+P(A \cap B), \tag{2.7}
\end{equation*}
$$

the common value of the two sides being $P\left(A \cup B^{c}\right)+2 P(A \cap B)+P\left(A^{c} \cap\right. B)$. Subtraction gives

$$
\begin{equation*}
P(A \cup B)=P(A)+P(B)-P(A \cap B) . \tag{2.8}
\end{equation*}
$$

This is the case $n=2$ of the general inclusion-exclusion formula:

$$
\begin{align*}
& P\left(\bigcup_{k=1}^{n} A_{k}\right)=\sum_{i} P\left(A_{i}\right)-\sum_{i<j} P\left(A_{i} \cap A_{j}\right)  \tag{2.9}\\
& \quad+\sum_{i<j<k} P\left(A_{i} \cap A_{j} \cap A_{k}\right)+\cdots+(-1)^{n+1} P\left(A_{1} \cap \cdots \cap A_{n}\right)
\end{align*}
$$

To deduce this inductively from (2.8), note that (2.8) gives

$$
P\left(\bigcup_{k=1}^{n+1} A_{k}\right)=P\left(\bigcup_{k=1}^{n} A_{k}\right)+P\left(A_{n+1}\right)-P\left(\bigcup_{k=1}^{n}\left(A_{k} \cap A_{n+1}\right)\right) .
$$

Applying (2.9) to the first and third terms on the right gives (2.9) with $n+1$ in place of $n$.

If $B_{1}=A_{1}$ and $B_{k}=A_{k} \cap A_{1}^{c} \cap \cdots \cap A_{k-1}^{c}$, then the $B_{k}$ are disjoint and $\bigcup_{k=1}^{n} A_{k}=\bigcup_{k=1}^{n} B_{k}$, so that $P\left(\bigcup_{k=1}^{n} A_{k}\right)=\sum_{k=1}^{n} P\left(B_{k}\right)$. Since $P\left(B_{k}\right) \leq P\left(A_{k}\right)$ by monotonicity, this establishes the finite subadditivity of $P$ :

$$
\begin{equation*}
P\left(\bigcup_{k=1}^{n} A_{k}\right) \leq \sum_{k=1}^{n} P\left(A_{k}\right) . \tag{2.10}
\end{equation*}
$$

Here, of course, the $A_{k}$ need not be disjoint. Sometimes (2.10) is called Boole's inequality.

In these formulas all the sets are naturally assumed to lie in the field $\mathscr{F}$. The derivations above involve only the finite additivity of $P$. Countable additivity gives further properties:

Theorem 2.1. Let $P$ be a probability measure on a field $\mathscr{F}$.
(i) Continuity from below: If $A_{n}$ and $A$ lie in $\mathscr{F}$ and ${ }^{\dagger} A_{n} \uparrow A$, then $P\left(A_{n}\right) \uparrow P(A)$.
(ii) Continuity from above: If $A_{n}$ and $A$ lie in $\mathscr{F}$ and $A_{n} \downarrow A$, then $P\left(A_{n}\right) \downarrow P(A)$.
(iii) Countable subadditivity: If $A_{1}, A_{2}, \ldots$ and $\cup_{k=1}^{\infty} A_{k}$ lie in $\mathscr{F}$ ( the $A_{k}$ need not be disjoint), then

$$
\begin{equation*}
P\left(\bigcup_{k=1}^{\infty} A_{k}\right) \leq \sum_{k=1}^{\infty} P\left(A_{k}\right) . \tag{2.11}
\end{equation*}
$$

Proof. For (i), put $B_{1}=A_{1}$ and $B_{k}=A_{k}-A_{k-1}$. Then the $B_{k}$ are disjoint, $A=\cup_{k=1}^{\infty} B_{k}$, and $A_{n}=\cup_{k=1}^{n} B_{k}$, so that by countable and finite additivity, $P(A)=\sum_{k=1}^{\infty} P\left(B_{k}\right)=\lim _{n} \sum_{k=1}^{n} P\left(B_{k}\right)=\lim _{n} P\left(A_{n}\right)$. For (ii), observe that $A_{n} \downarrow A$ implies $A_{n}^{c} \uparrow A^{c}$, so that $1-P\left(A_{n}\right) \uparrow 1-P(A)$.

As for (iii), increase the right side of (2.10) to $\sum_{k=1}^{\infty} P\left(A_{k}\right)$ and then apply part (i) to the left side. $\square$

Example 2.10. In the presence of finite additivity, a special case of (ii) implies countable additivity. If $P$ is a finitely additive probability measure on the field $\mathscr{F}$, and if $A_{n} \downarrow \varnothing$ for sets $A_{n}$ in $\mathscr{F}$ implies $P\left(A_{n}\right) \downarrow 0$, then $P$ is countably additive. Indeed, if $B=\cup_{k} B_{k}$ for disjoint sets $B_{k}$ ( $B$ and the $B_{k}$ in $\mathscr{F}$ ), then $C_{n}=\cup_{k>n} B_{k}=B-\cup_{k \leq n} B_{k}$ lies in the field $\mathscr{F}$, and $C_{n} \downarrow \varnothing$. The hypothesis, together with finite additivity, gives $P(B)-\sum_{k=1}^{n} P\left(B_{k}\right)= P\left(C_{n}\right) \rightarrow 0$, and hence $P(B)=\sum_{k=1}^{\infty} P\left(B_{k}\right)$. $\square$

## Lebesgue Measure on the Unit Interval

The definition (1.3) specifies a set function on the field $\mathscr{B}_{0}$ of finite disjoint unions of intervals in $(0,1]$; the problem is to prove $P$ countably additive. It will be convenient to change notation from $P$ to $\lambda$, and to denote by $\mathscr{I}$ the class of subintervals $(a, b]$ of $(0,1]$; then $\lambda(I)=|I|=b-a$ is ordinary length. Regard $\varnothing$ as an element of $\mathscr{I}$ of length 0 . If $A=\cup_{i=1}^{n} I_{i}$, the $I_{i}$ being

[^8]disjoint $\mathscr{I}_{\text {-sets, the definition (1.3) in the new notation is }}$
$$
\begin{equation*}
\lambda(A)=\sum_{i=1}^{n} \lambda\left(I_{i}\right)=\sum_{i=1}^{n}\left|I_{i}\right| . \tag{2.12}
\end{equation*}
$$

As pointed out in Section 1, there is a question of uniqueness here, because $A$ will have other representations as a finite disjoint union $\bigcup_{j=1}^{m} J_{j}$ of $\mathscr{I}$-sets. But $\mathscr{I}$ is closed under the formation of finite intersections, and so the finite form of Theorem 1.3(iii) gives

$$
\begin{equation*}
\sum_{i=1}^{n}\left|I_{i}\right|=\sum_{i=1}^{n} \sum_{j=1}^{m}\left|I_{i} \cap J_{j}\right|=\sum_{j=1}^{m}\left|J_{j}\right| . \tag{2.13}
\end{equation*}
$$

(Some of the $I_{i} \cap J_{j}$ may be empty, but the corresponding lengths are then 0 .) The definition is indeed consistent.

Thus (2.12) defines a set function $\lambda$ on $\mathscr{B}_{0}$, a set function called Lebesgue measure.

Theorem 2.2. Lebesgue measure $\lambda$ is a (countably additive) probability measure on the field $\mathscr{B}_{0}$.

Proof. Suppose that $A=\cup_{k=1}^{\infty} A_{k}$, where $A$ and the $A_{k}$ are $\mathscr{B}_{0}$-sets and the $A_{k}$ are disjoint. Then $A=\bigcup_{1=1}^{n} I_{i}$ and $A_{k}=\bigcup_{j=1}^{n_{k}} J_{k j}$ are disjoint unions of $\mathscr{I}$-sets, and (2.12) and Theorem 1.3(iii) give

$$
\begin{align*}
\lambda(A) & =\sum_{i=1}^{n}\left|I_{i}\right|=\sum_{i=1}^{n} \sum_{k=1}^{\infty} \sum_{j=1}^{m_{k}}\left|I_{i} \cap J_{k j}\right|  \tag{2.14}\\
& =\sum_{k=1}^{\infty} \sum_{j=1}^{m_{k}}\left|J_{k j}\right|=\sum_{k=1}^{\infty} \lambda\left(A_{k}\right)
\end{align*}
$$ $\square$

In Section 3 it is shown how to extend $\lambda$ from $\mathscr{B}_{0}$ to the larger class $\mathscr{B}=\sigma\left(\mathscr{B}_{0}\right)$ of Borel sets in ( 0,1 ]. This will complete the construction of $\lambda$ as a probability measure (countably additive, that is) on $\mathscr{B}$. and the construction is fundamental to all that follows. For example, the set $N$ of normal numbers lies in $\mathscr{B}$ (Example 2.6), and it will turn out that $\lambda(N)=1$, as probabilistic intuition requires. (In Chapter 2, $\lambda$ will be defined for sets outside the unit interval as well.)

It is well to pause here and consider just what is involved in the construction of Lebesgue measure on the Borel sets of the unit interval. That length defines a finitely additive set function on the class $\mathscr{I}$ of intervals in ( 0,1 ] is a consequence of Theorem 1.3 for the case of only finitely many intervals and thus involves only the most elementary properties of the real number system. But proving countable additivity on $\mathscr{I}$ requires the deeper property of
compactness (the Heine-Borel theorem). Once $\lambda$ has been proved countably additive on $\mathscr{I}$, extending it to $\mathscr{B}_{0}$ by the definition (2.12) presents no real difficulty: the arguments involving (2.13) and (2.14) are easy. Difficulties again arise, however, in the further extension of $\lambda$ from $\mathscr{B}_{0}$ to $\mathscr{B}=\sigma\left(\mathscr{B}_{0}\right)$, and here new ideas are again required. These ideas are the subject of Section 3, where it is shown that any probability measure on any field can be extended to the generated $\sigma$-field.

## Sequence Space*

Let $S$ be a finite set of points regarded as the possible outcomes of a simple observation or experiment. For tossing a coin, $S$ can be $\{\mathrm{H}, \mathrm{T}\}$ or $\{0,1\}$; for rolling a die, $S=\{1, \ldots, 6\}$; in information theory, $S$ plays the role of a finite alphabet. Let $\Omega=S^{\infty}$ be the space of all infinite sequences

$$
\begin{equation*}
\omega=\left(z_{1}(\omega), z_{2}(\omega), \ldots\right) \tag{2.15}
\end{equation*}
$$

of elements of $S: z_{k}(\omega) \in S$ for all $\omega \in S^{\infty}$ and $k \geq 1$. The sequence (2.15) can be viewed as the result of repeating infinitely often the simple experiment represented by $S$. For $S=\{0,1\}$, the space $S^{\infty}$ is closely related to the unit interval; compare (1.8) and (2.15).

The space $S^{\infty}$ is an infinite-dimensional Cartesian product. Each $z_{k}(\cdot)$ is a mapping of $S^{\infty}$ onto $S$; these are the coordinate functions, or the natural projections. Let $S^{n}=S \times \cdots \times S$ be the Cartesian product of $n$ copies of $S$; it consists of the $n$-long sequences ( $u_{1}, \ldots, u_{n}$ ) of elements of $S$. For such a sequence, the set

$$
\begin{equation*}
\left[\omega:\left(z_{1}(\omega), \ldots, z_{n}(\omega)\right)=\left(u_{1}, \ldots, u_{n}\right)\right] \tag{2.16}
\end{equation*}
$$

represents the event that the first $n$ repetitions of the experiment give the outcomes $u_{1}, \ldots, u_{n}$ in sequence. A cylinder of rank $n$ is a set of the form

$$
\begin{equation*}
A=\left[\omega:\left(z_{1}(\omega), \ldots, z_{n}(\omega)\right) \in H\right], \tag{2.17}
\end{equation*}
$$

where $H \subset S^{n}$. Note that $A$ is nonempty if $H$ is. If $H$ is a singleton in $S^{n}$, (2.17) reduces to (2.16), which can be called a thin cylinder.

Let $\mathscr{C}_{0}$ be the class of cylinders of all ranks. Then $\mathscr{C}_{0}$ is a field: $S^{\infty}$ and the empty set have the form (2.17) for $H=S^{n}$ and for $H=\varnothing$. If $H$ is replaced by $S^{n}-H$, then (2.17) goes into its complement, and hence $b_{0}$ is

[^9]closed under complementation As for unions, consider (2.17) together with
$$
\begin{equation*}
B=\left[\omega:\left(z_{1}(\omega), \ldots, z_{m}(\omega)\right) \in I\right] \tag{2.18}
\end{equation*}
$$
a cylinder of rank $m$. Suppose that $n \leq m$ (symmetry); if $H^{\prime}$ consists of the sequences ( $u_{1}, \ldots, u_{m}$ ) in $S^{\prime \prime}$ for which the truncated sequence ( $u_{1}, \ldots, u_{n}$ ) lies in $H$, then (2.17) has the alternative form
$$
\begin{equation*}
A=\left[\omega:\left(z_{1}(\omega), \ldots, z_{m}(\omega)\right) \in H^{\prime}\right] . \tag{2.19}
\end{equation*}
$$

Since it is now clear that

$$
\begin{equation*}
A \cup B=\left[\omega:\left(z_{i}(\omega), \ldots, z_{m}(\omega)\right) \in H^{\prime} \cup I\right] \tag{2.20}
\end{equation*}
$$

is also a cylinder, $\mathscr{C}_{0}$ is closed under the formation of finite unions and hence is indeed a field.

Let $p_{u}, u \in S$, be probabilities on $S$-nonnegative and summing to 1 . Define a set function $P$ on $\mathscr{C}_{0}$ (it will turn out to be a probability measure) in this way: For a cylinder $A$ given by (2.17), take

$$
\begin{equation*}
P(A)=\sum_{H} p_{u_{1}} \cdots p_{u_{n}}, \tag{2.21}
\end{equation*}
$$

the sum extending over all the sequences ( $u_{1}, \ldots, u_{n}$ ) in $H$. As a special case,

$$
\begin{equation*}
P\left[\omega:\left(z_{1}(\omega), \ldots, z_{n}(\omega)\right)=\left(u_{1}, \ldots, u_{n}\right)\right]=p_{u_{1}} \cdots p_{u_{n}} . \tag{2.22}
\end{equation*}
$$

Because of the products on the right in (2.21) and (2.22), $P$ is called product measure; it provides a model for an infinite sequence of independent repetitions of the simple experiment represented by the probabilities $p_{u}$ on $S$. In the case where $S=\{0,1\}$ and $p_{0}=p_{1}=\frac{1}{2}$, it is a model for independent tosses of a fair coin, an alternative to the model used in Section 1.

The definition (2.21) presents a consistency problem, since the cylinder $A$ will have other representations. Suppose that $A$ is also given by (2.19). If $n=m$, then $H$ and $H^{\prime}$ must coincide, and there is nothing to prove. Suppose then (symmetry) that $n<m$. Then $H^{\prime}$ must consist of those ( $u_{1}, \ldots, u_{m}$ ) in $S^{m}$ for which ( $u_{1}, \ldots, u_{n}$ ) lies in $H: H^{\prime}=H \times S^{m-n}$. But then

$$
\begin{align*}
\sum_{H^{\prime}} p_{u_{1}} \cdots p_{u_{n}} p_{u_{n+1}} \cdots p_{u_{n}} & =\sum_{H} p_{u_{1}} \cdots p_{u_{n}} \sum_{S^{m-n}} p_{u_{n+1}} \cdots p_{u_{m}}  \tag{2.23}\\
& =\sum_{H} p_{u_{1}} \cdots p_{u_{n}} .
\end{align*}
$$

The definition (2.21) is therefore consistent. And finite additivity is now easy: Suppose that $A$ and $B$ are disjoint cylinders given by (2.17) and (2.18).

Suppose that $n \leq m$, and put $A$ in the form (2.19). Since $A$ and $B$ are disjoint, $H^{\prime}$ and $I$ must be disjoint as well, and by (2.20),

$$
\begin{equation*}
P(A \cup B)=\sum_{H^{\prime} \cup l} p_{u_{l}} \cdots p_{u_{m}}=P(A)+P(B) . \tag{2.24}
\end{equation*}
$$

Taking $H=S^{n}$ in (2.21) shows that $P\left(S^{\infty}\right)=1$. Therefore, (2.21) defines a finitely additive probability measure on the field $\mathscr{b}_{0}$.

Now, $P$ is countably additive on $\mathscr{C}_{0}$, but this requires no further argument, because of the following completely general result.

Theorem 2.3. Every finitely additive probability measure on the field $\mathscr{C}_{0}$ of cylinders in $S^{\infty}$ is in fact countably additive.

The proof depends on this fundamental fact:
Lemma. If $A_{n} \downarrow A$, where the $A_{n}$ are nonempty cylinders, then $A$ is nonempty.

Proof of Theorem 2.3. Assume that the lemma is true, and apply Example 2.10 to the measure $P$ in question: If $A_{n} \downarrow \varnothing$ for sets in $\mathscr{C}_{0}$ (cylinders) but $P\left(A_{n}\right)$ does not converge to 0 , then $P\left(A_{n}\right) \geq \epsilon>0$ for some $\epsilon$. But then the $A_{n}$ are nonempty, which by the lemma makes $A_{n} \downarrow \varnothing$ impossible. $\square$

Proof of the Lemma. ${ }^{\dagger}$ Suppose that $A_{t}$ is a cylinder of rank $m_{t}$, say

$$
\begin{equation*}
A_{t}=\left[\omega:\left(z_{1}(\omega), \ldots, z_{m_{t}}(\omega)\right) \in H_{t}\right] \tag{2.25}
\end{equation*}
$$

where $H_{t} \subset S^{m_{1}}$. Choose a point $\omega_{n}$ in $A_{n}$, which is nonempty by assumption. Write the components of the sequences in a square array:

$$
\begin{array}{cccc}
z_{1}\left(\omega_{1}\right) & z_{1}\left(\omega_{2}\right) & z_{1}\left(\omega_{3}\right) & \ldots  \tag{2.26}\\
z_{2}\left(\omega_{1}\right) & z_{2}\left(\omega_{2}\right) & z_{2}\left(\omega_{3}\right) & \ldots \\
\vdots & \vdots & \vdots
\end{array}
$$

The $n$th column of the array gives the components of $\omega_{n}$.
Now argue by a modification of the diagonal method [A14]. Since $S$ is finite, some element $u_{1}$ of $S$ appears infinitely often in the first row of (2.26): for an increasing sequence $\left\{n_{1, k}\right\}$ of integers, $z_{1}\left(\omega_{n_{1, k}}\right)=u_{1}$ for all $k$. By the same reasoning, there exist an increasing subsequence $\left\{n_{2, k}\right\}$ of $\left\{n_{1, k}\right\}$ and an

[^10]element $u_{2}$ of $S$ such that $z_{2}\left(\omega_{n_{2, k}}\right)=u_{2}$ for all $k$. Continue. If $n_{k}=n_{k, k}$, then $z_{r}\left(\omega_{n_{k}}\right)=u_{r}$ for $k \geq r$, and hence $\left(z_{1}\left(\omega_{n_{k}}\right), \ldots, z_{r}\left(\omega_{n_{k}}\right)\right)=\left(u_{1}, \ldots, u_{r}\right)$ for $k \geq r$.

Let $\omega^{\circ}$ be the element of $S^{\infty}$ with components $u_{r}: \omega^{\circ}=\left(u_{1}, u_{2}, \ldots\right)=$ ( $z_{1}\left(\omega^{\circ}\right), z_{2}\left(\omega^{\circ}\right), \ldots$ ). Let $t$ be arbitrary. If $k \geq t$, then ( $n_{k}$ is increasing) $n_{k} \geq t$ and hence $\omega_{n_{k}} \in A_{n_{k}} \subset A_{t}$. It follows by (2.25) that, for $k \geq t, H_{t}$ contains the point $\left(z_{1}\left(\omega_{n_{k}}\right), \ldots, z_{m_{l}}\left(\omega_{n_{k}}\right)\right)$ of $S^{m_{l}}$. But for $k \geq m_{t}$, this point is identical with $\left(z_{1}\left(\omega^{\circ}\right), \ldots, z_{m_{l}}\left(\omega^{\circ}\right)\right)$, which therefore lies in $H_{t}$. Thus $\omega^{\circ}$ is a point common to all the $A_{t}$.

Let $\mathscr{C}$ be the $\sigma$-field in $S^{\infty}$ generated by $\mathscr{C}_{0}$. By the general theory of the next section, the probability measure $P$ defined on $\mathscr{C}_{0}$ by (2.21) extends to ${ }^{b}$ The term product measure, properly speaking, applies to the extended $P$. Thus ( $S^{\infty}, \mathscr{C}, P$ ) is a probability space, one important in ergodic theory (Section 24).

Suppose that $S=\{0,1\}$ and $p_{0}=p_{1}=\frac{1}{2}$. In this case, $\left(S^{\infty}, \mathscr{C}, P\right)$ is closely related to $((0,1], \mathscr{B}, \lambda)$, although there are essential differences. The sequence (2.15) can end in 0 's, but (1.8) cannot. Thin cylinders are like dyadic intervals, but the sets in $\mathscr{C}_{0}$ (the cylinders) correspond to the finite disjoint inions of intervals with dyadic endpoints, a field somewhat smaller than $\mathscr{B}_{0}$. While nonempty sets in $\mathscr{B}_{0}$ (for example, $\left(\frac{1}{2}, \frac{1}{2}+\right. 2^{-n}$ J) can contract to the empty set, nonempty sets in $\mathscr{C}_{0}$ cannot. The lemma above plays here the role the Heine-Borel theorem plays in the proof of Theorem 1.3. The product probability measure constructed here on $\mathscr{C}_{0}$ (in the case $S=\{0,1\}, p_{0}=p_{1} =\frac{1}{2}$, that is) is analogous to Lebesgue measure on $\mathscr{B}_{0}$ But a finitely additive probability measure on $\mathscr{B}_{0}$ can fail to be countably additive, ${ }^{\dagger}$ which cannot happen in $\mathscr{C}_{0}$.

## Constructing $\boldsymbol{\sigma}$-Fields*

The $\sigma$-field $\sigma(\mathscr{A})$ generated by $\mathscr{A}$ was defined from above or from the outside, so to speak, by intersecting all the $\sigma$-fields that contain $\mathscr{A}$ (including the $\sigma$-field consisting of all the subsets of $\Omega$ ). Can $\sigma(\mathscr{A})$ somehow be constructed from the inside by repeated finite and countable set-theoretic operations starting with sets in $\mathscr{A}$ ?

For any class $\mathscr{H}$ of sets in $\Omega$ let $\mathscr{H}^{*}$ consist of the sets in $\mathscr{H}$, the complements of sets in $\mathscr{H}$, and the finite and countable unions of sets in $\mathscr{H}^{\circ}$. Given a class $\mathscr{A}$, put $\mathscr{A}_{0}=\mathscr{A}$ and define $\mathscr{A}_{1}, \mathscr{A}_{2}, \ldots$ inductively by

$$
\begin{equation*}
\mathscr{A}_{n}=\mathscr{A}_{n-1}^{*} . \tag{2.27}
\end{equation*}
$$

That each $\mathscr{A}_{n}$ is contained in $\sigma(\mathscr{A})$ follows by induction. One might hope that $\mathscr{A}_{n}=\sigma(\mathscr{A})$ for some $n$, or at least that $\bigcup_{n=0}^{\infty} \mathscr{A}_{n}=\sigma(\mathscr{A})$. But this process applied to the class of intervals fails to account for all the Borel sets.

Let $\mathscr{I}_{0}$ consist of the empty set and the intervals in $\Omega=(0,1]$ with rational endpoints, and define $\mathscr{L}_{n}=\mathscr{G}_{n-1}^{*}$ for $n=1,2, \ldots$. It will be shown that $\bigcup_{n=0}^{\infty} \mathscr{L}_{n}$. is strictly smaller than $\mathscr{B}=\sigma\left(\mathscr{A}_{0}\right)$.

[^11]If $a_{n}$ and $b_{n}$ are rationals decreasing to $a$ and $b$, then $(a, b]=\bigcup_{m} \bigcap_{n}\left(a_{m}, b_{n}\right]= U_{m}\left(U_{n}\left(a_{m}, b_{n} \|^{c}\right)^{c} \in \mathscr{A}_{4}\right.$. The result would therefore not be changed by including in $\mathscr{I}_{0}$ all the intervals in ( 0,1 ].

To prove $\bigcup_{n=0}^{\infty} \mathscr{A}_{n}$ smaller than $\mathscr{B}$, first put

$$
\begin{equation*}
\Psi\left(A_{1}, A_{2}, \ldots\right)=A_{1}^{c} \cup A_{2} \cup A_{3} \cup A_{4} \cup \cdots . \tag{2.28}
\end{equation*}
$$

Since $\mathscr{I}_{n-1}$ contains $\Omega=(0,1]$ and the empty set, every element of $\mathscr{I}_{n}$ has the form (2.28) for some sequence $A_{1}, A_{2}, \ldots$ of sets in $\mathscr{I}_{n-1}$, Let every positive integer appear exactly once in the square array

$$
\begin{array}{ccc}
m_{11} & m_{12} & \cdots \\
m_{21} & m_{22} & \cdots \\
\vdots & \vdots &
\end{array}
$$

Inductively define

$$
\begin{align*}
& \Phi_{0}\left(A_{1}, A_{2}, \ldots\right)=A_{1},  \tag{2.29}\\
& \Phi_{n}\left(A_{1}, A_{2}, \ldots\right)=\Psi\left(\bar{\Phi}_{n-1}\left(A_{m_{11}}, A_{m_{12}}, \ldots\right), \Phi_{n-1}\left(A_{m_{21}}, A_{m_{22}}, \ldots\right), \ldots\right), \\
& n=1,2, \ldots
\end{align*}
$$

It follows by induction that every element of $\mathscr{A}_{n}$ has the form $\Phi_{n}\left(A_{1}, A_{2}, \ldots\right)$ for some sequence of sets in $\mathscr{I}_{0}$. Finally, put

$$
\begin{equation*}
\Phi\left(A_{1}, A_{2}, \ldots\right)=\Phi_{1}\left(A_{m_{11}}, A_{m_{12}}, \ldots\right) \cup \Phi_{2}\left(A_{m_{21}}, A_{m_{22}}, \ldots\right) \cup \cdots . \tag{2.30}
\end{equation*}
$$

Then every element of $\bigcup_{n=0}^{\infty} \mathscr{A}_{n}$ has the form (2.30) for some sequence $A_{1}, A_{2}, \ldots$ of sets in $\mathscr{J}_{0}$.

If $A_{1}, A_{2}, \ldots$ are in $\mathscr{B}$, then (2.28) is in $\mathscr{B}$; it follows by induction that each $\Phi_{n}\left(A_{1}, A_{2}, \ldots\right)$ is in $\mathscr{B}$ and therefore that (2.30) is in $\mathscr{B}$.

With each $\omega$ in ( 0,1 ] associate the sequence ( $\omega_{1}, \omega_{2}, \ldots$ ) of positive integers such that $\omega_{1}+\cdots+\omega_{k}$ is the position of the $k$ th 1 in the nonterminating dyadic expansion of $\omega$ (the smallest $n$ for which $\sum_{j=1}^{n} d_{j}(\omega)=k$ ). Then $\omega \leftrightarrow\left(\omega_{1}, \omega_{2}, \ldots\right)$ is a one-to-one correspondence between $(0,1]$ and the set of all sequences of positive integers. Let $I_{1}, I_{2}, \ldots$ be an enumeration of the sets in $\mathscr{I}_{0}$, put $\varphi(\omega)=\Phi\left(I_{\omega_{1}}, I_{\omega_{2}}, \ldots\right)$, and define $B=[\omega: \omega \notin \varphi(\omega)]$. It will be shown that $B$ is a Borel set but is not contained in any of the $\mathscr{I}_{n}$.

Since $\omega$ lies in $B$ if and only if $\omega$ lies outside $\varphi(\omega), B \neq \varphi(\omega)$ for every $\omega$. But every element of $\bigcup_{n=0}^{\infty} \mathscr{A}_{n}$ has the form (2.30) for some sequence in $\mathscr{I}_{0}$ and hence has the form $\varphi(\omega)$ for some $\omega$. Therefore, $B$ is not a member of $\bigcup_{n=0}^{\infty} \mathscr{A}_{n}$.

It remains to show that $B$ is a Borel set. Let $D_{k}=\left[\omega: \omega \in I_{\omega_{k}}\right]$. Since $L_{k}(n)=[\omega$ : $\left.\omega_{1}+\cdots+\omega_{k}=n\right]=\left[\omega: \sum_{j=1}^{n-1} d_{j}(\omega)<k=\sum_{j=1}^{n} d_{j}(\omega)\right]$ is a Borel set, so are $\left[\omega: \omega_{k}=\right. n]=\bigcup_{m=1}^{\infty} L_{k-1}(m) \cap L_{k}(m+n)$ and

$$
D_{k}=\left[\omega: \omega \in I_{\omega_{k}}\right]=\bigcup_{n}\left(\left[\omega: \omega_{k}=n\right] \cap I_{n}\right) .
$$

Suppose that it is shown that

$$
\begin{equation*}
\left[\omega \cdot \omega \in \Phi_{n}\left(I_{u_{u_{1}}}, I_{\omega_{u_{2}}} \ldots\right)\right]=\Phi_{n}\left(D_{u_{1}}, D_{u_{2}}, \ldots\right) \tag{2.31}
\end{equation*}
$$

for every $n$ and every sequence $u_{1}, u_{2}, \ldots$ of positive integers. It will then follow from the definition (2.30) that

$$
\begin{aligned}
B^{c} & =[\omega: \omega \in \varphi(\omega)]=\bigcup_{n=1}^{\infty}\left[\omega: \omega \in \Phi_{n}\left(I_{\omega_{m_{t 1}}}, I_{\omega_{m_{n 2}}}, \cdots\right)\right] \\
& =\bigcup_{n=1}^{\infty} \Phi_{n}\left(D_{m_{n 1}}, D_{m_{n 2}}, \ldots\right)=\Phi\left(D_{1}, D_{2}, \ldots\right)
\end{aligned}
$$

But as remarked above, (2.30), is a Borel set if the $A_{n}$ are. Therefore, (2.31) will imply that $B^{c}$ and $B$ are Borel sets.

If $n=0$, (2.31) holds because it reduces by (2.29) to $\left[\omega ; \omega \in I_{\omega_{u_{1}}}\right]=D_{u_{1}}$. Suppose that (2.31) holds with $n-1$ in place of $n$. Consider the condition

$$
\begin{equation*}
\omega \in \Phi_{n-1}\left(I_{\omega_{n_{m_{k}}}}, I_{\omega_{n_{m_{k}}}}, \cdot\right) \tag{2.32}
\end{equation*}
$$

By (2.28) and (2.29), a necessary and sufficient condition for $\omega \in \Phi_{n}\left(I_{\omega_{u_{1}}}, I_{\omega_{u_{2}}}, \ldots\right)$ is that either (2.32) is false for $k=1$ or else (2.32) is true for some $k$ exceeding 1. But by the induction hypothesis, (2.32) and its negation can be replaced by $\omega \in \Phi_{n-1}\left(D_{u_{m_{1}}}, D_{u_{w_{2}}}, \ldots\right)$ and its negation. Therefore, $\omega \in \Phi_{n}\left(I_{\omega_{n 1}}, I_{\omega_{1}, 2}, \ldots\right)$ if and only if $\omega \in \Phi_{n}\left(D_{u_{1}}, D_{u_{2}}, \ldots\right)$.

Thus $\cup_{n} \mathscr{A}_{n} \neq \mathscr{B}$, and there are Borel sets that cannot be arrived at from the intervals by any finite sequence of set-theoretic operations, each operation being finite or countable. It can even be shown that there are Borel sets that cannot be arrived at by any countable sequence of these operations. On the other hand, every Borel set can be arrived at by a countable ordered set of these operations if it is not required that they be performed in a simple sequence. The proof of this statement-and indeed even a precise explanation of its meaning-depends on the theory of infinite ordinal numbers. ${ }^{\dagger}$

## PROBLEMS

2.1. Define $x \vee y=\max \{x, y\}$, and for a collection $\left(x_{\alpha}^{\prime}\right)$ define $\vee_{\alpha} x_{\alpha}=\sup _{\alpha} x_{\alpha}$; define $x \wedge y=\min (x, y)$ and $\wedge_{\alpha} x_{\alpha}=\inf _{\alpha} x_{\alpha}$. Prove that $I_{A \cup B}=I_{A} \vee I_{B}, I_{A \cap B} =I_{A} \wedge I_{B}, I_{A^{4}}=1-I_{A}$, and $I_{A \Delta B}=\left|I_{A}-I_{B}\right|$, in the sense that there is equality at each point of $\Omega$. Show that $A \subset B$ if and only if $I_{A} \leq I_{B}$ pointwise. Check the equation $x \wedge(y \vee z)=(x \wedge y) \vee(x \wedge z)$ and deduce the distributive law
${ }^{\mathrm{t}}$ See Problem 2.22.
$A \cap(B \cup C)=(A \cap B) \cup(A \cap C)$. By similar arguments prove that

$$
\begin{aligned}
A \cup(B \cap C) & =(A \cup B) \cap(A \cup C) \\
A \Delta C & \subset(A \Delta B) \cup(B \Delta C) \\
\left(\bigcup_{n} A_{n}\right)^{c} & =\bigcap_{n} A_{n}^{c} \\
\left(\bigcap_{n} A_{n}\right)^{c} & =\bigcup_{n} A_{n}^{c}
\end{aligned}
$$

2.2. Let $A_{1}, \ldots, A_{n}$ be arbitrary events, and put $U_{k}=\cup\left(A_{i_{1}} \cap \cdots \cap A_{i_{k}}\right)$ and $I_{k}=\bigcap\left(A_{i_{1}} \cup \cdots \cup A_{i_{k}}\right)$, where the union and intersection extend over all the $k$-tuples satisfying $1 \leq i_{1}<\cdots<i_{k} \leq n$. Show that $U_{k}=I_{n-k+1}$.
2.3. (a) Suppose that $\Omega \subseteq \mathscr{F}$ and that $A, B \in \mathscr{F}$ implies $A-B=A \cap B^{c} \in \mathscr{F}$. Show that $\mathscr{F}$ is a field.
(b) Suppose that $\Omega \in \mathscr{F}$ and that $\mathscr{F}$ is closed under the formation of complements and finite disjoint unions. Show that $\mathscr{F}$ need not be a field.
2.4. Let $\mathscr{F}_{1}, \mathscr{F}_{2}, \ldots$ be classes of sets in a common space $\Omega$.
(a) Suppose that $\mathscr{F}_{n}$ are fields satisfying $\mathscr{F}_{n} \subset \mathscr{F}_{n+1}$. Show that $\bigcup_{n=1}^{\infty} \mathscr{F}_{n}$ is a field.
(b) Suppose that $\mathscr{F}_{n}$ are $\sigma$-fields satisfying $\mathscr{F}_{n} \subset \mathscr{F}_{n+1}$. Show by example that $\bigcup_{n=1}^{\infty} \mathscr{F}_{n}$ need not be a $\sigma$-field.
2.5. The field $f(\mathscr{A})$ generated by a class $\mathscr{A}$ in $\Omega$ is defined as the intersection of all fields in $\Omega$ containing $\mathscr{A}$.
(a) Show that $f(\mathscr{A})$ is indeed a field, that $\mathscr{A} \subset f(\mathscr{A})$, and that $f(\mathscr{A})$ is minimal in the sense that if $\mathscr{G}$ is a field and $\mathscr{A} \subset \mathscr{G}$, then $f(\mathscr{A}) \subset \mathscr{G}$.
(b) Show that for nonempty $\mathscr{A}, f(\mathscr{A})$ is the class of sets of the form $\bigcup_{i=1}^{m} \bigcap_{j=1}^{n_{i}} A_{i j}$, where for each $i$ and $j$ either $A_{i j} \in \mathscr{A}$ or $A_{i j}^{c} \in \mathscr{A}$, and where the $m$ sets $\cap_{j=1}^{n_{i}} A_{i j}, 1 \leq i \leq m$, are disjoint. The sets in $f(\mathscr{A})$ can thus be explicitly presented, which is not in general true of the sets in $\sigma(\mathscr{A})$.
2.6. ↑ (a) Show that if $\mathscr{A}$ consists of the singletons, then $f(\mathscr{A})$ is the field in Example 2.3.
(b) Show that $f(\mathscr{A}) \subset \sigma(\mathscr{A})$, that $f(\mathscr{A})=\sigma(\mathscr{A})$ if $\mathscr{A}$ is finite, and that $\sigma(f(\mathscr{A}))=\sigma(\mathscr{A})$.
(c) Show that if $\mathscr{A}$ is countable, then $f(\mathscr{A})$ is countable.
(d) Show for fields $\mathscr{F}_{1}$ and $\mathscr{F}_{2}$ that $f\left(\mathscr{F}_{1} \cup \mathscr{F}_{2}\right)$ consists of the finite disjoint unions of sets $A_{1} \cap A_{2}$ with $A_{i} \in \mathscr{F}_{i}$. Extend.
2.7. $2.5 \uparrow$ Let $H$ be a a set lying outside $\mathscr{F}$, where $\mathscr{F}$ is a field [or $\sigma$-field]. Show that the field [or $\sigma$-field] generated by $\mathscr{F} \cup\{H\}$ consists of sets of the form

$$
\begin{equation*}
(H \cap A) \cup\left(H^{c} \cap B\right), \quad A, B \in \mathscr{F} . \tag{2.33}
\end{equation*}
$$

2.8. Suppose for each $A$ in $\mathscr{A}$ that $A^{c}$ is a countable union of elements of $\mathscr{A}$. The class of intervals in $(0,1]$ has this property. Show that $\sigma(\mathscr{A})$ coincides with the smallest class over $\mathscr{A}$ that is closed under the formation of countable unions and intersections.
2.9. Show that, if $B \in \sigma(\mathscr{A})$, then there exists a countable subclass $\mathscr{A}_{B}$ of $\mathscr{A}$ such that $B \in \sigma\left(\mathscr{A}_{B}\right)$.
2.10. (a) Show that if $\sigma(\mathscr{A})$ contains every subset of $\Omega$, then for each pair $\omega$ and $\omega^{\prime}$ of distinct points in $\Omega$ there is in $\mathscr{A}$ an $A$ such that $I_{A}(\omega) \neq I_{A}\left(\omega^{\prime}\right)$
(b) Show that the reverse implication holds if $\Omega$ is countable.
(c) Show by example that the reverse implication need not hold for uncountable $\Omega$
2.11. A $\sigma$-field is countably generated, or separable, if it is generated by some countable class of sets.
(a) Show that the $\sigma$-field $\mathscr{B}$ of Borel sets is countably generated.
(b) Show that the $\sigma$-field of Example 2.4 is countably generated if and only if $\Omega$ is countable.
(c) Suppose that $\mathscr{F}_{1}$ and $\mathscr{F}_{2}$ are $\sigma$-fields, $\mathscr{F}_{1} \subset \mathscr{F}_{2}$, and $\mathscr{F}_{2}$ is countably generated. Show by example that $\mathscr{F}_{1}$ may not be countably generated.
2.12. Show that a $\sigma$-field cannot be countably infinite-its cardinality must be finite or else at least that of the continuum. Show by example that a field can be countably infinite.
2.13. (a) Let $\mathscr{F}$ be the field consisting of the finite and the cofinite sets in an infinite $\Omega$, and define $P$ on $\mathscr{F}$ by taking $P(A)$ to be 0 or 1 as $A$ is finite or cofinite. (Note that $P$ is not well defined if $\Omega$ is finite.) Show that $P$ is finitely additive.
(b) Show that this $P$ is not countably additive if $\Omega$ is countably infinite.
(c) Show that this $P$ is countably additive if $\Omega$ is uncountable.
(d) Now let $\mathscr{F}$ be the $\sigma$-field consisting of the countable and the cocountable sets in an uncountable $\Omega$, and define $P$ on $\mathscr{F}$ by taking $P(A)$ to be 0 or 1 as $A$ is countable or cocountable. (Note that $P$ is not well defined if $\Omega$ is countable.) Show that $P$ is countably additive.
2.14. In $(0,1]$ let $\mathscr{F}$ be the class of sets that either (i) are of the first category [A15] or (ii) have complement of the first category. Show that $\mathscr{F}$ is a $\sigma$-field. For $A$ in $\mathscr{F}$, take $P(A)$ to be 0 in case (i) and 1 in case (ii). Show that $P$ is countably additive.
2.15. On the field $\mathscr{B}_{0}$ in $(0,1]$ define $P(A)$ to be 1 or 0 according as there does or does not exist some positive $\epsilon_{A}$ (depending on $A$ ) such that $A$ contains the interval $\left(\frac{1}{2}, \frac{1}{2}+\epsilon_{A}\right]$. Show that $P$ is finitely but not countably additive. No such example is possible for the field $\mathscr{C}_{0}$ in $S^{\infty}$ (Theorem 2.3).
2.16. (a) Suppose that $P$ is a probability measure on a field $\mathscr{F}$. Suppose that $A_{t} \in \mathscr{F}$ for $t>0$, that $A_{s} \subset A_{t}$ for $s<t$, and that $A=\cup_{t>0} A_{t} \in \mathscr{F}$. Extend Theorem 2.1(i) by showing that $P\left(A_{t}\right) \uparrow P(A)$ as $t \rightarrow \infty$. Show that $A$ necessarily lies in $\mathscr{F}$ if it is a $\sigma$-field.
(b) Extend Theorem 2.1(ii) in the same way.
2.17. Suppose that $P$ is a probability measure on a field $\mathscr{F}$, that $A_{1}, A_{2}, \ldots$, and $A=\cup_{n} A_{n}$ lie in $\mathscr{F}$, and that the $A_{n}$ are nearly disjoint in the sense that $P\left(A_{m} \cap A_{n}\right)=0$ for $m \neq n$. Show that $P(A)=\sum_{n} P\left(A_{n}\right)$.
2.18. Stochastic arithmetic. Define a set function $P_{n}$ on the class of all subsets of $\Omega=\{1,2, \ldots\}$ by

$$
\begin{equation*}
P_{n}(A)=\frac{1}{n} \#[m: 1 \leq m \leq n, m \in A] ; \tag{2.34}
\end{equation*}
$$

among the first $n$ integers, the proportion that lie in $A$ is just $P_{n}(A)$. Then $P_{n}$ is a discrete probability measure. The set $A$ has density

$$
\begin{equation*}
D(A)=\lim _{n} P_{n}(A), \tag{2.35}
\end{equation*}
$$

provided this limit exists. Let $\mathscr{D}$ be the class of sets having density.
(a) Show that $D$ is finitely but not countably additive on $\mathscr{D}$.
(b) Show that $\mathscr{D}$ contains the empty set and $\Omega$ and is closed under the formation of complements, proper differences, and finite disjoint unions, but is not closed under the formation of countable disjoint unions or of finite unions that are not disjoint.
(c) Let $\mathscr{M}$ consist of the periodic sets $M_{a}=[k a: k=1,2, \ldots]$. Observe that

$$
\begin{equation*}
P_{n}\left(M_{a}\right)=\frac{1}{n}\left|\frac{n}{a}\right| \rightarrow \frac{1}{a}=D\left(M_{a}\right) . \tag{2.36}
\end{equation*}
$$

Show that the field $f(\mathscr{M})$ generated by $\mathscr{M}$ (see Problem 2.5) is contained in $\mathscr{D}$. Show that $D$ is completely determined on $f(\mathscr{M})$ by the value it gives for each $a$ to the event that $m$ is divisible by $a$.
(d) Assume that $\sum p^{-1}$ diverges (sum over all primes; see Problem 5.20(e)) and prove that $D$, although finitely additive, is not countably additive on the field $f(M)$.
(e) Euler's function $\varphi(n)$ is the number of positive integers less than $n$ and relatively prime to it. Let $p_{1}, \ldots, p_{r}$ be the distinct prime factors of $n$; from the inclusion-exclusion formula for the events [ $m: p_{i} \mid m$ ], (2.36), and the fact that the $p_{i}$ divide $n$, deduce

$$
\begin{equation*}
\frac{\varphi(n)}{n}=\prod_{p \mid n}\left(1-\frac{1}{p}\right) . \tag{2.37}
\end{equation*}
$$

(f) Show for $0 \leq x \leq 1$ that $D(A)=x$ for some $A$.
(g) Show that $D$ is translation invariant: If $B=[m+1: m \in A]$, then $B$ has a density if and only if $A$ does, in which case $D(A)=D(B)$.
2.19. A probability measure space $(\Omega, \mathscr{F}, P)$ is nonatomic if $P(A)>0$ implies that there exists a $B$ such that $B \subset A$ and $0<P(B)<P(A)$ ( $A$ and $B$ in $\mathscr{F}$, of course).
(a) Assuming the existence of Lebesgue measure $\lambda$ on $\mathscr{B}$, prove that it is nonatomic.
(b) Show in the nonatomic case that $P(A)>0$ and $\epsilon>0$ imply that there exists a $B$ such that $B \subset A$ and $0<P(B)<\epsilon$.
(c) Show in the nonatomic case that $0 \leq x \leq P(A)$ implies that there exists a $B$ such that $B \subset A$ and $P(B)=x$. Hint: Inductively define classes $\mathscr{H}_{n}$, numbers $h_{n}$, and sets $H_{n}$ by $\mathscr{H}_{0}=\{\varnothing\}=\left\{H_{0}\right\}, \quad \mathscr{H}_{n}=\left[H: H \subset A-U_{k<n} H_{k}\right.$, $\left.P\left(\cup_{k<n} H_{k}\right)+P(H) \leq x\right], h_{n}=\sup \left[P(H) \cdot H \in \mathscr{H}_{n}\right]$, and $P\left(H_{n}\right)>h_{n}-n^{-1}$. Consider $\mathrm{U}_{k} H_{k}$.
(d) Show in the nonatomic case that, if $p_{1}, p_{2}, \ldots$ are nonnegative and add to 1 , then $A$ can be decomposed into sets $B_{1}, B_{2}, \ldots$ such that $P\left(B_{n}\right)=p_{n} P(A)$.
2.20. Generalize the construction of product measure: For $n=1,2, \ldots$, let $S_{n}$ be a finite space with given probabilities $p_{n u}, u \in S_{n}$ Let $S_{1} \times S_{2} \times$ be the space of sequences (2.15), where now $z_{k}(\omega) \in S_{k}$. Define $P$ on the class of cylinders, appropriately defined, by using the product $p_{1 u_{1}} \cdot p_{n u_{n}}$, on the right in (2.21) Prove $P$ countably additive on $\mathscr{C}_{0}$, and extend Theorem 2.3 and its lemma to this more general setting. Show that the lemma fails if any of the $S_{n}$ are infinite
2.21. (a) Suppose that $\mathscr{A}=\left\{A_{1}, A_{2}, \ldots\right\}$ is a countable partition of $\Omega$ Show (see (2.27)) that $\mathscr{A}_{1}=\mathscr{A}_{0}^{*}=\mathscr{A}^{*}$ coincides with $\sigma(\mathscr{A})$. This is a case where $\sigma(\mathscr{A})$ can be constructed "from the inside."
(b) Show that the set of normal numbers lies in $\mathscr{A}_{6}$.
(c) Show that $\mathscr{H}^{*}=\mathscr{H}$ if and only if $\mathscr{\mathscr { H }}$ is a $\sigma$-field. Show that $\mathscr{L}_{n-1}$ is strictly smaller than $\mathscr{G}_{n}$ for all $n$.
2.22. Extend (2.27) to infinite ordinals $\alpha$ by defining $\mathscr{A}_{\alpha}=\left(\bigcup_{\beta<\alpha} \mathscr{A}_{\beta}\right)^{*}$. Show that, if $\Omega$ is the first uncountable ordinal, then $\mathrm{U}_{\alpha<\Omega^{\mathscr{A}}} \mathscr{A}_{\alpha}=\sigma(\mathscr{A})$. Show that, if the cardinality of $\mathscr{A}$ does not exceed that of the continuum, then the same is true of $\sigma(\mathscr{A})$. Thus $\mathscr{B}$ has the power of the continuum.
2.23. $\uparrow$ Extend (2.29) to ordinals $\alpha<\Omega$ as follows. Replace the right side of (2.28) by $\bigcup_{n=1}^{\infty}\left(A_{2 n-1} \cup A_{2 n}^{c}\right)$. Suppose that $\Phi_{\beta}$ is defined for $\beta<\alpha$ Let $\beta_{\alpha}(1), \beta_{\alpha}(2), \ldots$ be a sequence of ordinals such that $\beta_{\alpha}(n)<\alpha$ and such that if $\beta<\alpha$, then $\beta=\beta_{\alpha}(n)$ for infinitely many even $n$ and for infinitely many odd $n$; define

$$
\begin{align*}
& \Phi_{\alpha}\left(A_{1}, A_{2}, \ldots\right)  \tag{2.38}\\
& \quad=\Psi\left(\Phi_{\beta_{\alpha}(1)}\left(A_{m_{11}}, A_{m_{12}}, \ldots\right), \Phi_{\beta_{a}(2)}\left(A_{m_{21}}, A_{m_{22}}, \ldots\right), \ldots\right)
\end{align*}
$$

Prove by transfinite induction that (2.38) is in $\mathscr{B}$ if the $A_{n}$ are, that every element of $\mathscr{J}_{\alpha}$ has the form (2.38) for sets $A_{n}$ in $\mathscr{I}_{0}$, and that (2.31) holds with $\alpha$ in place of $n$. Define $\varphi_{\alpha}(\omega)=\Phi_{\alpha}\left(I_{\omega_{1}}, I_{\omega_{2}}, \ldots\right)$, and show that $B_{\alpha}=[\omega$ : $\left.\omega \notin \varphi_{\alpha}(\omega)\right]$ lies in $\mathscr{B}-\mathscr{I}_{\alpha}$ for $\alpha<\Omega$. Show that $\mathscr{I}_{\alpha}$ is strictly smaller than $\mathscr{I}_{\beta}$ for $\alpha<\beta \leq \Omega$.

## SECTION 3. EXISTENCE AND EXTENSION

The main theorem to be proved here may be compactly stated this way:
Theorem 3.1. A probability measure on a field has a unique extension to the generated $\sigma$-field.

In more detail the assertion is this: Suppose that $P$ is a probability measure on a field $\mathscr{F}_{0}$ of subsets of $\Omega$, and put $\mathscr{F}=\sigma\left(\mathscr{F}_{0}\right)$. Then there
exists a probability measure $Q$ on $\mathscr{F}$ such that $Q(A)=P(A)$ for $A \in \mathscr{F}_{0}$. Further, if $Q^{\prime}$ is another probability measure on $\mathscr{F}$ such that $Q^{\prime}(A)=P(A)$ for $A \in \mathscr{F}_{0}$, then $Q^{\prime}(A)=Q(A)$ for $A \in \mathscr{F}$.

Although the measure extended to $\mathscr{F}$ is usually denoted by the same letter as the original measure on $\mathscr{F}_{0}$, they are really different set functions, since they have different domains of definition. The class $\mathscr{F}_{0}$ is only assumed finitely additive in the theorem, but the set function $P$ on it must be assumed countably additive (since this of course follows from the conclusion of the theorem).

As shown in Theorem 2.2, $\lambda$ (initially defined for intervals as length: $\lambda(I)=|I|)$ extends to a probability measure on the field $\mathscr{B}_{0}$ of finite disjoint unions of subintervals of $(0,1]$. By Theorem 3.1, $\lambda$ extends in a unique way from $\mathscr{B}_{0}$ to $\mathscr{B}=\sigma\left(\mathscr{B}_{0}\right)$, the class of Borel sets in ( 0,1 ]. The extended $\lambda$ is Lebesgue measure on the unit interval. Theorem 3.1 has many other applications as well.

The uniqueness in Theorem 3.1 will be proved later; see Theorem 3.3. The first project is to prove that an extension does exist.

## Construction of the Extension

Let $P$ be a probability measure on a field $\mathscr{F}_{0}$. The construction following extends $P$ to a class that in general is much larger than $\sigma\left(\mathscr{F}_{0}\right)$ but nonetheless does not in general contain all the subsets of $\Omega$.

For each subset $A$ of $\Omega$, define its outer measure by

$$
\begin{equation*}
P^{*}(A)=\inf \sum_{n} P\left(A_{n}\right), \tag{3.1}
\end{equation*}
$$

where the infimum extends over all finite and infinite sequences $A_{1}, A_{2}, \ldots$ of $\mathscr{F}_{0}$-sets satisfying $A \subset \cup_{n} A_{n}$. If the $A_{n}$ form an efficient covering of $A$, in the sense that they do not overlap one another very much or extend much beyond $A$, then $\sum_{n} P\left(A_{n}\right)$ should be a good outer approximation to the measure of $A$ if $A$ is indeed to have a measure assigned it at all. Thus (3.1) represents a first attempt to assign a measure to $A$.

Because of the rule $P\left(A^{c}\right)=1-P(A)$ for complements (see (2.6)), it is natural in approximating $A$ from the inside to approximate the complement $A^{c}$ from the outside instead and then subtract from 1:

$$
\begin{equation*}
P_{*}(A)=1-P^{*}\left(A^{c}\right) \tag{3.2}
\end{equation*}
$$

This, the inner measure of $A$, is a second candidate for the measure of $A .^{\dagger} \mathrm{A}$ plausible procedure is to assign measure to those $A$ for which (3.1) and (3.2)

[^12]agree, and to take the common value $P^{*}(A)=P_{*}(A)$ as the measure. Since (3.1) and (3.2) agree if and only if
$$
\begin{equation*}
P^{*}(A)+P^{*}\left(A^{c}\right)=1, \tag{3.3}
\end{equation*}
$$
the procedure would be to consider the class of $A$ satisfying (3.3) and use $P^{*}(A)$ as the measure.

It turns out to be simpler to impose on $A$ the more stringent requirement that

$$
\begin{equation*}
P^{*}(A \cap E)+P^{*}\left(A^{c} \cap E\right)=P^{*}(E) \tag{3.4}
\end{equation*}
$$

hold for every set $E$; (3.3) is the special case $E=\Omega$, because it will turn out that $P^{*}(\Omega)=1 .^{\dagger}$ A set $A$ is called $P^{*}$-measurable if (3.4) holds for all $E$; let $\mathscr{M}$ be the class of such sets. What will be shown is that $\mathscr{M}$ contains $\sigma\left(\mathscr{F}_{0}\right)$ and that the restriction of $P^{*}$ to $\sigma\left(\mathscr{F}_{0}\right)$ is the required extension of $P$.

The set function $P^{*}$ has four properties that will be needed:
(i) $P^{*}(\varnothing)=0$;
(ii) $P^{*}$ is nonnegative: $P^{*}(A) \geq 0$ for every $A \subset \Omega$;
(iii) $P^{*}$ is monotone: $A \subset B$ implies $P^{*}(A) \leq P^{*}(B)$;
(iv) $P^{*}$ is countably subadditive: $P^{*}\left(\cup_{n} A_{n}\right) \leq \sum_{n} P^{*}\left(A_{n}\right)$.

The others being obvious, only (iv) needs proof. For a given $\epsilon$, choose $\mathscr{F}_{0}$-sets $B_{n k}$ such that $A_{n} \subset \cup_{k} B_{n k}$ and $\sum_{k} P\left(B_{n k}\right)<P^{*}\left(A_{n}\right)+\epsilon 2^{-n}$, which is possible by the definition (3.1). Now $\cup_{n} A_{n} \subset \cup_{n, k} B_{n k}$, so that $P^{*}\left(\cup_{n} A_{n}\right) \leq \sum_{n, k} P\left(B_{n k}\right)<\sum_{n} P^{*}\left(A_{n}\right)+\epsilon$, and (iv) follows. Of course, (iv) implies finite subadditivity.

By definition, $A$ lies in the class $\mathscr{M}$ of $P^{*}$-measurable sets if it splits each $E$ in $2^{\Omega}$ in such a way that $P^{*}$ adds for the pieces-that is, if (3.4) holds. Because of finite subadditivity, this is equivalent to

$$
\begin{equation*}
P^{*}(A \cap E)+P^{*}\left(A^{c} \cap E\right) \leq P^{*}(E) . \tag{3.5}
\end{equation*}
$$

## Lemma 1. The class $\mathscr{M}$ is a field.

[^13]Proof. It is clear that $\Omega \in \mathscr{M}$ and that $\mathscr{M}$ is closed under complementation. Suppose that $A, B \in \mathscr{M}$ and $E \subset \Omega$. Then

$$
\begin{aligned}
P^{*}(E)= & P^{*}(B \cap E)+P^{*}\left(B^{c} \cap E\right) \\
= & P^{*}(A \cap B \cap E)+P^{*}\left(A^{c} \cap B \cap E\right) \\
& +P^{*}\left(A \cap B^{c} \cap E\right)+P^{*}\left(A^{c} \cap B^{c} \cap E\right) \\
\geq & P^{*}(A \cap B \cap E) \\
& +P^{*}\left(\left(A^{c} \cap B \cap E\right) \cup\left(A \cap B^{c} \cap E\right) \cup\left(A^{c} \cap B^{c} \cap E\right)\right) \\
= & P^{*}((A \cap B) \cap E)+P^{*}\left((A \cap B)^{c} \cap E\right)
\end{aligned}
$$

the inequality following by subadditivity. Hence ${ }^{\dagger} A \cap B \in \mathscr{M}$, and $\mathscr{M}$ is a field. $\square$

Lemma 2. If $A_{1}, A_{2}, \ldots$ is a finite or infinite sequence of disjoint $\mathscr{M}$-sets, then for each $E \subset \Omega$,

$$
\begin{equation*}
P^{*}\left(E \cap\left(\bigcup_{k} A_{k}\right)\right)=\sum_{k} P^{*}\left(E \cap A_{k}\right) . \tag{3.6}
\end{equation*}
$$

Proof. Consider first the case of finitely many $A_{k}$, say $n$ of them. For $n=1$, there is nothing to prove. In the case $n=2$, if $A_{1} \cup A_{2}=\Omega$, then (3.6) is just (3.4) with $A_{1}$ (or $A_{2}$ ) in the role of $A$. If $A_{1} \cup A_{2}$ is smaller than $\Omega$, split $E \cap\left(A_{1} \cup A_{2}\right)$ by $A_{1}$ and $A_{1}^{c}$ (or by $A_{2}$ and $A_{2}^{c}$ ) and use (3.4) and disjointness.

Assume (3.6) holds for the case of $n-1$ sets. By the case $n=2$, together with the induction hypothesis, $P^{*}\left(E \cap\left(\cup_{k=1}^{n} A_{k}\right)\right)=P^{*}\left(E \cap\left(\cup_{k=1}^{n-1} A_{k}\right)\right)+ P^{*}\left(E \cap A_{n}\right)=\sum_{k=1}^{n} P^{*}\left(E \cap A_{k}\right)$.

Thus (3.6) holds in the finite case. For the infinite case use monotonicity: $P^{*}\left(E \cap\left(\cup_{k=1}^{\infty} A_{k}\right)\right) \geq P^{*}\left(E \cap\left(\cup_{k=1}^{n} A_{k}\right)\right)=\sum_{k=1}^{n} P^{*}\left(E \cap A_{k}\right)$. Let $n \rightarrow \infty$, and conclude that the left side of (3.6) is greater than or equal to the right. The reverse inequality follows by countable subadditivity. $\square$

Lemma 3. The class $\mathscr{M}$ is a $\sigma$-field, and $P^{*}$ restricted to $\mathscr{M}$ is countably additive.

Proof. Suppose that $A_{1}, A_{2}, \ldots$ are disjoint $\mathscr{M}$-sets with union $A$. Since $F_{n}=\cup_{k=1}^{n} A_{k}$ lies in the field $\mathscr{M}, P^{*}(E)=P^{*}\left(E \cap F_{n}\right)+P^{*}\left(E \cap F_{n}^{c}\right)$. To the

[^14]first term on the right apply (3.6), and to the second term apply monotonicity $\left(F_{n}^{c} \supset A^{c}\right): P^{*}(E) \geq \sum_{k=1}^{n} P^{*}\left(E \cap A_{k}\right)+P^{*}\left(E \cap A^{c}\right)$. Let $n \rightarrow \infty$ and use (3.6) again: $P^{*}(E) \geq \sum_{k=1}^{\infty} P^{*}\left(E \cap A_{k}\right)+P^{*}\left(E \cap A^{c}\right)=P^{*}(E \cap A)+P^{*}\left(E \cap A^{c}\right)$. Hence $A$ satisfies (3.5) and so lies in $\mathscr{M}$, which is therefore closed under the formation of countable disjoint unions.

From the fact that $\mathscr{M}$ is a field closed under the formation of countable disjoint unions it follows that $\mathscr{M}$ is a $\sigma$-field (for sets $B_{k}$ in $\mathscr{M}$, let $A_{1}=B_{1}$ and $A_{k}=B_{k} \cap B_{1}^{c} \cap \cdots \cap B_{k-1}^{c}$; then the $A_{k}$ are disjoint $\mathscr{M}$-sets and $\mathrm{U}_{k} B_{k}=\mathrm{U}_{k} A_{k} \in \mathscr{M}$ ). The countable additivity of $P^{*}$ on $\mathscr{M}$ follows from (3.6): take $E=\Omega$. $\square$

Lemmas 1,2, and 3 use only the properties (i) through (iv) of $P^{*}$ derived above. The next two use the specific assumption that $P^{*}$ is defined via (3.1) from a probability measure $P$ on the field $\mathscr{F}_{0}$.

Lemma 4. If $P^{*}$ is defined by (3.1), then $\mathscr{F}_{0} \subset \mathscr{M}$.
Proof. Suppose that $A \in \mathscr{F}_{0}$. Given $E$ and $\epsilon$, choose $\mathscr{F}_{0}$-sets $A_{n}$ such that $E \subset \cup_{n} A_{n}$ and $\sum_{n} P\left(A_{n}\right) \leq P^{*}(E)+\epsilon$. The sets $B_{n}=A_{n} \cap A$ and $C_{n}= A_{n} \cap A^{c}$ lie in $\mathscr{F}_{0}$ because it is a field. Also, $E \cap A \subset \cup_{n} B_{n}$ and $E \cap A^{c} \subset \mathrm{U}_{n} C_{n}$; by the definition of $P^{*}$ and the finite additivity of $P, P^{*}(E \cap A)+ P^{*}\left(E \cap A^{c}\right) \leq \sum_{n} P\left(B_{n}\right)+\sum_{n} P\left(C_{n}\right)=\sum_{n} P\left(A_{n}\right) \leq P^{*}(E)+\epsilon$. Hence $A \in \mathscr{F}_{0}$ implies (3.5), and so $\mathscr{F}_{0} \subset \mathscr{M}$. $\square$

Lemma 5. If $P^{*}$ is defined by (3.1), then

$$
\begin{equation*}
P^{*}(A)=P(A) \quad \text { for } A \in \mathscr{F}_{0} . \tag{3.7}
\end{equation*}
$$

Proof. It is obvious from the definition (3.1) that $P^{*}(A) \leq P(A)$ for $A$ in $\mathscr{F}_{0}$. If $A \subset \cup_{n} A_{n}$, where $A$ and the $A_{n}$ are in $\mathscr{F}_{0}$, then by the countable subadditivity and monotonicity of $P$ on $\mathscr{F}_{0}, P(A) \leq \sum_{n} P\left(A \cap A_{n}\right) \leq \sum_{n} P\left(A_{n}\right)$. Hence (3.7). $\square$

Proof of Extension in Theorem 3.1. Suppose that $P^{*}$ is defined via (3.1) from a (countably additive) probability measure $P$ on the field $\mathscr{F}_{0}$. Let $\mathscr{F}=\sigma\left(\mathscr{F}_{0}\right)$. By Lemmas 3 and 4, ${ }^{\dagger}$

$$
\mathscr{F}_{0} \subset \mathscr{F} \subset \mathscr{M} \subset 2^{\Omega} .
$$

By (3.7), $P^{*}(\Omega)=P(\Omega)=1$. By Lemma 3, $P^{*}$ (which is defined on all of $2^{\Omega}$ ) restricted to $\mathscr{M}$ is therefore a probability measure there. And then $P^{*}$ further restricted to $\mathscr{F}$ is clearly a probability measure on that class as well.

[^15]This measure on $\mathscr{F}$ is the required extension, because by (3.7) it agrees with $P$ on $\mathscr{F}_{0}$.

## Uniqueness and the $\pi-\lambda$ Theorem

To prove the extension in Theorem 3.1 is unique requires some auxiliary concepts. A class $\mathscr{P}$ of subsets of $\Omega$ is a $\pi$-system if it is closed under the formation of finite intersections:
( $\pi$ ) $A, B \in \mathscr{P}$ implies $A \cap B \in \mathscr{P}$.

A class $\mathscr{L}$ is a $\lambda$-system if it contains $\Omega$ and is closed under the formation of complements and of finite and countable disjoint unions:
$\left(\lambda_{1}\right) \Omega \in \mathscr{L} ;$
$\left(\lambda_{2}\right) A \in \mathscr{L}$ implies $A^{c} \in \mathscr{L}$;
( $\lambda_{3}$ ) $A_{1}, A_{2}, \ldots, \in \mathscr{L}$ and $A_{n} \cap A_{m}=\varnothing$ for $m \neq n$ imply $\cup_{n} A_{n} \in \mathscr{L}$.

Because of the disjointness condition in ( $\lambda_{3}$ ), the definition of $\lambda$-system is weaker (more inclusive) than that of $\sigma$-field. In the presence of ( $\lambda_{1}$ ) and ( $\lambda_{2}$ ), which imply $\varnothing \in \mathscr{L}$, the countably infinite case of ( $\lambda_{3}$ ) implies the finite one.

In the presence of ( $\lambda_{1}$ ) and ( $\lambda_{3}$ ), ( $\lambda_{2}$ ) is equivalent to the condition that $\mathscr{L}$ is closed under the formation of proper differences:
$\left(\lambda_{2}^{\prime}\right) A, B \in \mathscr{L}$ and $A \subset B$ imply $B-A \in \mathscr{L}$.

Suppose, in fact, that $\mathscr{L}$ satisfies ( $\lambda_{2}$ ) and ( $\lambda_{3}$ ). If $A, B \in \mathscr{L}$ and $A \subset B$, then $\mathscr{L}$ contains $B^{c}$, the disjoint union $A \cup B^{c}$, and its complement $(A \cup \left.B^{c}\right)^{c}=B-A$. Hence ( $\lambda_{2}^{\prime}$ ). On the other hand, if $\mathscr{L}$ satisfies ( $\lambda_{1}$ ) and ( $\lambda_{2}^{\prime}$ ), then $A \in \mathscr{L}$ implies $A^{c}=\Omega-A \in \mathscr{L}$. Hence ( $\lambda_{2}$ ).

Although a $\sigma$-field is a $\lambda$-system, the reverse is not true (in a four-point space take $\mathscr{L}$ to consist of $\varnothing, \Omega$, and the six two-point sets). But the connection is close:

Lemma 6. A class that is both a $\pi$-system and a $\lambda$-system is a $\sigma$-field.

Proof. The class contains $\Omega$ by ( $\lambda_{1}$ ) and is closed under the formation of complements and finite intersections by ( $\lambda_{2}$ ) and ( $\pi$ ). It is therefore a field. It is a $\sigma$-field because if it contains sets $A_{n}$, then it also contains the disjoint sets $B_{n}=A_{n} \cap A_{1}^{c} \cap \cdots \cap A_{n-1}^{c}$ and by ( $\lambda_{3}$ ) contains $\bigcup_{n} A_{n}=\bigcup_{n} B_{n}$.

Many uniqueness arguments depend on Dynkin's $\pi-\lambda$ theorem:

Theorem 3.2. If $\mathscr{P}$ is a $\pi$-system and $\mathscr{L}$ is a $\lambda$-system, then $\mathscr{P} \subset \mathscr{L}$ implies $\sigma(\mathscr{P}) \subset \mathscr{L}$.

Proof. Let $\mathscr{L}_{0}$ be the $\lambda$-system generated by $\mathscr{P}$-that is, the intersection of all $\lambda$-systems containing $\mathscr{P}$. It is a $\lambda$-system, it contains $\mathscr{P}$, and it is contained in every $\lambda$-system that contains $\mathscr{P}$ (see the construction of generated $\sigma$-fields, p. 21). Thus $\mathscr{P} \subset \mathscr{L}_{0} \subset \mathscr{L}$. If it can be shown that $\mathscr{L}_{0}$ is also a $\pi$-system, then it will follow by Lernma 6 that it is a $\sigma$-field. From the minimality of $\sigma(\mathscr{P})$ it will then follow that $\sigma(\mathscr{P}) \subset \mathscr{L}_{0}$, so that $\mathscr{P} \subset \sigma(\mathscr{P}) \subset \mathscr{L}_{0} \subset \mathscr{L}$. Therefore, it suffices to show that $\mathscr{L}_{0}$ is a $\pi$-system.

For each $A$, let $\mathscr{L}_{A}$ be the class of sets $B$ such that $A \cap B \in \mathscr{L}_{0}$. If $A$ is assumed to lie in $\mathscr{P}$, or even if $A$ is merely assumed to lie in $\mathscr{L}_{0}$, then $\mathscr{L}_{A}$ is a $\lambda$-system: Since $A \cap \Omega=A \in \mathscr{L}_{0}$ by the assumption, $\mathscr{L}_{A}$ satisfies $\left(\lambda_{1}\right)$. If $B_{1}, B_{2} \in \mathscr{L}_{A}$ and $B_{1} \subset B_{2}$, then the $\lambda$-system $\mathscr{L}_{0}$ contains $A \cap B_{1}$ and $A \cap B_{2}$ and hence contains the proper difference $\left(A \cap B_{2}\right)-\left(A \cap B_{1}\right)= A \cap\left(B_{2}-B_{1}\right)$, so that $\mathscr{L}_{A}$ contains $B_{2}-B_{1}: \mathscr{L}_{A}$ satisfies $\left(\lambda_{2}^{\prime}\right)$. If $B_{n}$ are disjoint $\mathscr{L}_{A}$-sets, then $\mathscr{L}_{0}$ contains the disjoint sets $A \cap B_{n}$ and hence contains their union $A \cap\left(\cup_{n} B_{n}\right): \mathscr{L}_{A}$ satisfies ( $\lambda_{3}$ ).

If $A \in \mathscr{P}$ and $B \in \mathscr{P}$, then ( $\mathscr{P}$ is a $\pi$-system) $A \cap B \in \mathscr{P} \subset \mathscr{L}_{0}$, or $B \in \mathscr{L}_{A}$. Thus $A \in \mathscr{P}$ implies $\mathscr{P} \subset \mathscr{L}_{A}$, and since $\mathscr{L}_{A}$ is a $\lambda$-system, minimality gives $\mathscr{L}_{0} \subset \mathscr{L}_{A}$.

Thus $A \in \mathscr{P}$ implies $\mathscr{L}_{0} \subset \mathscr{L}_{A}$, or, to put it another way, $A \in \mathscr{P}$ and $B \in \mathscr{L}_{0}$ together imply that $B \in \mathscr{L}_{A}$ and hence $A \in \mathscr{L}_{B}$. (The key to the proof is that $B \in \mathscr{L}_{A}$ if and only if $A \in \mathscr{L}_{B}$.) This last implication means that $B \in \mathscr{L}_{0}$ implies $\mathscr{P} \subset \mathscr{L}_{B}$. Since $\mathscr{L}_{B}$ is a $\lambda$-system, it follows by minimality once again that $B \in \mathscr{L}_{0}$ implies $\mathscr{L}_{0} \subset \mathscr{L}_{B}$. Finally, $B \in \mathscr{L}_{0}^{0}$ and $C \in \mathscr{L}_{0}$ together imply $C \in \mathscr{L}_{B}$, or $B \cap C \in \mathscr{L}_{0}$. Therefore, $\mathscr{L}_{0}$ is indeed a $\pi$ system. $\square$

Since a field is certainly a $\pi$-system, the uniqueness asserted in Theorem 3.1 is a consequence of this result:

Theorem 3.3. Suppose that $P_{1}$ and $P_{2}$ are probability measures on $\sigma(\mathscr{P})$, where $\mathscr{P}$ is a $\pi$-system. If $P_{1}$ and $P_{2}$ agree on $\mathscr{P}$, then they agree on $\sigma(\mathscr{P})$.

Proof. Let $\mathscr{L}$ be the class of sets $A$ in $\sigma(\mathscr{P})$ such that $P_{1}(A)=P_{2}(A)$. Clearly $\Omega \in \mathscr{L}$. If $A \in \mathscr{L}$, then $P_{1}\left(A^{c}\right)=1-P_{1}(A)=1-P_{2}(A)=P_{2}\left(A^{c}\right)$, and hence $A^{c} \in \mathscr{L}$. If $A_{n}$ are disjoint sets in $\mathscr{L}$, then $P_{1}\left(\mathrm{U}_{n} A_{n}\right)= \sum_{n} P_{1}\left(A_{n}\right)=\sum_{n} P_{2}\left(A_{n}\right)=P_{2}\left(\cup_{n} A_{n}\right)$, and hence $\cup_{n} A_{n} \in \mathscr{L}$. Therefore $\mathscr{L}$ is a $\lambda$-system. Since by hypothesis $\mathscr{P} \subset \mathscr{L}$ and $\mathscr{P}$ is a $\pi$-system, the $\pi-\lambda$ theorem gives $\sigma(\mathscr{P}) \subset \mathscr{L}$, as required. $\square$

Note that the $\pi-\lambda$ theorem and the concept of $\lambda$-system are exactly what are needed to make this proof work: The essential property of probability measures is countable additivity, and this is a condition on countable disjoint unions, the only kind involved in the requirement ( $\lambda_{3}$ ) in the definition of $\lambda$-system. In this, as in many applications of the $\pi$ - $\lambda$ theorem, $\mathscr{L} \subset \sigma(\mathscr{P})$ and therefore $\sigma(\mathscr{P})=\mathscr{L}$, even though the relation $\sigma(\mathscr{P}) \subset \mathscr{L}$ itself suffices for the conclusion of the theorem.

## Monotone Classes

A class $\mathscr{M}$ of subsets of $\Omega$ is monotone if it is closed under the formation of monotone unions and intersections:
(i) $A_{1}, A_{2}, \ldots \in \mathscr{M}$ and $A_{n} \uparrow A$ imply $A \in \mathscr{M}$;
(ii) $A_{1}, A_{2}, \ldots \in \mathscr{M}$ and $A_{n} \downarrow A$ imply $A \in \mathscr{M}$.

Halmos's monotone class theorem is a close relative of the $\pi-\lambda$ theorem but will be less frequently used in this book.

Theorem 3.4. If $\mathscr{F}_{0}$ is a field and $\mathscr{M}$ is a monotone class, then $\mathscr{F}_{0} \subset \mathscr{M}$ implies $\sigma\left(\mathscr{F}_{0}\right) \subset \mathscr{M}$.

Proof. Let $m\left(\mathscr{F}_{0}\right)$ be the minimal monotone class over $\mathscr{F}_{0}$-the intersection of all monotone classes containing $\mathscr{F}_{0}$. It is enough to prove $\sigma\left(\mathscr{F}_{0}\right) \subset m\left(\mathscr{F}_{0}\right)$; this will follow if $m\left(\mathscr{F}_{0}\right)$ is shown to be a field, because a monotone field is a $\sigma$-field.

Consider the class $\mathscr{G}=\left[A: A^{c} \in m\left(\mathscr{F}_{0}\right)\right]$. Since $m\left(\mathscr{F}_{0}\right)$ is monotone, so is $\mathscr{G}$. Since $\mathscr{F}_{0}$ is a field, $\mathscr{F}_{0} \subset \mathscr{G}$, and so $m\left(\mathscr{F}_{0}\right) \subset \mathscr{G}$. Hence $m\left(\mathscr{F}_{0}\right)$ is closed under complementation.

Define $\mathscr{G}_{1}$ as the class of $A$ such that $A \cup B \in m\left(\mathscr{F}_{0}\right)$ for all $B \in \mathscr{F}_{0}$. Then $\mathscr{G}_{1}$ is a monotone class and $\mathscr{F}_{0} \subset \mathscr{G}_{1}$; from the minimality of $m\left(\mathscr{F}_{0}\right)$ follows $m\left(\mathscr{F}_{0}\right) \subset \mathscr{G}_{1}$. Define $\mathscr{G}_{2}$ as the class of $B$ such that $A \cup B \in m\left(\mathscr{F}_{0}\right)$ for all $A \in m\left(\mathscr{F}_{0}\right)$. Then $\mathscr{G}_{2}$ is a monotone class. Now from $m\left(\mathscr{F}_{0}\right) \subset \mathscr{G}_{1}$ it follows that $A \in m\left(\mathscr{F}_{0}\right)$ and $B \in \mathscr{F}_{0}$ together imply that $A \cup B \in m\left(\mathscr{F}_{0}\right)$; in other words, $B \in \mathscr{F}_{0}$ implies that $B \in \mathscr{G}_{2}$. Thus $\mathscr{F}_{0} \subset \mathscr{G}_{2}$; by minimality, $m\left(\mathscr{F}_{0}\right) \subset \mathscr{G}_{2}$, and hence $A, B \in m\left(\mathscr{F}_{0}\right)$ implies that $A \cup B \in m\left(\mathscr{F}_{0}\right)$.

## Lebesgue Measure on the Unit Interval

Consider once again the unit interval $(0,1]$ together with the field $\mathscr{B}_{0}$ of finite disjoint unions of subintervals (Example 2.2) and the $\sigma$-field $\mathscr{B}=\sigma\left(\mathscr{B}_{0}\right)$ of Borel sets in (0,1]. According to Theorem 2.2, (2.12) defines a probability measure $\lambda$ on $\mathscr{B}_{0}$. By Theorem 3.1, $\lambda$ extends to $\mathscr{B}$, the extended $\lambda$ being Lebesgue measure. The probability space $((0,1], \mathscr{B}, \lambda)$ will be the basis for much of the probability theory in the remaining sections of this chapter. A few geometric properties of $\lambda$ will be considered here. Since the intervals in ( 0,1 ] form a $\pi$-system generating $\mathscr{B}, \lambda$ is the only probability measure on $\mathscr{B}$ that assigns to each interval its length as its measure.

Some Borel sets are difficult to visualize:

Example 3.1. Let $\left\{r_{1}, r_{2}, \ldots\right\}$ be an enumeration of the rationals in ( 0,1 ). Suppose that $\epsilon$ is small, and choose an open interval $I_{n}=\left(a_{n}, b_{n}\right)$ such that $r_{n} \in I_{n} \subset(0,1)$ and $\lambda\left(I_{n}\right)=b_{n}-a_{n}<\epsilon 2^{-n}$. Put $A=\bigcup_{n=1}^{\infty} I_{n}$. By subadditivity, $0<\lambda(A)<\epsilon$.

Since $A$ contains all the rationals in ( 0,1 ), it is dense there. Thus $A$ is an open, dense set with measure near 0 . If $I$ is an open subinterval of $(0,1)$, then $I$ must intersect one of the $I_{n}$, and therefore $\lambda(A \cap I)>0$.

If $B=(0,1)-A$ then $1-\epsilon<\lambda(B)<1$. The set $B$ contains no interval and is in fact nowhere dense [A15]. Despite this, $B$ has measure nearly 1. $\square$

Example 3.2. There is a set defined in probability terms that has geometric properties similar to those in the preceding example. As in Section 1, let $d_{n}(\omega)$ be the $n$th digit in the dyadic expansion of $\omega$; see (1.7). Let $A_{n}=[\omega \in \left.(0,1]: d_{i}(\omega)=d_{n+i}(\omega)=d_{2 n+i}(\omega), i=1, \ldots, n\right]$, and let $A=\cup_{n=1}^{\infty} A_{n}$. Probabilistically, $A$ corresponds to the event that in an infinite sequence of tosses of a coin, some finite initial segment is immediately duplicated twice over. From $\lambda\left(A_{n}\right)=2^{n} \cdot 2^{-3 n}$ it follows that $0<\lambda(A) \leq \sum_{n=1}^{\infty} 2^{-2 n}=\frac{1}{3}$. Again $A$ is dense in the unit interval; its measure, less than $\frac{1}{3}$, could be made less than $\epsilon$ by requiring that some initial segment be immediately duplicated $k$ times over with $k$ large. $\square$

The outer measure (3.1) corresponding to $\lambda$ on $\mathscr{B}_{0}$ is the infimum of the sums $\sum_{n} \lambda\left(A_{n}\right)$ for which $A_{n} \in \mathscr{B}_{0}$ and $A \subset \cup_{n} A_{n}$. Since each $A_{n}$ is a finite disjoint union of intervals, this outer measure is

$$
\begin{equation*}
\lambda^{*}(A)=\inf \sum_{n}\left|I_{n}\right|, \tag{3.8}
\end{equation*}
$$

where the infimum extends over coverings of $A$ by intervals $I_{n}$. The notion of negligibility in Section 1 can therefore be reformulated: $A$ is negligible if and only if $\lambda^{*}(A)=0$. For $A$ in $\mathscr{B}$, this is the same thing as $\lambda(A)=0$. This covers the set $N$ of normal numbers: Since the complement $N^{c}$ is negligible and lies in $\mathscr{B}, \lambda\left(N^{c}\right)=0$. Therefore, the Borel set $N$ itself has probability 1: $\lambda(N)=1$.

## Completeness

This is the natural place to consider completeness, although it enters into probability theory in an essential way only in connection with the study of stochastic processes in continuous time; see Sections 37 and 38.

A probability measure space ( $\Omega, \mathscr{F}, P$ ) is complete if $A \subset B, B \in \mathscr{F}$, and $P(B)=0$ together imply that $A \in \mathscr{F}$ (and hence that $P(A)=0$ ). If ( $\Omega, \mathscr{F}, P$ ) is complete, then the conditions $A \in \mathscr{F}, A \Delta A^{\prime} \subset B \in \mathscr{F}$, and $P(B)=0$ together imply that $A^{\prime} \in \mathscr{F}$ and $P\left(A^{\prime}\right)=P(A)$.

Suppose that $(\Omega, \mathscr{F}, P)$ is an arbitrary probability space. Define $P^{*}$ by (3.1) for $\mathscr{F}_{0}=\mathscr{F}=\sigma\left(\mathscr{F}_{0}\right)$, and consider the $\sigma$-field $\mathscr{M}$ of $P^{*}$-measurable sets. The arguments leading to Theorem 3.1 show that $P^{*}$ restricted to $\mathscr{M}$ is a probability measure. If $P^{*}(B)=0$ and $A \subset B$, then $P^{*}(A \cap E)+P^{*}\left(A^{c} \cap E\right) \leq P^{*}(B)+P^{*}(E)=P^{*}(E)$ by monotonicity, so that $A$ satisfies (3.5) and hence lies in $\mathscr{M}$. Thus ( $\Omega, \mathscr{M}, P^{*}$ ) is a complete probability measure space. In any probability space it is therefore possible to enlarge the $\sigma$-field and extend the measure in such a way as to get a complete space.

Suppose that $((0,1], \mathscr{B}, \lambda)$ is completed in this way. The sets in the completed $\sigma$-field $\mathscr{M}$ are called Lebesgue sets, and $\lambda$ extended to $\mathscr{M}$ is still called Lebesgue measure.

## Nonmeasurable Sets

There exist in $(0,1]$ sets that lie outside $\mathscr{B}$. For the construction (due to Vitali) it is convenient to use addition modulo 1 in $(0,1]$. For $x, y \in(0,1]$ take $x \oplus y$ to be $x+y$ or $x+y-1$ according as $x+y$ lies in ( 0,1 ] or not. ${ }^{+}$Put $A \oplus x=[a \oplus x: a \in A]$.

Let $\mathscr{L}$ be the class of Borel sets $A$ such that $A \oplus x$ is a Borel set and $\lambda(A \oplus x)=\lambda(A)$. Then $\mathscr{L}$ is a $\lambda$-system containing the intervals, and so $\mathscr{B} \subset \mathscr{L}$ by the $\pi-\lambda$ theorem. Thus $A \in \mathscr{B}$ implies that $A \oplus x \in \mathscr{B}$ and $\lambda(A \oplus x)=\lambda(A)$. in this sense, $\lambda$ is translation-invariant.

Define $x$ and $y$ to be equivalent $(x \sim y)$ if $x \oplus r=y$ for some rational $r$ in $(0,1]$. Let $H$ be a subset of $(0,1]$ consisting of exactly one representative point from each equivalence class; such a set exists under the assumption of the axiom of choice [A8]. Consider now the countably many sers $H \oplus r$ for rational $r$

These sets are disjoint, because no two distinct points of $H$ are equivalent. (If $H \oplus r_{1}$ and $H \oplus r_{2}$ share the point $h_{1} \oplus r_{1}=h_{2} \oplus r_{2}$, then $h_{1} \sim h_{2}$; this is impossible unless $k_{1}=h_{2}$, in which case $r_{1}=r_{2}$.) Each point of ( 0,1 ] lies in one of these sets, because $H$ has a representative from each equivalence class. (If $x \sim h \in H$, then $x=h \oplus r \in H \oplus r$ for some rational $r$.) Thus $(0,1]=\bigcup_{r}(H \oplus \nu)$, a countable disjoint union.

If $H$ were in $\mathscr{B}$, it would follow that $\lambda(0,1]=\sum_{r} \lambda(H \oplus r)$. This is impossible: If the value common to the $\lambda(H \oplus r)$ is 0 , it leads to $1=0$; if the common value is positive, it leads to a convergent infinite series of identical positive terms $(a+a+\cdots <\infty$ and $a>0$ ). Thus $H$ lies outside $\mathscr{B}$.

## Two Impossibility Theorems*

The argument above, which uses the axiom of choice, in fact proves this: There exists on $2^{[0,1]}$ no probability measure $P$ such that $P(A \oplus x)=P(A)$ for all $A \in 2^{[0,1]}$ and all $x \in(0,1]$. In particular it is impossible to extend $\lambda$ to a translation-invariant probability measure on $2^{[0,1]}$.

[^16]There is a stronger result There exists on $2^{(0,1]}$ no probability measure $P$ such that $P(x)=0$ for each $x$. Since $\lambda\{x\}=0$, this implies that it is impossible to extend $\lambda$ to $2^{(0,1]}$ at all. ${ }^{\dagger}$

The proof of this second impossibility theorem requires the well-ordering principle (equivalent to the axiom of choice) and also the continuum hypothesis. Let $S$ be the set of sequences $(s(1), s(2), \ldots)$ of positive integers. Then $S$ has the power of the continuum. (Let the $n$th partial sum of a sequence in $S$ be the position of the $n$th 1 in the nonterminating dyadic representation of a point in ( 0,1 ]; this gives a one-to-one correspondence.) By the continuum hypothesis, the elements of $S$ can be put in a one-to-one correspondence with the set of ordinals preceding the first uncountable ordinal. Carrying the well ordering of these ordinals over to $S$ by means of the correspondence gives to $S$ a well-ordering relation $\leq_{w}$ with the property that each element has only countably many predecessors.

For $s, t$ in $S$ write $s \leq t$ if $s(i) \leq t(i)$ for all $i \geq 1$. Say that $t$ rejects $s$ if $t<_{w} s$ and $s \leq t$, this is a transitive relation. Let $T$ be the set of unrejected elements of $S$. Let $V_{s}$ be the set of elements that reject $s$, and assume it is nonempty. If $t$ is the first element (with respect to $\leq_{w}$ ) of $V_{s}$, then $t \in T^{\prime}$ (if $t^{\prime}$ rejects $t$, then it also rejects $s$, and since $t^{*}<_{w} t$, there is a contradiction). Therefore, if $s$ is rejected at all, it is rejected by an element of $\Gamma$.

Suppose $T$ is countable and let $t_{1}, t_{2}, \ldots$ be an enumeration of its elements. If $t^{*}(k)=t_{k}(k)+1$, then $t^{*}$ is not rejected by any $t_{k}$ and hence lies in $T$, which is impossible because it is distinct from each $t_{k}$. Thus $T$ is uncountable and must by the continuum hypothesis have the power of $(0,1]$.

Let $x$ be a one-to-one map of $T$ onto ( 0,1 ; write the image of 1 as $x_{1}$. Let $A_{k}^{i}=\left[x_{k}: t(i)=k\right]$ be the image under $x$ of the set of $t$ in $T$ for which $t(i)=k$. Since $t(i)$ must have some value $k, \cup_{k=1}^{\infty} A_{k}^{i}=(0,1]$. Assume that $P$ is countably additive and choose $u$ in $S$ in such a way that $P\left(\cup_{k=1}^{u(i)} A_{k}^{i}\right) \geq 1-1 / 2^{i+1}$ for $i \geq 1$. If

$$
A=\bigcap_{i=1}^{\infty} \bigcup_{k=1}^{u(i)} A_{k}^{i}=\bigcap_{i=1}^{\infty}\left[x_{1}: t(i) \leq u(i)\right]=\left[x_{1}: t \leq u\right],
$$

then $P(A)>0$. If $A$ is shown to be countable, this will contradict the hypothesis that each singleton has probability 0 .

Now, there is some $t_{0}$ in $T$ such that $u \leq t_{0}$ (if $u \in T$, take $t_{0}=u$, otherwise, $u$ is rejected by some $t_{0}$ in $T$ ). If $t \leq u$ for a $t$ in $T$, then $t \leq t_{0}$ and hence $t \leq_{w} t_{0}$ (since otherwise $t_{0}$ rejects $t$ ). This means that $[t: t \leq u]$ is contained in the countable set $[t$. $\left.t \leq_{w} t_{G}\right]$, and $A$ is indeed countable.

## PROBLEMS

3.1. (a) In the proof of Theorem 3.1 the assumed finite additivity of $P$ is used twice and the assumed countable additivity of $P$ is used once. Where?
(b) Show by example that a finitely additive probability measure on a field may not be countably subadditive. Show in fact that if a finitely additive probability measure is countably subadditive, then it is necessarily countably additive as well.
${ }^{\dagger}$ This refers to a countably additive extension, of course. If one is content with finite additivity, there is an extension to $2^{(6)}{ }^{\text {I }}$; see Problem 3.8.
(c) Suppose Theorem 2.1 were weakened by strengthening its hypothesis to the assumption that $\mathscr{F}$ is a $\sigma$-field. Why would this weakened result not suffice for the proof of Theorem 3.1?
3.2. Let $P$ be a probability measure on a field $\mathscr{F}_{0}$ and for every subset $A$ of $\Omega$ define $P^{*}(A)$ by (3.1). Denote also by $P$ the extension (Theorem 3.1) of $P$ to $\mathscr{F}=\sigma\left(\mathscr{F}_{0}\right)$.
(a) Show that

$$
\begin{equation*}
P^{*}(A)=\inf [P(B): A \subset B, B \in \mathscr{F}] \tag{3.9}
\end{equation*}
$$

and (see (3.2))

$$
\begin{equation*}
P_{*}(A)=\sup [P(C): C \subset A, C \in \mathscr{F}] \tag{3.10}
\end{equation*}
$$

and show that the infimum and supremum are always achieved.
(b) Show that $A$ is $P^{*}$-measurable if and only if $P_{*}(A)=P^{*}(A)$.
(c) The outer and inner measures associated with a probability measure $P$ on a $\sigma$-field $\mathscr{F}$ are usually defined by (3.9) and (3.10). Show that (3.9) and (3.10) are the same as (3.1) and (3.2) with $\mathscr{F}$ in the role of $\mathscr{F}_{0}$.
3.3. $2.132 .153 .2 \uparrow$ For the following examples, describe $P^{*}$ as defined by (3.1) and $\mathscr{M}=\mathscr{M}\left(P^{*}\right)$ as defined by the requirement (3.4). Sort out the cases in which $P^{*}$ fails to agree with $P$ on $\mathscr{F}_{0}$ and explain why.
(a) Let $\mathscr{F}_{0}$ consist of the sets $\varnothing,\{1\},\{2,3\}$, and $\Omega=\{1,2,3\}$, and define probability measures $P_{1}$ and $P_{2}$ on $\mathscr{F}_{0}$ by $P_{1}\{1\}=0$ and $P_{2}\{2,3\}=0$. Note that $\mathscr{M}\left(P_{1}^{*}\right)$ and $\mathscr{M}\left(P_{2}^{*}\right)$ differ.
(b) Suppose that $\Omega$ is countably infinite, let $\mathscr{F}_{0}$ be the field of finite and cofinite sets, and take $P(A)$ to be 0 or 1 as $A$ is finite or cofinite.
(c) The same, but suppose that $\Omega$ is uncountable.
(d) Suppose that $\Omega$ is uncountable, let $\mathscr{F}_{0}$ consist of the countable and the cocountable sets, and take $P(A)$ to be 0 or 1 as $A$ is countable or cocountable.
(e) The probability in Problem 2.15.
(f) Let $P(A)=I_{A}\left(\omega_{0}\right)$ for $A \in \mathscr{F}_{0}$, and assume $\left(\omega_{0}\right) \in \sigma\left(\mathscr{F}_{0}\right)$.
3.4. Let $f$ be a strictly increasing, strictly concave function on $[0, \infty)$ satisfying $f(0)=0$. For $A \subset(0,1]$, define $P^{*}(A)=f\left(\lambda^{*}(A)\right)$. Show that $P^{*}$ is an outer measure in the sense that it satisfies $P^{*}(\varnothing)=0$ and is nonnegative, monotone, and countably subadditive. Show that $A$ lies in $\mathscr{M}$ (defined by the requirement (3.4)) if and only if $\lambda^{*}(A)$ or $\lambda^{*}\left(A^{c}\right)$ is 0 . Show that $P^{*}$ does not arise from the definition (3.1) for any probability measure $P$ on any field $\mathscr{F}_{0}$.
3.5. Let $\Omega$ be the unit square [ $(x, y): 0<x, y \leq 1$ ], let $\mathscr{F}$ be the class of sets of the form $[(x, y): x \in A, 0<y \leq 1]$, where $A \in \mathscr{B}$, and let $P$ have value $\lambda(A)$ at this set. Show that $(\Omega, \mathscr{F}, P)$ is a probability measure space. Show for $A=[(x, y)$ : $\left.0<x \leq 1, y=\frac{1}{2}\right]$ that $P_{*}(A)=0$ and $P^{*}(A)=1$.
3.6. Let $P$ be a finitely additive probability measure on a field $\mathscr{F}_{0}$ For $A \subset \Omega$, in analogy with (3.1) define

$$
\begin{equation*}
P^{\circ}(A)=\inf \sum_{n} P\left(A_{n}\right), \tag{3.11}
\end{equation*}
$$

where now the infimum extends over all finite sequences of $\mathscr{F}_{0}$-sets $A_{n}$ satisfying $A \subset \cup_{n} A_{n}$. (If countable coverings are allowed, everything is different. It can happen that $P^{\circ}(\Omega)=0$; see Problem 3.3(e)) Let $\mathscr{M}^{\circ}$ be the class of sets $A$ such that $P^{\circ}(E)=P^{\circ}(A \cap E)+P^{\circ}\left(A^{c} \cap E\right)$ for all $E \subset \Omega$.
(a) Show that $P^{\circ}(\varnothing)=0$ and that $P^{\circ}$ is nonnegative, monotone, and finitely subadditive Using these four properties of $P^{\circ}$, prove: Lemma $1^{\circ} \mathscr{M}^{\circ}$ is a field. Lemma $2^{\circ}$ : If $A_{1}, A_{2}, \quad$ is a finite sequence of disjoint $\mathscr{M}^{\circ}$-sets, then for each $E \subset \Omega$,

$$
\begin{equation*}
P^{\circ}\left(E \cap\left(\bigcup_{k} A_{k}\right)\right)=\sum_{k} P^{c}\left(E \cap A_{k}\right) . \tag{3.12}
\end{equation*}
$$

Lemma $3^{\circ}: P^{\circ}$ restricted to the fieid $\mathscr{M}^{\circ}$ is finitely additive.
(b) Show that if $P^{\circ}$ is defined by (3.11) (finite coverings), then: Lemma $4^{\circ}$. $\mathscr{F}_{0} \subset \mathscr{M}^{\circ}$. Lemma $5^{\circ}: P^{\circ}(A)=P(A)$ for $A \in \mathscr{F}_{0}$.
(c) Define $P_{o}(A)=1-P^{\circ}\left(A^{c}\right)$. Prove that if $E \subset A \in \mathscr{F}_{0}$, then

$$
\begin{equation*}
P_{\circ}(E)=P(A)-P^{\circ}(A-E) . \tag{3.13}
\end{equation*}
$$

3.7. $2.7 \quad 3.6 \dagger$ Suppose that $H$ lies outside the field $\mathscr{F}_{0}$, and let $\mathscr{F}_{1}$ be the field generated by $\mathscr{F}_{0} \cup(H)$, so that $\mathscr{F}_{1}$ consists of the sets $(H \cap A) \cup\left(H^{c} \cap B\right)$ with $A, B \in \mathscr{F}_{0}$. The problem is to show that a finitely additive probability measure $P$ on $\mathscr{F}_{0}$ has a finitely additive extension to $\mathscr{F}_{1}$. Define $Q$ on $\mathscr{F}_{1}$ by

$$
\begin{equation*}
Q\left((H \cap A) \cup\left(H^{c} \cap B\right)\right)=P^{\circ}(H \cap A)+P_{\mathrm{o}}\left(H^{c} \cap B\right) \tag{3.14}
\end{equation*}
$$

for $A, B \in \mathscr{F}_{0}$.
(a) Show that the definition is consistent.
(b) Shows that $Q$ agrees with $P$ on $\mathscr{F}_{0}$.
(c) Show that $Q$ is finitely additive on $\mathscr{F}_{1}$. Show that $Q(H)=P^{\circ}(H)$.
(d) Define $Q^{\prime}$ by interchanging the roles of $P^{\circ}$ and $P_{\circ}$ on the right in (314).

Show that $Q^{\prime}$ is another finitely additive extension of $P$ to $\mathscr{F}_{1}$. The same is true of any convex combination $Q^{\prime \prime}$ of $Q$ and $Q^{\prime}$. Show that $Q^{\prime \prime}(H)$ can take any value between $P_{o}(H)$ and $P^{\circ}(H)$.
3.8 ↑ Use Zorn's lemma to prove a theorem of Tarski: A finitely additive probability measure on a field has a finitely additive extension to the field of all subsets of the space.
3.9. $\dagger$ (a) Let $P$ be a (countably additive) probability measure on a $\sigma$-field $\mathscr{F}$. Suppose that $H \notin \mathscr{F}$, and let $\mathscr{F}_{1}=\sigma(\mathscr{F} \cup\{H\})$. By adapting the ideas in Problem 3.7, show that $P$ has a countably additive extension from $\mathscr{F}$ to $\mathscr{F}_{1}$.
(b) It is tempting to go on and use Zorn's lemma to extend $P$ to a completely additive probability measure on the $\sigma$-field of all subsets of $\Omega$. Where does the obvious proof break down?
3.10. 2.173 .2 ↑ As shown in the text, a probability measure space ( $\Omega, \mathscr{F}, P$ ) has a complete extension-that is, there exists a complete probability measure space ( $\Omega, \mathscr{F}_{1}, P_{1}$ ) such that $\mathscr{F} \subset \mathscr{F}_{1}$ and $P_{1}$ agrees with $P$ on $\mathscr{F}$.
(a) Suppose that $\left(\Omega, \mathscr{F}_{2}, P_{2}\right)$ is a second complete extension Show by an example in a space of two points that $P_{1}$ and $P_{2}$ need not agree on the $\sigma$-field $\mathscr{F}_{1} \cap \mathscr{F}_{2}$.
(b) There is, however, a unique minimal complete extension: Let $\mathscr{F}^{+}$consist of the sets $A$ for which there exist $\mathscr{F}$ sets $B$ and $C$ such that $A \Delta B \subset C$ and $P(C)=0$. Show that $\mathscr{F}^{+}$is a $\sigma$-field. For such a set $A$ define $P^{+}(A)=P(B)$. Show that the definition is consistent, that $P^{+}$is a probability measure on $\mathscr{F}^{+}$, and that ( $\Omega, \mathscr{F}^{+}, P^{+}$) is complete. Show that, if ( $\Omega, \mathscr{F}_{1}, P_{1}$ ) is any complete extension of ( $\Omega, \mathscr{F}^{*}, P$ ), then $\mathscr{F}^{+} \subset \mathscr{F}_{1}$ and $P_{1}$ agrees with $P^{+}$on $\mathscr{F}^{+}$; $\left(\Omega, \mathscr{F}^{+}, P^{+}\right)$is the completion of $(\Omega, \mathscr{F}, P)$.
(c) Show that $A \in \mathscr{F}^{+}$if and only if $P_{*}(A)=P^{*}(A)$, where $P_{*}$ and $P^{*}$ are defined by (3.9) and (3.10), and that $P^{+}(A)=P_{*}(A)=P^{*}(A)$ in this case. Thus the complete extension constructed in the text is exactiy the completion.
3.11. (a) Show that a $\lambda$-system satisfies the conditions
$\left(A_{4}\right) A, B \in \mathscr{L}$ and $A \cap B=\varnothing$ imply $A \cup B \in \mathscr{L}$,
( $\lambda_{5}$ ) $A_{1}, A_{2}, \ldots \in \mathscr{L}$ and $A_{n} \uparrow A$ imply $A \in \mathscr{L}$,
( $\lambda_{6}$ ) $A_{1}, A_{2}, \ldots \in \mathscr{L}$ and $A_{n} \downarrow A$ imply $A \in \mathscr{L}$.
(b) Show that $\mathscr{L}$ is a $\lambda$-system if and only if it satisfies $\left(\lambda_{1}\right),\left(\lambda_{2}^{\prime}\right)$, and $\left(\lambda_{5}\right)$. (Sometimes these conditions, with a redundant ( $\lambda_{4}$ ), are taken as the definition.)
3.12. $2.53 .11 \uparrow$ (a) Show that if $\mathscr{P}$ is a $\pi$-system, then the minimal $\lambda$-system over $\mathscr{P}$ coincides with $\sigma(\mathscr{P})$.
(b) Let $\mathscr{P}$ be a $\pi$-system and $\mathscr{M}$ a monotone class. Show that $\mathscr{P} \subset \mathscr{M}$ does not imply $\sigma(\mathscr{H}) \subset \mathscr{M}$.
(c) Deduce the $\pi-\lambda$ theorem from the monotone class theorem by showing directly that, if a $\lambda$-system $\mathscr{L}$ contains a $\pi$-system $\mathscr{P}$, then $\mathscr{L}$ also contains the field generated by $\mathscr{P}$.
3.13. $2.5 \uparrow$ (a) Suppose that $\mathscr{F}_{0}$ is a field and $P_{1}$ and $P_{2}$ are probability measures on $\sigma\left(\mathscr{F}_{0}\right)$. Show by the monotone class theorem that if $P_{1}$ and $P_{2}$ agree on $\mathscr{F}_{0}$, then they agree on $\sigma\left(\mathscr{F}_{0}\right)$.
(b) Let $\mathscr{F}_{0}$ be the smallest field over the $\pi$-system $\mathscr{P}$. Show by the inclusionexclusion formula that probability measures agreeing on $\mathscr{P}$ must agree also on $\mathscr{F}_{0}$. Now deduce Theorem 3.3 from part (a).
3.14. 1.52 .22 ↑ Prove the existence of a Lebesgue set of Lebesgue measure 0 that is not a Borel set.
3.15. 1.3 3.6 3.14 $\uparrow$ The outer content of a set $A$ in ( 0,1$]$ is $c^{*}(A)=\inf \sum_{n}\left|I_{n}\right|$, where the infimum extends over finite coverings of $A$ by intervals $I_{n}$. Thus $A$ is
trifling in the sense of Problem 1.3 if and only if $c^{*}(A)=0$. Define inner content by $c_{*}(A)=1-c^{*}\left(A^{c}\right)$. Show that $c_{*}(A)=\sup \sum_{n}\left|I_{n}\right|$, where the supremum extends over finite disjoint unions of intervals $I_{n}$ contained in $A$ (of course the analogue for $\lambda_{*}$ fails) Show that $c_{*}(A) \leq c^{*}(A)$; if the two are equal, their common value is taken as the content $c(A)$ of $A$, which is then Jordan measurable Connect all this with Problem 3.6.

Show that $c^{*}(A)=c^{*}\left(A^{-}\right)$, where $A^{-}$is the closure of $A$ (the analogue for $\lambda^{*}$ fails).

A trifling set is Jordan measurable Find (Pıoblem 3.14) a Jordan measurable set that is not a Borel set.

Show that $c_{*}(A) \leq \lambda_{*}(A) \leq \lambda^{*}(A) \leq c^{*}(A)$. What happens in this string of inequalities if $A$ consists of the rationals in ( $0, \frac{1}{2}$ ] together with the irrationals in ( $\frac{1}{2}, 1$ ]?
3.16. $15 \uparrow$ Deduce directly by countable additivity that the Cantor set has Lebesgue measure 0 .
3.17. From the fact that $\lambda(x \oplus A)=\lambda(A)$, deduce that sums and differences of normal numbers may be nonnormal.
3.18. Let $H$ be the nonmeasurable set constructed at the end of the section.
(a) Show that, if $A$ is a Borel set and $A \subset H$, then $\lambda(A)=0$-that is, $\lambda_{*}(H)=$ 0 .
(b) Show that, if $\lambda^{*}(E)>0$, then $E$ contains a nonmeasurable subset.
3.19. The aim of this problem is the construction of a Borel set $A$ in ( 0,1 ) such that $0<\lambda(A \cap G)<\lambda(G)$ for every nonempty oben set $G$ in $(0,1)$.
(a) It is shown in Example 3.1 how to construct a Borel set of positive Lebesgue measure that is nowhere dense. Show that every interval contains such a set.
(b) Let $\left\{I_{n}\right\}$ be an enumeration of the open intervals in $(0,1)$ with rational endpoints. Construct disjoint, nowhere derse Borel sets $A_{1}, B_{1}, A_{2}, B_{2}, \ldots$ of positive Lebesgue measure such that $A_{n} \cup B_{n} \subset I_{n}$.
(c) Let $A=\cup_{k} A_{k}$. A nonempty open $G$ in $(0,1)$ contains some $I_{n}$. Show that $0<\lambda\left(A_{n}\right) \leq \lambda(A \cap G)<\lambda(A \cap G)+\lambda\left(B_{n}\right) \leq \lambda(G)$.
3.20. $\uparrow$ There is no Borel set $A$ in $(0,1)$ such that $a \lambda(I) \leq \lambda(A \cap I) \leq b \lambda(I)$ for every open interval $l$ in $(0,1)$, where $0<a \leq b<1$. In fact prove:
(a) If $\lambda(A \cap I) \leq b \lambda(I)$ for all $I$ and if $b<1$, then $\lambda(A)=0$. Hint. Choose an open $G$ such that $A \subset G \subset(0,1)$ and $\lambda(G)<b^{-1} \lambda(A)$; represent $G$ as a disjoint union of intervals and obtain a contradiction.
(b) If $a \lambda(I) \leq \lambda(A \cap I)$ for all $I$ and if $a>0$, then $\lambda(A)=1$.
3.21. Show that not every subset of the unit interval is a Lebesgue set. Hint: Show that $\lambda^{*}$ is translation-invariant on $2^{(0,1)}$; then use the first impossibility theorem (p. 45). Or use the second impossibility theorem.

## SECTION 4. DENUMERABLE PROBABILITIES

Complex probability ideas can be made clear by the systematic use of measure theory, and probabilistic ideas of extramathematical origin, such as independence, can illuminate problems of purely mathematical interest. It is to this reciprocal exchange that measure-theoretic probability owes much of its interest.

The results of this section concern infinite sequences of events in a probability space. ${ }^{\dagger}$ They will be illustrated by examples in the unit interval. By this will always be meant the triple $(\Omega, \mathscr{F}, P)$ for which $\Omega$ is $(0,1], \mathscr{F}$ is the $\sigma$-field $\mathscr{B}$ of Borel sets therc, and $P(A)$ is for $A$ in $\mathscr{F}$ the Lebesgue measure $\lambda(A)$ of $A$. This is the space appropriate to the problems of Section 1 , which will be pursued further. The definitions and theorems, as opposed to the examples, apply to all probability spaces. The unit interval will appear again and again in this chapter, and it is essential to keep in mind that there are many other important spaces to which the general theory will be applied later.

## General Formulas

The formulas (2.5) through (2.11) will be used repeatedly. The sets involved in such formulas lie in the basic $\sigma$-field $\mathscr{F}$ by hypothesis. Ary probability argument starts from given sets assumed (often tacitly) to lie in $\mathscr{F}$; further sets constructed in the course of the argument must be shown to lie in $\mathscr{F}$ as well, but it is usually quite clear how to do this.

If $P(A)>0$, the conditional probability of $B$ given $A$ is defined in the usual way as

$$
\begin{equation*}
P(B \mid A)=\frac{P(A \cap B)}{P(A)} \tag{4.1}
\end{equation*}
$$

There are the chain-rule formulas

$$
\begin{gather*}
P(A \cap B)=P(A) P(B \mid A) \\
P(A \cap B \cap C)=P(A) P(B \mid A) P(C \mid A \cap B) \tag{4.2}
\end{gather*}
$$

If $A_{1}, A_{2}, \ldots$ partition $\Omega$, then

$$
\begin{equation*}
P(B)=\sum_{n} P\left(A_{n}\right) P\left(B \mid A_{n}\right) \tag{4.3}
\end{equation*}
$$

${ }^{\dagger}$ They come under what Borel in his first paper on the subject (see the footnote on p. 9) called probabilités dénombrables, hence the section heading

Note that for fixed $A$ the function $P(B \mid A)$ defines a probability measure as $B$ varies over $\mathscr{F}$.

If $P\left(A_{n}\right) \equiv 0$, then by subadditivity $P\left(\cup_{n} A_{n}\right)=0$. If $P\left(A_{n}\right) \equiv 1$, then $\cap_{n} A_{n}$ has complement $\mathrm{U}_{n} A_{n}^{c}$ of probability 0 . This gives two facts used over and over again:

If $A_{1}, A_{2}, \ldots$ are sets of probability 0 , so is $\bigcup_{n} A_{n}$. If $A_{1}, A_{2}, \ldots$ are sets of probability 1 , so is $\bigcap_{n} A_{n}$.

## Limit Sets

For a sequence $A_{1}, A_{2}, \ldots$ of sets, define a set

$$
\begin{equation*}
\lim \sup _{n} A_{n}=\bigcap_{n=1}^{\infty} \bigcup_{k=n}^{\infty} A_{k} \tag{4.4}
\end{equation*}
$$

and a set

$$
\begin{equation*}
\lim \inf _{n} A_{n}=\bigcup_{n=1}^{\infty} \bigcap_{k=n}^{\infty} A_{k} . \tag{4.5}
\end{equation*}
$$

These sets ${ }^{\dagger}$ are the limits superior and inferior of the sequence $\left\{A_{n}\right\}$. They lie in $\mathscr{F}$ if all the $A_{n}$ do. Now $\omega$ lies in (4.4) if and only if for each $n$ there is some $k \geq n$ for which $\omega \in A_{k}$; in other words, $\omega$ lies in (4.4) if and only if it lies in infinitely many of the $A_{n}$. In the same way, $\omega$ lies in (4.5) if and only if there is some $n$ such that $\omega \in A_{k}$ for all $k \geq n$; in other words, $\omega$ lies in (4.5) if and only if it lies in all but finitely many of the $A_{n}$.

Note that $\bigcap_{k=n}^{\infty} A_{k} \uparrow \lim \inf _{n} A_{n}$ and $\bigcup_{k=n}^{\infty} A_{k} \downarrow \lim \sup _{n} A_{n}$. For every $m$ and $n, \cap_{k=m}^{\infty} A_{k} \subset \cup_{k=n}^{\infty} A_{k}$, because for $i \geq \max \{m, n\}, A_{i}$ contains the first of these sets and is contained in the second. Taking the union over $m$ and the intersection over $n$ shows that (4.5) is a subset of (4.4). But this follows more easily from the observation that if $\omega$ lies in all but finitely many of the $A_{n}$ then of course it lies in infinitely many of them. Facts about limits inferior and superior can usually be deduced from the logic they involve more easily than by formal set-theoretic manipulations.

If (4.4) and (4.5) are equal, write

$$
\begin{equation*}
\lim _{n} A_{n}=\lim \inf _{n} A_{n}=\lim \sup A_{n} . \tag{4.6}
\end{equation*}
$$

To say that $A_{n}$ has limit $A$, written $A_{n} \rightarrow A$, means that the limits inferior and superior do coincide and in fact coincide with $A$. Since $\liminf _{n} A_{n} \subset \limsup _{n} A_{n}$ always holds, to check whether $A_{n} \rightarrow A$ is to check whether $\limsup _{n} A_{n} \subset A \subset \liminf _{n} A_{n}$. From $A_{n} \in \mathscr{F}$ and $A_{n} \rightarrow A$ follows $A \in \mathscr{F}$.

[^17]Example 4.1. Consider the functions $d_{n}(\omega)$ defined on the unit interval by the dyadic expansion (1.7), and let $l_{n}(\omega)$ be the length of the run of 0 's starting at $d_{n}(\omega): l_{n}(\omega)=k$ if $d_{n}(\omega)=\cdots=d_{n+k-1}(\omega)=0$ and $d_{n+k}(\omega)=1$; here $l_{n}(\omega)=0$ if $d_{n}(\omega)=1$. Probabilities can be computed by (1.10). Since $\left[\omega: l_{n}(\omega)=k\right]$ is a union of $2^{n-1}$ disjoint intervals of length $2^{-n-k}$, it lies in $\mathscr{F}$ and has probability $2^{-k-1}$. Therefore, $\left[\omega: l_{n}(\omega) \geq r\right]=\left[\omega: d_{i}(\omega)=0\right.$, $n \leq i<n+r]$ lies also in $\mathscr{F}$ and has probability $\sum_{k \geq r^{2}} 2^{-k-1}$ :

$$
\begin{equation*}
P\left[\omega: l_{n}(\omega) \geq r\right]=2^{-r} . \tag{4.7}
\end{equation*}
$$

If $A_{n}$ is the event in (4.7), then (4.4) is the set of $\omega$ such that $l_{n}(\omega) \geq r$ for infinitely many $n$, or, $n$ being regarded as a time index, such that $l_{n}(\omega) \geq r$ infinitely often.

Because of the theory of Sections 2 and 3, statements like (4.7) are valid in the sense of ordinary mathematics, and using the traditional language of probability-"neads," "runs," and so on-does not change this.

When $n$ has the role of time, (4.4) is frequently written

$$
\begin{equation*}
\lim \sup _{n} A_{n}=\left[A_{n} \text { i.o. }\right], \tag{4.8}
\end{equation*}
$$

where "i.o." stands for "infinitely often."

Theorem 4.1. (i) For each sequence $\left\{A_{n}\right\}$,

$$
\begin{align*}
P\left(\lim \inf _{n} A_{n}\right) & \leq \lim \inf _{n} P\left(A_{n}\right)  \tag{4.9}\\
& \leq \lim \sup _{n} P\left(A_{n}\right) \leq P\left(\lim \sup _{n} A_{n}\right) .
\end{align*}
$$

(ii) If $A_{n} \rightarrow A$, then $P\left(A_{n}\right) \rightarrow P(A)$.

Proof. Clearly (ii) follows from (i). As for (i), if $B_{n}=\bigcap_{k=n}^{\infty} A_{k}$ and $C_{n}=\cup_{k=n}^{\infty} A_{k}$, then $B_{n} \uparrow \liminf \inf _{n} A_{n}$ and $C_{n} \downarrow \limsup \sup _{n} A_{n}$, so that, by parts (i) and (ii) of Theorem 2.1, $P\left(A_{n}\right) \geq P\left(B_{n}\right) \rightarrow P\left(\liminf _{n} A_{n}\right)$ and $P\left(A_{n}\right) \leq P\left(C_{n}\right) \rightarrow P\left(\limsup \sin _{n}\right)$. $\square$

Example 4.2. Define $l_{n}(\omega)$ as in Example 4.1, and let $A_{n}=\left[\omega: l_{n}(\omega) \geq r\right]$ for fixed $r$. By (4.7) and (4.9), $P\left[\omega: l_{n}(\omega) \geq r\right.$ i.o. $] \geq 2^{-r}$. Much stronger results will be proved later. $\square$

## Independent Events

Events $A$ and $B$ are independent if $P(A \cap B)=P(A) P(B)$. (Sometimes an unnecessary mutually is put in front of independent.) For events of positive
probability, this is the same thing as requiring $P(B \mid A)=P(B)$ or $P(A \mid B)= P(A)$. More generally, a finite collection $A_{1}, \ldots, A_{n}$ of events is independent if

$$
\begin{equation*}
P\left(A_{k_{1}} \cap \cdots \cap A_{k_{i}}\right)=P\left(A_{k_{1}}\right) \cdots P\left(A_{k_{j}}\right) \tag{4.10}
\end{equation*}
$$

for $2 \leq j \leq n$ and $1 \leq k_{1}<\cdots<k_{j} \leq n$. Reordering the sets clearly has no effect on the condition for independence, and a subcollection of independent events is also independent. An infinite (perhaps uncountable) collection of events is defined to be independent in each of its finite subcollections is.

If $n=3$, (4.10) imposes for $j=2$ the three constraints

$$
\begin{gather*}
P\left(A_{1} \cap A_{2}\right)=P\left(A_{1}\right) P\left(A_{2}\right), \quad P\left(A_{1} \cap A_{3}\right)=P\left(A_{1}\right) P\left(A_{3}\right)  \tag{4.11}\\
P\left(A_{2} \cap A_{3}\right)=P\left(A_{2}\right) P\left(A_{3}\right)
\end{gather*}
$$

and for $j=3$ the single constraint

$$
\begin{equation*}
P\left(A_{1} \cap A_{2} \cap A_{3}\right)=P\left(A_{1}\right) P\left(A_{2}\right) P\left(A_{3}\right) \tag{4.12}
\end{equation*}
$$

Example 4.3. Consider in the unit interval the events $B_{u t}=\left[\omega: d_{u}(\omega)=\right. \left.d_{1}(\omega)\right]$-the $u$ th and $v$ th tosses agree-and let $A_{1}=B_{12}, A_{2}=B_{13}, A_{3}=B_{23}$. Then $A_{1}, A_{2}, A_{3}$ are pairwise independent in the sense that (4.11) holds (the two sides of each equation being $\frac{1}{4}$ ). But since $A_{1} \cap A_{2} \subset A_{3}$, (4.12) does not hold (the left side is $\frac{1}{4}$ and the right is $\frac{1}{8}$ ), and the events are not independent.

Example 4.4. In the discrete space $\Omega=\{1, \ldots, 6\}$ suppose each point has probability $\frac{1}{6}$ (a fair die is rolled). If $A_{1}=\{1,2,3,4)$ and $A_{2}=A_{3}=\{4,5,6\}$, then (4.12) holds but none of the equations in (4.11) do. Again the events are not independent.

Independence requires that (4.10) hold for each $j=2, \ldots, n$ and each choice of $k_{1}, \ldots, k_{j}$, a total of $\sum_{j=2}^{n}\binom{n}{j}=2^{n}-1-n$ constraints. This requirement can be stated in a different way: If $B_{1}, \ldots, B_{n}$ are sets such that for each $i=1, \ldots, n$ either $B_{i}=A_{i}$ or $B_{i}=\Omega$, then

$$
\begin{equation*}
P\left(B_{1} \cap B_{2} \cap \cdots \cap B_{n}\right)=P\left(B_{1}\right) P\left(B_{2}\right) \cdots P\left(B_{n}\right) . \tag{4.13}
\end{equation*}
$$

The point is that if $B_{i}=\Omega$, then $B_{i}$ can be ignored in the intersection on the left and the factor $P\left(B_{i}\right)=1$ can be ignored in the product on the right. For example, replacing $A_{2}$ by $\Omega$ reduces (4.12) to the middle equation in (4.11).

From the assumed independence of certain sets it is possible to deduce the independence of other sets.

Example 4.5. On the unit interval the events $H_{n}=\left[\omega: d_{n}(\omega)=0\right], n= 1,2, \ldots$, are independent, the two sides of (4.10) having in this case value $2^{-j}$. It seems intuitively clear that from this should follow the independence, for example, of $\left[\omega: d_{2}(\omega)=0\right]=H_{2}$ and $\left[\omega: d_{1}(\omega)=0, d_{3}(\omega)=1\right]=H_{1} \cap H_{3}^{c}$, since the two events involve disjoint sets of times. Further, any sets $A$ and $B$ depending, respectively, say, only on even and on odd times (like $\left[\omega: d_{2 n}(\omega)=0\right.$ i.o. $]$ and $\left[\omega: d_{2 n+1}(\omega)=1\right.$ i.o. $]$ ) ought also to be independent. This raises the general question of what it means for $A$ to depend only on even times. Intuitively, it requires that knowing which ones among $H_{2}, H_{4}, \ldots$ occurred entails knowing whether or not $A$ occurred-that is, it requires that the sets $H_{2}, H_{4}, \ldots$ "determine" $A$. The set-theoretic form of this requirement is that $A$ is to lie in the $\sigma$-field generated by $H_{2}, H_{4}, \ldots$. From $A \in \sigma\left(H_{2}, H_{4}, \ldots\right)$ and $B \in \sigma\left(H_{1}, H_{3}, \ldots\right)$ it ought to be possible to deduce the independence of $A$ and $B$. $\square$

The next theorem and its corollaries make such deductions possible. Define classes $\mathscr{A}_{1}, \ldots, \mathscr{A}_{n}$ in the basic $\sigma$-field $\mathscr{F}$ to be independent if for each choice of $A_{i}$ from $\mathscr{A}_{i}, i=1, \ldots, n$, the events $A_{1}, \ldots, A_{n}$ are independent. This is the same as requiring that (4.13) hold whenever for each $i$, $1 \leq i \leq n$, either $B_{i} \in \mathscr{A}_{i}$ or $B_{i}=\Omega$.

Theorem 4.2. If $\mathscr{A}_{1}, \ldots, \mathscr{A}_{n}$ are independent and each $\mathscr{A}_{i}$ is a $\pi$-system, then $\sigma\left(\mathscr{A}_{1}\right), \ldots, \sigma\left(\mathscr{A}_{n}\right)$ are independent.

Proof. Let $\mathscr{B}_{i}$ be the class $\mathscr{A}_{i}$ augmented by $\Omega$ (which may be an element of $\mathscr{A}_{i}$ to start with). Then each $\mathscr{B}_{i}$ is a $\pi$-system, and by the hypothesis of independence, (4.13) holds if $B_{i} \in \mathscr{B}_{i}, i=1, \ldots, n$. For fixed sets $B_{2}, \ldots, B_{n}$ lying respectively in $\mathscr{B}_{2}, \ldots, \mathscr{B}_{n}$, let $\mathscr{L}$ be the class of $\mathscr{F}$-sets $B_{1}$ for which (4.13) holds. Then $\mathscr{L}^{\mathscr{D}}$ is a $\lambda$-system containing the $\pi$-system $\mathscr{B}_{1}$ and hence (Theorem 3.2) containing $\sigma\left(\mathscr{B}_{1}\right)=\sigma\left(\mathscr{A}_{1}\right)$. Therefore, (4.13) holds if $B_{1}, B_{2}, \ldots, B_{n}$ lie respectively in $\sigma\left(\mathscr{A}_{1}\right), \mathscr{B}_{2}, \ldots, \mathscr{B}_{n}$, which means that $\sigma\left(\mathscr{A}_{1}\right), \mathscr{A}_{2}, \ldots, \mathscr{A}_{n}$ are independent. Clearly the argument goes through if 1 is replaced by any of the indices $2, \ldots, n$.

From the independence of $\sigma\left(\mathscr{A}_{1}\right), \mathscr{A}_{2}, \ldots, \mathscr{A}_{n}$ now follows that of $\sigma\left(\mathscr{A}_{1}\right), \sigma\left(\mathscr{A}_{2}\right), \mathscr{A}_{3}, \ldots, \mathscr{A}_{n}$, and so on. $\square$

If $\mathscr{A}=\left\{A_{1}, \ldots, A_{k}\right\}$ is finite, then each $A$ in $\sigma(\mathscr{A})$ can be expressed by a "formula" such as $A=A_{2} \cap A_{5}^{c}$ or $A=\left(A_{2} \cap A_{7}\right) \cup\left(A_{3} \cap A_{7}^{c} \cap A_{8}\right)$. If $\mathscr{A}$ is infinite, the sets in $\sigma(\mathscr{A})$ may be very complicated; the way to make precise the idea that the elements of $\mathscr{A}$ "determine" $A$ is not to require formulas, but simply to require that $A$ lie in $\sigma(\mathscr{A})$.

Independence for an infinite collection of classes is defined just as in the finite case: $\left[\mathscr{A}_{\theta}: \theta \in \Theta\right]$ is independent if the collection $\left[A_{\theta}: \theta \in \Theta\right]$ of sets is independent for each choice of $A_{\theta}$ from $\mathscr{A}_{\theta}$. This is equivalent to the independence of each finite subcollection $\mathscr{A}_{\theta_{1}}, \ldots, \mathscr{A}_{\theta_{n}}$ of classes, because of
the way independence for infinite classes of sets is defined in terms of independence for finite classes. Hence Theorem 4.2 has an immediate consequence:

Corollary 1. If $\mathscr{A}_{\theta}, \theta \in \Theta$, are independent and each $\mathscr{S}_{\theta}$ is a $\pi$-system, then $\sigma\left(\mathscr{A}_{\theta}\right), \theta \in \Theta$, are independent.

Corollary 2. Suppose that the array

$$
\begin{array}{ccc}
A_{11} & A_{12} & \cdots  \tag{4.14}\\
A_{21} & A_{22} & \cdots \\
\vdots & \vdots &
\end{array}
$$

of events is independent; here each row is a finite or infinite sequence, and there are finitely or infinitely many rows. If $\mathscr{F}_{i}$ is the $\sigma$-field generated by the $i$ th row, then $\mathscr{F}_{1}, \mathscr{F}_{2}, \ldots$ are independent.

Proof. If $\mathscr{A}_{i}$ is the class of all finite intersections of elements of the $i$ th row of (4.14), then $\mathscr{A}_{i}$ is a $\pi$-system and $\sigma\left(\mathscr{L}_{i}\right)=\mathscr{F}_{i}$. Let $I$ be a finite collection of indices (integers), and for each $i$ in $I$ let $J_{i}$ be a finite collection of indices. Consider for $i \in I$ the element $C_{i}=\bigcap_{j \in J_{i}} A_{i j}$ of $\mathscr{A}_{i}$. Since every finite subcollection of the array (4.14) is independent (the intersections and products here extend over $i \in I$ and $j \in J_{i}$ ),

$$
\begin{aligned}
P\left(\bigcap_{i} C_{i}\right) & =P\left(\bigcap_{i} \bigcap_{j} A_{i j}\right)=\prod_{i} \prod_{j} P\left(A_{i j}\right)=\prod_{i} P\left(\bigcap_{j} A_{i j}\right) \\
& =\prod_{i} P\left(C_{i}\right)
\end{aligned}
$$

It follows that the classes $\mathscr{A}_{1}, \mathscr{L}_{2}, \ldots$ are independent, so that Corollary 1 applies. $\square$

Corollary 2 implies the independence of the events discussed in Example 4.5. The array (4.14) in this case has two rows:

$$
\begin{array}{cccc}
H_{2} & H_{4} & H_{6} & \cdots \\
H_{1} & H_{3} & H_{5} & \cdots
\end{array}
$$

Theorem 4.2 also implies, for example, that for independent $A_{1}, \ldots, A_{n}$,

$$
\begin{align*}
& P\left(A_{1}^{c} \cap \cdots \cap A_{k}^{c} \cap A_{k+1} \cap \cdots \cap A_{n}\right)  \tag{4.15}\\
& \quad=P\left(A_{1}^{c}\right) \cdots P\left(A_{k}^{c}\right) P\left(A_{k+1}\right) \cdots P\left(A_{n}\right)
\end{align*}
$$

To prove this, let $\mathscr{A}_{i}$ consist of $A_{i}$ alone; of course, $A_{i}^{c} \in \sigma\left(\mathscr{A}_{i}\right)$. In (4.15) any subcollection of the $A_{i}$ could be replaced by their complements.

Example 4.6. Consider as in Example 4.3 the events $B_{u,}$ that, in a sequence of tosses of a fair coin, the $u$ th and $v$ th outcomes agree. Let $\mathscr{A}_{1}$ consist of the events $B_{12}$ and $B_{13}$, and let $\mathscr{A}_{2}$ consist of the event $B_{23}$. Since these three events are pairwise independent, the classes $\mathscr{A}_{1}$ and $\mathscr{S}_{2}$ are independent. Since $B_{23}=\left(B_{12} \Delta B_{13}\right)^{c}$ lies in $\sigma\left(\mathscr{A}_{1}\right)$, however, $\sigma\left(\mathscr{A}_{1}\right)$ and $\sigma\left(\mathscr{A}_{2}\right)$ are not independent. The trouble is that $\mathscr{A}_{1}$ is not a $\pi$-systern, which shows that this condition in Theorem 4.2 is essential. $\square$

Example 4.7. If $\mathscr{A}=\left\{A_{1}, A_{2}, \ldots\right\}$ is a finite or countable partition of $\Omega$ and $P\left(B \mid A_{i}\right)=p$ for each $A_{i}$ of positive probability, then $P(B)=p$ and $B$ is independent of $\sigma(\mathscr{A})$ : If $\Sigma^{\prime}$ denotes summation over those $i$ for which $P\left(A_{i}\right)>0$, then $P(B)=\sum^{\prime} P\left(A_{i} \cap B\right)=\sum^{\prime} P\left(A_{i}\right) p=p$, and so $B$ is independent of each set in the $\pi$-system $\mathscr{A} \cup\{\varnothing\}$. $\square$

## Subfields

Theorem 4.2 involves a number of $\sigma$-fields at once, which is characteristic of probability theory; measure theory not directed toward probability usually involves only one all-embracing $\sigma$-field $\mathscr{F}$. In proability, $\sigma$-fields in $\mathscr{F}$-that is, sub- $\sigma$-fields of $\mathscr{F}$-play an important role. To understand their function it helps to have an informal, intuitive way of looking at them.

A subclass $\mathscr{A}$ of $\mathscr{F}$ corresponds heuristically to partial information. Imagine that a point $\omega$ is drawn from $\Omega$ according to the probabilities given by $P: \omega$ lies in $A$ with probability $P(A)$. Imagine also an observer who does not know which $\omega$ it is that has been drawn but who does know for each $A$ in $\mathscr{A}$ whether $\omega \in A$ or $\omega \notin A$-that is, who does not know $\omega$ but does know the value of $I_{A}(\omega)$ for each $A$ in $\mathscr{A}$. Identifying this partial information with the class $\mathscr{A}$ itself will illuminate the connection between various measuretheoretic concepts and the premathematical ideas lying behind them.

The set $B$ is by definition independent of the class $\mathscr{A}$ if $P(B \mid A)=P(B)$ for all sets $A$ in $\mathscr{A}$ for which $P(A)>0$. Thus if $B$ is independent of $\mathscr{A}$, then the observer's probability for $B$ is $P(B)$ even after he has received the information in $\mathscr{A}$; in this case $\mathscr{A}$ contains no information about $B$. The point of Theorem 4.2 is that this remains true even if the observer is given the information in $\sigma(\mathscr{A})$, provided that $\mathscr{A}$ is a $\pi$-system. It is to be stressed that here information, like observer and know, is an informal, extramathematical term (in particular, it is not information in the technical sense of entropy).

The notion of partial information can be looked at in terms of partitions. Say that points $\omega$ and $\omega^{\prime}$ are $\mathscr{A}$-equivalent if, for every $A$ in $\mathscr{A}, \omega$ and $\omega^{\prime}$ lie
either both in $A$ or both in $A^{c}$-that is, if

$$
\begin{equation*}
I_{A}(\omega)=I_{A}\left(\omega^{\prime}\right), \quad A \in \mathscr{L} \tag{4.16}
\end{equation*}
$$

This relation partitions $\Omega$ into sets of equivalent points; call this the $\mathscr{L}$ partition.

Example 4.8. If $\omega$ and $\omega^{\prime}$ are $\sigma(\mathscr{A})$-equivalent, then certainly they are $\mathscr{A}$-equivalent. For fixed $\omega$ and $\omega^{\prime}$, the class of $A$ such that $I_{A}(\omega)=I_{A}\left(\omega^{\prime}\right)$ is a $\sigma$-field; if $\omega$ and $\omega^{\prime}$ are $\mathscr{A}$-equivalent, then this $\sigma$-field contains $\mathscr{A}$ and hence $\sigma(\mathscr{A})$, so that $\omega$ and $\omega^{\prime}$ are also $\sigma(\mathscr{A})$-equivalent. Thus $\mathscr{A}$-equivalence and $\sigma(\mathscr{A})$-equivalence are the same thing, and the $\mathscr{A}$-partition coincides with the $\sigma(\mathscr{A})$-partition.

An observer with the information in $\sigma(\mathscr{A})$ knows, not the point $\omega$ drawn, but only the equivalence class containing it. That is exactly the information he has. In Example 4.6, it is as though an observer with the items of information in $\mathscr{A}_{1}$ were unable to combine them to get information about $B_{23}$.

Example 4.9. If $H_{n}=\left[\omega: d_{n}(\omega)=0\right]$ as in Example 4.5, and if $\mathscr{A}= \left\{H_{1}, H_{3}, H_{5}, \ldots\right\}$, then $\omega$ and $\omega^{\prime}$ satisfy (4.16) if and only if $d_{n}(\omega)=d_{n}\left(\omega^{\prime}\right)$ for all odd $n$. The information in $\sigma(\mathscr{A})$ is thus the set of values of $d_{n}(\omega)$ for $n$ odd.

One who knows that $\omega$ lies in a set $A$ has more information about $\omega$ the smaller $A$ is. One who knows $I_{A}(\boldsymbol{\omega})$ for each $A$ in a class $\mathscr{A}$, however, has more information about $\omega$ the larger $\mathscr{A}$ is. Furthermore, to have the information in $\mathscr{A}_{1}$ and the information in $\mathscr{A}_{2}$ is to have the information in $\mathscr{A}_{1} \cup \mathscr{A}_{2}$, not that in $\mathscr{A}_{1} \cap \mathscr{A}_{2}$.

The following example points up the informal nature of this interpretation of $\sigma$-fields as information.

Example 4.10. In the unit interval ( $\Omega, \mathscr{F}, P$ ) let $\mathscr{A}$ be the $\sigma$-field consisting of the countable and the cocountable sets. Since $P(G)$ is 0 or 1 for each $G$ in $\mathscr{G}$, each set $H$ in $\mathscr{F}$ is independent of $\mathscr{G}$. But in this case the $\mathscr{A}$ partition consists of the singletons, and so the information in $\mathscr{A}$ tells the observer exactly which $\omega$ in $\Omega$ has been drawn. (i) The $\sigma$-field $\mathscr{G}$ contains no information about $H$-in the sense that $H$ and $\mathscr{G}$ are independent. (ii) The $\sigma$-field $\mathscr{A}$ contains all the information about $H$-in the sense that it tells the observer exactly which $\omega$ was drawn.

In this example, (i) and (ii) stand in apparent contradiction. But the mathematics is in (i)- $H$ and $\mathscr{I}$ are independent-while (ii) only concerns heuristic interpretation. The source of the difficulty or apparent paradox here lies in the unnatural structure of the $\sigma$-field $\mathscr{I}$ rather than in any deficiency in the notion of independence. ${ }^{\dagger}$ The heuristic equating of $\sigma$-fields and information is helpful even though it sometimes
${ }^{\dagger}$ See Problem 4.10 for a more extreme example
breaks down, and of course proofs are indifferent to whatever illusions and vagaries brought them into existence.

## The Borel-Cantelli Lemmas

This is the first Borel-Cantelli lemma:
Theorem 4.3. If $\sum_{n} P\left(A_{n}\right)$ converges, then $P\left(\limsup _{n} A_{n}\right)=0$.
Proof. From $\limsup \sup _{n} \subset \bigcup_{k=m}^{\infty} A_{k}$ follows $P\left(\limsup A_{n}\right) \leq P\left(\bigcup_{k=m}^{\infty} A_{k}\right) \leq \sum_{k=m}^{\infty} P\left(A_{k}\right)$, and this sum tends to 0 as $m \rightarrow \infty$ if $\sum_{n} P\left(A_{n}\right)$ converges. $\square$

By Theorem 4.1, $P\left(A_{n}\right) \rightarrow 0$ implies that $P\left(\liminf _{n} A_{n}\right)=0 ;$ in Theorem 4.3 hypothesis and conclusion are both stronger.

Example 4.11. Consider the run length $l_{n}(\omega)$ of Example 4.1 and a sequence $\left\{r_{n}\right\}$ of positive reals. If the series $\sum 1 / 2^{r_{n}}$ converges, then

$$
\begin{equation*}
P\left[\omega: l_{n}(\omega) \geq r_{n} \text { i.o. }\right]=0 . \tag{4.17}
\end{equation*}
$$

To prove this, note that if $s_{n}$ is $r_{n}$ rounded up to the next integer, then by (4.7), $P\left[\omega: l_{n}(\omega) \geq r_{n}\right]=2^{-s_{n}} \leq 2^{-r_{n}}$. Therefore, (4.17) follows by the first Borel-Cantelli lemma.

If $r_{n}=(1+\epsilon) \log _{2} n$ and $\epsilon$ is positive, there is convergence because $2^{-r_{n}}=1 / n^{1+\epsilon}$. Thus

$$
\begin{equation*}
P\left[\omega: l_{n}(\omega) \geq(1+\epsilon) \log _{2} n \text { i.o. }\right]=0 . \tag{4.18}
\end{equation*}
$$

The limit superior of the ratio $l_{n}(\omega) / \log _{2} n$ exceeds 1 if and only if $\omega$ belongs to the set in (4.18) for some positive rational $\epsilon$. Since the union of this countable class of sets has probability 0 ,

$$
\begin{equation*}
P\left[\omega: \limsup \frac{l_{n}(\omega)}{\log _{2} n}>1\right]=0 . \tag{4.19}
\end{equation*}
$$

To put it the other way around,

$$
\begin{equation*}
P\left[\omega: \lim \sup _{n} \frac{l_{n}(\omega)}{\log _{2} n} \leq 1\right]=1 . \tag{4.20}
\end{equation*}
$$

Technically, the probability in (4.20) refers to Lebesgue measure. Intuitively, it refers to an infinite sequence of independent tosses of a fair coin. $\square$

In this example, whether $\limsup _{n} l_{n}(\omega) / \log _{2} n \leq 1$ holds or not is a property of $\omega$, and the property in fact holds for $\omega$ in an $\mathscr{F}$-set of probability

1. In such a case the property is said to hold with probability 1 , or almost surely. In nonprobabilistic contexts, a property that holds for $\omega$ outside a (measurable) set of measure 0 holds almost everywhere, or for almost all $\omega$.

Example 4.12. The preceding example has an interesting arithmetic consequence. Truncating the dyadic expansion at $n$ gives the standard ( $n-1$ )-place approximation $\sum_{k=1}^{n-1} d_{k}(\omega) 2^{-k}$ to $\omega$; the error is between 0 and $2^{-n+1}$, and the error relative to the maximum is

$$
\begin{equation*}
e_{1}(\omega)=\frac{\omega-\sum_{k=1}^{n=1} d_{k}(\omega) 2^{-k}}{2^{-n+1}}=\sum_{i=1}^{\infty} d_{n+i-1}(\omega) 2^{-i}, \tag{421}
\end{equation*}
$$

which lies between 0 and 1 . The binary expansion of $e_{n}(\omega)$ begins with $l_{n}(\omega)$ 0's, and then comes a 1 Hence $.0 .01 \leq e_{n}(\omega) \leq .0 \ldots 0111 \ldots$, where there are $l_{n}(\omega) 0$ 's in the extreme terms. Therefore,

$$
\begin{equation*}
\frac{1}{2^{i_{n}(\omega)+1}} \leq e_{n}(\omega) \leq \frac{1}{2^{l_{n}(\omega)}}, \tag{4.22}
\end{equation*}
$$

so that results on run length give information about the eiror of approximation.
By the left-hand inequality in (4.22), $e_{n}(\omega) \leq x_{n}$ (assume that $0<x_{n} \leq 1$ ) implies that $l_{n}(\omega) \geq-\log _{2} x_{n}-1$; since $\sum 2^{-r_{n}}<\infty$ implies (4.17), $\sum x_{n}<\infty$ implies $P[\omega$ : $e_{n}(\omega) \leq x_{n}$ i.o. $]=0$. (Clearly, $\left[\omega: e_{n}(\omega) \leq x\right]$ is a Borel set) In particular,

$$
\begin{equation*}
P\left[\omega: e_{n}(\omega) \leq 1 / n^{1+\epsilon} \text { i.o. }\right]=0 . \tag{4.23}
\end{equation*}
$$

Technically, this probability refers to Lebesgue measure; intuitively, it refers to a point drawn at random from the unit interval.

Example 4.13. The final step in the proof of the normal number theorem (Theorem 1.2) was a disguised application of the first Borel-Cantelli lemma. If $A_{n}=\left[\omega:\left|n^{-1} s_{n}(\omega)\right| \geq n^{-1 / 8}\right]$, then $\sum P\left(A_{n}\right)<\infty$, as follows by (1.29), and so $P\left[A_{n}\right.$ i.o. $]=0$. But for $\omega$ in the set complementary to $\left[A_{n}\right.$ i.o. $], n^{-1} s_{n}(\omega) \rightarrow 0$.

The proof of Theorem 1.6 is also, in effect, an application of the first Borel-Cantelli lemma.

## This is the second Borel-Cantelli lemma:

Theorem 4.4. If $\left\{A_{n}\right\}$ is an independent sequence of events and $\sum_{n} P\left(A_{n}\right)$ diverges, then $P\left(\limsup _{n} A_{n}\right)=1$.

Proof. It is enough to prove that $P\left(\cup_{n=1}^{\infty} \cap_{k=n}^{\infty} A_{k}^{c}\right)=0$ and hence enough to prove that $P\left(\cap_{k=n}^{\infty} A_{k}^{c}\right)=0$ for all $n$. Since $1-x \leq e^{-x}$,

$$
P\left(\bigcap_{k=n}^{n+j} A_{k}^{c}\right)=\prod_{k=n}^{n+j}\left(1-P\left(A_{k}\right)\right) \leq \exp \left[-\sum_{k=n}^{n+j} P\left(A_{k}\right)\right] .
$$

Since $\Sigma_{k} P\left(A_{k}\right)$ diverges, the last expression tends to 0 as $j \rightarrow \infty$, and hence $P\left(\cap_{k=n}^{\infty} A_{k}^{c}\right)=\lim _{j} P\left(\cap_{k=n}^{n+j} A_{k}^{c}\right)=0$.

By Theorem 4.1, $\limsup \sup _{n} P\left(A_{n}\right)>0$ implies $P\left(\limsup _{n} A_{n}\right)>0$; in Theorem 4.4 , the hypothesis $\sum_{n} P\left(A_{n}\right)=\infty$ is weaker but the conclusion is stronger because of the additional hypothesis of independence.

Example 4.14. Since the events $\left[\omega: l_{n}(\omega)=0\right]=\left[\omega: d_{n}(\omega)=1\right], n= 1,2, \ldots$, are independent and have probability $\frac{1}{2}, P\left[\omega: l_{n}(\omega)=0\right.$ i.o. $]=1$.

Since the events $A_{n}=\left[\omega: l_{n}(\omega)=1\right]=\left[\omega: d_{n}(\omega)=0, d_{n+1}(\omega)=1\right], n= 1,2, \ldots$, are not independent, this argument is insufficient to prove that

$$
\begin{equation*}
P\left[\omega: l_{n}(\omega)=1 \text { i.o. }\right]=1 . \tag{4.24}
\end{equation*}
$$

But the events $A_{2}, A_{4}, A_{6}, \ldots$ are independent (Theorem 4.2) and their probabilities form a divergent series, and so $P\left[\omega: l_{2 n}(\omega)=1\right.$ i.o. $]=1$, which implies (4.24). $\square$

Significant applications of the second Borel-Cantelli lemma usually require, in order to get around problems of dependence, some device of the kind used in the preceding example.

Example 4.15. There is a complement to (4.17): If $r_{n}$ is nondecreasing and $\sum 2^{-r_{n}} / r_{n}$ diverges, then

$$
\begin{equation*}
P\left[\omega: l_{n}(\omega) \geq r_{n} \text { i.o. }\right]=1 . \tag{4.25}
\end{equation*}
$$

To prove this, note first that if $r_{n}$ is rounded up to the next integer, then $\sum 2^{-r_{n}} / r_{n}$ still diverges and (4.25) is unchanged. Assume then that $r_{n}=r(n)$ is integral, and define $\left\{n_{k}\right\}$ inductively by $n_{1}=1$ and $n_{k+1}=n_{k}+r_{n_{k}}, k \geq 1$. Let $A_{k}=\left[\omega: l_{n_{k}}(\omega) \geq r_{n_{k}}\right]=\left[\omega: d_{i}(\omega)=0, n_{k} \leq i<n_{k+1}\right]$; since the $A_{k}$ involve nonoverlapping sequences of time indices, it follows by Corollary 2 to Theorem 4.2 that $A_{1}, A_{2}, \ldots$ are independent. By the second Borel-Cantelli lemma, $P\left[A_{k}\right.$ i.o. $]=1$ if $\sum_{k} P\left(A_{k}\right)=\sum_{k} 2^{-r\left(n_{k}\right)}$ diverges. But since $r_{n}$ is nondecreasing,

$$
\begin{aligned}
\sum_{k \geq 1} 2^{-r\left(n_{k}\right)} & =\sum_{k \geq 1} 2^{-r\left(n_{k}\right)} r^{-1}\left(n_{k}\right)\left(n_{k+1}-n_{k}\right) \\
& \geq \sum_{k \geq 1} \sum_{n_{k} \leq n<n_{k+1}} 2^{-r_{n}} r_{n}^{-1}=\sum_{n \geq 1} 2^{-r_{n}} r_{n}^{-1} .
\end{aligned}
$$

Thus the divergence of $\sum_{n} 2^{-r_{n}} r_{n}^{-1}$ implies that of $\sum_{k} 2^{-r\left(n_{k}\right)}$, and it follows that, with probability $1, l_{n_{k}}(\omega) \geq r_{n_{k}}$ for infinitely many values of $k$. But this is stronger than (4.25).

The result in Example 4.2 follows if $r_{n} \equiv r$, but this is trivial. If $r_{n}=\log _{2} n$, then $\Sigma 2^{-r_{n}} / r_{n}=\Sigma 1 /\left(n \log _{2} n\right)$ diverges, and therefore

$$
\begin{equation*}
P\left[\omega: l_{n}(\omega) \geq \log _{2} n \text { i.o. }\right]=1 . \tag{4.26}
\end{equation*}
$$

By (4.26) and (4.20),

$$
\begin{equation*}
P\left[\omega: \lim \sup _{n} \frac{l_{n}(\omega)}{\log _{2} n}=1\right]=1 . \tag{4.27}
\end{equation*}
$$

Thus for $\omega$ in a set of probability $1, \log _{2} n$ as a function of $n$ is a kind of "upper envelope" for the function $\dot{l}_{n}(\omega)$.

Example 4.16. By the right-hand inequality in (4.22), if $l_{n}(\omega) \geq \log _{2} n$, then $e_{n}(\omega) \leq 1 / n$. Hence (4.26) gives

$$
\begin{equation*}
p\left[\omega: e_{n}(\omega) \leq \frac{1}{n} \text { i.o. }\right]=1 . \tag{4.28}
\end{equation*}
$$

This and (4.23) show that, with probability $1, e_{n}(\omega)$ has $1 / n$ as a "lower envelope." The discrepancy between $\omega$ and its ( $n-1$ )-place approximation $\sum_{k=1}^{n-1} d_{k}(\omega) 2^{-k}$ will fall infinitely often below $1 /\left(n 2^{n-1}\right)$ but not infinitely often below $1 /\left(n^{1+\epsilon} 2^{n-1}\right)$. $\square$

Example 4.17. Examples 4.12 and 4.16 have to do with the approximation of real numbers by rationals: Diophantine approximation. Change the $x_{n}=1 / n^{1+\epsilon}$ of (4.23) to $1 /((n-1) \log 2)^{1+\epsilon}$. Then $\sum x_{n}$ still converges, and hence

$$
P\left[\omega: e_{n}(\omega) \leq 1 /\left(\log 2^{n-1}\right)^{1+\epsilon} \text { i.o. }\right]=0 .
$$

And by (4.28),

$$
P\left[\omega: e_{n}(\omega)<1 / \log 2^{n-1} \text { i.o. }\right]=1 .
$$

The dyadic rational $\sum_{k=1}^{n-1} d_{k}(\omega) 2^{-k}=p / q$ has denominator $q=2^{n-1}$, and $e_{n}(\omega)= q(\omega-p / q)$. There is therefore probability 1 that, if $q$ is restricted to the powers of 2 , then $0 \leq \omega-p / q<1 /(q \log q)$ holds for infinitely many $p / q$ but $0 \leq \omega-p / q \leq 1 /\left(q \log ^{1+\epsilon} q\right)$ holds only for finitely many. ${ }^{\dagger}$ But contrast this with Theorems 1.5 and 1.6: The sharp rational approximations to a real number come not from truncating its dyadic (or decimal) expansion, but from truncating its continued-fraction expansion; see Section 24. $\square$

## The Zero-One Law

For a sequence $A_{1}, A_{2}, \ldots$ of events in a probability space $(\Omega, \mathscr{F}, P)$ consider the $\sigma$-fields $\sigma\left(A_{n}, A_{n+1}, \ldots\right)$ and their intersection

$$
\begin{equation*}
\mathscr{T}=\bigcap_{n=1}^{\infty} \sigma\left(A_{n}, A_{n+1}, \ldots\right) . \tag{4.29}
\end{equation*}
$$

[^18]This is the tail $\sigma$-field associated with the sequence $\left\{A_{n}\right\}$, and its elements are called tail events. The idea is that a tail event is determined solely by the $A_{n}$ for arbitrarily large $n$.

Example 4.18. Since $\limsup _{m} A_{m}=\bigcap_{k \geq n} \bigcup_{i \geq k} A_{i}$ and $\liminf _{m} A_{m}= \mathrm{U}_{k \geq n} \bigcap_{i \geq k} A_{i}$ are both in $\sigma\left(A_{n}, A_{n+1}, \ldots\right)$, the limits superior and inferior are tail events for the sequence $\left\{A_{n}\right\}$. $\square$

Example 4.19. Let $l_{n}(\omega)$ be the run length, as before, and let $H_{n}=[\omega$ : $\left.d_{n}(\omega)=0\right]$. For each $n_{0}$,

$$
\begin{aligned}
{\left[\omega: l_{n}(\omega) \geq r_{n} \text { i.o. }\right] } & =\bigcap_{n \geq n_{0}} \bigcup_{k \geq n}\left[\omega: l_{k}(\omega) \geq r_{k}\right] \\
& =\bigcap_{n \geq n_{0}} \bigcup_{k \geq n} H_{k} \cap H_{k+1} \cap \cdots \cap H_{k+r_{k}-1} .
\end{aligned}
$$

Thus $\left[\omega: l_{n}(\omega) \geq r_{n}\right.$ i.o. $]$ is a tail event for the sequence $\left\{H_{n}\right\}$. $\square$

The probabilities of tail events are governed by Kolmogorov's zero-one law: ${ }^{\dagger}$

Theorem 4.5. If $A_{1}, A_{2}, \ldots$ is an independent sequence of events, then for each event $A$ in the tail $\sigma$-field (4.29), $P(A)$ is either 0 or 1 .

Proof. By Corollary 2 to Theorem 4.2, $\sigma\left(A_{1}\right), \ldots, \sigma\left(A_{n-1}\right)$, $\sigma\left(A_{n}, A_{n+1}, \ldots\right)$ are independent. If $A \in \mathscr{T}$, then $A \in \sigma\left(A_{n}, A_{n+1}, \ldots\right)$ and therefore $A_{1}, \ldots, A_{n-1}, A$ are independent. Since independence of a collection of events is defined by independence of each finite subcollection, the sequence $A, A_{1}, A_{2}, \ldots$ is independent. By a second application of Corollary 2 to Theorem 4.2, $\sigma(A)$ and $\sigma\left(A_{1}, A_{2}, \ldots\right)$ are independent. But $A \in \mathscr{T} \subset \sigma\left(A_{1}, A_{2}, \ldots\right)$; from $A \in \sigma(A)$ and $A \in \sigma\left(A_{1}, A_{2}, \ldots\right)$ it follows that $A$ is independent of itself: $P(A \cap A)=P(A) P(A)$. This is the same as $P(A)= (P(A))^{2}$ and can hold only if $P(A)$ is 0 or 1 . $\square$

Example 4.20. By the zero-one law and Example 4.18, $P\left(\limsup \sup _{n}\right)$ is 0 or 1 if the $A_{n}$ are independent. The Borel-Cantelli lemmas in this case go further and give a specific criterion in terms of the convergence or divergence of $\sum P\left(A_{n}\right)$. $\square$

Kolmogorov's result is surprisingly general, and it is in many cases quite easy to use it to show that the probability of some set must have one of the extreme values 0 and 1 . It is perhaps curious that it should so often be very difficult to determine which of these extreme values is the right one.

[^19]Example 4.21. By Kolmogorov's theorem and Example 4.19, $\left[\omega: l_{n}(\omega) \geq r_{n}\right.$ i.o.] has probability 0 or 1 . Call the sequence $\left\{r_{n}\right\}$ an outer boundary or an inner boundary according as this probability is 0 or 1 .

In Example 4.11 it was shown that $\left\{r_{n}\right\}$ is an outer boundary if $\sum 2^{-r_{n}}<\infty$. In Example 4.15 it was shown that $\left\{r_{n}\right\}$ is an inner boundary if $r_{n}$ is nondecreasing and $\sum 2^{-r_{n}} r_{n}^{-1}=\infty$. By these criteria $r_{n}=\theta \log _{2} n$ gives an outer boundary if $\theta>1$ and an inner boundary if $\theta \leq 1$.

What about the sequence $r_{n}=\log _{2} n+\theta \log _{2} \log _{2} n$ ? Here $\sum 2^{-r_{n}}= \sum 1 / n\left(\operatorname{iog}_{2} n\right)^{\theta}$, and this converges for $\theta>1$, which gives an outer boundary. Now $2^{-r_{n}} r_{n}^{-1}$ is of the order $1 / n\left(\log _{2} n\right)^{1+\theta}$, and this diverges if $\theta \leq 0$, which gives an inner boundary (this follows indeed from (4.26)). But this analysis leaves the range $0<\theta \leq 1$ unresolved, although every sequence is either an inner or an outer boundary This question is pursued further in Example 6.5. $\square$

## PROBLEMS

4.1. $2.1 \uparrow$ The limits superior and inferior of a numerical sequence $\left\{x_{n}\right\}$ can be defined as the supremum and infimum of the set of limit points-that is, the set of limits of convergent subsequences. This is the same thing as defining

$$
\begin{equation*}
\lim \sup _{n} x_{n}=\bigwedge_{n=1}^{\infty} \bigvee_{k=n}^{\infty} x_{k} \tag{4.30}
\end{equation*}
$$

and

$$
\begin{equation*}
\lim \inf _{n} x_{n}=\bigvee_{n=1}^{\infty} \bigwedge_{k=n}^{\infty} x_{k} . \tag{4.31}
\end{equation*}
$$

Compare these relations with (4.4) and (4.5) and prove that

$$
I_{\limsup _{n} A_{n}}=\lim \sup _{n} I_{A_{n}}, \quad I_{\liminf _{n} A_{n}}=\lim \inf _{n} I_{A_{n}} .
$$

Prove that $\lim _{n} A_{n}$ exists in the sense of (4.6) if and only if $\lim _{n} I_{A_{n}}(\omega)$ exists for each $\omega$.
4.2. ↑ (a) Prove that

$$
\begin{aligned}
\left(\lim \sup _{n} A_{n}\right) \cap\left(\lim \sup _{n} B_{n}\right) & \supset \lim \sup _{n}\left(A_{n} \cap B_{n}\right), \\
\left(\lim \sup _{n} A_{n}\right) \cup\left(\lim \sup _{n} B_{n}\right) & =\lim \sup _{n}\left(A_{n} \cup B_{n}\right), \\
\left(\lim \inf _{n} A_{n}\right) \cap\left(\lim \inf _{n} B_{n}\right) & =\lim \inf _{n}\left(A_{n} \cap B_{n}\right), \\
\left(\lim \inf _{n} A_{n}\right) \cup\left(\lim \inf _{n} B_{n}\right) & \subset \lim \inf _{n}\left(A_{n} \cup B_{n}\right) .
\end{aligned}
$$

Show by example that the two inclusions can be strict.
(b) The numerical analogue of the first of the relations in part (a) is

$$
\left(\lim \sup _{n} x_{n}\right) \wedge\left(\lim \sup _{n} y_{n}\right) \geq \lim \sup _{n}\left(x_{n} \wedge y_{n}\right)
$$

Write out and verify the numerical analogues of the others.
(c) Show that

$$
\begin{aligned}
\lim \sup _{n} A_{n}^{c} & =\left(\lim \inf _{n} A_{n}\right)^{c} \\
\lim \inf _{n} A_{n}^{c} & =\left(\lim \sup _{n} A_{n}\right)^{c} \\
\lim \sup _{n} A_{n}-\lim \inf _{n} A_{n} & =\lim \sup _{n}\left(A_{n} \cap A_{n+1}^{c}\right) \\
& =\lim \sup _{n}\left(A_{n}^{c} \cap A_{n+1}\right)
\end{aligned}
$$

(d) Show that $A_{n} \rightarrow A$ and $B_{n} \rightarrow B$ together imply that $A_{n} \cup B_{n} \rightarrow A \cup B$ and $A_{n} \cap B_{n} \rightarrow A \cap B$.
4.3. Let $A_{n}$ be the square $[(x, y):|x| \leq 1,|y| \leq 1]$ rotated through the angle $2 \pi n \theta$. Give geometric descriptions of $\lim \sup _{n} A_{n}$ and $\liminf A_{n}$ in case
(a) $\theta=\frac{1}{8}$;
(b) $\theta$ is rational;
(c) $\theta$ is irrational. Hint: The $2 \pi n \theta$ reduced modulo $2 \pi$ are dense in $[0,2 \pi]$ if $\theta$ is irrational.
(d) When is there convergence is the sense of (4.6)?
4.4. Find a sequence for which all three inequalities in (4.9) are strict.
4.5. (a) Show that $\lim _{n} P\left(\lim \inf _{k} A_{n} \cap A_{k}^{c}\right)=0$. Hint: Show that $\limsup { }_{n} \liminf _{k} A_{n} \cap A_{k}^{c}$ is empty.

Put $A^{*}=\limsup A_{n}$ and $A_{*}=\liminf _{n} A_{n}$.
(b) Show that $P\left(A_{n}-A^{*}\right) \rightarrow 0$ and $P\left(A_{*}-A_{n}\right) \rightarrow 0$.
(c) Show that $A_{n} \rightarrow A$ (in the sense that $A=A^{*}=A_{*}$ ) implies $P\left(A \Delta A_{n}\right) \rightarrow 0$.
(d) Suppose that $A_{n}$ converges to $A$ in the weaker sense that $P\left(A \Delta A^{*}\right)= P\left(A \Delta A_{*}\right)=0$ (which implies that $P\left(A^{*}-A_{*}\right)=0$ ). Show that $P\left(A \Delta A_{n}\right) \rightarrow 0$ (which implies that $P\left(A_{n}\right) \rightarrow P(A)$ ).
4.6. In a space of six equally likely points (a die is rolled) find three events that are not independent even though each is independent of the intersection of the other two.
4.7. For events $A_{1}, \ldots, A_{n}$, consider the $2^{n}$ equations $P\left(B_{1} \cap \cdots \cap B_{n}\right)= P\left(B_{1}\right) \cdots P\left(B_{n}\right)$ with $B_{i}=A_{i}$ or $B_{i}=A_{i}^{c}$ for each $i$. Show that $A_{1}, \ldots, A_{n}$ are independent if all these equations hold.
4.8. For each of the following classes $\mathscr{A}$, describe the $\mathscr{A}$-partition defined by (4.16).
(a) The class of finite and cofinite sets.
(b) The class of countable and cocountable sets.
(c) A partition (of arbitrary cardinality) of $\Omega$.
(d) The level sets of $\sin x\left(\Omega=R^{1}\right)$.
(e) The $\sigma$-field in Problem 3.5.
4.9. $2.92 .10 \uparrow$ In connection with Example 4.8 and Problem 210 , prove these facts:
(a) Every set in $\sigma(\mathscr{A})$ is a union of $\mathscr{A}$-equivalence classes.
(b) If $\mathscr{A}=\left[A_{\theta}: \theta \in \Theta\right]$, then the $\mathscr{L}$-equivalence classes have the form $\cap_{\theta} B_{\theta}$, where for each $\theta, B_{\theta}$ is $A_{\theta}$ or $A_{\theta}^{c}$.
(c) Every finite $\sigma$-field is generated by a finite partition of $\Omega$.
(d) If $\mathscr{F}_{0}$ is a field, then each singleton, even each finite set, in $\sigma\left(\mathscr{F}_{0}\right)$ is a countable intersection of $\mathscr{F}_{0}$-sets.
4.10. $3.2 \uparrow$ There is in the unit interval a set $H$ that is nonmeasurable in the extrcme sense that its inner and outer Lebesgue measures are 0 and 1 (see (3.9) and (3.10)): $\lambda_{*}(H)=0$ and $\lambda^{*}(H)=1$. See Problem 12.4 for the construction

Let $\Omega=(0,1]$, let $\mathscr{G}$ consist of the Borel sets in $\Omega$, and let $H$ be the set just described. Show that the class $\mathscr{F}$ of sets of the form $\left(H \cap G_{1}\right) \cup\left(H^{c} \cap G_{2}\right)$ for $G_{1}$ and $G_{2}$ in $\mathscr{E}$ is a $\sigma$-field and that $P\left[\left(H \cap G_{1}\right) \cup\left(H^{c} \cap G_{2}\right)\right]=\frac{1}{2} \lambda\left(G_{1}\right)+ \frac{1}{2} \lambda\left(G_{2}\right)$ consistently defines a probability measure on $\mathscr{F}$. Show that $P(H)=\frac{1}{2}$ and that $P(G)=\lambda(G)$ for $G \in \mathscr{A}$. Show that $\mathscr{I}$ is generated by a countable subclass (see Problem 2.11). Show that $\mathscr{A}$ contains all the singletons and that $H$ and $\mathscr{G}$ are independent.

The construction proves this: There exist a probability space $(\Omega, \mathscr{F}, P)$, a $\sigma$-field $\mathscr{G}$ in $\mathscr{F}$, and a set $H$ in $\mathscr{F}$, such that $P(H)=\frac{1}{2}, H$ and $\mathscr{I}$ are independent, and $\mathscr{I}$ is generated by a countable subclass and contains all the singletons.

Example 4.10 is somewhat similar, but there the $\sigma$-fieid $\mathscr{G}$ is not countably generated and each set in it has probability either 0 or 1 . In the present example $\mathscr{G}$ is countably generated and $P(G)$ assumes every value between 0 and 1 as $G$ ranges over $\mathscr{G}$. Example 4.10 is to some extent unnatural because the $\mathscr{G}$ there is not countably generated. The present example, on the other hand, involves the pathological set $H$. This example is used in Section 33 in connection with conditional probability; see Problem 33.11.
4.11. (a) If $A_{1}, A_{2}, \ldots$ are independent events, then $P\left(\cap_{n=1}^{\infty} A_{n}\right)=\Pi_{n=1}^{\infty} P\left(A_{n}\right)$ and $P\left(\cup_{n=1}^{\infty} A_{n}\right)=1-\Pi_{n=1}^{\infty}\left(1-P\left(A_{n}\right)\right)$. Prove these facts and from them derive the second Borel-Cantelli lemma by the well-known relation between infinite series and products.
(b) Show that $P\left(\lim \sup _{n} A_{n}\right)=1$ if for each $k$ the series $\sum_{n>k} P\left(A_{n} \mid A_{k}^{c} \cap\right. \cdots \cap A_{n-1}^{c}$ ) diverges. From this deduce the second Borel-Cantelli lemma once again.
(c) Show by example that $P\left(\limsup _{n} A_{n}\right)=1$ does not follow from the divergence of $\sum_{n} P\left(A_{n} \mid A_{1}^{c} \cap \cdots \cap A_{n-1}^{c}\right)$ alone.
(d) Show that $P\left(\lim \sup _{n} A_{n}\right)=1$ if and only if $\sum_{n} P\left(A \cap A_{n}\right)$ diverges for each $A$ of positive probability.
(e) If sets $A_{n}$ are independent and $P\left(A_{n}\right)<1$ for all $n$, then $P\left[A_{n}\right.$ i.o. $]=1$ if and only if $P\left(\cup_{n} A_{n}\right)=1$.
4.12. (a) Show (see Example 4.21) that $\log _{2} n+\log _{2} \log _{2} n+\theta \log _{2} \log _{2} \log _{2} n$ is an outer boundary if $\theta>1$. Generalize.
(b) Show that $\log _{2} n+\log _{2} \log _{2} \log _{2} n$ is an inner boundary.
4.13. Let $\varphi$ be a positive function of integers, and define $B_{\varphi}$ as the set of $x$ in $(0,1)$ such that $\left|x-p / 2^{i}\right|<1 / 2^{i} \varphi\left(2^{i}\right)$ holds for infinitely many pairs $p, i$. Adapting the proof of Theorem 1.6, show directly (without reference to Example 4.12) that $\sum_{i} 1 / \varphi\left(2^{i}\right)<\infty$ implies $\lambda\left(B_{\varphi}\right)=0$.
4.14. $2.19 \uparrow$ Suppose that there are in ( $\Omega, \mathscr{F}, P$ ) independent events $A_{1}, A_{2}, \ldots$ such that, if $\alpha_{n}=\min \left\{P\left(A_{n}\right), 1-P\left(A_{n}\right)\right\}$, then $\sum \alpha_{n}=\infty$. Show that $P$ is nonatomic.
4.15. $2.18 \uparrow$ Let $F$ be the set of square-free integers-those integers not divisible by any perfect square. Let $F_{l}$ be the set of $m$ such that $p^{2} \mid m$ for no $p \leq l$, and show that $D\left(F_{l}\right)=\Pi_{p \leq l}\left(1-p^{-2}\right)$. Show that $P_{n}\left(F_{l}-F\right) \leq \sum_{p>l} p^{-2}$, and conclude that the square-free integers have density $\Pi_{p}\left(1-p^{-2}\right)=6 / \pi^{2}$.
4.16. $2.18 \uparrow$ Reconsider Problem 2.18(d). If $D$ were countably additive on $f(\mathscr{M})$, it would extend to $\sigma(\mathscr{M})$. Use the second Borel-Cantelli lemma.

## SECTION 5. SIMPLE RANDOM VARIABLES

## Definition

Let $(\Omega, \mathscr{F}, P)$ be an arbitrary probability space, and let $X$ be a real-valued function on $\Omega ; X$ is a simple random variable if it has finite range (assumes only finitely many values) and if

$$
\begin{equation*}
[\omega: X(\omega)=x] \in \mathscr{F} \tag{5.1}
\end{equation*}
$$

for each real $x$. (Of course, $[\omega: X(\omega)=x]=\varnothing \in \mathscr{F}$ for $x$ outside the range of $X$.) Whether or not $X$ satisfies this condition depends only on $\mathscr{F}$, not on $P$, but the point of the definition is to ensure that the probabilities $P[\omega$ : $X(\omega)=x]$ are defined. Later sections will treat the theory of general random variables, of functions on $\Omega$ having arbitrary range; (5.1) will require modification in the general case.

The $d_{n}(\omega)$ of the preceding section (the digits of the dyadic expansion) are simple random variables on the unit interval: the sets $\left[\omega: d_{n}(\omega)=0\right]$ and $[\omega$ : $\left.d_{n}(\omega)=1\right]$ are finite unions of subintervals and hence lie in the $\sigma$-field $\mathscr{B}$ of Borel sets in ( 0,1 ]. The Rademacher functions are also simple random variables. Although the concept itself is thus not entirely new, to proceed further in probability requires a systematic theory of random variables and their expected values.

The run lengths $l_{n}(\omega)$ satisfy (5.1) but are not simple random variables, because they have infinite range (they come under the general theory). In a discrete space, $\mathscr{F}$ consists of all subsets of $\Omega$, so that (5.1) always holds.

It is customary in probability theory to omit the argument $\omega$. Thus $X$ stands for a general value $X(\omega)$ of the function as well as for the function itself, and $[X=x]$ is short for $[\omega: X(\omega)=x]$

A finite sum

$$
\begin{equation*}
X=\sum_{i} x_{i} I_{A_{i}} \tag{5.2}
\end{equation*}
$$

is a random variable if the $A_{i}$ form a finite partition of $\Omega$ into $\mathscr{F}$-sets. Moreover, every simple random variable can be represented in the form (5.2): for the $x_{i}$ take the range of $X$, and put $A_{i}=\left[X=x_{i}\right]$. But $X$ may have other such representations because $x_{i} I_{A_{i}}$ can be replaced by $\Sigma_{j} x_{i} I_{A_{i j}}$ if the $A_{i j}$ form a finite decomposition of $A_{i}$ into $\mathscr{F}$-sets.

If $\mathscr{I}$ is a sub- $\sigma$-field of $\mathscr{F}$, a simple random variable $X$ is measurable $\mathscr{G}$, or measurable with respect to $\mathscr{H}$, if $[X=x] \in \mathscr{G}$ for each $x$. A simple random variable is by definition always measurable $\mathscr{F}$. Since $[X \in H]=\mathrm{U}[X=x]$, where the union extends over the finitely many $x$ lying both in $H$ and in the range of $X,[X \in H] \in \mathscr{G}$ for every $H \subset R^{1}$ if $X$ is a simple random variable variable measurable $\mathscr{G}$.

The $\sigma$-field $\sigma(X)$ generated by $X$ is the smallest $\sigma$-field with respect to which $X$ is measurable; that is, $\sigma(X)$ is the intersection of all $\sigma$-fields with respect to which $X$ is measurable. For a finite or infinite sequence $X_{1}, X_{2}, \ldots$ of simple random variables, $\sigma\left(X_{1}, X_{2}, \ldots\right)$ is the smallest $\sigma$-field with respect to which each $X_{i}$ is measurable. It can be described explicitly in the finite case:

Theorem 5.1. Let $X_{1}, \ldots, X_{n}$ be simple random variables.
(i) The $\sigma$-field $\sigma\left(X_{1}, \ldots, X_{n}\right)$ consists of the sets

$$
\begin{equation*}
\left[\left(X_{1}, \ldots, X_{n}\right) \in H\right]=\left[\omega:\left(X_{1}(\omega), \ldots, X_{n}(\omega)\right) \in H\right] \tag{5.3}
\end{equation*}
$$

for $H \subset R^{n}$; $H$ in this representation may be taken finite.
(ii) A simple random variable $Y$ is measurable $\sigma\left(X_{1}, \ldots, X_{\eta}\right)$ if and only if

$$
\begin{equation*}
Y=f\left(X_{1}, \ldots, X_{n}\right) \tag{5.4}
\end{equation*}
$$

for some $f: R^{n} \rightarrow R^{1}$.
Proof. Let $\mathscr{M}$ be the class of sets of the form (5.3). Sets of the form $\left[\left(X_{1}, \ldots, X_{n}\right)=\left(x_{1}, \ldots, x_{n}\right)\right]=\bigcap_{i=1}^{n}\left[X_{i}=x_{i}\right]$ must lie in $\sigma\left(X_{1}, \ldots, X_{n}\right)$; each set (5.3) is a finite union of sets of this form because $\left(X_{1}, \ldots, X_{n}\right)$, as a mapping from $\Omega$ to $R^{n}$, has finite range. Thus $\mathscr{M} \subset \sigma\left(X_{1}, \ldots, X_{n}\right)$.

On the other hand, $\mathscr{M}$ is a $\sigma$-field because $\Omega=\left[\left(X_{1}, \ldots, X_{n}\right) \in R^{n}\right]$, $\left[\left(X_{1}, \ldots, X_{n}\right) \in H\right]^{c}=\left[\left(X_{1}, \ldots, X_{n}\right) \in H^{c}\right]$, and $\bigcup_{j}\left[\left(X_{1}, \ldots, X_{n}\right) \in H_{j}\right]= \left[\left(X_{1}, \ldots, X_{n}\right) \cap \cup_{j} H_{j}\right]$. But each $X_{i}$ is measurable with respect to $\mathscr{M}$, because $\left[X_{i}=x\right]$ can be put in the form (5.3) by taking $H$ to consist of those ( $x_{1}, \ldots, x_{n}$ ) in $R^{n}$ for which $x_{i}=x$. It follows that $\sigma\left(X_{1}, \ldots, X_{n}\right)$ is contained
in $\mathscr{M}$ and therefore equals $\mathscr{M}$. As intersecting $H$ with the range (finite) of ( $X_{1}, \ldots, X_{n}$ ) in $R^{n}$ does not affect (5.3), $H$ may be taken finite. This proves (i).

Assume that $Y$ has the form (5.4)-that is, $Y(\omega)=f\left(X_{1}(\omega), \ldots, X_{n}(\omega)\right)$ for every $\omega$. Since $[Y=y]$ can be put in the form (5.3) by taking $H$ to consist of those $x=\left(x_{1}, \ldots, x_{n}\right)$ for which $f(x)=y$, it follows that $Y$ is measurable $\sigma\left(X_{1}, \ldots, X_{n}\right)$.

Now assume that $Y$ is measurable $\sigma\left(X_{1}, \ldots, X_{n}\right)$. Let $y_{1}, \ldots, y_{r}$ be the distinct values $Y$ assumes. By part (i), there exist sets $H_{1}, \ldots, H_{r}$ in $R^{n}$ such that

$$
\left[\omega: Y(\omega)=y_{i}\right]=\left[\omega:\left(X_{1}(\omega), \ldots, X_{n}(\omega)\right) \in H_{i}\right] .
$$

Take $f=\sum_{i=1}^{r} y_{i} I_{H_{i}}$. Although the $H_{i}$ need not be disjoint, if $H_{i}$ and $H_{j}$ share a point of the form $\left(X_{1}(\omega), \ldots, X_{n}(\omega)\right)$, then $Y(\omega)=y_{i}$ and $Y(\omega)=y_{j}$, which is impossible if $i \neq j$. Therefore each $\left(X_{1}(\omega), \ldots, X_{n}(\omega)\right)$ lies in exactly one of the $H_{i}$, and it follows that $f\left(X_{1}(\omega), \ldots, X_{n}(\omega)\right)=Y(\omega)$. $\square$

Since (5.4) implies that $Y$ is measurable $\sigma\left(X_{1}, \ldots, X_{n}\right)$, it follows in particular that functions of simple random variables are again simple random variables. Thus $X^{2}, e^{t X}$, and so on are simple random variables along with $X$. Taking $f$ to be $\sum_{i=1}^{n} x_{i}, \prod_{i=1}^{n} x_{i}$, or $\max _{i \leq n} x_{i}$ shows that sums, products, and maxima of simple random variables are simple random variables.

As explained on p. 57, a sub- $\sigma$-field corresponds to partial information about $\omega$. From this point of view, $\sigma\left(X_{1}, \ldots, X_{n}\right)$ corresponds to a knowledge of the values $X_{1}(\omega), \ldots, X_{n}(\omega)$. These values suffice to determine the value $Y(\omega)$ if and only if (5.4) holds. The elements of the $\sigma\left(X_{1}, \ldots, X_{n}\right)$-partition (see (4.16)) are the sets $\left[X_{1}=x_{1}, \ldots, X_{n}=x_{n}\right]$ for $x_{i}$ in the range of $X_{i}$.

Example 5.1. For the dyadic digits $d_{n}(\omega)$ on the unit interval, $d_{3}$ is not measurable $\sigma\left(d_{1}, d_{2}\right)$; indeed, there exist $\omega^{\prime}$ and $\omega^{\prime \prime}$ such that $d_{1}\left(\omega^{\prime}\right)=d_{1}\left(\omega^{\prime \prime}\right)$ and $d_{2}\left(\omega^{\prime}\right)=d_{2}\left(\omega^{\prime \prime}\right)$ but $d_{3}\left(\omega^{\prime}\right) \neq d_{3}\left(\omega^{\prime \prime}\right)$, an impossibility if $d_{3}(\omega)= f\left(d_{1}(\omega), d_{2}(\omega)\right)$ identically in $\omega$. If such an $f$ existed, one could unerringly predict the outcome $d_{3}(\omega)$ of the third toss from the outcomes $d_{1}(\omega)$ and $d_{2}(\omega)$ of the first two. $\square$

Example 5.2. Let $s_{n}(\omega)=\sum_{k=1}^{n} r_{k}(\omega)$ be the partial sums of the Rademacher functions-see (1.14). By Theorem 5.1(ii) $s_{k}$ is measurable $\sigma\left(r_{1}, \ldots, r_{n}\right)$ for $k \leq n$, and $r_{k}=s_{k}-s_{k-1}$ is measurable $\sigma\left(s_{1}, \ldots, s_{n}\right)$ for $k \leq n$. Thus $\sigma\left(r_{1}, \ldots, r_{n}\right)=\sigma\left(s_{1}, \ldots, s_{n}\right)$. In random-walk terms, the first $n$ positions contain the same information as the first $n$ distances moved. In gambling terms, to know the gambler's first $n$ fortunes (relative to his initial fortune) is the same thing as to know his gains and losses on each of the first $n$ plays. $\square$

Example 5.3. An indicator $I_{A}$ is measurable $\mathscr{A}$ if and only if $A$ lies in $\mathscr{G}$. And $A \in \sigma\left(A_{1}, \ldots, A_{n}\right)$ if and only if $I_{A}=f\left(I_{A_{1}}, \ldots, I_{A_{n}}\right)$ for some $f: R^{n} \rightarrow R^{1}$.

## Convergence of Random Variables

It is a basic problem, for given random variables $X$ and $X_{1}, X_{2}, \ldots$ on a probability space ( $\Omega, \mathscr{F}, \boldsymbol{P}$ ), to look for the probability of the event that $\lim _{n} X_{n}(\omega)=X(\omega)$. The normal number theorem is an example, one where the probability is 1 . It is convenient to characterize the complementary event: $X_{n}(\omega)$ fails to converge to $X(\omega)$ if and only if there is some $\epsilon$ such that for no $m$ does $\left|X_{n}(\omega)-X(\omega)\right|$ remain below $\epsilon$ for all $n$ exceeding $m$-that is to say, if and only if, for some $\epsilon,\left|X_{n}(\omega)-X(\omega)\right| \geq \epsilon$ holds for infinitely many values of $n$. Therefore,

$$
\begin{equation*}
\left[\lim _{n} X_{n}=X\right]^{c}=\bigcup_{\epsilon}\left[\left|X_{n}-X\right| \geq \epsilon \text { i.o. }\right] \tag{5.5}
\end{equation*}
$$

where the union can be restricted to rational (positive) $\epsilon$ because the set in the union increases as $\epsilon$ decreases (compare (2.2)).

The event $\left[\lim _{n} X_{n}=X\right]$ therefore always lies in the basic $\sigma$-field $\mathscr{F}$, and it has probability 1 if and only if

$$
\begin{equation*}
P\left[\left|X_{n}-X\right| \geq \epsilon \text { i.o. }\right]=0 \tag{5.6}
\end{equation*}
$$

for each $\epsilon$ (rational or not). The event in (5.6) is the limit superior of the events $\left[\left|X_{n}-X\right| \geq \epsilon\right]$, and it follows by Theorem 4.1 that (5.6) implies

$$
\begin{equation*}
\lim _{n} P\left[\left|X_{n}-X\right| \geq \epsilon\right]=0 \tag{5.7}
\end{equation*}
$$

This leads to a definition: If (5.7) holds for each positive $\epsilon$, then $X_{n}$ is said to converge to $X$ in probability, written $X_{n} \rightarrow_{P} X$.

These arguments prove two facts:
Theorem 5.2. (i) There is convergence $\lim _{n} X_{n}=X$ with probability 1 if and only if (5.6) holds for each $\epsilon$.
(ii) Convergence with probability 1 implies convergence in probability.

Theorem 1.2, the normal number theorem, has to do with the convergence with probability 1 of $n^{-1} \sum_{i=1}^{n} d_{i}(\omega)$ to $\frac{1}{2}$. Theorem 1.1 has to do instead with the convergence in probability of the same sequence. By Theorem 5.2(ii), then, Theorem 1.1 is a consequence of Theorem 1.2 (see (1.30) and (1.31)). The converse is not true, however-convergence in probability does not imply convergence with probability 1 :

Example 5.4. Take $X \equiv 0$ and $X_{n}=I_{A_{n}}$. Then $X_{n} \rightarrow_{P} X$ is equivalent to $P\left(A_{n}\right) \rightarrow 0$, and $\left[\lim _{n} X_{n}=X\right]^{c}=\left[A_{n}\right.$ i.o. $]$. Any sequence $\left\{A_{n}\right\}$ such that $P\left(A_{n}\right) \rightarrow 0$ but $P\left[A_{n}\right.$ i.o. $]>0$ therefore gives a counterexample to the converse to Theorem 5.2(ii).

Consider the event $A_{n}=\left[\omega: l_{n}(\omega) \geq \log _{2} n\right]$ in Example 4.15. Here, $P\left(A_{n}\right) \leq 1 / n \rightarrow 0$, while $P\left[A_{n}\right.$ i.o. $]=1$ by (4.26), and so this is one counterexample. For an example more extreme and more transparent, define events in the unit interval in the following way. Define the first two by

$$
A_{1}=\left(0, \frac{1}{2}\right], \quad A_{2}=\left(\frac{1}{2}, 1\right] .
$$

Define the next four by

$$
A_{3}=\left(0, \frac{1}{4}\right], \quad A_{4}=\left(\frac{1}{4}, \frac{1}{2}\right], \quad A_{5}=\left(\frac{1}{2}, \frac{3}{4}\right], \quad A_{6}=\left(\frac{3}{4}, 1\right] .
$$

Define the next eight, $A_{7}, \ldots, A_{14}$, as the dyadic intervals of rank 3. And so on. Certainly, $P\left(A_{n}\right) \rightarrow 0$, and since each point $\omega$ is covered by one set in each successive block of length $2^{k}$, the set $\left[A_{n}\right.$ i.o. $]$ is all of $(0,1]$. $\square$

## Independence

A sequence $X_{1}, X_{2}, \ldots$ (finite or infinite) of simple random variables is by definition independent if the classes $\sigma\left(X_{1}\right), \sigma\left(X_{2}\right), \ldots$ are independent in the sense of the preceding section. By Theorem 5.1(i), $\sigma\left(X_{i}\right)$ consists of the sets [ $X_{i} \in H$ ] for $H \subset R^{1}$. The condition for independence of $X_{1}, \ldots, X_{n}$ is therefore that

$$
\begin{equation*}
P\left[X_{1} \in H_{1}, \ldots, X_{n} \in H_{n}\right]=P\left[X_{1} \in H_{1}\right] \cdots P\left[X_{n} \in H_{n}\right] \tag{5.8}
\end{equation*}
$$

for linear sets $H_{1}, \ldots, H_{n}$. The definition (4.10) also requires that (5.8) hold if one or more of the [ $X_{i} \in H_{i}$ ] is suppressed; but taking $H_{i}$ to be $R^{1}$ eliminates it from each side. For an infinite sequence $X_{1}, X_{2}, \ldots$, (5.8) must hold for each $n$. A special case of (5.8) is

$$
\begin{equation*}
P\left[X_{1}=x_{1}, \ldots, X_{n}=x_{n}\right]=P\left[X_{1}=x_{1}\right] \cdots P\left[X_{n}=x_{n}\right] . \tag{5.9}
\end{equation*}
$$

On the other hand, summing (5.9) over $x_{1} \in H_{1}, \ldots, x_{n} \in H_{n}$ gives (5.8). Thus the $X_{i}$ are independent if and only if (5.9) holds for all $x_{1}, \ldots, x_{n}$.

Suppose that

$$
\begin{array}{ccc}
X_{11} & X_{12} & \cdots  \tag{5.10}\\
X_{21} & X_{22} & \cdots \\
\vdots & \vdots &
\end{array}
$$

is an independent array of simple random variables. There may be finitely or
infinitely many rows, each row finite or infinite. If $\mathscr{A}_{i}$ consists of the finite intersections $\cap_{j}\left[X_{i j} \in H_{j}\right]$ with $H_{j} \subset R^{1}$, an application of Theorem 4.2 shows that the $\sigma$-fields $\sigma\left(X_{i 1}, X_{i 2}, \ldots\right), i=1,2, \ldots$ are independent. As a consequence, $Y_{1}, Y_{2}, \ldots$ are independent if $Y_{i}$ is measurable $\sigma\left(X_{i 1}, X_{i 2}, \ldots\right)$ for each $i$.

Example 5.5. The dyadic digits $d_{1}(\omega), d_{2}(\omega), \ldots$ on the unit interval are an independent sequence of random variables for which

$$
\begin{equation*}
P\left[d_{n}=0\right]=P\left[d_{n}=1\right]=\frac{1}{2} \tag{5.11}
\end{equation*}
$$

It is because of (511) and independence that the $d_{n}$ give a model for tossing a fair coin.

The sequence ( $d_{1}(\omega), d_{2}(\omega), \ldots$ ) and the point $\omega$ determine one another. It can be imagined that $\omega$ is determined by the outcomes $d_{n}(\omega)$ of a sequence of tosses. It can also be imagined that $\omega$ is the result of drawing a point at random from the unit interval, and that $\omega$ determines the $d_{n}(\omega)$. In the second interpretation the $d_{n}(\omega)$ are all determined the instant $\omega$ is drawn, and so it should further be imagined that they are then revealed to the coin tosser or gambler one by one. For example, $\sigma\left(d_{1}, d_{2}\right)$ corresponds to knowing the outcomes of the first two tosses-to knowing not $\omega$ but only $d_{1}(\omega)$ and $d_{2}(\omega)$-and this does not help in predicting the value $d_{3}(\omega)$, because $\sigma\left(d_{1}, d_{2}\right)$ and $\sigma\left(d_{3}\right)$ are independent. See Example 5.1.

Example 5.6. Every permutation can be written as a product of cycles. For example,

$$
\left(\begin{array}{lllllll}
1 & 2 & 3 & 4 & 5 & 6 & 7 \\
5 & 1 & 7 & 4 & 6 & 2 & 3
\end{array}\right)=(1562)(37)(4) .
$$

This permutation sends 1 to 5,2 to 1,3 to 7 , and so on. The cyclic form on the right shows that 1 goes to 5 , which goes to 6 , which goes to 2 , which goes back to 1 ; and so on. To standardize this cyclic representation, start the first cycle with 1 and each successive cycle with the smallest integer not yet encountered.

Let $\Omega$ consist of the $n!$ permutations of $1,2, \ldots, n$, all equally probable; $\mathscr{F}^{-}$ contains all subsets of $\Omega$, and $P(A)$ is the fraction of points in $A$. Let $X_{k}(\omega)$ be 1 or 0 according as the element in the $k$ th position in the cyclic representation of the permutation $\omega$ completes a cycle or not. Then $S(\omega)= \sum_{k=1}^{n} X_{k}(\omega)$ is the number of cycles in $\omega$. In the example above, $n=7$, $X_{1}=X_{2}=X_{3}=X_{5}=0, X_{4}=X_{6}=X_{7}=1$, and $S=3$. The following argument shows that $X_{1}, \ldots, X_{n}$ are independent and $P\left[X_{k}=1\right]=1 /(n-k+1)$. This will lead later on to results on $P[S \in H]$.

The idea is this: $X_{1}(\omega)=1$ if and only if the random permutation $\omega$ sends 1 to itself, the probability of which is $1 / n$. If it happens that $X_{1}(\omega)=1$-that $\omega$ fixes 1 -then the image of 2 is one of $2, \ldots, n$, and $X_{2}(\omega)=1$ if and only if this image is in fact 2 ; the conditional probability of this is $1 /(n-1)$. If $X_{1}(\omega)=0$, on the other hand, then $\omega$ sends 1 to some $i \neq 1$, so that the image of $i$ is one of $1, \ldots, i-1, i+1, \ldots, n$, and $X_{2}(\omega)=1$ if and only if this image is in fact 1 ; the conditional probability of this is again $1 /(n-1)$. This argument generalizes.

But the details are fussy Let $Y_{1}(\omega), \ldots, Y_{n}(\omega)$ be the integers in the successive positions in the cyclic representation of $\omega$ Fix $k$, and let $A_{1}$ be the set where $\left(X_{1}, \ldots, X_{k-1}, Y_{1}, \ldots, Y_{k}\right)$ assumes a specific vector of values $v=\left(x_{1}, \ldots, x_{k-1}\right.$, $\left.y_{1}, \ldots, y_{k}\right)$ The $A_{t}$ form a partition $\mathscr{A}$ of $\Omega$, and if $P\left[X_{k}=1 \mid A\right]=1 /(n-k+1)$ for each $v$, then by Example 4.7, $P\left[X_{k}=1\right]=1 /(n-k+1)$ and $X_{k}$ is independent of $\sigma(\mathscr{A})$ and hence of the smaller $\sigma$-field $\sigma\left(X_{1}, \ldots, X_{k-1}\right)$. It will follow by induction that $X_{1}, \ldots, X_{n}$ are independent.

Let $j$ be the position of the rightmost 1 among $x_{1}, \ldots, x_{k-1}$ ( $j=0$ if there are none). Then $\omega$ lies in $A_{i}$ if and only if it permutes $y_{1}, \ldots, y_{j}$ among themselves (in a way specified by the values $x_{1}, \ldots, x_{1-1}, x_{j}=1, y_{1}, \ldots, y_{j}$ ) and sends each of $y_{j+1}, \ldots, y_{k-1}$ to the $y$ just to its right. Thus $A_{r}$. contains ( $n-k+1$ )! sample points. And $X_{k}(\omega)=1$ if and only if $\omega$ also sends $y_{k}$ to $y_{j+1}$. Thus $A_{t} r_{1}\left[X_{k}=1\right]$ contains $(n-k)$ ! sample points, and so the conditional probability of $X_{k}=1$ is $1 /(n-k+1)$.

## Existence of Independent Sequences

The distribution of a simple random variable $X$ is the probability measure $\mu$ defined for all subsets $A$ of the line by

$$
\begin{equation*}
\mu(A)=P[X \in A] . \tag{5.12}
\end{equation*}
$$

This does define a probability measure. It is discrete in the sense of Exampie 2.9: If $x_{1}, \ldots, x_{l}$ are the distinct points of the range of $X$, then $\mu$ has mass $p_{i}=P\left[X=x_{i}\right]=\mu\left\{x_{i}\right\}$ at $x_{i}$, and $\mu(A)=\sum p_{i}$, the sum extending over those $i$ for which $x_{i} \in A$. As $\mu(A)=1$ if $A$ is the range of $X$, not only is $\mu$ discrete, it has finite support.

Theorem 5.3. Let $\left\{\mu_{n}\right\}$ be a sequence of probability measures on the class of all subsets of the line, each having finite support. There exists on some probability space ( $\Omega, \mathscr{F}, P$ ) an independent sequence $\left\{X_{n}\right\}$ of simple random variables such that $X_{n}$ has distribution $\mu_{n}$.

What matters here is that there are finitely or countably many distributions $\mu_{n}$. They need not be indexed by the integers; any countable index set will do.

Proof. The probability space will be the unit interval. To understand the construction, consider first the case in which each $\mu_{n}$ concentrates its mass on the two points 0 and 1 . Put $p_{n}=\mu_{n}\{0\}$ and $q_{n}=1-p_{n}=\mu_{n}\{1\}$. Split ( 0,1 ] into two intervals $I_{0}$ and $I_{1}$ of lengths $p_{1}$ and $q_{1}$. Define $X_{1}(\omega)=0$ for $\omega \in I_{0}$ and $X_{1}(\omega)=1$ for $\omega \in I_{1}$. If $P$ is Lebesgue measure, then clearly $P\left[X_{1}=0\right]=p_{1}$ and $P\left[X_{1}=1\right]=q_{1}$, so that $X_{1}$ has distribution $\mu_{1}$.
![](https://cdn.mathpix.com/cropped/368b4b9b-2cc8-486a-b0be-6044ed5eb877-088.jpg?height=123&width=1177&top_left_y=694&top_left_x=326)
![](https://cdn.mathpix.com/cropped/368b4b9b-2cc8-486a-b0be-6044ed5eb877-088.jpg?height=196&width=1177&top_left_y=897&top_left_x=326)

Now split $I_{0}$ into two intervals $I_{00}$ and $I_{01}$ of lengths $p_{1} p_{2}$ and $p_{1} q_{2}$, and split $I_{1}$ into two intervals $I_{10}$ and $I_{11}$ of lengths $q_{1} p_{2}$ and $q_{1} q_{2}$. Define $X_{2}(\omega)=0$ for $\omega \in I_{00} \cup I_{10}$ and $X_{2}(\omega)=1$ for $\omega \in I_{01} \cup I_{11}$. As the diagram makes clear, $P\left[X_{1}=0, X_{2}=0\right]=p_{1} p_{2}$, and similarly for the other three possibilities. It follows that $X_{1}$ and $X_{2}$ are independent and $X_{2}$ has distribution $\mu_{2}$. Now $X_{3}$ is constructed by splitting each of $I_{00}, I_{01}, I_{10}, I_{11}$ in the proportions $p_{3}$ and $q_{3}$. And so on.

If $p_{n}=q_{n}=\frac{1}{2}$ for all $n$, then the successive decompositions here are the decompositions of $(0,1]$ into dyadic intervals, and $X_{n}(\omega)=d_{n}(\omega)$.

The argument for the general case is not very different. Let $x_{n 1}, \ldots, x_{n!}$ be the distinct points on which $\mu_{n}$ concentrates its mass, and put $p_{n i}=\mu_{n}\left\{x_{n i}\right\}$ for $1 \leq i \leq l_{n}$.

Decompose ${ }^{\dagger}(0,1]$ into $l_{1}$ subintervals $I_{1}^{(1)}, \ldots, I_{l_{1}}^{(1)}$ of respective lengths $p_{11}, \ldots, p_{1 I_{i}}$. Define $X_{1}$ by setting $X_{1}(\omega)=x_{1 i}$ for $\omega \in I_{i}^{(1)}, 1 \leq i \leq l_{1}$. Then $(P$ is Lebesgue measure) $P\left[\omega: X_{1}(\omega)=x_{1 i}\right]=P\left(I_{i}^{(1)}\right)=p_{1 i}, 1 \leq i \leq l_{1}$. Thus $X_{1}$ is a simple random variable with distribution $\mu_{1}$.

Next decompose each $I_{i}^{(1)}$ into $l_{2}$ subintervals $I_{i 1}^{(2)}, \ldots, I_{i l_{2}}^{(2)}$ of respective lengths $p_{1 i} p_{21}, \ldots, p_{1 i} p_{2 l_{2}}$. Define $X_{2}(\omega)=x_{2 j}$ for $\omega \in \bigcup_{i=1}^{l_{1}} I_{i j}^{(2)}, 1 \leq j \leq l_{2}$. Then $P\left[\omega: X_{1}(\omega)=x_{1 i}, X_{2}(\omega)=x_{2 j}\right]=P\left(I_{i j}^{(2)}\right)=p_{1 i} p_{2 j}$. Adding out $i$ shows that $P\left[\omega: X_{2}(\omega)=x_{2 j}\right]=p_{2 j}$, as required. Hence $P\left[X_{1}=x_{1 i}, X_{2}=x_{2 j}\right]= p_{1 i} p_{2 j}=P\left[X_{1}=x_{1 i}\right] P\left[X_{2}=x_{2 j}\right]$, and $X_{1}$ and $X_{2}$ are independent.

The construction proceeds inductively. Suppose that ( 0,1 ] has been decomposed into $l_{1} \cdots l_{n}$ intervals

$$
\begin{equation*}
I_{i_{1}}^{(n)} i_{n}, \quad 1 \leq i_{1} \leq l_{1}, \ldots, 1 \leq i_{n} \leq l_{n}, \tag{5.13}
\end{equation*}
$$

${ }^{\dagger}$ If $b-a=\delta_{1}+\cdots+\delta_{l}$ and $\delta_{i} \geq 0$, then $I_{i}=\left(a+\sum_{j<i} \delta_{j}, a+\sum_{j \leq i} \delta_{j}\right]$ decomposes $(a, b]$ into subintervals $I_{1}, \ldots, I_{l}$ with lengths of $\delta_{i}$ Of course, $I_{i}$ is empty if $\delta_{i}=0$.
of lengths

$$
\begin{equation*}
P\left(I_{i_{1}}^{(n)}{ }_{i_{n}}\right)=p_{1, i_{1}} \cdots p_{n, i_{n}} . \tag{5.14}
\end{equation*}
$$

Decompose $I_{i_{1}}^{(n)}{ }_{i_{n}}$ into $I_{n+1}$ subintervals $I_{i_{1}}^{(n+1)}{ }_{i_{n}} 1, \ldots, I_{i_{1}}^{(n+1)}{ }_{i_{n} i_{n+1}}$ of respective lengths $P\left(I_{i_{1}}^{(n)}{ }_{i_{n}}\right) p_{n+1,1}, \ldots, P\left(I_{i_{1}}^{(n)}{ }_{i_{n}}\right) p_{n+1, i_{n+1}}$. These are the intervals of the next decomposition. This construction gives a sequence of decompositions (5.13) of ( 0,1 ] into subintervals; each decomposition satisfies (5.14), and each refines the preceding one. If $\mu_{n}$ is given for $1 \leq n \leq N$, the procedure terminates after $N$ steps; for an infinite sequence it does not terminate at all.

For $1 \leq i \leq l_{n}$, put $X_{n}(\omega)=x_{n i}$ if $\omega \in \bigcup_{i_{1} i_{n-1}} I_{i_{1}}^{(n)}{ }_{i_{n-1}}$. Since each decomposition (5.13) refines the preceding, $X_{k}(\omega)=x_{k i_{k}}$ for $\omega \in I_{i_{1}}^{(n)}{ }_{i_{k}} i_{n}$. Therefore, each element of (5.13) is contained in the element with the same label $i_{1} \ldots i_{n}$ in the decomposition

$$
A_{i_{1}} \quad i_{n}=\left[\omega: X_{1}(\omega)=x_{1 i_{1}}, \ldots, X_{n}(\omega)=x_{n i_{n}}\right] . \quad 1 \leq i_{1} \leq l_{1}, \ldots, \quad 1 \leq i_{n} \leq l_{n} .
$$

The two decompositions thus coincide, and it follows by (5.14) that $P\left[X_{1}=x_{1 i_{1}}, \ldots, X_{n}=x_{n i_{n}}\right]=p_{1, i_{1}} \ldots p_{n, i_{n}}$. Adding out the indices $i_{1}, \ldots, i_{n-1}$ shows that $X_{n}$ has distribution $\mu_{n}$ and hence that $X_{1}, \ldots, X_{n}$ are independent. But $n$ was arbitrary. $\square$

In the case where the $\mu_{n}$ are all the same, there is an alternative construction based on probabilities in sequence space. Let $S$ be the support (finite) common to the $\mu_{n}$, and let $p_{u}, u \in S$, be the probabilities common to the $\mu_{n}$. In sequence space $S^{\infty}$, define product measure $P$ on the class $\mathscr{b}_{0}$ of cylinders by (2.21). By Theorem 2.3, $P$ is countably additive on $\mathscr{C}_{0}$, and by Theorem 3.1 it extends to $\mathscr{b}=\sigma\left(\mathscr{C}_{0}\right)$. The coordinate functions $z_{k}(\cdot)$ are random variables on the probability space ( $S^{\infty}, \mathscr{C}, P$ ); take these as the $X_{k}$. Then (2.22) translates into $P\left[X_{1}=u_{1}, \ldots, X_{n}=u_{n}\right]=p_{u_{1}} \cdots p_{u_{n}}$, which is just what Theorem 5.3 requires in this special case.

Probability theorems such as those in the next sections concern independent sequences $\left\{X_{n}\right\}$ with specified distributions or with distributions having specified properties, and because of Theorem 5.3 these theorems are true not merely in the vacuous sense that their hypotheses are never fulfilled. Similar but more complicated existence theorems will come later. For most purposes the probability space on which the $X_{n}$ are defined is largely irrelevant. Every independent sequence $\left\{X_{n}\right\}$ satisfying $P\left[X_{n}=1\right]=p$ and $P\left[X_{n}=0\right]= 1-p$ is a model for Bernoulli trials, for example, and for an event like $\mathrm{U}_{n=1}^{\infty}\left[\sum_{k=1}^{n} X_{k}>\alpha n\right]$, expressed in terms of the $X_{n}$ alone, the calculation of its probability proceeds in the same way whatever the underlying space $(\Omega, \mathscr{F}, P)$ may be.

It is, of course, an advantage that such results apply not just to some canonical sequence $\left\{X_{n}\right\}$ (such as the one constructed in the proof above) but to every sequence with the appropriate distributions. In some applications of probability within mathematics itself, such as the arithmetic applications of run theory in the preceding section, the underlying $\Omega$ does play a role.

## Expected Value

A simpie random variable in the form (5.2) is assigned expected value or mean value

$$
\begin{equation*}
E[X]=E\left[\sum_{i} x_{i} I_{A_{i}}\right]=\sum_{i} x_{i} P\left(A_{i}\right) . \tag{5.15}
\end{equation*}
$$

There is the alternative form

$$
\begin{equation*}
E[X]=\sum_{x} x P[X=x] \tag{5.16}
\end{equation*}
$$

the sum extending over the range of $X$; indeed, (5.15) and (5.16) both coincide with $\sum_{x} \sum_{i \lambda_{i}=r} x_{i} P\left(A_{i}\right)$. By (5.16) the definition (5.15) is consistent: different representations (5.2) give the same value to (5.15). From (5.16) it also follows that $E[X]$ depends only on the distribution of $X$; hence $E[X]=E[Y]$ if $P[X=Y]=1$.

If $X$ is a simple random variable on the unit interval and if the $A_{i}$ in (5.2) happen to be subintervals, then (5.15) coincides with the Riemann integral as given by (1.6). More general notions of integral and expected value will be studied later. Simple random variables are easy to work with because the theory of their expected values is transparent and free of technical complications.

As a special case of (5.15) and (5.16),

$$
\begin{equation*}
E\left[I_{A}\right]=P(A) \tag{5.17}
\end{equation*}
$$

As another special case, if a constant $\alpha$ is identified with the random variable $X(\omega) \equiv \alpha$, then

$$
\begin{equation*}
E[\alpha]=\alpha \tag{5.18}
\end{equation*}
$$

From (5.2) follows $f(X)=\sum_{i} f\left(x_{i}\right) I_{A_{i}}$, and hence

$$
\begin{equation*}
E[f(X)]=\sum_{i} f\left(x_{i}\right) P\left(A_{i}\right)=\sum_{x} f(x) P[X=x] \tag{5.19}
\end{equation*}
$$

the last sum extending over the range of $X$. For example, the $k$ th moment $E\left[X^{k}\right]$ of $X$ is defined by $E\left[X^{k}\right]=\Sigma_{y} y P\left[X^{k}=y\right]$, where $y$ varies over the
range of $X^{k}$, but it is usually simpler to compute it by $E\left[X^{k}\right]=\sum_{x} x^{k} P[X=x]$, where $x$ varies over the range of $X$.

If

$$
\begin{equation*}
X=\sum_{i} x_{i} I_{A_{j}}, \quad Y=\sum_{j} y_{j} I_{B_{j}} \tag{5.20}
\end{equation*}
$$

are simple random variables, then $\alpha X+\beta Y=\sum_{i j}\left(\alpha x_{i}+\beta y_{j}\right) I_{A_{i} \cap B_{j}}$ has expected value $\sum_{i j}\left(\alpha x_{i}+\beta y_{j}\right) P\left(A_{i} \cap B_{j}\right)=\alpha \sum_{i} x_{i} P\left(A_{i}\right)+\beta \sum_{i} y_{j} P\left(B_{j}\right)$. Expected value is therefore linear:

$$
\begin{equation*}
E[\alpha X+\beta Y]=\alpha E[X]+\beta E[Y] . \tag{5.21}
\end{equation*}
$$

If $X(\omega) \leq Y(\omega)$ for all $\omega$, then $x_{i} \leq y_{j}$ if $A_{i} \cap B_{j}$ is nonempty, and hence $\sum_{i j} x_{i} P\left(A_{i} \cap B_{j}\right) \leq \sum_{i j} y_{j} P\left(A_{i} \cap B_{j}\right)$. Expected value therefore preserves order:

$$
\begin{equation*}
E[X] \leq E[Y] \quad \text { if } X \leq Y . \tag{5.22}
\end{equation*}
$$

(It is enough that $X \leq Y$ on a set of probability 1.) Two applications of (5.22) give $E[-|X|] \leq E[X] \leq E[|X|$, so that by linearity,

$$
\begin{equation*}
|E[X]| \leq E[|X|] . \tag{5.23}
\end{equation*}
$$

And more generally,

$$
\begin{equation*}
|E[X-Y]| \leq E[|X-Y|] . \tag{5.24}
\end{equation*}
$$

The relations (5.17) through (5.24) will be used repeatedly, and so will the following theorem on expected values and limits. If there is a finite $K$ such that $\left|X_{n}(\omega)\right| \leq K$ for all $\omega$ and $n$, the $X_{n}$ are uniformly bounded.

Theorem 5.4. If $\left(X_{n}\right)$ is uniformly bounded, and if $X=\lim _{n} X_{n}$ with probability 1 , then $E[X]=\lim _{n} E\left[X_{n}\right]$.

Proof. By Theorem 5.2(ii), convergence with probability 1 implies convergence in probability: $X_{n} \rightarrow_{p} X$. And in fact the latter suffices for the present proof. Increase $K$ so that it bounds $|X|$ (which has finite range) as well as all the $\left|X_{n}\right|$; then $\left|X-X_{n}\right| \leq 2 K$. If $A=\left[\left|X-X_{n}\right| \geq \epsilon\right]$, then

$$
\left|X(\omega)-X_{n}(\omega)\right| \leq 2 K I_{A}(\omega)+\epsilon I_{A^{c}}(\omega) \leq 2 K I_{A}(\omega)+\epsilon
$$

for all $\omega$. By (5.17), (5.18), (5.21), and (5.22),

$$
E\left[\left|X-X_{n}\right|\right] \leq 2 K P\left[\left|X-X_{n}\right| \geq \epsilon\right]+\epsilon .
$$

But since $X_{n} \rightarrow_{P} X$, the first term on the right goes to 0 , and since $\epsilon$ is arbitrary, $E\left[\left|X-X_{n}\right|\right] \rightarrow 0$. Now apply (5.24).

Theorems of this kind are of constant use in probability and analysis. For the general version, Lebesgue's dominated convergence theorem, see Section 16.

Example 5.7. On the unit interval, take $X(\omega)$ identically 0 , and take $X_{n}(\omega)$ to be $n^{2}$ if $0<\omega \leq n^{-1}$ and 0 if $n^{-1}<\omega \leq 1$. Then $X_{n}(\omega) \rightarrow X(\omega)$ for every $\omega$, although $E\left[X_{n}\right]=n$ does not converge to $E[X]=0$. Thus theorem 5.4 fails without some hypothesis such as that of uniform boundedness. See also Example 7.7.

An extension of (5.21) is an immediate consequence of Theorem 5.4:
Corollary. If $X=\sum_{n} X_{n}$ on an $\mathscr{F}$-set of probability 1 , and if the partial sums of $\sum_{n} X_{n}$ are uniformly bounded, then $E[X]=\sum_{n} E_{[ }\left[X_{n}\right]$.

Expected values for independent random variables satisfy the familiar product law. For $X$ and $Y$ as in (5.20), $X Y=\sum_{i j} x_{i} y_{j} I_{A_{i} \cap B_{j}}$. If the $x_{i}$ are distinct and the $y_{j}$ are distinct, then $A_{i}=\left[X=x_{i}\right]$ and $B_{j}=\left[Y=y_{j}\right]$; for independent $X$ and $Y, P\left(A_{i} \cap B_{j}\right)=P\left(A_{i}\right) P\left(B_{j}\right)$ by (5.9), and so $E[X Y]= \sum_{i j} x_{i} y_{j} P\left(A_{i}\right) P\left(B_{j}\right)=E[X] E[Y]$. If $X, Y, Z$ are independent, then $X Y$ and $Z$ are independent by the argument involving (5.10), so that $E[X Y Z]= E[X Y] E[Z]=E[X] E[Y] E[Z]$. This obviously extends:

$$
\begin{equation*}
E\left[X_{1} \cdots X_{n}\right]=E\left[X_{1}\right] \cdots E\left[X_{n}\right] \tag{5.25}
\end{equation*}
$$

if $X_{1}, \ldots, X_{n}$ are independent.
Various concepts fiom discrete probability carry over to simple random variables. If $E[X]=m$, the variance of $X$ is

$$
\begin{equation*}
\operatorname{Var}[X]=E\left[(X-m)^{2}\right]=E\left[X^{2}\right]-m^{2} \tag{5.26}
\end{equation*}
$$

the left-hand equality is a definition, the right-hand one a consequence of expanding the square. Since $\alpha X+\beta$ has mean $\alpha m+\beta$, its variance is $E\left[((\alpha X+\beta)-(\alpha m+\beta))^{2}\right]=E\left[\alpha^{2}(X-m)^{2}\right]:$

$$
\begin{equation*}
\operatorname{Var}[\alpha X+\beta]=\alpha^{2} \operatorname{Var}[X] \tag{5.27}
\end{equation*}
$$

If $X_{1}, \ldots, X_{n}$ have means $m_{1}, \ldots, m_{n}$, then $S=\sum_{i=1}^{n} X_{i}$ has mean $m= \sum_{i=1}^{n} m_{i}$, and $E\left[(S-m)^{2}\right]=E\left[\left(\sum_{i=1}^{n}\left(X_{i}-m_{i}\right)\right)^{2}\right]=\sum_{i=1}^{n} E\left[\left(X_{i}-m_{i}\right)^{2}\right]+ 2 \sum_{1 \leq i<j \leq n} E\left[\left(X_{i}-m_{i}\right)\left(X_{j}-m_{j}\right)\right]$. If the $X_{i}$ are independent, then so are the $X_{i}-m_{i}$, and by (5.25) the last sum vanishes. This gives the familiar formula
for the variance of a sum of independent random variables:

$$
\begin{equation*}
\operatorname{Var}\left[\sum_{i=1}^{n} X_{i}\right]=\sum_{i=1}^{n} \operatorname{Var}\left[X_{i}\right] . \tag{5.28}
\end{equation*}
$$

Suppose that $X$ is nonnegative; or der its range: $0 \leq x_{1}<x_{2}<\cdots<x_{k}$. Then

$$
\begin{aligned}
E[X] & =\sum_{i=1}^{k} x_{i} P\left[X=x_{i}\right] \\
& =\sum_{i=1}^{k-1} x_{i}\left(P\left[X \geq x_{i}\right]-P\left[X \geq x_{i+1}\right]\right)+x_{k} P\left[X \geq x_{k}\right] \\
& =x_{1} P\left[X \geq x_{1}\right]+\sum_{i=2}^{k}\left(x_{i}-x_{i-1}\right) P\left[X \geq x_{i}\right]
\end{aligned}
$$

Since $P[X \geq x]=P\left[X \geq x_{1}\right]$ for $0 \leq x \leq x_{1}$ and $P[X \geq x]=P\left[X \geq x_{i}\right]$ for $x_{i-1} <x \leq x_{i}$, it is possible to write the final sum as the Riemann integral of a step function:

$$
\begin{equation*}
E[X]=\int_{0}^{\infty} P[X \geq x] d x \tag{5.29}
\end{equation*}
$$

This holds if $X$ is nonnegative. Since $P[X \geq x]=0$ for $x>x_{k}$, the range of integration is really finite.

There is for (5.29) a simple geometric argument involving the "area over the curve." If $p_{1}=P\left[X=x_{i}\right]$, the area of the shaded region in the figure is the sum $p_{1} x_{1}+\cdots+p_{k} x_{k}=E[X]$ of the areas of the horizontal strips; it is also the integral of the height $P[X \geq x]$ of the region.
![](https://cdn.mathpix.com/cropped/368b4b9b-2cc8-486a-b0be-6044ed5eb877-093.jpg?height=569&width=912&top_left_y=2218&top_left_x=451)

## Inequalities

There are for expected values several standard inequalities that will be needed. If $X$ is nonnegative, then for positive $\alpha$ (sum over the range of $X$ ) $E[X]=\sum_{x} x P[X=x] \geq \sum_{x x \geq \alpha} x P[X=x] \geq \alpha \sum_{x x \geq \alpha} P[X=x]$. Therefore,

$$
\begin{equation*}
P[X \geq \alpha\} \leq \frac{1}{\alpha} E[X] \tag{5.30}
\end{equation*}
$$

if $X$ is nonnegative and $\alpha$ positive. A special case of this is (1.20). Applied to $|X|^{k}$, (5.30) gives Markov's inequality,

$$
\begin{equation*}
P[|X| \geq \alpha] \leq \frac{1}{\alpha^{k}} E\left[|X|^{k}\right] \tag{5.31}
\end{equation*}
$$

valid for positive $\alpha$. If $k=2$ and $m=E[X]$ is subtracted from $X$, this becomes the Chebyshev (or Chebyshev-Bienaymé) inequality:

$$
\begin{equation*}
P[|X-m| \geq \alpha] \leq \frac{1}{\alpha^{2}} \operatorname{Var}[X] \tag{5.32}
\end{equation*}
$$

A function $\varphi$ on an interval is convex [A32] if $\varphi(p x+(1-p) y) \leq p \varphi(x)+ (1-p) \varphi(y)$ for $0 \leq p \leq 1$ and $x$ and $y$ in the interval. A sufficient condition for this is that $\varphi$ have a nonnegative second derivative. It follows by induction that $\varphi\left(\sum_{i=1}^{l} p_{i} x_{i}\right) \leq \sum_{i=1}^{l} p_{i} \varphi\left(x_{i}\right)$ if the $p_{i}$ are nonnegative and add to 1 and the $x_{i}$ are in the domain of $\varphi$. If $X$ assumes the value $x_{i}$ with probability $p_{i}$, this becomes Jensen's inequality,

$$
\begin{equation*}
\varphi(E[X]) \leq E[\varphi(X)], \tag{5.33}
\end{equation*}
$$

valid if $\varphi$ is convex on an interval containing the range of $X$.
Suppose that

$$
\begin{equation*}
\frac{1}{p}+\frac{1}{q}=1, \quad p>1, \quad q>1 . \tag{5.34}
\end{equation*}
$$

Hölder's inequality is

$$
\begin{equation*}
E[|X Y|] \leq E^{1 / p}\left[|X|^{p}\right] \cdot E^{1 / q}\left[|Y|^{q}\right] . \tag{5.35}
\end{equation*}
$$

If, say, the first factor on the right vanishes, then $X=0$ with probability 1 , hence $X Y=0$ with probability 1 , and hence the left side vanishes also. Assume then that the right side of (5.35) is positive. If $a$ and $b$ are positive, there exist $s$ and $t$ such that $a=e^{p^{-1} s}$ and $b=e^{q^{-1} t}$. Since $e^{x}$ is convex,
$e^{p^{-1} s+q^{-1} t} \leq p^{-1} e^{s}+q^{-1} e^{l}$, or

$$
a b \leq \frac{a^{p}}{p}+\frac{b^{q}}{q} .
$$

This obviously holds for nonnegative as well as for positive $a$ and $b$. Let $u$ and $b$ be the two factors on the right in (5.35). For each $\omega$,

$$
\left|\frac{X(\omega) Y(\omega)}{u v}\right| \leq \frac{1}{p}\left|\frac{X(\omega)}{u}\right|^{p}+\frac{1}{q}\left|\frac{Y(\omega)}{v}\right|^{q}
$$

Taking expected values and applying (5.34) leads to (5.35).
If $p=q=2$, Hölder's inequality becomes Schwarz's inequality:

$$
\begin{equation*}
E[|X Y|] \leq E^{1 / 2}\left[X^{2}\right] \cdot E^{1 / 2}\left[Y^{2}\right] . \tag{5.36}
\end{equation*}
$$

Suppose that $0<\alpha<\beta$. In (5.35) take $p=\beta / \alpha, q=\beta /(\beta-\alpha)$, and $Y(\omega)=1$, and replace $X$ by $|X|^{\alpha}$. The result is Lyapounov's inequality,

$$
\begin{equation*}
E^{1 / \alpha}\left[|X|^{\alpha}\right] \leq E^{1 / \beta}\left[|X|^{\beta}\right], \quad 0<\alpha \leq \beta . \tag{5.37}
\end{equation*}
$$

## PROBLEMS

5.1. (a) Show that $X$ is measurable with respect to the $\sigma$-field $\mathscr{A}$ if and only if $\sigma(X) \subset \mathscr{G}$. Show that $X$ is measurable $\sigma(Y)$ if and only if $\sigma(X) \subset \sigma(Y)$.
(b) Show that, if $\mathscr{A}=\{\varnothing, \Omega\}$, then $X$ is measurable $\mathscr{A}$ if and only if $X$ is constant.
(c) Suppose that $P(A)$ is 0 or 1 for every $A$ in $\mathscr{G}$. This holds, for example, if $\mathscr{G}$ is the tail field of an independent sequence (Theorem 4.5), or if $\mathscr{E}$ consists of the countable and cocountable sets on the unit interval with Lebesgue measure. Show that if $X$ is measurable $\mathscr{G}$, then $P[X=c]=1$ for some constant $c$.
5.2. 2.19 ↑ Show that the unit interval can be replaced by any nonatomic probability measure space in the proof of Theorem 5.3.
5.3. Show that $m=E[X]$ minimizes $E\left[(X-m)^{2}\right]$.
5.4. Suppose that $X$ assumes the values $m-\alpha, m, m+\alpha$ with probabilities $p, 1- 2 p, p$, and show that there is equality in (5.32). Thus Chebyshev's inequality cannot be improved without special assumptions on $X$.
5.5. Suppose that $X$ has mean $m$ and variance $\sigma^{2}$.
(a) Prove Cantelli's inequality

$$
P[X-m \geq \alpha] \leq \frac{\sigma^{2}}{\sigma^{2}+\alpha^{2}}, \quad \alpha \geq 0 .
$$

(b) Show that $P[|X-m| \geq \alpha] \leq 2 \sigma^{2} /\left(\sigma^{2}+\alpha^{2}\right)$. When is this better than Chebyshev's inequality?
(c) By considering a random variable assuming two values, show that Cantelli's inequality is sharp.
5.6. The polynomial $E\left[(t|X|+|Y|)^{2}\right]$ in $t$ has at most one real zero. Deduce Schwarz's inequality once more.
5.7. (a) Write (5.37) in the form $\left.E^{\beta / \alpha}\left[|X|^{\alpha}\right] \leq E\left[|X|^{\alpha}\right)^{\beta / \alpha}\right]$ and deduce it directly from Jensen's inequality.
(b) Prove that $E\left[1 / X^{p}\right] \geq 1 / E^{p}[X]$ for $p>0$ and $X$ a positive random variable.
5.8. (a) Let $f$ be a convex real function on a convex set $C$ in the plane Suppose that $(X(\omega), Y(\omega)) \in C$ for all $\omega$ and prove a two-dimensional Jensen's mequality:

$$
\begin{equation*}
f(E[X], E[Y]) \leq E[f(X, Y)] \tag{5.38}
\end{equation*}
$$

(b) Show that $f$ is convex if it has continuous second derivatives that satisfy

$$
\begin{equation*}
f_{11} \geq 0, \quad f_{22} \geq 0, \quad f_{11} f_{22} \geq f_{12}^{2} \tag{5.39}
\end{equation*}
$$

5.9. ↑ Hölder's inequality is equivalent to $E\left[X^{1 / p} Y^{1 / q}\right] \leq E^{1 / p}[X] \cdot E^{1 / q}[Y] \left(p^{-1}+q^{-1}=1\right)$, where $X$ and $Y$ are nonnegative random variables. Derive this from (5.38).
5.10. ↑ Minkowski's inequality is

$$
\begin{equation*}
E^{1 / p}\left[|X+Y|^{p}\right] \leq E^{1 / p}\left[|X|^{p}\right]+E^{1 / p}\left[|Y|^{p}\right] \tag{5.40}
\end{equation*}
$$

valid for $p \geq 1$. It is enough to prove that $E\left[\left(X^{1 / p}+Y^{1 / p}\right)^{p}\right] \leq\left(E^{1 / p}[X]+\right. E^{1 / p[Y])^{p}}$ for nonnegative $X$ and $Y$. Use (5.38).
5.11. For events $A_{1}, A_{2}, \ldots$, not necessarily independent, let $N_{n}=\sum_{k=1}^{n} i_{A_{k}}$ be the number to occur among the first $n$. Let

$$
\begin{equation*}
\alpha_{n}=\frac{1}{n} \sum_{k=1}^{n} P\left(A_{k}\right), \quad \beta_{n}=\frac{2}{n(n-1)} \sum_{1 \leq j<k \leq n} P\left(A_{j} \cap A_{k}\right) . \tag{5.41}
\end{equation*}
$$

Show that

$$
\begin{equation*}
E\left[n^{-1} N_{n}\right]=\alpha_{n}, \quad \operatorname{Var}\left[n^{-1} N_{n}\right]=\beta_{n}-\alpha_{n}^{2}+\frac{\alpha_{n}-\beta_{n}}{n} \tag{5.42}
\end{equation*}
$$

Thus $\operatorname{Var}\left[n^{-1} N_{n}\right] \rightarrow 0$ if and only if $\beta_{n}-\alpha_{n}^{2} \rightarrow 0$, which holds if the $A_{n}$ are independent and $P\left(A_{n}\right)=p$ (Bernoulli trials), because then $\alpha_{n}=p$ and $\beta_{n}= p^{2}=\alpha_{n}^{2}$.
5.12. Show that, if $X$ has nonnegative integers as values, then $E[X]=\sum_{n=1}^{\infty} P[X \geq n]$.
5.13. Let $I_{i}=I_{A_{i}}$ be the indicators of $n$ events having union $A$. Let $S_{k}=\sum I_{i_{i}} \cdots I_{i_{k}}$, where the summation extends over all $k$-tuples satisfying $1 \leq i_{1}<\cdots<i_{k} \leq n$. Then $s_{k}=E\left[S_{k}\right]$ are the terms in the inclusion-exclusion formula $P(A)=s_{1}$ $s_{2}+\cdots \pm s_{n}$. Deduce the inclusion-exclusion formula from $I_{A}=S_{1}-S_{2}+ \cdots \pm S_{n}$. Prove the latter formula by expanding the product $\prod_{i=1}^{n}\left(1-I_{i}\right)$
5.14. Let $f_{n}(x)$ be $n^{2} x$ or $2 n-n^{2} x$ or 0 according as $0 \leq x \leq n^{-1}$ or $n^{-1} \leq x \leq 2 n^{-1}$ or $2 n^{-1} \leq x \leq 1$. This gives a standard example of a sequence of continuous functions that converges to 0 but not uniformly. Note that $\int_{0}^{1} f_{n}(x) d x$ does not converge to 0 ; relate to Example 5.7.
5.15. By Theorem 5.3, for any prescribed sequence of probabilities $p_{n}$, there exists (on some space) an independent sequence of events $A_{n}$ satisfying $P\left(A_{n}\right)=p_{n}$. Show that if $p_{n} \rightarrow 0$ but $\sum p_{n}=\infty$, this gives a counterexample (like Example 5.4) to the converse of Theorem 5.2(ii).
5.16. $\uparrow$ Suppose that $0 \leq p_{n} \leq 1$ and put $\alpha_{n}=\min \left(p_{n}, 1-p_{n}\right)$. Show that, if $\sum \alpha_{n}$ converges, then on some discrete probability space there exist independent events $A_{n}$ satisfying $P\left(A_{n}\right)=p_{n}$. Compare Problem 1.1(b).
5.17. (a) Suppose that $X_{n} \rightarrow_{P} X$ and that $f$ is continuous. Show that $f\left(X_{n}\right) \rightarrow_{P} f(X)$.
(b) Show that $E\left[\left|X-X_{n}\right|\right] \rightarrow 0$ implies $X_{n} \rightarrow_{P} X$. Show that the converse is false.
5.18. $2.20 \uparrow$ The proof given for Theorem 5.3 for the special case where the $\mu_{n}$ are all the same can be extended to cover the general case: use Problem 2.20.
5.19. $2.18 \uparrow$ For integers $m$ and primes $p$, let $\alpha_{p}(m)$ be the exact power of $p$ in the prime factorization of $m: m=\Pi_{p} p^{\alpha_{p}(m)}$. Let $\delta_{p}(m)$ be 1 or 0 as $p$ divides $m$ or not. Under each $P_{n}$ (see (2.34)) the $\alpha_{p}$ and $\delta_{p}$ are random variables. Show that for distinct primes $p_{1}, \ldots, p_{u}$,

$$
\begin{equation*}
P_{n}\left[\alpha_{p_{i}} \geq k_{i}, i \leq u\right]=\frac{1}{n}\left|\frac{n}{p_{1}^{k_{1}} \cdots p_{u}^{k_{u n}}}\right| \rightarrow \frac{1}{p_{1}^{k_{1}} \cdots p_{u}^{k_{u n}}} \tag{5.43}
\end{equation*}
$$

and

$$
\begin{equation*}
P_{n}\left[\alpha_{p_{i}}=k_{i}, i \leq u\right] \rightarrow \prod_{i=1}^{u}\left(\frac{1}{p_{i}^{k_{i}}}-\frac{1}{p_{i}^{k_{i}+1}}\right) . \tag{5.44}
\end{equation*}
$$

Similarly,

$$
\begin{equation*}
P_{n}\left[\delta_{p_{1}}=1, i \leq u\right]=\frac{1}{n}\left|\frac{n}{p_{1} \cdots p_{u}}\right| \rightarrow \frac{1}{p_{1} \cdots p_{u}} \tag{5.45}
\end{equation*}
$$

According to (5.44), the $\alpha_{p}$ are for large $n$ approximately independent under $P_{n}$, and according to (5.45), the same is true of the $\delta_{p}$.

For a function $f$ of positive integers, let

$$
\begin{equation*}
E_{n}[f]=\frac{1}{n} \sum_{m=1}^{n} f(m) \tag{5.46}
\end{equation*}
$$

be its expected value under the probability measure $P_{n}$. Show that

$$
\begin{equation*}
E_{n}\left[\alpha_{p}\right]=\sum_{k=1}^{\infty} \frac{1}{n}\left|\frac{n}{p^{k}}\right| \rightarrow \frac{1}{p-1} ; \tag{5.47}
\end{equation*}
$$

this says roughly that $(p-1)^{-1}$ is the average power of $p$ in the factorization of large integers.
5.20. ↑ (a) From Stirling's formula, deduce

$$
\begin{equation*}
E_{n}[\log ]=\log n+O(1) . \tag{5.48}
\end{equation*}
$$

From this, the inequality $E_{n}\left[\alpha_{p}\right] \leq 2 / p$, and the relation $\log m=\sum_{p} \alpha_{p}(m) \log p$, conclude that $\Sigma_{p} p^{-1} \log p$ diverges and that there are infinitely many primes.
(b) Let $\log ^{*} m=\sum_{p} \delta_{p}(m) \log p$. Show that

$$
\begin{equation*}
E_{n}\left[\log ^{*}\right]=\sum_{p} \frac{1}{n}\left\lfloor\frac{n}{p}\right\rfloor \log p=\log n+O(1) . \tag{5.49}
\end{equation*}
$$

(c) Show that $\lfloor 2 n / p\rfloor-2\lfloor n / p\rfloor$ is always nonnegative and equals 1 in the range $n<p \leq 2 n$. Deduce $E_{2 n}\left[\log ^{*}\right]-E_{n}\left[\log ^{*}\right]=O(1)$ and conclude that

$$
\begin{equation*}
\sum_{p \leq x} \log p=O(x) . \tag{5.50}
\end{equation*}
$$

Use this to estimate the error removing the integral-part brackets introduces into (5.49), and show that

$$
\begin{equation*}
\sum_{p \leq x} p^{-1} \log p=\log x+O(1) . \tag{5.51}
\end{equation*}
$$

(d) Restrict the range of summation in (5.51) to $\theta x<p \leq x$ for an appropriate $\theta$, and conclude that

$$
\begin{equation*}
\sum_{p \leq x} \log p \approx x, \tag{5.52}
\end{equation*}
$$

in the sense that the ratio of the two sides is bounded away from 0 and $\infty$.
(e) Use (5.52) and truncation arguments to prove for the number $\pi(x)$ of primes not exceeding $x$ that

$$
\begin{equation*}
\pi(x) \asymp \frac{x}{\log x} . \tag{5.53}
\end{equation*}
$$

(By the prime number theorem the ratio of the two sides in fact goes to 1.) Conclude that the $r$ th prime $p_{r}$ satisfies $p_{r} \asymp r \log r$ and that

$$
\begin{equation*}
\sum_{p} \frac{1}{p}=\infty . \tag{5.54}
\end{equation*}
$$

## SECTION 6. THE LAW OF LARGE NUMBERS

## The Strong Law

Let $X_{1}, X_{2}, \ldots$ be a sequence of simple random variables on some probability space ( $\Omega, \mathscr{F}, P$ ). They are identically distributed if their distributions (in the sense of (5.12)) are all the same. Define $S_{n}=X_{1}+\cdots+X_{n}$. The strong law of large numbers:

Theorem 6.1. If the $X_{n}$ are independent and identically distributed and $E\left[X_{n}\right]=m$. then

$$
\begin{equation*}
P\left[\lim _{n} n^{-1} S_{n}=m\right]=1 . \tag{6.1}
\end{equation*}
$$

Proof. The conclusion is that $n^{-1} S_{n}-m=n^{-1} \sum_{i=1}^{n}\left(X_{i}-m\right) \rightarrow 0$ with probability 1 . Replacing $X_{i}$ by $X_{i}-m$ shows that there is no loss of generality in assuming that $m=0$. The set in question does lie in $\mathscr{F}$ (see (5.5)), and by Theorem 5.2(i), it is enough to show that $P\left[\left|n^{-1} S_{n}\right| \geq \epsilon\right.$ i.o. $]=0$ for each $\epsilon$.

Let $E\left[X_{i}^{2}\right]=\sigma^{2}$ and $E\left[X_{i}^{4}\right]=\xi^{4}$. The proof is like that for Theorem 1.2. First (see (1.26)), $E\left[S_{n}^{4}\right]=\sum E\left[X_{\alpha} X_{\beta} X_{\gamma} X_{\delta}\right]$, the four indices ranging independently from 1 to $n$. Since $E\left[X_{i}\right]=0$, it follows by the product rule (5.25) for independent random variables that the summand vanishes if there is one index different from the three others. This leaves terms of the form $E\left[X_{i}^{4}\right]= \xi^{4}$, of which there are $n$, and terms of the form $E\left[X_{i}^{2} X_{j}^{2}\right]=E\left[X_{i}^{2}\right] E\left[X_{j}^{2}\right]=\sigma^{4}$ for $i \neq j$, of which there are $3 n(n-1)$. Hence

$$
\begin{equation*}
E\left[S_{n}^{4}\right]=n \xi^{4}+3 n(n-1) \sigma^{4} \leq K n^{2}, \tag{6.2}
\end{equation*}
$$

where $K$ does not depend on $n$.
By Markov's inequality (5.31) for $k=4, P\left[\left|S_{n}\right| \geq n \epsilon\right] \leq K n^{-2} \epsilon^{-4}$, and so by the first Borel-Cantelli lemma, $P\left[\left|n^{-1} S_{n}\right| \geq \epsilon\right.$ i.o. $]=0$, as required. $\square$

Example 6.1. The classical example is the strong law of large numbers for Bernoulli trials. Here $P\left[X_{n}=1\right]=p, P\left[X_{n}=0\right]=1-p, m=p ; S_{n}$ represents the number of successes in $n$ trials, and $n^{-1} S_{n} \rightarrow p$ with probability 1 . The idea of probability as frequency depends on the long-range stability of the success ratio $S_{n} / n$. $\square$

Example 6.2. Theorem 1.2 is the case of Example 6.1 in which $(\Omega, \mathscr{F}, P)$ is the unit interval and the $X_{n}(\omega)$ are the digits $d_{n}(\omega)$ of the dyadic expansion of $\omega$. Here $p=\frac{1}{2}$. The set (1.21) of normal numbers in the unit interval has by (6.1) Lebesgue measure 1 ; its complement has measure 0 (and so in the terminology of Section 1 is negligible). $\square$

## The Weak Law

Since convergence with probability 1 implies convergence in probability (Theorem 5.2(ii)), it follows under the hypotheses of Theorem 6.1 that $n^{-1} S_{n} \rightarrow_{P} m$. But this is of course an immediate consequence of Chebyshev's inequality (5.32) and the rule (5.28) for adding variances:

$$
P\left[\left|n^{-1} S_{n}-m\right| \geq \epsilon\right] \leq \frac{\operatorname{Var}\left[S_{n}\right]}{n^{2} \epsilon^{2}}=\frac{n \operatorname{Var}\left[X_{1}\right]}{n^{2} \epsilon^{2}} \rightarrow 0 .
$$

This is the weak law of large numbers.
Chebyshev's inequality leads to a weak law in other interesting cases as well:

Example 6.3. Let $\Omega_{n}$ consist of the $n!$ permutations of $1,2, \ldots, n$, all equally probable, and let $X_{n k}(\omega)$ be 1 or 0 according as the $k$ th element in the cyclic representation of $\omega \in \Omega_{n}$ completes a cycle or not. This is Example 5.6, although there the dependence on $n$ was suppressed in the notation. The $X_{n 1}, \ldots, X_{n n}$ are independent, and $S_{n}=X_{n 1}+\cdots+X_{n n}$ is the number of cycles. The mean $m_{n k}$ of $X_{n k}$ is the probability that it equals 1 , namely $(n-k+1)^{-1}$, and its variance is $\sigma_{n k}^{2}=m_{n k}\left(1-m_{n k}\right)$.

If $L_{n}=\sum_{k=1}^{n} k^{-1}$, then $S_{n}$ has mean $\sum_{k=1}^{n} m_{n k}=L_{n}$ and variance $\sum_{k=1}^{n} m_{n k}\left(1-m_{n k}\right)<L_{n}$. By Chebyshev's inequality,

$$
P\left[\left|\frac{S_{n}-L_{n}}{L_{n}}\right| \geq \epsilon\right]<\frac{L_{n}}{\epsilon^{2} L_{n}^{2}}=\frac{1}{\epsilon^{2} L_{n}} \rightarrow 0 .
$$

Of the $n!$ permutations on $n$ letters, a proportion exceeding $1-\epsilon^{-2} L_{n}^{-1}$ thus have their cycle number in the range $(1 \pm \epsilon) L_{n}$. Since $L_{n}=\log n+O(1)$, most permutations on $n$ letters have about $\log n$ cycles. For a refinement, see Example 27.3.

Since $\Omega_{n}$ changes with $n$, it is the nature of the case that there cannot be a strong law corresponding to this result. $\square$

## Bernstein's Theorem

Some theorems that can be stated without reference to probability nonetheless have simple probabilistic proofs, as the last example shows. Bernstein's approach to the Weierstrass approximation theorem is another example.

Let $f$ be a function on $[0,1]$. The Bernstein polynomial of degree $n$ associated with $f$ is

$$
\begin{equation*}
B_{n}(x)=\sum_{k=0}^{n} f\left(\frac{k}{n}\right)\binom{n}{k} x^{k}(1-x)^{n-k} \tag{6.3}
\end{equation*}
$$

Theorem 6.2. If $f$ is continuous, $B_{n}(x)$ converges to $f(x)$ uniformly on [0,1].

According to the Weierstrass approximation theorem, $f$ can be unitormly approximated by polynomials; Bernstein's result goes further and specifies an approximating sequence.

Proof. Let $M=\sup _{x}|f(x)|$, and let $\delta(\epsilon)=\sup [|f(x)-f(y)|:|x-y| \leq \epsilon]$ be the modulus of continuity of $f$. It will be shown that

$$
\begin{equation*}
\sup _{x}\left|f(x)-B_{n}(x)\right| \leq \delta(\epsilon)+\frac{2 M}{n \epsilon^{2}} \tag{6.4}
\end{equation*}
$$

By the uniform continuity of $f, \lim _{\epsilon \rightarrow 0} \delta(\epsilon)=0$, and so this inequality (for $\epsilon=n^{-1 / 3}$, say) will give the theorem.

Fix $n \geq 1$ and $x \in[0,1]$ for the moment. Let $X_{1}, \ldots, X_{n}$ be independent random variables (on some probability space) such that $P\left[X_{i}=1\right]=x$ and $P\left[X_{i}=0\right]=1-x$; put $S=X_{1}+\cdots+X_{n}$. Since $P[S=k]=\binom{n}{k} x^{k}(1-x)^{n-k}$, the formula (5.19) for calculating expected values of functions of random variables gives $E[f(S / n)]=B_{n}(x)$. By the law of large numbers, there should be high probability that $S / n$ is near $x$ and hence ( $f$ being continuous) that $f(S / n)$ is near $f(x) ; E[f(S / n)]$ should therefore be near $f(x)$. This is the probabilistic idea behind the proof and, indeed, behind the definition (6.3) itself.

Bound $\left|f\left(n^{-1} S\right)-f(x)\right|$ by $\delta(\epsilon)$ on the set $\left[\left|n^{-1} S-x\right|<\epsilon\right]$ and by $2 M$ on the complementary set, and use (5.22) as in the proof of Theorem 5.4. Since $E[S]=n x$, Chebyshev's inequality gives

$$
\begin{aligned}
\left|B_{n}(x)-f(x)\right| & \leq E\left[\left|f\left(n^{-1} S\right)-f(x)\right|\right] \\
& \leq \delta(\epsilon) P\left[\left|n^{-1} S-x\right|<\epsilon\right]+2 M P\left[\left|n^{-1} S-x\right| \geq \epsilon\right] \\
& \leq \delta(\epsilon)+2 M \operatorname{Var}[S] / n^{2} \epsilon^{2} ;
\end{aligned}
$$

since $\operatorname{Var}[S]=n x(1-x) \leq n$, (6.4) follows.

## A Refinement of the Second Borel-Cantelli Lemma

For a sequence $A_{1}, A_{2}, \ldots$ of events, consider the number $N_{n}=I_{A_{1}} +\cdots+I_{A_{n}}$ of occurrences among $A_{1}, \ldots, A_{n}$. Since $\left[A_{n}\right.$ i.o. $]=[\omega$ : $\left.\sup _{n} N_{n}(\omega)=\infty\right], P\left[A_{n}\right.$ i.o. $]$ can be studied by means of the random variables $N_{n}$.

Suppose that the $A_{n}$ are independent. Put $p_{k}=P\left(A_{k}\right)$ and $m_{n}=p_{1} +\cdots+p_{n}$. From $E\left[I_{A_{k}}\right]=p_{k}$ and $\operatorname{Var}\left[I_{A_{A}}\right]=p_{k}\left(1-p_{k}\right) \leq p_{k}$ follow $E\left[N_{n}\right]= m_{n}$ and $\operatorname{Var}\left[N_{n}\right]=\sum_{k=1}^{n} \operatorname{Var}\left[I_{A_{k}}\right] \leq m_{n}$. If $m_{n}>x$, then

$$
\begin{align*}
P\left[N_{n} \leq x\right] & \leq P\left[\left|N_{n}-m_{n}\right| \geq m_{n}-x\right]  \tag{6.5}\\
& \leq \frac{\operatorname{Var}\left[N_{n}\right]}{\left(m_{n}-x\right)^{2}} \leq \frac{m_{n}}{\left(m_{n}-x\right)^{2}}
\end{align*}
$$

If $\sum p_{n}=\infty$, so that $m_{n} \rightarrow \infty$, it follows that $\lim _{n} P\left[N_{n} \leq x\right]=0$ for each $x$. Sirice

$$
\begin{equation*}
P\left[\sup _{k} N_{k} \leq x\right] \leq P\left[N_{n} \leq x\right] \tag{6.6}
\end{equation*}
$$

$P\left[\sup _{k} N_{k} \leq x\right]=0$ and hence (take the union over $x=1,2, \ldots$ ) $P\left[\sup _{k} N_{k}<\right. \infty]=0$. Thus $P\left[A_{n}\right.$ i.o. $]=P\left[\sup _{n} N_{i}=\infty\right]=1$ if the $A_{n}$ are independent and $\sum p_{n}=\infty$, which proves the second Borel-Cantelli lemma once again.

Independence was used in this argument only to estimate $\operatorname{Var}\left[N_{n}\right]$. Even without independence, $E\left[N_{n}\right]=m_{n}$ and the first two inequalities in (6.5) hold.

Theorem 6.3. If $\sum P\left(A_{n}\right)$ diverges and

$$
\begin{equation*}
\liminf _{n} \frac{\sum_{j, k \leq n} P\left(A_{j} \cap A_{k}\right)}{\left(\sum_{k \leq n} P\left(A_{k}\right)\right)^{2}} \leq 1 \tag{6.7}
\end{equation*}
$$

then $P\left[A_{n}\right.$ i.o. $]=1$.
As the proof will show, the ratio in (6.7) is at least 1 ; if (6.7) holds, the inequality must therefore be an equality.

Proof. Let $\theta_{n}$ denote the ratio in (6.7). In the notation above,

$$
\begin{aligned}
\operatorname{Var}\left[N_{n}\right] & =E\left[N_{n}^{2}\right]-m_{n}^{2}=\sum_{j, k \leq n} E\left[I_{A_{j}} I_{A_{k}}\right]-m_{n}^{2} \\
& =\sum_{j, k \leq n} P\left(A_{j} \cap A_{k}\right)-m_{n}^{2}=\left(\theta_{n}-1\right) m_{n}^{2}
\end{aligned}
$$

(and $\theta_{n}-1 \geq 0$ ). Hence (see (6.5)) $P\left[N_{n} \leq x\right] \leq\left(\theta_{n}-1\right) m_{n}^{2} /\left(m_{n}-x\right)^{2}$ for $x<m_{n}$. Since $m_{n}^{2} /\left(m_{n}-x\right)^{2} \rightarrow 1$, (6.7) implies that $\liminf _{n} P\left[N_{n} \leq x\right]=0$. It still follows by (6.6) that $P\left[\sup _{k} N_{k} \leq x\right]=0$, and the rest of the argument is as before.

Example 6.4. If, as in the second Borel-Cantelli lemma, the $A_{n}$ are independent (or even if they are merely independent in pairs), the ratio in (6.7) is $1+\sum_{k \leq n}\left(p_{k}-p_{k}^{2}\right) / m_{n}^{2}$, so that $\sum P\left(A_{n}\right)=\infty$ implies (6.7).

Example 6.5. Return once again to the run lengths $l_{n}(\omega)$ of Section 4. It was shown in Example 4.21 that $\left\{r_{n}\right\}$ is an outer boundary ( $P\left[l_{n} \geq r_{n}\right.$ i.o. $]=0$ ) if $\sum 2^{-r_{n}}<\infty$. It was also shown that $\left\{r_{n}\right\}$ is an inner boundary ( $P\left[l_{n} \geq r_{n}\right.$ i.o.] $=1$ ) if $r_{n}$ is nondecreasing and $\sum 2^{-r_{n}} r_{n}^{-1}=\infty$, but Theorem 6.3 can be used to prove this under the sole assumption that $\Sigma 2^{-r_{n}}=\infty$.

As usual, the $r_{n}$ can be taken to be positive integers. Let $A_{n}=\left[l_{n} \geq r_{n}\right]=$ [ $d_{n}=\cdots=d_{n+r_{n}-1}=0$ ]. If $j+r_{j} \leq k$, then $A_{j}$ and $A_{k}$ are independent. If $j<k<\jmath+r_{j}$, then $P\left(A_{j} \mid A_{k}\right) \leq P\left[d_{j}=\cdots=d_{k-1}=0 \mid A_{k}\right]=P\left[d_{j}=\cdots=\right. \left.d_{k-1}=0\right]=1 / 2^{k-j}$, and so $P\left(A_{j} \cap A_{k}\right) \leq P\left(A_{k}\right) / 2^{k-j}$. Therefore,

$$
\begin{aligned}
& \sum_{j, k \leq n} P\left(A_{j} \cap A_{k}\right) \\
& \quad \leq \sum_{k \leq n} P\left(A_{k}\right)+2 \sum_{\substack{j<k \leq n \\
j+r_{j} \leq k}} P\left(A_{j}\right) P\left(A_{k}\right)+2 \sum_{\substack{j<k \leq n \\
k<j+r_{j}}} 2^{-(k-j)} P\left(A_{k}\right) \\
& \quad \leq \sum_{k \leq n} P\left(A_{k}\right)+\left(\sum_{k \leq n} P\left(A_{k}\right)\right)^{2}+2 \sum_{k \leq n} P\left(A_{k}\right)
\end{aligned}
$$

If $\sum P\left(A_{n}\right)=\sum 2^{-r_{n}}$ diverges, then (6.7) follows.
Thus $\left(r_{n}\right)$ is an outer or an inner boundary according as $\sum 2^{-r_{n}}$ converges or diverges, which completely settles the issue. In particular, $r_{n}=\log _{2} n+ \theta \log _{2} \log _{2} n$ gives an outer boundary for $\theta>1$ and an inner boundary for $\theta \leq 1$.

Exampie 6.6. It is now possible to complete the analysis in Examples 4.12 and 4.16 of the relative error $e_{n}(\omega)$ in the approximation of $\omega$ by $\sum_{k=1}^{n-1} d_{k}(\omega) 2^{-k}$. If $l_{n}(\omega) \geq-\log _{2} x_{n}\left(0<x_{n}<1\right)$, then $e_{n}(\omega) \leq x_{n}$ by (4.22). By the preceding example for the case $r_{n}=-\log _{2} x_{n}, \sum x_{n}=\infty$ implies that $P\left[\omega: e_{n}(\omega) \leq x_{n}\right.$ i.o. $]=1$. By this and Example 4.12, $\left[\omega: e_{n}(\omega) \leq x_{n}\right.$ i.o.] has Lebesgue measure 0 or 1 according as $\sum x_{n}$ converges or diverges.

## PROBLEMS

6.1. Show that $Z_{n} \rightarrow Z$ with probability 1 if and only if for every positive $\epsilon$ there exists an $n$ such that $P\left[\left|Z_{k}-Z\right|<\epsilon, n \leq k \leq m\right]>1-\epsilon$ for all $m$ exceeding $n$. This describes convergence with probability 1 in "finite" terms.
6.2. Show in Example 6.3 that $P\left[\left|S_{n}-L_{n}\right| \geq L_{n}^{1 / 2+\epsilon}\right] \rightarrow 0$.
6.3. As in Examples 5.6 and 6.3, let $\omega$ be a random permutation of $1,2, \ldots, n$ Each $k, 1 \leq k \leq n$, occupies some position in the bottom row of the permutation $\omega$;
let $X_{n k}(\omega)$ be the number of smaller elements (between 1 and $k-1$ ) lying to the right of $k$ in the bottom row. The sum $S_{n}=X_{n 1}+\cdots+X_{n n}$ is the total number of inversions-the number of pairs appearing in the bottom row in reverse order of size. For the permutation in Example 5.6 the values of $X_{71}, \ldots, X_{77}$ are $0,0,0,2,4,2,4$, and $S_{7}=12$. Show that $X_{n 1}, \ldots, X_{n n}$ are independent and $P\left[X_{n k}=i\right]=k^{-1}$ for $0 \leq i<k$. Calculate $E\left[S_{n}\right]$ and $\operatorname{Var}\left[S_{n}\right]$. Show that $S_{n}$ is likely to be near $n^{2} / 4$.
6.4. For a function $f$ on $[0,1]$ write $\|f\|=\sup _{x}|f(x)|$. Show that, if $f$ has a continuous derivative $f^{\prime}$, then $\left\|f-B_{n}\right\| \leq \epsilon\left\|f^{\prime}\right\|+2\|f\| / n \epsilon^{2}$. Conclude that $\left\|f-B_{n}\right\|=O\left(n^{-1 / 3}\right)$.
6.5. Prove Poisson's theorem: If $A_{1}, A_{2}, \ldots$ are independent events, $\bar{p}_{n}= n^{-1} \sum_{i=1}^{n} P\left(A_{i}\right)$, and $N=\sum_{t=1}^{n} I_{A}$, then $n^{-1} N_{n}-\bar{p}_{n} \rightarrow_{p} 0$.

In the following problems $S_{n}=X_{\mathrm{i}}+\cdots+X_{n}$
6.6. Prove Cantelli's theorem. If $X_{1}, X_{2}, \ldots$ are independent, $E\left[X_{n}\right]=0$, and $E\left[X_{n}^{4}\right]$ is bounded, then $n^{-1} S_{n} \rightarrow 0$ with probability 1 . The $X_{n}$ need not be identically distributed
6.7. (a) Let $x_{1}, x_{2}, \ldots$ be a sequence of real numbers, and put $s_{n}=x_{1}+\cdots+x_{n}$. Suppose that $n^{-2} s_{n^{2}} \rightarrow 0$ and that the $x_{n}$ are bounded, and show that $n^{-1} s_{n} \rightarrow 0$. (b) Suppose that $n^{-2} S_{n^{2}} \rightarrow 0$ with probability 1 and that the $X_{n}$ are uniformly bounded ( $\sup _{n, \omega}\left|X_{n}(\omega)\right|<\infty$ ). Show that $n^{-1} S_{n} \rightarrow 0$ with probability 1 Here the $X_{n}$ need not be identically distributed or even independent.
6.8. $\uparrow$ Suppose that $X_{1}, X_{2}, \ldots$ are independent and uniformly bounded and $E\left[X_{n}\right]=0$. Using only the preceding result, the first Borel-Cantelli lemma, and Chebyshev's inequality, prove that $n^{-1} S_{n} \rightarrow 0$ with probability 1 .
6.9 ↑ Use the ideas of Problem 6.8 to give a new proof of Borel's normal number theorem, Theorem 1.2. The point is to return to first principles and use only negligibility and the other ideas of Section 1, not the apparatus of Sections 2 through 6 ; in particular, $P(A)$ is to be taken as defined only if $A$ is a finite, disjoint union of intervals.
6.10. $5.116 .7 \uparrow$ Suppose that (in the notation of (5.41)) $\beta_{n}-\alpha_{n}^{2}=O(1 / n)$. Show that $n^{-1} N_{n}-\alpha_{n} \rightarrow 0$ with probability 1 . What condition on $\beta_{n}-\alpha_{n}^{2}$ will imply a weak law? Note that independence is not assumed here.
6.11. Suppose that $X_{1}, X_{2}, \ldots$ are $m$-dependent in the sense that random variables more than $m$ apart in the sequence are independent. More precisely, let $\mathscr{A}_{j}^{k}=\sigma\left(X_{j}, \ldots, X_{k}\right)$, and assume that $\mathscr{A}_{j_{1}}^{k_{1}}, \ldots, \mathscr{A}_{j_{l}}^{k_{1}}$ are independent if $k_{i-1}+ m<j_{i}$ for $i=2, \ldots, l$. (Independent random variables are 0 -dependent.) Suppose that the $X_{n}$ have this property and are uniformly bounded and that $E\left[X_{n}\right]=0$. Show that $n^{-1} S_{n} \rightarrow 0$. Hint: Consider the subsequences $X_{i}, X_{i+m+1}, X_{i+2(m+1)}$, for $1 \leq i \leq m+1$.
6.12. $\uparrow$ Suppose that the $X_{n}$ are independent and assume the values $x_{1}, \ldots, x$, with probabilities $p\left(x_{1}\right), \ldots, p\left(x_{1}\right)$. For $u_{1}, \ldots, u_{k}$ a $k$-tuple of the $x_{i}$ 's, let
$N_{n}\left(u_{1}, \ldots, u_{k}\right)$ be the frequency of the $k$-tuple in the first $n+k-1$ trials, that is, the number of $t$ such that $1 \leq t \leq n$ and $X_{t}=u_{1}, \ldots, X_{t+k-1}=u_{k}$. Show that with probability 1, all asymptotic relative frequencies are what they should be-that is, with probability $1, n^{-1} N_{n}\left(u_{1}, \ldots, u_{k}\right) \rightarrow p\left(u_{1}\right) \cdots p\left(u_{k}\right)$ for every $k$ and every $k$-tuple $u_{1}, \ldots, u_{k}$.
6.13. $\uparrow$ A number $\omega$ in the unit interval is completely normal if, for every base $b$ and every $k$ and every $k$-tuple of base- $b$ digits, the $k$-tuple appears in the base- $b$ expansion of $\omega$ with asymptotic relative frequency $b^{-k}$. Show that the set of completely normal numbers has Lebesgue measure 1 .
6.14. Shannon's theorem. Suppose that $X_{1}, X_{2}, \ldots$ are independent, identically distributed random variables taking on the values $1, \ldots, r$ with positive probabilities $p_{1}, \ldots, p_{r}$ If $p_{n}\left(i_{1}, \ldots, i_{n}\right)=p_{i_{1}} \ldots p_{i_{n}}$ and $p_{n}(\omega)=p_{n}\left(X_{1}(\omega), \ldots X_{n}(\omega)\right)$, then $p_{n}(\omega)$ is the probability that a new sequence of $n$ trials would produce the particular sequence $X_{1}(\omega), \ldots, X_{n}(\omega)$ of outcomes that happens actually to have been observed. Show that

$$
-\frac{1}{n} \log p_{n}(\omega) \rightarrow h=-\sum_{i=1}^{r} p_{i} \log p_{i}
$$

with probability 1.
In information theory $1, \ldots, r$ are interpreted as the letters of an alphabet, $X_{1}, X_{2}, \ldots$ are the successive letters produced by an information source, and $h$ is the entropy of the source. Prove the asymptotic equipartition property: For large $n$ there is probability exceeding $1-\epsilon$ that the probability $p_{n}(\omega)$ of the observed $n$-long sequence, or message, is in the range $e^{-n(h \pm \epsilon)}$.
6.15. In the terminology of Example 6.5, show that $\log _{2} n+\log _{2} \log _{2} n+ \theta \log _{2} \log _{2} \log _{2} n$ is an outer or inner boundary as $\theta>1$ or $\theta \leq 1$. Generalize. (Compare Problem 4.12.)
6.16. $5.20 \uparrow$ Let $g(m)=\sum_{p} \delta_{p}(m)$ be the number of distinct prime divisors of $m$. For $a_{n}=E_{n}[g]$ (see(5.46)) show that $a_{n} \rightarrow \infty$. Show that

$$
\begin{equation*}
E_{n}\left[\left(\delta_{p}-\frac{1}{n}\left|\frac{n}{p}\right|\right)\left(\delta_{q}-\frac{1}{n}\left|\frac{n}{q}\right|\right)\right] \leq \frac{1}{n p}+\frac{1}{n q} \tag{6.8}
\end{equation*}
$$

for $p \neq q$ and hence that the variance of $g$ under $P_{n}$ satisfies

$$
\begin{equation*}
\operatorname{Var}_{n}[g] \leq 3 \sum_{p \leq n} \frac{1}{p} . \tag{6.9}
\end{equation*}
$$

Prove the Hardy-Ramanujan theorem:

$$
\begin{equation*}
\lim _{n} P_{n}\left[m:\left|\frac{g(m)}{a_{n}}-1\right| \geq \epsilon\right]=0 . \tag{6.10}
\end{equation*}
$$

Since $a_{n} \sim \log \log n$ (see Problem 18.17), most integers under $n$ have something like $\log \log n$ distinct prime divisors. Since $\log \log 10^{7}$ is a little less than 3 , the typical integer under $10^{7}$ has about three prime factors-remarkably few.
6.17. Suppose that $X_{1}, X_{2}, \ldots$ are independent and $P\left[X_{n}=0\right]=p$. Let $L_{n}$ be the length of the run of 0 's starting at the $n$th place: $L_{n}=k$ if $X_{n}=\cdots=X_{n+k-1} =0 \neq X_{n+k}$. Show that $P\left[L_{n} \geq r_{n}\right.$ i.o. $]$ is 0 or 1 according as $\sum_{n} p^{r_{n}}$ converges or diverges. Example 6.5 covers the case $p=\frac{1}{2}$.

## SECTION 7. GAMBLING SYSTEMS

Let $X_{1}, X_{2}, \ldots$ be an independent sequence of random variables (on some $(\Omega, \mathscr{F}, P)$ ) taking on the two values +1 and -1 with probabilities $P\left[X_{n}=\right. +1]=p$ and $P\left[X_{n}=-1\right]=q=1-p$. Throughout the section, $X_{n}$ will be viewed as the gambler's gain on the $n$th of a series of plays at unit stakes. The game is favorable to the gambler if $p>\frac{1}{2}$, fair if $p=\frac{1}{2}$, and unfavorable if $p<\frac{1}{2}$. The case $p \leq \frac{1}{2}$ will be called the subfair case.

After the classical gambler's ruin problem has been solved, it will be shown that every gambling system is in certain respects without effect and that some gambling systems are in other respects optimal. Gambling problems of the sort considered here have inspired many ideas in the mathematical theory of probability, ideas that carry far beyond their origin.

Red-and-black will provide numerical examples. Of the 38 spaces on a roulette wheel, 18 are red, 18 are black, and 2 are green. In betting either on red or on black the chance of winning is $\frac{18}{38}$.

## Gambler's Ruin

Suppose that the gambler enters the casino with capital $a$ and adopts the strategy of continuing to bet at unit stakes until his fortune increases to $c$ or his funds are exhausted. What is the probability of ruin, the probability that he will lose his capital, $a$ ? What is the probability he will achieve his goal, $c$ ? Here $a$ and $c$ are integers.

Let

$$
\begin{equation*}
S_{n}=X_{1}+\cdots+X_{n}, \quad S_{0}=0 . \tag{7.1}
\end{equation*}
$$

The gambler's fortune after $n$ plays is $a+S_{n}$. The event

$$
\begin{equation*}
A_{a, n}=\left[a+S_{n}=c\right] \cap \bigcap_{k=1}^{n-1}\left[0<a+S_{k}<c\right] \tag{7.2}
\end{equation*}
$$

represents success for the gambler at time $n$, and

$$
\begin{equation*}
B_{a, n}=\left[a+S_{n}=0\right] \cap \bigcap_{k=1}^{n-1}\left[0<a+S_{k}<c\right] \tag{7.3}
\end{equation*}
$$

represents ruin at time $n$. If $s_{c}(a)$ denotes the probability of ultimate success, then

$$
\begin{equation*}
s_{c}(a)=P\left(\bigcup_{n=1}^{\infty} A_{a, n}\right)=\sum_{n=1}^{\infty} P\left(A_{a, n}\right) \tag{7.4}
\end{equation*}
$$

for $0<a<c$.
Fix $c$ and let $a$ vary. For $n \geq 1$ and $0<a<c$, define $A_{a, n}$ by (7.2), and adopt the conventions $A_{a, 0}=\varnothing$ for $0 \leq a<c$ and $A_{c, 0}=\Omega$ (success is impossible at time 0 if $a<c$ and certain if $a=c$ ), as well as $A_{0, n}=A_{c, n}=\varnothing$ for $n \geq 1$ (play never starts if $a$ is 0 or $c$ ). By these conventions, $s_{c}(0)=0$ and $s_{c}(c)=1$.

Because of independence and the fact that the sequence $X_{2}, X_{3}, \ldots$ is a probabilistic replica of $X_{1}, X_{2}, \ldots$, it seems clear that the chance of success for a gambler with initial fortune a must be the chance of winning the first wager times the chance of success for an initial fortune $a+1$, plus the chance of losing the first wager times the chance of success for an initial fortune $a-1$. It thus seems intuitively clear that

$$
\begin{equation*}
s_{c}(a)=p s_{c}(a+1)+q s_{c}(a-1), \quad 0<a<c \tag{7.5}
\end{equation*}
$$

For a rigorous argument, define $A_{a_{,} n}^{\prime}$ just as $A_{a, n}$ but with $S_{n}^{\prime}=X_{2} +\cdots+X_{n+1}$ in place of $S_{n}$ in (7.2). Now $P\left[X_{i}=x_{i}, i \leq n\right]=P\left[X_{i+1}=x_{i}\right.$, $i \leq n]$ for each sequence $x_{1}, \ldots, x_{n}$ of +1 's and -1 's, and therefore $P\left[\left(X_{1}, \ldots, X_{n}\right) \in H\right]=P\left[\left(X_{2}, \ldots, X_{n+1}\right) \in H\right]$ for $H \subset R^{n}$. Take $H$ to be the set of $x=\left(x_{1}, \ldots, x_{n}\right)$ in $R^{n}$ satisfying $x_{i}= \pm 1, a+x_{1}+\cdots+x_{n}=c$, and $0<a+x_{1}+\cdots+x_{k}<c$ for $k<n$. It follows then that

$$
\begin{equation*}
P\left(A_{a, n}\right)=P\left(A_{a, n}^{\prime}\right) \tag{7.6}
\end{equation*}
$$

Moreover, $A_{a, n}=\left(\left[X_{1}=+1\right] \cap A_{a+1, n-1}^{\prime}\right) \cup\left(\left[X_{1}=-1\right] \cap A_{a-1, n-1}^{\prime}\right)$ for $n \geq 1$ and $0<a<c$. By independence and (7.6), $P\left(A_{a, n}\right)=p P\left(A_{a+1, n-1}\right)+ q P\left(A_{a-1, n-1}\right)$; adding over $n$ now gives (7.5). Note that this argument involves the entire infinite sequence $X_{1}, X_{2}, \ldots$.

It remains to solve the difference equation (7.5) with the side conditions $s_{c}(0)=0, s_{c}(c)=1$. Let $\rho=q / p$ be the odds against the gambler. Then [A19] there exist constants $A$ and $B$ such that, for $0 \leq a \leq c, s_{c}(a)=A+B \rho^{a}$ if $p \neq q$ and $s_{c}(a)=A+B a$ if $p=q$. The requirements $s_{c}(0)=0$ and $s_{c}(c)=1$ determine $A$ and $B$, which gives the solution:

The probability that the gambler can before ruin attain his goal of $c$ from an initial capital of a is

$$
s_{c}(a)= \begin{cases}\frac{\rho^{a}-1}{\rho^{c}-1}, & 0 \leq a \leq c,  \tag{7.7}\\ \frac{a}{c}, & \text { if } \rho=\frac{q}{p} \neq 1, \\ 0 \leq a \leq c, & \text { if } \rho=\frac{q}{p}=1 .\end{cases}
$$

Example 7.1. The gambler's initial capital is $\$ 900$ and his goal is $\$ 1000$. If $p=\frac{1}{2}$, his chance of success is very good: $s_{1000}(900)=.9$. At red-and-black, $p=\frac{18}{38}$ and hence $\rho=\frac{20}{18}$; in this case his chance of success as computed by (7.7) is only about .00003 .

Example 7.2. It is the gambler's desperate intention to convert his $\$ 100$ into $\$ 20,000$. For a game in which $p=\frac{1}{2}$ (no casino has one), his chance of success is $100 / 20,000=.005$; at red-and-black it is minute-about $3 \times 10^{-911}$

In the analysis leading to (7.7), replace (7.2) by (7.3). It follows that (7.7) with $p$ and $q$ interchanged ( $\rho$ goes to $\rho^{-1}$ ) and $a$ and $c-a$ interchanged gives the probability $r_{c}(a)$ of ruin for the gambler: $r_{c}(a)=\left(\rho^{-(c-a)}-1\right)$ / $\left(\rho^{-c}-1\right)$ if $\rho \neq 1$ and $r_{c}(a)=(c-a) / c$ if $\rho=1$. Hence $s_{c}(a)+r_{c}(a)=1$ holds in all cases: The probability is 0 that play continues forever.

For positive integers $a$ and $b$, let

$$
H_{a, b}=\bigcup_{n=1}^{\infty}\left\{\left[S_{n}=b\right] \cap \bigcap_{k=1}^{n-1}\left[-a<S_{k}<b\right]\right\}
$$

be the event that $S_{n}$ reaches $+b$ before reaching $-a$. Its probability is simply (7.7) with $c=a+b: P\left(H_{a, b}\right)=s_{a+b}(a)$. Now let

$$
H_{b}=\bigcup_{a=1}^{\infty} H_{a, b}=\bigcup_{n=1}^{\infty}\left[S_{n}=b\right]=\left[\sup _{n} S_{n} \geq b\right]
$$

be the event that $S_{n}$ ever reaches $+b$. Since $H_{a, b} \uparrow H_{b}$ as $a \rightarrow \infty$, it follows that $P\left(H_{b}\right)=\lim _{a} s_{a+b}(a)$; this is 1 if $\rho=1$ or $\rho<1$, and it is $1 / \rho^{b}$ if $\rho>1$. Thus

$$
P\left[\sup _{n} S_{n} \geq b\right]= \begin{cases}1 & \text { if } p \geq q  \tag{7.8}\\ (p / q)^{b} & \text { if } p<q\end{cases}
$$

This is the probability that a gambler with unlimited capital can ultimately gain $b$ units.

Example 7.3. The gambler in Example 7.1 has capital 900 and the goal of winning $b=100$; in Example 7.2 he has capital 100 and $b$ is 19,900 . Suppose, instead, that his capital is infinite. If $p=\frac{1}{2}$, the chance of achieving his goal increases from .9 to 1 in the first example and from .005 to 1 in the second. At red-and-black, however, the two probabilities $.9^{100}$ and $.9^{19900}$ remain essentially what they were before ( .00003 and $3 \times 10^{-911}$ ).

## Selection Systems

Players often try to improve their luck by betting only when in the preceding trials the wins and losses form an auspicious pattern. Perhaps the gambler bets on the $n$th trial only when among $X_{1}, \ldots, X_{n-1}$ there are many more +1 's than -1 's, the idea being to ride winning streaks (he is "in the vein"). Or he may bet only when there are many more -1 's than +1 's, the idea being it is then surely time a +1 came along (the "maturity of the chances"). There is a mathematical theorem that, translated into gaming language, says all such systems are futile.

It might be argued that it is sensible to bet if among $X_{1}, \ldots, X_{n-1}$ there is an excess of +1 's, on the ground that it is evidence of a high value of $p$. But it is assumed throughout that statistical inference is not at issue: $p$ is fixed-at $\frac{18}{38}$, for example, in the case of red-and-black-and is known to the gambler, or should be.

The gambler's strategy is described by random variables $B_{1}, B_{2}, \ldots$ taking the two values 0 and 1 : If $B_{n}=1$, the gambler places a bet on the $n$th trial; if $B_{n}=0$, he skips that trial. If $B_{n}$ were $\left(X_{n}+1\right) / 2$, so that $B_{n}=1$ for $X_{n}=+1$ and $B_{n}=0$ for $X_{n}=-1$, the gambler would win every time he bet, but of course such a system requires he be prescient-he must know the outcome $X_{n}$ in advance. For this reason the value of $B_{n}$ is assumed to depend only on the values of $X_{1}, \ldots, X_{n-1}$ : there exists some function $b_{n}: R^{n-1} \rightarrow R^{1}$ such that

$$
\begin{equation*}
B_{n}=b_{n}\left(X_{1}, \ldots, X_{n-1}\right) . \tag{7.9}
\end{equation*}
$$

(Here $B_{1}$ is constant.) Thus the mathematics avoids, as it must, the question of whether prescience is actually possible.

Define

$$
\left\{\begin{array}{l}
\mathscr{F}_{n}=\sigma\left(X_{1}, \ldots, X_{n}\right), \quad n=1,2, \ldots  \tag{7.10}\\
\mathscr{F}_{0}=\{\varnothing, \Omega\} .
\end{array}\right.
$$

The $\sigma$-field $\mathscr{F}_{n-1}$ generated by $X_{1}, \ldots, X_{n-1}$ corresponds to a knowledge of the outcomes of the first $n-1$ trials. The requirement (7.9) ensures that $B_{n}$ is measurable $\mathscr{F}_{n-1}$ (Theorem 5.1) and so depends only on the information actually available to the gambler just before the $n$th trial.

For $n=1,2, \ldots$, let $N_{n}$ be the time at which the gambler places his $n$th bet. This $n$th bet is placed at time $k$ or earlier if and only if the number $\sum_{i=1}^{k} B_{i}$ of bets placed up to and including time $k$ is $n$ or more; in fact, $N_{n}$ is the smallest $k$ for which $\sum_{i=1}^{k} B_{i}=n$. Thus the event $\left[N_{n} \leq k\right]$ coincides with $\left[\sum_{i=1}^{k} B_{i} \geq n\right]$; by (7.9) this latter event lies in $\sigma\left(B_{1}, \ldots, B_{k}\right) \subset \sigma\left(X_{1}, \ldots, X_{k-1}\right)=\mathscr{F}_{k-1}$. Therefore,

$$
\begin{equation*}
\left[N_{n}=k\right]=\left[N_{n} \leq k\right]-\left[N_{n} \leq k-1\right] \in \mathscr{F}_{k-1} . \tag{7.11}
\end{equation*}
$$

(Even though $\left[N_{n}=k\right]$ lies in $\mathscr{F}_{k-1}$ and hence in $\mathscr{F}, N_{n}$ is, as a function on $\Omega$, generally not a simple random variable, because it has infinite range. This makes no difference, because expected values of the $N_{n}$ will play no role; (7.11) is the essential property.)

To ensure that play continues forever (stopping rules will be considered later) and that the $N_{n}$ have finite values with probability 1 , make the further assumption that

$$
\begin{equation*}
P\left[B_{n}=1 \text { i.o. }\right]=1 . \tag{7.12}
\end{equation*}
$$

A sequence $\left\{B_{n}\right\}$ of random variables assuming the values 0 and 1 , having the form (7.9), and satisfying (7.12) is a selection system.

Let $Y_{n}$ be the gambler's gain on the $n$th of the trials at which he does bet: $Y_{n}=X_{N_{n}}$. It is only on the set [ $B_{n}=1 \mathrm{i} . \mathrm{o}$ ] that all the $N_{n}$ and hence all the $Y_{n}$ are well defined. To complete the definition, set $Y_{n}=-1$, say, on $\left[B_{n}=1\right.$ i.o. ${ }^{c}$; since this set has probability 0 by (7.12), it really makes no difference how $Y_{n}$ is defined on it.

Now $Y_{n}$ is a complicated function on $\Omega$ because $Y_{n}(\omega)=X_{N_{n}(\omega)}(\omega)$. Nonetheless,

$$
\left[\omega: Y_{n}(\omega)=1\right]=\bigcup_{k=1}^{\infty}\left(\left[\omega: N_{n}(\omega)=k\right] \cap\left[\omega: X_{k}(\omega)=1\right]\right)
$$

lies in $\mathscr{F}$, and so does its complement $\left[\omega: Y_{n}(\omega)=-1\right]$. Hence $Y_{n}$ is a simple random variable.

Example 7.4. An example will fix these ideas. Suppose that the rule is always to bet on the first tiail, to bet on the second trial if and only if $X_{1}=+1$, to bet on the third trial if and only if $X_{1}=X_{2}$, and to bet on all subsequent trails. Here $B_{1}=1,\left[B_{2}=1\right]=\left[X_{1}=+1\right],\left[B_{3}=1\right]=\left[X_{1}=X_{2}\right]$, and $B_{4}=B_{5}=\cdots=1$. The table shows the ways the gambling can start out. A dot represents a value undetermined by $X_{1}, X_{2}, X_{3}$. Ignore the rightmost column for the moment.

| $X_{1}$ | $X_{2}$ | $X_{3}$ | $B_{1}$ | $B_{2}$ | $B_{3}$ | $N_{1}$ | $N_{2}$ | $N_{3}$ | $N_{4}$ | $Y_{1}$ | $Y_{2}$ | $Y_{3}$ | $\tau$ |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| -1 | -1 | -1 | 1 | 0 | 1 | 1 | 3 | 4 | 5 | -1 | -1 | . | 1 |
| -1 | -1 | +1 | 1 | 0 | 1 | 1 | 3 | 4 | 5 | -1 | +1 | - | 1 |
| -1 | +1 | -1 | 1 | 0 | 0 | 1 | 4 | 5 | 6 | -1 | - | . | 1 |
| -1 | +1 | +1 | 1 | 0 | 0 | 1 | 4 | 5 | 6 | -1 | - | - | 1 |
| +1 | -1 | -1 | 1 | 1 | 0 | 1 | 2 | 4 | 5 | +1 | -1 | - | 2 |
| +1 | -1 | +1 | 1 | 1 | 0 | 1 | 2 | 4 | 5 | +1 | -1 | - | 2 |
| +1 | +1 | -1 | 1 | 1 | 1 | 1 | 2 | 3 | 4 | +1 | +1 | -1 | 3 |
| +1 | +1 | +1 | 1 | 1 | 1 | 1 | 2 | 3 | 4 | +1 | +1 | +1 |  |

In the evolution represented by the first line of the table, the second bet is placed on the third trial ( $N_{2}=3$ ), which results in a loss because $Y_{2}=X_{N_{2}}= X_{3}=-1$. Since $X_{3}=-1$, the gambler was "wrong" to bet. But remember that before the third trial he does not know $X_{3}(\omega)$ (much less $\omega$ itself); he knows only $X_{1}(\omega)$ and $X_{2}(\omega)$. See the discussion in Example 5.5. $\square$

Selection systems achieve nothing because $\left\{Y_{n}\right\}$ has the same structure as $\left\{X_{n}\right\}$ :

Theorem 7.1. For every selection system, $\left\{Y_{n}\right\}$ is independent and $P\left[Y_{n}=\right. +1]=p, P\left[Y_{n}=-1\right]=q$.

Proof. Since random variables with indices that are themselves random variables are conceptually confusing at first, the $\omega$ 's here will not be suppressed as they have been in previous proofs.

Relabel $p$ and $q$ as $p(+1)$ and $p(-1)$, so that $P\left[\omega: X_{k}(\omega)=x\right]=p(x)$ for $x= \pm 1$. If $A \in \mathscr{F}_{k-1}$, then $A$ and $\left[\omega: X_{k}(\omega)=x\right]$ are independent, and so $P\left(A \cap\left[\omega: X_{k}(\omega)=x\right]\right)=P(A) p(x)$. Therefore, by (7.11),

$$
\begin{aligned}
P\left[\omega: Y_{n}(\omega)=x\right] & =P\left[\omega: X_{N_{n}(\omega)}(\omega)=x\right] \\
& =\sum_{k=1}^{\infty} P\left[\omega: N_{n}(\omega)=k, X_{k}(\omega)=x\right] \\
& =\sum_{k=1}^{\infty} P\left[\omega: N_{n}(\omega)=k\right] p(x) \\
& =p(x) .
\end{aligned}
$$

More generally, for any sequence $x_{1}, \ldots, x_{n}$ of $\pm 1$ 's,

$$
\begin{aligned}
P\left[\omega: Y_{i}(\omega)=x_{i}, i \leq n\right] & =P\left[\omega: X_{N_{i}(\omega)}(\omega)=x_{i}, i \leq n\right] \\
& =\sum_{k_{1}<\cdots<k_{n}} P\left[\omega: N_{i}(\omega)=k_{i}, X_{k_{i}}(\omega)=x_{i}, i \leq n\right],
\end{aligned}
$$

where the sum extends over $n$-tuples of positive integers satisfying $k_{1}<\cdots <k_{n}$. The event $\left[\omega: N_{i}(\omega)=k_{i}, i \leq n\right] \cap\left[\omega: X_{k_{i}}(\omega)=x_{i}, i<n\right]$ lies in $\mathscr{F}_{k_{n}-1}$ (note that there is no condition on $X_{k_{n}}(\omega)$ ), and therefore

$$
\begin{aligned}
& P\left[\omega: Y_{i}(\omega)=x_{i}, i \leq n\right] \\
& =\sum_{k_{1}<} P\left(\left[\omega: N_{i}(\omega)=k_{i}, i \leq n\right]\right. \\
& \left.\quad \cap\left[\omega: X_{k_{i}}(\omega)=x_{i}, i<n\right]\right) p\left(x_{n}\right) .
\end{aligned}
$$

Summing $k_{n}$ over $k_{n-1}+1, k_{n-1}+2, \ldots$ brings this last sum to

$$
\begin{aligned}
& \sum_{<k_{n-1}<} P\left[\omega: N_{i}(\omega)=k_{i}, X_{k_{i}}(\omega)=x_{i}, i<n\right] p\left(x_{n}\right) \\
& =P\left[\omega: X_{N_{i}(\omega)}(\omega)=x_{i}, i<n\right] p\left(x_{n}\right) \\
& =P\left[\omega: Y_{i}(\omega)=x_{i}, i<n\right] p\left(x_{n}\right)
\end{aligned}
$$

It follows by induction that

$$
P\left[\omega: Y_{i}(\omega)=x_{i}, i \leq n\right]=\prod_{i \leq n} p\left(x_{i}\right)=\prod_{i \leq n} P\left[\omega: Y_{i}(\omega)=x_{i}\right],
$$

and so the $Y_{i}$ are independent (see (5.9)). $\square$

## Gambling Policies

There are schemes that go beyond selection systems and tell the gambler not only whether to bet but how much. Gamblers frequently contrive or adopt such schemes in the confident expectation that they can, by pure force of arithmetic, counter the most adverse workings of chance. If the wager specified for the $n$th trial is in the amount $W_{n}$ and the gambler cannot see into the future, then $W_{n}$ must depend only on $X_{1}, \ldots, X_{n-1}$. Assume therefore that $W_{n}$ is a nonnegative function of these random variables: there is an $f_{n}: R^{n-1} \rightarrow R^{1}$ such that

$$
\begin{equation*}
W_{n}=f_{n}\left(X_{1}, \ldots, X_{n-1}\right) \geq 0 . \tag{7.13}
\end{equation*}
$$

Apart from nonnegativity there are at the outset no constraints on the $f_{n}$, although in an actual casino their values must be integral multiples of a basic unit. Such a sequence $\left\{W_{n}\right\}$ is a betting system. Since $W_{n}=0$ corresponds to a decision not to bet at all, betting systems in effect include selection systems. In the double-or-nothing system, $W_{n}=2^{n-1}$ if $X_{1}=\cdots=X_{n-1}=-1$ ( $W_{1}=$ 1) and $W_{n}=0$ otherwise.

The amount the gambler wins on the $n$th play is $W_{n} X_{n}$. If his fortune at time $n$ is $F_{n}$, then

$$
\begin{equation*}
F_{n}=F_{n-1}+W_{n} X_{n} . \tag{7.14}
\end{equation*}
$$

This also holds for $n=1$ if $F_{0}$ is taken as his initial (nonrandom) fortune. It is convenient to let $W_{n}$ depend on $F_{0}$ as well as the past history of play and hence to generalize (7.13) to

$$
\begin{equation*}
W_{n}=g_{n}\left(F_{0}, X_{1}, \ldots, X_{n-1}\right) \geq 0 \tag{7.15}
\end{equation*}
$$

for a function $g_{n}: R^{n} \rightarrow R^{1}$. In expanded notation, $W_{n}(\omega)=g_{n}\left(F_{0}, X_{1}(\omega)\right.$, $\ldots, X_{n-1}(\omega)$ ). The symbol $W_{n}$ does not show the dependence on $\omega$ or on $F_{0}$, either. For each fixed initial fortune $F_{0}, W_{n}$ is a simple random variable; by (7.15) it is measurable $\mathscr{F}_{n-1}$. Similarly, $F_{n}$ is a function of $F_{0}$ as well as of $X_{1}(\omega), \ldots, X_{n}(\omega): F_{n}=F_{n}\left(F_{0}, \omega\right)$.

If $F_{0}=0$ and $g_{n} \equiv 1$, the $F_{n}$ reduce to the partial sums (7.1).
Since $\mathscr{F}_{n-1}$ and $\sigma\left(X_{n}\right)$ are independent, and since $W_{n}$ is measurable $\mathscr{F}_{n-1}$ (for each fixed $\left.F_{0}\right), W_{n}$ and $X_{n}$ are independent. Therefore, $E\left[W_{n} X_{n}\right] =E\left[W_{n}\right] \cdot E\left[X_{n}\right]$. Now $E\left[X_{n}\right]=p-q \leq 0$ in the subfair case ( $p \leq \frac{1}{2}$ ), with equality in the fair case ( $p=\frac{1}{2}$ ). Since $E\left[W_{n}\right] \geq 0$, (7.14) implies that $E\left[F_{n}\right] \leq E\left[F_{n-1}\right]$. Therefore,

$$
\begin{equation*}
F_{0} \geq E\left[F_{1}\right] \geq \cdots \geq E\left[F_{n}\right] \geq \cdots \tag{7.16}
\end{equation*}
$$

in the subfair case, and

$$
\begin{equation*}
F_{0}=E\left[F_{1}\right]=\cdots=E\left[F_{n}\right]=\cdots \tag{7.17}
\end{equation*}
$$

in the fair case. (If $p<q$ and $P\left[W_{n}>0\right]>0$, there is strict inequality in (7.16).) Thus no betting system can convert a subfair game into a profitable enterprise.

Suppose that in addition to a betting system, the gambler adopts some policy for quitting. Perhaps he stops when his fortune reaches a set target, or his funds are exhausted, or the auguries are in some way dissuasive. The decision to stop must depend only on the initial fortune and the history of play up to the present.

Let $\tau\left(F_{0}, \omega\right)$ be a nonnegative integer for each $\omega$ in $\Omega$ and each $F_{0} \geq 0$. If $\tau=n$, the gambler plays on the $n$th trial (betting $W_{n}$ ) and then stops; if $\tau=0$, he does not begin gambling in the first place. The event $\left[\omega ; \tau\left(F_{0}, \omega\right)=n\right]$ represents the decision to stop just after the $n$th trial, and so, whatever value $F_{0}$ may have, it must depend only on $X_{1}, \ldots, X_{n}$. Therefore, assume that

$$
\begin{equation*}
\left[\omega: \tau\left(F_{0}, \omega\right)=n\right] \in \mathscr{F}_{n}, \quad n=0,1,2, \ldots \tag{7,18}
\end{equation*}
$$

A $\tau$ satisfying this requirement is a stopping time. (In general it has infinite range and hence is not a simple random variable; as expected values of $\tau$ play no role here, this does not matter.) It is technically necessary to let $\tau\left(F_{0}, \omega\right)$ be undefined or infinite on an $\omega$-set of probability 0 . This has no effect on the requirement (7.18), which must hold for each finite $n$. But it is assumed that $\tau$ is finite with probability 1: play is certain to terminate.

A betting system together with a stopping time is a gambling policy. Let $\pi$ denote such a policy.

Example 7.5. Suppose that the betting system is given by $W_{n}=B_{n}$, with $B_{n}$ as in Example 7.4. Suppose that the stopping rule is to quit after the first
loss of a wager. Therr $[\tau=n]=\bigcup_{k=1}^{n}\left[N_{k}=n, Y_{1}=\cdots=Y_{k-1}=+1, Y_{k}=\right. -1]$. For $j \leq k \leq n,\left[N_{k}=n, Y_{j}=x\right]=\bigcup_{m=1}^{n}\left[N_{k}=n, N_{j}=m, X_{m}=x\right]$ lies in $\mathscr{F}_{n}$ by (7.11); hence $\tau$ is a stopping time. The values of $\tau$ are shown in the rightmost column of the table. $\square$

The sequence of fortunes is governed by (7.14) until play terminates, and then the fortune remains for all future time fixed at $F_{\tau}$ (with value $F_{\tau\left(F_{0}, \omega\right)}(\omega)$ ). Therefore, the gambler's fortune at time $n$ is

$$
F_{n}^{*}= \begin{cases}F_{n} & \text { if } \tau \geq n,  \tag{7.19}\\ F_{\tau} & \text { if } \tau \leq n,\end{cases}
$$

Note that the case $\tau=n$ is covered by both clauses here If $n-1<n \leq \tau$, then $F_{n}^{*}=F_{n}=F_{n-1}+W_{n} X_{n}=F_{n-1}^{*}+W_{n} X_{n}$; if $\tau \leq n-1<n$, then $F_{n}^{*}= F_{\tau}=F_{n-1}^{*}$. Therefore, if $W_{n}^{*}=I_{[\tau \geq n]} W_{n}$, then

$$
\begin{equation*}
F_{n}^{*}=F_{n-1}^{*}+I_{[-\geq n]} W_{n} X_{n}=F_{n-1}^{*}+W_{n}^{*} X_{n} . \tag{7.20}
\end{equation*}
$$

But this is the equation for a new betting system in which the wager placed at time $n$ is $W_{n}^{*}$. If $\tau \geq n$ (play has not already terminated), $W_{n}^{*}$ is the old amount $W_{n}$; if $\tau<n$ (play has terminated), $W_{n}^{*}$ is 0 . Now by (7.18), $[\tau \geq n]= [\tau<n]^{c}$ lies in $\mathscr{F}_{n-1}$. Thus $I_{[\tau \geq n]}$ is measurable $\mathscr{F}_{n-1}$, so that $W_{n}^{*}$ as well as $W_{n}$ is measurable $\mathscr{F}_{n-1}$, and $\left\{W_{n}^{*}\right\}$ represents a legitimate betting system. Therefore, (7.16) and (7.17) apply to the new system:

$$
\begin{equation*}
F_{0}=F_{0}^{*} \geq E\left[F_{1}^{*}\right] \geq \cdots \geq E\left[F_{n}^{*}\right] \geq \cdots \tag{7.21}
\end{equation*}
$$

if $p \leq \frac{1}{2}$, and

$$
\begin{equation*}
F_{0}=F_{0}^{*}=E\left[F_{1}^{*}\right]=\cdots=E\left[F_{n}^{*}\right]=\ldots \tag{7.22}
\end{equation*}
$$

if $p=\frac{1}{2}$.
The gambler's ultimate fortune is $F_{\tau}$. Now $\lim _{n} F_{n}^{*}=F_{\tau}$ with probability 1 , since in fact $F_{n}^{*}=F_{\tau}$ for $n \geq \tau$. If

$$
\begin{equation*}
\lim _{n} E\left[F_{n}^{*}\right]=E\left[F_{\tau}\right] \tag{7.23}
\end{equation*}
$$

then (7.21) and (7.22), respectively, imply that $E\left[F_{\tau}\right] \leq F_{0}$ and $E\left[F_{\tau}\right]=F_{\mathrm{o}}$. According to Theorem 5.4, (7.23) does hold if the $F_{n}^{*}$ are uniformly bounded.

Call the policy bounded by $M$ ( $M$ nonrandom) if

$$
\begin{equation*}
0 \leq F_{n}^{*} \leq M, \quad n=0,1,2, \ldots \tag{7.24}
\end{equation*}
$$

If $F_{n}^{*}$ is not bounded above, the gambler's adversary must have infinite capital. A negative $F_{n}^{*}$ represents a debt, and if $F_{n}^{*}$ is not bounded below,
the gambler must have a patron of infinite wealth and generosity from whom to borrow and so must in effect have infinite capital. In case $F_{n}^{*}$ is bounded below, 0 is the convenient lower bound-the gambler is assumed to have in hand all the capital to which he has access. In any real case, (7.24) holds and (7.23) follows. (There is a technical point that arises because the general theory of integration has been postponed: $F_{\tau}$ must be assumed to have finite range so that it will be a simple random variable and hence have an expected value in the sense of Section 5.') The argument has led to this result:

Theorem 7.2. For every policy, (7.21) holds if $p \leq \frac{1}{2}$ and (7.22) holds if $p= \frac{1}{2}$. If the policy is bounded (and $F_{\tau}$ has finite range), then $E\left[F_{\tau}\right] \leq F_{0}$ for $p \leq \frac{1}{2}$ and $E\left[F_{\tau}\right]=F_{0}$ for $p=\frac{1}{2}$.

Example 7.6. The gambler has initial capital $a$ and plays at unit stakes until his capital increases to $c(0 \leq a \leq c)$ or he is ruined. Here $F_{0}=a$ and $W_{n}=1$, and so $F_{n}=a+S_{n}$. The policy is bounded by $c$, and $F_{\tau}$ is $c$ or 0 according as the gambler succeeds or fails. If $p=\frac{1}{2}$ and if $s$ is the probability of success, then $a=F_{0}=E\left[F_{1}\right]=s c$. Thus $s=a / c$. This gives a new derivation of (7.7) for the case $p=\frac{1}{2}$. The argument assumes however that play is certain to terminate. If $p \leq \frac{1}{2}$, Theorem 7.2 only gives $s \leq a / c$, which is weaker than (7.7). $\square$

Example 7.7. Suppose as before that $F_{0}=a$ and $W_{n}=1$, so that $F_{n}=a+ S_{n}$, but suppose the stopping rule is to quit as soon as $F_{n}$ reaches $a+b$. Here $F_{n}^{*}$ is bounded above by $a+b$ but is not bounded below. If $p=\frac{1}{2}$, the gambler is by (7.8) certain to achieve his goal, so that $F_{\tau}=a+b$. In this case $F_{0}=a<a+b=E\left[F_{\tau}\right]$. This illustrates the effect of infinite capital. It also illustrates the need for uniform boundedness in Theorem 5.4 (compare Example 5.7). $\square$

For some other systems (gamblers call them "martingales"), see the problems. For most such systems there is a large chance of a small gain and a small chance of a large loss.

## Bold Play*

The formula (7.7) gives the chance that a gambler betting unit stakes can increase his fortune from $a$ to $c$ before being ruined. Suppose that $a$ and $c$ happen to be even and that at each trial the wager is two units instead of

[^20]one. Since this has the effect of halving $a$ and $c$, the chance of success is now
$$
\frac{\rho^{a / 2}-1}{\rho^{c / 2}-1}=\frac{\rho^{a}-1}{\rho^{c}-1} \frac{\rho^{c / 2}+1}{\rho^{a / 2}+1}, \quad \frac{q}{p}=\rho \neq 1 .
$$

If $\rho>1\left(p<\frac{1}{2}\right)$, the second factor on the right exceeds 1 : Doubling the stakes increases the probability of success in the unfavorable case $\rho>1$. In the case $\rho=1$, the probability remains the same.

There is a sense in which large stakes are optimal. It will be convenient to rescale so that the initial fortune satisfies $0 \leq F_{0} \leq 1$ and the goal is 1 . Tne policy of bold play is this: At each stage the gambler bets his entire fortune, unless a win would carry him past his goal of 1 , in which case he bets just enough that a win would exactly achieve that goal:

$$
W_{n}= \begin{cases}F_{n-1} & \text { if } 0 \leq F_{n-1} \leq \frac{1}{2}  \tag{7.25}\\ 1-F_{n-1} & \text { if } \frac{1}{2} \leq F_{n-1} \leq 1\end{cases}
$$

(It is convenient to allow even irrational fortunes.) As for stopping, the policy is to quit as soon as $F_{n}$ reaches 0 or 1 .

Suppose that play has not terminated by time $k-1$; under the policy (7.25), if play is not to terminate at time $k$, then $X_{k}$ must be +1 or -1 according as $F_{k-1} \leq \frac{1}{2}$ or $F_{k-1} \geq \frac{1}{2}$, and the conditional probability of this is at most $m=\max \{p, q\}$. It follows by induction that the probability that bold play continues beyond time $n$ is at most $m^{n}$, and so play is certain to terminate ( $\tau$ is finite with probability 1 ).

It will be shown that in the subfair case, bold play maximizes the probability of successfully reaching the goal of 1 . This is the Dubins-Savage theorem. It will further be shown that there are other policies that are also optimal in this sense, and this maximum probability will be calculated. Bold play can be substantially better than betting at constant stakes. This contrasts with Theorems 7.1 and 7.2 concerning respects in which gambling systems are worthless.

From now on, consider only policies $\pi$ that are bounded by 1 (see (7.24)). Suppose further that play stops as soon as $F_{n}$ reaches 0 or 1 and that this is certain eventually to happen. Since $F_{\tau}$ assumes the values 0 and 1 , and since $\left[F_{\tau}=x\right]=\bigcup_{n=0}^{\infty}[\tau=n] \cap\left[F_{n}=x\right]$ for $x=0$ and $x=1, F_{\tau}$ is a simple random variable. Bold play is one such policy $\pi$.

The policy $\pi$ leads to success if $F_{\tau}=1$. Let $Q_{\pi}(x)$ be the probability of this for an initial fortune $F_{0}=x$ :

$$
\begin{equation*}
Q_{\pi}(x)=P\left[F_{\tau}=1\right] \quad, \text { for } F_{0}=x \tag{7.26}
\end{equation*}
$$

Since $F_{n}$ is a function $\psi_{n}\left(F_{0}, X_{1}(\omega), \ldots, X_{n}(\omega)\right)=\Psi_{n}\left(F_{0}, \omega\right)$, (7.26) in expanded notation is $Q_{\pi}(x)=P\left[\omega: \Psi_{\tau(x, \omega)}(x, \omega)=1\right]$. As $\pi$ specifies that play stops at the boundaries 0 and 1 ,

$$
\begin{align*}
& Q_{\pi}(0)=0, \quad Q_{\pi}(1)=1 \\
& 0 \leq Q_{\pi}(x) \leq 1, \quad 0 \leq x \leq 1 \tag{7.27}
\end{align*}
$$

Let $Q$ be the $Q_{\pi}$ for bold play. (The notation does not show the dependence of $Q$ and $Q_{\pi}$ on $p$, which is fixed.)

Theorem 7.3. In the subfair case, $Q_{\pi}(x) \leq Q(x)$ for all $\pi$ and all $x$.

Proof. Under the assumption $p \leq q$, it will be shown later that

$$
\begin{equation*}
Q(x) \geq p Q(x+t)+q Q(x-t), \quad 0 \leq x-t \leq x \leq x+t \leq 1 . \tag{7.28}
\end{equation*}
$$

This can be interpreted as saying that the chance of success under bold play starting at $x$ is at least as great as the chance of success if the amount $t$ is wagered and bold play then pursued from $x+t$ in case of a win and from $x-t$ in case of a loss. Under the assumption of (7.28), optimality can be proved as follows.

Consider a policy $\pi$, and let $F_{n}$ and $F_{n}^{*}$ be the simple random variables defined by (7.14) and (7.19) for this policy. Now $Q(x)$ is a real function, and so $Q\left(F_{n}^{*}\right)$ is also a simple random variable; it can be interpreted as the conditional chance of success if $\pi$ is replaced by bold play after time $n$. By (7.20), $F_{n}^{*}=x+t X_{n}$ if $F_{n-1}^{*}=x$ and $W_{n}^{*}=t$. Therefore,

$$
Q\left(F_{n}^{*}\right)=\sum_{x, t} I_{\left[F_{n-1}^{*}=x, W_{n}^{*}=t\right]} Q\left(x+t X_{n}\right)
$$

where $x$ and $t$ vary over the (finite) ranges of $F_{n-1}^{*}$ and $W_{n}^{*}$, respectively.
For each $x$ and $t$, the indicator above is measurable $\mathscr{F}_{n-1}$ and $Q\left(x+t X_{n}\right)$ is measurable $\sigma\left(X_{n}\right)$; since the $X_{n}$ are independent, (5.25) and (5.17) give

$$
\begin{equation*}
E\left[Q\left(F_{n}^{*}\right)\right]=\sum_{x, t} P\left[F_{n-1}^{*}=x, W_{n}^{*}=t\right] E\left[Q\left(x+t X_{n}\right)\right] \tag{7.29}
\end{equation*}
$$

By (7.28), $E\left[Q\left(x+t X_{n}\right)\right] \leq Q(x)$ if $0 \leq x-t \leq x \leq x+t \leq 1$. As it is assumed of $\pi$ that $F_{n}^{*}$ lies in $[0,1]$ (that is, $W_{n}^{*} \leq \min \left\{F_{n-1}^{*}, 1-F_{n-1}^{*}\right\}$ ), the probability
in (7.29) is 0 unless $x$ and $t$ satisfy this constraint. Therefore,

$$
\begin{aligned}
E\left[Q\left(F_{n}^{*}\right)\right] & \leq \sum_{x, t} P\left[F_{n-1}^{*}=x, W_{n}^{*}=t\right] Q(x) \\
& =\sum_{x} P\left[F_{n-1}^{*}=x\right] Q(x)=E\left[Q\left(F_{n-1}^{*}\right)\right] .
\end{aligned}
$$

This is true for each $n$, and so $E\left[Q\left(F_{n}^{*}\right)\right] \leq E\left[Q\left(F_{0}^{*}\right)\right]=Q\left(F_{0}\right)$. Since $Q\left(F_{n}^{*}\right) =Q\left(F_{\tau}\right)$ for $n \geq \tau$, Theorem 5.4 implies that $E\left[Q\left(F_{\tau}\right)\right] \leq Q\left(F_{0}\right)$. Since $x=1$ implies that $Q(x)=1, P\left[F_{\tau}=1\right] \leq E\left[Q\left(F_{\tau}\right)\right] \leq Q\left(F_{0}\right)$. Thus $Q_{\pi}\left(F_{0}\right) \leq Q\left(F_{0}\right)$ for the policy $\pi$, whatever $F_{0}$ may be.

It remains to analyze $Q$ and prove (7.28). Everything hinges on the functional equation

$$
Q(x)= \begin{cases}p Q(2 x), & 0 \leq x \leq \frac{1}{2},  \tag{7.30}\\ p+q Q(2 x-1), & \frac{1}{2} \leq x \leq 1 .\end{cases}
$$

For $x=0$ and $x=1$ this is obvious because $Q(0)=0$ and $Q(1)=1$. The idea is this: Suppose that the initial fortune is $x$. If $x \leq \frac{1}{2}$, the first stake under bold play is $x$; if the gambler is to succeed in reaching 1 , he must win the first trial (probability $p$ ) and then from his new fortune $x+x=2 x$ go on to succeed (probability $Q(2 x)$ ); this makes the first half of (7.30) plausible. If $x \geq \frac{1}{2}$, the first stake is $1-x$; the gambler can succeed either by winning the first trial (probability $p$ ) or by losing the first trial (probability $q$ ) and then going on from his new fortune $x-(1-x)=2 x-1$ to succeed (probability $Q(2 x-1))$; this makes the second half of (7.30) plausible.

It is also intuitively clear that $Q(x)$ must be an increasing function of $x (0 \leq x \leq 1)$ : the more money the gambler starts with, the better off he is. Finally, it is intuitively clear that $Q(x)$ ought to be a continuous function of the initial fortune $x$.

A formal proof of (7.30) can be constructed as for the difference equation (7.5). If $\beta(x)$ is $x$ for $x \leq \frac{1}{2}$ and $1-x$ for $x \geq \frac{1}{2}$, then under bold play $W_{n}=\beta\left(F_{n-1}\right)$. Starting from $f_{0}(x)=x$, recursively define

$$
f_{n}\left(x ; x_{1}, \ldots, x_{n}\right)=f_{n-1}\left(x ; x_{1}, \ldots, x_{n-1}\right)+\beta\left(f_{n-1}\left(x ; x_{1}, \ldots, x_{n-1}\right)\right) x_{n} .
$$

Then $F_{n}=f_{n}\left(F_{0} ; X_{1}, \ldots, X_{n}\right)$. Now define

$$
g_{n}\left(x ; x_{1}, \ldots, x_{n}\right)=\max _{0 \leq k \leq n} f_{k}\left(x ; x_{1}, \ldots, x_{k}\right) .
$$

If $F_{0}=x$, then $T_{n}(x)=\left[g_{n}\left(x ; X_{1}, \ldots, X_{n}\right)=1\right]$ is the event that bold play will by time $n$ successfully increase the gambler's fortune to 1 . From the recursive definition it
follows by induction on $n$ that for $n \geq 1, f_{n}\left(x ; x_{1}, \ldots, x_{n}\right)=f_{n-1}\left(x+\beta(x) x_{1}\right.$; $\left.x_{2}, \ldots, x_{n}\right)$ and hence that $g_{n}\left(x ; x_{1}, \ldots, x_{n}\right)=\max \left\{x, g_{n-1}\left(x+\beta(x) x_{1} ; x_{2}, \ldots, x_{n}\right)\right\}$. Since $x=1$ implies $g_{n-1}\left(x+\beta(x) x_{1} ; x_{2}, \ldots, x_{n}\right) \geq x+\beta(x) x_{1}=1, T_{n}(x)=\left[g_{n-1}(x+\right. \left.\left.\beta(x) X_{1} ; X_{2}, \ldots, X_{n}\right)=1\right]$, and since the $X_{i}$ are independent and identically distributed, $P\left(T_{n}(x)\right)=P\left(\left[X_{1}=+1\right] \cap T_{n}(x)\right)+P\left(\left[X_{1}=-1\right] \cap T_{n}(x)\right)= p P\left[g_{n-1}\left(x+\beta(x) ; X_{2}, \ldots, X_{n}\right)=1\right]+q P\left[z_{n-1}\left(x-\beta(x) ; X_{2}, \ldots, X_{n}\right)=p P\left(T_{n-1}(x+\right.\right. \beta(x)))+q P\left(T_{n-1}(x-\beta(x))\right)$. Letting $n \rightarrow \infty$ now gives $Q(x)=p Q(x+\beta(x)) +q Q(x-\beta(x))$, which reduces to (7.30) because $Q(0)=0$ and $Q(1)=1$.

Suppose that $y=f_{n-1}\left(x ; x_{1}, \quad, x_{n-1}\right)$ is nondecreasing in $x$. If $x_{n}=+1$, then $f_{n}\left(x ; x_{1}, \ldots, x_{n}\right)$ is $2 y$ if $0 \leq y \leq \frac{1}{2}$ and 1 if $\frac{1}{2} \leq y \leq 1$; if $x_{n}=-1$, then $f_{n}\left(x ; x_{1}, \ldots, x_{n}\right)$ is 0 if $0 \leq y \leq \frac{1}{2}$ and $2 y-1$ if $\frac{1}{2} \leq y \leq 1$. In any case, $f_{n}\left(x ; x_{1}, \ldots, x_{n}\right)$ is also nondecreasing in $x$, and by induction this is true for every $n$. It follows that the same is true of $g_{n}\left(x ; x_{1}, \ldots, x_{n}\right)$, of $P\left(T_{n}(x)\right)$, and of $Q(x)$. Thus $Q(x)$ is nondecreasing.

Since $Q(1)=1$, (7.30) implies that $Q\left(\frac{1}{2}\right)=p Q(1)=p, Q\left(\frac{1}{4}\right)=p Q\left(\frac{1}{2}\right)=p^{2}, Q\left(\frac{3}{4}\right)= p+q Q\left(\frac{1}{2}\right)=p+p q$ More generally, if $p_{0}=p$ and $p_{1}=q$, then

$$
\begin{equation*}
Q\left(\frac{k}{2^{n}}\right)=\sum\left[p_{u_{1}} \cdots p_{u_{n}}: \sum_{i=1}^{r} \frac{u_{i}}{2^{i}}<\frac{k}{2^{n}}\right], \quad 0<k \leq 2^{n}, \quad n \geq 1, \tag{7.31}
\end{equation*}
$$

the sum extending over $n$-tuples ( $u_{1}, \ldots, u_{n}$ ) of 0 's and 1 's satisfying the condition indicated. Indeed, it is easy to see that (7.31) is the same thing as

$$
\begin{equation*}
Q\left(. u_{1} \ldots u_{n}+2^{-n}\right)-Q\left(. u_{1} . . u_{n}\right)=p_{u_{1}} p_{u_{2}} \ldots p_{u_{n}} \tag{7.32}
\end{equation*}
$$

for each dyadic rational $u_{1} \ldots u_{n}$ of rank $n$. If $u_{1} \ldots u_{n}+2^{-n} \leq \frac{1}{5}$, then $u_{1}=0$ and by (7.30) the difference in (7.32) is $p_{0}\left[Q\left(. u_{2} \ldots u_{n}+2^{-n+1}\right)-Q\left(. u_{2} \ldots u_{n}\right)\right]$. But (7.32) follows inductively from this and a similar relation for the case $. u_{1} \ldots u_{n} \geq \frac{1}{2}$.

Therefore $Q\left(k 2^{-n}\right)-Q\left((k-1) 2^{-n}\right)$ is bounded by $\max \left\{p^{n}, q^{n}\right\}$, and so by monotonicity $Q$ is continuous. Since (7.32) is positive, it follows that $Q$ is strictly increasing over $[0,1]$.

Thus $Q$ is continuous and increasing and satisfies (7.30). The inequality (7.28) is still to be proved. It is equivalent to the assertion that

$$
\Delta(r, s)=Q(a)-p Q(s)-q Q(r) \geq 0
$$

if $0 \leq r \leq s \leq 1$, where $a$ stands for the average: $a=\frac{1}{2}(r+s)$. Since $Q$ is continuous, it suffices to prove the inequality for $r$ and $s$ of the form $k / 2^{n}$, and this will be done by induction on $n$. Checking all cases disposes of $n=0$. Assume that the inequality holds for a particular $n$, and that $r$ and $s$ have the form $k / 2^{n+1}$. There are four cases to consider.

Case 1. $s \leq \frac{1}{2}$. By the first part of (7.30), $\Delta(r, s)=p \Delta(2 r, 2 s)$. Since $2 r$ and $2 s$ have the form $k / 2^{n}$, the induction hypothesis implies that $\Delta(2 r, 2 s) \geq 0$.

Case 2. $\frac{1}{2} \leq r$. By the second part of (7.30),

$$
\Delta(r, s)=q \Delta(2 r-1,2 s-1) \geq 0
$$

Case 3. $r \leq a \leq \frac{1}{2} \leq s$. By (7.30),

$$
\Delta(r, s)=p Q(2 a)-p[p+q Q(2 s-1)]-q[p Q(2 r)] .
$$

From $\frac{1}{2} \leq s \leq r+s=2 a \leq 1$, follows $Q(2 a)=p+q Q(4 a-1)$; and from $0 \leq 2 a-\frac{1}{2} \leq \frac{1}{2}$, follows $Q\left(2 a-\frac{1}{2}\right)=p Q(4 a-1)$. Therefore, $p Q(2 a)=p^{2}+ q Q\left(2 a-\frac{1}{2}\right)$, and it follows that

$$
\Delta(r, s)=q\left[Q\left(2 a-\frac{1}{2}\right)-p Q(2 s-1)-p Q(2 r)\right] .
$$

Since $p \leq q$, the right side does not increase if either of the two $p$ 's is changed to $q$. Hence

$$
\Delta(r, s) \geq q \max [\Delta(2 r, 2 s-1), \Delta(2 s-1,2 r)] .
$$

The induction hypothesis applies to $2 r \leq 2 s-1$ or to $2 s-1 \leq 2 r$, as the case may be, so one of the two $\Delta$ 's on the right is nonnegative.

Case 4. $r \leq \frac{1}{2} \leq a \leq s$. By (7.30),

$$
\Delta(r, s)=p q+q Q(2 a-1)-p q Q(2 s-1)-p q Q(2 r) .
$$

From $0 \leq 2 a-1=r+s-1 \leq \frac{1}{2}$, follows $Q(2 a-1)=p Q(4 a-2)$; and from $\frac{1}{2} \leq 2 a-\frac{1}{2}=r+s-\frac{1}{2} \leq 1$, follows $Q\left(2 a-\frac{1}{2}\right)=p+q Q(4 a-2)$. Therefore, $q Q(2 a-1)=p Q\left(2 a-\frac{1}{2}\right)-p^{2}$, and it follows that

$$
\Delta(r, s)=p\left[q-p+Q\left(2 a-\frac{1}{2}\right)-q Q(2 s-1)-q Q(2 r)\right] .
$$

If $2 s-1 \leq 2 r$, the right side here is

$$
p[(q-p)(1-Q(2 r))+\Delta(2 s-1,2 r)] \geq 0 .
$$

If $2 r \leq 2 s-1$, the right side is

$$
p[(q-p)(1-Q(2 s-1))+\Delta(2 r, 2 s-1)] \geq 0 .
$$

This completes the proof of (7.28) and hence of Theorem 7.3. $\square$

The equation (7.31) has an interesting interpretation. Let $Z_{1}, Z_{2}, \ldots$ be independent random variables satisfying $P\left[Z_{n}=0\right]=p_{0}=p$ and $P\left[Z_{n}=1\right]= p_{1}=q$. From $P\left[Z_{n}=1\right.$ i.o. $]=1$ and $\sum_{i>n} Z_{i} 2^{-i} \leq 2^{-n}$ it follows that $P\left[\sum_{i=1}^{\infty} Z_{i} 2^{-i} \leq k 2^{-n}\right] \leq P\left[\sum_{i=1}^{n} Z_{i} 2^{-i}<k 2^{-n}\right] \leq P\left[\sum_{i=1}^{\infty} Z_{i} 2^{-i} \leq k 2^{-n}\right]$. Since by (7.31) the middle term is $Q\left(k 2^{-n}\right)$,

$$
\begin{equation*}
Q(x)=P\left[\sum_{i=1}^{\infty} Z_{i} 2^{-i} \leq x\right] \tag{7.33}
\end{equation*}
$$

holds for dyadic rational $x$ and hence by continuity holds for all $x$. In Section $31, Q$ will reappear as a continuous, strictly increasing function singular in the sense of Lebesgue. On p. 408 is a graph for the case $p_{0}=.25$.

Note that $Q(x) \equiv x$ in the fair case $p=\frac{1}{2}$. In fact, for a bounded policy Theorem 7.2 implies that $E\left[F_{\tau}\right]=F_{0}$ in the fair case, and if the policy is to stop as soon as the fortune reaches 0 or 1 , then the chance of successfully reaching 1 is $P\left[F_{\tau}=1\right]=E\left[F_{\tau}\right]=F_{0}$. Thus in the fair case with initial fortune $x$, the chance of success is $x$ for every policy that stops at the boundaries, and $x$ is an upper bound even if stopping earlier is allowed.

Example 7.8. The gambler of Example 7.1 has capital $\$ 900$ and goal $\$ 1000$. For a fair game ( $p=\frac{1}{2}$ ) his chance of success is .9 whether he bets unit stakes or adopts bold play. At red-and-black ( $p=\frac{18}{38}$ ), his chance of success with unit stakes is .00003 ; an approximate calculation based on (7.31) shows that under bold play his chance $Q(.9)$ of success increases to about .88 , which compares well with the fair case. $\square$

Example 7.9. In Example 7.2 the capital is $\$ 100$ and the goal $\$ 20,000$. At unit stakes the chance of successes is .005 for $p=\frac{1}{2}$ and $3 \times 10^{-911}$ for $p=\frac{18}{38}$. Another approximate calculation shows that bold play at red-and-black gives the gambler probability about .003 of success, which again compares well with the fair case.

This example illustrates the point of Theorem 7.3. The gambler enters the casino knowing that he must by dawn convert his $\$ 100$ into $\$ 20,000$ or face certain death at the hands of criminals to whom he owes that amount. Only red-and-black is available to him. The question is not whether to gamble-he must gamble. The question is how to gamble so as to maximize the chance of survival, and bold play is the answer. $\square$

There are policies other than the bold one that achieve the maximum success probability $Q(x)$. Suppose that as long as the gambler's fortune $x$ is less than $\frac{1}{2}$ he bets $x$ for $x \leq \frac{1}{4}$ and $\frac{1}{2}-x$ for $\frac{1}{4} \leq x \leq \frac{1}{2}$. This is, in effect, the


[^0]:    *Stars indicate topics that may be omitted on a first reading.

[^1]:    ${ }^{\dagger}$ For the discrete theory, presupposed here, see for example the first half of Volume I of Feller. (Names in capital letters refer to the bibliography on p. 581)

[^2]:    ${ }^{\dagger}$ The standard $\epsilon$ and $\delta$ of analysis will always be understood to be positive.

[^3]:    ${ }^{\dagger}$ Émile Borel: Sur les probabilités dénombrables et leurs applications arithmétiques, Circ. Mat d. Palermo, 29 (1909), 247-271. See Dudley for excellent historical notes on analysis and probability.

[^4]:    *This topic may be omitted.
    ${ }^{\dagger}$ Although the fact is not technically necessary to the proof, these points are distinct: $\left\{q^{\prime} x\right\}=\left\{q^{\prime \prime} x\right\}$ implies $\left(q^{\prime \prime}-q^{\prime}\right) x=\left\lfloor q^{\prime \prime} x\right\rfloor-\left\lfloor q^{\prime} x\right\rfloor$, which in turn implies that $x$ is rational unless $q^{\prime}=q^{\prime \prime}$.
    ${ }^{4}$ This much of the proof goes through even if $x$ is rational.

[^5]:    *Many of the examples in the book simply illustrate the concepts at hand, but others contain definitions and facts needed subsequently
    ${ }^{\dagger}$ The term algebra is often used in place of field

[^6]:    ${ }^{\dagger}$ If $\Omega$ is the unit interval, for example, take $A=\left(0, \frac{1}{2}\right]$, say. To show that the general uncountable $\Omega$ contains such an $A$ requires the axiom of choice [A8]. As a matter of fact, to prove the existence of the sequence alluded to in Example 2.3 requires a form of the axiom of choice, as does even something so apparently down-to-earth as proving that a countable union of negligible sets is negligible. Most of us use the axiom of choice completely unaware of the fact Even Borel and Lebesgue did; see Wagon, pp. 217 ff.

[^7]:    ${ }^{\dagger}$ As the left side of (23) is invariant under permutations of the $A_{n}$, the same must be true of the right side. But in fact, according to Dirichlet's theorem [A26], a nonnegative series has the same value whatever order the terms are summed in.

[^8]:    ${ }^{\dagger}$ For the notation, see [A4] and [A10].

[^9]:    *The ideas that follow are basic to probability theory and are used further on, in particular in Section 24 and (in more elaborate form) Section 36. On a first reading, however, one might prefer to skip to Section 3 and return to this topic as the need arises.

[^10]:    ${ }^{\dagger}$ The lemma is a special case of Tychonov's theorem: If $S$ is given the discrete topology, the topological product $S^{\infty}$ is compact (and the cylinders are closed).

[^11]:    ${ }^{\dagger}$ See Problem 2.15.
    *This topic may be omitted.

[^12]:    ${ }^{\dagger}$ An idea which seems reasonable at first is to define $P_{*}(A)$ as the supremum of the sums $\sum_{n} P\left(A_{n}\right)$ for disjoint sequences of $\mathscr{F}_{0}$-sets in $A$. This will not do. For example, in the case where $\Omega$ is the unit interval, $\mathscr{F}_{0}$ is $\mathscr{B}_{0}$ (Example 2.2), and $P$ is $\lambda$ as defined by (2.12), the set $N$ of normal numbers would have inner measure 0 because it contains no nonempty elements of $\mathscr{B}_{0}$; in a satisfactory theory, $N$ will have both inner and outer measure 1.

[^13]:    ${ }^{\dagger}$ It also turns out, after the fact, that (3.3) implies that (3.4) holds for all $E$ anyway, see Problem 3.2.
    ${ }^{\ddagger}$ Compare the proof on p. 9 that a countable union of negligible sets is negligible.

[^14]:    ${ }^{\mathrm{t}}$ This proof does not work if (3.4) is weakened to (3.3).

[^15]:    ${ }^{\dagger}$ In the case of Lebesgue measure, the relation is $\mathscr{B}_{0} \subset \mathscr{B} \subset \mathscr{M} \subset 2^{(0.1]}$, and each of the three inclusions is strict; see Example 2.2 and Problems 3.14 and 3.21

[^16]:    ${ }^{\dagger}$ This amounts to working in the circle group, where the translation $y \rightarrow x \oplus y$ becomes a rotation ( 1 is the identity). The rationals form a subgroup, and the set $H$ defined below contains one element from each coset.
    *This topic may be omitted. It uses more set theory than is assumed in the rest of the book.

[^17]:    ${ }^{\dagger}$ See Problems 41 and 42 for the analogy between set-theoretic and numerical limits superior and inferior.

[^18]:    ${ }^{\dagger}$ This ignores the possibility of even $p$ (reducible $p / q$ ); but see Problem 1.11(b). And rounding $\omega$ up to $(p+1) / q$ instead of down to $p / q$ changes nothing; see Problem 4.13.

[^19]:    ${ }^{\dagger}$ For a more general version, see Theorem 22.3

[^20]:    ${ }^{\mathrm{T}}$ See Problem 7.11.
    ${ }^{*}$ This topic may be omitted.

