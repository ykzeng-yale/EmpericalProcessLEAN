Theorem 3.1.3. The De Moivre-Laplace Theorem. If $a<b$ then as $m \rightarrow \infty$

$$
P\left(a \leq S_{m} / \sqrt{m} \leq b\right) \rightarrow \int_{a}^{b}(2 \pi)^{-1 / 2} e^{-x^{2} / 2} d x
$$

(To remove the restriction to even integers observe $S_{2 n+1}=S_{2 n} \pm 1$.) The last result is a special case of the central limit theorem given in Section 3.4, so further details are left to the reader.

## Exercises

3.1.1. Generalize the proof of Lemma 3.1.1 to conclude that if $\max _{1 \leq j \leq n}\left|c_{j, n}\right| \rightarrow 0, \sum_{j=1}^{n} c_{j, n} \rightarrow \lambda$, and $\sup _{n} \sum_{j=1}^{n}\left|c_{j, n}\right|<\infty$ then $\prod_{j=1}^{n}\left(1+c_{j, n}\right) \rightarrow e^{\lambda}$.

The next three exercises illustrate the use of Stirling's formula. In them, $X_{1}, X_{2}, \ldots$ are i.i.d. and $S_{n}=X_{1}+\cdots+X_{n}$.
3.1.2. If the $X_{i}$ have a Poisson distribution with mean 1 , then $S_{n}$ has a Poisson distribution with mean $n$, i.e., $P\left(S_{n}=k\right)=e^{-n} n^{k} / k!$ Use Stirling's formula to show that if $(k-n) / \sqrt{n} \rightarrow x$ then

$$
\sqrt{2 \pi n} P\left(S_{n}=k\right) \rightarrow \exp \left(-x^{2} / 2\right)
$$

As in the case of coin flips it follows that

$$
P\left(a \leq\left(S_{n}-n\right) / \sqrt{n} \leq b\right) \rightarrow \int_{a}^{b}(2 \pi)^{-1 / 2} e^{-x^{2} / 2} d x
$$

but proving the last conclusion is not part of the exercise.
In the next two examples you should begin by considering $P\left(S_{n}=k\right)$ when $k / n \rightarrow a$ and then relate $P\left(S_{n}=j+1\right)$ to $P\left(S_{n}=j\right)$ to show $P\left(S_{n} \geq k\right) \leq C P\left(S_{n}=k\right)$.
3.1.3. Suppose $P\left(X_{i}=1\right)=P\left(X_{i}=-1\right)=1 / 2$. Show that if $a \in(0,1)$

$$
\frac{1}{2 n} \log P\left(S_{2 n} \geq 2 n a\right) \rightarrow-\gamma(a)
$$

where $\gamma(a)=\frac{1}{2}\{(1+a) \log (1+a)+(1-a) \log (1-a)\}$.
3.1.4. Suppose $P\left(X_{i}=k\right)=e^{-1} / k!$ for $k=0,1, \ldots$. Show that if $a>1$

$$
\frac{1}{n} \log P\left(S_{n} \geq n a\right) \rightarrow a-1-a \log a
$$

### 3.2 Weak Convergence

In this section, we will define the type of convergence that appears in the central limit theorem and explore some of its properties. A sequence of distribution functions is said to converge weakly to a limit $F$ (written $\left.F_{n} \Rightarrow F\right)$ if $F_{n}(y) \rightarrow F(y)$ for all $y$ that are continuity points of $F$. A sequence of random variables $X_{n}$ is said to converge weakly or converge in distribution to a limit $X_{\infty}$ (written $X_{n} \Rightarrow X_{\infty}$ ) if their distribution functions $F_{n}(x)=P\left(X_{n} \leq x\right)$ converge weakly. To see that convergence at continuity points is enough to identify the limit, observe that $F$ is right continuous and by Exercise 1.2.3, the discontinuities of $F$ are at most a countable set.

### 3.2.1 Examples

Two examples of weak convergence that we have seen earlier are:
Example 3.2.1. Let $X_{1}, X_{2} \ldots$ be i.i.d. with $P\left(X_{i}=1\right)=P\left(X_{i}=\right. -1)=1 / 2$ and let $S_{n}=X_{1}+\cdots+X_{n}$. Then Theorem 3.1.3 implies

$$
F_{n}(y)=P\left(S_{n} / \sqrt{n} \leq y\right) \rightarrow \int_{-\infty}^{y}(2 \pi)^{-1 / 2} e^{-x^{2} / 2} d x
$$

Example 3.2.2. Let $X_{1}, X_{2}, \ldots$ be i.i.d. with distribution $F$. The GlivenkoCantelli theorem (Theorem 8.4.1) implies that for almost every $\omega$,

$$
F_{n}(y)=n^{-1} \sum_{m=1}^{n} 1_{\left(X_{m}(\omega) \leq y\right)} \rightarrow F(y) \text { for all } y
$$

In the last two examples convergence occurred for all $y$, even though in the second case the distribution function could have discontinuities. The next example shows why we restrict our attention to continuity points.

Example 3.2.3. Let $X$ have distribution $F$. Then $X+1 / n$ has distribution

$$
F_{n}(x)=P(X+1 / n \leq x)=F(x-1 / n)
$$

As $n \rightarrow \infty, F_{n}(x) \rightarrow F(x-)=\lim _{y \uparrow x} F(y)$ so convergence only occurs at continuity points.

Example 3.2.4. Waiting for rare events. Let $X_{p}$ be the number of trials needed to get a success in a sequence of independent trials with success probability $p$. Then $P\left(X_{p} \geq n\right)=(1-p)^{n-1}$ for $n=1,2,3, \ldots$ and it follows from Lemma 3.1.1 that as $p \rightarrow 0$,

$$
P\left(p X_{p}>x\right) \rightarrow e^{-x} \quad \text { for all } x \geq 0
$$

In words, $p X_{p}$ converges weakly to an exponential distribution.

Example 3.2.5. Birthday problem. Let $X_{1}, X_{2}, \ldots$ be independent and uniformly distributed on $\{1, \ldots, N\}$, and let $T_{N}=\min \left\{n: X_{n}=X_{m}\right.$ for some $m<n\}$.

$$
P\left(T_{N}>n\right)=\prod_{m=2}^{n}\left(1-\frac{m-1}{N}\right)
$$

When $N=365$ this is the probability that two people in a group of size $n$ do not have the same birthday (assuming all birthdays are equally likely). Using Exercise 3.1.1, it is easy to see that

$$
P\left(T_{N} / N^{1 / 2}>x\right) \rightarrow \exp \left(-x^{2} / 2\right) \text { for all } x \geq 0
$$

Taking $N=365$ and noting $22 / \sqrt{365}=1.1515$ and $(1.1515)^{2} / 2=0.6630$, this says that

$$
P\left(T_{365}>22\right) \approx e^{-0.6630} \approx 0.515
$$

This answer is $2 \%$ smaller than the true probability 0.524 .
Before giving our sixth example, we need a simple result called Scheffé's Theorem. Suppose we have probability densities $f_{n}, 1 \leq n \leq \infty$, and $f_{n} \rightarrow f_{\infty}$ pointwise as $n \rightarrow \infty$. Then for all Borel sets $B$

$$
\begin{aligned}
\left|\int_{B} f_{n}(x) d x-\int_{B} f_{\infty}(x) d x\right| & \leq \int\left|f_{n}(x)-f_{\infty}(x)\right| d x \\
& =2 \int\left(f_{\infty}(x)-f_{n}(x)\right)^{+} d x \rightarrow 0
\end{aligned}
$$

by the dominated convergence theorem, the equality following from the fact that the $f_{n} \geq 0$ and have integral $=1$. Writing $\mu_{n}$ for the corresponding measures, we have shown that the total variation norm

$$
\left\|\mu_{n}-\mu_{\infty}\right\| \equiv \sup _{B}\left|\mu_{n}(B)-\mu_{\infty}(B)\right| \rightarrow 0
$$

a conclusion stronger than weak convergence. (Take $B=(-\infty, x]$.) The example $\mu_{n}=a$ point mass at $1 / n$ (with $1 / \infty=0$ ) shows that we may have $\mu_{n} \Rightarrow \mu_{\infty}$ with $\left\|\mu_{n}-\mu_{\infty}\right\|=1$ for all $n$.

Example 3.2.6. Central order statistic. Put ( $2 n+1$ ) points at random in ( 0,1 ), i.e., with locations that are independent and uniformly distributed. Let $V_{n+1}$ be the $(n+1)$ th largest point. It is easy to see that

Lemma 3.2.7. $V_{n+1}$ has density function

$$
f_{V_{n+1}}(x)=(2 n+1)\binom{2 n}{n} x^{n}(1-x)^{n}
$$

Proof. There are $2 n+1$ ways to pick the observation that falls at $x$, then we have to pick $n$ indices for observations $<x$, which can be done in $\binom{2 n}{n}$ ways. Once we have decided on the indices that will land $<x$ and $>x$, the probability the corresponding random variables will do what we want is $x^{n}(1-x)^{n}$, and the probability density that the remaining one will land at $x$ is 1 . If you don't like the previous sentence compute the probability $X_{1}<x-\epsilon, \ldots, X_{n}<x-\epsilon, x-\epsilon<X_{n+1}<x+\epsilon$, $X_{n+2}>x+\epsilon, \ldots X_{2 n+1}>x+\epsilon$ then let $\epsilon \rightarrow 0$.

To compute the density function of $Y_{n}=2\left(V_{n+1}-1 / 2\right) \sqrt{2 n}$, we use Exercise 1.2.5, or simply change variables $x=1 / 2+y / 2 \sqrt{2 n}, d x= d y / 2 \sqrt{2 n}$ to get

$$
\begin{aligned}
f_{Y_{n}}(y) & =(2 n+1)\binom{2 n}{n}\left(\frac{1}{2}+\frac{y}{2 \sqrt{2 n}}\right)^{n}\left(\frac{1}{2}-\frac{y}{2 \sqrt{2 n}}\right)^{n} \frac{1}{2 \sqrt{2 n}} \\
& =\binom{2 n}{n} 2^{-2 n} \cdot\left(1-y^{2} / 2 n\right)^{n} \cdot \frac{2 n+1}{2 n} \cdot \sqrt{\frac{n}{2}}
\end{aligned}
$$

The first factor is $P\left(S_{2 n}=0\right)$ for a simple random walk so Theorem 3.1.2 and Lemma 3.1.1 imply that

$$
f_{Y_{n}}(y) \rightarrow(2 \pi)^{-1 / 2} \exp \left(-y^{2} / 2\right) \text { as } n \rightarrow \infty
$$

Here and in what follows we write $P\left(Y_{n}=y\right)$ for the density function of $Y_{n}$. Using Scheffé's theorem now, we conclude that $Y_{n}$ converges weakly to a standard normal distribution.

### 3.2.2 Theory

The next result is useful for proving things about weak convergence.
Theorem 3.2.8. If $F_{n} \Rightarrow F_{\infty}$ then there are random variables $Y_{n}, 1 \leq n \leq \infty$, with distribution $F_{n}$ so that $Y_{n} \rightarrow Y_{\infty}$ a.s.

Proof. Let $\Omega=(0,1), \mathcal{F}=$ Borel sets, $P=$ Lebesgue measure, and let $Y_{n}(x)=\sup \left\{y: F_{n}(y)<x\right\}$. By Theorem 1.2.2, $Y_{n}$ has distribution $F_{n}$. We will now show that $Y_{n}(x) \rightarrow Y_{\infty}(x)$ for all but a countable number of $x$. To do this, it is convenient to write $Y_{n}(x)$ as $F_{n}^{-1}(x)$ and drop the subscript when $n=\infty$. We begin by identifying the exceptional set. Let $a_{x}=\sup \{y: F(y)<x\}, b_{x}=\inf \{y: F(y)>x\}$, and $\Omega_{0}= \left\{x:\left(a_{x}, b_{x}\right)=\emptyset\right\}$ where $\left(a_{x}, b_{x}\right)$ is the open interval with the indicated endpoints. $\Omega-\Omega_{0}$ is countable since the ( $a_{x}, b_{x}$ ) are disjoint and each nonempty interval contains a different rational number. If $x \in \Omega_{0}$ then $F(y)<x$ for $y<F^{-1}(x)$ and $F(z)>x$ for $z>F^{-1}(x)$. To prove that $F_{n}^{-1}(x) \rightarrow F^{-1}(x)$ for $x \in \Omega_{0}$, there are two things to show:
(a) $\liminf _{n \rightarrow \infty} F_{n}^{-1}(x) \geq F^{-1}(x)$

Proof of (a). Let $y<F^{-1}(x)$ be such that $F$ is continuous at $y$. Since $x \in \Omega_{0}, F(y)<x$ and if $n$ is sufficiently large $F_{n}(y)<x$, i.e., $F_{n}^{-1}(x) \geq y$. Since this holds for all $y$ satisfying the indicated restrictions, the result follows.
(b) $\limsup \sup _{n \rightarrow \infty} F_{n}^{-1}(x) \leq F^{-1}(x)$

Proof of (b). Let $y>F^{-1}(x)$ be such that $F$ is continuous at $y$. Since $x \in \Omega_{0}, F(y)>x$ and if $n$ is sufficiently large $F_{n}(y)>x$, i.e., $F_{n}^{-1}(x) \leq y$. Since this holds for all $y$ satisfying the indicated restrictions, the result follows and we have completed the proof.

Theorem 3.2.8 allows us to immediately generalize some of our earlier results.

The next result illustrates the usefulness of Theorem 3.2.8 and gives an equivalent definition of weak convergence that makes sense in any topological space.

Theorem 3.2.9. $X_{n} \Rightarrow X_{\infty}$ if and only if for every bounded continuous function $g$ we have $\operatorname{Eg}\left(X_{n}\right) \rightarrow \operatorname{Eg}\left(X_{\infty}\right)$.

Proof. Let $Y_{n}$ have the same distribution as $X_{n}$ and converge a.s. Since $g$ is continuous $g\left(Y_{n}\right) \rightarrow g\left(Y_{\infty}\right)$ a.s. and the bounded convergence theorem implies

$$
E g\left(X_{n}\right)=E g\left(Y_{n}\right) \rightarrow E g\left(Y_{\infty}\right)=E g\left(X_{\infty}\right)
$$

To prove the converse let

$$
g_{x, \epsilon}(y)= \begin{cases}1 & y \leq x \\ 0 & y \geq x+\epsilon \\ \text { linear } & x \leq y \leq x+\epsilon\end{cases}
$$

Since $g_{x, \epsilon}(y)=1$ for $y \leq x, g_{x, \epsilon}$ is continuous, and $g_{x, \epsilon}(y)=0$ for $y>x+\epsilon$,

$$
\limsup _{n \rightarrow \infty} P\left(X_{n} \leq x\right) \leq \limsup _{n \rightarrow \infty} E g_{x, \epsilon}\left(X_{n}\right)=E g_{x, \epsilon}\left(X_{\infty}\right) \leq P\left(X_{\infty} \leq x+\epsilon\right)
$$

Letting $\epsilon \rightarrow 0$ gives $\limsup _{n \rightarrow \infty} P\left(X_{n} \leq x\right) \leq P\left(X_{\infty} \leq x\right)$. The last conclusion is valid for any $x$. To get the other direction, we observe

$$
\liminf _{n \rightarrow \infty} P\left(X_{n} \leq x\right) \geq \liminf _{n \rightarrow \infty} E g_{x-\epsilon, \epsilon}\left(X_{n}\right)=E g_{x-\epsilon, \epsilon}\left(X_{\infty}\right) \geq P\left(X_{\infty} \leq x-\epsilon\right)
$$

Letting $\epsilon \rightarrow 0$ gives $\liminf _{n \rightarrow \infty} P\left(X_{n} \leq x\right) \geq P\left(X_{\infty}<x\right)=P\left(X_{\infty} \leq x\right)$ if $x$ is a continuity point. The results for the limsup and the liminf combine to give the desired result.

The next result is a trivial but useful generalization of Theorem 3.2.9.

Theorem 3.2.10. Continuous mapping theorem. Let $g$ be a measurable function and $D_{g}=\{x: g$ is discontinuous at $x\}$. If $X_{n} \Rightarrow X_{\infty}$ and $P\left(X_{\infty} \in D_{g}\right)=0$ then $g\left(X_{n}\right) \Rightarrow g(X)$. If in addition $g$ is bounded then $\operatorname{Eg}\left(X_{n}\right) \rightarrow \operatorname{Eg}\left(X_{\infty}\right)$.

Remark. $D_{g}$ is always a Borel set. See Exercise 1.3.6.
Proof. Let $Y_{n}={ }_{d} X_{n}$ with $Y_{n} \rightarrow Y_{\infty}$ a.s. If $f$ is continuous then $D_{f \circ g} \subset D_{g}$ so $P\left(Y_{\infty} \in D_{\text {fog }}\right)=0$ and it follows that $f\left(g\left(Y_{n}\right)\right) \rightarrow f\left(g\left(Y_{\infty}\right)\right)$ a.s. If, in addition, $f$ is bounded then the bounded convergence theorem implies $E f\left(g\left(Y_{n}\right)\right) \rightarrow E f\left(g\left(Y_{\infty}\right)\right)$. Since this holds for all bounded continuous functions, it follows from Theorem 3.2.9 that $g\left(X_{n}\right) \Rightarrow g\left(X_{\infty}\right)$.

The second conclusion is easier. Since $P\left(Y_{\infty} \in D_{g}\right)=0, g\left(Y_{n}\right) \rightarrow g\left(Y_{\infty}\right)$ a.s., and the desired result follows from the bounded convergence theorem.

The next result provides a number of useful alternative definitions of weak convergence.

Theorem 3.2.11. The following statements are equivalent: (i) $X_{n} \Rightarrow X_{\infty}$
(ii) For all open sets $G, \liminf _{n \rightarrow \infty} P\left(X_{n} \in G\right) \geq P\left(X_{\infty} \in G\right)$.
(iii) For all closed sets $K, \limsup _{n \rightarrow \infty} P\left(X_{n} \in K\right) \leq P\left(X_{\infty} \in K\right)$.
(iv) For all Borel sets $A$ with $P\left(X_{\infty} \in \partial A\right)=0, \lim _{n \rightarrow \infty} P\left(X_{n} \in A\right)= P\left(X_{\infty} \in A\right)$.

Remark. To help remember the directions of the inequalities in (ii) and (iii), consider the special case in which $P\left(X_{n}=x_{n}\right)=1$. In this case, if $x_{n} \in G$ and $x_{n} \rightarrow x_{\infty} \in \partial G$, then $P\left(X_{n} \in G\right)=1$ for all $n$ but $P\left(X_{\infty} \in G\right)=0$. Letting $K=G^{c}$ gives an example for (iii).

Proof. We will prove four things and leave it to the reader to check that we have proved the result given above.
(i) implies (ii): Let $Y_{n}$ have the same distribution as $X_{n}$ and $Y_{n} \rightarrow Y_{\infty}$ a.s. Since $G$ is open

$$
\liminf _{n \rightarrow \infty} 1_{G}\left(Y_{n}\right) \geq 1_{G}\left(Y_{\infty}\right)
$$

so Fatou's Lemma implies

$$
\liminf _{n \rightarrow \infty} P\left(Y_{n} \in G\right) \geq P\left(Y_{\infty} \in G\right)
$$

(ii) is equivalent to (iii): This follows easily from: $A$ is open if and only if $A^{c}$ is closed and $P(A)+P\left(A^{c}\right)=1$.
(ii) and (iii) imply (iv): Let $K=\bar{A}$ and $G=A^{o}$ be the closure and interior of $A$ respectively. The boundary of $A, \partial A=\bar{A}-A^{o}$ and $P\left(X_{\infty} \in\right. \partial A)=0$ so

$$
P\left(X_{\infty} \in K\right)=P\left(X_{\infty} \in A\right)=P\left(X_{\infty} \in G\right)
$$

Using (ii) and (iii) now

$$
\begin{aligned}
& \limsup _{n \rightarrow \infty} P\left(X_{n} \in A\right) \leq \limsup _{n \rightarrow \infty} P\left(X_{n} \in K\right) \leq P\left(X_{\infty} \in K\right)=P\left(X_{\infty} \in A\right) \\
& \liminf _{n \rightarrow \infty} P\left(X_{n} \in A\right) \geq \liminf _{n \rightarrow \infty} P\left(X_{n} \in G\right) \geq P\left(X_{\infty} \in G\right)=P\left(X_{\infty} \in A\right)
\end{aligned}
$$

(iv) implies (i): Let $x$ be such that $P\left(X_{\infty}=x\right)=0$, i.e., $x$ is a continuity point of $F$, and let $A=(-\infty, x]$.

The next result is useful in studying limits of sequences of distributions.

Theorem 3.2.12. Helly's selection theorem. For every sequence $F_{n}$ of distribution functions, there is a subsequence $F_{n(k)}$ and a right continuous nondecreasing function $F$ so that $\lim _{k \rightarrow \infty} F_{n(k)}(y)=F(y)$ at all continuity points y of $F$.

Remark. The limit may not be a distribution function. For example if $a+b+c=1$ and $F_{n}(x)=a 1_{(x \geq n)}+b 1_{(x \geq-n)}+c G(x)$ where $G$ is a distribution function, then $F_{n}(x) \rightarrow F(x)=b+c G(x)$,

$$
\lim _{x \downarrow-\infty} F(x)=b \quad \text { and } \quad \lim _{x \uparrow \infty} F(x)=b+c=1-a
$$

In words, an amount of mass $a$ escapes to $+\infty$, and mass $b$ escapes to $-\infty$. The type of convergence that occurs in Theorem 3.2.12 is sometimes called vague convergence, and will be denoted here by $\Rightarrow_{v}$.

Proof. The first step is a diagonal argument. Let $q_{1}, q_{2}, \ldots$ be an enumeration of the rationals. Since for each $k, F_{m}\left(q_{k}\right) \in[0,1]$ for all $m$, there is a sequence $m_{k}(i) \rightarrow \infty$ that is a subsequence of $m_{k-1}(j)$ (let $m_{0}(j) \equiv j$ ) so that

$$
F_{m_{k}(i)}\left(q_{k}\right) \text { converges to } G\left(q_{k}\right) \text { as } i \rightarrow \infty
$$

Let $F_{n(k)}=F_{m_{k}(k)}$. By construction $F_{n(k)}(q) \rightarrow G(q)$ for all rational $q$. The function $G$ may not be right continuous but $F(x)=\inf \{G(q): q \in \mathbf{Q}, q>x\}$ is since

$$
\begin{aligned}
\lim _{x_{n} \downarrow x} F\left(x_{n}\right) & =\inf \left\{G(q): q \in \mathbf{Q}, q>x_{n} \text { for some } n\right\} \\
& =\inf \{G(q): q \in \mathbf{Q}, q>x\}=F(x)
\end{aligned}
$$

To complete the proof, let $x$ be a continuity point of $F$. Pick rationals $r_{1}, r_{2}, s$ with $r_{1}<r_{2}<x<s$ so that

$$
F(x)-\epsilon<F\left(r_{1}\right) \leq F\left(r_{2}\right) \leq F(x) \leq F(s)<F(x)+\epsilon
$$

Since $F_{n(k)}\left(r_{2}\right) \rightarrow G\left(r_{2}\right) \geq F\left(r_{1}\right)$, and $F_{n(k)}(s) \rightarrow G(s) \leq F(s)$ it follows that if $k$ is large

$$
F(x)-\epsilon<F_{n(k)}\left(r_{2}\right) \leq F_{n(k)}(x) \leq F_{n(k)}(s)<F(x)+\epsilon
$$

which is the desired conclusion.
The last result raises a question: When can we conclude that no mass is lost in the limit in Theorem 3.2.12?

Theorem 3.2.13. Every subsequential limit is the distribution function of a probability measure if and only if the sequence $F_{n}$ is tight, i.e., for all $\epsilon>0$ there is an $M_{\epsilon}$ so that

$$
\limsup _{n \rightarrow \infty} 1-F_{n}\left(M_{\epsilon}\right)+F_{n}\left(-M_{\epsilon}\right) \leq \epsilon
$$

Proof. Suppose the sequence is tight and $F_{n(k)} \Rightarrow_{v} F$. Let $r<-M_{\epsilon}$ and $s>M_{\epsilon}$ be continuity points of $F$. Since $F_{n}(r) \rightarrow F(r)$ and $F_{n}(s) \rightarrow F(s)$, we have

$$
\begin{aligned}
1-F(s)+F(r) & =\lim _{k \rightarrow \infty} 1-F_{n(k)}(s)+F_{n(k)}(r) \\
& \leq \limsup _{n \rightarrow \infty} 1-F_{n}\left(M_{\epsilon}\right)+F_{n}\left(-M_{\epsilon}\right) \leq \epsilon
\end{aligned}
$$

The last result implies $\limsup _{x \rightarrow \infty} 1-F(x)+F(-x) \leq \epsilon$. Since $\epsilon$ is arbitrary it follows that $F$ is the distribution function of a probability measure.

To prove the converse now suppose $F_{n}$ is not tight. In this case, there is an $\epsilon>0$ and a subsequence $n(k) \rightarrow \infty$ so that

$$
1-F_{n(k)}(k)+F_{n(k)}(-k) \geq \epsilon
$$

for all $k$. By passing to a further subsequence $F_{n\left(k_{j}\right)}$ we can suppose that $F_{n\left(k_{j}\right)} \Rightarrow_{v} F$. Let $r<0<s$ be continuity points of $F$.

$$
\begin{aligned}
1-F(s)+F(r) & =\lim _{j \rightarrow \infty} 1-F_{n\left(k_{j}\right)}(s)+F_{n\left(k_{j}\right)}(r) \\
& \geq \liminf _{j \rightarrow \infty} 1-F_{n\left(k_{j}\right)}\left(k_{j}\right)+F_{n\left(k_{j}\right)}\left(-k_{j}\right) \geq \epsilon
\end{aligned}
$$

Letting $s \rightarrow \infty$ and $r \rightarrow-\infty$, we see that $F$ is not the distribution function of a probability measure.

The following sufficient condition for tightness is often useful.

Theorem 3.2.14. If there is a $\varphi \geq 0$ so that $\varphi(x) \rightarrow \infty$ as $|x| \rightarrow \infty$ and

$$
C=\sup _{n} \int \varphi(x) d F_{n}(x)<\infty
$$

then $F_{n}$ is tight.
Proof. $1-F_{n}(M)+F_{n}(-M) \leq C / \inf _{|x| \geq M} \varphi(x)$.
Exercises 3.2.6 and 3.2.7 define metrics for convergence in distribution. The fact that convergence in distribution comes from a metric immediately implies

Theorem 3.2.15. If each subsequence of $X_{n}$ has a further subsequence that converges to $X$ then $X_{n} \Rightarrow X$.

We will prove this again at the end of the proof of Theorem 3.3.17.

## Exercises

3.2.1. Give an example of random variables $X_{n}$ with densities $f_{n}$ so that $X_{n} \Rightarrow$ a uniform distribution on $(0,1)$ but $f_{n}(x)$ does not converge to 1 for any $x \in[0,1]$.
3.2.2. Convergence of maxima. Let $X_{1}, X_{2}, \ldots$ be independent with distribution $F$, and let $M_{n}=\max _{m \leq n} X_{m}$. Then $P\left(M_{n} \leq x\right)=F(x)^{n}$. Prove the following limit laws for $M_{n}$ :
(i) If $F(x)=1-x^{-\alpha}$ for $x \geq 1$ where $\alpha>0$ then for $y>0$

$$
P\left(M_{n} / n^{1 / \alpha} \leq y\right) \rightarrow \exp \left(-y^{-\alpha}\right)
$$

(ii) If $F(x)=1-|x|^{\beta}$ for $-1 \leq x \leq 0$ where $\beta>0$ then for $y<0$

$$
P\left(n^{1 / \beta} M_{n} \leq y\right) \rightarrow \exp \left(-|y|^{\beta}\right)
$$

(iii) If $F(x)=1-e^{-x}$ for $x \geq 0$ then for all $y \in(-\infty, \infty)$

$$
P\left(M_{n}-\log n \leq y\right) \rightarrow \exp \left(-e^{-y}\right)
$$

The limits that appear above are called the extreme value distributions. The last one is called the double exponential or Gumbel distribution. Necessary and sufficient conditions for $\left(M_{n}-b_{n}\right) / a_{n}$ to converge to these limits were obtained by Gnedenko (1943). For a recent treatment, see Resnick (1987).
3.2.3. Let $X_{1}, X_{2}, \ldots$ be i.i.d. and have the standard normal distribution. (i) From Theorem 1.2.6, we know

$$
P\left(X_{i}>x\right) \sim \frac{1}{\sqrt{2 \pi} x} e^{-x^{2} / 2} \quad \text { as } x \rightarrow \infty
$$

Use this to conclude that for any real number $\theta$

$$
P\left(X_{i}>x+(\theta / x)\right) / P\left(X_{i}>x\right) \rightarrow e^{-\theta}
$$

(ii) Show that if we define $b_{n}$ by $P\left(X_{i}>b_{n}\right)=1 / n$

$$
P\left(b_{n}\left(M_{n}-b_{n}\right) \leq x\right) \rightarrow \exp \left(-e^{-x}\right)
$$

(iii) Show that $b_{n} \sim(2 \log n)^{1 / 2}$ and conclude $M_{n} /(2 \log n)^{1 / 2} \rightarrow 1$ in probability.
3.2.4. Fatou's lemma. Let $g \geq 0$ be continuous. If $X_{n} \Rightarrow X_{\infty}$ then

$$
\liminf _{n \rightarrow \infty} E g\left(X_{n}\right) \geq E g\left(X_{\infty}\right)
$$

3.2.5. Integration to the limit. Suppose $g, h$ are continuous with $g(x)>0$, and $|h(x)| / g(x) \rightarrow 0$ as $|x| \rightarrow \infty$. If $F_{n} \Rightarrow F$ and $\int g(x) d F_{n}(x) \leq C<\infty$ then

$$
\int h(x) d F_{n}(x) \rightarrow \int h(x) d F(x)
$$

3.2.6. The Lévy Metric. Show that

$$
\rho(F, G)=\inf \{\epsilon: F(x-\epsilon)-\epsilon \leq G(x) \leq F(x+\epsilon)+\epsilon \text { for all } x\}
$$

defines a metric on the space of distributions and $\rho\left(F_{n}, F\right) \rightarrow 0$ if and only if $F_{n} \Rightarrow F$.
3.2.7. The Ky Fan metric on random variables is defined by

$$
\alpha(X, Y)=\inf \{\epsilon \geq 0: P(|X-Y|>\epsilon) \leq \epsilon\}
$$

Show that if $\alpha(X, Y)=\alpha$ then the corresponding distributions have Lévy distance $\rho(F, G) \leq \alpha$.
3.2.8. Let $\alpha(X, Y)$ be the metric in the previous exercise and let $\beta(X, Y)= E(|X-Y| /(1+|X-Y|))$ be the metric of Exercise 2.3.6. If $\alpha(X, Y)=a$ then

$$
a^{2} /(1+a) \leq \beta(X, Y) \leq a+(1-a) a /(1+a)
$$

3.2.9. If $F_{n} \Rightarrow F$ and $F$ is continuous then $\sup _{x}\left|F_{n}(x)-F(x)\right| \rightarrow 0$.
3.2.10. If $F$ is any distribution function there is a sequence of distribution functions of the form $\sum_{m=1}^{n} a_{n, m} 1_{\left(x_{n, m} \leq x\right)}$ with $F_{n} \Rightarrow F$.
3.2.11. Let $X_{n}, 1 \leq n \leq \infty$, be integer valued. Show that $X_{n} \Rightarrow X_{\infty}$ if and only if $P\left(X_{n}=m\right) \rightarrow P\left(X_{\infty}=m\right)$ for all $m$.
3.2.12. Show that if $X_{n} \rightarrow X$ in probability then $X_{n} \Rightarrow X$ and that, conversely, if $X_{n} \Rightarrow c$, where $c$ is a constant then $X_{n} \rightarrow c$ in probability.
3.2.13. Converging together lemma. If $X_{n} \Rightarrow X$ and $Y_{n} \Rightarrow c$, where $c$ is a constant then $X_{n}+Y_{n} \Rightarrow X+c$. A useful consequence of this result is that if $X_{n} \Rightarrow X$ and $Z_{n}-X_{n} \Rightarrow 0$ then $Z_{n} \Rightarrow X$.
3.2.14. Suppose $X_{n} \Rightarrow X, Y_{n} \geq 0$, and $Y_{n} \Rightarrow c$, where $c>0$ is a constant then $X_{n} Y_{n} \Rightarrow c X$. This result is true without the assumptions $Y_{n} \geq 0$ and $c>0$. We have imposed these only to make the proof less tedious.
3.2.15. Show that if $X_{n}=\left(X_{n}^{1}, \ldots, X_{n}^{n}\right)$ is uniformly distributed over the surface of the sphere of radius $\sqrt{n}$ in $\mathbf{R}^{n}$ then $X_{n}^{1} \Rightarrow$ a standard normal. Hint: Let $Y_{1}, Y_{2}, \ldots$ be i.i.d. standard normals and let $X_{n}^{i}= Y_{i}\left(n / \sum_{m=1}^{n} Y_{m}^{2}\right)^{1 / 2}$.
3.2.16. Suppose $Y_{n} \geq 0, E Y_{n}^{\alpha} \rightarrow 1$ and $E Y_{n}^{\beta} \rightarrow 1$ for some $0<\alpha<\beta$. Show that $Y_{n} \rightarrow 1$ in probability.
3.2.17. For each $K<\infty$ and $y<1$ there is a $c_{y, K}>0$ so that $E X^{2}=1$ and $E X^{4} \leq K$ implies $P(|X|>y) \geq c_{y, K}$.

### 3.3 Characteristic Functions

This long section is divided into five parts. The first three are required reading, the last two are optional. In the first part, we show that the characteristic function $\varphi(t)=E \exp (i t X)$ determines $F(x)=P(X \leq x)$, and we give recipes for computing $F$ from $\varphi$. In the second part, we relate weak convergence of distributions to the behavior of the corresponding characteristic functions. In the third part, we relate the behavior of $\varphi(t)$ at 0 to the moments of $X$. In the fourth part, we prove Polya's criterion and use it to construct some famous and some strange examples of characteristic functions. Finally, in the fifth part, we consider the moment problem, i.e., when is a distribution characterized by its moments.

### 3.3.1 Definition, Inversion Formula

If $X$ is a random variable we define its characteristic function (ch.f.) by

$$
\varphi(t)=E e^{i t X}=E \cos t X+i E \sin t X
$$

The last formula requires taking the expected value of a complex valued random variable but as the second equality may suggest no new theory is required. If $Z$ is complex valued we define $E Z=E(\operatorname{Re} Z)+i E(\operatorname{Im} Z)$ where $\operatorname{Re}(a+b i)=a$ is the real part and $\operatorname{Im}(a+b i)=b$ is the imaginary part. Some other definitions we will need are: the modulus of the complex number $z=a+b i$ is $|a+b i|=\left(a^{2}+b^{2}\right)^{1 / 2}$, and the complex conjugate of $z=a+b i, \bar{z}=a-b i$.

Theorem 3.3.1. All characteristic functions have the following properties:
(a) $\varphi(0)=1$,
(b) $\varphi(-t)=\overline{\varphi(t)}$,
(c) $|\varphi(t)|=\left|E e^{i t X}\right| \leq E\left|e^{i t X}\right|=1$
(d) $|\varphi(t+h)-\varphi(t)| \leq E\left|e^{i h X}-1\right|$, so $\varphi(t)$ is uniformly continuous on $(-\infty, \infty)$.
(e) $E e^{i t(a X+b)}=e^{i t b} \varphi(a t)$

Proof. (a) is obvious. For (b) we note that

$$
\varphi(-t)=E(\cos (-t X)+i \sin (-t X))=E(\cos (t X)-i \sin (t X))
$$

(c) follows from Exercise 1.6.2 since $\varphi(x, y)=\left(x^{2}+y^{2}\right)^{1 / 2}$ is convex.

$$
\begin{aligned}
|\varphi(t+h)-\varphi(t)| & =\left|E\left(e^{i(t+h) X}-e^{i t X}\right)\right| \\
& \leq E\left|e^{i(t+h) X}-e^{i t X}\right|=E\left|e^{i h X}-1\right|
\end{aligned}
$$

so uniform convergence follows from the bounded convergence theorem. For (e) we note $E e^{i t(a X+b)}=e^{i t b} E e^{i(t a) X}=e^{i t b} \varphi(a t)$.

The main reason for introducing characteristic functions is the following:

Theorem 3.3.2. If $X_{1}$ and $X_{2}$ are independent and have ch.f.'s $\varphi_{1}$ and $\varphi_{2}$ then $X_{1}+X_{2}$ has ch.f. $\varphi_{1}(t) \varphi_{2}(t)$.

Proof.

$$
E e^{i t\left(X_{1}+X_{2}\right)}=E\left(e^{i t X_{1}} e^{i t X_{2}}\right)=E e^{i t X_{1}} E e^{i t X_{2}}
$$

since $e^{i t X_{1}}$ and $e^{i t X_{2}}$ are independent.
The next order of business is to give some examples.
Example 3.3.3. Coin flips. If $P(X=1)=P(X=-1)=1 / 2$ then

$$
E e^{i t X}=\left(e^{i t}+e^{-i t}\right) / 2=\cos t
$$

Example 3.3.4. Poisson distribution. If $P(X=k)=e^{-\lambda} \lambda^{k} / k!$ for $k=0,1,2, \ldots$ then

$$
E e^{i t X}=\sum_{k=0}^{\infty} e^{-\lambda} \frac{\lambda^{k} e^{i t k}}{k!}=\exp \left(\lambda\left(e^{i t}-1\right)\right)
$$

Example 3.3.5. Normal distribution

$$
\begin{array}{ll}
\text { Density } & (2 \pi)^{-1 / 2} \exp \left(-x^{2} / 2\right) \\
\text { Ch.f. } & \exp \left(-t^{2} / 2\right)
\end{array}
$$

Combining this result with (e) of Theorem 3.3.1, we see that a normal distribution with mean $\mu$ and variance $\sigma^{2}$ has ch.f. $\exp \left(i \mu t-\sigma^{2} t^{2} / 2\right)$. Similar scalings can be applied to other examples so we will often just give the ch.f. for one member of the family.

Physics Proof

$$
\int e^{i t x}(2 \pi)^{-1 / 2} e^{-x^{2} / 2} d x=e^{-t^{2} / 2} \int(2 \pi)^{-1 / 2} e^{-(x-i t)^{2} / 2} d x
$$

The integral is 1 since the integrand is the normal density with mean it and variance 1 .

Math Proof. Now that we have cheated and figured out the answer we can verify it by a formal calculation that gives very little insight into why it is true. Let

$$
\varphi(t)=\int e^{i t x}(2 \pi)^{-1 / 2} e^{-x^{2} / 2} d x=\int \cos t x(2 \pi)^{-1 / 2} e^{-x^{2} / 2} d x
$$

since $i \sin t x$ is an odd function. Differentiating with respect to $t$ (referring to Theorem A.5.1 for the justification) and then integrating by parts gives

$$
\begin{aligned}
\varphi^{\prime}(t) & =\int-x \sin t x(2 \pi)^{-1 / 2} e^{-x^{2} / 2} d x \\
& =-\int t \cos t x(2 \pi)^{-1 / 2} e^{-x^{2} / 2} d x=-t \varphi(t)
\end{aligned}
$$

This implies $\frac{d}{d t}\left\{\varphi(t) \exp \left(t^{2} / 2\right)\right\}=0$ so $\varphi(t) \exp \left(t^{2} / 2\right)=\varphi(0)=1$.
In the next three examples, the density is 0 outside the indicated range.
Example 3.3.6. Uniform distribution on ( $a, b$ )

$$
\begin{array}{ll}
\text { Density } & 1 /(b-a) \quad x \in(a, b) \\
\text { Ch.f. } & \left(e^{i t b}-e^{i t a}\right) / i t(b-a)
\end{array}
$$

In the special case $a=-c, b=c$ the ch.f. is $\left(e^{i t c}-e^{-i t c}\right) / 2 c i t=(\sin c t) / c t$.
Proof. Once you recall that $\int_{a}^{b} e^{\lambda x} d x=\left(e^{\lambda b}-e^{\lambda a}\right) / \lambda$ holds for complex $\lambda$, this is immediate.

## Example 3.3.7. Triangular distribution

$$
\begin{array}{ll}
\text { Density } & 1-|x| \quad x \in(-1,1) \\
\text { Ch.f. } & 2(1-\cos t) / t^{2}
\end{array}
$$

Proof. To see this, notice that if $X$ and $Y$ are independent and uniform on $(-1 / 2,1 / 2)$ then $X+Y$ has a triangular distribution. Using Example 3.3.6 now and Theorem 3.3.2 it follows that the desired ch.f. is

$$
\left\{\left(e^{i t / 2}-e^{-i t / 2}\right) / i t\right\}^{2}=\{2 \sin (t / 2) / t\}^{2}
$$

Using the trig identity $\cos 2 \theta=1-2 \sin ^{2} \theta$ with $\theta=t / 2$ converts the answer into the form given above.

## Example 3.3.8. Exponential distribution

$$
\begin{array}{ll}
\text { Density } & e^{-x} \quad x \in(0, \infty) \\
\text { Ch.f. } & 1 /(1-i t)
\end{array}
$$

Proof. Integrating gives

$$
\int_{0}^{\infty} e^{i t x} e^{-x} d x=\left.\frac{e^{(i t-1) x}}{i t-1}\right|_{0} ^{\infty}=\frac{1}{1-i t}
$$

since $\exp ((i t-1) x) \rightarrow 0$ as $x \rightarrow \infty$.
For the next result we need the following fact which follows from the fact that $\int f d(\mu+\nu)=\int f d \mu+\int f d \nu$.
Lemma 3.3.9. If $F_{1}, \ldots, F_{n}$ have ch.f. $\varphi_{1}, \ldots, \varphi_{n}$ and $\lambda_{i} \geq 0$ have $\lambda_{1}+ \ldots+\lambda_{n}=1$ then $\sum_{i=1}^{n} \lambda_{i} F_{i}$ has ch.f. $\sum_{i=1}^{n} \lambda_{i} \varphi_{i}$.

## Example 3.3.10. Bilateral exponential

$$
\begin{array}{ll}
\text { Density } & \frac{1}{2} e^{-|x|} \quad x \in(-\infty, \infty) \\
\text { Ch.f. } & 1 /\left(1+t^{2}\right)
\end{array}
$$

Proof This follows from Lemma 3.3.9 with $F_{1}$ the distribution of an exponential random variable $X, F_{2}$ the distribution of $-X$, and $\lambda_{1}=\lambda_{2}=1 / 2$ then using (b) of Theorem 3.3.1 we see the desired ch.f. is

$$
\frac{1}{2(1-i t)}+\frac{1}{2(1+i t)}=\frac{(1+i t)+(1-i t)}{2\left(1+t^{2}\right)}=\frac{1}{\left(1+t^{2}\right)}
$$

The first issue to be settled is that the characteristic function uniquely determines the distribution. This and more is provided by
Theorem 3.3.11. The inversion formula. Let $\varphi(t)=\int e^{i t x} \mu(d x)$ where $\mu$ is a probability measure. If $a<b$ then

$$
\lim _{T \rightarrow \infty}(2 \pi)^{-1} \int_{-T}^{T} \frac{e^{-i t a}-e^{-i t b}}{i t} \varphi(t) d t=\mu(a, b)+\frac{1}{2} \mu(\{a, b\})
$$

Remark. The existence of the limit is part of the conclusion. If $\mu=\delta_{0}$, a point mass at $0, \varphi(t) \equiv 1$. In this case, if $a=-1$ and $b=1$, the integrand is $(2 \sin t) / t$ and the integral does not converge absolutely.

Proof. Let

$$
I_{T}=\int_{-T}^{T} \frac{e^{-i t a}-e^{-i t b}}{i t} \varphi(t) d t=\int_{-T}^{T} \int \frac{e^{-i t a}-e^{-i t b}}{i t} e^{i t x} \mu(d x) d t
$$

The integrand may look bad near $t=0$ but if we observe that

$$
\frac{e^{-i t a}-e^{-i t b}}{i t}=\int_{a}^{b} e^{-i t y} d y
$$

we see that the modulus of the integrand is bounded by $b-a$. Since $\mu$ is a probability measure and $[-T, T]$ is a finite interval it follows from Fubini's theorem, $\cos (-x)=\cos x$, and $\sin (-x)=-\sin x$ that

$$
\begin{aligned}
I_{T} & =\iint_{-T}^{T} \frac{e^{-i t a}-e^{-i t b}}{i t} e^{i t x} d t \mu(d x) \\
& =\int\left\{\int_{-T}^{T} \frac{\sin (t(x-a))}{t} d t-\int_{-T}^{T} \frac{\sin (t(x-b))}{t} d t\right\} \mu(d x)
\end{aligned}
$$

Introducing $R(\theta, T)=\int_{-T}^{T}(\sin \theta t) / t d t$, we can write the last result as

$$
\begin{equation*}
I_{T}=\int\{R(x-a, T)-R(x-b, T)\} \mu(d x) \tag{*}
\end{equation*}
$$

If we let $S(T)=\int_{0}^{T}(\sin x) / x d x$ then for $\theta>0$ changing variables $t=x / \theta$ shows that

$$
R(\theta, T)=2 \int_{0}^{T \theta} \frac{\sin x}{x} d x=2 S(T \theta)
$$

while for $\theta<0, R(\theta, T)=-R(|\theta|, T)$. Introducing the function $\operatorname{sgn} x$, which is 1 if $x>0,-1$ if $x<0$, and 0 if $x=0$, we can write the last two formulas together as

$$
R(\theta, T)=2(\operatorname{sgn} \theta) S(T|\theta|)
$$

As $T \rightarrow \infty, S(T) \rightarrow \pi / 2$ (see Exercise 1.7.5), so we have $R(\theta, T) \rightarrow \pi \operatorname{sgn} \theta$ and

$$
R(x-a, T)-R(x-b, T) \rightarrow \begin{cases}2 \pi & a<x<b \\ \pi & x=a \text { or } x=b \\ 0 & x<a \text { or } x>b\end{cases}
$$

$|R(\theta, T)| \leq 2 \sup _{y} S(y)<\infty$, so using the bounded convergence theorem with (*) implies

$$
(2 \pi)^{-1} I_{T} \rightarrow \mu(a, b)+\frac{1}{2} \mu(\{a, b\})
$$

proving the desired result.

Two trivial consequences of the inversion formula are:
Corollary 3.3.12. If $\varphi$ is real then $X$ and $-X$ have the same distribution.

Corollary 3.3.13. If $X_{i}, i=1,2$ are independent and have normal distributions with mean 0 and variance $\sigma_{i}^{2}$, then $X_{1}+X_{2}$ has a normal distribution with mean 0 and variance $\sigma_{1}^{2}+\sigma_{2}^{2}$.

The inversion formula is simpler when $\varphi$ is integrable, but as the next result shows this only happens when the underlying measure is nice.
Theorem 3.3.14. If $\int|\varphi(t)| d t<\infty$ then $\mu$ has bounded continuous density

$$
f(y)=\frac{1}{2 \pi} \int e^{-i t y} \varphi(t) d t
$$

Proof. As we observed in the proof of Theorem 3.3.11

$$
\left|\frac{e^{-i t a}-e^{-i t b}}{i t}\right|=\left|\int_{a}^{b} e^{-i t y} d y\right| \leq|b-a|
$$

so the integral in Theorem 3.3.11 converges absolutely in this case and
$\mu(a, b)+\frac{1}{2} \mu(\{a, b\})=\frac{1}{2 \pi} \int_{-\infty}^{\infty} \frac{e^{-i t a}-e^{-i t b}}{i t} \varphi(t) d t \leq \frac{(b-a)}{2 \pi} \int_{-\infty}^{\infty}|\varphi(t)| d t$
The last result implies $\mu$ has no point masses and

$$
\begin{aligned}
\mu(x, x+h) & =\frac{1}{2 \pi} \int \frac{e^{-i t x}-e^{-i t(x+h)}}{i t} \varphi(t) d t \\
& =\frac{1}{2 \pi} \int\left(\int_{x}^{x+h} e^{-i t y} d y\right) \varphi(t) d t \\
& =\int_{x}^{x+h}\left(\frac{1}{2 \pi} \int e^{-i t y} \varphi(t) d t\right) d y
\end{aligned}
$$

by Fubini's theorem, so the distribution $\mu$ has density function

$$
f(y)=\frac{1}{2 \pi} \int e^{-i t y} \varphi(t) d t
$$

The dominated convergence theorem implies $f$ is continuous and the proof is complete.

Theorem 3.3.14 and the next result show that the behavior of $\varphi$ at infinity is related to the smoothness of the underlying measure.

Applying the inversion formula Theorem 3.3.14 to the ch.f. in Examples 3.3.7 and 3.3.10 gives us two more examples of ch.f. The first one does not have an official name so we gave it one to honor its role in the proof of Polya's criterion, see Theorem 3.3.22.

## Example 3.3.15. Polya's distribution

$$
\begin{array}{ll}
\text { Density } & (1-\cos x) / \pi x^{2} \\
\text { Ch.f. } & (1-|t|)^{+}
\end{array}
$$

Proof. Theorem 3.3.14 implies

$$
\frac{1}{2 \pi} \int \frac{2(1-\cos s)}{s^{2}} e^{-i s y} d s=(1-|y|)^{+}
$$

Now let $s=x, y=-t$.

## Example 3.3.16. The Cauchy distribution

$$
\begin{array}{ll}
\text { Density } & 1 / \pi\left(1+x^{2}\right) \\
\text { Ch.f. } & \exp (-|t|)
\end{array}
$$

Proof. Theorem 3.3.14 implies

$$
\frac{1}{2 \pi} \int \frac{1}{1+s^{2}} e^{-i s y} d s=\frac{1}{2} e^{-|y|}
$$

Now let $s=x, y=-t$ and multiply each side by 2 .

## Exercises

3.3.1. Show that if $\varphi$ is a ch.f. then $\operatorname{Re} \varphi$ and $|\varphi|^{2}$ are also.
3.3.2. (i) Imitate the proof of Theorem 3.3.11 to show that

$$
\mu(\{a\})=\lim _{T \rightarrow \infty} \frac{1}{2 T} \int_{-T}^{T} e^{-i t a} \varphi(t) d t
$$

(ii) If $P(X \in h \mathbf{Z})=1$ where $h>0$ then its ch.f. has $\varphi(2 \pi / h+t)=\varphi(t)$ so

$$
P(X=x)=\frac{h}{2 \pi} \int_{-\pi / h}^{\pi / h} e^{-i t x} \varphi(t) d t \quad \text { for } x \in h \mathbf{Z}
$$

(iii) If $X=Y+b$ then $E \exp (i t X)=e^{i t b} E \exp (i t Y)$. So if $P(X \in b+h \mathbf{Z})=1$, the inversion formula in (ii) is valid for $x \in b+h \mathbf{Z}$.
3.3.3. Suppose $X$ and $Y$ are independent and have ch.f. $\varphi$ and distribution $\mu$. Apply Exercise 3.3.2 to $X-Y$ and use Exercise 2.1.5 to get

$$
\lim _{T \rightarrow \infty} \frac{1}{2 T} \int_{-T}^{T}|\varphi(t)|^{2} d t=P(X-Y=0)=\sum_{x} \mu(\{x\})^{2}
$$

Remark. The last result implies that if $\varphi(t) \rightarrow 0$ as $t \rightarrow \infty, \mu$ has no point masses. Exercise 3.3.11 gives an example to show that the converse is false. The Riemann-Lebesgue Lemma (Exercise 1.4.4) shows that if $\mu$ has a density, $\varphi(t) \rightarrow 0$ as $t \rightarrow \infty$.
3.3.4. Give an example of a measure $\mu$ with a density but for which $\int|\varphi(t)| d t=\infty$. Hint: Two of the examples above have this property.
3.3.5. Show that if $X_{1}, \ldots, X_{n}$ are independent and uniformly distributed on $(-1,1)$, then for $n \geq 2, X_{1}+\cdots+X_{n}$ has density

$$
f(x)=\frac{1}{\pi} \int_{0}^{\infty}(\sin t / t)^{n} \cos t x d t
$$

Although it is not obvious from the formula, $f$ is a polynomial in each interval $(k, k+1), k \in \mathbf{Z}$ and vanishes on $[-n, n]^{c}$.
3.3.6. Use the result in Example 3.3.16 to conclude that if $X_{1}, X_{2}, \ldots$ are independent and have the Cauchy distribution, then $\left(X_{1}+\cdots+X_{n}\right) / n$ has the same distribution as $X_{1}$.

### 3.3.2 Weak Convergence

Our next step toward the central limit theorem is to relate convergence of characteristic functions to weak convergence.
Theorem 3.3.17. Continuity theorem. Let $\mu_{n}, 1 \leq n \leq \infty$ be probability measures with ch.f. $\varphi_{n}$. (i) If $\mu_{n} \Rightarrow \mu_{\infty}$ then $\varphi_{n}(t) \rightarrow \varphi_{\infty}(t)$ for all $t$. (ii) If $\varphi_{n}(t)$ converges pointwise to a limit $\varphi(t)$ that is continuous at 0 , then the associated sequence of distributions $\mu_{n}$ is tight and converges weakly to the measure $\mu$ with characteristic function $\varphi$.

Remark. To see why continuity of the limit at 0 is needed in (ii), let $\mu_{n}$ have a normal distribution with mean 0 and variance $n$. In this case $\varphi_{n}(t)=\exp \left(-n t^{2} / 2\right) \rightarrow 0$ for $t \neq 0$, and $\varphi_{n}(0)=1$ for all $n$, but the measures do not converge weakly since $\mu_{n}((-\infty, x]) \rightarrow 1 / 2$ for all $x$.
Proof. (i) is easy. $e^{i t x}$ is bounded and continuous so if $\mu_{n} \Rightarrow \mu_{\infty}$ then Theorem 3.2.9 implies $\varphi_{n}(t) \rightarrow \varphi_{\infty}(t)$. To prove (ii), our first goal is to prove tightness. We begin with some calculations that may look mysterious but will prove to be very useful.

$$
\int_{-u}^{u} 1-e^{i t x} d t=2 u-\int_{-u}^{u}(\cos t x+i \sin t x) d t=2 u-\frac{2 \sin u x}{x}
$$

Dividing both sides by $u$, integrating $\mu_{n}(d x)$, and using Fubini's theorem on the left-hand side gives

$$
u^{-1} \int_{-u}^{u}\left(1-\varphi_{n}(t)\right) d t=2 \int\left(1-\frac{\sin u x}{u x}\right) \mu_{n}(d x)
$$

To bound the right-hand side, we note that

$$
|\sin x|=\left|\int_{0}^{x} \cos (y) d y\right| \leq|x| \quad \text { for all } x
$$

so we have $1-(\sin u x / u x) \geq 0$. Discarding the integral over $(-2 / u, 2 / u)$ and using $|\sin u x| \leq 1$ on the rest, the right-hand side is

$$
\geq 2 \int_{|x| \geq 2 / u}\left(1-\frac{1}{|u x|}\right) \mu_{n}(d x) \geq \mu_{n}(\{x:|x|>2 / u\})
$$

Since $\varphi(t) \rightarrow 1$ as $t \rightarrow 0$,

$$
u^{-1} \int_{-u}^{u}(1-\varphi(t)) d t \rightarrow 0 \text { as } u \rightarrow 0
$$

Pick $u$ so that the integral is $<\epsilon$. Since $\varphi_{n}(t) \rightarrow \varphi(t)$ for each $t$, it follows from the bounded convergence theorem that for $n \geq N$

$$
2 \epsilon \geq u^{-1} \int_{-u}^{u}\left(1-\varphi_{n}(t)\right) d t \geq \mu_{n}\{x:|x|>2 / u\}
$$

Since $\epsilon$ is arbitrary, the sequence $\mu_{n}$ is tight.
To complete the proof now we observe that if $\mu_{n(k)} \Rightarrow \mu$, then it follows from the first sentence of the proof that $\mu$ has ch.f. $\varphi$. The last observation and tightness imply that every subsequence has a further subsequence that converges to $\mu$. I claim that this implies the whole sequence converges to $\mu$. To see this, observe that we have shown that if $f$ is bounded and continuous then every subsequence of $\int f d \mu_{n}$ has a further subsequence that converges to $\int f d \mu$, so Theorem 2.3.3 implies that the whole sequence converges to that limit. This shows $\int f d \mu_{n} \rightarrow \int f d \mu$ for all bounded continuous functions $f$ so the desired result follows from Theorem 3.2.9.

## Exercises

3.3.7. Suppose that $X_{n} \Rightarrow X$ and $X_{n}$ has a normal distribution with mean 0 and variance $\sigma_{n}^{2}$. Prove that $\sigma_{n}^{2} \rightarrow \sigma^{2} \in[0, \infty)$.
3.3.8. Show that if $X_{n}$ and $Y_{n}$ are independent for $1 \leq n \leq \infty, X_{n} \Rightarrow X_{\infty}$, and $Y_{n} \Rightarrow Y_{\infty}$, then $X_{n}+Y_{n} \Rightarrow X_{\infty}+Y_{\infty}$.
3.3.9. Let $X_{1}, X_{2}, \ldots$ be independent and let $S_{n}=X_{1}+\cdots+X_{n}$. Let $\varphi_{j}$ be the ch.f. of $X_{j}$ and suppose that $S_{n} \rightarrow S_{\infty}$ a.s. Then $S_{\infty}$ has ch.f. $\prod_{j=1}^{\infty} \varphi_{j}(t)$.
3.3.10. Using the identity $\sin t=2 \sin (t / 2) \cos (t / 2)$ repeatedly leads to $(\sin t) / t=\prod_{m=1}^{\infty} \cos \left(t / 2^{m}\right)$. Prove the last identity by interpreting each side as a characteristic function.
3.3.11. Let $X_{1}, X_{2}, \ldots$ be independent taking values 0 and 1 with probability $1 / 2$ each. $X=2 \sum_{j \geq 1} X_{j} / 3^{j}$ has the Cantor distribution. Compute the ch.f. $\varphi$ of $X$ and notice that $\varphi$ has the same value at $t=3^{k} \pi$ for $k=0,1,2, \ldots$

### 3.3.3 Moments and Derivatives

In the proof of Theorem 3.3.17, we derived the inequality

$$
\begin{equation*}
\mu\{x:|x|>2 / u\} \leq u^{-1} \int_{-u}^{u}(1-\varphi(t)) d t \tag{3.3.1}
\end{equation*}
$$

which shows that the smoothness of the characteristic function at 0 is related to the decay of the measure at $\infty$. We leave the proof to the reader. (Use .)
Theorem 3.3.18. If $\int|x|^{n} \mu(d x)<\infty$ then its characteristic function $\varphi$ has a continuous derivative of order $n$ given by $\varphi^{(n)}(t)=\int(i x)^{n} e^{i t x} \mu(d x)$.
Proof. This is proved by repeatedly differentiating under the integral and using Theorem A.5.1 to justify this.

The result in Theorem 3.3.18 shows that if $E|X|^{n}<\infty$, then its characteristic function is $n$ times differentiable at 0 , and $\varphi^{n}(0)=E(i X)^{n}$. Expanding $\varphi$ in a Taylor series about 0 leads to

$$
\varphi(t)=\sum_{m=0}^{n} \frac{E(i t X)^{m}}{m!}+o\left(t^{n}\right)
$$

where $o\left(t^{n}\right)$ indicates a quantity $g(t)$ that has $g(t) / t^{n} \rightarrow 0$ as $t \rightarrow 0$. For our purposes below, it will be important to have a good estimate on the error term, so we will now derive the last result. The starting point is a little calculus.

## Lemma 3.3.19.

$$
\begin{equation*}
\left|e^{i x}-\sum_{m=0}^{n} \frac{(i x)^{m}}{m!}\right| \leq \min \left(\frac{|x|^{n+1}}{(n+1)!}, \frac{2|x|^{n}}{n!}\right) \tag{3.3.2}
\end{equation*}
$$

The first term on the right is the usual order of magnitude we expect in the correction term. The second is better for large $|x|$ and will help us prove the central limit theorem without assuming finite third moments.

Proof. Integrating by parts gives

$$
\int_{0}^{x}(x-s)^{n} e^{i s} d s=\frac{x^{n+1}}{n+1}+\frac{i}{n+1} \int_{0}^{x}(x-s)^{n+1} e^{i s} d s
$$

When $n=0$, this says

$$
\int_{0}^{x} e^{i s} d s=x+i \int_{0}^{x}(x-s) e^{i s} d s
$$

The left-hand side is $\left(e^{i x}-1\right) / i$, so rearranging gives

$$
e^{i x}=1+i x+i^{2} \int_{0}^{x}(x-s) e^{i s} d s
$$

Using the result for $n=1$ now gives

$$
e^{i x}=1+i x+\frac{i^{2} x^{2}}{2}+\frac{i^{3}}{2} \int_{0}^{x}(x-s)^{2} e^{i s} d s
$$

and iterating we arrive at

$$
\begin{equation*}
e^{i x}-\sum_{m=0}^{n} \frac{(i x)^{m}}{m!}=\frac{i^{n+1}}{n!} \int_{0}^{x}(x-s)^{n} e^{i s} d s \tag{a}
\end{equation*}
$$

To prove the result now it only remains to estimate the "error term" on the right-hand side. Since $\left|e^{i s}\right| \leq 1$ for all $s$,

$$
\begin{equation*}
\left|\frac{i^{n+1}}{n!} \int_{0}^{x}(x-s)^{n} e^{i s} d s\right| \leq|x|^{n+1} /(n+1)! \tag{b}
\end{equation*}
$$

The last estimate is good when $x$ is small. The next is designed for large $x$. Integrating by parts

$$
\frac{i}{n} \int_{0}^{x}(x-s)^{n} e^{i s} d s=-\frac{x^{n}}{n}+\int_{0}^{x}(x-s)^{n-1} e^{i s} d s
$$

Noticing $x^{n} / n=\int_{0}^{x}(x-s)^{n-1} d s$ now gives

$$
\frac{i^{n+1}}{n!} \int_{0}^{x}(x-s)^{n} e^{i s} d s=\frac{i^{n}}{(n-1)!} \int_{0}^{x}(x-s)^{n-1}\left(e^{i s}-1\right) d s
$$

and since $\left|e^{i x}-1\right| \leq 2$, it follows that
(c) $\quad\left|\frac{i^{n+1}}{n!} \int_{0}^{x}(x-s)^{n} e^{i s} d s\right| \leq\left|\frac{2}{(n-1)!} \int_{0}^{x}(x-s)^{n-1} d s\right| \leq 2|x|^{n} / n!$

Combining (a), (b), and (c) we have the desired result.
Taking expected values, using Jensen's inequality, applying Lemma 3.3.2 to $x=t X$, gives

$$
\begin{align*}
\left|E e^{i t X}-\sum_{m=0}^{n} E \frac{(i t X)^{m}}{m!}\right| & \leq E\left|e^{i t X}-\sum_{m=0}^{n} \frac{(i t X)^{m}}{m!}\right| \\
& \leq E \min \left(|t X|^{n+1}, 2|t X|^{n}\right) \tag{3.3.3}
\end{align*}
$$

where in the second step we have dropped the denominators to make the bound simpler.

In the next section, the following special case will be useful.
Theorem 3.3.20. If $E|X|^{2}<\infty$ then

$$
\varphi(t)=1+i t E X-t^{2} E\left(X^{2}\right) / 2+o\left(t^{2}\right)
$$

Proof. The error term is $\leq t^{2} E\left(|t| \cdot|X|^{3} \wedge 2|X|^{2}\right)$. The variable in parentheses is smaller than $2|X|^{2}$ and converges to 0 as $t \rightarrow 0$, so the desired conclusion follows from the dominated convergence theorem.

Remark. The point of the estimate in (3.3.3) which involves the minimum of two terms rather than just the first one which would result from a naive application of Taylor series, is that we get the conclusion in Theorem 3.3.20 under the assumption $E|X|^{2}<\infty$, i.e., we do not have to assume $E|X|^{3}<\infty$.
The next result shows that the existence of second derivatives implies the existence of second moments.
Theorem 3.3.21. If $\limsup _{h \downarrow 0}\{\varphi(h)-2 \varphi(0)+\varphi(-h)\} / h^{2}>-\infty$, then $E|X|^{2}<\infty$.
Proof. $\left(e^{i h x}-2+e^{-i h x}\right) / h^{2}=-2(1-\cos h x) / h^{2} \leq 0$ and $2(1-\cos h x) / h^{2} \rightarrow x^{2}$ as $h \rightarrow 0$ so Fatou's lemma and Fubini's theorem imply

$$
\begin{aligned}
\int x^{2} d F(x) & \leq 2 \liminf _{h \rightarrow 0} \int \frac{1-\cos h x}{h^{2}} d F(x) \\
& =-\limsup _{h \rightarrow 0} \frac{\varphi(h)-2 \varphi(0)+\varphi(-h)}{h^{2}}<\infty
\end{aligned}
$$

which proves the desired result.

## Exercises

3.3.12. Use Theorem 3.3.18 and the series expansion for $e^{-t^{2} / 2}$ to show that the standard normal distribution has

$$
E X^{2 n}=(2 n)!/ 2^{n} n!=(2 n-1)(2 n-3) \cdots 3 \cdot 1 \equiv(2 n-1)!!
$$

3.3.13. (i) Suppose that the family of measures $\left\{\mu_{i}, i \in I\right\}$ is tight, i.e., $\sup _{i} \mu_{i}\left([-M, M]^{c}\right) \rightarrow 0$ as $M \rightarrow \infty$. Use (d) in Theorem 3.3.1 and (3.3.3) with $n=0$ to show that their ch.f.'s $\varphi_{i}$ are equicontinuous, i.e., if $\epsilon>0$ we can pick $\delta>0$ so that if $|h|<\delta$ then $\left|\varphi_{i}(t+h)-\varphi_{i}(t)\right|<\epsilon$. (ii) Suppose $\mu_{n} \Rightarrow \mu_{\infty}$. Use Theorem 3.3.17 and equicontinuity to conclude that the ch.f.'s $\varphi_{n} \rightarrow \varphi_{\infty}$ uniformly on compact sets. [Argue directly. You don't need to go to AA.] (iii) Give an example to show that the convergence need not be uniform on the whole real line.
3.3.14. Let $X_{1}, X_{2}, \ldots$ be i.i.d. with characteristic function $\varphi$. (i) If $\varphi^{\prime}(0)=i a$ and $S_{n}=X_{1}+\cdots+X_{n}$ then $S_{n} / n \rightarrow a$ in probability. (ii) If $S_{n} / n \rightarrow a$ in probability then $\varphi(t / n)^{n} \rightarrow e^{\text {iat }}$ as $n \rightarrow \infty$ through the integers. (iii) Use (ii) and the uniform continuity established in (d) of Theorem 3.3.1 to show that $(\varphi(h)-1) / h \rightarrow-i a$ as $h \rightarrow 0$ through the positive reals. Thus the weak law holds if and only if $\varphi^{\prime}(0)$ exists. This result is due to E.J.G. Pitman (1956), with a little help from John Walsh who pointed out that we should prove (iii).

The last exercise in combination with Exercise 2.2.4 shows that $\varphi^{\prime}(0)$ may exist when $E|X|=\infty$.
3.3.15. $2 \int_{0}^{\infty}(1-\operatorname{Re} \varphi(t)) /\left(\pi t^{2}\right) d t=\int|y| d F(y)$. Hint: Change variables $x=|y| t$ in the density function of Example 3.3.15, which integrates to 1 .
3.3.16. Show that if $\lim _{t \downarrow 0}(\varphi(t)-1) / t^{2}=c>-\infty$ then $E X=0$ and $E|X|^{2}=-2 c<\infty$. In particular, if $\varphi(t)=1+o\left(t^{2}\right)$ then $\varphi(t) \equiv 1$.
3.3.17. If $Y_{n}$ are r.v.'s with ch.f.'s $\varphi_{n}$ then $Y_{n} \Rightarrow 0$ if and only if there is a $\delta>0$ so that $\varphi_{n}(t) \rightarrow 1$ for $|t| \leq \delta$.
3.3.18. Let $X_{1}, X_{2} \ldots$ be independent. If $S_{n}=\sum_{m \leq n} X_{m}$ converges in distribution then it converges in probability (and hence a.s. by Exercise 2.5.10). Hint: The last exercise implies that if $m, n \rightarrow \infty$ then $S_{m}-S_{n} \rightarrow$ 0 in probability. Now use Exercise 2.5.11.

### 3.3.4 Polya's Criterion*

The next result is useful for constructing examples of ch.f.'s.
Theorem 3.3.22. Polya's criterion. Let $\varphi(t)$ be real nonnegative and have $\varphi(0)=1, \varphi(t)=\varphi(-t)$, and $\varphi$ is decreasing and convex on $(0, \infty)$ with

$$
\lim _{t \downarrow 0} \varphi(t)=1, \quad \lim _{t \uparrow \infty} \varphi(t)=0
$$

Then there is a probability measure $\nu$ on $(0, \infty)$, so that

$$
\begin{equation*}
\varphi(t)=\int_{0}^{\infty}\left(1-\left|\frac{t}{s}\right|\right)^{+} \nu(d s) \tag{*}
\end{equation*}
$$

and hence $\varphi$ is a characteristic function.
Remark. Before we get lost in the details of the proof, the reader should note that (*) displays $\varphi$ as a convex combination of ch.f.'s of the form given in Example 3.3.15, so an extension of Lemma 3.3.9 (to be proved below) implies that this is a ch.f.

The assumption that $\lim _{t \rightarrow 0} \varphi(t)=1$ is necessary because the function $\varphi(t)=1_{\{0\}}(t)$ which is 1 at 0 and 0 otherwise satisfies all the other hypotheses. We could allow $\lim _{t \rightarrow \infty} \varphi(t)=c>0$ by having a point mass of size $c$ at 0 , but we leave this extension to the reader.

Proof. Let $\varphi^{\prime}$ be the right derivative of $\phi$, i.e.,

$$
\varphi^{\prime}(t)=\lim _{h \downarrow 0} \frac{\varphi(t+h)-\varphi(t)}{h}
$$

Since $\varphi$ is convex this exists and is right continuous and increasing. So we can let $\mu$ be the measure on ( $0, \infty$ ) with $\mu(a, b]=\varphi^{\prime}(b)-\varphi^{\prime}(a)$ for all $0 \leq a<b<\infty$, and let $\nu$ be the measure on ( $0, \infty$ ) with $d \nu / d \mu=s$.

Now $\varphi^{\prime}(t) \rightarrow 0$ as $t \rightarrow \infty$ (for if $\varphi^{\prime}(t) \downarrow-\epsilon$ we would have $\varphi(t) \leq 1-\epsilon t$ for all $t$ ), so Exercise A.4.7 implies

$$
-\varphi^{\prime}(s)=\int_{s}^{\infty} r^{-1} \nu(d r)
$$

Integrating again and using Fubini's theorem we have for $t \geq 0$

$$
\begin{aligned}
\varphi(t) & =\int_{t}^{\infty} \int_{s}^{\infty} r^{-1} \nu(d r) d s=\int_{t}^{\infty} r^{-1} \int_{t}^{r} d s \nu(d r) \\
& =\int_{t}^{\infty}\left(1-\frac{t}{r}\right) \nu(d r)=\int_{0}^{\infty}\left(1-\frac{t}{r}\right)^{+} \nu(d r)
\end{aligned}
$$

Using $\varphi(-t)=\varphi(t)$ to extend the formula to $t \leq 0$ we have ( $*$ ). Setting $t=0$ in (*) shows $\nu$ has total mass 1.

If $\varphi$ is piecewise linear, $\nu$ has a finite number of atoms and the result follows from Example 3.3.15 and Lemma 3.3.9. To prove the general result, let $\nu_{n}$ be a sequence of measures on ( $0, \infty$ ) with a finite number of atoms that converges weakly to $\nu$ (see Exercise 3.2.10) and let

$$
\varphi_{n}(t)=\int_{0}^{\infty}\left(1-\left|\frac{t}{s}\right|\right)^{+} \nu_{n}(d s)
$$

Since $s \rightarrow(1-|t / s|)^{+}$is bounded and continuous, $\varphi_{n}(t) \rightarrow \varphi(t)$ and the desired result follows from part (ii) of Theorem 3.3.17.

A classic application of Polya's criterion is:
Exercise 3.3.19. Show that $\exp \left(-|t|^{\alpha}\right)$ is a characteristic function for $0<\alpha \leq 1$.
(The case $\alpha=1$ corresponds to the Cauchy distribution.) The next argument, which we learned from Frank Spitzer, proves that this is true for $0<\alpha \leq 2$. The case $\alpha=2$ corresponds to a normal distribution, so that case can be safely ignored in the proof.
Example 3.3.23. $\exp \left(-|t|^{\alpha}\right)$ is a characteristic function for $0<\alpha<2$.
Proof. A little calculus shows that for any $\beta$ and $|x|<1$

$$
(1-x)^{\beta}=\sum_{n=0}^{\infty}\binom{\beta}{n}(-x)^{n}
$$

where

$$
\binom{\beta}{n}=\frac{\beta(\beta-1) \cdots(\beta-n+1)}{1 \cdot 2 \cdots n}
$$

Let $\psi(t)=1-(1-\cos t)^{\alpha / 2}=\sum_{n=1}^{\infty} c_{n}(\cos t)^{n}$ where

$$
c_{n}=\binom{\alpha / 2}{n}(-1)^{n+1}
$$

$c_{n} \geq 0$ (here we use $\alpha<2$ ), and $\sum_{n=1}^{\infty} c_{n}=1$ (take $t=0$ in the definition of $\psi$ ). $\cos t$ is a characteristic function (see Example 3.3.3) so an easy extension of Lemma 3.3.9 shows that $\psi$ is a ch.f. We have $1-\cos t \sim t^{2} / 2$ as $t \rightarrow 0$, so

$$
1-\cos \left(t \cdot 2^{1 / 2} \cdot n^{-1 / \alpha}\right) \sim n^{-2 / \alpha} t^{2}
$$

Using Lemma 3.1.1 and (ii) of Theorem 3.3.17 now, it follows that

$$
\exp \left(-|t|^{\alpha}\right)=\lim _{n \rightarrow \infty}\left\{\psi\left(t \cdot 2^{1 / 2} \cdot n^{-1 / \alpha}\right)\right\}^{n}
$$

is a ch.f.
Exercise 3.3.16 shows that $\exp \left(-|t|^{\alpha}\right)$ is not a ch.f. when $\alpha>2$. A reason for interest in these characteristic functions is explained by the following generalization of Exercise 3.3.15.

Exercise 3.3.20. If $X_{1}, X_{2}, \ldots$ are independent and have characteristic function $\exp \left(-|t|^{\alpha}\right)$ then $\left(X_{1}+\cdots+X_{n}\right) / n^{1 / \alpha}$ has the same distribution as $X_{1}$.

We will return to this topic in Section 3.8.
Exercise 3.3.21. Let $\varphi_{1}$ and $\varphi_{2}$ be ch.f's. Show that $A=\left\{t: \varphi_{1}(t)=\right. \varphi_{2}(t)$ \} is closed, contains 0 , and is symmetric about 0 . Show that if $A$ is a set with these properties and $\varphi_{1}(t)=e^{-|t|}$ there is a $\varphi_{2}$ so that $\left\{t: \varphi_{1}(t)=\varphi_{2}(t)\right\}=A$.

Example 3.3.24. For some purposes, it is nice to have an explicit example of two ch.f.'s that agree on $[-1,1]$. From Example 3.3.15, we know that $(1-|t|)^{+}$is the ch.f. of the density $(1-\cos x) / \pi x^{2}$. Define $\psi(t)$ to be equal to $\varphi$ on $[-1,1]$ and periodic with period 2, i.e., $\psi(t)=\psi(t+2)$. The Fourier series for $\psi$ is

$$
\psi(u)=\frac{1}{2}+\sum_{n=-\infty}^{\infty} \frac{2}{\pi^{2}(2 n-1)^{2}} \exp (i(2 n-1) \pi u)
$$

The right-hand side is the ch.f. of a discrete distribution with

$$
P(X=0)=1 / 2 \quad \text { and } \quad P(X=(2 n-1) \pi)=2 \pi^{-2}(2 n-1)^{-2} \quad n \in \mathbf{Z} .
$$

Exercise 3.3.22. Find independent r.v.'s $X, Y$, and $Z$ so that $Y$ and $Z$ do not have the same distribution but $X+Y$ and $X+Z$ do.

Exercise 3.3.23. Show that if $X$ and $Y$ are independent and $X+Y$ and $X$ have the same distribution then $Y=0$ a.s.

For more curiosities, see Feller, Vol. II (1971), Section XV.2a.

### 3.3.5 The Moment Problem*

Suppose $\int x^{k} d F_{n}(x)$ has a limit $\mu_{k}$ for each $k$. Then the sequence of distributions is tight by Theorem 3.2.14 and every subsequential limit has the moments $\mu_{k}$ by Exercise 3.2.5, so we can conclude the sequence converges weakly if there is only one distribution with these moments. It is easy to see that this is true if $F$ is concentrated on a finite interval $[-M, M]$ since every continuous function can be approximated uniformly on $[-M, M]$ by polynomials. The result is false in general.
Counterexample 1. Heyde (1963) Consider the lognormal density

$$
f_{0}(x)=(2 \pi)^{-1 / 2} x^{-1} \exp \left(-(\log x)^{2} / 2\right) \quad x \geq 0
$$

and for $-1 \leq a \leq 1$ let

$$
f_{a}(x)=f_{0}(x)\{1+a \sin (2 \pi \log x)\}
$$

To see that $f_{a}$ is a density and has the same moments as $f_{0}$, it suffices to show that

$$
\int_{0}^{\infty} x^{r} f_{0}(x) \sin (2 \pi \log x) d x=0 \text { for } r=0,1,2, \ldots
$$

Changing variables $x=\exp (s+r), s=\log x-r, d s=d x / x$ the integral becomes

$$
\begin{aligned}
& (2 \pi)^{-1 / 2} \int_{-\infty}^{\infty} \exp \left(r s+r^{2}\right) \exp \left(-(s+r)^{2} / 2\right) \sin (2 \pi(s+r)) d s \\
& \quad=(2 \pi)^{-1 / 2} \exp \left(r^{2} / 2\right) \int_{-\infty}^{\infty} \exp \left(-s^{2} / 2\right) \sin (2 \pi s) d s=0
\end{aligned}
$$

The two equalities holding because $r$ is an integer and the integrand is odd. From the proof, it should be clear that we could let

$$
g(x)=f_{0}(x)\left\{1+\sum_{k=1}^{\infty} a_{k} \sin (k \pi \log x)\right\} \quad \text { if } \sum_{k=1}^{\infty}\left|a_{k}\right| \leq 1
$$

to get a large family of densities having the same moments as the lognormal.

The moments of the lognormal are easy to compute. Recall that if $\chi$ has the standard normal distribution, then Exercise 1.2.6 implies $\exp (\chi)$ has the lognormal distribution.

$$
\begin{aligned}
E X^{n} & =E \exp (n \chi)=\int e^{n x}(2 \pi)^{-1 / 2} e^{-x^{2} / 2} d x \\
& =e^{n^{2} / 2} \int(2 \pi)^{-1 / 2} e^{-(x-n)^{2} / 2} d x=\exp \left(n^{2} / 2\right)
\end{aligned}
$$

since the last integrand is the density of the normal with mean $n$ and variance 1. Somewhat remarkably there is a family of discrete random variables with these moments. Let $a>0$ and

$$
P\left(Y_{a}=a e^{k}\right)=a^{-k} \exp \left(-k^{2} / 2\right) / c_{a} \quad \text { for } k \in \mathbf{Z}
$$

where $c_{a}$ is chosen to make the total mass 1 .

$$
\begin{aligned}
\exp \left(-n^{2} / 2\right) E Y_{a}^{n} & =\exp \left(-n^{2} / 2\right) \sum_{k}\left(a e^{k}\right)^{n} a^{-k} \exp \left(-k^{2} / 2\right) / c_{a} \\
& =\sum_{k} a^{-(k-n)} \exp \left(-(k-n)^{2} / 2\right) / c_{a}=1
\end{aligned}
$$

by the definition of $c_{a}$.
The lognormal density decays like $\exp \left(-(\log x)^{2} / 2\right)$ as $|x| \rightarrow \infty$. The next counterexample has more rapid decay. Since the exponential distribution, $e^{-x}$ for $x \geq 0$, is determined by its moments (see Exercise 3.3.25 below) we cannot hope to do much better than this.
Counterexample 2. Let $\lambda \in(0,1)$ and for $-1 \leq a \leq 1$ let

$$
f_{a, \lambda}(x)=c_{\lambda} \exp \left(-|x|^{\lambda}\right)\left\{1+a \sin \left(\beta|x|^{\lambda} \operatorname{sgn}(x)\right)\right\}
$$

where $\beta=\tan (\lambda \pi / 2)$ and $1 / c_{\lambda}=\int \exp \left(-|x|^{\lambda}\right) d x$. To prove that these are density functions and that for a fixed value of $\lambda$ they have the same moments, it suffices to show

$$
\int x^{n} \exp \left(-|x|^{\lambda}\right) \sin \left(\beta|x|^{\lambda} \operatorname{sgn}(x)\right) d x=0 \quad \text { for } n=0,1,2, \ldots
$$

This is clear for even $n$ since the integrand is odd. To prove the result for odd $n$, it suffices to integrate over $[0, \infty)$. Using the identity

$$
\int_{0}^{\infty} t^{p-1} e^{-q t} d t=\Gamma(p) / q^{p} \quad \text { when } \operatorname{Re} q>0
$$

with $p=(n+1) / \lambda, q=1+\beta i$, and changing variables $t=x^{\lambda}$, we get

$$
\begin{aligned}
& \Gamma((n+1) / \lambda) /(1+\beta i)^{(n+1) / \lambda} \\
& \quad=\int_{0}^{\infty} x^{\lambda\{(n+1) / \lambda-1\}} \exp \left(-(1+\beta i) x^{\lambda}\right) \lambda x^{\lambda-1} d x \\
& \quad=\lambda \int_{0}^{\infty} x^{n} \exp \left(-x^{\lambda}\right) \cos \left(\beta x^{\lambda}\right) d x-i \lambda \int_{0}^{\infty} x^{n} \exp \left(-x^{\lambda}\right) \sin \left(\beta x^{\lambda}\right) d x
\end{aligned}
$$

Since $\beta=\tan (\lambda \pi / 2)$

$$
(1+\beta i)^{(n+1) / \lambda}=(\cos \lambda \pi / 2)^{-(n+1) / \lambda}(\exp (i \lambda \pi / 2))^{(n+1) / \lambda}
$$

The right-hand side is real since $\lambda<1$ and ( $n+1$ ) is even, so

$$
\int_{0}^{\infty} x^{n} \exp \left(-x^{\lambda}\right) \sin \left(\beta x^{\lambda}\right) d x=0
$$

A useful sufficient condition for a distribution to be determined by its moments is

Theorem 3.3.25. If $\limsup _{k \rightarrow \infty} \mu_{2 k}^{1 / 2 k} / 2 k=r<\infty$ then there is at most one d.f. $F$ with $\mu_{k}=\int x^{k} d F(x)$ for all positive integers $k$.
Remark. This is slightly stronger than Carleman's condition

$$
\sum_{k=1}^{\infty} 1 / \mu_{2 k}^{1 / 2 k}=\infty
$$

which is also sufficient for the conclusion of Theorem 3.3.25.
Proof. Let $F$ be any d.f. with the moments $\mu_{k}$ and let $\nu_{k}=\int|x|^{k} d F(x)$. The Cauchy-Schwarz inequality implies $\nu_{2 k+1}^{2} \leq \mu_{2 k} \mu_{2 k+2}$ so

$$
\limsup _{k \rightarrow \infty}\left(\nu_{k}^{1 / k}\right) / k=r<\infty
$$

Taking $x=t X$ in Lemma 3.3.2 and multiplying by $e^{i \theta X}$, we have

$$
\left|e^{i \theta X}\left(e^{i t X}-\sum_{m=0}^{n-1} \frac{(i t X)^{m}}{m!}\right)\right| \leq \frac{|t X|^{n}}{n!}
$$

Taking expected values and using Exercise 3.3.18 gives

$$
\left|\varphi(\theta+t)-\varphi(\theta)-t \varphi^{\prime}(\theta) \ldots-\frac{t^{n-1}}{(n-1)!} \varphi^{(n-1)}(\theta)\right| \leq \frac{|t|^{n}}{n!} \nu_{n}
$$

Using the last result, the fact that $\nu_{k} \leq(r+\epsilon)^{k} k^{k}$ for large $k$, and the trivial bound $e^{k} \geq k^{k} / k!$ (expand the left-hand side in its power series), we see that for any $\theta$

$$
\begin{equation*}
\varphi(\theta+t)=\varphi(\theta)+\sum_{m=1}^{\infty} \frac{t^{m}}{m!} \varphi^{(m)}(\theta) \quad \text { for }|t|<1 / e r \tag{*}
\end{equation*}
$$

Let $G$ be another distribution with the given moments and $\psi$ its ch.f. Since $\varphi(0)=\psi(0)=1$, it follows from ( $*$ ) and induction that $\varphi(t)=\psi(t)$ for $|t| \leq k / 3 r$ for all $k$, so the two ch.f.'s coincide and the distributions are equal.

Combining Theorem 3.3.25 with the discussion that began our consideration of the moment problem.

Theorem 3.3.26. Suppose $\int x^{k} d F_{n}(x)$ has a limit $\mu_{k}$ for each $k$ and

$$
\limsup _{k \rightarrow \infty} \mu_{2 k}^{1 / 2 k} / 2 k<\infty
$$

then $F_{n}$ converges weakly to the unique distribution with these moments.
Exercise 3.3.24. Let $G(x)=P(|X|<x), \lambda=\sup \{x: G(x)<1\}$, and $\nu_{k}=E|X|^{k}$. Show that $\nu_{k}^{1 / k} \rightarrow \lambda$, so the assumption of Theorem 3.3.26 holds if $\lambda<\infty$.
Exercise 3.3.25. Suppose $|X|$ has density $C x^{\alpha} \exp \left(-x^{\lambda}\right)$ on ( $0, \infty$ ). Changing variables $y=x^{\lambda}, d x=(1 / \lambda) x^{1 / \lambda-1} d x$

$$
E|X|^{n}=\int_{0}^{\infty} C \lambda^{-1} y^{(n+\alpha) / \lambda} \exp (-y) y^{1 / \lambda-1} d y=C \lambda^{-1} \Gamma((n+\alpha+1) / \lambda)
$$

Use the identity $\Gamma(x+1)=x \Gamma(x)$ for $x \geq 0$ to conclude that the assumption of Theorem 3.3.26 is satisfied for $\lambda \geq 1$ but not for $\lambda<1$. This shows the normal ( $\lambda=2$ ) and gamma ( $\lambda=1$ ) distributions are determined by their moments.

Our results so far have been for the so-called Hamburger moment problem. If we assume a priori that the distribution is concentrated on $[0, \infty)$, we have the Stieltjes moment problem. There is a $1-1$ correspondence between $X \geq 0$ and symmetric distributions on $\mathbf{R}$ given by $X \rightarrow \xi \sqrt{X}$ where $\xi \in\{-1,1\}$ is independent of $X$ and takes its two values with equal probability. From this we see that

$$
\limsup _{k \rightarrow \infty} \nu_{k}^{1 / 2 k} / 2 k<\infty
$$

is sufficient for there to be a unique distribution on $[0, \infty)$ with the given moments. The next example shows that for nonnegative random variables, the last result is close to the best possible.
Counterexample 3. Let $\lambda \in(0,1 / 2), \beta=\tan (\lambda \pi),-1 \leq a \leq 1$ and

$$
f_{a}(x)=c_{\lambda} \exp \left(-x^{\lambda}\right)\left(1+a \sin \left(\beta x^{\lambda}\right)\right) \quad \text { for } x \geq 0
$$

where $1 / c_{\lambda}=\int_{0}^{\infty} \exp \left(-x^{\lambda}\right) d x$.
By imitating the calculations in Counterexample 2, it is easy to see that the $f_{a}$ are probability densities that have the same moments. This example seems to be due to Stoyanov (1987) p. 92-93. The special case $\lambda=1 / 4$ is widely known.

### 3.4 Central Limit Theorems

We are now ready for the main business of the chapter. We will first prove the central limit theorem for

### 3.4.1 i.i.d. Sequences

Theorem 3.4.1. Let $X_{1}, X_{2} \ldots$ be i.i.d. with $E X_{i}=\mu$, $\operatorname{var}\left(X_{i}\right)=\sigma^{2} \in (0, \infty)$. If $S_{n}=X_{1}+\cdots+X_{n}$ then

$$
\left(S_{n}-n \mu\right) / \sigma n^{1 / 2} \Rightarrow \chi
$$

where $\chi$ has the standard normal distribution.
This notation is non-standard but convenient. To see the logic note that the square of a normal has a chi-squared distribution.

Proof By considering $X_{i}^{\prime}=X_{i}-\mu$, it suffices to prove the result when $\mu=0$. From Theorem 3.3.20

$$
\varphi(t)=E \exp \left(i t X_{1}\right)=1-\frac{\sigma^{2} t^{2}}{2}+o\left(t^{2}\right)
$$

so

$$
E \exp \left(i t S_{n} / \sigma n^{1 / 2}\right)=\left(1-\frac{t^{2}}{2 n}+o\left(n^{-1}\right)\right)^{n}
$$

From Lemma 3.1.1 it should be clear that the last quantity $\rightarrow \exp \left(-t^{2} / 2\right)$ as $n \rightarrow \infty$, which with Theorem 3.3.17 completes the proof. However, Lemma 3.1.1 is a fact about real numbers, so we need to extend it to the complex case to complete the proof.

Theorem 3.4.2. If $c_{n} \rightarrow c \in \mathbf{C}$ then $\left(1+c_{n} / n\right)^{n} \rightarrow e^{c}$.
Proof. The proof is based on two simple facts:
Lemma 3.4.3. Let $z_{1}, \ldots, z_{n}$ and $w_{1}, \ldots, w_{n}$ be complex numbers of modulus $\leq \theta$. Then

$$
\left|\prod_{m=1}^{n} z_{m}-\prod_{m=1}^{n} w_{m}\right| \leq \theta^{n-1} \sum_{m=1}^{n}\left|z_{m}-w_{m}\right|
$$

Proof. The result is true for $n=1$. To prove it for $n>1$ observe that

$$
\begin{aligned}
\left|\prod_{m=1}^{n} z_{m}-\prod_{m=1}^{n} w_{m}\right| & \leq\left|z_{1} \prod_{m=2}^{n} z_{m}-z_{1} \prod_{m=2}^{n} w_{m}\right|+\left|z_{1} \prod_{m=2}^{n} w_{m}-w_{1} \prod_{m=2}^{n} w_{m}\right| \\
& \leq \theta\left|\prod_{m=2}^{n} z_{m}-\prod_{m=2}^{n} w_{m}\right|+\theta^{n-1}\left|z_{1}-w_{1}\right|
\end{aligned}
$$

and use induction.
Lemma 3.4.4. If $b$ is a complex number with $|b| \leq 1$ then $\left|e^{b}-(1+b)\right| \leq |b|^{2}$.

Proof. $e^{b}-(1+b)=b^{2} / 2!+b^{3} / 3!+b^{4} / 4!+\ldots$ so if $|b| \leq 1$ then

$$
\left|e^{b}-(1+b)\right| \leq \frac{|b|^{2}}{2}\left(1+1 / 2+1 / 2^{2}+\ldots\right)=|b|^{2}
$$

Proof of Theorem 3.4.2. Let $z_{m}=\left(1+c_{n} / n\right), w_{m}=\exp \left(c_{n} / n\right)$, and $\gamma>|c|$. For large $n,\left|c_{n}\right|<\gamma$. Since $1+\gamma / n \leq \exp (\gamma / n)$, it follows from Lemmas 3.4.3 and 3.4.4 that

$$
\left|\left(1+c_{n} / n\right)^{n}-e^{c_{n}}\right| \leq\left(e^{\gamma / n}\right)^{n-1} n\left|\frac{c_{n}}{n}\right|^{2} \leq e^{\gamma} \frac{\gamma^{2}}{n} \rightarrow 0
$$

as $n \rightarrow \infty$.
To get a feel for what the central limit theorem says, we will look at some concrete cases.

Example 3.4.5. Roulette. A roulette wheel has slots numbered 1-36 ( 18 red and 18 black) and two slots numbered 0 and 00 that are painted green. Players can bet $\$ 1$ that the ball will land in a red (or black) slot and win $\$ 1$ if it does. If we let $X_{i}$ be the winnings on the $i$ th play then $X_{1}, X_{2} \ldots$ are i.i.d. with $P\left(X_{i}=1\right)=18 / 38$ and $P\left(X_{i}=-1\right)=20 / 38$.

$$
E X_{i}=-1 / 19 \quad \text { and } \quad \operatorname{var}(X)=E X^{2}-(E X)^{2}=1-(1 / 19)^{2}=0.9972
$$

We are interested in

$$
P\left(S_{n} \geq 0\right)=P\left(\frac{S_{n}-n \mu}{\sigma \sqrt{n}} \geq \frac{-n \mu}{\sigma \sqrt{n}}\right)
$$

Taking $n=361=19^{2}$ and replacing $\sigma$ by 1 to keep computations simple,

$$
\frac{-n \mu}{\sigma \sqrt{n}}=\frac{361 \cdot(1 / 19)}{\sqrt{361}}=1
$$

So the central limit theorem and our table of the normal distribution in the back of the book tells us that

$$
P\left(S_{n} \geq 0\right) \approx P(\chi \geq 1)=1-0.8413=0.1587
$$

In words, after 361 spins of the roulette wheel the casino will have won $\$ 19$ of your money on the average, but there is a probability of about 0.16 that you will be ahead.

Example 3.4.6. Coin flips. Let $X_{1}, X_{2}, \ldots$ be i.i.d. with $P\left(X_{i}=0\right)= P\left(X_{i}=1\right)=1 / 2$. If $X_{i}=1$ indicates that a heads occured on the $i$ th toss then $S_{n}=X_{1}+\cdots+X_{n}$ is the total number of heads at time $n$.

$$
E X_{i}=1 / 2 \quad \text { and } \quad \operatorname{var}(X)=E X^{2}-(E X)^{2}=1 / 2-1 / 4=1 / 4
$$

So the central limit theorem tells us $\left(S_{n}-n / 2\right) / \sqrt{n / 4} \Rightarrow \chi$. Our table of the normal distribution tells us that

$$
P(\chi>2)=1-0.9773=0.0227
$$

so $P(|\chi| \leq 2)=1-2(0.0227)=0.9546$, or plugging into the central limit theorem

$$
.95 \approx P\left(\left(S_{n}-n / 2\right) / \sqrt{n / 4} \in[-2,2]\right)=P\left(S_{n}-n / 2 \in[-\sqrt{n}, \sqrt{n}]\right)
$$

Taking $n=10,000$ this says that $95 \%$ of the time the number of heads will be between 4900 and 5100 .

Example 3.4.7. Normal approximation to the binomial. Let $X_{1}, X_{2}, \ldots$ and $S_{n}$ be as in the previous example. To estimate $P\left(S_{16}=8\right)$ using the central limit theorem, we regard 8 as the interval [7.5, 8.5]. Since $\mu=1 / 2$, and $\sigma \sqrt{n}=2$ for $n=16$

$$
\begin{aligned}
P\left(\left|S_{16}-8\right| \leq 0.5\right) & =P\left(\frac{\left|S_{n}-n \mu\right|}{\sigma \sqrt{n}} \leq 0.25\right) \\
& \approx P(|\chi| \leq 0.25)=2(0.5987-0.5)=0.1974
\end{aligned}
$$

Even though $n$ is small, this agrees well with the exact probability

$$
\binom{16}{8} 2^{-16}=\frac{13 \cdot 11 \cdot 10 \cdot 9}{65,536}=0.1964
$$

The computations above motivate the histogram correction, which is important in using the normal approximation for small $n$. For example, if we are going to approximate $P\left(S_{16} \leq 11\right)$, then we regard this probability as $P\left(S_{16} \leq 11.5\right)$. One obvious reason for doing this is to get the same answer if we regard $P\left(S_{16} \leq 11\right)=1-P\left(S_{16} \geq 12\right)$.

Example 3.4.8. Normal approximation to the Poisson. Let $Z_{\lambda}$ have a Poisson distribution with mean $\lambda$. If $X_{1}, X_{2}, \ldots$ are independent and have Poisson distributions with mean 1 , then $S_{n}=X_{1}+\cdots+X_{n}$ has a Poisson distribution with mean $n$. Since $\operatorname{var}\left(X_{i}\right)=1$, the central limit theorem implies:

$$
\left(S_{n}-n\right) / n^{1 / 2} \Rightarrow \chi \quad \text { as } n \rightarrow \infty
$$

To deal with values of $\lambda$ that are not integers, let $N_{1}, N_{2}, N_{3}$ be independent Poisson with means $[\lambda], \lambda-[\lambda]$, and $[\lambda]+1-\lambda$. If we let $S_{[\lambda]}=N_{1}$, $Z_{\lambda}=N_{1}+N_{2}$ and $S_{[\lambda]+1}=N_{1}+N_{2}+N_{3}$ then $S_{[\lambda]} \leq Z_{\lambda} \leq S_{[\lambda]+1}$ and using the limit theorem for the $S_{n}$ it follows that

$$
\left(Z_{\lambda}-\lambda\right) / \lambda^{1 / 2} \Rightarrow \chi \quad \text { as } \lambda \rightarrow \infty
$$

Example 3.4.9. Pairwise independence is good enough for the strong law of large numbers (see Theorem 2.4.1). It is not good enough for the central limit theorem. Let $\xi_{1}, \xi_{2}, \ldots$ be i.i.d. with $P\left(\xi_{i}=1\right)=P\left(\xi_{i}=\right. -1)=1 / 2$. We will arrange things so that for $n \geq 1$

$$
S_{2^{n}}=\xi_{1}\left(1+\xi_{2}\right) \cdots\left(1+\xi_{n+1}\right)= \begin{cases} \pm 2^{n} & \text { with prob } 2^{-n-1} \\ 0 & \text { with prob } 1-2^{-n}\end{cases}
$$

To do this we let $X_{1}=\xi_{1}, X_{2}=\xi_{1} \xi_{2}$, and for $m=2^{n-1}+j, 0<j \leq 2^{n-1}$, $n \geq 2$ let $X_{m}=X_{j} \xi_{n+1}$. Each $X_{m}$ is a product of a different set of $\xi_{j}$ 's so they are pairwise independent.

## Exercises

3.4.1. Suppose you roll a die 180 times. Use the normal approximation (with the histogram correction) to estimate the probability you will get fewer than 25 sixes.
3.4.2. Let $X_{1}, X_{2}, \ldots$ be i.i.d. with $E X_{i}=0,0<\operatorname{var}\left(X_{i}\right)<\infty$, and let $S_{n}=X_{1}+\cdots+X_{n}$. (a) Use the central limit theorem and Kolmogorov's zero-one law to conclude that $\limsup S_{n} / \sqrt{n}=\infty$ a.s. (b) Use an argument by contradiction to show that $S_{n} / \sqrt{n}$ does not converge in probability. Hint: Consider $n=m!$.
3.4.3. Let $X_{1}, X_{2}, \ldots$ be i.i.d. and let $S_{n}=X_{1}+\cdots+X_{n}$. Assume that $S_{n} / \sqrt{n} \Rightarrow$ a limit and conclude that $E X_{i}^{2}<\infty$. Sketch: Suppose $E X_{i}^{2}= \infty$. Let $X_{1}^{\prime}, X_{2}^{\prime}, \ldots$ be an independent copy of the original sequence. Let $Y_{i}=X_{i}-X_{i}^{\prime}, U_{i}=Y_{i} 1_{\left(\left|Y_{i}\right| \leq A\right)}, V_{i}=Y_{i} 1_{\left(\left|Y_{i}\right|>A\right)}$, and observe that for any K

$$
\begin{aligned}
P\left(\sum_{m=1}^{n} Y_{m} \geq K \sqrt{n}\right) & \geq P\left(\sum_{m=1}^{n} U_{m} \geq K \sqrt{n}, \sum_{m=1}^{n} V_{m} \geq 0\right) \\
& \geq \frac{1}{2} P\left(\sum_{m=1}^{n} U_{m} \geq K \sqrt{n}\right) \geq \frac{1}{5}
\end{aligned}
$$

for large $n$ if $A$ is large enough. Since $K$ is arbitrary, this is a contradiction.
3.4.4. Let $X_{1}, X_{2} \ldots$ be i.i.d. with $X_{i} \geq 0, E X_{i}=1$, and $\operatorname{var}\left(X_{i}\right)= \sigma^{2} \in(0, \infty)$. Show that $2\left(\sqrt{S_{n}}-\sqrt{n}\right) \Rightarrow \sigma \chi$.
3.4.5. Self-normalized sums. Let $X_{1}, X_{2}, \ldots$ be i.i.d. with $E X_{i}=0$ and $E X_{i}^{2}=\sigma^{2} \in(0, \infty)$. Then

$$
\sum_{m=1}^{n} X_{m} /\left(\sum_{m=1}^{n} X_{m}^{2}\right)^{1 / 2} \Rightarrow \chi
$$

3.4.6. Random index central limit theorem. Let $X_{1}, X_{2}, \ldots$ be i.i.d. with $E X_{i}=0$ and $E X_{i}^{2}=\sigma^{2} \in(0, \infty)$, and let $S_{n}=X_{1}+\cdots+X_{n}$. Let $N_{n}$ be a sequence of nonnegative integer-valued random variables and $a_{n}$ a sequence of integers with $a_{n} \rightarrow \infty$ and $N_{n} / a_{n} \rightarrow 1$ in probability. Show that

$$
S_{N_{n}} / \sigma \sqrt{a_{n}} \Rightarrow \chi
$$

Hint: Use Kolmogorov's inequality (Theorem 2.5.5) to conclude that if $Y_{n}=S_{N_{n}} / \sigma \sqrt{a_{n}}$ and $Z_{n}=S_{a_{n}} / \sigma \sqrt{a_{n}}$, then $Y_{n}-Z_{n} \rightarrow 0$ in probability.
3.4.7. A central limit theorem in renewal theory. Let $Y_{1}, Y_{2}, \ldots$ be i.i.d. positive random variables with $E Y_{i}=\mu$ and $\operatorname{var}\left(Y_{i}\right)=\sigma^{2} \in(0, \infty)$. Let $S_{n}=Y_{1}+\cdots+Y_{n}$ and $N_{t}=\sup \left\{m: S_{m} \leq t\right\}$. Apply the previous exercise to $X_{i}=Y_{i}-\mu$ to prove that as $t \rightarrow \infty$

$$
\left(\mu N_{t}-t\right) /\left(\sigma^{2} t / \mu\right)^{1 / 2} \Rightarrow \chi
$$

3.4.8. A second proof of the renewal CLT. Let $Y_{1}, Y_{2}, \ldots, S_{n}$, and $N_{t}$ be as in the last exercise. Let $u=[t / \mu], D_{t}=S_{u}-t$. Use Kolmogorov's inequality to show
$P\left(\left|S_{u+m}-\left(S_{u}+m \mu\right)\right|>t^{2 / 5}\right.$ for some $\left.m \in\left[-t^{3 / 5}, t^{3 / 5}\right]\right) \rightarrow 0$ as $t \rightarrow \infty$
Conclude $\left|N_{t}-\left(t-D_{t}\right) / \mu\right| / t^{1 / 2} \rightarrow 0$ in probability and then obtain the result in the previous exercise.

### 3.4.2 Triangular Arrays

Our next step is to generalize the central limit theorem to:
Theorem 3.4.10. The Lindeberg-Feller theorem. For each $n$, let $X_{n, m}, 1 \leq m \leq n$, be independent random variables with $E X_{n, m}=0$. Suppose
(i) $\sum_{m=1}^{n} E X_{n, m}^{2} \rightarrow \sigma^{2}>0$
(ii) For all $\epsilon>0, \lim _{n \rightarrow \infty} \sum_{m=1}^{n} E\left(\left|X_{n, m}\right|^{2} ;\left|X_{n, m}\right|>\epsilon\right)=0$.

Then $S_{n}=X_{n, 1}+\cdots+X_{n, n} \Rightarrow \sigma \chi$ as $n \rightarrow \infty$.
Remarks. In words, the theorem says that a sum of a large number of small independent effects has approximately a normal distribution. To see that Theorem 3.4.10 contains our first central limit theorem, let $Y_{1}, Y_{2} \ldots$ be i.i.d. with $E Y_{i}=0$ and $E Y_{i}^{2}=\sigma^{2} \in(0, \infty)$, and let $X_{n, m}= Y_{m} / n^{1 / 2}$. Then $\sum_{m=1}^{n} E X_{n, m}^{2}=\sigma^{2}$ and if $\epsilon>0$

$$
\begin{aligned}
\sum_{m=1}^{n} E\left(\left|X_{n, m}\right|^{2} ;\left|X_{n, m}\right|>\epsilon\right) & =n E\left(\left|Y_{1} / n^{1 / 2}\right|^{2} ;\left|Y_{1} / n^{1 / 2}\right|>\epsilon\right) \\
& =E\left(\left|Y_{1}\right|^{2} ;\left|Y_{1}\right|>\epsilon n^{1 / 2}\right) \rightarrow 0
\end{aligned}
$$

by the dominated convergence theorem since $E Y_{1}^{2}<\infty$.

Proof. Let $\varphi_{n, m}(t)=E \exp \left(i t X_{n, m}\right), \sigma_{n, m}^{2}=E X_{n, m}^{2}$. By Theorem 3.3.17, it suffices to show that

$$
\prod_{m=1}^{n} \varphi_{n, m}(t) \rightarrow \exp \left(-t^{2} \sigma^{2} / 2\right)
$$

Let $z_{n, m}=\varphi_{n, m}(t)$ and $w_{n, m}=\left(1-t^{2} \sigma_{n, m}^{2} / 2\right)$. By (3.3.3)

$$
\begin{aligned}
\left|z_{n, m}-w_{n, m}\right| & \leq E\left(\left|t X_{n, m}\right|^{3} \wedge 2\left|t X_{n, m}\right|^{2}\right) \\
& \leq E\left(\left|t X_{n, m}\right|^{3} ;\left|X_{n, m}\right| \leq \epsilon\right)+E\left(2\left|t X_{n, m}\right|^{2} ;\left|X_{n, m}\right|>\epsilon\right) \\
& \leq \epsilon t^{3} E\left(\left|X_{n, m}\right|^{2} ;\left|X_{n, m}\right| \leq \epsilon\right)+2 t^{2} E\left(\left|X_{n, m}\right|^{2} ;\left|X_{n, m}\right|>\epsilon\right)
\end{aligned}
$$

Summing $m=1$ to $n$, letting $n \rightarrow \infty$, and using (i) and (ii) gives

$$
\limsup _{n \rightarrow \infty} \sum_{m=1}^{n}\left|z_{n, m}-w_{n, m}\right| \leq \epsilon t^{3} \sigma^{2}
$$

Since $\epsilon>0$ is arbitrary, it follows that the sequence converges to 0 . Our next step is to use Lemma 3.4.3 with $\theta=1$ to get

$$
\left|\prod_{m=1}^{n} \varphi_{n, m}(t)-\prod_{m=1}^{n}\left(1-t^{2} \sigma_{n, m}^{2} / 2\right)\right| \rightarrow 0
$$

To check the hypotheses of Lemma 3.4.3, note that since $\varphi_{n, m}$ is a ch.f. $\left|\varphi_{n, m}(t)\right| \leq 1$ for all $n, m$. For the terms in the second product we note that

$$
\sigma_{n, m}^{2} \leq \epsilon^{2}+E\left(\left|X_{n, m}\right|^{2} ;\left|X_{n, m}\right|>\epsilon\right)
$$

and $\epsilon$ is arbitrary so (ii) implies $\sup _{m} \sigma_{n, m}^{2} \rightarrow 0$ and thus if $n$ is large $1 \geq 1-t^{2} \sigma_{n, m}^{2} / 2>-1$ for all $m$.

To complete the proof now, we apply Exercise 3.1.1 with $c_{m, n}= -t^{2} \sigma_{n, m}^{2} / 2$. We have just shown $\sup _{m} \sigma_{n, m}^{2} \rightarrow 0$. (i) implies

$$
\sum_{m=1}^{n} c_{m, n} \rightarrow-\sigma^{2} t^{2} / 2
$$

so $\prod_{m=1}^{n}\left(1-t^{2} \sigma_{n, m}^{2} / 2\right) \rightarrow \exp \left(-t^{2} \sigma^{2} / 2\right)$ and the proof is complete.
Example 3.4.11. Cycles in a random permutation and record values. Continuing the analysis of Examples 2.2.8 and 2.3.10, let $Y_{1}, Y_{2}, \ldots$ be independent with $P\left(Y_{m}=1\right)=1 / m$, and $P\left(Y_{m}=0\right)=1-1 / m$. $E Y_{m}=1 / m$ and $\operatorname{var}\left(Y_{m}\right)=1 / m-1 / m^{2}$. So if $S_{n}=Y_{1}+\cdots+Y_{n}$ then $E S_{n} \sim \log n$ and $\operatorname{var}\left(S_{n}\right) \sim \log n$. Let

$$
X_{n, m}=\left(Y_{m}-1 / m\right) /(\log n)^{1 / 2}
$$

$E X_{n, m}=0, \sum_{m=1}^{n} E X_{n, m}^{2} \rightarrow 1$, and for any $\epsilon>0$

$$
\sum_{m=1}^{n} E\left(\left|X_{n, m}\right|^{2} ;\left|X_{n, m}\right|>\epsilon\right) \rightarrow 0
$$

since the sum is 0 as soon as $(\log n)^{-1 / 2}<\epsilon$. Applying Theorem 3.4.10 now gives

$$
(\log n)^{-1 / 2}\left(S_{n}-\sum_{m=1}^{n} \frac{1}{m}\right) \Rightarrow \chi
$$

Observing that

$$
\sum_{m=1}^{n-1} \frac{1}{m} \geq \int_{1}^{n} x^{-1} d x=\log n \geq \sum_{m=2}^{n} \frac{1}{m}
$$

shows $\left|\log n-\sum_{m=1}^{n} 1 / m\right| \leq 1$ and the conclusion can be written as

$$
\left(S_{n}-\log n\right) /(\log n)^{1 / 2} \Rightarrow \chi
$$

Example 3.4.12. The converse of the three series theorem. Recall the set up of Theorem 2.5.8. Let $X_{1}, X_{2}, \ldots$ be independent, let $A>$ 0 , and let $Y_{m}=X_{m} 1_{\left(\left|X_{m}\right| \leq A\right)}$. In order that $\sum_{n=1}^{\infty} X_{n}$ converges (i.e., $\lim _{N \rightarrow \infty} \sum_{n=1}^{N} X_{n}$ exists) it is necessary that:
(i) $\sum_{n=1}^{\infty} P\left(\left|X_{n}\right|>A\right)<\infty$,
(ii) $\sum_{n=1}^{\infty} E Y_{n}$ converges
and (iii) $\sum_{n=1}^{\infty} \operatorname{var}\left(Y_{n}\right)<\infty$

Proof. The necessity of the first condition is clear. For if that sum is infinite, $P\left(\left|X_{n}\right|>A\right.$ i.o. $)>0$ and $\lim _{n \rightarrow \infty} \sum_{m=1}^{n} X_{m}$ cannot exist. Suppose next that the sum in (i) is finite but the sum in (iii) is infinite. Let

$$
c_{n}=\sum_{m=1}^{n} \operatorname{var}\left(Y_{m}\right) \quad \text { and } \quad X_{n, m}=\left(Y_{m}-E Y_{m}\right) / c_{n}^{1 / 2}
$$

$E X_{n, m}=0, \sum_{m=1}^{n} E X_{n, m}^{2}=1$, and for any $\epsilon>0$

$$
\sum_{m=1}^{n} E\left(\left|X_{n, m}\right|^{2} ;\left|X_{n, m}\right|>\epsilon\right) \rightarrow 0
$$

since the sum is 0 as soon as $2 A / c_{n}^{1 / 2}<\epsilon$. Applying Theorem 3.4.10 now gives that if $S_{n}=X_{n, 1}+\cdots+X_{n, n}$ then $S_{n} \Rightarrow \chi$. Now
(i) if $\lim _{n \rightarrow \infty} \sum_{m=1}^{n} X_{m}$ exists, $\lim _{n \rightarrow \infty} \sum_{m=1}^{n} Y_{m}$ exists.
(ii) if we let $T_{n}=\left(\sum_{m \leq n} Y_{m}\right) / c_{n}^{1 / 2}$ then $T_{n} \Rightarrow 0$.

The last two results and Exercise 3.2.13 imply $\left(S_{n}-T_{n}\right) \Rightarrow \chi$. Since

$$
S_{n}-T_{n}=-\left(\sum_{m \leq n} E Y_{m}\right) / c_{n}^{1 / 2}
$$

is not random, this is absurd.
Finally, assume the series in (i) and (iii) are finite. Theorem 2.5.6 implies that $\lim _{n \rightarrow \infty} \sum_{m=1}^{n}\left(Y_{m}-E Y_{m}\right)$ exists, so if $\lim _{n \rightarrow \infty} \sum_{m=1}^{n} X_{m}$ and hence $\lim _{n \rightarrow \infty} \sum_{m=1}^{n} Y_{m}$ does, taking differences shows that (ii) holds.
Example 3.4.13. Infinite variance. Suppose $X_{1}, X_{2}, \ldots$ are i.i.d. and have $P\left(X_{1}>x\right)=P\left(X_{1}<-x\right)$ and $P\left(\left|X_{1}\right|>x\right)=x^{-2}$ for $x \geq 1$.

$$
E\left|X_{1}\right|^{2}=\int_{0}^{\infty} 2 x P\left(\left|X_{1}\right|>x\right) d x=\infty
$$

but it turns out that when $S_{n}=X_{1}+\cdots+X_{n}$ is suitably normalized it converges to a normal distribution. Let

$$
Y_{n, m}=X_{m} 1_{\left(\left|X_{m}\right| \leq n^{1 / 2} \log \log n\right)}
$$

The truncation level $c_{n}=n^{1 / 2} \log \log n$ is chosen large enough to make

$$
\sum_{m=1}^{n} P\left(Y_{n, m} \neq X_{m}\right) \leq n P\left(\left|X_{1}\right|>c_{n}\right) \rightarrow 0
$$

However, we want the variance of $Y_{n, m}$ to be as small as possible, so we keep the truncation close to the lowest possible level.

Our next step is to show $E Y_{n, m}^{2} \sim \log n$. For this we need upper and lower bounds. Since $P\left(\left|Y_{n, m}\right|>x\right) \leq P\left(\left|X_{1}\right|>x\right)$ and is 0 for $x>c_{n}$, we have

$$
\begin{aligned}
E Y_{n, m}^{2} & \leq \int_{0}^{c_{n}} 2 y P\left(\left|X_{1}\right|>y\right) d y=1+\int_{1}^{c_{n}} 2 / y d y \\
& =1+2 \log c_{n}=1+\log n+2 \log \log \log n \sim \log n
\end{aligned}
$$

In the other direction, we observe $P\left(\left|Y_{n, m}\right|>x\right)=P\left(\left|X_{1}\right|>x\right)- P\left(\left|X_{1}\right|>c_{n}\right)$ and the right-hand side is $\geq\left(1-(\log \log n)^{-2}\right) P\left(\left|X_{1}\right|>x\right)$ when $x \leq \sqrt{n}$ so

$$
E Y_{n, m}^{2} \geq\left(1-(\log \log n)^{-2}\right) \int_{1}^{\sqrt{n}} 2 / y d y \sim \log n
$$

If $S_{n}^{\prime}=Y_{n, 1}+\cdots+Y_{n, n}$ then $\operatorname{var}\left(S_{n}^{\prime}\right) \sim n \log n$, so we apply Theorem 3.4.10 to $X_{n, m}=Y_{n, m} /(n \log n)^{1 / 2}$. Things have been arranged so that (i) is satisfied. Since $\left|Y_{n, m}\right| \leq n^{1 / 2} \log \log n$, the sum in (ii) is 0 for large $n$, and it follows that $S_{n}^{\prime} /(n \log n)^{1 / 2} \Rightarrow \chi$. Since the choice of $c_{n}$ guarantees $P\left(S_{n} \neq S_{n}^{\prime}\right) \rightarrow 0$, the same result holds for $S_{n}$.

Remark. In Section 3.6, we will see that if we replace $P\left(\left|X_{1}\right|>x\right)= x^{-2}$ in Example 3.4.13 by $P\left(\left|X_{1}\right|>x\right)=x^{-\alpha}$ where $0<\alpha<2$, then $S_{n} / n^{1 / \alpha} \Rightarrow$ to a limit which is not $\chi$. The last word on convergence to the normal distribution is the next result due to Lévy.

Theorem 3.4.14. Let $X_{1}, X_{2} \ldots$ be i.i.d. and $S_{n}=X_{1}+\cdots+X_{n}$. In order that there exist constants $a_{n}$ and $b_{n}>0$ so that $\left(S_{n}-a_{n}\right) / b_{n} \Rightarrow \chi$, it is necessary and sufficient that

$$
y^{2} P\left(\left|X_{1}\right|>y\right) / E\left(\left|X_{1}\right|^{2} ;\left|X_{1}\right| \leq y\right) \rightarrow 0
$$

A proof can be found in Gnedenko and Kolmogorov (1954), a reference that contains the last word on many results about sums of independent random variables.

## Exercises

In the next five problems $X_{1}, X_{2}, \ldots$ are independent and $S_{n}=X_{1}+ \cdots+X_{n}$.
3.4.9. Suppose $P\left(X_{m}=m\right)=P\left(X_{m}=-m\right)=m^{-2} / 2$, and for $m \geq 2$

$$
P\left(X_{m}=1\right)=P\left(X_{m}=-1\right)=\left(1-m^{-2}\right) / 2
$$

Show that $\operatorname{var}\left(S_{n}\right) / n \rightarrow 2$ but $S_{n} / \sqrt{n} \Rightarrow \chi$. The trouble here is that $X_{n, m}=X_{m} / \sqrt{n}$ does not satisfy (ii) of Theorem 3.4.10.
3.4.10. Show that if $\left|X_{i}\right| \leq M$ and $\sum_{n} \operatorname{var}\left(X_{n}\right)=\infty$ then

$$
\left(S_{n}-E S_{n}\right) / \sqrt{\operatorname{var}\left(S_{n}\right)} \Rightarrow \chi
$$

3.4.11. Suppose $E X_{i}=0, E X_{i}^{2}=1$ and $E\left|X_{i}\right|^{2+\delta} \leq C$ for some $0< \delta, C<\infty$. Show that $S_{n} / \sqrt{n} \Rightarrow \chi$.
3.4.12. Prove Lyapunov's Theorem. Let $\alpha_{n}=\left\{\operatorname{var}\left(S_{n}\right)\right\}^{1 / 2}$. If there is a $\delta>0$ so that

$$
\lim _{n \rightarrow \infty} \alpha_{n}^{-(2+\delta)} \sum_{m=1}^{n} E\left(\left|X_{m}-E X_{m}\right|^{2+\delta}\right)=0
$$

then $\left(S_{n}-E S_{n}\right) / \alpha_{n} \Rightarrow \chi$. Note that the previous exercise is a special case of this result.
3.4.13. Suppose $P\left(X_{j}=j\right)=P\left(X_{j}=-j\right)=1 / 2 j^{\beta}$ and $P\left(X_{j}=0\right)= 1-j^{-\beta}$ where $\beta>0$. Show that (i) If $\beta>1$ then $S_{n} \rightarrow S_{\infty}$ a.s. (ii) if $\beta<1$ then $S_{n} / n^{(3-\beta) / 2} \Rightarrow c \chi$. (iii) if $\beta=1$ then $S_{n} / n \Rightarrow \aleph$ where

$$
E \exp (i t \aleph)=\exp \left(-\int_{0}^{1} x^{-1}(1-\cos x t) d x\right)
$$

### 3.4.3 Prime Divisors (Erdös-Kac)*

Our aim here is to prove that an integer picked at random from $\{1,2, \ldots, n\}$ has about

$$
\log \log n+\chi(\log \log n)^{1 / 2}
$$

prime divisors. Since $\exp \left(e^{4}\right)=5.15 \times 10^{23}$, this result does not apply to most numbers we encounter in "everyday life." The first step in deriving this result is to give a

Second proof of Theorem 3.4.10. The first step is to let

$$
h_{n}(\epsilon)=\sum_{m=1}^{n} E\left(X_{n, m}^{2} ;\left|X_{n, m}\right|>\epsilon\right)
$$

and observe
Lemma 3.4.15. $h_{n}(\epsilon) \rightarrow 0$ for each fixed $\epsilon>0$ so we can pick $\epsilon_{n} \rightarrow 0$ so that $h_{n}\left(\epsilon_{n}\right) \rightarrow 0$.

Proof. Let $N_{m}$ be chosen so that $h_{n}(1 / m) \leq 1 / m$ for $n \geq N_{m}$ and $m \rightarrow N_{m}$ is increasing. Let $\epsilon_{n}=1 / m$ for $N_{m} \leq n<N_{m+1}$, and $=1$ for $n<N_{1}$. When $N_{m} \leq n<N_{m+1}, \epsilon_{n}=1 / m$, so $\left|h_{n}\left(\epsilon_{n}\right)\right|=\left|h_{n}(1 / m)\right| \leq 1 / m$ and the desired result follows.

Let $X_{n, m}^{\prime}=X_{n, m} 1_{\left(\left|X_{n, m}\right|>\epsilon_{n}\right)}, Y_{n, m}=X_{n, m} 1_{\left(\left|X_{n, m}\right| \leq \epsilon_{n}\right)}$, and $Z_{n, m}= Y_{n, m}-E Y_{n, m}$. Clearly $\left|Z_{n, m}\right| \leq 2 \epsilon_{n}$. Using $X_{n, m}=X_{n, m}^{\prime}+Y_{n, m}, Z_{n, m}= Y_{n, m}-E Y_{n, m}, E Y_{n, m}=-E X_{n, m}^{\prime}$, the variance of the sum is the sum of the variances, and $\operatorname{var}(W) \leq E W^{2}$, we have

$$
\begin{aligned}
E\left(\sum_{m=1}^{n} X_{n, m}\right. & \left.-\sum_{m=1}^{n} Z_{n, m}\right)^{2}=E\left(\sum_{m=1}^{n} X_{n, m}^{\prime}-E X_{n, m}^{\prime}\right)^{2} \\
& =\sum_{m=1}^{n} E\left(X_{n, m}^{\prime}-E X_{n, m}^{\prime}\right)^{2} \leq \sum_{m=1}^{n} E\left(X_{n, m}^{\prime}\right)^{2} \rightarrow 0
\end{aligned}
$$

as $n \rightarrow \infty$, by the choice of $\epsilon_{n}$.
Let $S_{n}=\sum_{m=1}^{n} X_{n, m}$ and $T_{n}=\sum_{m=1}^{n} Z_{n, m}$. The last computation shows $S_{n}-T_{n} \rightarrow 0$ in $L^{2}$ and hence in probability by Lemma 2.2.2. Thus, by Exercise 3.2.13, it suffices to show $T_{n} \Rightarrow \sigma \chi$. (i) implies $E S_{n}^{2} \rightarrow \sigma^{2}$. We have just shown that $E\left(S_{n}-T_{n}\right)^{2} \rightarrow 0$, so the triangle inequality for the $L^{2}$ norm implies $E T_{n}^{2} \rightarrow \sigma^{2}$. To compute higher moments, we observe

$$
T_{n}^{r}=\sum_{k=1}^{r} \sum_{r_{i}} \frac{r!}{r_{1}!\cdots r_{k}!} \frac{1}{k!} \sum_{i_{j}} Z_{n, i_{1}}^{r_{1}} \cdots Z_{n, i_{k}}^{r_{k}}
$$

where $\sum_{r_{i}}$ extends over all $k$-tuples of positive integers with $r_{1}+\cdots+r_{k}= r$ and $\sum_{i_{j}}$ extends over all $k$-tuples of distinct integers with $1 \leq i \leq n$. If we let

$$
A_{n}\left(r_{1}, \ldots, r_{k}\right)=\sum_{i_{j}} E Z_{n, i_{1}}^{r_{1}} \cdots E Z_{n, i_{k}}^{r_{k}}
$$

then

$$
E T_{n}^{r}=\sum_{k=1}^{r} \sum_{r_{i}} \frac{r!}{r_{1}!\cdots r_{k}!} \frac{1}{k!} A_{n}\left(r_{1}, \ldots r_{k}\right)
$$

To evaluate the limit of $E T_{n}^{r}$ we observe:
(a) If some $r_{j}=1$, then $A_{n}\left(r_{1}, \ldots r_{k}\right)=0$ since $E Z_{n, i_{j}}=0$.
(b) If all $r_{j}=2$ then

$$
\sum_{i_{j}} E Z_{n, i_{1}}^{2} \cdots E Z_{n, i_{k}}^{2} \leq\left(\sum_{m=1}^{n} E Z_{n, m}^{2}\right)^{k} \rightarrow \sigma^{2 k}
$$

To argue the other inequality, we note that for any $1 \leq a<b \leq k$ we can estimate the sum over all the $i_{1}, \ldots, i_{k}$ with $i_{a}=i_{b}$ by replacing $E Z_{n, i_{a}}^{2}$ by $\left(2 \epsilon_{n}\right)^{2}$ to get (the factor $\binom{k}{2}$ giving the number of ways to pick $1 \leq a<b \leq k$ )

$$
\left(\sum_{m=1}^{n} E Z_{n, m}^{2}\right)^{k}-\sum_{i_{j}} E Z_{n, i_{1}}^{2} \cdots E Z_{n, i_{k}}^{2} \leq\binom{ k}{2}\left(2 \epsilon_{n}\right)^{2}\left(\sum_{m=1}^{n} E Z_{n, m}^{2}\right)^{k-1} \rightarrow 0
$$

(c) If all the $r_{i} \geq 2$ but some $r_{j}>2$ then using

$$
E\left|Z_{n, i_{j}}\right|^{r_{j}} \leq\left(2 \epsilon_{n}\right)^{r_{j}-2} E Z_{n, i_{j}}^{2}
$$

we have

$$
\begin{aligned}
\left|A_{n}\left(r_{1}, \ldots r_{k}\right)\right| & \leq \sum_{i_{j}} E\left|Z_{n, i_{1}}\right|^{r_{1}} \cdots E\left|Z_{n, i_{k}}\right|^{r_{k}} \\
& \leq\left(2 \epsilon_{n}\right)^{r-2 k} A_{n}(2, \ldots 2) \rightarrow 0
\end{aligned}
$$

When $r$ is odd, some $r_{j}$ must be $=1$ or $\geq 3$ so $E T_{n}^{r} \rightarrow 0$ by (a) and (c). If $r=2 k$ is even, (a)-(c) imply

$$
E T_{n}^{r} \rightarrow \frac{\sigma^{2 k}(2 k)!}{2^{k} k!}=E(\sigma \chi)^{r}
$$

and the result follows from Theorem 3.3.26.
Turning to the result for prime divisors, let $P_{n}$ denote the uniform distribution on $\{1, \ldots, n\}$. If $P_{\infty}(A) \equiv \lim P_{n}(A)$ exists the limit is
called the density of $A \subset \mathbf{Z}$. Let $A_{p}$ be the set of integers divisible by $p$. Clearly, if $p$ is a prime $P_{\infty}\left(A_{p}\right)=1 / p$ and $q \neq p$ is another prime

$$
P_{\infty}\left(A_{p} \cap A_{q}\right)=1 / p q=P_{\infty}\left(A_{p}\right) P_{\infty}\left(A_{q}\right)
$$

Even though $P_{\infty}$ is not a probability measure (since $P(\{i\})=0$ for all $i$ ), we can interpret this as saying that the events of being divisible by $p$ and $q$ are independent. Let $\delta_{p}(n)=1$ if $n$ is divisible by $p$, and $=0$ otherwise, and

$$
g(n)=\sum_{p \leq n} \delta_{p}(n) \quad \text { be the number of prime divisors of } n
$$

this and future sums on $p$ being over the primes. Intuitively, the $\delta_{p}(n)$ behave like $X_{p}$ that are i.i.d. with

$$
P\left(X_{p}=1\right)=1 / p \quad \text { and } \quad P\left(X_{p}=0\right)=1-1 / p
$$

The mean and variance of $\sum_{p \leq n} X_{p}$ are

$$
\sum_{p \leq n} 1 / p \quad \text { and } \quad \sum_{p \leq n} 1 / p(1-1 / p)
$$

respectively. It is known that

$$
\begin{equation*}
\sum_{p \leq n} 1 / p=\log \log n+O(1) \tag{*}
\end{equation*}
$$

(see Hardy and Wright (1959), Chapter XXII), while anyone can see $\sum_{p} 1 / p^{2}<\infty$, so applying Theorem 3.4.10 to $X_{p}$ and making a small leap of faith gives us:
Theorem 3.4.16. Erdös-Kac central limit theorem. As $n \rightarrow \infty$

$$
P_{n}\left(m \leq n: g(m)-\log \log n \leq x(\log \log n)^{1 / 2}\right) \rightarrow P(\chi \leq x)
$$

Proof. We begin by showing that we can ignore the primes "near" $n$. Let

$$
\begin{aligned}
\alpha_{n} & =n^{1 / \log \log n} \\
\log \alpha_{n} & =\log n / \log \log n \\
\log \log \alpha_{n} & =\log \log n-\log \log \log n
\end{aligned}
$$

The sequence $\alpha_{n}$ has two nice properties:
(a) $\left(\sum_{\alpha_{n}<p \leq n} 1 / p\right) /(\log \log n)^{1 / 2} \rightarrow 0$ by $(*)$

Proof of (a). By (*)

$$
\begin{aligned}
\sum_{\alpha_{n}<p \leq n} 1 / p & =\sum_{p \leq n} 1 / p-\sum_{p \leq \alpha_{n}} 1 / p \\
& =\log \log n-\log \log \alpha_{n}+O(1) \\
& =\log \log \log n+O(1)
\end{aligned}
$$

(b) If $\epsilon>0$ then $\alpha_{n} \leq n^{\epsilon}$ for large $n$ and hence $\alpha_{n}^{r} / n \rightarrow 0$ for all $r<\infty$.

Proof of (b). $1 / \log \log n \rightarrow 0$ as $n \rightarrow \infty$.
Let $g_{n}(m)=\sum_{p \leq \alpha_{n}} \delta_{p}(m)$ and let $E_{n}$ denote expected value w.r.t. $P_{n}$.

$$
E_{n}\left(\sum_{\alpha_{n}<p \leq n} \delta_{p}\right)=\sum_{\alpha_{n}<p \leq n} P_{n}\left(m: \delta_{p}(m)=1\right) \leq \sum_{\alpha_{n}<p \leq n} 1 / p
$$

so by (a) it is enough to prove the result for $g_{n}$. Let

$$
S_{n}=\sum_{p \leq \alpha_{n}} X_{p}
$$

where the $X_{p}$ are the independent random variables introduced above. Let $b_{n}=E S_{n}$ and $a_{n}^{2}=\operatorname{var}\left(S_{n}\right)$. (a) tells us that $b_{n}$ and $a_{n}^{2}$ are both

$$
\log \log n+o\left((\log \log n)^{1 / 2}\right)
$$

so it suffices to show

$$
P_{n}\left(m: g_{n}(m)-b_{n} \leq x a_{n}\right) \rightarrow P(\chi \leq x)
$$

An application of Theorem 3.4.10 shows $\left(S_{n}-b_{n}\right) / a_{n} \Rightarrow \chi$, and since $\left|X_{p}\right| \leq 1$ it follows from the second proof of Theorem 3.4.10 that

$$
E\left(\left(S_{n}-b_{n}\right) / a_{n}\right)^{r} \rightarrow E \chi^{r} \quad \text { for all } r
$$

Using notation from that proof (and replacing $i_{j}$ by $p_{j}$ )

$$
E S_{n}^{r}=\sum_{k=1}^{r} \sum_{r_{i}} \frac{r!}{r_{1}!\cdots r_{k}!} \frac{1}{k!} \sum_{p_{j}} E\left(X_{p_{1}}^{r_{1}} \cdots X_{p_{k}}^{r_{k}}\right)
$$

Since $X_{p} \in\{0,1\}$, the summand is

$$
E\left(X_{p_{1}} \cdots X_{p_{k}}\right)=1 /\left(p_{1} \cdots p_{k}\right)
$$

A little thought reveals that

$$
E_{n}\left(\delta_{p_{1}} \cdots \delta_{p_{k}}\right) \leq \frac{1}{n}\left[n /\left(p_{1} \cdots p_{k}\right)\right]
$$

The two moments differ by $\leq 1 / n$, so

$$
\begin{aligned}
\left|E\left(S_{n}^{r}\right)-E_{n}\left(g_{n}^{r}\right)\right| & =\sum_{k=1}^{r} \sum_{r_{i}} \frac{r!}{r_{1}!\cdots r_{k}!} \frac{1}{k!} \sum_{p_{j}} \frac{1}{n} \\
& \leq 13 n\left(\sum_{p \leq \alpha_{n}} 1\right)^{r} \leq \frac{\alpha_{n}^{r}}{n} \rightarrow 0
\end{aligned}
$$

by (b). Now

$$
\begin{aligned}
E\left(S_{n}-b_{n}\right)^{r} & =\sum_{m=0}^{r}\binom{r}{m} E S_{n}^{m}\left(-b_{n}\right)^{r-m} \\
E\left(g_{n}-b_{n}\right)^{r} & =\sum_{m=0}^{r}\binom{r}{m} E g_{n}^{m}\left(-b_{n}\right)^{r-m}
\end{aligned}
$$

so subtracting and using our bound on $\left|E\left(S_{n}^{r}\right)-E_{n}\left(g_{n}^{r}\right)\right|$ with $r=m$

$$
\left|E\left(S_{n}-b_{n}\right)^{r}-E\left(g_{n}-b_{n}\right)^{r}\right| \leq \sum_{m=0}^{r}\binom{r}{m} \frac{1}{n} \alpha_{n}^{m} b_{n}^{r-m}=\left(\alpha_{n}+b_{n}\right)^{r} / n \rightarrow 0
$$

since $b_{n} \leq \alpha_{n}$. This is more than enough to conclude that

$$
E\left(\left(g_{n}-b_{n}\right) / a_{n}\right)^{r} \rightarrow E \chi^{r}
$$

and the desired result follows from Theorem 3.3.26.

### 3.4.4 Rates of Convergence (Berry-Esseen)*

Theorem 3.4.17. Let $X_{1}, X_{2}, \ldots$ be i.i.d. with $E X_{i}=0, E X_{i}^{2}=\sigma^{2}$, and $E\left|X_{i}\right|^{3}=\rho<\infty$. If $F_{n}(x)$ is the distribution of $\left(X_{1}+\cdots+X_{n}\right) / \sigma \sqrt{n}$ and $\mathcal{N}(x)$ is the standard normal distribution, then

$$
\left|F_{n}(x)-\mathcal{N}(x)\right| \leq 3 \rho / \sigma^{3} \sqrt{n}
$$

Remarks. The reader should note that the inequality holds for all $n$ and $x$, but since $\rho \geq \sigma^{3}$ it only has nontrivial content for $n \geq 10$. It is easy to see that the rate cannot be faster than $n^{-1 / 2}$. When $P\left(X_{i}=\right. 1)=P\left(X_{i}=-1\right)=1 / 2$, symmetry and (1.4) imply

$$
F_{2 n}(0)=\frac{1}{2}\left\{1+P\left(S_{2 n}=0\right)\right\}=\frac{1}{2}\left(1+(\pi n)^{-1 / 2}\right)+o\left(n^{-1 / 2}\right)
$$

The constant 3 is not the best known (van Beek (1972) gets 0.8), but as Feller brags, "our streamlined method yields a remarkably good bound even though it avoids the usual messy numerical calculations." The hypothesis $E|X|^{3}$ is needed to get the rate $n^{-1 / 2}$. Heyde (1967) has shown that for $0<\delta<1$

$$
\sum_{n=1}^{\infty} n^{-1+\delta / 2} \sup _{x}\left|F_{n}(x)-\mathcal{N}(x)\right|<\infty
$$

if and only if $E|X|^{2+\delta}<\infty$. For this and more on rates of convergence, see Hall (1982).

Proof. Since neither side of the inequality is affected by scaling, we can suppose without loss of generality that $\sigma^{2}=1$. The first phase of the argument is to derive an inequality, Lemma 3.4.19, that relates the difference between the two distributions to the distance between their ch.f.'s. Polya's density (see Example 3.3.15 and use (e) of Theorem 3.3.1)

$$
h_{L}(x)=\frac{1-\cos L x}{\pi L x^{2}}
$$

has ch.f. $\omega_{L}(\theta)=(1-|\theta / L|)^{+}$for $|\theta| \leq L$. We will use $H_{L}$ for its distribution function. We will convolve the distributions under consideration with $H_{L}$ to get ch.f. that have compact support. The first step is to show that convolution with $H_{L}$ does not reduce the difference between the distributions too much.
Lemma 3.4.18. Let $F$ and $G$ be distribution functions with $G^{\prime}(x) \leq \lambda<\infty$. Let $\Delta(x)=F(x)-G(x), \eta=\sup |\Delta(x)|, \Delta_{L}=\Delta * H_{L}$, and $\eta_{L}=\sup \left|\Delta_{L}(x)\right|$. Then

$$
\eta_{L} \geq \frac{\eta}{2}-\frac{12 \lambda}{\pi L} \quad \text { or } \quad \eta \leq 2 \eta_{L}+\frac{24 \lambda}{\pi L}
$$

Proof. $\Delta$ goes to 0 at $\pm \infty, G$ is continuous, and $F$ is a d.f., so there is an $x_{0}$ with $\Delta\left(x_{0}\right)=\eta$ or $\Delta\left(x_{0}-\right)=-\eta$. By looking at the d.f.'s of $(-1)$ times the r.v.'s in the second case, we can suppose without loss of generality that $\Delta\left(x_{0}\right)=\eta$. Since $G^{\prime}(x) \leq \lambda$ and $F$ is nondecreasing, $\Delta\left(x_{0}+s\right) \geq \eta-\lambda s$. Letting $\delta=\eta / 2 \lambda$, and $t=x_{0}+\delta$, we have

$$
\Delta(t-x) \geq \begin{cases}(\eta / 2)+\lambda x & \text { for }|x| \leq \delta \\ -\eta & \text { otherwise }\end{cases}
$$

To estimate the convolution $\Delta_{L}$, we observe

$$
2 \int_{\delta}^{\infty} h_{L}(x) d x \leq 2 \int_{\delta}^{\infty} 2 /\left(\pi L x^{2}\right) d x=4 /(\pi L \delta)
$$

Looking at $(-\delta, \delta)$ and its complement separately and noticing symmetry implies $\int_{-\delta}^{\delta} x h_{L}(x) d x=0$, we have

$$
\eta_{L} \geq \Delta_{L}(t) \geq \frac{\eta}{2}\left(1-\frac{4}{\pi L \delta}\right)-\eta \frac{4}{\pi L \delta}=\frac{\eta}{2}-\frac{6 \eta}{\pi L \delta}=\frac{\eta}{2}-\frac{12 \lambda}{\pi L}
$$

which proves the lemma.
Lemma 3.4.19. Let $K_{1}$ and $K_{2}$ be d.f. with mean 0 whose ch.f. $\kappa_{i}$ are integrable

$$
K_{1}(x)-K_{2}(x)=(2 \pi)^{-1} \int-e^{-i t x} \frac{\kappa_{1}(t)-\kappa_{2}(t)}{i t} d t
$$

Proof. Since the $\kappa_{i}$ are integrable, the inversion formula, Theorem 3.3.11, implies that the density $k_{i}(x)$ has

$$
k_{i}(y)=(2 \pi)^{-1} \int e^{-i t y} \kappa_{i}(t) d t
$$

Subtracting the last expression with $i=2$ from the one with $i=1$ then integrating from $a$ to $x$ and letting $\Delta K=K_{1}-K_{2}$ gives

$$
\begin{aligned}
\Delta K(x)-\Delta K(a) & =(2 \pi)^{-1} \int_{a}^{x} \int e^{-i t y}\left\{\kappa_{1}(t)-\kappa_{2}(t)\right\} d t d y \\
& =(2 \pi)^{-1} \int\left\{e^{-i t a}-e^{-i t x}\right\} \frac{\kappa_{1}(t)-\kappa_{2}(t)}{i t} d t
\end{aligned}
$$

the application of Fubini's theorem being justified since the $\kappa_{i}$ are integrable in $t$ and we are considering a bounded interval in $y$.

The factor $1 / i t$ could cause problems near zero, but we have supposed that the $K_{i}$ have mean 0 , so $\left\{1-\kappa_{i}(t)\right\} / t \rightarrow 0$ by Exercise 3.3.18, and hence $\left(\kappa_{1}(t)-\kappa_{2}(t)\right) / i t$ is bounded and continuous. The factor $1 / i t$ improves the integrability for large $t$ so $\left(\kappa_{1}(t)-\kappa_{2}(t)\right) / i t$ is integrable. Letting $a \rightarrow-\infty$ and using the Riemann-Lebesgue lemma (Exercise 1.4.4) proves the result.

Let $\varphi_{F}$ and $\varphi_{G}$ be the ch.f.'s of $F$ and $G$. Applying Lemma 3.4.19 to $F_{L}=F * H_{L}$ and $G_{L}=G * H_{L}$, gives

$$
\begin{aligned}
\left|F_{L}(x)-G_{L}(x)\right| & \leq \frac{1}{2 \pi} \int\left|\varphi_{F}(t) \omega_{L}(t)-\varphi_{G}(t) \omega_{L}(t)\right| \frac{d t}{|t|} \\
& \leq \frac{1}{2 \pi} \int_{-L}^{L}\left|\varphi_{F}(t)-\varphi_{G}(t)\right| \frac{d t}{|t|}
\end{aligned}
$$

since $\left|\omega_{L}(t)\right| \leq 1$. Using Lemma 3.4.18 now, we have

$$
|F(x)-G(x)| \leq \frac{1}{\pi} \int_{-L}^{L}\left|\varphi_{F}(\theta)-\varphi_{G}(\theta)\right| \frac{d \theta}{|\theta|}+\frac{24 \lambda}{\pi L}
$$

where $\lambda=\sup _{x} G^{\prime}(x)$. Plugging in $F=F_{n}$ and $G=\mathcal{N}$ gives

$$
\begin{equation*}
\left|F_{n}(x)-\mathcal{N}(x)\right| \leq \frac{1}{\pi} \int_{-L}^{L}\left|\varphi^{n}(\theta / \sqrt{n})-\psi(\theta)\right| \frac{d \theta}{|\theta|}+\frac{24 \lambda}{\pi L} \tag{3.4.1}
\end{equation*}
$$

and it remains to estimate the right-hand side. This phase of the argument is fairly routine, but there is a fair amount of algebra. To save the reader from trying to improve the inequalities along the way in hopes of getting a better bound, we would like to observe that we have used the fact that $C=3$ to get rid of the cases $n \leq 9$, and we use $n \geq 10$ in (e).

To estimate the second term in (3.4.1), we observe that
(a)

$$
\sup _{x} G^{\prime}(x)=G^{\prime}(0)=(2 \pi)^{-1 / 2}=0.39894<2 / 5
$$

For the first, we observe that if $|\alpha|,|\beta| \leq \gamma$
(b)

$$
\left|\alpha^{n}-\beta^{n}\right| \leq \sum_{m=0}^{n-1}\left|\alpha^{n-m} \beta^{m}-\alpha^{n-m-1} \beta^{m+1}\right| \leq n|\alpha-\beta| \gamma^{n-1}
$$

Using (3.3.3) now gives (recall we are supposing $\sigma^{2}=1$ )
(c)

$$
\left|\varphi(t)-1+t^{2} / 2\right| \leq \rho|t|^{3} / 6
$$

so if $t^{2} \leq 2$

$$
\begin{equation*}
|\varphi(t)| \leq 1-t^{2} / 2+\rho|t|^{3} / 6 \tag{d}
\end{equation*}
$$

Let $L=4 \sqrt{n} / 3 \rho$. If $|\theta| \leq L$ then by (d) and the fact $\rho|\theta| / \sqrt{n} \leq 4 / 3$

$$
\begin{aligned}
|\varphi(\theta / \sqrt{n})| & \leq 1-\theta^{2} / 2 n+\rho|\theta|^{3} / 6 n^{3 / 2} \\
& \leq 1-5 \theta^{2} / 18 n \leq \exp \left(-5 \theta^{2} / 18 n\right)
\end{aligned}
$$

since $1-x \leq e^{-x}$. We will now apply (b) with

$$
\alpha=\varphi(\theta / \sqrt{n}) \quad \beta=\exp \left(-\theta^{2} / 2 n\right) \quad \gamma=\exp \left(-5 \theta^{2} / 18 n\right)
$$

Since we are supposing $n \geq 10$
(e)

$$
\gamma^{n-1} \leq \exp \left(-\theta^{2} / 4\right)
$$

For the other part of (b), we write

$$
n|\alpha-\beta| \leq n\left|\varphi(\theta / \sqrt{n})-1+\theta^{2} / 2 n\right|+n\left|1-\theta^{2} / 2 n-\exp \left(-\theta^{2} / 2 n\right)\right|
$$

To bound the first term on the right-hand side, observe (c) implies

$$
n\left|\varphi(\theta / \sqrt{n})-1+\theta^{2} / 2 n\right| \leq \rho|\theta|^{3} / 6 n^{1 / 2}
$$

For the second term, note that if $0<x<1$ then we have an alternating series with decreasing terms so

$$
\left|e^{-x}-(1-x)\right|=\left|-\frac{x^{2}}{2!}+\frac{x^{3}}{3!}-\ldots\right| \leq \frac{x^{2}}{2}
$$

Taking $x=\theta^{2} / 2 n$ it follows that for $|\theta| \leq L \leq \sqrt{2 n}$

$$
n\left|1-\theta^{2} / 2 n-\exp \left(-\theta^{2} / 2 n\right)\right| \leq \theta^{4} / 8 n
$$

Combining this with our estimate on the first term gives

$$
\begin{equation*}
n|\alpha-\beta| \leq \rho|\theta|^{3} / 6 n^{1 / 2}+\theta^{4} / 8 n \tag{f}
\end{equation*}
$$

Using (f) and (e) in (b), gives

$$
\begin{aligned}
\frac{1}{|\theta|}\left|\varphi^{n}(\theta / \sqrt{n})-\exp \left(-\theta^{2} / 2\right)\right| & \leq \exp \left(-\theta^{2} / 4\right)\left\{\frac{\rho \theta^{2}}{6 n^{1 / 2}}+\frac{|\theta|^{3}}{8 n}\right\} \\
& \leq \frac{1}{L} \exp \left(-\theta^{2} / 4\right)\left\{\frac{2 \theta^{2}}{9}+\frac{|\theta|^{3}}{18}\right\}
\end{aligned}
$$

since $\rho / \sqrt{n}=4 / 3 L$, and $1 / n=1 / \sqrt{n} \cdot 1 / \sqrt{n} \leq 4 / 3 L \cdot 1 / 3$ since $\rho \geq 1$ and $n \geq 10$. Using the last result and (a) in Lemma 3.4.19 gives

$$
\pi L\left|F_{n}(x)-\mathcal{N}(x)\right| \leq \int \exp \left(-\theta^{2} / 4\right)\left\{\frac{2 \theta^{2}}{9}+\frac{|\theta|^{3}}{18}\right\} d \theta+9.6
$$

Recalling $L=4 \sqrt{n} / 3 \rho$, we see that the last result is of the form $\mid F_{n}(x)- \mathcal{N}(x) \mid \leq C \rho / \sqrt{n}$. To evaluate the constant, we observe

$$
\int(2 \pi a)^{-1 / 2} x^{2} \exp \left(-x^{2} / 2 a\right) d x=a
$$

and writing $x^{3}=2 x^{2} \cdot x / 2$ and integrating by parts

$$
\begin{aligned}
2 \int_{0}^{\infty} x^{3} \exp \left(-x^{2} / 4\right) d x & =2 \int_{0}^{\infty} 4 x \exp \left(-x^{2} / 4\right) d x \\
& =-\left.16 e^{-x^{2} / 4}\right|_{0} ^{\infty}=16
\end{aligned}
$$

This gives us

$$
\left|F_{n}(x)-\mathcal{N}(x)\right| \leq \frac{1}{\pi} \cdot \frac{3}{4}\left(\frac{2}{9} \cdot 2 \cdot \sqrt{4 \pi}+\frac{16}{18}+9.6\right) \frac{\rho}{\sqrt{n}}<3 \frac{\rho}{\sqrt{n}}
$$

For the last step, you have to get out your calculator or trust Feller.

### 3.5 Local Limit Theorems*

In Section 3.1 we saw that if $X_{1}, X_{2}, \ldots$ are i.i.d. with $P\left(X_{1}=1\right)= P\left(X_{1}=-1\right)=1 / 2$ and $k_{n}$ is a sequence of integers with $2 k_{n} /(2 n)^{1 / 2} \rightarrow x$ then

$$
P\left(S_{2 n}=2 k_{n}\right) \sim(\pi n)^{-1 / 2} \exp \left(-x^{2} / 2\right)
$$

In this section, we will prove two theorems that generalize the last result. We begin with two definitions. A random variable $X$ has a lattice distribution if there are constants $b$ and $h>0$ so that $P(X \in b+h \mathbf{Z})=1$, where $b+h \mathbf{Z}=\{b+h z: z \in \mathbf{Z}\}$. The largest $h$ for which the last statement holds is called the span of the distribution.

Example 3.5.1. If $P(X=1)=P(X=-1)=1 / 2$ then $X$ has a lattice distribution with span 2 . When $h$ is 2 , one possible choice is $b=-1$.

The next result relates the last definition to the characteristic function. To check (ii) in its statement, note that in the last example $E\left(e^{i t X}\right)= \cos t$ has $|\cos (t)|=1$ when $t=n \pi$.
Theorem 3.5.2. Let $\varphi(t)=E e^{i t X}$. There are only three possibilities.
(i) $|\varphi(t)|<1$ for all $t \neq 0$.
(ii) There is a $\lambda>0$ so that $|\varphi(\lambda)|=1$ and $|\varphi(t)|<1$ for $0<t<\lambda$. In this case, $X$ has a lattice distribution with span $2 \pi / \lambda$.
(iii) $|\varphi(t)|=1$ for all $t$. In this case, $X=b$ a.s. for some $b$.

Proof. We begin with (ii). It suffices to show that $|\varphi(t)|=1$ if and only if $P(X \in b+(2 \pi / t) \mathbf{Z})=1$ for some $b$. First, if $P(X \in b+(2 \pi / t) \mathbf{Z})=1$ then

$$
\varphi(t)=E e^{i t X}=e^{i t b} \sum_{n \in \mathbf{Z}} e^{i 2 \pi n} P(X=b+(2 \pi / t) n)=e^{i t b}
$$

Conversely, if $|\varphi(t)|=1$, then there is equality in the inequality $\left|E e^{i t X}\right| \leq E\left|e^{i t X}\right|$, so by Exercise 1.6.1 the distribution of $e^{i t X}$ must be concentrated at some point $e^{i t b}$, and $P(X \in b+(2 \pi / t) \mathbf{Z})=1$.

To prove trichotomy now, we suppose that (i) and (ii) do not hold, i.e., there is a sequence $t_{n} \downarrow 0$ so that $\left|\varphi\left(t_{n}\right)\right|=1$. The first paragraph shows that there is a $b_{n}$ so that $P\left(X \in b_{n}+\left(2 \pi / t_{n}\right) \mathbf{Z}\right)=1$. Without loss of generality, we can pick $b_{n} \in\left(-\pi / t_{n}, \pi / t_{n}\right]$. As $n \rightarrow \infty, P(X \notin \left.\left(-\pi / t_{n}, \pi / t_{n}\right]\right) \rightarrow 0$ so it follows that $P\left(X=b_{n}\right) \rightarrow 1$. This is only possible if $b_{n}=b$ for $n \geq N$, and $P(X=b)=1$.

We call the three cases in Theorem 3.5.2: (i) nonlattice, (ii) lattice, and (iii) degenerate. The reader should notice that this means that lattice random variables are by definition nondegenerate. Before we turn to the main business of this section, we would like to introduce one more special case. If $X$ is a lattice distribution and we can take $b=0$, i.e., $P(X \in h \mathbf{Z})=1$, then $X$ is said to be arithmetic. In this case, if $\lambda=2 \pi / h$ then $\varphi(\lambda)=1$ and $\varphi$ is periodic: $\varphi(t+\lambda)=\varphi(t)$.

Our first local limit theorem is for the lattice case. Let $X_{1}, X_{2}, \ldots$ be i.i.d. with $E X_{i}=0, E X_{i}^{2}=\sigma^{2} \in(0, \infty)$, and having a common lattice distribution with span $h$. If $S_{n}=X_{1}+\cdots+X_{n}$ and $P\left(X_{i} \in b+h \mathbf{Z}\right)=1$ then $P\left(S_{n} \in n b+h \mathbf{Z}\right)=1$. We put

$$
p_{n}(x)=P\left(S_{n} / \sqrt{n}=x\right) \quad \text { for } x \in \mathcal{L}_{n}=\{(n b+h z) / \sqrt{n}: z \in \mathbf{Z}\}
$$

and

$$
n(x)=\left(2 \pi \sigma^{2}\right)^{-1 / 2} \exp \left(-x^{2} / 2 \sigma^{2}\right) \quad \text { for } x \in(-\infty, \infty)
$$

Theorem 3.5.3. Under the hypotheses above, as $n \rightarrow \infty$

$$
\sup _{x \in \mathcal{L}_{n}}\left|\frac{n^{1 / 2}}{h} p_{n}(x)-n(x)\right| \rightarrow 0
$$

Remark. To explain the statement, note that if we followed the approach in Example 3.4.7 then we would conclude that for $x \in \mathcal{L}_{n}$

$$
p_{n}(x) \approx \int_{x-h / 2 \sqrt{n}}^{x+h / 2 \sqrt{n}} n(y) d y \approx \frac{h}{\sqrt{n}} n(x)
$$

Proof. Let $Y$ be a random variable with $P(Y \in a+\theta \mathbf{Z})=1$ and $\psi(t)= E \exp (i t Y)$. It follows from part (iii) of Exercise 3.3.2 that

$$
P(Y=x)=\frac{1}{2 \pi / \theta} \int_{-\pi / \theta}^{\pi / \theta} e^{-i t x} \psi(t) d t
$$

Using this formula with $\theta=h / \sqrt{n}, \psi(t)=E \exp \left(i t S_{n} / \sqrt{n}\right)=\varphi^{n}(t / \sqrt{n})$, and then multiplying each side by $1 / \theta$ gives

$$
\frac{n^{1 / 2}}{h} p_{n}(x)=\frac{1}{2 \pi} \int_{-\pi \sqrt{n} / h}^{\pi \sqrt{n} / h} e^{-i t x} \varphi^{n}(t / \sqrt{n}) d t
$$

Using the inversion formula, Theorem 3.3.14, for $n(x)$, which has ch.f. $\exp \left(-\sigma^{2} t^{2} / 2\right)$, gives

$$
n(x)=\frac{1}{2 \pi} \int e^{-i t x} \exp \left(-\sigma^{2} t^{2} / 2\right) d t
$$

Subtracting the last two equations gives (recall $\pi>1,\left|e^{-i t x}\right| \leq 1$ )

$$
\begin{aligned}
\left|\frac{n^{1 / 2}}{h} p_{n}(x)-n(x)\right| & \leq \int_{-\pi \sqrt{n} / h}^{\pi \sqrt{n} / h}\left|\varphi^{n}(t / \sqrt{n})-\exp \left(-\sigma^{2} t^{2} / 2\right)\right| d t \\
& +\int_{\pi \sqrt{n} / h}^{\infty} \exp \left(-\sigma^{2} t^{2} / 2\right) d t
\end{aligned}
$$

The right-hand side is independent of $x$, so to prove Theorem 3.5.3 it suffices to show that it approaches 0 . The second integral clearly $\rightarrow 0$. To estimate the first integral, we observe that $\varphi^{n}(t / \sqrt{n}) \rightarrow \exp \left(-\sigma^{2} t^{2} / 2\right)$, so the integrand goes to 0 and it is now just a question of "applying the dominated convergence theorem."

To do this, we will divide the integral into three pieces. The bounded convergence theorem implies that for any $A<\infty$ the integral over $(-A, A)$ approaches 0 . To estimate the integral over $(-A, A)^{c}$, we observe that since $E X_{i}=0$ and $E X_{i}^{2}=\sigma^{2}$, formula (3.3.3) and the triangle inequality imply that

$$
|\varphi(u)| \leq\left|1-\sigma^{2} u^{2} / 2\right|+\frac{u^{2}}{2} E\left(\min \left(|u| \cdot|X|^{3}, 6|X|^{2}\right)\right)
$$

The last expected value $\rightarrow 0$ as $u \rightarrow 0$. This means we can pick $\delta>0$ so that if $|u|<\delta$, it is $\leq \sigma^{2} / 2$ and hence

$$
|\varphi(u)| \leq 1-\sigma^{2} u^{2} / 2+\sigma^{2} u^{2} / 4=1-\sigma^{2} u^{2} / 4 \leq \exp \left(-\sigma^{2} u^{2} / 4\right)
$$

since $1-x \leq e^{-x}$. Applying the last result to $u=t / \sqrt{n}$ we see that for $t \leq \delta \sqrt{n}$

$$
\begin{equation*}
\left|\varphi(t / \sqrt{n})^{n}\right| \leq \exp \left(-\sigma^{2} t^{2} / 4\right) \tag{*}
\end{equation*}
$$

So the integral over $(-\delta \sqrt{n}, \delta \sqrt{n})-(-A, A)$ is smaller than

$$
2 \int_{A}^{\delta \sqrt{n}} \exp \left(-\sigma^{2} t^{2} / 4\right) d t
$$

which is small if $A$ is large.
To estimate the rest of the integral we observe that since $X$ has span $h$, Theorem 3.5.2 implies $|\varphi(u)| \neq 1$ for $u \in[\delta, \pi / h] . \varphi$ is continuous so there is an $\eta<1$ so that $|\varphi(u)| \leq \eta<1$ for $|u| \in[\delta, \pi / h]$. Letting $u=t / \sqrt{n}$ again, we see that the integral over $[-\pi \sqrt{n} / h, \pi \sqrt{n} / h]-(-\delta \sqrt{n}, \delta \sqrt{n})$ is smaller than

$$
2 \int_{\delta \sqrt{n}}^{\pi \sqrt{n} / h} \eta^{n}+\exp \left(-\sigma^{2} t^{2} / 2\right) d t
$$

which $\rightarrow 0$ as $n \rightarrow \infty$. This completes the proof.
We turn now to the nonlattice case. Let $X_{1}, X_{2}, \ldots$ be i.i.d. with $E X_{i}=0, E X_{i}^{2}=\sigma^{2} \in(0, \infty)$, and having a common characteristic function $\varphi(t)$ that has $|\varphi(t)|<1$ for all $t \neq 0$. Let $S_{n}=X_{1}+\cdots+X_{n}$ and $n(x)=\left(2 \pi \sigma^{2}\right)^{-1 / 2} \exp \left(-x^{2} / 2 \sigma^{2}\right)$.

Theorem 3.5.4. Under the hypotheses above, if $x_{n} / \sqrt{n} \rightarrow x$ and $a<b$

$$
\sqrt{n} P\left(S_{n} \in\left(x_{n}+a, x_{n}+b\right)\right) \rightarrow(b-a) n(x)
$$

Remark. The proof of this result has to be a little devious because the assumption above does not give us much control over the behavior of $\varphi$. For a bad example, let $q_{1}, q_{2}, \ldots$ be an enumeration of the positive rationals which has $q_{n} \leq n$. Suppose

$$
P\left(X=q_{n}\right)=P\left(X=-q_{n}\right)=1 / 2^{n+1}
$$

In this case $E X=0, E X^{2}<\infty$, and the distribution is nonlattice. However, the characteristic function has $\lim \sup _{t \rightarrow \infty}|\varphi(t)|=1$.

Proof. To tame bad ch.f.'s we use a trick. Let $\delta>0$

$$
h_{0}(y)=\frac{1}{\pi} \cdot \frac{1-\cos \delta y}{\delta y^{2}}
$$

be the density of the Polya's distribution and let $h_{\theta}(x)=e^{i \theta x} h_{0}(x)$. If we introduce the Fourier transform

$$
\hat{g}(u)=\int e^{i u y} g(y) d y
$$

then it follows from Example 3.3.15 that

$$
\hat{h}_{0}(u)= \begin{cases}1-|u / \delta| & \text { if }|u| \leq \delta \\ 0 & \text { otherwise }\end{cases}
$$

and it is easy to see that $\hat{h}_{\theta}(u)=\hat{h}_{0}(u+\theta)$. We will show that for any $\theta$

$$
\begin{equation*}
\sqrt{n} E h_{\theta}\left(S_{n}-x_{n}\right) \rightarrow n(x) \int h_{\theta}(y) d y \tag{a}
\end{equation*}
$$

Before proving (a), we will show it implies Theorem 3.5.4. Let

$$
\mu_{n}(A)=\sqrt{n} P\left(S_{n}-x_{n} \in A\right), \quad \text { and } \quad \mu(A)=n(x)|A|
$$

where $|A|=$ the Lebesgue measure of $A$. Let

$$
\alpha_{n}=\sqrt{n} E h_{0}\left(S_{n}-x_{n}\right) \quad \text { and } \quad \alpha=n(x) \int h_{0}(y) d y=n(x)
$$

Finally, define probability measures by

$$
\nu_{n}(B)=\frac{1}{\alpha_{n}} \int_{B} h_{0}(y) \mu_{n}(d y), \quad \text { and } \quad \nu(B)=\frac{1}{\alpha} \int_{B} h_{0}(y) \mu(d y)
$$

Taking $\theta=0$ in (a) we see $\alpha_{n} \rightarrow \alpha$ and so (a) implies

$$
\begin{equation*}
\int e^{i \theta y} \nu_{n}(d y) \rightarrow \int e^{i \theta y} \nu(d y) \tag{b}
\end{equation*}
$$

Since this holds for all $\theta$, it follows from Theorem 3.3.17 that $\nu_{n} \Rightarrow \nu$. Now if $|a|,|b|<2 \pi / \delta$ then the function

$$
k(y)=\frac{1}{h_{0}(y)} \cdot 1_{(a, b)}(y)
$$

is bounded and continuous a.s. with respect to $\nu$ so it follows from Theorem 3.2.10 that

$$
\int k(y) \nu_{n}(d y) \rightarrow \int k(y) \nu(d y)
$$

Since $\alpha_{n} \rightarrow \alpha$, this implies

$$
\sqrt{n} P\left(S_{n} \in\left(x_{n}+a, x_{n}+b\right)\right) \rightarrow(b-a) n(x)
$$

which is the conclusion of Theorem 3.5.4.
Turning now to the proof of (a), the inversion formula, Theorem 3.3.14, implies

$$
h_{0}(x)=\frac{1}{2 \pi} \int e^{-i u x} \hat{h}_{0}(u) d u
$$

Recalling the definition of $h_{\theta}$, using the last result, and changing variables $u=v+\theta$ we have

$$
\begin{aligned}
h_{\theta}(x)=e^{i \theta x} h_{0}(x) & =\frac{1}{2 \pi} \int e^{-i(u-\theta) x} \hat{h}_{0}(u) d u \\
& =\frac{1}{2 \pi} \int e^{-i v x} \hat{h}_{\theta}(v) d v
\end{aligned}
$$

since $\hat{h}_{\theta}(v)=\hat{h}_{0}(v+\theta)$. Letting $F_{n}$ be the distribution of $S_{n}-x_{n}$ and integrating gives

$$
\begin{aligned}
E h_{\theta}\left(S_{n}-x_{n}\right) & =\frac{1}{2 \pi} \iint e^{-i u x} \hat{h}_{\theta}(u) d u d F_{n}(x) \\
& =\frac{1}{2 \pi} \iint e^{-i u x} d F_{n}(x) \hat{h}_{\theta}(u) d u
\end{aligned}
$$

by Fubini's theorem. (Recall $\hat{h}_{\theta}(u)$ has compact support and $F_{n}$ is a distribution function.) Using (e) of Theorem 3.3.1, we see that the last expression

$$
=\frac{1}{2 \pi} \int \varphi(-u)^{n} e^{i u x_{n}} \hat{h}_{\theta}(u) d u
$$

To take the limit as $n \rightarrow \infty$ of this integral, let $[-M, M]$ be an interval with $\hat{h}_{\theta}(u)=0$ for $u \notin[-M, M]$. By ( $*$ ) above, we can pick $\delta$ so that for $|u|<\delta$
(c)

$$
|\varphi(u)| \leq \exp \left(-\sigma^{2} u^{2} / 4\right)
$$

Let $I=[-\delta, \delta]$ and $J=[-M, M]-I$. Since $|\varphi(u)|<1$ for $u \neq 0$ and $\varphi$ is continuous, there is a constant $\eta<1$ so that $|\varphi(u)| \leq \eta<1$ for $u \in J$. Since $\left|\hat{h}_{\theta}(u)\right| \leq 1$, this implies that

$$
\left|\frac{\sqrt{n}}{2 \pi} \int_{J} \varphi(-u)^{n} e^{i u x_{n}} \hat{h}_{\theta}(u) d u\right| \leq \frac{\sqrt{n}}{2 \pi} \cdot 2 M \eta^{n} \rightarrow 0
$$

as $n \rightarrow \infty$. For the integral over $I$, change variables $u=t / \sqrt{n}$ to get

$$
\frac{1}{2 \pi} \int_{-\delta \sqrt{n}}^{\delta \sqrt{n}} \varphi(-t / \sqrt{n})^{n} e^{i t x_{n} / \sqrt{n}} \hat{h}_{\theta}(t / \sqrt{n}) d t
$$

The central limit theorem implies $\varphi(-t / \sqrt{n})^{n} \rightarrow \exp \left(-\sigma^{2} t^{2} / 2\right)$. Using (c) now and the dominated convergence theorem gives (recall $x_{n} / \sqrt{n} \rightarrow$ x)

$$
\begin{aligned}
\frac{\sqrt{n}}{2 \pi} \int_{I} \varphi(-u)^{n} e^{i u x_{n}} \hat{h}_{\theta}(u) d u & \rightarrow \frac{1}{2 \pi} \int \exp \left(-\sigma^{2} t^{2} / 2\right) e^{i t x} \hat{h}_{\theta}(0) d t \\
& =n(x) \hat{h}_{\theta}(0)=n(x) \int h_{\theta}(y) d y
\end{aligned}
$$

by the inversion formula, Theorem 3.3.14, and the definition of $\hat{h}_{\theta}(0)$. This proves (a) and completes the proof of Theorem 3.5.4.

### 3.6 Poisson Convergence

### 3.6.1 The Basic Limit Theorem

Our first result is sometimes facetiously called the "weak law of small numbers" or the "law of rare events." These names derive from the fact that the Poisson appears as the limit of a sum of indicators of events that have small probabilities.
Theorem 3.6.1. For each $n$ let $X_{n, m}, 1 \leq m \leq n$ be independent random variables with $P\left(X_{n, m}=1\right)=p_{n, m}, P\left(X_{n, m}=0\right)=1-p_{n, m}$. Suppose
(i) $\sum_{m=1}^{n} p_{n, m} \rightarrow \lambda \in(0, \infty)$,
and (ii) $\max _{1 \leq m \leq n} p_{n, m} \rightarrow 0$.
If $S_{n}=X_{n, 1}+\cdots+X_{n, n}$ then $S_{n} \Rightarrow Z$ where $Z$ is Poisson $(\lambda)$.
Here $\operatorname{Poisson}(\lambda)$ is shorthand for Poisson distribution with mean $\lambda$, that is,

$$
P(Z=k)=e^{-\lambda} \lambda^{k} / k!
$$

Note that in the spirit of the Lindeberg-Feller theorem, no single term contributes very much to the sum. In contrast to that theorem, the contributions, when positive, are not small.
First proof. Let $\varphi_{n, m}(t)=E\left(\exp \left(i t X_{n, m}\right)\right)=\left(1-p_{n, m}\right)+p_{n, m} e^{i t}$ and let $S_{n}=X_{n, 1}+\cdots+X_{n, n}$. Then

$$
E \exp \left(i t S_{n}\right)=\prod_{m=1}^{n}\left(1+p_{n, m}\left(e^{i t}-1\right)\right)
$$

Let $0 \leq p \leq 1 .\left|\exp \left(p\left(e^{i t}-1\right)\right)\right|=\exp \left(p \operatorname{Re}\left(e^{i t}-1\right)\right) \leq 1$ and $\mid 1+ p\left(e^{i t}-1\right) \mid \leq 1$ since it is on the line segment connecting 1 to $e^{i t}$. Using Lemma 3.4.3 with $\theta=1$ and then Lemma 3.4.4, which is valid when $\max _{m} p_{n, m} \leq 1 / 2$ since $\left|e^{i t}-1\right| \leq 2$,

$$
\begin{aligned}
& \left|\exp \left(\sum_{m=1}^{n} p_{n, m}\left(e^{i t}-1\right)\right)-\prod_{m=1}^{n}\left\{1+p_{n, m}\left(e^{i t}-1\right)\right\}\right| \\
& \quad \leq \sum_{m=1}^{n}\left|\exp \left(p_{n, m}\left(e^{i t}-1\right)\right)-\left\{1+p_{n, m}\left(e^{i t}-1\right)\right\}\right| \\
& \quad \leq \sum_{m=1}^{n} p_{n, m}^{2}\left|e^{i t}-1\right|^{2}
\end{aligned}
$$

Using $\left|e^{i t}-1\right| \leq 2$ again, it follows that the last expression

$$
\leq 4\left(\max _{1 \leq m \leq n} p_{n, m}\right) \sum_{m=1}^{n} p_{n, m} \rightarrow 0
$$

by assumptions (i) and (ii). The last conclusion and $\sum_{m=1}^{n} p_{n, m} \rightarrow \lambda$ imply

$$
E \exp \left(i t S_{n}\right) \rightarrow \exp \left(\lambda\left(e^{i t}-1\right)\right)
$$

To complete the proof now, we consult Example 3.3.4 for the ch.f. of the Poisson distribution and apply Theorem 3.3.17.

We will now consider some concrete situations in which Theorem 3.6.1 can be applied. In each case we are considering a situation in which $p_{n, m}=c / n$, so we approximate the distribution of the sum by a Poisson with mean $c$.

Example 3.6.2. In a calculus class with 400 students, the number of students who have their birthday on the day of the final exam has approximately a Poisson distribution with mean $400 / 365=1.096$. This means that the probability no one was born on that date is about $e^{-1.096}=0.334$. Similar reasoning shows that the number of babies born on a given day or the number of people who arrive at a bank between 1:15 and 1:30 should have a Poisson distribution.

Example 3.6.3. Suppose we roll two dice 36 times. The probability of "double ones" (one on each die) is $1 / 36$ so the number of times this occurs should have approximately a Poisson distribution with mean 1. Comparing the Poisson approximation with exact probabilities shows that the agreement is good even though the number of trials is small.

| $k$ | 0 | 1 | 2 | 3 |
| :---: | :---: | :---: | :---: | :---: |
| Poisson | 0.3678 | 0.3678 | 0.1839 | 0.0613 |
| exact | 0.3627 | 0.3730 | 0.1865 | 0.0604 |

After we give the second proof of Theorem 3.6.1, we will discuss rates of convergence. Those results will show that for large $n$ the largest discrepancy occurs for $k=1$ and is about $1 / 2 e n$ ( $=0.0051$ in this case).

Our second proof of Theorem 3.6.1 requires a little more work but provides information about the rate of convergence. We begin by defining the total variation distance between two measures on a countable set $S$.

$$
\|\mu-\nu\| \equiv \frac{1}{2} \sum_{z}|\mu(z)-\nu(z)|=\sup _{A \subset S}|\mu(A)-\nu(A)|
$$

The first equality is a definition. To prove the second, note that for any $A$

$$
\sum_{z}|\mu(z)-\nu(z)| \geq|\mu(A)-\nu(A)|+\left|\mu\left(A^{c}\right)-\nu\left(A^{c}\right)\right|=2|\mu(A)-\nu(A)|
$$

and there is equality when $A=\{z: \mu(z) \geq \nu(z)\}$.

Lemma 3.6.4. (i) $d(\mu, \nu)=\|\mu-\nu\|$ defines a metric on probability measures on $\mathbf{Z}$ and (ii) $\left\|\mu_{n}-\mu\right\| \rightarrow 0$ if and only if $\mu_{n}(x) \rightarrow \mu(x)$ for each $x \in \mathbf{Z}$, which by Exercise 3.2.11 is equivalent to $\mu_{n} \Rightarrow \mu$.
Proof. (i) Clearly $d(\mu, \nu)=d(\nu, \mu)$ and $d(\mu, \nu)=0$ if and only if $\mu=\nu$. To check the triangle inequality we note that the triangle inequality for real numbers implies

$$
|\mu(x)-\nu(x)|+|\nu(x)-\pi(x)| \geq|\mu(x)-\pi(x)|
$$

then sum over $x$.
(ii) One direction is trivial. We cannot have $\left\|\mu_{n}-\mu\right\| \rightarrow 0$ unless $\mu_{n}(x) \rightarrow \mu(x)$ for each $x$. To prove the converse note that if $\mu_{n}(x) \rightarrow \mu(x)$

$$
\sum_{x}\left|\mu_{n}(x)-\mu(x)\right|=2 \sum_{x}\left(\mu(x)-\mu_{n}(x)\right)^{+} \rightarrow 0
$$

by the dominated convergence theorem.
Exercise 3.6.1. Show that $\|\mu-\nu\| \leq 2 \delta$ if and only if there are random variables $X$ and $Y$ with distributions $\mu$ and $\nu$ so that $P(X \neq Y) \leq \delta$.

The next three lemmas are the keys to our second proof.
Lemma 3.6.5. If $\mu_{1} \times \mu_{2}$ denotes the product measure on $\mathbf{Z} \times \mathbf{Z}$ that has $\left(\mu_{1} \times \mu_{2}\right)(x, y)=\mu_{1}(x) \mu_{2}(y)$ then

$$
\left\|\mu_{1} \times \mu_{2}-\nu_{1} \times \nu_{2}\right\| \leq\left\|\mu_{1}-\nu_{1}\right\|+\left\|\mu_{2}-\nu_{2}\right\|
$$

Proof. $2\left\|\mu_{1} \times \mu_{2}-\nu_{1} \times \nu_{2}\right\|=\sum_{x, y}\left|\mu_{1}(x) \mu_{2}(y)-\nu_{1}(x) \nu_{2}(y)\right|$

$$
\begin{aligned}
& \leq \sum_{x, y}\left|\mu_{1}(x) \mu_{2}(y)-\nu_{1}(x) \mu_{2}(y)\right|+\sum_{x, y}\left|\nu_{1}(x) \mu_{2}(y)-\nu_{1}(x) \nu_{2}(y)\right| \\
& =\sum_{y} \mu_{2}(y) \sum_{x}\left|\mu_{1}(x)-\nu_{1}(x)\right|+\sum_{x} \nu_{1}(x) \sum_{y}\left|\mu_{2}(y)-\nu_{2}(y)\right| \\
& =2\left\|\mu_{1}-\nu_{1}\right\|+2\left\|\mu_{2}-\nu_{2}\right\|
\end{aligned}
$$

which gives the desired result.
Lemma 3.6.6. If $\mu_{1} * \mu_{2}$ denotes the convolution of $\mu_{1}$ and $\mu_{2}$, that is,

$$
\mu_{1} * \mu_{2}(x)=\sum_{y} \mu_{1}(x-y) \mu_{2}(y)
$$

then $\left\|\mu_{1} * \mu_{2}-\nu_{1} * \nu_{2}\right\| \leq\left\|\mu_{1} \times \mu_{2}-\nu_{1} \times \nu_{2}\right\|$
Proof. $2\left\|\mu_{1} * \mu_{2}-\nu_{1} * \nu_{2}\right\|=\sum_{x}\left|\sum_{y} \mu_{1}(x-y) \mu_{2}(y)-\sum_{y} \nu_{1}(x-y) \nu_{2}(y)\right|$

$$
\begin{aligned}
& \leq \sum_{x} \sum_{y}\left|\mu_{1}(x-y) \mu_{2}(y)-\nu_{1}(x-y) \nu_{2}(y)\right| \\
& =2\left\|\mu_{1} \times \mu_{2}-\nu_{1} \times \nu_{2}\right\|
\end{aligned}
$$

which gives the desired result.

Lemma 3.6.7. Let $\mu$ be the measure with $\mu(1)=p$ and $\mu(0)=1-p$. Let $\nu$ be a Poisson distribution with mean $p$. Then $\|\mu-\nu\| \leq p^{2}$.
Proof. $2\|\mu-\nu\|=|\mu(0)-\nu(0)|+|\mu(1)-\nu(1)|+\sum_{n \geq 2} \nu(n)$

$$
=\left|1-p-e^{-p}\right|+\left|p-p e^{-p}\right|+1-e^{-p}(1+p)
$$

Since $1-x \leq e^{-x} \leq 1$ for $x \geq 0$, the above

$$
\begin{aligned}
& =e^{-p}-1+p+p\left(1-e^{-p}\right)+1-e^{-p}-p e^{-p} \\
& =2 p\left(1-e^{-p}\right) \leq 2 p^{2}
\end{aligned}
$$

which gives the desired result.
Second proof of Theorem 3.6.1. Let $\mu_{n, m}$ be the distribution of $X_{n, m}$. Let $\mu_{n}$ be the distribution of $S_{n}$. Let $\nu_{n, m}, \nu_{n}$, and $\nu$ be Poisson distributions with means $p_{n, m}, \lambda_{n}=\sum_{m \leq n} p_{n, m}$, and $\lambda$ respectively. Since $\mu_{n}=\mu_{n, 1} * \cdots * \mu_{n, n}$ and $\nu_{n}=\nu_{n, 1} * \cdots * \nu_{n, n}$, Lemmas 3.6.6, 3.6.5, and 3.6.7 imply

$$
\begin{equation*}
\left\|\mu_{n}-\nu_{n}\right\| \leq \sum_{m=1}^{n}\left\|\mu_{n, m}-\nu_{n, m}\right\| \leq 2 \sum_{m=1}^{n} p_{n, m}^{2} \tag{3.6.1}
\end{equation*}
$$

Using the definition of total variation distance now gives

$$
\sup _{A}\left|\mu_{n}(A)-\nu_{n}(A)\right| \leq \sum_{m=1}^{n} p_{n, m}^{2}
$$

Assumptions (i) and (ii) imply that the right-hand side $\rightarrow 0$. Since $\nu_{n} \Rightarrow \nu$ as $n \rightarrow \infty$, the result follows.
Remark. The proof above is due to Hodges and Le Cam (1960). By different methods, C. Stein (1987) (see (43) on p. 89) has proved

$$
\sup _{A}\left|\mu_{n}(A)-\nu_{n}(A)\right| \leq(\lambda \vee 1)^{-1} \sum_{m=1}^{n} p_{n, m}^{2}
$$

Rates of convergence. When $p_{n, m}=1 / n$, (3.6.1) becomes

$$
\sup _{A}\left|\mu_{n}(A)-\nu_{n}(A)\right| \leq 1 / n
$$

To assess the quality of this bound, we will compare the Poisson and binomial probabilities for $k$ successes.

$$
\begin{array}{lcl}
k & \text { Poisson } & \text { Binomial } \\
0 & e^{-1} & \left(1-\frac{1}{n}\right)^{n} \\
1 & e^{-1} & n \cdot n^{-1}\left(1-\frac{1}{n}\right)^{n-1}=\left(1-\frac{1}{n}\right)^{n-1} \\
2 & e^{-1} / 2! & \binom{n}{2} n^{-2}\left(1-\frac{1}{n}\right)^{n-2}=\left(1-\frac{1}{n}\right)^{n-1} / 2! \\
3 & e^{-1} / 3! & \binom{n}{3} n^{-3}\left(1-\frac{1}{n}\right)^{n-3}=\left(1-\frac{2}{n}\right)\left(1-\frac{1}{n}\right)^{n-2} / 3!
\end{array}
$$

Since $(1-x) \leq e^{-x}$, we have $\mu_{n}(0)-\nu_{n}(0) \leq 0$. Expanding

$$
\log (1+x)=x-\frac{x^{2}}{2}+\frac{x^{3}}{3}-\ldots
$$

gives

$$
(n-1) \log \left(1-\frac{1}{n}\right)=-\frac{n-1}{n}-\frac{n-1}{2 n^{2}}-\ldots=-1+\frac{1}{2 n}+O\left(n^{-2}\right)
$$

So

$$
n\left(\left(1-\frac{1}{n}\right)^{n-1}-e^{-1}\right)=n e^{-1}\left(\exp \left\{1 / 2 n+O\left(n^{-2}\right)\right\}-1\right) \rightarrow e^{-1} / 2
$$

and it follows that

$$
\begin{aligned}
& n\left(\mu_{n}(1)-\nu_{n}(1)\right) \rightarrow e^{-1} / 2 \\
& n\left(\mu_{n}(2)-\nu_{n}(2)\right) \rightarrow e^{-1} / 4
\end{aligned}
$$

For $k \geq 3$, using $(1-2 / n) \leq(1-1 / n)^{2}$ and $(1-x) \leq e^{-x}$ shows $\mu_{n}(k)-\nu_{n}(k) \leq 0$, so

$$
\sup _{A \subset \mathbf{Z}}\left|\mu_{n}(A)-\nu_{n}(A)\right| \approx 3 / 4 e n
$$

There is a large literature on Poisson approximations for dependent events. Here we consider

### 3.6.2 Two Examples with Dependence

Example 3.6.8. Matching. Let $\pi$ be a random permutation of $\{1,2, \ldots, n\}$, let $X_{n, m}=1$ if $m$ is a fixed point ( 0 otherwise), and let $S_{n}=X_{n, 1}+\cdots+ X_{n, n}$ be the number of fixed points. We want to compute $P\left(S_{n}=0\right)$. (For a more exciting story consider men checking hats or wives swapping husbands.) Let $A_{n, m}=\left\{X_{n, m}=1\right\}$. The inclusion-exclusion formula implies

$$
\begin{aligned}
P\left(\cup_{m=1}^{n} A_{m}\right)= & \sum_{m} P\left(A_{m}\right)-\sum_{\ell<m} P\left(A_{\ell} \cap A_{m}\right) \\
& +\sum_{k<\ell<m} P\left(A_{k} \cap A_{\ell} \cap A_{m}\right)-\ldots \\
= & n \cdot \frac{1}{n}-\binom{n}{2} \frac{(n-2)!}{n!}+\binom{n}{3} \frac{(n-3)!}{n!}-\ldots
\end{aligned}
$$

since the number of permutations with $k$ specified fixed points is $(n-k)$ ! Canceling some factorials gives

$$
P\left(S_{n}>0\right)=\sum_{m=1}^{n} \frac{(-1)^{m-1}}{m!} \quad \text { so } \quad P\left(S_{n}=0\right)=\sum_{m=0}^{n} \frac{(-1)^{m}}{m!}
$$

Recognizing the second sum as the first $n+1$ terms in the expansion of $e^{-1}$ gives

$$
\begin{aligned}
\left|P\left(S_{n}=0\right)-e^{-1}\right| & =\left|\sum_{m=n+1}^{\infty} \frac{(-1)^{m}}{m!}\right| \\
& \leq \frac{1}{(n+1)!}\left|\sum_{k=0}^{\infty}(n+2)^{-k}\right|=\frac{1}{(n+1)!} \cdot\left(1-\frac{1}{n+2}\right)^{-1}
\end{aligned}
$$

a much better rate of convergence than $1 / n$. To compute the other probabilities, we observe that by considering the locations of the fixed points

$$
\begin{aligned}
P\left(S_{n}=k\right) & =\binom{n}{k} \frac{1}{n(n-1) \cdots(n-k+1)} P\left(S_{n-k}=0\right) \\
& =\frac{1}{k!} P\left(S_{n-k}=0\right) \rightarrow e^{-1} / k!
\end{aligned}
$$

Example 3.6.9. Occupancy problem. Suppose that $r$ balls are placed at random into $n$ boxes. It follows from the Poisson approximation to the Binomial that if $n \rightarrow \infty$ and $r / n \rightarrow c$, then the number of balls in a given box will approach a Poisson distribution with mean $c$. The last observation should explain why the fraction of empty boxes approached $e^{-c}$ in Example 2.2.10. Here we will show:

Theorem 3.6.10. If $n e^{-r / n} \rightarrow \lambda \in[0, \infty)$ the number of empty boxes approaches a Poisson distribution with mean $\lambda$.

Proof. To see where the answer comes from, notice that in the Poisson approximation the probability that a given box is empty is $e^{-r / n} \approx \lambda / n$, so if the occupancy of the various boxes were independent, the result would follow from Theorem 3.6.1. To prove the result, we begin by observing

$$
P\left(\text { boxes } i_{1}, i_{2}, \ldots, i_{k} \text { are empty }\right)=\left(1-\frac{k}{n}\right)^{r}
$$

If we let $p_{m}(r, n)=$ the probability exactly $m$ boxes are empty when $r$ balls are put in $n$ boxes, then $P($ no empty box $)=1-P($ at least one empty box ). So by inclusion-exclusion

$$
\begin{equation*}
p_{0}(r, n)=\sum_{k=0}^{n}(-1)^{k}\binom{n}{k}\left(1-\frac{k}{n}\right)^{r} \tag{a}
\end{equation*}
$$

By considering the locations of the empty boxes

$$
\begin{equation*}
p_{m}(r, n)=\binom{n}{m}\left(1-\frac{m}{n}\right)^{r} p_{0}(r, n-m) \tag{b}
\end{equation*}
$$

To evaluate the limit of $p_{m}(r, n)$ we begin by showing that if $n e^{-r / n} \rightarrow \lambda$ then

$$
\begin{equation*}
\binom{n}{m}\left(1-\frac{m}{n}\right)^{r} \rightarrow \lambda^{m} / m! \tag{c}
\end{equation*}
$$

One half of this is easy. Since $(1-x) \leq e^{-x}$ and $n e^{-r / n} \rightarrow \lambda$

$$
\begin{equation*}
\binom{n}{m}\left(1-\frac{m}{n}\right)^{r} \leq \frac{n^{m}}{m!} e^{-m r / n} \rightarrow \lambda^{m} / m! \tag{d}
\end{equation*}
$$

For the other direction, observe $\binom{n}{m} \geq(n-m)^{m} / m!$ so

$$
\binom{n}{m}\left(1-\frac{m}{n}\right)^{r} \geq\left(1-\frac{m}{n}\right)^{m+r} n^{m} / m!
$$

Now $(1-m / n)^{m} \rightarrow 1$ as $n \rightarrow \infty$ and $1 / m!$ is a constant. To deal with the rest, we note that if $0 \leq t \leq 1 / 2$ then

$$
\begin{aligned}
\log (1-t) & =-t-t^{2} / 2-t^{3} / 3 \ldots \\
& \geq-t-\frac{t^{2}}{2}\left(1+2^{-1}+2^{-2}+\cdots\right)=-t-t^{2}
\end{aligned}
$$

so we have

$$
\log \left(n^{m}\left(1-\frac{m}{n}\right)^{r}\right) \geq m \log n-r m / n-r(m / n)^{2}
$$

Our assumption $n e^{-r / n} \rightarrow \lambda$ means

$$
r=n \log n-n \log \lambda+o(n)
$$

so $r(m / n)^{2} \rightarrow 0$. Multiplying the last display by $m / n$ and rearranging gives $m \log n-r m / n \rightarrow m \log \lambda$. Combining the last two results shows

$$
\liminf _{n \rightarrow \infty} n^{m}\left(1-\frac{m}{n}\right)^{r} \geq \lambda^{m}
$$

and (c) follows. From (a), (c), and the dominated convergence theorem (using (d) to get the domination) we get
(e) if $n e^{-r / n} \rightarrow \lambda$ then $p_{0}(r, n) \rightarrow \sum_{k=0}^{\infty}(-1)^{k} \frac{\lambda^{k}}{k!}=e^{-\lambda}$

For fixed $m,(n-m) e^{-r /(n-m)} \rightarrow \lambda$, so it follows from (e) that $p_{0}(r, n- m) \rightarrow e^{-\lambda}$. Combining this with (b) and (c) completes the proof.

Example 3.6.11. Coupon collector's problem. Let $X_{1}, X_{2}, \ldots$ be i.i.d. uniform on $\{1,2, \ldots, n\}$ and $T_{n}=\inf \left\{m:\left\{X_{1}, \ldots X_{m}\right\}=\{1,2, \ldots, n\}\right\}$. Since $T_{n} \leq m$ if and only if $m$ balls fill up all $n$ boxes, it follows from Theorem 3.6.10 that

$$
P\left(T_{n}-n \log n \leq n x\right) \rightarrow \exp \left(-e^{-x}\right)
$$

Proof. If $r=n \log n+n x$ then $n e^{-r / n} \rightarrow e^{-x}$.
Note that $T_{n}$ is the sum of $n$ independent random variables (see Example 2.2.7), but $T_{n}$ does not converge to the normal distribution. The problem is that the last few terms in the sum are of order $n$ so the hypotheses of the Lindeberg-Feller theorem are not satisfied.

For a concrete instance of the previous result consider: What is the probability that in a village of $2190(=6 \cdot 365)$ people all birthdays are represented? Do you think the answer is much different for $1825(=5 \cdot 365)$ people?
Solution. Here $n=365$, so $365 \log 365=2153$ and

$$
\begin{aligned}
P\left(T_{365} \leq 2190\right) & =P\left(\left(T_{365}-2153\right) / 365 \leq 37 / 365\right) \\
& \approx \exp \left(-e^{-0.1014}\right)=\exp (-0.9036)=0.4051 \\
P\left(T_{365} \leq 1825\right) & =P\left(\left(T_{365}-2153\right) / 365 \leq-328 / 365\right) \\
& \approx \exp \left(-e^{0.8986}\right)=\exp (-2.4562)=0.085
\end{aligned}
$$

### 3.7 Poisson Processes

Theorem 3.6.1 generalizes trivially to give the following result.
Theorem 3.7.1. Let $X_{n, m}, 1 \leq m \leq n$ be independent nonnegative integer valued random variables with $P\left(X_{n, m}=1\right)=p_{n, m}, P\left(X_{n, m} \geq\right.$ 2) $=\epsilon_{n, m}$.
(i) $\sum_{m=1}^{n} p_{n, m} \rightarrow \lambda \in(0, \infty)$,
(ii) $\max _{1 \leq m \leq n} p_{n, m} \rightarrow 0$, and (iii) $\sum_{m=1}^{n} \epsilon_{n, m} \rightarrow 0$.
If $S_{n}=X_{n, 1}+\cdots+X_{n, n}$ then $S_{n} \Rightarrow Z$ where $Z$ is Poisson $(\lambda)$.
Proof. Let $X_{n, m}^{\prime}=1$ if $X_{n, m}=1$, and 0 otherwise. Let $S_{n}^{\prime}=X_{n, 1}^{\prime}+\cdots+ X_{n, n}^{\prime}$. (i)-(ii) and Theorem 3.6.1 imply $S_{n}^{\prime} \Rightarrow Z$, (iii) tells us $P\left(S_{n} \neq\right. \left.S_{n}^{\prime}\right) \rightarrow 0$ and the result follows from the converging together lemma, Exercise 3.2.13.

The next result, which uses Theorem 3.7.1, explains why the Poisson distribution comes up so frequently in applications. Let $N(s, t)$ be the number of arrivals at a bank or an ice cream parlor in the time interval ( $s, t$ ]. Suppose
(i) the numbers of arrivals in disjoint intervals are independent,
(ii) the distribution of $N(s, t)$ only depends on $t-s$,
(iii) $P(N(0, h)=1)=\lambda h+o(h)$,
and (iv) $P(N(0, h) \geq 2)=o(h)$.
Here, the two $o(h)$ stand for functions $g_{1}(h)$ and $g_{2}(h)$ with $g_{i}(h) / h \rightarrow 0$ as $h \rightarrow 0$.

Theorem 3.7.2. If (i)-(iv) hold then $N(0, t)$ has a Poisson distribution with mean $\lambda t$.

Proof. Let $X_{n, m}=N((m-1) t / n, m t / n)$ for $1 \leq m \leq n$ and apply Theorem 3.7.1.

A family of random variables $N_{t}, t \geq 0$ satisfying:
(i) if $0=t_{0}<t_{1}<\ldots<t_{n}, N\left(t_{k}\right)-N\left(t_{k-1}\right), 1 \leq k \leq n$ are independent,
(ii) $N(t)-N(s)$ is $\operatorname{Poisson}(\lambda(t-s))$,
is called a Poisson process with rate $\lambda$. To understand how $N_{t}$ behaves, it is useful to have another method to construct it. Let $\xi_{1}, \xi_{2}, \ldots$ be independent random variables with $P\left(\xi_{i}>t\right)=e^{-\lambda t}$ for $t \geq 0$. Let $T_{n}=\xi_{1}+\cdots+\xi_{n}$ and $N_{t}=\sup \left\{n: T_{n} \leq t\right\}$ where $T_{0}=0$. In the language of renewal theory (see Theorem 2.4.7), $T_{n}$ is the time of the nth arrival and $N_{t}$ is the number of arrivals by time $t$. To check that $N_{t}$ is a Poisson process, we begin by recalling (see Theorem 2.1.18):

$$
f_{T_{n}}(s)=\frac{\lambda^{n} s^{n-1}}{(n-1)!} e^{-\lambda s} \text { for } s \geq 0
$$

i.e., the distribution of $T_{n}$ has a density given by the right-hand side. Now

$$
P\left(N_{t}=0\right)=P\left(T_{1}>t\right)=e^{-\lambda t}
$$

and for $n \geq 1$

$$
\begin{aligned}
P\left(N_{t}=n\right) & =P\left(T_{n} \leq t<T_{n+1}\right)=\int_{0}^{t} P\left(T_{n}=s\right) P\left(\xi_{n+1}>t-s\right) d s \\
& =\int_{0}^{t} \frac{\lambda^{n} s^{n-1}}{(n-1)!} e^{-\lambda s} e^{-\lambda(t-s)} d s=e^{-\lambda t} \frac{(\lambda t)^{n}}{n!}
\end{aligned}
$$

The last two formulas show that $N_{t}$ has a Poisson distribution with mean $\lambda t$. To check that the number of arrivals in disjoint intervals is independent, we observe

$$
P\left(T_{n+1} \geq u \mid N_{t}=n\right)=P\left(T_{n+1} \geq u, T_{n} \leq t\right) / P\left(N_{t}=n\right)
$$

To compute the numerator, we observe

$$
\begin{aligned}
P\left(T_{n+1} \geq u, T_{n} \leq t\right) & =\int_{0}^{t} f_{T_{n}}(s) P\left(\xi_{n+1} \geq u-s\right) d s \\
& =\int_{0}^{t} \frac{\lambda^{n} s^{n-1}}{(n-1)!} e^{-\lambda s} e^{-\lambda(u-s)} d s=e^{-\lambda u} \frac{(\lambda t)^{n}}{n!}
\end{aligned}
$$

The denominator is $P\left(N_{t}=n\right)=e^{-\lambda t}(\lambda t)^{n} / n!$, so

$$
P\left(T_{n+1} \geq u \mid N_{t}=n\right)=e^{-\lambda u} / e^{-\lambda t}=e^{-\lambda(u-t)}
$$

or rewriting things $P\left(T_{n+1}-t \geq s \mid N_{t}=n\right)=e^{-\lambda s}$. Let $T_{1}^{\prime}=T_{N(t)+1}-t$, and $T_{k}^{\prime}=T_{N(t)+k}-T_{N(t)+k-1}$ for $k \geq 2$. The last computation shows that $T_{1}^{\prime}$ is independent of $N_{t}$. If we observe that

$$
\begin{gathered}
P\left(T_{n} \leq t, T_{n+1} \geq u, T_{n+k}-T_{n+k-1} \geq v_{k}, k=2, \ldots, K\right) \\
=P\left(T_{n} \leq t, T_{n+1} \geq u\right) \prod_{k=2}^{K} P\left(\xi_{n+k} \geq v_{k}\right)
\end{gathered}
$$

then it follows that
(a) $T_{1}^{\prime}, T_{2}^{\prime}, \ldots$ are i.i.d. and independent of $N_{t}$.

The last observation shows that the arrivals after time $t$ are independent of $N_{t}$ and have the same distribution as the original sequence. From this it follows easily that:
(b) If $0=t_{0}<t_{1} \ldots<t_{n}$ then $N\left(t_{i}\right)-N\left(t_{i-1}\right), i=1, \ldots, n$ are independent.
To see this, observe that the vector $\left(N\left(t_{2}\right)-N\left(t_{1}\right), \ldots, N\left(t_{n}\right)-N\left(t_{n-1}\right)\right)$ is $\sigma\left(T_{k}^{\prime}, k \geq 1\right)$ measurable and hence is independent of $N\left(t_{1}\right)$. Then use induction to conclude
$P\left(N\left(t_{i}\right)-N\left(t_{i-1}\right)=k_{i}, i=1, \ldots, n\right)=\prod_{i=1}^{n} \exp \left(-\lambda\left(t_{i}-t_{i-1}\right)\right) \frac{\left.\lambda\left(t_{i}-t_{i-1}\right)\right)^{k_{i}}}{k_{i}!}$
Remark. The key to the proof of (a) is the lack of memory property of the exponential distribution:

$$
\begin{equation*}
P(T>t+s \mid T>t)=P(T>s) \tag{3.7.1}
\end{equation*}
$$

which implies that the location of the first arrival after $t$ is independent of what occurred before time $t$ and has an exponential distribution.
Exercise 3.7.1. Show that if $P(T>0)=1$ and (3.7.1) holds then there is a $\lambda>0$ so that $P(T>t)=e^{-\lambda t}$ for $t \geq 0$. Hint: First show that this holds for $t=m 2^{-n}$.
Exercise 3.7.2. If $S=\operatorname{exponential}(\lambda)$ and $T=\operatorname{exponentail}(\mu)$ are independent then $V=\min \{S, T\}$ is exponential $(\lambda+\mu)$ and $P(U=S)= \lambda /(\lambda+\mu)$.
Exercise 3.7.3. Suppose $T_{i}=\operatorname{exponential}\left(\lambda_{i}\right)$. Let $V=\min \left(T_{1}, \ldots, T_{n}\right)$ and I be the the (random) index of the $T_{i}$ that is smallest.

$$
\begin{aligned}
P(V>t) & =\exp \left(-\left(\lambda_{1}+\cdots+\lambda_{n}\right) t\right) \\
P(I=i) & =\frac{\lambda_{i}}{\lambda_{1}+\cdots+\lambda_{n}}
\end{aligned}
$$

$I$ and $V=\min \left\{T_{1}, \ldots T_{n}\right\}$ are independent.

### 3.7.1 Compound Poisson Processes

Suppose that between 12:00 and 1:00 cars arrive at a fast food restuarant according to a Poisson process $N(t)$ with rate $\lambda$. Let $Y_{i}$ be the number of people in the $i$ th vehicle which we assume to be i.i.d. and independent o $N(t)$. Having introduced the $Y_{i}$ 's, it is natural to consider the sum of the $Y_{i}$ 's we have seen up to time $t$ :

$$
S(t)=Y_{1}+\cdots+Y_{N(t)}
$$

where we set $S(t)=0$ if $N(t)=0$. In the motivating example, $S(t)$ gives the number of customers that have arrived up to time $t$.

Theorem 3.7.3. Let $Y_{1}, Y_{2}, \ldots$ be independent and identically distributed, let $N$ be an independent nonnegative integer valued random variable, and let $S=Y_{1}+\cdots+Y_{N}$ with $S=0$ when $N=0$.
(i) If $E\left|Y_{i}\right|, E N<\infty$, then $E S=E N \cdot E Y_{i}$.
(ii) If $E Y_{i}^{2}, E N^{2}<\infty$, then $\operatorname{var}(S)=E N \operatorname{var}\left(Y_{i}\right)+\operatorname{var}(N)\left(E Y_{i}\right)^{2}$.
(iii) If $N$ is Poisson( $\lambda$ ), then $\operatorname{var}(S)=\lambda E Y_{i}^{2}$.

Why is this reasonable? The first of these is natural since if $N=n$ is nonrandom $E S=n E Y_{i}$. (i) then results by setting $n=E N$. This fact is known as Wald's equation. The formula in (ii) is more complicated but it clearly has two of the necessary properties:

If $N=n$ is nonrandom, $\operatorname{var}(S)=n \operatorname{var}\left(Y_{i}\right)$.
If $Y_{i}=c$ is nonrandom $\operatorname{var}(S)=c^{2} \operatorname{var}(N)$.
Combining these two observations, we see that $E N$ var $\left(Y_{i}\right)$ is the contribution to the variance from the variability of the $Y_{i}$, while $\operatorname{var}(N)\left(E Y_{i}\right)^{2}$ is the contribution from the variability of $N$.

Proof. When $N=n, S=X_{1}+\cdots+X_{n}$ has $E S=n E Y_{i}$. Breaking things down according to the value of $N$,

$$
\begin{aligned}
E S & =\sum_{n=0}^{\infty} E(S \mid N=n) \cdot P(N=n) \\
& =\sum_{n=0}^{\infty} n E Y_{i} \cdot P(N=n)=E N \cdot E Y_{i}
\end{aligned}
$$

For the second formula we note that when $N=n, S=X_{1}+\cdots+X_{n}$ has $\operatorname{var}(S)=n \operatorname{var}\left(Y_{i}\right)$ and hence,

$$
E\left(S^{2} \mid N=n\right)=n \operatorname{var}\left(Y_{i}\right)+\left(n E Y_{i}\right)^{2}
$$

Computing as before we get

$$
\begin{aligned}
E S^{2} & =\sum_{n=0}^{\infty} E\left(S^{2} \mid N=n\right) \cdot P(N=n) \\
& =\sum_{n=0}^{\infty}\left\{n \cdot \operatorname{var}\left(Y_{i}\right)+n^{2}\left(E Y_{i}\right)^{2}\right\} \cdot P(N=n) \\
& =(E N) \cdot \operatorname{var}\left(Y_{i}\right)+E N^{2} \cdot\left(E Y_{i}\right)^{2}
\end{aligned}
$$

To compute the variance now, we observe that

$$
\begin{aligned}
\operatorname{var}(S) & =E S^{2}-(E S)^{2} \\
& =(E N) \cdot \operatorname{var}\left(Y_{i}\right)+E N^{2} \cdot\left(E Y_{i}\right)^{2}-\left(E N \cdot E Y_{i}\right)^{2} \\
& =(E N) \cdot \operatorname{var}\left(Y_{i}\right)+\operatorname{var}(N) \cdot\left(E Y_{i}\right)^{2}
\end{aligned}
$$

where in the last step we have used $\operatorname{var}(N)=E N^{2}-(E N)^{2}$ to combine the second and third terms.

For part (iii), we note that in the special case of the Poisson, we have $E N=\lambda$ and $\operatorname{var}(N)=\lambda$, so the result follows from $\operatorname{var}\left(Y_{i}\right)+\left(E Y_{i}\right)^{2}= E Y_{i}^{2}$.

### 3.7.2 Thinning

In the previous subsection, we added up the $Y_{i}$ 's associated with the arrivals in our Poisson process to see how many customers, etc., we had accumulated by time $t$. In this one we will use the $Y_{i}$ to split the Poisson process into several, i.e., we let $N_{j}(t)$ be the number of $i \leq N(t)$ with $Y_{i}=j$. The somewhat surprising fact is:

Theorem 3.7.4. $N_{j}(t)$ are independent rate $\lambda P\left(Y_{i}=j\right)$ Poisson processes.

Why is this surprising? There are two reasons: (i) the resulting processes are Poisson and (ii) they are independent. To drive the point home consider a Poisson process with rate 10 per hour, and then flip coins to determine whether the arriving customers are male or female. One might think that seeing 40 men arrive in one hour would be indicative of a large volume of business and hence a larger than normal number of women, but Theorem 3.7.4 tells us that the number of men and the number of women that arrive per hour are independent.

Proof. To begin we suppose that $P\left(Y_{i}=1\right)=p$ and $P\left(Y_{i}=2\right)=1-p$, so there are only two Poisson processes to consider: $N_{1}(t)$ and $N_{2}(t)$. It should be clear that the independent increments property of the Poisson process implies that the pairs of increments

$$
\left(N_{1}\left(t_{i}\right)-N_{1}\left(t_{i-1}\right), N_{2}\left(t_{i}\right)-N_{2}\left(t_{i-1}\right)\right), \quad 1 \leq i \leq n
$$

are independent of each other. Since $N_{1}(0)=N_{2}(0)=0$ by definition, it only remains to check that the components $X_{i}=N_{i}(t+s)-N_{i}(s)$ are independent and have the right Poisson distributions. To do this, we note that if $X_{1}=j$ and $X_{2}=k$, then there must have been $j+k$ arrivals between $s$ and $s+t, j$ of which were assigned 1's and $k$ of which were assigned 2's, so

$$
\begin{align*}
P\left(X_{1}=j, X_{2}=k\right) & =e^{-\lambda t} \frac{(\lambda t)^{j+k}}{(j+k)!} \cdot \frac{(j+k)!}{j!k!} p^{j}(1-p)^{k} \\
& =e^{-\lambda p t} \frac{(\lambda p t)^{j}}{j!} e^{-\lambda(1-p) t} \frac{(\lambda(1-p) t)^{k}}{k!} \tag{3.7.2}
\end{align*}
$$

so $X_{1}=\operatorname{Poisson}(\lambda p t)$ and $X_{2}=\operatorname{Poisson}(\lambda(1-p) t)$. For the general case, we use the multinomial to conclude that if $p_{j}=P\left(Y_{i}=j\right)$ for $1 \leq j \leq m$ then

$$
\begin{aligned}
P\left(X_{1}\right. & \left.=k_{1}, \ldots X_{m}=k_{m}\right) \\
& =e^{-\lambda t} \frac{(\lambda t)^{k_{1}+\cdots k_{m}}}{\left(k_{1}+\cdots k_{m}\right)!} \frac{\left(k_{1}+\cdots k_{m}\right)!}{k_{1}!\cdots k_{m}!} p_{1}^{k_{1}} \cdots p_{m}^{k_{m}} \\
& =\prod_{j=1}^{m} e^{-\lambda p_{j} t} \frac{\left(\lambda p_{j}\right)^{k_{j}}}{k_{j}!}
\end{aligned}
$$

which proves the desired result.
The thinning results generalizes easily to the nonhomogeneous case:
Theorem 3.7.5. Suppose that in a Poisson process with rate $\lambda$, we keep a point that lands at $s$ with probability $p(s)$. Then the result is a nonhomogeneous Poisson process with rate $\lambda p(s)$.

For an application of this consider
Exercise 3.7.4. $\mathrm{M} / \mathrm{G} / \infty$ queue. As one walks around the Duke campus it seems that every student is talking on their smartphone. The argument for arrivals at the ATM implies that the beginnings of calls follow a Poisson process. As for the calls themselves, while many people on the telephone show a lack of memory, there is no reason to suppose that the duration of a call has an exponential distribution, so we use a general distribution function $G$ with $G(0)=0$ and mean $\mu$. Show that in the long run the number of calls in the system will be Poisson with mean

$$
\begin{equation*}
\lambda \int_{r=0}^{\infty}(1-G(r)) d r=\lambda \mu \tag{3.7.3}
\end{equation*}
$$

Example 3.7.6. Poissonization and the occupancy problem. If we put a Poisson number of balls with mean $r$ in $n$ boxes and let $N_{i}$ be
the number of balls in box $i$, then the last exercise implies $N_{1}, \ldots, N_{n}$ are independent and have a Poisson distribution with mean $r / n$. Use this observation to prove Theorem 3.6.10.

To obtain a result for a fixed number of balls $n$, let $r=n \log n-(\log \lambda) n+ o(n)$ and $s_{i}=n \log n-\left(\log \mu_{i}\right) n$ with $\mu_{2}<\lambda<\mu_{1}$. The normal approximation to the Poisson tells us $P\left(\operatorname{Poisson}\left(s_{1}\right)<r<\operatorname{Poisson}\left(s_{2}\right)\right) \rightarrow 1$ as $n \rightarrow \infty$. If the number of balls has a Poisson distribution with mean $s=n \log n-n(\log \mu)$ then the number of balls in box $i, N_{i}$, are independent with mean $s / n=\log (n / \mu)$ and hence they are vacant with probability $\exp (-s / n)=\mu / n$. Letting $X_{n, i}=1$ if the $i$ th box is vacant, 0 otherwise and using Theorem 3.6.1 it follows that the number of vacant sites converges to a Poisson with mean $\mu$.

To prove the result for a fixed number of balls, we note that the central limit theorem implies

$$
P\left(\operatorname{Poisson}\left(s_{1}\right)<r<\operatorname{Poisson}\left(s_{2}\right)\right) \rightarrow 1
$$

Since the number of vacant boxes is decreased when the number of balls increases the desired result follows.

Exercise 3.7.5. Suppose that a Poisson number of Duke students with mean 2190 will show up to watch the next women's basketball game. What is the probability that for all of the 365 days there is at least one person in the crowd who has that birthday. (Pretend all birthday have equal probability and February 29th does not exist.)

At times, e.g., in Section 3.8 the following generalization is useful
Example 3.7.7. A Poisson process on a measure space ( $S, \mathcal{S}, \mu$ ) is a random map $m: \mathcal{S} \rightarrow\{0,1, \ldots\}$ that for each $\omega$ is a measure on $\mathcal{S}$ and has the following property: if $A_{1}, \ldots, A_{n}$ are disjoint sets with $\mu\left(A_{i}\right)<\infty$ then $m\left(A_{1}\right), \ldots, m\left(A_{n}\right)$ are independent and have Poisson distributions with means $\mu\left(A_{i}\right) . \mu$ is called the mean measure of the process.

If $\mu(S)<\infty$ then it follows from Theorem 3.7.4 that we can construct $m$ by the following recipe: let $X_{1}, X_{2}, \ldots$ be i.i.d. elements of $S$ with distribution $\nu(\cdot)=\mu(\cdot) / \mu(S)$, let $N$ be an independent Poisson random variable with mean $\mu(S)$, and let $m(A)=\left|\left\{j \leq N: X_{j} \in A\right\}\right|$. To extend the construction to infinite measure spaces, e.g., $S=\mathbf{R}^{d}, \mathcal{S}=$ Borel sets, $\mu=$ Lebesgue measure, divide the space up into disjoint sets of finite measure and put independent Poisson processes on each set.

Our next example is a Poisson process on a square:
Example 3.7.8. Flying bomb hits in the South of London during World War II fit a Poisson distribution. As Feller, Vol. I (1968), p.160161 reports, the area was divided into 576 areas of $1 / 4$ square kilometers each. The total number of hits was 537 for an average of 0.9323 per cell.

The table below compares $N_{k}$ the number of cells with $k$ hits with the predictions of the Poisson approximation.

| $k$ | 0 | 1 | 2 | 3 | 4 | $\geq 5$ |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| $N_{k}$ | 229 | 211 | 93 | 35 | 7 | 1 |
| Poisson | 226.74 | 211.39 | 98.54 | 30.62 | 7.14 | 1.57 |

### 3.7.3 Conditioning

Theorem 3.7.9. Let $T_{n}$ be the time of the $n$th arrival in a rate $\lambda$ Poisson process. Let $U_{1}, U_{2}, \ldots, U_{n}$ be independent uniform on ( $0, t$ ) and let $V_{k}^{n}$ be the $k$ th smallest number in $\left\{U_{1}, \ldots, U_{n}\right\}$. If we condition on $N(t)= n$ The vectors $V=\left(V_{1}^{n}, \ldots, V_{n}^{n}\right)$ and $T=\left(T_{1}, \ldots, T_{n}\right)$ have the same distribution.

Proof. On $\{N 9 t)=n$ the joint density

$$
f_{T}\left(t_{1}, \ldots, t_{n}\right)=\left(\prod_{m=1}^{n} \lambda e^{-\lambda\left(t_{m}-t_{m-1}\right)}\right) \lambda e^{-\lambda\left(t-t_{n}\right)}=\lambda e^{-\lambda t}
$$

If we divide by $P(N(t)=n)=e^{-\lambda t}\left(\lambda t^{n} / n!\right.$ the result is $n!/ t^{n}$ which is the joint distribution of $v$. $\square$

Corollary 3.7.10. If $0<s<t$ then

$$
P(N(s)=m \mid N(t)=n)=\binom{n}{m}\left(\frac{s}{t}\right)^{m}\left(1-\frac{s}{t}\right)^{n-m}
$$

Proof. Once we observe that the set of values $\left\{U_{1}, \ldots U_{n}\right\}$ and $\left\{V_{1}, \ldots V_{n}\right\}$ have the same distribution, This is an immediate conseqeunce of Theorem 3.7.9. $\square$

The folowing variant of Theorem 3.7.9.
Theorem 3.7.11. Let $T_{n}$ be the time of the $n$th arrival in a rate $\lambda$ Poisson process. Let $U_{1}, U_{2}, \ldots, U_{n}$ be independent uniform on ( 0,1 ) and let $V_{k}^{n}$ be the $k$ th smallest number in $\left\{U_{1}, \ldots, U_{n}\right\}$. The vectors $\left(V_{1}^{n}, \ldots, V_{n}^{n}\right)$ and ( $T_{1} / T_{n+1}, \ldots, T_{n} / T_{n+1}$ ) have the same distribution.
Proof. We change variables $v=r(t)$ where $v_{i}=t_{i} / t_{n+1}$ for $i \leq n, v_{n+1}= t_{n+1}$. The inverse function is

$$
s(v)=\left(v_{1} v_{n+1}, \ldots, v_{n} v_{n+1}, v_{n+1}\right)
$$

which has matrix of partial derivatives $\partial s_{i} / \partial v_{j}$ given by

$$
\left(\begin{array}{ccccc}
v_{n+1} & 0 & \ldots & 0 & v_{1} \\
0 & v_{n+1} & \ldots & 0 & v_{2} \\
\vdots & \vdots & \ddots & \vdots & \vdots \\
0 & 0 & \ldots & v_{n+1} & v_{n} \\
0 & 0 & \ldots & 0 & 1
\end{array}\right)
$$

The determinant of this matrix is $v_{n+1}^{n}$ so if we let $W=\left(V_{1}, \ldots, V_{n+1}\right)= r\left(T_{1}, \ldots, T_{n+1}\right)$ the change of variables formula implies $W$ has joint density

$$
f_{W}\left(v_{1}, \ldots, v_{n}, v_{n+1}\right)=\left(\prod_{m=1}^{n} \lambda e^{-\lambda v_{n+1}\left(v_{m}-v_{m-1}\right)}\right) \lambda e^{-\lambda v_{n+1}\left(1-v_{n}\right)} v_{n+1}^{n}
$$

To find the joint density of $V=\left(V_{1}, \ldots, V_{n}\right)$ we simplify the preceding formula and integrate out the last coordinate to get

$$
f_{V}\left(v_{1}, \ldots, v_{n}\right)=\int_{0}^{\infty} \lambda^{n+1} v_{n+1}^{n} e^{-\lambda v_{n+1}} d v_{n+1}=n!
$$

for $0<v_{1}<v_{2} \ldots<v_{n}<1$, which is the desired joint density.
Spacings. The last result can be used to study the spacings between the order statistics of i.i.d. uniforms. We use notation of Theorem 3.7.11 in the next four exercises, taking $\lambda=1$ and letting $V_{0}^{n}=0$, and $V_{n+1}^{n}=1$.
Exercise 3.7.6. Smirnov (1949) $n V_{k}^{n} \Rightarrow T_{k}$.
Exercise 3.7.7. Weiss $(1955) n^{-1} \sum_{m=1}^{n} 1_{\left(n\left(V_{i}^{n}-V_{i-1}^{n}\right)>x\right)} \rightarrow e^{-x}$ in probability.
Exercise 3.7.8. $(n / \log n) \max _{1 \leq m \leq n+1} V_{m}^{n}-V_{m-1}^{n} \rightarrow 1$ in probability.
Exercise 3.7.9. $P\left(n^{2} \min _{1 \leq m \leq n} V_{m}^{n}-V_{m-1}^{n}>x\right) \rightarrow e^{-x}$.

### 3.8 Stable Laws*

Let $X_{1}, X_{2}, \ldots$ be i.i.d. and $S_{n}=X_{1}+\cdots+X_{n}$. Theorem 3.4.1 showed that if $E X_{i}=\mu$ and $\operatorname{var}\left(X_{i}\right)=\sigma^{2} \in(0, \infty)$ then

$$
\left(S_{n}-n \mu\right) / \sigma n^{1 / 2} \Rightarrow \chi
$$

In this section, we will investigate the case $E X_{1}^{2}=\infty$ and give necessary and sufficient conditions for the existence of constants $a_{n}$ and $b_{n}$ so that

$$
\left(S_{n}-b_{n}\right) / a_{n} \Rightarrow Y \quad \text { where } Y \text { is nondegenerate }
$$

We begin with an example. Suppose the distribution of $X_{i}$ has

$$
\begin{equation*}
P\left(X_{1}>x\right)=P\left(X_{1}<-x\right)=x^{-\alpha} / 2 \quad \text { for } x \geq 1 \tag{3.8.1}
\end{equation*}
$$

where $0<\alpha<2$. If $\varphi(t)=E \exp \left(i t X_{1}\right)$ then

$$
\begin{aligned}
1-\varphi(t) & =\int_{1}^{\infty}\left(1-e^{i t x}\right) \frac{\alpha}{2|x|^{\alpha+1}} d x+\int_{-\infty}^{-1}\left(1-e^{i t x}\right) \frac{\alpha}{2|x|^{\alpha+1}} d x \\
& =\alpha \int_{1}^{\infty} \frac{1-\cos (t x)}{x^{\alpha+1}} d x
\end{aligned}
$$

Changing variables $t x=u, d x=d u / t$ the last integral becomes

$$
=\alpha \int_{t}^{\infty} \frac{1-\cos u}{(u / t)^{\alpha+1}} \frac{d u}{t}=t^{\alpha} \alpha \int_{t}^{\infty} \frac{1-\cos u}{u^{\alpha+1}} d u
$$

As $u \rightarrow 0,1-\cos u \sim u^{2} / 2$. So $(1-\cos u) / u^{\alpha+1} \sim u^{-\alpha+1} / 2$ which is integrable, since $\alpha<2$ implies $-\alpha+1>-1$. If we let

$$
C=\alpha \int_{0}^{\infty} \frac{1-\cos u}{u^{\alpha+1}} d u<\infty
$$

and observe (3.8.1) implies $\varphi(t)=\varphi(-t)$, then the results above show

$$
\begin{equation*}
1-\varphi(t) \sim C|t|^{\alpha} \text { as } t \rightarrow 0 \tag{3.8.2}
\end{equation*}
$$

Let $X_{1}, X_{2}, \ldots$ be i.i.d. with the distribution given in (3.8.1) and let $S_{n}=X_{1}+\cdots+X_{n}$.

$$
E \exp \left(i t S_{n} / n^{1 / \alpha}\right)=\varphi\left(t / n^{1 / \alpha}\right)^{n}=\left(1-\left\{1-\varphi\left(t / n^{1 / \alpha}\right)\right\}\right)^{n}
$$

As $n \rightarrow \infty, n\left(1-\varphi\left(t / n^{1 / \alpha}\right)\right) \rightarrow C|t|^{\alpha}$, so it follows from Theorem 3.4.2 that

$$
E \exp \left(i t S_{n} / n^{1 / \alpha}\right) \rightarrow \exp \left(-C|t|^{\alpha}\right)
$$

From part (ii) of Theorem 3.3.17, it follows that the expression on the right is the characteristic function of some $Y$ and

$$
\begin{equation*}
S_{n} / n^{1 / \alpha} \Rightarrow Y \tag{3.8.3}
\end{equation*}
$$

To prepare for our general result, we will now give another proof of (3.8.3). If $0<a<b$ and $a n^{1 / \alpha}>1$ then

$$
P\left(a n^{1 / \alpha}<X_{1}<b n^{1 / \alpha}\right)=\frac{1}{2}\left(a^{-\alpha}-b^{-\alpha}\right) n^{-1}
$$

so it follows from Theorem 3.6.1 that

$$
N_{n}(a, b) \equiv\left|\left\{m \leq n: X_{m} / n^{1 / \alpha} \in(a, b)\right\}\right| \Rightarrow N(a, b)
$$

where $N(a, b)$ has a Poisson distribution with mean $\left(a^{-\alpha}-b^{-\alpha}\right) / 2$. An easy extension of the last result shows that if $A \subset \mathbf{R}-(-\delta, \delta)$ and $\delta n^{1 / \alpha}>1$ then

$$
P\left(X_{1} / n^{1 / \alpha} \in A\right)=n^{-1} \int_{A} \frac{\alpha}{2|x|^{\alpha+1}} d x
$$

so $N_{n}(A) \equiv\left|\left\{m \leq n: X_{m} / n^{1 / \alpha} \in A\right\}\right| \Rightarrow N(A)$, where $N(A)$ has a Poisson distribution with mean

$$
\mu(A)=\int_{A} \frac{\alpha}{2|x|^{\alpha+1}} d x<\infty
$$

The limiting family of random variables $N(A)$ is called a Poisson process on $(-\infty, \infty)$ with mean measure $\mu$. (See Example 3.7.7 for more on this process.) Notice that for any $\epsilon>0, \mu(\epsilon, \infty)=\epsilon^{-\alpha} / 2<\infty$, so $N(\epsilon, \infty)<\infty$.

The last paragraph describes the limiting behavior of the random set

$$
\mathcal{X}_{n}=\left\{X_{m} / n^{1 / \alpha}: 1 \leq m \leq n\right\}
$$

To describe the limit of $S_{n} / n^{1 / \alpha}$, we will "sum up the points." Let $\epsilon>0$ and

$$
\begin{aligned}
& I_{n}(\epsilon)=\left\{m \leq n:\left|X_{m}\right|>\epsilon n^{1 / \alpha}\right\} \\
& \hat{S}_{n}(\epsilon)=\sum_{m \in I_{n}(\epsilon)} X_{m} \quad \bar{S}_{n}(\epsilon)=S_{n}-\hat{S}_{n}(\epsilon)
\end{aligned}
$$

$I_{n}(\epsilon)=$ the indices of the "big terms," i.e., those $>\epsilon n^{1 / \alpha}$ in magnitude. $\hat{S}_{n}(\epsilon)$ is the sum of the big terms, and $\bar{S}_{n}(\epsilon)$ is the rest of the sum. The first thing we will do is show that the contribution of $\bar{S}_{n}(\epsilon)$ is small if $\epsilon$ is. Let

$$
\bar{X}_{m}(\epsilon)=X_{m} 1_{\left(\left|X_{m}\right| \leq \epsilon n^{1 / \alpha}\right)}
$$

Symmetry implies $E \bar{X}_{m}(\epsilon)=0$, so $E\left(\bar{S}_{n}(\epsilon)^{2}\right)=n E \bar{X}_{1}(\epsilon)^{2}$.

$$
\begin{aligned}
E \bar{X}_{1}(\epsilon)^{2} & =\int_{0}^{\infty} 2 y P\left(\left|\bar{X}_{1}(\epsilon)\right|>y\right) d y \leq \int_{0}^{1} 2 y d y+\int_{1}^{\epsilon n^{1 / \alpha}} 2 y y^{-\alpha} d y \\
& =1+\frac{2}{2-\alpha} \epsilon^{2-\alpha} n^{2 / \alpha-1}-\frac{2}{2-\alpha} \leq \frac{2 \epsilon^{2-\alpha}}{2-\alpha} n^{2 / \alpha-1}
\end{aligned}
$$

where we have used $\alpha<2$ in computing the integral and $\alpha>0$ in the final inequality. From this it follows that

$$
\begin{equation*}
E\left(\bar{S}_{n}(\epsilon) / n^{1 / \alpha}\right)^{2} \leq \frac{2 \epsilon^{2-\alpha}}{2-\alpha} \tag{3.8.4}
\end{equation*}
$$

To compute the limit of $\hat{S}_{n}(\epsilon) / n^{1 / \alpha}$, we observe that $\left|I_{n}(\epsilon)\right|$ has a binomial distribution with success probability $p=\epsilon^{-\alpha} / n$. Given $\left|I_{n}(\epsilon)\right|= m, \hat{S}_{n}(\epsilon) / n^{1 / \alpha}$ is the sum of $m$ independent random variables with a distribution $F_{n}^{\epsilon}$ that is symmetric about 0 and has

$$
1-F_{n}^{\epsilon}(x)=P\left(X_{1} / n^{1 / \alpha}>x| | X_{1} \mid / n^{1 / \alpha}>\epsilon\right)=x^{-\alpha} / 2 \epsilon^{-\alpha} \quad \text { for } x \geq \epsilon
$$

The last distribution is the same as that of $\epsilon X_{1}$, so if $\varphi(t)=E \exp \left(i t X_{1}\right)$, the distribution $F_{n}^{\epsilon}$ has characteristic function $\varphi(\epsilon t)$. Combining the observations in this paragraph gives

$$
E \exp \left(i t \hat{S}_{n}(\epsilon) / n^{1 / \alpha}\right)=\sum_{m=0}^{n}\binom{n}{m}\left(\epsilon^{-\alpha} / n\right)^{m}\left(1-\epsilon^{-\alpha} / n\right)^{n-m} \varphi(\epsilon t)^{m}
$$

Writing

$$
\binom{n}{m} \frac{1}{n^{m}}=\frac{1}{m!} \frac{n(n-1) \cdots(n-m+1)}{n^{m}} \leq \frac{1}{m!}
$$

noting $\left(1-\epsilon^{-\alpha} / n\right)^{n} \leq \exp \left(-\epsilon^{-\alpha}\right)$ and using the dominated convergence theorem

$$
\begin{align*}
E \exp \left(i t \hat{S}_{n}(\epsilon) / n^{1 / \alpha}\right) & \rightarrow \sum_{m=0}^{\infty} \exp \left(-\epsilon^{-\alpha}\right)\left(\epsilon^{-\alpha}\right)^{m} \varphi(\epsilon t)^{m} / m! \\
& =\exp \left(-\epsilon^{-\alpha}\{1-\varphi(\epsilon t)\}\right) \tag{3.8.5}
\end{align*}
$$

To get (3.8.3) now, we use the following generalization of Lemma 3.4.15.
Lemma 3.8.1. If $h_{n}(\epsilon) \rightarrow g(\epsilon)$ for each $\epsilon>0$ and $g(\epsilon) \rightarrow g(0)$ as $\epsilon \rightarrow 0$ then we can pick $\epsilon_{n} \rightarrow 0$ so that $h_{n}\left(\epsilon_{n}\right) \rightarrow g(0)$.

Proof. Let $N_{m}$ be chosen so that $\left|h_{n}(1 / m)-g(1 / m)\right| \leq 1 / m$ for $n \geq N_{m}$ and $m \rightarrow N_{m}$ is increasing. Let $\epsilon_{n}=1 / m$ for $N_{m} \leq n<N_{m+1}$ and $=1$ for $n<N_{1}$. When $N_{m} \leq n<N_{m+1}, \epsilon_{n}=1 / m$ so it follows from the triangle inequality and the definition of $\epsilon_{n}$ that

$$
\begin{aligned}
\left|h_{n}\left(\epsilon_{n}\right)-g(0)\right| & \leq\left|h_{n}(1 / m)-g(1 / m)\right|+|g(1 / m)-g(0)| \\
& \leq 1 / m+|g(1 / m)-g(0)|
\end{aligned}
$$

When $n \rightarrow \infty$, we have $m \rightarrow \infty$ and the result follows.
Let $h_{n}(\epsilon)=E \exp \left(i t \hat{S}_{n}(\epsilon) / n^{1 / \alpha}\right)$ and $g(\epsilon)=\exp \left(-\epsilon^{-\alpha}\{1-\varphi(\epsilon t)\}\right)$. (3.8.2) implies $1-\varphi(t) \sim C|t|^{\alpha}$ as $t \rightarrow 0$ so

$$
g(\epsilon) \rightarrow \exp \left(-C|t|^{\alpha}\right) \quad \text { as } \epsilon \rightarrow 0
$$

and Lemma 3.8.1 implies we can pick $\epsilon_{n} \rightarrow 0$ with $h_{n}\left(\epsilon_{n}\right) \rightarrow \exp \left(-C|t|^{\alpha}\right)$. Introducing $Y$ with $E \exp (i t Y)=\exp \left(-C|t|^{\alpha}\right)$, it follows that $\hat{S}_{n}\left(\epsilon_{n}\right) / n^{1 / \alpha} \Rightarrow Y$. If $\epsilon_{n} \rightarrow 0$ then (3.8.4) implies

$$
\bar{S}_{n}\left(\epsilon_{n}\right) / n^{1 / \alpha} \Rightarrow 0
$$

and (3.8.3) follows from the converging together lemma, Exercise 3.2.13.

Once we give one final definition, we will state and prove the general result alluded to above. $L$ is said to be slowly varying, if

$$
\lim _{x \rightarrow \infty} L(t x) / L(x)=1 \quad \text { for all } t>0
$$

Note that $L(t)=\log t$ is slowly varying but $t^{\epsilon}$ is not if $\epsilon \neq 0$.

Theorem 3.8.2. Suppose $X_{1}, X_{2} \ldots$ are i.i.d. with a distribution that satisfies
(i) $\lim _{x \rightarrow \infty} P\left(X_{1}>x\right) / P\left(\left|X_{1}\right|>x\right)=\theta \in[0,1]$
(ii) $P\left(\left|X_{1}\right|>x\right)=x^{-\alpha} L(x)$
where $\alpha<2$ and $L$ is slowly varying. Let $S_{n}=X_{1}+\cdots+X_{n}$

$$
a_{n}=\inf \left\{x: P\left(\left|X_{1}\right|>x\right) \leq n^{-1}\right\} \quad \text { and } \quad b_{n}=n E\left(X_{1} 1_{\left(\left|X_{1}\right| \leq a_{n}\right)}\right)
$$

As $n \rightarrow \infty,\left(S_{n}-b_{n}\right) / a_{n} \Rightarrow Y$ where $Y$ has a nondegenerate distribution.
Remark. This is not much of a generalization of the example, but the conditions are necessary for the existence of constants $a_{n}$ and $b_{n}$ so that $\left(S_{n}-b_{n}\right) / a_{n} \Rightarrow Y$, where $Y$ is nondegenerate. Proofs of necessity can be found in Chapter 9 of Breiman (1968) or in Gnedenko and Kolmogorov (1954). (3.8.11) gives the ch.f. of $Y$. The reader has seen the main ideas in the second proof of (3.8.3) and so can skip to that point without much loss.

Proof. It is not hard to see that (ii) implies

$$
\begin{equation*}
n P\left(\left|X_{1}\right|>a_{n}\right) \rightarrow 1 \tag{3.8.6}
\end{equation*}
$$

To prove this, note that $n P\left(\left|X_{1}\right|>a_{n}\right) \leq 1$ and let $\epsilon>0$. Taking $x=a_{n} /(1+\epsilon)$ and $t=1+2 \epsilon$, (ii) implies

$$
(1+2 \epsilon)^{-\alpha}=\lim _{n \rightarrow \infty} \frac{P\left(\left|X_{1}\right|>(1+2 \epsilon) a_{n} /(1+\epsilon)\right)}{P\left(\left|X_{1}\right|>a_{n} /(1+\epsilon)\right)} \leq \liminf _{n \rightarrow \infty} \frac{P\left(\left|X_{1}\right|>a_{n}\right)}{1 / n}
$$

proving (3.8.6) since $\epsilon$ is arbitrary. Combining (3.8.6) with (i) and (ii) gives

$$
\begin{equation*}
n P\left(X_{1}>x a_{n}\right) \rightarrow \theta x^{-\alpha} \text { for } x>0 \tag{3.8.7}
\end{equation*}
$$

so $\left|\left\{m \leq n: X_{m}>x a_{n}\right\}\right| \Rightarrow \operatorname{Poisson}\left(\theta x^{-\alpha}\right)$. The last result leads, as before, to the conclusion that $\mathcal{X}_{n}=\left\{X_{m} / a_{n}: 1 \leq m \leq n\right\}$ converges to a Poisson process on $(-\infty, \infty)$ with mean measure

$$
\mu(A)=\int_{A \cap(0, \infty)} \theta \alpha|x|^{-(\alpha+1)} d x+\int_{A \cap(-\infty, 0)}(1-\theta) \alpha|x|^{-(\alpha+1)} d x
$$

To sum up the points, let $I_{n}(\epsilon)=\left\{m \leq n:\left|X_{m}\right|>\epsilon a_{n}\right\}$

$$
\begin{aligned}
\hat{\mu}(\epsilon) & =E X_{m} 1_{\left(\epsilon a_{n}<\left|X_{m}\right| \leq a_{n}\right)} \quad \hat{S}_{n}(\epsilon)=\sum_{m \in I_{n}(\epsilon)} X_{m} \\
\bar{\mu}(\epsilon) & =E X_{m} 1_{\left(\left|X_{m}\right| \leq \epsilon a_{n}\right)} \\
\bar{S}_{n}(\epsilon) & =\left(S_{n}-b_{n}\right)-\left(\hat{S}_{n}(\epsilon)-n \hat{\mu}(\epsilon)\right)=\sum_{m=1}^{n}\left\{X_{m} 1_{\left(\left|X_{m}\right| \leq \epsilon a_{n}\right)}-\bar{\mu}(\epsilon)\right\}
\end{aligned}
$$

If we let $\bar{X}_{m}(\epsilon)=X_{m} 1_{\left(\left|X_{m}\right| \leq \epsilon a_{n}\right)}$ then

$$
\begin{aligned}
E\left(\bar{S}_{n}(\epsilon) / a_{n}\right)^{2} & =n \operatorname{var}\left(\bar{X}_{1}(\epsilon) / a_{n}\right) \leq n E\left(\bar{X}_{1}(\epsilon) / a_{n}\right)^{2} \\
E\left(\bar{X}_{1}(\epsilon) / a_{n}\right)^{2} & \leq \int_{0}^{\epsilon} 2 y P\left(\left|X_{1}\right|>y a_{n}\right) d y \\
& =P\left(\left|X_{1}\right|>a_{n}\right) \int_{0}^{\epsilon} 2 y \frac{P\left(\left|X_{1}\right|>y a_{n}\right)}{P\left(\left|X_{1}\right|>a_{n}\right)} d y
\end{aligned}
$$

We would like to use (3.8.7) and (ii) to conclude

$$
n E\left(\bar{X}_{1}(\epsilon) / a_{n}\right)^{2} \rightarrow \int_{0}^{\epsilon} 2 y y^{-\alpha} d y=\frac{2}{2-\alpha} \epsilon^{2-\alpha}
$$

and hence

$$
\begin{equation*}
\limsup _{n \rightarrow \infty} E\left(\bar{S}_{n}(\epsilon) / a_{n}\right)^{2} \leq \frac{2 \epsilon^{2-\alpha}}{2-\alpha} \tag{3.8.8}
\end{equation*}
$$

To justify interchanging the limit and the integral and complete the proof of (3.8.8), we show the following (take $\delta<2-\alpha$ ):

Lemma 3.8.3. For any $\delta>0$ there is $C$ so that for all $t \geq t_{0}$ and $y \leq 1$

$$
P\left(\left|X_{1}\right|>y t\right) / P\left(\left|X_{1}\right|>t\right) \leq C y^{-\alpha-\delta}
$$

Proof. (ii) implies that as $t \rightarrow \infty$

$$
P\left(\left|X_{1}\right|>t / 2\right) / P\left(\left|X_{1}\right|>t\right) \rightarrow 2^{\alpha}
$$

so for $t \geq t_{0}$ we have

$$
P\left(\left|X_{1}\right|>t / 2\right) / P\left(\left|X_{1}\right|>t\right) \leq 2^{\alpha+\delta}
$$

Iterating and stopping the first time $t / 2^{m}<t_{0}$ we have for all $n \geq 1$

$$
P\left(\left|X_{1}\right|>t / 2^{n}\right) / P\left(\left|X_{1}\right|>t\right) \leq C 2^{(\alpha+\delta) n}
$$

where $C=1 / P\left(\left|X_{1}\right|>t_{0}\right)$. Applying the last result to the first $n$ with $1 / 2^{n}<y$ and noticing $y \leq 1 / 2^{n-1}$, we have

$$
P\left(\left|X_{1}\right|>y t\right) / P\left(\left|X_{1}\right|>t\right) \leq C 2^{\alpha+\delta} y^{-\alpha-\delta}
$$

which proves the lemma.
To compute the limit of $\hat{S}_{n}(\epsilon)$, we observe that $\left|I_{n}(\epsilon)\right| \Rightarrow \operatorname{Poisson}\left(\epsilon^{-\alpha}\right)$. Given $\left|I_{n}(\epsilon)\right|=m, \hat{S}_{n}(\epsilon) / a_{n}$ is the sum of $m$ independent random variables with distribution $F_{n}^{\epsilon}$ that has

$$
\begin{aligned}
& 1-F_{n}^{\epsilon}(x)=P\left(X_{1} / a_{n}>x| | X_{1} \mid / a_{n}>\epsilon\right) \rightarrow \theta x^{-\alpha} / \epsilon^{-\alpha} \\
& F_{n}^{\epsilon}(-x)=P\left(X_{1} / a_{n}<-x| | X_{1} \mid / a_{n}>\epsilon\right) \rightarrow(1-\theta)|x|^{-\alpha} / \epsilon^{-\alpha}
\end{aligned}
$$

for $x \geq \epsilon$. If we let $\psi_{n}^{\epsilon}(t)$ denote the characteristic function of $F_{n}^{\epsilon}$, then Theorem 3.3.17 implies

$$
\psi_{n}^{\epsilon}(t) \rightarrow \psi^{\epsilon}(t)=\int_{\epsilon}^{\infty} e^{i t x} \theta \epsilon^{\alpha} \alpha x^{-(\alpha+1)} d x+\int_{-\infty}^{-\epsilon} e^{i t x}(1-\theta) \epsilon^{\alpha} \alpha|x|^{-(\alpha+1)} d x
$$

as $n \rightarrow \infty$. So repeating the proof of (3.8.5) gives

$$
\begin{aligned}
E \exp \left(i t \hat{S}_{n}(\epsilon) / a_{n}\right) \rightarrow & \exp \left(-\epsilon^{-\alpha}\left\{1-\psi^{\epsilon}(t)\right\}\right) \\
= & \exp \left(\int_{\epsilon}^{\infty}\left(e^{i t x}-1\right) \theta \alpha x^{-(\alpha+1)} d x\right. \\
& \left.+\int_{-\infty}^{-\epsilon}\left(e^{i t x}-1\right)(1-\theta) \alpha|x|^{-(\alpha+1)} d x\right)
\end{aligned}
$$

where we have used $\epsilon^{-\alpha}=\int_{\epsilon}^{\infty} \alpha x^{-(\alpha+1)} d x$. To bring in

$$
\hat{\mu}(\epsilon)=E X_{m} 1_{\left(\epsilon a_{n}<\left|X_{m}\right| \leq a_{n}\right)}
$$

we observe that (3.8.7) implies $n P\left(x a_{n}<X_{m} \leq y a_{n}\right) \rightarrow \theta\left(x^{-\alpha}-y^{-\alpha}\right)$. So

$$
n \hat{\mu}(\epsilon) / a_{n} \rightarrow \int_{\epsilon}^{1} x \theta \alpha x^{-(\alpha+1)} d x+\int_{-1}^{-\epsilon} x(1-\theta) \alpha|x|^{-(\alpha+1)} d x
$$

From this it follows that $E \exp \left(i t\left\{\hat{S}_{n}(\epsilon)-n \hat{\mu}(\epsilon)\right\} / a_{n}\right) \rightarrow$

$$
\begin{align*}
\exp \left(\int_{1}^{\infty}\right. & \left(e^{i t x}-1\right) \theta \alpha x^{-(\alpha+1)} d x \\
& +\int_{\epsilon}^{1}\left(e^{i t x}-1-i t x\right) \theta \alpha x^{-(\alpha+1)} d x \\
& +\int_{-1}^{-\epsilon}\left(e^{i t x}-1-i t x\right)(1-\theta) \alpha|x|^{-(\alpha+1)} d x  \tag{3.8.9}\\
& \left.+\int_{-\infty}^{-1}\left(e^{i t x}-1\right)(1-\theta) \alpha|x|^{-(\alpha+1)} d x\right)
\end{align*}
$$

The last expression is messy, but $e^{i t x}-1-i t x \sim-t^{2} x^{2} / 2$ as $t \rightarrow 0$, so we need to subtract the $i t x$ to make

$$
\int_{0}^{1}\left(e^{i t x}-1-i t x\right) x^{-(\alpha+1)} d x \quad \text { converge when } \alpha \geq 1
$$

To reduce the number of integrals from four to two, we can write the limit as $\epsilon \rightarrow 0$ of the right-hand side of (3.8.9) as

$$
\begin{align*}
\exp \left(i t c+\int_{0}^{\infty}\right. & \left(e^{i t x}-1-\frac{i t x}{1+x^{2}}\right) \theta \alpha x^{-(\alpha+1)} d x \\
& \left.+\int_{-\infty}^{0}\left(e^{i t x}-1-\frac{i t x}{1+x^{2}}\right)(1-\theta) \alpha|x|^{-(\alpha+1)} d x\right) \tag{3.8.10}
\end{align*}
$$

where $c$ is a constant. Combining (3.8.6) and (3.8.9) using Lemma 3.8.1, it follows easily that $\left(S_{n}-b_{n}\right) / a_{n} \Rightarrow Y$ where $E e^{i t Y}$ is given in (3.8.10).

By doing some calculus (see Breiman (1968), p. 204-206) one can rewrite (3.8.10) as

$$
\begin{equation*}
\exp \left(i t c-b|t|^{\alpha}\left\{1+i \kappa \operatorname{sgn}(t) w_{\alpha}(t)\right\}\right) \tag{3.8.11}
\end{equation*}
$$

where $-1 \leq \kappa \leq 1$, ( $\kappa=2 \theta-1$ ) and

$$
w_{\alpha}(t)= \begin{cases}\tan (\pi \alpha / 2) & \text { if } \alpha \neq 1 \\ (2 / \pi) \log |t| & \text { if } \alpha=1\end{cases}
$$

The reader should note that while we have assumed $0<\alpha<2$ throughout the developments above, if we set $\alpha=2$ then the term with $\kappa$ vanishes and (3.8.11) reduces to the characteristic function of the normal distribution with mean $c$ and variance $2 b$.

The distributions whose characteristic functions are given in (3.8.11) are called stable laws. $\alpha$ is commonly called the index. When $\alpha=1$ and $\kappa=0$, we have the Cauchy distribution. Apart from the Cauchy and the normal, there is only one other case in which the density is known: When $\alpha=1 / 2, \kappa=1, c=0$, and $b=1$, the density is

$$
\begin{equation*}
\left(2 \pi y^{3}\right)^{-1 / 2} \exp (-1 / 2 y) \quad \text { for } y \geq 0 \tag{3.8.12}
\end{equation*}
$$

One can calculate the ch.f. and verify our claim. However, later (see Section 7.4) we will be able to check the claim without effort, so we leave the somewhat tedious calculation to the reader.

We are now finally ready to treat some examples
Example 3.8.4 Let $X_{1}, X_{2}, \ldots$ be i.i.d. with a density that is symmetric about 0 , and continuous and positive at 0 . We claim that

$$
\frac{1}{n}\left(\frac{1}{X_{1}}+\cdots+\frac{1}{X_{n}}\right) \Rightarrow \text { a Cauchy distribution }(\alpha=1, \kappa=0)
$$

To verify this, note that

$$
P\left(1 / X_{i}>x\right)=P\left(0<X_{i}<x^{-1}\right)=\int_{0}^{x^{-1}} f(y) d y \sim f(0) / x
$$

as $x \rightarrow \infty$. A similar calculation shows $P\left(1 / X_{i}<-x\right) \sim f(0) / x$ so in (i) in Theorem 3.8.2 holds with $\theta=1 / 2$, and (ii) holds with $\alpha=1$. The scaling constant $a_{n} \sim 2 f(0) n$, while the centering constant vanishes since we have supposed the distribution of $X$ is symmetric about 0 .

Remark. Readers who want a challenge should try to drop the symmetry assumption, assuming for simplicity that $f$ is differentiable at 0 .

Example 3.8.5. Let $X_{1}, X_{2} \ldots$ be i.i.d. with $P\left(X_{i}=1\right)=P\left(X_{i}=\right. -1)=1 / 2$, let $S_{n}=X_{1}+\cdots+X_{n}$, and let $\tau=\inf \left\{n \geq 1: S_{n}=1\right\}$. In Chapter 4 (see the discussion after (4.9.2)) we will show

$$
P(\tau>2 n) \sim \pi^{-1 / 2} n^{-1 / 2} \quad \text { as } n \rightarrow \infty
$$

Let $\tau_{1}, \tau_{2}, \ldots$ be independent with the same distribution as $\tau$, and let $T_{n}=\tau_{1}+\cdots+\tau_{n}$. Results in Section 4.1 imply that $T_{n}$ has the same distribution as the $n$th time $S_{m}$ hits 0 . We claim that $T_{n} / n^{2}$ converges to the stable law with $\alpha=1 / 2, \kappa=1$ and note that this is the key to the derivation of (3.8.12). To prove the claim, note that in (i) in Theorem 3.8.2 holds with $\theta=1$ and (ii) holds with $\alpha=1 / 2$. The scaling constant $a_{n} \sim C n^{2}$. Since $\alpha<1$, Exercise 3.8.1 implies the centering constant is unnecessary.

Example 3.8.6. Assume $n$ objects $X_{n, 1}, \ldots, X_{n, n}$ are placed independently and at random in $[-n, n]$. Let

$$
\begin{equation*}
F_{n}=\sum_{m=1}^{n} \operatorname{sgn}\left(X_{n, m}\right) /\left|X_{n, m}\right|^{p} \tag{3.8.13}
\end{equation*}
$$

be the net force exerted on 0 . We will now show that if $p>1 / 2$, then

$$
\lim _{n \rightarrow \infty} E \exp \left(i t F_{n}\right)=\exp \left(-c|t|^{1 / p}\right)
$$

To do this, it is convenient to let $X_{n, m}=n Y_{m}$ where the $Y_{i}$ are i.i.d. on $[-1,1]$. Then

$$
F_{n}=n^{-p} \sum_{m=1}^{n} \operatorname{sgn}\left(Y_{m}\right) /\left|Y_{m}\right|^{p}
$$

Letting $Z_{m}=\operatorname{sgn}\left(Y_{m}\right) /\left|Y_{m}\right|^{p}, Z_{m}$ is symmetric about 0 with $P\left(\left|Z_{m}\right|>\right. x)=P\left(\left|Y_{m}\right|<x^{-1 / p}\right)$ so in (i) in Theorem 3.8.2 holds with $\theta=1 / 2$ and (ii) holds with $\alpha=1 / p$. The scaling constant $a_{n} \sim C n^{p}$ and the centering constant is 0 by symmetry.

Example 3.8.7. In the examples above, we have had $b_{n}=0$. To get a feel for the centering constants consider $X_{1}, X_{2}, \ldots$ i.i.d. with

$$
P\left(X_{i}>x\right)=\theta x^{-\alpha} \quad P\left(X_{i}<-x\right)=(1-\theta) x^{-\alpha}
$$

where $0<\alpha<2$. In this case $a_{n}=n^{1 / \alpha}$ and

$$
b_{n}=n \int_{1}^{n^{1 / \alpha}}(2 \theta-1) \alpha x^{-\alpha} d x \sim \begin{cases}c n & \alpha>1 \\ c n \log n & \alpha=1 \\ c n^{1 / \alpha} & \alpha<1\end{cases}
$$

When $\alpha<1$ the centering is the same size as the scaling and can be ignored. When $\alpha>1, b_{n} \sim n \mu$ where $\mu=E X_{i}$.

Our next result explains the name stable laws. A random variable $Y$ is said to have a stable law if for every integer $k>0$ there are constants $a_{k}$ and $b_{k}$ so that if $Y_{1}, \ldots, Y_{k}$ are i.i.d. and have the same distribution as $Y$, then $\left(Y_{1}+\ldots+Y_{k}-b_{k}\right) / a_{k}={ }_{d} Y$. The last definition makes half of the next result obvious.

Theorem 3.8.8. $Y$ is the limit of $\left(X_{1}+\cdots+X_{k}-b_{k}\right) / a_{k}$ for some i.i.d. sequence $X_{i}$ if and only if $Y$ has a stable law.

Proof. If $Y$ has a stable law we can take $X_{1}, X_{2}, \ldots$ i.i.d. with distribution $Y$. To go the other way, let

$$
Z_{n}=\left(X_{1}+\cdots+X_{n}-b_{n}\right) / a_{n}
$$

and $S_{n}^{j}=X_{(j-1) n+1}+\cdots+X_{j n}$. A little arithmetic shows

$$
\begin{aligned}
& Z_{n k}=\left(S_{n}^{1}+\cdots+S_{n}^{k}-b_{n k}\right) / a_{n k} \\
& a_{n k} Z_{n k}=\left(S_{n}^{1}-b_{n}\right)+\cdots+\left(S_{n}^{k}-b_{n}\right)+\left(k b_{n}-b_{n k}\right) \\
& a_{n k} Z_{n k} / a_{n}=\left(S_{n}^{1}-b_{n}\right) / a_{n}+\cdots+\left(S_{n}^{k}-b_{n}\right) / a_{n}+\left(k b_{n}-b_{n k}\right) / a_{n}
\end{aligned}
$$

The first $k$ terms on the right-hand side $\Rightarrow Y_{1}+\cdots+Y_{k}$ as $n \rightarrow \infty$ where $Y_{1}, \ldots, Y_{k}$ are independent and have the same distribution as $Y$, and $Z_{n k} \Rightarrow Y$. Taking $W_{n}=Z_{n k}$ and

$$
W_{n}^{\prime}=\frac{a_{k n}}{a_{n}} Z_{n k}-\frac{k b_{n}-b_{n k}}{a_{n}}
$$

gives the desired result.
Theorem 3.8.9. Convergence of types theorem. If $W_{n} \Rightarrow W$ and there are constants $\alpha_{n}>0, \beta_{n}$ so that $W_{n}^{\prime}=\alpha_{n} W_{n}+\beta_{n} \Rightarrow W^{\prime}$ where $W$ and $W^{\prime}$ are nondegenerate, then there are constants $\alpha$ and $\beta$ so that $\alpha_{n} \rightarrow \alpha$ and $\beta_{n} \rightarrow \beta$.

Proof. Let $\varphi_{n}(t)=E \exp \left(i t W_{n}\right)$.

$$
\psi_{n}(t)=E \exp \left(i t\left(\alpha_{n} W_{n}+\beta_{n}\right)\right)=\exp \left(i t \beta_{n}\right) \varphi_{n}\left(\alpha_{n} t\right)
$$

If $\varphi$ and $\psi$ are the characteristic functions of $W$ and $W^{\prime}$, then

$$
\begin{equation*}
\varphi_{n}(t) \rightarrow \varphi(t) \quad \psi_{n}(t)=\exp \left(i t \beta_{n}\right) \varphi_{n}\left(\alpha_{n} t\right) \rightarrow \psi(t) \tag{a}
\end{equation*}
$$

Take a subsequence $\alpha_{n(m)}$ that converges to a limit $\alpha \in[0, \infty]$. Our first step is to observe $\alpha=0$ is impossible. If this happens, then using the uniform convergence proved in Exercise 3.3.13

$$
\begin{equation*}
\left|\psi_{n}(t)\right|=\left|\varphi_{n}\left(\alpha_{n} t\right)\right| \rightarrow 1 \tag{b}
\end{equation*}
$$

$|\psi(t)| \equiv 1$, and the limit is degenerate by Theorem 3.5.2. Letting $t= u / \alpha_{n}$ and interchanging the roles of $\varphi$ and $\psi$ shows $\alpha=\infty$ is impossible.

If $\alpha$ is a subsequential limit, then arguing as in (b) gives $|\psi(t)|=|\varphi(\alpha t)|$. If there are two subsequential limits $\alpha^{\prime}<\alpha$, using the last equation for both limits implies $|\varphi(u)|=\left|\varphi\left(u \alpha^{\prime} / \alpha\right)\right|$. Iterating gives $|\varphi(u)|= \left|\varphi\left(u\left(\alpha^{\prime} / \alpha\right)^{k}\right)\right| \rightarrow 1$ as $k \rightarrow \infty$, contradicting our assumption that $W^{\prime}$ is nondegenerate, so $\alpha_{n} \rightarrow \alpha \in[0, \infty)$.

To conclude that $\beta_{n} \rightarrow \beta$ now, we observe that (ii) of Exercise 3.3.13 implies $\varphi_{n} \rightarrow \varphi$ uniformly on compact sets so $\varphi_{n}\left(\alpha_{n} t\right) \rightarrow \varphi(\alpha t)$. If $\delta$ is small enough so that $|\varphi(\alpha t)|>0$ for $|t| \leq \delta$, it follows from (a) and another use of Exercise 3.3.13 that

$$
\exp \left(i t \beta_{n}\right)=\frac{\psi_{n}(t)}{\varphi_{n}(\alpha t)} \rightarrow \frac{\psi(t)}{\varphi(\alpha t)}
$$

uniformly on $[-\delta, \delta] . \exp \left(i t \beta_{n}\right)$ is the ch.f. of a point mass at $\beta_{n}$. Using (3.3.1) now as in the proof of Theorem 3.3.17, it follows that the sequence of distributions that are point masses at $\beta_{n}$ is tight, i.e., $\beta_{n}$ is bounded. If $\beta_{n_{m}} \rightarrow \beta$ then $\exp (i t \beta)=\psi(t) / \varphi(\alpha t)$ for $|t| \leq \delta$, so there can only be one subsequential limit.

Theorem 3.8.8 justifies calling the distributions with characteristic functions given by (3.8.11) or (3.8.10) stable laws. To complete the story, we should mention that these are the only stable laws. Again, see Chapter 9 of Breiman (1968) or Gnedenko and Kolmogorov (1954). The next example shows that it is sometimes useful to know what all the possible limits are.

Example 3.8.10. The Holtsmark distribution. $(\alpha=3 / 2, \kappa=0)$. Suppose stars are distributed in space according to a Poisson process with density $t$ and their masses are i.i.d. Let $X_{t}$ be the $x$-component of the gravitational force at 0 when the density is $t$. A change of density $1 \rightarrow t$ corresponds to a change of length $1 \rightarrow t^{-1 / 3}$, and gravitational attraction follows an inverse square law so

$$
\begin{equation*}
X_{t} \stackrel{d}{=} t^{3 / 2} X_{1} \tag{3.8.14}
\end{equation*}
$$

If we imagine thinning the Poisson process by rolling an $n$-sided die, then Theorem 3.7.4 implies

$$
X_{t} \stackrel{d}{=} X_{t / n}^{1}+\cdots+X_{t / n}^{n}
$$

where the random variables on the right-hand side are independent and have the same distribution as $X_{t / n}$. It follows from Theorem 3.8.8 that $X_{t}$ has a stable law. The scaling property (3.8.14) implies $\alpha=3 / 2$. Since $X_{t}={ }_{d}-X_{t}, \kappa=0$.

## Exercises

3.8.1. Show that when $\alpha<1$, centering in Theorem 3.8.2 is unnecessary, i.e., we can let $b_{n}=0$.
3.8.2. Consider $F_{n}$ defined in (3.8.13) Show that (i) If $p<1 / 2$ then $F_{n} / n^{1 / 2-p} \Rightarrow c \chi$, where $\chi$ is a standard normal. (ii) If $p=1 / 2$ then $F_{n} /(\log n)^{1 / 2} \Rightarrow c \chi$.
3.8.3. Let $Y$ be a stable law with $\kappa=1$. Use the limit theorem Theorem 3.8.2 to conclude that $Y \geq 0$ if $\alpha<1$.
3.8.4 Let $X$ be symmetric stable with index $\alpha$. (i) Use (3.3.1) to show that $E|X|^{p}<\infty$ for $p<\alpha$. (ii) Use the second proof of (3.8.3) to show that $P(|X| \geq x) \geq C x^{-\alpha}$ so $E|X|^{\alpha}=\infty$.
3.8.5. Let $Y, Y_{1}, Y_{2}, \ldots$ be independent and have a stable law with index $\alpha$. Theorem 3.8.8 implies there are constants $\alpha_{k}$ and $\beta_{k}$ so that $Y_{1}+\cdots+ Y_{k}$ and $\alpha_{k} Y+\beta_{k}$ have the same distribution. Use the proof of Theorem 3.8.8, Theorem 3.8.2 and Exercise 3.8.1 to conclude that (i) $\alpha_{k}=k^{1 / \alpha}$, (ii) if $\alpha<1$ then $\beta_{k}=0$.
3.8.6. Let $Y$ be a stable law with index $\alpha<1$ and $\kappa=1$. Exercise 3.8.3 implies that $Y \geq 0$, so we can define its Laplace transform $\psi(\lambda)= E \exp (-\lambda Y)$. The previous exercise implies that for any integer $n \geq 1$ we have $\psi(\lambda)^{n}=\psi\left(n^{1 / \alpha} \lambda\right)$. Use this to conclude $E \exp (-\lambda Y)=\exp \left(-c \lambda^{\alpha}\right)$.
3.8.7. (i) Show that if $X$ is symmetric stable with index $\alpha$ and $Y \geq 0$ is an independent stable with index $\beta<1$ then $X Y^{1 / \alpha}$ is symmetric stable with index $\alpha \beta$. (ii) Let $W_{1}$ and $W_{2}$ be independent standard normals. Check that $1 / W_{2}^{2}$ has the density given in (3.8.12) and use this to conclude that $W_{1} / W_{2}$ has a Cauchy distribution.

### 3.9 Infinitely Divisible Distributions*

In the last section, we identified the distributions that can appear as the limit of normalized sums of i.i.d.r.v.'s. In this section, we will describe those that are limits of sums

$$
\begin{equation*}
S_{n}=X_{n, 1}+\cdots+X_{n, n} \tag{*}
\end{equation*}
$$

where the $X_{n, m}$ are i.i.d. Note the verb "describe." We will prove almost nothing in this section, just state some of the most important facts to bring the reader up to cocktail party literacy.

A sufficient condition for $Z$ to be a limit of sums of the form (*) is that $Z$ has an infinitely divisible distribution, i.e., for each $n$ there is an i.i.d. sequence $Y_{n, 1}, \ldots, Y_{n, n}$ so that

$$
Z \stackrel{d}{=} Y_{n, 1}+\cdots+Y_{n, n}
$$

Our first result shows that this condition is also necessary.

Theorem 3.9.1. $Z$ is a limit of sums of type ( $*$ ) if and only if $Z$ has an infinitely divisible distribution.
Proof. As remarked above, we only have to prove necessity. Write

$$
S_{2 n}=\left(X_{2 n, 1}+\cdots+X_{2 n, n}\right)+\left(X_{2 n, n+1}+\cdots+X_{2 n, 2 n}\right) \equiv Y_{n}+Y_{n}^{\prime}
$$

The random variables $Y_{n}$ and $Y_{n}^{\prime}$ are independent and have the same distribution. If $S_{n} \Rightarrow Z$ then the distributions of $Y_{n}$ are a tight sequence since

$$
P\left(Y_{n}>y\right)^{2}=P\left(Y_{n}>y\right) P\left(Y_{n}^{\prime}>y\right) \leq P\left(S_{2 n}>2 y\right)
$$

and similarly $P\left(Y_{n}<-y\right)^{2} \leq P\left(S_{2 n}<-2 y\right)$. If we take a subsequence $n_{k}$ so that $Y_{n_{k}} \Rightarrow Y$ (and hence $Y_{n_{k}}^{\prime} \Rightarrow Y^{\prime}$ ) then $Z={ }_{d} Y+Y^{\prime}$. A similar argument shows that $Z$ can be divided into $n>2$ pieces and the proof is complete.

With Theorem 3.9.1 established, we turn now to examples. In the first three cases, the distribution is infinitely divisible because it is a limit of sums of the form ( $*$ ). The number gives the relevant limit theorem.
Example 3.9.2. Normal distribution. Theorem 3.4.1
Example 3.9.3. Stable Laws. Theorem 3.8.2
Example 3.9.4. Poisson distribution. Theorem 3.6.1
Example 3.9.5. Compound Poisson distribution. Let $\xi_{1}, \xi_{2}, \ldots$ be i.i.d. and $N(\lambda)$ be an independent Poisson r.v. with mean $\lambda$. Then $Z=\xi_{1}+\cdots+\xi_{N(\lambda)}$ has an infinitely divisible distribution. (Let $X_{n, j}={ }_{d} \xi_{1}+\cdots+\xi_{N(\lambda / n)}$.) For developments below, we would like to observe that if $\varphi(t)=E \exp \left(i t \xi_{i}\right)$ then

$$
\begin{equation*}
E \exp (i t Z)=\sum_{n=0}^{\infty} e^{-\lambda} \frac{\lambda^{n}}{n!} \varphi(t)^{n}=\exp (-\lambda(1-\varphi(t))) \tag{3.9.1}
\end{equation*}
$$

Example 3.9.5 is a son of 3.9.4 but a father of 3.9.2 and 3.9.3. To explain this remark, we observe that if $\xi=\epsilon$ and $-\epsilon$ with probability $1 / 2$ each then $\varphi(t)=\left(e^{i \epsilon t}+e^{-i \epsilon t}\right) / 2=\cos (\epsilon t)$. So if $\lambda=\epsilon^{-2}$, then (3.9.1) implies

$$
E \exp (i t Z)=\exp \left(-\epsilon^{-2}(1-\cos (\epsilon t))\right) \rightarrow \exp \left(-t^{2} / 2\right)
$$

as $\epsilon \rightarrow 0$. In words, the normal distribution is a limit of compound Poisson distributions. To see that stable laws are also a special case (using the notation from the proof of Theorem 3.8.2), let

$$
\begin{aligned}
& I_{n}(\epsilon)=\left\{m \leq n:\left|X_{m}\right|>\epsilon a_{n}\right\} \\
& \hat{S}_{n}(\epsilon)=\sum_{m \in I_{n}(\epsilon)} X_{m} \\
& \bar{S}_{n}(\epsilon)=S_{n}-\hat{S}_{n}(\epsilon)
\end{aligned}
$$

If $\epsilon_{n} \rightarrow 0$ then $\bar{S}_{n}\left(\epsilon_{n}\right) / a_{n} \Rightarrow 0$. If $\epsilon$ is fixed then as $n \rightarrow \infty$ we have $\left|I_{n}(\epsilon)\right| \Rightarrow$ Poisson $\left(\epsilon^{-\alpha}\right)$ and $\hat{S}_{n}(\epsilon) / a_{n} \Rightarrow$ a compound Poisson distribution:

$$
E \exp \left(i t \hat{S}_{n}(\epsilon) / a_{n}\right) \rightarrow \exp \left(-\epsilon^{-\alpha}\left\{1-\psi^{\epsilon}(t)\right\}\right)
$$

Combining the last two observations and using the proof of Theorem 3.8.2 shows that stable laws are limits of compound Poisson distributions. The formula (3.8.10) for the limiting ch.f.

$$
\begin{align*}
& \exp \left(i t c+\int_{0}^{\infty}\left(e^{i t x}-1-\frac{i t x}{1+x^{2}}\right) \theta \alpha x^{-(\alpha+1)} d x\right. \\
& \left.\quad+\int_{-\infty}^{0}\left(e^{i t x}-1-\frac{i t x}{1+x^{2}}\right)(1-\theta) \alpha|x|^{-(\alpha+1)} d x\right) \tag{3.9.2}
\end{align*}
$$

helps explain:
Theorem 3.9.6. Lévy-Khinchin Theorem. $Z$ has an infinitely divisible distribution if and only if its characteristic function has

$$
\log \varphi(t)=i c t-\frac{\sigma^{2} t^{2}}{2}+\int\left(e^{i t x}-1-\frac{i t x}{1+x^{2}}\right) \mu(d x)
$$

where $\mu$ is a measure with $\mu(\{0\})=0$ and $\int \frac{x^{2}}{1+x^{2}} \mu(d x)<\infty$.
For a proof, see Breiman (1968), Section 9.5., or Feller II (1971), Section XVII.2. $\mu$ is called the Lévy measure of the distribution. Comparing with (3.9.2) and recalling the proof of Theorem 3.8.2 suggests the following interpretation of $\mu$ : If $\sigma^{2}=0$ then $Z$ can be built up by making a Poisson process on $\mathbf{R}$ with mean measure $\mu$ and then summing up the points. As in the case of stable laws, we have to sum the points in $[-\epsilon, \epsilon]^{c}$, subtract an appropriate constant, and let $\epsilon \rightarrow 0$.

The theory of infinitely divisible distributions is simpler in the case of finite variance. In this case, we have:

Theorem 3.9.7. Kolmogorov's Theorem. $Z$ has an infinitely divisible distribution with mean 0 and finite variance if and only if its ch.f. has

$$
\log \varphi(t)=\int\left(e^{i t x}-1-i t x\right) x^{-2} \nu(d x)
$$

Here the integrand is $-t^{2} / 2$ at $0, \nu$ is called the canonical measure and $v a r(Z)=\nu(\mathbf{R})$.

To explain the formula, note that if $Z_{\lambda}$ has a Poisson distribution with mean $\lambda$

$$
E \exp \left(i t x\left(Z_{\lambda}-\lambda\right)\right)=\exp \left(\lambda\left(e^{i t x}-1-i t x\right)\right)
$$

so the measure for $Z=x\left(Z_{\lambda}-\lambda\right)$ has $\nu(\{x\})=\lambda x^{2}$.

## Exercises

3.9.1. Show that the gamma distribution is infinitely divisible.
3.9.2. Show that the distribution of a bounded r.v. $Z$ is infinitely divisible if and only if $Z$ is constant. Hint: Show $\operatorname{var}(Z)=0$.
3.9.3. Show that if $\mu$ is infinitely divisible, its ch.f. $\varphi$ never vanishes. Hint: Look at $\psi=|\varphi|^{2}$, which is also infinitely divisible, to avoid taking nth roots of complex numbers then use Exercise 3.3.17.
3.9.4. What is the Lévy measure for the limit $\aleph$ in part (iii) of Exercise 3.4.13?

### 3.10 Limit Theorems in $\mathbf{R}^{d}$

We begin by considering weak convergence in a general metric space $(S, \rho)$. In this setting we say $X_{n} \Rightarrow X_{\infty}$ if and only if $E f\left(X_{n}\right) \rightarrow E f\left(X_{\infty}\right)$ for all bounded continuous $f$. As in Section 3.2, it will be useful to have several equivalent definitions of weak convergence. $f$ is said to be Lipschitz continuous if there is a constant $C$ so that $|f(x)-f(y)| \leq C \rho(x, y)$.

Theorem 3.10.1. The following statements are equivalent:
(i) $E f\left(X_{n}\right) \rightarrow E f\left(X_{\infty}\right)$ for all bounded continuous $f$.
(ii) $\operatorname{Ef}\left(X_{n}\right) \rightarrow \operatorname{Ef}\left(X_{\infty}\right)$ for all bounded Lipschitz continuous $f$.
(iii) For all closed sets $K, \limsup _{n \rightarrow \infty} P\left(X_{n} \in K\right) \leq P\left(X_{\infty} \in K\right)$.
(iv) For all open sets $G, \liminf _{n \rightarrow \infty} P\left(X_{n} \in G\right) \geq P\left(X_{\infty} \in G\right)$.
(v) For all sets $A$ with $P\left(X_{\infty} \in \partial A\right)=0, \lim _{n \rightarrow \infty} P\left(X_{n} \in A\right)=P\left(X_{\infty} \in\right.$ A).
(vi) Let $D_{f}=$ the set of discontinuities of $f$. For all bounded functions $f$ with $P\left(X_{\infty} \in D_{f}\right)=0$, we have $\operatorname{Ef}\left(X_{n}\right) \rightarrow \operatorname{Ef}\left(X_{\infty}\right)$.
Proof. (i) implies (ii): Trivial.
(ii) implies (iii): Let $\rho(x, K)=\inf \{\rho(x, y): y \in K\}, \varphi_{j}(r)=(1-j r)^{+}$, and $f_{j}(x)=\varphi_{j}(\rho(x, K))$. $f_{j}$ is Lipschitz continuous, has values in [ 0,1 ], and ↓ $1_{K}(x)$ as $j \uparrow \infty$. So
$\limsup _{n \rightarrow \infty} P\left(X_{n} \in K\right) \leq \lim _{n \rightarrow \infty} E f_{j}\left(X_{n}\right)=E f_{j}\left(X_{\infty}\right) \downarrow P\left(X_{\infty} \in K\right)$ as $j \uparrow \infty$
(iii) is equivalent to (iv): As in the proof of Theorem 3.2.11, this follows easily from two facts: $A$ is open if and only if $A^{c}$ is closed; $P(A)+P\left(A^{c}\right)=$ 1.
(iii) and (iv) imply (v): Let $K=\bar{A}, G=A^{o}$, and reason as in the proof of Theorem 3.2.11.
(v) implies (vi): Suppose $|f(x)| \leq K$ and pick $\alpha_{0}<\alpha_{1}<\ldots<\alpha_{\ell}$ so that $P\left(f\left(X_{\infty}\right)=\alpha_{i}\right)=0$ for $0 \leq i \leq \ell, \alpha_{0}<-K<K<\alpha_{\ell}$, and $\alpha_{i}-\alpha_{i-1}<\epsilon$. This is always possible since $\left\{\alpha: P\left(f\left(X_{\infty}\right)=\alpha\right)>0\right\}$ is a countable set. Let $A_{i}=\left\{x: \alpha_{i-1}<f(x) \leq \alpha_{i}\right\} . \partial A_{i} \subset\left\{x: f(x) \in\left\{\alpha_{i-1}, \alpha_{i}\right\}\right\} \cup D_{f}$, so $P\left(X_{\infty} \in \partial A_{i}\right)=0$, and it follows from (v) that

$$
\sum_{i=1}^{\ell} \alpha_{i} P\left(X_{n} \in A_{i}\right) \rightarrow \sum_{i=1}^{\ell} \alpha_{i} P\left(X_{\infty} \in A_{i}\right)
$$

The definition of the $\alpha_{i}$ implies

$$
0 \leq \sum_{i=1}^{\ell} \alpha_{i} P\left(X_{n} \in A_{i}\right)-E f\left(X_{n}\right) \leq \epsilon \quad \text { for } 1 \leq n \leq \infty
$$

Since $\epsilon$ is arbitrary, it follows that $\operatorname{Ef}\left(X_{n}\right) \rightarrow \operatorname{Ef}\left(X_{\infty}\right)$.
(vi) implies (i): Trivial.

Specializing now to $\mathbf{R}^{d}$, let $X=\left(X_{1}, \ldots, X_{d}\right)$ be a random vector. We define its distribution function by $F(x)=P(X \leq x)$. Here $x \in \mathbf{R}^{d}$, and $X \leq x$ means $X_{i} \leq x_{i}$ for $i=1, \ldots, d$. As in one dimension, $F$ has three obvious properties:
(i) It is nondecreasing, i.e., if $x \leq y$ then $F(x) \leq F(y)$.
(ii) $\lim _{x \rightarrow \infty} F(x)=1, \quad \lim _{x_{i} \rightarrow-\infty} F(x)=0$.
(iii) $F$ is right continuous, i.e., $\lim _{y \downarrow x} F(y)=F(x)$.

Here $x \rightarrow \infty$ means each coordinate $x_{i}$ goes to $\infty, x_{i} \rightarrow-\infty$ means we let $x_{i} \rightarrow-\infty$ keeping the other coordinates fixed, and $y \downarrow x$ means each coordinate $y_{i} \downarrow x_{i}$.

As discussed in Section 1.1, an additional condition is needed to guarantee that $F$ is the distribution function of a probability measure, let

$$
\begin{aligned}
A & =\left(a_{1}, b_{1}\right] \times \cdots \times\left(a_{d}, b_{d}\right] \\
V & =\left\{a_{1}, b_{1}\right\} \times \cdots \times\left\{a_{d}, b_{d}\right\}
\end{aligned}
$$

$V=$ the vertices of the rectangle $A$. If $v \in V$, let

$$
\operatorname{sgn}(v)=(-1)^{\# \text { of } a ' \sin v}
$$

The inclusion-exclusion formula implies

$$
P(X \in A)=\sum_{v \in V} \operatorname{sgn}(v) F(v)
$$

So if we use $\Delta_{A} F$ to denote the right-hand side, we need
(iv) $\Delta_{A} F \geq 0$ for all rectangles $A$.

The last condition guarantees that the measure assigned to each rectangle is $\geq 0$. At this point we have defined the measure on the semialgebra $\mathcal{S}_{d}$ defined in Example 1.1.5. Theorem 1.1.11 now implies that there is a unique probability measure with distribution $F$.

If $F_{n}$ and $F$ are distribution functions on $\mathbf{R}^{d}$, we say that $F_{n}$ converges weakly to $F$, and write $F_{n} \Rightarrow F$, if $F_{n}(x) \rightarrow F(x)$ at all continuity points of $F$. Our first task is to show that there are enough continuity points for this to be a sensible definition. For a concrete example, consider

$$
F(x, y)= \begin{cases}1 & \text { if } x \geq 0, y \geq 1 \\ y & \text { if } x \geq 0,0 \leq y<1 \\ 0 & \text { otherwise }\end{cases}
$$

$F$ is the distribution function of $(0, Y)$ where $Y$ is uniform on $(0,1)$. Notice that this distribution has no atoms, but $F$ is discontinuous at $(0, y)$ when $y>0$.

Keeping the last example in mind, observe that if $x_{n}<x$, i.e., $x_{n, i}<x_{i}$ for all coordinates $i$, and $x_{n} \uparrow x$ as $n \rightarrow \infty$ then

$$
F(x)-F\left(x_{n}\right)=P(X \leq x)-P\left(X \leq x_{n}\right) \downarrow P(X \leq x)-P(X<x)
$$

In $d=2$, the last expression is the probability $X$ lies in

$$
\left\{\left(a, x_{2}\right): a \leq x_{1}\right\} \cup\left\{\left(x_{1}, b\right): b \leq x_{2}\right\}
$$

Let $H_{c}^{i}=\left\{x: x_{i}=c\right\}$ be the hyperplane where the $i$ th coordinate is $c$. For each $i$, the $H_{c}^{i}$ are disjoint so $D^{i}=\left\{c: P\left(X \in H_{c}^{i}\right)>0\right\}$ is at most countable. It is easy to see that if $x$ has $x_{i} \notin D^{i}$ for all $i$ then $F$ is continuous at $x$. This gives us more than enough points to reconstruct $F$.
Theorem 3.10.2. On $\mathbf{R}^{d}$ weak convergence defined in terms of convergence of distribution $F_{n} \Rightarrow F$ is equivalent to notion of weak convergence defined for a general metric spce.
Proof. (v) implies $F_{n} \Rightarrow$ : If $F$ is continuous at $x$, then $A=\left(-\infty, x_{1}\right] \times \ldots \times\left(-\infty, x_{d}\right]$ has $\mu(\partial A)=0$, so $F_{n}(x)=P\left(X_{n} \in A\right) \rightarrow P\left(X_{\infty} \in A\right)= F(x)$.
$F_{N} \Rightarrow F$ implies (iv): Let $D^{i}=\left\{c: P\left(X_{\infty} \in H_{c}^{i}\right)>0\right\}$ where $H_{c}^{i}= \left\{x: x^{i}=c\right\}$. We say a rectangle $A=\left(a_{1}, b_{1}\right] \times \ldots \times\left(a_{d}, b_{d}\right]$ is good if $a_{i}$, $b_{i} \notin D^{i}$ for all $i$. ( ⇒ ) implies that for all good rectangles $P\left(X_{n} \in A\right) \rightarrow P\left(X_{\infty} \in A\right)$. This is also true for $B$ that are a finite disjoint union of good rectangles. Now any open set $G$ is an increasing limit of $B_{k}$ 's that are a finite disjoint union of good rectangles, so

$$
\liminf _{n \rightarrow \infty} P\left(X_{n} \in G\right) \geq \liminf _{n \rightarrow \infty} P\left(X_{n} \in B_{k}\right)=P\left(X_{\infty} \in B_{k}\right) \uparrow P\left(X_{\infty} \in G\right)
$$

as $k \rightarrow \infty$. The proof is complete.

Remark. In Section 3.2, we proved that (i)-(v) are consequences of weak convergence by constructing r.v's with the given distributions so that $X_{n} \rightarrow X_{\infty}$ a.s. This can be done in $\mathbf{R}^{d}$ (or any complete separable metric space), but the construction is rather messy. See Billingsley (1979), p. 337-340 for a proof in $\mathbf{R}^{d}$.

A sequence of probability measures $\mu_{n}$ is said to be tight if for any $\epsilon>0$, there is an $M$ so that $\liminf _{n \rightarrow \infty} \mu_{n}\left([-M, M]^{d}\right) \geq 1-\epsilon$.

Theorem 3.10.3. If $\mu_{n}$ is tight, then there is a weakly convergent subsequence.

Proof. Let $F_{n}$ be the associated distribution functions, and let $q_{1}, q_{2}, \ldots$ be an enumeration of $\mathbf{Q}^{d}=$ the points in $\mathbf{R}^{d}$ with rational coordinates. By a diagonal argument like the one in the proof of Theorem 3.2.12, we can pick a subsequence so that $F_{n(k)}(q) \rightarrow G(q)$ for all $q \in \mathbf{Q}^{d}$. Let

$$
F(x)=\inf \left\{G(q): q \in \mathbf{Q}^{d}, q>x\right\}
$$

where $q>x$ means $q_{i}>x_{i}$ for all $i$. It is easy to see that $F$ is right continuous. To check that it is a distribution function, we observe that if $A$ is a rectangle with vertices in $\mathrm{Q}^{d}$ then $\Delta_{A} F_{n} \geq 0$ for all $n$, so $\Delta_{A} G \geq 0$, and taking limits we see that the last conclusion holds for $F$ for all rectangles $A$. Tightness implies that $F$ has properties (i) and (ii) of a distribution $F$. We leave it to the reader to check that $F_{n} \Rightarrow F$. The proof of Theorem 3.2.12 works if you read inequalities such as $r_{1}<r_{2}<x<s$ as the corresponding relations between vectors.

The characteristic function of $\left(X_{1}, \ldots, X_{d}\right)$ is $\varphi(t)=E \exp (i t \cdot X)$ where $t \cdot X=t_{1} X_{1}+\cdots+t_{d} X_{d}$ is the usual dot product of two vectors.

Theorem 3.10.4. Inversion formula. If $A=\left[a_{1}, b_{1}\right] \times \ldots \times\left[a_{d}, b_{d}\right]$ with $\mu(\partial A)=0$ then

$$
\mu(A)=\lim _{T \rightarrow \infty}(2 \pi)^{-d} \int_{[-T, T]^{d}} \prod_{j=1}^{d} \psi_{j}\left(t_{j}\right) \varphi(t) d t
$$

where $\psi_{j}(s)=\left(\exp \left(-i s a_{j}\right)-\exp \left(-i s b_{j}\right)\right) / i s$.
Proof. Fubini's theorem implies

$$
\begin{aligned}
\int_{[-T, T]^{d}} \int \prod_{j=1}^{d} \psi_{j}\left(t_{j}\right) & \exp \left(i t_{j} x_{j}\right) \mu(d x) d t \\
= & \int \prod_{j=1}^{d} \int_{-T}^{T} \psi_{j}\left(t_{j}\right) \exp \left(i t_{j} x_{j}\right) d t_{j} \mu(d x)
\end{aligned}
$$

It follows from the proof of Theorem 3.3.11 that

$$
\int_{-T}^{T} \psi_{j}\left(t_{j}\right) \exp \left(i t_{j} x_{j}\right) d t_{j} \rightarrow \pi\left(1_{\left(a_{j}, b_{j}\right)}(x)+1_{\left[a_{j}, b_{j}\right]}(x)\right)
$$

so the desired conclusion follows from the bounded convergence theorem.

Theorem 3.10.5. Convergence theorem. Let $X_{n}, 1 \leq n \leq \infty$ be random vectors with ch.f. $\varphi_{n}$. A necessary and sufficient condition for $X_{n} \Rightarrow X_{\infty}$ is that $\varphi_{n}(t) \rightarrow \varphi_{\infty}(t)$.
Proof. $\exp (i t \cdot x)$ is bounded and continuous, so if $X_{n} \Rightarrow X_{\infty}$ then $\varphi_{n}(t) \rightarrow \varphi_{\infty}(t)$. To prove the other direction it suffices, as in the proof of Theorem 3.3.17, to prove that the sequence is tight. To do this, we observe that if we fix $\theta \in \mathbf{R}^{d}$, then for all $s \in \mathbf{R}, \varphi_{n}(s \theta) \rightarrow \varphi_{\infty}(s \theta)$, so it follows from Theorem 3.3.17, that the distributions of $\theta \cdot X_{n}$ are tight. Applying the last observation to the $d$ unit vectors $e_{1}, \ldots, e_{d}$ shows that the distributions of $X_{n}$ are tight and completes the proof.

Remark. As before, if $\varphi_{n}(t) \rightarrow \varphi_{\infty}(t)$ with $\varphi_{\infty}(t)$ continuous at 0 , then $\varphi_{\infty}(t)$ is the ch.f. of some $X_{\infty}$ and $X_{n} \Rightarrow X_{\infty}$.

Theorem 3.10.5 has an important corollary.
Theorem 3.10.6. Cramér-Wold device. A sufficient condition for $X_{n} \Rightarrow X_{\infty}$ is that $\theta \cdot X_{n} \Rightarrow \theta \cdot X_{\infty}$ for all $\theta \in \mathbf{R}^{d}$.

Proof. The indicated condition implies $E \exp \left(i \theta \cdot X_{n}\right) \rightarrow E \exp \left(i \theta \cdot X_{\infty}\right)$ for all $\theta \in \mathbf{R}^{d}$.

Theorem 3.10.6 leads immediately to
Theorem 3.10.7. The central limit theorem in $\mathbf{R}^{d}$. Let $X_{1}, X_{2}, \ldots$ be i.i.d. random vectors with $E X_{n}=\mu$, and finite covariances

$$
\Gamma_{i j}=E\left(\left(X_{n, i}-\mu_{i}\right)\left(X_{n, j}-\mu_{j}\right)\right)
$$

If $S_{n}=X_{1}+\cdots+X_{n}$ then $\left(S_{n}-n \mu\right) / n^{1 / 2} \Rightarrow \chi$, where $\chi$ has a multivariate normal distribution with mean 0 and covariance $\Gamma$, i.e.,

$$
E \exp (i \theta \cdot \chi)=\exp \left(-\sum_{i} \sum_{j} \theta_{i} \theta_{j} \Gamma_{i j} / 2\right)
$$

Proof. By considering $X_{n}^{\prime}=X_{n}-\mu$, we can suppose without loss of generality that $\mu=0$. Let $\theta \in \mathbf{R}^{d} . \theta \cdot X_{n}$ is a random variable with mean 0 and variance

$$
E\left(\sum_{i} \theta_{i} X_{n, i}\right)^{2}=\sum_{i} \sum_{j} E\left(\theta_{i} \theta_{j} X_{n, i} X_{n, j}\right)=\sum_{i} \sum_{j} \theta_{i} \theta_{j} \Gamma_{i j}
$$

so it follows from the one-dimensional central limit theorem and Theorem 3.10.6 that $S_{n} / n^{1 / 2} \Rightarrow \chi$ where

$$
E \exp (i \theta \cdot \chi)=\exp \left(-\sum_{i} \sum_{j} \theta_{i} \theta_{j} \Gamma_{i j} / 2\right)
$$

which proves the desired result.
To illustrate the use of Theorem 3.10.7, we consider two examples. In each $e_{1}, \ldots, e_{d}$ are the $d$ unit vectors.

Example 3.10.8. Simple random walk on $\mathbf{Z}^{d}$. Let $X_{1}, X_{2}, \ldots$ be i.i.d. with

$$
P\left(X_{n}=+e_{i}\right)=P\left(X_{n}=-e_{i}\right)=1 / 2 d \quad \text { for } i=1, \ldots, d
$$

$E X_{n}^{i}=0$ and if $i \neq j$ then $E X_{n}^{i} X_{n}^{j}=0$ since both components cannot be nonzero simultaneously. So the covariance matrix is $\Gamma_{i j}=(1 / 2 d) I$.

Example 3.10.9. Let $X_{1}, X_{2} \ldots$ be i.i.d. with $P\left(X_{n}=e_{i}\right)=1 / 6$ for $i=1,2, \ldots, 6$. In words, we are rolling a die and keeping track of the numbers that come up. $E X_{n, i}=1 / 6$ and $E X_{n, i} X_{n, j}=0$ for $i \neq j$, so $\Gamma_{i j}=(1 / 6)(5 / 6)$ when $i=j$ and $=-(1 / 6)^{2}$ when $i \neq j$. In this case, the limiting distribution is concentrated on $\left\{x: \sum_{i} x_{i}=0\right\}$.

Our treatment of the central limit theorem would not be complete without some discussion of the multivariate normal distribution. We begin by observing that $\Gamma_{i j}=\Gamma_{j i}$ and if $E X_{i}=0$ and $E X_{i} X_{j}=\Gamma_{i, j}$

$$
\sum_{i} \sum_{j} \theta_{i} \theta_{j} \Gamma_{i j}=E\left(\sum_{i} \theta_{i} X_{i}\right)^{2} \geq 0
$$

so $\Gamma$ is symmetric and nonnegative definite. A well-known result implies that there is an orthogonal matrix $U$ (i.e., one with $U^{t} U=I$, the identity matrix) so that $\Gamma=U^{t} V U$, where $V \geq 0$ is a diagonal matrix. Let $W$ be the nonnegative diagonal matrix with $W^{2}=V$. If we let $A=W U$, then $\Gamma=A^{t} A$. Let $Y$ be a $d$-dimensional vector whose components are independent and have normal distributions with mean 0 and variance 1 . If we view vectors as $1 \times d$ matrices and let $\chi=Y A$, then $\chi$ has the desired normal distribution. To check this, observe that

$$
\theta \cdot Y A=\sum_{i} \theta_{i} \sum_{j} Y_{j} A_{j i}
$$

has a normal distribution with mean 0 and variance

$$
\sum_{j}\left(\sum_{i} A_{j i} \theta_{i}\right)^{2}=\sum_{j}\left(\sum_{i} \theta_{i} A_{i j}^{t}\right)\left(\sum_{k} A_{j k} \theta_{k}\right)=\theta A^{t} A \theta^{t}=\theta \Gamma \theta^{t}
$$

so $E(\exp (i \theta \cdot \chi))=\exp \left(-\left(\theta \Gamma \theta^{t}\right) / 2\right)$.
If the covariance matrix has rank $d$, we say that the normal distribution is nondegenerate. In this case, its density function is given by

$$
(2 \pi)^{-d / 2}(\operatorname{det} \Gamma)^{-1 / 2} \exp \left(-\sum_{i, j} y_{i} \Gamma_{i j}^{-1} y_{j} / 2\right)
$$

The joint distribution in degenerate cases can be computed by using a linear transformation to reduce to the nondegenerate case. For instance, in Example 3.10.9 we can look at the distribution of $\left(X_{1}, \ldots, X_{5}\right)$.

Exercises
3.10.1. If $F$ is the distribution of $\left(X_{1}, \ldots, X_{d}\right)$ then $F_{i}(x)=P\left(X_{i} \leq x\right)$ are its marginal distributions. How can they be obtained from $F$ ?
3.10.2. Let $F_{1}, \ldots, F_{d}$ be distributions on $\mathbf{R}$. Show that for any $\alpha \in [-1,1]$

$$
F\left(x_{1}, \ldots, x_{d}\right)=\left\{1+\alpha \prod_{i=1}^{d}\left(1-F_{i}\left(x_{i}\right)\right)\right\} \prod_{j=1}^{d} F_{j}\left(x_{j}\right)
$$

is a d.f. with the given marginals. The case $\alpha=0$ corresponds to independent r.v.'s.
3.10.3. A distribution $F$ is said to have a density $f$ if

$$
F\left(x_{1}, \ldots, x_{k}\right)=\int_{-\infty}^{x_{1}} \ldots \int_{-\infty}^{x_{k}} f(y) d y_{k} \ldots d y_{1}
$$

Show that if $f$ is continuous, $\partial^{k} F / \partial x_{1} \ldots \partial x_{k}=f$.
3.10.4. Let $X_{n}$ be random vectors. Show that if $X_{n} \Rightarrow X$ then the coordinates $X_{n, i} \Rightarrow X_{i}$.
3.10.5. Let $\varphi$ be the ch.f. of a distribution $F$ on $\mathbf{R}$. What is the distribution on $\mathbf{R}^{d}$ that corresponds to the ch.f. $\psi\left(t_{1}, \ldots, t_{d}\right)=\varphi\left(t_{1}+\cdots+t_{d}\right)$ ?
3.10.6. Show that random variables $X_{1}, \ldots, X_{k}$ are independent if and only if

$$
\varphi_{X_{1}, \ldots X_{k}}(t)=\prod_{j=1}^{k} \varphi_{X_{j}}\left(t_{j}\right)
$$

3.10.7. Suppose $\left(X_{1}, \ldots, X_{d}\right)$ has a multivariate normal distribution with mean vector $\theta$ and covariance $\Gamma$. Show $X_{1}, \ldots, X_{d}$ are independent if and only if $\Gamma_{i j}=0$ for $i \neq j$. In words, uncorrelated random variables with a joint normal distribution are independent.
3.10.8. Show that ( $X_{1}, \ldots, X_{d}$ ) has a multivariate normal distribution with mean vector $\theta$ and covariance $\Gamma$ if and only if every linear combination $c_{1} X_{1}+\cdots+c_{d} X_{d}$ has a normal distribution with mean $c \theta^{t}$ and variance $c \Gamma c^{t}$.

## Chapter 4

## Martingales

A martingale $X_{n}$ can be thought of as the fortune at time $n$ of a player who is betting on a fair game; submartingales (supermartingales) as the outcome of betting on a favorable (unfavorable) game. There are two basic facts about martingales. The first is that you cannot make money betting on them (see Theorem 4.2.8), and in particular if you choose to stop playing at some bounded time $N$ then your expected winnings $E X_{N}$ are equal to your initial fortune $X_{0}$. (We are supposing for the moment that $X_{0}$ is not random.) Our second fact, Theorem 4.2.11, concerns submartingales. To use a heuristic we learned from Mike Brennan, "They are the stochastic analogues of nondecreasing sequences and so if they are bounded above (to be precise, $\sup _{n} E X_{n}^{+}<\infty$ ) they converge almost surely." As the material in Section 4.3 shows, this result has diverse applications. Later sections give sufficient conditions for martingales to converge in $L^{p}, p>1$ (Section 4.4) and in $L^{1}$ (Section 4.6); study the special case of square integrable martingales (Section 4.5); and consider martingales indexed by $n \leq 0$ (Section 4.7). We give sufficient conditions for $E X_{N}=E X_{0}$ to hold for unbounded stopping times (Section 4.8). These results are quite useful for studying the behavior of random walks. Section 4.9 complements the random walk results derived from martingale arguments in Section 4.8.1 by giving combinatorial arguments.

### 4.1 Conditional Expectation

We begin with a definition that is important for this chapter and the next one. After giving the definition, we will consider several examples to explain it. Given are a probability space ( $\Omega$, $\mathcal{F}_{o}, P$ ), a $\sigma$-field $\mathcal{F} \subset \mathcal{F}_{o}$, and a random variable $X \in \mathcal{F}_{o}$ with $E|X|<\infty$. We define the conditional expectation of $X$ given $\mathcal{F}, E(X \mid \mathcal{F})$, to be any random variable $Y$ that has
(i) $Y \in \mathcal{F}$, i.e., is $\mathcal{F}$ measurable
(ii) for all $A \in \mathcal{F}, \int_{A} X d P=\int_{A} Y d P$

Any $Y$ satisfying (i) and (ii) is said to be a version of $E(X \mid \mathcal{F})$. The first thing to be settled is that the conditional expectation exists and is unique. We tackle the second claim first but start with a technical point.

Lemma 4.1.1. If $Y$ satisfies (i) and (ii), then it is integrable.
Proof. Letting $A=\{Y>0\} \in \mathcal{F}$, using (ii) twice, and then adding

$$
\begin{aligned}
& \int_{A} Y d P=\int_{A} X d P \leq \int_{A}|X| d P \\
& \int_{A^{c}}-Y d P=\int_{A^{c}}-X d P \leq \int_{A^{c}}|X| d P
\end{aligned}
$$

So we have $E|Y| \leq E|X|$.
Uniqueness. If $Y^{\prime}$ also satisfies (i) and (ii) then

$$
\int_{A} Y d P=\int_{A} Y^{\prime} d P \quad \text { for all } A \in \mathcal{F}
$$

Taking $A=\left\{Y-Y^{\prime} \geq \epsilon>0\right\}$, we see

$$
0=\int_{A} X-X d P=\int_{A} Y-Y^{\prime} d P \geq \epsilon P(A)
$$

so $P(A)=0$. Since this holds for all $\epsilon$ we have $Y \leq Y^{\prime}$ a.s., and interchanging the roles of $Y$ and $Y^{\prime}$, we have $Y=Y^{\prime}$ a.s. Technically, all equalities such as $Y=E(X \mid \mathcal{F})$ should be written as $Y=E(X \mid \mathcal{F})$ a.s., but we have ignored this point in previous chapters and will continue to do so.

Repeating the last argument gives
Theorem 4.1.2. If $X_{1}=X_{2}$ on $B \in \mathcal{F}$ then $E\left(X_{1} \mid \mathcal{F}\right)=E\left(X_{2} \mid \mathcal{F}\right)$ a.s. on $B$.

Proof. Let $Y_{1}=E\left(X_{1} \mid \mathcal{F}\right)$ and $Y_{2}=E\left(X_{2} \mid \mathcal{F}\right)$. Taking $A=\left\{Y_{1}-Y_{2} \geq\right. \epsilon>0\}$, we see

$$
0=\int_{A \cap B} X_{1}-X_{2} d P=\int_{A \cap B} Y_{1}-Y_{2} d P \geq \epsilon P(A)
$$

so $P(A)=0$, and the conclusion follows as before.
Existence. To start, we recall $\nu$ is said to be absolutely continuous with respect to $\mu$ (abbreviated $\nu \ll \mu$ ) if $\mu(A)=0$ implies $\nu(A)=0$, and we use Theorem A.4.8:

Radon-Nikodym Theorem. Let $\mu$ and $\nu$ be $\sigma$-finite measures on $(\Omega, \mathcal{F})$. If $\nu \ll \mu$, there is a function $f \in \mathcal{F}$ so that for all $A \in \mathcal{F}$

$$
\int_{A} f d \mu=\nu(A)
$$

$f$ is usually denoted $d \nu / d \mu$ and called the Radon-Nikodym derivative.
The last theorem easily gives the existence of conditional expectation. Suppose first that $X \geq 0$. Let $\mu=P$ and

$$
\nu(A)=\int_{A} X d P \quad \text { for } A \in \mathcal{F}
$$

The dominated convergence theorem implies $\nu$ is a measure (see Exercise 1.5.4) and the definition of the integral implies $\nu \ll \mu$. The RadonNikodym derivative $d \nu / d \mu \in \mathcal{F}$ and for any $A \in \mathcal{F}$ has

$$
\int_{A} X d P=\nu(A)=\int_{A} \frac{d \nu}{d \mu} d P
$$

Taking $A=\Omega$, we see that $d \nu / d \mu \geq 0$ is integrable, and we have shown that $d \nu / d \mu$ is a version of $E(X \mid \mathcal{F})$.

To treat the general case now, write $X=X^{+}-X^{-}$, let $Y_{1}=E\left(X^{+} \mid \mathcal{F}\right)$ and $Y_{2}=E\left(X^{-} \mid \mathcal{F}\right)$. Now $Y_{1}-Y_{2} \in \mathcal{F}$ is integrable, and for all $A \in \mathcal{F}$ we have

$$
\begin{aligned}
\int_{A} X d P & =\int_{A} X^{+} d P-\int_{A} X^{-} d P \\
& =\int_{A} Y_{1} d P-\int_{A} Y_{2} d P=\int_{A}\left(Y_{1}-Y_{2}\right) d P
\end{aligned}
$$

This shows $Y_{1}-Y_{2}$ is a version of $E(X \mid \mathcal{F})$ and completes the proof.

### 4.1.1 Examples

Intuitively, we think of $\mathcal{F}$ as describing the information we have at our disposal - for each $A \in \mathcal{F}$, we know whether or not $A$ has occurred. $E(X \mid \mathcal{F})$ is then our "best guess" of the value of $X$ given the information we have. Some examples should help to clarify this and connect $E(X \mid \mathcal{F})$ with other definitions of conditional expectation.

Example 4.1.3. If $X \in \mathcal{F}$, then $E(X \mid \mathcal{F})=X$; i.e., if we know $X$ then our "best guess" is $X$ itself. Since $X$ always satisfies (ii), the only thing that can keep $X$ from being $E(X \mid \mathcal{F})$ is condition (i). A special case of this example is $X=c$, where $c$ is a constant.

Example 4.1.4. At the other extreme from perfect information is no information. Suppose $X$ is independent of $\mathcal{F}$, i.e., for all $B \in \mathcal{R}$ and $A \in \mathcal{F}$

$$
P(\{X \in B\} \cap A)=P(X \in B) P(A)
$$

We claim that, in this case, $E(X \mid \mathcal{F})=E X$; i.e., if you don't know anything about $X$, then the best guess is the mean $E X$. To check the definition, note that $E X \in \mathcal{F}$ so (i) holds. To verify (ii), we observe that if $A \in \mathcal{F}$ then since $X$ and $1_{A} \in \mathcal{F}$ are independent, Theorem 2.1.13 implies

$$
\int_{A} X d P=E\left(X 1_{A}\right)=E X E 1_{A}=\int_{A} E X d P
$$

The reader should note that here and in what follows the game is "guess and verify." We come up with a formula for the conditional expectation and then check that it satisfies (i) and (ii).
Example 4.1.5. In this example, we relate the new definition of conditional expectation to the first one taught in an undergraduate probability course. Suppose $\Omega_{1}, \Omega_{2}, \ldots$ is a finite or infinite partition of $\Omega$ into disjoint sets, each of which has positive probability, and let $\mathcal{F}=\sigma\left(\Omega_{1}, \Omega_{2}, \ldots\right)$ be the $\sigma$-field generated by these sets. Then

$$
E(X \mid \mathcal{F})=\frac{E\left(X ; \Omega_{i}\right)}{P\left(\Omega_{i}\right)} \quad \text { on } \Omega_{i}
$$

In words, the information in $\Omega_{i}$ tells us which element of the partition our outcome lies in and given this information, the best guess for $X$ is the average value of $X$ over $\Omega_{i}$. To prove our guess is correct, observe that the proposed formula is constant on each $\Omega_{i}$, so it is measurable with respect to $\mathcal{F}$. To verify (ii), it is enough to check the equality for $A=\Omega_{i}$, but this is trivial:

$$
\int_{\Omega_{i}} \frac{E\left(X ; \Omega_{i}\right)}{P\left(\Omega_{i}\right)} d P=E\left(X ; \Omega_{i}\right)=\int_{\Omega_{i}} X d P
$$

A degenerate but important special case is $\mathcal{F}=\{\emptyset, \Omega\}$, the trivial $\sigma$-field. In this case, $E(X \mid \mathcal{F})=E X$.

To continue the connection with undergraduate notions, let

$$
\begin{aligned}
P(A \mid \mathcal{G}) & =E\left(1_{A} \mid \mathcal{G}\right) \\
P(A \mid B) & =P(A \cap B) / P(B)
\end{aligned}
$$

and observe that in the last example $P(A \mid \mathcal{F})=P\left(A \mid \Omega_{i}\right)$ on $\Omega_{i}$.
The definition of conditional expectation given a $\sigma$-field contains conditioning on a random variable as a special case. We define

$$
E(X \mid Y)=E(X \mid \sigma(Y))
$$

where $\sigma(Y)$ is the $\sigma$-field generated by $Y$.

Example 4.1.6. To continue making connection with definitions of conditional expectation from undergraduate probability, suppose $X$ and $Y$ have joint density $f(x, y)$, i.e.,

$$
P((X, Y) \in B)=\int_{B} f(x, y) d x d y \quad \text { for } B \in \mathcal{R}^{2}
$$

and suppose for simplicity that $\int f(x, y) d x>0$ for all $y$. We claim that in this case, if $E|g(X)|<\infty$ then $E(g(X) \mid Y)=h(Y)$, where

$$
h(y)=\int g(x) f(x, y) d x / \int f(x, y) d x
$$

To "guess" this formula, note that treating the probability densities $P(Y=y)$ as if they were real probabilities

$$
P(X=x \mid Y=y)=\frac{P(X=x, Y=y)}{P(Y=y)}=\frac{f(x, y)}{\int f(x, y) d x}
$$

so, integrating against the conditional probability density, we have

$$
E(g(X) \mid Y=y)=\int g(x) P(X=x \mid Y=y) d x
$$

To "verify" the proposed formula now, observe $h(Y) \in \sigma(Y)$ so (i) holds. To check (ii), observe that if $A \in \sigma(Y)$ then $A=\{\omega: Y(\omega) \in B\}$ for some $B \in \mathcal{R}$, so

$$
\begin{aligned}
E(h(Y) ; A) & =\int_{B} \int h(y) f(x, y) d x d y=\int_{B} \int g(x) f(x, y) d x d y \\
& =E\left(g(X) 1_{B}(Y)\right)=E(g(X) ; A)
\end{aligned}
$$

Remark. To drop the assumption that $\int f(x, y) d x>0$, define $h$ by

$$
h(y) \int f(x, y) d x=\int g(x) f(x, y) d x
$$

(i.e., $h$ can be anything where $\int f(x, y) d x=0$ ), and observe this is enough for the proof.

Example 4.1.7. Suppose $X$ and $Y$ are independent. Let $\varphi$ be a function with $E|\varphi(X, Y)|<\infty$ and let $g(x)=E(\varphi(x, Y))$. We will now show that

$$
E(\varphi(X, Y) \mid X)=g(X)
$$

Proof. It is clear that $g(X) \in \sigma(X)$. To check (ii), note that if $A \in \sigma(X)$ then $A=\{X \in C\}$, so using the change of variables formula (Theorem
1.6.9) and the fact that the distribution of ( $X, Y$ ) is product measure (Theorem 2.1.11), then the definition of $g$, and change of variables again,

$$
\begin{aligned}
\int_{A} \varphi(X, Y) d P & =E\left\{\varphi(X, Y) 1_{C}(X)\right\} \\
& =\iint \phi(x, y) 1_{C}(x) \nu(d y) \mu(d x) \\
& =\int 1_{C}(x) g(x) \mu(d x)=\int_{A} g(X) d P
\end{aligned}
$$

which proves the desired result.
Example 4.1.8. Borel's paradox. Let $X$ be a randomly chosen point on the earth, let $\theta$ be its longitude, and $\varphi$ be its latitude. It is customary to take $\theta \in[0,2 \pi)$ and $\varphi \in(-\pi / 2, \pi / 2]$ but we can equally well take $\theta \in[0, \pi)$ and $\varphi \in(-\pi, \pi]$. In words, the new longitude specifies the great circle on which the point lies and then $\varphi$ gives the angle.

At first glance it might seem that if $X$ is uniform on the globe then $\theta$ and the angle $\varphi$ on the great circle should both be uniform over their possible values. $\theta$ is uniform but $\varphi$ is not. The paradox completely evaporates once we realize that in the new or in the traditional formulation $\varphi$ is independent of $\theta$, so the conditional distribution is the unconditional one, which is not uniform since there is more land near the equator than near the North Pole.

### 4.1.2 Properties

Conditional expectation has many of the same properties that ordinary expectation does.

Theorem 4.1.9. In the first two parts we assume $E|X|, E|Y|<\infty$.
(a) Conditional expectation is linear:

$$
\begin{equation*}
E(a X+Y \mid \mathcal{F})=a E(X \mid \mathcal{F})+E(Y \mid \mathcal{F}) \tag{4.1.1}
\end{equation*}
$$

(b) If $X \leq Y$ then

$$
\begin{equation*}
E(X \mid \mathcal{F}) \leq E(Y \mid \mathcal{F}) \tag{4.1.2}
\end{equation*}
$$

(c) If $X_{n} \geq 0$ and $X_{n} \uparrow X$ with $E X<\infty$ then

$$
\begin{equation*}
E\left(X_{n} \mid \mathcal{F}\right) \uparrow E(X \mid \mathcal{F}) \tag{4.1.3}
\end{equation*}
$$

Remark. By applying the last result to $Y_{1}-Y_{n}$, we see that if $Y_{n} \downarrow Y$ and we have $E\left|Y_{1}\right|, E|Y|<\infty$, then $E\left(Y_{n} \mid \mathcal{F}\right) \downarrow E(Y \mid \mathcal{F})$.

Proof. To prove (a), we need to check that the right-hand side is a version of the left. It clearly is $\mathcal{F}$-measurable. To check (ii), we observe that if
$A \in \mathcal{F}$ then by linearity of the integral and the defining properties of $E(X \mid \mathcal{F})$ and $E(Y \mid \mathcal{F})$,

$$
\begin{aligned}
\int_{A}\{a E(X \mid \mathcal{F})+E(Y \mid \mathcal{F})\} d P & =a \int_{A} E(X \mid \mathcal{F}) d P+\int_{A} E(Y \mid \mathcal{F}) d P \\
& =a \int_{A} X d P+\int_{A} Y d P=\int_{A} a X+Y d P
\end{aligned}
$$

which proves (4.1.1).
Using the definition

$$
\int_{A} E(X \mid \mathcal{F}) d P=\int_{A} X d P \leq \int_{A} Y d P=\int_{A} E(Y \mid \mathcal{F}) d P
$$

Letting $A=\{E(X \mid \mathcal{F})-E(Y \mid \mathcal{F}) \geq \epsilon>0\}$, we see that the indicated set has probability 0 for all $\epsilon>0$, and we have proved (4.1.2).

Let $Y_{n}=X-X_{n}$. It suffices to show that $E\left(Y_{n} \mid \mathcal{F}\right) \downarrow 0$. Since $Y_{n} \downarrow$, (4.1.2) implies $Z_{n} \equiv E\left(Y_{n} \mid \mathcal{F}\right) \downarrow$ a limit $Z_{\infty}$. If $A \in \mathcal{F}$ then

$$
\int_{A} Z_{n} d P=\int_{A} Y_{n} d P
$$

Letting $n \rightarrow \infty$, noting $Y_{n} \downarrow 0$, and using the dominated convergence theorem gives that $\int_{A} Z_{\infty} d P=0$ for all $A \in \mathcal{F}$, so $Z_{\infty} \equiv 0$.

Theorem 4.1.10. If $\varphi$ is convex and $E|X|, E|\varphi(X)|<\infty$ then

$$
\begin{equation*}
\varphi(E(X \mid \mathcal{F})) \leq E(\varphi(X) \mid \mathcal{F}) \tag{4.1.4}
\end{equation*}
$$

Proof. If $\varphi$ is linear, the result is trivial, so we will suppose $\varphi$ is not linear. We do this so that if we let $S=\{(a, b): a, b \in \mathbf{Q}, a x+b \leq \varphi(x)$ for all $x\}$, then $\varphi(x)=\sup \{a x+b:(a, b) \in S\}$. See the proof of Theorem 1.6.2 for more details. If $\varphi(x) \geq a x+b$ then (4.1.2) and (4.1.1) imply

$$
E(\varphi(X) \mid \mathcal{F}) \geq a E(X \mid \mathcal{F})+b \quad \text { a.s. }
$$

Taking the sup over $(a, b) \in S$ gives

$$
E(\varphi(X) \mid \mathcal{F}) \geq \varphi(E(X \mid \mathcal{F})) \quad \text { a.s. }
$$

which proves the desired result.
Remark. Here we have written a.s. by the inequalities to stress that there is an exceptional set for each $a, b$, so we have to take the sup over a countable set.

Theorem 4.1.11. Conditional expectation is a contraction in $L^{p}, p \geq 1$.

Proof. (4.1.4) implies $|E(X \mid \mathcal{F})|^{p} \leq E\left(|X|^{p} \mid \mathcal{F}\right)$. Taking expected values gives

$$
E\left(|E(X \mid \mathcal{F})|^{p}\right) \leq E\left(E\left(|X|^{p} \mid \mathcal{F}\right)\right)=E|X|^{p}
$$

In the last equality, we have used an identity that is an immediate consequence of the definition (use property (ii) in the definition with $A=\Omega$ ).

$$
\begin{equation*}
E(E(Y \mid \mathcal{F}))=E(Y) \tag{4.1.5}
\end{equation*}
$$

Conditional expectation also has properties, like (4.1.5), that have no analogue for "ordinary" expectation.

Theorem 4.1.12. If $\mathcal{F} \subset \mathcal{G}$ and $E(X \mid \mathcal{G}) \in \mathcal{F}$ then $E(X \mid \mathcal{F})=E(X \mid \mathcal{G})$.
Proof. By assumption $E(X \mid \mathcal{G}) \in \mathcal{F}$. To check the other part of the definition we note that if $A \in \mathcal{F} \subset \mathcal{G}$ then

$$
\int_{A} X d P=\int_{A} E(X \mid \mathcal{G}) d P
$$

Theorem 4.1.13. If $\mathcal{F}_{1} \subset \mathcal{F}_{2}$ then (i) $E\left(E\left(X \mid \mathcal{F}_{1}\right) \mid \mathcal{F}_{2}\right)=E\left(X \mid \mathcal{F}_{1}\right)$
(ii) $E\left(E\left(X \mid \mathcal{F}_{2}\right) \mid \mathcal{F}_{1}\right)=E\left(X \mid \mathcal{F}_{1}\right)$.

In words, the smaller $\sigma$-field always wins. As the proof will show, the first equality is trivial. The second is easy to prove, but in combination with Theorem 4.1.14 is a powerful tool for computing conditional expectations. I have seen it used several times to prove results that are false.

Proof. Once we notice that $E\left(X \mid \mathcal{F}_{1}\right) \in \mathcal{F}_{2}$, (i) follows from Example 4.1.3. To prove (ii), notice that $E\left(X \mid \mathcal{F}_{1}\right) \in \mathcal{F}_{1}$, and if $A \in \mathcal{F}_{1} \subset \mathcal{F}_{2}$ then

$$
\int_{A} E\left(X \mid \mathcal{F}_{1}\right) d P=\int_{A} X d P=\int_{A} E\left(X \mid \mathcal{F}_{2}\right) d P
$$

The next result shows that for conditional expectation with respect to $\mathcal{F}$, random variables $X \in \mathcal{F}$ are like constants. They can be brought outside the "integral."

Theorem 4.1.14. If $X \in \mathcal{F}$ and $E|Y|, E|X Y|<\infty$ then

$$
E(X Y \mid \mathcal{F})=X E(Y \mid \mathcal{F}) .
$$

Proof. The right-hand side $\in \mathcal{F}$, so we have to check (ii). To do this, we use the usual four-step procedure. First, suppose $X=1_{B}$ with $B \in \mathcal{F}$. In this case, if $A \in \mathcal{F}$

$$
\int_{A} 1_{B} E(Y \mid \mathcal{F}) d P=\int_{A \cap B} E(Y \mid \mathcal{F}) d P=\int_{A \cap B} Y d P=\int_{A} 1_{B} Y d P
$$

so (ii) holds. The last result extends to simple $X$ by linearity. If $X, Y \geq 0$, let $X_{n}$ be simple random variables that $\uparrow X$, and use the monotone convergence theorem to conclude that

$$
\int_{A} X E(Y \mid \mathcal{F}) d P=\int_{A} X Y d P
$$

To prove the result in general, split $X$ and $Y$ into their positive and negative parts. $\square$

Theorem 4.1.15. Suppose $E X^{2}<\infty . E(X \mid \mathcal{F})$ is the variable $Y \in \mathcal{F}$ that minimizes the "mean square error" $E(X-Y)^{2}$.

Remark. This result gives a "geometric interpretation" of $E(X \mid \mathcal{F})$. $L^{2}\left(\mathcal{F}_{o}\right)=\left\{Y \in \mathcal{F}_{o}: E Y^{2}<\infty\right\}$ is a Hilbert space, and $L^{2}(\mathcal{F})$ is a closed subspace. In this case, $E(X \mid \mathcal{F})$ is the projection of $X$ onto $L^{2}(\mathcal{F})$. That is, the point in the subspace closest to $X$.

![](https://cdn.mathpix.com/cropped/9f8e1c6c-af9c-4ae4-b3b9-8004dd64ac3c-099.jpg?height=308&width=542&top_left_y=1108&top_left_x=861)
Figure 4.1: Conditional expectation as projection in $L^{2}$.

Proof. We begin by observing that if $Z \in L^{2}(\mathcal{F})$, then Theorem 4.1.14 implies

$$
Z E(X \mid \mathcal{F})=E(Z X \mid \mathcal{F})
$$

$(E|X Z|<\infty$ by the Cauchy-Schwarz inequality.) Taking expected values gives

$$
E(Z E(X \mid \mathcal{F}))=E(E(Z X \mid \mathcal{F}))=E(Z X)
$$

or, rearranging,

$$
E[Z(X-E(X \mid \mathcal{F}))]=0 \quad \text { for } Z \in L^{2}(\mathcal{F})
$$

If $Y \in L^{2}(\mathcal{F})$ and $Z=E(X \mid \mathcal{F})-Y$ then

$$
E(X-Y)^{2}=E\{X-E(X \mid \mathcal{F})+Z\}^{2}=E\{X-E(X \mid \mathcal{F})\}^{2}+E Z^{2}
$$

since the cross-product term vanishes. From the last formula, it is easy to see $E(X-Y)^{2}$ is minimized when $Z=0$. $\square$

### 4.1.3 Regular Conditional Probabilities*

Let $(\Omega, \mathcal{F}, P)$ be a probability space, $X:(\Omega, \mathcal{F}) \rightarrow(S, \mathcal{S})$ a measurable map, and $\mathcal{G}$ a $\sigma$-field $\subset \mathcal{F} . \mu: \Omega \times \mathcal{S} \rightarrow[0,1]$ is said to be a regular conditional distribution for $X$ given $\mathcal{G}$ if
(i) For each $A, \omega \rightarrow \mu(\omega, A)$ is a version of $P(X \in A \mid \mathcal{G})$.
(ii) For a.e. $\omega, A \rightarrow \mu(\omega, A)$ is a probability measure on ( $S, \mathcal{S}$ ).

When $S=\Omega$ and $X$ is the identity map, $\mu$ is called a regular conditional probability.

Continuation of Example 4.1.6. Suppose $X$ and $Y$ have a joint density $f(x, y)>0$. If

$$
\mu(y, A)=\int_{A} f(x, y) d x / \int f(x, y) d x
$$

then $\mu(Y(\omega), A)$ is a r.c.d. for $X$ given $\sigma(Y)$.
(i) in the definition follows by taking $h=1_{A}$ in Example 4.1.1. To check (ii) note that the dominated convergence theorem implies that $A \rightarrow \mu(y, A)$ is a probability measure.

Regular conditional distributions are useful because they allow us to simultaneously compute the conditional expectation of all functions of $X$ and to generalize properties of ordinary expectation in a more straightforward way.

Theorem 4.1.16. Let $\mu(\omega, A)$ be a r.c.d. for $X$ given $\mathcal{F}$. If $f:(S, \mathcal{S}) \rightarrow (\mathbf{R}, \mathcal{R})$ has $E|f(X)|<\infty$ then

$$
E(f(X) \mid \mathcal{F})=\int \mu(\omega, d x) f(x) \quad \text { a.s. }
$$

Proof. If $f=1_{A}$ this follows from the definition. Linearity extends the result to simple $f$ and monotone convergence to nonnegative $f$. Finally we get the result in general by writing $f=f^{+}-f^{-}$.

Unfortunately, r.c.d.'s do not always exist. The first example was due to Dieudonné (1948). See Doob (1953), p. 624, or Faden (1985) for more recent developments. Without going into the details of the example, it is easy to see the source of the problem. If $A_{1}, A_{2}, \ldots$ are disjoint, then (4.1.1) and (4.1.3) imply

$$
P\left(X \in \cup_{n} A_{n} \mid \mathcal{G}\right)=\sum_{n} P\left(X \in A_{n} \mid \mathcal{G}\right) \quad \text { a.s. }
$$

but if $\mathcal{S}$ contains enough countable collections of disjoint sets, the exceptional sets may pile up. Fortunately,

Theorem 4.1.17. r.c.d.'s exist if ( $S, \mathcal{S}$ ) is nice.
Proof. By definition, there is a $1-1 \operatorname{map} \varphi: S \rightarrow \mathbf{R}$ so that $\varphi$ and $\varphi^{-1}$ are measurable. Using monotonicity (4.1.2) and throwing away a countable collection of null sets, we find there is a set $\Omega_{o}$ with $P\left(\Omega_{o}\right)=1$ and a family of random variables $G(q, \omega), q \in \mathbf{Q}$ so that $q \rightarrow G(q, \omega)$ is nondecreasing and $\omega \rightarrow G(q, \omega)$ is a version of $P(\varphi(X) \leq q \mid \mathcal{G})$. Let $F(x, \omega)=\inf \{G(q, \omega): q>x\}$. The notation may remind the reader of the proof of Theorem 3.2.12. The argument given there shows $F$ is a distribution function. Since $G\left(q_{n}, \omega\right) \downarrow F(x, \omega)$, the remark after Theorem 4.1.9 implies that $F(x, \omega)$ is a version of $P(\varphi(X) \leq x \mid \mathcal{G})$.

Now, for each $\omega \in \Omega_{o}$, there is a unique measure $\nu(\omega, \cdot)$ on $(\mathbf{R}, \mathcal{R})$ so that $\nu(\omega,(-\infty, x])=F(x, \omega)$. To check that for each $B \in \mathcal{R}, \nu(\omega, B)$ is a version of $P(\varphi(X) \in B \mid \mathcal{G})$, we observe that the class of $B$ for which this statement is true (this includes the measurability of $\omega \rightarrow \nu(\omega, B)$ ) is a $\lambda$-system that contains all sets of the form $\left(a_{1}, b_{1}\right] \cup \cdots\left(a_{k}, b_{k}\right]$ where $-\infty \leq a_{i}<b_{i} \leq \infty$, so the desired result follows from the $\pi-\lambda$ theorem. To extract the desired r.c.d., notice that if $A \in \mathcal{S}$ and $B=\varphi(A)$, then $B=\left(\varphi^{-1}\right)^{-1}(A) \in \mathcal{R}$, and set $\mu(\omega, A)=\nu(\omega, B)$.

The following generalization of Theorem 4.1.17 will be needed in Section 6.1.

Theorem 4.1.18. Suppose $X$ and $Y$ take values in a nice space ( $S, \mathcal{S}$ ) and $\mathcal{G}=\sigma(Y)$. There is a function $\mu: S \times \mathcal{S} \rightarrow[0,1]$ so that
(i) for each $A, \mu(Y(\omega), A)$ is a version of $P(X \in A \mid \mathcal{G})$
(ii) for a.e. $\omega, A \rightarrow \mu(Y(\omega), A)$ is a probability measure on ( $S, \mathcal{S}$ ).

Proof. As in the proof of Theorem 4.1.17, we find there is a set $\Omega_{o}$ with $P\left(\Omega_{o}\right)=1$ and a family of random variables $G(q, \omega), q \in \mathbf{Q}$ so that $q \rightarrow G(q, \omega)$ is nondecreasing and $\omega \rightarrow G(q, \omega)$ is a version of $P(\varphi(X) \leq q \mid \mathcal{G}$ ). Since $G(q, \omega) \in \sigma(Y)$ we can write $G(q, \omega)=H(q, Y(\omega))$. Let $F(x, y)=\inf \{G(q, y): q>x\}$. The argument given in the proof of Theorem 4.1.17 shows that there is a set $A_{0}$ with $P\left(Y \in A_{0}\right)=1$ so that when $y \in A_{0}, F$ is a distribution function and that $F(x, Y(\omega))$ is a version of $P(\varphi(X) \leq x \mid Y)$.

For each $y \in A_{o}$, there is a unique measure $\nu(y, \cdot)$ on $(\mathbf{R}, \mathcal{R})$ so that $\nu(y,(-\infty, x])=F(x, y))$. To check that for each $B \in \mathcal{R}, \nu(Y(\omega), B)$ is a version of $P(\varphi(X) \in B \mid Y)$, we observe that the class of $B$ for which this statement is true (this includes the measurability of $\omega \rightarrow \nu(Y(\omega), B)$ ) is a $\lambda$-system that contains all sets of the form $\left(a_{1}, b_{1}\right] \cup \cdots\left(a_{k}, b_{k}\right]$ where $-\infty \leq a_{i}<b_{i} \leq \infty$, so the desired result follows from the $\pi-\lambda$ theorem. To extract the desired r.c.d. notice that if $A \in \mathcal{S}$, and $B=\varphi(A)$ then $B=\left(\varphi^{-1}\right)^{-1}(A) \in \mathcal{R}$, and set $\mu(y, A)=\nu(y, B)$.

## Exercises

4.1.1. Bayes' formula. Let $G \in \mathcal{G}$ and show that

$$
P(G \mid A)=\int_{G} P(A \mid \mathcal{G}) d P / \int_{\Omega} P(A \mid \mathcal{G}) d P
$$

When $\mathcal{G}$ is the $\sigma$-field generated by a partition, this reduces to the usual Bayes' formula

$$
P\left(G_{i} \mid A\right)=P\left(A \mid G_{i}\right) P\left(G_{i}\right) / \sum_{j} P\left(A \mid G_{j}\right) P\left(G_{j}\right)
$$

4.1.2. Prove Chebyshev's inequality. If $a>0$ then

$$
P(|X| \geq a \mid \mathcal{F}) \leq a^{-2} E\left(X^{2} \mid \mathcal{F}\right)
$$

4.1.3. Imitate the proof in the remark after Theorem 1.5.2 to prove the conditional Cauchy-Schwarz inequality.

$$
E(X Y \mid \mathcal{G})^{2} \leq E\left(X^{2} \mid \mathcal{G}\right) E\left(Y^{2} \mid \mathcal{G}\right)
$$

4.1.4. Use regular conditional probability to get the conditional Hölder inequality from the unconditional one, i.e., show that if $p, q \in(1, \infty)$ with $1 / p+1 / q=1$ then

$$
E(|X Y| \mid \mathcal{G}) \leq E\left(|X|^{p} \mid \mathcal{G}\right)^{1 / p} E\left(|Y|^{q} \mid \mathcal{G}\right)^{1 / q}
$$

4.1.5. Give an example on $\Omega=\{a, b, c\}$ in which

$$
E\left(E\left(X \mid \mathcal{F}_{1}\right) \mid \mathcal{F}_{2}\right) \neq E\left(E\left(X \mid \mathcal{F}_{2}\right) \mid \mathcal{F}_{1}\right)
$$

4.1.6. Show that if $\mathcal{G} \subset \mathcal{F}$ and $E X^{2}<\infty$ then
$E\left(\{X-E(X \mid \mathcal{F})\}^{2}\right)+E\left(\{E(X \mid \mathcal{F})-E(X \mid \mathcal{G})\}^{2}\right)=E\left(\{X-E(X \mid \mathcal{G})\}^{2}\right)$
Dropping the second term on the left, we get an inequality that says geometrically, the larger the subspace the closer the projection is, or statistically, more information means a smaller mean square error.
4.1.7. An important special case of the previous result occurs when $\mathcal{G}= \{\emptyset, \Omega\}$. Let $\operatorname{var}(X \mid \mathcal{F})=E\left(X^{2} \mid \mathcal{F}\right)-E(X \mid \mathcal{F})^{2}$. Show that

$$
\operatorname{var}(X)=E(\operatorname{var}(X \mid \mathcal{F}))+\operatorname{var}(E(X \mid \mathcal{F}))
$$

4.1.8. Let $Y_{1}, Y_{2}, \ldots$ be i.i.d. with mean $\mu$ and variance $\sigma^{2}, N$ an independent positive integer valued r.v. with $E N^{2}<\infty$ and $X=Y_{1}+\cdots+Y_{N}$. Show that $\operatorname{var}(X)=\sigma^{2} E N+\mu^{2} \operatorname{var}(N)$. To understand and help remember the formula, think about the two special cases in which $N$ or $Y$ is constant.
4.1.9. Show that if $X$ and $Y$ are random variables with $E(Y \mid \mathcal{G})=X$ and $E Y^{2}=E X^{2}<\infty$, then $X=Y$ a.s.
4.1.10. The result in the last exercise implies that if $E Y^{2}<\infty$ and $E(Y \mid \mathcal{G})$ has the same distribution as $Y$, then $E(Y \mid \mathcal{G})=Y$ a.s. Prove this under the assumption $E|Y|<\infty$. Hint: The trick is to prove that $\operatorname{sgn}(X)=\operatorname{sgn}(E(X \mid \mathcal{G}))$ a.s., and then take $X=Y-c$ to get the desired result.

### 4.2 Martingales, Almost Sure Convergence

In this section we will define martingales and their cousins supermartingales and submartingales, and take the first steps in developing their theory. Let $\mathcal{F}_{n}$ be a filtration, i.e., an increasing sequence of $\sigma$-fields. A sequence $X_{n}$ is said to be adapted to $\mathcal{F}_{n}$ if $X_{n} \in \mathcal{F}_{n}$ for all $n$. If $X_{n}$ is sequence with
(i) $E\left|X_{n}\right|<\infty$,
(ii) $X_{n}$ is adapted to $\mathcal{F}_{n}$,
(iii) $E\left(X_{n+1} \mid \mathcal{F}_{n}\right)=X_{n}$ for all $n$,
then $X$ is said to be a martingale (with respect to $\mathcal{F}_{n}$ ). If in the last definition, $=$ is replaced by $\leq$ or $\geq$, then $X$ is said to be a supermartingale or submartingale, respectively.

We begin by describing three examples related to random walk. Let $\xi_{1}, \xi_{2}, \ldots$ be independent and identically distributed. Let $S_{n}=S_{0}+\xi_{1}+ \cdots+\xi_{n}$ where $S_{0}$ is a constant. Let $\mathcal{F}_{n}=\sigma\left(\xi_{1}, \ldots, \xi_{n}\right)$ for $n \geq 1$ and take $\mathcal{F}_{0}=\{\emptyset, \Omega\}$.

Example 4.2.1. Linear martingale. If $\mu=E \xi_{i}=0$ then $S_{n}, n \geq 0$, is a martingale with respect to $\mathcal{F}_{n}$.
To prove this, we observe that $S_{n} \in \mathcal{F}_{n}, E\left|S_{n}\right|<\infty$, and $\xi_{n+1}$ is independent of $\mathcal{F}_{n}$, so using the linearity of conditional expectation, (4.1.1), and Example 4.1.4,

$$
E\left(S_{n+1} \mid \mathcal{F}_{n}\right)=E\left(S_{n} \mid \mathcal{F}_{n}\right)+E\left(\xi_{n+1} \mid \mathcal{F}_{n}\right)=S_{n}+E \xi_{n+1}=S_{n}
$$

If $\mu \leq 0$ then the computation just completed shows $E\left(X_{n+1} \mid \mathcal{F}_{n}\right) \leq X_{n}$, i.e., $X_{n}$ is a supermartingale. In this case, $X_{n}$ corresponds to betting on an unfavorable game so there is nothing "super" about a supermartingale. The name comes from the fact that if $f$ is superharmonic (i.e., $f$ has continuous derivatives of order $\leq 2$ and $\partial^{2} f / \partial x_{1}^{2}+\cdots+\partial^{2} f / \partial x_{d}^{2} \leq 0$ ), then

$$
\begin{equation*}
f(x) \geq \frac{1}{|B(x, r)|} \int_{B(x, r)} f(y) d y \tag{4.2.1}
\end{equation*}
$$

where $B(x, r)=\{y:|x-y| \leq r\}$ is the ball of radius $r$, and $|B(x, r)|$ is the volume of the ball.

If $\mu \geq 0$ then $S_{n}$ is a submartingale. Applying the first result to $\xi_{i}^{\prime}=\xi_{i}-\mu$ we see that $S_{n}-n \mu$ is a martingale.

Example 4.2.2. Quadratic martingale. Suppose now that $\mu=E \xi_{i}=$ 0 and $\sigma^{2}=\operatorname{var}\left(\xi_{i}\right)<\infty$. In this case $S_{n}^{2}-n \sigma^{2}$ is a martingale.
Since $\left(S_{n}+\xi_{n+1}\right)^{2}=S_{n}^{2}+2 S_{n} \xi_{n+1}+\xi_{n+1}^{2}$ and $\xi_{n+1}$ is independent of $\mathcal{F}_{n}$, we have

$$
\begin{aligned}
E\left(S_{n+1}^{2}-(n+1) \sigma^{2} \mid \mathcal{F}_{n}\right) & =S_{n}^{2}+2 S_{n} E\left(\xi_{n+1} \mid \mathcal{F}_{n}\right)+E\left(\xi_{n+1}^{2} \mid \mathcal{F}_{n}\right)-(n+1) \sigma^{2} \\
& =S_{n}^{2}+0+\sigma^{2}-(n+1) \sigma^{2}=S_{n}^{2}-n \sigma^{2}
\end{aligned}
$$

Example 4.2.3. Exponential martingale. Let $Y_{1}, Y_{2}, \ldots$ be nonnegative i.i.d. random variables with $E Y_{m}=1$. If $\mathcal{F}_{n}=\sigma\left(Y_{1}, \ldots, Y_{n}\right)$ then $M_{n}=\prod_{m \leq n} Y_{m}$ defines a martingale. To prove this note that

$$
E\left(M_{n+1} \mid \mathcal{F}_{n}\right)=M_{n} E\left(X_{n+1} \mid \mathcal{F}_{n}\right)=Y_{n}
$$

Suppose now that $Y_{i}=e^{\theta \xi_{i}}$ and $\phi(\theta)=E e^{\theta \xi_{i}}<\infty . Y_{i}=\exp (\theta \xi) / \phi(\theta)$ has mean 1 so $E Y_{i}=1$ and

$$
M_{n}=\prod_{i=1}^{n} Y_{i}=\exp \left(\theta S_{n}\right) / \phi(\theta)^{n} \quad \text { is a martingale. }
$$

We will see many other examples below, so we turn now to deriving properties of martingales. Our first result is an immediate consequence of the definition of a supermartingale. We could take the conclusion of the result as the definition of supermartingale, but then the definition would be harder to check.

Theorem 4.2.4. If $X_{n}$ is a supermartingale then for $n>m, E\left(X_{n} \mid \mathcal{F}_{m}\right) \leq X_{m}$.

Proof. The definition gives the result for $n=m+1$. Suppose $n=m+k$ with $k \geq 2$. By Theorem 4.1.2,

$$
E\left(X_{m+k} \mid \mathcal{F}_{m}\right)=E\left(E\left(X_{m+k} \mid \mathcal{F}_{m+k-1}\right) \mid \mathcal{F}_{m}\right) \leq E\left(X_{m+k-1} \mid \mathcal{F}_{m}\right)
$$

by the definition and (4.1.2). The desired result now follows by induction.

Theorem 4.2.5. (i) If $X_{n}$ is a submartingale then for $n>m, E\left(X_{n} \mid \mathcal{F}_{m}\right) \geq X_{m}$.
(ii) If $X_{n}$ is a martingale then for $n>m, E\left(X_{n} \mid \mathcal{F}_{m}\right)=X_{m}$.

Proof. To prove (i), note that $-X_{n}$ is a supermartingale and use (4.1.1). For (ii), observe that $X_{n}$ is a supermartingale and a submartingale.

Remark. The idea in the proof of Theorem 4.2.5 will be used many times below. To keep from repeating ourselves, we will just state the result for either supermartingales or submartingales and leave it to the reader to translate the result for the other two.

Theorem 4.2.6. If $X_{n}$ is a martingale w.r.t. $\mathcal{F}_{n}$ and $\varphi$ is a convex function with $E\left|\varphi\left(X_{n}\right)\right|<\infty$ for all $n$ then $\varphi\left(X_{n}\right)$ is a submartingale w.r.t. $\mathcal{F}_{n}$. Consequently, if $p \geq 1$ and $E\left|X_{n}\right|^{p}<\infty$ for all $n$, then $\left|X_{n}\right|^{p}$ is a submartingale w.r.t. $\mathcal{F}_{n}$.
Proof By Jensen's inequality and the definition

$$
E\left(\varphi\left(X_{n+1}\right) \mid \mathcal{F}_{n}\right) \geq \varphi\left(E\left(X_{n+1} \mid \mathcal{F}_{n}\right)\right)=\varphi\left(X_{n}\right)
$$

Theorem 4.2.7. If $X_{n}$ is a submartingale w.r.t. $\mathcal{F}_{n}$ and $\varphi$ is an increasing convex function with $E\left|\varphi\left(X_{n}\right)\right|<\infty$ for all $n$, then $\varphi\left(X_{n}\right)$ is a submartingale w.r.t. $\mathcal{F}_{n}$. Consequently (i) If $X_{n}$ is a submartingale then $\left(X_{n}-a\right)^{+}$is a submartingale. (ii) If $X_{n}$ is a supermartingale then $X_{n} \wedge a$ is a supermartingale.

Proof By Jensen's inequality and the assumptions

$$
E\left(\varphi\left(X_{n+1}\right) \mid \mathcal{F}_{n}\right) \geq \varphi\left(E\left(X_{n+1} \mid \mathcal{F}_{n}\right)\right) \geq \varphi\left(X_{n}\right)
$$

Let $\mathcal{F}_{n}, n \geq 0$ be a filtration. $H_{n}, n \geq 1$ is said to be a predictable sequence if $H_{n} \in \mathcal{F}_{n-1}$ for all $n \geq 1$. In words, the value of $H_{n}$ may be predicted (with certainty) from the information available at time $n-1$. In this section, we will be thinking of $H_{n}$ as the amount of money a gambler will bet at time $n$. This can be based on the outcomes at times $1, \ldots, n-1$ but not on the outcome at time $n!$

Once we start thinking of $H_{n}$ as a gambling system, it is natural to ask how much money we would make if we used it. Let $X_{n}$ be the net amount of money you would have won at time $n$ if you had bet one dollar each time. If you bet according to a gambling system $H$ then your winnings at time $n$ would be

$$
(H \cdot X)_{n}=\sum_{m=1}^{n} H_{m}\left(X_{m}-X_{m-1}\right)
$$

since if at time $m$ you have wagered $\$ 3$ the change in your fortune would be 3 time that of a person who wagered $\$ 1$. Alternatively you can think of $X_{m}$ is the value of a stock and $H_{m}$ the number of shares you hold from time $m-1$ to time $m$.

Suppose now that $\xi_{m}=X_{m}-X_{m-1}$ have $P\left(\xi_{m}=1\right)=p$ and $P\left(\xi_{m}=\right. -1)=1-p$. A famous gambling system called the "martingale" is defined by $H_{1}=1$ and for $n \geq 2$,

$$
H_{n}= \begin{cases}2 H_{n-1} & \text { if } \xi_{n-1}=-1 \\ 1 & \text { if } \xi_{n-1}=1\end{cases}
$$

In words, we double our bet when we lose, so that if we lose $k$ times and then win, our net winnings will be 1 . To see this consider the following concrete situation

$$
\begin{array}{cccccc}
H_{n} & 1 & 2 & 4 & 8 & 16 \\
\xi_{n} & -1 & -1 & -1 & -1 & 1 \\
(H \cdot X)_{n} & -1 & -3 & -7 & -15 & 1
\end{array}
$$

This system seems to provide us with a "sure thing" as long as $P\left(\xi_{m}=\right. 1)>0$. However, the next result says there is no system for beating an unfavorable game.

Theorem 4.2.8. Let $X_{n}, n \geq 0$, be a supermartingale. If $H_{n} \geq 0$ is predictable and each $H_{n}$ is bounded then $(H \cdot X)_{n}$ is a supermartingale.

Proof. Using the fact that conditional expectation is linear, $(H \cdot X)_{n} \in \mathcal{F}_{n}, H_{n} \in \mathcal{F}_{n-1}$, and (4.1.14), we have

$$
\begin{aligned}
E\left((H \cdot X)_{n+1} \mid \mathcal{F}_{n}\right) & =(H \cdot X)_{n}+E\left(H_{n+1}\left(X_{n+1}-X_{n}\right) \mid \mathcal{F}_{n}\right) \\
& =(H \cdot X)_{n}+H_{n+1} E\left(\left(X_{n+1}-X_{n}\right) \mid \mathcal{F}_{n}\right) \leq(H \cdot X)_{n}
\end{aligned}
$$

since $E\left(\left(X_{n+1}-X_{n}\right) \mid \mathcal{F}_{n}\right) \leq 0$ and $H_{n+1} \geq 0$.
Remark. The same result is obviously true for submartingales and for martingales (in the last case, without the restriction $H_{n} \geq 0$ ).

We will now consider a very special gambling system: bet $\$ 1$ ar each time $n \leq N$ then stop playing. A random variable $N$ is said to be a stopping time if $\{N=n\} \in \mathcal{F}_{n}$ for all $n<\infty$, i.e., the decision to stop at time $n$ must be measurable with respect to the information known at that time. If we let $H_{n}=1_{\{N \geq n\}}$, then $\{N \geq n\}=\{N \leq n-1\}^{c} \in \mathcal{F}_{n-1}$, so $H_{n}$ is predictable, and it follows from Theorem 4.2.8 that $(H \cdot X)_{n}= X_{N \wedge n}-X_{0}$ is a supermartingale. Since the constant sequence $Y_{n}=X_{0}$ is a supermartingale and the sum of two supermartingales is also, we have:

Theorem 4.2.9. If $N$ is a stopping time and $X_{n}$ is a supermartingale, then $X_{N \wedge n}$ is a supermartingale.

Although Theorem 4.2.8 implies that you cannot make money with gambling systems, you can prove theorems with them. Suppose $X_{n}$, $n \geq 0$, is a submartingale. Let $a<b$, let $N_{0}=-1$, and for $k \geq 1$ let

$$
\begin{aligned}
N_{2 k-1} & =\inf \left\{m>N_{2 k-2}: X_{m} \leq a\right\} \\
N_{2 k} & =\inf \left\{m>N_{2 k-1}: X_{m} \geq b\right\}
\end{aligned}
$$

The $N_{j}$ are stopping times and $\left\{N_{2 k-1}<m \leq N_{2 k}\right\}=\left\{N_{2 k-1} \leq m-\right. 1\} \cap\left\{N_{2 k} \leq m-1\right\}^{c} \in \mathcal{F}_{m-1}$, so

$$
H_{m}= \begin{cases}1 & \text { if } N_{2 k-1}<m \leq N_{2 k} \text { for some } k \\ 0 & \text { otherwise }\end{cases}
$$

defines a predictable sequence. $X\left(N_{2 k-1}\right) \leq a$ and $X\left(N_{2 k}\right) \geq b$, so between times $N_{2 k-1}$ and $N_{2 k}, X_{m}$ crosses from below $a$ to above $b . H_{m}$ is a gambling system that tries to take advantage of these "upcrossings." In stock market terms, we buy when $X_{m} \leq a$ and sell when $X_{m} \geq b$, so every time an upcrossing is completed, we make a profit of $\geq(b-a)$. Finally, $U_{n}=\sup \left\{k: N_{2 k} \leq n\right\}$ is the number of upcrossings completed by time $n$.

![](https://cdn.mathpix.com/cropped/9f8e1c6c-af9c-4ae4-b3b9-8004dd64ac3c-107.jpg?height=351&width=640&top_left_y=726&top_left_x=794)
Figure 4.2: Upcrossings of $(a, b)$. Lines indicate increments that are included in $(H \cdot X)_{n}$. In $Y_{n}$ the points $<a$ are moved up to $a$.

Theorem 4.2.10. Upcrossing inequality. If $X_{m}, m \geq 0$, is a submartingale then

$$
(b-a) E U_{n} \leq E\left(X_{n}-a\right)^{+}-E\left(X_{0}-a\right)^{+}
$$

Proof. Let $Y_{m}=a+\left(X_{m}-a\right)^{+}$. By Theorem 4.2.7, $Y_{m}$ is a submartingale. Clearly, it upcrosses $[a, b]$ the same number of times that $X_{m}$ does, and we have $(b-a) U_{n} \leq(H \cdot Y)_{n}$, since each upcrossing results in a profit $\geq(b-a)$ and a final incomplete upcrossing (if there is one) makes a nonnegative contribution to the right-hand side. It is for this reason we had to replace $X_{m}$ by $Y_{m}$.

Let $K_{m}=1-H_{m}$. Clearly, $Y_{n}-Y_{0}=(H \cdot Y)_{n}+(K \cdot Y)_{n}$, and it follows from Theorem 4.2.8 that $E(K \cdot Y)_{n} \geq E(K \cdot Y)_{0}=0$ so $E(H \cdot Y)_{n} \leq E\left(Y_{n}-Y_{0}\right)$, proving the desired inequality. $\square$

We have proved the result in its classical form, even though this is a little misleading. The key fact is that $E(K \cdot Y)_{n} \geq 0$, i.e., no matter how hard you try you can't lose money betting on a submartingale. From the upcrossing inequality, we easily get

Theorem 4.2.11. Martingale convergence theorem. If $X_{n}$ is a submartingale with $\sup E X_{n}^{+}<\infty$ then as $n \rightarrow \infty, X_{n}$ converges a.s. to a limit $X$ with $E|X|<\infty$.

Proof. Since $(X-a)^{+} \leq X^{+}+|a|$, Theorem 4.2.10 implies that

$$
E U_{n} \leq\left(|a|+E X_{n}^{+}\right) /(b-a)
$$

As $n \uparrow \infty, U_{n} \uparrow U$ the number of upcrossings of $[a, b]$ by the whole sequence, so if $\sup E X_{n}^{+}<\infty$ then $E U<\infty$ and hence $U<\infty$ a.s. Since the last conclusion holds for all rational $a$ and $b$,

$$
\cup_{a, b \in \mathbf{Q}}\left\{\lim \inf X_{n}<a<b<\lim \sup X_{n}\right\} \quad \text { has probability } 0
$$

and hence $\limsup X_{n}=\liminf X_{n}$ a.s., i.e., $\lim X_{n}$ exists a.s. Fatou's lemma guarantees $E X^{+} \leq \liminf E X_{n}^{+}<\infty$, so $X<\infty$ a.s. To see $X>-\infty$, we observe that

$$
E X_{n}^{-}=E X_{n}^{+}-E X_{n} \leq E X_{n}^{+}-E X_{0}
$$

(since $X_{n}$ is a submartingale), so another application of Fatou's lemma shows

$$
E X^{-} \leq \liminf _{n \rightarrow \infty} E X_{n}^{-} \leq \sup _{n} E X_{n}^{+}-E X_{0}<\infty
$$

and completes the proof.
Remark. To prepare for the proof of Theorem 4.7.1, the reader should note that we have shown that if the number of upcrossings of $(a, b)$ by $X_{n}$ is finite for all $a, b \in \mathbf{Q}$, then the limit of $X_{n}$ exists.

An important special case of Theorem 4.2.11 is
Theorem 4.2.12. If $X_{n} \geq 0$ is a supermartingale then as $n \rightarrow \infty$, $X_{n} \rightarrow X$ a.s. and $E X \leq E X_{0}$.

Proof. $Y_{n}=-X_{n} \leq 0$ is a submartingale with $E Y_{n}^{+}=0$. Since $E X_{0} \geq E X_{n}$, the inequality follows from Fatou's lemma.

In the next section, we will give several applications of the last two results. We close this one by giving two "counterexamples."

Example 4.2.13. The first shows that the assumptions of Theorem 4.2.12 (or 4.2.11) do not guarantee convergence in $L^{1}$. Let $S_{n}$ be a symmetric simple random walk with $S_{0}=1$, i.e., $S_{n}=S_{n-1}+\xi_{n}$ where $\xi_{1}, \xi_{2}, \ldots$ are i.i.d. with $P\left(\xi_{i}=1\right)=P\left(\xi_{i}=-1\right)=1 / 2$. Let $N=\inf \left\{n: S_{n}=0\right\}$ and let $X_{n}=S_{N \wedge n}$. Theorem 4.2.9 implies that $X_{n}$ is a nonnegative martingale. Theorem 4.2.12 implies $X_{n}$ converges to a limit $X_{\infty}<\infty$ that must be $\equiv 0$, since convergence to $k>0$ is impossible. (If $X_{n}=k>0$ then $X_{n+1}=k \pm 1$.) Since $E X_{n}=E X_{0}=1$ for all $n$ and $X_{\infty}=0$, convergence cannot occur in $L^{1}$.

Example 4.2.13 is an important counterexample to keep in mind as you read the rest of this chapter. The next one is not as important.

Example 4.2.14. We will now give an example of a martingale with $X_{k} \rightarrow 0$ in probability but not a.s. Let $X_{0}=0$. When $X_{k-1}=0$, let $X_{k}=1$ or -1 with probability $1 / 2 k$ and $=0$ with probability $1-1 / k$. When $X_{k-1} \neq 0$, let $X_{k}=k X_{k-1}$ with probability $1 / k$ and $=0$ with probability $1-1 / k$. From the construction, $P\left(X_{k}=0\right)=1-1 / k$ so $X_{k} \rightarrow 0$ in probability. On the other hand, the second Borel-Cantelli lemma implies $P\left(X_{k}=0\right.$ for $\left.k \geq K\right)=0$, and values in $(-1,1)-\{0\}$ are impossible, so $X_{k}$ does not converge to 0 a.s.

## Exercises

4.2.1. Suppose $X_{n}$ is a martingale w.r.t. $\mathcal{G}_{n}$ and let $\mathcal{F}_{n}=\sigma\left(X_{1}, \ldots, X_{n}\right)$. Then $\mathcal{G}_{n} \supset \mathcal{F}_{n}$ and $X_{n}$ is a martingale w.r.t. $\mathcal{F}_{n}$.
4.2.2. Give an example of a submartingale $X_{n}$ so that $X_{n}^{2}$ is a supermartingale. Hint: $X_{n}$ does not have to be random.
4.2.3. Generalize (i) of Theorem 4.2.7 by showing that if $X_{n}$ and $Y_{n}$ are submartingales w.r.t. $\mathcal{F}_{n}$ then $X_{n} \vee Y_{n}$ is also.
4.2.4. Let $X_{n}, n \geq 0$, be a submartingale with $\sup X_{n}<\infty$. Let $\xi_{n}= X_{n}-X_{n-1}$ and suppose $E\left(\sup \xi_{n}^{+}\right)<\infty$. Show that $X_{n}$ converges a.s.
4.2.5. Give an example of a martingale $X_{n}$ with $X_{n} \rightarrow-\infty$ a.s. Hint: Let $X_{n}=\xi_{1}+\cdots+\xi_{n}$, where the $\xi_{i}$ are independent (but not identically distributed) with $E \xi_{i}=0$.
4.2.6. Let $Y_{1}, Y_{2}, \ldots$ be nonnegative i.i.d. random variables with $E Y_{m}=1$ and $P\left(Y_{m}=1\right)<1$. By example 4.2.3 that $X_{n}=\prod_{m \leq n} Y_{m}$ defines a martingale. (i) Use Theorem 4.2.12 and an argument by contradiction to show $X_{n} \rightarrow 0$ a.s. (ii) Use the strong law of large numbers to conclude $(1 / n) \log X_{n} \rightarrow c<0$.
4.2.7. Suppose $y_{n}>-1$ for all $n$ and $\sum\left|y_{n}\right|<\infty$. Show that $\prod_{m=1}^{\infty}(1+ \left.y_{m}\right)$ exists.
4.2.8. Let $X_{n}$ and $Y_{n}$ be positive integrable and adapted to $\mathcal{F}_{n}$. Suppose

$$
E\left(X_{n+1} \mid \mathcal{F}_{n}\right) \leq\left(1+Y_{n}\right) X_{n}
$$

with $\sum Y_{n}<\infty$ a.s. Prove that $X_{n}$ converges a.s. to a finite limit by finding a closely related supermartingale to which Theorem 4.2.12 can be applied.
4.2.9. The switching principle. Suppose $X_{n}^{1}$ and $X_{n}^{2}$ are supermartingales with respect to $\mathcal{F}_{n}$, and $N$ is a stopping time so that $X_{N}^{1} \geq X_{N}^{2}$. Then

$$
\begin{aligned}
& Y_{n}=X_{n}^{1} 1_{(N>n)}+X_{n}^{2} 1_{(N \leq n)} \text { is a supermartingale. } \\
& Z_{n}=X_{n}^{1} 1_{(N \geq n)}+X_{n}^{2} 1_{(N<n)} \text { is a supermartingale. }
\end{aligned}
$$

4.2.10. Dubins' inequality. For every positive supermartingale $X_{n}$, $n \geq 0$, the number of upcrossings $U$ of $[a, b]$ satisfies

$$
P(U \geq k) \leq\left(\frac{a}{b}\right)^{k} E \min \left(X_{0} / a, 1\right)
$$

To prove this, we let $N_{0}=-1$ and for $j \geq 1$ let

$$
\begin{aligned}
N_{2 j-1} & =\inf \left\{m>N_{2 j-2}: X_{m} \leq a\right\} \\
N_{2 j} & =\inf \left\{m>N_{2 j-1}: X_{m} \geq b\right\}
\end{aligned}
$$

Let $Y_{n}=1$ for $0 \leq n<N_{1}$ and for $j \geq 1$

$$
Y_{n}= \begin{cases}(b / a)^{j-1}\left(X_{n} / a\right) & \text { for } N_{2 j-1} \leq n<N_{2 j} \\ (b / a)^{j} & \text { for } N_{2 j} \leq n<N_{2 j+1}\end{cases}
$$

(i) Use the switching principle in the previous exercise and induction to show that $Z_{n}^{j}=Y_{n \wedge N_{j}}$ is a supermartingale. (ii) Use $E Y_{n \wedge N_{2 k}} \leq E Y_{0}$ and let $n \rightarrow \infty$ to get Dubins' inequality.

### 4.3 Examples

In this section, we will apply the martingale convergence theorem to generalize the second Borel-Cantelli lemma and to study Polya's urn scheme, Radon-Nikodym derivatives, and branching processes. The four topics are independent of each other and are taken up in the order indicated.

### 4.3.1 Bounded Increments

Our first result shows that martingales with bounded increments either converge or oscillate between $+\infty$ and $-\infty$.

Theorem 4.3.1. Let $X_{1}, X_{2}, \ldots$ be a martingale with $\left|X_{n+1}-X_{n}\right| \leq M<\infty$. Let

$$
\begin{aligned}
& C=\left\{\lim X_{n} \text { exists and is finite }\right\} \\
& D=\left\{\lim \sup X_{n}=+\infty \text { and } \lim \inf X_{n}=-\infty\right\}
\end{aligned}
$$

Then $P(C \cup D)=1$.
Proof. Since $X_{n}-X_{0}$ is a martingale, we can without loss of generality suppose that $X_{0}=0$. Let $0<K<\infty$ and let $N=\inf \left\{n: X_{n} \leq-K\right\}$. $X_{n \wedge N}$ is a martingale with $X_{n \wedge N} \geq-K-M$ a.s. so applying Theorem 4.2.12 to $X_{n \wedge N}+K+M$ shows $\lim X_{n}$ exists on $\{N=\infty\}$. Letting $K \rightarrow \infty$, we see that the limit exists on $\left\{\liminf X_{n}>-\infty\right\}$. Applying the last conclusion to $-X_{n}$, we see that $\lim X_{n}$ exists on $\left\{\limsup X_{n}<\infty\right\}$ and the proof is complete.

To prepare for an application of this result we need
Theorem 4.3.2. Doob's decomposition. Any submartingale $X_{n}, n \geq$ 0 , can be written in a unique way as $X_{n}=M_{n}+A_{n}$, where $M_{n}$ is a martingale and $A_{n}$ is a predictable increasing sequence with $A_{0}=0$.

Proof. We want $X_{n}=M_{n}+A_{n}, E\left(M_{n} \mid \mathcal{F}_{n-1}\right)=M_{n-1}$, and $A_{n} \in \mathcal{F}_{n-1}$. So we must have

$$
\begin{aligned}
E\left(X_{n} \mid \mathcal{F}_{n-1}\right) & =E\left(M_{n} \mid \mathcal{F}_{n-1}\right)+E\left(A_{n} \mid \mathcal{F}_{n-1}\right) \\
& =M_{n-1}+A_{n}=X_{n-1}-A_{n-1}+A_{n}
\end{aligned}
$$

and it follows that

$$
\begin{equation*}
A_{n}-A_{n-1}=E\left(X_{n} \mid \mathcal{F}_{n-1}\right)-X_{n-1} \tag{4.3.1}
\end{equation*}
$$

Since $A_{0}=0$, we have

$$
\begin{equation*}
A_{n}=\sum_{m=1}^{n} E\left(X_{n}-X_{n-1} \mid \mathcal{F}_{n-1}\right) \tag{4.3.2}
\end{equation*}
$$

To check that our recipe works, we observe that $A_{n}-A_{n-1} \geq 0$ since $X_{n}$ is a submartingale and $A_{n} \in \mathcal{F}_{n-1}$. To prove that $M_{n}=X_{n}-A_{n}$ is a martingale, we note that using $A_{n} \in \mathcal{F}_{n-1}$ and (4.3.1)

$$
\begin{aligned}
E\left(M_{n} \mid \mathcal{F}_{n-1}\right) & =E\left(X_{n}-A_{n} \mid \mathcal{F}_{n-1}\right) \\
& =E\left(X_{n} \mid \mathcal{F}_{n-1}\right)-A_{n}=X_{n-1}-A_{n-1}=M_{n-1}
\end{aligned}
$$

which completes the proof.
The illustrate the use of this result we do the following important example.

Example 4.3.3. Let and suppose $B_{n} \in \mathcal{F}_{n}$. Using (4.3.2)

$$
M_{n}=\sum_{m=1}^{n} 1_{B_{m}}-E\left(1_{B_{m}} \mid \mathcal{F}_{m-1}\right)
$$

Theorem 4.3.4. Second Borel-Cantelli lemma, II. Let $\mathcal{F}_{n}, n \geq 0$ be a filtration with $\mathcal{F}_{0}=\{\emptyset, \Omega\}$ and let $B_{n}, n \geq 1$ a sequence of events with $B_{n} \in \mathcal{F}_{n}$. Then

$$
\left\{B_{n} \text { i.o. }\right\}=\left\{\sum_{n=1}^{\infty} P\left(B_{n} \mid \mathcal{F}_{n-1}\right)=\infty\right\}
$$

Proof. If we let $X_{0}=0$ and $X_{n}=\sum_{m \leq n} 1_{B_{m}}$, then $X_{n}$ is a submartingale. (4.3.2) implies $A_{n}=\sum_{m=1}^{n} E\left(1_{B_{m}} \mid \mathcal{F}_{m-1}\right)$ so if $M_{0}=0$ and

$$
M_{n}=\sum_{m=1}^{n} 1_{B_{m}}-P\left(B_{m} \mid \mathcal{F}_{m-1}\right)
$$

for $n \geq 1$ then $M_{n}$ is a martingale with $\left|M_{n}-M_{n-1}\right| \leq 1$. Using the notation of Theorem 4.3.1 we have:

$$
\begin{aligned}
& \begin{array}{l}
\text { on } C, \quad \sum_{n=1}^{\infty} 1_{B_{n}}=\infty \quad \text { if and only if } \quad \sum_{n=1}^{\infty} P\left(B_{n} \mid \mathcal{F}_{n-1}\right)=\infty \\
\text { on } D, \quad \sum_{n=1}^{\infty} 1_{B_{n}}=\infty \quad \text { and } \quad \sum_{n=1}^{\infty} P\left(B_{n} \mid \mathcal{F}_{n-1}\right)=\infty
\end{array}
\end{aligned}
$$

Since $P(C \cup D)=1$, the result follows.

### 4.3.2 Polya's Urn Scheme

An urn contains $r$ red and $g$ green balls. At each time we draw a ball out, then replace it, and add $c$ more balls of the color drawn. Let $X_{n}$ be the fraction of green balls after the $n$th draw. To check that $X_{n}$ is a martingale, note that if there are $i$ red balls and $j$ green balls at time $n$, then

$$
X_{n+1}= \begin{cases}(j+c) /(i+j+c) & \text { with probability } j /(i+j) \\ j /(i+j+c) & \text { with probability } i /(i+j)\end{cases}
$$

and we have

$$
\frac{j+c}{i+j+c} \cdot \frac{j}{i+j}+\frac{j}{i+j+c} \cdot \frac{i}{i+j}=\frac{(j+c+i) j}{(i+j+c)(i+j)}=\frac{j}{i+j}
$$

Since $X_{n} \geq 0$, Theorem 4.2.12 implies that $X_{n} \rightarrow X_{\infty}$ a.s. To compute the distribution of the limit, we observe (a) the probability of getting green on the first $m$ draws then red on the next $\ell=n-m$ draws is

$$
\frac{g}{g+r} \cdot \frac{g+c}{g+r+c} \cdots \frac{g+(m-1) c}{g+r+(m-1) c} \cdot \frac{r}{g+r+m c} \cdots \frac{r+(\ell-1) c}{g+r+(n-1) c}
$$

and (b) any other outcome of the first $n$ draws with $m$ green balls drawn and $\ell$ red balls drawn has the same probability since the denominator remains the same and the numerator is permuted. Consider the special case $c=1, g=1, r=1$. Let $G_{n}$ be the number of green balls after the $n$th draw has been completed and the new ball has been added. It follows from (a) and (b) that

$$
P\left(G_{n}=m+1\right)=\binom{n}{m} \frac{m!(n-m)!}{(n+1)!}=\frac{1}{n+1}
$$

so $X_{\infty}$ has a uniform distribution on $(0,1)$.
If we suppose that $c=1, g=2$, and $r=1$, then

$$
P\left(G_{n}=m+2\right)=\frac{n!}{m!(n-m)!} \frac{(m+1)!(n-m)!}{(n+2)!/ 2} \rightarrow 2 x
$$

if $n \rightarrow \infty$ and $m / n \rightarrow x$. In general, the distribution of $X_{\infty}$ has density

$$
\frac{\Gamma((g+r) / c)}{\Gamma(g / c) \Gamma(r / c)} x^{(g / c)-1}(1-x)^{(r / c)-1}
$$

This is the beta distribution with parameters $g / c$ and $r / c$. In Example 4.5.6 we will see that the limit behavior changes drastically if, in addition to the $c$ balls of the color chosen, we always add one ball of the opposite color.

### 4.3.3 Radon-Nikodym Derivatives

Let $\mu$ be a finite measure and $\nu$ a probability measure on $(\Omega, \mathcal{F})$. Let $\mathcal{F}_{n} \uparrow \mathcal{F}$ be $\sigma$-fields (i.e., $\sigma\left(\cup \mathcal{F}_{n}\right)=\mathcal{F}$ ). Let $\mu_{n}$ and $\nu_{n}$ be the restrictions of $\mu$ and $\nu$ to $\mathcal{F}_{n}$.

Theorem 4.3.5. Suppose $\mu_{n} \ll \nu_{n}$ for all $n$. Let $X_{n}=d \mu_{n} / d \nu_{n}$ and let $X=\lim \sup X_{n}$. Then

$$
\mu(A)=\int_{A} X d \nu+\mu(A \cap\{X=\infty\})
$$

Remark. $\mu_{r}(A) \equiv \int_{A} X d \nu$ is a measure $\ll \nu$. Since Theorem 4.2.12 implies $\nu(X=\infty)=0, \mu_{s}(A) \equiv \mu(A \cap\{X=\infty\})$ is singular w.r.t. $\nu$. Thus $\mu=\mu_{r}+\mu_{s}$ gives the Lebesgue decomposition of $\mu$ (see Theorem A.4.7), and $X_{\infty}=d \mu_{r} / d \nu, \nu$-a.s. Here and in the proof we need to keep track of the measure to which the a.s. refers.

Proof. As the reader can probably anticipate:
Lemma 4.3.6. $X_{n}($ defined on $(\Omega, \mathcal{F}, \nu))$ is a martingale w.r.t. $\mathcal{F}_{n}$.
Proof. We observe that, by definition, $X_{n} \in \mathcal{F}_{n}$. Let $A \in \mathcal{F}_{n}$. Since $X_{n} \in \mathcal{F}_{n}$ and $\nu_{n}$ is the restriction of $\nu$ to $\mathcal{F}_{n}$

$$
\int_{A} X_{n} d \nu=\int_{A} X_{n} d \nu_{n}
$$

Using the definition of $X_{n}$ and Exercise A.4.7

$$
\int_{A} X_{n} d \nu_{n}=\mu_{n}(A)=\mu(A)
$$

the last equality holding since $A \in \mathcal{F}_{n}$ and $\mu_{n}$ is the restriction of $\mu$ to $\mathcal{F}_{n}$. If $A \in \mathcal{F}_{m-1} \subset \mathcal{F}_{m}$, using the last result for $n=m$ and $n=m-1$ gives

$$
\int_{A} X_{m} d \nu=\mu(A)=\int_{A} X_{m-1} d \nu
$$

so $E\left(X_{m} \mid \mathcal{F}_{m-1}\right)=X_{m-1}$.
Since $X_{n}$ is a nonnegative martingale, Theorem 4.2.12 implies that $X_{n} \rightarrow X \nu$-a.s. We want to check that the equality in the theorem holds. Dividing $\mu(A)$ by $\mu(\Omega)$, we can without loss of generality suppose $\mu$ is a probability measure. Let $\rho=(\mu+\nu) / 2, \rho_{n}=\left(\mu_{n}+\nu_{n}\right) / 2=$ the restriction of $\rho$ to $\mathcal{F}_{n}$. Let $Y_{n}=d \mu_{n} / d \rho_{n}, Z_{n}=d \nu_{n} / d \rho_{n} . Y_{n}, Z_{n} \geq 0$ and $Y_{n}+Z_{n}=2$ (by Exercise A.4.6), so $Y_{n}$ and $Z_{n}$ are bounded martingales with limits $Y$ and Z . As the reader can probably guess,

$$
\begin{equation*}
Y=d \mu / d \rho \quad Z=d \nu / d \rho \tag{*}
\end{equation*}
$$

It suffices to prove the first equality. From the proof of Lemma 4.3.6, if $A \in \mathcal{F}_{m} \subset \mathcal{F}_{n}$

$$
\mu(A)=\int_{A} Y_{n} d \rho \rightarrow \int_{A} Y d \rho
$$

by the bounded convergence theorem. The last computation shows that

$$
\mu(A)=\int_{A} Y d \rho \quad \text { for all } A \in \mathcal{G}=\cup_{m} \mathcal{F}_{m}
$$

$\mathcal{G}$ is a $\pi$-system, so the $\pi-\lambda$ theorem implies the equality is valid for all $A \in \mathcal{F}=\sigma(\mathcal{G})$ and (*) is proved.

It follows from Exercises A.4.8 and A.4.9 that $X_{n}=Y_{n} / Z_{n}$. At this point, the reader can probably leap to the conclusion that $X=Y / Z$. To get there carefully, note $Y+Z=2 \rho$-a.s., so $\rho(Y=0, Z=0)=0$. Having ruled out $0 / 0$ we have $X=Y / Z \rho$-a.s. (Recall $X \equiv \limsup X_{n}$.) Let $W=(1 / Z) \cdot 1_{(Z>0)}$. Using $(*)$, then $1=Z W+1_{(Z=0)}$, we have

$$
\begin{equation*}
\mu(A)=\int_{A} Y d \rho=\int_{A} Y W Z d \rho+\int_{A} 1_{(Z=0)} Y d \rho \tag{a}
\end{equation*}
$$

Now ( $*$ ) implies $d \nu=Z d \rho$, and it follows from the definitions that

$$
Y W=X 1_{(Z>0)}=X \quad \nu \text {-a.s. }
$$

the second equality holding since $\nu(\{Z=0\})=0$. Combining things, we have

$$
\begin{equation*}
\int_{A} Y W Z d \rho=\int_{A} X d \nu \tag{b}
\end{equation*}
$$

To handle the other term, we note that $(*)$ implies $d \mu=Y d \rho$, and it follows from the definitions that $\{X=\infty\}=\{Z=0\} \mu$-a.s. so

$$
\begin{equation*}
\int_{A} 1_{(Z=0)} Y d \rho=\int_{A} 1_{(X=\infty)} d \mu \tag{c}
\end{equation*}
$$

Combining (a), (b), and (c) gives the desired result.
Example 4.3.7. Suppose $\mathcal{F}_{n}=\sigma\left(I_{k, n}: 0 \leq k<K_{n}\right)$ where for each $n$, $I_{k, n}$ is a partition of $\Omega$, and the ( $n+1$ )th partition is a refinement of the $n$ th. In this case, the condition $\mu_{n} \ll \nu_{n}$ is $\nu\left(I_{k, n}\right)=0$ implies $\mu\left(I_{k, n}\right)=$ 0 , and the martingale $X_{n}=\mu\left(I_{k, n}\right) / \nu\left(I_{k, n}\right)$ on $I_{k, n}$ is an approximation to the Radon-Nikodym derivative. For a concrete example, consider $\Omega= [0,1), I_{k, n}=\left[k 2^{-n},(k+1) 2^{-n}\right)$ for $0 \leq k<2^{n}$, and $\nu=$ Lebesgue measure.

Kakutani dichotomy for infinite product measures. Let $\mu$ and $\nu$ be measures on sequence space ( $\mathbf{R}^{\mathbf{N}}, \mathcal{R}^{\mathbf{N}}$ ) that make the coordinates $\xi_{n}(\omega)=\omega_{n}$ independent. Let $F_{n}(x)=\mu\left(\xi_{n} \leq x\right), G_{n}(x)=\nu\left(\xi_{n} \leq x\right)$. Suppose $F_{n} \ll G_{n}$ and let $q_{n}=d F_{n} / d G_{n}$. To avoid a problem we will suppose $q_{n}>0, G_{n}$-a.s.

Let $\mathcal{F}_{n}=\sigma\left(\xi_{m}: m \leq n\right)$, let $\mu_{n}$ and $\nu_{n}$ be the restrictions of $\mu$ and $\nu$ to $\mathcal{F}_{n}$, and let

$$
X_{n}=\frac{d \mu_{n}}{d \nu_{n}}=\prod_{m=1}^{n} q_{m}
$$

Theorem 4.3.5 implies that $X_{n} \rightarrow X \nu$-a.s. Thanks to our assumption $q_{n}>0, G_{n}$-a.s. $\sum_{m=1}^{\infty} \log \left(q_{m}\right)>-\infty$ is a tail event, so the Kolmogorov 0-1 law implies

$$
\begin{equation*}
\nu(X=0) \in\{0,1\} \tag{4.3.3}
\end{equation*}
$$

and it follows from Theorem 4.3.5 that either $\mu \ll \nu$ or $\mu \perp \nu$. The next result gives a concrete criterion for which of the two alternatives occurs.

Theorem 4.3.8. $\mu \ll \nu$ or $\mu \perp \nu$, according as $\prod_{m=1}^{\infty} \int \sqrt{q_{m}} d G_{m}>0$ or $=0$.

Proof. Jensen's inequality and Exercise A.4.7 imply

$$
\left(\int \sqrt{q_{m}} d G_{m}\right)^{2} \leq \int q_{m} d G_{m}=\int d F_{m}=1
$$

so the infinite product of the integrals is well defined and $\leq 1$. Let

$$
X_{n}=\prod_{m \leq n} q_{m}\left(\omega_{m}\right)
$$

as above, and recall that $X_{n} \rightarrow X \nu$-a.s. If the infinite product is 0 then

$$
\int X_{n}^{1 / 2} d \nu=\prod_{m=1}^{n} \int \sqrt{q_{m}} d G_{m} \rightarrow 0
$$

Fatou's lemma implies

$$
\int X^{1 / 2} d \nu \leq \liminf _{n \rightarrow \infty} \int X_{n}^{1 / 2} d \nu=0
$$

so $X=0 \nu$-a.s., and Theorem 4.3.5 implies $\mu \perp \nu$. To prove the other direction, let $Y_{n}=X_{n}^{1 / 2}$. Now $\int q_{m} d G_{m}=1$, so if we use $E$ to denote expected value with respect to $\nu$, then $E Y_{m}^{2}=E X_{m}=1$, so
$E\left(Y_{n+k}-Y_{n}\right)^{2}=E\left(X_{n+k}+X_{n}-2 X_{n}^{1 / 2} X_{n+k}^{1 / 2}\right)=2\left(1-\prod_{m=n+1}^{n+k} \int \sqrt{q_{m}} d G_{m}\right)$
Now $|a-b|=\left|a^{1 / 2}-b^{1 / 2}\right| \cdot\left(a^{1 / 2}+b^{1 / 2}\right)$, so using Cauchy-Schwarz and the fact $(a+b)^{2} \leq 2 a^{2}+2 b^{2}$ gives

$$
\begin{aligned}
E\left|X_{n+k}-X_{n}\right| & =E\left(\left|Y_{n+k}-Y_{n}\right|\left(Y_{n+k}+Y_{n}\right)\right) \\
& \leq\left(E\left(Y_{n+k}-Y_{n}\right)^{2} E\left(Y_{n+k}+Y_{n}\right)^{2}\right)^{1 / 2} \\
& \leq\left(4 E\left(Y_{n+k}-Y_{n}\right)^{2}\right)^{1 / 2}
\end{aligned}
$$

From the last two equations, it follows that if the infinite product is $>0$, then $X_{n}$ converges to $X$ in $L^{1}(\nu)$, so $\nu(X=0)<1$, (4.3.3) implies the probability is 0 , and the desired result follows from Theorem 4.3.5.

### 4.3.4 Branching Processes

Let $\xi_{i}^{n}, i, n \geq 1$, be i.i.d. nonnegative integer-valued random variables. Define a sequence $Z_{n}, n \geq 0$ by $Z_{0}=1$ and

$$
Z_{n+1}= \begin{cases}\xi_{1}^{n+1}+\cdots+\xi_{Z_{n}}^{n+1} & \text { if } Z_{n}>0  \tag{4.3.4}\\ 0 & \text { if } Z_{n}=0\end{cases}
$$

$Z_{n}$ is called a Galton-Watson process. The idea behind the definitions is that $Z_{n}$ is the number of individuals in the $n$th generation, and each member of the $n$th generation gives birth independently to an identically distributed number of children. $p_{k}=P\left(\xi_{i}^{n}=k\right)$ is called the offspring distribution.

Lemma 4.3.9. Let $\mathcal{F}_{n}=\sigma\left(\xi_{i}^{m}: i \geq 1,1 \leq m \leq n\right)$ and $\mu=E \xi_{i}^{m} \in (0, \infty)$. Then $Z_{n} / \mu^{n}$ is a martingale w.r.t. $\mathcal{F}_{n}$.

Proof. Clearly, $Z_{n} \in \mathcal{F}_{n}$. Using Theorem 4.1.2 to conclude that on $\left\{Z_{n}=\right. k$ \}

$$
E\left(Z_{n+1} \mid \mathcal{F}_{n}\right)=E\left(\xi_{1}^{n+1}+\cdots+\xi_{k}^{n+1} \mid \mathcal{F}_{n}\right)=k \mu=\mu Z_{n}
$$

where in the second equality we used the fact that the $\xi_{k}^{n+1}$ are independent of $\mathcal{F}_{n}$. $\square$
$Z_{n} / \mu^{n}$ is a nonnegative martingale, so Theorem 4.2.12 implies $Z_{n} / \mu^{n} \rightarrow$ a limit a.s. We begin by identifying cases when the limit is trivial.

Theorem 4.3.10. If $\mu<1$ then $Z_{n}=0$ for all $n$ sufficiently large, so $Z_{n} / \mu^{n} \rightarrow 0$.

Proof. $E\left(Z_{n} / \mu^{n}\right)=E\left(Z_{0}\right)=1$, so $E\left(Z_{n}\right)=\mu^{n}$. Now $Z_{n} \geq 1$ on $\left\{Z_{n}>0\right\}$ so

$$
P\left(Z_{n}>0\right) \leq E\left(Z_{n} ; Z_{n}>0\right)=E\left(Z_{n}\right)=\mu^{n} \rightarrow 0
$$

exponentially fast if $\mu<1$. $\square$

The last answer should be intuitive. If each individual on the average gives birth to less than one child, the species will die out. The next result shows that after we exclude the trivial case in which each individual has exactly one child, the same result holds when $\mu=1$.

Theorem 4.3.11. If $\mu=1$ and $P\left(\xi_{i}^{m}=1\right)<1$ then $Z_{n}=0$ for all $n$ sufficiently large.

Proof. When $\mu=1, Z_{n}$ is itself a nonnegative martingale. Since $Z_{n}$ is integer valued and by Theorem 4.2.12 converges to an a.s. finite limit $Z_{\infty}$, we must have $Z_{n}=Z_{\infty}$ for large $n$. If $P\left(\xi_{i}^{m}=1\right)<1$ and $k>0$ then $P\left(Z_{n}=k\right.$ for all $\left.n \geq N\right)=0$ for any $N$, so we must have $Z_{\infty} \equiv 0$. $\square$

![](https://cdn.mathpix.com/cropped/9f8e1c6c-af9c-4ae4-b3b9-8004dd64ac3c-117.jpg?height=549&width=691&top_left_y=1746&top_left_x=734)
Figure 4.3: Generating function for Binomial(3,1/2).

When $\mu \leq 1$, the limit of $Z_{n} / \mu^{n}$ is 0 because the branching process dies out. Our next step is to show that if $\mu>1$ then $P\left(Z_{n}>0\right.$ for all $n)>0$. For $s \in[0,1]$, let $\varphi(s)=\sum_{k \geq 0} p_{k} s^{k}$ where $p_{k}=P\left(\xi_{i}^{m}=k\right)$. $\varphi$ is the generating function for the offspring distribution $p_{k}$.
Theorem 4.3.12. Suppose $\mu>1$. If $Z_{0}=1$ then $P\left(Z_{n}=0\right.$ for some $\left.n\right)= \rho$ the only solution of $\varphi(\rho)=\rho$ in $[0,1)$.
Proof. $\phi(1)=1$ Differentiating and referring to Theorem A.5.3 for the justification gives for $s<1$

$$
\varphi^{\prime}(s)=\sum_{k=1}^{\infty} k p_{k} s^{k-1} \geq 0
$$

so $\phi$ is increasing. We may have $\phi(s)=\infty$ when $s>1$ so we have to work carefully.

$$
\lim _{s \uparrow 1} \varphi^{\prime}(s)=\sum_{k=1}^{\infty} k p_{k}=\mu
$$

Integrating we have

$$
\phi(1)-\phi(1-h)=\int_{1-h}^{1} \phi^{\prime}(s) d s \sim \mu h
$$

as $h \rightarrow 0$, so if $h$ is small $\phi(1-h)<1-h . \phi(0) \geq 0$ so there must be a solution of $\phi(x)=x$ in $[0,1)$.

To prove uniqueness we note that for $s<1$

$$
\varphi^{\prime \prime}(s)=\sum_{k=2}^{\infty} k(k-1) p_{k} s^{k-2}>0
$$

since $\mu>1$ implies that $p_{k}>0$ for some $k \geq 2$. Let $\rho$ be the smallest solution of $\phi(\rho)=\rho$ in $[0,1)$. Since $\phi(1)=1$ and $\phi$ is strictly convex we have $\phi(x)<x$ for $x \in(\rho, 1)$ so there is only one solution of $\phi(\rho)=\rho$ in $[0,1)$.

Combining the next two result will complete the proof.
(a) If $\theta_{m}=P\left(Z_{m}=0\right)$ then $\theta_{m}=\sum_{k=0}^{\infty} p_{k}\left(\theta_{m-1}\right)^{k}=\phi\left(\theta_{m-1}\right)$

Proof of (a). If $Z_{1}=k$, an event with probability $p_{k}$, then $Z_{m}=0$ if and only if all $k$ families die out in the remaining $m-1$ units of time, an independent event with probability $\theta_{m-1}^{k}$. Summing over the disjoint possibilities for each $k$ gives the desired result.
(b) As $m \uparrow \infty, \theta_{m} \uparrow \rho$.

Proof of (b). Clearly $\theta_{m}=P\left(Z_{m}=0\right)$ is increasing. To show by induction that $\theta_{m} \leq \rho$ we note that $\theta_{0}=0 \leq \rho$, and if the result is true for $m-1$

$$
\theta_{m}=\varphi\left(\theta_{m-1}\right) \leq \varphi(\rho)=\rho
$$

![](https://cdn.mathpix.com/cropped/9f8e1c6c-af9c-4ae4-b3b9-8004dd64ac3c-119.jpg?height=504&width=755&top_left_y=285&top_left_x=700)
Figure 4.4: Iteration as in part (c) for the Binomial(3,1/2) generating function.

Taking limits in $\theta_{m}=\varphi\left(\theta_{m-1}\right)$, we see $\theta_{\infty}=\varphi\left(\theta_{\infty}\right)$. Since $\theta_{\infty} \leq \rho$, it follows that $\theta_{\infty}=\rho$. $\square$

The last result shows that when $\mu>1$, the limit of $Z_{n} / \mu^{n}$ has a chance of being nonzero. The best result on this question is due to Kesten and Stigum:

Theorem 4.3.13. $W=\lim Z_{n} / \mu^{n}$ is not $\equiv 0$ if and only if $\sum p_{k} k \log k< \infty$.

For a proof, see Athreya and Ney (1972), p. 24-29. In the next section, we will show that $\sum k^{2} p_{k}<\infty$ is sufficient for a nontrivial limit.

## Exercises

4.3.1. Give an example of a martingale $X_{n}$ with $\sup _{n}\left|X_{n}\right|<\infty$ and $P\left(X_{n}=a\right.$ i.o. $)=1$ for $a=-1,0,1$. This example shows that it is not enough to have $\sup \left|X_{n+1}-X_{n}\right|<\infty$ in Theorem 4.3.1.
4.3.2. (Assumes familiarity with finite state Markov chains.) Fine tune the example for the previous problem so that $P\left(X_{n}=0\right) \rightarrow 1-2 p$ and $P\left(X_{n}=-1\right), P\left(X_{n}=1\right) \rightarrow p$, where $p$ is your favorite number in ( $0,1 / 2$ ), i.e., you are asked to do this for one value of $p$ that you may choose. This example shows that a martingale can converge in distribution without converging a.s. (or in probability).
4.3.3. Let $X_{n}$ and $Y_{n}$ be positive integrable and adapted to $\mathcal{F}_{n}$. Suppose $E\left(X_{n+1} \mid \mathcal{F}_{n}\right) \leq X_{n}+Y_{n}$, with $\sum Y_{n}<\infty$ a.s. Prove that $X_{n}$ converges a.s. to a finite limit. Hint: Let $N=\inf _{k} \sum_{m=1}^{k} Y_{m}>M$, and stop your supermartingale at time $N$.
4.3.4. Let $p_{m} \in[0,1)$. Use the Borel-Cantelli lemmas to show that

$$
\prod_{m=1}^{\infty}\left(1-p_{m}\right)=0 \quad \text { if and only if } \quad \sum_{m=1}^{\infty} p_{m}=\infty .
$$

4.3.5. Show $\sum_{n=2}^{\infty} P\left(A_{n} \mid \cap_{m=1}^{n-1} A_{m}^{c}\right)=\infty$ implies $P\left(\cap_{m=1}^{\infty} A_{m}^{c}\right)=0$.
4.3.6. Check by direct computation that the $X_{n}$ in Example 4.3.7 is a martingale. Show that if we drop the condition $\mu_{n} \ll \nu_{n}$ and set $X_{n}=0$ when $\nu\left(I_{k, n}\right)=0$, then $E\left(X_{n+1} \mid \mathcal{F}_{n}\right) \leq X_{n}$.
4.3.7. Apply Theorem 4.3.5 to Example 4.3.7 to get a "probabilistic" proof of the Radon-Nikodym theorem. To be precise, suppose $\mathcal{F}$ is countably generated (i.e., there is a sequence of sets $A_{n}$ so that $\mathcal{F}= \left.\sigma\left(A_{n}: n \geq 1\right)\right)$ and show that if $\mu$ and $\nu$ are $\sigma$-finite measures and $\mu \ll \nu$, then there is a function $g$ so that $\mu(A)=\int_{A} g d \nu$. Before you object to this as circular reasoning (the Radon-Nikodym theorem was used to define conditional expectation!), observe that the conditional expectations that are needed for Example 4.3.7 have elementary definitions.

Bernoulli product measures. For the next three exercises, suppose $F_{n}, G_{n}$ are concentrated on $\{0,1\}$ and have $F_{n}(0)=1-\alpha_{n}, G_{n}(0)= 1-\beta_{n}$.
4.3.8. (i) Use Theorem 4.3.8 to find a necessary and sufficient condition for $\mu \ll \nu$. (ii) Suppose that $0<\epsilon \leq \alpha_{n}, \beta_{n} \leq 1-\epsilon<1$. Show that in this case the condition is simply $\sum\left(\alpha_{n}-\beta_{n}\right)^{2}<\infty$.
4.3.9. Show that if $\sum \alpha_{n}<\infty$ and $\sum \beta_{n}=\infty$ in the previous exercise then $\mu \perp \nu$. This shows that the condition $\sum\left(\alpha_{n}-\beta_{n}\right)^{2}<\infty$ is not sufficient for $\mu \ll \nu$ in general.
4.3.10. Suppose $0<\alpha_{n}, \beta_{n}<1$. Show that $\sum\left|\alpha_{n}-\beta_{n}\right|<\infty$ is sufficient for $\mu \ll \nu$ in general.
4.3.11. Show that if $P\left(\lim Z_{n} / \mu^{n}=0\right)<1$ then it is $=\rho$ and hence

$$
\left\{\lim Z_{n} / \mu^{n}>0\right\}=\left\{Z_{n}>0 \text { for all } n\right\} \text { a.s. }
$$

4.3.12. Let $Z_{n}$ be a branching process with offspring distribution $p_{k}$, defined in part d of Section 4.3, and let $\varphi(\theta)=\sum p_{k} \theta^{k}$. Suppose $\rho<1$ has $\varphi(\rho)=\rho$. Show that $\rho^{Z_{n}}$ is a martingale and use this to conclude $P\left(Z_{n}=0\right.$ for some $\left.n \geq 1 \mid Z_{0}=x\right)=\rho^{x}$.
4.3.13. Galton and Watson who invented the process that bears their names were interested in the survival of family names. Suppose each family has exactly 3 children but coin flips determine their sex. In the 1800s, only male children kept the family name so following the male offspring leads to a branching process with $p_{0}=1 / 8, p_{1}=3 / 8, p_{2}=3 / 8$, $p_{3}=1 / 8$. Compute the probability $\rho$ that the family name will die out when $Z_{0}=1$.

### 4.4 Doob's Inequality, Convergence in $L^{p}, p>1$

We begin by proving a consequence of Theorem 4.2.9.
Theorem 4.4.1. If $X_{n}$ is a submartingale and $N$ is a stopping time with $P(N \leq k)=1$ then

$$
E X_{0} \leq E X_{N} \leq E X_{k}
$$

Remark. Let $S_{n}$ be a simple random walk with $S_{0}=1$ and let $N= \inf \left\{n: S_{n}=0\right\}$. (See Example 4.2.13 for more details.) $E S_{0}=1>0= E S_{N}$ so the first inequality need not hold for unbounded stopping times. In Section 5.7 we will give conditions that guarantee $E X_{0} \leq E X_{N}$ for unbounded $N$.
Proof. Theorem 4.2.9 implies $X_{N \wedge n}$ is a submartingale, so it follows that

$$
E X_{0}=E X_{N \wedge 0} \leq E X_{N \wedge k}=E X_{N}
$$

To prove the other inequality, let $K_{n}=1_{\{N<n\}}=1_{\{N \leq n-1\}} \cdot K_{n}$ is predictable, so Theorem 4.2.8 implies $(K \cdot X)_{n}=X_{n}-X_{N \wedge n}$ is a submartingale and it follows that

$$
E X_{k}-E X_{N}=E(K \cdot X)_{k} \geq E(K \cdot X)_{0}=0
$$

We will see below that Theorem 4.4.1 is very useful. The first indication of this is:

Theorem 4.4.2. Doob's inequality. Let $X_{m}$ be a submartingale,

$$
\bar{X}_{n}=\max _{0 \leq m \leq n} X_{m}^{+}
$$

$\lambda>0$, and $A=\left\{\bar{X}_{n} \geq \lambda\right\}$. Then

$$
\lambda P(A) \leq E X_{n} 1_{A} \leq E X_{n}^{+}
$$

Proof. Let $N=\inf \left\{m: X_{m} \geq \lambda\right.$ or $\left.m=n\right\}$. Since $X_{N} \geq \lambda$ on $A$,

$$
\lambda P(A) \leq E X_{N} 1_{A} \leq E X_{n} 1_{A}
$$

The second inequality follows from the fact that Theorem 4.4.1 implies $E X_{N} \leq E X_{n}$ and we have $X_{N}=X_{n}$ on $A^{c}$. The second inequality is trivial, so the proof is complete.

Example 4.4.3. Random walks. If we let $S_{n}=\xi_{1}+\cdots+\xi_{n}$ where the $\xi_{m}$ are independent and have $E \xi_{m}=0, \sigma_{m}^{2}=E \xi_{m}^{2}<\infty$. $S_{n}$ is a martingale son Theorem 4.2.6 implies $X_{n}=S_{n}^{2}$ is a submartingale. If we let $\lambda=x^{2}$ and apply Theorem 4.4.2 to $X_{n}$, we get Kolmogorov's maximal inequality, Theorem 2.5.5:

$$
P\left(\max _{1 \leq m \leq n}\left|S_{m}\right| \geq x\right) \leq x^{-2} \operatorname{var}\left(S_{n}\right)
$$

Integrating the inequality in Theorem 4.4.2 gives:
Theorem 4.4.4. $L^{p}$ maximum inequality. If $X_{n}$ is a submartingale then for $1<p<\infty$,

$$
E\left(\bar{X}_{n}^{p}\right) \leq\left(\frac{p}{p-1}\right)^{p} E\left(X_{n}^{+}\right)^{p}
$$

Consequently, if $Y_{n}$ is a martingale and $Y_{n}^{*}=\max _{0 \leq m \leq n}\left|Y_{m}\right|$,

$$
E\left|Y_{n}^{*}\right|^{p} \leq\left(\frac{p}{p-1}\right)^{p} E\left(\left|Y_{n}\right|^{p}\right)
$$

Proof. The second inequality follows by applying the first to $X_{n}=\left|Y_{n}\right|$. To prove the first we will, for reasons that will become clear in a moment, work with $\bar{X}_{n} \wedge M$ rather than $\bar{X}_{n}$. Since $\left\{\bar{X}_{n} \wedge M \geq \lambda\right\}$ is always $\left\{\bar{X}_{n} \geq\right. \lambda\}$ or $\emptyset$, this does not change the application of Theorem 4.4.2. Using Lemma 2.2.13, Theorem 4.4.2, Fubini's theorem, and a little calculus gives

$$
\begin{aligned}
E\left(\left(\bar{X}_{n} \wedge M\right)^{p}\right) & =\int_{0}^{\infty} p \lambda^{p-1} P\left(\bar{X}_{n} \wedge M \geq \lambda\right) d \lambda \\
& \leq \int_{0}^{\infty} p \lambda^{p-1}\left(\lambda^{-1} \int X_{n}^{+} 1_{\left(\bar{X}_{n} \wedge M \geq \lambda\right)} d P\right) d \lambda \\
& =\int X_{n}^{+} \int_{0}^{\bar{X}_{n} \wedge M} p \lambda^{p-2} d \lambda d P \\
& =\frac{p}{p-1} \int X_{n}^{+}\left(\bar{X}_{n} \wedge M\right)^{p-1} d P
\end{aligned}
$$

If we let $q=p /(p-1)$ be the exponent conjugate to $p$ and apply Hölder's inequality, Theorem 1.6.3, we see that the above

$$
\leq\left(\frac{p}{1-p}\right)\left(E\left|X_{n}^{+}\right|^{p}\right)^{1 / p}\left(E\left|\bar{X}_{n} \wedge M\right|^{p}\right)^{1 / q}
$$

If we divide both sides of the last inequality by $\left(E\left|\bar{X}_{n} \wedge M\right|^{p}\right)^{1 / q}$, which is finite thanks to the $\wedge M$, then take the $p$ th power of each side, we get

$$
E\left(\left|\bar{X}_{n} \wedge M\right|^{p}\right) \leq\left(\frac{p}{p-1}\right)^{p} E\left(X_{n}^{+}\right)^{p}
$$

Letting $M \rightarrow \infty$ and using the monotone convergence theorem gives the desired result.

Example 4.4.5. There is no $L^{1}$ maximal inequality. Again, the counterexample is provided by Example 4.2.13. Let $S_{n}$ be a simple random walk starting from $S_{0}=1, N=\inf \left\{n: S_{n}=0\right\}$, and $X_{n}=S_{N \wedge n}$.

