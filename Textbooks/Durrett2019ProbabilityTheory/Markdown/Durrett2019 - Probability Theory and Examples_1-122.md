# Probability: Theory and Examples 

Rick Durrett

Version 5 January 11, 2019

Copyright 2019, All rights reserved.
ii

## Preface

Some times the lights are shining on me. Other times I can barely see.
Lately it occurs to me what a long strange trip its been.
Grateful Dead
In 1989 when the first edition of the book was completed, my sons David and Greg were 3 and 1, and the cover picture showed the Dow Jones at 2650 . The last twenty-nine years have brought many changes but the song remains the same. "The title of the book indicates that as we develop the theory, we will focus our attention on examples. Hoping that the book would be a useful reference for people who apply probability in their work, we have tried to emphasize the results that are important for applications, and illustrated their use with roughly 200 examples. Probability is not a spectator sport, so the book contains almost 450 exercises to challenge the reader and to deepen their understanding."

The fifth edition has a number of changes:

- The exercises have been moved to the end of the section. The Examples, Theorems, and Lemmas are now numbered in one sequence to make it easier to find things.
- There is a new chapter on multidimensional Brownian motion and its relationship to PDEs. To make this possible a proof of Itô's formula has been added to Chapter 7.
- The lengthy Brownian motion chapter has been split into two, with the second focusing on Donsker's theorem, etc. The material on the central limit theorem for martingales and stationary sequences deleted from the fourth edition has been reinstated.
- The four sections of the random walk chapter have been relocated. Stopping times have been moved to the martingale chapter; recurrence of random walks and the arcsine laws to the Markov chain chapter; renewal theory has been moved to Chapter 2.
- Some of the exercises that were simply proofs left to the reader, have been put into the text as lemmas. There are a few new exercises

Typos. The fourth edition contains a list of the people who made corrections to the first three editions. With apologies to those whose contributions I lost track of, this time I need to thank: Richard Arratia, Benson Au, Swee Hong Chan, Conrado Costa, Nate Eldredge, Steve Evans, Jason Farnon, Christina Goldschmidt, Eduardo Horta, Martin Hildebrand, Shlomo Leventhal, Jan Lieke, Kyle MacDonald, Ron Peled, Jonathan Peterson, Erfan Salavati, Byron Schmuland, Timo Seppalainen, Antonio Carlos de Azevedo Sodre, Shouda Wang, and Ruth Williams. I must confess that Christophe Leuridan pointed one out that I have not corrected. Lemma 3.4.19 incorrectly asserts that the distributions in its statement have mean 0 , but their means do not exist. The conclusion remains valid since they are differentiable at 0 . A sixth edition is extremely unlikely, but you can email me about typos and I will post them on my web page.

Family update. As the fourth edition was being completed, David had recently graduated from Ithaca College and Greg was in his last semester at MIT applying to graduate school in computer science. Now, eight years later, Greg has graduated from Berkeley, and is an Assistant Professor in the Computer Science department at U of Texas in Austin. Greg works in the field of machine learning, specifically natural language processing. No, I don't know what that means but it seems to pay well. David got his degree in journalism. After an extensive job search process and some free lance work, David has settled into a steady job working for a company that produces newsletters for athletic directors and trainers.

In the summer of 2010, Susan and I moved to Durham. Since many people think that the move was about the weather, I will mention that during our first summer it was 104 degrees (and humid!) three days in a row. Yes, it almost never snows here, but when it does, three inches of snow (typically mixed with ice) will shut down the whole town for four days. It took some time for us to adjust to the Durham/Chapel area, which has about 10 times as many people as Ithaca and is criss-crossed by freeways, but we live in a nice quiet neighborhood near the campus. Susan enjoys volunteering at the Sarah P. Duke gardens and listening to their talks about the plants of North Carolina and future plans for the gardens.

I doubt there will be a sixth edition, but it is inevitable there will be typos. Email me at rtd@math.duke.edu and I will put a list on the web page.

## Contents

1 Measure Theory ..... 1
1.1 Probability Spaces ..... 1
1.2 Distributions ..... 10
1.3 Random Variables ..... 15
1.4 Integration ..... 18
1.5 Properties of the Integral ..... 24
1.6 Expected Value ..... 28
1.6.1 Inequalities ..... 29
1.6.2 Integration to the Limit ..... 30
1.6.3 Computing Expected Values ..... 32
1.7 Product Measures, Fubini's Theorem ..... 37
2 Laws of Large Numbers ..... 43
2.1 Independence ..... 43
2.1.1 Sufficient Conditions for Independence ..... 45
2.1.2 Independence, Distribution, and Expectation ..... 48
2.1.3 Sums of Independent Random Variables ..... 49
2.1.4 Constructing Independent Random Variables ..... 52
2.2 Weak Laws of Large Numbers ..... 56
2.2.1 $\quad L^{2}$ Weak Laws ..... 56
2.2.2 Triangular Arrays ..... 59
2.2.3 Truncation ..... 62
2.3 Borel-Cantelli Lemmas ..... 67
2.4 Strong Law of Large Numbers ..... 76
2.5 Convergence of Random Series* ..... 81
2.5.1 Rates of Convergence ..... 87
2.5.2 Infinite Mean ..... 88
2.6 Renewal Theory* ..... 91
2.7 Large Deviations* ..... 105
3 Central Limit Theorems ..... 113
3.1 The De Moivre-Laplace Theorem ..... 113
3.2 Weak Convergence ..... 116
3.2.1 Examples ..... 116
3.2.2 Theory ..... 118
3.3 Characteristic Functions ..... 125
3.3.1 Definition, Inversion Formula ..... 125
3.3.2 Weak Convergence ..... 132
3.3.3 Moments and Derivatives ..... 134
3.3.4 Polya's Criterion* ..... 137
3.3.5 The Moment Problem* ..... 140
3.4 Central Limit Theorems ..... 143
3.4.1 i.i.d. Sequences ..... 144
3.4.2 Triangular Arrays ..... 148
3.4.3 Prime Divisors (Erdös-Kac)* ..... 153
3.4.4 Rates of Convergence (Berry-Esseen)* ..... 157
3.5 Local Limit Theorems* ..... 161
3.6 Poisson Convergence ..... 167
3.6.1 The Basic Limit Theorem ..... 167
3.6.2 Two Examples with Dependence ..... 171
3.7 Poisson Processes ..... 174
3.7.1 Compound Poisson Processes ..... 177
3.7.2 Thinning ..... 178
3.7.3 Conditioning ..... 181
3.8 Stable Laws* ..... 182
3.9 Infinitely Divisible Distributions* ..... 193
3.10 Limit Theorems in $\mathrm{R}^{d}$ ..... 196
4 Martingales ..... 205
4.1 Conditional Expectation ..... 205
4.1.1 Examples ..... 207
4.1.2 Properties ..... 210
4.1.3 Regular Conditional Probabilities* ..... 214
4.2 Martingales, Almost Sure Convergence ..... 217
4.3 Examples ..... 224
4.3.1 Bounded Increments ..... 224
4.3.2 Polya's Urn Scheme ..... 226
4.3.3 Radon-Nikodym Derivatives ..... 227
4.3.4 Branching Processes ..... 230
4.4 Doob's Inequality, Convergence in $L^{p}, p>1$ ..... 235
4.5 Square Integrable Martingales* ..... 240
4.6 Uniform Integrability, Convergence in $L^{1}$ ..... 244
4.7 Backwards Martingales ..... 249
4.8 Optional Stopping Theorems ..... 255
4.8.1 Applications to random walks ..... 257
4.9 Combinatorics of simple random walk* ..... 262
5 Markov Chains ..... 269
5.1 Examples ..... 269
5.2 Construction, Markov Properties ..... 273
5.3 Recurrence and Transience ..... 281
5.4 Recurrence of Random Walks* ..... 287
5.5 Stationary Measures ..... 299
5.6 Asymptotic Behavior ..... 310
5.7 Periodicity, Tail $\sigma$-field* ..... 317
5.8 General State Space* ..... 322
5.8.1 Recurrence and Transience ..... 325
5.8.2 Stationary Measures ..... 326
5.8.3 Convergence Theorem ..... 327
5.8.4 $\mathrm{GI} / \mathrm{G} / 1$ queue ..... 327
6 Ergodic Theorems ..... 331
6.1 Definitions and Examples ..... 331
6.2 Birkhoff's Ergodic Theorem ..... 335
6.3 Recurrence ..... 339
6.4 A Subadditive Ergodic Theorem ..... 343
6.5 Applications ..... 347
7 Brownian Motion ..... 353
7.1 Definition and Construction ..... 353
7.2 Markov Property, Blumenthal's 0-1 Law ..... 360
7.3 Stopping Times, Strong Markov Property ..... 366
7.4 Path Properties ..... 370
7.4.1 Zeros of Brownian Motion ..... 370
7.4.2 Hitting times ..... 371
7.5 Martingales ..... 375
7.6 Itô's formula* ..... 379
8 Applications to Random Walk ..... 389
8.1 Donsker's Theorem ..... 389
8.2 CLT's for Martingales ..... 396
8.3 CLTs for Stationary Sequences ..... 402
8.3.1 Mixing Properties ..... 406
8.4 Empirical Distributions, Brownian Bridge ..... 410
8.5 Laws of the Iterated Logarithm ..... 416
9 Multidimensional Brownian Motion ..... 421
9.1 Martingales ..... 421
9.2 Heat Equation ..... 424
9.3 Inhomogeneous Heat Equation ..... 426
9.4 Feynman-Kac Formula ..... 428
9.5 Dirichlet problem ..... 432
9.5.1 Exit distributions ..... 436
9.6 Green's Functions and Potential Kernels ..... 438
9.7 Poisson’s Equation ..... 441
9.7.1 Occupation times ..... 444
9.8 Schrödinger Equation ..... 447
A Measure Theory Details ..... 455
A. 1 Caratheéodory's Extension Theorem ..... 455
A. 2 Which Sets Are Measurable? ..... 461
A. 3 Kolmogorov's Extension Theorem ..... 464
A. 4 Radon-Nikodym Theorem ..... 466
A. 5 Differentiating under the Integral ..... 470

## Chapter 1

## Measure Theory

In this chapter, we will recall some definitions and results from measure theory. Our purpose here is to provide an introduction for readers who have not seen these concepts before and to review that material for those who have. Harder proofs, especially those that do not contribute much to one's intuition, are hidden away in the appendix. Readers with a solid background in measure theory can skip Sections 1.4, 1.5, and 1.7, which were previously part of the appendix.

### 1.1 Probability Spaces

Here and throughout the book, terms being defined are set in boldface. We begin with the most basic quantity. A probability space is a triple $(\Omega, \mathcal{F}, P)$ where $\Omega$ is a set of "outcomes," $\mathcal{F}$ is a set of "events," and $P: \mathcal{F} \rightarrow[0,1]$ is a function that assigns probabilities to events. We assume that $\mathcal{F}$ is a $\sigma$-field (or $\sigma$-algebra), i.e., a (nonempty) collection of subsets of $\Omega$ that satisfy
(i) if $A \in \mathcal{F}$ then $A^{c} \in \mathcal{F}$, and
(ii) if $A_{i} \in \mathcal{F}$ is a countable sequence of sets then $\cup_{i} A_{i} \in \mathcal{F}$.

Here and in what follows, countable means finite or countably infinite. Since $\cap_{i} A_{i}=\left(\cup_{i} A_{i}^{c}\right)^{c}$, it follows that a $\sigma$-field is closed under countable intersections. We omit the last property from the definition to make it easier to check.

Without $P,(\Omega, \mathcal{F})$ is called a measurable space, i.e., it is a space on which we can put a measure. A measure is a nonnegative countably additive set function; that is, a function $\mu: \mathcal{F} \rightarrow \mathbf{R}$ with
(i) $\mu(A) \geq \mu(\emptyset)=0$ for all $A \in \mathcal{F}$, and
(ii) if $A_{i} \in \mathcal{F}$ is a countable sequence of disjoint sets, then

$$
\mu\left(\cup_{i} A_{i}\right)=\sum_{i} \mu\left(A_{i}\right)
$$

If $\mu(\Omega)=1$, we call $\mu$ a probability measure. In this book, probability measures are usually denoted by $P$.

The next result gives some consequences of the definition of a measure that we will need later. In all cases, we assume that the sets we mention are in $\mathcal{F}$.

Theorem 1.1.1. Let $\mu$ be a measure on ( $\Omega, \mathcal{F}$ )
(i) monotonicity. If $A \subset B$ then $\mu(A) \leq \mu(B)$.
(ii) subadditivity. If $A \subset \cup_{m=1}^{\infty} A_{m}$ then $\mu(A) \leq \sum_{m=1}^{\infty} \mu\left(A_{m}\right)$.
(iii) continuity from below. If $A_{i} \uparrow A$ (i.e., $A_{1} \subset A_{2} \subset \ldots$ and $\left.\cup_{i} A_{i}=A\right)$ then $\mu\left(A_{i}\right) \uparrow \mu(A)$.
(iv) continuity from above. If $A_{i} \downarrow A$ (i.e., $A_{1} \supset A_{2} \supset \ldots$ and $\cap_{i} A_{i}=A$ ), with $\mu\left(A_{1}\right)<\infty$ then $\mu\left(A_{i}\right) \downarrow \mu(A)$.
Proof. (i) Let $B-A=B \cap A^{c}$ be the difference of the two sets. Using + to denote disjoint union, $B=A+(B-A)$ so

$$
\mu(B)=\mu(A)+\mu(B-A) \geq \mu(A)
$$

(ii) Let $A_{n}^{\prime}=A_{n} \cap A, B_{1}=A_{1}^{\prime}$ and for $n>1, B_{n}=A_{n}^{\prime}-\cup_{m=1}^{n-1} A_{m}^{\prime}$. Since the $B_{n}$ are disjoint and have union $A$ we have using (ii) of the definition of measure, $B_{m} \subset A_{m}$, and (i) of this theorem

$$
\mu(A)=\sum_{m=1}^{\infty} \mu\left(B_{m}\right) \leq \sum_{m=1}^{\infty} \mu\left(A_{m}\right)
$$

(iii) Let $B_{n}=A_{n}-A_{n-1}$. Then the $B_{n}$ are disjoint and have $\cup_{m=1}^{\infty} B_{m}= A, \cup_{m=1}^{n} B_{m}=A_{n}$ so

$$
\mu(A)=\sum_{m=1}^{\infty} \mu\left(B_{m}\right)=\lim _{n \rightarrow \infty} \sum_{m=1}^{n} \mu\left(B_{m}\right)=\lim _{n \rightarrow \infty} \mu\left(A_{n}\right)
$$

(iv) $A_{1}-A_{n} \uparrow A_{1}-A$ so (iii) implies $\mu\left(A_{1}-A_{n}\right) \uparrow \mu\left(A_{1}-A\right)$. Since $A_{1} \supset A$ we have $\mu\left(A_{1}-A\right)=\mu\left(A_{1}\right)-\mu(A)$ and it follows that $\mu\left(A_{n}\right) \downarrow \mu(A)$.

The simplest setting, which should be familiar from undergraduate probability, is:

Example 1.1.2. Discrete probability spaces. Let $\Omega=$ a countable set, i.e., finite or countably infinite. Let $\mathcal{F}=$ the set of all subsets of $\Omega$. Let

$$
P(A)=\sum_{\omega \in A} p(\omega) \text { where } p(\omega) \geq 0 \text { and } \sum_{\omega \in \Omega} p(\omega)=1
$$

A little thought reveals that this is the most general probability measure on this space. In many cases when $\Omega$ is a finite set, we have $p(\omega)=1 /|\Omega|$ where $|\Omega|=$ the number of points in $\Omega$.

For a simple concrete example that requires this level of generality consider the astragali, dice used in ancient Egypt made from the ankle bones of sheep. This die could come to rest on the top side of the bone for four points or on the bottom for three points. The side of the bone was slightly rounded. The die could come to rest on a flat and narrow piece for six points or somewhere on the rest of the side for one point. There is no reason to think that all four outcomes are equally likely so we need probabilities $p_{1}, p_{3}, p_{4}$, and $p_{6}$ to describe $P$.

To prepare for our next definition, we need note that it follows easily from the definition If $\mathcal{F}_{i}, i \in I$ are $\sigma$-fields then $\cap_{i \in I} \mathcal{F}_{i}$ is. Here $I \neq \emptyset$ is an arbitrary index set (i.e., possibly uncountable). From this it follows that if we are given a set $\Omega$ and a collection $\mathcal{A}$ of subsets of $\Omega$, then there is a smallest $\sigma$-field containing $\mathcal{A}$. We will call this the $\sigma$-field generated by $\mathcal{A}$ and denote it by $\sigma(\mathcal{A})$.

Let $\mathbf{R}^{d}$ be the set of vectors $\left(x_{1}, \ldots x_{d}\right)$ of real numbers and $\mathcal{R}^{d}$ be the Borel sets, the smallest $\sigma$-field containing the open sets. When $d=1$ we drop the superscript.
Example 1.1.3. Measures on the real line. Measures on ( $\mathbf{R}, \mathcal{R}$ ) are defined by giving a Stieltjes measure function with the following properties:
(i) $F$ is nondecreasing.
(ii) $F$ is right continuous, i.e. $\lim _{y \downarrow x} F(y)=F(x)$.

Theorem 1.1.4. Associated with each Stieltjes measure function $F$ there is a unique measure $\mu$ on $(\mathbf{R}, \mathcal{R})$ with $\mu((a, b])=F(b)-F(a)$

$$
\begin{equation*}
\mu((a, b])=F(b)-F(a) \tag{1.1.1}
\end{equation*}
$$

When $F(x)=x$ the resulting measure is called Lebesgue measure.
The proof of Theorem 1.1.4 is a long and winding road, so we will content ourselves to describe the main ideas involved in this section and to hide the remaining details in the appendix in Section A.1. The choice of "closed on the right" in $(a, b]$ is dictated by the fact that if $b_{n} \downarrow b$ then we have

$$
\cap_{n}\left(a, b_{n}\right]=(a, b]
$$

The next definition will explain the choice of "open on the left."
A collection $\mathcal{S}$ of sets is said to be a semialgebra if (i) it is closed under intersection, i.e., $S, T \in \mathcal{S}$ implies $S \cap T \in \mathcal{S}$, and (ii) if $S \in \mathcal{S}$ then $S^{c}$ is a finite disjoint union of sets in $\mathcal{S}$. An important example of a semialgebra is

Example 1.1.5. $\mathcal{S}_{d}=$ the empty set plus all sets of the form

$$
\left(a_{1}, b_{1}\right] \times \cdots \times\left(a_{d}, b_{d}\right] \subset \mathbf{R}^{d} \quad \text { where }-\infty \leq a_{i}<b_{i} \leq \infty
$$

The definition in (1.1.1) gives the values of $\mu$ on the semialgebra $\mathcal{S}_{1}$. To go from semialgebra to $\sigma$-algebra we use an intermediate step. A collection $\mathcal{A}$ of subsets of $\Omega$ is called an algebra (or field) if $A, B \in \mathcal{A}$ implies $A^{c}$ and $A \cup B$ are in $\mathcal{A}$. Since $A \cap B=\left(A^{c} \cup B^{c}\right)^{c}$, it follows that $A \cap B \in \mathcal{A}$. Obviously a $\sigma$-algebra is an algebra. An example in which the converse is false is:

Example 1.1.6. Let $\Omega=\mathbf{Z}=$ the integers. $\mathcal{A}=$ the collection of $A \subset \mathbf{Z}$ so that $A$ or $A^{c}$ is finite is an algebra.

Lemma 1.1.7. If $\mathcal{S}$ is a semialgebra then $\overline{\mathcal{S}}=\{$ finite disjoint unions of sets in $\mathcal{S}\}$ is an algebra, called the algebra generated by $\mathcal{S}$.

Proof. Suppose $A=+{ }_{i} S_{i}$ and $B=+{ }_{j} T_{j}$, where + denotes disjoint union and we assume the index sets are finite. Then $A \cap B=+_{i, j} S_{i} \cap T_{j} \in \overline{\mathcal{S}}$. As for complements, if $A=+{ }_{i} S_{i}$ then $A^{c}=\cap_{i} S_{i}^{c}$. The definition of $\mathcal{S}$ implies $S_{i}^{c} \in \overline{\mathcal{S}}$. We have shown that $\overline{\mathcal{S}}$ is closed under intersection, so it follows by induction that $A^{c} \in \overline{\mathcal{S}}$.

Example 1.1.8. Let $\Omega=\mathbf{R}$ and $\mathcal{S}=\mathcal{S}_{1}$ then $\overline{\mathcal{S}}_{1}=$ the empty set plus all sets of the form

$$
\cup_{i=1}^{k}\left(a_{i}, b_{i}\right] \quad \text { where }-\infty \leq a_{i}<b_{i} \leq \infty
$$

Given a set function $\mu$ on $\mathcal{S}$ we can extend it to $\overline{\mathcal{S}}$ by

$$
\mu\left(+_{i=1}^{n} A_{i}\right)=\sum_{i=1}^{n} \mu\left(A_{i}\right)
$$

By a measure on an algebra $\mathcal{A}$, we mean a set function $\mu$ with
(i) $\mu(A) \geq \mu(\emptyset)=0$ for all $A \in \mathcal{A}$, and
(ii) if $A_{i} \in \mathcal{A}$ are disjoint and their union is in $\mathcal{A}$, then

$$
\mu\left(\cup_{i=1}^{\infty} A_{i}\right)=\sum_{i=1}^{\infty} \mu\left(A_{i}\right)
$$

$\mu$ is said to be $\sigma$-finite if there is a sequence of sets $A_{n} \in \mathcal{A}$ so that $\mu\left(A_{n}\right)<\infty$ and $\cup_{n} A_{n}=\Omega$. Letting $A_{1}^{\prime}=A_{1}$ and for $n \geq 2$,

$$
A_{n}^{\prime}=\cup_{m=1}^{n} A_{m} \quad \text { or } \quad A_{n}^{\prime}=A_{n} \cap\left(\cap_{m=1}^{n-1} A_{m}^{c}\right) \in \mathcal{A}
$$

we can without loss of generality assume that $A_{n} \uparrow \Omega$ or the $A_{n}$ are disjoint.

The next result helps us to extend a measure defined on a semi-algebra $\mathcal{S}$ to the $\sigma$-algebra it generates, $\sigma(\mathcal{S})$

Theorem 1.1.9. Let $\mathcal{S}$ be a semialgebra and let $\mu$ defined on $\mathcal{S}$ have $\mu(\emptyset)=0$. Suppose (i) if $S \in \mathcal{S}$ is a finite disjoint union of sets $S_{i} \in \mathcal{S}$ then $\mu(S)=\sum_{i} \mu\left(S_{i}\right)$, and (ii) if $S_{i}, S \in \mathcal{S}$ with $S=+_{i \geq 1} S_{i}$ then $\mu(S) \leq \sum_{i \geq 1} \mu\left(S_{i}\right)$. Then $\mu$ has a unique extension $\bar{\mu}$ that is a measure on $\overline{\mathcal{S}}$ the algebra generated by $\mathcal{S}$. If $\bar{\mu}$ is sigma-finite then there is a unique extension $\nu$ that is a measure on $\sigma(\mathcal{S})$

In (ii) above, and in what follows, $i \geq 1$ indicates a countable union, while a plain subscript $i$ or $j$ indicates a finite union. The proof of Theorems 1.1.9 is rather involved so it is given in Section A.1. To check condition (ii) in the theorem the following is useful.

Lemma 1.1.10. Suppose only that (i) holds.
(a) If $A, B_{i} \in \overline{\mathcal{S}}$ with $A=+_{i=1}^{n} B_{i}$ then $\bar{\mu}(A)=\sum_{i} \bar{\mu}\left(B_{i}\right)$.
(b) If $A, B_{i} \in \overline{\mathcal{S}}$ with $A \subset \cup_{i=1}^{n} B_{i}$ then $\bar{\mu}(A) \leq \sum_{i} \bar{\mu}\left(B_{i}\right)$.

Proof. Observe that it follows from the definition that if $A=+{ }_{i} B_{i}$ is a finite disjoint union of sets in $\overline{\mathcal{S}}$ and $B_{i}=+{ }_{j} S_{i, j}$, then

$$
\bar{\mu}(A)=\sum_{i, j} \mu\left(S_{i, j}\right)=\sum_{i} \bar{\mu}\left(B_{i}\right)
$$

To prove (b), we begin with the case $n=1, B_{1}=B . B=A+\left(B \cap A^{c}\right)$ and $B \cap A^{c} \in \overline{\mathcal{S}}$, so

$$
\bar{\mu}(A) \leq \bar{\mu}(A)+\bar{\mu}\left(B \cap A^{c}\right)=\bar{\mu}(B)
$$

To handle $n>1$ now, let $F_{k}=B_{1}^{c} \cap \ldots \cap B_{k-1}^{c} \cap B_{k}$ and note

$$
\begin{aligned}
\cup_{i} B_{i} & =F_{1}+\cdots+F_{n} \\
A=A \cap\left(\cup_{i} B_{i}\right) & =\left(A \cap F_{1}\right)+\cdots+\left(A \cap F_{n}\right)
\end{aligned}
$$

so using (a), (b) with $n=1$, and (a) again

$$
\bar{\mu}(A)=\sum_{k=1}^{n} \bar{\mu}\left(A \cap F_{k}\right) \leq \sum_{k=1}^{n} \bar{\mu}\left(F_{k}\right)=\bar{\mu}\left(\cup_{i} B_{i}\right)
$$

Proof of Theorem 1.1.4. Let $\mathcal{S}$ be the semi-algebra of half-open intervals ( $a, b$ ] with $-\infty \leq a<b \leq \infty$. To define $\mu$ on $\mathcal{S}$, we begin by observing that

$$
F(\infty)=\lim _{x \uparrow \infty} F(x) \quad \text { and } \quad F(-\infty)=\lim _{x \downarrow-\infty} F(x) \quad \text { exist }
$$

and $\mu((a, b])=F(b)-F(a)$ makes sense for all $-\infty \leq a<b \leq \infty$ since $F(\infty)>-\infty$ and $F(-\infty)<\infty$.

If $(a, b]=+_{i=1}^{n}\left(a_{i}, b_{i}\right]$ then after relabeling the intervals we must have $a_{1}=a, b_{n}=b$, and $a_{i}=b_{i-1}$ for $2 \leq i \leq n$, so condition (i) in Theorem
1.1.9 holds. To check (ii), suppose first that $-\infty<a<b<\infty$, and $(a, b] \subset \cup_{i \geq 1}\left(a_{i}, b_{i}\right]$ where (without loss of generality) $-\infty<a_{i}<b_{i}<\infty$. Pick $\delta>0$ so that $F(a+\delta)<F(a)+\epsilon$ and pick $\eta_{i}$ so that

$$
F\left(b_{i}+\eta_{i}\right)<F\left(b_{i}\right)+\epsilon 2^{-i}
$$

The open intervals $\left(a_{i}, b_{i}+\eta_{i}\right)$ cover $[a+\delta, b]$, so there is a finite subcover $\left(\alpha_{j}, \beta_{j}\right), 1 \leq j \leq J$. Since $(a+\delta, b] \subset \cup_{j=1}^{J}\left(\alpha_{j}, \beta_{j}\right]$, (b) in Lemma 1.1.10 implies

$$
F(b)-F(a+\delta) \leq \sum_{j=1}^{J} F\left(\beta_{j}\right)-F\left(\alpha_{j}\right) \leq \sum_{i=1}^{\infty}\left(F\left(b_{i}+\eta_{i}\right)-F\left(a_{i}\right)\right)
$$

So, by the choice of $\delta$ and $\eta_{i}$,

$$
F(b)-F(a) \leq 2 \epsilon+\sum_{i=1}^{\infty}\left(F\left(b_{i}\right)-F\left(a_{i}\right)\right)
$$

and since $\epsilon$ is arbitrary, we have proved the result in the case $-\infty<a< b<\infty$. To remove the last restriction, observe that if $(a, b] \subset \cup_{i}\left(a_{i}, b_{i}\right]$ and $(A, B] \subset(a, b]$ has $-\infty<A<B<\infty$, then we have

$$
F(B)-F(A) \leq \sum_{i=1}^{\infty}\left(F\left(b_{i}\right)-F\left(a_{i}\right)\right)
$$

Since the last result holds for any finite $(A, B] \subset(a, b]$, the desired result follows.

## Measures on $\mathbf{R}^{\mathbf{d}}$

Our next goal is to prove a version of Theorem 1.1.4 for $\mathbf{R}^{d}$. The first step is to introduce the assumptions on the defining function $F$. By analogy with the case $d=1$ it is natural to assume:
(i) It is nondecreasing, i.e., if $x \leq y$ (meaning $x_{i} \leq y_{i}$ for all $i$ ) then $F(x) \leq F(y)$.
(ii) $F$ is right continuous, i.e., $\lim _{y \downarrow x} F(y)=F(x)$ (here $y \downarrow x$ means each $y_{i} \downarrow x_{i}$ ).
(iii) If $x_{n} \downarrow-\infty$, i.e., each coordinate does then $F\left(x_{n}\right) \downarrow 0$. If $x_{n} \uparrow-\infty$, i.e., each coordinate does then $F\left(x_{n}\right) \uparrow 1$.
However this time it is not enough. Consider the following $F$

$$
F\left(x_{1}, x_{2}\right)= \begin{cases}1 & \text { if } x_{1}, x_{2} \geq 1 \\ 2 / 3 & \text { if } x_{1} \geq 1 \text { and } 0 \leq x_{2}<1 \\ 2 / 3 & \text { if } x_{2} \geq 1 \text { and } 0 \leq x_{1}<1 \\ 0 & \text { otherwise }\end{cases}
$$

| 0 | $2 / 3$ | 1 |
| :---: | :---: | :---: |
| 0 | 0 | $2 / 3$ |
| 0 | 0 | 0 |

Figure 1.1: Picture of the counterexample

See Figure 1.1 for a picture. A little thought shows that

$$
\begin{aligned}
\mu\left(\left(a_{1}, b_{1}\right] \times\left(a_{2}, b_{2}\right]\right)= & \mu\left(\left(-\infty, b_{1}\right] \times\left(-\infty, b_{2}\right]\right)-\mu\left(\left(-\infty, a_{1}\right] \times\left(-\infty, b_{2}\right]\right) \\
& -\mu\left(\left(-\infty, b_{1}\right] \times\left(-\infty, a_{2}\right]\right)+\mu\left(\left(-\infty, a_{1}\right] \times\left(-\infty, a_{2}\right]\right) \\
= & F\left(b_{1}, b_{2}\right)-F\left(a_{1}, b_{2}\right)-F\left(b_{1}, a_{2}\right)+F\left(a_{1}, a_{2}\right)
\end{aligned}
$$

Using this with $a_{1}=a_{2}=1-\epsilon$ and $b_{1}=b_{2}=1$ and letting $\epsilon \rightarrow 0$ we see that

$$
\mu(\{1,1\})=1-2 / 3-2 / 3+0=-1 / 3
$$

Similar reasoning shows that $\mu(\{1,0\})=\mu(\{0,1\}=2 / 3$.
To formulate the third and final condition for $F$ to define a measure, let

$$
\begin{aligned}
A & =\left(a_{1}, b_{1}\right] \times \cdots \times\left(a_{d}, b_{d}\right] \\
V & =\left\{a_{1}, b_{1}\right\} \times \cdots \times\left\{a_{d}, b_{d}\right\}
\end{aligned}
$$

where $-\infty<a_{i}<b_{i}<\infty$. To emphasize that $\infty$ 's are not allowed, we will call $A$ a finite rectangle. Then $V=$ the vertices of the rectangle $A$. If $v \in V$, let

$$
\begin{aligned}
\operatorname{sgn}(v) & =(-1)^{\#} \text { of } a \text { 's in } v \\
\Delta_{A} F & =\sum_{v \in V} \operatorname{sgn}(v) F(v)
\end{aligned}
$$

We will let $\mu(A)=\Delta_{A} F$, so we must assume
(iv) $\Delta_{A} F \geq 0$ for all rectangles $A$.

Theorem 1.1.11. Suppose $F: \mathbf{R}^{d} \rightarrow[0,1]$ satisfies (i)-(iv) given above. Then there is a unique probability measure $\mu$ on $\left(\mathbf{R}^{d}, \mathcal{R}^{d}\right)$ so that $\mu(A)= \Delta_{A} F$ for all finite rectangles.

Example 1.1.12. Suppose $F(x)=\prod_{i=1}^{d} F_{i}(x)$, where the $F_{i}$ satisfy (i) and (ii) of Theorem 1.1.4. In this case,

$$
\Delta_{A} F=\prod_{i=1}^{d}\left(F_{i}\left(b_{i}\right)-F_{i}\left(a_{i}\right)\right)
$$

When $F_{i}(x)=x$ for all $i$, the resulting measure is Lebesgue measure on $\mathbf{R}^{d}$.

Proof. We let $\mu(A)=\Delta_{A} F$ for all finite rectangles and then use monotonicity to extend the definition to $\mathcal{S}_{d}$. To check (i) of Theorem 1.1.9, call $A=+_{k} B_{k}$ a regular subdivision of $A$ if there are sequences $a_{i}=\alpha_{i, 0}<\alpha_{i, 1} \ldots<\alpha_{i, n_{i}}=b_{i}$ so that each rectangle $B_{k}$ has the form

$$
\left(\alpha_{1, j_{1}-1}, \alpha_{1, j_{1}}\right] \times \cdots \times\left(\alpha_{d, j_{d}-1}, \alpha_{d, j_{d}}\right] \quad \text { where } \quad 1 \leq j_{i} \leq n_{i}
$$

It is easy to see that for regular subdivisions $\lambda(A)=\sum_{k} \lambda\left(B_{k}\right)$. (First consider the case in which all the endpoints are finite and then take limits to get the general case.) To extend this result to a general finite subdivision $A=+{ }_{j} A_{j}$, subdivide further to get a regular one.

![](https://cdn.mathpix.com/cropped/049c529c-af3b-4bc2-92f7-c2b31e6bd632-016.jpg?height=431&width=431&top_left_y=1308&top_left_x=586)
Figure 1.2: Conversion of a subdivision to a regular one

![](https://cdn.mathpix.com/cropped/049c529c-af3b-4bc2-92f7-c2b31e6bd632-016.jpg?height=429&width=427&top_left_y=1310&top_left_x=1142)
Figure 1.2: Conversion of a subdivision to a regular one

The proof of (ii) is almost identical to that in Theorem 1.1.4. To make things easier to write and to bring out the analogies with Theorem 1.1.4, we let

$$
\begin{aligned}
& (x, y)=\left(x_{1}, y_{1}\right) \times \cdots \times\left(x_{d}, y_{d}\right) \\
& (x, y]=\left(x_{1}, y_{1}\right] \times \cdots \times\left(x_{d}, y_{d}\right] \\
& {[x, y]=\left[x_{1}, y_{1}\right] \times \cdots \times\left[x_{d}, y_{d}\right]}
\end{aligned}
$$

for $x, y \in \mathbf{R}^{d}$. Suppose first that $-\infty<a<b<\infty$, where the inequalities mean that each component is finite, and suppose $(a, b] \subset \cup_{i \geq 1}\left(a^{i}, b^{i}\right]$,
where (without loss of generality) $-\infty<a^{i}<b^{i}<\infty$. Let $\overline{1}=(1, \ldots, 1)$, pick $\delta>0$ so that

$$
\mu((a+\delta \overline{1}, b])<\mu((a, b])+\epsilon
$$

and pick $\eta_{i}$ so that

$$
\mu\left(\left(a, b^{i}+\eta_{i} \overline{1}\right]\right)<\mu\left(\left(a^{i}, b^{i}\right]\right)+\epsilon 2^{-i}
$$

The open rectangles $\left(a^{i}, b^{i}+\eta_{i} \overline{1}\right)$ cover $[a+\delta \overline{1}, b]$, so there is a finite subcover $\left(\alpha^{j}, \beta^{j}\right), 1 \leq j \leq J$. Since $(a+\delta \overline{1}, b] \subset \cup_{j=1}^{J}\left(\alpha^{j}, \beta^{j}\right]$, (b) in Lemma 1.1.10 implies

$$
\mu([a+\delta \overline{1}, b]) \leq \sum_{j=1}^{J} \mu\left(\left(\alpha^{j}, \beta^{j}\right]\right) \leq \sum_{i=1}^{\infty} \mu\left(\left(a^{i}, b^{i}+\eta_{i} \overline{1}\right]\right)
$$

So, by the choice of $\delta$ and $\eta_{i}$,

$$
\mu((a, b]) \leq 2 \epsilon+\sum_{i=1}^{\infty} \mu\left(\left(a^{i}, b^{i}\right]\right)
$$

and since $\epsilon$ is arbitrary, we have proved the result in the case $-\infty<a< b<\infty$. The proof can now be completed exactly as before.

## Exercises

1.1.1. Let $\Omega=\mathbf{R}, \mathcal{F}=$ all subsets so that $A$ or $A^{c}$ is countable, $P(A)=$ 0 in the first case and $=1$ in the second. Show that ( $\Omega, \mathcal{F}, P$ ) is a probability space.
1.1.2. Recall the definition of $\mathcal{S}_{d}$ from Example 1.1.5. Show that $\sigma\left(\mathcal{S}_{d}\right)= \mathcal{R}^{d}$, the Borel subsets of $\mathbf{R}^{d}$.
1.1.3. A $\sigma$-field $\mathcal{F}$ is said to be countably generated if there is a countable collection $\mathcal{C} \subset \mathcal{F}$ so that $\sigma(\mathcal{C})=\mathcal{F}$. Show that $\mathcal{R}^{d}$ is countably generated.
1.1.4. (i) Show that if $\mathcal{F}_{1} \subset \mathcal{F}_{2} \subset \ldots$ are $\sigma$-algebras, then $\cup_{i} \mathcal{F}_{i}$ is an algebra. (ii) Give an example to show that $\cup_{i} \mathcal{F}_{i}$ need not be a $\sigma$-algebra.
1.1.5. A set $A \subset\{1,2, \ldots\}$ is said to have asymptotic density $\theta$ if

$$
\lim _{n \rightarrow \infty}|A \cap\{1,2, \ldots, n\}| / n=\theta
$$

Let $\mathcal{A}$ be the collection of sets for which the asymptotic density exists. Is $\mathcal{A}$ a $\sigma$-algebra? an algebra?

### 1.2 Distributions

Probability spaces become a little more interesting when we define random variables on them. A real valued function $X$ defined on $\Omega$ is said to be a random variable if for every Borel set $B \subset \mathbf{R}$ we have $X^{-1}(B)=\{\omega: X(\omega) \in B\} \in \mathcal{F}$. When we need to emphasize the $\sigma$-field, we will say that $X$ is $\mathcal{F}$-measurable or write $X \in \mathcal{F}$. If $\Omega$ is a discrete probability space (see Example 1.1.2), then any function $X: \Omega \rightarrow \mathbf{R}$ is a random variable. A second trivial, but useful, type of example of a random variable is the indicator function of a set $A \in \mathcal{F}$ :

$$
1_{A}(\omega)= \begin{cases}1 & \omega \in A \\ 0 & \omega \notin A\end{cases}
$$

The notation is supposed to remind you that this function is 1 on $A$. Analysts call this object the characteristic function of $A$. In probability, that term is used for something quite different. (See Section 3.3.)

![](https://cdn.mathpix.com/cropped/049c529c-af3b-4bc2-92f7-c2b31e6bd632-018.jpg?height=228&width=920&top_left_y=1158&top_left_x=638)
Figure 1.3: Definition of the distribution of $X$

If $X$ is a random variable, then $X$ induces a probability measure on $\mathbf{R}$ called its distribution by setting $\mu(A)=P(X \in A)$ for Borel sets $A$. Using the notation introduced above, the right-hand side can be written as $P\left(X^{-1}(A)\right)$. In words, we pull $A \in \mathcal{R}$ back to $X^{-1}(A) \in \mathcal{F}$ and then take $P$ of that set.

To check that $\mu$ is a probability measure we observe that if the $A_{i}$ are disjoint then using the definition of $\mu$; the fact that $X$ lands in the union if and only if it lands in one of the $A_{i}$; the fact that if the sets $A_{i} \in \mathcal{R}$ are disjoint then the events $\left\{X \in A_{i}\right\}$ are disjoint; and the definition of $\mu$ again; we have:
$\mu\left(\cup_{i} A_{i}\right)=P\left(X \in \cup_{i} A_{i}\right)=P\left(\cup_{i}\left\{X \in A_{i}\right\}\right)=\sum_{i} P\left(X \in A_{i}\right)=\sum_{i} \mu\left(A_{i}\right)$
The distribution of a random variable $X$ is usually described by giving its distribution function, $F(x)=P(X \leq x)$.

Theorem 1.2.1. Any distribution function $F$ has the following properties:
(i) $F$ is nondecreasing.
(ii) $\lim _{x \rightarrow \infty} F(x)=1, \lim _{x \rightarrow-\infty} F(x)=0$.
(iii) $F$ is right continuous, i.e. $\lim _{y \downarrow x} F(y)=F(x)$.
(iv) If $F(x-)=\lim _{y \uparrow x} F(y)$ then $F(x-)=P(X<x)$.
(v) $P(X=x)=F(x)-F(x-)$.

Proof. To prove (i), note that if $x \leq y$ then $\{X \leq x\} \subset\{X \leq y\}$, and then use (i) in Theorem 1.1.1 to conclude that $P(X \leq x) \leq P(X \leq y)$.
To prove (ii), we observe that if $x \uparrow \infty$, then $\{X \leq x\} \uparrow \Omega$, while if $x \downarrow-\infty$ then $\{X \leq x\} \downarrow \emptyset$ and then use (iii) and (iv) of Theorem 1.1.1.
To prove (iii), we observe that if $y \downarrow x$, then $\{X \leq y\} \downarrow\{X \leq x\}$.
To prove (iv), we observe that if $y \uparrow x$, then $\{X \leq y\} \uparrow\{X<x\}$.
For (v), note $P(X=x)=P(X \leq x)-P(X<x)$ and use (iii) and (iv).

The next result shows that we have found more than enough properties to characterize distribution functions.

Theorem 1.2.2. If $F$ satisfies (i), (ii), and (iii) in Theorem 1.2.1, then it is the distribution function of some random variable.

Proof. Let $\Omega=(0,1), \mathcal{F}=$ the Borel sets, and $P=$ Lebesgue measure. If $\omega \in(0,1)$, let

$$
X(\omega)=\sup \{y: F(y)<\omega\}
$$

Once we show that

$$
\begin{equation*}
\{\omega: X(\omega) \leq x\}=\{\omega: \omega \leq F(x)\} \tag{$\star$}
\end{equation*}
$$

the desired result follows immediately since $P(\omega: \omega \leq F(x))=F(x)$. (Recall $P$ is Lebesgue measure.) To check $(\star)$, we observe that if $\omega \leq F(x)$ then $X(\omega) \leq x$, since $x \notin\{y: F(y)<\omega\}$. On the other hand if $\omega>F(x)$, then since $F$ is right continuous, there is an $\epsilon>0$ so that $F(x+\epsilon)<\omega$ and $X(\omega) \geq x+\epsilon>x$.

Even though $F$ may not be $1-1$ and onto we will call $X$ the inverse of $F$ and denote it by $F^{-1}$. The scheme in the proof of Theorem 1.2.2 is useful in generating random variables on a computer. Standard algorithms generate random variables $U$ with a uniform distribution, then one applies the inverse of the distribution function defined in Theorem 1.2.2 to get a random variable $F^{-1}(U)$ with distribution function $F$.

If $X$ and $Y$ induce the same distribution $\mu$ on $(\mathbf{R}, \mathcal{R})$ we say $X$ and $Y$ are equal in distribution. In view of Theorem 1.1.4, this holds if and only if $X$ and $Y$ have the same distribution function, i.e., $P(X \leq x)=$

![](https://cdn.mathpix.com/cropped/049c529c-af3b-4bc2-92f7-c2b31e6bd632-020.jpg?height=265&width=600&top_left_y=352&top_left_x=760)
Figure 1.4: Picture of the inverse defined in the proof of Theorem 1.2.2.

$P(Y \leq x)$ for all $x$. When $X$ and $Y$ have the same distribution, we like to write

$$
X \stackrel{d}{=} Y
$$

but this is too tall to use in text, so for typographical reasons we will also use $X={ }_{d} Y$.

When the distribution function $F(x)=P(X \leq x)$ has the form

$$
\begin{equation*}
F(x)=\int_{-\infty}^{x} f(y) d y \tag{1.2.1}
\end{equation*}
$$

we say that $X$ has density function $f$. In remembering formulas, it is often useful to think of $f(x)$ as being $P(X=x)$ although

$$
P(X=x)=\lim _{\epsilon \rightarrow 0} \int_{x-\epsilon}^{x+\epsilon} f(y) d y=0
$$

By popular demand we have ceased our previous practice of writing $P(X=x)$ for the density function. Instead we will use things like the lovely and informative $f_{X}(x)$.

We can start with $f$ and use (1.2.1) to define a distribution function $F$. In order to end up with a distribution function it is necessary and sufficient that $f(x) \geq 0$ and $\int f(x) d x=1$. Three examples that will be important in what follows are:

Example 1.2.3. Uniform distribution on (0,1). $f(x)=1$ for $x \in (0,1)$ and 0 otherwise. Distribution function:

$$
F(x)= \begin{cases}0 & x \leq 0 \\ x & 0 \leq x \leq 1 \\ 1 & x>1\end{cases}
$$

Example 1.2.4. Exponential distribution with rate $\lambda . \quad f(x)= \lambda e^{-\lambda x}$ for $x \geq 0$ and 0 otherwise. Distribution function:

$$
F(x)= \begin{cases}0 & x \leq 0 \\ 1-e^{-\lambda x} & x \geq 0\end{cases}
$$

## Example 1.2.5. Standard normal distribution.

$$
f(x)=(2 \pi)^{-1 / 2} \exp \left(-x^{2} / 2\right)
$$

In this case, there is no closed form expression for $F(x)$, but we have the following bounds that are useful for large $x$ :

Theorem 1.2.6. For $x>0$,

$$
\left(x^{-1}-x^{-3}\right) \exp \left(-x^{2} / 2\right) \leq \int_{x}^{\infty} \exp \left(-y^{2} / 2\right) d y \leq x^{-1} \exp \left(-x^{2} / 2\right)
$$

Proof. Changing variables $y=x+z$ and using $\exp \left(-z^{2} / 2\right) \leq 1$ gives

$$
\int_{x}^{\infty} \exp \left(-y^{2} / 2\right) d y \leq \exp \left(-x^{2} / 2\right) \int_{0}^{\infty} \exp (-x z) d z=x^{-1} \exp \left(-x^{2} / 2\right)
$$

For the other direction, we observe

$$
\int_{x}^{\infty}\left(1-3 y^{-4}\right) \exp \left(-y^{2} / 2\right) d y=\left(x^{-1}-x^{-3}\right) \exp \left(-x^{2} / 2\right)
$$

A distribution function on $\mathbf{R}$ is said to be absolutely continuous if it has a density and singular if the corresponding measure is singular w.r.t. Lebesgue measure. See Section A. 4 for more on these notions. An example of a singular distribution is:

Example 1.2.7. Uniform distribution on the Cantor set. The Cantor set $C$ is defined by removing $(1 / 3,2 / 3)$ from $[0,1]$ and then removing the middle third of each interval that remains. We define an associated distribution function by setting $F(x)=0$ for $x \leq 0, F(x)=1$ for $x \geq 1, F(x)=1 / 2$ for $x \in[1 / 3,2 / 3], F(x)=1 / 4$ for $x \in[1 / 9,2 / 9]$, $F(x)=3 / 4$ for $x \in[7 / 9,8 / 9], \ldots$ Then extend $F$ to all of $[0,1]$ using monotonicity. There is no $f$ for which (1.2.1) holds because such an $f$ would be equal to 0 on a set of measure 1 . From the definition, it is immediate that the corresponding measure has $\mu\left(C^{c}\right)=0$.

A probability measure $P$ (or its associated distribution function) is said to be discrete if there is a countable set $S$ with $P\left(S^{c}\right)=0$. The simplest example of a discrete distribution is

Example 1.2.8. Point mass at 0. $F(x)=1$ for $x \geq 0, F(x)=0$ for $x<0$.

In Section 1.6, we will see the Bernoulli, Poisson, and geometric distributions. The next example shows that the distribution function associated with a discrete probability measure can be quite wild.

![](https://cdn.mathpix.com/cropped/049c529c-af3b-4bc2-92f7-c2b31e6bd632-022.jpg?height=336&width=967&top_left_y=328&top_left_x=595)
Figure 1.5: Cantor distribution function

Example 1.2.9. Dense discontinuities. Let $q_{1}, q_{2}, \ldots$ be an enumeration of the rationals. Let $\alpha_{i}>0$ have $\sum_{i=1}^{\infty} \alpha_{1}=1$ and let

$$
F(x)=\sum_{i=1}^{\infty} \alpha_{i} 1_{\left[q_{i}, \infty\right)}
$$

where $1_{[\theta, \infty)}(x)=1$ if $x \in[\theta, \infty)=0$ otherwise.

## Exercises

1.2.1. Suppose $X$ and $Y$ are random variables on ( $\Omega, \mathcal{F}, P$ ) and let $A \in \mathcal{F}$ - Show that if we let $Z(\omega)=X(\omega)$ for $\omega \in A$ and $Z(\omega)=Y(\omega)$ for $\omega \in A^{c}$, then $Z$ is a random variable.
1.2.2. Let $\chi$ have the standard normal distribution. Use Theorem 1.2.6 to get upper and lower bounds on $P(\chi \geq 4)$.
1.2.3. Show that a distribution function has at most countably many discontinuities.
1.2.4. Show that if $F(x)=P(X \leq x)$ is continuous then $Y=F(X)$ has a uniform distribution on $(0,1)$, that is, if $y \in[0,1], P(Y \leq y)=y$.
1.2.5. Suppose $X$ has continuous density $f, P(\alpha \leq X \leq \beta)=1$ and $g$ is a function that is strictly increasing and differentiable on $(\alpha, \beta)$. Then $g(X)$ has density $f\left(g^{-1}(y)\right) / g^{\prime}\left(g^{-1}(y)\right)$ for $y \in(g(\alpha), g(\beta))$ and 0 otherwise. When $g(x)=a x+b$ with $a>0, g^{-1}(y)=(y-b) / a$ so the answer is $(1 / a) f((y-b) / a)$.
1.2.6. Suppose $X$ has a normal distribution. Use the previous exercise to compute the density of $\exp (X)$. (The answer is called the lognormal distribution.)
1.2.7. (i) Suppose $X$ has density function $f$. Compute the distribution function of $X^{2}$ and then differentiate to find its density function. (ii) Work out the answer when $X$ has a standard normal distribution to find the density of the chi-square distribution.

### 1.3 Random Variables

In this section, we will develop some results that will help us later to prove that quantities we define are random variables, i.e., they are measurable. Since most of what we have to say is true for random elements of an arbitrary measurable space ( $S, \mathcal{S}$ ) and the proofs are the same (sometimes easier), we will develop our results in that generality. First we need a definition. A function $X: \Omega \rightarrow S$ is said to be a measurable map from $(\Omega, \mathcal{F})$ to $(S, \mathcal{S})$ if

$$
X^{-1}(B) \equiv\{\omega: X(\omega) \in B\} \in \mathcal{F} \quad \text { for all } B \in \mathcal{S}
$$

If $(S, \mathcal{S})=\left(\mathbf{R}^{d}, \mathcal{R}^{d}\right)$ and $d>1$ then $X$ is called a random vector. Of course, if $d=1, X$ is called a random variable, or r.v. for short.

The next result is useful for proving that maps are measurable.
Theorem 1.3.1. If $\{\omega: X(\omega) \in A\} \in \mathcal{F}$ for all $A \in \mathcal{A}$ and $\mathcal{A}$ generates $\mathcal{S}$ (i.e., $\mathcal{S}$ is the smallest $\sigma$-field that contains $\mathcal{A}$ ), then $X$ is measurable.

Proof. Writing $\{X \in B\}$ as shorthand for $\{\omega: X(\omega) \in B\}$, we have

$$
\begin{aligned}
\left\{X \in \cup_{i} B_{i}\right\} & =\cup_{i}\left\{X \in B_{i}\right\} \\
\left\{X \in B^{c}\right\} & =\{X \in B\}^{c}
\end{aligned}
$$

So the class of sets $\mathcal{B}=\{B:\{X \in B\} \in \mathcal{F}\}$ is a $\sigma$-field. Since $\mathcal{B} \supset \mathcal{A}$ and $\mathcal{A}$ generates $\mathcal{S}, \mathcal{B} \supset \mathcal{S}$.

It follows from the two equations displayed in the previous proof that if $\mathcal{S}$ is a $\sigma$-field, then $\{\{X \in B\}: B \in \mathcal{S}\}$ is a $\sigma$-field. It is the smallest $\sigma$-field on $\Omega$ that makes $X$ a measurable map. It is called the $\sigma$-field generated by $X$ and denoted $\sigma(X)$. For future reference we note that

$$
\begin{equation*}
\sigma(X)=\{\{X \in B\}: B \in \mathcal{S}\} \tag{1.3.1}
\end{equation*}
$$

Example 1.3.2. If ( $S, \mathcal{S}$ ) $=(\mathbf{R}, \mathcal{R})$ then possible choices of $\mathcal{A}$ in Theorem 1.3.1 are $\{(-\infty, x]: x \in \mathbf{R}\}$ or $\{(-\infty, x): x \in \mathbf{Q}\}$ where $\mathbf{Q}=$ the rationals.

Example 1.3.3. If $(S, \mathcal{S})=\left(\mathbf{R}^{d}, \mathcal{R}^{d}\right)$, a useful choice of $\mathcal{A}$ is

$$
\left\{\left(a_{1}, b_{1}\right) \times \cdots \times\left(a_{d}, b_{d}\right):-\infty<a_{i}<b_{i}<\infty\right\}
$$

or occasionally the larger collection of open sets.
Theorem 1.3.4. If $X:(\Omega, \mathcal{F}) \rightarrow(S, \mathcal{S})$ and $f:(S, \mathcal{S}) \rightarrow(T, \mathcal{T})$ are measurable maps, then $f(X)$ is a measurable map from $(\Omega, \mathcal{F})$ to $(T, \mathcal{T})$

Proof. Let $B \in \mathcal{T} .\{\omega: f(X(\omega)) \in B\}=\left\{\omega: X(\omega) \in f^{-1}(B)\right\} \in \mathcal{F}$, since by assumption $f^{-1}(B) \in \mathcal{S}$.

From Theorem 1.3.4, it follows immediately that if $X$ is a random variable then so is $c X$ for all $c \in \mathbf{R}, X^{2}, \sin (X)$, etc. The next result shows why we wanted to prove Theorem 1.3.4 for measurable maps.

Theorem 1.3.5. If $X_{1}, \ldots X_{n}$ are random variables and $f:\left(\mathbf{R}^{n}, \mathcal{R}^{n}\right) \rightarrow (\mathbf{R}, \mathcal{R})$ is measurable, then $f\left(X_{1}, \ldots, X_{n}\right)$ is a random variable.

Proof. In view of Theorem 1.3.4, it suffices to show that $\left(X_{1}, \ldots, X_{n}\right)$ is a random vector. To do this, we observe that if $A_{1}, \ldots, A_{n}$ are Borel sets then

$$
\left\{\left(X_{1}, \ldots, X_{n}\right) \in A_{1} \times \cdots \times A_{n}\right\}=\cap_{i}\left\{X_{i} \in A_{i}\right\} \in \mathcal{F}
$$

Since sets of the form $A_{1} \times \cdots \times A_{n}$ generate $\mathcal{R}^{n}$, the desired result follows from Theorem 1.3.1.

Theorem 1.3.6. If $X_{1}, \ldots, X_{n}$ are random variables then $X_{1}+\ldots+X_{n}$ is a random variable.

Proof. In view of Theorem 1.3.5 it suffices to show that $f\left(x_{1}, \ldots, x_{n}\right)= x_{1}+\ldots+x_{n}$ is measurable. To do this, we use Example 1.3.2 and note that $\left\{x: x_{1}+\ldots+x_{n}<a\right\}$ is an open set and hence is in $\mathcal{R}^{n}$.

Theorem 1.3.7. If $X_{1}, X_{2} \ldots$ are random variables then so are

$$
\inf _{n} X_{n} \quad \sup _{n} X_{n} \quad \limsup _{n} X_{n} \quad \liminf _{n} X_{n}
$$

Proof. Since the infimum of a sequence is $<a$ if and only if some term is $<a$ (if all terms are $\geq a$ then the infimum is), we have

$$
\left\{\inf _{n} X_{n}<a\right\}=\cup_{n}\left\{X_{n}<a\right\} \in \mathcal{F}
$$

A similar argument shows $\left\{\sup _{n} X_{n}>a\right\}=\cup_{n}\left\{X_{n}>a\right\} \in \mathcal{F}$. For the last two, we observe

$$
\begin{aligned}
& \liminf _{n \rightarrow \infty} X_{n}=\sup _{n}\left(\inf _{m \geq n} X_{m}\right) \\
& \limsup _{n \rightarrow \infty} X_{n}=\inf _{n}\left(\sup _{m \geq n} X_{m}\right)
\end{aligned}
$$

To complete the proof in the first case, note that $Y_{n}=\inf _{m \geq n} X_{m}$ is a random variable for each $n$ so $\sup _{n} Y_{n}$ is as well.

From Theorem 1.3.7, we see that

$$
\Omega_{o} \equiv\left\{\omega: \lim _{n \rightarrow \infty} X_{n} \text { exists }\right\}=\left\{\omega: \limsup _{n \rightarrow \infty} X_{n}-\liminf _{n \rightarrow \infty} X_{n}=0\right\}
$$

is a measurable set. (Here $\equiv$ indicates that the first equality is a definition.) If $P\left(\Omega_{o}\right)=1$, we say that $X_{n}$ converges almost surely, or
a.s. for short. This type of convergence called almost everywhere in measure theory. To have a limit defined on the whole space, it is convenient to let

$$
X_{\infty}=\limsup _{n \rightarrow \infty} X_{n}
$$

but this random variable may take the value $+\infty$ or $-\infty$. To accommodate this and some other headaches, we will generalize the definition of random variable.

A function whose domain is a set $D \in \mathcal{F}$ and whose range is $\mathbf{R}^{*} \equiv [-\infty, \infty]$ is said to be a random variable if for all $B \in \mathcal{R}^{*}$ we have $X^{-1}(B)=\{\omega: X(\omega) \in B\} \in \mathcal{F}$. Here $\mathcal{R}^{*}=$ the Borel subsets of $\mathbf{R}^{*}$ with $\mathbf{R}^{*}$ given the usual topology, i.e., the one generated by intervals of the form $[-\infty, a),(a, b)$ and $(b, \infty]$ where $a, b \in \mathbf{R}$. The reader should note that the extended real line $\left(\mathbf{R}^{*}, \mathcal{R}^{*}\right)$ is a measurable space, so all the results above generalize immediately.

## Exercises

1.3.1. Show that if $\mathcal{A}$ generates $\mathcal{S}$, then $X^{-1}(\mathcal{A}) \equiv\{\{X \in A\}: A \in \mathcal{A}\}$ generates $\sigma(X)=\{\{X \in B\}: B \in \mathcal{S}\}$.
1.3.2. Prove Theorem 1.3.6 when $n=2$ by checking $\left\{X_{1}+X_{2}<x\right\} \in \mathcal{F}$.
1.3.3. Show that if $f$ is continuous and $X_{n} \rightarrow X$ almost surely then $f\left(X_{n}\right) \rightarrow f(X)$ almost surely.
1.3.4. (i) Show that a continuous function from $\mathbf{R}^{d} \rightarrow \mathbf{R}$ is a measurable map from ( $\mathbf{R}^{d}, \mathcal{R}^{d}$ ) to ( $\mathbf{R}, \mathcal{R}$ ). (ii) Show that $\mathcal{R}^{d}$ is the smallest $\sigma$-field that makes all the continuous functions measurable.
1.3.5. A function $f$ is said to be lower semicontinuous or l.s.c. if

$$
\liminf _{y \rightarrow x} f(y) \geq f(x)
$$

and upper semicontinuous (u.s.c.) if $-f$ is l.s.c. Show that $f$ is l.s.c. if and only if $\{x: f(x) \leq a\}$ is closed for each $a \in \mathbf{R}$ and conclude that semicontinuous functions are measurable.
1.3.6. Let $f: \mathbf{R}^{d} \rightarrow \mathbf{R}$ be an arbitrary function and let $f^{\delta}(x)= \sup \{f(y):|y-x|<\delta\}$ and $f_{\delta}(x)=\inf \{f(y):|y-x|<\delta\}$ where $|z|=\left(z_{1}^{2}+\ldots+z_{d}^{2}\right)^{1 / 2}$. Show that $f^{\delta}$ is l.s.c. and $f_{\delta}$ is u.s.c. Let $f^{0}=\lim _{\delta \downarrow 0} f^{\delta}, f_{0}=\lim _{\delta \downarrow 0} f_{\delta}$, and conclude that the set of points at which $f$ is discontinuous $=\left\{f^{0} \neq f_{0}\right\}$ is measurable.
follows from the fact that $f^{0}-f_{0}$ is.
1.3.7. A function $\varphi: \Omega \rightarrow \mathbf{R}$ is said to be simple if

$$
\varphi(\omega)=\sum_{m=1}^{n} c_{m} 1_{A_{m}}(\omega)
$$

where the $c_{m}$ are real numbers and $A_{m} \in \mathcal{F}$. Show that the class of $\mathcal{F}$ measurable functions is the smallest class containing the simple functions and closed under pointwise limits.
1.3.8. Use the previous exercise to conclude that $Y$ is measurable with respect to $\sigma(X)$ if and only if $Y=f(X)$ where $f: \mathbf{R} \rightarrow \mathbf{R}$ is measurable.
1.3.9. To get a constructive proof of the last result, note that $\{\omega: \left.m 2^{-n} \leq Y<(m+1) 2^{-n}\right\}=\left\{X \in B_{m, n}\right\}$ for some $B_{m, n} \in \mathcal{R}$ and set $f_{n}(x)=m 2^{-n}$ for $x \in B_{m, n}$ and show that as $n \rightarrow \infty f_{n}(x) \rightarrow f(x)$ and $Y=f(X)$.

### 1.4 Integration

Let $\mu$ be a $\sigma$-finite measure on ( $\Omega, \mathcal{F}$ ). We will be primarily interested in the special case $\mu$ is a probability measure, but we will sometimes need to integrate with respect to infinite measure and it is no harder to develop the results in general.

In this section we will define $\int f d \mu$ for a class of measurable functions. This is a four-step procedure:

1. Simple functions
2. Bounded functions
3. Nonnegative functions
4. General functions

This sequence of four steps is also useful in proving integration formulas. See, for example, the proofs of Theorems 1.6.9 and 1.7.2.

Step 1. $\varphi$ is said to be a simple function if $\varphi(\omega)=\sum_{i=1}^{n} a_{i} 1_{A_{i}}$ and $A_{i}$ are disjoint sets with $\mu\left(A_{i}\right)<\infty$. If $\varphi$ is a simple function, we let

$$
\int \varphi d \mu=\sum_{i=1}^{n} a_{i} \mu\left(A_{i}\right)
$$

The representation of $\varphi$ is not unique since we have not supposed that the $a_{i}$ are distinct. However, it is easy to see that the last definition does not contradict itself.

We will prove the next three conclusions four times, but before we can state them for the first time, we need a definition. $\varphi \geq \psi \mu$-almost everywhere (or $\varphi \geq \psi \mu$-a.e.) means $\mu(\{\omega: \varphi(\omega)<\psi(\omega)\})=0$. When there is no doubt about what measure we are referring to, we drop the $\mu$.

Lemma 1.4.1. Let $\varphi$ and $\psi$ be simple functions.
(i) If $\varphi \geq 0$ a.e. then $\int \varphi d \mu \geq 0$.
(ii) For any $a \in \mathbf{R}, \int a \varphi d \mu=a \int \varphi d \mu$.
(iii) $\int \varphi+\psi d \mu=\int \varphi d \mu+\int \psi d \mu$.

Proof. (i) and (ii) are immediate consequences of the definition. To prove (iii), suppose

$$
\varphi=\sum_{i=1}^{m} a_{i} 1_{A_{i}} \quad \text { and } \quad \psi=\sum_{j=1}^{n} b_{j} 1_{B_{j}}
$$

To make the supports of the two functions the same, we let $A_{0}=\cup_{i} B_{i}- \cup_{i} A_{i}$, let $B_{0}=\cup_{i} A_{i}-\cup_{i} B_{i}$, and let $a_{0}=b_{0}=0$. Now

$$
\varphi+\psi=\sum_{i=0}^{m} \sum_{j=0}^{n}\left(a_{i}+b_{j}\right) 1_{\left(A_{i} \cap B_{j}\right)}
$$

and the $A_{i} \cap B_{j}$ are pairwise disjoint, so

$$
\begin{aligned}
\int(\varphi+\psi) d \mu & =\sum_{i=0}^{m} \sum_{j=0}^{n}\left(a_{i}+b_{j}\right) \mu\left(A_{i} \cap B_{j}\right) \\
& =\sum_{i=0}^{m} \sum_{j=0}^{n} a_{i} \mu\left(A_{i} \cap B_{j}\right)+\sum_{j=0}^{n} \sum_{i=0}^{m} b_{j} \mu\left(A_{i} \cap B_{j}\right) \\
& =\sum_{i=0}^{m} a_{i} \mu\left(A_{i}\right)+\sum_{j=0}^{n} b_{j} \mu\left(B_{j}\right)=\int \varphi d \mu+\int \psi d \mu
\end{aligned}
$$

In the next-to-last step, we used $A_{i}=+_{j}\left(A_{i} \cap B_{j}\right)$ and $B_{j}=+_{i}\left(A_{i} \cap B_{j}\right)$, where + denotes a disjoint union.

We will prove (i)-(iii) three more times as we generalize our integral. As a consequence of (i)-(iii), we get three more useful properties. To keep from repeating their proofs, which do not change, we will prove

Lemma 1.4.2. If (i) and (iii) hold then we have:
(iv) If $\varphi \leq \psi$ a.e. then $\int \varphi d \mu \leq \int \psi d \mu$.
(v) If $\varphi=\psi$ a.e. then $\int \varphi d \mu=\int \psi d \mu$.

If, in addition, (ii) holds when $a=-1$ we have
(vi) $\left|\int \varphi d \mu\right| \leq \int|\varphi| d \mu$

Proof. By (iii), $\int \psi d \mu=\int \varphi d \mu+\int(\psi-\varphi) d \mu$ and the second integral is $\geq 0$ by (i), so (iv) holds. $\varphi=\psi$ a.e. implies $\varphi \leq \psi$ a.e. and $\psi \leq \varphi$ a.e. so (v) follows from two applications of (iv). To prove (vi) now, notice that $\varphi \leq|\varphi|$ so (iv) implies $\int \varphi d \mu \leq \int|\varphi| d \mu .-\varphi \leq|\varphi|$, so (iv) and (ii) imply $-\int \varphi d \mu \leq \int|\varphi| d \mu$. Since $|y|=\max (y,-y)$, the result follows.

Step 2. Let $E$ be a set with $\mu(E)<\infty$ and let $f$ be a bounded function that vanishes on $E^{c}$. To define the integral of $f$, we observe that if $\varphi, \psi$ are simple functions that have $\varphi \leq f \leq \psi$, then we want to have

$$
\int \varphi d \mu \leq \int f d \mu \leq \int \psi d \mu
$$

so we let

$$
\begin{equation*}
\int f d \mu=\sup _{\varphi \leq f} \int \varphi d \mu=\inf _{\psi \geq f} \int \psi d \mu \tag{1.4.1}
\end{equation*}
$$

Here and for the rest of Step 2, we assume that $\varphi$ and $\psi$ vanish on $E^{c}$. To justify the definition, we have to prove that the sup and inf are equal. It follows from (iv) in Lemma 1.4.2 that

$$
\sup _{\varphi \leq f} \int \varphi d \mu \leq \inf _{\psi \geq f} \int \psi d \mu
$$

To prove the other inequality, suppose $|f| \leq M$ and let

$$
\begin{aligned}
& E_{k}=\left\{x \in E: \frac{k M}{n} \geq f(x)>\frac{(k-1) M}{n}\right\} \quad \text { for }-n \leq k \leq n \\
& \psi_{n}(x)=\sum_{k=-n}^{n} \frac{k M}{n} 1_{E_{k}} \quad \varphi_{n}(x)=\sum_{k=-n}^{n} \frac{(k-1) M}{n} 1_{E_{k}}
\end{aligned}
$$

By definition, $\psi_{n}(x)-\varphi_{n}(x)=(M / n) 1_{E}$, so

$$
\int \psi_{n}(x)-\varphi_{n}(x) d \mu=\frac{M}{n} \mu(E)
$$

Since $\varphi_{n}(x) \leq f(x) \leq \psi_{n}(x)$, it follows from (iii) in Lemma 1.4.1 that

$$
\begin{aligned}
\sup _{\varphi \leq f} \int \varphi d \mu \geq \int \varphi_{n} d \mu & =-\frac{M}{n} \mu(E)+\int \psi_{n} d \mu \\
& \geq-\frac{M}{n} \mu(E)+\inf _{\psi \geq f} \int \psi d \mu
\end{aligned}
$$

The last inequality holds for all $n$, so the proof is complete.
Lemma 1.4.3. Let $E$ be a set with $\mu(E)<\infty$. If $f$ and $g$ are bounded functions that vanish on $E^{c}$ then:
(i) If $f \geq 0$ a.e. then $\int f d \mu \geq 0$.
(ii) For any $a \in \mathbf{R}, \int a f d \mu=a \int f d \mu$.
(iii) $\int f+g d \mu=\int f d \mu+\int g d \mu$.
(iv) If $g \leq f$ a.e. then $\int g d \mu \leq \int f d \mu$.
(v) If $g=f$ a.e. then $\int g d \mu=\int f d \mu$.
(vi) $\left|\int f d \mu\right| \leq \int|f| d \mu$.

Proof. Since we can take $\varphi \equiv 0$, (i) is clear from the definition. To prove (ii), we observe that if $a>0$, then $a \varphi \leq a f$ if and only if $\varphi \leq f$, so

$$
\int a f d \mu=\sup _{\varphi \leq f} \int a \varphi d \mu=\sup _{\varphi \leq f} a \int \varphi d \mu=a \sup _{\varphi \leq f} \int \varphi d \mu=a \int f d \mu
$$

For $a<0$, we observe that $a \varphi \leq a f$ if and only if $\varphi \geq f$, so

$$
\int a f d \mu=\sup _{\varphi \geq f} \int a \varphi d \mu=\sup _{\varphi \geq f} a \int \varphi d \mu=a \inf _{\varphi \geq f} \int \varphi d \mu=a \int f d \mu
$$

To prove (iii), we observe that if $\psi_{1} \geq f$ and $\psi_{2} \geq g$, then $\psi_{1}+\psi_{2} \geq f+g$ so

$$
\inf _{\psi \geq f+g} \int \psi d \mu \leq \inf _{\psi_{1} \geq f, \psi_{2} \geq g} \int \psi_{1}+\psi_{2} d \mu
$$

Using linearity for simple functions, it follows that

$$
\begin{aligned}
\int f+g d \mu & =\inf _{\psi \geq f+g} \int \psi d \mu \\
& \leq \inf _{\psi_{1} \geq f, \psi_{2} \geq g} \int \psi_{1} d \mu+\int \psi_{2} d \mu=\int f d \mu+\int g d \mu
\end{aligned}
$$

To prove the other inequality, observe that the last conclusion applied to $-f$ and $-g$ and (ii) imply

$$
-\int f+g d \mu \leq-\int f d \mu-\int g d \mu
$$

(iv)-(vi) follow from (i)-(iii) by Lemma 1.4.2.

Notation. We define the integral of $f$ over the set $E$ :

$$
\int_{E} f d \mu \equiv \int f \cdot 1_{E} d \mu
$$

Step 3. If $f \geq 0$ then we let

$$
\int f d \mu=\sup \left\{\int h d \mu: 0 \leq h \leq f, h \text { is bounded and } \mu(\{x: h(x)>0\})<\infty\right\}
$$

The last definition is nice since it is clear that this is well defined. The next result will help us compute the value of the integral.

Lemma 1.4.4. Let $E_{n} \uparrow \Omega$ have $\mu\left(E_{n}\right)<\infty$ and let $a \wedge b=\min (a, b)$.
Then

$$
\int_{E_{n}} f \wedge n d \mu \uparrow \int f d \mu \quad \text { as } n \uparrow \infty
$$

Proof. It is clear that from (iv) in Lemma 1.4.3 that the left-hand side increases as $n$ does. Since $h=(f \wedge n) 1_{E_{n}}$ is a possibility in the sup, each term is smaller than the integral on the right. To prove that the limit is $\int f d \mu$, observe that if $0 \leq h \leq f, h \leq M$, and $\mu(\{x: h(x)>0\})<\infty$, then for $n \geq M$ using $h \leq M$, (iv), and (iii),

$$
\int_{E_{n}} f \wedge n d \mu \geq \int_{E_{n}} h d \mu=\int h d \mu-\int_{E_{n}^{c}} h d \mu
$$

Now $0 \leq \int_{E_{n}^{c}} h d \mu \leq M \mu\left(E_{n}^{c} \cap\{x: h(x)>0\}\right) \rightarrow 0$ as $n \rightarrow \infty$, so

$$
\liminf _{n \rightarrow \infty} \int_{E_{n}} f \wedge n d \mu \geq \int h d \mu
$$

which proves the desired result since $h$ is an arbitrary member of the class that defines the integral of $f$.

Lemma 1.4.5. Suppose $f, g \geq 0$.
(i) $\int f d \mu \geq 0$
(ii) If $a>0$ then $\int$ af $d \mu=a \int f d \mu$.
(iii) $\int f+g d \mu=\int f d \mu+\int g d \mu$
(iv) If $0 \leq g \leq f$ a.e. then $\int g d \mu \leq \int f d \mu$.
(v) If $0 \leq g=f$ a.e. then $\int g d \mu=\int f d \mu$.

Here we have dropped (vi) because it is trivial for $f \geq 0$.
Proof. (i) is trivial from the definition. (ii) is clear, since when $a>0$, $a h \leq a f$ if and only if $h \leq f$ and we have $\int a h d \mu=a \int h d u$ for $h$ in the defining class. For (iii), we observe that if $f \geq h$ and $g \geq k$, then $f+g \geq h+k$ so taking the sup over $h$ and $k$ in the defining classes for $f$ and $g$ gives

$$
\int f+g d \mu \geq \int f d \mu+\int g d \mu
$$

To prove the other direction, we observe $(a+b) \wedge n \leq(a \wedge n)+(b \wedge n)$ so (iv) from Lemma 1.4.3 and (iii) from Lemma 1.4.4 imply

$$
\int_{E_{n}}(f+g) \wedge n d \mu \leq \int_{E_{n}} f \wedge n d \mu+\int_{E_{n}} g \wedge n d \mu
$$

Letting $n \rightarrow \infty$ and using Lemma 1.4.4 gives (iii). As before, (iv) and (v) follow from (i), (iii), and Lemma 1.4.2.

Step 4. We say $f$ is integrable if $\int|f| d \mu<\infty$. Let

$$
f^{+}(x)=f(x) \vee 0 \quad \text { and } \quad f^{-}(x)=(-f(x)) \vee 0
$$

where $a \vee b=\max (a, b)$. Clearly,

$$
f(x)=f^{+}(x)-f^{-}(x) \quad \text { and } \quad|f(x)|=f^{+}(x)+f^{-}(x)
$$

We define the integral of $f$ by

$$
\int f d \mu=\int f^{+} d \mu-\int f^{-} d \mu
$$

The right-hand side is well defined since $f^{+}, f^{-} \leq|f|$ and we have (iv) in Lemma 1.4.5. For the final time, we will prove our six properties. To do this, it is useful to know:

Lemma 1.4.6. If $f=f_{1}-f_{2}$ where $f_{1}, f_{2} \geq 0$ and $\int f_{i} d \mu<\infty$ then

$$
\int f d \mu=\int f_{1} d \mu-\int f_{2} d \mu
$$

Proof. $f_{1}+f^{-}=f_{2}+f^{+}$and all four functions are $\geq 0$, so by (iii) of Lemma 1.4.5,

$$
\int f_{1} d \mu+\int f^{-} d \mu=\int f_{1}+f^{-} d \mu=\int f_{2}+f^{+} d \mu=\int f_{2} d \mu+\int f^{+} d \mu
$$

Rearranging gives the desired conclusion.
Theorem 1.4.7. Suppose $f$ and $g$ are integrable.
(i) If $f \geq 0$ a.e. then $\int f d \mu \geq 0$.
(ii) For all $a \in \mathbf{R}, \int a f d \mu=a \int f d \mu$.
(iii) $\int f+g d \mu=\int f d \mu+\int g d \mu$
(iv) If $g \leq f$ a.e. then $\int g d \mu \leq \int f d \mu$.
(v) If $g=f$ a.e. then $\int g d \mu=\int f d \mu$.
(vi) $\left|\int f d \mu\right| \leq \int|f| d \mu$.

Proof. (i) is trivial. (ii) is clear since if $a>0$, then $(a f)^{+}=a\left(f^{+}\right)$, and so on. To prove (iii), observe that $f+g=\left(f^{+}+g^{+}\right)-\left(f^{-}+g^{-}\right)$, so using Lemma 1.4.6 and Lemma 1.4.5

$$
\begin{aligned}
\int f+g d \mu & =\int f^{+}+g^{+} d \mu-\int f^{-}+g^{-} d \mu \\
& =\int f^{+} d \mu+\int g^{+} d \mu-\int f^{-} d \mu-\int g^{-} d \mu
\end{aligned}
$$

As usual, (iv)-(vi) follow from (i)-(iii) and Lemma 1.4.2.

## Notation for special cases:

(a) When $(\Omega, \mathcal{F}, \mu)=\left(\mathbf{R}^{d}, \mathcal{R}^{d}, \lambda\right)$, we write $\int f(x) d x$ for $\int f d \lambda$.
(b) When $(\Omega, \mathcal{F}, \mu)=(\mathbf{R}, \mathcal{R}, \lambda)$ and $E=[a, b]$, we write $\int_{a}^{b} f(x) d x$ for $\int_{E} f d \lambda$.
(c) When $(\Omega, \mathcal{F}, \mu)=(\mathbf{R}, \mathcal{R}, \mu)$ with $\mu((a, b])=G(b)-G(a)$ for $a<b$, we write $\int f(x) d G(x)$ for $\int f d \mu$.
(d) When $\Omega$ is a countable set, $\mathcal{F}=$ all subsets of $\Omega$, and $\mu$ is counting measure, we write $\sum_{i \in \Omega} f(i)$ for $\int f d \mu$.
We mention example (d) primarily to indicate that results for sums follow from those for integrals. The notation for the special case in which $\mu$ is a probability measure will be taken up in Section 1.6.

## Exercises

1.4.1. Show that if $f \geq 0$ and $\int f d \mu=0$ then $f=0$ a.e.
1.4.2. Let $f \geq 0$ and $E_{n, m}=\left\{x: m / 2^{n} \leq f(x)<(m+1) / 2^{n}\right\}$. As $n \uparrow \infty$,

$$
\sum_{m=1}^{\infty} \frac{m}{2^{n}} \mu\left(E_{n, m}\right) \uparrow \int f d \mu
$$

1.4.3. Let $g$ be an integrable function on $\mathbf{R}$ and $\epsilon>0$. (i) Use the definition of the integral to conclude there is a simple function $\varphi= \sum_{k} b_{k} 1_{A_{k}}$ with $\int|g-\varphi| d x<\epsilon$. (ii) Use Exercise A.2.1 to approximate the $A_{k}$ by finite unions of intervals to get a step function

$$
q=\sum_{j=1}^{k} c_{j} 1_{\left(a_{j-1}, a_{j}\right)}
$$

with $a_{0}<a_{1}<\ldots<a_{k}$, so that $\int|\varphi-q|<\epsilon$. (iii) Round the corners of $q$ to get a continuous function $r$ so that $\int|q-r| d x<\epsilon$.
(iii) To make a continuous function replace each $c_{j} 1_{\left(a_{j-1}, a_{j}\right)}$ by a function that is $0\left(a_{j-1}, a_{j}\right)^{c}, c_{j}$ on $\left[a_{j-1}+\delta-j, a_{j}-\delta_{j}\right]$, and linear otherwise. If the $\delta_{j}$ are small enough and we let $r(x)=\sum_{j=1}^{k} r_{j}(x)$ then

$$
\int|q(x)-r(x)| d \mu=\sum_{j=1}^{k} \delta_{j} c_{j}<\epsilon
$$

1.4.4. Prove the Riemann-Lebesgue lemma. If $g$ is integrable then

$$
\lim _{n \rightarrow \infty} \int g(x) \cos n x d x=0
$$

Hint: If $g$ is a step function, this is easy. Now use the previous exercise.

### 1.5 Properties of the Integral

In this section, we will develop properties of the integral defined in the last section. Our first result generalizes (vi) from Theorem 1.4.7.

Theorem 1.5.1. Jensen's inequality. Suppose $\varphi$ is convex, that is,

$$
\lambda \varphi(x)+(1-\lambda) \varphi(y) \geq \varphi(\lambda x+(1-\lambda) y)
$$

for all $\lambda \in(0,1)$ and $x, y \in \mathbf{R}$. If $\mu$ is a probability measure, and $f$ and $\varphi(f)$ are integrable then

$$
\varphi\left(\int f d \mu\right) \leq \int \varphi(f) d \mu
$$

Proof. Let $c=\int f d \mu$ and let $\ell(x)=a x+b$ be a linear function that has $\ell(c)=\varphi(c)$ and $\varphi(x) \geq \ell(x)$. To see that such a function exists, recall that convexity implies

$$
\lim _{h \downarrow 0} \frac{\varphi(c)-\varphi(c-h)}{h} \leq \lim _{h \downarrow 0} \frac{\varphi(c+h)-\varphi(c)}{h}
$$

(The limits exist since the sequences are monotone.) If we let $a$ be any number between the two limits and let $\ell(x)=a(x-c)+\varphi(c)$, then $\ell$ has the desired properties. With the existence of $\ell$ established, the rest is easy. (iv) in Theorem 1.4.7 implies

$$
\int \varphi(f) d \mu \geq \int(a f+b) d \mu=a \int f d \mu+b=\ell\left(\int f d \mu\right)=\varphi\left(\int f d \mu\right)
$$

since $c=\int f d \mu$ and $\ell(c)=\varphi(c)$.
Let $\|f\|_{p}=\left(\int|f|^{p} d \mu\right)^{1 / p}$ for $1 \leq p<\infty$, and notice $\|c f\|_{p}=|c| \cdot\|f\|_{p}$ for any real number $c$.

Theorem 1.5.2. Hölder's inequality. If $p, q \in(1, \infty)$ with $1 / p+1 / q=$ 1 then

$$
\int|f g| d \mu \leq\|f\|_{p}\|g\|_{q}
$$

Proof. If $\|f\|_{p}$ or $\|g\|_{q}=0$ then $|f g|=0$ a.e., so it suffices to prove the result when $\|f\|_{p}$ and $\|g\|_{q}>0$ or by dividing both sides by $\|f\|_{p}\|g\|_{q}$, when $\|f\|_{p}=\|g\|_{q}=1$. Fix $y \geq 0$ and let

$$
\begin{aligned}
\varphi(x) & =x^{p} / p+y^{q} / q-x y \quad \text { for } x \geq 0 \\
\varphi^{\prime}(x) & =x^{p-1}-y \quad \text { and } \quad \varphi^{\prime \prime}(x)=(p-1) x^{p-2}
\end{aligned}
$$

so $\varphi$ has a minimum at $x_{o}=y^{1 /(p-1)} . q=p /(p-1)$ and $x_{o}^{p}=y^{p /(p-1)}=y^{q}$ so

$$
\varphi\left(x_{o}\right)=y^{q}(1 / p+1 / q)-y^{1 /(p-1)} y=0
$$

Since $x_{o}$ is the minimum, it follows that $x y \leq x^{p} / p+y^{q} / q$. Letting $x=|f|, y=|g|$, and integrating

$$
\int|f g| d \mu \leq \frac{1}{p}+\frac{1}{q}=1=\|f\|_{p}\|g\|_{q}
$$

Remark. The special case $p=q=2$ is called the Cauchy-Schwarz inequality. One can give a direct proof of the result in this case by observing that for any $\theta$,

$$
0 \leq \int(f+\theta g)^{2} d \mu=\int f^{2} d \mu+\theta\left(2 \int f g d \mu\right)+\theta^{2}\left(\int g^{2} d \mu\right)
$$

so the quadratic $a \theta^{2}+b \theta+c$ on the right-hand side has at most one real root. Recalling the formula for the roots of a quadratic

$$
\frac{-b \pm \sqrt{b^{2}-4 a c}}{2 a}
$$

we see $b^{2}-4 a c \leq 0$, which is the desired result.
Our next goal is to give conditions that guarantee

$$
\lim _{n \rightarrow \infty} \int f_{n} d \mu=\int\left(\lim _{n \rightarrow \infty} f_{n}\right) d \mu
$$

First, we need a definition. We say that $f_{n} \rightarrow f$ in measure, i.e., for any $\epsilon>0, \mu\left(\left\{x:\left|f_{n}(x)-f(x)\right|>\epsilon\right\}\right) \rightarrow 0$ as $n \rightarrow \infty$. On a space of finite measure, this is a weaker assumption than $f_{n} \rightarrow f$ a.e., but the next result is easier to prove in the greater generality.
Theorem 1.5.3. Bounded convergence theorem. Let $E$ be a set with $\mu(E)<\infty$. Suppose $f_{n}$ vanishes on $E^{c},\left|f_{n}(x)\right| \leq M$, and $f_{n} \rightarrow f$ in measure. Then

$$
\int f d \mu=\lim _{n \rightarrow \infty} \int f_{n} d \mu
$$

Example 1.5.4. Consider the real line $\mathbf{R}$ equipped with the Borel sets $\mathcal{R}$ and Lebesgue measure $\lambda$. The functions $f_{n}(x)=1 / n$ on $[0, n]$ and 0 otherwise on show that the conclusion of Theorem 1.5.3 does not hold when $\mu(E)=\infty$.
Proof. Let $\epsilon>0, G_{n}=\left\{x:\left|f_{n}(x)-f(x)\right|<\epsilon\right\}$ and $B_{n}=E-G_{n}$. Using (iii) and (vi) from Theorem 1.4.7,

$$
\begin{aligned}
\left|\int f d \mu-\int f_{n} d \mu\right| & =\left|\int\left(f-f_{n}\right) d \mu\right| \leq \int\left|f-f_{n}\right| d \mu \\
& =\int_{G_{n}}\left|f-f_{n}\right| d \mu+\int_{B_{n}}\left|f-f_{n}\right| d \mu \\
& \leq \epsilon \mu(E)+2 M \mu\left(B_{n}\right)
\end{aligned}
$$

$f_{n} \rightarrow f$ in measure implies $\mu\left(B_{n}\right) \rightarrow 0 . \epsilon>0$ is arbitrary and $\mu(E)<\infty$, so the proof is complete.

Theorem 1.5.5. Fatou's lemma. If $f_{n} \geq 0$ then

$$
\liminf _{n \rightarrow \infty} \int f_{n} d \mu \geq \int\left(\liminf _{n \rightarrow \infty} f_{n}\right) d \mu
$$

Example 1.5.6. Example 1.5.4 shows that we may have strict inequality in Theorem 1.5.5. The functions $f_{n}(x)=n 1_{(0,1 / n]}(x)$ on $(0,1)$ equipped with the Borel sets and Lebesgue measure show that this can happen on a space of finite measure.

Proof. Let $g_{n}(x)=\inf _{m \geq n} f_{m}(x) . f_{n}(x) \geq g_{n}(x)$ and as $n \uparrow \infty$,

$$
g_{n}(x) \uparrow g(x)=\liminf _{n \rightarrow \infty} f_{n}(x)
$$

Since $\int f_{n} d \mu \geq \int g_{n} d \mu$, it suffices then to show that

$$
\liminf _{n \rightarrow \infty} \int g_{n} d \mu \geq \int g d \mu
$$

Let $E_{m} \uparrow \Omega$ be sets of finite measure. Since $g_{n} \geq 0$ and for fixed $m$

$$
\left(g_{n} \wedge m\right) \cdot 1_{E_{m}} \rightarrow(g \wedge m) \cdot 1_{E_{m}} \quad \text { a.e. }
$$

the bounded convergence theorem, 1.5.3, implies

$$
\liminf _{n \rightarrow \infty} \int g_{n} d \mu \geq \int_{E_{m}} g_{n} \wedge m d \mu \rightarrow \int_{E_{m}} g \wedge m d \mu
$$

Taking the sup over $m$ and using Theorem 1.4.4 gives the desired result.

Theorem 1.5.7. Monotone convergence theorem. If $f_{n} \geq 0$ and $f_{n} \uparrow f$ then

$$
\int f_{n} d \mu \uparrow \int f d \mu
$$

Proof. Fatou's lemma, Theorem 1.5.5, implies $\liminf \int f_{n} d \mu \geq \int f d \mu$. On the other hand, $f_{n} \leq f$ implies $\limsup \int f_{n} d \mu \leq \int f d \mu$.

Theorem 1.5.8. Dominated convergence theorem. If $f_{n} \rightarrow f$ a.e., $\left|f_{n}\right| \leq g$ for all $n$, and $g$ is integrable, then $\int f_{n} d \mu \rightarrow \int f d \mu$.

Proof. $f_{n}+g \geq 0$ so Fatou's lemma implies

$$
\liminf _{n \rightarrow \infty} \int f_{n}+g d \mu \geq \int f+g d \mu
$$

Subtracting $\int g d \mu$ from both sides gives

$$
\liminf _{n \rightarrow \infty} \int f_{n} d \mu \geq \int f d \mu
$$

Applying the last result to $-f_{n}$, we get

$$
\limsup _{n \rightarrow \infty} \int f_{n} d \mu \leq \int f d \mu
$$

and the proof is complete.

## Exercises

1.5.1. Let $\|f\|_{\infty}=\inf \{M: \mu(\{x:|f(x)|>M\})=0\}$. Prove that

$$
\int|f g| d \mu \leq\|f\|_{1}\|g\|_{\infty}
$$

1.5.2. Show that if $\mu$ is a probability measure then

$$
\|f\|_{\infty}=\lim _{p \rightarrow \infty}\|f\|_{p}
$$

1.5.3. Minkowski's inequality. (i) Suppose $p \in(1, \infty)$. The inequality $|f+g|^{p} \leq 2^{p}\left(|f|^{p}+|g|^{p}\right)$ shows that if $\|f\|_{p}$ and $\|g\|_{p}$ are $<\infty$ then $\|f+g\|_{p}<\infty$. Apply Hölder's inequality to $|f||f+g|^{p-1}$ and $|g||f+g|^{p-1}$ to show $\|f+g\|_{p} \leq\|f\|_{p}+\|g\|_{p}$. (ii) Show that the last result remains true when $p=1$ or $p=\infty$.
1.5.4. If $f$ is integrable and $E_{m}$ are disjoint sets with union $E$ then

$$
\sum_{m=0}^{\infty} \int_{E_{m}} f d \mu=\int_{E} f d \mu
$$

So if $f \geq 0$, then $\nu(E)=\int_{E} f d \mu$ defines a measure.
1.5.5. If $g_{n} \uparrow g$ and $\int g_{1}^{-} d \mu<\infty$ then $\int g_{n} d \mu \uparrow \int g d \mu$.
1.5.6. If $g_{m} \geq 0$ then $\int \sum_{m=0}^{\infty} g_{m} d \mu=\sum_{m=0}^{\infty} \int g_{m} d \mu$.
1.5.7. Let $f \geq 0$. (i) Show that $\int f \wedge n d \mu \uparrow \int f d \mu$ as $n \rightarrow \infty$. (ii) Use (i) to conclude that if $g$ is integrable and $\epsilon>0$ then we can pick $\delta>0$ so that $\mu(A)<\delta$ implies $\int_{A}|g| d \mu<\epsilon$.
1.5.8. Show that if $f$ is integrable on $[a, b], g(x)=\int_{[a, x]} f(y) d y$ is continuous on $(a, b)$.
1.5.9. Show that if $f$ has $\|f\|_{p}=\left(\int|f|^{p} d \mu\right)^{1 / p}<\infty$, then there are simple functions $\varphi_{n}$ so that $\left\|\varphi_{n}-f\right\|_{p} \rightarrow 0$.
1.5.10. Show that if $\sum_{n} \int\left|f_{n}\right| d \mu<\infty$ then $\sum_{n} \int f_{n} d \mu=\int \sum_{n} f_{n} d \mu$.

### 1.6 Expected Value

We now specialize to integration with respect to a probability measure $P$. If $X \geq 0$ is a random variable on $(\Omega, \mathcal{F}, P)$ then we define its expected value to be $E X=\int X d P$, which always makes sense, but may be $\infty$. To reduce the general case to the nonnegative case, let $x^{+}=\max \{x, 0\}$ be the positive part and let $x^{-}=\max \{-x, 0\}$ be the negative part of $x$. We declare that $E X$ exists and set $E X=E X^{+}-E X^{-}$whenever the subtraction makes sense, i.e., $E X^{+}<\infty$ or $E X^{-}<\infty$.
$E X$ is often called the mean of $X$ and denoted by $\mu . E X$ is defined by integrating $X$, so it has all the properties that integrals do. From Theorems 1.4.5 and 1.4.7 and the trivial observation that $E(b)=b$ for any real number $b$, we get the following:
Theorem 1.6.1. Suppose $X, Y \geq 0$ or $E|X|, E|Y|<\infty$.
(a) $E(X+Y)=E X+E Y$.
(b) $E(a X+b)=a E(X)+b$ for any real numbers $a, b$.
(c) If $X \geq Y$ then $E X \geq E Y$.

In this section, we will restate some properties of the integral derived in the last section in terms of expected value and prove some new ones. To organize things, we will divide the developments into three subsections.

### 1.6.1 Inequalities

For probability measures, Theorem 1.5.1 becomes:
Theorem 1.6.2. Jensen's inequality. Suppose $\varphi$ is convex, that is,

$$
\lambda \varphi(x)+(1-\lambda) \varphi(y) \geq \varphi(\lambda x+(1-\lambda) y)
$$

for all $\lambda \in(0,1)$ and $x, y \in \mathbf{R}$. Then

$$
E(\varphi(X)) \geq \varphi(E X)
$$

provided both expectations exist, i.e., $E|X|$ and $E|\varphi(X)|<\infty$.
To recall the direction in which the inequality goes note that if $P(X= x)=\lambda$ and $P(X=y)=1-\lambda$ then

$$
E \varphi(X)=\lambda \varphi(x)+(1-\lambda) \varphi(y) \geq \varphi(\lambda x+(1-\lambda) y)=\varphi(E X)
$$

Two useful special cases are $|E X| \leq E|X|$ and $(E X)^{2} \leq E\left(X^{2}\right)$.
Theorem 1.6.3. Hölder's inequality. If $p, q \in[1, \infty]$ with $1 / p+1 / q=$ 1 then

$$
E|X Y| \leq\|X\|_{p}\|Y\|_{q}
$$

Here $\|X\|_{r}=\left(E|X|^{r}\right)^{1 / r}$ for $r \in[1, \infty) ;\|X\|_{\infty}=\inf \{M: P(|X|>M)= 0\}$.

To state our next result, we need some notation. If we only integrate over $A \subset \Omega$, we write

$$
E(X ; A)=\int_{A} X d P
$$

Theorem 1.6.4. Chebyshev's inequality. Suppose $\varphi: \mathbf{R} \rightarrow \mathbf{R}$ has $\varphi \geq 0$, let $A \in \mathcal{R}$ and let $i_{A}=\inf \{\varphi(y): y \in A\}$.

$$
i_{A} P(X \in A) \leq E(\varphi(X) ; X \in A) \leq E \varphi(X)
$$

![](https://cdn.mathpix.com/cropped/049c529c-af3b-4bc2-92f7-c2b31e6bd632-038.jpg?height=482&width=779&top_left_y=285&top_left_x=687)
Figure 1.6: Jensen's inequality for $g(x)=x^{2}-3 x+3, P(X=1)=P(X=3)=1 / 2$.

Proof. The definition of $i_{A}$ and the fact that $\varphi \geq 0$ imply that

$$
i_{A} 1_{(X \in A)} \leq \varphi(X) 1_{(X \in A)} \leq \varphi(X)
$$

So taking expected values and using part (c) of Theorem 1.6.1 gives the desired result. $\square$

Remark. Some authors call this result Markov's inequality and use the name Chebyshev's inequality for the special case in which $\varphi(x)=x^{2}$ and $A=\{x:|x| \geq a\}$ :

$$
\begin{equation*}
a^{2} P(|X| \geq a) \leq E X^{2} \tag{1.6.1}
\end{equation*}
$$

### 1.6.2 Integration to the Limit

Our next step is to restate the three classic results from the previous section about what happens when we interchange limits and integrals.

Theorem 1.6.5. Fatou's lemma. If $X_{n} \geq 0$ then

$$
\liminf _{n \rightarrow \infty} E X_{n} \geq E\left(\liminf _{n \rightarrow \infty} X_{n}\right)
$$

Theorem 1.6.6. Monotone convergence theorem. If $0 \leq X_{n} \uparrow X$ then $E X_{n} \uparrow E X$.

Theorem 1.6.7. Dominated convergence theorem. If $X_{n} \rightarrow X$ a.s., $\left|X_{n}\right| \leq Y$ for all $n$, and $E Y<\infty$, then $E X_{n} \rightarrow E X$.

The special case of Theorem 1.6.7 in which $Y$ is constant is called the bounded convergence theorem.

In the developments below, we will need another result on integration to the limit. Perhaps the most important special case of this result occurs when $g(x)=|x|^{p}$ with $p>1$ and $h(x)=x$.

Theorem 1.6.8. Suppose $X_{n} \rightarrow X$ a.s. Let $g, h$ be continuous functions with
(i) $g \geq 0$ and $g(x) \rightarrow \infty$ as $|x| \rightarrow \infty$,
(ii) $|h(x)| / g(x) \rightarrow 0$ as $|x| \rightarrow \infty$,
and (iii) $E g\left(X_{n}\right) \leq K<\infty$ for all $n$.
Then $\operatorname{Eh}\left(X_{n}\right) \rightarrow \operatorname{Eh}(X)$.
Proof. By subtracting a constant from $h$, we can suppose without loss of generality that $h(0)=0$. Pick $M$ large so that $P(|X|=M)=0$ and $g(x)>0$ when $|x| \geq M$. Given a random variable $Y$, let $\bar{Y}=Y 1_{(|Y| \leq M)}$. Since $P(|X|=M)=0, \bar{X}_{n} \rightarrow \bar{X}$ a.s. Since $h\left(\bar{X}_{n}\right)$ is bounded and $h$ is continuous, it follows from the bounded convergence theorem that

$$
\begin{equation*}
\operatorname{Eh}\left(\bar{X}_{n}\right) \rightarrow \operatorname{Eh}(\bar{X}) \tag{a}
\end{equation*}
$$

To control the effect of the truncation, we use the following:

$$
\begin{equation*}
|E h(\bar{Y})-E h(Y)| \leq E|h(\bar{Y})-h(Y)| \leq E(|h(Y)| ;|Y|>M) \leq \epsilon_{M} E g(Y) \tag{b}
\end{equation*}
$$

where $\epsilon_{M}=\sup \{|h(x)| / g(x):|x| \geq M\}$. To check the second inequality, note that when $|Y| \leq M, \bar{Y}=Y$, and we have supposed $h(0)=0$. The third inequality follows from the definition of $\epsilon_{M}$.

Taking $Y=X_{n}$ in (b) and using (iii), it follows that
(c)

$$
\left|E h\left(\bar{X}_{n}\right)-E h\left(X_{n}\right)\right| \leq K \epsilon_{M}
$$

To estimate $|E h(\bar{X})-E h(X)|$, we observe that $g \geq 0$ and $g$ is continuous, so Fatou's lemma implies

$$
E g(X) \leq \liminf _{n \rightarrow \infty} E g\left(X_{n}\right) \leq K
$$

Taking $Y=X$ in (b) gives

$$
\begin{equation*}
|E h(\bar{X})-E h(X)| \leq K \epsilon_{M} \tag{d}
\end{equation*}
$$

The triangle inequality implies

$$
\begin{aligned}
\left|E h\left(X_{n}\right)-E h(X)\right| & \leq\left|E h\left(X_{n}\right)-E h\left(\bar{X}_{n}\right)\right| \\
& +\left|E h\left(\bar{X}_{n}\right)-E h(\bar{X})\right|+|E h(\bar{X})-E h(X)|
\end{aligned}
$$

Taking limits and using (a), (c), (d), we have

$$
\limsup _{n \rightarrow \infty}\left|E h\left(X_{n}\right)-E h(X)\right| \leq 2 K \epsilon_{M}
$$

which proves the desired result since $K<\infty$ and $\epsilon_{M} \rightarrow 0$ as $M \rightarrow \infty$.

### 1.6.3 Computing Expected Values

Integrating over ( $\Omega, \mathcal{F}, P$ ) is nice in theory, but to do computations we have to shift to a space on which we can do calculus. In most cases, we will apply the next result with $S=\mathbf{R}^{d}$.

Theorem 1.6.9. Change of variables formula. Let $X$ be a random element of ( $S, S$ ) with distribution $\mu$, i.e., $\mu(A)=P(X \in A)$. If $f$ is a measurable function from $(S, \mathcal{S})$ to $(\mathbf{R}, \mathcal{R})$ so that $f \geq 0$ or $E|f(X)|< \infty$, then

$$
E f(X)=\int_{S} f(y) \mu(d y)
$$

Remark. To explain the name, write $h$ for $X$ and $P \circ h^{-1}$ for $\mu$ to get

$$
\int_{\Omega} f(h(\omega)) d P=\int_{S} f(y) d\left(P \circ h^{-1}\right)
$$

Proof. We will prove this result by verifying it in four increasingly more general special cases that parallel the way that the integral was defined in Section 1.4. The reader should note the method employed, since it will be used several times below.

Case 1: Indicator functions. If $B \in \mathcal{S}$ and $f=1_{B}$ then recalling the relevant definitions shows

$$
E 1_{B}(X)=P(X \in B)=\mu(B)=\int_{S} 1_{B}(y) \mu(d y)
$$

Case 2: Simple functions. Let $f(x)=\sum_{m=1}^{n} c_{m} 1_{B_{m}}$ where $c_{m} \in \mathbf{R}$, $B_{m} \in \mathcal{S}$. The linearity of expected value, the result of Case 1, and the linearity of integration imply

$$
\begin{aligned}
E f(X) & =\sum_{m=1}^{n} c_{m} E 1_{B_{m}}(X) \\
& =\sum_{m=1}^{n} c_{m} \int_{S} 1_{B_{m}}(y) \mu(d y)=\int_{S} f(y) \mu(d y)
\end{aligned}
$$

Case 3: Nonegative functions. Now if $f \geq 0$ and we let

$$
f_{n}(x)=\left(\left[2^{n} f(x)\right] / 2^{n}\right) \wedge n
$$

where $[x]=$ the largest integer $\leq x$ and $a \wedge b=\min \{a, b\}$, then the $f_{n}$ are simple and $f_{n} \uparrow f$, so using the result for simple functions and the monotone convergence theorem:

$$
E f(X)=\lim _{n} E f_{n}(X)=\lim _{n} \int_{S} f_{n}(y) \mu(d y)=\int_{S} f(y) \mu(d y)
$$

Case 4: Integrable functions. The general case now follows by writing $f(x)=f(x)^{+}-f(x)^{-}$. The condition $E|f(X)|<\infty$ guarantees that $E f(X)^{+}$and $E f(X)^{-}$are finite. So using the result for nonnegative functions and linearity of expected value and integration:

$$
\begin{aligned}
E f(X)=E f(X)^{+}-E f(X)^{-} & =\int_{S} f(y)^{+} \mu(d y)-\int_{S} f(y)^{-} \mu(d y) \\
& =\int_{S} f(y) \mu(d y)
\end{aligned}
$$

which completes the proof.
A consequence of Theorem 1.6.9 is that we can compute expected values of functions of random variables by performing integrals on the real line. Before we can treat some examples, we need to introduce the terminology for what we are about to compute. If $k$ is a positive integer then $E X^{k}$ is called the $\mathbf{k t h}$ moment of $X$. The first moment $E X$ is usually called the mean and denoted by $\mu$. If $E X^{2}<\infty$ then the variance of $X$ is defined to be $\operatorname{var}(X)=E(X-\mu)^{2}$. To compute the variance the following formula is useful:

$$
\begin{align*}
\operatorname{var}(X) & =E(X-\mu)^{2} \\
& =E X^{2}-2 \mu E X+\mu^{2}=E X^{2}-\mu^{2} \tag{1.6.2}
\end{align*}
$$

From this it is immediate that

$$
\begin{equation*}
\operatorname{var}(X) \leq E X^{2} \tag{1.6.3}
\end{equation*}
$$

Here $E X^{2}$ is the expected value of $X^{2}$. When we want the square of $E X$, we will write $(E X)^{2}$. Since $E(a X+b)=a E X+b$ by (b) of Theorem 1.6.1, it follows easily from the definition that

$$
\begin{align*}
\operatorname{var}(a X+b) & =E(a X+b-E(a X+b))^{2} \\
& =a^{2} E(X-E X)^{2}=a^{2} \operatorname{var}(X) \tag{1.6.4}
\end{align*}
$$

We turn now to concrete examples and leave the calculus in the first two examples to the reader. (Integrate by parts.)

Example 1.6.10. If $X$ has an exponential distribution with rate 1 then

$$
E X^{k}=\int_{0}^{\infty} x^{k} e^{-x} d x=k!
$$

So the mean of $X$ is 1 and variance is $E X^{2}-(E X)^{2}=2-1^{2}=1$. If we let $Y=X / \lambda$, then by Exercise 1.2.5, $Y$ has density $\lambda e^{-\lambda y}$ for $y \geq 0$, the exponential density with parameter $\lambda$. From (b) of Theorem 1.6.1 and (1.6.4), it follows that $Y$ has mean $1 / \lambda$ and variance $1 / \lambda^{2}$.

Example 1.6.11. If $X$ has a standard normal distribution,

$$
\begin{aligned}
& E X=\int x(2 \pi)^{-1 / 2} \exp \left(-x^{2} / 2\right) d x=0 \quad \text { (by symmetry) } \\
& \operatorname{var}(X)=E X^{2}=\int x^{2}(2 \pi)^{-1 / 2} \exp \left(-x^{2} / 2\right) d x=1
\end{aligned}
$$

If we let $\sigma>0, \mu \in \mathbf{R}$, and $Y=\sigma X+\mu$, then (b) of Theorem 1.6.1 and (1.6.4), imply $E Y=\mu$ and $\operatorname{var}(Y)=\sigma^{2}$. By Exercise 1.2.5, $Y$ has density

$$
\left(2 \pi \sigma^{2}\right)^{-1 / 2} \exp \left(-(y-\mu)^{2} / 2 \sigma^{2}\right)
$$

the normal distribution with mean $\mu$ and variance $\sigma^{2}$.
We will next consider some discrete distributions. The first is very simple, but will be useful several times below, so we record it here.

Example 1.6.12. We say that $X$ has a Bernoulli distribution with parameter $p$ if $P(X=1)=p$ and $P(X=0)=1-p$. Clearly,

$$
E X=p \cdot 1+(1-p) \cdot 0=p
$$

Since $X^{2}=X$, we have $E X^{2}=E X=p$ and

$$
\operatorname{var}(X)=E X^{2}-(E X)^{2}=p-p^{2}=p(1-p)
$$

Example 1.6.13. We say that $X$ has a Poisson distribution with parameter $\lambda$ if

$$
P(X=k)=e^{-\lambda} \lambda^{k} / k!\text { for } k=0,1,2, \ldots
$$

To evaluate the moments of the Poisson random variable, we use a little inspiration to observe that for $k \geq 1$

$$
\begin{aligned}
E(X(X-1) \cdots(X-k+1)) & =\sum_{j=k}^{\infty} j(j-1) \cdots(j-k+1) e^{-\lambda} \frac{\lambda^{j}}{j!} \\
& =\lambda^{k} \sum_{j=k}^{\infty} e^{-\lambda} \frac{\lambda^{j-k}}{(j-k)!}=\lambda^{k}
\end{aligned}
$$

where the equalities follow from (i) the facts that $j(j-1) \cdots(j-k+1)=0$ when $j<k$, (ii) cancelling part of the factorial, and (iii) the fact that Poisson distribution has total mass 1. Using the last formula, it follows that $E X=\lambda$ while

$$
\operatorname{var}(X)=E X^{2}-(E X)^{2}=E(X(X-1))+E X-\lambda^{2}=\lambda
$$

Example 1.6.14. $N$ is said to have a geometric distribution with success probability $p \in(0,1)$ if

$$
P(N=k)=p(1-p)^{k-1} \quad \text { for } k=1,2, \ldots
$$

$N$ is the number of independent trials needed to observe an event with probability $p$. Differentiating the identity

$$
\sum_{k=0}^{\infty}(1-p)^{k}=1 / p
$$

and referring to Example A.5.6 for the justification gives

$$
\begin{aligned}
- & \sum_{k=1}^{\infty} k(1-p)^{k-1}=-1 / p^{2} \\
& \sum_{k=2}^{\infty} k(k-1)(1-p)^{k-2}=2 / p^{3}
\end{aligned}
$$

From this it follows that

$$
\begin{aligned}
E N & =\sum_{k=1}^{\infty} k p(1-p)^{k-1}=1 / p \\
E N(N-1) & =\sum_{k=1}^{\infty} k(k-1) p(1-p)^{k-1}=2(1-p) / p^{2} \\
\operatorname{var}(N) & =E N^{2}-(E N)^{2}=E N(N-1)+E N-(E N)^{2} \\
& =\frac{2(1-p)}{p^{2}}+\frac{p}{p^{2}}-\frac{1}{p^{2}}=\frac{1-p}{p^{2}}
\end{aligned}
$$

## Exercises

1.6.1. Suppose $\varphi$ is strictly convex, i.e., $>$ holds for $\lambda \in(0,1)$. Show that, under the assumptions of Theorem 1.6.2, $\varphi(E X)=E \varphi(X)$ implies $X=E X$ a.s.
1.6.2. Suppose $\varphi: \mathbf{R}^{n} \rightarrow \mathbf{R}$ is convex. Imitate the proof of Theorem 1.5.1 to show

$$
E \varphi\left(X_{1}, \ldots, X_{n}\right) \geq \varphi\left(E X_{1}, \ldots, E X_{n}\right)
$$

provided $E\left|\varphi\left(X_{1}, \ldots, X_{n}\right)\right|<\infty$ and $E\left|X_{i}\right|<\infty$ for all $i$.
1.6.3. Chebyshev's inequality is and is not sharp. (i) Show that Theorem 1.6.4 is sharp by showing that if $0<b \leq a$ are fixed there is an $X$ with $E X^{2}=b^{2}$ for which $P(|X| \geq a)=b^{2} / a^{2}$. (ii) Show that Theorem 1.6.4 is not sharp by showing that if $X$ has $0<E X^{2}<\infty$ then

$$
\lim _{a \rightarrow \infty} a^{2} P(|X| \geq a) / E X^{2}=0
$$

1.6.4. One-sided Chebyshev bound. (i) Let $a>b>0,0<p<1$, and let $X$ have $P(X=a)=p$ and $P(X=-b)=1-p$. Apply Theorem 1.6.4 to $\varphi(x)=(x+b)^{2}$ and conclude that if $Y$ is any random variable with $E Y=E X$ and $\operatorname{var}(Y)=\operatorname{var}(X)$, then $P(Y \geq a) \leq p$ and equality holds when $Y=X$.
(ii) Suppose $E Y=0$, $\operatorname{var}(Y)=\sigma^{2}$, and $a>0$. Show that $P(Y \geq a) \leq \sigma^{2} /\left(a^{2}+\sigma^{2}\right)$, and there is a $Y$ for which equality holds.

### 1.6.5. Two nonexistent lower bounds.

Show that: (i) if $\epsilon>0, \inf \{P(|X|>\epsilon): E X=0, \operatorname{var}(X)=1\}=0$.
(ii) if $y \geq 1, \sigma^{2} \in(0, \infty), \inf \left\{P(|X|>y): E X=1, \operatorname{var}(X)=\sigma^{2}\right\}=0$.
1.6.6. A useful lower bound. Let $Y \geq 0$ with $E Y^{2}<\infty$. Apply the Cauchy-Schwarz inequality to $Y 1_{(Y>0)}$ and conclude

$$
P(Y>0) \geq(E Y)^{2} / E Y^{2}
$$

1.6.7. Let $\Omega=(0,1)$ equipped with the Borel sets and Lebesgue measure. Let $\alpha \in(1,2)$ and $X_{n}=n^{\alpha} 1_{(1 /(n+1), 1 / n)} \rightarrow 0$ a.s. Show that Theorem 1.6.8 can be applied with $h(x)=x$ and $g(x)=|x|^{2 / \alpha}$, but the $X_{n}$ are not dominated by an integrable function.
1.6.8. Suppose that the probability measure $\mu$ has $\mu(A)=\int_{A} f(x) d x$ for all $A \in \mathcal{R}$. Use the proof technique of Theorem 1.6.9 to show that for any $g$ with $g \geq 0$ or $\int|g(x)| \mu(d x)<\infty$ we have

$$
\int g(x) \mu(d x)=\int g(x) f(x) d x
$$

1.6.9. Inclusion-exclusion formula. Let $A_{1}, A_{2}, \ldots A_{n}$ be events and $A=\cup_{i=1}^{n} A_{i}$. Prove that $1_{A}=1-\prod_{i=1}^{n}\left(1-1_{A_{i}}\right)$. Expand out the right hand side, then take expected value to conclude

$$
\begin{aligned}
P\left(\cup_{i=1}^{n} A_{i}\right)= & \sum_{i=1}^{n} P\left(A_{i}\right)-\sum_{i<j} P\left(A_{i} \cap A_{j}\right) \\
& +\sum_{i<j<k} P\left(A_{i} \cap A_{j} \cap A_{k}\right)-\ldots+(-1)^{n-1} P\left(\cap_{i=1}^{n} A_{i}\right)
\end{aligned}
$$

1.6.10. Bonferroni inequalities. Let $A_{1}, A_{2}, \ldots A_{n}$ be events and $A= \cup_{i=1}^{n} A_{i}$. Show that $1_{A} \leq \sum_{i=1}^{n} 1_{A_{i}}$, etc. and then take expected values to
conclude

$$
\begin{aligned}
P\left(\cup_{i=1}^{n} A_{i}\right) & \leq \sum_{i=1}^{n} P\left(A_{i}\right) \\
P\left(\cup_{i=1}^{n} A_{i}\right) & \geq \sum_{i=1}^{n} P\left(A_{i}\right)-\sum_{i<j} P\left(A_{i} \cap A_{j}\right) \\
P\left(\cup_{i=1}^{n} A_{i}\right) & \leq \sum_{i=1}^{n} P\left(A_{i}\right)-\sum_{i<j} P\left(A_{i} \cap A_{j}\right)+\sum_{i<j<k} P\left(A_{i} \cap A_{j} \cap A_{k}\right)
\end{aligned}
$$

In general, if we stop the inclusion exclusion formula after an even (odd) number of sums, we get an lower (upper) bound.
1.6.11. If $E|X|^{k}<\infty$ then for $0<j<k, E|X|^{j}<\infty$, and furthermore

$$
E|X|^{j} \leq\left(E|X|^{k}\right)^{j / k}
$$

1.6.12. Apply Jensen's inequality with $\varphi(x)=e^{x}$ and $P\left(X=\log y_{m}\right)= p(m)$ to conclude that if $\sum_{m=1}^{n} p(m)=1$ and $p(m), y_{m}>0$ then

$$
\sum_{m=1}^{n} p(m) y_{m} \geq \prod_{m=1}^{n} y_{m}^{p(m)}
$$

When $p(m)=1 / n$, this says the arithmetic mean exceeds the geometric mean.
1.6.13. If $E X_{1}^{-}<\infty$ and $X_{n} \uparrow X$ then $E X_{n} \uparrow E X$.
1.6.14. Let $X \geq 0$ but do NOT assume $E(1 / X)<\infty$. Show

$$
\lim _{y \rightarrow \infty} y E(1 / X ; X>y)=0, \quad \lim _{y \downarrow 0} y E(1 / X ; X>y)=0 .
$$

1.6.15. If $X_{n} \geq 0$ then $E\left(\sum_{n=0}^{\infty} X_{n}\right)=\sum_{n=0}^{\infty} E X_{n}$.
1.6.16. If $X$ is integrable and $A_{n}$ are disjoint sets with union $A$ then

$$
\sum_{n=0}^{\infty} E\left(X ; A_{n}\right)=E(X ; A)
$$

i.e., the sum converges absolutely and has the value on the right.

### 1.7 Product Measures, Fubini's Theorem

Let $\left(X, \mathcal{A}, \mu_{1}\right)$ and $\left(Y, \mathcal{B}, \mu_{2}\right)$ be two $\sigma$-finite measure spaces. Let

$$
\begin{aligned}
& \Omega=X \times Y=\{(x, y): x \in X, y \in Y\} \\
& \mathcal{S}=\{A \times B: A \in \mathcal{A}, B \in \mathcal{B}\}
\end{aligned}
$$

Sets in $\mathcal{S}$ are called rectangles. It is easy to see that $\mathcal{S}$ is a semi-algebra:

$$
\begin{aligned}
& (A \times B) \cap(C \times D)=(A \cap C) \times(B \cap D) \\
& (A \times B)^{c}=\left(A^{c} \times B\right) \cup\left(A \times B^{c}\right) \cup\left(A^{c} \times B^{c}\right)
\end{aligned}
$$

Let $\mathcal{F}=\mathcal{A} \times \mathcal{B}$ be the $\sigma$-algebra generated by $\mathcal{S}$.
Theorem 1.7.1. There is a unique measure $\mu$ on $\mathcal{F}$ with

$$
\mu(A \times B)=\mu_{1}(A) \mu_{2}(B)
$$

Notation. $\mu$ is often denoted by $\mu_{1} \times \mu_{2}$.
Proof. By Theorem 1.1.9 it is enough to show that if $A \times B=+_{i}\left(A_{i} \times B_{i}\right)$ is a finite or countable disjoint union then

$$
\mu(A \times B)=\sum_{i} \mu\left(A_{i} \times B_{i}\right)
$$

For each $x \in A$, let $I(x)=\left\{i: x \in A_{i}\right\} . B=+_{i \in I(x)} B_{i}$, so

$$
1_{A}(x) \mu_{2}(B)=\sum_{i} 1_{A_{i}}(x) \mu_{2}\left(B_{i}\right)
$$

Integrating with respect to $\mu_{1}$ and using Exercise 1.5.6 gives

$$
\mu_{1}(A) \mu_{2}(B)=\sum_{i} \mu_{1}\left(A_{i}\right) \mu_{2}\left(B_{i}\right)
$$

which proves the result.
Using Theorem 1.7.1 and induction, it follows that if $\left(\Omega_{i}, \mathcal{F}_{i}, \mu_{i}\right), i= 1, \ldots, n$, are $\sigma$-finite measure spaces and $\Omega=\Omega_{1} \times \cdots \times \Omega_{n}$, there is a unique measure $\mu$ on the $\sigma$-algebra $\mathcal{F}$ generated by sets of the form $A_{1} \times \cdots \times A_{n}, A_{i} \in \mathcal{F}_{i}$, that has

$$
\mu\left(A_{1} \times \cdots \times A_{n}\right)=\prod_{m=1}^{n} \mu_{m}\left(A_{m}\right)
$$

When $\left(\Omega_{i}, \mathcal{F}_{i}, \mu_{i}\right)=(\mathbf{R}, \mathcal{R}, \lambda)$ for all $i$, the result is Lebesgue measure on the Borel subsets of $n$ dimensional Euclidean space $\mathbf{R}^{n}$.

Returning to the case in which $(\Omega, \mathcal{F}, \mu)$ is the product of two measure spaces, $(X, \mathcal{A}, \mu)$ and $(Y, \mathcal{B}, \nu)$, our next goal is to prove:

Theorem 1.7.2. Fubini's theorem. If $f \geq 0$ or $\int|f| d \mu<\infty$ then

$$
\begin{equation*}
\int_{X} \int_{Y} f(x, y) \mu_{2}(d y) \mu_{1}(d x)=\int_{X \times Y} f d \mu=\int_{Y} \int_{X} f(x, y) \mu_{1}(d x) \mu_{2}(d y) \tag{*}
\end{equation*}
$$

Proof. We will prove only the first equality, since the second follows by symmetry. Two technical things that need to be proved before we can assert that the first integral makes sense are:

When $x$ is fixed, $y \rightarrow f(x, y)$ is $\mathcal{B}$ measurable.
$x \rightarrow \int_{Y} f(x, y) \mu_{2}(d y)$ is $\mathcal{A}$ measurable.
We begin with the case $f=1_{E}$. Let $E_{x}=\{y:(x, y) \in E\}$ be the cross-section at $x$.

Lemma 1.7.3. If $E \in \mathcal{F}$ then $E_{x} \in \mathcal{B}$.
Proof. $\left(E^{c}\right)_{x}=\left(E_{x}\right)^{c}$ and $\left(\cup_{i} E_{i}\right)_{x}=\cup_{i}\left(E_{i}\right)_{x}$, so if $\mathcal{E}$ is the collection of sets $E$ for which $E_{x} \in \mathcal{B}$, then $\mathcal{E}$ is a $\sigma$-algebra. Since $\mathcal{E}$ contains the rectangles, the result follows.

Lemma 1.7.4. If $E \in \mathcal{F}$ then $g(x) \equiv \mu_{2}\left(E_{x}\right)$ is $\mathcal{A}$ measurable and

$$
\int_{X} g d \mu_{1}=\mu(E)
$$

Notice that it is not obvious that the collection of sets for which the conclusion is true is a $\sigma$-algebra since $\mu\left(E_{1} \cup E_{2}\right)=\mu\left(E_{1}\right)+\mu\left(E_{2}\right)-\mu\left(E_{1} \cap\right. E_{2}$ ). Dynkin's $\pi-\lambda$ Theorem (A.1.4) was tailor-made for situations like this.

Proof. If conclusions hold for $E_{n}$ and $E_{n} \uparrow E$, then Theorem 1.3.7 and the monotone convergence theorem imply that they hold for $E$. Since $\mu_{1}$ and $\mu_{2}$ are $\sigma$-finite, it is enough then to prove the result for $E \subset F \times G$ with $\mu_{1}(F)<\infty$ and $\mu_{2}(G)<\infty$, or taking $\Omega=F \times G$ we can suppose without loss of generality that $\mu(\Omega)<\infty$. Let $\mathcal{L}$ be the collection of sets $E$ for which the conclusions hold. We will now check that $\mathcal{L}$ is a $\lambda$-system. Property (i) of a $\lambda$-system is trivial. (iii) follows from the first sentence in the proof. To check (ii) we observe that

$$
\mu_{2}\left((A-B)_{x}\right)=\mu_{2}\left(A_{x}-B_{x}\right)=\mu_{2}\left(A_{x}\right)-\mu_{2}\left(B_{x}\right)
$$

and integrating over $x$ gives the second conclusion. Since $\mathcal{L}$ contains the rectangles, a $\pi$-system that generates $\mathcal{F}$, the desired result follows from the $\pi-\lambda$ theorem.

We are now ready to prove Theorem 1.7.2 by verifying it in four increasingly more general special cases.

Case 1. If $E \in \mathcal{F}$ and $f=1_{E}$ then ( $*$ ) follows from Lemma 1.7.4
Case 2. Since each integral is linear in $f$, it follows that (*) holds for simple functions.

Case 3. Now if $f \geq 0$ and we let $f_{n}(x)=\left(\left[2^{n} f(x)\right] / 2^{n}\right) \wedge n$, where $[x]=$ the largest integer $\leq x$, then the $f_{n}$ are simple and $f_{n} \uparrow f$, so it follows from the monotone convergence theorem that ( $*$ ) holds for all $f \geq 0$.
Case 4. The general case now follows by writing $f(x)=f(x)^{+}-f(x)^{-}$ and applying Case 3 to $f^{+}, f^{-}$, and $|f|$.

To illustrate why the various hypotheses of Theorem 1.7.2 are needed, we will now give some examples where the conclusion fails.

Example 1.7.5. Let $X=Y=\{1,2, \ldots\}$ with $\mathcal{A}=\mathcal{B}=$ all subsets and $\mu_{1}=\mu_{2}=$ counting measure. For $m \geq 1$, let $f(m, m)=1$ and $f(m+1, m)=-1$, and let $f(m, n)=0$ otherwise. We claim that

$$
\sum_{m} \sum_{n} f(m, n)=1 \quad \text { but } \quad \sum_{n} \sum_{m} f(m, n)=0
$$

A picture is worth several dozen words:

$$
\begin{array}{cccccc} 
& \vdots & \vdots & \vdots & \vdots & \\
& 0 & 0 & 0 & 1 & \ldots \\
\uparrow & 0 & 0 & 1 & -1 & \ldots \\
n & 0 & 1 & -1 & 0 & \ldots \\
& 1 & -1 & 0 & 0 & \ldots \\
& & m & \rightarrow &
\end{array}
$$

In words, if we sum the columns first, the first one gives us a 1 and the others 0 , while if we sum the rows each one gives us a 0 .

Example 1.7.6. Let $X=(0,1), Y=(1, \infty)$, both equipped with the Borel sets and Lebesgue measure. Let $f(x, y)=e^{-x y}-2 e^{-2 x y}$.

$$
\begin{aligned}
& \int_{0}^{1} \int_{1}^{\infty} f(x, y) d y d x=\int_{0}^{1} x^{-1}\left(e^{-x}-e^{-2 x}\right) d x>0 \\
& \int_{1}^{\infty} \int_{0}^{1} f(x, y) d x d y=\int_{1}^{\infty} y^{-1}\left(e^{-2 y}-e^{-y}\right) d y<0
\end{aligned}
$$

The next example indicates why $\mu_{1}$ and $\mu_{2}$ must be $\sigma$-finite.
Example 1.7.7. Let $X=(0,1)$ with $\mathcal{A}=$ the Borel sets and $\mu_{1}=$ Lebesgue measure. Let $Y=(0,1)$ with $\mathcal{B}=$ all subsets and $\mu_{2}=$ counting measure. Let $f(x, y)=1$ if $x=y$ and 0 otherwise

$$
\begin{array}{lll}
\int_{Y} f(x, y) \mu_{2}(d y)=1 & \text { for all } x \text { so } & \int_{X} \int_{Y} f(x, y) \mu_{2}(d y) \mu_{1}(d x)=1 \\
\int_{X} f(x, y) \mu_{1}(d x)=0 & \text { for all } y \text { so } & \int_{Y} \int_{X} f(x, y) \mu_{1}(d y) \mu_{2}(d x)=0
\end{array}
$$

Our last example shows that measurability is important or maybe that some of the axioms of set theory are not as innocent as they seem.

Example 1.7.8. By the axiom of choice and the continuum hypothesis one can define an order relation $<^{\prime}$ on $(0,1)$ so that $\left\{x: x<^{\prime} y\right\}$ is countable for each $y$. Let $X=Y=(0,1)$, let $\mathcal{A}=\mathcal{B}=$ the Borel sets and $\mu_{1}=\mu_{2}=$ Lebesgue measure. Let $f(x, y)=1$ if $x<^{\prime} y,=0$ otherwise. Since $\left\{x: x<^{\prime} y\right\}$ and $\left\{y: x<^{\prime} y\right\}^{c}$ are countable,

$$
\begin{array}{ll}
\int_{X} f(x, y) \mu_{1}(d x)=0 & \text { for all } y \\
\int_{Y} f(x, y) \mu_{2}(d y)=1 & \text { for all } x
\end{array}
$$

## Exercises

1.7.1. If $\int_{X} \int_{Y}|f(x, y)| \mu_{2}(d y) \mu_{1}(d x)<\infty$ then

$$
\int_{X} \int_{Y} f(x, y) \mu_{2}(d y) \mu_{1}(d x)=\int_{X \times Y} f d\left(\mu_{1} \times \mu_{2}\right)=\int_{Y} \int_{X} f(x, y) \mu_{1}(d x) \mu_{2}(d y)
$$

Corollary. Let $X=\{1,2, \ldots\}, \mathcal{A}=$ all subsets of $X$, and $\mu_{1}=$ counting measure. If $\sum_{n} \int\left|f_{n}\right| d \mu<\infty$ then $\sum_{n} \int f_{n} d \mu=\int \sum_{n} f_{n} d \mu$.
1.7.2. Let $g \geq 0$ be a measurable function on $(X, \mathcal{A}, \mu)$. Use Theorem 1.7.2 to conclude that

$$
\int_{X} g d \mu=(\mu \times \lambda)(\{(x, y): 0 \leq y<g(x)\})=\int_{0}^{\infty} \mu(\{x: g(x)>y\}) d y
$$

1.7.3. Let $F, G$ be Stieltjes measure functions and let $\mu, \nu$ be the corresponding measures on ( $\mathbf{R}, \mathcal{R}$ ). Show that
(i) $\int_{(a, b]}\{F(y)-F(a)\} d G(y)=(\mu \times \nu)(\{(x, y): a<x \leq y \leq b\})$
(ii) $\int_{(a, b]} F(y) d G(y)+\int_{(a, b]} G(y) d F(y)$

$$
=F(b) G(b)-F(a) G(a)+\sum_{x \in(a, b]} \mu(\{x\}) \nu(\{x\})
$$

(iii) If $F=G$ is continuous then $\int_{(a, b]} 2 F(y) d F(y)=F^{2}(b)-F^{2}(a)$.

To see the second term in (ii) is needed, let $F(x)=G(x)=1_{[0, \infty)}(x)$ and $a<0<b$.
1.7.4. Let $\mu$ be a finite measure on $\mathbf{R}$ and $F(x)=\mu((-\infty, x])$. Show that

$$
\int(F(x+c)-F(x)) d x=c \mu(\mathbf{R})
$$

1.7.5. Show that $e^{-x y} \sin x$ is integrable in the strip $0<x<a, 0<y$. Perform the double integral in the two orders to get:

$$
\int_{0}^{a} \frac{\sin x}{x} d x=\arctan (a)-(\cos a) \int_{0}^{\infty} \frac{e^{-a y}}{1+y^{2}} d y-(\sin a) \int_{0}^{\infty} \frac{y e^{-a y}}{1+y^{2}} d y
$$

and replace $1+y^{2}$ by 1 to conclude $\left|\int_{0}^{a}(\sin x) / x d x-\arctan (a)\right| \leq 2 / a$ for $a \geq 1$.

## Chapter 2

## Laws of Large Numbers

### 2.1 Independence

Measure theory ends and probability begins with the definition of independence. We begin with what is hopefully a familiar definition and then work our way up to a definition that is appropriate for our current setting.

Two events $A$ and $B$ are independent if $P(A \cap B)=P(A) P(B)$.
Two random variables $X$ and $Y$ are independent if for all $C, D \in \mathcal{R}$,

$$
P(X \in C, Y \in D)=P(X \in C) P(Y \in D)
$$

i.e., the events $A=\{X \in C\}$ and $B=\{Y \in D\}$ are independent.
Two $\sigma$-fields $\mathcal{F}$ and $\mathcal{G}$ are independent if for all $A \in \mathcal{F}$ and $B \in \mathcal{G}$ the events $A$ and $B$ are independent.

As the next result shows, the second definition is a special case of the third.

Theorem 2.1.1. (i) If $X$ and $Y$ are independent then $\sigma(X)$ and $\sigma(Y)$ are. (ii) Conversely, if $\mathcal{F}$ and $\mathcal{G}$ are independent, $X \in \mathcal{F}$, and $Y \in \mathcal{G}$, then $X$ and $Y$ are independent.

Proof. (i) If $A \in \sigma(X)$ then it follows from the definition of $\sigma(X)$ that $A=\{X \in C\}$ for some $C \in \mathcal{R}$. Likewise if $B \in \sigma(Y)$ then $B=\{Y \in D\}$ for some $D \in \mathcal{R}$, so using these facts and the independence of $X$ and $Y$,

$$
P(A \cap B)=P(X \in C, Y \in D)=P(X \in C) P(Y \in D)=P(A) P(B)
$$

(ii) Conversely if $X \in \mathcal{F}, Y \in \mathcal{G}$ and $C, D \in \mathcal{R}$ it follows from the definition of measurability that $\{X \in C\} \in \mathcal{F},\{Y \in D\} \in \mathcal{G}$. Since $\mathcal{F}$ and $\mathcal{G}$ are independent, it follows that $P(X \in C, Y \in D)=P(X \in$ C) $P(Y \in D)$.

The first definition is, in turn, a special case of the second.
Theorem 2.1.2. (i) If $A$ and $B$ are independent then so are $A^{c}$ and $B, A$ and $B^{c}$, and $A^{c}$ and $B^{c}$. (ii) Conversely events $A$ and $B$ are independent if and only if their indicator random variables $1_{A}$ and $1_{B}$ are independent.

Proof. (i) Subtracting $P(A \cap B)=P(A) P(B)$ from $P(B)=P(B)$ shows $P\left(A^{c} \cap B\right)=P\left(A^{c}\right) P(B)$. The second and third conclusions follow by applying the first one to the pairs of independent events $(B, A)$ and $\left(A, B^{c}\right)$.
(ii) If $C, D \in \mathcal{R}$ then $\left\{1_{A} \in C\right\} \in\left\{\emptyset, A, A^{c}, \Omega\right\}$ and $\left\{1_{B} \in D\right\} \in \left\{\emptyset, B, B^{c}, \Omega\right\}$, so there are 16 things to check. When either set involved is $\emptyset$ or $\Omega$ the equality holds, so there are only four cases to worry about and they are all covered by (i).

In view of the fact that the first definition is a special case of the second, which is a special case of the third, we take things in the opposite order when we say what it means for several things to be independent. We begin by reducing to the case of finitely many objects. An infinite collection of objects ( $\sigma$-fields, random variables, or sets) is said to be independent if every finite subcollection is.
$\sigma$-fields $\mathcal{F}_{1}, \mathcal{F}_{2}, \ldots, \mathcal{F}_{n}$ are independent if whenever $A_{i} \in \mathcal{F}_{i}$ for $i= 1, \ldots, n$, we have

$$
P\left(\cap_{i=1}^{n} A_{i}\right)=\prod_{i=1}^{n} P\left(A_{i}\right)
$$

Random variables $X_{1}, \ldots, X_{n}$ are independent if whenever $B_{i} \in \mathcal{R}$ for $i=1, \ldots, n$ we have

$$
P\left(\cap_{i=1}^{n}\left\{X_{i} \in B_{i}\right\}\right)=\prod_{i=1}^{n} P\left(X_{i} \in B_{i}\right)
$$

Sets $A_{1}, \ldots, A_{n}$ are independent if whenever $I \subset\{1, \ldots n\}$ we have

$$
P\left(\cap_{i \in I} A_{i}\right)=\prod_{i \in I} P\left(A_{i}\right)
$$

At first glance, it might seem that the last definition does not match the other two. However, if you think about it for a minute, you will see that if the indicator variables $1_{A_{i}}, 1 \leq i \leq n$ are independent and we take $B_{i}=\{1\}$ for $i \in I$, and $B_{i}=\mathbf{R}$ for $i \notin I$ then the condition in the definition results. Conversely,

Theorem 2.1.3. Let $A_{1}, A_{2}, \ldots, A_{n}$ be independent. (i) $A_{1}^{c}, A_{2}, \ldots, A_{n}$ are independent; (ii) $1_{A_{1}}, \ldots, 1_{A_{n}}$ are independent.

Proof. (i) Let $B_{1}=A_{1}^{c}$ and $B_{i}=A_{i}$ for $i>1$. If $I \subset\{1, \ldots, n\}$ does not contain 1 it is clear that $P\left(\cap_{i \in I} B_{i}\right)=\prod_{i \in I} P\left(B_{i}\right)$. Suppose now that
$1 \in I$ and let $J=I-\{1\}$. Subtracting $P\left(\cap_{i \in I} A_{i}\right)=\prod_{i \in I} P\left(A_{i}\right)$ from $P\left(\cap_{i \in J} A_{i}\right)=\prod_{i \in J} P\left(A_{i}\right)$ gives $P\left(A_{1}^{c} \cap \cap_{i \in J} A_{i}\right)=P\left(A_{1}^{c}\right) \prod_{i \in J} P\left(A_{i}\right)$.
(ii) Iterating (i) we see that if $B_{i} \in\left\{A_{i}, A_{i}^{c}\right\}$ then $B_{1}, \ldots, B_{n}$ are independent. Thus if $C_{i} \in\left\{A_{i}, A_{i}^{c}, \Omega\right\} P\left(\cap_{i=1}^{n} C_{i}\right)=\prod_{i=1}^{n} P\left(C_{i}\right)$. The last equality holds trivially if some $C_{i}=\emptyset$, so noting $1_{A_{i}} \in\left\{\emptyset, A_{i}, A_{i}^{c}, \Omega\right\}$ the desired result follows.

One of the first things to understand about the definition of independent events is that it is not enough to assume $P\left(A_{i} \cap A_{j}\right)=P\left(A_{i}\right) P\left(A_{j}\right)$ for all $i \neq j$. A sequence of events $A_{1}, \ldots, A_{n}$ with the last property is called pairwise independent. It is clear that independent events are pairwise independent. The next example shows that the converse is not true.

Example 2.1.4. Let $X_{1}, X_{2}, X_{3}$ be independent random variables with

$$
P\left(X_{i}=0\right)=P\left(X_{i}=1\right)=1 / 2
$$

Let $A_{1}=\left\{X_{2}=X_{3}\right\}, A_{2}=\left\{X_{3}=X_{1}\right\}$ and $A_{3}=\left\{X_{1}=X_{2}\right\}$. These events are pairwise independent since if $i \neq j$ then

$$
P\left(A_{i} \cap A_{j}\right)=P\left(X_{1}=X_{2}=X_{3}\right)=1 / 4=P\left(A_{i}\right) P\left(A_{j}\right)
$$

but they are not independent since

$$
P\left(A_{1} \cap A_{2} \cap A_{3}\right)=1 / 4 \neq 1 / 8=P\left(A_{1}\right) P\left(A_{2}\right) P\left(A_{3}\right)
$$

In order to show that random variables $X$ and $Y$ are independent, we have to check that $P(X \in A, Y \in B)=P(X \in A) P(Y \in B)$ for all Borel sets $A$ and $B$. Since there are a lot of Borel sets, our next topic is

### 2.1.1 Sufficient Conditions for Independence

Our main result is Theorem 2.1.7. To state that result, we need a definition that generalizes all our earlier definitions.
Collections of sets $\mathcal{A}_{1}, \mathcal{A}_{2}, \ldots, \mathcal{A}_{n} \subset \mathcal{F}$ are said to be independent if whenever $A_{i} \in \mathcal{A}_{i}$ and $I \subset\{1, \ldots, n\}$ we have $P\left(\cap_{i \in I} A_{i}\right)=\prod_{i \in I} P\left(A_{i}\right)$ If each collection is a single set i.e., $\mathcal{A}_{i}=\left\{A_{i}\right\}$, this definition reduces to the one for sets.

Lemma 2.1.5. Without loss of generality we can suppose each $\mathcal{A}_{i}$ contains $\Omega$. In this case the condition is equivalent to

$$
P\left(\cap_{i=1}^{n} A_{i}\right)=\prod_{i=1}^{n} P\left(A_{i}\right) \quad \text { whenever } A_{i} \in \mathcal{A}_{i}
$$

since we can set $A_{i}=\Omega$ for $i \notin I$.

Proof. If $\mathcal{A}_{1}, \mathcal{A}_{2}, \ldots, \mathcal{A}_{n}$ are independent and $\overline{\mathcal{A}}_{i}=\mathcal{A}_{i} \cup\{\Omega\}$ then $\overline{\mathcal{A}}_{1}, \overline{\mathcal{A}}_{2}, \ldots, \overline{\mathcal{A}}_{n}$ are independent, since if $A_{i} \in \overline{\mathcal{A}}_{i}$ and $I=\left\{j: A_{j}=\Omega\right\} \cap_{i} A_{i}= \cap_{i \in I} A_{i}$.

The proof of Theorem 2.1.7 is based on Dynkin's $\pi-\lambda$ theorem. To state this result, we need two definitions. We say that $\mathcal{A}$ is a $\pi$-system if it is closed under intersection, i.e., if $A, B \in \mathcal{A}$ then $A \cap B \in \mathcal{A}$. We say that $\mathcal{L}$ is a $\lambda$-system if: (i) $\Omega \in \mathcal{L}$. (ii) If $A, B \in \mathcal{L}$ and $A \subset B$ then $B-A \in \mathcal{L}$. (iii) If $A_{n} \in \mathcal{L}$ and $A_{n} \uparrow A$ then $A \in \mathcal{L}$.

Theorem 2.1.6. $\pi-\lambda$ Theorem. If $\mathcal{P}$ is a $\pi$-system and $\mathcal{L}$ is a $\lambda$ system that contains $\mathcal{P}$ then $\sigma(\mathcal{P}) \subset \mathcal{L}$.

The proof is hidden away in Section A. 1 of the Appendix.
Theorem 2.1.7. Suppose $\mathcal{A}_{1}, \mathcal{A}_{2}, \ldots, \mathcal{A}_{n}$ are independent and each $\mathcal{A}_{i}$ is a $\pi$-system. Then $\sigma\left(\mathcal{A}_{1}\right), \sigma\left(\mathcal{A}_{2}\right), \ldots, \sigma\left(\mathcal{A}_{n}\right)$ are independent.
Proof. Let $A_{2}, \ldots, A_{n}$ be sets with $A_{i} \in \mathcal{A}_{i}$, let $F=A_{2} \cap \cdots \cap A_{n}$ and let $\mathcal{L}=\{A: P(A \cap F)=P(A) P(F)\}$. Since $P(\Omega \cap F)=P(\Omega) P(F), \Omega \in \mathcal{L}$. To check (ii) of the definition of a $\lambda$-system, we note that if $A, B \in \mathcal{L}$ with $A \subset B$ then $(B-A) \cap F=(B \cap F)-(A \cap F)$. So using (i) in Theorem 1.1.1, the fact $A, B \in \mathcal{L}$ and then (i) in Theorem 1.1.1 again:

$$
\begin{aligned}
P((B-A) \cap F) & =P(B \cap F)-P(A \cap F)=P(B) P(F)-P(A) P(F) \\
& =\{P(B)-P(A)\} P(F)=P(B-A) P(F)
\end{aligned}
$$

and we have $B-A \in \mathcal{L}$. To check (iii) let $B_{k} \in \mathcal{L}$ with $B_{k} \uparrow B$ and note that $\left(B_{k} \cap F\right) \uparrow(B \cap F)$ so using (iii) in Theorem 1.1.1, the fact that $B_{k} \in \mathcal{L}$, and then (iii) in Theorem 1.1.1 again:

$$
P(B \cap F)=\lim _{k} P\left(B_{k} \cap F\right)=\lim _{k} P\left(B_{k}\right) P(F)=P(B) P(F)
$$

Applying the $\pi-\lambda$ theorem now gives $\mathcal{L} \supset \sigma\left(\mathcal{A}_{1}\right)$. It follows that if $A_{1} \in \sigma\left(\mathcal{A}_{1}\right)$ and $A_{i} \in \mathcal{A}_{i}$ for $2 \leq i \leq n$ then

$$
P\left(\cap_{i=1}^{n} A_{i}\right)=P\left(A_{1}\right) P\left(\cap_{i=2}^{n} A_{i}\right)=\prod_{i=1}^{n} P\left(A_{i}\right)
$$

Using Lemma 2.1.5 now, we have:
(*) If $\mathcal{A}_{1}, \mathcal{A}_{2}, \ldots, \mathcal{A}_{n}$ are independent then $\sigma\left(\mathcal{A}_{1}\right), \mathcal{A}_{2}, \ldots, \mathcal{A}_{n}$ are independent.

Applying (*) to $\mathcal{A}_{2}, \ldots, \mathcal{A}_{n}, \sigma\left(\mathcal{A}_{1}\right)$ (which are independent since the definition is unchanged by permuting the order) shows that $\sigma\left(\mathcal{A}_{2}\right), \mathcal{A}_{3}, \ldots, \mathcal{A}_{n}$, $\sigma\left(\mathcal{A}_{1}\right)$ are independent, and after $n$ iterations we have the desired result.

Remark. The reader should note that it is not easy to show that if $A, B \in \mathcal{L}$ then $A \cap B \in \mathcal{L}$, or $A \cup B \in \mathcal{L}$, but it is easy to check that if $A, B \in \mathcal{L}$ with $A \subset B$ then $B-A \in \mathcal{L}$.

Having worked to establish Theorem 2.1.7, we get several corollaries.
Theorem 2.1.8. In order for $X_{1}, \ldots, X_{n}$ to be independent, it is sufficient that for all $x_{1}, \ldots, x_{n} \in(-\infty, \infty]$

$$
P\left(X_{1} \leq x_{1}, \ldots, X_{n} \leq x_{n}\right)=\prod_{i=1}^{n} P\left(X_{i} \leq x_{i}\right)
$$

Proof. Let $\mathcal{A}_{i}=$ the sets of the form $\left\{X_{i} \leq x_{i}\right\}$. Since

$$
\left\{X_{i} \leq x\right\} \cap\left\{X_{i} \leq y\right\}=\left\{X_{i} \leq x \wedge y\right\}
$$

where $(x \wedge y)_{i}=x_{i} \wedge y_{i}=\min \left\{x_{i}, y_{i}\right\} . \mathcal{A}_{i}$ is a $\pi$-system. Since we have allowed $x_{i}=\infty, \Omega \in \mathcal{A}_{i}$. Exercise 1.3.1 implies $\sigma\left(\mathcal{A}_{i}\right)=\sigma\left(X_{i}\right)$, so the result follows from Theorem 2.1.7.

The last result expresses independence of random variables in terms of their distribution functions. Exercises 2.1.1 and 2.1.2 treat density functions and discrete random variables.

Our next goal is to prove that functions of disjoint collections of independent random variables are independent. See Theorem 2.1.10 for the precise statement. First we will prove an analogous result for $\sigma$-fields.

Theorem 2.1.9. Suppose $\mathcal{F}_{i, j}, 1 \leq i \leq n, 1 \leq j \leq m(i)$ are independent and let $\mathcal{G}_{i}=\sigma\left(\cup_{j} \mathcal{F}_{i, j}\right)$. Then $\mathcal{G}_{1}, \ldots, \mathcal{G}_{n}$ are independent.

Proof. Let $\mathcal{A}_{i}$ be the collection of sets of the form $\cap_{j} A_{i, j}$ where $A_{i, j} \in \mathcal{F}_{i, j}$. $\mathcal{A}_{i}$ is a $\pi$-system that contains $\Omega$ and contains $\cup_{j} \mathcal{F}_{i, j}$ so Theorem 2.1.7 implies $\sigma\left(\mathcal{A}_{i}\right)=\mathcal{G}_{i}$ are independent.

Theorem 2.1.10. If for $1 \leq i \leq n, 1 \leq j \leq m(i), X_{i, j}$ are independent and $f_{i}: \mathbf{R}^{m(i)} \rightarrow \mathbf{R}$ are measurable then $f_{i}\left(X_{i, 1}, \ldots, X_{i, m(i)}\right)$ are independent.

Proof. Let $\mathcal{F}_{i, j}=\sigma\left(X_{i, j}\right)$ and $\mathcal{G}_{i}=\sigma\left(\cup_{j} \mathcal{F}_{i, j}\right)$. Since $f_{i}\left(X_{i, 1}, \ldots, X_{i, m(i)}\right) \in \mathcal{G}_{i}$, the desired result follows from Theorem 2.1.9 and Exercise 2.1.1.

A concrete special case of Theorem 2.1.10 that we will use in a minute is: if $X_{1}, \ldots, X_{n}$ are independent then $X=X_{1}$ and $Y=X_{2} \cdots X_{n}$ are independent. Later, when we study sums $S_{m}=X_{1}+\cdots+X_{m}$ of independent random variables $X_{1}, \ldots, X_{n}$, we will use Theorem 2.1.10 to conclude that if $m<n$ then $S_{n}-S_{m}$ is independent of the indicator function of the event $\left\{\max _{1 \leq k \leq m} S_{k}>x\right\}$.

### 2.1.2 Independence, Distribution, and Expectation

Our next goal is to obtain formulas for the distribution and expectation of independent random variables.

Theorem 2.1.11. Suppose $X_{1}, \ldots, X_{n}$ are independent random variables and $X_{i}$ has distribution $\mu_{i}$, then $\left(X_{1}, \ldots, X_{n}\right)$ has distribution $\mu_{1} \times \cdots \times \mu_{n}$.
Proof. Using the definitions of (i) $A_{1} \times \cdots \times A_{n}$, (ii) independence, (iii) $\mu_{i}$, and (iv) $\mu_{1} \times \cdots \times \mu_{n}$

$$
\begin{aligned}
& P\left(\left(X_{1}, \ldots, X_{n}\right) \in A_{1} \times \cdots \times A_{n}\right)=P\left(X_{1} \in A_{1}, \ldots, X_{n} \in A_{n}\right) \\
& \quad=\prod_{i=1}^{n} P\left(X_{i} \in A_{i}\right)=\prod_{i=1}^{n} \mu_{i}\left(A_{i}\right)=\mu_{1} \times \cdots \times \mu_{n}\left(A_{1} \times \cdots \times A_{n}\right)
\end{aligned}
$$

The last formula shows that the distribution of $\left(X_{1}, \ldots, X_{n}\right)$ and the measure $\mu_{1} \times \cdots \times \mu_{n}$ agree on sets of the form $A_{1} \times \cdots \times A_{n}$, a $\pi$-system that generates $\mathcal{R}^{n}$. So Theorem 2.1.6 implies they must agree.

Theorem 2.1.12. Suppose $X$ and $Y$ are independent and have distributions $\mu$ and $\nu$. If $h: \mathbf{R}^{2} \rightarrow \mathbf{R}$ is a measurable function with $h \geq 0$ or $E|h(X, Y)|<\infty$ then

$$
E h(X, Y)=\iint h(x, y) \mu(d x) \nu(d y)
$$

In particular, if $h(x, y)=f(x) g(y)$ where $f, g: \mathbf{R} \rightarrow \mathbf{R}$ are measurable functions with $f, g \geq 0$ or $E|f(X)|$ and $E|g(Y)|<\infty$ then

$$
E f(X) g(Y)=E f(X) \cdot E g(Y)
$$

Proof. Using Theorem 1.6.9 and then Fubini's theorem (Theorem 1.7.2) we have

$$
E h(X, Y)=\int_{\mathbf{R}^{2}} h d(\mu \times \nu)=\iint h(x, y) \mu(d x) \nu(d y)
$$

To prove the second result, we start with the result when $f, g \geq 0$. In this case, using the first result, the fact that $g(y)$ does not depend on $x$ and then Theorem 1.6.9 twice we get

$$
\begin{aligned}
E f(X) g(Y) & =\iint f(x) g(y) \mu(d x) \nu(d y)=\int g(y) \int f(x) \mu(d x) \nu(d y) \\
& =\int E f(X) g(y) \nu(d y)=E f(X) E g(Y)
\end{aligned}
$$

Applying the result for nonnegative $f$ and $g$ to $|f|$ and $|g|$, shows $E|f(X) g(Y)|= E|f(X)| E|g(Y)|<\infty$, and we can repeat the last argument to prove the desired result.

From Theorem 2.1.12, it is only a small step to
Theorem 2.1.13. If $X_{1}, \ldots, X_{n}$ are independent and have (a) $X_{i} \geq 0$ for all $i$, or (b) $E\left|X_{i}\right|<\infty$ for all $i$ then

$$
E\left(\prod_{i=1}^{n} X_{i}\right)=\prod_{i=1}^{n} E X_{i}
$$

i.e., the expectation on the left exists and has the value given on the right.
Proof. $X=X_{1}$ and $Y=X_{2} \cdots X_{n}$ are independent by Theorem 2.1.10 so taking $f(x)=|x|$ and $g(y)=|y|$ we have $E\left|X_{1} \cdots X_{n}\right|=E\left|X_{1}\right| E\left|X_{2} \cdots X_{n}\right|$, and it follows by induction that if $1 \leq m \leq n$

$$
E\left|X_{m} \cdots X_{n}\right|=\prod_{i=m}^{n} E\left|X_{k}\right|
$$

If the $X_{i} \geq 0$, then $\left|X_{i}\right|=X_{i}$ and the desired result follows from the special case $m=1$. To prove the result in general note that the special case $m=2$ implies $E|Y|=E\left|X_{2} \cdots X_{n}\right|<\infty$, so using Theorem 2.1.12 with $f(x)=x$ and $g(y)=y$ shows $E\left(X_{1} \cdots X_{n}\right)=E X_{1} \cdot E\left(X_{2} \cdots X_{n}\right)$, and the desired result follows by induction.

Example 2.1.14. It can happen that $E(X Y)=E X \cdot E Y$ without the variables being independent. Suppose the joint distribution of $X$ and $Y$ is given by the following table

$$
\begin{array}{ccccc} 
& & & Y & \\
& & 1 & 0 & -1 \\
& 1 & 0 & a & 0 \\
X & 0 & b & c & b \\
& -1 & 0 & a & 0
\end{array}
$$

where $a, b>0, c \geq 0$, and $2 a+2 b+c=1$. Things are arranged so that $X Y \equiv 0$. Symmetry implies $E X=0$ and $E Y=0$, so $E(X Y)=0= E X E Y$. The random variables are not independent since

$$
P(X=1, Y=1)=0<a b=P(X=1) P(Y=1)
$$

Two random variables $X$ and $Y$ with $E X^{2}, E Y^{2}<\infty$ that have $E X Y= E X E Y$ are said to be uncorrelated. The finite second moments are needed so that we know $E|X Y|<\infty$ by the Cauchy-Schwarz inequality.

### 2.1.3 Sums of Independent Random Variables

Theorem 2.1.15. If $X$ and $Y$ are independent, $F(x)=P(X \leq x)$, and $G(y)=P(Y \leq y)$, then

$$
P(X+Y \leq z)=\int F(z-y) d G(y)
$$

The integral on the right-hand side is called the convolution of $F$ and $G$ and is denoted $F * G(z)$. The meaning of $d G(y)$ will be explained in the proof.

Proof. Let $h(x, y)=1_{(x+y \leq z)}$. Let $\mu$ and $\nu$ be the probability measures with distribution functions $F$ and $G$. Since for fixed $y$

$$
\int h(x, y) \mu(d x)=\int 1_{(-\infty, z-y]}(x) \mu(d x)=F(z-y)
$$

using Theorem 2.1.12 gives

$$
\begin{aligned}
P(X+Y \leq z) & =\iint 1_{(x+y \leq z)} \mu(d x) \nu(d y) \\
& =\int F(z-y) \nu(d y)=\int F(z-y) d G(y)
\end{aligned}
$$

The last equality is just a change of notation: We regard $d G(y)$ as a shorthand for "integrate with respect to the measure $\nu$ with distribution function $G$."

To treat concrete examples, we need a special case of Theorem 2.1.15.
Theorem 2.1.16. Suppose that $X$ with density $f$ and $Y$ with distribution function $G$ are independent. Then $X+Y$ has density

$$
h(x)=\int f(x-y) d G(y)
$$

When $Y$ has density $g$, the last formula can be written as

$$
h(x)=\int f(x-y) g(y) d y
$$

Proof. From Theorem 2.1.15, the definition of density function, and Fubini's theorem (Theorem 1.7.2), which is justified since everything is nonnegative, we get

$$
\begin{aligned}
P(X+Y \leq z) & =\int F(z-y) d G(y)=\iint_{-\infty}^{z} f(x-y) d x d G(y) \\
& =\int_{-\infty}^{z} \int f(x-y) d G(y) d x
\end{aligned}
$$

The last equation says that $X+Y$ has density $h(x)=\int f(x-y) d G(y)$. The second formula follows from the first when we recall the meaning of $d G(y)$ given in the proof of Theorem 2.1.15 and use Exercise 1.6.8.

Theorem 2.1.16 plus some ugly calculus allows us to treat two standard examples. These facts should be familiar from undergraduate probability.

Example 2.1.17. The gamma density with parameters $\alpha$ and $\lambda$ is given by

$$
f(x)= \begin{cases}\lambda^{\alpha} x^{\alpha-1} e^{-\lambda x} / \Gamma(\alpha) & \text { for } x \geq 0 \\ 0 & \text { for } x<0\end{cases}
$$

where $\Gamma(\alpha)=\int_{0}^{\infty} x^{\alpha-1} e^{-x} d x$.
Theorem 2.1.18. If $X=\operatorname{gamma}(\alpha, \lambda)$ and $Y=\operatorname{gamma}(\beta, \lambda)$ are independent then $X+Y$ is gamma $(\alpha+\beta, \lambda)$. Consequently if $X_{1}, \ldots X_{n}$ are independent exponential( $\lambda$ ) r.v.'s, then $X_{1}+\cdots+X_{n}$, has a gamma( $n, \lambda$ ) distribution.

Proof. Writing $f_{X+Y}(z)$ for the density function of $X+Y$ and using Theorem 2.1.16

$$
\begin{aligned}
f_{X+Y}(x) & =\int_{0}^{x} \frac{\lambda^{\alpha}(x-y)^{\alpha-1}}{\Gamma(\alpha)} e^{-\lambda(x-y)} \frac{\lambda^{\beta} y^{\beta-1}}{\Gamma(\beta)} e^{-\lambda y} d y \\
& =\frac{\lambda^{\alpha+\beta} e^{-\lambda x}}{\Gamma(\alpha) \Gamma(\beta)} \int_{0}^{x}(x-y)^{\alpha-1} y^{\beta-1} d y
\end{aligned}
$$

so it suffices to show the integral is $x^{\alpha+\beta-1} \Gamma(\alpha) \Gamma(\beta) / \Gamma(\alpha+\beta)$. To do this, we begin by changing variables $y=x u, d y=x d u$ to get

$$
\begin{equation*}
x^{\alpha+\beta-1} \int_{0}^{1}(1-u)^{\alpha-1} u^{\beta-1} d u=\int_{0}^{x}(x-y)^{\alpha-1} y^{\beta-1} d y \tag{2.1.1}
\end{equation*}
$$

There are two ways to complete the proof at this point. The soft solution is to note that we have shown that the density $f_{X+Y}(x)= c_{\alpha, \beta} e^{-\lambda x} \lambda^{\alpha+\beta} x^{\alpha+\beta-1}$ where

$$
c_{\alpha, \beta}=\frac{1}{\Gamma(\alpha) \Gamma(\beta)} \int_{0}^{1}(1-u)^{\alpha-1} u^{\beta-1} d u
$$

There is only one norming constant $c_{\alpha, \beta}$ that makes this a probability distribution, so recalling the definition of the beta distribution, we must have $c_{\alpha, \beta}=1 / \Gamma(\alpha+\beta)$.

The less elegant approach for those of us who cannot remember the definition of the beta is to prove the last equality by calculus. Multiplying each side of the last equation by $e^{-x}$, integrating from 0 to $\infty$, and then using Fubini's theorem on the right we have

$$
\begin{aligned}
\Gamma(\alpha+\beta) \int_{0}^{1} & (1-u)^{\alpha-1} u^{\beta-1} d u \\
& =\int_{0}^{\infty} \int_{0}^{x} y^{\beta-1} e^{-y}(x-y)^{\alpha-1} e^{-(x-y)} d y d x \\
& =\int_{0}^{\infty} y^{\beta-1} e^{-y} \int_{y}^{\infty}(x-y)^{\alpha-1} e^{-(x-y)} d x d y=\Gamma(\alpha) \Gamma(\beta)
\end{aligned}
$$

which gives the first result. The second follows from the fact that a gamma( $1, \lambda$ ) is an exponential with parameter $\lambda$ and induction.

Example 2.1.19. Normal distribution. In Example 1.6.11, we introduced the normal density with mean $\mu$ and variance $a$,

$$
(2 \pi a)^{-1 / 2} \exp \left(-(x-\mu)^{2} / 2 a\right) .
$$

Theorem 2.1.20. If $X=$ normal $(\mu, a)$ and $Y=$ normal $(\nu, b)$ are independent then $X+Y=\operatorname{normal}(\mu+\nu, a+b)$.

Proof. It is enough to prove the result for $\mu=\nu=0$. Suppose $Y_{1}= \operatorname{normal}(0, a)$ and $Y_{2}=\operatorname{normal}(0, b)$. Then Theorem 2.1.16 implies

$$
f_{Y_{1}+Y_{2}}(z)=\frac{1}{2 \pi \sqrt{a b}} \int e^{-x^{2} / 2 a} e^{-(z-x)^{2} / 2 b} d x
$$

Dropping the constant in front, the integral can be rewritten as

$$
\begin{aligned}
& \int \exp \left(-\frac{b x^{2}+a x^{2}-2 a x z+a z^{2}}{2 a b}\right) d x \\
& \quad=\int \exp \left(-\frac{a+b}{2 a b}\left\{x^{2}-\frac{2 a}{a+b} x z+\frac{a}{a+b} z^{2}\right\}\right) d x \\
& \quad=\int \exp \left(-\frac{a+b}{2 a b}\left\{\left(x-\frac{a}{a+b} z\right)^{2}+\frac{a b}{(a+b)^{2}} z^{2}\right\}\right) d x
\end{aligned}
$$

since $-\{a /(a+b)\}^{2}+\{a /(a+b)\}=a b /(a+b)^{2}$. Factoring out the term that does not depend on $x$, the last integral

$$
\begin{aligned}
& =\exp \left(-\frac{z^{2}}{2(a+b)}\right) \int \exp \left(-\frac{a+b}{2 a b}\left(x-\frac{a}{a+b} z\right)^{2}\right) d x \\
& =\exp \left(-\frac{z^{2}}{2(a+b)}\right) \sqrt{2 \pi a b /(a+b)}
\end{aligned}
$$

since the last integral is the normal density with parameters $\mu=a z /(a+ b)$ and $\sigma^{2}=a b /(a+b)$ without its proper normalizing constant. Reintroducing the constant we dropped at the beginning,

$$
f_{Y_{1}+Y_{2}}(z)=\frac{1}{2 \pi \sqrt{a b}} \sqrt{2 \pi a b /(a+b)} \exp \left(-\frac{z^{2}}{2(a+b)}\right)
$$

### 2.1.4 Constructing Independent Random Variables

The last question that we have to address before we can study independent random variables is: Do they exist? (If they don't exist, then there
is no point in studying them!) If we are given a finite number of distribution functions $F_{i}, 1 \leq i \leq n$, it is easy to construct independent random variables $X_{1}, \ldots, X_{n}$ with $P\left(X_{i} \leq x\right)=F_{i}(x)$. Let $\Omega=\mathbf{R}^{n}, \mathcal{F}=\mathcal{R}^{n}$, $X_{i}\left(\omega_{1}, \ldots, \omega_{n}\right)=\omega_{i}$ (the $i$ th coordinate of $\omega \in \mathbf{R}^{n}$ ), and let $P$ be the measure on $\mathcal{R}^{n}$ that has

$$
P\left(\left(a_{1}, b_{1}\right] \times \cdots \times\left(a_{n}, b_{n}\right]\right)=\left(F_{1}\left(b_{1}\right)-F_{1}\left(a_{1}\right)\right) \cdots\left(F_{n}\left(b_{n}\right)-F_{n}\left(a_{n}\right)\right)
$$

If $\mu_{i}$ is the measure with distribution function $F_{i}$ then $P=\mu_{1} \times \cdots \times \mu_{n}$.
To construct an infinite sequence $X_{1}, X_{2}, \ldots$ of independent random variables with given distribution functions, we want to perform the last construction on the infinite product space

$$
\mathbf{R}^{\mathbf{N}}=\left\{\left(\omega_{1}, \omega_{2}, \ldots\right): \omega_{i} \in \mathbf{R}\right\}=\{\text { functions } \omega: \mathbf{N} \rightarrow \mathbf{R}\}
$$

where $\mathbf{N}=\{1,2, \ldots\}$ and $\mathbf{N}$ stands for natural numbers. We define $X_{i}(\omega)=\omega_{i}$ and we equip $\mathbf{R}^{\mathbf{N}}$ with the product $\sigma$-field $\mathcal{R}^{\mathbf{N}}$, which is generated by the finite dimensional sets $=$ sets of the form $\left\{\omega: \omega_{i} \in\right. \left.B_{i}, 1 \leq i \leq n\right\}$ where $B_{i} \in \mathcal{R}$. It is clear how we want to define $P$ for finite dimensional sets. To assert the existence of a unique extension to $\mathcal{R}^{\mathrm{N}}$ we use Theorem A.3.1:

Theorem 2.1.21. Kolmogorov's extension theorem. Suppose we are given probability measures $\mu_{n}$ on $\left(\mathbf{R}^{n}, \mathcal{R}^{n}\right)$ that are consistent, that is,

$$
\mu_{n+1}\left(\left(a_{1}, b_{1}\right] \times \cdots \times\left(a_{n}, b_{n}\right] \times \mathbf{R}\right)=\mu_{n}\left(\left(a_{1}, b_{1}\right] \times \cdots \times\left(a_{n}, b_{n}\right]\right)
$$

Then there is a unique probability measure $P$ on $\left(\mathbf{R}^{\mathbf{N}}, \mathcal{R}^{\mathbf{N}}\right)$ with

$$
P\left(\omega: \omega_{i} \in\left(a_{i}, b_{i}\right], 1 \leq i \leq n\right)=\mu_{n}\left(\left(a_{1}, b_{1}\right] \times \cdots \times\left(a_{n}, b_{n}\right]\right)
$$

In what follows we will need to construct sequences of random variables that take values in other measurable spaces $(S, \mathcal{S})$. Unfortunately, Theorem 2.1.21 is not valid for arbitrary measurable spaces. The first example (on an infinite product of different spaces $\Omega_{1} \times \Omega_{2} \times \ldots$ ) was constructed by Andersen and Jessen (1948). (See Halmos (1950) p. 214 or Neveu (1965) p. 84.) For an example in which all the spaces $\Omega_{i}$ are the same see Wegner (1973). Fortunately, there is a class of spaces that is adequate for all of our results and for which the generalization of Kolmogorov's theorem is trivial.
$(S, S)$ is said to be nice if there is a 1-1 map $\varphi$ from $S$ into $\mathbf{R}$ so that $\varphi$ and $\varphi^{-1}$ are both measurable.

Such spaces are often called standard Borel spaces, but we already have too many things named after Borel. The next result shows that most spaces arising in applications are nice.

Theorem 2.1.22. If $S$ is a Borel subset of a complete separable metric space $M$, and $\mathcal{S}$ is the collection of Borel subsets of $S$, then ( $S, \mathcal{S}$ ) is nice.
Proof. We begin with the special case $S=[0,1)^{\mathbf{N}}$ with metric

$$
\rho(x, y)=\sum_{n=1}^{\infty}\left|x_{n}-y_{n}\right| / 2^{n}
$$

If $x=\left(x^{1}, x^{2}, x^{3}, \ldots\right)$, expand each component in binary $x^{j}=. x_{1}^{j} x_{2}^{j} x_{3}^{j} \ldots$ (taking the expansion with an infinite number of 0 's). Let

$$
\varphi_{o}(x)=. x_{1}^{1} x_{2}^{1} x_{1}^{2} x_{3}^{1} x_{2}^{2} x_{1}^{3} x_{4}^{1} x_{3}^{2} x_{2}^{3} x_{1}^{4} \ldots
$$

To treat the general case, we observe that by letting

$$
d(x, y)=\rho(x, y) /(1+\rho(x, y))
$$

(for more details, see Exercise 2.1.3), we can suppose that the metric has $d(x, y)<1$ for all $x, y$. Let $q_{1}, q_{2}, \ldots$ be a countable dense set in S . Let

$$
\psi(x)=\left(d\left(x, q_{1}\right), d\left(x, q_{2}\right), \ldots\right)
$$

$\psi: S \rightarrow[0,1)^{N}$ is continuous and 1-1. $\varphi_{o} \circ \psi$ gives the desired mapping.

Caveat emptor. The proof above is somewhat light when it comes to details. For a more comprehensive discussion, see Section 13.1 of Dudley (1989). An interesting consequence of the analysis there is that for Borel subsets of a complete separable metric space the continuum hypothesis is true: i.e., all sets are either finite, countably infinite, or have the cardinality of the real numbers.

## Exercises

2.1.1. Suppose ( $X_{1}, \ldots, X_{n}$ ) has density $f\left(x_{1}, x_{2}, \ldots, x_{n}\right)$, that is

$$
P\left(\left(X_{1}, X_{2}, \ldots, X_{n}\right) \in A\right)=\int_{A} f(x) d x \text { for } A \in \mathcal{R}^{n}
$$

If $f(x)$ can be written as $g_{1}\left(x_{1}\right) \cdots g_{n}\left(x_{n}\right)$ where the $g_{m} \geq 0$ are measurable, then $X_{1}, X_{2}, \ldots, X_{n}$ are independent. Note that the $g_{m}$ are not assumed to be probability densities.
2.1.2. Suppose $X_{1}, \ldots, X_{n}$ are random variables that take values in countable sets $S_{1}, \ldots, S_{n}$. Then in order for $X_{1}, \ldots, X_{n}$ to be independent, it is sufficient that whenever $x_{i} \in S_{i}$

$$
P\left(X_{1}=x_{1}, \ldots, X_{n}=x_{n}\right)=\prod_{i=1}^{n} P\left(X_{i}=x_{i}\right)
$$

2.1.3. Let $\rho(x, y)$ be a metric. (i) Suppose $h$ is differentiable with $h(0)= 0, h^{\prime}(x)>0$ for $x>0$ and $h^{\prime}(x)$ decreasing on $[0, \infty)$. Then $h(\rho(x, y))$ is a metric. (ii) $h(x)=x /(x+1)$ satisfies the hypotheses in (i).
2.1.4. Let $\Omega=(0,1), \mathcal{F}=$ Borel sets, $P=$ Lebesgue measure. $X_{n}(\omega)= \sin (2 \pi n \omega), n=1,2, \ldots$ are uncorrelated but not independent.
2.1.5. (i) Show that if $X$ and $Y$ are independent with distributions $\mu$ and $\nu$ then

$$
P(X+Y=0)=\sum_{y} \mu(\{-y\}) \nu(\{y\})
$$

(ii) Conclude that if $X$ has continuous distribution $P(X=Y)=0$.
2.1.6. Prove directly from the definition that if $X$ and $Y$ are independent and $f$ and $g$ are measurable functions then $f(X)$ and $g(Y)$ are independent.
2.1.7. Let $K \geq 3$ be a prime and let $X$ and $Y$ be independent random variables that are uniformly distributed on $\{0,1, \ldots, K-1\}$. For $0 \leq n< K$, let $Z_{n}=X+n Y \bmod K$. Show that $Z_{0}, Z_{1}, \ldots, Z_{K-1}$ are pairwise independent, i.e., each pair is independent. They are not independent because if we know the values of two of the variables then we know the values of all the variables.
2.1.8. Find four random variables taking values in $\{-1,1\}$ so that any three are independent but all four are not. Hint: Consider products of independent random variables.
2.1.9. Let $\Omega=\{1,2,3,4\}, \mathcal{F}=$ all subsets of $\Omega$, and $P(\{i\})=1 / 4$. Give an example of two collections of sets $\mathcal{A}_{1}$ and $\mathcal{A}_{2}$ that are independent but whose generated $\sigma$-fields are not.
2.1.10. Show that if $X$ and $Y$ are independent, integer-valued random variables, then

$$
P(X+Y=n)=\sum_{m} P(X=m) P(Y=n-m)
$$

2.1.11. In Example 1.6.13, we introduced the Poisson distribution with parameter $\lambda$, which is given by $P(Z=k)=e^{-\lambda} \lambda^{k} / k!$ for $k=0,1,2, \ldots$ Use the previous exercise to show that if $X=\operatorname{Poisson}(\lambda)$ and $Y= \operatorname{Poisson}(\mu)$ are independent then $X+Y=\operatorname{Poisson}(\lambda+\mu)$.
2.1.12. $X$ is said to have a $\operatorname{Binomial}(n, p)$ distribution if

$$
P(X=m)=\binom{n}{m} p^{m}(1-p)^{n-m}
$$

(i) Show that if $X=\operatorname{Binomial}(n, p)$ and $Y=\operatorname{Binomial}(m, p)$ are independent then $X+Y=\operatorname{Binomial}(n+m, p)$. (ii) Look at Example 1.6.12
and use induction to conclude that the sum of $n$ independent Bernoulli( $p$ ) random variables is $\operatorname{Binomial}(n, p)$.
2.1.13. It should not be surprising that the distribution of $X+Y$ can be $F * G$ without the random variables being independent. Suppose $X, Y \in\{0,1,2\}$ and take each value with probability $1 / 3$. (a) Find the distribution of $X+Y$ assuming $X$ and $Y$ are independent. (b) Find all the joint distributions $(X, Y)$ so that the distribution of $X+Y$ is the same as the answer to (a).
2.1.14. Let $X, Y \geq 0$ be independent with distribution functions $F$ and $G$. Find the distribution function of $X Y$.
2.1.15. If we want an infinite sequence of coin tossings, we do not have to use Kolmogorov's theorem. Let $\Omega$ be the unit interval $(0,1)$ equipped with the Borel sets $\mathcal{F}$ and Lebesgue measure P . Let $Y_{n}(\omega)=1$ if $\left[2^{n} \omega\right]$ is odd and 0 if $\left[2^{n} \omega\right]$ is even. Show that $Y_{1}, Y_{2}, \ldots$ are independent with $P\left(Y_{k}=0\right)=P\left(Y_{k}=1\right)=1 / 2$.

### 2.2 Weak Laws of Large Numbers

In this section, we will prove several "weak laws of large numbers." The first order of business is to define the mode of convergence that appears in the conclusions of the theorems. We say that $Y_{n}$ converges to $Y$ in probability if for all $\epsilon>0, P\left(\left|Y_{n}-Y\right|>\epsilon\right) \rightarrow 0$ as $n \rightarrow \infty$.

### 2.2.1 $L^{2}$ Weak Laws

Our first set of weak laws come from computing variances and using Chebyshev's inequality. Extending a definition given in Example 2.1.14 for two random variables, a family of random variables $X_{i}, i \in I$ with $E X_{i}^{2}<\infty$ is said to be uncorrelated if we have

$$
E\left(X_{i} X_{j}\right)=E X_{i} E X_{j} \quad \text { whenever } i \neq j
$$

The key to our weak law for uncorrelated random variables, Theorem 2.2.3, is:

Theorem 2.2.1. Let $X_{1}, \ldots, X_{n}$ have $E\left(X_{i}^{2}\right)<\infty$ and be uncorrelated. Then

$$
\operatorname{var}\left(X_{1}+\cdots+X_{n}\right)=\operatorname{var}\left(X_{1}\right)+\cdots+\operatorname{var}\left(X_{n}\right)
$$

where $\operatorname{var}(Y)=$ the variance of $Y$.
Proof. Let $\mu_{i}=E X_{i}$ and $S_{n}=\sum_{i=1}^{n} X_{i}$. Since $E S_{n}=\sum_{i=1}^{n} \mu_{i}$, using the definition of the variance, writing the square of the sum as the product
of two copies of the sum, and then expanding, we have

$$
\begin{aligned}
\operatorname{var}\left(S_{n}\right) & =E\left(S_{n}-E S_{n}\right)^{2}=E\left(\sum_{i=1}^{n}\left(X_{i}-\mu_{i}\right)\right)^{2} \\
& =E\left(\sum_{i=1}^{n} \sum_{j=1}^{n}\left(X_{i}-\mu_{i}\right)\left(X_{j}-\mu_{j}\right)\right) \\
& =\sum_{i=1}^{n} E\left(X_{i}-\mu_{i}\right)^{2}+2 \sum_{i=1}^{n} \sum_{j=1}^{i-1} E\left(\left(X_{i}-\mu_{i}\right)\left(X_{j}-\mu_{j}\right)\right)
\end{aligned}
$$

where in the last equality we have separated out the diagonal terms $i=j$ and used the fact that the sum over $1 \leq i<j \leq n$ is the same as the sum over $1 \leq j<i \leq n$.

The first sum is $\operatorname{var}\left(X_{1}\right)+\ldots+\operatorname{var}\left(X_{n}\right)$ so we want to show that the second sum is zero. To do this, we observe

$$
\begin{aligned}
E\left(\left(X_{i}-\mu_{i}\right)\left(X_{j}-\mu_{j}\right)\right) & =E X_{i} X_{j}-\mu_{i} E X_{j}-\mu_{j} E X_{i}+\mu_{i} \mu_{j} \\
& =E X_{i} X_{j}-\mu_{i} \mu_{j}=0
\end{aligned}
$$

since $X_{i}$ and $X_{j}$ are uncorrelated.
In words, Theorem 2.2.1 says that for uncorrelated random variables the variance of the sum is the sum of the variances. The second ingredient in our proof of Theorem 2.2.3 is the following consequence of (1.6.4):

$$
\operatorname{var}(c Y)=c^{2} \operatorname{var}(Y)
$$

The third and final ingredient is
Lemma 2.2.2. If $p>0$ and $E\left|Z_{n}\right|^{p} \rightarrow 0$ then $Z_{n} \rightarrow 0$ in probability.
Proof. Chebyshev's inequality, Theorem 1.6.4, with $\varphi(x)=x^{p}$ and $X= \left|Z_{n}\right|$ implies that if $\epsilon>0$ then $P\left(\left|Z_{n}\right| \geq \epsilon\right) \leq \epsilon^{-p} E\left|Z_{n}\right|^{p} \rightarrow 0$.

We can now easily prove
Theorem 2.2.3. $L^{2}$ weak law. Let $X_{1}, X_{2}, \ldots$ be uncorrelated random variables with $E X_{i}=\mu$ and var $\left(X_{i}\right) \leq C<\infty$. If $S_{n}=X_{1}+\ldots+X_{n}$ then as $n \rightarrow \infty, S_{n} / n \rightarrow \mu$ in $L^{2}$ and in probability.

Proof. To prove $L^{2}$ convergence, observe that $E\left(S_{n} / n\right)=\mu$, so
$E\left(S_{n} / n-\mu\right)^{2}=\operatorname{var}\left(S_{n} / n\right)=\frac{1}{n^{2}}\left(\operatorname{var}\left(X_{1}\right)+\cdots+\operatorname{var}\left(X_{n}\right)\right) \leq \frac{C n}{n^{2}} \rightarrow 0$
To conclude there is also convergence in probability, we apply the Lemma 2.2.2 to $Z_{n}=S_{n} / n-\mu$.

The most important special case of Theorem 2.2.3 occurs when $X_{1}, X_{2}, \ldots$ are independent random variables that all have the same distribution. In the jargon, they are independent and identically distributed or i.i.d. for short. Theorem 2.2.3 tells us in this case that if $E X_{i}^{2}<\infty$ then $S_{n} / n$ converges to $\mu=E X_{i}$ in probability as $n \rightarrow \infty$. In Theorem 2.2.14 below, we will see that $E\left|X_{i}\right|<\infty$ is sufficient for the last conclusion, but for the moment we will concern ourselves with consequences of the weaker result.

Our first application is to a situation that on the surface has nothing to do with randomness.

Example 2.2.4. Polynomial approximation. Let $f$ be a continuous function on $[0,1]$, and let

$$
f_{n}(x)=\sum_{m=0}^{n}\binom{n}{m} x^{m}(1-x)^{n-m} f(m / n) \quad \text { where }\binom{n}{m}=\frac{n!}{m!(n-m)!}
$$

be the Bernstein polynomial of degree $n$ associated with $f$. Then as $n \rightarrow \infty$

$$
\sup _{x \in[0,1]}\left|f_{n}(x)-f(x)\right| \rightarrow 0
$$

Proof. First observe that if $S_{n}$ is the sum of $n$ independent random variables with $P\left(X_{i}=1\right)=p$ and $P\left(X_{i}=0\right)=1-p$ then $E X_{i}=p$, $\operatorname{var}\left(X_{i}\right)=p(1-p)$ and

$$
P\left(S_{n}=m\right)=\binom{n}{m} p^{m}(1-p)^{n-m}
$$

so $E f\left(S_{n} / n\right)=f_{n}(p)$. Theorem 2.2.3 tells us that as $n \rightarrow \infty, S_{n} / n \rightarrow p$ in probability. The last two observations motivate the definition of $f_{n}(p)$, but to prove the desired conclusion we have to use the proof of Theorem 2.2.3 rather than the result itself.

Combining the proof of Theorem 2.2.3 with our formula for the variance of $X_{i}$ and the fact that $p(1-p) \leq 1 / 4$ when $p \in[0,1]$, we have

$$
P\left(\left|S_{n} / n-p\right|>\delta\right) \leq \frac{\operatorname{var}\left(S_{n} / n\right)}{\delta^{2}}=\frac{p(1-p)}{n \delta^{2}} \leq \frac{1}{4 n \delta^{2}}
$$

To conclude now that $E f\left(S_{n} / n\right) \rightarrow f(p)$, let $M=\sup _{x \in[0,1]}|f(x)|$, let $\epsilon>0$, and pick $\delta>0$ so that if $|x-y|<\delta$ then $|f(x)-f(y)|<\epsilon$. (This is possible since a continuous function is uniformly continuous on each bounded interval.) Now, using Jensen's inequality, Theorem 1.6.2, gives

$$
\left|E f\left(S_{n} / n\right)-f(p)\right| \leq E\left|f\left(S_{n} / n\right)-f(p)\right| \leq \epsilon+2 M P\left(\left|S_{n} / n-p\right|>\delta\right)
$$

Letting $n \rightarrow \infty$, we have $\limsup _{n \rightarrow \infty}\left|E f\left(S_{n} / n\right)-f(p)\right| \leq \epsilon$, but $\epsilon$ is arbitrary so this gives the desired result.

Our next result is for comic relief.
Example 2.2.5. A high-dimensional cube is almost the boundary of a ball. Let $X_{1}, X_{2}, \ldots$ be independent and uniformly distributed on $(-1,1)$. Let $Y_{i}=X_{i}^{2}$, which are independent since they are functions of independent random variables. $E Y_{i}=1 / 3$ and $\operatorname{var}\left(Y_{i}\right) \leq E Y_{i}^{2} \leq 1$, so Theorem 2.2.3 implies

$$
\left(X_{1}^{2}+\ldots+X_{n}^{2}\right) / n \rightarrow 1 / 3 \quad \text { in probability as } n \rightarrow \infty
$$

Let $A_{n, \epsilon}=\left\{x \in \mathbf{R}^{n}:(1-\epsilon) \sqrt{n / 3}<|x|<(1+\epsilon) \sqrt{n / 3}\right\}$ where $|x|= \left(x_{1}^{2}+\cdots+x_{n}^{2}\right)^{1 / 2}$. If we let $|S|$ denote the Lebesgue measure of $S$ then the last conclusion implies that for any $\epsilon>0,\left|A_{n, \epsilon} \cap(-1,1)^{n}\right| / 2^{n} \rightarrow 1$, or, in words, most of the volume of the cube $(-1,1)^{n}$ comes from $A_{n, \epsilon}$, which is almost the boundary of the ball of radius $\sqrt{n / 3}$.

### 2.2.2 Triangular Arrays

Many classical limit theorems in probability concern arrays $X_{n, k}, 1 \leq k \leq n$ of random variables and investigate the limiting behavior of their row sums $S_{n}=X_{n, 1}+\cdots+X_{n, n}$. In most cases, we assume that the random variables on each row are independent, but for the next trivial (but useful) result we do not need that assumption. Indeed, here $S_{n}$ can be any sequence of random variables.

Theorem 2.2.6. Let $\mu_{n}=E S_{n}, \sigma_{n}^{2}=\operatorname{var}\left(S_{n}\right)$. If $\sigma_{n}^{2} / b_{n}^{2} \rightarrow 0$ then

$$
\frac{S_{n}-\mu_{n}}{b_{n}} \rightarrow 0 \quad \text { in probability }
$$

Proof. Our assumptions imply $E\left(\left(S_{n}-\mu_{n}\right) / b_{n}\right)^{2}=b_{n}^{-2} \operatorname{var}\left(S_{n}\right) \rightarrow 0$, so the desired conclusion follows from Lemma 2.2.2.

We will now give three applications of Theorem 2.2.6. For these three examples, the following calculation is useful:

$$
\begin{align*}
& \sum_{m=1}^{n} \frac{1}{m} \geq \int_{1}^{n} \frac{d x}{x} \geq \sum_{m=2}^{n} \frac{1}{m} \\
& \log n \leq \sum_{m=1}^{n} \frac{1}{m} \leq 1+\log n \tag{2.2.1}
\end{align*}
$$

Example 2.2.7. Coupon collector's problem. Let $X_{1}, X_{2}, \ldots$ be i.i.d. uniform on $\{1,2, \ldots, n\}$. To motivate the name, think of collecting baseball cards (or coupons). Suppose that the $i$ th item we collect is chosen at random from the set of possibilities and is independent of the previous choices. Let $\tau_{k}^{n}=\inf \left\{m:\left|\left\{X_{1}, \ldots, X_{m}\right\}\right|=k\right\}$ be the first
time we have $k$ different items. In this problem, we are interested in the asymptotic behavior of $T_{n}=\tau_{n}^{n}$, the time to collect a complete set. It is easy to see that $\tau_{1}^{n}=1$. To make later formulas work out nicely, we will set $\tau_{0}^{n}=0$. For $1 \leq k \leq n, X_{n, k} \equiv \tau_{k}^{n}-\tau_{k-1}^{n}$ represents the time to get a choice different from our first $k-1$, so $X_{n, k}$ has a geometric distribution with parameter $1-(k-1) / n$ and is independent of the earlier waiting times $X_{n, j}, 1 \leq j<k$. Example 1.6.14 tells us that if $X$ has a geometric distribution with parameter $p$ then $E X=1 / p$ and $\operatorname{var}(X) \leq 1 / p^{2}$. Using the linearity of expected value, bounds on $\sum_{m=1}^{n} 1 / m$ in (2.2.1), and Theorem 2.2.1 we see that

$$
\begin{aligned}
E T_{n} & =\sum_{k=1}^{n}\left(1-\frac{k-1}{n}\right)^{-1}=n \sum_{m=1}^{n} m^{-1} \sim n \log n \\
\operatorname{var}\left(T_{n}\right) & \leq \sum_{k=1}^{n}\left(1-\frac{k-1}{n}\right)^{-2}=n^{2} \sum_{m=1}^{n} m^{-2} \leq n^{2} \sum_{m=1}^{\infty} m^{-2}
\end{aligned}
$$

Taking $b_{n}=n \log n$ and using Theorem 2.2.6, it follows that

$$
\frac{T_{n}-n \sum_{m=1}^{n} m^{-1}}{n \log n} \rightarrow 0 \quad \text { in probability }
$$

and hence $T_{n} /(n \log n) \rightarrow 1$ in probability.
For a concrete example, take $n=365$, i.e., we are interested in the number of people we need to meet until we have seen someone with every birthday. In this case the limit theorem says it will take about $365 \log 365=2153.46$ tries to get a complete set. Note that the number of trials is 5.89 times the number of birthdays.

Example 2.2.8. Random permutations. Let $\Omega_{n}$ consist of the $n$ ! permutations (i.e., one-to-one mappings from $\{1, \ldots, n\}$ onto $\{1, \ldots, n\}$ ) and make this into a probability space by assuming all the permutations are equally likely. This application of the weak law concerns the cycle structure of a random permutation $\pi$, so we begin by describing the decomposition of a permutation into cycles. Consider the sequence $1, \pi(1), \pi(\pi(1)), \ldots$ Eventually, $\pi^{k}(1)=1$. When it does, we say the first cycle is completed and has length $k$. To start the second cycle, we pick the smallest integer $i$ not in the first cycle and look at $i, \pi(i), \pi(\pi(i)), \ldots$ until we come back to $i$. We repeat the construction until all the elements are accounted for. For example, if the permutation is

$$
\begin{array}{cccccccccc}
i & 1 & 2 & 3 & 4 & 5 & 6 & 7 & 8 & 9 \\
\pi(i) & 3 & 9 & 6 & 8 & 2 & 1 & 5 & 4 & 7
\end{array}
$$

then the cycle decomposition is $(136)(2975)(48)$.
Let $X_{n, k}=1$ if a right parenthesis occurs after the $k$ th number in the decomposition, $X_{n, k}=0$ otherwise and let $S_{n}=X_{n, 1}+\ldots+X_{n, n}=$ the
number of cycles. (In the example, $X_{9,3}=X_{9,7}=X_{9,9}=1$, and the other $X_{9, m}=0$.) I claim that

Lemma 2.2.9. $X_{n, 1}, \ldots, X_{n, n}$ are independent and $P\left(X_{n, j}=1\right)=\frac{1}{n-j+1}$.
Intuitively, this is true since, independent of what has happened so far, there are $n-j+1$ values that have not appeared in the range, and only one of them will complete the cycle.

Proof. To prove this, it is useful to generate the permutation in a special way. Let $i_{1}=1$. Pick $j_{1}$ at random from $\{1, \ldots, n\}$ and let $\pi\left(i_{1}\right)=j_{1}$. If $j_{1} \neq 1$, let $i_{2}=j_{1}$. If $j_{1}=1$, let $i_{2}=2$. In either case, pick $j_{2}$ at random from $\{1, \ldots, n\}-\left\{j_{1}\right\}$. In general, if $i_{1}, j_{1}, \ldots, i_{k-1}, j_{k-1}$ have been selected and we have set $\pi\left(i_{\ell}\right)=j_{\ell}$ for $1 \leq \ell<k$, then (a) if $j_{k-1} \in\left\{i_{1}, \ldots, i_{k-1}\right\}$ so a cycle has just been completed, we let $i_{k}= \inf \left(\{1, \ldots, n\}-\left\{i_{1}, \ldots, i_{k-1}\right\}\right)$ and (b) if $j_{k-1} \notin\left\{i_{1}, \ldots, i_{k-1}\right\}$ we let $i_{k}= j_{k-1}$. In either case we pick $j_{k}$ at random from $\{1, \ldots, n\}-\left\{j_{1}, \ldots, j_{k-1}\right\}$ and let $\pi\left(i_{k}\right)=j_{k}$.

The construction above is tedious to write out, or to read, but now I can claim with a clear conscience that $X_{n, 1}, \ldots, X_{n, n}$ are independent and $P\left(X_{n, k}=1\right)=1 /(n-k+1)$ since when we pick $j_{k}$ there are $n-k+1$ values in $\{1, \ldots, n\}-\left\{j_{1}, \ldots, j_{k-1}\right\}$ and only one of them will complete the cycle.

To check the conditions of Theorem 2.2.6, now note

$$
\begin{aligned}
E S_{n} & =1 / n+1 /(n-1)+\cdots+1 / 2+1 \\
\operatorname{var}\left(S_{n}\right) & =\sum_{k=1}^{n} \operatorname{var}\left(X_{n, k}\right) \leq \sum_{k=1}^{n} E\left(X_{n, k}^{2}\right)=\sum_{k=1}^{n} E\left(X_{n, k}\right)=E S_{n}
\end{aligned}
$$

where the results on the second line follow from Theorem 2.2.1, the fact that $\operatorname{var}(Y) \leq E Y^{2}$, and $X_{n, k}^{2}=X_{n, k}$. Now $E S_{n} \sim \log n$, so if $b_{n}= (\log n)^{.5+\epsilon}$ with $\epsilon>0$, the conditions of Theorem 2.2.6 are satisfied and it follows that

$$
\begin{equation*}
\frac{S_{n}-\sum_{m=1}^{n} m^{-1}}{(\log n)^{.5+\epsilon}} \rightarrow 0 \quad \text { in probability } \tag{*}
\end{equation*}
$$

Taking $\epsilon=0.5$ we have that $S_{n} / \log n \rightarrow 1$ in probability, but (*) says more. We will see in Example 3.4.11 that (*) is false if $\epsilon=0$.

Example 2.2.10. An occupancy problem. Suppose we put $r$ balls at random in $n$ boxes, i.e., all $n^{r}$ assignments of balls to boxes have equal probability. Let $A_{i}$ be the event that the $i$ th box is empty and $N_{n}=$ the number of empty boxes. It is easy to see that

$$
P\left(A_{i}\right)=(1-1 / n)^{r} \quad \text { and } \quad E N_{n}=n(1-1 / n)^{r}
$$

A little calculus (take logarithms) shows that if $r / n \rightarrow c, E N_{n} / n \rightarrow e^{-c}$. (For a proof, see Lemma 3.1.1.) To compute the variance of $N_{n}$, we observe that

$$
\begin{aligned}
E N_{n}^{2} & =E\left(\sum_{m=1}^{n} 1_{A_{m}}\right)^{2}=\sum_{1 \leq k, m \leq n} P\left(A_{k} \cap A_{m}\right) \\
\operatorname{var}\left(N_{n}\right) & =E N_{n}^{2}-\left(E N_{n}\right)^{2}=\sum_{1 \leq k, m \leq n} P\left(A_{k} \cap A_{m}\right)-P\left(A_{k}\right) P\left(A_{m}\right) \\
& =n(n-1)\left\{(1-2 / n)^{r}-(1-1 / n)^{2 r}\right\}+n\left\{(1-1 / n)^{r}-(1-1 / n)^{2 r}\right\}
\end{aligned}
$$

The first term comes from $k \neq m$ and the second from $k=m$. Since $(1-2 / n)^{r} \rightarrow e^{-2 c}$ and $(1-1 / n)^{r} \rightarrow e^{-c}$, it follows easily from the last formula that $\operatorname{var}\left(N_{n} / n\right)=\operatorname{var}\left(N_{n}\right) / n^{2} \rightarrow 0$. Taking $b_{n}=n$ in Theorem 2.2.6 now we have

$$
N_{n} / n \rightarrow e^{-c} \quad \text { in probability }
$$

### 2.2.3 Truncation

To truncate a random variable $X$ at level $M$ means to consider

$$
\bar{X}=X 1_{(|X| \leq M)}= \begin{cases}X & \text { if }|X| \leq M \\ 0 & \text { if }|X|>M\end{cases}
$$

To extend the weak law to random variables without a finite second moment, we will truncate and then use Chebyshev's inequality. We begin with a very general but also very useful result. Its proof is easy because we have assumed what we need for the proof. Later we will have to work a little to verify the assumptions in special cases, but the general result serves to identify the essential ingredients in the proof.

Theorem 2.2.11. Weak law for triangular arrays. For each $n$ let $X_{n, k}, 1 \leq k \leq n$, be independent. Let $b_{n}>0$ with $b_{n} \rightarrow \infty$, and let $\bar{X}_{n, k}=X_{n, k} 1_{\left(\left|X_{n, k}\right| \leq b_{n}\right)}$. Suppose that as $n \rightarrow \infty$
(i) $\sum_{k=1}^{n} P\left(\left|X_{n, k}\right|>b_{n}\right) \rightarrow 0$, and
(ii) $b_{n}^{-2} \sum_{k=1}^{n} E \bar{X}_{n, k}^{2} \rightarrow 0$.

If we let $S_{n}=X_{n, 1}+\ldots+X_{n, n}$ and put $a_{n}=\sum_{k=1}^{n} E \bar{X}_{n, k}$ then

$$
\left(S_{n}-a_{n}\right) / b_{n} \rightarrow 0 \text { in probability }
$$

Proof. Let $\bar{S}_{n}=\bar{X}_{n, 1}+\cdots+\bar{X}_{n, n}$. Clearly,

$$
P\left(\left|\frac{S_{n}-a_{n}}{b_{n}}\right|>\epsilon\right) \leq P\left(S_{n} \neq \bar{S}_{n}\right)+P\left(\left|\frac{\bar{S}_{n}-a_{n}}{b_{n}}\right|>\epsilon\right)
$$

To estimate the first term, we note that

$$
P\left(S_{n} \neq \bar{S}_{n}\right) \leq P\left(\cup_{k=1}^{n}\left\{\bar{X}_{n, k} \neq X_{n, k}\right\}\right) \leq \sum_{k=1}^{n} P\left(\left|X_{n, k}\right|>b_{n}\right) \rightarrow 0
$$

by (i). For the second term, we note that Chebyshev's inequality, $a_{n}= E \bar{S}_{n}$, Theorem 2.2.1, and $\operatorname{var}(X) \leq E X^{2}$ imply

$$
\begin{aligned}
P\left(\left|\frac{\bar{S}_{n}-a_{n}}{b_{n}}\right|>\epsilon\right) & \leq \epsilon^{-2} E\left|\frac{\bar{S}_{n}-a_{n}}{b_{n}}\right|^{2}=\epsilon^{-2} b_{n}^{-2} \operatorname{var}\left(\bar{S}_{n}\right) \\
& =\left(b_{n} \epsilon\right)^{-2} \sum_{k=1}^{n} \operatorname{var}\left(\bar{X}_{n, k}\right) \leq\left(b_{n} \epsilon\right)^{-2} \sum_{k=1}^{n} E\left(\bar{X}_{n, k}\right)^{2} \rightarrow 0
\end{aligned}
$$

by (ii), and the proof is complete.

From Theorem 2.2.11, we get the following result for a single sequence.
Theorem 2.2.12. Weak law of large numbers. Let $X_{1}, X_{2}, \ldots$ be i.i.d. with

$$
x P\left(\left|X_{i}\right|>x\right) \rightarrow 0 \quad \text { as } x \rightarrow \infty
$$

Let $S_{n}=X_{1}+\cdots+X_{n}$ and let $\mu_{n}=E\left(X_{1} 1_{\left(\left|X_{1}\right| \leq n\right)}\right)$. Then $S_{n} / n-\mu_{n} \rightarrow 0$ in probability.

Remark. The assumption in the theorem is necessary for the existence of constants $a_{n}$ so that $S_{n} / n-a_{n} \rightarrow 0$. See Feller, Vol. II (1971) p. 234236 for a proof.

Proof. We will apply Theorem 2.2.11 with $X_{n, k}=X_{k}$ and $b_{n}=n$. To check (i), we note

$$
\sum_{k=1}^{n} P\left(\left|X_{n, k}\right|>n\right)=n P\left(\left|X_{i}\right|>n\right) \rightarrow 0
$$

by assumption. To check (ii), we need to show $n^{-2} \cdot n E \bar{X}_{n, 1}^{2} \rightarrow 0$. To do this, we need the following result, which will be useful several times below.

Lemma 2.2.13. If $Y \geq 0$ and $p>0$ then $E\left(Y^{p}\right)=\int_{0}^{\infty} p y^{p-1} P(Y> y) d y$.

Proof. Using the definition of expected value, Fubini's theorem (for nonnegative random variables), and then calculating the resulting integrals
gives

$$
\begin{aligned}
\int_{0}^{\infty} p y^{p-1} P(Y>y) d y & =\int_{0}^{\infty} \int_{\Omega} p y^{p-1} 1_{(Y>y)} d P d y \\
& =\int_{\Omega} \int_{0}^{\infty} p y^{p-1} 1_{(Y>y)} d y d P \\
& =\int_{\Omega} \int_{0}^{Y} p y^{p-1} d y d P=\int_{\Omega} Y^{p} d P=E Y^{p}
\end{aligned}
$$

which is the desired result.
Returning to the proof of Theorem 2.2.12, we observe that Lemma 2.2.13 and the fact that $\bar{X}_{n, 1}=X_{1} 1_{\left(\left|X_{1}\right| \leq n\right)}$ imply

$$
E\left(\bar{X}_{n, 1}^{2}\right)=\int_{0}^{\infty} 2 y P\left(\left|\bar{X}_{n, 1}\right|>y\right) d y \leq \int_{0}^{n} 2 y P\left(\left|X_{1}\right|>y\right) d y
$$

since $P\left(\left|\bar{X}_{n, 1}\right|>y\right)=0$ for $y \geq n$ and $=P\left(\left|X_{1}\right|>y\right)-P\left(\left|X_{1}\right|>n\right)$ for $y \leq n$. We claim that $y P\left(\left|X_{1}\right|>y\right) \rightarrow 0$ implies

$$
E\left(\bar{X}_{n, 1}^{2}\right) / n=\frac{1}{n} \int_{0}^{n} 2 y P\left(\left|X_{1}\right|>y\right) d y \rightarrow 0
$$

as $n \rightarrow \infty$. Intuitively, this holds since the right-hand side is the average of $g(y)=2 y P\left(\left|X_{1}\right|>y\right)$ over $[0, n]$ and $g(y) \rightarrow 0$ as $y \rightarrow \infty$. To spell out the details, note that $0 \leq g(y) \leq 2 y$ and $g(y) \rightarrow 0$ as $y \rightarrow \infty$, so we must have $M=\sup g(y)<\infty$. Let $g_{n}(y)=g(n y)$. Since $g_{n}$ is bounded and $g_{n}(y) \rightarrow 0$ a.s.,

$$
(1 / n) \int_{0}^{n} g(y) d y=\int_{0}^{1} g_{n}(x) d x \rightarrow 0
$$

which completes the proof.
Remark. Applying Lemma 2.2.13 with $p=1-\epsilon$ and $\epsilon>0$, we see that $x P\left(\left|X_{1}\right|>x\right) \rightarrow 0$ implies $E\left|X_{1}\right|^{1-\epsilon}<\infty$, so the assumption in Theorem 2.2.12 is not much weaker than finite mean.

Finally, we have the weak law in its most familiar form.
Theorem 2.2.14. Let $X_{1}, X_{2} \ldots$ be i.i.d. with $E\left|X_{i}\right|<\infty$. Let $S_{n}= X_{1}+\cdots+X_{n}$ and let $\mu=E X_{1}$. Then $S_{n} / n \rightarrow \mu$ in probability.

Proof. Two applications of the dominated convergence theorem imply

$$
\begin{aligned}
& x P\left(\left|X_{1}\right|>x\right) \leq E\left(\left|X_{1}\right| 1_{\left(\left|X_{1}\right|>x\right)}\right) \rightarrow 0 \quad \text { as } x \rightarrow \infty \\
& \mu_{n}=E\left(X_{1} 1_{\left(\left|X_{1}\right| \leq n\right)}\right) \rightarrow E\left(X_{1}\right)=\mu \quad \text { as } n \rightarrow \infty
\end{aligned}
$$

Using Theorem 2.2.12, we see that if $\epsilon>0$ then $P\left(\left|S_{n} / n-\mu_{n}\right|>\epsilon / 2\right) \rightarrow$ 0 . Since $\mu_{n} \rightarrow \mu$, it follows that $P\left(\left|S_{n} / n-\mu\right|>\epsilon\right) \rightarrow 0$.

Example 2.2.15. For an example where the weak law does not hold, suppose $X_{1}, X_{2}, \ldots$ are independent and have a Cauchy distribution:

$$
P\left(X_{i} \leq x\right)=\int_{-\infty}^{x} \frac{d t}{\pi\left(1+t^{2}\right)}
$$

As $x \rightarrow \infty$,

$$
P\left(\left|X_{1}\right|>x\right)=2 \int_{x}^{\infty} \frac{d t}{\pi\left(1+t^{2}\right)} \sim \frac{2}{\pi} \int_{x}^{\infty} t^{-2} d t=\frac{2}{\pi} x^{-1}
$$

From the necessity of the condition above, we can conclude that there is no sequence of constants $\mu_{n}$ so that $S_{n} / n-\mu_{n} \rightarrow 0$. We will see later that $S_{n} / n$ always has the same distribution as $X_{1}$. (See Exercise 3.3.6.)

As the next example shows, we can have a weak law in some situations in which $E|X|=\infty$.

Example 2.2.16. The "St. Petersburg paradox." Let $X_{1}, X_{2}, \ldots$ be independent random variables with

$$
P\left(X_{i}=2^{j}\right)=2^{-j} \quad \text { for } j \geq 1
$$

In words, you win $2^{j}$ dollars if it takes $j$ tosses to get a heads. The paradox here is that $E X_{1}=\infty$, but you clearly wouldn't pay an infinite amount to play this game. An application of Theorem 2.2.11 will tell us how much we should pay to play the game $n$ times.

In this example, $X_{n, k}=X_{k}$. To apply Theorem 2.2.11, we have to pick $b_{n}$. To do this, we are guided by the principle that in checking (ii) we want to take $b_{n}$ as small as we can and have (i) hold. With this in mind, we observe that if $m$ is an integer

$$
P\left(X_{1} \geq 2^{m}\right)=\sum_{j=m}^{\infty} 2^{-j}=2^{-m+1}
$$

Let $m(n)=\log _{2} n+K(n)$ where $K(n) \rightarrow \infty$ and is chosen so that $m(n)$ is an integer (and hence the displayed formula is valid). Letting $b_{n}=2^{m(n)}$, we have

$$
n P\left(X_{1} \geq b_{n}\right)=n 2^{-m(n)+1}=2^{-K(n)+1} \rightarrow 0
$$

proving (i). To check (ii), we observe that if $\bar{X}_{n, k}=X_{k} 1_{\left(\left|X_{k}\right| \leq b_{n}\right)}$ then

$$
E \bar{X}_{n, k}^{2}=\sum_{j=1}^{m(n)} 2^{2 j} \cdot 2^{-j} \leq 2^{m(n)} \sum_{k=0}^{\infty} 2^{-k}=2 b_{n}
$$

So the expression in (ii) is smaller than $2 n / b_{n}$, which $\rightarrow 0$ since

$$
b_{n}=2^{m(n)}=n 2^{K(n)} \text { and } K(n) \rightarrow \infty
$$

The last two steps are to evaluate $a_{n}$ and to apply Theorem 2.2.11.

$$
E \bar{X}_{n, k}=\sum_{j=1}^{m(n)} 2^{j} 2^{-j}=m(n)
$$

so $a_{n}=n m(n)$. We have $m(n)=\log n+K(n)$ (here and until the end of the example all logs are base 2), so if we pick $K(n) / \log n \rightarrow 0$ then $a_{n} / n \log n \rightarrow 1$ as $n \rightarrow \infty$. Using Theorem 2.2.11 now, we have

$$
\frac{S_{n}-a_{n}}{n 2^{K(n)}} \rightarrow 0 \quad \text { in probability }
$$

If we suppose that $K(n) \leq \log \log n$ for large $n$ then the last conclusion holds with the denominator replaced by $n \log n$, and it follows that $S_{n} /(n \log n) \rightarrow 1$ in probability.

Returning to our original question, we see that a fair price for playing $n$ times is $\$ \log _{2} n$ per play. When $n=1024$, this is $\$ 10$ per play. Nicolas Bernoulli wrote in 1713, "There ought not to exist any even halfway sensible person who would not sell the right of playing the game for 40 ducats (per play)." If the wager were 1 ducat, one would need $2^{40} \approx 10^{12}$ plays to start to break even.

## Exercises

2.2.1. Let $X_{1}, X_{2}, \ldots$ be uncorrelated with $E X_{i}=\mu_{i}$ and $\operatorname{var}\left(X_{i}\right) / i \rightarrow 0$ as $i \rightarrow \infty$. Let $S_{n}=X_{1}+\ldots+X_{n}$ and $\nu_{n}=E S_{n} / n$ then as $n \rightarrow \infty$, $S_{n} / n-\nu_{n} \rightarrow 0$ in $L^{2}$ and in probability.
2.2.2. The $L^{2}$ weak law generalizes immediately to certain dependent sequences. Suppose $E X_{n}=0$ and $E X_{n} X_{m} \leq r(n-m)$ for $m \leq n$ (no absolute value on the left-hand side!) with $r(k) \rightarrow 0$ as $k \rightarrow \infty$. Show that $\left(X_{1}+\ldots+X_{n}\right) / n \rightarrow 0$ in probability.
2.2.3. Monte Carlo integration. (i) Let $f$ be a measurable function on $[0,1]$ with $\int_{0}^{1}|f(x)| d x<\infty$. Let $U_{1}, U_{2}, \ldots$ be independent and uniformly distributed on $[0,1]$, and let

$$
I_{n}=n^{-1}\left(f\left(U_{1}\right)+\ldots+f\left(U_{n}\right)\right)
$$

Show that $I_{n} \rightarrow I \equiv \int_{0}^{1} f d x$ in probability. (ii) Suppose $\int_{0}^{1}|f(x)|^{2} d x< \infty$. Use Chebyshev's inequality to estimate $P\left(\left|I_{n}-I\right|>a / n^{1 / 2}\right)$.
2.2.4. Let $X_{1}, X_{2}, \ldots$ be i.i.d. with $P\left(X_{i}=(-1)^{k} k\right)=C / k^{2} \log k$ for $k \geq 2$ where $C$ is chosen to make the sum of the probabilities $=1$. Show that $E\left|X_{i}\right|=\infty$, but there is a finite constant $\mu$ so that $S_{n} / n \rightarrow \mu$ in probability.
2.2.5. Let $X_{1}, X_{2} \ldots$ be i.i.d. with $P\left(X_{i}>x\right)=e / x \log x$ for $x \geq e$. Show that $E\left|X_{i}\right|=\infty$, but there is a sequence of constants $\mu_{n} \rightarrow \infty$ so that $S_{n} / n-\mu_{n} \rightarrow 0$ in probability.
2.2.6. (i) Show that if $X \geq 0$ is integer valued $E X=\sum_{n \geq 1} P(X \geq n)$. (ii) Find a similar expression for $E X^{2}$.
2.2.7. Generalize Lemma 2.2.13 to conclude that if $H(x)=\int_{(-\infty, x]} h(y) d y$ with $h(y) \geq 0$, then

$$
E H(X)=\int_{-\infty}^{\infty} h(y) P(X \geq y) d y
$$

An important special case is $H(x)=\exp (\theta x)$ with $\theta>0$.
2.2.8. An unfair "fair game." Let $p_{k}=1 / 2^{k} k(k+1), k=1,2, \ldots$ and $p_{0}=1-\sum_{k \geq 1} p_{k}$.

$$
\sum_{k=1}^{\infty} 2^{k} p_{k}=\left(1-\frac{1}{2}\right)+\left(\frac{1}{2}-\frac{1}{3}\right)+\ldots=1
$$

so if we let $X_{1}, X_{2}, \ldots$ be i.i.d. with $P\left(X_{n}=-1\right)=p_{0}$ and

$$
P\left(X_{n}=2^{k}-1\right)=p_{k} \quad \text { for } k \geq 1
$$

then $E X_{n}=0$. Let $S_{n}=X_{1}+\ldots+X_{n}$. Use Theorem 2.2.11 with $b_{n}=2^{m(n)}$ where $m(n)=\min \left\{m: 2^{-m} m^{-3 / 2} \leq n^{-1}\right\}$ to conclude that

$$
S_{n} /\left(n / \log _{2} n\right) \rightarrow-1 \text { in probability }
$$

2.2.9. Weak law for positive variables. Suppose $X_{1}, X_{2}, \ldots$ are i.i.d., $P\left(0 \leq X_{i}<\infty\right)=1$ and $P\left(X_{i}>x\right)>0$ for all $x$. Let $\mu(s)=\int_{0}^{s} x d F(x)$ and $\nu(s)=\mu(s) / s(1-F(s))$. It is known that there exist constants $a_{n}$ so that $S_{n} / a_{n} \rightarrow 1$ in probability, if and only if $\nu(s) \rightarrow \infty$ as $s \rightarrow \infty$. Pick $b_{n} \geq 1$ so that $n \mu\left(b_{n}\right)=b_{n}$ (this works for large $n$ ), and use Theorem 2.2.11 to prove that the condition is sufficient.

### 2.3 Borel-Cantelli Lemmas

If $A_{n}$ is a sequence of subsets of $\Omega$, we let

$$
\limsup A_{n}=\lim _{m \rightarrow \infty} \cup_{n=m}^{\infty} A_{n}=\left\{\omega \text { that are in infinitely many } A_{n}\right\}
$$

(the limit exists since the sequence is decreasing in $m$ ) and let $\liminf A_{n}=\lim _{m \rightarrow \infty} \cap_{n=m}^{\infty} A_{n}=\left\{\omega\right.$ that are in all but finitely many $\left.A_{n}\right\}$
(the limit exists since the sequence is increasing in $m$ ). The names lim sup and lim inf can be explained by noting that

$$
\limsup _{n \rightarrow \infty} 1_{A_{n}}=1_{\left(\limsup A_{n}\right)} \quad \liminf _{n \rightarrow \infty} 1_{A_{n}}=1_{\left(\liminf A_{n}\right)}
$$

It is common to write $\limsup A_{n}=\left\{\omega: \omega \in A_{n}\right.$ i.o. $\}$, where i.o. stands for infinitely often. An example which illustrates the use of this notation is: " $X_{n} \rightarrow 0$ a.s. if and only if for all $\epsilon>0, P\left(\left|X_{n}\right|>\epsilon\right.$ i.o. $)=0$." The reader will see many other examples below.

Exercise 2.3.1. Prove that $P\left(\limsup A_{n}\right) \geq \limsup P\left(A_{n}\right)$ and $P\left(\liminf A_{n}\right) \leq \liminf P\left(A_{n}\right)$
The next result should be familiar from measure theory even though its name may not be.

Theorem 2.3.1. Borel-Cantelli lemma. If $\sum_{n=1}^{\infty} P\left(A_{n}\right)<\infty$ then

$$
P\left(A_{n} \text { i.o. }\right)=0 .
$$

Proof. Let $N=\sum_{k} 1_{A_{k}}$ be the number of events that occur. Fubini's theorem implies $E N=\sum_{k} P\left(A_{k}\right)<\infty$, so we must have $N<\infty$ a.s.

The next result is a typical application of the Borel-Cantelli lemma.
Theorem 2.3.2. $X_{n} \rightarrow X$ in probability if and only if for every subsequence $X_{n(m)}$ there is a further subsequence $X_{n\left(m_{k}\right)}$ that converges almost surely to $X$.

Proof. Let $\epsilon_{k}$ be a sequence of positive numbers that $\downarrow 0$. For each $k$, there is an $n\left(m_{k}\right)>n\left(m_{k-1}\right)$ so that $P\left(\left|X_{n\left(m_{k}\right)}-X\right|>\epsilon_{k}\right) \leq 2^{-k}$. Since

$$
\sum_{k=1}^{\infty} P\left(\left|X_{n\left(m_{k}\right)}-X\right|>\epsilon_{k}\right)<\infty
$$

the Borel-Cantelli lemma implies $P\left(\left|X_{n\left(m_{k}\right)}-X\right|>\epsilon_{k}\right.$ i.o. $)=0$, i.e., $X_{n\left(m_{k}\right)} \rightarrow X$ a.s. To prove the second conclusion, we note that if for every subsequence $X_{n(m)}$ there is a further subsequence $X_{n\left(m_{k}\right)}$ that converges almost surely to $X$ then we can apply the next lemma to the sequence of numbers $y_{n}=P\left(\left|X_{n}-X\right|>\delta\right)$ for any $\delta>0$ to get the desired result.

Theorem 2.3.3. Let $y_{n}$ be a sequence of elements of a topological space. If every subsequence $y_{n(m)}$ has a further subsequence $y_{n\left(m_{k}\right)}$ that converges to $y$ then $y_{n} \rightarrow y$.

Proof. If $y_{n} \nrightarrow y$ then there is an open set $G$ containing $y$ and a subsequence $y_{n(m)}$ with $y_{n(m)} \notin G$ for all $m$, but clearly no subsequence of $y_{n(m)}$ converges to $y$.

Remark. Since there is a sequence of random variables that converges in probability but not a.s. (for an example, see Exercises 2.3.14 or 2.3.11), it follows from Theorem 2.3.3 that a.s. convergence does not come from a metric, or even from a topology. Exercise 2.3.6 will give a metric for convergence in probability, and Exercise 2.3.7 will show that the space of random variables is a complete space under this metric.

Theorem 2.3.2 allows us to upgrade convergence in probability to convergence almost surely. An example of the usefulness of this is

Theorem 2.3.4. If $f$ is continuous and $X_{n} \rightarrow X$ in probability then $f\left(X_{n}\right) \rightarrow f(X)$ in probability. If, in addition, $f$ is bounded then $E f\left(X_{n}\right) \rightarrow E f(X)$.

Proof. If $X_{n(m)}$ is a subsequence then Theorem 2.3.2 implies there is a further subsequence $X_{n\left(m_{k}\right)} \rightarrow X$ almost surely. Since $f$ is continuous, Exercise 1.3.3 implies $f\left(X_{n\left(m_{k}\right)}\right) \rightarrow f(X)$ almost surely and Theorem 2.3.2 implies $f\left(X_{n}\right) \rightarrow f(X)$ in probability. If $f$ is bounded then the bounded convergence theorem implies $E f\left(X_{n\left(m_{k}\right)}\right) \rightarrow E f(X)$, and applying Theorem 2.3.3 to $y_{n}=E f\left(X_{n}\right)$ gives the desired result.

Exercise 2.3.2. Prove the first result in Theorem 2.3.4 directly from the definition.

As our second application of the Borel-Cantelli lemma, we get our first strong law of large numbers:

Theorem 2.3.5. Let $X_{1}, X_{2} \ldots$ be i.i.d. with $E X_{i}=\mu$ and $E X_{i}^{4}<\infty$. If $S_{n}=X_{1}+\cdots+X_{n}$ then $S_{n} / n \rightarrow \mu$ a.s.

Proof. By letting $X_{i}^{\prime}=X_{i}-\mu$, we can suppose without loss of generality that $\mu=0$. Now

$$
E S_{n}^{4}=E\left(\sum_{i=1}^{n} X_{i}\right)^{4}=E \sum_{1 \leq i, j, k, \ell \leq n} X_{i} X_{j} X_{k} X_{\ell}
$$

Terms in the sum of the form $E\left(X_{i}^{3} X_{j}\right), E\left(X_{i}^{2} X_{j} X_{k}\right)$, and $E\left(X_{i} X_{j} X_{k} X_{\ell}\right)$ are 0 (if $i, j, k, \ell$ are distinct) since the expectation of the product is the product of the expectations, and in each case one of the terms has expectation 0 . The only terms that do not vanish are those of the form $E X_{i}^{4}$ and $E X_{i}^{2} X_{j}^{2}=\left(E X_{i}^{2}\right)^{2}$. There are $n$ and $3 n(n-1)$ of these terms, respectively. (In the second case we can pick the two indices in $n(n-1) / 2$ ways, and with the indices fixed, the term can arise in a total of 6 ways.) The last observation implies

$$
E S_{n}^{4}=n E X_{1}^{4}+3\left(n^{2}-n\right)\left(E X_{1}^{2}\right)^{2} \leq C n^{2}
$$

where $C<\infty$. Chebyshev's inequality gives us

$$
P\left(\left|S_{n}\right|>n \epsilon\right) \leq E\left(S_{n}^{4}\right) /(n \epsilon)^{4} \leq C /\left(n^{2} \epsilon^{4}\right)
$$

Summing on $n$ and using the Borel-Cantelli lemma gives $P\left(\left|S_{n}\right|>n \epsilon\right.$ i.o. $)=$ 0 . Since $\epsilon$ is arbitrary, the proof is complete.

The converse of the Borel-Cantelli lemma is trivially false.
Example 2.3.6. Let $\Omega=(0,1), \mathcal{F}=$ Borel sets, $P=$ Lebesgue measure. If $A_{n}=\left(0, a_{n}\right)$ where $a_{n} \rightarrow 0$ as $n \rightarrow \infty$ then $\limsup A_{n}=\emptyset$, but if $a_{n} \geq 1 / n$, we have $\sum a_{n}=\infty$.

The example just given suggests that for general sets we cannot say much more than the result in Exercise 2.3.1.
For independent events, however, the necessary condition for $P\left(\limsup A_{n}\right)>$ 0 is sufficient for $P\left(\limsup A_{n}\right)=1$.

Theorem 2.3.7. The second Borel-Cantelli lemma. If the events $A_{n}$ are independent then $\sum P\left(A_{n}\right)=\infty$ implies $P\left(A_{n}\right.$ i.o. $)=1$.

Proof. Let $M<N<\infty$. Independence and $1-x \leq e^{-x}$ imply

$$
\begin{aligned}
P\left(\cap_{n=M}^{N} A_{n}^{c}\right) & =\prod_{n=M}^{N}\left(1-P\left(A_{n}\right)\right) \leq \prod_{n=M}^{N} \exp \left(-P\left(A_{n}\right)\right) \\
& =\exp \left(-\sum_{n=M}^{N} P\left(A_{n}\right)\right) \rightarrow 0 \quad \text { as } N \rightarrow \infty
\end{aligned}
$$

So $P\left(\cup_{n=M}^{\infty} A_{n}\right)=1$ for all $M$, and since $\cup_{n=M}^{\infty} A_{n} \downarrow \limsup A_{n}$ it follows that $P\left(\limsup A_{n}\right)=1$.

A typical application of the second Borel-Cantelli lemma is:
Theorem 2.3.8. If $X_{1}, X_{2}, \ldots$ are i.i.d. with $E\left|X_{i}\right|=\infty$, then $P\left(\left|X_{n}\right| \geq\right. n$ i.o. $)=1$. So if $S_{n}=X_{1}+\cdots+X_{n}$ then $P\left(\lim S_{n} / n\right.$ exists $\left.\in(-\infty, \infty)\right)=$ 0 .

Proof. From Lemma 2.2.13, we get

$$
E\left|X_{1}\right|=\int_{0}^{\infty} P\left(\left|X_{1}\right|>x\right) d x \leq \sum_{n=0}^{\infty} P\left(\left|X_{1}\right|>n\right)
$$

Since $E\left|X_{1}\right|=\infty$ and $X_{1}, X_{2}, \ldots$ are i.i.d., it follows from the second Borel-Cantelli lemma that $P\left(\left|X_{n}\right| \geq n\right.$ i.o. $)=1$. To prove the second claim, observe that

$$
\frac{S_{n}}{n}-\frac{S_{n+1}}{n+1}=\frac{S_{n}}{n(n+1)}-\frac{X_{n+1}}{n+1}
$$

and on $C \equiv\left\{\omega: \lim _{n \rightarrow \infty} S_{n} / n\right.$ exists $\left.\in(-\infty, \infty)\right\}, S_{n} /(n(n+1)) \rightarrow 0$. So, on $C \cap\left\{\omega:\left|X_{n}\right| \geq n\right.$ i.o. $\}$, we have

$$
\left|\frac{S_{n}}{n}-\frac{S_{n+1}}{n+1}\right|>2 / 3 \quad \text { i.o. }
$$

contradicting the fact that $\omega \in C$. From the last observation, we conclude that

$$
\left\{\omega:\left|X_{n}\right| \geq n \text { i.o. }\right\} \cap C=\emptyset
$$

and since $P\left(\left|X_{n}\right| \geq n\right.$ i.o. $)=1$, it follows that $P(C)=0$.
Theorem 2.3.8 shows that $E\left|X_{i}\right|<\infty$ is necessary for the strong law of large numbers. The reader will have to wait until Theorem 2.4.1 to see that condition is also sufficient. The next result extends the second Borel-Cantelli lemma and sharpens its conclusion.

Theorem 2.3.9. If $A_{1}, A_{2} \ldots$ are pairwise independent and $\sum_{n=1}^{\infty} P\left(A_{n}\right)= \infty$ then as $n \rightarrow \infty$

$$
\sum_{m=1}^{n} 1_{A_{m}} / \sum_{m=1}^{n} P\left(A_{m}\right) \rightarrow 1 \quad \text { a.s. }
$$

Proof. Let $X_{m}=1_{A_{m}}$ and let $S_{n}=X_{1}+\cdots+X_{n}$. Since the $A_{m}$ are pairwise independent, the $X_{m}$ are uncorrelated and hence Theorem 2.2.1 implies

$$
\operatorname{var}\left(S_{n}\right)=\operatorname{var}\left(X_{1}\right)+\cdots+\operatorname{var}\left(X_{n}\right)
$$

$\operatorname{var}\left(X_{m}\right) \leq E\left(X_{m}^{2}\right)=E\left(X_{m}\right)$, since $X_{m} \in\{0,1\}$, so $\operatorname{var}\left(S_{n}\right) \leq E\left(S_{n}\right)$. Chebyshev's inequality implies

$$
\begin{equation*}
P\left(\left|S_{n}-E S_{n}\right|>\delta E S_{n}\right) \leq \operatorname{var}\left(S_{n}\right) /\left(\delta E S_{n}\right)^{2} \leq 1 /\left(\delta^{2} E S_{n}\right) \rightarrow 0 \tag{*}
\end{equation*}
$$

as $n \rightarrow \infty$. (Since we have assumed $E S_{n} \rightarrow \infty$.)
The last computation shows that $S_{n} / E S_{n} \rightarrow 1$ in probability. To get almost sure convergence, we have to take subsequences. Let $n_{k}=\inf \{n: \left.E S_{n} \geq k^{2}\right\}$. Let $T_{k}=S_{n_{k}}$ and note that the definition and $E X_{m} \leq 1$ imply $k^{2} \leq E T_{k} \leq k^{2}+1$. Replacing $n$ by $n_{k}$ in (*) and using $E T_{k} \geq k^{2}$ shows

$$
P\left(\left|T_{k}-E T_{k}\right|>\delta E T_{k}\right) \leq 1 /\left(\delta^{2} k^{2}\right)
$$

So $\sum_{k=1}^{\infty} P\left(\left|T_{k}-E T_{k}\right|>\delta E T_{k}\right)<\infty$, and the Borel-Cantelli lemma implies $P\left(\left|T_{k}-E T_{k}\right|>\delta E T_{k}\right.$ i.o. $)=0$. Since $\delta$ is arbitrary, it follows that $T_{k} / E T_{k} \rightarrow 1$ a.s. To show $S_{n} / E S_{n} \rightarrow 1$ a.s., pick an $\omega$ so that $T_{k}(\omega) / E T_{k} \rightarrow 1$ and observe that if $n_{k} \leq n<n_{k+1}$ then

$$
\frac{T_{k}(\omega)}{E T_{k+1}} \leq \frac{S_{n}(\omega)}{E S_{n}} \leq \frac{T_{k+1}(\omega)}{E T_{k}}
$$

To show that the terms at the left and right ends $\rightarrow 1$, we rewrite the last inequalities as

$$
\frac{E T_{k}}{E T_{k+1}} \cdot \frac{T_{k}(\omega)}{E T_{k}} \leq \frac{S_{n}(\omega)}{E S_{n}} \leq \frac{T_{k+1}(\omega)}{E T_{k+1}} \cdot \frac{E T_{k+1}}{E T_{k}}
$$

From this, we see it is enough to show $E T_{k+1} / E T_{k} \rightarrow 1$, but this follows from

$$
k^{2} \leq E T_{k} \leq E T_{k+1} \leq(k+1)^{2}+1
$$

and the fact that $\left\{(k+1)^{2}+1\right\} / k^{2}=1+2 / k+2 / k^{2} \rightarrow 1$.
The moral of the proof of Theorem 2.3.9 is that if you want to show that $X_{n} / c_{n} \rightarrow 1$ a.s. for sequences $c_{n}, X_{n} \geq 0$ that are increasing, it is enough to prove the result for a subsequence $n(k)$ that has $c_{n(k+1)} / c_{n(k)} \rightarrow$ 1.

Example 2.3.10. Record values. Let $X_{1}, X_{2}, \ldots$ be a sequence of random variables and think of $X_{k}$ as the distance for an individual's $k$ th high jump or shot-put toss so that $A_{k}=\left\{X_{k}>\sup _{j<k} X_{j}\right\}$ is the event that a record occurs at time $k$. Ignoring the fact that an athlete's performance may get better with more experience or that injuries may occur, we will suppose that $X_{1}, X_{2}, \ldots$ are i.i.d. with a distribution $F(x)$ that is continuous. Even though it may seem that the occurrence of a record at time $k$ will make it less likely that one will occur at time $k+1$, we

Claim. The $A_{k}$ are independent with $P\left(A_{k}\right)=1 / k$.
To prove this, we start by observing that since $F$ is continuous $P\left(X_{j}=\right. \left.X_{k}\right)=0$ for any $j \neq k$ (see Exercise 2.1.5), so we can let $Y_{1}^{n}>Y_{2}^{n}>\cdots> Y_{n}^{n}$ be the random variables $X_{1}, \ldots, X_{n}$ put into decreasing order and define a random permutation of $\{1, \ldots, n\}$ by $\pi_{n}(i)=j$ if $X_{i}=Y_{j}^{n}$, i.e., if the $i$ th random variable has rank $j$. Since the distribution of $\left(X_{1}, \ldots, X_{n}\right)$ is not affected by changing the order of the random variables, it is easy to see:
(a) The permutation $\pi_{n}$ is uniformly distributed over the set of $n!$ possibilities.

Proof of (a) This is "obvious" by symmetry, but if one wants to hear more, we can argue as follows. Let $\pi_{n}$ be the permutation induced by $\left(X_{1}, \ldots, X_{n}\right)$, and let $\sigma_{n}$ be a randomly chosen permutation of $\{1, \ldots, n\}$ independent of the $X$ sequence. Then we can say two things about the permutation induced by $\left(X_{\sigma(1)}, \ldots, X_{\sigma(n)}\right)$ : (i) it is $\pi_{n} \circ \sigma_{n}$, and (ii) it has the same distribution as $\pi_{n}$. The desired result follows now by noting that if $\pi$ is any permutation, $\pi \circ \sigma_{n}$, is uniform over the $n!$ possibilities.

Once you believe (a), the rest is easy:
(b) $P\left(A_{n}\right)=P\left(\pi_{n}(n)=1\right)=1 / n$.
(c) If $m<n$ and $i_{m+1}, \ldots i_{n}$ are distinct elements of $\{1, \ldots, n\}$ then

$$
P\left(A_{m} \mid \pi_{n}(j)=i_{j} \text { for } m+1 \leq j \leq n\right)=1 / m
$$

Intuitively, this is true since if we condition on the ranks of $X_{m+1}, \ldots, X_{n}$ then this determines the set of ranks available for $X_{1}, \ldots, X_{m}$, but all possible orderings of the ranks are equally likely and hence there is probability $1 / m$ that the smallest rank will end up at $m$.

Proof of (c) If we let $\sigma_{m}$ be a randomly chosen permutation of $\{1, \ldots, m\}$ then (i) $\pi_{n} \circ \sigma_{m}$ has the same distribution as $\pi_{n}$, and (ii) since the application of $\sigma_{m}$ randomly rearranges $\pi_{n}(1), \ldots, \pi_{n}(m)$ the desired result follows.

If we let $m_{1}<m_{2} \ldots<m_{k}$ then it follows from (c) that

$$
P\left(A_{m_{1}} \mid A_{m_{2}} \cap \ldots \cap A_{m_{k}}\right)=P\left(A_{m_{1}}\right)
$$

and the claim follows by induction.
Using Theorem 2.3.9 and the by now familiar fact that $\sum_{m=1}^{n} 1 / m \sim \log n$, we have

Theorem 2.3.11. If $R_{n}=\sum_{m=1}^{n} 1_{A_{m}}$ is the number of records at time $n$ then as $n \rightarrow \infty$,

$$
R_{n} / \log n \rightarrow 1 \quad \text { a.s. }
$$

The reader should note that the last result is independent of the distribution $F$ (as long as it is continuous).

Remark. Let $X_{1}, X_{2}, \ldots$ be i.i.d. with a distribution that is continuous. Let $Y_{i}$ be the number of $j \leq i$ with $X_{j}>X_{i}$. It follows from (a) that $Y_{i}$ are independent random variables with $P\left(Y_{i}=j\right)=1 / i$ for $0 \leq j<i-1$.

Comic relief. Let $X_{0}, X_{1}, \ldots$ be i.i.d. and imagine they are the offers you get for a car you are going to sell. Let $N=\inf \left\{n \geq 1: X_{n}>X_{0}\right\}$. Symmetry implies $P(N>n) \geq 1 /(n+1)$. (When the distribution is continuous this probability is exactly $1 /(n+1)$, but our distribution now is general and ties go to the first person who calls.) Using Exercise 2.2.7 now:

$$
E N=\sum_{n=0}^{\infty} P(N>n) \geq \sum_{n=0}^{\infty} \frac{1}{n+1}=\infty
$$

so the expected time you have to wait until you get an offer better than the first one is $\infty$. To avoid lawsuits, let me hasten to add that I am not suggesting that you should take the first offer you get!

Example 2.3.12. Head runs. Let $X_{n}, n \in \mathbf{Z}$, be i.i.d. with $P\left(X_{n}=\right.$ 1) $=P\left(X_{n}=-1\right)=1 / 2$. Let $\ell_{n}=\max \left\{m: X_{n-m+1}=\ldots=X_{n}=1\right\}$ be the length of the run of +1 's at time $n$, and let $L_{n}=\max _{1 \leq m \leq n} \ell_{m}$ be the longest run at time $n$. We use a two-sided sequence so that for all $n$, $P\left(\ell_{n}=k\right)=(1 / 2)^{k+1}$ for $k \geq 0$. Since $\ell_{1}<\infty$, the result we are going to prove

$$
\begin{equation*}
L_{n} / \log _{2} n \rightarrow 1 \quad \text { a.s. } \tag{2.3.1}
\end{equation*}
$$

is also true for a one-sided sequence. To prove (2.3.1), we begin by observing

$$
P\left(\ell_{n} \geq(1+\epsilon) \log _{2} n\right) \leq n^{-(1+\epsilon)}
$$

for any $\epsilon>0$, so it follows from the Borel-Cantelli lemma that $\ell_{n} \leq (1+\epsilon) \log _{2} n$ for $n \geq N_{\epsilon}$. Since $\epsilon$ is arbitrary, it follows that

$$
\limsup _{n \rightarrow \infty} L_{n} / \log _{2} n \leq 1 \quad \text { a.s. }
$$

To get a result in the other direction, we break the first $n$ trials into disjoint blocks of length $\left[(1-\epsilon) \log _{2} n\right]+1$, on which the variables are all 1 with probability

$$
2^{-\left[(1-\epsilon) \log _{2} n\right]-1} \geq n^{-(1-\epsilon)} / 2
$$

to conclude that if $n$ is large enough so that $\left[n /\left\{\left[(1-\epsilon) \log _{2} n\right]+1\right\}\right] \geq n / \log _{2} n$

$$
P\left(L_{n} \leq(1-\epsilon) \log _{2} n\right) \leq\left(1-n^{-(1-\epsilon)} / 2\right)^{n /\left(\log _{2} n\right)} \leq \exp \left(-n^{\epsilon} / 2 \log _{2} n\right)
$$

which is summable, so the Borel-Cantelli lemma implies

$$
\liminf _{n \rightarrow \infty} L_{n} / \log _{2} n \geq 1 \quad \text { a.s. }
$$

Exercise 2.3.3. Let $\ell_{n}$ be the length of the head run at time. See Example 8.3.1 for the precise definition. Show that $\limsup _{n \rightarrow \infty} \ell_{n} / \log _{2} n=1$, $\liminf _{n \rightarrow \infty} \ell_{n}=0$ a.s.

Exercises
2.3.4. Fatou's lemma. Suppose $X_{n} \geq 0$ and $X_{n} \rightarrow X$ in probability. Show that $\liminf _{n \rightarrow \infty} E X_{n} \geq E X$.
2.3.5. Dominated convergence. Suppose $X_{n} \rightarrow X$ in probability and (a) $\left|X_{n}\right| \leq Y$ with $E Y<\infty$ or (b) there is a continuous function $g$ with $g(x)>0$ for large $x$ with $|x| / g(x) \rightarrow 0$ as $|x| \rightarrow \infty$ so that $E g\left(X_{n}\right) \leq C<\infty$ for all $n$. Show that $E X_{n} \rightarrow E X$.
2.3.6. Metric for convergence in probability. Show (a) that $d(X, Y)= E(|X-Y| /(1+|X-Y|))$ defines a metric on the set of random variables, i.e., (i) $d(X, Y)=0$ if and only if $X=Y$ a.s., (ii) $d(X, Y)=d(Y, X)$, (iii) $d(X, Z) \leq d(X, Y)+d(Y, Z)$ and (b) that $d\left(X_{n}, X\right) \rightarrow 0$ as $n \rightarrow \infty$ if and only if $X_{n} \rightarrow X$ in probability.
2.3.7. Show that random variables are a complete space under the metric defined in the previous exercise, i.e., if $d\left(X_{m}, X_{n}\right) \rightarrow 0$ whenever $m$, $n \rightarrow \infty$ then there is a r.v. $X_{\infty}$ so that $X_{n} \rightarrow X_{\infty}$ in probability.
2.3.8. Let $A_{n}$ be a sequence of independent events with $P\left(A_{n}\right)<1$ for all $n$. Show that $P\left(\cup A_{n}\right)=1$ implies $\sum_{n} P\left(A_{n}\right)=\infty$ and hence $P\left(A_{n}\right.$ i.o. $)=1$.
2.3.9. (i) If $P\left(A_{n}\right) \rightarrow 0$ and $\sum_{n=1}^{\infty} P\left(A_{n}^{c} \cap A_{n+1}\right)<\infty$ then $P\left(A_{n}\right.$ i.o. $)=$ 0 . (ii) Find an example of a sequence $A_{n}$ to which the result in (i) can be applied but the Borel-Cantelli lemma cannot.
2.3.10. Kochen-Stone lemma. Suppose $\sum P\left(A_{k}\right)=\infty$. Use Exercises 1.6.6 and 2.3.1 to show that if

$$
\limsup _{n \rightarrow \infty}\left(\sum_{k=1}^{n} P\left(A_{k}\right)\right)^{2} /\left(\sum_{1 \leq j, k \leq n} P\left(A_{j} \cap A_{k}\right)\right)=\alpha>0
$$

then $P\left(A_{n}\right.$ i.o. $) \geq \alpha$. The case $\alpha=1$ contains Theorem 2.3.7.
2.3.11. Let $X_{1}, X_{2}, \ldots$ be independent with $P\left(X_{n}=1\right)=p_{n}$ and $P\left(X_{n}=\right. 0)=1-p_{n}$. Show that (i) $X_{n} \rightarrow 0$ in probability if and only if $p_{n} \rightarrow 0$, and (ii) $X_{n} \rightarrow 0$ a.s. if and only if $\sum p_{n}<\infty$.
2.3.12. Let $X_{1}, X_{2}, \ldots$ be a sequence of r.v.'s on ( $\Omega, \mathcal{F}, P$ ) where $\Omega$ is a countable set and $\mathcal{F}$ consists of all subsets of $\Omega$. Show that $X_{n} \rightarrow X$ in probability implies $X_{n} \rightarrow X$ a.s.
2.3.13. If $X_{n}$ is any sequence of random variables, there are constants $c_{n} \rightarrow \infty$ so that $X_{n} / c_{n} \rightarrow 0$ a.s.
2.3.14. Let $X_{1}, X_{2}, \ldots$ be independent. Show that $\sup X_{n}<\infty$ a.s. if and only if $\sum_{n} P\left(X_{n}>A\right)<\infty$ for some $A$.
2.3.15. Let $X_{1}, X_{2} \ldots$ be i.i.d. with $P\left(X_{i}>x\right)=e^{-x}$, let $M_{n}= \max _{1 \leq m \leq n} X_{m}$. Show that (i) $\limsup _{n \rightarrow \infty} X_{n} / \log n=1$ a.s. and (ii) $M_{n} / \log n \rightarrow 1$ a.s.
2.3.16. Let $X_{1}, X_{2}, \ldots$ be i.i.d. with distribution $F$, let $\lambda_{n} \uparrow \infty$, and let $A_{n}=\left\{\max _{1 \leq m \leq n} X_{m}>\lambda_{n}\right\}$. Show that $P\left(A_{n}\right.$ i.o. $)=0$ or 1 according as $\sum_{n \geq 1}\left(1-F\left(\lambda_{n}\right)\right)<\infty$ or $=\infty$.
2.3.17. Let $Y_{1}, Y_{2}, \ldots$ be i.i.d. Find necessary and sufficient conditions for
(i) $Y_{n} / n \rightarrow 0$ almost surely, (ii) $\left(\max _{m \leq n} Y_{m}\right) / n \rightarrow 0$ almost surely, (iii) $\left(\max _{m \leq n} Y_{m}\right) / n \rightarrow 0$ in probability, and (iv) $Y_{n} / n \rightarrow 0$ in probability.
2.3.18. Let $0 \leq X_{1} \leq X_{2} \ldots$ be random variables with $E X_{n} \sim a n^{\alpha}$ with $a, \alpha>0$, and $\operatorname{var}\left(X_{n}\right) \leq B n^{\beta}$ with $\beta<2 \alpha$. Show that $X_{n} / n^{\alpha} \rightarrow a$ a.s.
2.3.19. Let $X_{n}$ be independent Poisson r.v.'s with $E X_{n}=\lambda_{n}$, and let $S_{n}=X_{1}+\cdots+X_{n}$. Show that if $\sum \lambda_{n}=\infty$ then $S_{n} / E S_{n} \rightarrow 1$ a.s.
2.3.20. Show that if $X_{n}$ is the outcome of the $n$th play of the St. Petersburg game (Example 2.2.16) then $\limsup _{n \rightarrow \infty} X_{n} /\left(n \log _{2} n\right)=\infty$ a.s. and hence the same result holds for $S_{n}$. This shows that the convergence $S_{n} /\left(n \log _{2} n\right) \rightarrow 1$ in probability proved in Section 2.2 does not occur a.s.

### 2.4 Strong Law of Large Numbers

We are now ready to give Etemadi's (1981) proof of
Theorem 2.4.1. Strong law of large numbers. Let $X_{1}, X_{2}, \ldots$ be pairwise independent identically distributed random variables with $E\left|X_{i}\right|< \infty$. Let $E X_{i}=\mu$ and $S_{n}=X_{1}+\ldots+X_{n}$. Then $S_{n} / n \rightarrow \mu$ a.s. as $n \rightarrow \infty$.

Proof. As in the proof of the weak law of large numbers, we begin by truncating.
Lemma 2.4.2. Let $Y_{k}=X_{k} 1_{\left(\left|X_{k}\right| \leq k\right)}$ and $T_{n}=Y_{1}+\cdots+Y_{n}$. It is sufficient to prove that $T_{n} / n \rightarrow \mu$ a.s.
Proof. $\sum_{k=1}^{\infty} P\left(\left|X_{k}\right|>k\right) \leq \int_{0}^{\infty} P\left(\left|X_{1}\right|>t\right) d t=E\left|X_{1}\right|<\infty$ so $P\left(X_{k} \neq\right. Y_{k}$ i.o. $)=0$. This shows that $\left|S_{n}(\omega)-T_{n}(\omega)\right| \leq R(\omega)<\infty$ a.s. for all $n$, from which the desired result follows.

The second step is not so intuitive, but it is an important part of this proof and the one given in Section 2.5.
Lemma 2.4.3. $\sum_{k=1}^{\infty} \operatorname{var}\left(Y_{k}\right) / k^{2} \leq 4 E\left|X_{1}\right|<\infty$.
Proof. To bound the sum, we observe

$$
\operatorname{var}\left(Y_{k}\right) \leq E\left(Y_{k}^{2}\right)=\int_{0}^{\infty} 2 y P\left(\left|Y_{k}\right|>y\right) d y \leq \int_{0}^{k} 2 y P\left(\left|X_{1}\right|>y\right) d y
$$

so using Fubini's theorem (since everything is $\geq 0$ and the sum is just an integral with respect to counting measure on $\{1,2, \ldots\}$ )

$$
\begin{aligned}
\sum_{k=1}^{\infty} E\left(Y_{k}^{2}\right) / k^{2} & \leq \sum_{k=1}^{\infty} k^{-2} \int_{0}^{\infty} 1_{(y<k)} 2 y P\left(\left|X_{1}\right|>y\right) d y \\
& =\int_{0}^{\infty}\left\{\sum_{k=1}^{\infty} k^{-2} 1_{(y<k)}\right\} 2 y P\left(\left|X_{1}\right|>y\right) d y
\end{aligned}
$$

Since $E\left|X_{1}\right|=\int_{0}^{\infty} P\left(\left|X_{1}\right|>y\right) d y$, we can complete the proof by showing
Lemma 2.4.4. If $y \geq 0$ then $2 y \sum_{k>y} k^{-2} \leq 4$.

Proof. We begin with the observation that if $m \geq 2$ then

$$
\sum_{k \geq m} k^{-2} \leq \int_{m-1}^{\infty} x^{-2} d x=(m-1)^{-1}
$$

When $y \geq 1$, the sum starts with $k=[y]+1 \geq 2$, so

$$
2 y \sum_{k>y} k^{-2} \leq 2 y /[y] \leq 4
$$

since $y /[y] \leq 2$ for $y \geq 1$ (the worst case being $y$ close to 2 ). To cover $0 \leq y<1$, we note that in this case

$$
2 y \sum_{k>y} k^{-2} \leq 2\left(1+\sum_{k=2}^{\infty} k^{-2}\right) \leq 4
$$

This establishes Lemma 2.4.4 which completes the proof of Lemma 2.4.3 and of the theorem.

The first two steps, Lemmas 2.4.2 and 2.4.3 above, are standard. Etemadi's inspiration was that since $X_{n}^{+}, n \geq 1$, and $X_{n}^{-}, n \geq 1$, satisfy the assumptions of the theorem and $X_{n}=X_{n}^{+}-X_{n}^{-}$, we can without loss of generality suppose $X_{n} \geq 0$. As in the proof of Theorem 2.3.9, we will prove the result first for a subsequence and then use monotonicity to control the values in between. This time, however, we let $\alpha>1$ and $k(n)=\left[\alpha^{n}\right]$. Chebyshev's inequality implies that if $\epsilon>0$

$$
\begin{aligned}
& \sum_{n=1}^{\infty} P\left(\left|T_{k(n)}-E T_{k(n)}\right|>\epsilon k(n)\right) \leq \epsilon^{-2} \sum_{n=1}^{\infty} \operatorname{var}\left(T_{k(n)}\right) / k(n)^{2} \\
& \quad=\epsilon^{-2} \sum_{n=1}^{\infty} k(n)^{-2} \sum_{m=1}^{k(n)} \operatorname{var}\left(Y_{m}\right)=\epsilon^{-2} \sum_{m=1}^{\infty} \operatorname{var}\left(Y_{m}\right) \sum_{n: k(n) \geq m} k(n)^{-2}
\end{aligned}
$$

where we have used Fubini's theorem to interchange the two summations of nonnegative terms. Now $k(n)=\left[\alpha^{n}\right]$ and $\left[\alpha^{n}\right] \geq \alpha^{n} / 2$ for $n \geq 1$, so summing the geometric series and noting that the first term is $\leq m^{-2}$ :

$$
\sum_{n: \alpha^{n} \geq m}\left[\alpha^{n}\right]^{-2} \leq 4 \sum_{n: \alpha^{n} \geq m} \alpha^{-2 n} \leq 4\left(1-\alpha^{-2}\right)^{-1} m^{-2}
$$

Combining our computations shows

$$
\sum_{n=1}^{\infty} P\left(\left|T_{k(n)}-E T_{k(n)}\right|>\epsilon k(n)\right) \leq 4\left(1-\alpha^{-2}\right)^{-1} \epsilon^{-2} \sum_{m=1}^{\infty} E\left(Y_{m}^{2}\right) m^{-2}<\infty
$$

by Lemma 2.4.3. Since $\epsilon$ is arbitrary $\left(T_{k(n)}-E T_{k(n)}\right) / k(n) \rightarrow 0$ a.s. The dominated convergence theorem implies $E Y_{k} \rightarrow E X_{1}$ as $k \rightarrow \infty$,
so $E T_{k(n)} / k(n) \rightarrow E X_{1}$ and we have shown $T_{k(n)} / k(n) \rightarrow E X_{1}$ a.s. To handle the intermediate values, we observe that if $k(n) \leq m<k(n+1)$

$$
\frac{T_{k(n)}}{k(n+1)} \leq \frac{T_{m}}{m} \leq \frac{T_{k(n+1)}}{k(n)}
$$

(here we use $Y_{i} \geq 0$ ), so recalling $k(n)=\left[\alpha^{n}\right]$, we have $k(n+1) / k(n) \rightarrow \alpha$ and

$$
\frac{1}{\alpha} E X_{1} \leq \liminf _{n \rightarrow \infty} T_{m} / m \leq \limsup _{m \rightarrow \infty} T_{m} / m \leq \alpha E X_{1}
$$

Since $\alpha>1$ is arbitrary, the proof is complete.
The next result shows that the strong law holds whenever $E X_{i}$ exists.
Theorem 2.4.5. Let $X_{1}, X_{2}, \ldots$ be i.i.d. with $E X_{i}^{+}=\infty$ and $E X_{i}^{-}<\infty$. If $S_{n}=X_{1}+\cdots+X_{n}$ then $S_{n} / n \rightarrow \infty$ a.s.
Proof. Let $M>0$ and $X_{i}^{M}=X_{i} \wedge M$. The $X_{i}^{M}$ are i.i.d. with $E\left|X_{i}^{M}\right|< \infty$, so if $S_{n}^{M}=X_{1}^{M}+\cdots+X_{n}^{M}$ then Theorem 2.4.1 implies $S_{n}^{M} / n \rightarrow E X_{i}^{M}$. Since $X_{i} \geq X_{i}^{M}$, it follows that

$$
\liminf _{n \rightarrow \infty} S_{n} / n \geq \lim _{n \rightarrow \infty} S_{n}^{M} / n=E X_{i}^{M}
$$

The monotone convergence theorem implies $E\left(X_{i}^{M}\right)^{+} \uparrow E X_{i}^{+}=\infty$ as $M \uparrow \infty$, so $E X_{i}^{M}=E\left(X_{i}^{M}\right)^{+}-E\left(X_{i}^{M}\right)^{-} \uparrow \infty$, and we have $\liminf _{n \rightarrow \infty} S_{n} / n \geq \infty$, which implies the desired result.

The rest of this section is devoted to applications of the strong law of large numbers.

Example 2.4.6. Renewal theory. Let $X_{1}, X_{2}, \ldots$ be i.i.d. with $0< X_{i}<\infty$. Let $T_{n}=X_{1}+\ldots+X_{n}$ and think of $T_{n}$ as the time of $n$th occurrence of some event. For a concrete situation, consider a diligent janitor who replaces a light bulb the instant it burns out. Suppose the first bulb is put in at time 0 and let $X_{i}$ be the lifetime of the $i$ th light bulb. In this interpretation, $T_{n}$ is the time the $n$th light bulb burns out and $N_{t}=\sup \left\{n: T_{n} \leq t\right\}$ is the number of light bulbs that have burnt out by time $t$.

Theorem 2.4.7. If $E X_{1}=\mu \leq \infty$ then as $t \rightarrow \infty$,

$$
N_{t} / t \rightarrow 1 / \mu \quad \text { a.s. } \quad(1 / \infty=0)
$$

Proof. By Theorems 2.4.1 and 2.4.5, $T_{n} / n \rightarrow \mu$ a.s. From the definition of $N_{t}$, it follows that $T\left(N_{t}\right) \leq t<T\left(N_{t}+1\right)$, so dividing through by $N_{t}$ gives

$$
\frac{T\left(N_{t}\right)}{N_{t}} \leq \frac{t}{N_{t}} \leq \frac{T\left(N_{t}+1\right)}{N_{t}+1} \cdot \frac{N_{t}+1}{N_{t}}
$$

To take the limit, we note that since $T_{n}<\infty$ for all $n$, we have $N_{t} \uparrow \infty$ as $t \rightarrow \infty$. The strong law of large numbers implies that for $\omega \in \Omega_{0}$ with $P\left(\Omega_{0}\right)=1$, we have $T_{n}(\omega) / n \rightarrow \mu, N_{t}(\omega) \uparrow \infty$, and hence

$$
\frac{T_{N_{t}(\omega)}(\omega)}{N_{t}(\omega)} \rightarrow \mu \quad \frac{N_{t}(\omega)+1}{N_{t}(\omega)} \rightarrow 1
$$

From this it follows that for $\omega \in \Omega_{0}$ that $t / N_{t}(\omega) \rightarrow \mu$ a.s.
The last argument shows that if $X_{n} \rightarrow X_{\infty}$ a.s. and $N(n) \rightarrow \infty$ a.s. then $X_{N(n)} \rightarrow X_{\infty}$ a.s. We have written this out with care because the analogous result for convergence in probability is false. If $X_{n} \in\{0,1\}$ are independent with $P(X=1)=a_{n} \rightarrow 0$ and $\sum_{n} a_{n}=\infty$, then $X_{n} \rightarrow 0$ in probability, but if we let $N(n)=\inf \left\{m \geq n: X_{m}=1\right\}$ then $X_{N(n)}=1$ a.s.

Example 2.4.8. Empirical distribution functions. Let $X_{1}, X_{2}, \ldots$ be i.i.d. with distribution $F$ and let

$$
F_{n}(x)=n^{-1} \sum_{m=1}^{n} 1_{\left(X_{m} \leq x\right)}
$$

$F_{n}(x)=$ the observed frequency of values that are $\leq x$, hence the name given above. The next result shows that $F_{n}$ converges uniformly to $F$ as $n \rightarrow \infty$.

Theorem 2.4.9. The Glivenko-Cantelli theorem. As $n \rightarrow \infty$,

$$
\sup _{x}\left|F_{n}(x)-F(x)\right| \rightarrow 0 \quad \text { a.s. }
$$

Proof. Fix $x$ and let $Y_{n}=1_{\left(X_{n} \leq x\right)}$. Since the $Y_{n}$ are i.i.d. with $E Y_{n}= P\left(X_{n} \leq x\right)=F(x)$, the strong law of large numbers implies that $F_{n}(x)= n^{-1} \sum_{m=1}^{n} Y_{m} \rightarrow F(x)$ a.s. In general, if $F_{n}$ is a sequence of nondecreasing functions that converges pointwise to a bounded and continuous limit $F$ then $\sup _{x}\left|F_{n}(x)-F(x)\right| \rightarrow 0$. However, the distribution function $F(x)$ may have jumps, so we have to work a little harder.

Again, fix $x$ and let $Z_{n}=1_{\left(X_{n}<x\right)}$. Since the $Z_{n}$ are i.i.d. with $E Z_{n}= P\left(X_{n}<x\right)=F(x-)=\lim _{y \uparrow x} F(y)$, the strong law of large numbers implies that $F_{n}(x-)=n^{-1} \sum_{m=1}^{n} Z_{m} \rightarrow F(x-)$ a.s. For $1 \leq j \leq k-1$ let $x_{j, k}=\inf \{y: F(y) \geq j / k\}$. The pointwise convergence of $F_{n}(x)$ and $F_{n}(x-)$ imply that we can pick $N_{k}(\omega)$ so that if $n \geq N_{k}(\omega)$ then

$$
\left|F_{n}\left(x_{j, k}\right)-F\left(x_{j, k}\right)\right|<k^{-1} \quad \text { and } \quad\left|F_{n}\left(x_{j, k}-\right)-F\left(x_{j, k}-\right)\right|<k^{-1}
$$

for $1 \leq j \leq k-1$. If we let $x_{0, k}=-\infty$ and $x_{k, k}=\infty$, then the last two inequalities hold for $j=0$ or $k$. If $x \in\left(x_{j-1, k}, x_{j, k}\right)$ with $1 \leq$
$j \leq k$ and $n \geq N_{k}(\omega)$, then using the monotonicity of $F_{n}$ and $F$, and $F\left(x_{j, k}-\right)-F\left(x_{j-1, k}\right) \leq k^{-1}$, we have
$F_{n}(x) \leq F_{n}\left(x_{j, k}-\right) \leq F\left(x_{j, k}-\right)+k^{-1} \leq F\left(x_{j-1, k}\right)+2 k^{-1} \leq F(x)+2 k^{-1}$
$F_{n}(x) \geq F_{n}\left(x_{j-1, k}\right) \geq F\left(x_{j-1, k}\right)-k^{-1} \geq F\left(x_{j, k}-\right)-2 k^{-1} \geq F(x)-2 k^{-1}$
so $\sup _{x}\left|F_{n}(x)-F(x)\right| \leq 2 k^{-1}$, and we have proved the result.
Example 2.4.10. Shannon's theorem. Let $X_{1}, X_{2}, \ldots \in\{1, \ldots, r\}$ be independent with $P\left(X_{i}=k\right)=p(k)>0$ for $1 \leq k \leq r$. Here we are thinking of $1, \ldots, r$ as the letters of an alphabet, and $X_{1}, X_{2}, \ldots$ are the successive letters produced by an information source. In this i.i.d. case, it is the proverbial monkey at a typewriter. Let $\pi_{n}(\omega)= p\left(X_{1}(\omega)\right) \cdots p\left(X_{n}(\omega)\right)$ be the probability of the realization we observed in the first $n$ trials. Since $\log \pi_{n}(\omega)$ is a sum of independent random variables, it follows from the strong law of large numbers that

$$
-n^{-1} \log \pi_{n}(\omega) \rightarrow H \equiv-\sum_{k=1}^{r} p(k) \log p(k) \text { a.s. }
$$

The constant $H$ is called the entropy of the source and is a measure of how random it is. The last result is the asymptotic equipartition property: If $\epsilon>0$ then as $n \rightarrow \infty$

$$
P\left\{\exp (-n(H+\epsilon)) \leq \pi_{n}(\omega) \leq \exp (-n(H-\epsilon)\} \rightarrow 1\right.
$$

## Exercises

2.4.1. Lazy janitor. Suppose the $i$ th light bulb burns for an amount of time $X_{i}$ and then remains burned out for time $Y_{i}$ before being replaced. Suppose the $X_{i}, Y_{i}$ are positive and independent with the $X$ 's having distribution $F$ and the $Y$ 's having distribution $G$, both of which have finite mean. Let $R_{t}$ be the amount of time in $[0, t]$ that we have a working light bulb. Show that $R_{t} / t \rightarrow E X_{i} /\left(E X_{i}+E Y_{i}\right)$ almost surely.
2.4.2. Let $X_{0}=(1,0)$ and define $X_{n} \in \mathbf{R}^{2}$ inductively by declaring that $X_{n+1}$ is chosen at random from the ball of radius $\left|X_{n}\right|$ centered at the origin, i.e., $X_{n+1} /\left|X_{n}\right|$ is uniformly distributed on the ball of radius 1 and independent of $X_{1}, \ldots, X_{n}$. Prove that $n^{-1} \log \left|X_{n}\right| \rightarrow c$ a.s. and compute $c$.
2.4.3. Investment problem. We assume that at the beginning of each year you can buy bonds for $\$ 1$ that are worth $\$ a$ at the end of the year or stocks that are worth a random amount $V \geq 0$. If you always invest a fixed proportion $p$ of your wealth in bonds, then your wealth at the end of year $n+1$ is $W_{n+1}=\left(a p+(1-p) V_{n}\right) W_{n}$. Suppose $V_{1}, V_{2}, \ldots$ are i.i.d. with $E V_{n}^{2}<\infty$ and $E\left(V_{n}^{-2}\right)<\infty$. (i) Show that $n^{-1} \log W_{n} \rightarrow c(p)$
a.s. (ii) Show that $c(p)$ is concave. [Use Theorem A.5.1 in the Appendix to justify differentiating under the expected value.] (iii) By investigating $c^{\prime}(0)$ and $c^{\prime}(1)$, give conditions on $V$ that guarantee that the optimal choice of $p$ is in ( 0,1 ). (iv) Suppose $P(V=1)=P(V=4)=1 / 2$. Find the optimal $p$ as a function of $a$.

### 2.5 Convergence of Random Series*

In this section, we will pursue a second approach to the strong law of large numbers based on the convergence of random series. This approach has the advantage that it leads to estimates on the rate of convergence under moment assumptions, Theorems 2.5.11 and 2.5.12, and to a negative result for the infinite mean case, Theorem 2.5.13, which is stronger than the one in Theorem 2.3.8. The first two results in this section are of considerable interest in their own right, although we will see more general versions in Lemma 3.1.1 and Theorem 3.4.2.

To state the first result, we need some notation. Let $\mathcal{F}_{n}^{\prime}=\sigma\left(X_{n}, X_{n+1}, \ldots\right) =$ the future after time $n=$ the smallest $\sigma$-field with respect to which all the $X_{m}, m \geq n$ are measurable. Let $\mathcal{T}=\cap_{n} \mathcal{F}_{n}^{\prime}=$ the remote future, or tail $\sigma$-field. Intuitively, $A \in \mathcal{T}$ if and only if changing a finite number of values does not affect the occurrence of the event. As usual, we turn to examples to help explain the definition.

Example 2.5.1. If $B_{n} \in \mathcal{R}$ then $\left\{X_{n} \in B_{n}\right.$ i.o. $\} \in \mathcal{T}$. If we let $X_{n}=1_{A_{n}}$ and $B_{n}=\{1\}$, this example becomes $\left\{A_{n}\right.$ i.o. $\}$.

Example 2.5.2. Let $S_{n}=X_{1}+\ldots+X_{n}$. It is easy to check that $\left\{\lim _{n \rightarrow \infty} S_{n}\right.$ exists $\} \in \mathcal{T}$, $\left\{\limsup _{n \rightarrow \infty} S_{n}>0\right\} \notin \mathcal{T}$, $\left\{\limsup _{n \rightarrow \infty} S_{n} / c_{n}>x\right\} \in \mathcal{T}$ if $c_{n} \rightarrow \infty$.

The next result shows that all examples are trivial.
Theorem 2.5.3. Kolmogorov's $\mathbf{0 - 1}$ law. If $X_{1}, X_{2}, \ldots$ are independent and $A \in \mathcal{T}$ then $P(A)=0$ or 1 .

Proof. We will show that $A$ is independent of itself, that is, $P(A \cap A)= P(A) P(A)$, so $P(A)=P(A)^{2}$, and hence $P(A)=0$ or 1 . We will sneak up on this conclusion in two steps:
(a) $A \in \sigma\left(X_{1}, \ldots, X_{k}\right)$ and $B \in \sigma\left(X_{k+1}, X_{k+2}, \ldots\right)$ are independent.

Proof of (a). If $B \in \sigma\left(X_{k+1}, \ldots, X_{k+j}\right)$ for some $j$, this follows from Theorem 2.1.9. Since $\sigma\left(X_{1}, \ldots, X_{k}\right)$ and $\cup_{j} \sigma\left(X_{k+1}, \ldots, X_{k+j}\right)$ are $\pi$-systems that contain $\Omega$ (a) follows from Theorem 2.1.7.
(b) $A \in \sigma\left(X_{1}, X_{2}, \ldots\right)$ and $B \in \mathcal{T}$ are independent.

Proof of (b). Since $\mathcal{T} \subset \sigma\left(X_{k+1}, X_{k+2}, \ldots\right)$, if $A \in \sigma\left(X_{1}, \ldots, X_{k}\right)$ for some $k$, this follows from (a). $\cup_{k} \sigma\left(X_{1}, \ldots, X_{k}\right)$ and $\mathcal{T}$ are $\pi$-systems that contain $\Omega$, so (b) follows from Theorem 2.1.7.

Since $\mathcal{T} \subset \sigma\left(X_{1}, X_{2}, \ldots\right)$, (b) implies an $A \in \mathcal{T}$ is independent of itself and Theorem 2.5.3 follows.

Before taking up our main topic, we will prove a $0-1$ law that, in the i.i.d. case, generalizes Kolmogorov's. To state the new $0-1$ law we need two definitions. A finite permutation of $\mathbf{N}=\{1,2, \ldots\}$ is a map $\pi$ from $\mathbf{N}$ onto $\mathbf{N}$ so that $\pi(i) \neq i$ for only finitely many $i$. If $\pi$ is a finite permutation of $\mathbf{N}$ and $\omega \in S^{\mathbf{N}}$ we define $(\pi \omega)_{i}=\omega_{\pi(i)}$. In words, the coordinates of $\omega$ are rearranged according to $\pi$. Since $X_{i}(\omega)=\omega_{i}$ this is the same as rearranging the random variables. An event $A$ is permutable if $\pi^{-1} A \equiv\{\omega: \pi \omega \in A\}$ is equal to $A$ for any finite permutation $\pi$, or in other words, if its occurrence is not affected by rearranging finitely many of the random variables. The collection of permutable events is a $\sigma$-field. It is called the exchangeable $\sigma$-field and denoted by $\mathcal{E}$.

To see the reason for interest in permutable events, suppose $S=\mathbf{R}$ and let $S_{n}(\omega)=X_{1}(\omega)+\cdots+X_{n}(\omega)$. Two examples of permutable events are
(i) $\left\{\omega: S_{n}(\omega) \in B\right.$ i.o. $\}$
(ii) $\left\{\omega: \lim \sup _{n \rightarrow \infty} S_{n}(\omega) / c_{n} \geq 1\right\}$

In each case, the event is permutable because $S_{n}(\omega)=S_{n}(\pi \omega)$ for large $n$. The list of examples can be enlarged considerably by observing:
(iii) All events in the tail $\sigma$-field $\mathcal{T}$ are permutable.

To see this, observe that if $A \in \sigma\left(X_{n+1}, X_{n+2}, \ldots\right)$ then the occurrence of $A$ is unaffected by a permutation of $X_{1}, \ldots, X_{n}$. (i) shows that the converse of (iii) is false. The next result shows that for an i.i.d. sequence there is no difference between $\mathcal{E}$ and $\mathcal{T}$. They are both trivial.

Theorem 2.5.4. Hewitt-Savage 0-1 law. If $X_{1}, X_{2}, \ldots$ are i.i.d. and $A \in \mathcal{E}$ then $P(A) \in\{0,1\}$.

Proof. Let $A \in \mathcal{E}$. As in the proof of Kolmogorov's 0-1 law, we will show $A$ is independent of itself, i.e., $P(A)=P(A \cap A)=P(A) P(A)$ so $P(A) \in\{0,1\}$. Let $A_{n} \in \sigma\left(X_{1}, \ldots, X_{n}\right)$ so that

$$
\begin{equation*}
P\left(A_{n} \Delta A\right) \rightarrow 0 \tag{a}
\end{equation*}
$$

Here $A \Delta B=(A-B) \cup(B-A)$ is the symmetric difference. The existence of the $A_{n}$ 's is proved in part ii of Lemma A.2.1. $A_{n}$ can be written as
$\left\{\omega:\left(\omega_{1}, \ldots, \omega_{n}\right) \in B_{n}\right\}$ with $B_{n} \in \mathcal{S}^{n}$. Let

$$
\pi(j)= \begin{cases}j+n & \text { if } 1 \leq j \leq n \\ j-n & \text { if } n+1 \leq j \leq 2 n \\ j & \text { if } j \geq 2 n+1\end{cases}
$$

Observing that $\pi^{2}$ is the identity (so we don't have to worry about whether to write $\pi$ or $\pi^{-1}$ ) and the coordinates are i.i.d. (so the permuted coordinates are) gives

$$
\begin{equation*}
P\left(\omega: \omega \in A_{n} \Delta A\right)=P\left(\omega: \pi \omega \in A_{n} \Delta A\right) \tag{b}
\end{equation*}
$$

Now $\{\omega: \pi \omega \in A\}=\{\omega: \omega \in A\}$, since $A$ is permutable, and

$$
\left\{\omega: \pi \omega \in A_{n}\right\}=\left\{\omega:\left(\omega_{n+1}, \ldots, \omega_{2 n}\right) \in B_{n}\right\}
$$

If we use $A_{n}^{\prime}$ to denote the last event then we have

$$
\begin{equation*}
\left\{\omega: \pi \omega \in A_{n} \Delta A\right\}=\left\{\omega: \omega \in A_{n}^{\prime} \Delta A\right\} \tag{c}
\end{equation*}
$$

Combining (b) and (c) gives

$$
\begin{equation*}
P\left(A_{n} \Delta A\right)=P\left(A_{n}^{\prime} \Delta A\right) \tag{d}
\end{equation*}
$$

It is easy to see that

$$
|P(B)-P(C)| \leq \mid P(B \Delta C \mid
$$

so (d) implies $P\left(A_{n}\right), P\left(A_{n}^{\prime}\right) \rightarrow P(A)$. Now $A-C \subset(A-B) \cup(B-C)$ and with a similar inequality for $C-A$ implies $A \Delta C \subset(A \Delta B) \cup(B \Delta C)$. The last inequality, (d), and (a) imply

$$
P\left(A_{n} \Delta A_{n}^{\prime}\right) \leq P\left(A_{n} \Delta A\right)+P\left(A \Delta A_{n}^{\prime}\right) \rightarrow 0
$$

The last result implies

$$
\begin{aligned}
0 & \leq P\left(A_{n}\right)-P\left(A_{n} \cap A_{n}^{\prime}\right) \\
& \leq P\left(A_{n} \cup A_{n}^{\prime}\right)-P\left(A_{n} \cap A_{n}^{\prime}\right)=P\left(A_{n} \Delta A_{n}^{\prime}\right) \rightarrow 0
\end{aligned}
$$

so $P\left(A_{n} \cap A_{n}^{\prime}\right) \rightarrow P(A)$. But $A_{n}$ and $A_{n}^{\prime}$ are independent, so

$$
P\left(A_{n} \cap A_{n}^{\prime}\right)=P\left(A_{n}\right) P\left(A_{n}^{\prime}\right) \rightarrow P(A)^{2}
$$

This shows $P(A)=P(A)^{2}$, and proves Theorem 2.5.4.
If $A_{1}, A_{2}, \ldots$ are independent then Theorem 2.5.3 implies $P\left(A_{n}\right.$ i.o. $)=$ 0 or 1. Applying Theorem 2.5.3 to Example 2.5.2 gives $P\left(\lim _{n \rightarrow \infty} S_{n}\right.$ exists $)=$ 0 or 1 . The next result will help us prove the probability is 1 in certain situations.

Theorem 2.5.5. Kolmogorov's maximal inequality. Suppose $X_{1}, \ldots, X_{n}$ are independent with $E X_{i}=0$ and var $\left(X_{i}\right)<\infty$. If $S_{n}=X_{1}+\cdots+X_{n}$ then

$$
P\left(\max _{1 \leq k \leq n}\left|S_{k}\right| \geq x\right) \leq x^{-2} \operatorname{var}\left(S_{n}\right)
$$

Remark. Under the same hypotheses, Chebyshev's inequality (Theorem 1.6.4) gives only

$$
P\left(\left|S_{n}\right| \geq x\right) \leq x^{-2} \operatorname{var}\left(S_{n}\right)
$$

Proof. Let $A_{k}=\left\{\left|S_{k}\right| \geq x\right.$ but $\left|S_{j}\right|<x$ for $\left.j<k\right\}$, i.e., we break things down according to the time that $\left|S_{k}\right|$ first exceeds $x$. Since the $A_{k}$ are disjoint and $\left(S_{n}-S_{k}\right)^{2} \geq 0$,

$$
\begin{aligned}
E S_{n}^{2} & \geq \sum_{k=1}^{n} \int_{A_{k}} S_{n}^{2} d P=\sum_{k=1}^{n} \int_{A_{k}} S_{k}^{2}+2 S_{k}\left(S_{n}-S_{k}\right)+\left(S_{n}-S_{k}\right)^{2} d P \\
& \geq \sum_{k=1}^{n} \int_{A_{k}} S_{k}^{2} d P+\sum_{k=1}^{n} \int 2 S_{k} 1_{A_{k}} \cdot\left(S_{n}-S_{k}\right) d P
\end{aligned}
$$

$S_{k} 1_{A_{k}} \in \sigma\left(X_{1}, \ldots, X_{k}\right)$ and $S_{n}-S_{k} \in \sigma\left(X_{k+1}, \ldots, X_{n}\right)$ are independent by Theorem 2.1.10, so using Theorem 2.1.13 and $E\left(S_{n}-S_{k}\right)=0$ shows

$$
\int 2 S_{k} 1_{A_{k}} \cdot\left(S_{n}-S_{k}\right) d P=E\left(2 S_{k} 1_{A_{k}}\right) \cdot E\left(S_{n}-S_{k}\right)=0
$$

Using now the fact that $\left|S_{k}\right| \geq x$ on $A_{k}$ and the $A_{k}$ are disjoint,

$$
E S_{n}^{2} \geq \sum_{k=1}^{n} \int_{A_{k}} S_{k}^{2} d P \geq \sum_{k=1}^{n} x^{2} P\left(A_{k}\right)=x^{2} P\left(\max _{1 \leq k \leq n}\left|S_{k}\right| \geq x\right)
$$

We turn now to our results on convergence of series. To state them, we need a definition. We say that $\sum_{n=1}^{\infty} a_{n}$ converges if $\lim _{N \rightarrow \infty} \sum_{n=1}^{N} a_{n}$ exists.

Theorem 2.5.6. Suppose $X_{1}, X_{2} \ldots$ are independent and have $E X_{n}=$ 0 . If

$$
\sum_{n=1}^{\infty} \operatorname{var}\left(X_{n}\right)<\infty
$$

then with probability one $\sum_{n=1}^{\infty} X_{n}(\omega)$ converges.
Proof. Let $S_{N}=\sum_{n=1}^{N} X_{n}$. From Theorem 2.5.5, we get

$$
P\left(\max _{M \leq m \leq N}\left|S_{m}-S_{M}\right|>\epsilon\right) \leq \epsilon^{-2} \operatorname{var}\left(S_{N}-S_{M}\right)=\epsilon^{-2} \sum_{n=M+1}^{N} \operatorname{var}\left(X_{n}\right)
$$

Letting $N \rightarrow \infty$ in the last result, we get

$$
P\left(\sup _{m \geq M}\left|S_{m}-S_{M}\right|>\epsilon\right) \leq \epsilon^{-2} \sum_{n=M+1}^{\infty} \operatorname{var}\left(X_{n}\right) \rightarrow 0 \quad \text { as } M \rightarrow \infty
$$

If we let $w_{M}=\sup _{m, n \geq M}\left|S_{m}-S_{n}\right|$ then $w_{M} \downarrow$ as $M \uparrow$ and

$$
P\left(w_{M}>2 \epsilon\right) \leq P\left(\sup _{m \geq M}\left|S_{m}-S_{M}\right|>\epsilon\right) \rightarrow 0
$$

as $M \rightarrow \infty$ so $w_{M} \downarrow 0$ almost surely. But $w_{M}(\omega) \downarrow 0$ implies $S_{n}(\omega)$ is a Cauchy sequence and hence $\lim _{n \rightarrow \infty} S_{n}(\omega)$ exists, so the proof is complete.

Example 2.5.7. Let $X_{1}, X_{2}, \ldots$ be independent with

$$
P\left(X_{n}=n^{-\alpha}\right)=P\left(X_{n}=-n^{-\alpha}\right)=1 / 2
$$

$E X_{n}=0$ and $\operatorname{var}\left(X_{n}\right)=n^{-2 \alpha}$ so if $\alpha>1 / 2$ it follows from Theorem 2.5.6 that $\sum X_{n}$ converges. Theorem 2.5.8 below shows that $\alpha>1 / 2$ is also necessary for this conclusion. Notice that there is absolute convergence, i.e., $\sum\left|X_{n}\right|<\infty$, if and only if $\alpha>1$.

Theorem 2.5.6 is sufficient for all of our applications, but our treatment would not be complete if we did not mention the last word on convergence of random series.

Theorem 2.5.8. Kolmogorov's three-series theorem. Let $X_{1}, X_{2}, \ldots$ be independent. Let $A>0$ and let $Y_{i}=X_{i} 1_{\left(\left|X_{i}\right| \leq A\right)}$. In order that $\sum_{n=1}^{\infty} X_{n}$ converges a.s., it is necessary and sufficient that
(i) $\sum_{n=1}^{\infty} P\left(\left|X_{n}\right|>A\right)<\infty$, (ii) $\sum_{n=1}^{\infty} E Y_{n}$ converges, and (iii) $\sum_{n=1}^{\infty} \operatorname{var}\left(Y_{n}\right)<\infty$

Proof. We will prove the necessity in Example 3.4.12 as an application of the central limit theorem. To prove the sufficiency, let $\mu_{n}=E Y_{n}$. (iii) and Theorem 2.5.6 imply that $\sum_{n=1}^{\infty}\left(Y_{n}-\mu_{n}\right)$ converges a.s. Using (ii) now gives that $\sum_{n=1}^{\infty} Y_{n}$ converges a.s. (i) and the Borel-Cantelli lemma imply $P\left(X_{n} \neq Y_{n}\right.$ i.o. $)=0$, so $\sum_{n=1}^{\infty} X_{n}$ converges a.s.

The link between convergence of series and the strong law of large numbers is provided by

Theorem 2.5.9. Kronecker's lemma. If $a_{n} \uparrow \infty$ and $\sum_{n=1}^{\infty} x_{n} / a_{n}$ converges then

$$
a_{n}^{-1} \sum_{m=1}^{n} x_{m} \rightarrow 0
$$

Proof. Let $a_{0}=0, b_{0}=0$, and for $m \geq 1$, let $b_{m}=\sum_{k=1}^{m} x_{k} / a_{k}$. Then $x_{m}=a_{m}\left(b_{m}-b_{m-1}\right)$ and so

$$
\begin{aligned}
a_{n}^{-1} \sum_{m=1}^{n} x_{m} & =a_{n}^{-1}\left\{\sum_{m=1}^{n} a_{m} b_{m}-\sum_{m=1}^{n} a_{m} b_{m-1}\right\} \\
& =a_{n}^{-1}\left\{a_{n} b_{n}+\sum_{m=2}^{n} a_{m-1} b_{m-1}-\sum_{m=1}^{n} a_{m} b_{m-1}\right\} \\
& =b_{n}-\sum_{m=1}^{n} \frac{\left(a_{m}-a_{m-1}\right)}{a_{n}} b_{m-1}
\end{aligned}
$$

(Recall $a_{0}=0$.) By hypothesis, $b_{n} \rightarrow b_{\infty}$ as $n \rightarrow \infty$. Since $a_{m}-a_{m-1} \geq 0$, the last sum is an average of $b_{0}, \ldots, b_{n}$. Intuitively, if $\epsilon>0$ and $M<\infty$ are fixed and $n$ is large, the average assigns mass $\geq 1-\epsilon$ to the $b_{m}$ with $m \geq M$, so

$$
\sum_{m=1}^{n} \frac{\left(a_{m}-a_{m-1}\right)}{a_{n}} b_{m-1} \rightarrow b_{\infty}
$$

To argue formally, let $B=\sup \left|b_{n}\right|$, pick $M$ so that $\left|b_{m}-b_{\infty}\right|<\epsilon / 2$ for $m \geq M$, then pick $N$ so that $a_{M} / a_{n}<\epsilon / 4 B$ for $n \geq N$. Now if $n \geq N$, we have

$$
\begin{aligned}
\left|\sum_{m=1}^{n} \frac{\left(a_{m}-a_{m-1}\right)}{a_{n}} b_{m-1}-b_{\infty}\right| & \leq \sum_{m=1}^{n} \frac{\left(a_{m}-a_{m-1}\right)}{a_{n}}\left|b_{m-1}-b_{\infty}\right| \\
& \leq \frac{a_{M}}{a_{n}} \cdot 2 B+\frac{a_{n}-a_{M}}{a_{n}} \cdot \frac{\epsilon}{2}<\epsilon
\end{aligned}
$$

proving the desired result since $\epsilon$ is arbitrary.
Theorem 2.5.10. The strong law of large numbers. Let $X_{1}, X_{2}, \ldots$ be i.i.d. random variables with $E\left|X_{i}\right|<\infty$. Let $E X_{i}=\mu$ and $S_{n}= X_{1}+\ldots+X_{n}$. Then $S_{n} / n \rightarrow \mu$ a.s. as $n \rightarrow \infty$.
Proof. Let $Y_{k}=X_{k} 1_{\left(\left|X_{k}\right| \leq k\right)}$ and $T_{n}=Y_{1}+\cdots+Y_{n}$. By (a) in the proof of Theorem 2.4.1 it suffices to show that $T_{n} / n \rightarrow \mu$. Let $Z_{k}=Y_{k}-E Y_{k}$, so $E Z_{k}=0$. Now $\operatorname{var}\left(Z_{k}\right)=\operatorname{var}\left(Y_{k}\right) \leq E Y_{k}^{2}$ and (b) in the proof of Theorem 2.4.1 imply

$$
\sum_{k=1}^{\infty} \operatorname{var}\left(Z_{k}\right) / k^{2} \leq \sum_{k=1}^{\infty} E Y_{k}^{2} / k^{2}<\infty
$$

Applying Theorem 2.5.6 now, we conclude that $\sum_{k=1}^{\infty} Z_{k} / k$ converges a.s. so Theorem 2.5.9 implies

$$
n^{-1} \sum_{k=1}^{n}\left(Y_{k}-E Y_{k}\right) \rightarrow 0 \quad \text { and hence } \quad \frac{T_{n}}{n}-n^{-1} \sum_{k=1}^{n} E Y_{k} \rightarrow 0 \text { a.s. }
$$

The dominated convergence theorem implies $E Y_{k} \rightarrow \mu$ as $k \rightarrow \infty$. From this, it follows easily that $n^{-1} \sum_{k=1}^{n} E Y_{k} \rightarrow \mu$ and hence $T_{n} / n \rightarrow \mu$.

### 2.5.1 Rates of Convergence

As mentioned earlier, one of the advantages of the random series proof is that it provides estimates on the rate of convergence of $S_{n} / n \rightarrow \mu$. By subtracting $\mu$ from each random variable, we can and will suppose without loss of generality that $\mu=0$.

Theorem 2.5.11. Let $X_{1}, X_{2} \ldots$ be i.i.d. random variables with $E X_{i}=$ 0 and $E X_{i}^{2}=\sigma^{2}<\infty$. Let $S_{n}=X_{1}+\ldots+X_{n}$. If $\epsilon>0$ then

$$
S_{n} / n^{1 / 2}(\log n)^{1 / 2+\epsilon} \rightarrow 0 \quad \text { a.s. }
$$

Remark. The law of the iterated logarithm, Theorem 8.5.2 will show that

$$
\limsup _{n \rightarrow \infty} S_{n} / n^{1 / 2}(\log \log n)^{1 / 2}=\sigma \sqrt{2} \quad \text { a.s. }
$$

so the last result is not far from the best possible.
Proof. Let $a_{n}=n^{1 / 2}(\log n)^{1 / 2+\epsilon}$ for $n \geq 2$ and $a_{1}>0$.

$$
\sum_{n=1}^{\infty} \operatorname{var}\left(X_{n} / a_{n}\right)=\sigma^{2}\left(\frac{1}{a_{1}^{2}}+\sum_{n=2}^{\infty} \frac{1}{n(\log n)^{1+2 \epsilon}}\right)<\infty
$$

so applying Theorem 2.5.6 we get $\sum_{n=1}^{\infty} X_{n} / a_{n}$ converges a.s. and the indicated result follows from Theorem 2.5.9.

The next result due to Marcinkiewicz and Zygmund treats the situation in which $E X_{i}^{2}=\infty$ but $E\left|X_{i}\right|^{p}<\infty$ for some $1<p<2$.

Theorem 2.5.12. Let $X_{1}, X_{2} \ldots$ be i.i.d. with $E X_{1}=0$ and $E\left|X_{1}\right|^{p}< \infty$ where $1<p<2$. If $S_{n}=X_{1}+\ldots+X_{n}$ then $S_{n} / n^{1 / p} \rightarrow 0$ a.s.

Proof. Let $Y_{k}=X_{k} 1_{\left(\left|X_{k}\right| \leq k^{1 / p}\right)}$ and $T_{n}=Y_{1}+\cdots+Y_{n}$.

$$
\sum_{k=1}^{\infty} P\left(Y_{k} \neq X_{k}\right)=\sum_{k=1}^{\infty} P\left(\left|X_{k}\right|^{p}>k\right) \leq E\left|X_{k}\right|^{p}<\infty
$$

so the Borel-Cantelli lemma implies $P\left(Y_{k} \neq X_{k}\right.$ i.o. $)=0$, and it suffices to show $T_{n} / n^{1 / p} \rightarrow 0$. Using $\operatorname{var}\left(Y_{m}\right) \leq E\left(Y_{m}^{2}\right)$, Lemma 2.2.13 with $p=2, P\left(\left|Y_{m}\right|>y\right) \leq P\left(\left|X_{1}\right|>y\right)$, and Fubini's theorem (everything is
$\geq 0$ ) we have

$$
\begin{aligned}
\sum_{m=1}^{\infty} \operatorname{var}\left(Y_{m} / m^{1 / p}\right) & \leq \sum_{m=1}^{\infty} E Y_{m}^{2} / m^{2 / p} \\
& \leq \sum_{m=1}^{\infty} \sum_{n=1}^{m} \int_{(n-1)^{1 / p}}^{n^{1 / p}} \frac{2 y}{m^{2 / p}} P\left(\left|X_{1}\right|>y\right) d y \\
& =\sum_{n=1}^{\infty} \int_{(n-1)^{1 / p}}^{n^{1 / p}} \sum_{m=n}^{\infty} \frac{2 y}{m^{2 / p}} P\left(\left|X_{1}\right|>y\right) d y
\end{aligned}
$$

To bound the integral, we note that for $n \geq 2$ comparing the sum with the integral of $x^{-2 / p}$

$$
\sum_{m=n}^{\infty} m^{-2 / p} \leq \frac{p}{2-p}(n-1)^{(p-2) / p} \leq C y^{p-2}
$$

when $y \in\left[(n-1)^{1 / p}, n^{1 / p}\right]$. Since $E\left|X_{i}\right|^{p}=\int_{0}^{\infty} p x^{p-1} P\left(\left|X_{i}\right|>x\right) d x<\infty$, it follows that

$$
\sum_{m=1}^{\infty} \operatorname{var}\left(Y_{m} / m^{1 / p}\right)<\infty
$$

If we let $\mu_{m}=E Y_{m}$ and apply Theorem 2.5.6 and Theorem 2.5.9 it follows that

$$
n^{-1 / p} \sum_{m=1}^{n}\left(Y_{m}-\mu_{m}\right) \rightarrow 0 \quad \text { a.s. }
$$

To estimate $\mu_{m}$, we note that since $E X_{m}=0, \mu_{m}=-E\left(X_{i} ;\left|X_{i}\right|>m^{1 / p}\right)$, so

$$
\begin{aligned}
\left|\mu_{m}\right| & \leq E\left(|X| ;\left|X_{i}\right|>m^{1 / p}\right)=m^{1 / p} E\left(|X| / m^{1 / p} ;\left|X_{i}\right|>m^{1 / p}\right) \\
& \leq m^{1 / p} E\left(\left(|X| / m^{1 / p}\right)^{p} ;\left|X_{i}\right|>m^{1 / p}\right) \\
& \leq m^{-1+1 / p} p^{-1} E\left(\left|X_{i}\right|^{p} ;\left|X_{i}\right|>m^{1 / p}\right)
\end{aligned}
$$

Now $\sum_{m=1}^{n} m^{-1+1 / p} \leq C n^{1 / p}$ and $E\left(\left|X_{i}\right|^{p} ;\left|X_{i}\right|>m^{1 / p}\right) \rightarrow 0$ as $m \rightarrow \infty$, so $n^{-1 / p} \sum_{m=1}^{n} \mu_{m} \rightarrow 0$ and the desired result follows.

### 2.5.2 Infinite Mean

The St. Petersburg game, discussed in Example 2.2.16 and Exercise 2.3.20, is a situation in which $E X_{i}=\infty, S_{n} / n \log _{2} n \rightarrow 1$ in probability but

$$
\limsup _{n \rightarrow \infty} S_{n} /\left(n \log _{2} n\right)=\infty \text { a.s. }
$$

The next result, due to Feller (1946), shows that when $E\left|X_{1}\right|=\infty, S_{n} / a_{n}$ cannot converge almost surely to a nonzero limit. In Theorem 2.3.8 we considered the special case $a_{n}=n$.

Theorem 2.5.13. Let $X_{1}, X_{2} \ldots$ be i.i.d. with $E\left|X_{1}\right|=\infty$ and let $S_{n}=X_{1}+\cdots+X_{n}$. Let $a_{n}$ be a sequence of positive numbers with $a_{n} / n$ increasing. Then $\limsup _{n \rightarrow \infty}\left|S_{n}\right| / a_{n}=0$ or $\infty$ according as $\sum_{n} P\left(\left|X_{1}\right| \geq\right. \left.a_{n}\right)<\infty$ or $=\infty$.

Proof. Since $a_{n} / n \uparrow, a_{k n} \geq k a_{n}$ for any integer $k$. Using this and $a_{n} \uparrow$,

$$
\sum_{n=1}^{\infty} P\left(\left|X_{1}\right| \geq k a_{n}\right) \geq \sum_{n=1}^{\infty} P\left(\left|X_{1}\right| \geq a_{k n}\right) \geq \frac{1}{k} \sum_{m=k}^{\infty} P\left(\left|X_{1}\right| \geq a_{m}\right)
$$

The last observation shows that if the sum is infinite, $\lim \sup _{n \rightarrow \infty}\left|X_{n}\right| / a_{n}= \infty$. Since $\max \left\{\left|S_{n-1}\right|,\left|S_{n}\right|\right\} \geq\left|X_{n}\right| / 2$, it follows that $\limsup _{n \rightarrow \infty}\left|S_{n}\right| / a_{n}= \infty$.

To prove the other half, we begin with the identity

$$
\begin{equation*}
\sum_{m=1}^{\infty} m P\left(a_{m-1} \leq\left|X_{i}\right|<a_{m}\right)=\sum_{n=1}^{\infty} P\left(\left|X_{i}\right| \geq a_{n-1}\right) \tag{*}
\end{equation*}
$$

To see this, write $m=\sum_{n=1}^{m} 1$ and then use Fubini's theorem. We now let $Y_{n}=X_{n} 1_{\left(\left|X_{n}\right|<a_{n}\right)}$, and $T_{n}=Y_{1}+\ldots+Y_{n}$. When the sum is finite, $P\left(Y_{n} \neq X_{n}\right.$ i.o. $)=0$, and it suffices to investigate the behavior of the $T_{n}$. To do this, we let $a_{0}=0$ and compute

$$
\begin{aligned}
\sum_{n=1}^{\infty} \operatorname{var}\left(Y_{n} / a_{n}\right) & \leq \sum_{n=1}^{\infty} E Y_{n}^{2} / a_{n}^{2} \\
& =\sum_{n=1}^{\infty} a_{n}^{-2} \sum_{m=1}^{n} \int_{\left[a_{m-1}, a_{m}\right)} y^{2} d F(y) \\
& =\sum_{m=1}^{\infty} \int_{\left[a_{m-1}, a_{m}\right)} y^{2} d F(y) \sum_{n=m}^{\infty} a_{n}^{-2}
\end{aligned}
$$

Since $a_{n} \geq n a_{m} / m$, we have $\sum_{n=m}^{\infty} a_{n}^{-2} \leq\left(m^{2} / a_{m}^{2}\right) \sum_{n=m}^{\infty} n^{-2} \leq C m a_{m}^{-2}$, so

$$
\leq C \sum_{m=1}^{\infty} m \int_{\left[a_{m-1}, a_{m}\right)} d F(y)
$$

Using (*) now, we conclude $\sum_{n=1}^{\infty} \operatorname{var}\left(Y_{n} / a_{n}\right)<\infty$.
The last step is to show $E T_{n} / a_{n} \rightarrow 0$. To begin, we note that if $E\left|X_{i}\right|=\infty, \sum_{n=1}^{\infty} P\left(\left|X_{i}\right|>a_{n}\right)<\infty$, and $a_{n} / n \uparrow$ we must have $a_{n} / n \uparrow \infty$. To estimate $E T_{n} / a_{n}$ now, we observe that

$$
\begin{aligned}
\left|a_{n}^{-1} \sum_{m=1}^{n} E Y_{m}\right| & \leq a_{n}^{-1} n \sum_{m=1}^{n} E\left(\left|X_{m}\right| ;\left|X_{m}\right|<a_{m}\right) \\
& \leq \frac{n a_{N}}{a_{n}}+\frac{n}{a_{n}} E\left(\left|X_{i}\right| ; a_{N} \leq\left|X_{i}\right|<a_{n}\right)
\end{aligned}
$$

where the last inequality holds for any fixed $N$. Since $a_{n} / n \rightarrow \infty$, the first term converges to 0 . Since $m / a_{m} \downarrow$, the second is

$$
\begin{aligned}
& \leq \sum_{m=N+1}^{n} \frac{m}{a_{m}} E\left(\left|X_{i}\right| ; a_{m-1} \leq\left|X_{i}\right|<a_{m}\right) \\
& \leq \sum_{m=N+1}^{\infty} m P\left(a_{m-1} \leq\left|X_{i}\right|<a_{m}\right)
\end{aligned}
$$

(*) shows that the sum is finite, so it is small if $N$ is large and the desired result follows.

## Exercises

2.5.1. Suppose $X_{1}, X_{2}, \ldots$ are i.i.d. with $E X_{i}=0, \operatorname{var}\left(X_{i}\right)=C<\infty$. Use Theorem 2.5.5 with $n=m^{\alpha}$ where $\alpha(2 p-1)>1$ to conclude that if $S_{n}=X_{1}+\cdots+X_{n}$ and $p>1 / 2$ then $S_{n} / n^{p} \rightarrow 0$ almost surely.
2.5.2. The converse of Theorem 2.5.12 is much easier. Let $p>0$. If $S_{n} / n^{1 / p} \rightarrow 0$ a.s. then $E\left|X_{1}\right|^{p}<\infty$.
2.5.3. Let $X_{1}, X_{2}, \ldots$ be i.i.d. standard normals. Show that for any $t$

$$
\sum_{n=1}^{\infty} X_{n} \cdot \frac{\sin (n \pi t)}{n} \quad \text { converges a.s. }
$$

We will see this series again at the end of Section 8.1 [REF].
2.5.4. Let $X_{1}, X_{2} \ldots$ be independent with $E X_{n}=0, \operatorname{var}\left(X_{n}\right)=\sigma_{n}^{2}$. (i) Show that if $\sum_{n} \sigma_{n}^{2} / n^{2}<\infty$ then $\sum_{n} X_{n} / n$ converges a.s. and hence $n^{-1} \sum_{m=1}^{n} X_{m} \rightarrow 0$ a.s. (ii) Suppose $\sum \sigma_{n}^{2} / n^{2}=\infty$ and without loss of generality that $\sigma_{n}^{2} \leq n^{2}$ for all $n$. Show that there are independent random variables $X_{n}$ with $E X_{n}=0$ and $\operatorname{var}\left(X_{n}\right) \leq \sigma_{n}^{2}$ so that $X_{n} / n$ and hence $n^{-1} \sum_{m \leq n} X_{m}$ does not converge to 0 a.s.
2.5.5. Let $X_{n} \geq 0$ be independent for $n \geq 1$. The following are equivalent:
(i) $\sum_{n=1}^{\infty} X_{n}<\infty$ a.s. (ii) $\sum_{n=1}^{\infty}\left[P\left(X_{n}>1\right)+E\left(X_{n} 1_{\left(X_{n} \leq 1\right)}\right)\right]<\infty$
(iii) $\sum_{n=1}^{\infty} E\left(X_{n} /\left(1+X_{n}\right)\right)<\infty$.
2.5.6. Let $\psi(x)=x^{2}$ when $|x| \leq 1$ and $=|x|$ when $|x| \geq 1$. Show that if $X_{1}, X_{2}, \ldots$ are independent with $E X_{n}=0$ and $\sum_{n=1}^{\infty} E \psi\left(X_{n}\right)<\infty$ then $\sum_{n=1}^{\infty} X_{n}$ converges a.s.
2.5.7. Let $X_{n}$ be independent. Suppose $\sum_{n=1}^{\infty} E\left|X_{n}\right|^{p(n)}<\infty$ where $0<p(n) \leq 2$ for all $n$ and $E X_{n}=0$ when $p(n)>1$. Show that $\sum_{n=1}^{\infty} X_{n}$ converges a.s.
2.5.8. Let $X_{1}, X_{2}, \ldots$ be i.i.d. and not $\equiv 0$. Then the radius of convergence of the power series $\sum_{n \geq 1} X_{n}(\omega) z^{n}$ (i.e., $r(\omega)=\sup \left\{c: \sum\left|X_{n}(\omega)\right| c^{n}<\right. \infty\}$ ) is 1 a.s. or 0 a.s., according as $E \log ^{+}\left|X_{1}\right|<\infty$ or $=\infty$ where $\log ^{+} x=\max (\log x, 0)$.
2.5.9. Let $X_{1}, X_{2}, \ldots$ be independent and let $S_{m, n}=X_{m+1}+\ldots+X_{n}$. Then

$$
\begin{equation*}
P\left(\max _{m<j \leq n}\left|S_{m, j}\right|>2 a\right) \min _{m<k \leq n} P\left(\left|S_{k, n}\right| \leq a\right) \leq P\left(\left|S_{m, n}\right|>a\right) \tag{$\star$}
\end{equation*}
$$

2.5.10. Use ( $\star$ ) to prove a theorem of P. Lévy: Let $X_{1}, X_{2}, \ldots$ be independent and let $S_{n}=X_{1}+\ldots+X_{n}$. If $\lim _{n \rightarrow \infty} S_{n}$ exists in probability then it also exists a.s.
2.5.11. Let $X_{1}, X_{2} \ldots$ be i.i.d. and $S_{n}=X_{1}+\ldots+X_{n}$. Use ( $\star$ ) to conclude that if $S_{n} / n \rightarrow 0$ in probability then $\left(\max _{1 \leq m \leq n} S_{m}\right) / n \rightarrow 0$ in probability.
2.5.12. Let $X_{1}, X_{2} \ldots$ be i.i.d. and $S_{n}=X_{1}+\ldots+X_{n}$. Suppose $a_{n} \uparrow \infty$ and $a\left(2^{n}\right) / a\left(2^{n-1}\right)$ is bounded. (i) Use ( $\star$ ) to show that if $S_{n} / a(n) \rightarrow 0$ in probability and $S_{2^{n}} / a\left(2^{n}\right) \rightarrow 0$ a.s. then $S_{n} / a(n) \rightarrow 0$ a.s. (ii) Suppose in addition that $E X_{1}=0$ and $E X_{1}^{2}<\infty$. Use the previous exercise and Chebyshev's inequality to conclude that $S_{n} / n^{1 / 2}\left(\log _{2} n\right)^{1 / 2+\epsilon} \rightarrow 0$ a.s.

### 2.6 Renewal Theory*

Let $\xi_{1}, \xi_{2}, \ldots$ be i.i.d. positive random variables (i.e., $P\left(\xi_{i}>0\right)=1$ ) with distribution $F$ and define a sequence of times by $T_{0}=0$, and $T_{k}= T_{k-1}+\xi_{k}$ for $k \geq 1$. As explained in Example 2.4.6, we think of $\xi_{i}$ as the lifetime of the $i$ th light bulb, and $T_{k}$ is the time the $k$ th bulb burns out. A second interpretation from the discussion of Poisson process in Section 3.6 is that $T_{k}$ is the time of arrival of the $k$ th customer. A third interpretation from Chapter 5 is that $T_{k}$ is the time of the $k$ th visit to state $k$.

To have a neutral terminology, we will refer to the $T_{k}$ as renewals. The term renewal refers to the fact that the process "starts afresh" at $T_{k}$, i.e., $\left\{T_{k+j}-T_{k}, j \geq 1\right\}$ has the same distribution as $\left\{T_{j}, j \geq 1\right\}$.

![](https://cdn.mathpix.com/cropped/049c529c-af3b-4bc2-92f7-c2b31e6bd632-099.jpg?height=126&width=595&top_left_y=2131&top_left_x=794)
Figure 2.1: Renewal sequence.

Departing slightly from the notation in Example 2.4.6, we let $N_{t}= \inf \left\{k: T_{k}>t\right\} . N_{t}$ is the number of renewals in $[0, t]$, counting the renewal at time 0 . The advantage of this definition is that $N_{t}$ is a stopping time, i.e., $\left\{N_{t}=k\right\}$ is measurable with respect to $\mathcal{F}_{k}$.

In Theorem 2.4.7, we showed that
Theorem 2.6.1. As $t \rightarrow \infty, N_{t} / t \rightarrow 1 / \mu$ a.s. where $\mu=E \xi_{i} \in(0, \infty]$ and $1 / \infty=0$.

Our next result concerns the asymptotic behavior of $U(t)=E N_{t}$. To derive the result we need
Theorem 2.6.2. Wald's equation. Let $X_{1}, X_{2} \ldots$ be i.i.d. with $E\left|X_{i}\right|< \infty$. If $N$ is a stopping time with $E N<\infty$ then $E S_{N}=E X_{1} E N$.
Proof. First suppose the $X_{i} \geq 0$.

$$
E S_{N}=\int S_{N} d P=\sum_{n=1}^{\infty} \int S_{n} 1_{\{N=n\}} d P=\sum_{n=1}^{\infty} \sum_{m=1}^{n} \int X_{m} 1_{\{N=n\}} d P
$$

Since the $X_{i} \geq 0$, we can interchange the order of summation (i.e., use Fubini's theorem) to conclude that the last expression

$$
=\sum_{m=1}^{\infty} \sum_{n=m}^{\infty} \int X_{m} 1_{\{N=n\}} d P=\sum_{m=1}^{\infty} \int X_{m} 1_{\{N \geq m\}} d P
$$

Now $\{N \geq m\}=\{N \leq m-1\}^{c} \in \mathcal{F}_{m-1}$ and is independent of $X_{m}$, so the last expression

$$
=\sum_{m=1}^{\infty} E X_{m} P(N \geq m)=E X_{1} E N
$$

To prove the result in general, we run the last argument backwards. If we have $E N<\infty$ then

$$
\infty>\sum_{m=1}^{\infty} E\left|X_{m}\right| P(N \geq m)=\sum_{m=1}^{\infty} \sum_{n=m}^{\infty} \int\left|X_{m}\right| 1_{\{N=n\}} d P
$$

The last formula shows that the double sum converges absolutely in one order, so Fubini's theorem gives

$$
\sum_{m=1}^{\infty} \sum_{n=m}^{\infty} \int X_{m} 1_{\{N=n\}} d P=\sum_{n=1}^{\infty} \sum_{m=1}^{n} \int X_{m} 1_{\{N=n\}} d P
$$

Using the independence of $\{N \geq m\} \in \mathcal{F}_{m-1}$ and $X_{m}$, and rewriting the last identity, it follows that

$$
\sum_{m=1}^{\infty} E X_{m} P(N \geq m)=E S_{N}
$$

Since the left-hand side is $E N E X_{1}$, the proof is complete.

Theorem 2.6.3. As $t \rightarrow \infty, U(t) / t \rightarrow 1 / \mu$.
Proof. We will apply Wald's equation to the stopping time $N_{t}$. The first step is to show that $E N_{t}<\infty$. To do this, pick $\delta>0$ so that $P\left(\xi_{i}>\delta\right)=\epsilon>0$ and pick $K$ so that $K \delta \geq t$. Since $K$ consecutive $\xi_{i}^{\prime} s$ that are $>\delta$ will make $T_{n}>t$, we have

$$
P\left(N_{t}>m K\right) \leq\left(1-\epsilon^{K}\right)^{m}
$$

and $E N_{t}<\infty$. If $\mu<\infty$, applying Wald's equation now gives

$$
\mu E N_{t}=E T_{N_{t}} \geq t
$$

so $U(t) \geq t / \mu$. The last inequality is trivial when $\mu=\infty$ so it holds in general.

Turning to the upper bound, we observe that if $P\left(\xi_{i} \leq c\right)=1$, then repeating the last argument shows $\mu E N_{t}=E S_{N_{t}} \leq t+c$, and the result holds for bounded distributions. If we let $\bar{\xi}_{i}=\xi_{i} \wedge c$ and define $\bar{T}_{n}$ and $\bar{N}_{t}$ in the obvious way then

$$
E N_{t} \leq E \bar{N}_{t} \leq(t+c) / E\left(\bar{\xi}_{i}\right)
$$

Letting $t \rightarrow \infty$ and then $c \rightarrow \infty$ gives $\limsup _{t \rightarrow \infty} E N_{t} / t \leq 1 / \mu$, and the proof is complete.

To take a closer look at when the renewals occur, we let

$$
U(A)=\sum_{n=0}^{\infty} P\left(T_{n} \in A\right)
$$

$U$ is called the renewal measure. We absorb the old definition, $U(t)= E N_{t}$, into the new one by regarding $U(t)$ as shorthand for $U([0, t])$. This should not cause problems since $U(t)$ is the distribution function for the renewal measure. The asymptotic behavior of $U(t)$ depends upon whether the distribution $F$ is arithmetic, i.e., concentrated on $\{\delta, 2 \delta, 3 \delta, \ldots\}$ for some $\delta>0$, or nonarithmetic, i.e., not arithmetic. We will treat the first case in Chapter 5 as an application of Markov chains, so we will restrict our attention to the second case here.

Theorem 2.6.4. Blackwell's renewal theorem. If $F$ is nonarithmetic then

$$
U([t, t+h]) \rightarrow h / \mu \quad \text { as } t \rightarrow \infty .
$$

We will prove the result in the case $\mu<\infty$ by "coupling" following Lindvall (1977) and Athreya, McDonald, and Ney (1978). To set the stage for the proof, we need a definition and some preliminary computations. If $T_{0} \geq 0$ is independent of $\xi_{1}, \xi_{2}, \ldots$ and has distribution $G$, then $T_{k}=T_{k-1}+\xi_{k}, k \geq 1$ defines a delayed renewal process, and $G$ is
the delay distribution. If we let $N_{t}=\inf \left\{k: T_{k}>t\right\}$ as before and set $V(t)=E N_{t}$, then breaking things down according to the value of $T_{0}$ gives

$$
\begin{equation*}
V(t)=\int_{0}^{t} U(t-s) d G(s) \tag{2.6.1}
\end{equation*}
$$

The last integral, and all similar expressions below, is intended to include the contribution of any mass $G$ has at 0 . If we let $U(r)=0$ for $r<0$, then the last equation can be written as $V=U * G$, where $*$ denotes convolution.

Applying similar reasoning to $U$ gives

$$
\begin{equation*}
U(t)=1+\int_{0}^{t} U(t-s) d F(s) \tag{2.6.2}
\end{equation*}
$$

or, introducing convolution notation,

$$
U=1_{[0, \infty)}(t)+U * F
$$

Convolving each side with $G$ (and recalling $G * U=U * G$ ) gives

$$
\begin{equation*}
V=G * U=G+V * F \tag{2.6.3}
\end{equation*}
$$

We know $U(t) \sim t / \mu$. Our next step is to find a $G$ so that $V(t)=t / \mu$. Plugging what we want into (2.6.3) gives

$$
\begin{aligned}
t / \mu & =G(t)+\int_{0}^{t} \frac{t-y}{\mu} d F(y) \\
\text { so } \quad G(t) & =t / \mu-\int_{0}^{t} \frac{t-y}{\mu} d F(y)
\end{aligned}
$$

The integration-by-parts formula is

$$
\int_{0}^{t} K(y) d H(y)=H(t) K(t)-H(0) K(0)-\int_{0}^{t} H(y) d K(y)
$$

If we let $H(y)=(y-t) / \mu$ and $K(y)=1-F(y)$, then

$$
\frac{1}{\mu} \int_{0}^{t} 1-F(y) d y=\frac{t}{\mu}-\int_{0}^{t} \frac{t-y}{\mu} d F(y)
$$

so we have

$$
\begin{equation*}
G(t)=\frac{1}{\mu} \int_{0}^{t} 1-F(y) d y \tag{2.6.4}
\end{equation*}
$$

It is comforting to note that $\mu=\int_{[0, \infty)} 1-F(y) d y$, so the last formula defines a probability distribution. When the delay distribution $G$ is the one given in (2.6.4), we call the result the stationary renewal process. Something very special happens when $F(t)=1-\exp (-\lambda t), t \geq 0$ where
$\lambda>0$ (i.e., the renewal process is a rate $\lambda$ Poisson process). In this case, $\mu=1 / \lambda$ so $G(t)=F(t)$.
Proof of Theorem 2.6.4 for $\mu<\infty$. Let $T_{n}$ be a renewal process (with $T_{0}=0$ ) and $T_{n}^{\prime}$ be an independent stationary renewal process. Our first goal is to find $J$ and $K$ so that $\left|T_{J}-T_{K}^{\prime}\right|<\epsilon$ and the increments $\left\{T_{J+i}-T_{J}, i \geq 1\right\}$ and $\left\{T_{K+i}^{\prime}-T_{K}^{\prime}, i \geq 1\right\}$ are i.i.d. sequences independent of what has come before.

Let $\eta_{1}, \eta_{2}, \ldots$ and $\eta_{1}^{\prime}, \eta_{2}^{\prime}, \ldots$ be i.i.d. independent of $T_{n}$ and $T_{n}^{\prime}$ and take the values 0 and 1 with probability $1 / 2$ each. Let $\nu_{n}=\eta_{1}+\cdots+\eta_{n}$ and $\nu_{n}^{\prime}=1+\eta_{1}^{\prime}+\cdots+\eta_{n}^{\prime}, S_{n}=T_{\nu_{n}}$ and $S_{n}^{\prime}=T_{\nu_{n}^{\prime}}^{\prime}$. The increments of $S_{n}-S_{n}^{\prime}$ are 0 with probability at least $1 / 4$, and the support of their distribution is symmetric and contains the support of the $\xi_{k}$ so if the distribution of the $\xi_{k}$ is nonarithmetic the random walk $S_{n}-S_{n}^{\prime}$ is irreducible. Since the increments of $S_{n}-S_{n}^{\prime}$ have mean $0, N=\inf \left\{n:\left|S_{n}-S_{n}^{\prime}\right|<\epsilon\right\}$ has $P(N<\infty)=1$, and we can let $J=\nu_{N}$ and $K=\nu_{N}^{\prime}$. Let

$$
T_{n}^{\prime \prime}= \begin{cases}T_{n} & \text { if } J \geq n \\ T_{J}+T_{K+(n-J)}^{\prime}-T_{K}^{\prime} & \text { if } J<n\end{cases}
$$

In other words, the increments $T_{J+i}^{\prime \prime}-T_{J}^{\prime \prime}$ are the same as $T_{K+i}^{\prime}-T_{K}^{\prime}$ for $i \geq 1$.

![](https://cdn.mathpix.com/cropped/049c529c-af3b-4bc2-92f7-c2b31e6bd632-103.jpg?height=170&width=689&top_left_y=1422&top_left_x=732)
Figure 2.2: Coupling of renewal processes.

It is easy to see from the construction that $T_{n}$ and $T_{n}^{\prime \prime}$ have the same distribution. If we let

$$
N^{\prime}[s, t]=\left|\left\{n: T_{n}^{\prime} \in[s, t]\right\}\right| \quad \text { and } \quad N^{\prime \prime}[s, t]=\left|\left\{n: T_{n}^{\prime \prime} \in[s, t]\right\}\right|
$$

be the number of renewals in $[s, t]$ in the two processes, then on $\left\{T_{J} \leq t\right\}$

$$
N^{\prime \prime}[t, t+h]=N^{\prime}\left[t+T_{K}^{\prime}-T_{J}, t+h+T_{K}^{\prime}-T_{J}\right]\left\{\begin{array}{l}
\geq N^{\prime}[t+\epsilon, t+h-\epsilon] \\
\leq N^{\prime}[t-\epsilon, t+h+\epsilon]
\end{array}\right.
$$

To relate the expected number of renewals in the two processes, we observe that even if we condition on the location of all the renewals in $[0, s]$, the expected number of renewals in $[s, s+t]$ is at most $U(t)$, since the worst thing that could happen is to have a renewal at time
s. Combining the last two observations, we see that if $\epsilon<h / 2$ (so $[t+\epsilon, t+h-\epsilon]$ has positive length)

$$
\begin{aligned}
U([t, t+h]) & =E N^{\prime \prime}[t, t+h] \geq E\left(N^{\prime}[t+\epsilon, t+h-\epsilon] ; T_{J} \leq t\right) \\
& \geq \frac{h-2 \epsilon}{\mu}-P\left(T_{J}>t\right) U(h)
\end{aligned}
$$

since $E N^{\prime}[t+\epsilon, t+h-\epsilon]=(h-2 \epsilon) / \mu$ and $\left\{T_{J}>t\right\}$ is determined by the renewals of $T$ in $[0, t]$ and the renewals of $T^{\prime}$ in $[0, t+\epsilon]$. For the other direction, we observe

$$
\begin{aligned}
U([t, t+h]) & \leq E\left(N^{\prime}[t-\epsilon, t+h+\epsilon] ; T_{J} \leq t\right)+E\left(N^{\prime \prime}[t, t+h] ; T_{J}>t\right) \\
& \leq \frac{h+2 \epsilon}{\mu}+P\left(T_{J}>t\right) U(h)
\end{aligned}
$$

The desired result now follows from the fact that $P\left(T_{J}>t\right) \rightarrow 0$ and $\epsilon<h / 2$ is arbitrary.
Proof of Theorem 2.6.4 for $\mu=\infty$. In this case, there is no stationary renewal process, so we have to resort to other methods. Let

$$
\beta=\limsup _{t \rightarrow \infty} U(t, t+1]=\lim _{k \rightarrow \infty} U\left(t_{k}, t_{k}+1\right]
$$

for some sequence $t_{k} \rightarrow \infty$. We want to prove that $\beta=0$, for then by addition the previous conclusion holds with 1 replaced by any integer $n$ and, by monotonicity, with $n$ replaced by any $h<n$, and this gives us the result in Theorem 2.6.4. Fix $i$ and let

$$
a_{k, j}=\int_{(j-1, j]} U\left(t_{k}-y, t_{k}+1-y\right] d F^{i *}(y)
$$

By considering the location of $T_{i}$ we get

$$
\begin{equation*}
\lim _{k \rightarrow \infty} \sum_{j=1}^{\infty} a_{k, j}=\lim _{k \rightarrow \infty} \int U\left(t_{k}-y, t_{k}+1-y\right] d F^{i *}(y)=\beta \tag{a}
\end{equation*}
$$

Since $\beta$ is the lim sup, we must have

$$
\begin{equation*}
\limsup _{k \rightarrow \infty} a_{k, j} \leq \beta \cdot P\left(T_{i} \in(j-1, j]\right) \tag{b}
\end{equation*}
$$

We want to conclude from (a) and (b) that

$$
\begin{equation*}
\liminf _{k \rightarrow \infty} a_{k, j} \geq \beta \cdot P\left(T_{i} \in(j-1, j]\right) \tag{c}
\end{equation*}
$$

To do this, we observe that by considering the location of the first renewal in $(j-1, j]$

$$
\begin{equation*}
0 \leq a_{k, j} \leq U(1) P\left(T_{i} \in(j-1, j]\right) \tag{d}
\end{equation*}
$$

(c) is trivial when $\beta=0$ so we can suppose $\beta>0$. To argue by contradiction, suppose there exist $j_{0}$ and $\epsilon>0$ so that

$$
\liminf _{k \rightarrow \infty} a_{k, j_{0}} \leq \beta \cdot\left\{P\left(T_{i} \in\left(j_{0}-1, j_{0}\right]\right)-\epsilon\right\}
$$

Pick $k_{n} \rightarrow \infty$ so that

$$
a_{k_{n}, j_{0}} \rightarrow \beta \cdot\left\{P\left(T_{i} \in\left(j_{0}-1, j_{0}\right]\right)-\epsilon\right\}
$$

Using (d), we can pick $J \geq j_{0}$ so that

$$
\limsup _{n \rightarrow \infty} \sum_{j=J+1}^{\infty} a_{k_{n}, j} \leq U(1) \sum_{j=J+1}^{\infty} P\left(T_{i} \in(j-1, j]\right) \leq \beta \epsilon / 2
$$

Now an easy argument shows

$$
\limsup _{n \rightarrow \infty} \sum_{j=1}^{J} a_{k_{n}, j} \leq \sum_{j=1}^{J} \limsup _{n \rightarrow \infty} a_{k_{n}, j} \leq \beta\left(\sum_{j=1}^{J} P\left(T_{i} \in(j-1, j]\right)-\epsilon\right)
$$

by (b) and our assumption. Adding the last two results shows

$$
\limsup _{n \rightarrow \infty} \sum_{j=1}^{\infty} a_{k_{n}, j} \leq \beta(1-\epsilon / 2)
$$

which contradicts (a), and proves (c).
Now, if $j-1<y \leq j$, we have

$$
U\left(t_{k}-y, t_{k}+1-y\right] \leq U\left(t_{k}-j, t_{k}+2-j\right]
$$

so using (c) it follows that for $j$ with $P\left(T_{i} \in(j-1, j]\right)>0$, we must have

$$
\liminf _{k \rightarrow \infty} U\left(t_{k}-j, t_{k}+2-j\right] \geq \beta
$$

Summing over $i$, we see that the last conclusion is true when $U(j-1, j]>$ 0.

The support of $U$ is closed under addition. (If $x$ is in the support of $F^{m *}$ and $y$ is in the support of $F^{n *}$ then $x+y$ is in the support of $F^{(m+n) *}$.) We have assumed $F$ is nonarithmetic, so $U(j-1, j]>0$ for $j \geq j_{0}$. Letting $r_{k}=t_{k}-j_{0}$ and considering the location of the last renewal in $\left[0, r_{k}\right]$ and the index of the $T_{i}$ gives

$$
\begin{aligned}
1 & =\sum_{i=0}^{\infty} \int_{0}^{r_{k}}\left(1-F\left(r_{k}-y\right)\right) d F^{i *}(y)=\int_{0}^{r_{k}}\left(1-F\left(r_{k}-y\right)\right) d U(y) \\
& \geq \sum_{n=1}^{\infty}(1-F(2 n)) U\left(r_{k}-2 n, r_{k}+2-2 n\right]
\end{aligned}
$$

Since $\liminf _{k \rightarrow \infty} U\left(r_{k}-2 n, r_{k}+2-2 n\right] \geq \beta$ and

$$
\sum_{n=0}^{\infty}(1-F(2 n)) \geq \mu / 2=\infty
$$

$\beta$ must be 0 , and the proof is complete.
Remark. Following Lindvall (1977), we have based the proof for $\mu=\infty$ on part of Feller's (1961) proof of the discrete renewal theorem (i.e., for arithmetic distributions). See Freedman (1971b) pages 22-25 for an account of Feller's proof. Purists can find a proof that does everything by coupling in Thorisson (1987).

Our next topic is the renewal equation: $H=h+H * F$. Two cases we have seen in (2.6.2) and (2.6.3) are:

Example 2.6.5. $h \equiv 1$ : $U(t)=1+\int_{0}^{t} U(t-s) d F(s)$
Example 2.6.6. $h(t)=G(t): V(t)=G(t)+\int_{0}^{t} V(t-s) d F(s)$
The last equation is valid for an arbitrary delay distribution. If we let $G$ be the distribution in (2.6.4) and subtract the last two equations, we get

Example 2.6.7. $H(t)=U(t)-t / \mu$ satisfies the renewal equation with $h(t)=\frac{1}{\mu} \int_{t}^{\infty} 1-F(s) d s$.

Last but not least, we have an example that is a typical application of the renewal equation.

Example 2.6.8. Let $x>0$ be fixed, and let $H(t)=P\left(T_{N(t)}-t>x\right)$. By considering the value of $T_{1}$, we get

$$
H(t)=(1-F(t+x))+\int_{0}^{t} H(t-s) d F(s)
$$

The examples above should provide motivation for:
Theorem 2.6.9. If $h$ is bounded then the function

$$
H(t)=\int_{0}^{t} h(t-s) d U(s)
$$

is the unique solution of the renewal equation that is bounded on bounded intervals.

Proof. Let $U_{n}(A)=\sum_{m=0}^{n} P\left(T_{m} \in A\right)$ and

$$
H_{n}(t)=\int_{0}^{t} h(t-s) d U_{n}(s)=\sum_{m=0}^{n}\left(h * F^{m *}\right)(t)
$$

Here, $F^{m *}$ is the distribution of $T_{m}$, and we have extended the definition of $h$ by setting $h(r)=0$ for $r<0$. From the last expression, it should be clear that

$$
H_{n+1}=h+H_{n} * F
$$

The fact that $U(t)<\infty$ implies $U(t)-U_{n}(t) \rightarrow 0$. Since $h$ is bounded,

$$
\left|H_{n}(t)-H(t)\right| \leq\|h\|_{\infty}\left|U(t)-U_{n}(t)\right|
$$

and $H_{n}(t) \rightarrow H(t)$ uniformly on bounded intervals. To estimate the convolution, we note that

$$
\begin{aligned}
\left|H_{n} * F(t)-H * F(t)\right| & \leq \sup _{s \leq t}\left|H_{n}(s)-H(s)\right| \\
& \leq\|h\|_{\infty}\left|U(t)-U_{n}(t)\right|
\end{aligned}
$$

since $U-U_{n}=\sum_{m=n+1}^{\infty} F^{m *}$ is increasing in $t$. Letting $n \rightarrow \infty$ in $H_{n+1}=h+H_{n} * F$, we see that $H$ is a solution of the renewal equation that is bounded on bounded intervals.

To prove uniqueness, we observe that if $H_{1}$ and $H_{2}$ are two solutions, then $K=H_{1}-H_{2}$ satisfies $K=K * F$. If $K$ is bounded on bounded intervals, iterating gives $K=K * F^{n *} \rightarrow 0$ as $n \rightarrow \infty$, so $H_{1}=H_{2}$.

The proof of Theorem 2.6.9 is valid when $F(\infty)=P\left(\xi_{i}<\infty\right)<1$. In this case, we have a terminating renewal process. After a geometric number of trials with mean $1 /(1-F(\infty)), T_{n}=\infty$. This "trivial case" has some interesting applications.

Example 2.6.10. Pedestrian delay. A chicken wants to cross a road (we won't ask why) on which the traffic is a Poisson process with rate $\lambda$. She needs one unit of time with no arrival to safely cross the road. Let $M=\inf \{t \geq 0$ : there are no arrivals in $(t, t+1]\}$ be the waiting time until she starts to cross the road. By considering the time of the first arrival, we see that $H(t)=P(M \leq t)$ satisfies

$$
H(t)=e^{-\lambda}+\int_{0}^{1} H(t-y) \lambda e^{-\lambda y} d y
$$

Comparing with Example 2.6.5 and using Theorem 2.6.9, we see that

$$
H(t)=e^{-\lambda} \sum_{n=0}^{\infty} F^{n *}(t)
$$

We could have gotten this answer without renewal theory by noting

$$
P(M \leq t)=\sum_{n=0}^{\infty} P\left(T_{n} \leq t, T_{n+1}=\infty\right)
$$

The last representation allows us to compute the mean of $M$. Let $\mu$ be the mean of the interarrival time given that it is $<1$, and note that the lack of memory property of the exponential distribution implies

$$
\mu=\int_{0}^{1} x \lambda e^{-\lambda x} d x=\int_{0}^{\infty}-\int_{1}^{\infty}=\frac{1}{\lambda}-\left(1+\frac{1}{\lambda}\right) e^{-\lambda}
$$

Then, by considering the number of renewals in our terminating renewal process,

$$
E M=\sum_{n=0}^{\infty} e^{-\lambda}\left(1-e^{-\lambda}\right)^{n} n \mu=\left(e^{\lambda}-1\right) \mu
$$

since if $X$ is a geometric with success probability $e^{-\lambda}$ then $E M=\mu E(X- 1)$.

Example 2.6.11. Cramér's estimates of ruin. Consider an insurance company that collects money at rate $c$ and experiences i.i.d. claims at the arrival times of a Poisson process $N_{t}$ with rate 1. If its initial capital is $x$, its wealth at time $t$ is

$$
W_{x}(t)=x+c t-\sum_{m=1}^{N t} Y_{i}
$$

Here $Y_{1}, Y_{2}, \ldots$ are i.i.d. with distribution $G$ and mean $\mu$. Let

$$
R(x)=P\left(W_{x}(t) \geq 0 \text { for all } t\right)
$$

be the probability of never going bankrupt starting with capital $x$. By considering the time and size of the first claim:

$$
\begin{equation*}
R(x)=\int_{0}^{\infty} e^{-s} \int_{0}^{x+c s} R(x+c s-y) d G(y) d s \tag{a}
\end{equation*}
$$

This does not look much like a renewal equation, but with some ingenuity it can be transformed into one. Changing variables $t=x+c s$

$$
R(x) e^{-x / c}=\int_{x}^{\infty} e^{-t / c} \int_{0}^{t} R(t-y) d G(y) \frac{d t}{c}
$$

Differentiating w.r.t. $x$ and then multiplying by $e^{x / c}$,

$$
R^{\prime}(x)=\frac{1}{c} R(x)-\int_{0}^{x} R(x-y) d G(y) \cdot \frac{1}{c}
$$

Integrating $x$ from 0 to $w$

$$
\begin{equation*}
R(w)-R(0)=\frac{1}{c} \int_{0}^{w} R(x) d x-\frac{1}{c} \int_{0}^{w} \int_{0}^{x} R(x-y) d G(y) d x \tag{b}
\end{equation*}
$$

Interchanging the order of integration in the double integral, letting

$$
S(w)=\int_{0}^{w} R(x) d x
$$

using $d G=-d(1-G)$, and then integrating by parts

$$
\begin{aligned}
-\frac{1}{c} \int_{0}^{w} \int_{y}^{w} R(x-y) & d x d G(y)=-\frac{1}{c} \int_{0}^{w} S(w-y) d G(y) \\
& =\frac{1}{c} \int_{0}^{w} S(w-y) d(1-G)(y) \\
& =\frac{1}{c}\left\{-S(w)+\int_{0}^{w}(1-G(y)) R(w-y) d y\right\}
\end{aligned}
$$

Plugging this into (b), we finally have a renewal equation:

$$
\begin{equation*}
R(w)=R(0)+\int_{0}^{w} R(w-y) \frac{1-G(y)}{c} d y \tag{c}
\end{equation*}
$$

It took some cleverness to arrive at the last equation, but it is straightforward to analyze. First, we dismiss a trivial case. If $\mu>c$,

$$
\frac{1}{t}\left(c t-\sum_{m=1}^{N t} Y_{i}\right) \rightarrow c-\mu<0 \quad \text { a.s. }
$$

so $R(x) \equiv 0$. When $\mu<c$,

$$
F(x)=\int_{0}^{x} \frac{1-G(y)}{c} d y
$$

is a defective probability distribution with $F(\infty)=\mu / c$. Our renewal equation can be written as

$$
\begin{equation*}
R=R(0)+R * F \tag{d}
\end{equation*}
$$

so comparing with Example 2.6.5 and using Theorem 2.6.9 tells us $R(w)= R(0) U(w)$. To complete the solution, we have to compute the constant $R(0)$. Letting $w \rightarrow \infty$ and noticing $R(w) \rightarrow 1, U(w) \rightarrow(1-F(\infty))^{-1}= (1-\mu / c)^{-1}$, we have $R(0)=1-\mu / c$.

The basic fact about solutions of the renewal equation (in the nonterminating case) is:

Theorem 2.6.12. The renewal theorem. If $F$ is nonarithmetic and $h$ is directly Riemann integrable then as $t \rightarrow \infty$

$$
H(t) \rightarrow \frac{1}{\mu} \int_{0}^{\infty} h(s) d s
$$

Intuitively, this holds since Theorem 2.6.9 implies

$$
H(t)=\int_{0}^{t} h(t-s) d U(s)
$$

and Theorem 2.6.4 implies $d U(s) \rightarrow d s / \mu$ as $s \rightarrow \infty$. We will define directly Riemann integrable in a minute. We will start doing the proof and then figure out what we need to assume.
Proof. Suppose

$$
h(s)=\sum_{k=0}^{\infty} a_{k} 1_{[k \delta,(k+1) \delta)}(s)
$$

where $\sum_{k=0}^{\infty}\left|a_{k}\right|<\infty$. Since $U([t, t+\delta]) \leq U([0, \delta])<\infty$, it follows easily from Theorem 2.6.4 that

$$
\int_{0}^{t} h(t-s) d U(s)=\sum_{k=0}^{\infty} a_{k} U((t-(k+1) \delta, t-k \delta]) \rightarrow \frac{1}{\mu} \sum_{k=0}^{\infty} a_{k} \delta
$$

(Pick $K$ so that $\sum_{k \geq K}\left|a_{k}\right| \leq \epsilon / 2 U([0, \delta])$ and then $T$ so that

$$
\left|a_{k}\right| \cdot|U((t-(k+1) \delta, t-k \delta])-\delta / \mu| \leq \frac{\epsilon}{2 K}
$$

for $t \geq T$ and $0 \leq k<K$.) If $h$ is an arbitrary function on [ $0, \infty$ ), we let

$$
\begin{aligned}
I^{\delta} & =\sum_{k=0}^{\infty} \delta \sup \{h(x): x \in[k \delta,(k+1) \delta)\} \\
I_{\delta} & =\sum_{k=0}^{\infty} \delta \inf \{h(x): x \in[k \delta,(k+1) \delta)\}
\end{aligned}
$$

be upper and lower Riemann sums approximating the integral of $h$ over $[0, \infty)$. Comparing $h$ with the obvious upper and lower bounds that are constant on $[k \delta,(k+1) \delta)$ and using the result for the special case,

$$
\frac{I_{\delta}}{\mu} \leq \liminf _{t \rightarrow \infty} \int_{0}^{t} h(t-s) d U(s) \leq \limsup _{t \rightarrow \infty} \int_{0}^{t} h(t-s) d U(s) \leq \frac{I^{\delta}}{\mu}
$$

If $I^{\delta}$ and $I_{\delta}$ both approach the same finite limit $I$ as $\delta \rightarrow 0$, then $h$ is said to be directly Riemann integrable, and it follows that

$$
\int_{0}^{t} h(t-s) d U(y) \rightarrow I / \mu
$$

Remark. The word "direct" in the name refers to the fact that while the Riemann integral over [ $0, \infty$ ) is usually defined as the limit of integrals over $[0, a]$, we are approximating the integral over $[0, \infty)$ directly.

In checking the new hypothesis in Theorem 2.6.12, the following result is useful.

Lemma 2.6.13. If $h(x) \geq 0$ is decreasing with $h(0)<\infty$ and $\int_{0}^{\infty} h(x) d x< \infty$, then $h$ is directly Riemann integrable.

Proof. Because $h$ is decreasing, $I^{\delta}=\sum_{k=0}^{\infty} \delta h(k \delta)$ and $I_{\delta}=\sum_{k=0}^{\infty} \delta h((k+$ 1)δ). So

$$
I^{\delta} \geq \int_{0}^{\infty} h(x) d x \geq I_{\delta}=I^{\delta}-h(0) \delta
$$

proving the desired result.
Returning now to our examples, we skip the first two because, in those cases, $h(t) \rightarrow 1$ as $t \rightarrow \infty$, so $h$ is not integrable in any sense.
Example 2.6.14. Continuation of Example 2.6.7. $h(t)=\frac{1}{\mu} \int_{[t, \infty)} 1- F(s) d s . h$ is decreasing, $h(0)=1$, and

$$
\begin{aligned}
\mu \int_{0}^{\infty} h(t) d t & =\int_{0}^{\infty} \int_{t}^{\infty} 1-F(s) d s d t \\
& =\int_{0}^{\infty} \int_{0}^{s} 1-F(s) d t d s=\int_{0}^{\infty} s(1-F(s)) d s=E\left(\xi_{i}^{2} / 2\right)
\end{aligned}
$$

So, if $\nu \equiv E\left(\xi_{i}^{2}\right)<\infty$, it follows from Lemma 2.6.13, Theorem 2.6.12, and the formula in Example 2.6.7 that

$$
0 \leq U(t)-t / \mu \rightarrow \nu / 2 \mu^{2} \quad \text { as } t \rightarrow \infty
$$

When the renewal process is a rate $\lambda$ Poisson process, i.e., $P\left(\xi_{i}>t\right)= e^{-\lambda t}, N(t)-1$ has a Poisson distribution with mean $\lambda t$, so $U(t)=1+\lambda t$. According to Feller, Vol. II (1971), p. 385, if the $\xi_{i}$ are uniform on $(0,1)$, then

$$
U(t)=\sum_{k=0}^{n}(-1)^{k} e^{t-k}(t-k)^{k} / k!\quad \text { for } n \leq t \leq n+1
$$

As he says, the exact expression "reveals little about the nature of $U$. The asymptotic formula $0 \leq U(t)-2 t \rightarrow 2 / 3$ is much more interesting."

Example 2.6.15. Continuation of Example 2.6.8. $h(t)=1-F(t+ x)$. Again, $h$ is decreasing, but this time $h(0) \leq 1$ and the integral of $h$ is finite when $\mu=E\left(\xi_{i}\right)<\infty$. Applying Lemma 2.6.13 and Theorem 2.6.12 now gives

$$
P\left(T_{N(t)}-t>x\right) \rightarrow \frac{1}{\mu} \int_{0}^{\infty} h(s) d s=\frac{1}{\mu} \int_{x}^{\infty} 1-F(t) d t
$$

so (when $\mu<\infty$ ) the distribution of the residual waiting time $T_{N(t)}-t$ converges to the delay distribution that produces the stationary renewal process. This fact also follows from our proof of 2.6.4.

## Exercises

2.6.1. Show that $t / E\left(\xi_{i} \wedge t\right) \leq U(t) \leq 2 t / E\left(\xi_{i} \wedge t\right)$.
2.6.2. Deduce Theorem 2.6.3 from Theorem 2.6.1 by showing

$$
\limsup _{t \rightarrow \infty} E\left(N_{t} / t\right)^{2}<\infty
$$

Hint: Use a comparison like the one in the proof of Theorem 2.6.3.
2.6.3. Customers arrive at times of a Poisson process with rate 1. If the server is occupied, they leave. (Think of a public telephone or prostitute.) If not, they enter service and require a service time with a distribution $F$ that has mean $\mu$. Show that the times at which customers enter service are a renewal process with mean $\mu+1$, and use Theorem 2.6.1 to conclude that the asymptotic fraction of customers served is $1 /(\mu+1)$.

In the remaining problems we assume that $F$ is nonarithmetic, and in problems where the mean appears we assume it is finite.
2.6.4. Let $A_{t}=t-T_{N(t)-1}$ be the "age" at time $t$, i.e., the amount of time since the last renewal. If we fix $x>0$ then $H(t)=P\left(A_{t}>x\right)$ satisfies the renewal equation

$$
H(t)=(1-F(t)) \cdot 1_{(x, \infty)}(t)+\int_{0}^{t} H(t-s) d F(s)
$$

so $P\left(A_{t}>x\right) \rightarrow \frac{1}{\mu} \int_{(x, \infty)}(1-F(t)) d t$, which is the limit distribution for the residual lifetime $B_{t}=T_{N(t)}-t$.
2.6.5. Use the renewal equation in the last problem and Theorem 2.6.9 to conclude that if $T$ is a rate $\lambda$ Poisson process $A_{t}$ has the same distribution as $\xi_{i} \wedge t$.
2.6.6. Let $A_{t}=t-T_{N(t)-1}$ and $B_{t}=T_{N(t)}-t$. Show that

$$
P\left(A_{t}>x, B_{t}>y\right) \rightarrow \frac{1}{\mu} \int_{x+y}^{\infty}(1-F(t)) d t
$$

2.6.7. Alternating renewal process. Let $\xi_{1}, \xi_{2}, \ldots>0$ be i.i.d. with distribution $F_{1}$ and let $\eta_{1}, \eta_{2}, \ldots>0$ be i.i.d. with distribution $F_{2}$. Let $T_{0}=0$ and for $k \geq 1$ let $S_{k}=T_{k-1}+\xi_{k}$ and $T_{k}=S_{k}+\eta_{k}$. In words, we have a machine that works for an amount of time $\xi_{k}$, breaks down, and then requires $\eta_{k}$ units of time to be repaired. Let $F=F_{1} * F_{2}$ and let $H(t)$ be the probability the machine is working at time $t$. Show that if $F$ is nonarithmetic then as $t \rightarrow \infty$

$$
H(t) \rightarrow \mu_{1} /\left(\mu_{1}+\mu_{2}\right)
$$

where $\mu_{i}$ is the mean of $F_{i}$.
2.6.8. Write a renewal equation for $H(t)=P$ ( number of renewals in $[0, t]$ is odd) and use the renewal theorem to show that $H(t) \rightarrow 1 / 2$. Note: This is a special case of the previous exercise.
2.6.9. Renewal densities. Show that if $F(t)$ has a directly Riemann integrable density function $f(t)$, then the $V=U-1_{[0, \infty)}$ has a density $v$ that satisfies

$$
v(t)=f(t)+\int_{0}^{t} v(t-s) d F(s)
$$

Use the renewal theorem to conclude that if $f$ is directly Riemann integrable then $v(t) \rightarrow 1 / \mu$ as $t \rightarrow \infty$.

### 2.7 Large Deviations*

Let $X_{1}, X_{2}, \ldots$ be i.i.d. and let $S_{n}=X_{1}+\cdots+X_{n}$. In this section, we will investigate the rate at which $P\left(S_{n}>n a\right) \rightarrow 0$ for $a>\mu=E X_{i}$. We will ultimately conclude that if the moment-generating function $\varphi(\theta)=E \exp \left(\theta X_{i}\right)<\infty$ for some $\theta>0, P\left(S_{n} \geq n a\right) \rightarrow 0$ exponentially rapidly and we will identify

$$
\gamma(a)=\lim _{n \rightarrow \infty} \frac{1}{n} \log P\left(S_{n} \geq n a\right)
$$

Our first step is to prove that the limit exists. This is based on an observation that will be useful several times below. Let $\pi_{n}=P\left(S_{n} \geq n a\right)$.

$$
\pi_{m+n} \geq P\left(S_{m} \geq m a, S_{n+m}-S_{m} \geq n a\right)=\pi_{m} \pi_{n}
$$

since $S_{m}$ and $S_{n+m}-S_{m}$ are independent. Letting $\gamma_{n}=\log \pi_{n}$ transforms multiplication into addition.

Lemma 2.7.1. If $\gamma_{m+n} \geq \gamma_{m}+\gamma_{n}$ then as $n \rightarrow \infty, \gamma_{n} / n \rightarrow \sup _{m} \gamma_{m} / m$.
Proof. Clearly, $\limsup \gamma_{n} / n \leq \sup \gamma_{m} / m$. To complete the proof, it suffices to prove that for any $m$ liminf $\gamma_{n} / n \geq \gamma_{m} / m$. Writing $n=k m+\ell$ with $0 \leq \ell<m$ and making repeated use of the hypothesis gives $\gamma_{n} \geq k \gamma_{m}+\gamma_{\ell}$. Dividing by $n=k m+\ell$ gives

$$
\frac{\gamma(n)}{n} \geq\left(\frac{k m}{k m+\ell}\right) \frac{\gamma(m)}{m}+\frac{\gamma(\ell)}{n}
$$

Letting $n \rightarrow \infty$ and recalling $n=k m+\ell$ with $0 \leq \ell<m$ gives the desired result.

Lemma 2.7.1 implies that $\lim _{n \rightarrow \infty} \frac{1}{n} \log P\left(S_{n} \geq n a\right)=\gamma(a)$ exists $\leq 0$. It follows from the formula for the limit that

$$
\begin{equation*}
P\left(S_{n} \geq n a\right) \leq e^{n \gamma(a)} \tag{2.7.1}
\end{equation*}
$$

The last conclusions is valid for any distribution but it is not very useful if $\gamma(a 0=0$. For the rest of this section, we will suppose:

$$
\begin{equation*}
\varphi(\theta)=E \exp \left(\theta X_{i}\right)<\infty \text { for some } \theta>0 \tag{H1}
\end{equation*}
$$

Let $\theta_{+}=\sup \{\theta: \phi(\theta)<\infty\}, \theta_{-}=\inf \{\theta: \phi(\theta)<\infty\}$ and note that $\phi(\theta)<\infty$ for $\theta \in\left(\theta_{-}, \theta_{+}\right)$. (H1) implies that $E X_{i}^{+}<\infty$ so $\mu=E X^{+}- E X^{-} \in[-\infty, \infty)$. If $\theta>0$ Chebyshev's inequality implies

$$
e^{\theta n a} P\left(S_{n} \geq n a\right) \leq E \exp \left(\theta S_{n}\right)=\varphi(\theta)^{n}
$$

or letting $\kappa(\theta)=\log \varphi(\theta)$

$$
\begin{equation*}
P\left(S_{n} \geq n a\right) \leq \exp (-n\{a \theta-\kappa(\theta)\}) \tag{2.7.2}
\end{equation*}
$$

Our first goal is to show:
Lemma 2.7.2. If $a>\mu$ and $\theta>0$ is small then $a \theta-\kappa(\theta)>0$.
Proof. $\kappa(0)=\log \varphi(0)=0$, so it suffices to show that (i) $\kappa$ is continuous at 0 , (ii) differentiable on $\left(0, \theta_{+}\right)$, and (iii) $\kappa^{\prime}(\theta) \rightarrow \mu$ as $\theta \rightarrow 0$. For then

$$
a \theta-\kappa(\theta)=\int_{0}^{\theta} a-\kappa^{\prime}(x) d x>0
$$

for small $\theta$.
Let $F(x)=P\left(X_{i} \leq x\right)$. To prove (i) we note that if $0<\theta<\theta_{0}<\theta_{-}$

$$
\begin{equation*}
e^{\theta x} \leq 1+e^{\theta_{0} x} \tag{*}
\end{equation*}
$$

so by the dominated convergence theorem as $\theta \rightarrow 0$

$$
\int e^{\theta x} d F \rightarrow \int 1 d F=1
$$

To prove (ii) we note that if $|h|<h_{0}$ then

$$
\left|e^{h x}-1\right|=\left|\int_{0}^{h x} e^{y} d y\right| \leq|h x| e^{h_{0} x}
$$

so an application of the dominated convergence theorem shows that

$$
\begin{aligned}
\varphi^{\prime}(\theta) & =\lim _{h \rightarrow 0} \frac{\varphi(\theta+h)-\varphi(\theta)}{h} \\
& =\lim _{h \rightarrow 0} \int \frac{e^{h x}-1}{h} e^{\theta x} d F(x) \\
& =\int x e^{\theta x} d F(x) \quad \text { for } \theta \in\left(0, \theta_{+}\right)
\end{aligned}
$$

From the last equation, it follows that $\kappa(\theta)=\log \phi(\theta)$ has $\kappa^{\prime}(\theta)= \phi^{\prime}(\theta) / \phi(\theta)$. Using ( $*$ ) and the dominated convergence theorem gives (iii) and the proof is complete.

Having found an upper bound on $P\left(S_{n} \geq n a\right)$, it is natural to optimize it by finding the maximum of $\theta a-\kappa(\theta)$ :

$$
\frac{d}{d \theta}\{\theta a-\log \varphi(\theta)\}=a-\varphi^{\prime}(\theta) / \varphi(\theta)
$$

so (assuming things are nice) the maximum occurs when $a=\varphi^{\prime}(\theta) / \varphi(\theta)$. To turn the parenthetical clause into a mathematical hypothesis we begin by defining

$$
F_{\theta}(x)=\frac{1}{\varphi(\theta)} \int_{-\infty}^{x} e^{\theta y} d F(y)
$$

whenever $\phi(\theta)<\infty$. It follows from the proof of Lemma 2.7.2 that if $\theta \in\left(\theta_{-}, \theta_{+}\right), F_{\theta}$ is a distribution function with mean

$$
\int x d F_{\theta}(x)=\frac{1}{\varphi(\theta)} \int_{-\infty}^{\infty} x e^{\theta x} d F(x)=\frac{\varphi^{\prime}(\theta)}{\varphi(\theta)}
$$

Repeating the proof in Lemma 2.7.2, it is easy to see that if $\theta \in\left(\theta_{-}, \theta_{+}\right)$ then

$$
\phi^{\prime \prime}(\theta)=\int_{-\infty}^{\infty} x^{2} e^{\theta x} d F(x)
$$

So we have

$$
\frac{d}{d \theta} \frac{\varphi^{\prime}(\theta)}{\varphi(\theta)}=\frac{\varphi^{\prime \prime}(\theta)}{\varphi(\theta)}-\left(\frac{\varphi^{\prime}(\theta)}{\varphi(\theta)}\right)^{2}=\int x^{2} d F_{\theta}(x)-\left(\int x d F_{\theta}(x)\right)^{2} \geq 0
$$

since the last expression is the variance of $F_{\theta}$. If we assume
(H2) the distribution $F$ is not a point mass at $\mu$
then $\varphi^{\prime}(\theta) / \varphi(\theta)$ is strictly increasing and $a \theta-\log \phi(\theta)$ is concave. Since we have $\varphi^{\prime}(0) / \varphi(0)=\mu$, this shows that for each $a>\mu$ there is at most one $\theta_{a} \geq 0$ that solves $a=\varphi^{\prime}\left(\theta_{a}\right) / \varphi\left(\theta_{a}\right)$, and this value of $\theta$ maximizes $a \theta-\log \varphi(\theta)$. Before discussing the existence of $\theta_{a}$ we will consider some examples.

## Example 2.7.3. Normal distribution.

$$
\int e^{\theta x}(2 \pi)^{-1 / 2} \exp \left(-x^{2} / 2\right) d x=\exp \left(\theta^{2} / 2\right) \int(2 \pi)^{-1 / 2} \exp \left(-(x-\theta)^{2} / 2\right) d x
$$

The integrand in the last integral is the density of a normal distribution with mean $\theta$ and variance 1 , so $\varphi(\theta)=\exp \left(\theta^{2} / 2\right), \theta \in(-\infty, \infty)$. In this case, $\varphi^{\prime}(\theta) / \varphi(\theta)=\theta$ and

$$
F_{\theta}(x)=e^{-\theta^{2} / 2} \int_{-\infty}^{x} e^{\theta y}(2 \pi)^{-1 / 2} e^{-y^{2} / 2} d y
$$

is a normal distribution with mean $\theta$ and variance 1 .

Example 2.7.4. Exponential distribution with parameter $\lambda$. If $\theta<\lambda$

$$
\int_{0}^{\infty} e^{\theta x} \lambda e^{-\lambda x} d x=\lambda /(\lambda-\theta)
$$

$\varphi^{\prime}(\theta) \varphi(\theta)=1 /(\lambda-\theta)$ and

$$
F_{\theta}(x)=\frac{\lambda}{\lambda-\theta} \int_{0}^{x} e^{\theta y} \lambda e^{-\lambda y} d y
$$

is an exponential distribution with parameter $\lambda-\theta$ and hence mean $1 /(\lambda-\theta)$.
Example 2.7.5. Coin flips. $P\left(X_{i}=1\right)=P\left(X_{i}=-1\right)=1 / 2$

$$
\begin{gathered}
\varphi(\theta)=\left(e^{\theta}+e^{-\theta}\right) / 2 \\
\varphi^{\prime}(\theta) / \varphi(\theta)=\left(e^{\theta}-e^{-\theta}\right) /\left(e^{\theta}+e^{-\theta}\right) \\
F_{\theta}(\{x\}) / F(\{x\})=e^{\theta x} / \phi(\theta) \text { so } \\
F_{\theta}(\{1\})=e^{\theta} /\left(e^{\theta}+e^{-\theta}\right) \text { and } F_{\theta}(\{-1\})=e^{-\theta} /\left(e^{\theta}+e^{-\theta}\right)
\end{gathered}
$$

Example 2.7.6. Perverted exponential. Let $g(x)=C x^{-3} e^{-x}$ for $x \geq 1, g(x)=0$ otherwise, and choose $C$ so that $g$ is a probability density. In this case,

$$
\varphi(\theta)=\int e^{\theta x} g(x) d x<\infty
$$

if and only if $\theta \leq 1$, and when $\theta \leq 1$, we have

$$
\frac{\varphi^{\prime}(\theta)}{\varphi(\theta)} \leq \frac{\varphi^{\prime}(1)}{\varphi(1)}=\int_{1}^{\infty} C x^{-2} d x / \int_{1}^{\infty} C x^{-3} d x=2
$$

Recall $\theta_{+}=\sup \{\theta: \varphi(\theta)<\infty\}$. In Examples 2.7.3 and 2.7.4, we have $\phi^{\prime}(\theta) / \phi(\theta) \uparrow \infty$ as $\theta \uparrow \theta_{+}$so we can solve $a=\phi^{\prime}(\theta) / \phi(\theta)$ for any $a>\mu$. In Example 2.7.5, $\phi^{\prime}(\theta) / \phi(\theta) \uparrow 1$ as $\theta \rightarrow \infty$, but we cannot hope for much more since $F$ and hence $F_{\theta}$ is supported on $\{-1,1\}$. Example 2.7.6 presents a problem since we cannot solve $a=\varphi^{\prime}(\theta) / \varphi(\theta)$ when $a>2$. Theorem 2.7.10 will cover this problem case, but first we will treat the cases in which we can solve the equation.
Theorem 2.7.7. Suppose in addition to (H1) and (H2) that there is a $\theta_{a} \in\left(0, \theta_{+}\right)$so that $a=\varphi^{\prime}\left(\theta_{a}\right) / \varphi\left(\theta_{a}\right)$. Then, as $n \rightarrow \infty$,

$$
n^{-1} \log P\left(S_{n} \geq n a\right) \rightarrow-a \theta_{a}+\log \varphi\left(\theta_{a}\right)
$$

Proof. The fact that the limsup of the left-hand side $\leq$ the right-hand side follows from (2.7.2). To prove the other inequality, pick $\lambda \in\left(\theta_{a}, \theta_{+}\right)$, let $X_{1}^{\lambda}, X_{2}^{\lambda}, \ldots$ be i.i.d. with distribution $F_{\lambda}$ and let $S_{n}^{\lambda}=X_{1}^{\lambda}+\cdots+ X_{n}^{\lambda}$. Writing $d F / d F_{\lambda}$ for the Radon-Nikodym derivative of the associated measures, it is immediate from the definition that $d F / d F_{\lambda}=e^{-\lambda x} \varphi(\lambda)$. If we let $F_{\lambda}^{n}$ and $F^{n}$ denote the distributions of $S_{n}^{\lambda}$ and $S_{n}$, then

Lemma 2.7.8. $\frac{d F^{n}}{d F_{\lambda}^{n}}=e^{-\lambda x} \varphi(\lambda)^{n}$.
Proof. We will prove this by induction. The result holds when $n=1$. For $n>1$, we note that

$$
\begin{aligned}
F^{n} & =F^{n-1} * F(z)=\int_{-\infty}^{\infty} d F^{n-1}(x) \int_{-\infty}^{z-x} d F(y) \\
& =\int d F_{\lambda}^{n-1}(x) \int d F_{\lambda}(y) 1_{(x+y \leq z)} e^{-\lambda(x+y)} \varphi(\lambda)^{n} \\
& =E\left(1_{\left(S_{n-1}^{\lambda}+X_{n}^{\lambda} \leq z\right)} e^{-\lambda\left(S_{n-1}^{\lambda}+X_{n}^{\lambda}\right)} \varphi(\lambda)^{n}\right) \\
& =\int_{-\infty}^{z} d F_{\lambda}^{n}(u) e^{-\lambda u} \varphi(\lambda)^{n}
\end{aligned}
$$

where in the last two equalities we have used Theorem 1.6.9 for $\left(S_{n-1}^{\lambda}, X_{n}^{\lambda}\right)$ and $S_{n}^{\lambda}$.

If $\nu>a$, then the lemma and monotonicity imply

$$
\begin{equation*}
P\left(S_{n} \geq n a\right) \geq \int_{n a}^{n \nu} e^{-\lambda x} \varphi(\lambda)^{n} d F_{\lambda}^{n}(x) \geq \varphi(\lambda)^{n} e^{-\lambda n \nu}\left(F_{\lambda}^{n}(n \nu)-F_{\lambda}^{n}(n a)\right) \tag{*}
\end{equation*}
$$

$F_{\lambda}$ has mean $\varphi^{\prime}(\lambda) / \varphi(\lambda)$, so if we have $a<\varphi^{\prime}(\lambda) / \varphi(\lambda)<\nu$, then the weak law of large numbers implies

$$
F_{\lambda}^{n}(n \nu)-F_{\lambda}^{n}(n a) \rightarrow 1 \text { as } n \rightarrow \infty
$$

From the last conclusion and ( $*$ ) it follows that

$$
\liminf _{n \rightarrow \infty} n^{-1} \log P\left(S_{n}>n a\right) \geq-\lambda \nu+\log \phi(\lambda)
$$

Since $\lambda>\theta_{a}$ and $\nu>a$ are arbitrary, the proof is complete.
To get a feel for what the answers look like, we consider our examples. To prepare for the computations, we recall some important information:

$$
\begin{aligned}
& \kappa(\theta)=\log \phi(\theta) \quad \kappa^{\prime}(\theta)=\phi^{\prime}(\theta) / \phi(\theta) \quad \theta_{a} \text { solves } \kappa^{\prime}\left(\theta_{a}\right)=a \\
& \gamma(a)=\lim _{n \rightarrow \infty}(1 / n) \log P\left(S_{n} \geq n a\right)=-a \theta_{a}+\kappa\left(\theta_{a}\right)
\end{aligned}
$$

Normal distribution (Example 2.7.3)

$$
\begin{aligned}
& \kappa(\theta)=\theta^{2} / 2 \quad \kappa^{\prime}(\theta)=\theta \quad \theta_{a}=a \\
& \gamma(a)=-a \theta_{a}+\kappa\left(\theta_{a}\right)=-a^{2} / 2
\end{aligned}
$$

One can check the last result by observing that $S_{n}$ has a normal distribution with mean 0 and variance $n$, and then using Theorem 1.2.6.

Exponential distribution (Example 2.7.4) with $\lambda=1$

$$
\begin{aligned}
& \kappa(\theta)=-\log (1-\theta) \quad \kappa^{\prime}(\theta)=1 /(1-\theta) \quad \theta_{a}=1-1 / a \\
& \gamma(a)=-a \theta_{a}+\kappa\left(\theta_{a}\right)=-a+1+\log a
\end{aligned}
$$

With these two examples as models, the reader should be able to do
Coin flips (Example 2.7.5). Here we take a different approach. To find the $\theta$ that makes the mean of $F_{\theta}=a$, we set $F_{\theta}(\{1\})=e^{\theta} /\left(e^{\theta}+e^{-\theta}\right)= (1+a) / 2$. Letting $x=e^{\theta}$ gives

$$
2 x=(1+a)\left(x+x^{-1}\right) \quad(a-1) x^{2}+(1+a)=0
$$

So $x=\sqrt{(1+a) /(1-a)}$ and $\theta_{a}=\log x=\{\log (1+a)-\log (1-a)\} / 2$.

$$
\begin{aligned}
& \phi\left(\theta_{a}\right)=\frac{e^{\theta_{a}}+e^{-\theta_{a}}}{2}=\frac{e^{\theta_{a}}}{1+a}=\frac{1}{\sqrt{(1+a)(1-a)}} \\
& \gamma(a)=-a \theta_{a}+\kappa\left(\theta_{a}\right)=-\{(1+a) \log (1+a)+(1-a) \log (1-a)\} / 2
\end{aligned}
$$

In Exercise 3.1.3, this result will be proved by a direct computation. Since the formula for $\gamma(a)$ is rather ugly, the following simpler bound in Exercise 2.7.4 is useful.

Turning now to the problematic values for which we cannot solve $a= \phi^{\prime}\left(\theta_{a}\right) / \phi\left(\theta_{a}\right)$
Theorem 2.7.9. Suppose $x_{o}=\sup \{x: F(x)<1\}<\infty$ and $F$ is not a point mass at $x_{0} . \phi(\theta)<\infty$ for all $\theta>0$ and $\phi^{\prime}(\theta) / \phi(\theta) \rightarrow x_{o}$ as $\theta \uparrow \infty$.
Proof. Since $P\left(X \leq x_{o}\right)=1, E e^{\theta X}<\infty$ for all $\theta>0$. Since $F_{\theta}$ is concentrated on $\left(-\infty, x_{o}\right]$ it is clear that $\mu_{\theta}=\phi^{\prime}(\theta) / \phi(\theta) \leq x_{o}$. On the other hand if $\delta>0$, then $P\left(X \geq x_{o}-\delta\right)=c_{\delta}>0, E e^{\theta X} \geq c_{\delta} e^{\theta\left(x_{o}-\delta\right)}$, and hence

$$
\begin{equation*}
F_{\theta}\left(x_{o}-2 \delta\right)=\frac{1}{\phi(\theta)} \int_{-\infty}^{x_{o}-2 \delta} e^{\theta x} d F(x) \leq \frac{e^{\left.x_{o}-2 \delta\right) \theta}}{c_{\delta} e^{\left(x_{o}-\delta\right) \theta}}=e^{-\theta \delta} / c_{\delta} \rightarrow 0 \tag{2.7.3}
\end{equation*}
$$

Since $\delta>0$ is arbitrary it follows that $\mu_{\theta} \rightarrow x_{o}$.
The result for $a=x_{o}$ is trivial:

$$
\frac{1}{n} \log P\left(S_{n} \geq n x_{o}\right)=\log P\left(X_{i}=x_{o}\right) \quad \text { for all } n
$$

We leave it to the reader to show that as $a \uparrow x_{o}, \gamma(a) \downarrow \log P\left(X_{i}=x_{o}\right)$.
When $x_{o}=\infty$ and $\theta_{+}=\infty$, the computation in (2.7.3) implies $\phi^{\prime}(\theta) / \phi(\theta) \uparrow \infty$ as $\theta \uparrow \infty$, so the only case that remains is covered by
Theorem 2.7.10. Suppose $x_{o}=\infty, \theta_{+}<\infty$, and $\varphi^{\prime}(\theta) / \varphi(\theta)$ increases to a finite limit $a_{0}$ as $\theta \uparrow \theta_{+}$. If $a_{0} \leq a<\infty$

$$
n^{-1} \log P\left(S_{n} \geq n a\right) \rightarrow-a \theta_{+}+\log \varphi\left(\theta_{+}\right)
$$

i.e., $\gamma(a)$ is linear for $a \geq a_{0}$.

Proof. Since $(\log \varphi(\theta))^{\prime}=\varphi^{\prime}(\theta) / \varphi(\theta)$, integrating from 0 to $\theta_{+}$shows that $\log \left(\varphi\left(\theta_{+}\right)\right)<\infty$. Letting $\theta=\theta_{+}$in (2.7.2) shows that the limsup of the left-hand side $\leq$ the right-hand side. To get the other direction we will use the transformed distribution $F_{\lambda}$, for $\lambda=\theta_{+}$. Letting $\theta \uparrow \theta_{+}$and using the dominated convergence theorem for $x \leq 0$ and the monotone convergence theorem for $x \geq 0$, we see that $F_{\lambda}$ has mean $a_{0}$. From ( $*$ ) in the proof of Theorem 2.7.7, we see that if $a_{0} \leq a<\nu=a+3 \epsilon$

$$
P\left(S_{n} \geq n a\right) \geq \varphi(\lambda)^{n} e^{-n \lambda \nu}\left(F_{\lambda}^{n}(n \nu)-F_{\lambda}^{n}(n a)\right)
$$

and hence

$$
\frac{1}{n} \log P\left(S_{n} \geq n a\right) \geq \log \varphi(\lambda)-\lambda \nu+\frac{1}{n} \log P\left(S_{n}^{\lambda} \in(n a, n \nu]\right)
$$

Letting $X_{1}^{\lambda}, X_{2}^{\lambda}, \ldots$ be i.i.d. with distribution $F_{\lambda}$ and $S_{n}^{\lambda}=X_{1}^{\lambda}+\cdots+X_{n}^{\lambda}$, we have

$$
\begin{aligned}
P\left(S_{n}^{\lambda} \in(n a, n \nu]\right) \geq & P\left\{S_{n-1}^{\lambda} \in\left(\left(a_{0}-\epsilon\right) n,\left(a_{0}+\epsilon\right) n\right]\right\} \\
& \cdot P\left\{X_{n}^{\lambda} \in\left(\left(a-a_{0}+\epsilon\right) n,\left(a-a_{0}+2 \epsilon\right) n\right]\right\} \\
\geq & \frac{1}{2} P\left\{X_{n}^{\lambda} \in\left(\left(a-a_{0}+\epsilon\right) n,\left(a-a_{0}+\epsilon\right)(n+1)\right]\right\}
\end{aligned}
$$

for large $n$ by the weak law of large numbers. To get a lower bound on the right-hand side of the last equation, we observe that

$$
\limsup _{n \rightarrow \infty} \frac{1}{n} \log P\left(X_{1}^{\lambda} \in\left(\left(a-a_{0}+\epsilon\right) n,\left(a-a_{0}+\epsilon\right)(n+1)\right]\right)=0
$$

for if the $\limsup$ was $<0$, we would have $E \exp \left(\eta X_{1}^{\lambda}\right)<\infty$ for some $\eta>0$ and hence $E \exp \left((\lambda+\eta) X_{1}\right)<\infty$, contradicting the definition of $\lambda=\theta_{+}$. To finish the argument now, we recall that Theorem 2.7.1 implies that

$$
\lim _{n \rightarrow \infty} \frac{1}{n} \log P\left(S_{n} \geq n a\right)=\gamma(a)
$$

exists, so our lower bound on the lim sup is good enough.
By adapting the proof of the last result, you can show that (H1) is necessary for exponential convergence:

## Exercises

2.7.1. Consider $\gamma(a)$ defined in (2.7.1). The following are equivalent: (a) $\gamma(a)=-\infty$, (b) $P\left(X_{1} \geq a\right)=0$, and (c) $P\left(S_{n} \geq n a\right)=0$ for all $n$.
2.7.2. Use the definition to conclude that if $\lambda \in[0,1]$ is rational then $\gamma(\lambda a+(1-\lambda) b) \geq \lambda \gamma(a)+(1-\lambda) \gamma(b)$. Use monotonicity to conclude that the last relationship holds for all $\lambda \in[0,1]$ so $\gamma$ is concave and hence Lipschitz continuous on compact subsets of $\gamma(a)>-\infty$.
2.7.3. Let $X_{1}, X_{2}, \ldots$ be i.i.d. Poisson with mean 1 , and let $S_{n}=X_{1}+ \cdots+X_{n}$. Find $\lim _{n \rightarrow \infty}(1 / n) \log P\left(S_{n} \geq n a\right)$ for $a>1$. The answer and another proof can be found in Exercise 3.1.4.
2.7.4. Show that for coin flips $\varphi(\theta) \leq \exp (\varphi(\theta)-1) \leq \exp \left(\beta \theta^{2}\right)$ for $\theta \leq 1$ where $\beta=\sum_{n=1}^{\infty} 1 /(2 n)!\approx 0.586$, and use (2.7.2) to conclude that $P\left(S_{n} \geq a n\right) \leq \exp \left(-n a^{2} / 4 \beta\right)$ for all $a \in[0,1]$. It is customary to simplify this further by using $\beta \leq \sum_{n=1}^{\infty} 2^{-n}=1$.
2.7.5. Suppose $E X_{i}=0$ and $E \exp \left(\theta X_{i}\right)=\infty$ for all $\theta>0$. Then

$$
\frac{1}{n} \log P\left(S_{n} \geq n a\right) \rightarrow 0 \text { for all } a>0
$$

2.7.6. Suppose $E X_{i}=0$. Show that if $\epsilon>0$ then

$$
\liminf _{n \rightarrow \infty} P\left(S_{n} \geq n a\right) / n P\left(X_{1} \geq n(a+\epsilon)\right) \geq 1
$$

Hint: Let $F_{n}=\left\{X_{i} \geq n(a+\epsilon)\right.$ for exactly one $\left.i \leq n\right\}$.

## Chapter 3

## Central Limit Theorems

The first four sections of this chapter develop the central limit theorem. The last five treat various extensions and complements. We begin this chapter by considering special cases of these results that can be treated by elementary computations.

### 3.1 The De Moivre-Laplace Theorem

Let $X_{1}, X_{2}, \ldots$ be i.i.d. with $P\left(X_{1}=1\right)=P\left(X_{1}=-1\right)=1 / 2$ and let $S_{n}=X_{1}+\cdots+X_{n}$. In words, we are betting $\$ 1$ on the flipping of a fair coin and $S_{n}$ is our winnings at time $n$. If $n$ and $k$ are integers

$$
P\left(S_{2 n}=2 k\right)=\binom{2 n}{n+k} 2^{-2 n}
$$

since $S_{2 n}=2 k$ if and only if there are $n+k$ flips that are +1 and $n-k$ flips that are -1 in the first $2 n$. The first factor gives the number of such outcomes and the second the probability of each one. Stirling's formula (see Feller, Vol. I. (1968), p. 52) tells us

$$
\begin{equation*}
n!\sim n^{n} e^{-n} \sqrt{2 \pi n} \quad \text { as } n \rightarrow \infty \tag{3.1.1}
\end{equation*}
$$

where $a_{n} \sim b_{n}$ means $a_{n} / b_{n} \rightarrow 1$ as $n \rightarrow \infty$, so

$$
\begin{aligned}
\binom{2 n}{n+k} & =\frac{(2 n)!}{(n+k)!(n-k)!} \\
& \sim \frac{(2 n)^{2 n}}{(n+k)^{n+k}(n-k)^{n-k}} \cdot \frac{(2 \pi(2 n))^{1 / 2}}{(2 \pi(n+k))^{1 / 2}(2 \pi(n-k))^{1 / 2}}
\end{aligned}
$$

and we have

$$
\begin{align*}
\binom{2 n}{n+k} 2^{-2 n} & \sim\left(1+\frac{k}{n}\right)^{-n-k} \cdot\left(1-\frac{k}{n}\right)^{-n+k} \\
\cdot & (\pi n)^{-1 / 2} \cdot\left(1+\frac{k}{n}\right)^{-1 / 2} \cdot\left(1-\frac{k}{n}\right)^{-1 / 2} \tag{3.1.2}
\end{align*}
$$

The first two terms on the right are

$$
=\left(1-\frac{k^{2}}{n^{2}}\right)^{-n} \cdot\left(1+\frac{k}{n}\right)^{-k} \cdot\left(1-\frac{k}{n}\right)^{k}
$$

A little calculus shows that:
Lemma 3.1.1. If $c_{j} \rightarrow 0, a_{j} \rightarrow \infty$ and $a_{j} c_{j} \rightarrow \lambda$ then $\left(1+c_{j}\right)^{a_{j}} \rightarrow e^{\lambda}$.
Proof. As $x \rightarrow 0, \log (1+x) / x \rightarrow 1$, so $a_{j} \log \left(1+c_{j}\right) \rightarrow \lambda$ and the desired result follows.

Using Lemma 3.1.1 now, we see that if $2 k=x \sqrt{2 n}$, i.e., $k=x \sqrt{n / 2}$, then

$$
\begin{aligned}
\left(1-\frac{k^{2}}{n^{2}}\right)^{-n} & =\left(1-x^{2} / 2 n\right)^{-n} \rightarrow e^{x^{2} / 2} \\
\left(1+\frac{k}{n}\right)^{-k} & =(1+x / \sqrt{2 n})^{-x \sqrt{n / 2}} \rightarrow e^{-x^{2} / 2} \\
\left(1-\frac{k}{n}\right)^{k} & =(1-x / \sqrt{2 n})^{x \sqrt{n / 2}} \rightarrow e^{-x^{2} / 2}
\end{aligned}
$$

For this choice of $k, k / n \rightarrow 0$, so

$$
\left(1+\frac{k}{n}\right)^{-1 / 2} \cdot\left(1-\frac{k}{n}\right)^{-1 / 2} \rightarrow 1
$$

and putting things together gives:
Theorem 3.1.2. If $2 k / \sqrt{2 n} \rightarrow x$ then $P\left(S_{2 n}=2 k\right) \sim(\pi n)^{-1 / 2} e^{-x^{2} / 2}$.
Our next step is to compute

$$
P\left(a \sqrt{2 n} \leq S_{2 n} \leq b \sqrt{2 n}\right)=\sum_{m \in[a \sqrt{2 n}, b \sqrt{2 n}] \cap 2 \mathbf{Z}} P\left(S_{2 n}=m\right)
$$

Changing variables $m=x \sqrt{2 n}$, we have that the above is

$$
\approx \sum_{x \in[a, b] \cap(2 \mathbf{Z} / \sqrt{2 n})}(2 \pi)^{-1 / 2} e^{-x^{2} / 2} \cdot(2 / n)^{1 / 2}
$$

where $2 \mathbf{Z} / \sqrt{2 n}=\{2 z / \sqrt{2 n}: z \in \mathbf{Z}\}$. We have multiplied and divided by $\sqrt{2}$ since the space between points in the sum is $(2 / n)^{1 / 2}$, so if $n$ is large the sum above is

$$
\approx \int_{a}^{b}(2 \pi)^{-1 / 2} e^{-x^{2} / 2} d x
$$

The integrand is the density of the (standard) normal distribution, so changing notation we can write the last quantity as $P(a \leq \chi \leq b)$ where $\chi$ is a random variable with that distribution.

It is not hard to fill in the details to get:

