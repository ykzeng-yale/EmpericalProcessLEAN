sets is called a $V C$-class if its index $V(\mathcal{C})$ is finite. Thus, by definition, a VC-class of sets picks out strictly less than $2^{n}$ subsets from any set of $n \geq V(\mathcal{C})$ elements. The surprising fact is that such a class can necessarily pick out only a polynomial number $O\left(n^{V(\mathcal{C})-1}\right)$ of subsets, well below the $2^{n}-1$ that the definition appears to allow. This result is a consequence of a combinatorial result, known as Sauer's lemma, which states that the number $\Delta_{n}\left(\mathcal{C}, x_{1}, \ldots, x_{n}\right)$ of subsets picked out by a VC-class $\mathcal{C}$ satisfies

$$
\max _{x_{1}, \ldots, x_{n}} \Delta_{n}\left(\mathcal{C}, x_{1}, \ldots, x_{n}\right) \leq \sum_{j=0}^{V(\mathcal{C})-1}\binom{n}{j} \leq\left(\frac{n e}{V(\mathcal{C})-1}\right)^{V(\mathcal{C})-1} .
$$

Some thought shows that the number of subsets picked out by a collection $\mathcal{C}$ is closely related to the covering numbers of the class of indicator functions $\left\{1_{C}: C \in \mathcal{C}\right\}$ in $L_{1}(Q)$ for discrete, empirical type measures $Q$. By a clever argument, Sauer's lemma can be used to bound the uniform covering (or entropy) numbers for this class. Theorem 2.6.4 asserts that there exists a universal constant $K$ such that, for any VC-class $\mathcal{C}$ of sets,

$$
N\left(\varepsilon, \mathcal{C}, L_{r}(Q)\right) \leq K V(\mathcal{C})(4 e)^{V(\mathcal{C})}\left(\frac{1}{\varepsilon}\right)^{r(V(\mathcal{C})-1)}
$$

for any probability measure $Q$ and $r \geq 1$ and $0<\varepsilon<1$. Consequently, VCclasses are examples of polynomial classes in the sense that their covering numbers are bounded by a polynomial in $1 / \varepsilon$. The upper bound shows that VC-classes satisfy the sufficient conditions for the Glivenko-Cantelli theorem and Donsker theorem discussed previously (with much to spare) provided they possess certain measurability properties.

It is possible to obtain similar results for classes of functions. A collection of real-valued, measurable functions $\mathcal{F}$ on a sample space $\mathcal{X}$ is called a VC-subgraph class (or simply a VC-class of functions) if the collection of all subgraphs of the functions in $\mathcal{F}$ forms a VC-class of sets in $\mathcal{X} \times \mathbb{R}$. Just as for sets, the covering numbers of a VC-subgraph class $\mathcal{F}$ grow polynomially in $1 / \varepsilon$, so that suitably measurable VC-subgraph classes are Glivenko-Cantelli and Donsker under moment conditions on the envelope function.

Among the many examples of VC-classes are the collections of left halflines and lower-left orthants, with which classical empirical process theory is concerned. Methods to construct a great variety of VC-classes are discussed in Section 2.6.5.

The application of the other main Glivenko-Cantelli and Donsker theorem requires estimates on the bracketing numbers of classes of functions. These are given in Chapter 2.7 for classes of smooth functions, sets with smooth boundaries, convex sets, monotone functions, and functions smoothly depending on a parameter. Coupled with the results of Chapter 2.4 and 2.5, these estimates yield many more interesting Donsker classes.

Given a basic collection of Glivenko-Cantelli and Donsker classes and estimates of their entropies, new classes with similar properties can be constructed in several ways. For instance, the symmetric convex hull sconv $\mathcal{F}$ of a class $\mathcal{F}$ is the collection of all functions of the form $\sum_{i=1}^{m} \alpha_{i} f_{i}$, with each $f_{i} \in \mathcal{F}$ and $\sum_{i=1}^{m}\left|\alpha_{i}\right| \leq 1$. In Chapter 2.10 it is shown that the convex hull of a Donsker class is Donsker. In addition to this, Theorem 2.6.9 gives a useful bound for the entropy of a convex hull in the case that covering numbers for $\mathcal{F}$ are polynomial: if

$$
N\left(\varepsilon\|F\|_{Q, 2}, \mathcal{F}, L_{2}(Q)\right) \leq C\left(\frac{1}{\varepsilon}\right)^{V}
$$

then the convex hull of $\mathcal{F}$ satisfies

$$
\log N\left(\varepsilon\|F\|_{Q, 2}, \operatorname{sconv} \mathcal{F}, L_{2}(Q)\right) \leq K\left(\frac{1}{\varepsilon}\right)^{2 V /(V+2)} .
$$

An important feature of this bound is that the power $2 V /(V+2)$ of $1 / \varepsilon$ is strictly less than 2 for any $V$, so that the convex hull of a polynomial class satisfies the uniform entropy condition (2.1.7). This bound is true in particular for VC-hull classes, which are defined as the sequential closures of the convex hulls of VC-classes.

Other operations preserving the Donsker property are considered in Chapter 2.10 and include the formation of classes of functions of the form $\phi\left(f_{1}, \ldots, f_{k}\right)$, for $f_{1}, \ldots, f_{k}$ ranging over given Donsker classes $\mathcal{F}_{1}, \ldots, \mathcal{F}_{k}$ and a fixed Lipschitz function $\phi$ on $\mathbb{R}^{k}$. For example, the classes of pairwise sums $\mathcal{F}+\mathcal{G}$, pairwise infima $\mathcal{F} \wedge \mathcal{G}$, and pairwise suprema $\mathcal{F} \vee \mathcal{G}$, as well as the union $\mathcal{F} \cup \mathcal{G}$, are Donsker classes if both $\mathcal{F}$ and $\mathcal{G}$ are Donsker. Similarly, pairwise products $\mathcal{F} \mathcal{G}$ and quotients $\mathcal{F} / \mathcal{G}$ are Donsker if $\mathcal{F}$ and $\mathcal{G}$ are Donsker and bounded above, or bounded away from, zero. The latter boundedness assumptions can be traded against stronger conditions on the entropies of the classes. Such "permanence properties" applied to the basic Donsker classes resulting from Chapters 2.6 and 2.7 provide a very effective method to verify the Donsker property in, for instance, statistical applications.

The remainder of Part 2 explores refinements, extensions, special classes $\mathcal{F}$, uniformity in the underlying distribution, multiplier processes, partial-sum processes, the non-i.i.d. situation, and moment and tail bounds for the supremum of the empirical process.

The uniformity of weak convergence of $\mathbb{G}_{n}$ to $\mathbb{G}$ with respect to the underlying probability distribution $P$ generating the data is addressed in Chapter 2.8. Again, the main results use either uniform entropy or bracketing entropy.

The viewpoint in Chapter 2.9 on multiplier central limit theorems is that, for a Donsker class $\mathcal{F}$,

$$
\mathbb{G}_{n}=\frac{1}{\sqrt{n}} \sum_{i=1}^{n}\left(\delta_{X_{i}}-P\right) \equiv \frac{1}{\sqrt{n}} \sum_{i=1}^{n} Z_{i} \rightsquigarrow \mathbb{G},
$$

in $\ell^{\infty}(\mathcal{F})$. Then we pose the following question: for what sequences of i.i.d., real-valued random variables $\xi_{1}, \ldots, \xi_{n}$ independent from the original data does it follow that

$$
\frac{1}{\sqrt{n}} \sum_{i=1}^{n} \xi_{i} Z_{i} \rightsquigarrow \mathbb{G} ?
$$

In fact, these two displays turn out to be equivalent if the $\xi_{i}$ have zero mean, have variance 1 , and satisfy the $L_{2,1}$-condition

$$
\left\|\xi_{1}\right\|_{2,1}=\int_{0}^{\infty} \sqrt{\mathrm{P}(|\xi|>t)} d t<\infty
$$

Chapter 2.9 also presents conditional versions of this multiplier central limit theorem. These are basic for part 3's development of limit theorems for the bootstrap empirical process.

Chapter 2.11 gives extensions of the Donsker theorem for sums of independent, but not identically distributed, processes $\sum_{i=1}^{n} Z_{n i}$ indexed by an arbitrary collection $\mathcal{F}$. One example, which occurs naturally in statistical contexts and is covered by this situation, is the empirical process indexed by a collection $\mathcal{F}$ of functions based on observations $X_{n 1}, \ldots, X_{n n}$ that are independent but not identically distributed. Once again we present two main central limit theorems, based on entropy with and without bracketing. Even if specified to the i.i.d. situation, the theorems in Chapter 2.11 are more general than the theorems obtained before. For instance, we use a random entropy condition, rather than a uniform entropy condition, and also consider bracketing using majorizing measures.

Two types of partial-sum processes are studied in Chapter 2.12. The first type is the sequential empirical process

$$
\mathbb{Z}_{n}(s, f)=\frac{1}{\sqrt{n}} \sum_{i=1}^{\lfloor n s\rfloor}\left(f\left(X_{i}\right)-P f\right)=\sqrt{\frac{\lfloor n s\rfloor}{n}} \mathbb{G}_{\lfloor n s\rfloor}(f)
$$

which records the "history" of the empirical processes $\mathbb{G}_{n}$ as sampling progresses. The second type of partial-sum processes studied are those generated by independent random variables located at the points of a lattice. These processes, which can be viewed as closely related to the multiplier processes studied in Chapter 2.9, since they are empirical processes with random masses (the multipliers) at (degenerately) random points, have some special features and deserve special attention.

Chapter 2.13 gives Donsker theorems for several special types of classes $\mathcal{F}$, namely, sequences and elliptical classes.

Part 2 concludes with a detailed study of moment bounds, tail bounds, and exponential bounds for the supremum $\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}$ of the empirical process in Chapter 2.14. The moment bounds play an important role in Chapters 3.2 and 3.4 on the limiting theory of $M$-estimators.

### 2.1.2 Asymptotic Equicontinuity

A class of measurable functions is called pre-Gaussian if the (tight) limit process $\mathbb{G}$ in the uniform central limit theorem (2.1.1) exists. By Kolmogorov's extension theorem, there always exists a zero-mean Gaussian process $\{\mathbb{G} f: f \in \mathcal{F}\}$ with covariance function given by (2.1.2). A more precise description of pre-Gaussianity is that there exists a version of this Gaussian process that is a tight, Borel measurable map from some probability space into $\ell^{\infty}(\mathcal{F})$. Usually the name "Brownian bridge" introduced earlier refers to this tight process with its special sample path properties, rather than to the general stochastic process $\mathbb{G}$.

It is desirable to have a more concrete description of the tightness property of a Brownian bridge and hence of the notion of pre-Gaussianity. In Chapter 1.5 it was seen that tightness of a random map into $\ell^{\infty}(\mathcal{F})$ is closely connected to continuity of its sample paths. Define a seminorm $\rho_{P}$ by

$$
\rho_{P}(f)=\left(P(f-P f)^{2}\right)^{1 / 2}
$$

Then, by Example 1.5.10, a class $\mathcal{F}$ is pre-Gaussian if and only if

- $\mathcal{F}$ is totally bounded for $\rho_{P}$,
- there exists a version of $\mathbb{G}$ with uniformly $\rho_{P}$-continuous sample paths $f \mapsto \mathbb{G}(f)$.
Actually, this example shows that instead of the centered $L_{2}$-norm $\rho_{P}$, any centered $L_{r}$-norm can be used as well. However, the $L_{2}$-norm appears to be the most convenient. ${ }^{\text {b }}$

While pre-Gaussianity of a class $\mathcal{F}$ is necessary for the uniform central limit theorem, it is not sufficient. A Donsker class $\mathcal{F}$ satisfies the stronger condition that the sequence $\mathbb{G}_{n}$ is asymptotically tight. By Theorem 1.5.7, the latter entails replacing the condition that the sample paths of the limit process are continuous by the condition that the empirical process is asymptotically continuous: for every $\varepsilon>0$,

$$
\begin{equation*}
\lim _{\delta \downarrow 0} \limsup _{n \rightarrow \infty} \mathrm{P}^{*}\left(\sup _{\rho_{P}(f-g)<\delta}\left|\mathbb{G}_{n}(f-g)\right|>\varepsilon\right)=0 . \tag{2.1.8}
\end{equation*}
$$

Much of Part 2 is concerned with this equicontinuity condition. With the notation ${ }^{\sharp} \mathcal{F}_{\delta}=\left\{f-g: f, g \in \mathcal{F}, \rho_{P}(f-g)<\delta\right\}$, it is equivalent to the following statement: for every decreasing sequence $\delta_{n} \downarrow 0$,

$$
\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}_{\delta_{n}}} \xrightarrow{\mathrm{P}^{*}} 0
$$

[^0](Problem 2.1.5). In view of Theorem 1.5.7, a class $\mathcal{F}$ is Donsker if and only if $\mathcal{F}$ is totally bounded in $\mathcal{L}_{2}(P)$ and satisfies the asymptotic equicontinuity condition as in the preceding displays.

### 2.1.3 Maximal Inequalities

It follows that both the law of large numbers and the central limit theorem are concerned with showing that a supremum of real-valued variables converges to zero. To a certain extent, the derivation of these results is done in parallel, as both need to make use of maximal inequalities that bound probabilities involving suprema of random variables. Chapter 2.2 develops such inequalities in an abstract setting, using Orlicz norms. If $\psi$ is a nondecreasing, convex function with $\psi(0)=0$, then the Orlicz norm $\|X\|_{\psi}$ of a random variable $X$ is defined by

$$
\|X\|_{\psi}=\inf \left\{C>0: \mathrm{E} \psi\left(\frac{|X|}{C}\right) \leq 1\right\} .
$$

The functions $\psi$ of primary interest are $\psi(x)=x^{p}$ and $\psi(x)=\exp \left(x^{p}\right)-1$ (for $p \geq 1$ or adapted versions if $0<p<1$ ). For $\psi(x)=x^{p}$, the Orlicz norm $\|X\|_{\psi}$ is just the usual $L_{p}$-norm $\|X\|_{p}$. The key Lemma 2.2.2 provides a bound for the Orlicz norm of a finite maximum $\max _{1 \leq i \leq m} X_{i}$ in terms of the Orlicz norms of the variables $X_{i}$ and the inverse function $\psi^{-1}(m)$. Suppose that $\limsup _{x, y \rightarrow \infty} \psi(x) \psi(y) / \psi(x y)<\infty$. Then there is a constant $K$ depending only on $\psi$ so that, for arbitrary random variables $X_{1}, \ldots, X_{m}$,

$$
\left\|\max _{1 \leq i \leq m} X_{i}\right\|_{\psi} \leq K \psi^{-1}(m) \max _{1 \leq i \leq m}\left\|X_{i}\right\|_{\psi}
$$

The interesting feature of this inequality is that a bound on $\max _{i}\left\|X_{i}\right\|_{\psi}$ for a rapidly growing function $\psi$, such as $\psi_{2}(x)=\exp \left(x^{2}\right)-1$, yields a bound on the rate of growth with $m$ of the Orlicz norm of max $X_{i}$ governed by the slowly growing function $\psi^{-1}(m)$, such as $\psi_{2}^{-1}(m)=\sqrt{\log (m+1)}$. Since Gaussian random variables and sums of independent, bounded random variables enjoy finite $\psi_{2}$-Orlicz norms, the particular function $\psi_{2}^{-1}(m)$ figures prominently in the development in later chapter.

Bounds on finite suprema can be extended to general maximal inequalities with the help of the chaining method, which Kolmogorov pioneered. The idea is to relate maxima over an infinite set to maxima of increments over an increasing sequence of finite sets. Here covering numbers are introduced to measure the size of the approximating finite sets. For a semimetric space ( $T, d$ ), the covering number $N(\varepsilon, T, d)$ is defined as the minimal number of balls of radius $\varepsilon$ needed to cover $T$. Given a separable stochastic process $\left\{X_{t}: t \in T\right\}$ and a fixed function $\psi$, define a semimetric by $d(s, t)=\left\|X_{s}-X_{t}\right\|_{\psi}$ for every $s, t$. Then, for any $\eta, \delta>0$ and a constant $K$,

$$
\left\|\sup _{d(s, t) \leq \delta}\left|X_{s}-X_{t}\right|\right\|_{\psi} \leq K\left[\int_{0}^{\eta} \psi^{-1}(N(\varepsilon, d)) d \varepsilon+\delta \psi^{-1}\left(N^{2}(\eta, d)\right)\right]
$$

Thus the $\psi$-norm of a supremum is bounded by an integral that involves the inverse $\psi^{-1}$ and the covering numbers of the index set $T$ with respect to the intrinsic semimetric $d$.

In particular, a process $\left\{X_{t}: t \in T\right\}$ is said to be sub-Gaussian if the $\psi_{2}$-norms of the increments $X_{s}-X_{t}$ are finite. This can be shown to be true if and only if, for some semimetric $d$,

$$
\mathrm{P}\left(\left|X_{s}-X_{t}\right|>x\right) \leq 2 e^{-\frac{1}{2} x^{2} / d^{2}(s, t)}, \quad \text { for every } x>0 .
$$

Then the preceding inequality can be simplified to

$$
\mathrm{E} \sup _{d(s, t) \leq \delta}\left|X_{s}-X_{t}\right| \leq K \int_{0}^{\delta} \sqrt{\log N(\varepsilon, T, d)} d \varepsilon
$$

This inequality explains the appearance of the square root of the logarithm of the entropy in the sufficient integral conditions for a class to be Donsker, which were discussed in the preceding chapter.

## * 2.1.4 The Central Limit Theorem in Banach Spaces

The convergence in distribution in $\ell^{\infty}(\mathcal{F})$ of the empirical process $\mathbb{G}_{n}= n^{-1 / 2} \sum_{i=1}^{n}\left(\delta_{X_{i}}-P\right)$ can be considered a central limit theorem for the i.i.d. random elements $\delta_{X_{1}}-P, \ldots, \delta_{X_{n}}-P$ in the Banach space $\ell^{\infty}(\mathcal{F})$. In this section it is first shown that, conversely, any central limit theorem in a Banach space can be stated in terms of empirical processes. Next it is argued that this observation is only moderately useful.

Suppose $Z_{1}, \ldots, Z_{n}$ are i.i.d. random maps with values in a Banach space $\mathbf{X}$. Let $\mathcal{F}$ be a subset of the dual space of $\mathbf{X}$ such that $\sup _{f}|f(x)|= \|x\|$ for every $x$ and such that $f\left(Z_{i}\right)$ is measurable for each $f$. A mean of $Z_{i}$ is an element $\mathrm{E} Z_{i}$ of $\mathbf{X}$ such that $f\left(\mathrm{E} Z_{i}\right)=\mathrm{E} f\left(Z_{i}\right)$, for every $f \in \mathcal{F}$. Every given element $x \in \mathbf{X}$ can be identified with a map

$$
x^{* *}: f \mapsto f(x),
$$

from $\mathcal{F}$ to $\mathbb{R}$. By assumption, this gives an isometric identification $x \leftrightarrow x^{* *}$ of $\mathbf{X}$ with a subset of $\ell^{\infty}(\mathcal{F})$. Thus random maps $Z_{1}, \ldots, Z_{n}$ in $\mathbf{X}$ satisfy the central limit theorem if and only if the random elements $Z_{1}^{* *}, \ldots, Z_{n}^{* *}$ satisfy the central limit theorem in $\ell^{\infty}(\mathcal{F})$. Since $\sum_{i=1}^{n}\left(Z_{i}-\mathrm{E} Z_{i}\right)^{* *}(f)= \sum_{i=1}^{n}\left(f\left(Z_{i}\right)-\mathrm{E} f\left(Z_{i}\right)\right)$, this appears to be the case if and only if $\mathcal{F}$ is a Donsker class of functions. However, for an accurate statement, it is necessary to describe the measurability structure more precisely.

[^1]2.1.9 Example. In case of a separable Banach space it is usually assumed that $Z_{1}, \ldots, Z_{n}$ are Borel measurable maps. Then "i.i.d." can be understood in the usual manner. If $\mathcal{F}$ is taken equal to the unit ball of the dual space, then the equality $\sup _{f}|f(x)|=\|x\|$ is valid by the Hahn-Banach theorem, and the $\sigma$-field generated by $\mathcal{F}$ is precisely the Borel $\sigma$-field. It follows that the $Z_{i}$ are Borel measurable if and only if every $f\left(Z_{i}\right)$ is measurable.

The conclusion is that the sequence $n^{-1 / 2} \sum_{i=1}^{n}\left(Z_{i}-\mathrm{E} Z_{i}\right)$ converges in distribution if and only if the unit ball of the dual space is Donsker with respect to the common Borel law of the $Z_{i}$.
2.1.10 Example. Suppose $Z_{1}, \ldots, Z_{n}$ are i.i.d. stochastic processes with bounded sample paths, indexed by an arbitrary set $\tilde{\mathcal{F}}$ (not necessarily a class of functions). The notion "i.i.d." should include that the finitedimensional marginals $\left(Z_{i}\left(\tilde{f}_{1}\right), \ldots, Z_{i}\left(\tilde{f}_{k}\right)\right)$ are i.i.d. vectors. In general, this does not determine the "distribution" of the processes in $\ell^{\infty}(\tilde{\mathcal{F}})$ adequately. Assume in addition that each $Z_{i}$ is defined on a product probability space $\left(\mathcal{X}^{n}, \mathcal{A}^{n},{\underset{\sim}{P}}^{n}\right)$ as $Z_{i}\left(x_{1}, \ldots, x_{n}\right) \tilde{f}=Z\left(\tilde{f}, x_{i}\right)$, for some fixed stochastic process $\{Z(\tilde{f}, x): \tilde{f} \in \tilde{\mathcal{F}}\}$. Then $\sum_{i=1}^{n}\left(Z_{i}(\tilde{f})-\mathrm{E} Z_{i}(\tilde{f})\right)=\sum_{i=1}^{n}\left(f\left(x_{i}\right)-P f\right)$, for the function $f$ defined by $f(x)=Z(\tilde{f}, x)$. That $Z$ is a stochastic process means precisely that each function $x \mapsto f(x)$ is measurable. The processes $Z_{1}, Z_{2}, \ldots$ satisfy the central limit theorem in $\ell^{\infty}(\tilde{\mathcal{F}})$ if and only if the class of functions $\{f: \tilde{f} \in \tilde{\mathcal{F}}\}$ is $P$-Donsker.

Thus the central limit theorem in an arbitrary Banach space can be phrased as a result about empirical processes. Even though this conclusion is formally correct, the methods (traditionally) used for proving empirical central limit theorems yield unsatisfactory descriptions of the central limit theorem in special Banach spaces. For instance, the conditions for the central limit theorem in $L_{p}$-space are simple and well known. If ( $S, \Sigma, \mu$ ) is a $\sigma$-finite measure space and $Z_{1}, \ldots, Z_{n}$ are i.i.d., zero-mean Borel measurable maps into $L_{p}(S, \Sigma, \mu)$, then the sequence $n^{-1 / 2} \sum_{i=1}^{n} Z_{i}$ converges weakly if and only if $\mathrm{P}\left(\left\|Z_{1}\right\|_{p}>t\right)=o\left(t^{-2}\right)$ as $t \rightarrow \infty$ and

$$
\int_{S}\left(\mathrm{E} Z_{1}^{2}(s)\right)^{p / 2} d \mu(s)<\infty
$$

(In case $p=2$, this can be simplified to the single requirement $\mathrm{E}\left\|Z_{1}\right\|_{2}^{2}<\infty$. For this case, the theorem is given in Chapter 1.8.) In terms of empirical processes, this becomes as follows.
2.1.11 Proposition. Let ( $S, \Sigma, \mu$ ) be a $\sigma$-finite measure space, let $1 \leq p<\infty$, and let $P$ be a Borel probability measure on $L_{p}(S, \Sigma, \mu)$. Then the unit ball of the dual space of $L_{p}(S, \Sigma, \mu)$ is $P$-Donsker if and only if $\int_{S}\left(\int z(\omega, s)^{2} d P(\omega)\right)^{p / 2} d \mu(s)<\infty$ and $P\left(\|z\|_{p}>t\right)=o\left(t^{-2}\right)$ as $t \rightarrow \infty$.

This proposition is proved in texts on probability in Banach spaces. ${ }^{\dagger}$ The methods developed in this part do not yield this result. In fact, already the formulation of the proposition is unnecessarily complicated: it is awkward to push this central limit theorem into an empirical mold.

On the other hand, Part 2 gives many interesting results on the central limit theorem in Banach spaces of the type $\ell^{\infty}(\mathcal{F})$, where $\mathcal{F}$ is a collection of measurable functions. For this large class of Banach spaces, sufficient conditions for the central limit theorem go beyond the Banach space structure, but they can be stated in terms of the structure of the function class $\mathcal{F}$.

## Problems and Complements

1. (Total boundedness in $L_{2}(P)$ ) If $\mathcal{F}$ is totally bounded in $L_{2}(P)$, then it is totally bounded for the seminorm $\rho_{P}$. If $\mathcal{F}$ is totally bounded for $\rho_{P}$ and $\|P\|_{\mathcal{F}}=\sup \{|P f|: f \in \mathcal{F}\}$ is finite, then it is totally bounded in $L_{2}(P)$.
[Hint: Suppose $f_{1}, \ldots, f_{m}$ form an $\varepsilon$-net for $\rho_{P}$. If $\sup \{|P f|: f \in \mathcal{F}\}$ is finite, then the numbers $P f$ with $f$ ranging over some $\rho_{P}$-ball of radius $\varepsilon$ are contained in an interval. Choose for every $f_{i}$ a finite collection $f_{i, j}$ such that, for every $f$ with $\rho_{P}\left(f-f_{i}\right)<\varepsilon$, there is an $f_{i, j}$ with $\left|P f-P f_{i, j}\right|<\varepsilon$. Then the $f_{i, j}$ form a $\sqrt{5} \varepsilon$-net for $\mathcal{F}$ in $L_{2}(P)$.]
2. (Using $\|\cdot\|_{P, 2}$ instead of $\rho_{P}$ ) Suppose $\sup \{|P f|: f \in \mathcal{F}\}$ is finite. Then a class $\mathcal{F}$ of measurable functions is $P$-Donsker if and only if $\mathcal{F}$ is totally bounded in $L_{2}(P)$ and the empirical process is asymptotically equicontinuous in probability for the $L_{2}(P)$-semimetric.
[Hint: Use the previous problem and the next problem.]
3. Suppose $\rho$ is a semimetric on a class of measurable functions $\mathcal{F}$ that is uniformly stronger than $\rho_{P}$ in the sense that $\rho_{P}(f-g) \leq \phi(\rho(f, g))$, for a function $\phi$ with $\phi(\varepsilon) \rightarrow 0$ as $\varepsilon \downarrow 0$. Suppose $\mathcal{F}$ is totally bounded under $\rho$. Then $\mathcal{F}$ is $P$-Donsker if and only if the empirical process indexed by $\mathcal{F}$ is asymptotically equicontinuous in probability with respect to $\rho$.
[Hint: Use the addendum to Theorem 1.5.7.]
4. (Brownian motion) If $\mathcal{F}$ is $P$-pre-Gaussian and $\|P\|_{\mathcal{F}}<\infty$, then a $P$ Brownian bridge has uniformly continuous sample paths with respect to the $L_{2}(P)$-semimetric. The process $\mathbb{Z}(f)=\mathbb{G}(f)+\xi P f$ for a standard normal variable $\xi$ independent of $\mathbb{G}$ has a version that is a Borel measurable, tight map in $\ell^{\infty}(\mathcal{F})$. This process, which is Gaussian with mean zero and covariance function $P f g$, is called a Brownian motion.
5. If $a_{n}:[0,1] \mapsto[0, \infty)$ is a sequence of nondecreasing functions, then there exists $\delta_{n} \downarrow 0$ such that $\limsup a_{n}\left(\delta_{n}\right)=\lim _{\delta \rightarrow 0} \limsup _{n \rightarrow \infty} a_{n}(\delta)$. Deduce that $\lim _{\delta \rightarrow 0} \lim \sup _{n \rightarrow \infty} a_{n}(\delta)=0$ if and only if $a_{n}\left(\delta_{n}\right) \rightarrow 0$ for every $\delta_{n} \rightarrow 0$.

[^2]6. The packing numbers of a ball of radius $R$ in $\mathbb{R}^{d}$ satisfy
$$
D(\varepsilon, B(0, R),\|\cdot\|) \leq\left(\frac{3 R}{\varepsilon}\right)^{d}, \quad 0<\varepsilon \leq R
$$
for the Euclidean norm $\|\cdot\|$.
[Hint: If $x_{1}, \ldots, x_{m}$ is an $\varepsilon$-separated subset in $B(0, R)$, then the balls of radii $\varepsilon / 2$ around the $x_{i}$ are disjoint and contained in $B(0, R+\varepsilon / 2)$. Comparison of the volume of their union and the volume of $B(0, R+\varepsilon / 2)$ shows that $m(\varepsilon / 2)^{d} \leq(R+\varepsilon / 2)^{d}$.]

## 2.2

## Maximal Inequalities and Covering Numbers

In this chapter we derive a class of maximal inequalities that can be used to establish the asymptotic equicontinuity of the empirical process. Since the inequalities have much wider applicability, we temporarily leave the empirical process framework.

Let $\psi$ be a nondecreasing, convex function with $\psi(0)=0$ and $X$ a random variable. Then the Orlicz norm $\|X\|_{\psi}$ is defined as

$$
\|X\|_{\psi}=\inf \left\{C>0: \mathrm{E} \psi\left(\frac{|X|}{C}\right) \leq 1\right\} .
$$

(Here the infimum over the empty set is $\infty$.) Using Jensen's inequality, it is not difficult to check that this indeed defines a norm (on the set of random variables for which $\|X\|_{\psi}$ is finite). The best-known examples of Orlicz norms are those corresponding to the functions $x \mapsto x^{p}$ for $p \geq 1$ : the corresponding Orlicz norm is simply the $L_{p}$-norm

$$
\|X\|_{p}=\left(\mathrm{E}|X|^{p}\right)^{1 / p}
$$

For our purposes, Orlicz norms of more interest are the ones given by $\psi_{p}(x)=e^{x^{p}}-1$ for $p \geq 1$, which give much more weight to the tails of $X$. The bound $x^{p} \leq \psi_{p}(x)$ for all nonnegative $x$ implies that $\|X\|_{p} \leq\|X\|_{\psi_{p}}$ for each $p$. It is not true that the exponential Orlicz norms are all bigger than all $L_{p}$-norms. However, we have the inequalities

$$
\begin{aligned}
\|X\|_{\psi_{p}} & \leq\|X\|_{\psi_{q}}(\log 2)^{p / q}, \quad p \leq q \\
\|X\|_{p} & \leq p!\|X\|_{\psi_{1}}
\end{aligned}
$$

(see Problem 2.2.5). Since for the present purposes fixed constants in inequalities are irrelevant, this means that a bound on an exponential Orlicz norm always gives a better result than a bound on an $L_{p}$-norm.

Any Orlicz norm can be used to obtain an estimate of the tail of a distribution. By Markov's inequality,

$$
\mathrm{P}(|X|>x) \leq \mathrm{P}\left(\psi\left(|X| /\|X\|_{\psi}\right) \geq \psi\left(x /\|X\|_{\psi}\right)\right) \leq \frac{1}{\psi\left(x /\|X\|_{\psi}\right)}
$$

For $\psi_{p}(x)=e^{x^{p}}-1$, this leads to tail estimates $\exp \left(-C x^{p}\right)$ for any random variable with a finite $\psi_{p}$-norm. Conversely, an exponential tail bound of this type shows that $\|X\|_{\psi_{p}}$ is finite.
2.2.1 Lemma. Let $X$ be a random variable with $\mathrm{P}(|X|>x) \leq K e^{-C x^{p}}$ for every $x$, for constants $K$ and $C$, and for $p \geq 1$. Then its Orlicz norm satisfies $\|X\|_{\psi_{p}} \leq((1+K) / C)^{1 / p}$.

Proof. By Fubini's theorem

$$
\mathrm{E}\left(e^{D|X|^{p}}-1\right)=\mathrm{E} \int_{0}^{|X|^{p}} D e^{D s} d s=\int_{0}^{\infty} P\left(|X|>s^{1 / p}\right) D e^{D s} d s
$$

Now insert the inequality on the tails of $|X|$ and obtain the explicit upper bound $K D /(C-D)$. This is less than or equal to 1 for $D^{-1 / p}$ greater than or equal to $((1+K) / C)^{1 / p}$. .

Next consider the $\psi$-norm of a maximum of finitely many random variables. Using the fact that $\max \left|X_{i}\right|^{p} \leq \sum\left|X_{i}\right|^{p}$, one easily obtains for the $L_{p}$-norms

$$
\left\|\max _{1 \leq i \leq m} X_{i}\right\|_{p}=\left(\mathrm{E} \max _{1 \leq i \leq m}\left|X_{i}\right|^{p}\right)^{1 / p} \leq m^{1 / p} \max _{1 \leq i \leq m}\left\|X_{i}\right\|_{p}
$$

A similar inequality is valid for many Orlicz norms, in particular the exponential ones. Here, in the general case, the factor $m^{1 / p}$ becomes $\psi^{-1}(m)$, where $\psi^{-1}$ is the inverse function of $\psi$.
2.2.2 Lemma. Let $\psi$ be a convex, nondecreasing, nonzero function with $\psi(0)=0$ and $\limsup _{x, y \rightarrow \infty} \psi(x) \psi(y) / \psi(c x y)<\infty$ for some constant $c$. Then, for any random variables $X_{1}, \ldots, X_{m}$,

$$
\left\|\max _{1 \leq i \leq m} X_{i}\right\|_{\psi} \leq K \psi^{-1}(m) \max _{i}\left\|X_{i}\right\|_{\psi}
$$

for a constant $K$ depending only on $\psi$.

Proof. For simplicity of notation assume first that $\psi(x) \psi(y) \leq \psi(c x y)$ for all $x, y \geq 1$. In that case $\psi(x / y) \leq \psi(c x) / \psi(y)$ for all $x \geq y \geq 1$. Thus, for $y \geq 1$ and any $C$,

$$
\begin{aligned}
\max \psi\left(\frac{\left|X_{i}\right|}{C y}\right) & \leq \max \left[\frac{\psi\left(c\left|X_{i}\right| / C\right)}{\psi(y)}+\psi\left(\frac{\left|X_{i}\right|}{C y}\right) 1\left\{\frac{\left|X_{i}\right|}{C y}<1\right\}\right] \\
& \leq \sum \frac{\psi\left(c\left|X_{i}\right| / C\right)}{\psi(y)}+\psi(1)
\end{aligned}
$$

Set $C=c \max \left\|X_{i}\right\|_{\psi}$, and take expectations to get

$$
\mathrm{E} \psi\left(\frac{\max \left|X_{i}\right|}{C y}\right) \leq \frac{m}{\psi(y)}+\psi(1)
$$

When $\psi(1) \leq 1 / 2$, this is less than or equal to 1 for $y=\psi^{-1}(2 m)$, which is greater than 1 under the same condition. Thus

$$
\left\|\max \left|X_{i}\right|\right\|_{\psi} \leq \psi^{-1}(2 m) c \max \left\|X_{i}\right\|_{\psi}
$$

By the convexity of $\psi$ and the fact that $\psi(0)=0$, it follows that $\psi^{-1}(2 m) \leq 2 \psi^{-1}(m)$. The proof is complete for every special $\psi$ that meets the conditions made previously.

For a general $\psi$, there are constants $\sigma \leq 1$ and $\tau>0$ such that $\phi(x)=\sigma \psi(\tau x)$ satisfies the conditions of the previous paragraph. Apply the inequality to $\phi$, and observe that $\|X\|_{\psi} \leq\|X\|_{\phi} /(\sigma \tau) \leq\|X\|_{\psi} / \sigma$ (Problem 2.2.3).

For the present purposes, the value of the constant in the previous lemma is irrelevant. (For the $L_{p}$-norms, it can be taken equal to 1 .) The important conclusion is that the inverse of the $\psi$-function determines the size of the $\psi$-norm of a maximum in comparison to the $\psi$-norms of the individual terms. The $\psi$-norm grows slowest for rapidly increasing $\psi$. For $\psi(x)=e^{x^{p}}-1$, the growth is at most logarithmic, because

$$
\psi_{p}^{-1}(m)=(\log (1+m))^{1 / p}
$$

The previous lemma is useless in the case of a maximum over infinitely many variables. However, such a case can be handled via repeated application of the lemma via a method known as chaining. Every random variable in the supremum is written as a sum of "little links," and the bound depends on the number and size of the little links needed. For a stochastic process $\left\{X_{t}: t \in T\right\}$, the number of links depends on the entropy of the index set for the semimetric

$$
d(s, t)=\left\|X_{s}-X_{t}\right\|_{\psi} .
$$

The general definition of "metric entropy" is as follows.
2.2.3 Definition (Covering numbers). Let ( $T, d$ ) be an arbitrary semimetric space. Then the covering number $N(\varepsilon, d)$ is the minimal number of balls of radius $\varepsilon$ needed to cover $T$. Call a collection of points $\varepsilon$-separated if the distance between each pair of points is strictly larger than $\varepsilon$. The packing number $D(\varepsilon, d)$ is the maximum number of $\varepsilon$-separated points in $T$. The corresponding entropy numbers are the logarithms of the covering and packing numbers, respectively.

For the present purposes, both covering and packing numbers can be used. In all arguments one can be replaced by the other through the inequalities

$$
N(\varepsilon, d) \leq D(\varepsilon, d) \leq N\left(\frac{1}{2} \varepsilon, d\right) .
$$

Clearly, covering and packing numbers become bigger as $\varepsilon \downarrow 0$. By definition, the semimetric space $T$ is totally bounded if and only if the covering and packing numbers are finite for every $\varepsilon>0$. The upper bound in the following maximal inequality depends on the rate at which $D(\varepsilon, d)$ grows as $\varepsilon \downarrow 0$, as measured through an integral criterion.
2.2.4 Theorem. Let $\psi$ be a convex, nondecreasing, nonzero function with $\psi(0)=0$ and $\limsup _{x, y \rightarrow \infty} \psi(x) \psi(y) / \psi(c x y)<\infty$, for some constant $c$. Let $\left\{X_{t}: t \in T\right\}$ be a separable stochastic process ${ }^{\ddagger}$ with

$$
\left\|X_{s}-X_{t}\right\|_{\psi} \leq C d(s, t), \quad \text { for every } s, t
$$

for some semimetric $d$ on $T$ and a constant $C$. Then, for any $\eta, \delta>0$,

$$
\left\|\sup _{d(s, t) \leq \delta}\left|X_{s}-X_{t}\right|\right\|_{\psi} \leq K\left[\int_{0}^{\eta} \psi^{-1}(D(\varepsilon, d)) d \varepsilon+\delta \psi^{-1}\left(D^{2}(\eta, d)\right)\right],
$$

for a constant $K$ depending on $\psi$ and $C$ only.
2.2.5 Corollary. The constant $K$ can be chosen such that

$$
\left\|\sup _{s, t}\left|X_{s}-X_{t}\right|\right\|_{\psi} \leq K \int_{0}^{\operatorname{diam} T} \psi^{-1}(D(\varepsilon, d)) d \varepsilon
$$

where $\operatorname{diam} T$ is the diameter of $T$.
Proof. Assume without loss of generality that the packing numbers and the associated "covering integral" are finite. Construct nested sets $T_{0} \subset T_{1} \subset T_{2} \subset \cdots \subset T$ such that every $T_{j}$ is a maximal set of points such that $d(s, t)>\eta 2^{-j}$ for every $s, t \in T_{j}$ where "maximal" means that no point can be added without destroying the validity of the inequality. By

[^3]the definition of packing numbers, the number of points in $T_{j}$ is less than or equal to $D\left(\eta 2^{-j}, d\right)$.
"Link" every point $t_{j+1} \in T_{j+1}$ to a unique $t_{j} \in T_{j}$ such that $d\left(t_{j}, t_{j+1}\right) \leq \eta 2^{-j}$. Thus obtain for every $t_{k+1}$ a chain $t_{k+1}, t_{k}, \ldots, t_{0}$ that connects it to a point in $T_{0}$. For arbitrary points $s_{k+1}, t_{k+1}$ in $T_{k+1}$, the difference in increments along their chains can be bounded by
$$
\begin{aligned}
\left|\left(X_{s_{k+1}}-X_{s_{0}}\right)-\left(X_{t_{k+1}}-X_{t_{0}}\right)\right| & =\left|\sum_{j=0}^{k}\left(X_{s_{j+1}}-X_{s_{j}}\right)-\sum_{j=0}^{k}\left(X_{t_{j+1}}-X_{t_{j}}\right)\right| \\
& \leq 2 \sum_{j=0}^{k} \max \left|X_{u}-X_{v}\right|
\end{aligned}
$$
where for fixed $j$ the maximum is taken over all links $(u, v)$ from $T_{j+1}$ to $T_{j}$. Thus the $j$ th maximum is taken over at most $\# T_{j+1}$ links, with each link having a $\psi$-norm $\left\|X_{u}-X_{v}\right\|_{\psi}$ bounded by $C d(u, v) \leq C \eta 2^{-j}$. It follows with the help of Lemma 2.2.2 that, for a constant depending only on $\psi$ and $C$,
$$
\begin{align*}
\left\|\max _{s, t \in T_{k+1}} \mid\left(X_{s}-X_{s_{0}}\right)-\left(X_{t}-X_{t_{0}}\right)\right\|_{\psi} & \leq K \sum_{j=0}^{k} \psi^{-1}\left(D\left(\eta 2^{-j-1}, d\right)\right) \eta 2^{-j} \\
& \leq 4 K \int_{0}^{\eta} \psi^{-1}(D(\varepsilon, d)) d \varepsilon \tag{2.2.6}
\end{align*}
$$

In this bound, $s_{0}$ and $t_{0}$ are the endpoints of the chains starting at $s$ and $t$, respectively.

The maximum of the increments $\left|X_{s_{k+1}}-X_{t_{k+1}}\right|$ can be bounded by the maximum on the left side of (2.2.6) plus the maximum of the discrepancies $\left|X_{s_{0}}-X_{t_{0}}\right|$ at the end of the chains. The maximum of the latter discrepancies will be analyzed by a seemingly circular argument. For every pair of endpoints $s_{0}, t_{0}$ of chains starting at two points in $T_{k+1}$ within distance $\delta$ of each other, choose exactly one pair $s_{k+1}, t_{k+1}$ in $T_{k+1}$, with $d\left(s_{k+1}, t_{k+1}\right)<\delta$, whose chains end at $s_{0}, t_{0}$. By definition of $T_{0}$, this gives at most $D^{2}(\eta, d)$ pairs. By the triangle inequality,

$$
\left|X_{s_{0}}-X_{t_{0}}\right| \leq\left|\left(X_{s_{0}}-X_{s_{k+1}}\right)-\left(X_{t_{0}}-X_{t_{k+1}}\right)\right|+\left|X_{s_{k+1}}-X_{t_{k+1}}\right| .
$$

Take the maximum over all pairs of endpoints $s_{0}, t_{0}$ as above. Then the corresponding maximum over the first term on the right in the last display is bounded by the maximum in the left side of (2.2.6). Its $\psi$-norm can be bounded by the right side of this equation. Combine this with (2.2.6) to find that

$$
\left\|\max _{\substack{s, t \in T_{k+1} \\ d(s, t)<\delta}}\left|X_{s}-X_{t}\right|\right\|_{\psi} \leq 8 K \int_{0}^{\eta} \psi^{-1}(D(\varepsilon, d)) d \varepsilon+\left\|\max \left|X_{s_{k+1}}-X_{t_{k+1}}\right|\right\|_{\psi}
$$

Here the maximum on the right is taken over the pairs $s_{k+1}, t_{k+1}$ in $T_{k+1}$ uniquely attached to the pairs $s_{0}, t_{0}$ as above. Thus the maximum is over at most $D^{2}(\eta, d)$ terms, each of whose $\psi$-norm is bounded by $\delta$. Its $\psi$-norm is bounded by $K \psi^{-1}\left(D^{2}(\eta, d)\right) \delta$.

Thus the upper bound given by the theorem is a bound for the maximum of increments over $T_{k+1}$. Let $k$ tend to infinity to conclude the proof.

The corollary follows immediately from the previous proof, after noting that, for $\eta$ equal to the diameter of $T$, the set $T_{0}$ consists of exactly one point. In that case $s_{0}=t_{0}$ for every pair $s, t$, and the increments at the end of the chains are zero. The corollary also follows from the theorem upon taking $\eta=\delta=\operatorname{diam} T$ and noting that $D(\eta, d)=1$, so that the second term in the maximal inequality can also be written $\delta \psi^{-1}(D(\eta, d))$. Since the function $\varepsilon \mapsto \psi^{-1}(D(\varepsilon, d))$ is decreasing, this term can be absorbed into the integral, perhaps at the cost of increasing the constant $K$.

Though the theorem gives a bound on the continuity modulus of the process, a bound on the maximum of the process will be needed. Of course, for any $t_{0}$,

$$
\left\|\sup _{t}\left|X_{t}\right|\right\|_{\psi} \leq\left\|X_{t_{0}}\right\|_{\psi}+\int_{0}^{\operatorname{diam} T} \psi^{-1}(D(\varepsilon, d)) d \varepsilon
$$

Nevertheless, to state the maximal inequality in terms of the increments appears natural. The increment bound shows that the process $X$ is continuous in $\psi$-norm, whenever the covering integral $\int_{0}^{\eta} \psi^{-1}(D(\varepsilon, d)) d \varepsilon$ converges for some $\eta>0$. (In that case, the right side in Theorem 2.2.4 can be made arbitrarily small by choosing first $\eta$ small and next $\delta$.) It is a small step to deduce the continuity of almost all sample paths from this inequality, but this is not needed at this point (Problem 2.2.17).

### 2.2.1 Sub-Gaussian Inequalities

A standard normal variable has tails of the order $x^{-1} \exp -\frac{1}{2} x^{2}$ and satisfies $\mathrm{P}(|X|>x) \leq 2 \exp -\frac{1}{2} x^{2}$ for every $x$. By direct calculation one finds a $\psi_{2}-$ norm of $\sqrt{8 / 3}$. In this subsection we study random variables satisfying similar tail bounds.

Hoeffding's inequality asserts a "sub-Gaussian" tail bound for random variables of the form $X=\sum X_{i}$ with $X_{1}, \ldots, X_{n}$ i.i.d. with zero means and bounded range. (See Proposition A.6.1.) The following special case of Hoeffding's inequality will be needed.
2.2.7 Lemma (Hoeffding's inequality). Let $a_{1}, \ldots, a_{n}$ be constants and $\varepsilon_{1}, \ldots, \varepsilon_{n}$ be Rademacher random variables; i.e., with $\mathrm{P}\left(\varepsilon_{i}=1\right)=\mathrm{P}\left(\varepsilon_{i}=\right. -1)=1 / 2$. Then

$$
\mathrm{P}\left(\left|\sum \varepsilon_{i} a_{i}\right|>x\right) \leq 2 e^{-\frac{1}{2} x^{2} /\|a\|^{2}}
$$

for the Euclidean norm $\|a\|$. Consequently, $\left\|\sum \varepsilon_{i} a_{i}\right\|_{\psi_{2}} \leq \sqrt{6}\|a\|$.

Proof. For any $\lambda$ and Rademacher variable $\varepsilon$, one has $\mathrm{E} e^{\lambda \varepsilon}=\left(e^{\lambda}+\right. \left.e^{-\lambda}\right) / 2 \leq e^{\lambda^{2} / 2}$, where the last inequality follows after writing out the power series. Thus by Markov's inequality, for any $\lambda>0$,

$$
\mathrm{P}\left(\sum_{i=1}^{n} a_{i} \varepsilon_{i}>x\right) \leq e^{-\lambda x} \mathrm{E} e^{\lambda \sum_{i=1}^{n} a_{i} \varepsilon_{i}} \leq e^{\left(\lambda^{2} / 2\right)\|a\|^{2}-\lambda x}
$$

The best upper bound is obtained for $\lambda=x /\|a\|^{2}$ and is the exponential in the probability bound of the lemma. Combination with a similar bound for the lower tail yields the probability bound.

The bound on the $\psi$-norm is a consequence of the probability bound in view of Lemma 2.2.1.

A stochastic process is called sub-Gaussian with respect to the semimetric $d$ on its index set if

$$
\mathrm{P}\left(\left|X_{s}-X_{t}\right|>x\right) \leq 2 e^{-\frac{1}{2} x^{2} / d^{2}(s, t)}, \quad \text { for every } s, t \in T, x>0 .
$$

(The constants 2 and $1 / 2$ are of no special importance. See Problem 2.2.14.) Any Gaussian process is sub-Gaussian for the standard deviation semimetric $d(s, t)=\sigma\left(X_{s}-X_{t}\right)$. Another example is the Rademacher process

$$
X_{a}=\sum_{i=1}^{n} a_{i} \varepsilon_{i}, \quad a \in \mathbb{R}^{n}
$$

for Rademacher variables $\varepsilon_{1}, \ldots, \varepsilon_{n}$. By Hoeffding's inequality, this is subGaussian for the Euclidean distance $d(a, b)=\|a-b\|$.

Sub-Gaussian processes satisfy the increment bound $\left\|X_{s}-X_{t}\right\|_{\psi_{2}} \leq \sqrt{6} d(s, t)$. Since the inverse of the $\psi_{2}$-function is essentially the square root of the logarithm, the general maximal inequality leads for sub-Gaussian processes to a bound in terms of an entropy integral. (Remember that entropy is defined as the logarithm of packing numbers.) Furthermore, because of the special properties of the logarithm, the statement can be slightly simplified.
2.2.8 Corollary. Let $\left\{X_{t}: t \in T\right\}$ be a separable sub-Gaussian process. Then for every $\delta>0$,

$$
\mathrm{E} \sup _{d(s, t) \leq \delta}\left|X_{s}-X_{t}\right| \leq K \int_{0}^{\delta} \sqrt{\log D(\varepsilon, d)} d \varepsilon
$$

for a universal constant $K$. In particular, for any $t_{0}$,

$$
E \sup _{t}\left|X_{t}\right| \leq E\left|X_{t_{0}}\right|+K \int_{0}^{\infty} \sqrt{\log D(\varepsilon, d)} d \varepsilon
$$

Proof. Apply the general maximal inequality with $\psi_{2}(x)=e^{x^{2}}-1$ and $\eta=\delta$. Since $\psi_{2}^{-1}(m)=\sqrt{\log (1+m)}$, we have $\psi_{2}^{-1}\left(D^{2}(\delta, d)\right) \leq$
$\sqrt{2} \psi_{2}^{-1}(D(\delta, d))$. Thus the second term in the maximal inequality can first be replaced by $\sqrt{2} \delta \psi^{-1}(D(\eta, d))$ and next be incorporated in the first (the covering integral) at the cost of increasing the constant. We obtain

$$
\left\|\sup _{d(s, t) \leq \delta}\left|X_{s}-X_{t}\right|\right\|_{\psi_{2}} \leq K \int_{0}^{\delta} \sqrt{\log (1+D(\varepsilon, d))} d \varepsilon
$$

Here $D(\varepsilon, d) \geq 2$ for every $\varepsilon$ that is strictly less than the diameter of $T$. Since $\log (1+m) \leq 2 \log m$ for $m \geq 2$, the 1 inside the logarithm can be removed at the cost of increasing $K$.

### 2.2.2 Bernstein's Inequality

Since many random variables have larger than normal tails, the results of the previous subsection are not always useful. A sum $\sum_{i=1}^{n} Y_{i}$ of independent variables with mean zero and bounded range is, for large $n$, approximately normally distributed with variance $v=\operatorname{var}\left(Y_{1}+\ldots+Y_{n}\right)$. The tails of a normal $N(0, v)$ variable are of the order $\exp -x^{2} /(2 v)$. If the variables $Y_{i}$ have range $[-M, M]$, then Bernstein's inequality gives a tail bound $\exp -x^{2} /[2 v+(2 M x / 3)]$ for the variables $\sum_{i=1}^{n} Y_{i}$. The extra term, $2 M x / 3$, may be viewed as a penalty for the nonnormality: for $n \rightarrow \infty$, it is typically negligible with respect to $v=v_{n}$.
2.2.9 Lemma (Bernstein's inequality). For independent random variables $Y_{1}, \ldots, Y_{n}$ with bounded ranges $[-M, M]$ and zero means,

$$
\mathrm{P}\left(\left|Y_{1}+\cdots+Y_{n}\right|>x\right) \leq 2 e^{-\frac{1}{2} \frac{x^{2}}{v+M x / 3}}
$$

for $v \geq \operatorname{var}\left(Y_{1}+\cdots+Y_{n}\right)$.
Proof. See Pollard (1984) or Shorack and Wellner (1986), page 855.
For large $x$, the upper bound in Bernstein's inequality is essentially of the exponential type $\exp (-x / M)$; for $x$ close to zero the upper bound behaves like the normal upper bound, $\exp \left(-x^{2} /(2 v)\right)$. This suggests that a maximum of variables that satisfy a Bernstein-type bound can be controlled using a combination of the $\psi_{1}$ and $\psi_{2}$ Orlicz norms.
2.2.10 Lemma. Let $X_{1}, \ldots, X_{m}$ be arbitrary random variables that satisfy the tail bound

$$
\mathrm{P}\left(\left|X_{i}\right|>x\right) \leq 2 e^{-\frac{1}{2} \frac{x^{2}}{b+a x}}
$$

for all $x$ (and $i$ ) and fixed $a, b>0$. Then

$$
\left\|\max _{1 \leq i \leq m} X_{i}\right\|_{\psi_{1}} \leq K(a \log (1+m)+\sqrt{b} \sqrt{\log (1+m)}),
$$

for a universal constant $K$.
Proof. The condition implies the upper bound $2 \exp \left(-x^{2} /(4 b)\right)$ on $P\left(\left|X_{i}\right|>x\right)$, for every $x \leq b / a$, and the upper bound $2 \exp (-x /(4 a))$, for all other positive $x$. Consequently, the same upper bounds hold for all $x>0$ for the probabilities $\mathrm{P}\left(\left|X_{i}\right| 1\left\{\left|X_{i}\right| \leq b / a\right\}>x\right)$ and $\mathrm{P}\left(\left|X_{i}\right| 1\left\{\left|X_{i}\right|>\right.\right. b / a\}>x)$, respectively. By Lemma 2.2.1, this implies that the Orlicz norms $\left\|X_{i} 1\left\{\left|X_{i}\right| \leq b / a\right\}\right\|_{\psi_{2}}$ and $\left\|X_{i} 1\left\{\left|X_{i}\right|>b / a\right\}\right\|_{\psi_{1}}$ are up to constants bounded by $\sqrt{b}$ and $a$, respectively. Next

$$
\left\|\max _{i} X_{i}\right\|_{\psi_{1}} \leq\left\|\max _{i} X_{i} 1\left\{\left|X_{i}\right| \leq b / a\right\}\right\|_{\psi_{1}}+\left\|\max _{i} X_{i} 1\left\{\left|X_{i}\right|>b / a\right\}\right\|_{\psi_{1}}
$$

Since the $\psi_{p}$-norms are up to constants nondecreasing in $p$, the first $\psi_{1}$-norm on the right can be replaced by a $\psi_{2}$-norm. Finally, apply Lemma 2.2.2 to find the bound as stated.

A refined form of Bernstein's inequality will be useful in Part 3. A random variable $Y$ with bounded range $[-M, M]$ satisfies

$$
\mathrm{E}|Y|^{m} \leq M^{m-2} \mathrm{E} Y^{2}
$$

for every $m \geq 2$. A much weaker inequality than this is the essential element in the proof of Bernstein's inequality.
2.2.11 Lemma (Bernstein's inequality). Let $Y_{1}, \ldots, Y_{n}$ be independent random variables with zero mean such that $\mathrm{E}\left|Y_{i}\right|^{m} \leq m!M^{m-2} v_{i} / 2$, for every $m \geq 2$ (and all $i$ ) and some constants $M$ and $v_{i}$. Then

$$
\mathrm{P}\left(\left|Y_{1}+\cdots+Y_{n}\right|>x\right) \leq 2 e^{-\frac{1}{2} \frac{x^{2}}{v+M x}}
$$

for $v \geq v_{1}+\cdots+v_{n}$.
Proof. See Bennett (1962), pages 37-38.
The moment condition in the refined form of Bernstein's inequality is somewhat odd. It is implied by

$$
\mathrm{E}\left(e^{\left|Y_{i}\right| / M}-1-\frac{\left|Y_{i}\right|}{M}\right) M^{2} \leq \frac{1}{2} v_{i}
$$

Conversely, if $Y_{i}$ satisfies the moment condition of the lemma, then the preceding display is valid with $M$ replaced by $2 M$ and $v_{i}$ replaced by $2 v_{i}$. Thus for applications where constants in Bernstein's inequality are unimportant, the preceding display is "equivalent" to the moment condition of the lemma.

## * 2.2.3 Tightness Under an Increment Bound

In the next chapters we obtain general central limit theorems for empirical processes through the application of maximal inequalities. Independently, the next example shows how a classical, simple sufficient condition for weak convergence follows also from the maximal inequalities.
2.2.12 Example. Let $\left\{X_{n}(t): t \in[0,1]\right\}$ be a sequence of separable stochastic processes with bounded sample paths and increments satisfying

$$
\mathrm{E}\left|X_{n}(s)-X_{n}(t)\right|^{p} \leq K|s-t|^{1+r},
$$

for constants $p, K, r>0$ independent of $n$. Assume that the sequences of marginals $\left(X_{n}\left(t_{1}\right), \ldots, X_{n}\left(t_{k}\right)\right)$ converge weakly to the corresponding marginals of a stochastic process $\{X(t): t \in[0,1]\}$. Then there exists a version of $X$ with continuous sample paths and $X_{n} \rightsquigarrow X$ in $\ell^{\infty}[0,1]$. (Hence also in $D[0,1]$ or $C[0,1]$, provided every $X_{n}$ has all its sample paths in these spaces.)

To prove this for $p>1$, apply Theorem 2.2.4 with $\psi(x)=x^{p}$ and $d(s, t)=|s-t|^{\alpha}$, where $\alpha=((1+r) / p) \wedge 1$. A $d$-ball of radius $\varepsilon$ around some $t$ is simply the interval $\left[t-\varepsilon^{1 / \alpha}, t+\varepsilon^{1 / \alpha}\right]$. Thus the index set $[0,1]$ can be covered with $N(\varepsilon, d)=(1 / 2) \varepsilon^{-1 / \alpha}$ balls of radius $\varepsilon$. Since $\psi^{-1}(x)=x^{1 / p}$, the covering integral can be bounded by a multiple of

$$
\int_{0}^{\eta} \psi^{-1}(N(\varepsilon, d)) d \varepsilon \leq \int_{0}^{\eta} \varepsilon^{-1 /(p \alpha)} d \varepsilon
$$

For $p>1$, the integral converges. Since $\left\|X_{n}(s)-X_{n}(t)\right\|_{p} \leq K^{1 / p}|s-t|^{\alpha}$, the general maximal inequality and Markov's inequality give

$$
\mathrm{P}\left(\sup _{|s-t|<\delta}\left|X_{n}(s)-X_{n}(t)\right|>x\right) \leq \frac{C}{x}\left[\int_{0}^{\eta} \varepsilon^{-1 /(p \alpha)} d \varepsilon+\delta \eta^{-2 /(p \alpha)}\right]
$$

for some constant $C$ independent of $n$. By choosing first $\eta$ and next $\delta$, one can make the right side arbitrarily small. This verifies the asymptotic equicontinuity of $X_{n}$. Its weak convergence and the continuity of the limit process follow from Theorem 1.5.7.

For $p \leq 1$, use the inequality $\left|\left(x^{+}\right)^{1 / q}-\left(y^{+}\right)^{1 / q}\right| \leq|x-y|^{1 / q}$ (valid for all reals $x, y$, and $q \geq 1$ ), with $q=2 / p$, to derive that

$$
\mathrm{E}\left|X_{n}^{+}(s)^{p / 2}-X_{n}^{+}(t)^{p / 2}\right|^{2} \leq K|s-t|^{1+r}, \quad \text { for every } s, t .
$$

By the previous argument, it follows that $\left(X_{n}^{+}\right)^{p / 2} \rightsquigarrow\left(X^{+}\right)^{p / 2}$, where $\left(X^{+}\right)^{p / 2}$ is a process with continuous sample paths. Since the map $x \mapsto x^{q}$ from $\ell^{\infty}[0,1]$ to $\ell^{\infty}[0,1]$ is continuous at every $x \in C[0,1]$ (Problem 2.2.15), it follows that $X_{n}^{+} \rightsquigarrow X^{+}$. By a similar argument, $X_{n}^{-} \rightsquigarrow X^{-}$. Together this yields $X_{n} \rightsquigarrow X$.

[^4]
## Problems and Complements

1. A standard normal variable $X$ possesses norm $\|X\|_{\psi_{2}}=\sqrt{8 / 3}$ for $\psi_{2}(x)= \exp \left(x^{2}\right)-1$.
2. The constant random variable $X=1$ possesses norm $\|X\|_{\psi_{p}}=(\log 2)^{-1 / p}$ for $\psi_{p}(x)=e^{x^{p}}-1$.
3. For any constant $C \geq 1$, convex, increasing $\psi$ and random variable $X$, one has $\|X\|_{C \psi} \leq C\|X\|_{\psi}$. For $C \leq 1$ the reverse inequality holds.
[Hint: By convexity of $\psi$, one has $\mathrm{E} \psi\left(|X| / C\|X\|_{\psi}\right) \leq 1 / C$, for $C \geq 1$.]
4. Show that $\|X\|_{p} \leq[p / 2]$ ! $\|X\|_{\psi_{2}}$. In particular, $\|X\|_{1} \leq\|X\|_{2} \leq\|X\|_{\psi_{2}}$.
[Hint: For even $p$, one has $x^{p} \leq(p / 2)!\psi_{2}(x)$.]
5. (Comparing $\psi_{p}$-norms) For any $X$, the numbers $(\log 2)^{1 / p}\|X\|_{\psi_{p}}$ for $\psi_{p}(x)=\exp \left(x^{p}\right)-1$ are nondecreasing in $p \geq 1$.
[Hint: The function $\phi$ for which $\psi_{p}\left(x(\log 2)^{1 / p}\right)=\phi\left(\psi_{q}\left((\log 2)^{1 / q} x\right)\right)$ is concave and satisfies $\phi(1)=1$ for $q \geq p$. Use Jensen's inequality.]
6. (Monotone convergence for Orlicz-norms) Let $\psi$ be a convex, nondecreasing, nonzero function on $[0, \infty)$ with $\psi(0)=0$. If $0 \leq X_{n} \uparrow X$ almost surely, then $\left\|X_{n}\right\|_{\psi} \uparrow\|X\|_{\psi}$.
[Hint: By the monotone convergence theorem, $\lim \mathrm{E} \psi\left(X_{n} / r\|X\|_{\psi}\right)>1$, for any $r<1$.]
7. The infimum in the definition of an Orlicz norm is attained (at $\|X\|_{\psi}$ ).
8. Let $\psi$ be any function as in the definition of an Orlicz norm. Then for any random variables $X_{1}, \ldots, X_{m}$, one has E max $\left|X_{i}\right| \leq \psi^{-1}(m) \max \left\|X_{i}\right\|_{\psi}$.
[Hint: For any $C$, one has $\mathrm{E} \max \left|X_{i}\right| / C \leq \psi^{-1}\left(\mathrm{E} \max \psi\left(\left|X_{i}\right| / C\right)\right)$ by Jensen's inequality. Bound the maximum by a sum and take $C=\max \left\|X_{i}\right\|_{\psi}$.]
9. If $\|X\|_{\psi}<\infty$, then $\|X\|_{\sigma \psi}<\infty$ for every $\sigma>0$. Markov's inequality yields the bound $\mathrm{P}(|X|>t) \leq 1 / \sigma \cdot 1 / \psi\left(t /\|X\|_{\sigma \psi}\right)$ for every $t$. Is there an optimal value of $\sigma$ ?
10. The condition on the quotient $\psi(x) \psi(y) / \psi(c x y)$ in Lemma 2.2.2 is not automatic. For instance, the function $\psi(x)=(x+1)(\log (x+1)-1)+1$ is convex and increasing for $x \geq 0$ but does not satisfy the condition.
11. The function $\psi_{p}(x)=\exp \left(x^{p}\right)-1$ satisfies the hypothesis of Lemma 2.2.2 for every $0<p \leq 2$.
12. Let $\psi$ be a convex, positive function, with $\psi(0)=0$ such that $\log \psi$ is convex. Then there is a constant $\sigma$ such that $\phi(x)=\sigma \psi(x)$ satisfies both $\phi(1)<1$ and $\phi(x) \phi(y) \leq \phi(x y)$, for all $x, y \geq 1$.
[Hint: Define $\phi(x)=\psi(x) / 2 \psi(1)$ for $x \geq 1$. Then $\phi(1)=1 / 2$ and $g(x, y)= \phi(x) \phi(y) / \phi(x y)$ satisfies $g(1,1)=1 / 2$ and is decreasing in both $x$ and $y$ for $x, y \geq 1$ if $\log \psi$ is convex. The derivative of $g$ with respect to $x$ is given by $\psi(x) \psi(y) /(2 \psi(1) \psi(x y))\left(\psi^{\prime} / \psi(x)-y \psi^{\prime} / \psi(x y)\right)$, which is less than or equal to 0 since $y \geq 1$ and $\log \psi$ is convex. By symmetry, the derivative with respect to $y$ is also bounded above by zero.]
13. The functions $\psi_{p}$, with $1 \leq p \leq 2$, and more generally the function $\psi(x)= \exp (h(x))$, with $h(x)$ convex $(h(x)=x(\log (x)-1)+1)$, satisfy the conditions in the preceding problem. The functions $\psi_{p}$, for $0<p \leq 1$, do not satisfy these conditions.
14. Suppose that $\mathrm{P}\left(\left|X_{s}-X_{t}\right|>x\right) \leq K \exp \left(-C x^{2} / d^{2}(s, t)\right)$ for a given stochastic process and certain positive constants $K$ and $C$. Then the process is sub-Gaussian for a multiple of the distance $d$.
[Hint: There exists a constant $D$ depending only on $K$ and $C$ such that $1 \wedge K e^{-C x^{2}}$ is bounded above by $2 e^{-D x^{2}}$, for every $x \geq 0$.]
15. Let $T$ be a compact, semimetric space and $q>0$. Then the map $x \mapsto x^{q}$ from the nonnegative functions in $\ell^{\infty}(T)$ to $\ell^{\infty}(T)$ is continuous at every continuous $x$.
[Hint: It suffices to show that $\left\|x_{n}-x\right\|_{\infty} \rightarrow 0$ implies that $x_{n}^{q}\left(t_{n}\right)-x^{q}\left(t_{n}\right) \rightarrow 0$ for every sequence $t_{n}$. By compactness of $T$, the sequence $t_{n}$ may be assumed convergent. Since $x$ is continuous, $x\left(t_{n}\right) \rightarrow x(t)$. Thus $x_{n}\left(t_{n}\right) \rightarrow x(t)$, whence $x_{n}^{q}\left(t_{n}\right) \rightarrow x^{q}(t)$.]
16. Suppose the metric space $T$ has a finite diameter and $\log N(\varepsilon, T, d) \leq h(\varepsilon)$, for all sufficiently small $\varepsilon>0$ and a fixed, positive, continuous function $h$. Then there exists a constant $K$ with $\log N(\varepsilon, T, d) \leq K h(\varepsilon)$ for all $\varepsilon>0$.
[Hint: For sufficiently large $\varepsilon$, the entropy numbers are zero, and for sufficiently small $\varepsilon$, the inequality is valid with $K=1$. The function $\log N(\varepsilon, T, d) / h(\varepsilon)$ is bounded on intervals that are bounded away from zero and infinity.]
17. Let $X$ be a stochastic process with $\sup _{\rho(s, t)<\delta}|X(s)-X(t)| \xrightarrow{\mathrm{P} *} 0$ as $\delta \downarrow 0$. Then almost all sample paths of $X$ are uniformly continuous.
[Hint: Given a decreasing sequence of numbers $\varepsilon_{k} \rightarrow 0$, there are numbers $\delta_{k}>0$ such that $\mathrm{P}^{*}\left(\sup _{\rho(s, t)<\delta_{k}}|X(s)-X(t)|>\varepsilon_{k}\right) \leq 2^{-k}$ for every $k$. By the Borel-Cantelli lemma, $|X(s)-X(t)| \leq \varepsilon_{k}$ whenever $\rho(s, t)<\delta_{k}$, for all sufficiently large $k$ almost surely.]

## 2.3

## Symmetrization and Measurability

One of the two main approaches toward deriving Glivenko-Cantelli and Donsker theorems is based on the principle of comparing the empirical process to a "symmetrized" empirical process. In this chapter we derive the main symmetrization theorem, as well as a number of technical complements, which may be skipped at first reading.

### 2.3.1 Symmetrization

Let $\varepsilon_{1}, \ldots, \varepsilon_{n}$ be i.i.d. Rademacher random variables. Instead of the empirical process

$$
f \mapsto\left(\mathbb{P}_{n}-P\right) f=\frac{1}{n} \sum_{i=1}^{n}\left(f\left(X_{i}\right)-P f\right)
$$

consider the symmetrized process

$$
f \mapsto \mathbb{P}_{n}^{o} f=\frac{1}{n} \sum_{i=1}^{n} \varepsilon_{i} f\left(X_{i}\right)
$$

where $\varepsilon_{1}, \ldots, \varepsilon_{n}$ are independent of $\left(X_{1}, \ldots, X_{n}\right)$. Both processes have mean function zero (because $\mathrm{E}\left(\varepsilon_{i} f\left(X_{i}\right) \mid X_{i}\right)=0$ by symmetry of $\varepsilon_{i}$ ). It turns out that the law of large numbers or the central limit theorem for one of these processes holds if and only if the corresponding result is true for the other process. One main approach to proving empirical limit theorems is to pass from $\mathbb{P}_{n}-P$ to $\mathbb{P}_{n}^{o}$ and next apply arguments conditionally on the original $X$ 's. The idea is that, for fixed $X_{1}, \ldots, X_{n}$, the symmetrized
empirical measure is a Rademacher process, hence a sub-Gaussian process, to which Corollary 2.2.8 can be applied.

Thus we need to bound maxima and moduli of the process $\mathbb{P}_{n}-P$ by those of the symmetrized process. To formulate such bounds, we must be careful about the possible nonmeasurability of suprema of the type $\left\|\mathbb{P}_{n}-P\right\|_{\mathcal{F}}$. The result will be formulated in terms of outer expectation, but it does not hold for every choice of an underlying probability space on which $X_{1}, \ldots, X_{n}$ are defined. Throughout this part, if outer expectations are involved, it is assumed that $X_{1}, \ldots, X_{n}$ are the coordinate projections on the product space $\left(\mathcal{X}^{n}, \mathcal{A}^{n}, P^{n}\right)$, and the outer expectations of functions $\left(X_{1}, \ldots, X_{n}\right) \mapsto h\left(X_{1}, \ldots, X_{n}\right)$ are computed for $P^{n}$. Thus "independent" is understood in terms of a product probability space. If auxiliary variables, independent of the $X$ 's, are involved, as in the next lemma, we use a similar convention. In that case, the underlying probability space is assumed to be of the form ( $\left.\mathcal{X}^{n}, \mathcal{A}^{n}, P^{n}\right) \times(\mathcal{Z}, \mathcal{C}, Q)$ with $X_{1}, \ldots, X_{n}$ equal to the coordinate projections on the first $n$ coordinates and the additional variables depending only on the $(n+1)$ st coordinate.

The following lemma will be used mostly with the choice $\Phi(x)=x$.
2.3.1 Lemma (Symmetrization). For every nondecreasing, convex $\Phi: \mathbb{R} \mapsto \mathbb{R}$ and class of measurable functions $\mathcal{F}$,

$$
\mathrm{E}^{*} \Phi\left(\left\|\mathbb{P}_{n}-P\right\|_{\mathcal{F}}\right) \leq \mathrm{E}^{*} \Phi\left(2\left\|\mathbb{P}_{n}^{o}\right\|_{\mathcal{F}}\right)
$$

where the outer expectations are computed as indicated in the preceding paragraph.

Proof. Let $Y_{1}, \ldots, Y_{n}$ be independent copies of $X_{1}, \ldots, X_{n}$, defined formally as the coordinate projections on the last $n$ coordinates in the product space $\left(\mathcal{X}^{n}, \mathcal{A}^{n}, P^{n}\right) \times(\mathcal{Z}, \mathcal{C}, Q) \times\left(\mathcal{X}^{n}, \mathcal{A}^{n}, P^{n}\right)$. The outer expectations in the statement of the lemma are unaffected by this enlargement of the underlying probability space, because coordinate projections are perfect maps. For fixed values $X_{1}, \ldots, X_{n}$,
$\left\|\mathbb{P}_{n}-P\right\|_{\mathcal{F}}=\sup _{f \in \mathcal{F}} \frac{1}{n}\left|\sum_{i=1}^{n}\left[f\left(X_{i}\right)-\mathrm{E} f\left(Y_{i}\right)\right]\right| \leq \mathrm{E}_{Y}^{*} \sup _{f \in \mathcal{F}} \frac{1}{n}\left|\sum_{i=1}^{n}\left[f\left(X_{i}\right)-f\left(Y_{i}\right)\right]\right|$,
where $\mathrm{E}_{Y}^{*}$ is the outer expectation with respect to $Y_{1}, \ldots, Y_{n}$ computed for $P^{n}$ for given, fixed values of $X_{1}, \ldots, X_{n}$. Combination with Jensen's inequality yields

$$
\Phi\left(\left\|\mathbb{P}_{n}-P\right\|_{\mathcal{F}}\right) \leq \mathrm{E}_{Y} \Phi\left(\left\|\frac{1}{n} \sum_{i=1}^{n}\left[f\left(X_{i}\right)-f\left(Y_{i}\right)\right]\right\|_{\mathcal{F}}^{* Y}\right)
$$

where $* Y$ denotes the minimal measurable majorant of the supremum with respect to $Y_{1}, \ldots, Y_{n}$, still with $X_{1}, \ldots, X_{n}$ fixed. Because $\Phi$ is nondecreasing and continuous, the $* Y$ inside $\Phi$ can be moved to $\mathrm{E}_{Y}^{*}$ (Problem 1.2.8).

Next take the expectation with respect to $X_{1}, \ldots, X_{n}$ to get

$$
\mathrm{E}^{*} \Phi\left(\left\|\mathbb{P}_{n}-P\right\|_{\mathcal{F}}\right) \leq \mathrm{E}_{X}^{*} \mathrm{E}_{Y}^{*} \Phi\left(\frac{1}{n}\left\|\sum_{i=1}^{n}\left[f\left(X_{i}\right)-f\left(Y_{i}\right)\right]\right\|_{\mathcal{F}}\right)
$$

Here the repeated outer expectation can be bounded above by the joint outer expectation E* by Lemma 1.2.6.

Adding a minus sign in front of a term $\left[f\left(X_{i}\right)-f\left(Y_{i}\right)\right]$ has the effect of exchanging $X_{i}$ and $Y_{i}$. By construction of the underlying probability space as a product space, the outer expectation of any function $f\left(X_{1}, \ldots, X_{n}, Y_{1}, \ldots, Y_{n}\right)$ remains unchanged under permutations of its $2 n$ arguments. Hence the expression

$$
\mathrm{E}^{*} \Phi\left(\left\|\frac{1}{n} \sum_{i=1}^{n} e_{i}\left[f\left(X_{i}\right)-f\left(Y_{i}\right)\right]\right\|_{\mathcal{F}}\right)
$$

is the same for any $n$-tuple $\left(e_{1}, \ldots, e_{n}\right) \in\{-1,1\}^{n}$. Deduce that

$$
\mathrm{E}^{*} \Phi\left(\left\|\mathbb{P}_{n}-P\right\|_{\mathcal{F}}\right) \leq \mathrm{E}_{\varepsilon} \mathrm{E}_{X, Y}^{*} \Phi\left(\left\|\frac{1}{n} \sum_{i=1}^{n} \varepsilon_{i}\left[f\left(X_{i}\right)-f\left(Y_{i}\right)\right]\right\|_{\mathcal{F}}\right) .
$$

Use the triangle inequality to separate the contributions of the $X^{\prime} s$ and the $Y^{\prime} s$ and next use the convexity of $\Phi$ to bound the previous expression by

$$
\frac{1}{2} \mathrm{E}_{\varepsilon} \mathrm{E}_{X, Y}^{*} \Phi\left(2\left\|\frac{1}{n} \sum_{i=1}^{n} \varepsilon_{i} f\left(X_{i}\right)\right\|_{\mathcal{F}}\right)+\frac{1}{2} \mathrm{E}_{\varepsilon} \mathrm{E}_{X, Y}^{*} \Phi\left(2\left\|\frac{1}{n} \sum_{i=1}^{n} \varepsilon_{i} f\left(Y_{i}\right)\right\|_{\mathcal{F}}\right) .
$$

By perfectness of coordinate projections, the expectation $\mathrm{E}_{X, Y}^{*}$ is the same as $\mathrm{E}_{X}^{*}$ and $\mathrm{E}_{Y}^{*}$ in the two terms, respectively. Finally, replace the repeated outer expectations by a joint outer expectation.

The symmetrization lemma is valid for any class $\mathcal{F}$. In the proofs of Glivenko-Cantelli and Donsker theorems, it will be applied not only to the original set of functions of interest, but also to several classes constructed from such a set $\mathcal{F}$ (such as the class $\mathcal{F}_{\delta}$ of small differences). The next step in these proofs is to apply a maximal inequality to the right side of the lemma, conditionally on $X_{1}, \ldots, X_{n}$. At that point we need to write the joint outer expectation as the repeated expectation $\mathrm{E}_{X}^{*} \mathrm{E}_{\varepsilon}$, where the indices $X$ and $\varepsilon$ mean expectation over $X$ and $\varepsilon$, respectively, conditionally on the remaining variables. Unfortunately, Fubini's theorem is not valid for outer expectations. To overcome this problem, it is assumed that the integrand in the right side of the lemma is jointly measurable in $\left(X_{1}, \ldots, X_{n}, \varepsilon_{1}, \ldots, \varepsilon_{n}\right)$. Since the Rademacher variables are discrete, this is the case if and only if the maps

$$
\begin{equation*}
\left(X_{1}, \ldots, X_{n}\right) \mapsto\left\|\sum_{i=1}^{n} e_{i} f\left(X_{i}\right)\right\|_{\mathcal{F}} \tag{2.3.2}
\end{equation*}
$$

are measurable for every $n$-tuple $\left(e_{1}, \ldots, e_{n}\right) \in\{-1,1\}^{n}$. For the intended application of Fubini's theorem, it suffices that this is the case for the completion of $\left(\mathcal{X}^{n}, \mathcal{A}^{n}, P^{n}\right)$.
2.3.3 Definition (Measurable class). A class $\mathcal{F}$ of measurable functions $f: \mathcal{X} \mapsto \mathbb{R}$ on a probability space ( $\mathcal{X}, \mathcal{A}, P$ ) is called a $P$-measurable class if the function (2.3.2) is measurable on the completion of ( $\mathcal{X}^{n}, \mathcal{A}^{n}, P^{n}$ ) for every $n$ and every vector $\left(e_{1}, \ldots, e_{n}\right) \in \mathbb{R}^{n}$.

In the following, one cannot dispense with measurability conditions of some form. Examples show that the law of large numbers or the central limit theorem may fail only because of the violation of measurability conditions such as the one just introduced. On the other hand, the measurability conditions in the present form are not necessary, but they are suggested by the methods of proof. A trivial, but nevertheless useful, device to relax measurability requirements a little is to replace the class $\mathcal{F}$ by a class $\mathcal{G}$ for which measurability can be checked. If $\left\|\mathbb{P}_{n}-P\right\|_{\mathcal{F}}=\left\|\mathbb{P}_{n}-P\right\|_{\mathcal{G}}$ inner almost surely, then a law of large numbers for $\mathcal{G}$ clearly implies one for $\mathcal{F}$. Similarly, if $\left\|\mathbb{P}_{n}-P\right\|_{\mathcal{F}_{\delta}}=\left\|\mathbb{P}_{n}-P\right\|_{\mathcal{G}_{\delta}}$ inner almost surely for every $\delta>0$, then asymptotic equicontinuity of the $\mathcal{F}$-indexed empirical process follows from the same property for $\mathcal{G}$. Furthermore, if in both cases $\mathcal{G}$ is chosen to be a subclass of $\mathcal{F}$, then the other conditions for the uniform law or the central limit theorem typically carry over from $\mathcal{F}$ onto $\mathcal{G}$. Rather than formalizing this principle into a concept such as "nearly measurable class," we will state the conditions directly in terms of $\mathcal{F}$.
2.3.4 Example (Pointwise measurable classes). Suppose $\mathcal{F}$ contains a countable subset $\mathcal{G}$ such that for every $f \in \mathcal{F}$ there exists a sequence $g_{m}$ in $\mathcal{G}$ with $g_{m}(x) \rightarrow f(x)$ for every $x$. Then $\mathcal{F}$ is $P$-measurable for every $P$.

This claim is immediate from the fact that $\left\|\sum e_{i} f\left(X_{i}\right)\right\|_{\mathcal{F}}$ equals $\left\|\sum e_{i} f\left(X_{i}\right)\right\|_{\mathcal{G}}$.

Some examples of this situation are the collection of indicators of cells in Euclidean space, the collection of indicators of balls, and collections of functions that are separable for the supremum norm.

In Section 2.3.3 it will be seen that every separable collection $\mathcal{F} \subset L_{2}(P)$ has a "version" that is "almost" pointwise separable. (The name pointwise separable class will be reserved for these versions.)
2.3.5 Example. Suppose $\mathcal{F}$ is a Suslin topological space (with respect to an arbitrary topology) and the map $(x, f) \mapsto f(x)$ is jointly measurable on $\mathcal{X} \times \mathcal{F}$ for the product $\sigma$-field of $\mathcal{A}$ and the Borel $\sigma$-field. [Recall that every Borel subset (even analytic subset) of a Polish space is Suslin for the relative topology.] Then $\mathcal{F}$ is $P$-measurable for every probability measure $P$.

This follows from Example 1.7.5 upon noting that the conditions imply that the process $\left(x_{1}, \ldots, x_{n}, f\right) \mapsto \sum_{i=1}^{n} e_{i} f\left(x_{i}\right)$ is jointly measurable on $\mathcal{X}^{n} \times \mathcal{F}$.

This "measurable Suslin condition" replaces the original problem of showing $P$-measurability of $\mathcal{F}$ by the problem of finding a suitable topology on $\mathcal{F}$ for which the map $(x, f) \mapsto f(x)$ is measurable. This is sometimes easy - for instance, if the class $\mathcal{F}$ is indexed by a parameter in a nice manner - but sometimes as hard as the original problem.

## * 2.3.2 More Symmetrization

This section continues with additional results on symmetrization. These are not needed for the main results of this part (Chapters 2.2,2.4, and 2.5), and the reader may wish to skip the remainder of this chapter at first reading.

For future reference it is convenient to generalize the notation. Instead of the empirical distribution, consider sums $\sum_{i=1}^{n} Z_{i}$ of independent stochastic processes $\left\{Z_{i}(f): f \in \mathcal{F}\right\}$. Again the processes need not possess any further measurability properties besides measurability of all marginals $Z_{i}(f)$. However, for computing outer expectations, it will be understood that the underlying probability space is a product space $\prod_{i=1}^{n}\left(\mathcal{X}_{i}, \mathcal{A}_{i}, P_{i}\right) \times(\mathcal{Z}, \mathcal{C}, Q)$ and each $Z_{i}$ is a function of the $i$ th coordinate of $(x, z)=\left(x_{1}, \ldots, x_{n}, z\right)$ only. For i.i.d. stochastic processes, it is understood in addition that the spaces ( $\mathcal{X}_{i}, \mathcal{A}_{i}, P_{i}$ ) as well as the maps $Z_{i}(f)$ defined on them are identical. Additional (independent) Rademacher or other variables are understood to be functions of the $(n+1)$ st coordinate $z$ only. The empirical distribution corresponds to taking $Z_{i}(f)=f\left(X_{i}\right)-P f$.

First consider "desymmetrization." The inequality of the preceding lemma can only be reversed (up to constants) for classes $\mathcal{F}$ that are centered (Problem 2.3.1). The following lemma shows that the maxima of the processes $\mathbb{P}_{n}-P$ and $n^{-1} \sum \varepsilon_{i}\left(\delta_{X_{i}}-P\right)$ are fully comparable.
2.3.6 Lemma. Let $Z_{1}, \ldots, Z_{n}$ be independent stochastic processes with mean zero. Then

$$
\mathrm{E}^{*} \Phi\left(\frac{1}{2}\left\|\sum_{i=1}^{n} \varepsilon_{i} Z_{i}\right\|_{\mathcal{F}}\right) \leq \mathrm{E}^{*} \Phi\left(\left\|\sum_{i=1}^{n} Z_{i}\right\|_{\mathcal{F}}\right) \leq \mathrm{E}^{*} \Phi\left(2\left\|\sum_{i=1}^{n} \varepsilon_{i}\left(Z_{i}-\mu_{i}\right)\right\|_{\mathcal{F}}\right),
$$

for every nondecreasing, convex $\Phi: \mathbb{R} \mapsto \mathbb{R}$ and arbitrary functions $\mu_{i}: \mathcal{F} \mapsto \mathbb{R}$.

Proof. The inequality on the right follows by similar arguments as in the proof of Lemma 2.3.1. For the inequality on the left, let $Y_{1}, \ldots, Y_{n}$ be an independent copy of $Z_{1}, \ldots, Z_{n}$ (suitably defined on the probability space

[^5]$\prod_{i=1}^{n}\left(\mathcal{X}_{i}, \mathcal{A}_{i}, P_{i}\right) \times(\mathcal{Z}, \mathcal{C}, Q) \times \prod_{i=1}^{n}\left(\mathcal{\mathcal { X } _ { i }}, \mathcal{A}_{i}, P_{i}\right)$ and depending on the last $n$ coordinates exactly as $Z_{1}, \ldots, Z_{n}$ depend on the first $n$ coordinates). Since $\mathrm{E} Y_{i}(f)=0$, the left side of the lemma is an average of expressions of the type
$$
\mathrm{E}_{Z}^{*} \Phi\left(\left\|\frac{1}{2} \sum_{i=1}^{n} e_{i}\left[Z_{i}(f)-\mathrm{E} Y_{i}(f)\right]\right\|_{\mathcal{F}}\right)
$$
where ( $e_{1}, \ldots, e_{n}$ ) ranges over $\{-1,1\}^{n}$. (cf. Lemma 1.2.7). By Jensen's inequality, this expression is bounded above by
$$
\mathrm{E}_{Z, Y}^{*} \Phi\left(\left\|\frac{1}{2} \sum_{i=1}^{n} e_{i}\left[Z_{i}(f)-Y_{i}(f)\right]\right\|_{\mathcal{F}}\right)=\mathrm{E}_{Z, Y}^{*} \Phi\left(\left\|\frac{1}{2} \sum_{i=1}^{n}\left[Z_{i}(f)-Y_{i}(f)\right]\right\|_{\mathcal{F}}\right) .
$$

Finally, apply the triangle inequality and convexity of $\Phi$.

The most important choice for $\Phi$ in the preceding lemmas is $\Phi(x)=x$. The requirement that $\Phi$ be convex rules out $\Phi(x)=1\{x>a\}$. Nevertheless, there is an analogous symmetrization inequality for probabilities.
2.3.7 Lemma (Symmetrization for probabilities). For arbitrary stochastic processes $Z_{1}, \ldots, Z_{n}$ and arbitrary functions $\mu_{1}, \ldots, \mu_{n}: \mathcal{F} \mapsto \mathbb{R}$,

$$
\beta_{n}(x) \mathrm{P}^{*}\left(\left\|\sum_{i=1}^{n} Z_{i}\right\|_{\mathcal{F}}>x\right) \leq 2 \mathrm{P}^{*}\left(4\left\|\sum_{i=1}^{n} \varepsilon_{i}\left(Z_{i}-\mu_{i}\right)\right\|_{\mathcal{F}}>x\right)
$$

for every $x>0$ and $\beta_{n}(x) \leq \inf _{f} \mathrm{P}\left(\left|\sum_{i=1}^{n} Z_{i}(f)\right|<x / 2\right)$. In particular, this is true for i.i.d. mean-zero processes, and $\beta_{n}(x)=1- \left(4 n / x^{2}\right) \sup _{f} \operatorname{var} Z_{1}(f)$. Here the outer expectations are computed as indicated previously.

Proof. Let $Y_{1}, \ldots, Y_{n}$ be an independent copy of $Z_{1}, \ldots, Z_{n}$, suitably defined on a product space as previously. If $\left\|\sum_{i=1}^{n} Z_{i}\right\|_{\mathcal{F}}>x$, then there is certainly some $f$ for which $\left|\sum_{i=1}^{n} Z_{i}(f)\right|>x$. Fix a realization, $Z_{1}, \ldots, Z_{n}$ and $f$ for which both are the case. For this fixed realization,

$$
\begin{aligned}
\beta \leq \mathrm{P}_{Y}^{*}\left(\left|\sum_{i=1}^{n} Y_{i}(f)\right|<\frac{x}{2}\right) & \leq \mathrm{P}_{Y}^{*}\left(\left|\sum_{i=1}^{n} Y_{i}(f)-\sum_{i=1}^{n} Z_{i}(f)\right|>\frac{x}{2}\right) \\
& \leq \mathrm{P}_{Y}^{*}\left(\left\|\sum_{i=1}^{n}\left(Y_{i}-Z_{i}\right)\right\|_{\mathcal{F}}>\frac{x}{2}\right)
\end{aligned}
$$

The far left and far right sides do not depend on the particular $f$, and the inequality between them is valid on the set $\left\{\left\|\sum_{i=1}^{n} Z_{i}\right\|_{\mathcal{F}}>x\right\}$. Integrate the two sides out with respect to $Z_{1}, \ldots, Z_{n}$ over this set to obtain

$$
\beta \mathrm{P}^{*}\left(\left\|\sum_{i=1}^{n} Z_{i}\right\|_{\mathcal{F}}>x\right) \leq \mathrm{P}_{Z}^{*} \mathrm{P}_{Y}^{*}\left(\left\|\sum_{i=1}^{n}\left(Y_{i}-Z_{i}\right)\right\|_{\mathcal{F}}>\frac{x}{2}\right) .
$$

By symmetry, the right side equals

$$
\mathrm{E}_{\varepsilon} \mathrm{P}_{Z}^{*} \mathrm{P}_{Y}^{*}\left(\left\|\sum_{i=1}^{n} \varepsilon_{i}\left(Y_{i}-Z_{i}\right)\right\|_{\mathcal{F}}>\frac{x}{2}\right) .
$$

In view of the triangle inequality, this expression is not bigger than $2 \mathrm{P}^{*}\left(\left\|\sum_{i=1}^{n} \varepsilon_{i}\left(Y_{i}-\mu_{i}\right)\right\|_{\mathcal{F}}>x / 4\right)$.
I.i.d. processes $Z_{1}, \ldots, Z_{n}$ with mean zero satisfy the condition for the given $\beta$ in view of Chebyshev's inequality.

Since they only add in signs, Rademacher variables appear to yield an efficient method of symmetrization. Nevertheless, in most arguments they can be replaced by other variables; for instance, standard normal ones. Then the form of the symmetrization inequalities may become more complicated. A discussion is deferred to Chapter 2.9, where it is shown in general that the sequences of processes $n^{-1 / 2} \sum_{i=1}^{n} \xi_{i} Z_{i}$ and $n^{-1 / 2} \sum_{i=1}^{n} Z_{i}$ possess the same asymptotic behavior for most choices of $\xi_{i}$.

Inequalities in terms of the means of suprema of processes are easier to handle than inequalities in terms of probabilities. However, so far the main condition (2.1.8) for the empirical central limit theorem has been stated in terms of probabilities. In view of Markov's inequality, the condition

$$
\begin{equation*}
\mathrm{E}^{*} \sqrt{n}\left\|\mathbb{P}_{n}-P\right\|_{\mathcal{F}_{\delta_{n}}} \rightarrow 0, \quad \text { for every } \delta_{n} \rightarrow 0 \tag{2.3.8}
\end{equation*}
$$

is sufficient for asymptotic equicontinuity (2.1.8). In view of Lemma 2.3.6, this condition is equivalent to the analogous condition in terms of the symmetrized empirical measure $\mathbb{P}_{n}^{o}$. It is therefore of interest that there is no loss of generality in passing from probabilities (2.1.8) to expectations.

For the proof we need a preparatory lemma.
2.3.9 Lemma. Let $Z_{1}, Z_{2}, \ldots$ be i.i.d stochastic processes such that $n^{-1 / 2} \sum_{i=1}^{n} Z_{i}$ converges weakly in $\ell^{\infty}(\mathcal{F})$ to a tight Gaussian process. Then

$$
\lim _{x \rightarrow \infty} x^{2} \sup _{n} \mathrm{P}^{*}\left(\frac{1}{\sqrt{n}}\left\|\sum_{i=1}^{n} Z_{i}\right\|_{\mathcal{F}}>x\right)=0
$$

In particular, the random variable $\left\|Z_{1}\right\|_{\mathcal{F}}^{*}$ possesses a weak second moment.
Proof. Let $Y_{1}, \ldots, Y_{n}$ be an independent copy of $Z_{1}, \ldots, Z_{n}$, for the benefit of the outer expectations defined as coordinate projections on an extra factor of a product probability space, as usual. Marginal convergence to a Gaussian process implies that $\mathrm{E} Z_{i}(f)=0$ and $\operatorname{var} Z_{i}(f)<\infty$ for every $f$. Furthermore, the existence of a tight limit ensures that $\mathcal{F}$ is totally bounded for the semimetric $\rho(f, g)=\sigma(Z(f)-Z(g))$. In particular,
$\alpha=\sup _{f \in \mathcal{F}} \operatorname{var} Z(f)$ is finite. By an intermediate step in the proof of the symmetrization Lemma 2.3.7,

$$
\left(1-\frac{4 \alpha^{2}}{x^{2}}\right) \mathrm{P}\left(\frac{1}{\sqrt{n}}\left\|\sum_{i=1}^{n} Z_{n}\right\|_{\mathcal{F}}^{*}>x\right) \leq \mathrm{P}\left(\frac{1}{\sqrt{n}}\left\|\sum_{i=1}^{n}\left(Z_{i}-Y_{i}\right)\right\|_{\mathcal{F}}^{*}>\frac{x}{2}\right) .
$$

It suffices to prove the lemma for $Z_{i}-Y_{i}$ instead of $Z_{i}$. For convenience of notation, suppose that the original $Z_{i}$ are symmetric.

Fix $\varepsilon>0$. The norm $\|\mathbb{G}\|_{\mathcal{F}}$ of the Gaussian limit variable $\mathbb{G}$ has moments of all orders (see Proposition A.2.3). Thus there exists $x$ such that $\mathrm{P}\left(\|\mathbb{G}\|_{\mathcal{F}} \geq x\right) \leq \varepsilon / x^{2} \leq 1 / 8$. By the portmanteau theorem, there exists $N$ such that, for all $n \geq N$,

$$
\begin{equation*}
\mathrm{P}^{*}\left(\left\|\sum_{i=1}^{n} Z_{i}\right\|_{\mathcal{F}}>x \sqrt{n}\right) \leq 2 \mathrm{P}\left(\|\mathbb{G}\|_{\mathcal{F}} \geq x\right) \leq \frac{2 \varepsilon}{x^{2}} \tag{2.3.10}
\end{equation*}
$$

By Lévy's inequalities A.1.2,

$$
\mathrm{P}\left(\max _{1 \leq i \leq n}\left\|Z_{i}\right\|_{\mathcal{F}}^{*}>x \sqrt{n}\right) \leq 2 \mathrm{P}\left(\left\|\sum_{i=1}^{n} Z_{i}\right\|_{\mathcal{F}}^{*}>x \sqrt{n}\right) \leq \frac{4 \varepsilon}{x^{2}}
$$

In view of Problem 2.3.2, for every $n \geq N$,

$$
x^{2} n \mathrm{P}\left(\left\|Z_{1}\right\|_{\mathcal{F}}>x \sqrt{n}\right) \leq 8 \varepsilon
$$

This immediately implies the second assertion of the lemma.
To obtain the first assertion, apply the preceding argument to the processes $Z_{i}=m^{-1 / 2} \sum_{j=1}^{m} Z_{i, j}$ for each $1 \leq i \leq n$, where $Z_{1,1}, \ldots, Z_{n, m}$ are i.i.d. copies of $Z_{1}$. The sequence $n^{-1 / 2} \sum_{i=1}^{n} Z_{i}=(n m)^{-1 / 2} \sum_{i=1}^{n} \sum_{j=1}^{m} Z_{i, j}$ converges to the same limit $\mathbb{G}$ for each $m$ as $n \rightarrow \infty$. Since the convergence is "accelerated," there exists $N$ such that (2.3.10) holds for $n \geq N$ and all $m$, where $x$ can be chosen dependent on $\varepsilon$ and $\mathbb{G}$ only, as before. In other words, there exists $x$ and $N$ such that for $n \geq N$,

$$
x^{2} n \mathrm{P}\left(\frac{1}{\sqrt{m}}\left\|\sum_{j=1}^{m} Z_{1, j}\right\|_{\mathcal{F}}>x \sqrt{n}\right) \leq 8 \varepsilon
$$

for every $m$. This implies the lemma.
If a distribution on the real line has tails of the order $o\left(x^{-2}\right)$, then all its moments of order $0<r<2$ exist. One interesting consequence of the preceding lemma is that the sequence of moments $\mathrm{E}^{*}\left\|n^{-1 / 2} \sum_{i=1}^{n} Z_{i}\right\|_{\mathcal{F}}^{r}$ is uniformly bounded for every $0<r<2$. Given the weak convergence, this gives that the sequence $\mathrm{E}^{*}\left\|n^{-1 / 2} \sum_{i=1}^{n} Z_{i}\right\|_{\mathcal{F}}^{r}$ converges to the corresponding moment of the limit variable.
2.3.11 Lemma. Let $Z_{1}, Z_{2}, \ldots$ be i.i.d. stochastic processes, linear in $f$. Set $\rho_{Z}(f, g)=\sigma\left(Z_{1}(f)-Z_{1}(g)\right)$ and $\mathcal{F}_{\delta}=\left\{f-g: \rho_{Z}(f, g)<\delta\right\}$. Then the following statements are equivalent:
(i) $n^{-1 / 2} \sum_{i=1}^{n} Z_{i}$ converges weakly to a tight limit in $\ell^{\infty}(\mathcal{F})$;
(ii) $\left(\mathcal{F}, \rho_{Z}\right)$ is totally bounded and $\left\|n^{-1 / 2} \sum_{i=1}^{n} Z_{i}\right\|_{\mathcal{F}_{\delta_{n}}} \xrightarrow{\text { P* }} 0$ for every $\delta_{n} \downarrow$ 0 ;
(iii) $\left(\mathcal{F}, \rho_{Z}\right)$ is totally bounded and $\mathrm{E}^{*}\left\|n^{-1 / 2} \sum_{i=1}^{n} Z_{i}\right\|_{\mathcal{F}_{\delta_{n}}} \rightarrow 0$ for every $\delta_{n} \downarrow 0$.
These conditions imply that the sequence $\mathrm{E}^{*}\left\|n^{-1 / 2} \sum_{i=1}^{n} Z_{i}\right\|_{\mathcal{F}}^{r}$ converges to $\mathrm{E}\|\mathbb{G}\|_{\mathcal{F}}^{r}$ for every $0<r<2$.

Proof. The equivalence of (i) and (ii) is clear from the general results on weak convergence in $\ell^{\infty}(\mathcal{F})$ obtained in Chapter 1.5. Condition (iii) implies (ii) by Markov's inequality.

Suppose (i) and (ii) hold. Then $\mathrm{P}^{*}\left(\left\|Z_{1}\right\|_{\mathcal{F}}>x\right)=o\left(x^{-2}\right)$ as $x$ tends to infinity by Lemma 2.3.9. This implies that

$$
\mathrm{E}^{*} \max _{1 \leq i \leq n} \frac{\left\|Z_{i}\right\|_{\mathcal{F}}}{\sqrt{n}} \rightarrow 0
$$

(Problem 2.3.3). In view of the triangle inequality, the same is true with $\mathcal{F}$ replaced by $\mathcal{F}_{\delta_{n}}$. Convergence to zero in probability of $\left\|n^{-1 / 2} \sum_{i=1}^{n} Z_{i}\right\|_{\mathcal{F}_{\delta_{n}}}$ implies pointwise convergence to zero of the sequence of their quantile functions. Apply Hoffmann-Jørgensen's inequality (Proposition A.1.5) to obtain (iii).

The last assertion follows from the remark after Lemma 2.3.9.
To recover the empirical process, set $Z_{i}(f)=f\left(X_{i}\right)-P f$.
2.3.12 Corollary. Let $\mathcal{F}$ be a class of measurable functions. Then the following are equivalent:
(i) $\mathcal{F}$ is $P$-Donsker;
(ii) $\left(\mathcal{F}, \rho_{P}\right)$ is totally bounded and (2.1.8) holds;
(iii) $\left(\mathcal{F}, \rho_{P}\right)$ is totally bounded and (2.3.8) holds.
2.3.13 Corollary. Every $P$-Donsker class $\mathcal{F}$ satisfies $P\left(\|f-P f\|_{\mathcal{F}}^{*}>x\right)= o\left(x^{-2}\right)$ as $x$ tends to infinity. Consequently, if $\|P f\|_{\mathcal{F}}<\infty$, then $\mathcal{F}$ possesses an envelope function $F$ with $P(F>x)=o\left(x^{-2}\right)$.

## * 2.3.3 Separable Versions

Let $(\mathcal{F}, \rho)$ be a given separable, semimetric space. A stochastic process $\{\mathbb{G}(f, \omega): f \in \mathcal{F}\}$ is called separable if there exists a null set $N$ and a countable subset $\mathcal{G} \subset \mathcal{F}$ such that, for all $\omega \notin N$ and $f \in \mathcal{F}$, there exists a

[^6]sequence $g_{m}$ in $\mathcal{G}$ with $g_{m} \rightarrow f$ and $\mathbb{G}\left(g_{m}, \omega\right) \rightarrow \mathbb{G}(f, \omega)$. A stochastic process $\{\tilde{\mathbb{G}}(f): f \in \mathcal{F}\}$ is a separable version of a given process $\{\mathbb{G}(f): f \in \mathcal{F}\}$ if $\tilde{\mathbb{G}}$ is separable and $\tilde{\mathbb{G}}(f)=\mathbb{G}(f)$ almost surely for every $f$. (The two processes must be defined on the same probability space, and the exceptional null sets may depend on $f$.)

It is well known that every stochastic process possesses a separable version (possibly taking values in the extended real line). By its definition, a separable process has excellent measurability properties. In this subsection it is shown that an empirical process possesses a separable version that is itself an empirical process. This fact is used in Chapter 2.10 (and there only) to remove unnecessary measurability conditions from a theorem.

For any separable process $\tilde{\mathbb{G}}$ with countable "separant" $\mathcal{G}$,

$$
\sup _{\substack{\rho(f, g)<\delta \\ f, g \in \mathcal{F}}}|\tilde{\mathbb{G}}(f)-\tilde{\mathbb{G}}(g)|=\sup _{\substack{\rho(f, g)<\delta \\ f, g \in \mathcal{G}}}|\tilde{\mathbb{G}}(f)-\tilde{\mathbb{G}}(g)|, \quad \text { a.s. }
$$

If $\tilde{\mathbb{G}}$ is a version of $\mathbb{G}$, then the countability of $\mathcal{G}$ implies that the right side changes at most on a null set if $\tilde{\mathbb{G}}$ is replaced by $\mathbb{G}$. Next the expression increases if $\mathcal{G}$ is replaced by $\mathcal{F}$. Thus, for every separable version $\tilde{\mathbb{G}}$ of a process $\mathbb{G}$,

$$
\sup _{\substack{\rho(f, g)<\delta \\ f, g \in \mathcal{F}}}|\tilde{\mathbb{G}}(f)-\tilde{\mathbb{G}}(g)| \leq \sup _{\substack{\rho(f, g)<\delta \\ f, g \in \mathcal{F}}}|\mathbb{G}(f)-\mathbb{G}(g)|, \quad \text { a.s. }
$$

It follows that the modulus of continuity of a process decreases when replacing it by a separable version. Consequently, asymptotic equicontinuity of a sequence of processes implies the same for any sequence of separable versions. Since the marginal distributions of a process do not change when passing to a separable version, this yields the following lemma.
2.3.14 Lemma. Let $\tilde{\mathbb{G}}_{n}$ be separable versions of a sequence of stochastic processes $\mathbb{G}_{n}$ with sample paths in $\ell^{\infty}(\mathcal{F})$. Then the sequence $\mathbb{G}_{n}$ converges in distribution to a tight limit in $\ell^{\infty}(\mathcal{F})$ if and only if the sequence $\tilde{\mathbb{G}}_{n}$ converges to a tight limit and $\mathbb{G}_{n}-\tilde{\mathbb{G}}_{n}$ converges to zero in outer probability in $\ell^{\infty}(\mathcal{F})$.

Empirical processes allow a special type of separable version, constructed from a separable version of the index class $\mathcal{F}$. Let $\mathcal{F}$ be a class of square integrable measurable functions $f: \mathcal{X} \mapsto \mathbb{R}$ on a probability space ( $\mathcal{X}, \mathcal{A}, P$ ). Call $\mathcal{F}$ a pointwise separable class if there exists a countable subset $\mathcal{G} \subset \mathcal{F}$ and for each $n$ a null set $N_{n} \subset \mathcal{X}^{n}$ (for $P^{n}$ ) such that, for all $\left(x_{1}, \ldots, x_{n}\right) \notin N_{n}$ and $f \in \mathcal{F}$, there exists a sequence $g_{m}$ in $\mathcal{G}$ such that $g_{m} \rightarrow f$ in $L_{2}(P)$ and $\left(g_{m}\left(x_{1}\right), \ldots, g_{m}\left(x_{n}\right)\right) \rightarrow\left(f\left(x_{1}\right), \ldots, f\left(x_{n}\right)\right)$. A class $\tilde{\mathcal{F}}$ of measurable functions is a pointwise separable version of $\mathcal{F}$ if $\tilde{\mathcal{F}}$ is pointwise separable and there exists a bijection $f \leftrightarrow \tilde{f}$ between $\mathcal{F}$ and $\tilde{\mathcal{F}}$ such that $f=\tilde{f}$ almost surely.

Let $\mathbb{G}_{n}=\sqrt{n}\left(\mathbb{P}_{n}-P\right)$ be the empirical process indexed by the class of functions $\mathcal{F}$. If $\mathcal{F}$ is a pointwise separable version of $\mathcal{F}$, then

$$
\tilde{\mathbb{G}}_{n}(f)=\mathbb{G}_{n}(\tilde{f})
$$

defines a separable version of $\mathbb{G}_{n}$, for every $n$. This separable version is itself an empirical process, and its index class is obtained by changing each element of the original index class on a null set. Furthermore, the difference process $\mathbb{G}_{n}-\tilde{\mathbb{G}}_{n}$ is the empirical process indexed by the class $\{f-\tilde{f}: f \in \mathcal{F}\}$. Each of the functions in this class is zero almost surely. It turns out that the empirical process indexed by a zero class converges in probability to zero if and only if the same is true for the class of absolute values. This yields the following theorem.
2.3.15 Theorem. Let $\tilde{\mathcal{F}}$ be a pointwise separable version of a class of square integrable measurable functions $\mathcal{F}$. Then $\mathcal{F}$ is Donsker if and only if $\tilde{\mathcal{F}}$ is Donsker and $\sup _{f \in \mathcal{F}} \sqrt{n} \mathbb{P}_{n}|f-\tilde{f}| \rightarrow 0$ in outer probability.

Proof. By the preceding lemma, $\mathcal{F}$ is Donsker if and only if $\tilde{\mathcal{F}}$ is Donsker and $\sqrt{n}\left\|\mathbb{P}_{n}(f-\tilde{f})\right\|_{\mathcal{F}} \rightarrow 0$ in outer probability. It suffices to show that for a class of measurable functions $f: \mathcal{X} \mapsto \mathbb{R}$ such that $f=0$ almost surely, for every $f$, the two statements $\sqrt{n}\left\|\mathbb{P}_{n} f\right\|_{\mathcal{F}} \xrightarrow{\mathrm{P} *} 0$ and $\sqrt{n}\left\|\mathbb{P}_{n}|f|\right\|_{\mathcal{F}} \xrightarrow{\mathrm{P} *} 0$ are equivalent. It is clear that the second statement implies the first.

For a proof in the other direction, fix $\varepsilon>0$ and define $U=\{x \in \left.\mathcal{X}^{n}:\left\|\mathbb{P}_{n}\right\|_{\mathcal{F}} \leq \varepsilon\right\}_{*}$. It will be shown that there exists a measurable set $U^{\prime} \subset U$ of the same measure as $U$ such that, for all $x \in U^{\prime}$ and every subset $I \subset\{1,2, \ldots, n\}$,

$$
\frac{1}{n}\left|\sum_{i \in I} f\left(x_{i}\right)\right| \leq \varepsilon .
$$

Then it follows that $\mathrm{P}_{*}\left(\left\|\mathbb{P}_{n}\right\|_{|\mathcal{F}|} \leq 2 \varepsilon\right) \geq \mathrm{P}_{*}\left(\left\|\mathbb{P}_{n}\right\|_{\mathcal{F}} \leq \varepsilon\right)$, and the desired result follows.

For $I \subset\{1,2, \ldots, n\}$, identify $x \in \mathcal{X}^{n}$ with $(\alpha, \beta)$, where $\alpha \in \mathcal{X}^{I}$ are the coordinates $x_{i}$ with $i \in I$ and $\beta \in \mathcal{X}^{n-I}$ are the remaining coordinates. Let $U_{\alpha} \subset \mathcal{X}^{n}$ be the "vertical" section $\{\alpha\} \times\{\beta:(\alpha, \beta) \in U\}$ of $U$ at "width" $\alpha$, and let $\pi U_{\alpha}$ be the projection of $U_{\alpha}$ on $\mathcal{X}^{n-I}$ (so that $U_{\alpha}=\{\alpha\} \times \pi U_{\alpha}$ ). Let $V_{I}$ be the union of all sections $U_{\alpha}$ with projection $\pi U_{\alpha}$ equal to a null set (under $P^{n-I}$ ). By Fubini's theorem, $P^{n}\left(V_{I}\right)=0$. Set

$$
U^{\prime}=U-\bigcup_{I} V_{I},
$$

where $I$ ranges over all nonempty, proper subsets of $\{1, \ldots, n\}$.
Fix $I$ and $f$. Each $x \in U^{\prime}$ can be identified with a pair $(\alpha, \beta)$ as before. By construction $P^{n-I}\left(\pi U_{\alpha}\right)>0$ and by assumption $\left(f\left(\beta_{1}^{\prime}\right), \ldots, f\left(\beta_{n-I}^{\prime}\right)\right)=$

0 almost surely under $P^{n-I}$. Conclude that there must be a $\beta^{\prime} \in \pi U_{\alpha}$ with $\left(f\left(\beta_{1}^{\prime}\right), \ldots, f\left(\beta_{n-I}^{\prime}\right)\right)=0$. Thus

$$
\frac{1}{n}\left|\sum_{i \in I} f\left(x_{i}\right)\right|=\frac{1}{n}\left|\sum_{i \in I} f\left(\alpha_{i}\right)+\sum_{i \notin I} f\left(\beta_{i}^{\prime}\right)\right| \leq \varepsilon,
$$

because $\left(\alpha, \beta^{\prime}\right) \in U$. This concludes the proof.
The preceding theorem shows that the difference between $\mathbb{G}_{n}$ and $\tilde{\mathbb{G}}_{n}$ must be small due to the fact that the differences $f-\tilde{f}$ are small: the difference cannot be small through the cancellation of positive terms by negative terms.

A pointwise separable version of a given class of functions can be constructed from a special type of lifting of $L_{\infty}(\mathcal{X}, \mathcal{A}, P)$. A lifting is a map $\rho: L_{\infty}(\mathcal{X}, \mathcal{A}, P) \mapsto \mathcal{L}_{\infty}(\mathcal{X}, \mathcal{A}, P)$ that assigns to each equivalence class $f$ of essentially bounded functions a representative $\rho f$ in such a way that
(i) $\rho 1=1$;
(ii) $\rho$ is positive: $\rho f(x) \geq 0$ for all $x$ if $f \geq 0$ almost surely;
(iii) $\rho$ is linear;
(iv) $\rho$ is multiplicative: $\rho(f g)=\rho f \rho g$.

Any lifting automatically possesses the further property:
(vi) $\rho h\left(f_{1}, \ldots, f_{n}\right) \geq h\left(\rho f_{1}, \ldots, \rho f_{n}\right)$ for every lower semicontinuous $h: \mathbb{R}^{n} \mapsto \mathbb{R}$ and $f_{1}, \ldots, f_{n}$ in $\mathcal{L}_{\infty}(\mathcal{X}, \mathcal{A}, P)$ (Problem 2.3.8).
It is well known that every complete probability space ( $\mathcal{X}, \mathcal{A}, P$ ) admits a lifting $\rho$ of the space $L_{\infty}(\mathcal{X}, \mathcal{A}, P)$. For the construction of a separable version of the empirical process, a lifting with a further property is needed. This exists by the following proposition.
2.3.16 Proposition (Consistent lifting). Any complete probability space ( $\mathcal{X}, \mathcal{A}, P$ ) admits a lifting of the space $L_{\infty}(\mathcal{X}, \mathcal{A}, P)$ such that for each $n$ the map $\rho_{n}$ given by the diagram

$$
\left(\left(x_{1}, \ldots, x_{n}\right) \mapsto f\left(x_{i}\right)\right) \xrightarrow{\rho_{n}}\left(\left(x_{1}, \ldots, x_{n}\right) \mapsto \rho f\left(x_{i}\right)\right)
$$

is the restriction [to the set of functions of the type $\left(x_{1}, \ldots, x_{n}\right) \mapsto f\left(x_{i}\right)$, where $f$ ranges over $\left.L_{\infty}(\mathcal{X}, \mathcal{A}, P)\right]$ of a lifting of $L_{\infty}\left(\mathcal{X}^{n}, \mathcal{A}^{n}, P^{n}\right)$ for each $1 \leq i \leq n$.

This proposition is proved by Talagrand (1982), who calls a lifting $\rho$ with the given property a consistent lifting. There also exist liftings that are not consistent.

Suppose $\mathcal{F}$ is a class of measurable, uniformly bounded functions. The following theorem shows that a pointwise separable version $\tilde{\mathcal{F}}$ of $\mathcal{F}$ can be defined by

$$
\tilde{f}(x)=\rho f(x)
$$

for a consistent lifting $\rho$ of $L_{\infty}(\mathcal{X}, \mathcal{A}, P)$. (Interpret $\rho f$ as the image of the class of $f$ under $\rho$.) This separable version inherits the nice properties of a lifting: the map $f \mapsto \tilde{f}$ is positive, linear, and multiplicative.

If $\mathcal{F}$ contains unbounded functions, then a pointwise separable version can be defined by

$$
\tilde{f}(x)=\Phi^{-1} \circ \rho(\Phi \circ f)(x)
$$

for a consistent lifting as before and a fixed, strictly monotone bijection of $\overline{\mathbb{R}}$ onto a compact interval. This separable modification $f \mapsto \tilde{f}$ lacks linearity and multiplicativity but is positive.
2.3.17 Theorem (Separable modification). Let $(\mathcal{X}, \mathcal{A}, P)$ be a complete probability space and $\mathcal{F}$ be a class of measurable functions $f: \mathcal{X} \mapsto \mathbb{R}$. If $\mathcal{F}$ is separable in $L_{2}(P)$, then there exists a pointwise separable version of $\mathcal{F}$.

Proof. Define $\tilde{f}$ as indicated, using a consistent lifting, so that the map $\rho_{n}$ in the preceding proposition is a lifting. Then $f=\tilde{f}$ almost surely, because $\rho \Phi \circ f$ is a representative of the class of $\Phi \circ f$.

Fix $n$ and open sets $U \subset \mathcal{F}$ and $G \subset \mathbb{R}^{n}$. Define

$$
A_{f}=\left\{\left(x_{1}, \ldots, x_{n}\right) \in \mathcal{X}^{n}:\left(\rho \Phi \circ f\left(x_{1}\right), \ldots, \rho \Phi \circ f\left(x_{n}\right)\right) \in G\right\}
$$

For $D \subset \mathcal{F}$ set $A_{D}=\cup_{f \in D} A_{f}$. There exists a countable subset $D \subset U$ for which $P^{n}\left(A_{D}\right)$ is maximal over all countable subsets $D$ of $U$. Any maximizing $D$ satisfies $1_{A_{f}} \leq 1_{A_{D}}$ almost surely for all $f \in U$. By positivity of the lifting $\rho_{n}$, it follows that

$$
\rho_{n} 1_{A_{f}}(x) \leq \rho_{n} 1_{A_{D}}(x), \quad \text { for every } x .
$$

Set $N_{n}=\left\{x \in \mathcal{X}^{n}: 1_{A_{D}}(x)=0, \rho_{n} 1_{A_{D}}(x)=1\right\}$. By multiplicativity the image of an indicator function under a lifting is an indicator function. It follows that $N_{n}$ can also be described as the set of $x$ such that $1_{A_{D}}(x)< \rho_{n} 1_{A_{D}}(x)$. Let $(\Phi \circ f)_{i}$ denote the function $\left(x_{1}, \ldots, x_{n}\right) \mapsto \Phi \circ f\left(x_{i}\right)$. Since $G$ is open, property (vi) of the lifting $\rho_{n}$ gives
$\rho_{n} 1_{A_{f}}=\rho_{n} 1_{G}\left((\Phi \circ f)_{1}, \ldots,(\Phi \circ f)_{n}\right) \geq 1_{G}\left(\rho_{n}(\Phi \circ f)_{1}, \ldots, \rho_{n}(\Phi \circ f)_{n}\right)=1_{A_{f}}$.
Combination of the last two displayed equations yields that $\rho_{n} 1_{A_{D}}(x) \geq 1_{A_{f}}(x)$ for every $x$. If $x \in A_{f}$ and $x \notin N_{n}$, then it follows that $x \in A_{D}$.

It has been proved that, for every open $U \subset \mathcal{F}$ and open $G \subset \mathbb{R}^{n}$, there exists a countable set $D_{U, G} \subset U$ and a null set $N_{n, U, G} \subset \mathcal{X}^{n}$ such that

$$
\begin{aligned}
x \notin N_{n, U, G} \wedge(\rho \Phi \circ f( & \left.\left.x_{1}\right), \ldots, \rho \Phi \circ f\left(x_{n}\right)\right) \in G \\
& \Rightarrow \exists g \in D_{U, G}:\left(\rho \Phi \circ g\left(x_{1}\right), \ldots, \rho \Phi \circ g\left(x_{n}\right)\right) \in G .
\end{aligned}
$$

Repeat the construction for every $U$ and $G$ in countable bases for the open sets in $\mathcal{F}$ and $\mathbb{R}^{n}$, respectively. Let $N_{n}$ and $\mathcal{G}$ be the union of all null
sets $N_{n, U, G}$ and countable $D_{U, G}$. Then for every $x \notin N_{n}$ and $f \in \mathcal{F}$, there exists a sequence $g_{m}$ in $\mathcal{G}$ with $\left(\rho \Phi \circ g_{m}\left(x_{1}\right), \ldots, \rho \Phi \circ g_{m}\left(x_{n}\right)\right) \mapsto \left(\rho \Phi \circ f\left(x_{1}\right), \ldots, \rho \Phi \circ f\left(x_{n}\right)\right)$. Thus the class of functions $\{\rho(\Phi \circ f): f \in \mathcal{F}\}$ is pointwise separable.

## Problems and Complements

1. There is no universal constant $K$ such that $\mathrm{E}\left|\sum \varepsilon_{i} X_{i}\right| \leq K \mathrm{E}\left|\sum\left(X_{i}-\mathrm{E} X_{i}\right)\right|$ for any i.i.d. random variables $X_{1}, \ldots, X_{n}$.
[Hint: Take $n=1$ and $X_{1} \sim N(\mu, 1)$.]
2. For independent random variables $\xi_{1}, \ldots, \xi_{n}$,

$$
\mathrm{P}\left(\max _{i}\left|\xi_{i}\right|>x\right) \geq \frac{\sum_{i} \mathrm{P}\left(\left|\xi_{i}\right|>x\right)}{1+\sum_{i} \mathrm{P}\left(\left|\xi_{i}\right|>x\right)} .
$$

In particular, if the left side is less than $1 / 2$, then $2 \mathrm{P}\left(\max _{i}\left|\xi_{i}\right|>x\right) \geq \sum_{i} \mathrm{P}\left(\left|\xi_{i}\right|>x\right)$.
[Hint: For $x \geq 0$, one has $1-x \leq \exp (-x)$ and $1-e^{-x} \geq x /(1+x)$.]
3. Let $X_{n 1}, \ldots, X_{n n}$ be an arbitrary array of real random variables.
(i) If $\sup _{x>\varepsilon \sqrt{n}} n^{-1} \sum_{i=1}^{n} x^{2} \mathrm{P}\left(\left|X_{n i}\right|>x\right) \rightarrow 0$ for every $\varepsilon>0$, then $\mathrm{E} \max _{1 \leq i \leq n}\left|X_{n i}\right| / \sqrt{n} \rightarrow 0$.
(ii) If the array is rowwise i.i.d., then $\max _{1 \leq i \leq n}\left|X_{n i}\right|=o_{P}(\sqrt{n})$ if and only if $\mathrm{P}\left(\left|X_{n i}\right|>\varepsilon \sqrt{n}\right)=o\left(n^{-1}\right)$ for every $\varepsilon>0$.
If the variables in the triangular array are i.i.d., then all assertions are equivalent to $\mathrm{P}\left(\left|X_{1}\right|>x\right)=o\left(x^{-2}\right)$.
[Hint: $\mathrm{E} \max \left|X_{n i}\right|\left\{\left|X_{n i}\right|>\varepsilon \sqrt{n}\right\}$ is bounded by $\sum \int_{0}^{\infty} \mathrm{P}\left(\left|X_{n i}\right| 1\left\{\left|X_{n i}\right|>\right.\right. \varepsilon \sqrt{n}\}>t) d t$. This integral splits into two pieces. The integral over the second part $[\varepsilon \sqrt{n}, \infty)$ can be bounded by $\sup _{x>\varepsilon \sqrt{n}} n^{-1} \sum x^{2} \mathrm{P}\left(\left|X_{n i}\right|>x\right)$ times $\int_{\varepsilon \sqrt{n}}^{\infty} x^{-2} d x$.]
4. Let $\xi_{1}, \ldots, \xi_{n}$ be i.i.d. random variables.
(i) Show that the following are equivalent.
(a) $\mathrm{P}\left(\left|\xi_{1}\right|>x\right)=o\left(x^{-1}\right)$.
(b) $\max _{1 \leq i \leq n}\left|\xi_{i}\right| / n$ converges to zero in probability.
(c) $\max _{1 \leq i \leq n}\left|\xi_{i}\right|^{r} / n^{r}$ converges to zero in mean for every $r<1$.
(ii) Show that the following are equivalent:
(a) $\mathrm{E}\left|\xi_{1}\right|<\infty$.
(b) $\max _{1 \leq i \leq n}\left|\xi_{i}\right| / n$ converges to zero almost surely.
(c) $\max _{1 \leq i \leq n}\left|\xi_{i}\right| / n$ converges to zero in mean.
(iii) Let $r>1$. Use (i) and (ii) to show the following:
(a) Show that $\mathrm{P}\left(\left|\xi_{1}\right|>x\right)=o\left(x^{-r}\right)$ if and only if $\max _{1 \leq i \leq n}\left|\xi_{i}\right| / n^{1 / r}$ converges to zero in probability if and only if $\max _{1 \leq i \leq n}\left|\xi_{i}\right| / n^{1 / r}$ converges to zero in mean.
(b) Show that $\mathrm{E}\left|\xi_{1}\right|^{r}<\infty$ if and only if $\max _{1 \leq i \leq n}\left|\xi_{i}\right|^{r} / n$ converges to zero almost surely if and only if $\max _{1 \leq i \leq n}\left|\xi_{i}\right|^{r} / n$ converges to zero in mean.
5. For $r>0$, suppose that $\left\{\xi_{i}\right\}$ is a finite sequence of positive independent random variables with $\mathrm{E}\left|\xi_{i}\right|^{r}<\infty$, for all $i$. Let $t_{0}=\inf \left\{t>0: \sum_{i} \mathrm{P}\left(\xi_{i}>\right.\right. t) \leq \lambda\}$. Then

$$
\frac{\lambda}{1+\lambda} t_{0}^{r}+\frac{1}{1+\lambda} \sum_{i} \int_{t_{0}}^{\infty} \mathrm{P}\left(\xi_{i}>t\right) d t^{r} \leq \mathrm{E} \max _{i}\left|\xi_{i}\right|^{r} \leq t_{0}^{r}+\sum_{i} \int_{t_{0}}^{\infty} \mathrm{P}\left(\xi_{i}>t\right) d t^{r}
$$

[Hint: Use Problem 2.3.2.]
6. For i.i.d. random variables $X_{1}, X_{2}, \ldots$ with $\mathrm{E}\left|X_{1}\right|<\infty$ and any $r<1$, we have $\operatorname{Esup}_{n \geq 1}\left(\left|X_{n}\right| / n\right)^{r}<\infty$.
[Hint: Use Problem 2.3.5.]
7. For i.i.d. random variables $X_{1}, X_{2}, \ldots$, the expectation $\operatorname{Esup}_{n \geq 1}\left(\left|X_{n}\right| / n\right)$ is finite if and only if $\mathrm{E}\left(\left|X_{1}\right| \log \left|X_{1}\right|\right)$ is finite. Here $\log x=1 \vee(\log x)$.
[Hint: Use Problem 2.3.5.]
8. Any lifting $\rho$ of $L_{\infty}(\mathcal{X}, \mathcal{A}, P)$ has the following additional properties:
(i) $\|\rho f\|_{\infty} \leq\|f\|_{\infty}$;
(ii) $\rho h\left(f_{1}, \ldots, f_{n}\right)=h\left(\rho f_{1}, \ldots, \rho f_{n}\right)$ for every continuous function $h: \mathbb{R}^{n} \mapsto \mathbb{R}$ and $f_{1}, \ldots, f_{n}$ in $L_{\infty}(\mathcal{X}, \mathcal{A}, P) ;$
(iii) $\rho h\left(f_{1}, \ldots, f_{n}\right) \geq h\left(\rho f_{1}, \ldots, \rho f_{n}\right)$ for every lower semicontinuous function $h: \mathbb{R}^{n} \mapsto \mathbb{R}$ and $f_{1}, \ldots, f_{n}$ in $L_{\infty}(\mathcal{X}, \mathcal{A}, P) ;$
(iv) $\rho 1_{A}=1_{\tilde{A}}$ for some measurable set $\tilde{A}$.
[Hint: For polynomials $h$, property (ii) is a consequence of linearity and multiplicativity of a lifting. By the Stone-Weierstrass theorem, every continuous $h$ can be uniformly approximated by polynomials on any given compact subset of $\mathbb{R}^{n}$. Thus the general form of (ii) can be reduced to polynomials in view of (i).

Property (iii) is a consequence of (ii), because every lower semicontinuous function can be approximated pointwise from below by a sequence of continuous functions.]

## 2.4

## Glivenko-Cantelli Theorems

In this chapter we prove two types of Glivenko-Cantelli theorems. The first theorem is the simplest and is based on entropy with bracketing. Its proof relies on finite approximation and the law of large numbers for real variables. The second theorem uses random $L_{1}$-entropy numbers and is proved through symmetrization followed by a maximal inequality.

Recall Definition 2.1.6 of the bracketing numbers of a class $\mathcal{F}$ of functions.
2.4.1 Theorem. Let $\mathcal{F}$ be a class of measurable functions such that $N_{[]}\left(\varepsilon, \mathcal{F}, L_{1}(P)\right)<\infty$ for every $\varepsilon>0$. Then $\mathcal{F}$ is Glivenko-Cantelli.

Proof. Fix $\varepsilon>0$. Choose finitely many $\varepsilon$-brackets $\left[l_{i}, u_{i}\right]$ whose union contains $\mathcal{F}$ and such that $P\left(u_{i}-l_{i}\right)<\varepsilon$ for every $i$. Then, for every $f \in \mathcal{F}$, there is a bracket such that

$$
\left(\mathbb{P}_{n}-P\right) f \leq\left(\mathbb{P}_{n}-P\right) u_{i}+P\left(u_{i}-f\right) \leq\left(\mathbb{P}_{n}-P\right) u_{i}+\varepsilon .
$$

Consequently,

$$
\sup _{f \in \mathcal{F}}\left(\mathbb{P}_{n}-P\right) f \leq \max _{i}\left(\mathbb{P}_{n}-P\right) u_{i}+\varepsilon .
$$

The right side converges almost surely to $\varepsilon$ by the strong law of large numbers for real variables. Combination with a similar argument for $\inf _{f \in \mathcal{F}}\left(\mathbb{P}_{n}-P\right) f$ yields that $\limsup \left\|\mathbb{P}_{n}-P\right\|_{\mathcal{F}}^{*} \leq \varepsilon$ almost surely, for every $\varepsilon>0$. Take a sequence $\varepsilon_{m} \downarrow 0$ to see that the limsup must actually be zero almost surely.
2.4.2 Example. The previous proof generalizes a well-known proof of the Glivenko-Cantelli theorem for the empirical distribution function on the real line. Indeed, the set of indicator functions of cells $(-\infty, c]$ possesses finite bracketing numbers for any underlying distribution. Simply use the brackets $\left[1\left\{\left(-\infty, t_{i}\right]\right\}, 1\left\{\left(-\infty, t_{i+1}\right)\right\}\right]$ for a grid of points $-\infty=t_{0}<t_{1}< \cdots<t_{m}=\infty$ with the property $P\left(t_{i}, t_{i+1}\right)<\varepsilon$ for each $i$. Bracketing numbers of many other classes of functions are discussed in Chapter 2.7.

Both the statement and the proof of the following theorem are more complicated than the previous bracketing theorem. However, its sufficiency condition for the Glivenko-Cantelli property can be checked for many classes of functions by elegant combinatorial arguments, as discussed in a later chapter Another important note: its random entropy condition is necessary, a fact that is not proved here.
2.4.3 Theorem. Let $\mathcal{F}$ be a $P$-measurable class of measurable functions with envelope $F$ such that $P^{*} F<\infty$. Let $\mathcal{F}_{M}$ be the class of functions $f 1\{F \leq M\}$ when $f$ ranges over $\mathcal{F}$. If $\log N\left(\varepsilon, \mathcal{F}_{M}, L_{1}\left(\mathbb{P}_{n}\right)\right)=o_{P}^{*}(n)$ for every $\varepsilon$ and $M>0$, then $\left\|\mathbb{P}_{n}-P\right\|_{\mathcal{F}}^{*} \rightarrow 0$ both almost surely and in mean. In particular, $\mathcal{F}$ is Glivenko-Cantelli.

Proof. By the symmetrization Lemma 2.3.1, measurability of the class $\mathcal{F}$, and Fubini's theorem,

$$
\begin{aligned}
\mathrm{E}^{*}\left\|\mathbb{P}_{n}-P\right\|_{\mathcal{F}} & \leq 2 \mathrm{E}_{X} \mathrm{E}_{\varepsilon}\left\|\frac{1}{n} \sum_{i=1}^{n} \varepsilon_{i} f\left(X_{i}\right)\right\|_{\mathcal{F}} \\
& \leq 2 \mathrm{E}_{X} \mathrm{E}_{\varepsilon}\left\|\frac{1}{n} \sum_{i=1}^{n} \varepsilon_{i} f\left(X_{i}\right)\right\|_{\mathcal{F}_{M}}+2 P^{*} F\{F>M\}
\end{aligned}
$$

by the triangle inequality, for every $M>0$. For sufficiently large $M$, the last term is arbitrarily small. To prove convergence in mean, it suffices to show that the first term converges to zero for fixed $M$. Fix $X_{1}, \ldots, X_{n}$. If $\mathcal{G}$ is an $\varepsilon$-net in $L_{1}\left(\mathbb{P}_{n}\right)$ over $\mathcal{F}_{M}$, then

$$
\begin{equation*}
\mathrm{E}_{\varepsilon}\left\|\frac{1}{n} \sum_{i=1}^{n} \varepsilon_{i} f\left(X_{i}\right)\right\|_{\mathcal{F}_{M}} \leq \mathrm{E}_{\varepsilon}\left\|\frac{1}{n} \sum_{i=1}^{n} \varepsilon_{i} f\left(X_{i}\right)\right\|_{\mathcal{G}}+\varepsilon \tag{2.4.4}
\end{equation*}
$$

The cardinality of $\mathcal{G}$ can be chosen equal to $N\left(\varepsilon, \mathcal{F}_{M}, L_{1}\left(\mathbb{P}_{n}\right)\right)$. Bound the $L_{1}$-norm on the right by the Orlicz-norm for $\psi_{2}(x)=\exp \left(x^{2}\right)-1$, and use the maximal inequality Lemma 2.2.2 to find that the last expression does not exceed a multiple of

$$
\sqrt{1+\log N\left(\varepsilon, \mathcal{F}_{M}, L_{1}\left(\mathbb{P}_{n}\right)\right)} \sup _{f \in \mathcal{G}}\left\|\frac{1}{n} \sum_{i=1}^{n} \varepsilon_{i} f\left(X_{i}\right)\right\|_{\psi_{2} \mid X}+\varepsilon
$$

where the Orlicz norms $\|\cdot\|_{\psi_{2} \mid X}$ are taken over $\varepsilon_{1}, \ldots, \varepsilon_{n}$ with $X_{1}, \ldots, X_{n}$ fixed. By Hoeffding's inequality, they can be bounded by $\sqrt{6 / n}\left(\mathbb{P}_{n} f^{2}\right)^{1 / 2}$, which is less than $\sqrt{6 / n} M$. Thus the last displayed expression is bounded by

$$
\sqrt{1+\log N\left(\varepsilon, \mathcal{F}_{M}, L_{1}\left(\mathbb{P}_{n}\right)\right)} \sqrt{\frac{6}{n}} M+\varepsilon \xrightarrow{\mathrm{P} *} \varepsilon .
$$

It has been shown that the left side of (2.4.4) converges to zero in probability. Since it is bounded by $M$, its expectation with respect to $X_{1}, \ldots, X_{n}$ converges to zero by the dominated convergence theorem.

This concludes the proof that $\left\|\mathbb{P}_{n}-P\right\|_{\mathcal{F}}^{*} \rightarrow 0$ in mean. That it also converges almost surely follows from the fact that the sequence $\left\|\mathbb{P}_{n}-P\right\|_{\mathcal{F}}^{*}$ is a reverse martingale with respect to a suitable filtration. See the following lemma. -
2.4.5 Lemma. Let $\mathcal{F}$ be a class of measurable functions with envelope $F$ such that $P^{*} F<\infty$. Define a filtration by letting $\Sigma_{n}$ be the $\sigma$-field generated by all measurable functions $h: \mathcal{X}^{\infty} \mapsto \mathbb{R}$ that are permutationsymmetric in their first $n$ arguments. Then

$$
\mathrm{E}\left(\left\|\mathbb{P}_{n}-P\right\|_{\mathcal{F}}^{*} \mid \Sigma_{n+1}\right) \geq\left\|\mathbb{P}_{n+1}-P\right\|_{\mathcal{F}}^{*}, \quad \text { a.s. }
$$

Furthermore, there exist versions of the measurable cover functions $\| \mathbb{P}_{n}$ $P \|_{\mathcal{F}}^{*}$ that are adapted to the filtration. Any such versions form a reverse submartingale and converge almost surely to a constant.

Proof. Assume without loss of generality that $P f=0$ for every $f$. The function $h: \mathcal{X}^{n} \mapsto \mathbb{R}$ given by $h\left(x_{1}, \ldots, x_{n}\right)=\left\|n^{-1} \sum_{i=1}^{n} f\left(x_{i}\right)\right\|_{\mathcal{F}}$ is permutation-symmetric. Its measurable cover $h^{*}$ (for $P^{n}$ ) can be chosen permutation-symmetric as well (Problem 2.4.4). Then $h^{*}\left(X_{1}, \ldots, X_{n}\right)$ is a version of $\left\|\mathbb{P}_{n}\right\|_{\mathcal{F}}^{*}$ and is $\Sigma_{n}$ measurable.

Let $\mathbb{P}_{n}^{i}$ be the empirical measure of $X_{1}, \ldots, X_{i-1}, X_{i+1}, \ldots, X_{n+1}$. Then $\mathbb{P}_{n+1} f=(n+1)^{-1} \sum_{i=1}^{n+1} \mathbb{P}_{n}^{i} f$ for every $f$, whence

$$
\left\|\mathbb{P}_{n+1}\right\|_{\mathcal{F}}^{*} \leq \frac{1}{n+1} \sum_{i=1}^{n+1}\left\|\mathbb{P}_{n}^{i}\right\|_{\mathcal{F}}^{*}
$$

This is true for any version of the measurable covers. Choose the left side $\Sigma_{n+1}$-measurable and take conditional expectations with respect to $\Sigma_{n+1}$ to arrive at

$$
\left\|\mathbb{P}_{n+1}\right\|_{\mathcal{F}}^{*} \leq \frac{1}{n+1} \sum_{i=1}^{n+1} \mathrm{E}\left(\left\|\mathbb{P}_{n}^{i}\right\|_{\mathcal{F}}^{*} \mid \Sigma_{n+1}\right)
$$

Each term in the sum on the right side changes on at most a null set if $\left\|\mathbb{P}_{n}^{i}\right\|_{\mathcal{F}}^{*}$ is replaced by another version. For $h^{*}$ given in the first paragraph of the proof, choose the version $h^{*}\left(X_{1}, \ldots, X_{i-1}, X_{i+1}, \ldots, X_{n+1}\right)$ for $\left\|\mathbb{P}_{n}^{i}\right\|_{\mathcal{F}}^{*}$.

Since the function $h^{*}$ is permutation-symmetric, it follows by symmetry that the conditional expectations $\mathrm{E}\left(\left\|\mathbb{P}_{n}^{i}\right\|_{\mathcal{F}}^{*} \mid \Sigma_{n+1}\right)$ do not depend on $i$ (almost surely). Thus the right side of the display equals $\mathrm{E}\left(\left\|\mathbb{P}_{n}^{n+1}\right\|_{\mathcal{F}}^{*} \mid \Sigma_{n+1}\right)$. $\square$

The covering numbers of the class $\mathcal{F}_{M}$ of truncated functions in the previous theorem are smaller than those of the original class $\mathcal{F}$. Thus the conditions $P^{*} F<\infty$ and $\log N\left(\varepsilon, \mathcal{F}, L_{1}\left(\mathbb{P}_{n}\right)\right)=o_{P^{*}}(n)$ are sufficient for $\mathcal{F}$ to be Glivenko-Cantelli.

If $\mathcal{F}$ has a measurable envelope with $P F<\infty$, then $\mathbb{P}_{n} F=O(1)$ almost surely and the random entropy condition is equivalent to

$$
\log N\left(\varepsilon\|F\|_{\mathbb{P}_{n}, 1}, \mathcal{F}, L_{1}\left(\mathbb{P}_{n}\right)\right)=o_{P^{*}}(n) .
$$

In Chapter 2.6 it is shown that the entropy in the left side is uniformly bounded by a constant for so-called Vapnik-Crervonenkis classes $\mathcal{F}$. Hence any appropriately measurable Vapnik-Cervonenkis class is GlivenkoCantelli, provided its envelope function is integrable.

## Problems and Complements

1. (Necessity of integrability of the envelope) Suppose that for a class $\mathcal{F}$ of measurable functions the empirical measure of an i.i.d. sample satisfies
![](https://cdn.mathpix.com/cropped/f03991ca-974f-42d4-817b-7fcfd71231fb-040.jpg?height=43&width=1076&top_left_y=1246&top_left_x=256) $P^{*} F<\infty$ for an envelope function $F$.
[Hint: Since $(1 / n)\left\|f\left(X_{n}\right)-P f\right\|_{\mathcal{F}}$ is bounded above by $\left\|\mathbb{P}_{n}-P\right\|_{\mathcal{F}}+(1- 1 / n)\left\|\mathbb{P}_{n-1}-P\right\|_{\mathcal{F}}$, one has that $\mathrm{P}\left(\left\|f\left(X_{n}\right)-P f\right\|_{\mathcal{F}}^{*} \geq n\right.$, i.o. $)=0$. By the Borel-Cantelli lemma, it follows that the series $\sum \mathrm{P}\left(\left\|f\left(X_{n}\right)-P f\right\|_{\mathcal{F}}^{*} \geq n\right)$ converges. This series is an upper bound for the given first moment, because the $X_{n}$ are identically distributed.]
2. The $L_{r}(Q)$-entropy numbers of the class $\mathcal{F}_{M}=\{f 1\{F \leq M\}: f \in \mathcal{F}\}$ are smaller than those of $\mathcal{F}$ for any probability measure $Q$ and for numbers $M>0$ and $r \geq 1$.
3. (Stability of the Glivenko-Cantelli property) If $\mathcal{F}, \mathcal{F}_{1}$, and $\mathcal{F}_{2}$ are Glivenko-Cantelli classes of functions, then
(i) $\left\{a_{1} f_{1}+a_{2} f_{2}: f_{i} \in \mathcal{F}_{i},\left|a_{i}\right| \leq 1\right\}$ is Glivenko-Cantelli;
(ii) $\mathcal{F}_{1} \cup \mathcal{F}_{2}$ is Glivenko-Cantelli;
(iii) the class of all functions that are both the pointwise limit and the $L_{1}(P)$ limit of a sequence in $\mathcal{F}$ is Glivenko-Cantelli.
4. Let $h: \mathcal{X}^{n} \mapsto \mathbb{R}$ be permutation-symmetric. Then there exists a version $h^{*}$ of the measurable cover for $P^{n}$ on $\mathcal{A}^{n}$ which is permutation-symmetric.
[Hint: Take an arbitrary measurable cover $\tilde{h} \geq h$, and set $h^{*}=\min _{\sigma} \tilde{h} \circ \sigma$.]
5. If the underlying probability space is not the product space ( $\mathcal{X}^{\infty}, \mathcal{A}^{\infty}, P^{\infty}$ ), then $\left\|\mathbb{P}_{n}-P\right\|_{\mathcal{F}}$ may fail to be a reverse martingale, even if $\left\|\mathbb{P}_{n}-P\right\|_{\mathcal{F}}$ is measurable for each $n$.
[Hint: There exists a (nonmeasurable) set $A \subset[0,1]$ with inner and outer Lebesgue measures $\lambda_{*}(A)=0$ and $\lambda^{*}(A)=1$, respectively. Take $\left(\mathcal{X}_{n}, \mathcal{A}_{n}, P_{n}\right)$ equal to ( $A, \mathcal{B} \cap A, \lambda_{A}$ ) for odd values of $n$ and ( $A^{c}, \mathcal{B} \cap A^{c}, \lambda_{A^{c}}$ ) for even values of $n$, where $\lambda_{A}$ is the trace measure defined in Problem 1.2.16. Define $X_{n}$ to be the embedding of $\mathcal{X}_{n}$ into the unit interval, viewed as a map on the infinite product $\prod \mathcal{X}_{i}$, and let $\mathcal{F}$ be equal to the set of indicators of all finite subsets of $A^{c}$. Then $\left\|\mathbb{P}_{n}-P\right\|_{\mathcal{F}}$ equals $(n-1) / 2 n$, for odd values of $n$, and $1 / 2$ for $n$ even.]
6. If the filtration $\Sigma_{n}$ in Lemma 2.4.5 is replaced by the filtration consisting of the $\sigma$-fields generated by the variables $\mathbb{P}_{k} f$ for $k \geq n$ and $f$ ranging over $\mathcal{F}$, then $\left\|\mathbb{P}_{n}-P\right\|_{\mathcal{F}}^{*}$ may fail to be a reverse submartingale.
[Hint: Let $(\mathcal{X}, \mathcal{A}, P)$ be the unit interval in $\mathbb{R}$ with Borel sets and Lebesgue measure and $X_{1}, X_{2}, \ldots$ the coordinate projections of the infinite product space, as usual. For the collection $\mathcal{F}=\left\{1_{x}: x \in[1 / 2,1]\right\}$, the variable $\| \mathbb{P}_{n}- P \|_{\mathcal{F}}$ is measurable with respect to $\mathcal{A}^{\infty}$, but not $\tilde{\mathcal{A}}_{n}$-measurable for any $n$. It is also not measurable with respect to the $P^{\infty}$-completion of $\tilde{\mathcal{A}}_{n}$ even though $\mathcal{F}$ is image-admissible Suslin.]
7. The $\sigma$-field $\Sigma_{n}$ in Lemma 2.4.5 equals the $\sigma$-field generated by the variables $\mathbb{P}_{k} f$ with $k$ ranging over all integers greater than or equal to $n$ and $f$ ranging over the set of all measurable, integrable $f: \mathcal{X} \mapsto \mathbb{R}$.
8. The sequence of averages $\bar{Y}_{n}$ of the first $n$ elements of a sequence of i.i.d. random variables $Y_{1}, Y_{2}, \ldots$ with finite first absolute moment is a reverse martingale with respect to its natural filtration: $\mathrm{E}\left(\bar{Y}_{n} \mid \bar{Y}_{n+1}, \bar{Y}_{n+2}, \ldots\right)=\bar{Y}_{n+1}$.
[Hint: The conditional expectation equals $n^{-1} \sum_{i=1}^{n} \mathrm{E}\left(Y_{i} \mid \bar{Y}_{n+1}, Y_{n+2}, \ldots\right)$, and $\mathrm{E}\left(Y_{i} \mid \bar{Y}_{n+1}\right)$ is constant in $1 \leq i \leq n+1$ by symmetry.]
9. (Block-bracketing) Given a class $\mathcal{F}$ of functions $f: \mathcal{X} \mapsto \mathbb{R}$ with integrable envelope, define $\mathcal{F}^{\oplus m}$ to be the set of functions $\left(x_{1}, \ldots, x_{m}\right) \mapsto \sum_{i=1}^{m} f\left(x_{i}\right)$ on $\mathcal{X}^{m}$. Suppose that for every $\varepsilon>0$ there exists $m$ such that $N_{[]}\left(\varepsilon m, \mathcal{F}^{\oplus m}, L_{1}\left(P^{m}\right)\right)<\infty$. Then $\mathcal{F}$ is Glivenko-Cantelli.
[Hint: For every $\varepsilon>0$ and $f$, there exists $m$ and a bracket $\left[l_{m}, u_{m}\right]$ in $L_{1}\left(P^{m}\right)$ such that $m^{-1} P^{m} u_{m}-m^{-1} P^{m} l_{m}<\varepsilon$ and

$$
\begin{aligned}
\frac{1}{n m} \sum_{i=1}^{n} l_{m}\left(Y_{i, m}\right) & \leq \mathbb{P}_{n m} f \leq \frac{1}{n m} \sum_{i=1}^{n} u_{m}\left(Y_{i, m}\right), \\
\frac{1}{m} P^{m} l_{m} & \leq P f \leq \frac{1}{m} P^{m} u_{m}
\end{aligned}
$$

where $Y_{1, m}, Y_{2, m}, \ldots$ are the blocks $\left[X_{1}, \ldots, X_{m}\right],\left[X_{m+1}, \ldots, X_{2 m}\right], \ldots$. Conclude that for every $\varepsilon>0$ there exists $m$ such that $\limsup _{n \rightarrow \infty}\left\|\mathbb{P}_{n m}-P\right\|_{\mathcal{F}}^{*}< \varepsilon$. It suffices to "close the gaps."]

## 2.5

## Donsker Theorems

In this chapter we present the two main empirical central limit theorems. The first is based on uniform entropy, and its proof relies on symmetrization. The second is based on bracketing entropy.

### 2.5.1 Uniform Entropy

In this section weak convergence of the empirical process will be established under the condition that the envelope function $F$ be square integrable, combined with the uniform entropy bound

$$
\begin{equation*}
\int_{0}^{\infty} \sup _{Q} \sqrt{\log N\left(\varepsilon\|F\|_{Q, 2}, \mathcal{F}, L_{2}(Q)\right)} d \varepsilon<\infty \tag{2.5.1}
\end{equation*}
$$

Here the supremum is taken over all finitely discrete probability measures $Q$ on $(\mathcal{X}, \mathcal{A})$ with $\|F\|_{Q, 2}^{2}=\int F^{2} d Q>0$. These conditions are by no means necessary, but they suffice for many examples. Finiteness of the previous integral will be referred to as the uniform entropy condition.
2.5.2 Theorem. Let $\mathcal{F}$ be a class of measurable functions that satisfies the uniform entropy bound (2.5.1). Let the classes $\mathcal{F}_{\delta}=\{f-g: f, g \in \left.\mathcal{F},\|f-g\|_{P, 2}<\delta\right\}$ and $\mathcal{F}_{\infty}^{2}$ be $P$-measurable for every $\delta>0$. If $P^{*} F^{2}<\infty$, then $\mathcal{F}$ is $P$-Donsker.

Proof. Let $\delta_{n} \downarrow 0$ be arbitrary. By Markov's inequality and the symmetrization Lemma 2.3.1,

$$
\mathrm{P}^{*}\left(\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}_{\delta_{n}}}>x\right) \leq \frac{2}{x} \mathrm{E}^{*}\left\|\frac{1}{\sqrt{n}} \sum_{i=1}^{n} \varepsilon_{i} f\left(X_{i}\right)\right\|_{\mathcal{F}_{\delta_{n}}}
$$

Since the supremum in the right-hand side is measurable by assumption, Fubini's theorem applies and the outer expectation can be calculated as $\mathrm{E}_{X} \mathrm{E}_{\varepsilon}$. Fix $X_{1}, \ldots, X_{n}$. By Hoeffding's inequality, the stochastic process $f \mapsto\left\{n^{-1 / 2} \sum_{i=1}^{n} \varepsilon_{i} f\left(X_{i}\right)\right\}$ is sub-Gaussian for the $L_{2}\left(\mathbb{P}_{n}\right)$-seminorm

$$
\|f\|_{n}=\sqrt{\frac{1}{n} \sum_{i=1}^{n} f^{2}\left(X_{i}\right)}
$$

Use the second part of the maximal inequality Corollary 2.2.8 to find that

$$
\begin{equation*}
\mathrm{E}_{\varepsilon}\left\|\frac{1}{\sqrt{n}} \sum_{i=1}^{n} \varepsilon_{i} f\left(X_{i}\right)\right\|_{\mathcal{F}_{\delta_{n}}} \lesssim \int_{0}^{\infty} \sqrt{\log N\left(\varepsilon, \mathcal{F}_{\delta_{n}}, L_{2}\left(\mathbb{P}_{n}\right)\right)} d \varepsilon \tag{2.5.3}
\end{equation*}
$$

For large values of $\varepsilon$ the set $\mathcal{F}_{\delta_{n}}$ fits in a single ball of radius $\varepsilon$ around the origin, in which case the integrand is zero. This is certainly the case for values of $\varepsilon$ larger than $\theta_{n}$, where

$$
\theta_{n}^{2}=\sup _{f \in \mathcal{F}_{\delta_{n}}}\|f\|_{n}^{2}=\left\|\frac{1}{n} \sum_{i=1}^{n} f^{2}\left(X_{i}\right)\right\|_{\mathcal{F}_{\delta_{n}}}
$$

Furthermore, covering numbers of the class $\mathcal{F}_{\delta}$ are bounded by covering numbers of $\mathcal{F}_{\infty}=\{f-g: f, g \in \mathcal{F}\}$. The latter satisfy $N\left(\varepsilon, \mathcal{F}_{\infty}, L_{2}(Q)\right) \leq N^{2}\left(\varepsilon / 2, \mathcal{F}, L_{2}(Q)\right)$ for every measure $Q$.

Limit the integral in (2.5.3) to the interval $\left(0, \theta_{n}\right)$, make a change of variables, and bound the integrand to obtain the bound

$$
\int_{0}^{\theta_{n} /\|F\|_{n}} \sup _{Q} \sqrt{\log N\left(\varepsilon\|F\|_{Q, 2}, \mathcal{F}, L_{2}(Q)\right)} d \varepsilon\|F\|_{n}
$$

Here the supremum is taken over all discrete probability measures. The integrand is integrable by assumption. Furthermore, $\|F\|_{n}$ is bounded below by $\left\|F_{*}\right\|_{n}$, which converges almost surely to its expectation, which may be assumed positive. Use the Cauchy-Schwarz inequality and the dominated convergence theorem to see that the expectation (with respect to $\left.X_{1}, \ldots, X_{n}\right)$ of this integral converges to zero provided $\theta_{n} \xrightarrow{\mathrm{P} *} 0$. This would conclude the proof of asymptotic equicontinuity.

Since $\sup \left\{P f^{2}: f \in \mathcal{F}_{\delta_{n}}\right\} \rightarrow 0$ and $\mathcal{F}_{\delta_{n}} \subset \mathcal{F}_{\infty}$, it is certainly enough to prove that

$$
\left\|\mathbb{P}_{n} f^{2}-P f^{2}\right\|_{\mathcal{F}_{\infty}} \xrightarrow{\mathrm{P} *} 0 .
$$

This is a uniform law of large numbers for the class $\mathcal{F}_{\infty}^{2}$. This class has integrable envelope $(2 F)^{2}$ and is measurable by assumption. For any pair $f, g$ of functions in $\mathcal{F}_{\infty}$,

$$
\mathbb{P}_{n}\left|f^{2}-g^{2}\right| \leq \mathbb{P}_{n}|f-g| 4 F \leq\|f-g\|_{n}\|4 F\|_{n}
$$

It follows that the covering number $N\left(\varepsilon\|2 F\|_{n}^{2}, \mathcal{F}_{\infty}^{2}, L_{1}\left(\mathbb{P}_{n}\right)\right)$ is bounded by the covering number $N\left(\varepsilon\|F\|_{n}, \mathcal{F}_{\infty}, L_{2}\left(\mathbb{P}_{n}\right)\right)$. By assumption, the latter
number is bounded by a fixed number, so its logarithm is certainly $o_{P}^{*}(n)$, as required for the uniform law of large numbers, Theorem 2.4.3. This concludes the proof of asymptotic equicontinuity.

Finally, we show that $\mathcal{F}$ is totally bounded in $L_{2}(P)$. By the result of the last paragraph, there exists a sequence of discrete measures $P_{n}$ with $\left\|\left(P_{n}-P\right) f^{2}\right\|_{\mathcal{F}_{\infty}}$ converging to zero. Take $n$ sufficiently large so that the supremum is bounded by $\varepsilon^{2}$. By assumption, $N\left(\varepsilon, \mathcal{F}, L_{2}\left(P_{n}\right)\right)$ is finite. Any $\varepsilon$-net for $\mathcal{F}$ in $L_{2}\left(P_{n}\right)$ is a $\sqrt{2} \varepsilon$-net in $L_{2}(P)$.
2.5.4 Example (Cells in $\mathbb{R}^{k}$ ). The set $\mathcal{F}$ of all indicator functions $1\{(-\infty, t]\}$ of cells in $\mathbb{R}$ satisfies

$$
N\left(\varepsilon, \mathcal{F}, L_{2}(Q)\right) \leq N_{[]}\left(\varepsilon^{2}, \mathcal{F}, L_{1}(Q)\right) \leq \frac{2}{\varepsilon^{2}}
$$

for any probability measure $Q$ and $\varepsilon \leq 1$. Since $\int_{0}^{1} \log (1 / \varepsilon) d \varepsilon<\infty$, the class of cells in $\mathbb{R}$ is Donsker. The covering numbers of the class of cells $(-\infty, t]$ in higher dimensions satisfy a similar bound, but with a higher power of $(1 / \varepsilon)$. Thus the class of all cells $(-\infty, t]$ in $\mathbb{R}^{k}$ is Donsker for any dimension.

In the next chapter these classes of sets are shown to be examples of the large collection of VC-classes, which are all Donsker provided they are suitably measurable.

### 2.5.2 Bracketing

The second main empirical central limit theorem uses bracketing entropy rather than uniform entropy. The simplest version of this theorem uses $L_{2}(P)$-brackets and asserts that a class $\mathcal{F}$ of functions is $P$-Donsker if

$$
\int_{0}^{\infty} \sqrt{\log N_{[]}\left(\varepsilon, \mathcal{F}, L_{2}(P)\right)} d \varepsilon<\infty
$$

Note that unlike the uniform entropy condition, this bracketing integral involves only the true underlying measure $P$. However, part of this gain is offset by the fact that bracketing numbers can be larger than covering numbers. As a result, the two sufficient conditions for a class to be Donsker are not comparable. Examples of classes of functions that satisfy the bracketing condition are given in Chapter 2.7.

The above assertion will be proved in somewhat greater generality. It is not difficult to see that finiteness of the $L_{2}(P)$-bracketing integral implies that $P^{*} F^{2}<\infty$ for an envelope function $F$. It is known that this is not necessary for a class $\mathcal{F}$ to be Donsker, though the envelope must possess a weak second moment (meaning that $P^{*}(F>x)=o\left(x^{-2}\right)$ as $x \rightarrow \infty$ ). Similarly, the $L_{2}(P)$-norm used to measure the size of the brackets can be replaced by a weaker norm, which makes the bracketing numbers smaller
and the convergence of the integral easier. The result below measures the size of the brackets by their $L_{2, \infty}$-norm given by

$$
\|f\|_{P, 2, \infty}=\sup _{x>0}\left(x^{2} P(|f|>x)\right)^{1 / 2}
$$

(Actually this is not really a norm, because it does not satisfy the triangle inequality. It can be shown that there exists a norm that is equivalent to this "norm" up to a constant 2, but this is irrelevant for the present purposes.) Note that $\|f\|_{P, 2, \infty} \leq\|f\|_{P, 2}$, so that the bracketing numbers relative to $L_{2, \infty}(P)$ are smaller.

The proof of the theorem is based on a chaining argument. Unlike in the proof of the uniform entropy theorem, this will be applied to the original summands, without an initial symmetrization. Because the summands are not appropriately bounded, Hoeffding's inequality and the sub-Gaussian maximal inequality do not apply. Instead, Bernstein's inequality is used in the form

$$
\mathrm{P}\left(\left|\mathbb{G}_{n} f\right|>x\right) \leq 2 e^{-\frac{1}{2} \frac{x^{2}}{P f^{2}+1 / 3\|f\|_{\infty} x / \sqrt{n}}}
$$

This is valid for every square integrable, uniformly bounded function $f$. Lemma 2.2.10 implies that for a finite set $\mathcal{F}$ of cardinality $|\mathcal{F}| \geq 2$,

$$
\begin{equation*}
\mathrm{E}\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}} \lesssim \max _{f} \frac{\|f\|_{\infty}}{\sqrt{n}} \log |\mathcal{F}|+\max _{f}\|f\|_{P, 2} \sqrt{\log |\mathcal{F}|} \tag{2.5.5}
\end{equation*}
$$

The chaining argument in the proof of the following theorem is set up in such a way that the two terms on the right are of comparable magnitude. This is the case if $\|f\|_{\infty} \sim\|f\|_{P, 2} / \sqrt{\log |\mathcal{F}|}$; the inequality is applied after truncating the functions $f$ at this level.
2.5.6 Theorem. Let $\mathcal{F}$ be a class of measurable functions such that

$$
\int_{0}^{\infty} \sqrt{\log N_{[]}\left(\varepsilon, \mathcal{F}, L_{2, \infty}(P)\right)} d \varepsilon+\int_{0}^{\infty} \sqrt{\log N\left(\varepsilon, \mathcal{F}, L_{2}(P)\right)} d \varepsilon<\infty
$$

Moreover, assume that the envelope function $F$ of $\mathcal{F}$ possesses a weak second moment. Then $\mathcal{F}$ is $P$-Donsker.

Proof. For each natural number $q$, there exists a partition $\mathcal{F}=\cup_{i=1}^{N_{q}} \mathcal{F}_{q i}$ of $\mathcal{F}$ into $N_{q}$ disjoint subsets such that

$$
\begin{aligned}
\sum 2^{-q} \sqrt{\log N_{q}} & <\infty \\
\left\|\left(\sup _{f, g \in \mathcal{F}_{q i}}|f-g|\right)^{*}\right\|_{P, 2, \infty} & <2^{-q} \\
\sup _{f, g \in \mathcal{F}_{q i}}\|f-g\|_{P, 2} & <2^{-q}
\end{aligned}
$$

To see this, first cover $\mathcal{F}$ separately with minimal numbers of $L_{2}(P)$-balls and $L_{2, \infty}(P)$-brackets of size $2^{-q}$, disjointify, and take the intersection of
the two partitions. The total number of sets will be $N_{q}=N_{q}^{1} N_{q}^{2}$ if $N_{q}^{i}$ are the number of sets in the two separate partitions. The logarithm turns the product into a sum, and the first condition is satisfied if it is satisfied for both $N_{q}^{i}$.

The sequence of partitions can, without loss of generality, be chosen as successive refinements. Indeed, first construct a sequence of partitions $\mathcal{F}=\cup_{i=1}^{\bar{N}_{q}} \overline{\mathcal{F}}_{q i}$ possibly without this property. Next take the partition at stage $q$ to consist of all intersections of the form $\cap_{p=1}^{q} \overline{\mathcal{F}}_{p, i_{p}}$. This gives partitions into $N_{q}=\bar{N}_{1} \cdots \bar{N}_{q}$ sets. Using the inequality $\left(\log \prod \bar{N}_{p}\right)^{1 / 2} \leq \sum\left(\log \bar{N}_{p}\right)^{1 / 2}$ and rearranging sums, it is seen that the first of the three displayed conditions is still satisfied.

Choose for each $q$ a fixed element $f_{q i}$ from each partitioning set $\mathcal{F}_{q i}$, and set

$$
\begin{array}{lc}
\pi_{q} f=f_{q i} & \text { if } f \in \mathcal{F}_{q i} \\
\Delta_{q} f=\sup _{f, g \in \mathcal{F}_{q i}}|f-g|^{*}, & \text { if } f \in \mathcal{F}_{q i}
\end{array}
$$

Note that $\pi_{q} f$ and $\Delta_{q} f$ run through a set of $N_{q}$ functions if $f$ runs through $\mathcal{F}$. In view of Theorem 1.5.6, it suffices to show that the sequence $\| \mathbb{G}_{n}(f- \left.\pi_{q_{0}} f\right) \|_{\mathcal{F}}$ converges in probability to zero as $n \rightarrow \infty$ followed by $q_{0} \rightarrow \infty$.

Define for each fixed $n$ and (large) $q \geq q_{0}$ numbers and indicator functions;

$$
\begin{aligned}
a_{q} & =2^{-q} / \sqrt{\log N_{q+1}}, \\
A_{q-1} f & =1\left\{\Delta_{q_{0}} f \leq \sqrt{n} a_{q_{0}}, \ldots, \Delta_{q-1} f \leq \sqrt{n} a_{q-1}\right\}, \\
B_{q} f & =1\left\{\Delta_{q_{0}} f \leq \sqrt{n} a_{q_{0}}, \ldots, \Delta_{q-1} f \leq \sqrt{n} a_{q-1}, \Delta_{q} f>\sqrt{n} a_{q}\right\}, \\
B_{q_{0}} f & =1\left\{\Delta_{q_{0}} f>\sqrt{n} a_{q_{0}}\right\} .
\end{aligned}
$$

Note that $A_{q} f$ and $B_{q} f$ are constant in $f$ on each of the partitioning sets $\mathcal{F}_{q i}$ at level $q$, because the partitions are nested. Now decompose, pointwise in $x$ (which is suppressed in the notation),

$$
f-\pi_{q_{0}} f=\left(f-\pi_{q_{0}} f\right) B_{q_{0}} f+\sum_{q_{0}+1}^{\infty}\left(f-\pi_{q} f\right) B_{q} f+\sum_{q_{0}+1}^{\infty}\left(\pi_{q} f-\pi_{q-1} f\right) A_{q-1} f
$$

The idea here is to write the left side as the sum of $f-\pi_{q_{1}} f$ and $\sum_{q_{0}+1}^{q_{1}}\left(\pi_{q} f-\right. \left.\pi_{q-1} f\right)$ for the largest $q_{1}=q_{1}(f, x)$ such that each of the "links" $\pi_{q} f- \pi_{q-1} f$ in the "chain" is bounded in absolute value by $\sqrt{n} a_{q}$ (note that $\left|\pi_{q} f-\pi_{q-1} f\right| \leq \Delta_{q-1} f$ ). For a rigorous derivation, note that either all $B_{q} f$ are zero or there is a unique $q_{1}$ with $B_{q_{1}} f=1$. In the first case, the first two terms in the decomposition are zero and the third term is an infinite series (all $A_{q} f$ equal 1) whose $q$ th partial sum telescopes out to $\pi_{q} f-\pi_{q_{0}} f$ and converges to $f-\pi_{q_{0}} f$ by the definition of the $A_{q} f$. In the second case, $A_{q-1} f=1$ if and only if $q \leq q_{1}$ and the decomposition is as mentioned,
apart from the separate treatment of the case that $q_{1}=q_{0}$, when already the first link fails the test.

Next apply the empirical process $\mathbb{G}_{n}=\sqrt{n}\left(\mathbb{P}_{n}-P\right)$ to each of the three terms separately, and take suprema over $f \in \mathcal{F}$. It will be shown that the resulting three variables converge to zero in probability as $n \rightarrow \infty$ followed by $q_{0} \rightarrow \infty$.

First, since $\left|f-\pi_{q_{0}} f\right| B_{q_{0}} f \leq 2 F 1\left\{2 F>\sqrt{n} a_{q_{0}}\right\}$, one has

$$
\mathrm{E}^{*}\left\|\mathbb{G}_{n}\left(f-\pi_{q_{0}} f\right) B_{q_{0}} f\right\|_{\mathcal{F}} \leq 4 \sqrt{n} P^{*} F\left\{2 F>\sqrt{n} a_{q_{0}}\right\}
$$

The right side converges to zero as $n \rightarrow \infty$, for each fixed $q_{0}$, by the assumption that $F$ has a weak second moment (Problem 2.5.6).

Second, since the partitions are nested, $\Delta_{q} f B_{q} f \leq \Delta_{q-1} f B_{q} f$, whence by the inequality of Problem 2.5.5,

$$
\sqrt{n} a_{q} P \Delta_{q} f B_{q} f \leq 2\left\|\Delta_{q} f\right\|_{P, 2, \infty}^{2} \leq 22^{-q}
$$

Since $\Delta_{q-1} f B_{q} f$ is bounded by $\sqrt{n} a_{q-1}$ for $q>q_{0}$, we obtain

$$
P\left(\Delta_{q} f B_{q} f\right)^{2} \leq \sqrt{n} a_{q-1} P \Delta_{q} f\left\{\Delta_{q} f>\sqrt{n} a_{q}\right\} \leq 2 \frac{a_{q-1}}{a_{q}} 2^{-2 q}
$$

Apply the triangle inequality and inequality (2.5.5) to find

$$
\begin{aligned}
\mathrm{E}^{*} \| \sum_{q_{0}+1}^{\infty} & \mathbb{G}_{n}\left(f-\pi_{q} f\right) B_{q} f \|_{\mathcal{F}} \\
& \leq \sum_{q_{0}+1}^{\infty} \mathrm{E}^{*}\left\|\mathbb{G}_{n} \Delta_{q} f B_{q} f\right\|_{\mathcal{F}}+\sum_{q_{0}+1}^{\infty} 2 \sqrt{n}\left\|P \Delta_{q} f B_{q} f\right\|_{\mathcal{F}} \\
& \lesssim \sum_{q_{0}+1}^{\infty}\left[a_{q-1} \log N_{q}+\sqrt{\frac{a_{q-1}}{a_{q}}} 2^{-q} \sqrt{\log N_{q}}+\frac{4}{a_{q}} 2^{-2 q}\right]
\end{aligned}
$$

Since $a_{q}$ is decreasing, the quotient $a_{q-1} / a_{q}$ can be replaced by its square. Then in view of the definition of $a_{q}$, the series on the right can be bounded by a multiple of $\sum_{q_{0}+1}^{\infty} 2^{-q} \sqrt{\log N_{q}}$. This upper bound is independent of $n$ and converges to zero as $q_{0} \rightarrow \infty$.

Third, there are at most $N_{q}$ functions $\pi_{q} f-\pi_{q-1} f$ and at most $N_{q-1}$ functions $A_{q-1} f$. Since the partitions are nested, the function $\mid \pi_{q} f- \pi_{q-1} f \mid A_{q-1} f$ is bounded by $\Delta_{q-1} f A_{q-1} f \leq \sqrt{n} a_{q-1}$. The $L_{2}(P)$-norm of $\left|\pi_{q} f-\pi_{q-1} f\right|$ is bounded by $2^{-q+1}$. Apply inequality (2.5.5) to find

$$
\mathrm{E}^{*}\left\|\sum_{q_{0}+1}^{\infty} \mathbb{G}_{n}\left(\pi_{q} f-\pi_{q-1} f\right) A_{q-1} f\right\|_{\mathcal{F}} \lesssim \sum_{q_{0}+1}^{\infty}\left[a_{q-1} \log N_{q}+2^{-q} \sqrt{\log N_{q}}\right]
$$

Again this upper bound is independent of $n$ and converges to zero as $q_{0} \rightarrow \infty$.
2.5.7 Example (Cells in $\mathbb{R}$ ). The classical empirical central limit theorem was shown to be a special case of the uniform entropy central limit theorem in the preceding subsection. This classical theorem is a special case of the bracketing central limit theorem as well. This follows since $N_{[]}\left(\sqrt{2} \varepsilon, \mathcal{F}, L_{2}(P)\right) \leq N_{[]}\left(\varepsilon^{2}, \mathcal{F}, L_{1}(P)\right)$ for every class of functions $f: \mathcal{X} \mapsto[0,1]$. The $L_{1}$-bracketing numbers were bounded above by a power of $1 / \varepsilon$ in the preceding subsection.

## Problems and Complements

1. (Taking the supremum over all $Q$ ) The supremum in (2.5.1) can be replaced by the supremum over all probability measures $Q$, such that $0<Q F^{2}<\infty$, without changing the condition. In fact, for any probability measure $P$ and $r>0$ such that $0<P F^{r}<\infty$,

$$
D\left(2 \varepsilon\|F\|_{P, r}, \mathcal{F}, L_{r}(P)\right) \leq \sup _{Q} D\left(\varepsilon\|F\|_{Q, r}, \mathcal{F}, L_{r}(Q)\right)
$$

if the supremum on the right is taken over all discrete probability measures $Q$.
[Hint: If the left side is equal to $m$, then there exist functions $f_{1}, \ldots, f_{m}$ such that $P\left|f_{i}-f_{j}\right|^{r}>2^{r} \varepsilon^{r} P F^{r}$ for $i \neq j$. By the strong law of large numbers, $\mathbb{P}_{n}\left|f_{i}-f_{j}\right|^{r} \rightarrow P\left|f_{i}-f_{j}\right|^{r}$ almost surely. Also $\mathbb{P}_{n} F^{r} \rightarrow P F^{r}$ almost surely. Thus there exist $n$ and $\omega$ such that $\mathbb{P}_{n}(\omega)\left|f_{i}-f_{j}\right|^{r}>2^{r} \varepsilon^{r} P F^{r}$ and $\mathbb{P}_{n}(\omega) F^{r}<2^{r} P F^{r}$.]
2. Can the constant 2 in the preceding problem be replaced by 1 ? Is a similar inequality valid for covering numbers, and what is the best constant?
3. The presence of the factor $\|F\|_{Q, 2}$ in the uniform entropy condition (2.5.1) is helpful if it is larger than 1 but is detrimental otherwise. However, given any class $\mathcal{F}$ with a square integrable envelope, there is always a square integrable envelope $F$ with $\|F\|_{Q, 2} \geq 1$ for all $Q$.
4. If $\mathcal{F}$ is compact, then the function $\varepsilon \mapsto N\left(\varepsilon, \mathcal{F}, L_{2}(P)\right)$ is left continuous.
[Hint: The function $f \mapsto \inf _{i}\left\|f-f_{i}\right\|$ attains its maximum for every finite set $f_{1}, \ldots, f_{p}$.]
5. For each positive random variable $X$, one has the inequalities $\|X\|_{2, \infty}^{2} \leq \sup _{t>0} t \mathrm{E} X\{X>t\} \leq 2\|X\|_{2, \infty}^{2}$.
[Hint: The first inequality follows from Markov's inequality. For the second, write the expectation in the expression in the middle as $\int_{0}^{\infty} P(X 1\{X>t\}> x) d x$. Next, split the integral in the part from zero to $t$ and its complement. On the first part, the integrand is constant; on the second, it can be bounded by $x^{-2}$ times the $L_{2, \infty}$-norm.]
6. Each random variable with $\mathrm{P}(|X|>t)=o\left(t^{-2}\right)$ as $t \rightarrow \infty$ (a "weak second moment") satisfies $\mathrm{E}|X|\{|X|>t\}=o\left(t^{-1}\right)$ as $t \rightarrow \infty$.
7. For any random variable $X$, one has $\|X\|_{1} \leq 3\|X\|_{2, \infty}$.

## 2.6

## Uniform Entropy Numbers

In Section 2.5.1 the empirical process was shown to converge weakly for indexing sets $\mathcal{F}$ satisfying a uniform entropy condition. In particular, if

$$
\sup _{Q} \log N\left(\varepsilon\|F\|_{Q, 2}, \mathcal{F}, L_{2}(Q)\right) \leq K\left(\frac{1}{\varepsilon}\right)^{2-\delta}
$$

for some $\delta>0$, then the entropy integral (2.5.1) converges and $\mathcal{F}$ is a Donsker class for any probability measure $P$ such that $P^{*} F^{2}<\infty$, provided measurability conditions are met. Many classes of functions satisfy this condition and often even the much stronger condition

$$
\sup _{Q} N\left(\varepsilon\|F\|_{Q, 2}, \mathcal{F}, L_{2}(Q)\right) \leq K\left(\frac{1}{\varepsilon}\right)^{V}, \quad 0<\varepsilon<1
$$

for some number $V$. In this chapter this is shown for classes satisfying certain combinatorial conditions. For classes of sets, these were first studied by Vapnik and Crervonenkis, whence the name VC-classes. In the second part of this chapter, VC-classes of functions are defined in terms of VCclasses of sets. The remainder of this chapter considers operations on classes that preserve entropy properties, such as taking convex hulls.

### 2.6.1 VC-Classes of Sets

Let $\mathcal{C}$ be a collection of subsets of a set $\mathcal{X}$. An arbitrary set of $n$ points $\left\{x_{1}, \ldots, x_{n}\right\}$ possesses $2^{n}$ subsets. Say that $\mathcal{C}$ picks out a certain subset from $\left\{x_{1}, \ldots, x_{n}\right\}$ if this can be formed as a set of the form $C \cap\left\{x_{1}, \ldots, x_{n}\right\}$ for
a $C$ in $\mathcal{C}$. The collection $\mathcal{C}$ is said to shatter $\left\{x_{1}, \ldots, x_{n}\right\}$ if each of its $2^{n}$ subsets can be picked out in this manner. The $V C$-index $V(\mathcal{C})$ of the class $\mathcal{C}$ is the smallest $n$ for which no set of size $n$ is shattered by $\mathcal{C}$. Clearly, the more refined $\mathcal{C}$ is, the larger is its index. The index is more formally defined through

$$
\begin{aligned}
\Delta_{n}\left(\mathcal{C}, x_{1}, \ldots, x_{n}\right) & =\#\left\{C \cap\left\{x_{1}, \ldots, x_{n}\right\}: C \in \mathcal{C}\right\}, \\
V(\mathcal{C}) & =\inf \left\{n: \max _{x_{1}, \ldots, x_{n}} \Delta_{n}\left(\mathcal{C}, x_{1}, \ldots, x_{n}\right)<2^{n}\right\} .
\end{aligned}
$$

Here the infimum over the empty set is taken to be infinity, so that the index is $\infty$ if and only if $\mathcal{C}$ shatters sets of arbitrarily large size. ${ }^{\text {b }}$

A collection of measurable sets $\mathcal{C}$ is called a VC-class if its index is finite. The main result of this section is the remarkable fact that the covering numbers of any VC-class grow polynomially in $1 / \varepsilon$ as $\varepsilon \rightarrow 0$ of order dependent on the index of the class. Since the envelope of a class of sets is certainly square integrable, it follows that a VC-class of sets is Donsker for any underlying probability measure, provided measurability conditions are met.
2.6.1 Example (Cells in $\mathbb{R}^{d}$ ). The collection of all cells of the form $(-\infty, c]$ in $\mathbb{R}$ shatters no two-point set $\left\{x_{1}, x_{2}\right\}$, because it fails to pick out the largest of the two points. Hence its VC-index equals 2 . The collection of all cells $(a, b]$ in $\mathbb{R}$ shatters every two-point set but cannot pick out the subset consisting of the smallest and largest points of any set of three points. Thus its VC-index equals 3 . With more effort, it can be seen that the indices of the same type of sets in $\mathbb{R}^{d}$ are $d+1$ and $2 d+1$, respectively.

Techniques to show that many other collections of sets are VC are discussed in Section 2.6.5.

The following combinatorial result is needed: the number of subsets shattered by a class $\mathcal{C}$ is at least the number of subsets picked out by $\mathcal{C}$. In particular, if the class $\mathcal{C}$ shatters no set of $V$ points, then the number of subsets picked out by $\mathcal{C}$ is at most $\sum_{j=0}^{V-1}\binom{n}{j}$, the number of subsets of size $\leq V-1$.
2.6.2 Lemma. Let $\left\{x_{1}, \ldots, x_{n}\right\}$ be arbitrary points. Then the total number of subsets $\Delta_{n}\left(\mathcal{C}, x_{1}, \ldots, x_{n}\right)$ picked out by $\mathcal{C}$ is bounded above by the number of subsets of $\left\{x_{1}, \ldots, x_{n}\right\}$ shattered by $\mathcal{C}$.

Proof. Assume without loss of generality that every $C$ is a subset of the given set of points, so that $\Delta_{n}\left(\mathcal{C}, x_{1}, \ldots, x_{n}\right)$ is the cardinality of $\mathcal{C}$.

[^7]Call $\mathcal{C}$ hereditary if it has the property that $B \in \mathcal{C}$ whenever $B \subset C$, for a set $C \in \mathcal{C}$. Each of the sets in a hereditary collection of sets is shattered, whence a hereditary collection shatters at least $|\mathcal{C}|$ sets and the assertion of the lemma is certainly true for hereditary collections. It will be shown that a general $\mathcal{C}$ can be transformed into a hereditary collection, without changing its cardinality and without increasing the number of shattered sets.

Given $1 \leq i \leq n$ and $C \in \mathcal{C}$, define the set $T_{i}(C)$ to be $C-\left\{x_{i}\right\}$ if $C-\left\{x_{i}\right\}$ is not contained in $\mathcal{C}$ and to be $C$ otherwise. Thus $x_{i}$ is deleted from $C$ if this creates a "new" set; otherwise it is retained. If $x_{i} \notin C$, then $C$ is left unchanged.

Since the map $T_{i}$ is one-to-one, the collections $\mathcal{C}$ and $T_{i}(\mathcal{C})$ have the same cardinality. Furthermore, every subset $A \subset\left\{x_{1}, \ldots, x_{n}\right\}$ that is shattered by $T_{i}(\mathcal{C})$ is shattered by $\mathcal{C}$. If $x_{i} \notin A$, this is clear from the fact that the collection of sets $C \cap A$ does not change if each $C$ is replaced by its transformation $T_{i}(C)$. Second, if $x_{i} \in A$ and $A$ is shattered by $T_{i}(\mathcal{C})$, then for every $B \subset A$, there is $C \in \mathcal{C}$ with $B \cup\left\{x_{i}\right\}=T_{i}(C) \cap A$. This implies $x_{i} \in T_{i}(C)$, whence $T_{i}(C)=C$, whence $C-\left\{x_{i}\right\} \in \mathcal{C}$. Thus both $B \cup\left\{x_{i}\right\}$ and $B-\left\{x_{i}\right\}=\left(C-\left\{x_{i}\right\}\right) \cap A$ are picked out by $\mathcal{C}$. One of them equals $B$.

It has been shown that the assertion of the lemma is true for $\mathcal{C}$ if it is true for $T_{i}(\mathcal{C})$. The same is true for the operator $T_{1} \circ T_{2} \circ \cdots \circ T_{n}$ playing the role of $T_{i}$. Apply this operator repeatedly, until the collection of sets does not change any more. This happens after at most $\sum_{C}|C|$ steps, because $\sum_{C}\left|T_{i}(C)\right|<\sum_{C}|C|$ whenever the collections $T_{i}(\mathcal{C})$ and $\mathcal{C}$ are different. The collection $\mathcal{D}$ obtained in this manner has the property that $D-\left\{x_{i}\right\}$ is contained in $\mathcal{D}$ for every $D \in \mathcal{D}$ and every $x_{i}$. Consequently, $\mathcal{D}$ is hereditary.
2.6.3 Corollary. For a $V C$-class of sets of index $V(\mathcal{C})$, one has

$$
\max _{x_{1}, \ldots, x_{n}} \Delta_{n}\left(\mathcal{C}, x_{1}, \ldots, x_{n}\right) \leq \sum_{j=0}^{V(\mathcal{C})-1}\binom{n}{j} .
$$

Consequently, the numbers on the left side grow polynomially of order at most $O\left(n^{V(\mathcal{C})-1}\right)$ as $n \rightarrow \infty$.

Proof. A VC-class shatters no set of $V(\mathcal{C})$ points. All shattered sets are among the sets of size at most $V(\mathcal{C})-1$. The number of shattered sets gives an upper bound on $\Delta_{n}$ by the preceding lemma.
2.6.4 Theorem. There exists a universal constant $K$ such that for any VC-class $\mathcal{C}$ of sets, any probability measure $Q$, any $r \geq 1$, and $0<\varepsilon<1$,

$$
N\left(\varepsilon, \mathcal{C}, L_{r}(Q)\right) \leq K V(\mathcal{C})(4 e)^{V(\mathcal{C})}\left(\frac{1}{\varepsilon}\right)^{r(V(\mathcal{C})-1)}
$$

Proof. In view of the equality $\left\|1_{C}-1_{D}\right\|_{Q, r}=Q^{1 / r}(C \Delta D)$ for any pair of sets $C$ and $D$, the upper bound for a general $r$ is an easy consequence of the bound for $r=1$. The proof for $r=1$ is long. Problem 2.6.4 gives a short proof of a slightly weaker result.

By Problem 2.6.3, it suffices to consider the case that $Q$ is an empirical type measure: a measure on a finite set of points $y_{1}, \ldots, y_{k}$ such that $Q\left\{y_{i}\right\}=l_{i} / n$ for integers $l_{1}, \ldots, l_{k}$ that add up to $n$. Then it is no loss of generality to assume that each set in the collection $\mathcal{C}$ is a subset of these points.

Let $x_{1}, \ldots, x_{n}$ be the set of points $y_{1}, \ldots, y_{k}$ with each $y_{i}$ occurring $l_{i}$ times. For each subset $C$ of $y_{1}, \ldots, y_{k}$, form a subset $\tilde{C}$ of $x_{1}, \ldots, x_{n}$ by taking all $x_{i}$ that are copies of some $y_{i}$ in $C$. More precisely, let $\phi:\{1, \ldots, n\} \mapsto \left\{y_{1}, \ldots, y_{k}\right\}$ be an arbitrary, fixed map such that $\#\left(j: \phi(j)=y_{i}\right)=l_{i}$ for every $i$. Let $\tilde{C}=\{j: \phi(j) \in C\}$. Now identify $x_{1}, \ldots, x_{n}$ with $1, \ldots, n$.

If a set $\left\{x_{j}: j \in J\right\}$ is shattered by the collection $\tilde{\mathcal{C}}$ of sets $\tilde{C}$, then every $x_{j}$ in this set must correspond to a different $y_{i}$ (i.e., the map $\phi$ must be one-to-one on $\left\{x_{j}: j \in J\right\}$ ), and the subset $\left\{\phi\left(x_{j}\right): j \in J\right\}$ of $\left\{y_{1}, \ldots, y_{k}\right\}$ must be shattered by $\mathcal{C}$. This shows that the collection $\tilde{\mathcal{C}}$ is VC of the same index as $\mathcal{C}$. By construction, $Q(C \Delta D)=\tilde{Q}(\tilde{C} \Delta \tilde{D})$ for $\tilde{Q}$ equal to the discrete uniform measure on $x_{1}, \ldots, x_{n}$. Thus the $L_{1}(Q)$-distance on $\mathcal{C}$ corresponds to the $L_{1}(\tilde{Q})$-distance on $\tilde{\mathcal{C}}$. Conclude that $N\left(\varepsilon, \tilde{\mathcal{C}}, L_{1}(\tilde{Q})\right)= N\left(\varepsilon, \mathcal{C}, L_{1}(Q)\right)$, and it suffices to prove the upper bound for $\tilde{\mathcal{C}}$ and $\tilde{Q}$. For simplicity of notation, assume that $Q$ is the discrete uniform measure on a set of points $x_{1}, \ldots, x_{n}$.

Each set $C$ can be represented by an $n$-vector of ones and zeros indicating whether or not the points $x_{i}$ are contained in the set. Thus the collection $\mathcal{C}$ is identified with a subset $\mathcal{Z}$ of the vertices of the $n$-dimensional hypercube $[0,1]^{n}$. Alternatively, $\mathcal{C}$ can be identified with an ( $n \times \# \mathcal{C}$ )-matrix of zeros and ones, the columns representing the individual sets $C$. For a subset $I$ of rows, let $\mathcal{Z}_{I}$ be the matrix obtained by first deleting the other rows and next dropping duplicate columns. Alternatively, $\mathcal{Z}_{I}$ is the projection of the point set $\mathcal{Z}$ onto $[0,1]^{I}$. In these terms $\mathcal{Z}_{I}$ corresponds to the collection of subsets $C \cap\left\{x_{i}: i \in I\right\}$ of the set of points $\left\{x_{i}: i \in I\right\}$, and this set is shattered if the matrix $\mathcal{Z}_{I}$ consists of all $2^{I}$ possible columns or if, as a subset of the $I$-dimensional hypercube, $\mathcal{Z}_{I}$ contains all vertices. By assumption, this is possible only for $I<V(\mathcal{C})$. Abbreviate $S=V(\mathcal{C})-1$.

The normalized Hamming metric on the point set $\mathcal{Z}$ is defined by

$$
d(w, z)=\frac{1}{n} \sum_{j=1}^{n}\left|w_{j}-z_{j}\right|, \quad z, w \in \mathcal{Z}
$$

This corresponds exactly to the $L_{1}(Q)$-metric on the collection $\mathcal{C}$ : if the sets $C$ and $D$ correspond to the vertices $w$ and $z$, then $Q(C \triangle D)=d(w, z)$ for the discrete uniform measure $Q$.

Fix a maximal $\varepsilon$-separated collection of sets $C \in \mathcal{C}$. For simplicity of notation assume that $\mathcal{C}$ (or equivalently, $\mathcal{Z}$ ) itself is $\varepsilon$-separated. We shall bound its cardinality, which constitutes a bound on the packing number $D\left(\varepsilon, \mathcal{C}, L_{1}(Q)\right)$.

Let $Z$ be a random variable with a discrete uniform distribution on the point set $\mathcal{Z}$ in $[0,1]^{n}$. The coordinates of $Z=\left(Z_{1}, \ldots, Z_{n}\right)$ are (correlated) Bernoulli variables taking values in $\{0,1\}$. Fix an integer $S \leq m<n$. Given a subset $I$ of $\{1,2, \ldots, n\}$ of size $m+1$, apply Lemma 2.6.6 (below) to the projection $Z_{I}$ of $Z$ onto $\mathcal{Z}_{I}$ to conclude that

$$
\sum_{i \in I} \mathrm{E} \operatorname{var}\left(Z_{i} \mid Z_{I-\{i\}}\right) \leq S .
$$

Take the sum over all $\binom{n}{m+1}$ of such subsets $I$ on both left and right. The double sum on the left can be rearranged. Instead of leaving out one element at a time from every possible subset of size $m+1$, we may add missing elements to every possible set of size $m$. Conclude that

$$
\begin{equation*}
\sum_{J} \mathrm{E} \sum_{i \notin J} \operatorname{var}\left(Z_{i} \mid Z_{J}\right) \leq\binom{ n}{m+1} S, \tag{2.6.5}
\end{equation*}
$$

where the first sum is over all subsets $J$ of size $m$.
Conditionally on $Z_{J}=s$, the vector $Z$ is uniformly distributed over the set of columns $z$ in $\mathcal{Z}$ for which $z_{J}=s$. Suppose there are $N_{s}$ of such columns. Let $W$ and $\tilde{W}$ be independent random vectors defined on a common probability space distributed uniformly over these columns. By the $\varepsilon$-separation of $\mathcal{Z}$, the vectors $W$ and $\tilde{W}$ are at Hamming distance $d(W, \tilde{W})$ at least $\varepsilon$ whenever they are unequal. The latter happens with probability $1-1 / N_{s}$. Since $\operatorname{var} W_{i}=\mathrm{E}\left(W_{i}-\tilde{W}_{i}\right)^{2} / 2$,

$$
\sum_{i \notin J} \operatorname{var}\left(Z_{i} \mid Z_{J}=s\right)=\frac{1}{2} \sum \mathrm{E}\left(W_{i}-\tilde{W}_{i}\right)^{2}=\frac{1}{2} \mathrm{E} n d(W, \tilde{W}) \geq \frac{1}{2} n \varepsilon\left(1-\frac{1}{N_{s}}\right)
$$

If we integrate the left side with respect to $s$ for the distribution of $Z_{J}$ and next sum over $J$, then we obtain the left side of (2.6.5). Since $\mathrm{P}\left(Z_{J}=s\right)= N_{s} / \# \mathcal{Z}$, the resulting expression is bounded below by

$$
\sum_{J} \sum_{s \in \mathcal{Z}_{J}} \frac{N_{s}}{\# \mathcal{Z}} \frac{1}{2} \varepsilon n\left(1-\frac{1}{N_{s}}\right)=\binom{n}{m} \frac{1}{2} \varepsilon n\left(1-\frac{\overline{\# \mathcal{Z}_{J}}}{\# \mathcal{Z}}\right)
$$

This is bounded above by the right side of (2.6.5). Rearrange and simplify the resulting inequality to obtain

$$
\# \mathcal{Z} \leq \frac{\overline{\# \mathcal{Z}_{J}} n \varepsilon(m+1)}{n \varepsilon m+n-2 n S+2 m S} \lesssim \frac{\overline{\# \mathcal{Z}_{J}} \varepsilon m}{\varepsilon m-2 S} .
$$

The number of points in $\mathcal{Z}_{J}$ is equal to the number of subsets picked out by $\mathcal{C}$ from the points $\left\{x_{i}: i \in J\right\}$. By Sauer's lemma, this is bounded by $\sum_{j=0}^{S}\binom{m}{j}$, which is smaller than $(e m / S)^{S}$ for $m \geq S$. Thus we obtain

$$
\# \mathcal{Z} \leq\left(\frac{e}{S}\right)^{S} \frac{m^{S+1} \varepsilon}{m \varepsilon-2 S}
$$

for every integer $S \leq m<n$. The optimal unrestricted choice of $m \in(0, \infty)$ is $m=2(S+1) / \varepsilon$, for which the upper bound takes the form

$$
\left(\frac{e}{S}\right)^{S} \frac{1}{2}\left(\frac{2(S+1)}{\varepsilon}\right)^{S+1} \leq(S+1) e\left(\frac{2 e}{\varepsilon}\right)^{S} .
$$

Since the upper bound evaluated at $m=2(S+1) / \varepsilon+1$ differs from this only up to a universally bounded constant, the discretization of $m$ causes no problem. Furthermore, for the optimal choice of $m$, the inequality $m>S$ is implied by $\varepsilon<2$, while for $m=2(S+1) / \varepsilon \geq n$, we can use the trivial bound $\# \mathcal{Z} \leq n \leq m$, which is certainly bounded by the right side of the preceding display for $S \geq 1$. For $S=0$, the collection $\mathcal{C}$ consists of at most one set, and the theorem is trivial.
2.6.6 Lemma. Let $Z$ be an arbitrary random vector taking values in a set $\mathcal{Z} \subset\{0,1\}^{n}$ that corresponds to a VC-class $\mathcal{C}$ of subsets of a set of points $\left\{x_{1}, \ldots, x_{n}\right\}$. Then

$$
\sum_{i=1}^{n} \mathrm{E} \operatorname{var}\left(Z_{i} \mid Z_{j}, j \neq i\right) \leq V(\mathcal{C})-1
$$

Proof. If the values of all coordinates, except the $i$ th coordinate, of $Z$ are given, then the vector $Z$ can have at most two values. Call these $v$ and $w$, where $v_{i}=0$ and $w_{i}=1$ and the other coordinates of $v$ and $w$ agree. Write $p(z)$ for $\mathrm{P}(Z=z)$. Then $Z_{i}$ is 1 or 0 with conditional probabilities $p:=p(w) /(p(v)+p(w))$ and $1-p$, respectively. The conditional variance of $Z_{i}$ is $p(1-p)$.

Form a graph by connecting any two points that are at minimal Hamming distance. This is a subgraph of the set of edges of the $n$-dimensional unit cube. Denote the edge between $v$ and $w$ by $\{v, w\}$, and let $\mathcal{E}_{i}$ and $\mathcal{E}$ be the set of all edges that cross the $i$ th dimension and all edges in the graph, respectively. Then

$$
\begin{aligned}
\sum_{i=1}^{n} \mathrm{E} \operatorname{var}\left(Z_{i} \mid Z_{j}, j \neq i\right) & =\sum_{i=1}^{n} \sum_{\{v, w\} \in \mathcal{E}_{i}}(p(v)+p(w)) \frac{p(v)}{p(v)+p(w)} \frac{p(w)}{p(v)+p(w)} \\
& \leq \sum_{\{v, w\} \in \mathcal{E}} p(v) \wedge p(w)
\end{aligned}
$$

Suppose that the edges $\mathcal{E}$ can be directed in such a way that at each node (point in $\mathcal{Z}$ ) the number of arrows that are directed away is at most $V(\mathcal{C})-1$.

Then the last sum can be rearranged as a double sum, the outer sum carried out over the nodes, and the inner sum over the arrows directed away from the particular node. Thus the sum is bounded by $\sum_{z \in \mathcal{Z}} p(z) \# \operatorname{arrows}(z)$, which is bounded by $V(\mathcal{C})-1$.

It may be shown that the edges can always be directed in the given manner (Problem 2.6.5), but it is more direct to proceed in a different manner. Recall from the proof of Lemma 2.6.2 that a class $\mathcal{C}$ is hereditary if it contains every subset of every set contained in $\mathcal{C}$. Since each set in a hereditary collection is shattered, each set in a hereditary VC-class has at most $V(\mathcal{C})-1$ points. Therefore, if $\mathcal{C}$ is hereditary, the edges of the graph can be directed as desired by decreasing the number of elements: direct the edge between $v$ and $w$ in the direction of $w \rightarrow v$ if the (one) coordinate of $w$ by which $w$ differs from $v$ equals 1 . This concludes the proof in the case that $\mathcal{C}$ is hereditary. It was shown in the proof of Lemma 2.6.2 that an arbitrary collection $\mathcal{C}$ can be transformed into a hereditary collection by repeated application of certain operators $T_{i}$. It was also shown that the operators are one-to-one and do not increase the VC-dimension. The operators induce a map on the edges of the graph corresponding to $\mathcal{C}$ as follows. A given edge $\{v, w\}$ in the graph ( $\mathcal{Z}, \mathcal{E}$ ) is mapped into an edge $\left\{T_{i}(v), T_{i}(w)\right\}$ if this is an edge in the graph $\left(T_{i}(\mathcal{Z}), \mathcal{E}\left(T_{i}(\mathcal{Z})\right)\right)$; otherwise it is necessarily the case that $T_{i}$ changes one of $v$ and $w$, say $w$, and not the other, in which case the edge $\{v, w\}$ is mapped into $\left\{v^{0}, T_{i}(w)\right\}$, where $v_{i}^{0}=0$ and $v^{0}$ agrees with $v=v^{1}$ in the remaining coordinates. Geometrically, this means that edges that cross the $i$ th dimension and edges at height zero in the $i$ th dimension are left unchanged, whereas an edge at height one in the $i$ th dimension is pushed down if the edge at height zero below it was not in the graph already. This shows that the map is one-to-one (though not necessarily onto). Finally, define a probability measure on $T_{i}(\mathcal{Z})$ by shifting mass downward in the following manner: define $p_{i}\left(z^{0}\right)=p\left(z^{0}\right) \vee p\left(z^{1}\right)$ and $p_{i}\left(z^{1}\right)=p\left(z^{0}\right) \wedge p\left(z^{1}\right)$ for every $z$. It may be checked that

$$
\sum_{\{v, w\} \in \mathcal{E}(\mathcal{Z})} p(v) \wedge p(w) \leq \sum_{\{v, w\} \in \mathcal{E}\left(T_{i}(\mathcal{Z})\right)} p_{i}(v) \wedge p_{i}(w) .
$$

Note here that $\left(a_{0} \wedge b_{0}\right)+\left(a_{1} \wedge b_{1}\right)$ is bounded above by $\left(a_{0} \vee a_{1}\right) \wedge\left(b_{0} \vee b_{1}\right)+ \left(a_{0} \wedge a_{1}\right) \wedge\left(b_{0} \wedge b_{1}\right)$ for any numbers $a_{i}, b_{i}$. Thus by repeated application of the downward shift operation, the original graph and probability measure are changed into a hereditary graph and another probability measure, meanwhile increasing the target function. The theorem follows.

### 2.6.2 VC-Classes of Functions

The subgraph of a function $f: \mathcal{X} \mapsto \mathbb{R}$ is the subset of $\mathcal{X} \times \mathbb{R}$ given by ${ }^{\sharp}$

$$
\{(x, t): t<f(x)\} .
$$

A collection $\mathcal{F}$ of measurable functions on a sample space is called a VCsubgraph class, or just a VC-class, if the collection of all subgraphs of the functions in $\mathcal{F}$ forms a VC-class of sets (in $\mathcal{X} \times \mathbb{R}$ ). Just as for sets, the covering numbers of VC-classes of functions grow at a polynomial rate.

Let $V(\mathcal{F})$ be the VC-index of the set of subgraphs of functions in $\mathcal{F}$.
2.6.7 Theorem. For a VC-class of functions with measurable envelope function $F$ and $r \geq 1$, one has for any probability measure $Q$ with $\|F\|_{Q, r}>$ 0,

$$
N\left(\varepsilon\|F\|_{Q, r}, \mathcal{F}, L_{r}(Q)\right) \leq K V(\mathcal{F})(16 e)^{V(\mathcal{F})}\left(\frac{1}{\varepsilon}\right)^{r(V(\mathcal{F})-1)}
$$

for a universal constant $K$ and $0<\varepsilon<1$.
Proof. Let $\mathcal{C}$ be the set of all subgraphs $C_{f}$ of functions $f$ in $\mathcal{F}$. By Fubini's theorem, $Q|f-g|=Q \times \lambda\left(C_{f} \triangle C_{g}\right)$ if $\lambda$ is Lebesgue measure on the real line. Renormalize $Q \times \lambda$ to a probability measure on the set $\{(x, t):|t| \leq F(x)\}$ by defining $P=(Q \times \lambda) /(2 Q F)$. Then, by the result for sets in the previous section,

$$
N\left(\varepsilon 2 Q F, \mathcal{F}, L_{1}(Q)\right)=N\left(\varepsilon, \mathcal{C}, L_{1}(P)\right) \leq K V(\mathcal{F})\left(\frac{4 e}{\varepsilon}\right)^{V(\mathcal{F})-1}
$$

for a universal constant $K$.
This concludes the proof for $r=1$. For $r>1$, note that

$$
Q|f-g|^{r} \leq Q|f-g|(2 F)^{r-1}=2^{r-1} R|f-g| Q F^{r-1},
$$

for the probability measure $R$ with density $F^{r-1} / Q F^{r-1}$ with respect to $Q$. Thus the $L_{r}(Q)$-distance is bounded by the distance $2\left(Q F^{r-1}\right)^{1 / r} \| f- g \|_{R, 1}^{1 / r}$. Elementary manipulations yield

$$
N\left(\varepsilon 2\|F\|_{Q, r}, \mathcal{F}, L_{r}(Q)\right) \leq N\left(\varepsilon^{r} R F, \mathcal{F}, L_{1}(R)\right) .
$$

This can be bounded by a constant times $1 / \varepsilon$ raised to the power $r(V(\mathcal{F})-$ 1) by the result of the previous paragraph.

The preceding theorem shows that a VC-class satisfies the uniform entropy condition (2.5.1), with much to spare. Thus Theorem 2.5.2 shows that a suitably measurable VC-class is $P$-Donsker for any underlying measure $P$ for which the envelope is square integrable. The latter condition on the envelope can be relaxed a little to the minimal condition that the envelope has a weak second moment.

[^8]2.6.8 Theorem. Let $\mathcal{F}$ be a pointwise separable, $P$-pre-Gaussian VC-class of functions with envelope function $F$ such that $P^{*}(F>x)=o\left(x^{-2}\right)$ as $x \rightarrow \infty$. Then $\mathcal{F}$ is $P$-Donsker.

Proof. Under the stronger condition that the envelope has a finite second moment, this follows from Theorem 2.5.2. (Then the assumption that $\mathcal{F}$ is pre-Gaussian is automatically satisfied.) For the refinement, see Alexander (1987c).

### 2.6.3 Convex Hulls and VC-Hull Classes

The symmetric convex hull sconv $\mathcal{F}$ of a class of functions is defined as the set of functions $\sum_{i=1}^{m} \alpha_{i} f_{i}$, with $\sum_{i=1}^{m}\left|\alpha_{i}\right| \leq 1$ and each $f_{i}$ contained in $\mathcal{F}$.

A set of measurable functions is called a VC-hull class if it is in the pointwise sequential closure of the symmetric convex hull of a VC-class of functions. More formally, a collection of functions $\mathcal{F}$ is VC-hull if there exists a VC-class $\mathcal{G}$ of functions such that every $f \in \mathcal{F}$ is the pointwise limit of a sequence of functions $f_{m}$ contained in sconv $\mathcal{G}$. If the class $\mathcal{G}$ can be taken equal to a class of indicator functions, then the class $\mathcal{F}$ is called a VC-hull class for sets.

In Chapter 2.10 it is shown that the sequentially closed symmetric convex hull of a Donsker class is Donsker. Since a suitably measurable VC-class of functions is Donsker, provided its envelope has a weak second moment, many VC-hull classes can be seen to be Donsker by this general result. In most cases the same conclusion can also be obtained from the stronger result that any VC-hull class satisfies the uniform entropy condition. This is shown in the following, which gives an upper bound on the entropy.

Even though VC-hull classes are small enough to have a finite uniform entropy integral, they can be considerably larger than VC-classes. Their entropy numbers (logarithms of the covering numbers), rather than their covering numbers, behave polynomially in $1 / \varepsilon$. More precisely, the entropy numbers of the convex hull of any polynomial class are of lower order than $(1 / \varepsilon)^{r}$ for some $r<2$. The bound $r<2$ is just enough to ensure that the class satisfies the uniform entropy condition (2.5.1).
2.6.9 Theorem. Let $Q$ be a probability measure on $(\mathcal{X}, \mathcal{A})$, and let $\mathcal{F}$ be a class of measurable functions with measurable square integrable envelope $F$ such that $Q F^{2}<\infty$ and

$$
N\left(\varepsilon\|F\|_{Q, 2}, \mathcal{F}, L_{2}(Q)\right) \leq C\left(\frac{1}{\varepsilon}\right)^{V}, \quad 0<\varepsilon<1 .
$$

Then there exists a constant $K$ that depends on $C$ and $V$ only such that

$$
\log N\left(\varepsilon\|F\|_{Q, 2}, \overline{\operatorname{conv}} \mathcal{F}, L_{2}(Q)\right) \leq K\left(\frac{1}{\varepsilon}\right)^{2 V /(V+2)} .
$$

Proof. Every point in the convex hull of $\mathcal{F}$ is within distance $\varepsilon$ of the convex hull of an $\varepsilon$-net over $\mathcal{F}$. Therefore, to prove the assertion of the theorem for a fixed $\varepsilon$, it is no loss of generality to assume that $\mathcal{F}$ is finite.

Set $W=1 / 2+1 / V$ and $L=C^{1 / V}\|F\|_{Q, 2}$. Then by assumption $\mathcal{F}$ can be covered by $n$ balls of radius at most $L n^{-1 / V}$ for every natural number $n$. (Note that the assumption is trivially true for $1 \leq \varepsilon \leq C^{1 / V}$.) Form sets $\mathcal{F}_{1} \subset \mathcal{F}_{2} \subset \cdots \subset \mathcal{F}$ such that for each $n$ the set $\mathcal{F}_{n}$ is a maximal, $L n^{-1 / V}$-separated net over $\mathcal{F}$. Thus $\mathcal{F}_{n}$ contains at most $n$ points. It will be shown by induction that there exist constants $C_{k}$ and $D_{k}$ depending only on $C$ and $V$ such that $\sup _{k} C_{k} \vee D_{k}<\infty$ and, for $q \geq 3+V$,

$$
\begin{equation*}
\log N\left(C_{k} L n^{-W}, \operatorname{conv} \mathcal{F}_{n k^{q}}, L_{2}(Q)\right) \leq D_{k} n, \quad n, k \geq 1 \tag{2.6.10}
\end{equation*}
$$

This would imply the theorem. The proof of (2.6.10) consists of a nested induction argument. The outer layer is induction on $k$. The case $k=1$ is proved for each $n$ by induction on $n$.

Assume $k=1$. For $n \leq n_{0}$ and fixed $n_{0}$, the statement is trivially true for sufficiently large $C_{1}$. It suffices to choose $C_{1} L n_{0}^{-W} \geq\|F\|_{Q, 2}$, in which case the left side of (2.6.10) vanishes for every $n \leq n_{0}$. For general $n$, fix $m=n / d$ for large enough $d$ to be chosen. Each $f \in \mathcal{F}_{n}-\mathcal{F}_{m}$ is within distance at most $L m^{-1 / V}$ of some element $\Pi_{m} f$ of $\mathcal{F}_{m}$. Thus each element of $\operatorname{conv} \mathcal{F}_{n}$ can be written as

$$
\sum_{f \in \mathcal{F}_{n}} \lambda_{f} f=\sum_{f \in \mathcal{F}_{m}} \mu_{f} f+\sum_{f \in \mathcal{F}_{n}-\mathcal{F}_{m}} \lambda_{f}\left(f-\Pi_{m} f\right),
$$

where $\mu_{f} \geq 0$ and $\sum \mu_{f}=\sum \lambda_{f}=1$. If $\mathcal{G}_{n}$ is the set of functions 0 and $f-\Pi_{m} f$ with $f$ ranging over $\mathcal{F}_{n}-\mathcal{F}_{m}$, then it follows that $\operatorname{conv} \mathcal{F}_{n} \subset \operatorname{conv} \mathcal{F}_{m}+\operatorname{conv} \mathcal{G}_{n}$ for a set $\mathcal{G}_{n}$ containing at most $n$ elements, each of norm smaller than $L m^{-1 / V}$. Apply Lemma 2.6.11 (below) to $\mathcal{G}_{n}$ with $\varepsilon$ defined by $m^{-1 / V} \varepsilon=(1 / 2) C_{1} n^{-W}$ to find a $-(1 / 2) C_{1} L n^{-W}$-net over $\operatorname{conv} \mathcal{G}_{n}$ consisting of at most

$$
\left(e+e n \varepsilon^{2}\right)^{2 / \varepsilon^{2}} \leq\left(e+\frac{e C_{1}^{2}}{d^{2 / V}}\right)^{8 d^{2 / V} C_{1}^{-2} n}
$$

elements. Apply the induction hypothesis to $\mathcal{F}_{m}$ to find a $C_{1} L m^{-W}$-net over conv $\mathcal{F}_{m}$ consisting of at most $e^{m}$ elements. This defines a partition of $\operatorname{conv} \mathcal{F}_{m}$ into $m$-dimensional sets of diameter at most $2 C_{1} L m^{-W}$. Such a set can be isometrically identified with a subset of a ball of radius $C_{1} L m^{-W}$ in $\mathbb{R}^{m}$. Thus each of these sets can be partitioned in

$$
\left(\frac{3 C_{1} L m^{-W}}{(1 / 2) C_{1} L n^{-W}}\right)^{m}=\left(6 d^{W}\right)^{n / d}
$$

sets of diameter $(1 / 2) C_{1} L n^{-W}$ (Problem 2.1.6). Take a function from each of these sets, and form all sums $f+g$ of a function $f$ attached to $\operatorname{conv} \mathcal{F}_{m}$
and a function $g$ attached to $\operatorname{conv} \mathcal{G}_{n}$ by the preceding procedure. These form a $C_{1} L n^{-W}$-net over $\operatorname{conv} \mathcal{F}_{n}$ of cardinality bounded by

$$
e^{n / d}\left(6 d^{W}\right)^{n / d}\left(e+\frac{e C_{1}^{2}}{d^{2 / V}}\right)^{8 d^{2 / V} C_{1}^{-2} n}
$$

This is bounded by $e^{n}$ for suitable choices of $C_{1}$ and $d$ depending on $V$ only. This concludes the proof of (2.6.10) for $k=1$ and every $n$.

The argument continues by induction on $k$. By a similar construction as before, $\operatorname{conv} \mathcal{F}_{n k^{q}} \subset \operatorname{conv} \mathcal{F}_{n(k-1)^{q}}+\operatorname{conv} \mathcal{G}_{n, k}$ for a set $\mathcal{G}_{n, k}$ containing at most $n k^{q}$ elements, each of norm smaller than $L\left(n(k-1)^{q}\right)^{-1 / V}$. Apply Lemma 2.6.11 to $\mathcal{G}_{n, k}$ to find an $L k^{-2} n^{-W}$-net over conv $\mathcal{G}_{n, k}$ consisting of at most

$$
\left(e+e k^{2 q / V-4+q}\right)^{2^{2 q / V+1} k^{4-2 q / V} n}
$$

elements. Apply the induction hypothesis to obtain a $C_{k-1} L n^{-W}$-net over $\operatorname{conv} \mathcal{F}_{n(k-1)^{q}}$ consisting of at most $e^{D_{k-1} n}$ elements. Combine the nets as before to obtain a $C_{k} L n^{-W}$-net over conv $\mathcal{F}_{n k^{q}}$ consisting of at most $e^{D_{k} n}$ elements, for

$$
\begin{aligned}
C_{k} & =C_{k-1}+\frac{1}{k^{2}} \\
D_{k} & =D_{k-1}+2^{2 q / V+1} \frac{1+\log \left(1+k^{2 q / V-4+q}\right)}{k^{2 q / V-4}}
\end{aligned}
$$

For $2 q / V-4 \geq 2$, the resulting sequences $C_{k}$ and $D_{k}$ are bounded.

Since the symmetric convex hull sconv $\mathcal{F}$ of a class $\mathcal{F}$ is contained in the convex hull of the class $\mathcal{F} \cup-\mathcal{F} \cup\{0\}$, the bound of the preceding theorem is valid for sconv $\mathcal{F}$ as well. It suffices to note that the covering numbers of the class $\mathcal{F} \cup-\mathcal{F} \cup\{0\}$ are at most twice the covering numbers of $\mathcal{F}$ plus 1 .

An important ingredient in the proof of the preceding theorem is the following lemma, which gives a useful bound on the covering numbers of the convex hull of an arbitrary finite set of small diameter.
2.6.11 Lemma. Let $\mathcal{F}$ be an arbitrary set of $n$ measurable functions $f: \mathcal{X} \mapsto \mathbb{R}$ of finite $L_{2}(Q)$-diameter $\operatorname{diam} \mathcal{F}$. Then for every $\varepsilon>0$,

$$
N\left(\varepsilon \operatorname{diam} \mathcal{F}, \operatorname{conv} \mathcal{F}, L_{2}(Q)\right) \leq\left(e+e n \varepsilon^{2}\right)^{2 / \varepsilon^{2}}
$$

Proof. Write $\mathcal{F}=\left\{f_{1}, \ldots, f_{n}\right\}$. For given $\lambda$ in the $n$-dimensional unit simplex and natural number $k$, let $Y_{1}, \ldots, Y_{k}$ be i.i.d. random elements with $\mathrm{P}\left(Y_{i}=f_{j}\right)=\lambda_{j}$ for $j=1, \ldots, n$. Then $\mathrm{E} Y_{i}=\sum \lambda_{j} f_{j}$ and

$$
\mathrm{E}\left\|\bar{Y}_{k}-\mathrm{E} Y_{1}\right\|_{Q, 2}^{2} \leq \frac{1}{k} \mathrm{E}\left\|Y_{1}-\mathrm{E} Y_{1}\right\|_{Q, 2}^{2} \leq \frac{1}{k}(\operatorname{diam} \mathcal{F})^{2}
$$

At least one realization of $\bar{Y}_{k}$ must have distance at most $k^{-1 / 2} \operatorname{diam} \mathcal{F}$ to the convex combination $\sum \lambda_{j} f_{j}$. Every realization is an average of the form $k^{-1} \sum_{i=1}^{k} f_{i_{k}}$ (allowing for multiple use of an $f_{i} \in \mathcal{F}$ ). There are at most $\binom{n+k-1}{k}$ of such averages. Conclude that

$$
N\left(k^{-1 / 2} \operatorname{diam} \mathcal{F}, \operatorname{conv} \mathcal{F}, L_{2}(Q)\right) \leq\binom{ n+k-1}{k} \leq e^{k}\left(1+\frac{n}{k}\right)^{k} .
$$

The last inequality can be proved by using Stirling's inequality with bound. For $\varepsilon \geq 1$, the assertion of the lemma is trivial. For $\varepsilon<1$, conclude the proof by choosing the smallest $k$ such that $k^{-1 / 2} \leq \varepsilon$.
2.6.12 Corollary. For any VC-hull class $\mathcal{F}$ of measurable functions and probability measure $Q$,

$$
\log N\left(\varepsilon\|F\|_{Q, 2}, \mathcal{F}, L_{2}(Q)\right) \leq K\left(\frac{1}{\varepsilon}\right)^{2-2 V_{m}^{-1}(\mathcal{F})},
$$

for a constant $K$ that depends only the VC-index $V_{m}(\mathcal{F})$ of the VCsubgraph class connected with $\mathcal{F}$.

### 2.6.4 VC-Major Classes

A class of measurable functions is called a VC-major class if the sets $\{x: f(x)>t\}$ with $f$ ranging over $\mathcal{F}$ and $t$ over $\mathbb{R}$ form a VC-class of sets. Bounded VC-major classes are VC-hull classes.
2.6.13 Lemma (Bounded VC-major classes). A bounded VC-major class is a scalar multiple of a VC-hull class for sets.

Proof. A given function $f: \mathcal{X} \mapsto[0,1]$ is the uniform limit of the sequence

$$
f_{m}=\sum_{i=1}^{m} \frac{1}{m} 1\left\{f>\frac{i}{m}\right\}
$$

Thus a given class of functions $f: \mathcal{X} \mapsto[0,1]$ is contained in the pointwise sequential closure of the convex hull of the class of sets of the type $\{f>t\}$ with $f$ ranging over $\mathcal{F}$ and $t$ over $\mathbb{R}$. For a VC-major class, this collection of sets is VC.

Since a bounded VC-major class is a VC-hull class, Corollary 2.6.12 shows that it is universally Donsker if suitably measurable. The boundedness can be relaxed considerably by a direct argument.
2.6.14 Theorem. Let $\mathcal{F}$ be a pointwise separable, VC-major class of measurable functions with envelope $F$ such that $\int \sqrt{P^{*}(F>x)} d x<\infty$. Then $\mathcal{F}$ is $P$-Donsker.

Proof. See Dudley and Koltchinskii (1994).

### 2.6.5 Examples and Permanence Properties

The first two lemmas of this section give basic methods for generating VCgraph classes. This is followed by a discussion of methods that allow one to build up new classes related to the VC-property from more basic classes.
2.6.15 Lemma. Any finite-dimensional vector space $\mathcal{F}$ of measurable functions $f: \mathcal{X} \mapsto \mathbb{R}$ is VC-subgraph of index smaller than or equal to $\operatorname{dim}(\mathcal{F})+2$.

Proof. Take any collection of $n=\operatorname{dim}(\mathcal{F})+2$ points $\left(x_{1}, t_{1}\right), \ldots,\left(x_{n}, t_{n}\right)$ in $\mathcal{X} \times \mathbb{R}$. By assumption, the vectors

$$
\left(f\left(x_{1}\right)-t_{1}, \ldots, f\left(x_{n}\right)-t_{n}\right)^{\prime}, \quad f \in \mathcal{F},
$$

are contained in a $\operatorname{dim}(\mathcal{F})+1=(n-1)$-dimensional subspace of $\mathbb{R}^{n}$. Any vector $a \neq 0$ that is orthogonal to this subspace satisfies

$$
\sum_{a_{i}>0} a_{i}\left(f\left(x_{i}\right)-t_{i}\right)=\sum_{a_{i}<0}\left(-a_{i}\right)\left(f\left(x_{i}\right)-t_{i}\right), \quad \text { for every } f \in \mathcal{F} .
$$

Define the sum over an empty set as zero. There exists such a vector $a$ with at least one strictly positive coordinate. For this vector, the set $\left\{\left(x_{i}, t_{i}\right): a_{i}>0\right\}$ cannot be of the form $\left\{\left(x_{i}, t_{i}\right): t_{i}<f\left(x_{i}\right)\right\}$ for some $f$, because then the left side of the equation would be strictly positive and the right side nonpositive for this $f$. Conclude that the subgraphs of $\mathcal{F}$ do not pick out the set $\left\{\left(x_{i}, t_{i}\right): a_{i}>0\right\}$. Hence the subgraphs shatter no set of $n$ points.
2.6.16 Lemma. The set of all translates $\{\psi(x-h): h \in \mathbb{R}\}$ of a fixed monotone function $\psi: \mathbb{R} \mapsto \mathbb{R}$ is VC of index 2.

Proof. By the monotonicity, the subgraphs are linearly ordered by inclusion: if $\psi$ is nondecreasing, then the subgraph of $x \mapsto \psi\left(x-h_{1}\right)$ is contained in the subgraph of $x \mapsto \psi\left(x-h_{2}\right)$ if $h_{1} \geq h_{2}$. Any collection of sets with this property has VC-index 2.
2.6.17 Lemma. Let $\mathcal{C}$ and $\mathcal{D}$ be VC-classes of sets in a set $\mathcal{X}$ and $\phi: \mathcal{X} \mapsto \mathcal{Y}$ and $\psi: \mathcal{Z} \mapsto \mathcal{X}$ fixed functions. Then
(i) $\mathcal{C}^{c}=\left\{C^{c}: C \in \mathcal{C}\right\}$ is $V C$;
(ii) $\mathcal{C} \sqcap \mathcal{D}=\{C \cap D: C \in \mathcal{C}, D \in \mathcal{D}\}$ is $V C$;
(iii) $\mathcal{C} \sqcup \mathcal{D}=\{C \cup D: C \in \mathcal{C}, D \in \mathcal{D}\}$ is $V C$;
(iv) $\phi(\mathcal{C})$ is VC if $\phi$ is one-to-one;
(v) $\psi^{-1}(\mathcal{C})$ is VC;
(vi) the sequential closure of $\mathcal{C}$ for pointwise convergence of indicator functions is VC.
For VC-classes $\mathcal{C}$ and $\mathcal{D}$ in sets $\mathcal{X}$ and $\mathcal{Y}$,
(vii) $\mathcal{C} \times \mathcal{D}$ is $V C$ in $\mathcal{X} \times \mathcal{Y}$.

Proof. The set $C^{c}$ picks out the points of a given set $x_{1}, \ldots, x_{n}$ that $C$ does not pick out. Thus if $\mathcal{C}$ shatters a given set of points, so does $\mathcal{C}^{c}$. This proves (i) (and shows that the indices of $\mathcal{C}$ and $\mathcal{C}^{c}$ are equal). From $n$ points $\mathcal{C}$ can pick out $O\left(n^{V(\mathcal{C})-1}\right)$ subsets. From each of these subsets, $\mathcal{D}$ can pick out at most $O\left(n^{V(\mathcal{D})-1}\right)$ further subsets. Thus $\mathcal{C} \cap \mathcal{D}$ can pick out $O\left(n^{V(\mathcal{C})+V(\mathcal{D})-2}\right)$ subsets. For large $n$, this is certainly smaller than $2^{n}$. This proves (ii). Next (iii) follows from a combination of (i) and (ii), since $C \cup D=\left(C^{c} \cap D^{c}\right)^{c}$. For (iv) note first that if $\phi(\mathcal{C})$ shatters $\left\{y_{1}, \ldots, y_{n}\right\}$, then each $y_{i}$ must be in the range of $\phi$ and there exist $x_{1}, \ldots, x_{n}$ such that $\phi$ is a bijection between $x_{1}, \ldots, x_{n}$ and $y_{1}, \ldots, y_{n}$. Thus $\mathcal{C}$ must shatter $x_{1}, \ldots, x_{n}$. For (v) the argument is analogous: if $\psi^{-1}(\mathcal{C})$ shatters $z_{1}, \ldots, z_{n}$, then all $\psi\left(z_{i}\right)$ must be different and the restriction of $\psi$ to $z_{1}, \ldots, z_{n}$ is a bijection on its range.

To prove (vi) take any set of points $x_{1}, \ldots, x_{n}$ and any set $\bar{C}$ from the sequential closure. If $\bar{C}$ is the pointwise limit of a net $C_{\alpha}$, then for sufficiently large $\alpha$ the equality $1\{\bar{C}\}\left(x_{i}\right)=1\left\{C_{\alpha}\right\}\left(x_{i}\right)$ is valid for each $i$. For such $\alpha$ the set $C_{\alpha}$ picks out the same subset as $\bar{C}$.

For (vii) note first that $\mathcal{C} \times \mathcal{Y}$ and $\mathcal{X} \times \mathcal{D}$ are VC-classes. Then by (ii) so is their intersection $\mathcal{C} \times \mathcal{D}$. $\square$
2.6.18 Lemma. Let $\mathcal{F}$ and $\mathcal{G}$ be VC-subgraph classes of functions on a set $\mathcal{X}$ and $g: \mathcal{X} \mapsto \mathbb{R}, \phi: \mathbb{R} \mapsto \mathbb{R}$, and $\psi: \mathcal{Z} \mapsto \mathcal{X}$ fixed functions. Then
(i) $\mathcal{F} \wedge \mathcal{G}=\{f \wedge g: f \in \mathcal{F}, g \in \mathcal{G}\}$ is VC-subgraph;
(ii) $\mathcal{F} \vee \mathcal{G}$ is VC-subgraph;
(iii) $\{\mathcal{F}>0\}=\{\{f>0\}: f \in \mathcal{F}\}$ is VC ;
(iv) $-\mathcal{F}$ is $V C$;
(v) $\mathcal{F}+g=\{f+g: f \in \mathcal{F}\}$ is VC-subgraph;
(vi) $\mathcal{F} \cdot g=\{f g: f \in \mathcal{F}\}$ is VC-subgraph;
(vii) $\mathcal{F} \circ \psi=\{f(\psi): f \in \mathcal{F}\}$ is VC-subgraph;
(viii) $\phi \circ \mathcal{F}$ is VC-subgraph for monotone $\phi$.

Proof. The subgraphs of $f \wedge g$ and $f \vee g$ are the intersection and union of the subgraphs of $f$ and $g$, respectively. Hence (i) and (ii) are consequences of the preceding lemma. For (iii) note that the sets $\{f>0\}$ are one-to-one
images of the intersections of the (open) subgraphs with the set $\mathcal{X} \times\{0\}$. Thus the class $\{\mathcal{F}>0\}$ is VC by (ii) and (iv) of the preceding lemma.

The subgraphs of the class $-\mathcal{F}$ are the images of the open supergraphs of $\mathcal{F}$ under the map $(x, t) \mapsto(x,-t)$. The open supergraphs are the complements of the closed subgraphs, which are VC by Problem 2.6.10. Now (iv) follows from the previous lemma. For (v) it suffices to note that the subgraphs of the class $\mathcal{F}+g$ shatter a given set of points $\left(x_{1}, t_{1}\right), \ldots,\left(x_{n}, t_{n}\right)$ if and only if the subgraphs of $\mathcal{F}$ shatter the set $\left(x_{i}, t_{i}-g\left(x_{i}\right)\right)$. The subgraph of the function $f g$ is the union of the sets

$$
\begin{aligned}
C^{+} & =\{(x, t): t<f(x) g(x), g(x)>0\}, \\
C^{-} & =\{(x, t): t<f(x) g(x), g(x)<0\}, \\
C^{0} & =\{(x, t): t<0, g(x)=0\} .
\end{aligned}
$$

It suffices to show that these sets are VC in $(\mathcal{X} \cap\{g>0\}) \times \mathbb{R},(\mathcal{X} \cap\{g< 0\}) \times \mathbb{R}$, and $(\mathcal{X} \cap\{g=0\}) \times \mathbb{R}$, respectively (Problem 2.6.12). Now, for instance, $\left\{i:\left(x_{i}, t_{i}\right) \in C^{-}\right\}$is the set of indices of the points $\left(x_{i}, t_{i} / g\left(x_{i}\right)\right)$ picked out by the open supergraphs of $\mathcal{F}$. These are the complements of the closed subgraphs and hence form a VC class.

The subgraphs of the class $\mathcal{F} \circ \psi$ are the inverse images of the subgraphs of functions in $\mathcal{F}$ under the map $(z, t) \mapsto(\psi(z), t)$. Thus (v) of the previous lemma implies (vii).

For (viii) suppose the subgraphs of $\phi \circ \mathcal{F}$ shatter the set of points $\left(x_{1}, t_{1}\right), \ldots,\left(x_{n}, t_{n}\right)$. Choose $f_{1}, \ldots, f_{m}$ from $\mathcal{F}$ such that the subgraphs of the functions $\phi \circ f_{j}$ pick out all $m=2^{n}$ subsets. For each fixed $i$, define $s_{i}=\max \left\{f_{j}\left(x_{i}\right): \phi\left(f_{j}\left(x_{i}\right)\right) \leq t_{i}\right\}$. Then $s_{i}<f_{j}\left(x_{i}\right)$ if and only if $t_{i}< \phi \circ f_{j}\left(x_{i}\right)$, for every $i$ and $j$, and the subgraphs of $f_{1}, \ldots, f_{m}$ shatter the points $\left(x_{i}, s_{i}\right)$.
2.6.19 Lemma. If $\mathcal{F}$ is VC-major, then the class of functions $h \circ f$, with $h$ ranging over the monotone functions $h: \mathbb{R} \mapsto \mathbb{R}$ and $f$ over $\mathcal{F}$, is VC-major.
2.6.20 Lemma. If $\mathcal{F}$ and $\mathcal{G}$ are VC-hull classes for sets (in particular, uniformly bounded VC-major classes), then $\mathcal{F} \mathcal{G}$ is a VC-hull class for sets.

Proofs. The set $\{h \circ f>t\}$ can be rewritten as $\left\{f \cdot>h^{-1}(t)\right\}$ for a suitable inverse $h$ and $>$ meaning either $>$ or $\geq$ depending on $t$. Now the sets $\{f \geq t\}$ with $f$ ranging over $\mathcal{F}$ and $t$ over $\mathbb{R}$ form a VC-class, since they are in the sequential pointwise closure of the same sets defined with strict inequality.

If $\mathcal{F}$ and $\mathcal{G}$ are VC-hull classes for sets, then any function $f g$ can be approximated by a product of two convex combinations of indicator functions of sets from VC-classes. Since the set of pairwise intersections of sets from two VC-classes is VC, the products of the approximations are convex combinations of indicators of sets from a VC-class.
2.6.21 Example. The set of all monotone functions $f: \mathbb{R} \mapsto[0,1]$ is Donsker for every probability measure.
2.6.22 Lemma. Let $F: \mathcal{X} \mapsto \mathbb{R}$ be a fixed, nonnegative function. Then the class of functions $x \mapsto t 1\{F(x) \geq t\}$ with $t$ ranging over $\mathbb{R}$ is $V C$ of index $V(\mathcal{F}) \leq 3$.

Proof. Consider three arbitrary points $\left(x_{1}, t_{1}\right),\left(x_{2}, t_{2}\right)$, and $\left(x_{3}, t_{3}\right)$ in $\mathcal{X} \times [0, \infty)$ such that $F\left(x_{1}\right) \leq F\left(x_{2}\right) \leq F\left(x_{3}\right)$. Suppose the three-point set is shattered by $\mathcal{F}$. Since $\mathcal{F}$ selects the single point $\left(x_{1}, t_{1}\right)$, there exists $s_{1}$ with

$$
\left(t_{1}<s_{1} \leq F\left(x_{1}\right)\right) \wedge\left(s_{1} \leq t_{2} \text { or } s_{1}>F\left(x_{2}\right)\right) \wedge\left(s_{1} \leq t_{3} \text { or } s_{1}>F\left(x_{3}\right)\right)
$$

Because $F\left(x_{i}\right)$ is increasing in $i$, this can be reduced to

$$
\left(t_{1}<s_{1} \leq F\left(x_{1}\right)\right) \wedge\left(s_{1} \leq t_{2}\right) \wedge\left(s_{1} \leq t_{3}\right)
$$

Since $\mathcal{F}$ selects the single point $\left(x_{2}, t_{2}\right)$, there exists $s_{2}$ with

$$
\left(s_{2} \leq t_{1} \text { or } s_{2}>F\left(x_{1}\right)\right) \wedge\left(t_{2}<s_{2} \leq F\left(x_{2}\right)\right) \wedge\left(s_{2} \leq t_{3} \text { or } s_{2}>F\left(x_{3}\right)\right)
$$

In the first part of this logical statement, $s_{2} \leq t_{1}$ is impossible because $t_{1}<s_{1} \leq t_{2}<s_{2}$ in view of the first two parts of the preceding statement and the middle part of the last statement. Thus the last statement can be reduced to

$$
\left(s_{2}>F\left(x_{1}\right)\right) \wedge\left(t_{2}<s_{2} \leq F\left(x_{2}\right)\right) \wedge\left(s_{2} \leq t_{3}\right)
$$

This implies that $t_{3}>F\left(x_{1}\right)$. Then $\mathcal{F}$ cannot select the two-point set $\left\{\left(x_{1}, t_{1}\right),\left(x_{3}, t_{3}\right)\right\}$.
2.6.23 Example. For every strictly increasing function $\phi$ and arbitrary functions $F \geq 0$ and $G$, the set of functions $x \mapsto \phi(t) G(x) 1\{F(x) \geq t\}$ (with $t$ ranging over $\mathbb{R}$ ) is VC of index $V(\mathcal{F}) \leq 3$.

Indeed, for $G \equiv 1$ this class is contained in the class of functions $x \mapsto s 1\{\phi \circ F(x) \geq s\}$. The general case follows from Lemma 2.6.18.

Consequently, the class of functions $x \mapsto t^{k-1} F(x) 1\{F(x) \geq t\}$ is Donsker for every measurable function $F$ with $\int F^{2 k} d P<\infty$ by the uniform entropy central limit theorem.

## Problems and Complements

1. Every collection of sets that is pre-Gaussian for every underlying measure is VC.
[Hint: Dudley (1984), 11.4.1.]
2. Unlike the case of sets, the VC-subgraph property does not characterize universal Donsker classes of functions. There exist bounded universal Donsker classes that do not even satisfy the uniform entropy condition.
[Hint: Dudley (1987).]
3. Let $\mathcal{F}$ be a class of measurable functions such that $D\left(\varepsilon, \mathcal{F}, L_{r}(Q)\right) \leq g(\varepsilon)$ for every empirical type probability measure $Q$ and a fixed function $g(\varepsilon)$. Then the bound is valid for every probability measure.
[Hint: If $D\left(\varepsilon, \mathcal{F}, L_{r}(P)\right)=m$, then there are functions $f_{1}, \ldots, f_{m}$ such that $P\left|f_{i}-f_{j}\right|^{r}>\varepsilon^{r}$ for every $i \neq j$. By the strong law of large numbers, $\mathbb{P}_{n} \mid f_{i}- \left.f_{j}\right|^{r} \rightarrow P\left|f_{i}-f_{j}\right|^{r}$ almost surely, for every $(i, j)$. Thus there exists $\omega$ and $n$ such that $\mathbb{P}_{n}(\omega)\left|f_{i}-f_{j}\right|^{r}>\varepsilon^{r}$, for every $i \neq j$.]
4. There exists a short proof of the fact that for any VC-class of sets $\mathcal{C}$ and $\delta>0$,

$$
N\left(\varepsilon, \mathcal{C}, L_{r}(Q)\right) \leq K\left(\frac{1}{\varepsilon}\right)^{r(V(\mathcal{C})-1+\delta)}
$$

for any probability measure $Q, r \geq 1,0<\varepsilon<1$, and a constant $K$ depending on $V(\mathcal{C})$ and $\delta$ only.
[Hint: Take any subcollection of sets $C_{1}, \ldots, C_{m}$ from $\mathcal{C}$ such that $Q\left(C_{i} \triangle\right. \left.C_{j}\right)>\varepsilon$ for every pair $i \neq j$. Generate a sample $X_{1}, \ldots, X_{n}$ from $Q$. Two sets $C_{i}$ and $C_{j}$ pick out the same subset from a realization of the sample if and only if no $X_{k}$ falls in the symmetric difference $C_{i} \triangle C_{j}$. If every symmetric difference contains a point of the sample, then all $C_{i}$ pick out a different subset from the sample. In that case $\mathcal{C}$ picks out at least $m$ subsets from $X_{1}, \ldots, X_{n}$. The probability that this event does not occur is bounded by

$$
\begin{aligned}
\sum_{i<j} Q\left(X_{k} \notin C_{i} \triangle C_{j} \text { for every } k\right) & \leq\binom{ m}{2}\left(1-Q\left(C_{i} \triangle C_{j}\right)\right)^{n} \\
& \leq\binom{ m}{2}(1-\varepsilon)^{n}
\end{aligned}
$$

For sufficiently large $n$, the last expression is strictly less than 1 . For such $n$ there exists a set of $n$ points from which $\mathcal{C}$ picks out at least $m$ subsets. In other words, for $n>-\log \binom{m}{2} / \log (1-\varepsilon)$, one has the first inequality in

$$
m \leq \max _{x_{1}, \ldots, x_{n}} \Delta_{n}\left(\mathcal{C}, x_{1}, \ldots, x_{n}\right) \leq K n^{V(\mathcal{C})-1}
$$

The last inequality follows from the previous corollary and the constant $K$ depends only on $V(\mathcal{C})$. Since $-\log (1-\varepsilon)>\varepsilon$, we can take $n=3(\log m) / \varepsilon$ and obtain

$$
m \leq K\left(\frac{3 \log m}{\varepsilon}\right)^{V(\mathcal{C})-1}
$$

Since $\log m$ is bounded by a constant times $m^{\delta}$, it follows that $m^{1-\delta}$ is bounded by a constant times $(3 / \varepsilon)^{V(\mathcal{C})-1}$.]
5. The edges of the graph with nodes $\mathcal{Z} \subset\{0,1\}^{n}$ representing a VC-class $\mathcal{C}$ of subsets of a set of points $\left\{x_{1}, \ldots, x_{n}\right\}$ can be directed in such a manner that at most $V(\mathcal{C})-1$ arrows are positively incident with each node.
[Hint: The number of edges of a hereditary collection $\mathcal{C}$ can be enumerated by listing for each node $v$ the edges pointing inward: edges $\{v, w\}$ such that $w$ has a zero in the (one) position in which it differs from $v$. Since every subset of hereditary class has at most $V(\mathcal{C})-1$ points, it follows that $\# \mathcal{E} / \# \mathcal{Z} \leq V(\mathcal{C})-1$. By repeated application of the operators $T_{i}$, an arbitrary collection of sets can be transformed into a hereditary class. The operations do not decrease the quotient $\# \mathcal{E} / \# \mathcal{Z}$ : the number of edges may increase, while the number of nodes remains the same. Conclude that for any VC-collection of sets, $\# \mathcal{E} / \# \mathcal{Z} \leq V(\mathcal{C})-1$. Since a subcollection of a given VC-class is VC of no greater index, it follows that $\# \mathcal{E}^{\prime} \leq \# \mathcal{Z}^{\prime}(V(\mathcal{C})-1)$ for every subgraph ( $\mathcal{Z}^{\prime}, \mathcal{E}^{\prime}$ ) as well.

Now apply Hall's marriage lemma [e.g. Dudley (1989), Theorem 11.6.1, page 318], representing directing an edge $\{v, w\}$ as marrying the edge to one of the nodes $v$ and $w$. In fact, let the eligible partners for $\{v, w\}$ be the collection of $V(\mathcal{C})-1$ copies of $v$ and $V(\mathcal{C})-1$ copies of $w$. Then the total number of partners for a given set of edges is at least $V(\mathcal{C})-1$ times the number of edges. By the marriage lemma, successful marriage is possible.]
6. For every pair of integers $S, r \geq 1$, and $n=S r$, there exists a subset $\mathcal{Z} \subset \{0,1\}^{n}$ such that, for all $1 \leq k \leq n$ and $S=V(\mathcal{C})-1$,

$$
D(k / n, \mathcal{Z}, d) \geq\left(\frac{n}{2 e(k+S)}\right)^{S}
$$

[Hint: Start with the subset $\mathcal{W}=\{(0,0, \ldots, 0),(1,0, \ldots, 0),(1,1, \ldots, 0), \ldots$, $(1,1,1, \ldots, 1)\}$ of $\{0,1\}^{r}$, and let $\mathcal{Z}=\mathcal{W}^{S}$ be the set of all vectors in $\{0,1\}^{n}$ obtained by concatenating $S$ vectors from $\mathcal{W}$.]
7. Every VC-class $\mathcal{C}$ of sets satisfies $\Delta_{n}\left(\mathcal{C}, x_{1}, \ldots, x_{n}\right) \leq(n e /(V(\mathcal{C})-1))^{V(\mathcal{C})-1}$ for $n \geq V(\mathcal{C})-1$.
[Hint: Consider a random variable $Y$ with a binomial distribution with parameters $n$ and $1 / 2$. Bound $\mathrm{P}(Y \leq k)$ by $\mathrm{E} r^{Y-k}$ for a simple (not optimal) choice of $r$.]
8. Let $Q$ be a finitely discrete probability measure supported on $x_{1}, \ldots, x_{n}$. Then for any collection of sets, one has $\Delta_{n}\left(\mathcal{C}, x_{1}, \ldots, x_{n}\right)=N\left(\varepsilon, \mathcal{C}, L_{r}(Q)\right)$ for all $\varepsilon \leq \inf Q\{x\}^{1 / r}$.
[Hint: The $L_{r}$-distance equals $Q^{1 / r}(C \triangle D)$ and can be less than a sufficiently small $\varepsilon$ only if $C \Delta D$ does not contain a support point.]
9. If a collection of sets $\mathcal{C}$ is a VC-class, then the collection of indicators of sets in $\mathcal{C}$ is a VC-subgraph class of the same index.
10. (Open and closed subgraphs) For a set $\mathcal{F}$ of measurable functions, define "closed" and "open" subgraphs by $\{(x, t): t \leq f(x)\}$ and $\{(x, t): t<f(x)\}$, respectively. Then the collection of "closed" subgraphs has the same VCindex as the collection of "open" subgraphs. Consequently, "closed" and "open" are equivalent in the definition of a VC-subgraph class.
[Hint: Suppose the "closed" subgraphs shatter the set $\left(x_{1}, t_{1}\right), \ldots,\left(x_{n}, t_{n}\right)$. Choose $f_{1}, \ldots, f_{m}$ whose "closed" subgraphs pick out all $m=2^{n}$ subsets. Set $2 \varepsilon=\inf \left\{t_{i}-f_{j}\left(x_{i}\right): t_{i}-f_{j}\left(x_{i}\right)>0\right\}$. Then the "open" subgraphs shatter the set $\left(x_{1}, t_{1}-\varepsilon\right), \ldots,\left(x_{n}, t_{n}-\varepsilon\right)$. The converse can be argued in a similar manner.]
11. (Between graphs) For a set $\mathcal{F}$ of measurable functions, define the "between" graphs as the sets $\{(x, t): 0 \leq t \leq f(x)$ or $f(x) \leq t \leq 0\}$. The "between" graphs form a VC-class of sets if and only if $\mathcal{F}$ is a VC-subgraph class.
[Hint: The "closed" subgraphs intersected with the set $\{t \geq 0\}$ yields a VCclass of sets which is the positive half of the "between" graphs. The "open" subgraphs intersected with the set $\{t \leq 0\}$ and next complemented within $\{t \leq 0\}$ give the lower parts of the "between" graphs.]
12. If $\mathcal{X}$ is the union of finitely many disjoint sets $\mathcal{X}_{i}$, and $\mathcal{C}_{i}$ is a VC-class of subsets of $\mathcal{X}_{i}$ for each $i$, then $\sqcup \mathcal{C}_{i}$ is a VC-class in $\cup \mathcal{X}_{i}$ of index $\sum V\left(\mathcal{C}_{i}\right)$.
13. If $\mathcal{F}$ is a VC-major class, then the sets $\{x: f(x) \geq t\}$, with $f$ ranging over $\mathcal{F}$ and $t$ over $\mathbb{R}$, form a VC-class.
[Hint: The set $\{x: f(x) \geq t\}$ is the intersection of the sets $\{x: f(x) \geq t- \left.n^{-1}\right\}$. Use Lemma 2.6.17(vi).]
14. The collection of all half-spaces in $R^{d}$ is a VC-class of index $d+2$. A halfspace is a set of the form $\left\{x \in \mathbb{R}^{d}:\langle x, u\rangle \leq c\right\}$ for fixed $u \in \mathbb{R}^{d}$ and $c \in \mathbb{R}$. The collection of all closed balls in $\mathbb{R}^{d}$ is a VC-class of index $d+2$.
[Hint: Use Lemma 2.6.15. See Dudley (1979).]
15. The class of all closed convex subsets in $\mathbb{R}^{d}$ is not VC for $d \geq 2$. The same is true for the collection of all open convex sets.
[Hint: Any set of $n$ points on the rim of the unit ball is shattered by the closed convex sets. The closed convex sets are in the sequential closure of the open convex sets.]
16. The set of all open polygons with extreme points on the rim of the unit circle in $\mathbb{R}^{2}$ is not VC.
[Hint: Form a regular polygon with its $n$ extreme points on the rim of the unit circle. Choose $n$ points in the $n$ gaps between the polygon and the unit circle.]
17. If $\mathcal{C}$ is a VC-class of subsets of $\mathcal{X}$ and $\phi: \mathcal{X} \mapsto \mathcal{Y}$ is an arbitrary map, then $\phi(\mathcal{C})$ need not be VC.
[Hint: Take $\mathcal{Y}$ any infinite set and let $\mathcal{X}=\mathcal{Y} \times \mathbb{N}$ with $\phi(y, n)=y$. Let $\mathcal{C}$ be the collection of all subsets of exactly one point of $\mathcal{Y} \times 1$, all subsets of exactly 2 points of $\mathcal{Y} \times 2$, etcetera. Then $\phi(C)$ consists of all finite subsets of $\mathcal{Y}$, but no subset of two points in $\mathcal{X}$ is shattered.]
18. The set of all monotone functions $f: \mathbb{R} \mapsto[0,1]$ is VC-hull but not VCsubgraph.
[Hint: Any set of points $\left(x_{i}, t_{i}\right)$ with both $x_{i}$ and $t_{i}$ strictly increasing in $i$ is shattered.]
19. For a VC-subgraph class $\mathcal{F}$, the class $\{f-P f: f \in \mathcal{F}\}$ is not necessarily VC-subgraph.
[Hint: For any countable collection of functions $g_{n}: \mathcal{X} \mapsto[0,1]$, the subgraphs of the collection $g_{n}+n$ form a linearly ordered set. Hence the functions $g_{n}+n$ form a VC-subgraph class.]
20. The class of functions of the form $x \mapsto c 1_{(a, b]}(x)$ with $a, b$, and $c>0$ ranging over $\mathbb{R}$ is VC of index 3 .
[Hint: Any $f$ whose subgraph picks out the subset $\left\{\left(x_{1}, t_{1}\right),\left(x_{3}, t_{3}\right)\right\}$ from three points $\left(x_{i}, t_{i}\right)$ with $x_{1} \leq x_{2} \leq x_{3}$ also picks out $\left(x_{2}, t_{2}\right)$ unless $t_{2}> t_{1} \vee t_{3}$. If a set of four points with nondecreasing $x_{i}$ is shattered, it follows that $t_{2}>t_{1} \vee t_{2}$, but also $t_{3}>t_{2} \vee t_{4}, t_{2}>t_{1} \vee t_{4}$, and $t_{3}>t_{1} \vee t_{4}$.]
21. The "Box-Cox family of transformations" $\mathcal{F}=\left\{f_{\lambda}:(0, \infty) \mapsto \mathbb{R}: \lambda \in \mathbb{R}-\right. \{0\}\}$, with $f_{\lambda}(x)=\left(x^{\lambda}-1\right) / \lambda$, is a VC-subgraph class.
[Hint: The "between" graph class of sets (as defined in Exercise 2.6.11) is the class of subsets $\mathcal{C}=\left\{C_{\lambda}: \lambda \neq 0\right\}$ of $\mathbb{R}^{2}$, where $C_{\lambda}=\{(x, t): 0 \leq \left.t \leq\left(x^{\lambda}-1\right) / \lambda\right\}$. Examine the "dual class" of subsets of $\mathbb{R}$ given by $\mathcal{D}= \left\{D_{(x, t)}:(x, t) \in(0, \infty) \times(0, \infty)\right\}$, where

$$
D_{(x, t)}=\left\{\lambda \neq 0:(x, t) \in C_{\lambda}\right\}=\left\{\lambda \neq 0: 0 \leq t \leq\left(x^{\lambda}-1\right) / \lambda\right\}
$$

Show that $\mathcal{D}$ is a VC-class of sets, and apply Assouad (1983), page 246, Proposition 2.12.]

## 2.7

## Bracketing Numbers

While the VC-theory gives control over the entropy numbers of many interesting classes through simple combinatorial arguments, results on bracketing numbers can be found in approximation theory. This section gives examples. In some cases, the bracketing numbers are actually uniform in the underlying measure.

### 2.7.1 Smooth Functions and Sets

For $\alpha>0$, we study the class of all functions on a bounded set $\mathcal{X}$ in $\mathbb{R}^{d}$ that possess uniformly bounded partial derivatives up to order $\underline{\alpha}$ (the greatest integer smaller than $\alpha$ ) and whose highest partial derivatives are Lipschitz of order $\alpha-\underline{\alpha}$. A simple example is Lipschitz functions of some order $0<\alpha \leq 1$ (for which $\underline{\alpha}=0$ even if $\alpha=1$ !). For a more precise description, define for any vector $k=\left(k_{1}, \ldots, k_{d}\right)$ of $d$ integers the differential operator

$$
D^{k}=\frac{\partial^{k}}{\partial x_{1}^{k_{1}} \cdots \partial x_{d}^{k_{d}}}
$$

where $k .=\sum k_{i}$. Then for a function $f: \mathcal{X} \mapsto \mathbb{R}$, let

$$
\|f\|_{\alpha}=\max _{k . \leq \underline{\alpha}} \sup _{x}\left|D^{k} f(x)\right|+\max _{k .=\underline{\alpha}} \sup _{x, y} \frac{\left|D^{k} f(x)-D^{k} f(y)\right|}{\|x-y\|^{\alpha-\underline{\alpha}}}
$$

where the suprema are taken over all $x, y$ in the interior of $\mathcal{X}$ with $x \neq y$. Let $C_{M}^{\alpha}(\mathcal{X})$ be the set of all continuous functions $f: \mathcal{X} \mapsto \mathbb{R}$ with $\|f\|_{\alpha} \leq M .^{\dagger}$

[^9]Bounds on the entropy numbers of the classes $C_{1}^{\alpha}(\mathcal{X})$ with respect to the supremum norm $\|\cdot\|_{\infty}$ were among the first known after the introduction of the concept of covering numbers. These readily yield bounds on the $L_{r}(Q)$-bracketing numbers for the present classes of functions, as well as for the class of subgraphs corresponding to them. The latter are classes of sets with "smooth boundaries."
2.7.1 Theorem. Let $\mathcal{X}$ be a bounded, convex subset of $\mathbb{R}^{d}$ with nonempty interior. There exists a constant $K$ depending only on $\alpha$ and $d$ such that

$$
\log N\left(\varepsilon, C_{1}^{\alpha}(\mathcal{X}),\|\cdot\|_{\infty}\right) \leq K \lambda\left(\mathcal{X}^{1}\right)\left(\frac{1}{\varepsilon}\right)^{d / \alpha}
$$

for every $\varepsilon>0$, where $\lambda\left(\mathcal{X}^{1}\right)$ is the Lebesgue measure of the set $\{x: \| x- \mathcal{X} \|<1\}$.

Proof. Write $\lesssim$ for "less than equal a constant times," where the constant depends on $\alpha$ and $d$ only. Let $\beta$ denote the greatest integer strictly smaller than $\alpha$.

Since the functions in $C_{1}^{\alpha}(\mathcal{X})$ are continuous on $\mathcal{X}$ by assumption, it may be assumed without loss of generality that $\mathcal{X}$ is open, so that Taylor's theorem applies everywhere on $\mathcal{X}$.

Fix $\delta=\varepsilon^{1 / \alpha} \leq 1$, and form a $\delta$-net for $\mathcal{X}$ of points $x_{1}, \ldots, x_{m}$ contained in $\mathcal{X}$. The number $m$ of points can be taken to satisfy $m \lesssim \lambda\left(\mathcal{X}^{1}\right) / \delta^{d}$. For each vector $k=\left(k_{1}, \ldots, k_{d}\right)$ with $k . \leq \beta$, form for each $f$ the vector

$$
A_{k} f=\left(\left\lfloor\frac{D^{k} f\left(x_{1}\right)}{\delta^{\alpha-k_{\bullet}}}\right\rfloor, \ldots,\left\lfloor\frac{D^{k} f\left(x_{m}\right)}{\delta^{\alpha-k_{\cdot}}}\right\rfloor\right)
$$

Then the vector $\delta^{\alpha-k} \cdot A_{k} f$ consists of the values $D^{k} f\left(x_{i}\right)$ discretized on a grid of mesh-width $\delta^{\alpha-k}$.

If a given pair of functions $f$ and $g$ satisfy $A_{k} f=A_{k} g$ for each $k$ with $k . \leq \beta$, then $\|f-g\|_{\infty} \lesssim \varepsilon$. Indeed, for each $x$ there exists an $x_{i}$ with $\left\|x-x_{i}\right\| \leq \delta$. By Taylor's theorem,

$$
(f-g)(x)=\sum_{k . \leq \beta} D^{k}(f-g)\left(x_{i}\right) \frac{\left(x-x_{i}\right)^{k}}{k!}+R
$$

where $|R| \lesssim\left\|x-x_{i}\right\|^{\alpha}$, because the highest-order partial derivatives are uniformly bounded. In the multidimensional case, the notation $h^{k} / k!$ is short for $\prod_{i=1}^{d} h_{i}^{k_{i}} / k_{i}!$. Thus

$$
|f-g|(x) \lesssim \sum_{k . \leq \beta} \delta^{\alpha-k .} \frac{\delta^{k .}}{k!}+\delta^{\alpha} \leq \delta^{\alpha}\left(e^{d}+1\right)
$$

It follows that there exists a constant $C$ depending on $\alpha$ and $d$ only such that the covering number $N\left(C \varepsilon, C_{1}^{\alpha}(\mathcal{X}),\|\cdot\|_{\infty}\right)$ is bounded by the number of different matrices

$$
A f=\left(\begin{array}{c}
A_{0,0, \ldots, 0} f \\
A_{1,0, \ldots, 0} f \\
\vdots \\
A_{0,0, \ldots, \beta} f
\end{array}\right)
$$

when $f$ ranges over $C_{1}^{\alpha}(\mathcal{X})$. Each row in the matrix $A f$ is one of the vectors $A_{k} f$ for $k$ with $k . \leq \beta$. Hence the number of rows is certainly smaller than $(\beta+1)^{d}$. By definition of each $A_{k} f$ and the fact that $\left|D^{k} f\left(x_{i}\right)\right| \leq 1$ for each $i$, the number of possible values of each element in the row $A_{k} f$ is bounded by $2 / \delta^{\alpha-k} .+1$, which does not exceed $2 \delta^{-\alpha}+1$. Thus each column of the matrix can have at most $\left(2 \delta^{-\alpha}+1\right)^{(\beta+1)^{d}}$ different values.

Assume without loss of generality that $x_{1}, \ldots, x_{m}$ have been chosen and ordered in such a way that for each $j>1$ there is an index $i<j$ such that $\left\|x_{i}-x_{j}\right\|<2 \delta$. Then use the crude bound obtained previously for the first column only. For each later column, indexed by $x_{j}$, there exists a previous $x_{i}$ with $\left\|x_{i}-x_{j}\right\|<2 \delta$. By Taylor's theorem,

$$
D^{k} f\left(x_{j}\right)=\sum_{k .+l . \leq \beta} D^{k+l} f\left(x_{i}\right) \frac{\left(x_{i}-x_{j}\right)^{l}}{l!}+R
$$

where $|R| \lesssim\left\|x_{i}-x_{j}\right\|^{\alpha-k}$. Thus with $B_{k} f=\delta^{\alpha-k} . A_{k} f$,

$$
\begin{aligned}
\mid D^{k} f\left(x_{j}\right)- & \left.\sum_{k .+l . \leq \beta} B_{k+l} f\left(x_{i}\right) \frac{\left(x_{i}-x_{j}\right)^{l}}{l!} \right\rvert\, \\
& \lesssim \sum_{k .+l . \leq \beta}\left|B_{k+l} f\left(x_{i}\right)-D^{k+l} f\left(x_{i}\right)\right| \frac{\left|x_{i}-x_{j}\right|^{l}}{l!}+\delta^{\alpha-k} . \\
& \leq \sum_{k .+l . \leq \beta} \delta^{\alpha-k .-l} \cdot \frac{\delta^{l .}}{l!}+\delta^{\alpha-k .} \leq \delta^{\alpha-k .}
\end{aligned}
$$

Thus given the values in the $i$ th column of $A f$, the values $D^{k} f\left(x_{j}\right)$ range over an interval of length proportional to $\delta^{\alpha-k}$. It follows that the values in the $j$ th column of $A f$ range over integers in an interval of length proportional to $\delta^{k .-\alpha} \delta^{\alpha-k} .=1$. Consequently, there exists a constant $C$ depending only on $\alpha$ and $d$ such that

$$
\# A f \leq\left(2 \delta^{-\alpha}+1\right)^{(\beta+1)^{d}} C^{m-1}
$$

The theorem follows upon replacing $\delta$ by $\varepsilon^{1 / \alpha}$ and $m$ by its upper bound $\lambda\left(\mathcal{X}^{1}\right) \varepsilon^{-d / \alpha}$, respectively, taking logarithms, and bounding $\log (1 / \varepsilon)$ by a constant times $(1 / \varepsilon)^{d / \alpha}$.
2.7.2 Corollary. Let $\mathcal{X}$ be a bounded, convex subset of $\mathbb{R}^{d}$ with nonempty interior. There exists a constant $K$ depending only on $\alpha$, $\operatorname{diam} \mathcal{X}$, and $d$ such that

$$
\log N_{[]}\left(\varepsilon, C_{1}^{\alpha}(\mathcal{X}), L_{r}(Q)\right) \leq K\left(\frac{1}{\varepsilon}\right)^{d / \alpha},
$$

for every $r \geq 1, \varepsilon>0$, and probability measure $Q$ on $\mathbb{R}^{d}$.
Proof. Let $f_{1}, \ldots, f_{p}$ be the centers of $\|\cdot\|_{\infty}$-balls of radius $\varepsilon$ that cover $C_{1}^{\alpha}(\mathcal{X})$. Then the brackets $\left[f_{i}-\varepsilon, f_{i}+\varepsilon\right]$ cover $C_{1}^{\alpha}(\mathcal{X})$. Each bracket has $L_{r}(Q)$-size at most $2 \varepsilon$. By the previous theorem, $\log p$ can be chosen smaller than the given polynomial in $1 / \varepsilon$. $\square$

The corollary, together with either the bracketing central limit theorem or the uniform entropy theorem, implies that $C_{1}^{\alpha}[0,1]^{d}$ is universally Donsker for $\alpha>d / 2$. For instance, on the unit interval in the line, uniformly bounded and uniformly Lipschitz of order $>1 / 2$ suffices and in the unit square it suffices that the partial derivatives exist and satisfy a Lipschitz condition.

For the collection of subgraphs to be Donsker, a smoothness condition on the underlying measure is needed, in addition to sufficient smoothness of the graphs. In this case smoothness of the graphs is of little help if the probability mass is distributed in an erratic manner. The following result implies that the subgraphs (contained in $\mathbb{R}^{d+1}$ ) of the functions $C_{1}^{\alpha}[0,1]^{d}$ are $P$-Donsker for Lebesgue-dominated measures $P$ with bounded density, provided $\alpha>d$. For instance, for the sets cut out in the plane by functions $f:[0,1] \mapsto[0,1]$, a uniform Lipschitz condition of any order on the derivatives suffices.
2.7.3 Corollary. Let $\mathcal{C}_{\alpha, d}$ be the collection of subgraphs of $C_{1}^{\alpha}[0,1]^{d}$. There exists a constant $K$ depending only on $\alpha$ and $d$ such that

$$
\log N_{[]}\left(\varepsilon, \mathcal{C}_{\alpha, d}, L_{r}(Q)\right) \leq K\|q\|_{\infty}^{d / \alpha}\left(\frac{1}{\varepsilon}\right)^{d r / \alpha},
$$

for every $r \geq 1, \varepsilon>0$, and probability measure $Q$ with bounded Lebesgue density $q$ on $\mathbb{R}^{d+1}$.

Proof. Let $f_{1}, \ldots, f_{p}$ be the centers of $\|\cdot\|_{\infty}$-balls of radius $\varepsilon$ that cover $C_{1}^{\alpha}[0,1]^{d}$. For each $i$, define the sets $C_{i}$ and $D_{i}$ as the subgraphs of $f_{i}-\varepsilon$ and $f_{i}+\varepsilon$, respectively. Then the pairs $\left[C_{i}, D_{i}\right]$ form brackets that cover $\mathcal{C}_{\alpha, d}$. (More precisely, their indicator functions bracket the set of indicator functions of the sets in $\mathcal{C}_{\alpha, d}$.) Their $L_{1}(Q)$-size equals

$$
Q\left(C_{i} \triangle D_{i}\right)=\int_{[0,1]^{d}} \int_{\mathbb{R}} 1\left\{f_{i}(x)-\varepsilon \leq t<f_{i}(x)+\varepsilon\right\} d Q(t, x) \leq 2 \varepsilon\|q\|_{\infty}
$$

The $L_{r}(Q)$-size of the brackets is the $(1 / r)$ th power of this. It follows that the bracketing number $N_{[]}\left(\left(2 \varepsilon\|q\|_{\infty}\right)^{1 / r}, \mathcal{C}_{\alpha, d}, L_{r}(Q)\right)$ is bounded by $p$. Finally, apply the previous theorem and make a change of variable. $\square$

The previous results are restricted to bounded subsets of Euclidean space. Under appropriate conditions on the tails of the underlying distributions they can be extended to classes of functions on the whole of Euclidean space. The general conclusion is that under a weak tail condition, the same amount of smoothness suffices for the class to be Donsker. For instance, for any distribution on the line with a finite $2+\delta$ moment, the class of all uniformly bounded and uniformly Lipschitz functions of order $\alpha>1 / 2$ has a finite bracketing integral and hence is Donsker. A more general result is an easy corollary to the first theorem of this section also.
2.7.4 Corollary. Let $\mathbb{R}^{d}=\cup_{j=1}^{\infty} I_{j}$ be a partition of $\mathbb{R}^{d}$ into bounded, convex sets with nonempty interior, and let $\mathcal{F}$ be a class of functions $f: \mathbb{R}^{d} \mapsto \mathbb{R}$ such that the restrictions $\mathcal{F}_{\mid I_{j}}$ belong to $C_{M_{j}}^{\alpha}\left(I_{j}\right)$ for every $j$. Then there exists a constant $K$ depending only on $\alpha, V, r$, and $d$ such that

$$
\log N_{[]}\left(\varepsilon, \mathcal{F}, L_{r}(Q)\right) \leq K\left(\frac{1}{\varepsilon}\right)^{V}\left(\sum_{j=1}^{\infty} \lambda\left(I_{j}^{1}\right)^{\frac{r}{V+r}} M_{j}^{\frac{V r}{V+r}} Q\left(I_{j}\right)^{\frac{V}{V+r}}\right)^{\frac{V+r}{r}}
$$

for every $\varepsilon>0, V \geq d / \alpha$, and probability measure $Q$.
Proof. Let $a_{j}$ be any sequence of numbers in $(0, \infty]$. For each $j \in \mathbb{N}$, take an $\varepsilon a_{j}$-net $f_{j, 1}, \ldots, f_{j, p_{j}}$ for $C_{M_{j}}^{\alpha}\left(I_{j}\right)$ for the uniform norm on $I_{j}$. By Theorem 2.7.1, $p_{j}$ can be chosen to satisfy

$$
\log p_{j} \leq K \lambda\left(I_{j}^{1}\right)\left(\frac{M_{j}}{\varepsilon a_{j}}\right)^{d / \alpha}
$$

for a constant $K$ depending on $d$ and $\alpha$ only. It is clear that, for $\varepsilon a_{j}>M_{j}$, the value $p_{j}$ can be chosen equal to 1 . Now form the brackets

$$
\left[\sum_{j=1}^{\infty}\left(f_{j, i_{j}}-\varepsilon a_{j}\right) 1\left\{I_{j}\right\}, \sum_{j=1}^{\infty}\left(f_{j, i_{j}}+\varepsilon a_{j}\right) 1\left\{I_{j}\right\}\right]
$$

where the sequence $i_{1}, i_{2}, \ldots$ ranges over all possible values: for each $j$ the integer $i_{j}$ ranges over $\left\{1,2, \ldots, p_{j}\right\}$. The number of brackets is bounded by $\prod p_{j}$, and each bracket has $L_{r}(Q)$-size equal to $2 \varepsilon\left(\sum a_{j}^{r} Q\left(I_{j}\right)\right)^{1 / r}$. It follows that

$$
\begin{aligned}
\log N_{[]}\left(2 \varepsilon\left(\sum a_{j}^{r} Q\left(I_{j}\right)\right)^{1 / r}, \mathcal{F}, L_{r}(Q)\right) & \lesssim K\left(\frac{1}{\varepsilon}\right)^{d / \alpha} \sum_{\substack{j=1 \\
a_{j} \varepsilon \leq M_{j}}}^{\infty} \lambda\left(I_{j}^{1}\right)\left(\frac{M_{j}}{a_{j}}\right)^{d / \alpha} \\
& \leq K\left(\frac{1}{\varepsilon}\right)^{V} \sum_{j=1}^{\infty} \lambda\left(I_{j}^{1}\right)\left(\frac{M_{j}}{a_{j}}\right)^{V}
\end{aligned}
$$

for every $V \geq d / \alpha$. The choice $a_{j}^{V+r}=\lambda\left(I_{j}^{1}\right) M_{j}^{V} / Q\left(I_{j}\right)$ reduces both series in this expression to essentially the series in the statement of the corollary. Simplify to obtain the result.

The preceding upper bound may be applied to obtain a simple sufficient condition for classes of smooth functions on the whole space to have a finite bracketing integral. As an example, consider the class $C_{1}^{\alpha}(\mathbb{R})$. If $\alpha>1 / 2$ and $\sum_{j=1}^{\infty} P\left(I_{j}\right)^{s}<\infty$ for a partition of $\mathbb{R}$ into intervals of fixed length and some $s<1 / 2$, then for sufficiently small $\delta>0$,

$$
\log N_{[]}\left(\varepsilon, C_{1}^{\alpha}(\mathbb{R}), L_{2}(P)\right) \leq K\left(\frac{1}{\varepsilon}\right)^{2-\delta}
$$

(for a constant $K$ depending on $P, \alpha$, and $\delta$ ). Consequently, the class $C_{1}^{\alpha}(\mathbb{R})$ has a finite bracketing integral and is $P$-Donsker. Convergence of the series is implied by a tail condition: the series converges for some $s<1 / 2$ if $\int|x|^{2+\delta} d P(x)$ for some $\delta>0$.

The bound given by the preceding corollary can be proved to be the best in terms of a power of $(1 / \varepsilon)$, but it is not sharp in terms of lowerorder terms. As a consequence, the best conditions for the class $\mathcal{F}$ as in the corollary to be Glivenko-Cantelli or Donsker cannot be obtained from the corollary. The class is known to be Glivenko-Cantelli or Donsker if and only if $\sum_{j=1}^{\infty} M_{j} P\left(I_{j}\right)<\infty$ or $\sum_{j=1}^{\infty} M_{j} P^{1 / 2}\left(I_{j}\right)<\infty$, respectively. See Section 2.10.4 and the Notes at the end of Part 2 for further details.

### 2.7.2 Monotone Functions

The class of all uniformly bounded, monotone functions on the real line is Donsker. This may be proved in many ways; for instance, by verifying that the class possesses a finite bracketing integral. The following theorem shows that the bracketing entropy is of the order $1 / \varepsilon$ uniformly in the underlying measure.
2.7.5 Theorem. The class $\mathcal{F}$ of monotone functions $f: \mathbb{R} \mapsto[0,1]$ satisfies

$$
\log N_{[]}\left(\varepsilon, \mathcal{F}, L_{r}(Q)\right) \leq K\left(\frac{1}{\varepsilon}\right),
$$

for every probability measure $Q$, every $r \geq 1$, and a constant $K$ that depends on $r$ only.

Proof. The proof of the theorem is long. It can be shown by a much shorter and straightforward proof that the bracketing entropy is bounded above by a constant times $(1 / \varepsilon) \log (1 / \varepsilon)$. For this, construct the brackets as piecewise constant functions on a regular grid (in the uniform case).

It suffices to establish the bound for the class of monotonically increasing functions. It also suffices to prove the bound for $Q$ equal to the uniform measure $\lambda$ on $[0,1]$. To see the latter, note first that if $Q^{-1}(u)=\inf \{x: Q(x) \geq u\}$ denotes the quantile function of $Q$, then the class $\mathcal{F} \circ Q^{-1}$ consists of functions $f \circ Q^{-1}:[0,1] \mapsto[0,1]$ that are monotone. Since $Q^{-1} \circ Q(x) \leq x$ for every $x$ and $u \leq Q \circ Q^{-1}(u)$ for every $u$, an
$\varepsilon$-bracket $[l, u]$ for $f \circ Q^{-1}$ for $\lambda$ yields a function $l \circ Q$ with the properties $l \circ Q \leq f \circ Q^{-1} \circ Q \leq f$ and

$$
\|f-l \circ Q\|_{Q, r}=\left\|f \circ Q^{-1}-l \circ Q \circ Q^{-1}\right\|_{\lambda, r} \leq\left\|f \circ Q^{-1}-l\right\|_{\lambda, r}<\varepsilon
$$

Thus $l \circ Q$ is a "lower bracket." If $Q$ is strictly increasing, then $u \circ Q$ can be used as an upper bracket. More generally, we can repeat the preceding construction with $\bar{Q}^{-1}(u)=\sup \{x: Q(x) \leq u\}$ and obtain upper brackets $\bar{u} \circ \bar{Q}$. A set of full brackets can next be formed by taking every pair [l० $Q, \bar{u} \circ \bar{Q}]$ of functions attached to a same function $f$.

Call a function $g$ a left bracket for $f$ if $g \leq f$ and $\|f-g\|_{\lambda, r} \leq \varepsilon$. It suffices to construct a set of left brackets of the given cardinality. Right brackets may next be constructed from left brackets for the class of functions $h(x)=1-f(1-x)$.

Fix $\varepsilon$ and set $c=(1 / 2)^{1 / r}$. Fix a function $f$. Let $\mathcal{P}_{0}$ be the partition $0=x_{0}<x_{1}=1$ of the unit interval. Given a partition $\mathcal{P}_{i}$ of the form $0=x_{0}<x_{1}<\cdots<x_{n}=1$, define $\varepsilon_{i}=\varepsilon_{i}(f)$ by

$$
\varepsilon_{i}=\max _{j}\left(f\left(x_{j}\right)-f\left(x_{j-1}\right)\right)\left(x_{j}-x_{j-1}\right)^{1 / r}
$$

Form a partition $\mathcal{P}_{i+1}$ by dividing the intervals $\left[x_{j-1}, x_{j}\right]$ in $\mathcal{P}_{i}$ for which

$$
\left(f\left(x_{j}\right)-f\left(x_{j-1}\right)\right)\left(x_{j}-x_{j-1}\right)^{1 / r} \geq c \varepsilon_{i}
$$

into two halves of equal length. It is clear that $\varepsilon_{0} \leq 1$ and that $\varepsilon_{i+1} \leq c \varepsilon_{i} \leq 2 \varepsilon_{i+1}$. Let $n_{i}=n_{i}(f)$ be the number of intervals in $\mathcal{P}_{i}$ and $s_{i}=n_{i+1}-n_{i}$ the number of members of $\mathcal{P}_{i}$ that are divided to obtain $\mathcal{P}_{i+1}$. Then by the definitions of $s_{i}$ and $\varepsilon_{i}$,

$$
\begin{aligned}
s_{i}\left(c \varepsilon_{i}\right)^{r /(r+1)} & \leq \sum_{j}\left(f\left(x_{j}\right)-f\left(x_{j-1}\right)\right)^{r /(r+1)}\left(x_{j}-x_{j-1}\right)^{1 /(r+1)} \\
& \leq\left(\sum_{j}\left(f\left(x_{j}\right)-f\left(x_{j-1}\right)\right)\right)^{r /(r+1)}\left(\sum_{j}\left(x_{j}-x_{j-1}\right)\right)^{1 /(r+1)}
\end{aligned}
$$

by Hölder's inequality. This is bounded by $(f(1)-f(0))^{r /(r+1)} 1 \leq 1$. Consequently, the sum of the numbers of intervals up to the $i$ th partition satisfies

$$
\begin{align*}
\sum_{j=1}^{i} n_{j}=i+\sum_{j=1}^{i} j s_{i-j} & \leq 2 \sum_{j=1}^{i} j\left(c \varepsilon_{i-j}\right)^{-r /(r+1)}  \tag{2.7.6}\\
& \lesssim \sum_{j=1}^{i} j c^{r j /(r+1)} \varepsilon_{i}^{-r /(r+1)} \lesssim \varepsilon_{i}^{-r /(r+1)}
\end{align*}
$$

where $\lesssim$ denotes smaller than up to a constant that depends on $r$ only.
Each function $f$ generates a sequence of partitions $\mathcal{P}_{0} \subset \mathcal{P}_{1} \subset \cdots$. Call two functions equivalent at stage $i$ if their partitions up to the $i$-th
are the same. For each $i$ this yields a partitioning of the class $\mathcal{F}$ in equivalence classes, which can for increasing $i$ be visualized as a tree structure with the different equivalence classes at stage $i$ as the nodes at level $i$. Continue the partitioning of a certain branch until the first level $k$ such that $\varepsilon_{k}(f)^{r} \leq \varepsilon^{r+1}$ for every $f$ in that branch. This defines a partitioning of the class $\mathcal{F}$ into finitely many subsets, each corresponding to some sequence of partitions $\mathcal{P}_{0} \subset \cdots \subset \mathcal{P}_{k}$ of the unit interval. For each subset and $i$, define

$$
\tilde{\varepsilon}_{i}=\sup _{f} \varepsilon_{i}(f),
$$

where the supremum is taken over all functions $f$ in the subset. While $\tilde{\varepsilon}_{i}=\tilde{\varepsilon}_{i}(f)$ may be thought of as depending on $f$, it really depends only on the subset of $f$ in the final partitioning, unlike $\varepsilon_{i}$. Since the numbers $n_{1} \leq n_{2} \leq \cdots \leq n_{i}$ also depend on the sequence $\mathcal{P}_{0} \subset \cdots \subset \mathcal{P}_{i}$ only, inequality (2.7.6) remains valid if $\varepsilon_{i}$ is replaced by $\tilde{\varepsilon}_{i}$.

For a fixed function $f$, define a left-bracketing function $f_{i}$, which is constant on each interval $\left[x_{j-1}, x_{j}\right)$ in the partition $\mathcal{P}_{i}$, recursively as follows. First $f_{0}=0$. Next given $f_{i-1}$, define $f_{i}$ on the interval $\left[x_{j-1}, x_{j}\right)$ by

$$
f_{i}\left(x_{j-1}\right)=f_{i-1}\left(x_{j-1}\right)+l_{j} \frac{\tilde{\varepsilon}_{i}}{\left(x_{j}-x_{j-1}\right)^{1 / r}}
$$

where $l_{j} \geq 0$ is the largest integer such that $f_{i} \leq f$. Thus to construct $f_{i}$, the left bracket $f_{i-1}$ is raised at $x_{j-1}$ by as many steps of size $\tilde{\varepsilon}_{i}\left(x_{j}-x_{j-1}\right)^{-1 / r}$ as possible.

We claim that the set of functions $f_{k}$, when $f$ ranges over $\mathcal{F}$ and $k=k(f)$ is the final level of partitioning for $f$, constitutes a set of left brackets of size proportional to $\varepsilon$ of the required cardinality.

First, it is immediate from the construction of $f_{i}$ that, for each of the intervals $\left[x_{j-1}, x_{j}\right)$ in the $i$ th partition,

$$
\left(f\left(x_{j}\right)-f_{i}\left(x_{j-1}\right)\right)\left(x_{j}-x_{j-1}\right)^{1 / r} \leq \tilde{\varepsilon}_{i} .
$$

Combining this with the definition of $\varepsilon_{i}$ and the monotonicity of $f$, we obtain

$$
\begin{equation*}
\left(f(x)-f_{i}\left(x_{j-1}\right)\right)\left(x_{j}-x_{j-1}\right)^{1 / r} \leq \varepsilon_{i}+\tilde{\varepsilon}_{i} \leq 2 \tilde{\varepsilon}_{i}, \quad x \in\left[x_{j-1}, x_{j}\right) . \tag{2.7.7}
\end{equation*}
$$

Consequently,

$$
\left\|f-f_{i}\right\|_{\lambda, r}^{r} \leq n_{i}\left(2 \tilde{\varepsilon}_{i}\right)^{r} \lesssim \tilde{\varepsilon}_{i}^{r^{2} /(r+1)},
$$

since $n_{i} \lesssim \tilde{\varepsilon}_{i}^{-r /(r+1)}$ by (2.7.6). For $i=k(f)$, this is bounded up to a constant by $\varepsilon^{r}$. Thus the brackets have the correct size.

Second, we count the number of functions $f_{k}$ obtained when $f$ ranges over $\mathcal{F}$. In view of the definition of $k=k(f)$, we have that $\varepsilon_{k-1}(g)^{r}>\varepsilon^{r+1}$, for some function $g$ which is equivalent to $f$ at stage $k-1$. This implies that $\varepsilon_{k-1}(g)^{-r /(r+1)}<1 / \varepsilon$. Combining this with (2.7.6), we find $\sum_{j=1}^{k-1} n_{j} \lesssim 1 / \varepsilon$
and trivially $n_{k}(f) \leq 2 n_{k-1} \lesssim 1 / \varepsilon$. (Note that the numbers $n_{j}$ for $j \leq k-1$ are the same for $f$ and $g$.) The number of sequences $1=n_{0} \leq n_{1} \leq \cdots \leq n_{k} \leq C / \varepsilon$ is equal to the number of ways we can choose $k$ integers from the set $\{2,3, \ldots,\lfloor C / \varepsilon\rfloor\}$. It does not exceed $2^{C / \varepsilon}$. Given a sequence of this type, the number of ways to obtain $\mathcal{P}_{i+1}$ from $\mathcal{P}_{i}$ is $\binom{n_{i}}{s_{i}}$, which is bounded by $2^{n_{i}}$. We conclude that the the total number of different final partitions $\mathcal{P}_{0} \subset \cdots \subset \mathcal{P}_{k}$ generated when $f$ ranges over $\mathcal{F}$ is bounded by

$$
2^{C / \varepsilon} 2^{n_{0}} 2^{n_{1}} \cdots 2^{n_{k-1}} \leq 2^{2 C / \varepsilon}
$$

Given a sequence of partitions $\mathcal{P}_{0} \subset \cdots \subset \mathcal{P}_{k}$, let $\mathcal{F}_{i}$ be the set of all left brackets $f_{i}$ constructed on the partition $\mathcal{P}_{i}$ when $f$ ranges over the subset of $\mathcal{F}$ corresponding to this sequence of partitions. Then $\mathcal{F}_{0}=\{0\}$, and since $\tilde{\varepsilon}_{i}$ is fixed for the given sequence of partitions,

$$
\# \mathcal{F}_{i} \leq \prod_{j=1}^{n_{i}} m_{j} \# \mathcal{F}_{i-1}
$$

where $m_{j}$ is the number of nonnegative integers that can occur in the definition of a function $f_{i} \in \mathcal{F}_{i}$ from a function $f_{i-1} \in \mathcal{F}_{i-1}$. Let the interval $\left[x_{j-1}, x_{j}\right)$ occur in the $i$ th partition. By (2.7.7) we have that $f\left(x_{j-1}\right)- f_{i-1}\left(x_{j-1}\right) \leq 2 \tilde{\varepsilon}_{i-1}\left(x_{j, i}-x_{j-1, i}\right)^{-1 / r}$, where $\left[x_{j-1, i}, x_{j, i}\right)$ is the interval in the partition $\mathcal{P}_{i-1}$ that contains $\left[x_{j-1}, x_{j}\right)$. It follows that

$$
0 \leq m_{j} \leq \frac{2 \tilde{\varepsilon}_{i-1}\left(x_{j, i}-x_{j-1, i}\right)^{-1 / r}}{\tilde{\varepsilon}_{i}\left(x_{j}-x_{j-1}\right)^{-1 / r}}+2 \lesssim \frac{2}{c} \cdot 1+2=: L
$$

Conclude that for a given sequence of partitions $\mathcal{P}_{0} \subset \cdots \subset \mathcal{P}_{k}$, the total number of left brackets $f_{k}$ is bounded by

$$
L^{n_{k}} L^{n_{k-1}} \cdots L^{n_{1}} \leq L^{2 C / \varepsilon}
$$

Multiply this with the upper bound on the number of partitions to conclude that the total number of left brackets does not exceed $(2 L)^{2 C / \varepsilon}$.

### 2.7.3 Closed Convex Sets and Convex Functions

For a pair of subsets $C$ and $D$ of a metric space, the Hausdorff distance is defined as

$$
h(C, D)=\sup _{x \in C} d(x, D) \vee \sup _{x \in D} d(x, C)
$$

Restricted to the closed subsets, this defines a metric (which may be infinite). The following lemma gives the entropy of the collection of all compact, convex subsets of a fixed, bounded subset of $\mathbb{R}^{d}$ with respect to the Hausdorff metric.
2.7.8 Lemma. For the class $\mathcal{C}$ of all compact, convex subsets of a fixed, bounded subset of $\mathbb{R}^{d}$, with $d \geq 2$, one has

$$
K_{1}\left(\frac{1}{\varepsilon}\right)^{(d-1) / 2} \leq \log N(\varepsilon, \mathcal{C}, h) \leq K_{2}\left(\frac{1}{\varepsilon}\right)^{(d-1) / 2},
$$

for constants $K_{i}$ that depend on $d$ and the bounded set only.
Proof. See Bronštein (1976) or Dudley (1984).
As a consequence we obtain $L_{r}(Q)$-bracketing numbers for Lebesgue absolutely continuous probability measures $Q$. Combination with the bracketing central limit theorem shows that the closed convex sets of the unit ball in two dimensions form a Donsker class for, for instance, the uniform measure. For any dimension, this class is Glivenko-Cantelli.

For an extension to unbounded convex sets, see Section 2.10.4.
2.7.9 Corollary. For the class $\mathcal{C}$ of all compact, convex subsets of a fixed, bounded subset of $\mathbb{R}^{d}$ with $d \geq 2$, one has the entropy bound

$$
\log N_{[]}\left(\varepsilon, \mathcal{C}, L_{r}(Q)\right) \leq K\left(\frac{1}{\varepsilon}\right)^{(d-1) r / 2},
$$

for every Lebesgue absolutely continuous probability measure $Q$ with bounded density and a constant $K$ that depends on the bounded set, $Q$, and $d$ only.

Proof. For a given set $C$, let ${ }_{\varepsilon} C=\left\{x: d\left(x, C^{c}\right)>\varepsilon\right\}$ be the points that are at least a distance $\varepsilon$ inside $C$, and let $C^{\varepsilon}$ be the points within distance $\varepsilon$ of $C$. Then there exists a constant $K$ depending only on $\mathcal{C}$ such that the Lebesgue measure $\lambda$ satisfies

$$
\lambda\left(C^{\varepsilon}-{ }_{\varepsilon} C\right) \leq K \varepsilon,
$$

for every $0<\varepsilon<1 .^{\ddagger}$
If $h(C, D)<\varepsilon$, then it must be that ${ }_{\varepsilon} C \subset D \subset C^{\varepsilon}$. Thus if $C_{1}, \ldots, C_{p}$ are the centers of Hausdorff balls of radius $\varepsilon$ that cover $\mathcal{C}$, then the pairs $\left[{ }_{\varepsilon} C_{i}, C_{i}^{\varepsilon}\right]$ form a class of brackets that cover $\mathcal{C}$. Their sizes in $L_{r}(Q)$ are bounded by $Q^{1 / r}\left(C^{\varepsilon}-{ }_{\varepsilon} C\right)$, which is bounded by $\|q\|_{\infty}^{1 / r}(K \varepsilon)^{1 / r}$. Now the corollary follows from the previous lemma.

Next consider the set of all convex functions $f: C \mapsto \mathbb{R}$ defined on a compact convex subset of $\mathbb{R}^{d}$. If this class is restricted to functions that are also uniformly Lipschitz, then the entropy with respect to the uniform metric can be derived from the entropy of the class of their supergraphs (which are convex sets in $\mathbb{R}^{d+1}$ ) for the Hausdorff metric. The assumption that the functions are Lipschitz is unpleasant, though it may be noted that every function $f$ that is convex on $C^{\eta}$ for some $\eta>0$ is automatically Lipschitz on $C$, with Lipschitz constant $2 \sup \left\{|f(x)|: x \in C^{\eta}\right\} / \eta$ (Problem 2.7.4).

[^10]2.7.10 Corollary. Let $\mathcal{F}$ be the class of all convex functions $f: C \mapsto[0,1]$ defined on a compact, convex subset $C \subset \mathbb{R}^{d}$ such that $|f(x)-f(y)| \leq L\|x-y\|$ for every $x, y$. Then
$$
\log N\left(\varepsilon, \mathcal{F},\|\cdot\|_{\infty}\right) \leq K(1+L)^{d / 2}\left(\frac{1}{\varepsilon}\right)^{d / 2},
$$
for a constant $K$ that depends on the dimension $d$ and $C$ only.
Proof. Let $C_{f}$ be the supergraph $\{(x, t): f(x) \leq t\}$ of a function $f$. For every pair of points $x$ and $y$ and functions $f$ and $g$,
$$
|f(x)-g(x)| \leq|f(x)-g(y)|+L\|y-x\| .
$$

Fix a point $x$ such that $f(x)<g(x)$. Then the boundary of the supergraph of $f$ is below the supergraph of $g$ at $x$, and the projection (closest point) of the point $(x, f(x))$ on the supergraph of $g$ has the form $(y, g(y))$ for some point $y$. The distance $d((x, f(x)),(y, g(y)))$ between the two points in $\mathbb{R}^{d+1}$ is bounded above by the Hausdorff distance between the two supergraphs. On the other hand, the distance between the two points is bounded below by a multiple of

$$
\|x-y\|+|f(x)-f(y)| \geq(1+L)^{-1}|f(x)-g(x)| .
$$

Conclude that $\|f-g\|_{\infty} \lesssim(1+L) h\left(C_{f}, C_{g}\right)$. Finally, apply Lemma 2.7.8 to the set of supergraphs intersected with the set $C \times[0,1]$.

### 2.7.4 Classes That Are Lipschitz in a Parameter

A simple, but useful, application of bracketing is to classes of functions $x \mapsto f_{t}(x)$ that are Lipschitz in the index parameter $t \in T$. Suppose that

$$
\left|f_{s}(x)-f_{t}(x)\right| \leq d(s, t) F(x),
$$

for some metric $d$ on the index set, function $F$ on the sample space, and every $x$. Then $(\operatorname{diam} T) F$ is an envelope function for the class $\left\{f_{t}-f_{t_{0}}: t \in\right. T\}$ for any fixed $t_{0}$. The bracketing numbers of this class are bounded by the covering numbers of $T$.
2.7.11 Theorem. Let $\mathcal{F}=\left\{f_{t}: t \in T\right\}$ be a class of functions satisfying the preceding display for every $s$ and $t$ and some fixed function $F$. Then, for any norm $\|\cdot\|$,

$$
N_{[]}(2 \varepsilon\|F\|, \mathcal{F},\|\cdot\|) \leq N(\varepsilon, T, d) .
$$

Proof. Let $t_{1}, \ldots, t_{p}$ be an $\varepsilon$-net for $d$ for $T$. Then the brackets [ $f_{t_{i}}- \left.\varepsilon F, f_{t_{i}}+\varepsilon F\right]$ cover $\mathcal{F}$. They are of size $2 \varepsilon\|F\|$.

## Problems and Complements

1. (Lower bound) There exists a constant $K$ depending only on $d$ and $\alpha$ such that $\log N\left(\varepsilon, C_{1}^{\alpha}[0,1]^{d},\|\cdot\|_{\infty}\right) \geq K(1 / \varepsilon)^{d / \alpha}$ for every $\varepsilon>0$.
[Hint: See Kolmogorov and Tikhomirov (1961).]
2. Let $\|\cdot\|$ be a norm on a vector space of real-valued functions. Then given a subclass $\mathcal{F}$ of functions, the entropy numbers of the class $M \mathcal{F}=\{M f: f \in \mathcal{F}\}$ satisfy $N(\varepsilon M, \mathcal{F},\|\cdot\|)=N(\varepsilon / M, \mathcal{F},\|\cdot\|)$. The same relationship holds for bracketing numbers.
3. Let $\mathcal{F}$ be a class of measurable functions $x \mapsto f(x, r)$ indexed by $0 \leq r \leq 1$ such that $r \mapsto f(x, r)$ is monotone for each $x$. If the envelope function of $\mathcal{F}$ is square integrable, then the bracketing numbers of $\mathcal{F}$ are polynomial.
4. Let $\varepsilon>0, C$ a convex subset of a normed space, and $f: C^{\varepsilon} \mapsto \mathbb{R}$ a bounded and convex function. Then $|f(x)-f(y)| \leq 2 \varepsilon^{-1}\|f\|_{C^{\varepsilon}}\|x-y\|$ for every $x, y$ in $C$.
[Hint: Take $x \neq y$ in $C$ and define $z=y+\eta(y-x) /\|y-x\|$ for fixed $\eta<\varepsilon$. Then $z \in C^{\varepsilon}$ and $y$ is a convex combination of $x$ and $z$. By convexity, $f(y) \leq(1-\lambda) f(x)+\lambda f(z)$, whence $f(y)-f(x) \leq \lambda(f(z)-f(x))$. Calculate $\lambda$.]
5. Let $\varepsilon>0, C$ a bounded, convex subset of $\mathbb{R}^{k}$, and $\mathcal{F}$ a class of convex functions $f: C^{\varepsilon} \mapsto \mathbb{R}$ such that $\{f(x): f \in \mathcal{F}\}$ is bounded above for every $x \in C^{\varepsilon}$ and bounded below for at least one $x \in C^{\varepsilon}$. Then $\mathcal{F}$ is uniformly bounded and uniformly Lipschitz.
[Hint: The function $\sup _{f \in F} f(x)$ is finite and convex. Therefore it is continuous and hence bounded on compact sets. For a lower bound on $\mathcal{F}$ suppose that $\{f(y): f \in \mathcal{F}\}$ is bounded below. For any $x \in C^{\varepsilon}$ define $z$ as in the preceding problem. By convexity of $f$ it follows that (for $\lambda$ depending on $x$ ), $f(x) \geq(1-\lambda)^{-1} f(y)-\lambda(1-\lambda)^{-1} f(z)$, which is uniformly bounded below.]
6. Let $\varepsilon>0$ and let $D$ be a compact, convex subset of $\mathbb{R}^{k}$. Then there exists a finite set $D_{0} \subset D^{\varepsilon}$ and a constant $c$ depending only on $\varepsilon$ and $D$, such that $\|f\|_{D}$ is bounded by $c\|f\|_{D_{0}}$ for every convex function $f: D^{\varepsilon} \mapsto \mathbb{R}$.
[Hint: Since we can cover $D$ by finitely many cubes that are contained in $D^{\varepsilon}$, it suffices to bound the supremum norm of $f$ over a given closed cube $C \subset D^{\varepsilon}$. By convexity, the maximum of $f$ over $C$ is bounded above by the maximum of $|f|$ over the corners. Next, $f$ can be bounded below by a supporting hyperplane at an arbitrary point in the interior of $C$. This takes the form $f(c)+\langle\nabla f(c), x\rangle$, which is bounded below by $f(c)-\|\nabla f(c)\|\|x\|$ and $\nabla f(c)_{i}$ can be bounded by the maximum of the values $\left.\left|f\left(c+\varepsilon e_{i}\right)-f(c)\right|.\right]$
7. Let $\varepsilon>0, C$ a bounded, convex subset of a normed space, and $\mathcal{F}$ a class of convex functions $f: C^{\varepsilon} \mapsto \mathbb{R}$ that is uniformly bounded above and such that $\{f(x): f \in \mathcal{F}\}$ is bounded below for at least one $x \in C^{\varepsilon}$. Then $\mathcal{F}$ is uniformly bounded and uniformly Lipschitz.

## 2.8

## Uniformity in the Underlying Distribution

The previous chapters present empirical laws of large numbers and central limit theorems for observations from a fixed underlying distribution $P$. Many of the sufficient conditions given there are actually satisfied by very large classes of underlying measures; typically, the only limitation is finiteness of some appropriate moment of the envelope function. For instance, classes satisfying the uniform entropy condition are, up to measurability, Glivenko-Cantelli or Donsker for all $P$ with $P^{*} F<\infty$ or $P^{*} F^{2}<\infty$, respectively. In particular, many bounded classes of functions are universally Donsker: Donsker for every probability measure on the sample space.

In this chapter we note that even stronger results are typically true. For example, not only does the central limit theorem hold for all underlying measures, or very large classes of measures, it is also valid uniformly in the underlying measure, when this ranges over large classes of measures. Essentially, the main empirical limit theorems are valid uniformly in the underlying measure if the conditions hold in a uniform sense, which appears to be the case frequently. This type of uniformity is certainly of interest in statistical applications.

### 2.8.1 Glivenko-Cantelli Theorems

We start with a uniform Glivenko-Cantelli theorem. Convergence almost surely to zero of a sequence of random variables $X_{n}$ is equivalent to convergence in probability of $\sup _{m \geq n}\left|X_{m}\right|$ to zero. The latter characterization can be used to define "almost sure convergence uniformly in the underlying measure." A class $\mathcal{F}$ of measurable functions on a measurable space ( $\mathcal{X}, \mathcal{A}$ )
is said to be Glivenko-Cantelli uniformly in $P \in \mathcal{P}$ for a given class $\mathcal{P}$ of probability measures on $(\mathcal{X}, \mathcal{A})$ if

$$
\sup _{P \in \mathcal{P}} \mathrm{P}_{P}^{*}\left(\sup _{m \geq n}\left\|\mathbb{P}_{m}-P\right\|_{\mathcal{F}}>\varepsilon\right) \rightarrow 0
$$

for every $\varepsilon>0$ as $n \rightarrow \infty$.
The set $\mathcal{Q}_{n}$ in the statement of the following theorem is the collection of all possible realizations of empirical measures of $n$ observations.
2.8.1 Theorem. Let $\mathcal{F}$ be a $P$-measurable class of functions on a measurable space for every probability measure $P$ in a class $\mathcal{P}$. Suppose that, for some measurable envelope function $F$,

$$
\begin{aligned}
\lim _{M \rightarrow \infty} \sup _{P \in \mathcal{P}} P F\{F>M\} & =0, \\
\sup _{Q \in \mathcal{Q}_{n}} \log N\left(\varepsilon\|F\|_{Q, 1}, \mathcal{F}, L_{1}(Q)\right) & =o(n), \quad \text { for every } \varepsilon>0,
\end{aligned}
$$

where the supremum is taken over the set $\mathcal{Q}_{n}$ of all discrete probability measures with atoms of size integer multiples of $1 / n$. Then $\mathcal{F}$ is GlivenkoCantelli uniformly in $P \in \mathcal{P}$.

Proof. For fixed $M$, let $\mathcal{F}_{M}$ be the class of all functions $f 1\{f \leq M\}$ as $f$ ranges over $\mathcal{F}$. Then

$$
\left\|\mathbb{P}_{n}-P\right\|_{\mathcal{F}} \leq\left\|\left(\mathbb{P}_{n}-P\right) f 1\{F \leq M\}\right\|_{\mathcal{F}}+\mathbb{P}_{n} F 1\{F>M\}+P F\{F>M\}
$$

By the uniform strong law for real random variables (Proposition A.5.1), the second term on the right converges uniformly in $P$ almost surely to $P F\{F>M\}$. By the first condition of the theorem, this quantity can be made arbitrarily small uniformly in $P$ by choosing large $M$. Conclude that it suffices to show that the first term on the right, which equals $\left\|\mathbb{P}_{n}-P\right\|_{\mathcal{F}_{M}}$, converges almost surely to zero uniformly in $P$ for every fixed $M$.

The class $\mathcal{F}_{M}$ satisfies the entropy condition of the theorem relative to the envelope function $M$. This follows from the inequality

$$
\sup _{Q \in \mathcal{Q}_{n}} N\left(\varepsilon M, \mathcal{F}_{M}, L_{1}(Q)\right) \leq \sup _{n \leq k \leq 2 n} \sup _{Q \in \mathcal{Q}_{k}} N\left(\varepsilon\|F\|_{Q, 1}, \mathcal{F}, L_{1}(Q)\right),
$$

which may be proved as follows. Suppose that $k$ out of the $n$ support points $x_{1}, \ldots, x_{n}$ of a given measure $Q \in \mathcal{Q}_{n}$ (with multiple appearance of a given point permitted) satisfy $F\left(x_{i}\right) \leq M$. If $Q_{k} \in \mathcal{Q}_{k}$ is the discrete measure on these points, then $Q|f\{F \leq M\}|=(k / n) Q_{k}|f|$ for any function $f$. Since $Q_{k} F \leq M$, it follows that an $\varepsilon Q_{k} F$-net for $\mathcal{F}$ in $L_{1}\left(Q_{k}\right)$ yields an $\varepsilon(k / n) M$ net for $\mathcal{F}_{M}$ in $L_{1}(Q)$. Thus $N\left(\varepsilon M, \mathcal{F}_{M}, L_{1}(Q)\right) \leq N\left(\varepsilon\|F\|_{Q_{k}, 1}, \mathcal{F}, L_{1}\left(Q_{k}\right)\right)$. Since $\mathcal{Q}_{k} \subset \mathcal{Q}_{2 k} \subset \cdots$, the right side is bounded by the right side of the preceding display. This completes the proof that $\mathcal{F}_{M}$ satisfies the entropy condition of the theorem relative to the envelope function $M$.

Fix $\eta>0$ and values $X_{1}, \ldots, X_{n}$, and take a minimal $\eta M$-net $\mathcal{F}_{n X}$ in $\mathcal{F}_{M}$ for the $L_{1}\left(\mathbb{P}_{n}\right)$ semimetric. It has just been proved that the cardinality $N\left(\eta M, \mathcal{F}_{M}, L_{1}\left(\mathbb{P}_{n}\right)\right)$ of $\mathcal{F}_{n X}$ is bounded by a deterministic sequence $N_{n}(\eta)$ (uniformly in $X_{1}, \ldots, X_{n}$ ) satisfying $\log N_{n}(\eta)=o(n)$. Let $\mathbb{P}_{n}^{o}$ be the symmetrized empirical measure as defined in Chapter 2.3. Then

$$
\left\|\mathbb{P}_{n}^{o}\right\|_{\mathcal{F}_{M}} \leq\left\|\mathbb{P}_{n}^{o}\right\|_{\mathcal{F}_{n X}}+\eta M
$$

The measurability of $\mathcal{F}$ implies the measurability of $\mathcal{F}_{M}$, so that the probability $\mathrm{P}_{P}\left(\left\|\mathbb{P}_{n}^{o}\right\|_{\mathcal{F}_{M}}>\varepsilon\right)$ can be written as $\mathrm{E}_{P, X} \mathrm{P}_{\varepsilon}\left(\left\|\mathbb{P}_{n}^{o}\right\|_{\mathcal{F}_{M}}>\varepsilon\right)$. By Hoeffding's inequality, Lemma 2.2 . 7 applied for fixed $X_{1}, \ldots, X_{n}$,

$$
\mathrm{E}_{P, X} \mathrm{P}_{\varepsilon}\left(\left\|\mathbb{P}_{n}^{o} f\right\|_{\mathcal{F}_{n X}}>\varepsilon-\eta M\right) \leq \mathrm{E}_{P, X} N_{n}(\eta) 2 e^{-\frac{1}{2} n(\varepsilon-\eta M)^{2} / M^{2}}
$$

The integrand on the right side is independent of $X_{1} \ldots, X_{n}$. Since $N_{n}(\eta)= \exp o(n)$, the integrand is bounded by $2 \exp \left(-n \varepsilon^{2} / 4 M^{2}\right)$ for sufficiently large $n$ and small $\eta$. Conclude that $\sum_{m \geq n} \mathrm{P}\left(\left\|\mathbb{P}_{m}^{o}\right\|_{\mathcal{F}_{M}}>\varepsilon\right) \rightarrow 0$ for every $\varepsilon>0$. In view of the symmetrization Lemma 2.3.7 for probabilities, the same is true for the empirical measure replacing the symmetrized empirical. This concludes the proof that $\left\|\mathbb{P}_{n}-P\right\|_{\mathcal{F}_{M}}$ converges to zero outer almost surely uniformly in $P$.

Vapnik-C̆ervonenkis classes of sets or functions satisfy

$$
\sup _{Q} \log N\left(\varepsilon\|F\|_{Q, 1}, \mathcal{F}, L_{1}(Q)\right)<\infty
$$

for the supremum taken over all probability measures $Q$. This trivially implies the entropy condition of the previous theorem. It follows that a suitably measurable VC-class is uniformly Glivenko-Cantelli over any class of underlying measures for which its envelope function is uniformly integrable. In particular, a uniformly bounded VC-class is uniformly Glivenko-Cantelli over all probability measures, provided it satisfies the measurability condition.

### 2.8.2 Donsker Theorems

Next consider uniform in $P$ central limit theorems. Let $\mathcal{F}$ be a class of measurable functions $f: \mathcal{X} \mapsto \mathbb{R}$ that is Donsker for every $P$ in a set $\mathcal{P}$ of probability measures on $(\mathcal{X}, \mathcal{A})$. Thus the empirical process $\mathbb{G}_{n, P}=\sqrt{n}\left(\mathbb{P}_{n}-P\right)$ converges weakly in $\ell^{\infty}(\mathcal{F})$ to a tight, Borel measurable version of the Brownian bridge $\mathbb{G}_{P}$. According to Chapter 1.12, this is equivalent to

$$
\sup _{h \in \mathrm{BL}_{1}}\left|\mathrm{E}_{P}^{*} h\left(\mathbb{G}_{n, P}\right)-\mathrm{E} h\left(\mathbb{G}_{P}\right)\right| \rightarrow 0
$$

(Here $\mathrm{BL}_{1}$ is the set of all functions $h: \ell^{\infty}(\mathcal{F}) \mapsto \mathbb{R}$ which are uniformly bounded by 1 and satisfy $\left|h\left(z_{1}\right)-h\left(z_{2}\right)\right| \leq\left\|z_{1}-z_{2}\right\|_{\mathcal{F}}$.) We shall call $\mathcal{F}$ Donsker uniformly in $P \in \mathcal{P}$ if this convergence is uniform in $P$.

The weak convergence $\mathbb{G}_{n, P} \rightsquigarrow \mathbb{G}_{P}$ under a fixed $P$ is equivalent to asymptotic equicontinuity of the sequence $\mathbb{G}_{n, P}$ and total boundedness of $\mathcal{F}$ under the seminorm $\rho_{P}(f)=\|f-P f\|_{P, 2}$. It is to be expected that uniform versions of these two conditions are sufficient for the uniform Donsker property. The sequence $\mathbb{G}_{n, P}$ is called asymptotically equicontinuous uniformly in $P \in \mathcal{P}$ if, for every $\varepsilon>0$,

$$
\lim _{\delta \downarrow 0} \limsup _{n \rightarrow \infty} \sup _{P \in \mathcal{P}} \mathrm{P}_{P}^{*}\left(\sup _{\rho_{P}(f, g)<\delta}\left|\mathbb{G}_{n, P}(f)-\mathbb{G}_{n, P}(g)\right|>\varepsilon\right)=0 .
$$

Furthermore, the class $\mathcal{F}$ is $\rho_{P}$-totally bounded uniformly in $P \in \mathcal{P}$ if its covering numbers satisfy $\sup _{P \in \mathcal{P}} N\left(\varepsilon, \mathcal{F}, \rho_{P}\right)<\infty$.

These uniform versions of the two conditions actually imply more than the uniform Donsker property. In the situation for a fixed $P$, the asymptotic equicontinuity of the sequence $\mathbb{G}_{n, P}$ has its counterpart in the continuity of the sample paths of the limit process $\mathbb{G}_{P}$. Requiring the asymptotic equicontinuity uniformly in $P$ yields, apart from uniform weak convergence, also uniformity in the continuity of the limit process. The latter is expressed in the following. The class $\mathcal{F}$ is pre-Gaussian uniformly in $P \in \mathcal{P}$ if the Brownian bridges satisfy the two conditions

$$
\sup _{P \in \mathcal{P}} \mathrm{E}\left\|G_{P}\right\|_{\mathcal{F}}<\infty ; \quad \lim _{\delta \downarrow 0} \sup _{P \in \mathcal{P}} \mathrm{E} \sup _{\rho_{P}(f, g)<\delta}\left|\mathbb{G}_{P}(f)-\mathbb{G}_{P}(g)\right|=0 .
$$

(Some authors include the requirement of uniform pre-Gaussianity in the concept of a uniform Donsker class.)

Throughout this section it is assumed that the class $\mathcal{F}$ possesses a measurable envelope function $F$ with the property

$$
\lim _{M \rightarrow \infty} \sup _{P \in \mathcal{P}} P F^{2}\{F>M\} \rightarrow 0
$$

Such an envelope function is called square integrable uniformly in $P \in \mathcal{P}$.
2.8.2 Theorem. Let $\mathcal{F}$ be a class of measurable functions with envelope function $F$ that is square integrable uniformly in $P \in P$. Then the following statements are equivalent:
(i) $\mathcal{F}$ is Donsker and pre-Gaussian, both uniformly in $P \in \mathcal{P}$;
(ii) the sequence $\mathbb{G}_{n, P}$ is asymptotically $\rho_{P}$-equicontinuous uniformly in $P \in \mathcal{P}$ and $\sup _{P \in \mathcal{P}} N\left(\varepsilon, \mathcal{F}, \rho_{P}\right)<\infty$ for every $\varepsilon>0$.
Furthermore, uniform pre-Gaussianity implies uniform total boundedness of $\mathcal{F}$.

Proof. The last assertion is a consequence of Sudakov's minorization inequality A.2.5 for Gaussian processes, which gives the upper bound $3 \mathrm{E}\left\|G_{P}\right\|_{\mathcal{F}}$ for $\varepsilon \sqrt{\log N\left(\varepsilon, \mathcal{F}, \rho_{P}\right)}$ for every $\varepsilon>0$ and $P$.
(i) ⇒ (ii). For each fixed $\delta>0$ and $P$, the truncated modulus function

$$
z \mapsto h_{P}(z)=\sup _{\rho_{P}(f, g)<\delta}|z(f)-z(g)| \wedge 1
$$

is contained in $2 \mathrm{BL}_{1}$. If $\mathcal{F}$ is uniformly Donsker, then $\mathrm{E}_{P}^{*} h_{P}\left(\mathbb{G}_{n, P}\right) \rightarrow \mathrm{E} h_{P}\left(\mathbb{G}_{P}\right)$ uniformly in $P$. Given uniform pre-Gaussianity, the expressions $\mathrm{E} h_{P}\left(\mathbb{G}_{P}\right)$ can be made uniformly small by choice of a sufficiently small $\delta$. Thus $\lim \sup \mathrm{E}_{P}^{*} h_{P}\left(\mathbb{G}_{n, P}\right)$ is uniformly small for sufficiently small $\delta$. This implies that the sequence $\mathbb{G}_{n, P}$ is uniformly asymptotically $\rho_{P}$ equicontinuous.
(ii) ⇒ (i). Fix an arbitrary finite subset $\mathcal{G}$ of $\mathcal{F}$ and $P \in \mathcal{P}$. The sequence of random vectors $\left\{\mathbb{G}_{n, P}(g): g \in \mathcal{G}\right\}$ converges weakly to the Gaussian vector $\left\{\mathbb{G}_{P}(g): g \in \mathcal{G}\right\}$. By the portmanteau theorem,

$$
\begin{aligned}
& \mathrm{P}\left(\sup _{\substack{\rho_{P}(f, g)<\delta \\
f, g \in \mathcal{G}}}\left|\mathbb{G}_{P}(f)-\mathbb{G}_{P}(g)\right|>\varepsilon\right) \\
& \quad \leq \liminf _{n \rightarrow \infty} \sup _{P \in \mathcal{P}} \mathrm{P}_{P}^{*}\left(\sup _{\rho_{P}(f, g)<\delta}\left|\mathbb{G}_{n, P}(f)-\mathbb{G}_{n, P}(g)\right|>\varepsilon\right),
\end{aligned}
$$

for every $\delta>0$. On the right side $\mathcal{G}$ can be replaced by $\mathcal{F}$. By assumption the resulting expression can be made arbitrarily small by choice of $\delta$. Conclude that, for every $\varepsilon, \eta>0$, there exists $\delta>0$ such that the left side of the display is smaller than $\eta$ for every $P$. Let $\mathcal{G}$ increase to a $\rho_{P}$-countable dense subset of $\mathcal{F}$, and use the continuity of the sample paths of $\mathbb{G}_{P}$ to see that the same statement is true (with the same $\varepsilon, \eta$, and $\delta$ ) with $\mathcal{G}$ replaced by $\mathcal{F}$.

This gives a probability form of the second requirement of uniform pre-Gaussianity. The expectation form follows with the help of Borell's inequality A.2.1, which allows one to bound the moment $\mathrm{E}\left\|\mathbb{G}_{P}\right\|_{\mathcal{F}_{\delta}}$ by a universal constant times the median of $\left\|\mathbb{G}_{P}\right\|_{\mathcal{F}_{\delta}}$ (Problem A.2.2).

Fix $\delta>0$. By the uniform total boundedness, there exists for each $P$ a $\delta$-net $\mathcal{G}_{P}$ for $\rho_{P}$ over $\mathcal{F}$ such that the cardinalities of the $\mathcal{G}_{P}$ are uniformly bounded by a constant $k$. Then

$$
\left\|\mathbb{G}_{P}\right\|_{\mathcal{F}} \leq\left\|\mathbb{G}_{P}\right\|_{\mathcal{G}_{P}}+\sup _{\rho_{P}(f, g)<\delta}\left|\mathbb{G}_{P}(f)-\mathbb{G}_{P}(g)\right|
$$

By the result of the preceding paragraph, the expectation of the second term on the right can be made arbitrarily small uniformly in $P$ by choice of $\delta$; it is certainly finite. The first term on the right is a maximum over at most $k$ Gaussian random variables, each having mean zero and variance not exceeding $\sup _{P \in \mathcal{P}} P F^{2}<\infty$. Thus $\mathrm{E}\left\|\mathbb{G}_{P}\right\|_{\mathcal{G}_{P}}$ is uniformly bounded. This concludes the proof of uniform pre-Gaussianity.

For each $P$ let $\Pi_{P}: \mathcal{F} \mapsto \mathcal{G}_{P}$ map each $f$ into a $\rho_{P}$-closest element of $\mathcal{G}_{P}$. Write $z \circ \Pi_{P}$ for the discretized element of $\ell^{\infty}(\mathcal{F})$ taking the value
$z\left(\Pi_{P} f\right)$ at each $f \in \mathcal{F}$. By the uniform central limit theorem for $\mathbb{R}^{k}$, the random vectors $\left\{\mathbb{G}_{n, P}(f): f \in \mathcal{G}_{P}\right\}$ in $\mathbb{R}^{k}$ (with zero coordinates added if $\left|\mathcal{G}_{P}\right|<k$ ) converge weakly to the random vectors $\left\{\mathbb{G}_{P}(f): f \in \mathcal{G}_{P}\right\}$ uniformly in $P \in \mathcal{P}$ (Proposition A.5.2). This implies that

$$
\sup _{h \in \mathrm{BL}_{1}}\left|\mathrm{E}_{P}^{*} h\left(\mathbb{G}_{n, P} \circ \Pi_{P}\right)-\mathrm{E} h\left(\mathbb{G}_{P} \circ \Pi_{P}\right)\right| \rightarrow 0 .
$$

Next, since every $h \in \mathrm{BL}_{1}$ satisfies the inequality $\left|h\left(z_{1}\right)-h\left(z_{2}\right)\right| \leq 2 \wedge \| z_{1}- z_{2} \|_{\mathcal{F}}$, we have, for every $\varepsilon>0$,

$$
\sup _{h \in \mathrm{BL}_{1}}\left|\mathrm{E}_{P}^{*} h\left(\mathbb{G}_{n, P} \circ \Pi_{P}\right)-\mathrm{E}^{*} h\left(\mathbb{G}_{n, P}\right)\right| \leq \varepsilon+2 \mathrm{P}_{P}^{*}\left(\left\|\mathbb{G}_{n, P} \circ \Pi_{P}-\mathbb{G}_{n, P}\right\|_{\mathcal{F}}>\varepsilon\right) .
$$

By construction of $\mathcal{G}_{P}$, the random variable $\left\|\mathbb{G}_{n, P} \circ \Pi_{P}-\mathbb{G}_{n, P}\right\|_{\mathcal{F}}$ is bounded by the modulus of continuity $\left\|\mathbb{G}_{n, P}\right\|_{\mathcal{F}_{\delta}}$ of the process $\mathbb{G}_{n, P}$. In view of the uniform asymptotic equicontinuity, $\lim \sup \mathrm{P}_{P}^{*}\left(\left\|\mathbb{G}_{n, P} \circ \Pi_{P}-\mathbb{G}_{n, P}\right\|_{\mathcal{F}}>\varepsilon\right)$ can be made arbitrarily small by choice of $\delta$, uniformly in $P$, for every fixed $\varepsilon$. Thus the limsup of the left side of the last display can be made arbitrarily small by choice of $\delta$.

Using the uniform pre-Gaussianity, we can obtain the analogous result for the limit processes:

$$
\sup _{h \in \mathrm{BL}_{1}}\left|\mathrm{E}^{*} h\left(\mathbb{G}_{P} \circ \Pi_{P}\right)-\mathrm{E}^{*} h\left(\mathbb{G}_{P}\right)\right| \rightarrow 0, \quad \delta \downarrow 0
$$

Combination of the last three displayed equations shows that $\mathrm{E}_{P}^{*} h\left(\mathbb{G}_{n, P}\right)$ converges to $\mathrm{E} h\left(\mathbb{G}_{P}\right)$ uniformly in $h \in \mathrm{BL}_{1}$ and $P$.

In the situation that $\mathcal{P}$ consists of all probability measures on the underlying measurable space, there is an interesting addendum to the previous theorem. In that case, the uniform pre-Gaussianity implies the uniform Donsker property (under suitable measurability conditions on $\mathcal{F}$ ). We do not reproduce the proof of this result here. (See the Notes for further comments and references.) Instead we derive the uniform versions of the two main empirical limit theorems: the central limit theorem under the uniform entropy condition and the central limit theorem with bracketing.

The uniform entropy condition (2.5.1) implies the uniform Donsker property.
2.8.3 Theorem. Let $\mathcal{F}$ be a class of measurable functions with measurable envelope function $F$ such that $\mathcal{F}_{\delta, P}=\left\{f-g: f, g \in \mathcal{F},\|f-g\|_{P, 2}<\delta\right\}$ and $\mathcal{F}_{\infty}^{2}=\left\{(f-g)^{2}: f, g \in \mathcal{F}\right\}$ are $P$-measurable for every $\delta>0$ and $P \in \mathcal{P}$. Furthermore, suppose that, as $M \rightarrow \infty$,

$$
\begin{aligned}
\sup _{P \in \mathcal{P}} P F^{2}\{F>M\} \rightarrow 0 \\
\int_{0}^{\infty} \sup _{Q} \sqrt{\log N\left(\varepsilon\|F\|_{Q, 2}, \mathcal{F}, L_{2}(Q)\right)} d \varepsilon<\infty
\end{aligned}
$$

where $Q$ ranges over all finitely discrete probability measures. Then $\mathcal{F}$ is Donsker and pre-Gaussian uniformly in $P \in \mathcal{P}$.

Proof. It may be assumed that the envelope function satisfies $F \geq 1$, because replacing a given $F$ by $F+1$ does not affect the uniform integrability and makes the uniform entropy condition weaker. Given an arbitrary sequence $\delta_{n} \downarrow 0$, set

$$
\theta_{n, P}^{2}=\left\|\frac{1}{n} \sum_{i=1}^{n} f^{2}\left(X_{i}\right)\right\|_{\mathcal{F}_{\delta_{n}, P}}
$$

Exactly as in the proof of Theorem 2.5.2, it can be shown that for some universal constant $K$,

$$
\begin{aligned}
& \mathrm{P}_{P}^{*}\left(\left\|\mathbb{G}_{n, P}\right\|_{\mathcal{F}_{\delta_{n}, P}}>\varepsilon\right)^{2} \\
& \quad \leq K \mathrm{E}_{P}^{*} \int_{0}^{\theta_{n, P} /\|F\|_{n}} \sup _{Q} \sqrt{\log N\left(\varepsilon\|F\|_{Q, 2}, \mathcal{F}, L_{2}(Q)\right)} d \varepsilon \mathrm{E}_{P}\|F\|_{n}^{2}
\end{aligned}
$$

Here $\|F\|_{n} \geq 1$ and $\mathrm{E}_{P}\|F\|_{n}^{2}=P F^{2}$ is uniformly bounded in $P$. Conclude that the right side is up to a constant uniformly bounded by

$$
\int_{0}^{\eta} \sup _{Q} \sqrt{\log N\left(\varepsilon\|F\|_{Q, 2}, \mathcal{F}, L_{2}(Q)\right)} d \varepsilon+\sup _{P \in \mathcal{P}} \mathrm{P}_{P}^{*}\left(\theta_{n, P}>\eta\right)
$$

for every $\eta>0$. To establish uniform asymptotic equicontinuity, it suffices to show that the second term converges to zero for all $\eta$. This follows as in the proof of Theorem 2.5.2, except that presently we use the uniform law of large numbers, Theorem 2.8.1.

By assumption, $\sup _{Q} N\left(\varepsilon, \mathcal{F}, \rho_{Q}\right)$ is finite for every $\varepsilon>0$ if $Q$ ranges over all finitely discrete measures. That the supremum is still finite if $Q$ also ranges over $\mathcal{P}$ can be proved as in the proof of Theorem 2.5.2.

The uniform entropy condition requires the supremum over all probability measures of the root entropy to be integrable. In terms of entropy with bracketing, it suffices to consider the supremum over the class of interest.
2.8.4 Theorem. Let $\mathcal{F}$ be a class of measurable functions such that

$$
\begin{gathered}
\lim _{M \rightarrow \infty} \sup _{P \in \mathcal{P}} P F^{2}\{F>M\}=0, \\
\int_{0}^{\infty} \sup _{P \in \mathcal{P}} \sqrt{\log N_{[]}\left(\varepsilon\|F\|_{P, 2}, \mathcal{F}, L_{2}(P)\right)} d \varepsilon<\infty .
\end{gathered}
$$

Then $\mathcal{F}$ is Donsker and pre-Gaussian uniformly in $P \in \mathcal{P}$.

Proof. The first condition implies that $\sup _{P}\|F\|_{P, 2}<\infty$. Finiteness of the integral implies finiteness of the integrand. Therefore,

$$
\sup _{P} N_{[]}\left(\varepsilon\|F\|_{P, 2}, \mathcal{F}, L_{2}(P)\right)<\infty
$$

and $\mathcal{F}$ is totally bounded uniformly in $P$. Uniform asymptotic equicontinuity follows by making the proof of Theorem 2.5.6 uniform in $P$. Actually, the proof of this theorem contains the essence of the proof of the maximal inequality given by Theorem 2.14.2, which implies that

$$
\mathrm{E}_{P}^{*}\left\|\mathbb{G}_{n, P}\right\|_{\mathcal{F}_{\delta, P}} \lesssim \int_{0}^{\delta} \sqrt{\log N_{[]}\left(\varepsilon, \mathcal{F}, L_{2}(P)\right)} d \varepsilon+\frac{P F^{2}\{F>\sqrt{n} b(\delta, P)\}}{b(\delta, P)}
$$

Here

$$
b(\delta, P)=\delta / \sqrt{1+\log N_{[]}\left(\delta, \mathcal{F}, L_{2}(P)\right)}
$$

The right side of the first display converges to zero uniformly in $P$ as $n \rightarrow \infty$ followed by $\delta \downarrow 0$.

### 2.8.3 Central Limit Theorem Under Sequences

As an application of the uniform central limit theorem, consider the empirical process based on triangular arrays. For each $n$, let $X_{n 1}, \ldots, X_{n n}$ be i.i.d. according to a probability measure $P_{n}$, and set

$$
\mathbb{P}_{n}=\sum_{i=1}^{n} \delta_{X_{n i}}
$$

If the sequence of underlying measures $P_{n}$ converges to a measure $P_{0}$ in a suitable sense, then we may hope to derive that the sequence $\mathbb{G}_{n, P_{n}}= \sqrt{n}\left(\mathbb{P}_{n}-P_{n}\right)$ converges in distribution to $\mathbb{G}_{P_{0}}$ in $\ell^{\infty}(\mathcal{F})$. According to the general results on weak convergence to Gaussian processes, this is equivalent to marginal convergence plus $\mathcal{F}$ being totally bounded and the sequence $\mathbb{G}_{n, P_{n}}$ being asymptotically uniformly equicontinuous, both with respect to $\rho_{P_{0}}$. Suppose that the $\rho_{P_{n}}$ semimetrics converge uniformly to $\rho_{P_{0}}$ in the sense that

$$
\begin{equation*}
\sup _{f, g \in \mathcal{F}}\left|\rho_{P_{n}}(f, g)-\rho_{P_{0}}(f, g)\right| \rightarrow 0 \tag{2.8.5}
\end{equation*}
$$

Then asymptotic equicontinuity for $\rho_{P_{0}}$ follows from asymptotic equicontinuity "for the sequence $\rho_{P_{n}}$," defined as

$$
\lim _{\delta \downarrow 0} \limsup _{n \rightarrow \infty} \mathrm{P}_{P_{n}}^{*}\left(\sup _{\rho_{P_{n}}(f, g)<\delta}\left|\mathbb{G}_{n, P_{n}}(f)-\mathbb{G}_{n, P_{n}}(g)\right|>\varepsilon\right)=0 .
$$

In particular, it suffices that $\mathcal{F}$ be asymptotically equicontinuous uniformly in the set $\left\{P_{m}\right\}$. This is in turn implied by $\mathcal{F}$ being Donsker and preGaussian uniformly in $\left\{P_{m}\right\}$.

For marginal convergence, we can apply the Lindeberg central limit theorem. Pointwise convergence of $\rho_{P_{n}}$ to $\rho_{P_{0}}$ means exactly that the covariance functions of the $\mathbb{G}_{n, P_{n}}$ converge to the desired limit. The Lindeberg condition for the sequence $\mathbb{G}_{n, P_{n}} f$ is certainly implied by

$$
\begin{equation*}
\limsup _{n \rightarrow \infty} P_{n} F^{2}\{F \geq \varepsilon \sqrt{n}\}=0, \quad \text { for every } \varepsilon>0 \tag{2.8.6}
\end{equation*}
$$

One possible conclusion is that $\mathcal{F}$ being uniformly Donsker and preGaussian in the sequence $\left\{P_{m}\right\}$ together with (2.8.5) and (2.8.6) is sufficient for the convergence $\mathbb{G}_{n, P_{n}} \rightsquigarrow \mathbb{G}_{P_{0}}$. It is of interest that under the same conditions the Gaussian limit distributions are continuous in the underlying measure.
2.8.7 Lemma. Let $\mathcal{F}$ be Donsker and pre-Gaussian uniformly in the sequence $\left\{P_{m}\right\}$, and let (2.8.5) and (2.8.6) hold. Then $\mathbb{G}_{n, P_{n}} \leadsto \mathbb{G}_{P_{0}}$ in $\ell^{\infty}(\mathcal{F})$.
2.8.8 Lemma. Let $\mathcal{F}$ be pre-Gaussian uniformly in the sequence $\left\{P_{m}\right\}$, and let (2.8.5) hold. Then $\mathbb{G}_{P_{n}} \rightsquigarrow \mathbb{G}_{P_{0}}$ in $\ell^{\infty}(\mathcal{F})$.

Proofs. The first lemma was argued earlier (under slightly weaker conditions). (Inspection of the proof shows that the implication (i) ⇒ (ii) of Theorem 2.8.2 is valid without uniform integrability of the envelope.)

For the second lemma, first note that pointwise convergence of the covariance functions and zero-mean normality of each $\mathbb{G}_{P}$ imply marginal convergence. The uniform pre-Gaussianity gives

$$
\lim _{\delta \downarrow 0} \limsup _{n \rightarrow \infty} \mathrm{P}_{P_{n}}\left(\sup _{\rho_{P_{n}}(f, g)<\delta}\left|\mathbb{G}_{P_{n}}(f)-\mathbb{G}_{P_{n}}(g)\right|>\varepsilon\right)=0 .
$$

By the uniform convergence of $\rho_{P_{n}}$ to $\rho_{P_{0}}$, this is then also true with $\rho_{P_{n}}$ replaced by $\rho_{P_{0}}$. The uniform pre-Gaussianity implies uniform total boundedness of $\mathcal{F}$ by Theorem 2.8.3, which together with (2.8.5) implies total boundedness for $\rho_{P_{0}}$. Finally, apply Theorems 1.5.4 and 1.5.7.

The uniform Donsker and pre-Gaussian property in the first lemma could be established by the uniform entropy condition or by a bracketing condition. For easy reference we formulate two easily applicable Donsker theorems for sequences. They are proved as the uniform Donsker theorems 2.8.3 and 2.8.4. Alternatively, compare Theorems 2.11.1 and 2.11.9 or Example 2.14.4.
2.8.9 Theorem. Let $\mathcal{F}$ be a class of measurable functions with a measurable envelope function $F$ such that $\mathcal{F}_{\delta, P_{n}}=\left\{f-g: f, g \in \mathcal{F},\|f-g\|_{P_{n}, 2}<\delta\right\}$ and $\mathcal{F}_{\infty}^{2}=\left\{(f-g)^{2}: f, g \in \mathcal{F}\right\}$ are $P_{n}$-measurable for every $\delta>0$ and $n$. Furthermore, suppose that $\mathcal{F}$ satisfies the uniform entropy condition, that $P_{n} F^{2}=O(1)$ and that (2.8.5) and (2.8.6) hold. Then $\mathbb{G}_{n, P_{n}} \rightsquigarrow \mathbb{G}_{P_{0}}$ in $\ell^{\infty}(\mathcal{F})$.
2.8.10 Theorem. Let $\mathcal{F}$ be a class of measurable functions, with a measurable envelope function $F$, that is totally bounded for $\rho_{P_{0}}$, satisfies (2.8.5) and (2.8.6), and is such that

$$
\int_{0}^{\delta_{n}} \sqrt{\log N_{[]}\left(\varepsilon, \mathcal{F}, L_{2}\left(P_{n}\right)\right)} d \varepsilon \rightarrow 0, \quad \text { for every } \delta_{n} \downarrow 0
$$

Then $\mathbb{G}_{n, P_{n}} \leadsto \mathbb{G}_{P_{0}}$ in $\ell^{\infty}(\mathcal{F})$.

## Problems and Complements

1. Suppose $\rho_{P_{n}} \rightarrow \rho_{P_{0}}$ uniformly on $\mathcal{F} \times \mathcal{F}$. Then $\mathcal{F}$ is totally bounded for $\rho_{P_{0}}$ if and only if, for every $\varepsilon>0$, there exists an $N$ such that $\sup _{n \geq N} N\left(\varepsilon, \mathcal{F}, \rho_{P_{n}}\right)<\infty$.

## 2.9

## Multiplier Central Limit Theorems

With the notation $Z_{i}=\delta_{X_{i}}-P$, the empirical central limit theorem can be written

$$
\frac{1}{\sqrt{n}} \sum_{i=1}^{n} Z_{i} \rightsquigarrow \mathbb{G},
$$

in $\ell^{\infty}(\mathcal{F})$, where $\mathbb{G}$ is a (tight) Brownian bridge. Given i.i.d. real-valued random variables $\xi_{1}, \ldots, \xi_{n}$, which are independent of $Z_{1}, \ldots, Z_{n}$, the multiplier central limit theorem asserts that

$$
\frac{1}{\sqrt{n}} \sum_{i=1}^{n} \xi_{i} Z_{i} \rightsquigarrow \mathbb{G} .
$$

If the $\xi_{i}$ have mean zero, have variance 1 , and satisfy a moment condition, then the multiplier central limit theorem is true if and only if $\mathcal{F}$ is Donsker: in that case, the two displays are equivalent.

A more refined and deeper result is the conditional multiplier central limit theorem, according to which

$$
\frac{1}{\sqrt{n}} \sum_{i=1}^{n} \xi_{i} Z_{i} \rightsquigarrow \mathbb{G},
$$

given almost every sequence $Z_{1}, Z_{2}, \ldots$. This more interesting assertion turns out to be true under only slightly stronger conditions. Next to this almost sure version, we also discuss a version in probability of the conditional central limit theorem.

The techniques developed in this chapter have applications to statistical problems, especially to the study of various ways of bootstrapping the empirical process (see Chapter 3.6). The results are also used in the proofs of Chapter 2.10.

It is unnecessary to make measurability assumptions on $\mathcal{F}$. However, as usual, outer expectations are understood relative to a product space. Throughout the section let $X_{1}, X_{2}, \ldots$ be defined as the coordinate projections on the "first" $\infty$ coordinates in the probability space ( $\mathcal{X}^{\infty} \times \mathcal{Z}, \mathcal{A}^{\infty} \times \mathcal{C}, P^{\infty} \times Q$ ), and let $\xi_{1}, \xi_{2}, \ldots$ depend on the last coordinate only.

The (unconditional) multiplier central limit theorem is a corollary of a symmetrization inequality, which complements the symmetrization inequalities for Rademacher variables obtained in Chapter 2.3. For a random variable $\xi$, set

$$
\|\xi\|_{2,1}=\int_{0}^{\infty} \sqrt{\mathrm{P}(|\xi|>x)} d x
$$

In spite of the notation, this is not a norm (but there exists a norm that is equivalent to $\|\cdot\|_{2,1}$ ). Finiteness of $\|\xi\|_{2,1}$ requires slightly more than a finite second moment, but it is implied by a finite $2+\varepsilon$ absolute moment (Problem 2.9.1).

In Chapter 2.3 it is shown that the norms of a given process $\sum Z_{i}$ and its symmetrized version $\sum \varepsilon_{i} Z_{i}$ are comparable in magnitude. The following lemma extends this comparison to the norm of a general multiplier process $\sum \xi_{i} Z_{i}$.
2.9.1 Lemma (Multiplier inequalities). Let $Z_{1}, \ldots, Z_{n}$ be i.i.d. stochastic processes with $\mathrm{E}^{*}\left\|Z_{i}\right\|_{\mathcal{F}}<\infty$ independent of the Rademacher variables $\varepsilon_{1}, \ldots, \varepsilon_{n}$. Then for every i.i.d. sample $\xi_{1}, \ldots, \xi_{n}$ of mean-zero random variables independent of $Z_{1}, \ldots, Z_{n}$, and any $1 \leq n_{0} \leq n$,

$$
\begin{aligned}
\frac{1}{2}\|\xi\|_{1} \mathrm{E}^{*}\left\|\frac{1}{\sqrt{n}} \sum_{i=1}^{n} \varepsilon_{i} Z_{i}\right\|_{\mathcal{F}} \leq & \mathrm{E}^{*}\left\|\frac{1}{\sqrt{n}} \sum_{i=1}^{n} \xi_{i} Z_{i}\right\|_{\mathcal{F}} \\
\leq & 2\left(n_{0}-1\right) \mathrm{E}^{*}\left\|Z_{1}\right\|_{\mathcal{F}} \mathrm{E} \max _{1 \leq i \leq n} \frac{\left|\xi_{i}\right|}{\sqrt{n}} \\
& +2 \sqrt{2}\|\xi\|_{2,1} \max _{n_{0} \leq k \leq n} \mathrm{E}^{*}\left\|\frac{1}{\sqrt{k}} \sum_{i=n_{0}}^{k} \varepsilon_{i} Z_{i}\right\|_{\mathcal{F}} .
\end{aligned}
$$

For symmetrically distributed variables $\xi_{i}$, the constants $1 / 2,2$, and $2 \sqrt{2}$ can all be replaced by 1 .

Proof. Define $\varepsilon_{1}, \ldots, \varepsilon_{n}$ as independent of $\xi_{1}, \ldots, \xi_{n}$ (on "their own" factor of a product probability space). If the $\xi_{i}$ are symmetrically distributed, then
the variables $\varepsilon_{i}\left|\xi_{i}\right|$ possess the same distribution as the $\xi_{i}$. In that case, the inequality on the left follows from

$$
\mathrm{E}^{*}\left\|\sum_{i=1}^{n} \varepsilon_{i} \mathrm{E}_{\xi}\left|\xi_{i}\right| Z_{i}\right\|_{\mathcal{F}} \leq \mathrm{E}^{*}\left\|\sum_{i=1}^{n} \varepsilon_{i}\left|\xi_{i}\right| Z_{i}\right\|_{\mathcal{F}}
$$

For the general case, let $\eta_{1}, \ldots, \eta_{n}$ be an independent copy of $\xi_{1}, \ldots, \xi_{n}$. Then $\left\|\xi_{i}\right\|_{1}=\mathrm{E}\left|\xi_{i}-\mathrm{E} \eta_{i}\right| \leq\left\|\xi_{i}-\eta_{i}\right\|_{1}$, so that $\left\|\xi_{i}\right\|_{1}$ can be replaced by $\left\|\xi_{i}-\eta_{i}\right\|_{1}$ in the left-hand side. Next, apply the inequality for symmetric variables to the variables $\xi_{i}-\eta_{i}$, and then use the triangle inequality to see that

$$
\mathrm{E}^{*}\left\|\sum_{i=1}^{n}\left(\xi_{i}-\eta_{i}\right) Z_{i}\right\|_{\mathcal{F}} \leq 2 \mathrm{E}^{*}\left\|\sum_{i=1}^{n} \xi_{i} Z_{i}\right\|_{\mathcal{F}}
$$

This concludes the proof of the inequality on the left.
Again assume that the $\xi_{i}$ are symmetrically distributed. Let $\tilde{\xi}_{1} \geq \cdots \geq \tilde{\xi}_{n}$ be the (reversed) order statistics of $\left|\xi_{1}\right|, \ldots,\left|\xi_{n}\right|$. By the definition of $Z_{1}, \ldots, Z_{n}$ as fixed functions of the coordinates on the product space ( $\mathcal{X}^{n}, \mathcal{B}^{n}$ ), it follows that for any fixed $\xi_{1}, \ldots, \xi_{n}$,

$$
\mathrm{E}_{\varepsilon} \mathrm{E}_{Z}^{*}\left\|\sum_{i=1}^{n} \varepsilon_{i}\left|\xi_{i}\right| Z_{i}\right\|_{\mathcal{F}}=\mathrm{E}_{\varepsilon} \mathrm{E}_{Z}^{*}\left\|\sum_{i=1}^{n} \varepsilon_{i} \tilde{\xi}_{i} Z_{i}\right\|_{\mathcal{F}}
$$

In view of Lemma 1.2.7, the joint outer expectation $\mathrm{E}^{*}$ can be replaced by $\mathrm{E}_{\xi} \mathrm{E}_{Z}^{*}$. Thus

$$
\begin{aligned}
\mathrm{E}^{*}\left\|\sum_{i=1}^{n} \xi_{i} Z_{i}\right\|_{\mathcal{F}} & =\mathrm{E}_{\xi, \varepsilon} \mathrm{E}_{Z}^{*}\left\|\sum_{i=1}^{n} \varepsilon_{i}\left|\xi_{i}\right| Z_{i}\right\|_{\mathcal{F}}=\mathrm{E}_{\xi, \varepsilon} \mathrm{E}_{Z}^{*}\left\|\sum_{i=1}^{n} \varepsilon_{i} \tilde{\xi}_{i} Z_{i}\right\|_{\mathcal{F}} \\
& \leq\left(n_{0}-1\right) \mathrm{E} \tilde{\xi}_{1} \mathrm{E}^{*}\left\|Z_{1}\right\|_{\mathcal{F}}+\mathrm{E}^{*}\left\|\sum_{i=n_{0}}^{n} \varepsilon_{i} \tilde{\xi}_{i} Z_{i}\right\|_{\mathcal{F}}
\end{aligned}
$$

Substitute $\tilde{\xi}_{i}=\sum_{k=i}^{n}\left(\tilde{\xi}_{k}-\tilde{\xi}_{k+1}\right)$ in the second term (with $\tilde{\xi}_{n+1}=0$ ) and change the order of summation in the resulting double sum to see that it is equal to

$$
\begin{aligned}
\mathrm{E}^{*}\left\|\sum_{i=n_{0}}^{n} \varepsilon_{i} \tilde{\xi}_{i} Z_{i}\right\|_{\mathcal{F}} & =\mathrm{E}^{*}\left\|\sum_{k=n_{0}}^{n}\left(\tilde{\xi}_{k}-\tilde{\xi}_{k+1}\right) \sum_{i=n_{0}}^{k} \varepsilon_{i} Z_{i}\right\|_{\mathcal{F}} \\
& \leq \mathrm{E} \sum_{k=n_{0}}^{n} \sqrt{k}\left(\tilde{\xi}_{k}-\tilde{\xi}_{k+1}\right) \max _{n_{0} \leq k \leq n} \mathrm{E}^{*}\left\|\frac{1}{\sqrt{k}} \sum_{i=n_{0}}^{k} \varepsilon_{i} Z_{i}\right\|_{\mathcal{F}} .
\end{aligned}
$$

For $\tilde{\xi}_{k+1}<t \leq \tilde{\xi}_{k}$, one has $k=\#\left(i:\left|\xi_{i}\right| \geq t\right)$. Thus the first expectation in the product can be written as

$$
\mathrm{E} \sum_{k=n_{0}}^{n} \int_{\tilde{\xi}_{k+1}}^{\tilde{\xi}_{k}} \sqrt{k} d t \leq \int_{0}^{\infty} \mathrm{E} \sqrt{\#\left(i:\left|\xi_{i}\right| \geq t\right)} d t \leq \int_{0}^{\infty} \sqrt{n \mathrm{P}\left(\left|\xi_{i}\right| \geq t\right)} d t
$$

by Jensen's inequality. This concludes the proof of the upper bound for symmetric variables.

For possibly asymmetric variables, first note that

$$
\mathrm{E}^{*}\left\|\frac{1}{\sqrt{n}} \sum_{i=1}^{n} \xi_{i} Z_{i}\right\|_{\mathcal{F}} \leq \mathrm{E}^{*}\left\|\frac{1}{\sqrt{n}} \sum_{i=1}^{n}\left(\xi_{i}-\eta_{i}\right) Z_{i}\right\|_{\mathcal{F}}
$$

Next apply the bound for symmetric variables to the variables $\xi_{i}-\eta_{i}$, and then use the triangle inequality and the "corrected" triangle inequality $\|\xi-\eta\|_{2,1} \leq 2 \sqrt{2}\|\xi\|_{2,1}$ (Problem 2.9.2).

For $n_{0}=1$, the preceding lemma gives the inequalities

$$
\begin{aligned}
\frac{1}{2}\|\xi\|_{1} \mathrm{E}^{*}\left\|\frac{1}{\sqrt{n}} \sum_{i=1}^{n} \varepsilon_{i} Z_{i}\right\|_{\mathcal{F}} & \leq \mathrm{E}^{*}\left\|\frac{1}{\sqrt{n}} \sum_{i=1}^{n} \xi_{i} Z_{i}\right\|_{\mathcal{F}} \\
& \leq 2 \sqrt{2}\|\xi\|_{2,1} \max _{1 \leq k \leq n} \mathrm{E}^{*}\left\|\frac{1}{\sqrt{k}} \sum_{i=1}^{k} \varepsilon_{i} Z_{i}\right\|_{\mathcal{F}} .
\end{aligned}
$$

For variables $\xi_{i}$ with range $[-1,1]$, the maximum in the right may be replaced by only its $n$th term (Problem 2.9.3), but this appears to be untrue in general. This simpler inequality obtained for $n_{0}=1$ is too weak to yield the following theorem.
2.9.2 Theorem. Let $\mathcal{F}$ be a class of measurable functions. Let $\xi_{1}, \ldots, \xi_{n}$ be i.i.d. random variables with mean zero, variance 1 , and $\|\xi\|_{2,1}<\infty$, independent of $X_{1}, \ldots, X_{n}$. Then the sequence $n^{-1 / 2} \sum_{i=1}^{n} \xi_{i}\left(\delta_{X_{i}}-P\right)$ converges to a tight limit process in $\ell^{\infty}(\mathcal{F})$ if and only if $\mathcal{F}$ is Donsker. In that case, the limit process is a $P$-Brownian bridge.

Proof. Since both the empirical processes $n^{-1 / 2} \sum_{i=1}^{n}\left(\delta_{X_{i}}-P\right)$ and the multiplier processes $n^{-1 / 2} \sum_{i=1}^{n} \xi_{i}\left(\delta_{X_{i}}-P\right)$ do not change if indexed by the class of functions $\{f-P f: f \in \mathcal{F}\}$ instead of $\mathcal{F}$, it may be assumed without loss of generality that $P f=0$ for every $f$. Marginal convergence of both sequences of processes is equivalent to $\mathcal{F} \subset \mathcal{L}_{2}(P)$. It suffices to show that the asymptotic equicontinuity conditions for the empirical and the multiplier processes are equivalent.

If $\mathcal{F}$ is Donsker, then $P^{*}(F>x)=o\left(x^{-2}\right)$ as $x \rightarrow \infty$ by Lemma 2.3.9. By the same lemma convergence of the multiplier processes to a tight limit implies that $P^{*}(|\xi F|>x)=o\left(x^{-2}\right)$. In particular, $P^{*} F<\infty$ in both cases.

Since the assumption $\|\xi\|_{2,1}<\infty$ implies the existence of a second moment, we have $\mathrm{E}^{*} \max _{1 \leq i \leq n}\left|\xi_{i}\right| / \sqrt{n} \rightarrow 0$. Combination with the multiplier
inequalities, Lemma 2.9.1, gives

$$
\begin{aligned}
\frac{1}{2}\|\xi\|_{1} \limsup _{n \rightarrow \infty} \mathrm{E}^{*}\left\|\frac{1}{\sqrt{n}} \sum_{i=1}^{n} \varepsilon_{i} Z_{i}\right\|_{\mathcal{F}_{\delta}} & \leq \limsup _{n \rightarrow \infty} \mathrm{E}^{*}\left\|\frac{1}{\sqrt{n}} \sum_{i=1}^{n} \xi_{i} Z_{i}\right\|_{\mathcal{F}_{\delta}} \\
& \leq 2 \sqrt{2}\|\xi\|_{2,1} \sup _{n_{0} \leq k} \mathrm{E}^{*}\left\|\frac{1}{\sqrt{k}} \sum_{i=1}^{k} \varepsilon_{i} Z_{i}\right\|_{\mathcal{F}_{\delta}}
\end{aligned}
$$

for every $n_{0}$ and $\delta>0$. By Lemma 2.3.6, the Rademacher variables can be deleted in this statement at the cost of changing the constants. Conclude that $\mathrm{E}^{*}\left\|n^{-1 / 2} \sum_{i=1}^{n} Z_{i}\right\|_{\mathcal{F}_{\delta_{n}}} \rightarrow 0$ if and only if $\mathrm{E}^{*}\left\|n^{-1 / 2} \sum_{i=1}^{n} \xi_{i} Z_{i}\right\|_{\mathcal{F}_{\delta_{n}}} \rightarrow 0$. These are the mean versions of the asymptotic equicontinuity conditions. By Lemma 2.3.11, these are equivalent to the probability versions.

Under the conditions of the preceding theorem, the sequence

$$
\left(\frac{1}{\sqrt{n}} \sum_{i=1}^{n}\left(\delta_{X_{i}}-P\right), \frac{1}{\sqrt{n}} \sum_{i=1}^{n} \xi_{i}\left(\delta_{X_{i}}-P\right)\right)
$$

is jointly asymptotically tight. Since the two coordinates are uncorrelated and the joint marginals converge to multivariate normal distributions, the sequence converges jointly to a vector of two independent Brownian bridges.
2.9.3 Corollary. Under the conditions of the preceding theorem, the sequence of processes $\left(n^{-1 / 2} \sum_{i=1}^{n}\left(\delta_{X_{i}}-P\right), n^{-1 / 2} \sum_{i=1}^{n} \xi_{i}\left(\delta_{X_{i}}-P\right)\right)$ converges in $\ell^{\infty}(\mathcal{F}) \times \ell^{\infty}(\mathcal{F})$ in distribution to a vector $\left(\mathbb{G}, \mathbb{G}^{\prime}\right)$ of independent (tight) Brownian bridges $\mathbb{G}$ and $\mathbb{G}^{\prime}$.

An additional corollary applies when the multipliers $\xi_{i}$ do not have mean zero. Let $\mathrm{E} \xi_{i}=\mu$ and $\operatorname{var} \xi_{i}=\sigma^{2}$. Simple algebra gives

$$
\begin{aligned}
& \frac{1}{\sqrt{n}} \sum_{i=1}^{n}\left(\xi_{i} \delta_{X_{i}}-\mu P\right) \\
& \quad=\frac{\mu}{\sqrt{n}} \sum_{i=1}^{n}\left(\delta_{X_{i}}-P\right)+\frac{\sigma}{\sqrt{n}} \sum_{i=1}^{n}\left(\frac{\xi_{i}-\mu}{\sigma}\right)\left(\delta_{X_{i}}-P\right)+\sqrt{n}\left(\bar{\xi}_{n}-\mu\right) P
\end{aligned}
$$

The first two terms on the right converge weakly if and only if $\mathcal{F}$ is Donsker; the third is in $\ell^{\infty}(\mathcal{F})$ if and only if $\|P\|_{\mathcal{F}}<\infty$; in that case, it converges.
2.9.4 Corollary. Let $\mathcal{F}$ be Donsker with $\|P\|_{\mathcal{F}}<\infty$. Let $\xi_{1}, \ldots, \xi_{n}$ be i.i.d. random variables with mean $\mu$, variance $\sigma^{2}$, and $\left\|\xi_{i}\right\|_{2,1}<\infty$, independent of $X_{1}, \ldots, X_{n}$. Then

$$
\frac{1}{\sqrt{n}} \sum_{i=1}^{n}\left(\xi_{i} \delta_{X_{i}}-\mu P\right) \rightsquigarrow \mu \mathbb{G}+\sigma \mathbb{G}^{\prime}+\sigma Z P,
$$

where $\mathbb{G}$ and $\mathbb{G}^{\prime}$ are independent (tight) Brownian bridges and are independent of the random variable $Z$, which is standard normally distributed. The limit process $\mu \mathbb{G}+\sigma \mathbb{G}^{\prime}+\sigma Z P$ is a Gaussian process with zero mean and covariance function $\left(\sigma^{2}+\mu^{2}\right) P f g-\mu^{2} P f P g$.

Next consider conditional multiplier central limit theorems. For finite $\mathcal{F}$, the almost sure version is a simple consequence of the Lindeberg theorem.
2.9.5 Lemma. Let $Z_{1}, Z_{2}, \ldots$ be i.i.d. Euclidean random vectors with $\mathrm{E} Z_{i}=0$ and $\mathrm{E}\left\|Z_{i}\right\|^{2}<\infty$ independent of the i.i.d. sequence $\xi_{1}, \xi_{2}, \ldots$, with $\mathrm{E} \xi_{i}=0$ and $\mathrm{E} \xi_{i}^{2}=1$. Then, conditionally on $Z_{1}, Z_{2}, \ldots$,

$$
\frac{1}{\sqrt{n}} \sum_{i=1}^{n} \xi_{i} Z_{i} \rightsquigarrow N\left(0, \operatorname{cov} Z_{1}\right),
$$

for almost every sequence $Z_{1}, Z_{2}, \ldots$.

Proof. According to the Lindeberg central limit theorem, the statement is true for every sequence $Z_{1}, Z_{2}, \ldots$ such that, for every $\varepsilon>0$,

$$
\frac{1}{n} \sum_{i=1}^{n} Z_{i} Z_{i}^{\prime} \rightarrow \operatorname{cov} Z_{1} ; \quad \frac{1}{n} \sum_{i=1}^{n}\left\|Z_{i}\right\|^{2} \mathrm{E}_{\xi} \xi_{i}^{2}\left\{\left|\xi_{i}\right|\left\|Z_{i}\right\|>\varepsilon \sqrt{n}\right\} \rightarrow 0 .
$$

The first condition is true for almost all sequences by the law of large numbers. Furthermore, a finite second moment, $\mathrm{E}\left\|Z_{i}\right\|^{2}<\infty$, implies that $\max _{1 \leq i \leq n}\left\|Z_{i}\right\| / \sqrt{n} \rightarrow 0$ for almost all sequences. For the intersection of the two sets of sequences, both conditions are satisfied.

The preceding lemma takes care of marginal convergence in the conditional multiplier central limit theorems. For convergence in $\ell^{\infty}(\mathcal{F})$, it suffices to check asymptotic equicontinuity.

Conditional weak convergence in probability must be formulated in terms of a metric on conditional laws. Since "conditional laws" do not exist without proper measurability, we utilize the bounded dual Lipschitz distance based on outer expectations. In Chapter 1.12 it is shown that weak convergence, $G_{n} \leadsto G$, of a sequence of random elements, $G_{n}$ in $\ell^{\infty}(\mathcal{F})$, to a separable limit, $G$, is equivalent to

$$
\sup _{h \in \mathrm{BL}_{1}}\left|\mathrm{E}^{*} h\left(G_{n}\right)-\mathrm{E} h(G)\right| \rightarrow 0 .
$$

Here $\mathrm{BL}_{1}$ is the set of all functions $h: \ell^{\infty}(\mathcal{F}) \mapsto[0,1]$ such that $\mid h\left(z_{1}\right)- h\left(z_{2}\right) \mid \leq\left\|z_{1}-z_{2}\right\|_{\mathcal{F}}$ for every $z_{1}, z_{2}$.
2.9.6 Theorem. Let $\mathcal{F}$ be a class of measurable functions. Let $\xi_{1}, \ldots, \xi_{n}$ be i.i.d. random variables with mean zero, variance 1 , and $\|\xi\|_{2,1}<\infty$, independent of $X_{1}, \ldots, X_{n}$. Let $\mathbb{G}_{n}^{\prime}=n^{-1 / 2} \sum_{i=1}^{n} \xi_{i}\left(\delta_{X_{i}}-P\right)$. Then the following assertions are equivalent:
(i) $\mathcal{F}$ is Donsker;
(ii) $\sup _{h \in \mathrm{BL}_{1}}\left|\mathrm{E}_{\xi} h\left(\mathbb{G}_{n}^{\prime}\right)-\mathrm{E} h(\mathbb{G})\right| \rightarrow 0$ in outer probability, and the sequence $\mathbb{G}_{n}^{\prime}$ is asymptotically measurable.

Proof. (i) ⇒ (ii). For a Donsker class $\mathcal{F}$, the sequence $\mathbb{G}_{n}^{\prime}$ converges in distribution to a Brownian bridge process by the unconditional multiplier theorem, Theorem 2.9.2. Thus, it is asymptotically measurable.

A Donsker class is totally bounded for $\rho_{P}$. For each fixed $\delta>0$ and $f \in \mathcal{F}$, let $\Pi_{\delta} f$ denote a closest element in a given, finite $\delta$-net for $\mathcal{F}$. By continuity of the limit process $\mathbb{G}$, we have $\mathbb{G} \circ \Pi_{\delta} \rightarrow \mathbb{G}$ almost surely, as $\delta \downarrow 0$. Hence, it is certainly true that

$$
\sup _{h \in \mathrm{BL}_{1}}\left|\mathrm{E} h\left(\mathbb{G} \circ \Pi_{\delta}\right)-\mathrm{E} h(\mathbb{G})\right| \rightarrow 0
$$

Second, by the preceding lemma, as $n \rightarrow \infty$ and for every fixed $\delta>0$,

$$
\sup _{h \in \mathrm{BL}_{1}}\left|\mathrm{E}_{\xi} h\left(\mathbb{G}_{n}^{\prime} \circ \Pi_{\delta}\right)-\mathrm{E} h\left(\mathbb{G} \circ \Pi_{\delta}\right)\right| \rightarrow 0
$$

for almost every sequence $X_{1}, X_{2}, \ldots$ (To see this, define $A: \mathbb{R}^{p} \mapsto \ell^{\infty}(\mathcal{F})$ by $A y(f)=y_{i}$ if $\Pi_{\delta} f=f_{i}$. Then $h\left(\mathbb{G} \circ \Pi_{\delta}\right)=g\left(\mathbb{G}\left(f_{1}\right), \ldots, \mathbb{G}\left(f_{p}\right)\right)$, for the function $g$ defined by $g(y)=h(A y)$. If $h$ is bounded Lipschitz on $\ell^{\infty}(\mathcal{F})$, then $g$ is bounded Lipschitz on $\mathbb{R}^{p}$ with a smaller bounded Lipschitz norm.) Since $\mathrm{BL}_{1}\left(\mathbb{R}^{p}\right)$ is separable for the topology of uniform convergence on compacta, the supremum in the preceding display can be replaced by a countable supremum. It follows that the variable in the display is measurable, because $h\left(\mathbb{G}_{n}^{\prime} \circ \Pi_{\delta}\right)$ is measurable. Third,

$$
\begin{aligned}
\sup _{h \in \mathrm{BL}_{1}}\left|\mathrm{E}_{\xi} h\left(\mathbb{G}_{n}^{\prime} \circ \Pi_{\delta}\right)-\mathrm{E}_{\xi} h\left(\mathbb{G}_{n}^{\prime}\right)\right| & \leq \sup _{h \in \mathrm{BL}_{1}} \mathrm{E}_{\xi}\left|h\left(\mathbb{G}_{n}^{\prime} \circ \Pi_{\delta}\right)-h\left(\mathbb{G}_{n}^{\prime}\right)\right| \\
& \leq \mathrm{E}_{\xi}\left\|\mathbb{G}_{n}^{\prime} \circ \Pi_{\delta}-\mathbb{G}_{n}^{\prime}\right\|_{\mathcal{F}}^{*} \leq \mathrm{E}_{\xi}\left\|\mathbb{G}_{n}^{\prime}\right\|_{\mathcal{F}_{\delta}}^{*}
\end{aligned}
$$

where $\mathcal{F}_{\delta}$ is the class $\left\{f-g: \rho_{P}(f-g)<\delta\right\}$. Thus, the outer expectation of the left side is bounded above by $\mathrm{E}^{*}\left\|\mathbb{G}_{n}^{\prime}\right\|_{\mathcal{F}_{\delta}}$. As in the proof of Theorem 2.9.2, we can use the multiplier inequalities of Lemma 2.9.1 to see that the latter expression converges to zero as $n \rightarrow \infty$ followed by $\delta \rightarrow 0$. Combine this with the previous displays to obtain one-half of the theorem.
(ii) ⇒ (i). Letting $h\left(\mathbb{G}_{n}^{\prime}\right)^{*}$ and $h\left(\mathbb{G}_{n}^{\prime}\right)_{*}$ denote measurable majorants and minorants with respect to $\left(\xi_{1}, \ldots, \xi_{n}, X_{1}, \ldots, X_{n}\right)$ jointly, we have, by the triangle inequality and Fubini's theorem,

$$
\left|\mathrm{E}^{*} h\left(\mathbb{G}_{n}^{\prime}\right)-\mathrm{E} h(\mathbb{G})\right| \leq\left|\mathrm{E}_{X} \mathrm{E}_{\xi} h\left(\mathbb{G}_{n}^{\prime}\right)^{*}-\mathrm{E}_{X}^{*} \mathrm{E}_{\xi} h\left(\mathbb{G}_{n}^{\prime}\right)\right|+\mathrm{E}_{X}^{*}\left|\mathrm{E}_{\xi} h\left(\mathbb{G}_{n}^{\prime}\right)-\mathrm{E} h(\mathbb{G})\right| .
$$

If (ii) holds, then, by dominated convergence, the second term on the right side converges to zero for every $h \in \mathrm{BL}_{1}$. The first term on the right is bounded above by $\mathrm{E}_{X} \mathrm{E}_{\xi} h\left(\mathbb{G}_{n}^{\prime}\right)^{*}-\mathrm{E}_{X} \mathrm{E}_{\xi} h\left(\mathbb{G}_{n}^{\prime}\right)_{*}$, which converges to zero if $\mathbb{G}_{n}^{\prime}$ is asymptotically measurable. Thus, (ii) implies that $\mathbb{G}_{n}^{\prime} \rightsquigarrow \mathbb{G}$ unconditionally. Then $\mathcal{F}$ is Donsker by the converse part of the unconditional multiplier theorem, Theorem 2.9.2.

It may be noted that the functions $\left(\xi_{1}, \ldots, \xi_{n}\right) \mapsto h\left(\mathbb{G}_{n}^{\prime}\right)$ are (Lipschitz) continuous, hence Borel measurable, for every given sequence $X_{1}, X_{2}, \ldots$ (under the assumption that $\|f(x)-P f\|_{\mathcal{F}}<\infty$ for every $x$, which is implicitly made to ensure that our processes take their values in $\left.\ell^{\infty}(\mathcal{F})\right)$. Thus, the expectations $\mathrm{E}_{\xi} h\left(\mathbb{G}_{n}^{\prime}\right)$ in the statement of the preceding theorem make sense even though they may be nonmeasurable functions of $\left(X_{1}, \ldots, X_{n}\right)$. The second assumption in (ii) implies that these functions are asymptotically measurable and appears to be necessary for the "easy" implication, (ii) ⇒ (i).

The almost sure version of the conditional central limit theorem asserts weak convergence of the sequence $\mathbb{G}_{n}^{\prime}=n^{-1 / 2} \sum_{i=1}^{n} \xi_{i}\left(\delta_{X_{i}}-P\right)$ given almost every sequence $X_{1}, X_{2}, \ldots$. It was seen in Example 1.9.4 that almost sure convergence without proper measurability may not mean much. Thus, it is more attractive to define almost sure conditional convergence by strengthening part (ii) of the preceding theorem. It will be shown that

$$
\sup _{h \in \mathrm{BL}_{1}}\left|\mathrm{E}_{\xi} h\left(\mathbb{G}_{n}^{\prime}\right)-\mathrm{E} h(\mathbb{G})\right| \xrightarrow{\mathrm{as} *} 0 .
$$

This implies that $\mathrm{E}_{\xi} h\left(\mathbb{G}_{n}^{\prime}\right) \rightarrow \mathrm{E} h(\mathbb{G})$ for every $h \in \mathrm{BL}_{1}$, for almost every sequence $X_{1}, X_{2}, \ldots$. By the portmanteau theorem, this is then also true for every continuous, bounded $h$. Thus, the sequence $\mathbb{G}_{n}^{\prime}$ converges in distribution to $\mathbb{G}$ given almost every sequence $X_{1}, X_{2}, \ldots$ also in a more naive sense of almost sure conditional convergence.
2.9.7 Theorem. Let $\mathcal{F}$ be a class of measurable functions. Let $\xi_{1}, \ldots, \xi_{n}$ be i.i.d. random variables with mean zero, variance 1 , and $\|\xi\|_{2,1}<\infty$, independent of $X_{1}, \ldots, X_{n}$. Define $\mathbb{G}_{n}^{\prime}=n^{-1 / 2} \sum_{i=1}^{n} \xi_{i}\left(\delta_{X_{i}}-P\right)$. Then the following assertions are equivalent:
(i) $\mathcal{F}$ is Donsker and $P^{*}\|f-P f\|_{\mathcal{F}}^{2}<\infty$;
(ii) $\sup _{h \in \mathrm{BL}_{1}}\left|\mathrm{E}_{\xi} h\left(\mathbb{G}_{n}^{\prime}\right)-\mathrm{E} h(\mathbb{G})\right| \rightarrow 0$ outer almost surely, and the sequence $\mathrm{E}_{\xi} h\left(\mathbb{G}_{n}^{\prime}\right)^{*}-\mathrm{E}_{\xi} h\left(\mathbb{G}_{n}^{\prime}\right)_{*}$ converges almost surely to zero for every $h \in \mathrm{BL}_{1}$. Here $h\left(\mathbb{G}_{n}^{\prime}\right)^{*}$ and $h\left(\mathbb{G}_{n}^{\prime}\right)_{*}$ denote measurable majorants and minorants with respect to $\left(\xi_{1}, \ldots, \xi_{n}, X_{1}, \ldots, X_{n}\right)$ jointly.

Proof. (i) ⇒ (ii). For the first assertion of (ii), the proof of the in probability conditional central limit theorem applies, except that it must be argued that $\mathrm{E}_{\xi}\left\|\mathbb{G}_{n}^{\prime}\right\|_{\mathcal{F}_{\delta}}^{*}$ converges to zero outer almost surely, as $n \rightarrow \infty$ followed
by $\delta \downarrow 0$. By Corollary 2.9.9,

$$
\underset{n \rightarrow \infty}{\limsup } \mathrm{E}_{\xi}\left\|\mathbb{G}_{n}^{\prime}\right\|_{\mathcal{F}_{\delta}}^{*} \leq 6 \sqrt{2} \underset{n \rightarrow \infty}{\limsup } \mathrm{E}^{*}\left\|\mathbb{G}_{n}^{\prime}\right\|_{\mathcal{F}_{\delta}}
$$

The right-hand side decreases to zero as $\delta \downarrow 0$, because $\mathbb{G}_{n}^{\prime} \leadsto \mathbb{G}$ unconditionally, by Theorem 2.9.2.

To see that the sequence $\mathrm{E}_{\xi} h\left(\mathbb{G}_{n}^{\prime}\right)$ is strongly asymptotically measurable, obtain first by the same proof, but with a star added, that

$$
\left|\mathrm{E}_{\xi} h\left(\mathbb{G}_{n}^{\prime}\right)^{*}-\mathrm{E} h(\mathbb{G})\right| \xrightarrow{\text { as* }} 0 .
$$

The same proof also shows that this is true with a lower star. Thus, the sequence $\mathrm{E}_{\xi} h\left(\mathbb{G}_{n}^{\prime}\right)^{*}-\mathrm{E}_{\xi} h\left(\mathbb{G}_{n}^{\prime}\right)_{*}$ converges to zero almost surely.
(ii) ⇒ (i). The class $\mathcal{F}$ is Donsker in view of the in probability conditional central limit theorem. We need to prove the condition on its envelope function. As in the proof of the portmanteau theorem, there exists a sequence of Lipschitz functions $h_{m}: \mathbb{R} \mapsto \mathbb{R}$ such that $1 \geq h_{m}\left(\|z\|_{\mathcal{F}}\right) \downarrow 1\left\{\|z\|_{\mathcal{F}} \geq t\right\}$ pointwise. By Lemma 1.2.2(vi),

$$
\mathrm{P}_{\xi}\left(\left\|\mathbb{G}_{n}^{\prime}\right\|_{\mathcal{F}}^{*}>t\right)=\mathrm{E}_{\xi} 1\left\{\left\|\mathbb{G}_{n}^{\prime}\right\|_{\mathcal{F}}>t\right\}^{*} \leq \mathrm{E}_{\xi} h_{m}\left(\left\|\mathbb{G}_{n}^{\prime}\right\|_{\mathcal{F}}\right)^{*}
$$

Under assumption (ii), the right side converges to $\mathrm{E} h_{m}\left(\|\mathbb{G}\|_{\mathcal{F}}\right)$ almost surely as $n \rightarrow \infty$, for every fixed $m$. Conclude that

$$
\limsup _{n \rightarrow \infty} \mathrm{P}_{\xi}\left(\left\|\mathbb{G}_{n}^{\prime}\right\|_{\mathcal{F}}^{*}>t\right) \leq \mathrm{P}\left(\|\mathbb{G}\|_{\mathcal{F}} \geq t\right)
$$

Set $Z_{i}=\delta_{X_{i}}-P$. By the triangle inequality, $\left\|\xi_{n} Z_{n}\right\|_{\mathcal{F}}^{*} \leq \sqrt{n}\left\|\mathbb{G}_{n}^{\prime}\right\|_{\mathcal{F}}^{*}+ \sqrt{n-1}\left\|\mathbb{G}_{n-1}^{\prime}\right\|_{\mathcal{F}}^{*}$. Thus, for sufficiently large $t$,

$$
\limsup _{n \rightarrow \infty} \mathrm{P}_{\xi}\left(\left\|\xi_{n} Z_{n}\right\|_{\mathcal{F}}^{*}>t \sqrt{n}\right)<1, \quad \text { a.s. }
$$

Since $\xi_{n}$ is distributed as $\xi_{1}$, it follows that $\limsup \left\|Z_{n}\right\|_{\mathcal{F}}^{*} / \sqrt{n}<\infty$ almost surely. This implies $\mathrm{E}^{*}\left\|Z_{1}\right\|_{\mathcal{F}}<\infty$ (Problem 2.9.4).

The proof of the following lemma is based on isoperimetric inequalities for product measures, which is treated in Appendix A.4. The Problems section gives alternative proofs of similar results using more conventional methods.
2.9.8 Lemma. Let $Z_{1}, Z_{2}, \ldots$ be i.i.d. stochastic processes such that $\mathrm{E}^{*}\left\|Z_{1}\right\|_{\mathcal{F}}^{2}<\infty$. Let $\xi_{1}, \xi_{2}, \ldots$ be i.i.d. random variables with mean zero, independent of $Z_{1}, Z_{2}, \ldots$. Then there exists a constant $K$ such that, for every $t>0$,

$$
\sum_{n} \mathrm{P}\left(\mathrm{E}_{\xi}\left\|\sum_{i=1}^{2^{n}} \xi_{i} Z_{i}\right\|_{\mathcal{F}}^{*}>6 \mathrm{E}^{*}\left\|\sum_{i=1}^{2^{n}} \xi_{i} Z_{i}\right\|_{\mathcal{F}}+t 2^{n / 2}\right) \leq K \frac{\mathrm{E}^{*}\left\|Z_{1}\right\|_{\mathcal{F}}^{2}}{t^{2}}
$$

Here the star on the right denotes a measurable majorant with respect to the variables $\left(\xi_{1}, \ldots, \xi_{n}, Z_{1}, \ldots, Z_{n}\right)$ jointly.
2.9.9 Corollary. In the situation of the preceding lemma,

$$
\begin{aligned}
& \limsup _{n \rightarrow \infty} \mathrm{E}_{\xi}\left\|\frac{1}{\sqrt{n}} \sum_{i=1}^{n} \xi_{i} Z_{i}\right\|_{\mathcal{F}}^{*} \leq 6 \sqrt{2} \limsup _{n \rightarrow \infty} \mathrm{E}^{*}\left\|\frac{1}{\sqrt{n}} \sum_{i=1}^{n} \xi_{i} Z_{i}\right\|_{\mathcal{F}} \\
& \mathrm{E}_{n} \sup _{\xi} \mathrm{E}_{\xi}\left\|\frac{1}{\sqrt{n}} \sum_{i=1}^{n} \xi_{i} Z_{i}\right\|_{\mathcal{F}}^{*} \leq C \sup _{n} \mathrm{E}^{*}\left\|\frac{1}{\sqrt{n}} \sum_{i=1}^{n} \xi_{i} Z_{i}\right\|_{\mathcal{F}}+C \sqrt{\mathrm{E}^{*}\left\|Z_{1}\right\|_{\mathcal{F}}^{2}}
\end{aligned}
$$

for a universal constant $C$.
Proofs. Abbreviate $S_{n}=\mathrm{E}_{\xi}\left\|\sum_{i=1}^{n} \xi_{i} Z_{i}\right\|_{\mathcal{F}}^{*}$. Fix $n$, and let $Z_{[1]}, \ldots, Z_{\left[2^{n}\right]}$ be the processes $Z_{1}, \ldots, Z_{2^{n}}$ ordered by decreasing norms $\left\|Z_{[i]}\right\|_{\mathcal{F}}^{*}$. Define the control number $f\left(A, A, A, Z_{1}, \ldots, Z_{2^{n}}\right)$ as in Appendix A. 4 for the event $A=\left\{S_{2^{n}} \leq 2 \mathrm{E} S_{2^{n}}\right\}$. Then on the event $f(A, A, A, \vec{Z})<k$,

$$
S_{2^{n}} \leq \sum_{i=1}^{k-1}\left\|Z_{[i]}\right\|^{*}+6 \mathrm{E} S_{2^{n}}
$$

(See the explanation after the proof of Proposition A.4.1.) By Markov's inequality, the event $A$ has probability at least $1 / 2$. Combining this with Proposition A.4.1 yields, for every $k \geq 3$,

$$
\begin{aligned}
\mathrm{P}\left(S_{2^{n}}>6\right. & \left.\mathrm{E} S_{2^{n}}+t 2^{n / 2}\right) \leq\left(\frac{2}{3}\right)^{k}+\mathrm{P}\left(\sum_{i=1}^{k-1}\left\|Z_{[i]}\right\|^{*}>t 2^{n / 2}\right) \\
& \leq\left(\frac{2}{3}\right)^{k}+\mathrm{P}\left(\left\|Z_{[1]}\right\|^{*}>\frac{t}{2} 2^{n / 2}\right)+\mathrm{P}\left(k\left\|Z_{[2]}\right\|^{*}>\frac{t}{2} 2^{n / 2}\right) \\
& \lesssim\left(\frac{1}{k}\right)^{8}+\gamma_{n}\left(\frac{t}{2}\right)+\gamma_{n}^{2}\left(\frac{t}{2 k}\right) \wedge 1
\end{aligned}
$$

Here $\gamma_{n}(t)=2^{n} \mathrm{P}\left(\left\|Z_{1}\right\|_{\mathcal{F}}^{*}>t 2^{n / 2}\right)$, and the square arises from the binomial inequality of Problem 2.9.6. Let $\beta_{n}(t)=\sum_{l=0}^{\infty} \gamma_{n-l}(t) 2^{-l}$ be the convolution of the sequences $\gamma_{n}(t)$ and $(1 / 2)^{n}$. Then $\beta_{n}(t) \geq \gamma_{n-l}(t)(1 / 2)^{l}$ for any natural number $l$, whence $\gamma_{n}\left(t 2^{-l}\right)=2^{2 l} \gamma_{n-2 l}(t) \leq 2^{4 l} \beta_{n}(t)$. This readily yields that $\gamma_{n}(t / k) \lesssim k^{4} \beta_{n}(t)$ for every number $k \geq 3$. Use this inequality with the choice $k=\left\lfloor\beta_{n}(t)^{-1 / 8}\right\rfloor \vee 3$ to bound the last line of the preceding display up to a constant by

$$
\left(\frac{1}{k}\right)^{8}+\beta_{n}(t)+k^{8} \beta_{n}^{2}(t) \wedge 1 \lesssim \beta_{n}(t)
$$

The proof of the lemma is complete upon noting that $\sum \beta_{n}(t) \leq 2 \sum_{n=-\infty}^{\infty} \gamma_{n}(t)$, which in turn is bounded by a multiple of $\mathrm{E}^{*}\left\|Z_{1}\right\|_{\mathcal{F}}^{2} / t^{2}$.

Since the random variables $S_{n}$ are nondecreasing in $n$ by Jensen's inequality, we obtain

$$
\sup _{n \geq m} \frac{S_{n}}{\sqrt{n}} \leq \sqrt{2} \sup _{n \geq^{2} \log m} \frac{S_{2^{n}}}{2^{n / 2}}
$$


[^0]:    ${ }^{\mathrm{b}}$ It may be noted that the seminorm $\rho_{P}$ is the $L_{2}(P)$-norm of $f$ centered at its expectation (in fact, the standard deviation of $f\left(X_{i}\right)$ ). The centering is natural in view of the fact that the empirical process is invariant under the addition of constants to $\mathcal{F}$ : $\mathbb{G}_{n} f=\mathbb{G}_{n}(f-c)$ for every $c$. Under the condition that $\sup _{f \in \mathcal{F}}|P f|<\infty$, the seminorm $\rho_{P}$ can be replaced by the slightly simpler $L_{2}(P)$-seminorm without loss of generality (Problem 2.1.2).
    ${ }^{\sharp}$ In most of this part, the notation $\mathcal{F}_{\delta}$ means $\mathcal{F}_{\delta}=\{f-g: f, g \in \mathcal{F}, \rho(f-g)<\delta\}$, for $\rho$ equal to either the $L_{2}(P)$-semimetric or $\rho_{P}$.

[^1]:    * This section may be skipped at first reading.

[^2]:    ${ }^{\dagger}$ See Ledoux and Talagrand (1991), Theorem 10.10.

[^3]:    ‡ Separable may be understood in the sense that $\sup _{d(s, t)<\delta}\left|X_{s}-X_{t}\right|$ remains almost surely the same if the index set $T$ is replaced by a suitable countable subset.

[^4]:    * This section may be skipped at first reading.

[^5]:    * This section may be skipped at first reading.

[^6]:    * This section may be skipped at first reading.

[^7]:    ${ }^{\mathrm{b}}$ The formal definition appears to leave the index of the collection $2^{\mathcal{X}}$ of all subsets of a finite set $\mathcal{X}$ undefined. The definition $V\left(2^{\mathcal{X}}\right)=|\mathcal{X}|+1$ appears to be in agreement with the definition in words. (No sets of size $|\mathcal{X}|+1$ are shattered, because there are no such sets.) With this definition the results in this section are true (but uninteresting).

[^8]:    \# The form of this definition is different from the definitions given by other authors. However, it can be shown to lead to the same concept. See Problems 2.6.10 and 2.6.11.

[^9]:    ${ }^{\dagger}$ Note the inconsistency in notation. The notation $\|\cdot\|_{\alpha}$ is used only with $\alpha<\infty$ to define the present classes of functions. The notation $\|\cdot\|_{\infty}$ always denotes the supremum norm.

[^10]:    ${ }^{\ddagger}$ This is not trivial, although it is intuitively clear.

