$\mathbb{G} \circ F$, where $\mathbb{G}$ is a standard Brownian bridge. Since $F$ is continuous at $F^{-1}(p)$, almost all the sample paths of this process are continuous at the point $F^{-1}(p)$. Thus, the delta-method yields

$$
\sqrt{n}\left(\mathbb{F}_{n}^{-1}(p)-F^{-1}(p)\right) \rightsquigarrow \phi_{F}^{\prime}(\mathbb{G} \circ F)=-\frac{\mathbb{G}(p)}{f\left(F^{-1}(p)\right)} .
$$

This variable on the right is zero-mean normally distributed with its variance given by $p(1-p) / f^{2}\left(F^{-1}(p)\right)$.
3.9.22 Example. While the delta-method yields an elegant proof of the asymptotic normality of the empirical quantile function, this result can easily be obtained directly. The real attraction of the delta-method is that it separates the analysis and the probability and can be applied without much work in a variety of situations. In the preceding derivation, the empirical distribution can be replaced by any estimator $\tilde{F}_{n}$ such that the sequence $\sqrt{n}\left(\tilde{F}_{n}-F\right)$ converges weakly in $D[a, b]$ for an interval $[a, b]$ that contains $F^{-1}(p)$ as an interior point. The estimator $\tilde{F}_{n}$ need not be based on an i.i.d. sample, and $F$ may be an arbitrary centering function.

Two concrete applications are the inverse of the Nelson-Aalen estimator and the quantiles of the Kaplan-Meier estimator (see Examples 3.9.19 and 3.9.31).

Next consider the inverse function $\phi(F)=F^{-1}$ as a map from the set of distribution functions into the space $\ell^{\infty}(p, q)$ for given $0<p<q<$ 1. For definiteness, let $F^{-1}$ denote the left-continuous inverse $F^{-1}(p)= \inf \{t: F(t) \geq p\}$. Given an interval $[a, b] \subset \mathbb{R}$ let $\mathbb{D}_{1}$ be the set of all restrictions of distribution functions on $\mathbb{R}$ to $[a, b]$ and let $\mathbb{D}_{2}$ be the subset of $\mathbb{D}_{1}$ of distribution functions of measures that concentrate on $(a, b]$.

### 3.9.23 Lemma.

(i) Let $0<p<q<1$, and let $F$ be continuously differentiable on the interval $[a, b]=\left[F^{-1}(p)-\varepsilon, F^{-1}(q)+\varepsilon\right]$ for some $\varepsilon>0$, with strictly positive derivative $f$. Then the inverse map $G \mapsto G^{-1}$ as a map $\mathbb{D}_{1} \subset D[a, b] \mapsto \ell^{\infty}[p, q]$ is Hadamard-differentiable at $F$ tangentially to $C[a, b]$.
(ii) Let $F$ have compact support $[a, b]$ and be continuously differentiable on its support with strictly positive derivative $f$. Then the inverse map $G \mapsto G^{-1}$ as a map $\mathbb{D}_{2} \subset D[a, b] \mapsto \ell^{\infty}(0,1)$ is Hadamard-differentiable at $F$ tangentially to $C[a, b]$.
In both cases the derivative is the map $\alpha \mapsto-(\alpha / f) \circ F^{-1}$.
Proof. The proof follows the same pattern as the proof for the preceding lemma, but with care to keep the needed uniformity in $p$. We give the proof of (ii) only.

Let $\alpha_{t} \rightarrow \alpha$ uniformly in $D[a, b]$, where $\alpha$ is continuous and $F+t \alpha_{t}$ is contained in $\mathbb{D}_{2}$ for all $t$. Abbreviate $F^{-1}(p)$ and $\left(F+t \alpha_{t}\right)^{-1}(p)$ to $\xi_{p}$ and $\xi_{p t}$, respectively. Since $F$ and $F+t \alpha_{t}$ are concentrated on $(a, b]$ (by assumption), we have $a<\xi_{p t}, \xi_{p} \leq b$ for all $0<p<1$. Thus the numbers $\varepsilon_{p t}=t^{2} \wedge\left(\xi_{p t}-a\right)$ are positive, whence by definition

$$
\left(F+t \alpha_{t}\right)\left(\xi_{p t}-\varepsilon_{p t}\right) \leq p \leq\left(F+t \alpha_{t}\right)\left(\xi_{p t}\right) .
$$

By the smoothness of $F$ we have $F\left(\xi_{p}\right)=p$ and $F\left(\xi_{p t}-\varepsilon_{p t}\right)=F\left(\xi_{p t}\right)+ O\left(\varepsilon_{p t}\right)$, uniformly in $0<p<1$. It follows that

$$
-t \alpha\left(\xi_{p t}\right)+o(t) \leq F\left(\xi_{p t}\right)-F\left(\xi_{p}\right) \leq-t \alpha\left(\xi_{p t}-\varepsilon_{p t}\right)+o(t)
$$

The $o(t)$-terms are uniform in $0<p<1$. The far left side and the far right side are $O(t)$, while the middle is bounded above and below by a constant times $\left|\xi_{p t}-\xi_{p}\right|$. Conclude that $\left|\xi_{p t}-\xi_{p}\right|=O(t)$, uniformly in $p$. Next, the lemma follows by the uniform differentiability of $F$.
3.9.24 Example (Empirical quantile process). Suppose that $F$ is a distribution function with continuous and positive derivative $f$ on the interval $\left[F^{-1}(p)-\varepsilon, F^{-1}(q)+\varepsilon\right]$ for some $\varepsilon>0$. The empirical distribution function $\mathbb{F}_{n}$ of an i.i.d. sample of size $n$ from $F$ satisfies $\sqrt{n}\left(\mathbb{F}_{n}-F\right) \rightsquigarrow \mathbb{G} \circ F$ in $D(\overline{\mathbb{R}})$ for a standard Brownian bridge $\mathbb{G}$. Almost all sample paths of the limit process are continuous on the interval $\left[F^{-1}(p)-\varepsilon, F^{-1}(q)+\varepsilon\right]$. Since the inverse map is Hadamard-differentiable at $F$ tangentially to the subspace of functions that are continuous on this interval, the delta-method yields

$$
\sqrt{n}\left(\mathbb{F}_{n}^{-1}-F^{-1}\right) \rightsquigarrow-\frac{\mathbb{G} \circ F\left(F^{-1}\right)}{f\left(F^{-1}\right)}, \quad \text { in } \ell^{\infty}[p, q] .
$$

The limit process is Gaussian with zero-mean and covariance function

$$
\frac{s \wedge t-s t}{f\left(F^{-1}(s)\right) f\left(F^{-1}(t)\right)}, \quad s, t \in \mathbb{R}
$$

The second part of the preceding lemma may be used to obtain uniform convergence of the whole quantile process for distributions with compact support and strictly positive, continuous density, such as the uniform distribution.

### 3.9.4.3 Composition

Let $g: \mathbb{R} \mapsto \mathbb{R}$ be a fixed map. Given an arbitrary set $\mathcal{X}$, consider the map $\phi: \ell^{\infty}(\mathcal{X}) \mapsto \ell^{\infty}(\mathcal{X})$ given by $\phi(A)(x)=g(A(x))$. The natural domain of this map is the set of elements of $\ell^{\infty}(\mathcal{X})$ that take their values in the domain of $g$.
3.9.25 Lemma. Let $g:(a, b) \subset \mathbb{R} \mapsto \mathbb{R}$ be differentiable with uniformly continuous and bounded derivative, and let $\mathbb{D}_{\phi}=\left\{A \in \ell^{\infty}(\mathcal{X}): a<A<\right. b\}$. Then the map $A \mapsto g \circ A$ is Hadamard-differentiable as a map $\mathbb{D}_{\phi} \subset \ell^{\infty}(\mathcal{X}) \mapsto \ell^{\infty}(\mathcal{X})$ at every $A \in \mathbb{D}_{\phi}$. The derivative is given by $\phi_{A}^{\prime}(\alpha)= g^{\prime}(A(x)) \alpha(x)$.
3.9.26 Example. The map $A \mapsto 1 / A$ is differentiable on the domain of functions that are bounded away from zero.

The proof of the preceding lemma is easy. Consider the more complicated composition map into which the function $g$, which is fixed in the preceding result, is a second variable. Given maps $A: \mathcal{X} \mapsto \mathcal{Y}$ and $B: \mathcal{Y} \mapsto \mathcal{Z}$ define the composition map $\phi(A, B): \mathcal{X} \mapsto \mathcal{Z}$, by

$$
\phi(A, B)(x)=B \circ A(x)=B(A(x)) .
$$

We shall assume that $\mathcal{Y}$ and $\mathcal{Z}$ are subsets of normed spaces. If $B$ is a uniformly norm-bounded map from $\mathcal{Y} \mapsto \mathcal{Z}$, then $\phi(A, B)$ is a uniformly norm-bounded map from $\mathcal{X} \mapsto \mathcal{Z}$. Consider $\phi$ as a map with domain $\ell^{\infty}(\mathcal{X}, \mathcal{Y}) \times \ell^{\infty}(\mathcal{Y}, \mathcal{Z})$ equipped with the norm $\|(A, B)\|_{\infty}=\sup _{x}\|A(x)\|_{\mathcal{Y}} \vee \sup _{y}\|B(y)\|_{\mathcal{Z}}$.
3.9.27 Lemma. Suppose that $B: \mathcal{Y} \mapsto \mathcal{Z}$ is Fréchet-differentiable uniformly in $y$ in the range of $A$ with derivatives $B_{y}^{\prime}$ such that $y \mapsto B_{y}^{\prime}$ is uniformly norm-bounded. ${ }^{\ddagger}$ Then the composition map $\phi: \ell^{\infty}(\mathcal{X}, \mathcal{Y}) \times \ell^{\infty}(\mathcal{Y}, \mathcal{Z}) \rightarrow \ell^{\infty}(\mathcal{X}, \mathcal{Z})$ is Hadamard-differentiable at ( $A, B$ ) tangentially to the set $\ell^{\infty}(\mathcal{X}, \mathcal{Y}) \times \operatorname{UC}(\mathcal{Y}, \mathcal{Z})$. The derivative is given by

$$
\phi_{A, B}^{\prime}(\alpha, \beta)(x)=\beta \circ A(x)+B_{A(x)}^{\prime}(\alpha(x)), \quad x \in \mathcal{X} .
$$

Proof. Let $\alpha_{t} \rightarrow \alpha$ and $\beta_{t} \rightarrow \beta$ in $\ell^{\infty}(\mathcal{X}, \mathcal{Y})$ and $\ell^{\infty}(\mathcal{Y}, \mathcal{Z})$, respectively. Write

$$
\begin{aligned}
& \frac{\left(B+t \beta_{t}\right) \circ\left(A+t \alpha_{t}\right)-B \circ A}{t}-\beta \circ A-B_{A}^{\prime}(\alpha) \\
& \quad=\left(\beta_{t}-\beta\right) \circ\left(A+t \alpha_{t}\right)+\beta\left(A+t \alpha_{t}\right)-\beta(A) \\
& \quad \quad+\frac{B\left(A+t \alpha_{t}\right)-B(A)}{t}-B_{A}^{\prime}\left(\alpha_{t}\right)+B_{A}^{\prime}\left(\alpha_{t}-\alpha\right) .
\end{aligned}
$$

The first term converges to zero in $\ell^{\infty}(\mathcal{X}, \mathcal{Z})$, since $\beta_{t} \rightarrow \beta$ uniformly in $y$. The second term converges to zero for every $\beta \in \operatorname{UC}(\mathcal{Y}, \mathcal{Z})$. The third term converges to zero by uniform Fréchet differentiability. The fourth term converges to zero since the map $y \mapsto B_{y}^{\prime}$ is norm-bounded.

[^0]
### 3.9.4.4 Copula Function

For a bivariate distribution function $H$, denote the marginals by $F(x)= H(x, \infty)$ and $G(y)=H(\infty, y)$. Consider the map $\phi$ from bivariate distribution functions $H$ on $\mathbb{R}^{2}$ to bivariate distribution functions on $[0,1]^{2}$ defined by

$$
\phi(H)(u, v)=H\left(F^{-1}(u), G^{-1}(v)\right), \quad(u, v) \in[0,1]^{2}
$$

Here $F^{-1}$ and $G^{-1}$ are the left-continuous quantile functions corresponding to the marginal distribution functions $F$ and $G$, respectively. The function $C=\phi(H)$ is called the copula function corresponding to $H$.
3.9.28 Lemma. Fix $0<p<q<1$, and suppose that $H$ is a distribution function on $\mathbb{R}^{2}$ with marginal distribution functions $F$ and $G$ that are continuously differentiable on the intervals $\left[F^{-1}(p)-\varepsilon, F^{-1}(q)+\varepsilon\right]$ and $\left[G^{-1}(p)-\varepsilon, G^{-1}(q)+\varepsilon\right]$ with positive derivatives $f$ and $g$, respectively, for some $\varepsilon>0$. Furthermore, assume that $\partial H / \partial x$ and $\partial H / \partial y$ exist and are continuous on the product of these intervals. Then the map $\phi: D\left(\overline{\mathbb{R}}^{2}\right) \mapsto \ell^{\infty}\left([p, q]^{2}\right)$ is Hadamard-differentiable at $H$ tangentially to $C\left(\overline{\mathbb{R}}^{2}\right)$. The derivative is given by

$$
\begin{aligned}
\phi_{H}^{\prime}(h)(u, v)=h & \left(F^{-1}(u), G^{-1}(v)\right) \\
& -\frac{\partial H}{\partial x}\left(F^{-1}(u), G^{-1}(v)\right) \frac{h\left(F^{-1}(u), \infty\right)}{f\left(F^{-1}(u)\right)} \\
& -\frac{\partial H}{\partial y}\left(F^{-1}(u), G^{-1}(v)\right) \frac{h\left(\infty, G^{-1}(v)\right)}{g\left(G^{-1}(v)\right)}
\end{aligned}
$$

Proof. Mapping a distribution function into its copula distribution can be decomposed as

$$
H \mapsto(H, F, G) \mapsto\left(H, F^{-1}, G^{-1}\right) \mapsto H \circ\left(F^{-1}, G^{-1}\right)
$$

The first map is linear and continuous, hence Hadamard-differentiable. The second map is Hadamard-differentiable by Section 3.9.4.2, and the third map is Hadamard-differentiable by the result of the preceding section, applied with $\mathcal{X}=[p, q]^{2}, \mathcal{Y}=\mathbb{R}^{2}$ and $\mathcal{Z}=\mathbb{R}$. The conclusion follows from the chain rule.
3.9.29 Example. Suppose that $\left(X_{1}, Y_{1}\right), \ldots,\left(X_{n}, Y_{n}\right)$ are i.i.d. vectors with distribution function $H$. The empirical estimator for the copula function $C(u, v)=H\left(F^{-1}(u), G^{-1}(v)\right)$ is

$$
\mathbb{C}_{n}(u, v)=\mathbb{H}_{n}\left(\mathbb{F}_{n}^{-1}(u), \mathbb{G}_{n}^{-1}(v)\right),
$$

where $\mathbb{H}_{n}, \mathbb{F}_{n}$, and $\mathbb{G}_{n}$ are the joint and marginal empirical distribution functions of the observations. If $H$ satisfies the hypotheses of the preceding lemma, then the sequence $\sqrt{n}\left(\mathbb{C}_{n}-C\right)$ converges in distribution in
$D\left([a, b]^{2}\right)$ to a $\phi_{H}^{\prime}\left(\mathbb{G}_{H}\right)$ for a tight Brownian bridge $\mathbb{G}_{H}$. The limit variable is distributed as $\mathbb{G}_{H}(\dot{\phi})$ for the functions $\dot{\phi}$ given by

$$
\begin{aligned}
\dot{\phi}_{u, v}(x, y)=1\{ & \left.x \leq F^{-1}(u), y \leq G^{-1}(v)\right\} \\
& -\frac{\partial H}{\partial x}\left(F^{-1}(u), G^{-1}(v)\right) \frac{1\left\{x \leq F^{-1}(u)\right\}}{f\left(F^{-1}(u)\right)} \\
& -\frac{\partial H}{\partial y}\left(F^{-1}(u), G^{-1}(v)\right) \frac{1\left\{y \leq G^{-1}(v)\right\}}{g\left(G^{-1}(v)\right)}
\end{aligned}
$$

If $H(u, v)=u v$ is the uniform distribution function on the unit square, the limit process is a "completely tucked" Brownian sheet with covariance function

$$
\operatorname{cov}(\mathbb{Z}(s, t), \mathbb{Z}(u, v))=(s \wedge u-s u)(t \wedge v-t v)
$$

In general, the covariance function has a more complicated structure.

### 3.9.4.5 The Product Integral

For a function $A \in D(0, b]$, let $\Delta A(t)=A(t)-A(t-)$ and $A^{c}(t) \equiv A(t)- \sum_{0<s \leq t} \Delta A(s)$ be the jump part and the continuous part, respectively. The product integral is defined as

$$
\phi(A)(t) \equiv \pi_{0<s \leq t}(1+d A(s))=\prod_{0<s \leq t}(1+\Delta A(s)) \exp \left(A^{c}(t)\right)
$$

The middle expression is simply notation, which is motivated by the fact that

$$
\phi(A)(t)=\lim _{\max _{i}\left|t_{i}-t_{i-1}\right| \rightarrow 0} \prod_{i}\left(1+\left(A\left(t_{i}\right)-A\left(t_{i-1}\right)\right)\right)
$$

if the limit is taken over partitions $0=t_{0}<t_{1}<\ldots<t_{n}=t$ with meshwidth decreasing to zero. Alternatively, the product integral can be defined in terms of a Peano series or as the unique solution of a Volterra integral equation (see Problem 3.9.5). As additional notation, we shall use

$$
\phi(A)(s, t]=\pi_{s<u \leq t}(1+d A(u))=\frac{\phi(A)(t)}{\phi(A)(s)}, \quad s<t
$$

Here both the first and second expressions are defined by the right-hand side, although their definition in terms of the jump and continuous parts of $A$ restricted to the interval ( $s, t$ ] is clear.

Some basic properties of product integrals, such as the "forward" and "backward" equation and the Duhamel equation, are given in the Problems and Complements section (Problems 3.9.6 and 3.9.7). The Duhamel equation is the key to proving the Hadamard differentiability of the product integral. It asserts that

$$
(\phi(B)-\phi(A))(t)=\int_{(0, t]} \phi(A)(0, u) \phi(B)(u, t](B-A)(d u)
$$

Integration by parts shows that this difference is bounded by a constant times $\|A-B\|_{\infty}$ (also see Problem 3.9.8). Thus, product integration is uniformly continuous.
3.9.30 Lemma. For fixed, finite, positive constants $b$ and $M$, the product integral map $\phi: \mathrm{BV}_{M}[0, b] \subset D[0, b] \mapsto D[0, b]$ is Hadamard-differentiable with derivative

$$
\phi_{A}^{\prime}(\alpha)(t)=\int_{(0, t]} \phi(A)(0, u) \phi(A)(u, t] d \alpha(u)
$$

Here the integral with respect to $\alpha$ is defined by integration by parts (as given in Problem 3.9.8) if $\alpha$ is of unbounded variation.

Proof. Set $A_{n}=A+t_{n} \alpha_{n}$ for a sequence $\alpha_{n} \rightarrow \alpha$. In view of the Duhamel equation, it suffices to show that

$$
\int_{(0, t]} \phi(A)(0, u) \phi\left(A_{n}\right)(u, t] d \alpha_{n}(u) \rightarrow \int_{(0, t]} \phi(A)(0, u) \phi(A)(u, t] d \alpha(u)
$$

uniformly in $0 \leq t \leq b$. In each side the error if $\alpha_{n}$ or $\alpha$ is replaced by a function $\tilde{\alpha}$ is bounded by a constant times $\left\|\alpha_{n}-\tilde{\alpha}\right\|_{\infty}$ or $\|\alpha-\tilde{\alpha}\|_{\infty}$, respectively. This follows by integration by parts. Choose a function $\tilde{\alpha}$ of bounded variation that is close to $\alpha$ in the uniform norm. Then it is also close to $\alpha_{n}$ for sufficiently large $n$, and the error is small on both sides. Conclude that it suffices to show that

$$
\int_{(0, t]} \phi(A)(0, u) \phi\left(A_{n}\right)(u, t] d \tilde{\alpha}(u) \rightarrow \int_{(0, t]} \phi(A)(0, u) \phi(A)(u, t] d \tilde{\alpha}(u)
$$

for every function of bounded variation $\tilde{\alpha}$. This follows since the product integrals $\phi\left(A_{n}\right)$ converge uniformly to their limit $\phi(A)$, by a second application of the Duhamel equation.

The product integral is important in statistics because it transforms cumulative hazard functions into the corresponding survival functions. This can be seen most conveniently from the fact that the product integral is the unique solution of the Volterra equation defined by the negative of the cumulative hazard function. The cumulative hazard function corresponding to the distribution function $F$ is defined as

$$
\Lambda(t)=\int_{[0, t]} \frac{1}{1-F(s-)} d F(s)
$$

This immediately yields

$$
1-\int_{[0, t]}(1-F(s-)) d \Lambda(s)=1-F(t)
$$

Thus the survival function $S=1-F$ solves the Volterra equation $B= 1+\int B(s-) d(-\Lambda)(s)$ induced by $-\Lambda$. According to Problem 3.9.5,

$$
1-F(t)=\prod_{s \leq t}(1-d \Lambda(s))
$$

The Hadamard differentiability of the product integral now implies that the asymptotic normality of estimators for the cumulative hazard function carries over to the asymptotic normality of the corresponding estimators of the survival function.

Let the estimator $\widehat{\Lambda}_{n}$ have the property that the sequence $\sqrt{n}\left(\widehat{\Lambda}_{n}-\Lambda\right)$ converges in distribution in $D[0, \tau]$ to a limit $\mathbb{Z}$. Let $1-\mathbb{F}_{n}=\phi\left(-\widehat{\Lambda}_{n}\right)$ be the corresponding estimator of $1-F=\phi(\Lambda)$. If the estimators $\widehat{\Lambda}_{n}$ are of uniformly bounded total variation (with probability tending to 1 ), then the delta-method, gives in $D[0, \tau]$,

$$
\begin{aligned}
\sqrt{n}\left(\mathbb{F}_{n}-F\right) \rightsquigarrow-\phi_{-\Lambda}^{\prime}(-\mathbb{Z}) & =\int_{(0, t]} S(u-) \frac{S(t)}{S(u)} d \mathbb{Z}(u) \\
& =S(t) \int_{(0, t]} \frac{1}{1-\Delta \Lambda(u)} d \mathbb{Z}(u)
\end{aligned}
$$

3.9.31 Example (Kaplan-Meier). The Nelson-Aalen estimator has limit distribution $\mathbb{Z}=\mathbb{B} \circ C$ for a standard Brownian motion $\mathbb{B}$ and the function $C$ as given in Example 3.9.19. In that case, the zero-mean Gaussian process $\phi_{-\Lambda}^{\prime}(\mathbb{Z})$ in the preceding display has covariance function

$$
S(s) S(t) \int_{[0, s \wedge t]} \frac{1}{(1-\Delta \Lambda) \bar{H}} d \Lambda, \quad 0 \leq s, t \leq \tau
$$

The corresponding estimator for the survival function is the Kaplan-Meier estimator.

### 3.9.4.6 Multivariate Trimming

Throughout this section fix a number $0<\alpha<1 / 2$ and let $\mathcal{H}$ denote the collection of all closed half-spaces in $\mathbb{R}^{d}$. For a given probability distribution $P$ on $\mathbb{R}^{d}$, define a compact, convex set by

$$
K_{P}=\cap\{H \in \mathcal{H}: P(H) \geq 1-\alpha\} .
$$

It will be assumed that $K_{P}$ contains a neighborhood of the origin. (If $K_{P}$ has a nonempty interior, this can always be achieved by translation of $P$.) We shall be interested in the distance of the origin to the boundary of $K_{P}$. The distance in the direction $u \in S^{d-1}$ equals

$$
R_{P}(u)=\inf \{r \geq 0: r u \notin K\} .
$$

Define a functional $\phi$ from the probability measures $\mathcal{M}$ on $\mathbb{R}^{d}$ to $\ell^{\infty}\left(S^{d-1}\right)$ by setting $\phi(P)(u)$ equal to $R_{P}(u)$. Under suitable conditions, this map is Hadamard-differentiable.

The set $K_{P}$ at the true $P$ is assumed to be regular in the sense that it has a unique supporting hyperplane at each of its boundary points $R_{P}(u) u$. Let $V_{P}(u)$ be the outward unit-normal vectors of these supporting hyperplanes.
3.9.32 Lemma. Let $P$ be a probability distribution on $\mathbb{R}^{d}$ such that $K_{P}$ is regular and the maps $u \mapsto R_{P}(u)$ and $u \mapsto V_{P}(u)$ are continuous. Furthermore, assume that $u^{\prime} X$ has a uniformly bounded density $p(\cdot ; u)$ such that $p\left(z ; V_{P}(u)\right)$ is positive and continuous in $u \in S^{d-1}$ and $z$ near $R_{P}(u) u^{\prime} V_{P}(u)$. Then $\phi: \mathcal{M} \subset \ell^{\infty}(\mathcal{H}) \mapsto \ell^{\infty}\left(S^{d-1}\right)$ is Hadamarddifferentiable at $P$ tangentially to $\mathrm{UC}\left(\mathcal{H}, \rho_{P}\right)$ with derivative given by

$$
\phi_{P}^{\prime}(h)(u)=-\frac{h\left(H_{P}(u)\right)}{u^{\prime} V_{P}(u) p\left(u^{\prime} V_{P}(u) R_{P}(u) ; V_{P}(u)\right)}
$$

for $h \in \mathrm{UC}\left(\mathcal{H}, \rho_{P}\right)$ and $u \in S^{d-1}$. Here $H_{P}(u)$ is the half-space containing $K_{P}$ whose boundary is equal to the supporting hyperplane at $R_{P}(u) u$.

Proof. Write $H(u, r)$ for the half-space $\left\{x: u^{\prime} x \leq r\right\}$. Let $P_{t}=P+t h_{t}$ be a sequence of probability measures viewed as elements of $\ell^{\infty}(\mathcal{H})$ such that $h_{t} \rightarrow h \in \mathrm{UC}\left(\mathcal{H}, \rho_{P}\right)$. Let $K_{t}$ be the corresponding compact, convex sets, and define for every $u \in S^{d-1}$

$$
\begin{aligned}
& R_{t}(u)=\inf \left\{r \geq 0: r u \notin K_{t}\right\}, \\
& Q_{t}(u)=\inf \left\{r \geq 0: P_{t} H(u, r) \geq 1-\alpha\right\} .
\end{aligned}
$$

Furthermore, let $V_{t}(u)$ be the outward unit-normal of some supporting hyperplane to $K_{t}$ at the point $R_{t}(u) u$. Thus

$$
K_{t} \subset\left\{x: V_{t}(u)^{\prime} x \leq R_{t}(u) V_{t}(u)^{\prime} u\right\}=H\left(V_{t}(u), R_{t}(u) V_{t}(u)^{\prime} u\right)
$$

For $t=0$, the supporting hyperplanes are unique by assumption. If there are more candidates, then any one will do in the following argument. For simplicity of notation, we drop the index $t$ if $t=0$.

The half-space $H\left(v, Q_{t}(v)\right)$ is the minimal half-space in the direction $v$ that contains $K_{t}$. Combining the fact that it contains $K_{t}$ with the fact that $R_{t}(u) u \in K_{t}$ immediately gives

$$
R_{t}(u) v^{\prime} u \leq Q_{t}(v), \quad \text { for every } u, v \in S^{d-1} .
$$

For the normal $v=V_{t}(u)$ of a supporting hyperplane at $R_{t}(u) u$, this inequality becomes the equality

$$
R_{t}(u) V_{t}(u)^{\prime} u=Q_{t}\left(V_{t}(u)\right), \quad \text { for every } u \in S^{d-1}
$$

Otherwise, the half-space $H\left(v, Q_{t}(v)\right)$ would not be minimal, in view of the fact that $K_{t} \subset H\left(V_{t}(u), R_{t}(u) V_{t}(u)^{\prime} u\right)$ by the definition of a supporting hyperplane.

The combination of the two preceding displays shows that

$$
\frac{Q_{t}\left(V_{t}(u)\right)-Q\left(V_{t}(u)\right)}{u^{\prime} V_{t}(u)} \leq R_{t}(u)-R(u) \leq \frac{Q_{t}(V(u))-Q(V(u))}{u^{\prime} V(u)} .
$$

The left and right sides divided by $t$ will be shown to converge to the same limit.

First we show consistency of $Q_{t}$ and $V_{t}$. The numbers $Q_{t}(u)$ are the ( $1- \alpha)$-quantiles of the random variables $u^{\prime} X_{t}$ if $X_{t}$ is distributed according to $P_{t}$. The assumption $P_{t} \rightarrow P$ in $\ell^{\infty}(\mathcal{H})$ shows that the distribution functions of these variables converge uniformly, uniformly in $u$. A standard argument shows that $Q_{t} \rightarrow Q$ in $\ell^{\infty}\left(S^{d-1}\right)$ (Problem 3.9.10).

Since the density $p(z ; V(u))$ of $u^{\prime} X$ is bounded away from zero for $z$ close to $Q(u)$, uniformly in $u$, it follows that $\sup _{u} P H(u, \varepsilon)<1-\alpha$ for $\varepsilon<\inf _{u} Q(u)$. Here $\inf _{u} Q(u)$ is positive, because $K$ contains an interior point. Conclude that for sufficiently small $t$ we have $\sup _{u} P_{t} H(u, \varepsilon)<1- \alpha$, whence $K_{t}$ contains the ball of radius $\varepsilon$. According to Problem 3.9.11, $u^{\prime} V_{t}(u)$ is bounded away from zero uniformly in $u$, for sufficiently small $t$. Conclude that the denominators in the preceding display are bounded away from zero and next that $R_{t} \rightarrow R$ uniformly in $u$.

For the proof that $V_{t} \rightarrow V$ in $\ell^{\infty}\left(S^{d-1}, \mathbb{R}^{d}\right)$, consider arbitrary sequences $u_{n}$ and $t_{n} \rightarrow 0$. By compactness of $S^{d-1}$, there exists a subsequence along which $u_{n} \rightarrow u$ and $V_{t_{n}}\left(u_{n}\right) \rightarrow v$ for some $u$ and $v$ in $S^{d-1}$. By the definition of $R$ and $R_{t}$, we have for every $n$

$$
\left(\inf _{u} \frac{R_{t_{n}}(u)}{R(u)}\right) K \subset K_{t_{n}} \subset H\left(V_{t_{n}}\left(u_{n}\right), R_{t_{n}}\left(u_{n}\right) V_{t_{n}}\left(u_{n}\right)^{\prime} u_{n}\right) .
$$

The left side approaches $K$ and the right side $H\left(v, R(u) v^{\prime} u\right)$. Conclude that $K \subset H\left(v, R(u) v^{\prime} u\right)$. By regularity, it follows that $v=V(u)$, and next by continuity of $V$, we have $V_{t_{n}}\left(u_{n}\right)-V\left(u_{n}\right) \rightarrow 0$ along the subsequence.

The absolute value of the difference $P_{t} H\left(v, Q_{t}(v)\right)-(1-\alpha)$ is bounded by the jump size of the distribution function of $v^{\prime} X_{t}$ at the point $Q_{t}(v)$. By assumption, $v^{\prime} X$ has no atoms and, since $v^{\prime} X$ has a bounded density and $h$ is uniformly $\rho_{P}$-continuous, $r \mapsto h(H(v, r))$ is continuous. Since $P_{t}=P+t h_{t}$ we can conclude that the difference is $o(t)$. Thus, uniformly in $v \in S^{d-1}$,

$$
\begin{aligned}
o(t) & =P_{t} H\left(v, Q_{t}(v)\right)-P H(v, Q(v)) \\
& =P H\left(v, Q_{t}(v)\right)-P H(v, Q(v))+\operatorname{th}_{t}\left(H\left(v, Q_{t}(v)\right)\right) \\
& =(p(Q(v) ; v)+o(1))\left(Q_{t}(v)-Q(v)\right)+\operatorname{th}(H(v, Q(v)))+o(t)
\end{aligned}
$$

This may be rewritten as

$$
\frac{Q_{t}(v)-Q(v)}{t u^{\prime} v}=\frac{-h(H(v, Q(v)))+o(1)}{u^{\prime} v(p(Q(v) ; v)+o(1))}
$$

Apply this with $v=V_{t}(u)$ and $v=V(u)$ to complete the proof.
3.9.33 Example. Let $X_{1}, \ldots, X_{n}$ be an i.i.d. sample from the distribution $P$ on $\mathbb{R}^{d}$ with empirical distribution $\mathbb{P}_{n}$. The collection of half-spaces is a separable Vapnik-Cervonenkis class and hence a Donsker class. Thus, the empirical process $\sqrt{n}\left(\mathbb{P}_{n}-P\right)$ converges in distribution in $\ell^{\infty}(\mathcal{H})$ to a tight Brownian $\mathbb{G}_{P}$. Define a random compact, convex set $\mathbb{K}_{n}$ by

$$
\mathbb{K}_{n}=\cap\left\{H \in \mathcal{H}: \mathbb{P}_{n}(H) \geq 1-\alpha\right\}
$$

If $P$ satisfies the hypotheses of the preceding theorem, then

$$
\sqrt{n}\left(R_{\mathbb{P}_{n}}-R_{P}\right) \rightsquigarrow-\frac{\mathbb{G}_{P}\left(H_{P}(u)\right)}{u^{\prime} V_{P}(u) p\left(u^{\prime} V_{P}(u) R_{P}(u) ; V_{P}(u)\right)}, \quad \text { in } \ell^{\infty}\left(S^{d-1}\right)
$$

The limit process is zero-mean Gaussian with covariance function

$$
\frac{P H_{P}(u) \cap H_{P}(v)-(1-\alpha)^{2}}{g(u) g(v)}, \quad u, v \in S^{d-1}
$$

where $g(u)=u^{\prime} V_{P}(u) f\left(R(u) u^{\prime} V(u) ; V(u)\right)$.
A multivariate trimmed mean of a probability measure $P$ could be defined as

$$
T(P)=\frac{1}{\lambda\left(K_{P}\right)} \int_{K_{P}} x d \lambda(x)
$$

The empirical trimmed mean is obtained by replacing $P$ by the empirical distribution $\mathbb{P}_{n}$. We can prove the asymptotic normality of this estimator, and more generally the asymptotic normality of the trimmed mean of estimators that converge in $\ell^{\infty}(\mathcal{H})$, by application of the preceding lemma. For this we write the trimmed mean in the form

$$
T(P)=\frac{\int_{S^{d-1}} \int_{0}^{R_{P}(u)} r u J(u, r) d r d u}{\int_{S^{d-1}} \int_{0}^{R_{P}(u)} J(u, r) d r d u}
$$

where $J(u, r)$ is the Jacobian of the transformation $x \mapsto(u, r)$ and $S^{d-1}$ can be identified with an interval in $\mathbb{R}^{d-1}$. For instance, for $d=2$, we can use polar coordinates and obtain

$$
T(P)=\frac{\int_{0}^{2 \pi} R_{P}(u)^{3} / 3 d u}{\int_{0}^{2 \pi} R_{P}(u)^{2} / 2 d u}
$$

It is easy to see that the map $R_{P} \mapsto T(P)$ is Hadamard-differentiable. Combining this with Lemma 3.9.32 and the chain rule, we see that the map $P \mapsto T(P)$ is Hadamard-differentiable as well.

### 3.9.4.7 Z-functionals

Estimators defined by equations, $Z$-estimators, are considered in Chapter 3.2, and their asymptotic distribution may be established by Theorem 3.3.1. Solving an estimating equation is the same as assigning a zero to a random function. In this section it is shown that the functional that assigns a zero is Hadamard-differentiable. Thus, the delta-method may be used for deriving the asymptotic distribution of $Z$-estimators. This route is not necessarily recommended, however; while the packaging of the argument by Hadamard differentiability is elegant, it seems to require conditions that are stronger than those of the more direct Theorem 3.3.1.

Given an arbitrary subset $\Theta$ of a Banach space and another Banach space $\mathbb{L}$, let $\ell^{\infty}(\Theta, \mathbb{L})$ be the Banach space of all uniformly norm-bounded functions $z: \Theta \mapsto \mathbb{L}$. Let $Z(\Theta, \mathbb{L})$ be the subset consisting of all maps with at least one zero. Let $\phi: Z(\Theta, \mathbb{L}) \mapsto \Theta$ be a map that assigns one of its zeros $\phi(z)$ to each element $z \in Z(\Theta, \mathbb{L})$. In case of multiple zeros the precise choice of a zero is irrelevant.
3.9.34 Lemma. Assume $\Psi: \Theta \mapsto \mathbb{L}$ is uniformly norm-bounded, is one-toone, possesses a $\theta_{0}$ and has an inverse (with domain $\Psi(\Theta)$ ) that is continuous at 0 . Let $\Psi$ be Fréchet-differentiable at $\theta_{0}$ with derivative $\dot{\Psi}_{\theta_{0}}$, which is one-to-one and continuously invertible on $\operatorname{lin} \Theta$. Then the map $\phi: Z(\Theta, \mathbb{L}) \subset \ell^{\infty}(\Theta, \mathbb{L}) \mapsto \Theta$ is Hadamard-differentiable at $\Psi$ tangentially to the set of $z \in \ell^{\infty}(\Theta, \mathbb{L})$ that are continuous at $\theta_{0}$. The derivative is given by $\phi_{\Psi}^{\prime}(z)=-\dot{\Psi}_{\theta_{0}}^{-1}\left(z\left(\theta_{0}\right)\right)$.

Proof. Let $z_{t} \rightarrow z$ uniformly on $\Theta$ for a map $z: \Theta \mapsto \mathbb{L}$ that is continuous at $\theta_{0}$. By definition the element $\theta_{t}=\phi\left(\Psi+t z_{t}\right)$ satisfies $\Psi\left(\theta_{t}\right)+t z_{t}\left(\theta_{t}\right)=0$. Conclude that $\Psi\left(\theta_{t}\right)=O(t)$. Since $\Psi$ is one-to-one and has an inverse that is continuous at zero, it follows that $\theta_{t}=\Psi^{-1}\left(\Psi\left(\theta_{t}\right)\right) \rightarrow \Psi^{-1}(0)=\theta_{0}$. By the Fréchet differentiability of $\Psi$,

$$
\liminf _{t \downarrow 0} \frac{\left\|\Psi\left(\theta_{t}\right)-\Psi\left(\theta_{0}\right)\right\|}{\left\|\theta_{t}-\theta_{0}\right\|} \geq \liminf _{t \downarrow 0} \frac{\left\|\dot{\Psi}_{\theta_{0}}\left(\theta_{t}-\theta_{0}\right)\right\|}{\left\|\theta_{t}-\theta_{0}\right\|} \geq \inf _{\|h\|=1}\left\|\dot{\Psi}_{\theta_{0}}(h)\right\|,
$$

where $h$ ranges over $\operatorname{lin} \Theta$. Since the inverse of $\dot{\Psi}_{\theta_{0}}$ is continuous, the right side is positive. Conclude that there exists a positive constant $c$ such that $\left\|\theta_{t}-\theta_{0}\right\|<c\left\|\Psi\left(\theta_{t}\right)-\Psi\left(\theta_{0}\right)\right\|=c\left\|t z_{t}\left(\theta_{t}\right)\right\|$ for all sufficiently small $t>0$. Conclude that $\left\|\theta_{t}-\theta_{0}\right\|=O(t)$. By Fréchet differentiability,

$$
\Psi\left(\theta_{t}\right)-\Psi\left(\theta_{0}\right)=\dot{\Psi}_{\theta_{0}}\left(\theta_{t}-\theta_{0}\right)+o\left(\left\|\theta_{t}-\theta_{0}\right\|\right) .
$$

The remainder term is $o(t)$. Conclude that

$$
\frac{\theta_{t}-\theta_{0}}{t}=\dot{\Psi}_{\theta_{0}}^{-1}\left(\frac{\Psi\left(\theta_{t}\right)-\Psi\left(\theta_{0}\right)}{t}+o(1)\right) \rightarrow \dot{\Psi}_{\theta_{0}}^{-1}\left(-z\left(\theta_{0}\right)\right)
$$

since $t^{-1}\left(\Psi\left(\theta_{t}\right)-\Psi\left(\theta_{0}\right)\right)=-z_{t}\left(\theta_{t}\right) \rightarrow z\left(\theta_{0}\right)$.
3.9.35 Example ( $Z$-estimators). Let $\hat{\theta}_{n}$ be "estimators" solving the estimating equation $\Psi_{n}(\theta)=0$ for given random criterion functions $\Psi_{n}: \Theta \mapsto \mathbb{L}$. Assume that the sequence $\sqrt{n}\left(\Psi_{n}-\Psi\right)$ converges in distribution to a process $\mathbb{Z}$ in the space $\ell^{\infty}(\Theta, \mathbb{L})$. If $\Psi$ satisfies the conditions of the preceding lemma and almost all sample paths $\theta \mapsto \mathbb{Z}(\theta)$ are continuous at $\theta_{0}$, then the delta-method yields

$$
\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right) \rightsquigarrow \phi_{\Psi}^{\prime}(\mathbb{Z})=-\dot{\Psi}_{\theta_{0}}^{-1}\left(\mathbb{Z}\left(\theta_{0}\right)\right) .
$$

This is the same conclusion as given by Theorem 3.3.1.
It should be noted that the uniformity in convergence with respect to $\Theta$ together with the requirement that the limit process is continuous at $\theta_{0}$ implies condition (3.3.2). Thus, Theorem 3.3.1 gives the same result under weaker conditions, except that consistency of $\hat{\theta}_{n}$ is part of the assumptions.

For finite-dimensional $\theta$, the maps $\Psi_{n}$ will usually take their values in Euclidean space. The weak convergence (in $\ell^{\infty}(\Theta, \mathbb{L})$ ) needed for the preceding argument is then the weak convergence of each coordinate function in $\ell^{\infty}(\Theta)$. For $\mathbb{L}=\ell^{\infty}(\mathcal{F})$ for some set $\mathcal{F}$, the space $\ell^{\infty}(\Theta, \mathbb{L})$ can be isometrically identified with $\ell^{\infty}(\Theta \times \mathcal{F})$ through $z(\theta) f \leftrightarrow z(\theta, f)$, and the weak convergence can be interpreted accordingly.

## Problems and Complements

1. (Uniform Fréchet differentiability) Let $\mathbb{D}$ and $\mathbb{E}$ be normed spaces and $\mathbb{D}_{\phi} \subset \mathbb{D}$ convex. Let $\phi: \mathbb{D}_{\phi} \mapsto \mathbb{E}$ be Fréchet-differentiable at every $\theta \in \mathbb{D}_{\phi}$, where the derivatives $\theta \mapsto \phi_{\theta}^{\prime}$ are uniformly norm-continuous. Then $\phi$ is uniformly Fréchet-differentiable on $\mathbb{D}_{\phi}$.
[Hint: The first part of the argument is the same as the argument in the proof of Lemma 3.9.7.]
2. Arbitrary distribution functions $F$ and $G$ on the real line satisfy the identity

$$
\iint[G(s \wedge t)-G(s) G(t)] d F(s) d F(t)=\int F^{2} d G-\left(\int F d G\right)^{2}
$$

3. If $\mathbb{G}_{G}$ is a $G$-Brownian bridge process indexed by the half-lines $(-\infty, t]$, then

$$
-\int \mathbb{G}_{G} d F \sim \mathbb{G}_{G}(F)
$$

where the right side denotes a $G$-Brownian bridge process indexed by the single function $F$.
[Hint: Use the previous exercise.]
4. (Quantile-quantile) The quantile-quantile transformation $\phi(F, G)=F \circ G^{-1}$ for distribution functions $F$ and $G$ on $\mathbb{R}$ is Hadamard-differentiable tangentially to $D[a, b] \times C[a, b]$ as a map $D(\overline{\mathbb{R}})^{2} \mapsto D[a, b]$ is Hadamarddifferentiable tangentially to $D[a, b] \times C[a, b]$. This may be used to derive the limit distribution of $\mathbb{F}_{n} \circ \mathbb{G}_{n}^{-1}$ for the empirical distribution functions $\mathbb{F}_{n}$ and $\mathbb{G}_{n}$ based on independent samples from $F$ and $G$. [Dudley (1992) establishes Freechet differentiability of this map $\phi$ with other norms on the domain and range spaces.]
5. (Volterra equation and Peano series) The product integral $B=\phi(A)$ is the unique solution of the Volterra equation

$$
B(t)=1+\int_{(0, t]} B(s-) d A(s)
$$

This may be used to write the product integral as the Peano series

$$
B(t)=1+\sum_{n=1}^{\infty} \int \ldots \int_{0<t_{1}<\ldots<t_{n} \leq t} d A\left(t_{1}\right) \ldots d A\left(t_{n}\right)
$$

6. (Forward and backward equation) The product integral $B=\phi(A)$ satisfies the forward equation

$$
B(s, t]-1=\int_{(s, t]} B(s, u) d A(u)
$$

and the backward equation

$$
B(s, t]-1=\int_{(s, t]} d A(u) B(u, t]
$$

7. (Duhamel equation) Product integrals $B_{1}=\phi\left(A_{1}\right)$ and $B_{2}=\phi\left(A_{2}\right)$ satisfy the Duhamel equation

$$
B_{2}(s, t]-B_{1}(s, t]=\int_{(s, t]} B_{1}(s, u) B_{2}(u, t]\left(A_{2}-A_{1}\right)(d u)
$$

[Hint: Define a Borel measure $A_{1,2}$ on $\mathbb{R}_{+}^{m+n}$ by

$$
A_{1,2}\left(C_{1} \times \ldots \times C_{m} \times D_{1} \times \ldots \times D_{n}\right)=A_{1}\left(C_{1}\right) \cdots A_{1}\left(C_{m}\right) A_{2}\left(D_{1}\right) \cdots A_{2}\left(D_{n}\right) .
$$

Then integrate the indicator of the set $\left\{s<u_{1}<\cdots<u_{m+n} \leq t\right\}$ with respect to $A_{1,2}$, apply Fubini's theorem, and sum both sides of the resulting equality over $m \geq 1$ and $n \geq 1$.]
8. (Integration by parts for the Duhamel equation) Suppose that $A, B \in D\left(\mathbb{R}^{+}\right)$and that $h \in D\left(\mathbb{R}^{+}\right)$is of bounded variation. (When $h$ is of unbounded
variation, the left side is defined by the right side!) Then

$$
\begin{aligned}
& \int_{(0, t]} \pi(1+d B)(0, u) d h(u) \pi(1+d A)(u, t] \\
& =h(t)+\int_{(0, t]} \pi(1+d B)(0, s) d B(s)[h(t)-h(s)] \\
& \quad+\int_{(0, t]} h(r-) d A(r) \pi(1+A)(r, t] \\
& \quad+\iint_{0<s<r \leq t} \pi(1+d B)(0, s) d B(s)[h(r-)-h(s)] \\
& \quad \times \pi(1+A)(r, t] d A(r)
\end{aligned}
$$

[Hint: Use the forward and backward equations to replace product integrals on the left side, and then use Fubini's theorem.]
9. (Existence of zeros) Lemma 3.9.34 takes the domain of the zero-functional equal to the set of maps that have at least one zero. This avoids some technical problems. In many situations it can be shown that the domain is open by the following result. Let $\Psi: \Theta \mapsto \mathbb{R}^{p}$ be a homeomorphism of a neighborhood of $\theta_{0} \in \mathbb{R}^{p}$ onto a neighborhood of $0 \in \mathbb{R}^{p}$. Then every continuous $z$ : $\Theta \mapsto \mathbb{R}^{p}$ for which $\|z-\Psi\|_{\infty}$ is sufficiently small has at least one zero.
[Hint: Without loss of generality the neighborhood of 0 can be chosen to be the ball $B(0, r)$. Let $G=\left\{z \in C(\Theta):\|z-\Psi\|_{\infty}<r\right\}$. The function $x \mapsto z \circ \Psi^{-1}(x)-x$ maps the ball $B(0, r)$ into itself, since

$$
\left\|z \circ \Psi^{-1}(x)-x\right\| \leq\|z-\Psi\|_{\infty} .
$$

If $z$ is continuous, then so is the map $x \mapsto z \circ \Psi^{-1}(x)-x$. By Brouwer's fixed-point theorem, it has a fixed point $x_{z}$. This satisfies $z\left(\Psi^{-1}\left(x_{z}\right)\right)=0$.]
10. Let $x \mapsto F_{n}(x ; u)$ be distribution functions that converge uniformly in $x$ and $u$ to distribution functions $x \mapsto F(x ; u)$. If there exist points $\xi_{p u}$ such that for every $\delta>0$

$$
\sup _{u} F\left(\xi_{p u}-\delta ; u\right)<p<\inf _{u} F\left(\xi_{p u}+\delta ; u\right)
$$

then $F_{n}^{-1}(p ; u) \rightarrow F^{-1}(p ; u)$ uniformly in $u$. The condition is satisfied if every $F(\cdot ; u)$ has a density that is uniformly bounded away from zero in a neighborhood of its $p$ th quantile $\xi_{p u}$.
11. For a compact, convex set $K \subset \mathbb{R}^{d}$, let $V(u)$ be the outward normal of a supporting hyperplane at the point $R(u) u$, where $R(u)=\inf \{r: r u \notin K\}$. If $K$ contains the closed ball of radius $\varepsilon$ around the origin, then $u^{\prime} V(u) \geq \varepsilon / \operatorname{diam} K$ for every $u \in S^{d-1}$.
[Hint: The convex hull of the ball of radius $\varepsilon$ and the point $R(u) u$ is contained in $K$. Hence, by the definition of a supporting hyperplanes $V(u)^{\prime}\left(\frac{1}{2} R(u) u+\right. \left.\frac{1}{2} \varepsilon V(u)\right) \leq V(u)^{\prime} R(u) u$, since $\varepsilon V(u)$ is contained in the ball of radius $\varepsilon$.]
12. In Lemma 3.9.32 the distance $\rho_{P}$ may be replaced by $d(H(u, r), H(v, s))= \|u-v\|+|r-s|$.

### 3.10

## Contiguity

Let $P$ and $Q$ be probability measures on a measurable space ( $\Omega, \mathcal{A}$ ). If $Q$ is absolutely continuous with respect to $P$, then the $Q$-law of a measurable map $X: \Omega \mapsto \mathbb{D}$ can be calculated from the $P$-law of the pair ( $X, d Q / d P$ ) through the formula

$$
\mathrm{E}_{Q} f(X)=\mathrm{E}_{P} f(X) \frac{d Q}{d P}
$$

With $M$ equal to the induced $P$-law of the pair ( $X, d Q / d P$ ), this identity can also be expressed as

$$
Q(X \in B)=\int_{B \times \mathbb{R}} v d M(x, v)
$$

The validity of these formulas depends essentially on the absolute continuity of $Q$ with respect to $P$. Indeed, it is clear that no $P$-law contains information about the part of $Q$ that is singular with respect to $P$.

Consider an asymptotic version of the problem. Let $\left(\Omega_{\alpha}, \mathcal{A}_{\alpha}\right)$ be measurable spaces, each with a pair of probability measures $P_{\alpha}$ and $Q_{\alpha}$ on it. Under what conditions can a $Q_{\alpha}$-limit law of maps $X_{\alpha}: \Omega_{\alpha} \mapsto \mathbb{D}$ be obtained from suitable $P_{\alpha}$-limit laws? In view of the above, it is necessary that $Q_{\alpha}$ is asymptotically absolutely continuous with respect to $P_{\alpha}$ in a suitable sense.
3.10.1 Definition. Let $P_{\alpha}$ and $Q_{\alpha}$ be nets of probability measures on measurable spaces ( $\Omega_{\alpha}, \mathcal{A}_{\alpha}$ ). Then $Q_{\alpha}$ is contiguous with respect to $P_{\alpha}$ if $P_{\alpha}\left(A_{\alpha}\right) \rightarrow 0$ along a subnet implies $Q_{\alpha}\left(A_{\alpha}\right) \rightarrow 0$ along this subnet for every choice of measurable sets $A_{\alpha}$ (and every subnet). This is denoted
$Q_{\alpha} \triangleleft P_{\alpha}$. The nets $P_{\alpha}$ and $Q_{\alpha}$ are two-sided contiguous if both $P_{\alpha} \triangleleft Q_{\alpha}$ and $Q_{\alpha} \triangleleft P_{\alpha}$. This is denoted $P_{\alpha} \triangleright Q_{\alpha}$.

Contiguity can be characterized by the asymptotic behavior of the likelihood ratios of $P_{\alpha}$ and $Q_{\alpha}$. Given two measures $P$ and $Q$, write $d Q / d P$ for the Radon-Nikodym density of the part of $Q$ that is $P$-absolutely continuous. This function is only $P$-a.s. uniquely defined, but since only its $P$-law will be studied here, it is not necessary to remove the ambiguity. One way of forming $d Q / d P$ is to take densities $p$ and $q$ of $P$ and $Q$ with respect to some measure for which there exists such densities (for instance, a $\sigma$-finite measure that dominates both, such as $P+Q$ ) and set $d Q / d P=q / p$.

Loglikelihood ratios are always nonnegative and integrable. In particular, for nets of probability measures $P_{\alpha}$ and $Q_{\alpha}$,

$$
\mathrm{E}_{Q_{\alpha}} \frac{d P_{\alpha}}{d Q_{\alpha}} \leq 1 \quad \text { and } \quad \mathrm{E}_{P_{\alpha}} \frac{d Q_{\alpha}}{d P_{\alpha}} \leq 1
$$

Thus, the nets of likelihood ratios $d Q_{\alpha} / d P_{\alpha}$ and $d P_{\alpha} / d Q_{\alpha}$ are uniformly tight as maps into $[0, \infty)$ under $Q_{\alpha}$ and $P_{\alpha}$, respectively. The properties of their limit points determine contiguity.
3.10.2 Theorem. Let $P_{\alpha}$ and $Q_{\alpha}$ be nets of probability measures on measurable spaces $\left(\Omega_{\alpha}, \mathcal{A}_{\alpha}\right)$. Then the following statements are equivalent:
(i) $Q_{\alpha} \triangleleft P_{\alpha}$;
(ii) if $d P_{\alpha} / d Q_{\alpha} \xrightarrow{\mathrm{Q}_{\alpha}} L$ along a subnet, then $L(0, \infty)=1$;
(iii) if $d Q_{\alpha} / d P_{\alpha} \stackrel{\mathrm{P}_{\alpha}}{\sim} V$ along a subnet, then $\mathrm{E} V=1$;
(iv) for any $T_{\alpha}: \Omega_{\alpha} \rightarrow \mathbb{R}$, if $T_{\alpha} \xrightarrow{\mathrm{P}_{\alpha} *} 0$ along a subnet, then $T_{\alpha} \xrightarrow{\mathrm{Q}_{\alpha} *} 0$ along this subnet.

Proof. The equivalence of (i) and (iv) is an easy exercise.
(i) ⇒ (ii). Suppose, without loss of generality, that $d P_{\alpha} / d Q_{\alpha} \xrightarrow{\mathrm{Q}_{\alpha}} L$. Then by the portmanteau theorem, $\liminf Q_{\alpha}\left(d P_{\alpha} / d Q_{\alpha}<\varepsilon\right) \geq L[0, \varepsilon)$ for every $\varepsilon>0$. For $i \in \mathbb{N}$, take $\alpha_{i}$ such that, for all $\alpha \geq \alpha_{i}$,

$$
\begin{equation*}
Q_{\alpha}\left(\frac{d P_{\alpha}}{d Q_{\alpha}}<\frac{1}{i}\right) \geq L\left[0, \frac{1}{2 i}\right]-\frac{1}{i} \tag{3.10.3}
\end{equation*}
$$

Next, define for any $\alpha$ a number $\varepsilon_{\alpha}=\inf \left\{1 / i: \alpha \geq \alpha_{i}\right\}$. (Let the infimum over the empty set be 2.) Then $\varepsilon_{\alpha} \leq 1 / j$ for $\alpha \geq \alpha_{j}$; hence the net $\varepsilon_{\alpha}$ satisfies $\varepsilon_{\alpha} \rightarrow 0$. Moreover, for $\alpha$ sufficiently large (already for $\alpha \geq \alpha_{1}$ ), either $\varepsilon_{\alpha}=1 / i$ for some $i$ or $\varepsilon_{\alpha}=0$. In the first case, $\alpha \geq \alpha_{i}$, so that by (3.10.3),

$$
\begin{equation*}
Q_{\alpha}\left(\frac{d P_{\alpha}}{d Q_{\alpha}} \leq \varepsilon_{\alpha}\right) \geq L\left[0, \frac{1}{2} \varepsilon_{\alpha}\right]-\varepsilon_{\alpha} \tag{3.10.4}
\end{equation*}
$$

In the second case, (3.10.3) holds for infinitely many $i$; again conclude that (3.10.4) holds. Now

$$
P_{\alpha}\left(\frac{d P_{\alpha}}{d Q_{\alpha}} \leq \varepsilon_{\alpha} \wedge d Q_{\alpha}>0\right)=\int_{d P_{\alpha} / d Q_{\alpha} \leq \varepsilon_{\alpha}} \frac{d P_{\alpha}}{d Q_{\alpha}} d Q_{\alpha} \leq \int \varepsilon_{\alpha} d Q_{\alpha} \rightarrow 0
$$

If $Q_{\alpha}$ is contiguous with respect to $P_{\alpha}$, then the $Q_{\alpha}$-probability of the set on the left goes to zero too. Combination with (3.10.4) shows that $L\{0\}=0$.
(iii) ⇒ (i). Suppose $P_{\alpha}\left(A_{\alpha}\right) \rightarrow 0$ along some subnet. By Prohorov's theorem, every further subnet has a further subnet along which $\left(d Q_{\alpha} / d P_{\alpha}, 1_{\Omega_{\alpha}-A_{\alpha}}\right) \rightsquigarrow(V, 1)$ under $P_{\alpha}$ for some weak limit $V$. Along the subnet, by the portmanteau theorem,

$$
\liminf Q_{\alpha}\left(\Omega_{\alpha}-A_{\alpha}\right) \geq \liminf \int_{\Omega_{\alpha}-A_{\alpha}} \frac{d Q_{\alpha}}{d P_{\alpha}} d P_{\alpha} \geq \mathrm{E} 1 \cdot V
$$

since the continuous function $(v, t) \mapsto v t$ is bounded from below on $[0, \infty) \times \{0,1\}$. If (iii) holds, then $\mathrm{E} V=1$, so $Q_{\alpha}\left(A_{\alpha}\right) \rightarrow 0$ along the subnet.
(ii) ⇔ (iii). In view of Prohorov's theorem, given any subnet there is a further subnet such that along it

$$
\frac{d P_{\alpha}}{d Q_{\alpha}} \stackrel{\mathrm{Q}_{\alpha}}{\sim} L \quad ; \quad \frac{d Q_{\alpha}}{d P_{\alpha}} \stackrel{\mathrm{P}_{\alpha}}{\sim} V \quad ; \quad \frac{d P_{\alpha}}{d P_{\alpha}+d Q_{\alpha}} \stackrel{\mathrm{P}_{\alpha}+\mathrm{Q}_{\alpha}}{\sim} W,
$$

for some weak limits $L, V$, and $W$, where $W$ is a random element of total mass 2 with $\mathrm{E} W=1$. Assume for simplicity that this statement is true for the whole net. It must be shown that $L\{0\}=0$ and $\mathrm{E} V=1$ are equivalent. By the last of the three convergences and the continuous mapping theorem,

$$
\left(\frac{d P_{\alpha}}{d Q_{\alpha}}, \frac{d Q_{\alpha}}{d P_{\alpha}}, \frac{d P_{\alpha}}{d P_{\alpha}+d Q_{\alpha}}\right) \stackrel{P_{\alpha}+Q_{\alpha}}{\leadsto}\left(\frac{W}{1-W}, \frac{1-W}{W}, W\right),
$$

in $[0, \infty] \times[0, \infty] \times[0,1]$ (with $1 / 0=\infty$; with this convention the functions $w \mapsto w /(1-w)$ and $w \mapsto(1-w) / w$ are continuous from $[0,1]$ into $[0, \infty]$ ). Let $f:[0, \infty] \mapsto \mathbb{R}$ be bounded and continuous. Then so is the function $(x, v) \mapsto f(x) v$, defined on $[0, \infty] \times[0,1]$. Consequently,

$$
\mathrm{E}_{Q_{\alpha}} f\left(\frac{d P_{\alpha}}{d Q_{\alpha}}\right)=\mathrm{E}_{P_{\alpha}+Q_{\alpha}} f\left(\frac{d P_{\alpha}}{d Q_{\alpha}}\right) \frac{d Q_{\alpha}}{d P_{\alpha}+d Q_{\alpha}} \rightarrow \mathrm{E} f\left(\frac{W}{1-W}\right)(1-W)
$$

Conclude that $L(A)=\mathrm{E} 1_{A}(W /(1-W))(1-W)$; so $L\{0\}=\mathrm{P}(W=0)$. By a similar argument, $\mathrm{E} f(V)=\mathrm{E} f((1-W) / W) W$; so $\mathrm{E} V=\mathrm{E}((1- W) / W) W=\mathrm{E}(1-W) 1_{W>0}=1-\mathrm{P}(W=0)$. Hence the three statements $L\{0\}=0, \mathrm{E} V=1$, and $\mathrm{P}(W=0)=0$ are equivalent.

Since subnets of sequences are not necessarily subsequences, the preceding theorem is unnecessarily complicated if the directed set is equal to the natural numbers. For sequences the theorem can be simplified to the following theorem.
3.10.5 Theorem. Let $P_{n}$ and $Q_{n}$ be sequences of probability measures on measurable spaces ( $\Omega_{n}, \mathcal{A}_{n}$ ). Then the following statements are equivalent:
(i) $Q_{n} \triangleleft P_{n}$;
(ii) if $d P_{n} / d Q_{n} \xrightarrow{\mathrm{Q}_{\mathrm{n}}} L$ along a subsequence, then $L(0, \infty)=1$;
(iii) if $d Q_{n} / d P_{n} \stackrel{\mathrm{P}_{n}}{\sim} V$ along a subsequence, then $\mathrm{E} V=1$;
(iv) for any $T_{n}: \Omega_{n} \rightarrow \mathbb{R}$, if $T_{n} \xrightarrow{\mathrm{P}_{\mathrm{n}} *} 0$, then $T_{n} \xrightarrow{\mathrm{Q}_{\mathrm{n}} *} 0$;
(v) for any $A_{n}$ in $\mathcal{A}_{n}$ : if $P_{n}\left(A_{n}\right) \rightarrow 0$, then $Q_{n}\left(A_{n}\right) \rightarrow 0$.

Proof. The equivalence of (ii) through (v) can be shown by the same arguments as before. Furthermore, in every metric space a limit point of a sequence (possibly along a subnet) is always also the limit of a subsequence.
3.10.6 Example (Lognormality). Let $P_{\alpha}$ and $Q_{\alpha}$ be probability measures on arbitrary measurable spaces. Suppose

$$
\frac{d P_{\alpha}}{d Q_{\alpha}} \stackrel{\mathrm{Q}_{\alpha}}{\rightarrow} e^{N\left(\mu, \sigma^{2}\right)}
$$

Then $Q_{\alpha} \triangleleft P_{\alpha}$ and $Q_{\alpha} \triangleleft P_{\alpha}$ if and only if $\mu=-\frac{1}{2} \sigma^{2}$. For the last it suffices to note that $E \exp \left\{N\left(\mu, \sigma^{2}\right)\right\}=1$ if and only if $\mu=-\frac{1}{2} \sigma^{2}$.

The following theorem solves the problem posed in the introduction. It is a version of Le Cam's third lemma.
3.10.7 Theorem (Le Cam's third lemma). Let $P_{\alpha}$ and $Q_{\alpha}$ be nets of probability measures on measurable spaces $\left(\Omega_{\alpha}, \mathcal{A}_{\alpha}\right)$ and $X_{\alpha}: \Omega_{\alpha} \mapsto \mathbb{D}$ maps with values in a metric space. Let $Q_{\alpha} \triangleleft P_{\alpha}$ and

$$
\left(X_{\alpha}, \frac{d Q_{\alpha}}{d P_{\alpha}}\right) \stackrel{\mathrm{P}_{\alpha}}{\rightsquigarrow}(X, V)
$$

Then $L(B)=\mathrm{E} 1_{B}(X) V$ defines a probability measure and $X_{\alpha} \underset{\rightarrow}{\mathrm{Q}_{\alpha}} L$. If $X$ is tight or separable, then so is $L$.

Proof. Clearly $V \geq 0$ and by contiguity $\mathrm{E} V=1$; so $L$ is a probability measure. It is immediate from the definition of $L$ that $\int f d L=\mathrm{E} f(X) V$ for every indicator function or nonnegative $f$. Conclude, in steps, that the same is true for every simple function $f$ and any integrable measurable function.

If $f: \mathbb{D} \mapsto \mathbb{R}$ is lower semicontinuous and nonnegative, then so is the function $(t, v) \mapsto f(t) v$ on $\mathbb{D} \times[0, \infty)$. Thus by the portmanteau theorem,

$$
\liminf \mathrm{E}_{Q_{\alpha}, *} f\left(X_{\alpha}\right) \geq \liminf \int f\left(X_{\alpha}\right)_{*} \frac{d Q_{\alpha}}{d P_{\alpha}} d P_{\alpha} \geq \mathrm{E} f(X) V
$$

Finally, apply the portmanteau theorem a second time, in the converse direction.

The last statement of the theorem follows immediately from the representation of $L$ : if $X$ concentrates on $S$, so does $L$.
3.10.8 Example (Le Cam's third lemma). The name Le Cam's third lemma is often reserved for the following special case of the previous theorem. Suppose

$$
\left(X_{\alpha}, \log \frac{d Q_{\alpha}}{d P_{\alpha}}\right) \stackrel{\mathrm{P}_{\alpha}}{\rightsquigarrow} N_{k+1}\left(\binom{\mu}{-\frac{1}{2} \sigma^{2}},\left(\begin{array}{cc}
\Sigma & \tau \\
\tau^{\prime} & \sigma^{2}
\end{array}\right)\right) .
$$

Then $X_{\alpha} \xrightarrow{\mathrm{Q}_{\alpha}} N_{k}(\mu+\tau, \Sigma)$. To see this, let $(X, W)$ have the given $(k+1)$ dimensional normal distribution. Then $\int e^{i t^{\prime} x} d L(x)=\mathrm{E} e^{i t^{\prime} X} e^{W}$ equals the characteristic function of this normal distribution at the point $(t,-i)$, that is,

$$
\int e^{i t^{\prime} x} d L(x)=e^{i t^{\prime} \mu-\frac{1}{2} \sigma^{2}-\frac{1}{2}\left(t^{\prime},-i\right)\left(\begin{array}{cc}
\Sigma & \tau \\
\tau^{\prime} & \sigma^{2}
\end{array}\right)\binom{t}{-i}=e^{i t^{\prime}(\mu+\tau)-\frac{1}{2} t^{\prime} \Sigma t} .}
$$

Two-sided contiguity can of course be characterized by "doubling" any of the characterizations of Theorem 3.10.2, but it is customary to write a characterization in terms of the logarithms of the likelihood ratios. If it is understood that $\log 0=-\infty$, then

$$
\log \frac{d P_{\alpha}}{d Q_{\alpha}} \quad: \quad \mathcal{X}_{\alpha} \mapsto \overline{\mathbb{R}}
$$

is a well-defined map, although it is only $Q_{\alpha}$-a.s. unique. Similarly,

$$
\log \frac{d Q_{\alpha}}{d P_{\alpha}} \quad: \quad \mathcal{X}_{\alpha} \mapsto \overline{\mathbb{R}}
$$

is $P_{\alpha}$-a.s. uniquely defined. We are interested only in the "laws" of these maps under $Q_{\alpha}$ and $P_{\alpha}$, respectively, so for now the ambiguity of definition need not be removed. The extended logarithm $x \mapsto \log x$ is a continuous bijection from $[0, \infty)$ onto $[-\infty, \infty)$, with a continuous inverse. Consequently, a likelihood ratio converges weakly in $[0, \infty)$ if and only if a loglikelihood ratio converges weakly in $[-\infty, \infty)$ and the limits are related through taking logarithms and exponentials. This leads to the following reformulation of Theorem 3.10.2.
3.10.9 Theorem. Let $P_{\alpha}$ and $Q_{\alpha}$ be nets of probability measures on measurable spaces $\left(\Omega_{\alpha}, \mathcal{A}_{\alpha}\right)$. Then the following statements are equivalent:
(i) $Q_{\alpha}$ $\$ P_{\alpha}$;
(ii) if $\log d P_{\alpha} / d Q_{\alpha} \xrightarrow{\mathrm{Q}_{\alpha}} L$ and $\log d Q_{\alpha} / d P_{\alpha} \xrightarrow{\mathrm{P}_{\alpha}} M$ in $\overline{\mathbb{R}}$ along a subnet, then $L(\mathbb{R})=M(\mathbb{R})=1$;
(iii) if $\log d P_{\alpha} / d Q_{\alpha} \xrightarrow{\mathrm{Q}_{\alpha}} L$ in $\overline{\mathbb{R}}$ along a subnet, then $L(\mathbb{R})=1$ and $\int e^{x} d L(x)=1$.

Proof. Use characterization (ii) of Theorem 3.10.2 to get equivalence of the three statements

$$
Q_{\alpha} \triangleleft P_{\alpha},
$$

if $d P_{\alpha} / d Q_{\alpha} \xrightarrow{\mathrm{Q}_{\alpha}} V$ along a subnet, then $\mathrm{P}(V \in(0, \infty))=1$,

$$
\text { if } \log d P_{\alpha} / d Q_{\alpha} \xrightarrow[\sim]{\mathrm{Q}_{\alpha}} W \text {, then } \mathrm{P}(W \in \mathbb{R})=1 \text {. }
$$

Next use characterization (iii) to obtain the equivalence of

$$
P_{\alpha} \triangleleft Q_{\alpha},
$$

if $d P_{\alpha} / d Q_{\alpha} \xrightarrow{\mathrm{Q}_{\alpha}} V$ along a subnet, then $\mathrm{E} V=1$,
if $\log d P_{\alpha} / d Q_{\alpha} \xrightarrow{\mathrm{Q}_{\alpha}} W$, then $E e^{W}=1$.
Together this gives the equivalence of (i) and (iii) of the present theorem.
To obtain the equivalence of (i) and (ii), apply characterization (ii) of Theorem 3.10.2 twice, to both $P_{\alpha} \triangleleft Q_{\alpha}$ and $Q_{\alpha} \triangleleft P_{\alpha}$.

### 3.10.1 The Empirical Process

For each $n$, let $X_{n 1}, \ldots, X_{n n}$ be i.i.d. random elements in a measurable space $(\mathcal{X}, \mathcal{A})$. Under the "null hypothesis", the common law is a fixed measure $P$, whereas under the "alternative hypothesis", the common law is $P_{n}$. Set $\mathbb{P}_{n}=n^{-1} \sum_{i=1}^{n} \delta_{X_{n i}}$. In many studies of the asymptotic efficiency of estimators and tests, it is of interest to study the behavior of statistics based on $X_{n 1}, \ldots, X_{n n}$ under the assumption that $P_{n}$ converges to $P$ in the sense that

$$
\begin{equation*}
\int\left[\sqrt{n}\left(d P_{n}^{1 / 2}-d P^{1 / 2}\right)-\frac{1}{2} h d P^{1 / 2}\right]^{2} \rightarrow 0 \tag{3.10.10}
\end{equation*}
$$

for some measurable function $h: \mathcal{X} \mapsto \mathbb{R}$. In this section we derive the asymptotic distribution of the empirical process $\sqrt{n}\left(\mathbb{P}_{n}-P\right)$ under both the null and alternative hypotheses.

Sequences $P_{n}$ as above are often referred to as "contiguous alternatives" to $P$. A more precise statement is that the sequence of distributions $P_{n}^{n}$ and $P^{n}$ (of $\left(X_{n 1}, \ldots, X_{n n}\right)$ on $\mathcal{X}^{n}$ ) are contiguous. In fact, the sequence of loglikelihood ratios allows a linear expansion, and contiguity follows from the central limit theorem and Example 3.10.6.
3.10.11 Lemma. Let the sequence of probability measures $P_{n}$ satisfy (3.10.10). Then necessarily $P h=0$ and $P h^{2}<\infty$ and

$$
\sum_{i=1}^{n} \log \frac{d P_{n}}{d P}\left(X_{n i}\right)=\frac{1}{\sqrt{n}} \sum_{i=1}^{n} h\left(X_{n i}\right)-\frac{1}{2} P h^{2}+R_{n}
$$

where the sequence $R_{n}$ converges to zero in probability under both $P^{n}$ and $P_{n}^{n}$.

Proof. See, e.g., Hájek and Šidák (1967), Chapter VI, Section 1, pages 201-209; Bickel, Klaassen, Ritov, and Wellner (1993), Appendix A.9, page 498-513; or Van der Vaart (1988), Proposition A.8, page 182.

Let $\underset{\sim}{P}$ denote weak convergence under the assumption that $\left(X_{n 1}, \ldots, X_{n n}\right)$ are distributed according to $P^{n}$. The linear expansion of the loglikelihood ratio $\Lambda_{n}\left(P_{n}, P\right)=\log d P_{n}^{n} / d P^{n}$ given by the preceding lemma combined with Slutsky's lemma and the multivariate central limit theorem gives, for any $f$ with $P f^{2}<\infty$,

$$
\left(\sqrt{n}\left(\mathbb{P}_{n}-P\right) f, \Lambda_{n}\left(P_{n}, P\right)\right) \stackrel{P}{\rightsquigarrow} N\left(\binom{0}{-\frac{1}{2} P h^{2}},\left(\begin{array}{cc}
P(f-P f)^{2} & P f h \\
P f h & P h^{2}
\end{array}\right)\right) .
$$

According to Le Cam's third lemma, this implies that

$$
\sqrt{n}\left(\mathbb{P}_{n}-P\right) f \stackrel{P_{n}}{\leadsto} N\left(P f h, P(f-P f)^{2}\right) .
$$

It follows that the naturally centered empirical process $\sqrt{n}\left(\mathbb{P}_{n}-P_{n}\right) f$ converges marginally under $P_{n}$ if and only if the deterministic sequence $\sqrt{n}\left(P_{n}-P\right) f$ converges to a limit. This is not necessarily true under (3.10.10), but for instance if $\left\|P_{n} f^{2}\right\|_{\mathcal{F}}=O(1)$, then the sequence $\sqrt{n}\left(P_{n}-P\right) f$ converges to $P f h$. In that case $\sqrt{n}\left(\mathbb{P}_{n}-P_{n}\right) f$ converges under $P_{n}$ in distribution to a $N\left(0, P(f-P f)^{2}\right)$-distribution, the same limit distribution as $\sqrt{n}\left(\mathbb{P}_{n}-P\right) f$ under $P$, as expected. The following theorem records the uniform version of this result.
3.10.12 Theorem. Let $\mathcal{F}$ be a $P$-Donsker class of measurable functions with $\|P\|_{\mathcal{F}}<\infty$. If the sequence of probability measures $P_{n}$ satisfies (3.10.10), then the sequence $\sqrt{n}\left(\mathbb{P}_{n}-P\right)$ converges under $P_{n}$ in distribution in $\ell^{\infty}(\mathcal{F})$ to the process $f \mapsto \mathbb{G}(f)+P f h$, where $\mathbb{G}$ is a tight Brownian bridge. Moreover, if $\left\|P_{n} f^{2}\right\|_{\mathcal{F}}=O(1)$, then $\left\|\sqrt{n}\left(P_{n}-P\right) f-P f h\right\|_{\mathcal{F}} \rightarrow 0$ and the sequence $\sqrt{n}\left(\mathbb{P}_{n}-P_{n}\right)$ converges under $P_{n}$ in distribution to $\mathbb{G}$.

Proof. According to the discussion preceding the theorem, the sequence $\sqrt{n}\left(\mathbb{P}_{n}-P\right)$ converges under $P_{n}$ marginally to the process $f \mapsto \mathbb{G}(f)+ P f h$. Since the two marginal sequences of $\left(\sqrt{n}\left(\mathbb{P}_{n}-P\right), \Lambda_{n}\left(P_{n}, P\right)\right)$ are asymptotically tight under $P$ in $\ell^{\infty}(\mathcal{F})$ and $\mathbb{R}$, respectively, this sequence is jointly asymptotically tight in $\ell^{\infty}(\mathcal{F}) \times \overline{\mathbb{R}}$ under $P$. By Le Cam's third lemma and the converse part of Prohorov's theorem, the sequence $\sqrt{n}\left(\mathbb{P}_{n}-\right. P$ ) is asymptotically tight in $\ell^{\infty}(\mathcal{F})$ under $P_{n}$. Conclude that $\sqrt{n}\left(\mathbb{P}_{n}-P\right)$ converges under $P_{n}$ in distribution to the process $f \mapsto \mathbb{G}(f)+P f h$.

The proof is complete if it is shown that the sequence $\sqrt{n}\left(P_{n}-P\right) f- P f h$ converges to zero uniformly in $f$. For any $f$,

$$
\begin{aligned}
\sqrt{n}\left(P_{n}-P\right) & f-P f h=\frac{1}{2} \int f h d P^{1 / 2}\left(d P_{n}^{1 / 2}-d P^{1 / 2}\right) \\
& +\int f\left[\sqrt{n}\left(d P_{n}^{1 / 2}-d P^{1 / 2}\right)-\frac{1}{2} h d P^{1 / 2}\right]\left[d P_{n}^{1 / 2}+d P^{1 / 2}\right]
\end{aligned}
$$

By the Cauchy-Schwarz inequality, the second term on the right converges to zero uniformly in $f$, because $\sup _{f} \int f^{2}\left[d P_{n}^{1 / 2}+d P^{1 / 2}\right]^{2}=O(1)$ by assumption. The first term is bounded by

$$
\frac{1}{2} M \int h d P^{1 / 2}\left|d P_{n}^{1 / 2}-d P^{1 / 2}\right|+\frac{1}{2}\left(\int_{F>M} h^{2} d P\right)^{1 / 2}\left(\int f^{2}\left(d P_{n}+d P\right)\right)^{1 / 2}
$$

This converges to zero for $M=M_{n} \rightarrow \infty$ sufficiently slowly.
3.10.13 Example (Power of the Kolmogorov-Smirnov test). A test of the null hypothesis $H_{0}: P=P_{0}$, that $X_{1}, \ldots, X_{n}$ are i.i.d. according to a fixed probability measure $P_{0}$, can be based on the (generalized) Kolmogorov-Smirnov statistic $\left\|\mathbb{P}_{n}-P_{0}\right\|_{\mathcal{F}}$ for a given $P_{0}$-Donsker class $\mathcal{F}$. If $c_{\alpha}$ is the upper $\alpha$-quantile of the distribution of the norm $\|\mathbb{G}\|_{\mathcal{F}}$ of a tight Brownian bridge $\mathbb{G}$, then the test that rejects the null hypothesis if $\sqrt{n}\left\|\mathbb{P}_{n}-P_{0}\right\|_{\mathcal{F}}>c_{\alpha}$ has asymptotic level $\alpha$. The sequence of tests is consistent against every alternative $P$ such that $\mathcal{F}$ is $P$-Donsker and $\left\|P-P_{0}\right\|_{\mathcal{F}}>0$. The power against a sequence of alternatives $P_{n}$ satisfying (3.10.10) equals

$$
\mathrm{P}_{P_{n}}^{*}\left(\sqrt{n}\left\|\mathbb{P}_{n}-P_{0}\right\|_{\mathcal{F}}>c_{\alpha}\right) \rightarrow \mathrm{P}\left(\left\|\mathbb{G}(f)+P_{0} f h\right\|_{\mathcal{F}}>c_{\alpha}\right) .
$$

Unfortunately, the last expression can rarely be evaluated explicitly.

### 3.10.2 Change-Point Alternatives

For each $n$, let $X_{n 1}, \ldots, X_{n n}$ be independent random elements in a measurable space $(\mathcal{X}, \mathcal{A})$. Under the "null hypothesis", the random elements are i.i.d. with common law $P$, whereas under the alternative hypothesis, $X_{n i}$ has law $P_{n i}$. Suppose that the marginal laws $P_{n i}$ converge to the measure $P$ in the following sense:

$$
\begin{equation*}
n^{-1} \sum_{i=1}^{n} \int\left[\sqrt{n}\left(d P_{n i}^{1 / 2}-d P^{1 / 2}\right)-\frac{1}{2} h\left(\cdot, \frac{i}{n}\right) d P^{1 / 2}\right]^{2} \rightarrow 0 \tag{3.10.14}
\end{equation*}
$$

for a function $h \in L_{2}(\mathcal{X} \times[0,1], P \times \lambda)$ such that $\int h(x, t) d P(x)=0$ for every $t \in[0,1]$. Assume that the functions $t \mapsto h(x, t)$ are continuous in the sense that the sequence of discretizations $h_{n}(x, t)=\sum_{i=1}^{n} h(x, i / n) 1_{((i-1) / n, i / n]}(t)$ converges in second mean to $h$ :

$$
\begin{equation*}
(P \times \lambda)\left(h_{n}-h\right)^{2} \rightarrow 0 \tag{3.10.15}
\end{equation*}
$$

Under these assumptions, the following extension of the local asymptotic normality lemma, Lemma 3.10.11, holds.
3.10.16 Lemma. Let the sequence of probability measures $P_{n}=P_{n 1} \times \ldots \times P_{n n}$ satisfy (3.10.14) and (3.10.15). Then

$$
\sum_{i=1}^{n} \log \frac{d P_{n i}}{d P}\left(X_{n i}\right)=\frac{1}{\sqrt{n}} \sum_{i=1}^{n} h\left(X_{n i}, \frac{i}{n}\right)-\frac{1}{2}(P \times \lambda) h^{2}+R_{n}
$$

where the sequence $R_{n}$ converges to zero in probability under both $P^{n}$ and $P_{n}$ and the sequence $n^{-1 / 2} \sum_{i=1}^{n} h\left(X_{n i}, i / n\right)$ converges under $P^{n}$ in distribution to a normal distribution with mean zero and variance $(P \times \lambda) h^{2}$.

Proof. Condition (3.10.15) implies the convergence of variances as well as the Lindeberg condition for the tangent vectors $h(\cdot, i / n)$ :

$$
\begin{aligned}
&(P \times \lambda)\left(h_{n}^{2}\right)=\frac{1}{n} \sum_{i=1}^{n} P h^{2}\left(\cdot, \frac{i}{n}\right) \\
& \frac{1}{n} \sum_{i=1}^{n} P h^{2}\left(\cdot, \frac{i}{n}\right)\left\{\left|h\left(\cdot, \frac{i}{n}\right)\right| \geq \varepsilon \sqrt{n}\right\} h^{2} \\
& \rightarrow 0, \quad \text { for every } \varepsilon>0
\end{aligned}
$$

Next the lemma follows from, for instance, Proposition A.8, page 182, Van der Vaart (1988); or Hájek and Šidák (1967), Chapter VI, Section 1, pages 201-209; or Bickel, Klaassen, Ritov, and Wellner (1993), Appendix A.9, page 498-513.

Let $\mathbb{Z}_{n}$ be the sequential empirical process $n^{-1 / 2} \sum_{i=1}^{\lfloor n s\rfloor}\left(f\left(X_{n i}\right)-P f\right)$ under the null hypothesis. The linear expansion of the loglikelihood ratio $\Lambda_{n}\left(P_{n}, P^{n}\right)=\log d P_{n} / d P^{n}$ given by the preceding lemma combined with Slutsky's lemma and the Lindeberg-Feller central limit theorem gives, for any $s$ and any $f$ with $P f^{2}<\infty$,

$$
\left(\mathbb{Z}_{n}(s, f), \Lambda_{n}\left(P_{n}, P^{n}\right)\right) \stackrel{P}{\rightsquigarrow} N\left(\binom{0}{-\frac{1}{2} \sigma^{2}},\left(\begin{array}{cc}
s P(f-P f)^{2} & c(s, f) \\
c(s, f) & (P \times \lambda) h^{2}
\end{array}\right)\right)
$$

Here $c(s, f)$ is the asymptotic covariance of $\mathbb{Z}_{n}$ and the log likelihood ratios and is given by

$$
c(s, f)=(P \times \lambda) f h[0, s]=\int_{0}^{s} \int_{\mathcal{X}} f(x) h(x, t) d P(x) d t
$$

In view of Le Cam's third lemma, this implies that under the alternative hypothesis, for every $(s, f)$ in $[0,1] \times \mathcal{F}$,

$$
\mathbb{Z}_{n}(s, f) \stackrel{P_{n}}{\leadsto} N\left(c(s, f), s P(f-P f)^{2}\right) .
$$

The following theorem yields the corresponding conclusion for the whole process $\mathbb{Z}_{n}$ in $\ell^{\infty}([0,1] \times \mathcal{F})$.
3.10.17 Theorem. Let $\mathcal{F}$ be a $P$-Donsker class of measurable functions with $\|P\|_{\mathcal{F}}<\infty$. If the triangular array of probability measures $P_{n i}$ satisfies (3.10.14) and (3.10.15), then the sequence $\mathbb{Z}_{n}$ converges weakly in $\ell^{\infty}([0,1] \times \mathcal{F})$ to the process

$$
(s, f) \mapsto \mathbb{Z}(s, f)+(P \times \lambda) f h[0, s]
$$

where $\mathbb{Z}$ is a tight $P$-Kiefer-Müller process. If, in addition, the sequence of average measures $\bar{P}_{n}=n^{-1} \sum_{1}^{n} P_{n i}$ satisfies $\left\|\bar{P}_{n} f^{2}\right\|_{\mathcal{F}}=O(1)$, then the sequence of processes $n^{-1 / 2} \sum_{i=1}^{\lfloor n s\rfloor}\left(\delta_{X_{n i}}-P_{n i}\right) f$ converges in distribution under $P_{n}=P_{n 1} \times \ldots \times P_{n n}$ in $\ell^{\infty}([0,1] \times \mathcal{F})$ to $\mathbb{Z}$.

Proof. The first assertion follows by combining Prohorov's theorem and Le Cam's third lemma as in the proof of Theorem 3.10.12.

For the second assertion it suffices to show that

$$
\left\|\frac{1}{\sqrt{n}} \sum_{i=1}^{\lfloor n s\rfloor}\left(P_{n i}-P\right) f-(P \times \lambda) f h[0, s]\right\|_{[0,1] \times \mathcal{F}} \rightarrow 0
$$

By extension of the argument in the proof of Theorem 3.10.12 the sequence $n^{-1} \sum_{i=1}^{\lfloor n s\rfloor}\left[\sqrt{n}\left(P_{n i}-P\right) f-P f h(\cdot, i / n)\right]$ converges to zero uniformly in $(s, f)$. Furthermore, since $\left|\int_{0}^{s} h_{n}(x, t) d t-n^{-1} \sum_{i=1}^{\lfloor n s\rfloor} h(x, i / n)\right|$ is bounded above by $n^{-1}|h(x,(\lfloor n s\rfloor+1) / n)|$, it follows that for every $(s, f)$

$$
\begin{aligned}
& \left|\frac{1}{n} \sum_{i=1}^{\lfloor n s\rfloor} P f h\left(\cdot, \frac{i}{n}\right)-(P \times \lambda) f h 1_{[0, s]}\right| \\
& \quad \leq \frac{1}{n} P \sup _{i}\left|h\left(\cdot, \frac{i}{n}\right) f\right|+(P \times \lambda)\left|f h_{n}-f h\right| .
\end{aligned}
$$

In view of condition (3.10.15), the sequence $n^{-1} \sum_{i=1}^{n} P h^{2}(\cdot, i / n)=(P \times \lambda) h_{n}^{2}$ is bounded. Two applications of the Cauchy-Schwarz inequality show that the expressions in the last display converge to zero uniformly in $(s, f)$. $\square$
3.10.18 Example (Change-point alternatives). Let $\left\{P_{n}\right\}$ be a given sequence that satisfies (3.10.10), and let $t \in(0,1)$ be fixed. Define $P_{n i}$ to be $P$ for $1 \leq i \leq\lfloor n t\rfloor$ and define it to be $P_{n}$ for $\lfloor n t\rfloor<i \leq n$. Thus the distribution governing the observations changes from $P$ to $P_{n}$ between $i=\lfloor n t\rfloor$ and $i=\lfloor n t\rfloor+1$.

These "change-point alternatives" satisfy the conditions of the preceding theorem, with $h(x, s)=h(x) 1\{s>t\}$.

## Problems and Complements

1. (Contiguity and limit experiments) Let $P_{\alpha}$ and $Q_{\alpha}$ be nets of probability measures on measurable spaces $\left(\mathcal{X}_{\alpha}, \mathcal{B}_{\alpha}\right)$. There exist probability measures $P$ and $Q$ on a measurable space ( $\mathcal{X}, \mathcal{B}$ ) and a subnet such that $d P_{\alpha} / d Q_{\alpha} \rightsquigarrow d P / d Q$ under $Q_{\alpha}$ and $d Q_{\alpha} / d P_{\alpha} \rightsquigarrow d Q / d P$ under $P_{\alpha}$ along the subnet. (Here the laws of the limits are computed under $Q$ and $P$, respectively.) Contiguity $Q_{\alpha} \triangleleft P_{\alpha}$ holds if and only if for every such subnet and pairs $P$ and $Q$ one has $Q \ll P$. For sequences this is already true with subsequence replacing subnet.
[Hint: Let $W$ be a weak limit point of the maps $d P_{\alpha} /\left(d P_{\alpha}+d Q_{\alpha}\right): \mathcal{X}_{\alpha} \mapsto[0,1]$ under $P_{\alpha}+Q_{\alpha}$. ( $W$ has total mass 2.) By the continuous mapping theorem applied in $\overline{\mathbb{R}}$, one has $d P_{\alpha} / d Q_{\alpha} \rightsquigarrow W /(1-W)$ and $d Q_{\alpha} / d P_{\alpha} \rightsquigarrow(1-W) / W$ (take $1 / 0=\infty$ ). On $\mathcal{X}=[0,1]$ with Borel sets, define $P(A)=\mathrm{E} 1_{A}(W) W$ and $Q(A)=\mathrm{E} 1_{A}(W)(1-W)$. Then $(P+Q)(A)=\mathrm{E} 1_{A}(W)$, so that $d P / d Q(w)= w /(1-w)$ and $d Q / d P(w)=(1-w) / w$. The second assertion follows from the first, the characterization of contiguity in terms of likelihood ratios and the equivalence of the three statements: $Q \ll P ; Q(d P / d Q=0)=0$; and $\mathrm{E}_{P} d Q / d P=1$.]
2. Let $P_{\alpha}$ and $Q_{\alpha}$ be nets of probability measures on measurable spaces $\left(\Omega_{\alpha}, \mathcal{A}_{\alpha}\right)$ such that $P_{\alpha}\left(A_{\alpha}\right) \rightarrow 0$ implies $Q_{\alpha}\left(A_{\alpha}\right) \rightarrow 0$ for every choice of measurable sets $A_{\alpha}$. Then not necessarily $Q_{\alpha} \triangleleft P_{\alpha}$.
[Hint: Subnets are tricky. See Le Cam (1986), page 87.]
3. (Conditions that imply the Lindeberg-Feller condition)

Let $A_{n}(s)=n^{-1} \sum_{i=1}^{\lfloor n s\rfloor} h^{2}\left(X_{n i}, i / n\right)$ and $A(s)=\int_{0}^{s} P h^{2}(\cdot, t) d t$.
(i) If $A_{n}(1) \xrightarrow{\mathrm{P}} A(1)$ and $h_{n} \rightarrow h$ in $P \times \lambda$-measure, then the Lindeberg condition holds.
(ii) If $A_{n}(s) \xrightarrow{\mathrm{P}} A(s)$ for each $0 \leq s \leq 1$ and $h_{n} \rightarrow h$ in $L_{2}(P \times \lambda)$, then the Lindeberg condition holds.
[Hint: Greenwood and Shiryayev (1985), remark 1, page 116.]
4. Use Theorem 3.10.12 to investigate the local asymptotic power of the bootstrap and permutation independence tests defined in Chapter 3.8.
5. Suppose that $X_{1}, \ldots, X_{n}$ are i.i.d. with distribution function $F$ on $[0,1]$. Let $F_{0}$ be the Uniform $[0,1]$ distribution function. Consider testing the null hypothesis $F=F_{0}$ versus the alternative that $F(x) \geq F_{0}(x)$ for all $x$ with strict inequality for some $x$, based on the statistics

$$
A_{n}^{+}=\int_{0}^{1} \sqrt{n}\left[\mathbb{F}_{n}(t)-F_{0}(t)\right]^{+} d t \quad \text { and } \quad B_{n}=\int_{0}^{1} \sqrt{n}\left[\mathbb{F}_{n}(t)-F_{0}(t)\right] d t
$$

Investigate the local asymptotic power of these two tests.

### 3.11

## Convolution and Minimax Theorems

Let $H$ be a linear subspace of a Hilbert space with inner product $\langle\cdot, \cdot\rangle$ and norm $\|\cdot\|$. For each $n \in \mathbb{N}$ and $h \in H$, let $P_{n, h}$ be a probability measure on a measurable space $\left(\mathcal{X}_{n}, \mathcal{A}_{n}\right)$. Consider the problem of estimating a "parameter" $\kappa_{n}(h)$ given an "observation" $X_{n}$ with law $P_{n, h}$. The convolution theorem and the minimax theorem give a lower bound on how well $\kappa_{n}(h)$ can be estimated asymptotically as $n \rightarrow \infty$. Suppose the sequence of statistical experiments $\left(\mathcal{X}_{n}, \mathcal{A}_{n}, P_{n, h}: h \in H\right)$ is "asymptotically normal" and the sequence of parameters is "regular". Then the limit distribution of every "regular" estimator sequence is the convolution of a certain Gaussian distribution and a noise factor. Furthermore, the maximum risk of any estimator sequence is bounded below by the "risk" of this Gaussian distribution. These concepts are defined as follows.

For ease of notation, let $\left\{\Delta_{h}: h \in H\right\}$ be the "iso-Gaussian process" with zero mean and covariance function $\mathrm{E} \Delta_{h_{1}} \Delta_{h_{2}}=\left\langle h_{1}, h_{2}\right\rangle$. The sequence of experiments ( $\mathcal{X}_{n}, \mathcal{A}_{n}, P_{n, h}: h \in H$ ) is called asymptotically (shift) normal if

$$
\log \frac{d P_{n, h}}{d P_{n, 0}}=\Delta_{n, h}-\frac{1}{2}\|h\|^{2}
$$

for stochastic processes $\left\{\Delta_{n, h}: h \in H\right\}$ such that

$$
\Delta_{n, h} \stackrel{0}{\leadsto} \Delta_{h} \quad \text { marginally. }
$$

Here $\underset{\rightarrow}{h}$ denotes weak convergence under $P_{n, h}$. This terminology arises from the theory of limiting experiments due to Le Cam, which, however, we shall not use in this chapter.

The sequence of parameters $\kappa_{n}(h)$ is assumed to belong to a Banach space $\mathbf{B}$. It should be regular in the sense that

$$
r_{n}\left(\kappa_{n}(h)-\kappa_{n}(0)\right) \rightarrow \dot{\kappa}(h), \quad \text { for every } h \in H
$$

for a continuous, linear map $\dot{\kappa}: H \mapsto \mathbf{B}$ and certain linear maps $r_{n}: \mathbf{B} \mapsto \mathbf{B}$ ("norming operators"). Any maps $T_{n}: \mathcal{X}_{n} \mapsto \mathbf{B}$ are considered estimators of the parameter. A sequence of estimators $T_{n}$ is regular with respect to the norming operators $r_{n}$ if

$$
r_{n}\left(T_{n}-\kappa_{n}(h)\right) \stackrel{h}{\rightsquigarrow} L, \quad \text { for every } h \in H,
$$

for a fixed, tight, Borel probability measure $L$ on $\mathbf{B}$.
This set-up covers many examples. In the simplest and most common examples, the observation at time $n$ is a sample of $n$ independent observations from a fixed measure $P$.
3.11.1 Example (I.i.d. observations). Let $X_{1}, \ldots, X_{n}$ be an i.i.d. sample from a probability measure $P$ on the measurable space $(\mathcal{X}, \mathcal{A})$. The common law $P$ is known to belong to a class $\mathcal{P}$ of probability measures. It is required to estimate the parameter $\kappa(P)$.

Sequences of asymptotically normal experiments arise as "localized" or "rescaled" experiments. Fix some $P \in \mathcal{P}$ and set $P_{n, 0}=P^{n}$. Consider one-dimensional submodels $t \mapsto P_{t}$ (maps from $[-1,1] \subset \mathbb{R}$ to $\mathcal{P}$ ) such that

$$
\int\left[\frac{d P_{t}^{1 / 2}-d P^{1 / 2}}{t}-\frac{1}{2} h d P^{1 / 2}\right]^{2} \rightarrow 0, \quad t \rightarrow 0
$$

for some measurable function $h: \mathcal{X} \mapsto \mathbb{R}$. Single out those paths such that also

$$
\frac{\kappa\left(P_{t}\right)-\kappa(P)}{t} \rightarrow \dot{\kappa}(h)
$$

for some continuous linear map $\dot{\kappa}: L_{2}(P) \mapsto \mathbf{B}$. A function $h \in L_{2}(P)$ for which there exists a path $t \mapsto P_{t}$ with the first property is called a score function, and the collection of all score functions is called the tangent set at $P$ (relative to $\mathcal{P}$ ). Let $H$ be a linear subspace of the tangent set such that for every $h \in H$ there exists a path $t \mapsto P_{t}$ with both properties. For each $h$, set $P_{n, h}=P_{1 / \sqrt{n}}$ for a corresponding path $t \mapsto P_{t}$. Then Lemma 3.10.11 implies that the sequence of experiments ( $\mathcal{X}^{n}, \mathcal{A}^{n}, P_{n, h}: h \in H$ ) is asymptotically normal. (Since the experiments are "local" the sequence is often called locally asymptotically normal (LAN).) Furthermore, the sequence of parameters $\kappa\left(P_{n, h}\right)$ is regular with respect to the norming operators $\sqrt{n}$ (the maps $b \rightarrow \sqrt{n} b$ ).

A sequence of estimators $T_{n}=T_{n}\left(X_{1}, \ldots, X_{n}\right)$ is regular if

$$
\sqrt{n}\left(T_{n}-\kappa\left(P_{n, h}\right)\right) \stackrel{n}{\leadsto} L, \quad \text { for every } h \in H,
$$

for a some fixed, tight Borel measure $L$. The weak convergence in this display refers to a sequence of laws $P_{1 / \sqrt{n}}$ that converges to $P$. Thus, in this situation regularity comes down to a certain uniformity in reaching the limit measure. In particular, regularity is weaker than weak convergence uniformly in $P^{\prime}$ ranging through a "neighborhood" of $P$ combined with continuity of the limiting measures as $P^{\prime}$ approaches $P$.

The continuous, linear map $\dot{\kappa}: H \mapsto \mathbf{B}$ has an adjoint map $\dot{\kappa}^{*}: \mathbf{B}^{*} \mapsto \bar{H}$, which maps the dual space of $\mathbf{B}$ into the completion of $H$. This is determined by $\left\langle\dot{\kappa}^{*} b^{*}, h\right\rangle=b^{*} \dot{\kappa}(h)$.
3.11.2 Theorem (Convolution). Let the sequence of statistical experiments ( $\mathcal{X}_{n}, \mathcal{A}_{n}, P_{n, h}: h \in H$ ) be asymptotically normal and the sequences of parameters $\kappa_{n}(h)$ and estimators $T_{n}$ be regular. Then the limit distribution $L$ of the sequence $r_{n}\left(T_{n}-\kappa_{n}(0)\right)$ equals the distribution of a sum $G+W$ of independent, tight, Borel measurable random elements in $\mathbf{B}$ such that

$$
b^{*} G \sim N\left(0,\left\|\dot{\kappa}^{*} b^{*}\right\|^{2}\right), \quad \text { for every } b^{*} \in \mathbf{B}^{*} .
$$

Here $\dot{\kappa}^{*}: \mathbf{B}^{*} \mapsto \bar{H}$ is the adjoint of $\dot{\kappa}$. The law of $G$ concentrates on the closure of $\dot{\kappa}(H)$.

Proof. (a) Assume first that the dimension of $H$ is finite. Let $h_{1}, \ldots, h_{k}$ be an orthonormal base and set

$$
\begin{aligned}
Z_{n, a} & =r_{n}\left(T_{n}-\kappa_{n}\left(\sum a_{i} h_{i}\right)\right) \\
\Lambda_{n}(a) & =\log \frac{d P_{n, h}}{d P_{n, 0}}=\Delta_{n, h}-\frac{1}{2}\|h\|^{2}, \quad \text { for } h=\sum a_{i} h_{i}
\end{aligned}
$$

By assumption, the sequence $Z_{n, 0}$ and each sequence $\Delta_{n, h}$ converge in distribution in $\mathbf{B}$ and $\overline{\mathbb{R}}$, respectively. By Prohorov's theorem, there exists a subsequence of $\{n\}$ such that

$$
\left(Z_{n^{\prime}, 0}, \Delta_{n^{\prime}, h_{1}}, \ldots, \Delta_{n^{\prime}, h_{k}}\right) \stackrel{0}{\leadsto}\left(Z, \Delta_{h_{1}}, \ldots, \Delta_{h_{k}}\right),
$$

in $\mathbf{B} \times \mathbb{R}^{k}$. By assumption, $Z$ has (marginal) distribution equal to $L$.
The random variable $\Delta_{\Sigma a_{i} h_{i}}-\sum a_{i} \Delta_{h_{i}}$ has second moment zero. Hence this variable is zero almost surely. Conclude that the sequence $\Delta_{n, \Sigma a_{i} h_{i}}- \sum a_{i} \Delta_{n, h_{i}}$ converges to zero in probability under $P_{n, 0}$. Combination with the preceding displays and the regularity of the sequence of parameters yield, for every $a \in \mathbb{R}^{k}$,

$$
\left(Z_{n^{\prime}, a}, \Lambda_{n^{\prime}}(a)\right) \stackrel{0}{\rightsquigarrow}\left(Z-\sum a_{i} \dot{\kappa}\left(h_{i}\right), \sum a_{i} \Delta_{h_{i}}-\frac{1}{2}\|a\|^{2}\right) .
$$

Apply Le Cam's third lemma, Theorem 3.10.7, to see that $Z_{n^{\prime}, a} \stackrel{a}{\sim} Z_{a}$, where $\underset{\sim}{a}$ denotes weak convergence under $P_{n, h}$ for $h=\sum a_{i} h_{i}$, and $Z_{a}$ is distributed according to

$$
\begin{equation*}
\mathrm{P}\left(Z_{a} \in B\right)=\mathrm{E} 1_{B}\left(Z-\sum a_{i} \dot{\kappa}\left(h_{i}\right)\right) e^{\sum a_{i} \Delta_{h_{i}}-\frac{1}{2}\|a\|^{2}} \tag{3.11.3}
\end{equation*}
$$

Since the sequence $T_{n}$ is regular, the left side equals $L(B)$ for each $a$. Average the left side and the right side over $a$ with respect to a $N_{k}\left(0, \lambda^{-1} I\right)$ weight function. Straightforward calculations yield

$$
L(B)=\int \mathrm{E} 1_{B}\left(Z-\frac{\sum \Delta_{h_{i}} \dot{\kappa}\left(h_{i}\right)}{1+\lambda}-\frac{\sum a_{i} \dot{\kappa}\left(h_{i}\right)}{(1+\lambda)^{1 / 2}}\right) c_{\lambda}(\Delta) d N_{k}(0, I)(a)
$$

where $c_{\lambda}(\Delta)=\left(1+\lambda^{-1}\right)^{k / 2} \exp \left(\frac{1}{2}(1+\lambda)^{-1} \sum \Delta_{h_{i}}^{2}\right)$. Conclude that $L$ can be written as the law of the sum $G_{\lambda}+W_{\lambda}$ of independent random elements $G_{\lambda}$ and $W_{\lambda}$, where $G_{\lambda}=\sum A_{i} \dot{\kappa}\left(h_{i}\right) /(1+\lambda)^{1 / 2}$ for a $N_{k}(0, I)$-distributed vector $\left(A_{1}, \ldots, A_{k}\right)$ and $W_{\lambda}$ is distributed according to

$$
\mathrm{P}\left(W_{\lambda} \in B\right)=\mathrm{E} 1_{B}\left(Z-\frac{\sum \Delta_{h_{i}} \dot{\kappa}\left(h_{i}\right)}{1+\lambda}\right) c_{\lambda}(\Delta) .
$$

As $\lambda \downarrow 0$, we have $G_{\lambda} \rightsquigarrow G=\sum A_{i} \dot{\kappa}\left(h_{i}\right)$. The variable $b^{*} G= \sum A_{i} b^{*} \dot{\kappa}\left(h_{i}\right)$ is normally distributed with zero mean and variance

$$
\mathrm{E} b^{*} G_{\lambda}^{2}=\sum\left(b^{*} \dot{\kappa}\left(h_{i}\right)\right)^{2}=\left\|\dot{\kappa}^{*} b^{*}\right\|^{2}
$$

By the converse part of Prohorov's theorem, the variables $\left\{G_{\lambda}: 0<\lambda<1\right\}$ are uniformly tight. Combined with the tightness of $L$ and the convolution statement, it follows that the variables $\left\{W_{\lambda}: 0<\lambda<1\right\}$ are uniformly tight (Problem 3.11.4). If $W_{\lambda_{m}} \rightsquigarrow W$ for a sequence $\lambda_{m} \downarrow 0$, then $\left(G_{\lambda_{m}}, W_{\lambda_{m}}\right) \rightsquigarrow(G, W)$, where $G$ and $W$ are independent and $G+W$ is distributed according to $L$. This concludes the proof of the theorem for finite-dimensional $H$.
(b) Let $H$ be arbitrary. For any finite orthonormal set $h_{1}, \ldots, h_{k}$, the previous argument yields tight independent processes $G_{k}$ and $W_{k}$ such that $G_{k}+W_{k}$ is distributed according to $L$ and $G_{k}$ is zero-mean Gaussian with

$$
\mathrm{E} b^{*} G_{k}^{2}=\sum_{i=1}^{k}\left\langle\dot{\kappa}^{*} b^{*}, h_{i}\right\rangle^{2}
$$

The set of all variables $G_{k}$ and $W_{k}$ so obtained is uniformly tight. Indeed, by tightness of $L$, there exists for any given $\varepsilon>0$ a compact set $K$ such that $L(K)=\int \mathrm{P}\left(G_{k} \in K-x\right) d P^{W_{k}}(x)>1-\varepsilon$. Thus there exists $x_{0}$ with $\mathrm{P}\left(G_{k} \in K-x_{0}\right)>1-\varepsilon$. By symmetry, $\mathrm{P}\left(G_{k} \in x_{0}-K\right)>1-\varepsilon$, whence $\mathrm{P}\left(G_{k} \in \frac{1}{2}(K-K)\right)>1-2 \varepsilon$. Next, the uniform tightness of $L$ and the collection $G_{k}$ imply the uniform tightness of the collection $W_{k}$.

Direct the finite-dimensional subspaces of $H$ by inclusion, and construct variables $\left(G_{k}, W_{k}\right)$ for every subspace. Every weak limit point $(G, W)$ of the net of laws ( $G_{k^{\prime}}, W_{k^{\prime}}$ ) satisfies the requirements of the theorem.

In the convolution theorem the distribution of the Gaussian variable $G$ is interpreted as the optimal limit law. The distribution of $G$ is completely
determined by the model, through the properties of $\dot{\kappa}$ and $H$. The variable $W$ is interpreted as a noise factor that is zero for optimal estimator sequences.

The convolution of a zero-mean Gaussian variable with an arbitrary second variable leads to a loss of concentration. This is most easily understood in terms of variances: convolution increases variance. The following lemma makes the statement precise in terms of general subconvex risk functions. A nonnegative map $\ell: \mathbf{B} \mapsto \mathbb{R}$ is subconvex if the set $\{y: \ell(y) \leq c\}$ is closed, convex, and symmetric for every $c$.
3.11.4 Lemma. Let $\ell: \mathbf{B} \mapsto \mathbb{R}$ be subconvex. Let $G$ be a tight, zero-mean, Borel measurable Gaussian variable and $W$ be an arbitrary, tight, Borel measurable variable independent of $G$. Then

$$
\mathrm{E} \ell(G+W) \geq \mathrm{E} \ell(G)
$$

In particular, $\mathrm{P}(\|G+W\| \leq c) \leq \mathrm{P}(\|G\| \leq c)$ for every $c$.
Proof. For a finite-dimensional Banach space, this assertion is a special case of Anderson's lemma. The general case can be proved by the approximation of $\ell$ from below by cylinder functions. See step (b) of the proof of the minimax theorem, Theorem 3.11.5.

A subconvex function is certainly lower semicontinuous. Therefore, the portmanteau theorem, the lemma, and the convolution theorem can be combined to yield, for any regular estimator sequence $T_{n}$ and subconvex loss function $\ell$,

$$
\liminf _{n \rightarrow \infty} \mathrm{E}_{0 *} \ell\left(r_{n}\left(T_{n}-\kappa_{n}(0)\right)\right) \geq \mathrm{E} \ell(G)
$$

This inequality may fail for nonregular estimator sequences. However, according to the minimax theorem, the maximum risk $\sup _{h} \mathrm{E}_{h *} \ell\left(r_{n}\left(T_{n}-\right.\right. \left.\kappa_{n}(h)\right)$ ) can never asymptotically fall below $\mathrm{E} \ell(G)$ under just some measurability conditions on the estimator sequence $T_{n}$. The following theorem gives a slightly stronger result.

A little (asymptotic) measurability is the only requirement on $T_{n}$, but measurability can be restrictive, so we need to be careful about it. Let $\mathbf{B}^{\prime}$ be a given subspace of $\mathbf{B}^{*}$ that separates points of $\mathbf{B}$, and let $\tau\left(\mathbf{B}^{\prime}\right)$ be the weak topology induced on $\mathbf{B}$ by the maps $b^{\prime}: \mathbf{B} \mapsto \mathbb{R}$ when $b^{\prime}$ ranges over $\mathbf{B}^{\prime}$. A map $\ell: \mathbf{B} \mapsto \mathbb{R}$ is called $\tau\left(\mathbf{B}^{\prime}\right)$-subconvex if the sets $\{y: \ell(y) \leq c\}$ are $\tau\left(\mathbf{B}^{\prime}\right)$-closed, convex, and symmetric for every $c$. An estimator sequence $T_{n}$ is asymptotically $\mathbf{B}^{\prime}$-measurable if

$$
\mathrm{E}_{0}^{*} f\left(r_{n}\left(T_{n}-\kappa_{n}(0)\right)\right)-\mathrm{E}_{0 *} f\left(r_{n}\left(T_{n}-\kappa_{n}(0)\right)\right) \rightarrow 0
$$

for every function $f$ of the form $f(y)=g\left(b_{1}^{\prime} y, \ldots, b_{k}^{\prime} y\right)$ with $b_{1}^{\prime}, \ldots, b_{k}^{\prime}$ in $\mathbf{B}^{\prime}$ and $g: \mathbb{R}^{k} \mapsto \mathbb{R}$ continuous and bounded. Clearly, every (asymptotically)
measurable sequence is asymptotically $\tau\left(\mathbf{B}^{\prime}\right)$-measurable. A sequence of stochastic processes in a function space is $\tau\left(\mathbf{B}^{\prime}\right)$-measurable for $\mathbf{B}^{\prime}$ equal to the set of coordinate projections.
3.11.5 Theorem (Minimax theorem). Let the sequence of experiments ( $\mathcal{X}_{n}, \mathcal{A}_{n}, P_{n, h}: h \in H$ ) be asymptotically normal and the sequence of parameters $\kappa_{n}(h)$ be regular. Suppose a tight, Borel measurable Gaussian element $G$, as in the statement of the convolution theorem, exists. Then for every asymptotically $\mathbf{B}^{\prime}$-measurable estimator sequence $T_{n}$ and $\tau\left(\mathbf{B}^{\prime}\right)$-subconvex function $\ell$,

$$
\sup _{I \subset H} \liminf _{n \rightarrow \infty} \sup _{h \in I} \mathrm{E}_{h *} \ell\left(r_{n}\left(T_{n}-\kappa_{n}(h)\right)\right) \geq \mathrm{E} \ell(G) .
$$

Here the first supremum is taken over all finite subsets $I$ of $H$.
Proof. (a). Assume first that the loss function can be written in the special form $\ell(y)=\sum_{i=1}^{r} 1_{K_{i}^{c}}\left(b_{i, 1}^{\prime} y, \ldots, b_{i, p_{i}}^{\prime} y\right)$ for compact, convex, symmetric subsets $K_{i} \subset \mathbb{R}^{p_{i}}$ and arbitrary elements $b_{i, j}^{\prime}$ of $\mathbf{B}^{\prime}$. Fix an arbitrary orthonormal set $h_{1}, \ldots, h_{k}$ in $H$, and set

$$
Z_{n, a}^{i}=\left(b_{i, 1}^{\prime}, \ldots, b_{i, p_{i}}\right) \circ r_{n}\left(T_{n}-\kappa_{n}\left(\sum a_{i} h_{i}\right)\right), \quad 1 \leq i \leq r
$$

Considered as maps into the one-point compactification of $\mathbb{R}^{p_{i}}$, the sequences $Z_{n, a}^{i}$ are certainly asymptotically tight. The sequences are asymptotically measurable by assumption.

Direct the finite subsets of $H$ by inclusion. There exists a subnet $\left\{n_{I}: I \subset H\right.$, finite $\}$ such that the left side of the statement of the theorem equals

$$
\operatorname{minimax} \text { risk }=\limsup _{I} \sup _{h \in I} \mathrm{E}_{h *} \ell\left(r_{n}\left(T_{n}-\kappa_{n}(h)\right)\right) .
$$

By the same arguments as in the proof of the convolution theorem there is a further subnet $\left\{n^{\prime}\right\} \subset\left\{n_{I}\right\}$ such that $Z_{n^{\prime}, a}^{i} \underset{\sim}{a} Z_{a}^{i}$ in the one-point compactifications, for every $a \in \mathbb{R}^{k}$ and every $i$. Here the limiting processes satisfy, for each $i$,

$$
\int \mathcal{L}\left(Z_{a}^{i}\right) d N_{k}\left(0, \lambda^{-1} I\right) \sim G_{\lambda}^{i}+W_{\lambda}^{i}
$$

for independent elements $G_{\lambda}^{i}$ and $W_{\lambda}^{i}$ such that

$$
G_{\lambda}^{i}=\left(b_{i, 1}^{\prime}, \ldots, b_{i, p_{i}}\right) \circ G_{\lambda}=\left(b_{i, 1}^{\prime}, \ldots, b_{i, p_{i}}\right) \circ \frac{\sum A_{i} \dot{\kappa}\left(h_{i}\right)}{(1+\lambda)^{1 / 2}}
$$

for a $N_{k}(0, I)$-distributed vector $\left(A_{1}, \ldots, A_{k}\right)$. By the portmanteau theorem,

$$
\operatorname{minimax} \text { risk } \geq \liminf _{n^{\prime}} \sum_{i=1}^{r} \mathrm{P}_{a *}\left(Z_{n^{\prime}, a}^{i} \notin \mathcal{K}_{i}\right) \geq \sum_{i=1}^{r} \mathrm{P}\left(Z_{a}^{i} \notin K_{i}\right) .
$$

Since this is true for every $a$, the left side is also bounded below by the average of the right side. Combination with Lemma 3.11.4 (only the finitedimensional case is needed here) yields

$$
\operatorname{minimax} \text { risk } \geq \sum_{i=1}^{r} \mathrm{P}\left(G_{\lambda}^{i}+W_{\lambda}^{i} \notin K_{i}\right) \geq \sum_{i=1}^{r} \mathrm{P}\left(G_{\lambda}^{i} \notin K_{i}\right)=\mathrm{E} \ell\left(G_{\lambda}\right) .
$$

Finish the proof for this special form of loss function by letting $\lambda \downarrow 0$ followed by taking the limit along finite-dimensional subspaces of $H$.
(b). An arbitrary subconvex $\ell$ can be approximated from below by a sequence of functions $\ell_{r}$ of the type as in (a). More precisely, the sequence $\ell_{r}$ can be constructed such that $0 \leq \ell_{r} \leq \ell$ everywhere and $\ell_{r} \uparrow \ell G$-almost surely. It follows that the minimax risk decreases when $\ell$ is replaced by $\ell_{r}$. Combination with (a) shows that the minimax risk is bounded below by $\mathrm{E} \ell_{r}(G)$ for every $r$. The theorem follows by letting $r \rightarrow \infty$.

For the construction of $\ell_{r}$, note first that

$$
0 \leq 2^{-r} \sum_{i=1}^{2^{2 r}} 1\left\{y: \ell(y)>i 2^{-r}\right\} \uparrow \ell(y), \quad \text { for every } y
$$

Each of the sets $\{y: \ell(y)>i / r\}$ is convex, $\tau\left(\mathbf{B}^{\prime}\right)$-closed, and symmetric. Thus, it suffices to approximate functions $\ell$ of the type $1_{C^{c}}$ for a convex, $\tau\left(\mathbf{B}^{\prime}\right)$-closed, and symmetric set $C$.

By the Hahn-Banach theorem, any such set $C$ can be written

$$
C=\bigcap_{b^{\prime} \in \mathbf{B}^{\prime}}\left\{y:\left|b^{\prime} y\right| \leq c_{b^{\prime}}\right\} .
$$

Thus the complement of $C$ intersected with the support $S$ of the limit variable $G$ is the union of the sets $\left\{y \in S:\left|b^{\prime} y\right|>c_{b^{\prime}}\right\}$. These sets are relatively open in $S$ and $S$ is separable. Since a separable set is Lindelöf, the possibly uncountable union can be replaced by a countable subunion. Thus there exists a sequence $b_{i}^{\prime}$ in $\mathbf{B}^{\prime}$ and numbers $c_{i}$ such that $C^{c} \cap S= \cup_{i=1}^{\infty}\left\{y \in S:\left|b_{i}^{\prime} y\right|>c_{i}\right\}$. This implies that

$$
1_{C^{c} \cap S}=\sup _{r} 1_{K_{r}^{c}}\left(b_{1}^{\prime} y, \ldots, b_{r}^{\prime} y\right),
$$

for the subsets of $\mathbb{R}^{r}$ defined by $K_{r}=\cap_{i=1}^{r}\left\{x \in \mathbb{R}^{r}:\left|x_{i}\right| \leq c_{i}\right\}$.
3.11.6 Example (Separable Banach space). A convex set in a Banach space is closed with respect to the norm if and only if it is weakly closed. This means that " $\tau\left(\mathbf{B}^{*}\right)$-subconvex" is identical to "subconvex".

We conclude that the minimax theorem is valid for Borel measurable estimator sequences $T_{n}$ and every subconvex loss function. The restriction that each $T_{n}$ be Borel measurable is reasonable in separable Banach spaces, but less so in nonseparable spaces.
3.11.7 Example (Skorohod space). Consider the Skorohod space $D[a, b]$ for a given interval $[a, b] \subset \overline{\mathbb{R}}$, equipped with the uniform norm. The dual space consists of maps of the form

$$
d^{*}(z)=\int z(u) d \mu(u)+\sum_{i=1}^{\infty} \alpha_{i}\left(z\left(u_{i}\right)-z\left(u_{i}-\right)\right)
$$

for a finite signed measure $\mu$ on $[a, b]$, an arbitrary sequence $u_{i}$ in $(a, b]$, and a sequence $\alpha_{i}$ with $\sum\left|\alpha_{i}\right|<\infty$. ${ }^{b}$ Each such $d^{*}$ is the pointwise limit of a sequence of linear combinations of coordinate projections. Thus, the $\sigma$-field generated by the dual space equals the $\sigma$-field generated by the coordinate projections.

It follows that an estimator sequence is $\tau\left(D[a, b]^{*}\right)$-measurable if and only if it is a stochastic process. Since " $\tau\left(D[a, b]^{*}\right)$-subconvex" is identical to "subconvex with respect to the norm" (Problem 3.11.3), the minimax theorem is valid for any sequence of stochastic processes $T_{n}$ and subconvex loss function $\ell$.

Examples of subconvex loss functions include

$$
\begin{aligned}
& z \mapsto \ell_{0}\left(\|z\|_{\infty}\right) \\
& z \mapsto \int|z|^{p}(t) d \mu(t)
\end{aligned}
$$

for a nondecreasing, left-continuous function $\ell_{0}: \mathbb{R} \mapsto \mathbb{R}$, a finite Borel measure $\mu$, and $p \geq 1$.
3.11.8 Example (Bounded functions). On the space $\ell^{\infty}(\mathcal{F})$, functions of the type

$$
z \mapsto \ell_{0}\left(\left\|\frac{z}{q}\right\|_{\mathcal{F}}\right),
$$

for a nondecreasing, left-continuous function $\ell_{0}: \mathbb{R} \mapsto \mathbb{R}$ and an arbitrary map $q: \mathcal{F} \mapsto \mathbb{R}$ are subconvex with respect to the linear space spanned by the coordinate projections $z \mapsto z(f)$. Indeed, for any $c$ there exists $d$ such that

$$
\left\{z: \ell_{0}\left(\left\|\frac{z}{q}\right\|_{\mathcal{F}}\right) \leq c\right\}=\left\{z:\left\|\frac{z}{q}\right\|_{\mathcal{F}} \leq d\right\}=\bigcap_{f \in \mathcal{F}}\{z:|z(f)| \leq d q(f)\} .
$$

Thus, the minimax theorem is valid for any estimator sequence $T_{n}$ that is coordinatewise measurable and any loss function of this type.

For general loss functions that are subconvex with respect to the norm, the preceding minimax theorem applies only under strong measurability conditions on the estimator sequences. It is of interest that these measurability conditions are satisfied by sequences $T_{n}$ such that $T_{n}(f)$ is measurable for every $f$ and such that the sequence $r_{n}\left(T_{n}-\kappa_{n}(0)\right)$ is asymptotically

[^1]tight under $P_{n, 0}$. Indeed, according to Lemma 1.5.2, such sequences are asymptotically $\tau\left(\ell^{\infty}(\mathcal{F})^{*}\right)$-measurable. It follows that, given any subconvex loss function, the minimax theorem may be used to designate optimal estimator sequences among the asymptotically tight sequences.

### 3.11.1 Efficiency of the Empirical Distribution

Let $\mathcal{F}$ be a $P$-Donsker class of functions on a measurable space ( $\mathcal{X}, \mathcal{A}$ ). In this section it is shown that the empirical distribution $\mathbb{P}_{n}$ of a sample of size $n$ from a measure $P$ is an asymptotically efficient estimator for $P$, when both are (and can be) viewed as elements $f \mapsto \mathbb{P}_{n} f$ and $f \mapsto P f$ in $\ell^{\infty}(\mathcal{F})$ and when $P$ is considered completely unknown.

The efficiency here is understood in the sense of best (locally) regular at $P$ and locally asymptotically minimax at $P$ within the context of Example 3.11.1. For local efficiency at all $P$ in a collection $\mathcal{P}$, we would assume that $\mathcal{F}$ is $P$-Donsker with $\|P\|_{\mathcal{F}}<\infty$ for every $P \in \mathcal{P}$. At the end of this section we also briefly discuss global minimaxity over a class of underlying measures $\mathcal{P}$.

We use the set-up of Example 3.11.1 with the "model" $\mathcal{P}$ equal to the class of all probability measures on $(\mathcal{X}, \mathcal{A})$. Then the tangent set can be shown to be equal to all square-integrable measurable functions $h$ such that $P h=0$. We do not really need a result as strong as this (and would actually not be able to use it either, because the parameter might be irregular with respect to this large set). Instead we note that for every bounded, measurable function $h: \mathcal{X} \mapsto \mathbb{R}$, the measures with densities $d P_{t}(x)=(1+t h(x)) d P(x)$ are well defined for sufficiently small $|t|$ and define probability measures if $P h=0$. These paths can be seen to be differentiable in quadratic mean by elementary arguments. We define the set $H$ to be equal to all bounded functions with mean zero and let $P_{n, h}$ be the measure $P_{1 / \sqrt{n}}$.

The parameter to be estimated is the map $f \mapsto P f$, which is assumed to belong to $\ell^{\infty}(\mathcal{F})$. Since $P_{t} f=P f+t P f h$ for every $f$, the derivative of this parameter is the map $\dot{\kappa}: h \mapsto(f \mapsto P f h)$. Since $\mathcal{F}$ is a Donsker class, it is bounded in $L_{2}(P)$, which implies that the derivative $\dot{\kappa}$ is continuous and the parameter regular with respect to our choice of $H$.

Since $\mathcal{F}$ is assumed a Donsker class, the sequence $\sqrt{n}\left(\mathbb{P}_{n}-P\right)$ converges in distribution under $P$ to a Brownian bridge process $\mathbb{G}_{P}$. By Theorem 3.10.12, the sequence $\sqrt{n}\left(\mathbb{P}_{n}-P_{n, h}\right)$ has the same limit distribution if the observations are sampled from $P_{n, h}$. Thus, the sequence of empirical distributions is regular (at $P$ ). Furthermore, for every bounded, continuous function $\ell: \ell^{\infty}(\mathcal{F}) \rightarrow[0, \infty)$,

$$
\begin{equation*}
\sup _{I \subset H} \limsup _{n \rightarrow \infty} \sup _{h \in I} \mathrm{E}_{h *} \ell\left(\sqrt{n}\left(\mathbb{P}_{n}-P_{n, h}\right)\right)=\mathrm{E} \ell\left(\mathbb{G}_{P}\right) . \tag{3.11.9}
\end{equation*}
$$

Thus, we may conclude that the empirical distribution is asymptotically efficient in terms of both the convolution and the minimax theorems, (for
certain loss functions) if the tight Gaussian element $G$ in these theorems equals the Brownian bridge. For our choice of $H$, this is indeed the case and easy and to prove.

It suffices to calculate the covariance function of $G$ in Theorem 3.11.2. The projection $\pi_{f}: \ell^{\infty}(\mathcal{F}) \mapsto \mathbb{R}$ on the $f$-coordinate, given by $z \mapsto z(f)$, is an element of the dual space of $\ell^{\infty}(\mathcal{F})$. By definition of $\dot{\kappa}^{*}$, we have

$$
P\left(\dot{\kappa}^{*} \pi_{f}\right) h=\pi_{f}(\dot{\kappa} h)=P f h=P(f-P f) h, \quad \text { for every } h \in H .
$$

Since the completion of $H$ consists of all zero-mean functions and $\dot{\kappa}^{*}$ is required to map $\ell^{\infty}(\mathcal{F})$ into $\bar{H}$, this means that $\dot{\kappa}^{*} \pi_{f}$ is equal to $f-P f$. Conclude that $G(f)$ in Theorem 3.11.2 has variance $P(f-P f)^{2}$. A similar argument applied to linear combinations of projections shows that the covariance function of $G$ is equal to the covariance of a Brownian bridge $\mathbb{G}_{P}$.

The condition that $\ell$ is bounded and continuous can be relaxed in many situations. In view of Theorem 1.11.3, equation (3.11.9) is valid for every function $\ell$ that is continuous almost surely under the distribution of $\mathbb{G}_{P}$ and such that the sequence $\ell\left(\sqrt{n}\left(\mathbb{P}_{n}-P_{n, h}\right)\right)$ is asymptotically equi-integrable under $P_{n, h}$.

The result (3.11.9) asserts that the empirical distribution is asymptotically minimax in a local sense. If $\mathcal{F}$ is uniformly Donsker in a class $\mathcal{P}$ of underlying measures and $\ell$ is bounded and Lipschitz-continuous, then

$$
\lim _{n \rightarrow \infty} \sup _{P \in \mathcal{P}} \mathrm{E}_{P} \ell\left(\sqrt{n}\left(\mathbb{P}_{n}-P\right)\right)=\sup _{P \in \mathcal{P}} \mathrm{E} \ell\left(\mathbb{G}_{P}\right) .
$$

¿From consideration of the lower bounds for the local minimax risks, the right-hand side is the minimum value attainable for any (asymptotically measurable) estimator sequence if the local submodels $P_{n, h}$ corresponding to the measure(s) $P$ for which the right-hand side is (nearly) maximal also belong to $\mathcal{P}$. This is particularly the case if $\mathcal{P}$ is the collection of all probability measures. In this situation the empirical measure is "globally asymptotically minimax over $\mathcal{P}$ " with respect to the loss $\ell$.

In the classical situation of cells $(-\infty, t]$ in Euclidean space, the global asymptotic minimax character has been shown to be valid also for loss functions that are not continuous or bounded. (See the Notes to this chapter.) In more general situations this question appears not to have been investigated.

## Problems and Complements

1. Both the convolution and the minimax theorem remain valid if the set $H$ is not a linear space but does contain a convex cone that has the same closed linear span as $H$.
[Hint: Van der Vaart (1988).]
2. Suppose that $\mathcal{P}=\left\{P_{\theta}: \theta \in \Theta\right\}$ is a parametric model indexed by an open subset of Euclidean space such that

$$
\int\left[d P_{\theta}^{1 / 2}-d P_{\theta_{0}}^{1 / 2}-\frac{1}{2}\left(\theta-\theta_{0}\right)^{\prime} \dot{\ell}_{\theta_{0}} d P_{\theta_{0}}^{1 / 2}\right]^{2} d \mu=o\left(\left\|\theta-\theta_{0}\right\|^{2}\right)
$$

for some measurable, vector-valued function $\dot{\ell}_{\theta_{0}}$. Derive the optimal variance for estimating a parameter $q(\theta)$ given a differentiable map $q: \Theta \mapsto \mathbb{R}$. Is this parameter always regular?
3. A convex set in a Banach space is closed with respect to the norm if and only if it is weakly closed. Thus, " $\tau\left(\mathbf{B}^{*}\right)$-subconvex" is identical to "subconvex".
[Hint: Apply the Hahn-Banach theorem, or see Rudin (1973).]
4. Suppose $L_{n}$ and $M_{n}$ are uniformly tight sequences of Borel probability measures on a metric space. If $L_{n}=M_{n} * N_{n}$ for every $n$, then the sequence $N_{n}$ is uniformly tight.

## 3

## Notes

3.2. Versions of the continuous mapping theorem for the argmax functional have already been used by Prakasa Rao (1969), Le Cam (1970a), and Ibragimov and Has'minskii (1981). An explicit statement of a slightly more special theorem than the theorem presented here occurs in Kim and Pollard (1990). It is clear from the proof that uniform weak convergence of the criterion functions can be relaxed to the weak convergence of pairs of maxima of the form $\left(\sup _{h \in A} \mathbb{M}_{n}(h), \sup _{h \in B} \mathbb{M}_{n}(h)\right)$. This is slightly weaker, but in general still much stronger than needed.

For general notes on results on rates of convergence, see the notes for the next chapter. Theorem 3.2.10 is essentially due to Kim and Pollard (1990). The maximum likelihood estimator for a monotone decreasing density (or concave distribution function) is known as the Grenander estimator. Its limit behavior was derived by Prakasa Rao (1969). In his study of the concave majorant of Brownian motion Groeneboom (1983) introduced an "inverse process" similar to $\hat{s}_{n}$ and the corresponding basic switching identity which is the basis of our proof. Groeneboom (1985) goes on to initiate the study of global functionals of $\hat{f}_{n}$, in particular the $L_{1}$ distance from $\hat{f}_{n}$ to $f$ using the structure of the inverse process $\hat{s}_{n}$. The limit distribution of the maximum likelihood estimator based on interval censored observations was first obtained by Groeneboom (1987). The present example is an adaptation of the presentation in Part 2 of Groeneboom and Wellner (1992). Groeneboom (1988) gave a systematic study of the "inverse process" associated with Brownian motion minus a parabola, including a determination of its infinitesimal generator. As a corollary of this deep and detailed anal-
ysis, Groeneboom characterized the distribution of the point of maximum of Brownian motion minus a parabola.

Rigorous proofs of the asymptotic normality of the maximum likelihood estimator were first given in the 1930s and 1940s. For a direct proof under the classical smoothness conditions, see, for instance, Cramér (1946). General $M$-estimators were studied systematically by Huber (1967), who also introduced bracketing conditions to ensure their asymptotic consistency and normality. Pollard $(1984,1985)$ shows the gains of applying results from empirical processes, as in this monograph, to this problem. Theorems 3.2.16 and 3.3.1 are generalizations of results in this work. Hoffmann-Jørgensen (1994) also aims at applying techniques from probability in Banach spaces to maximum likelihood estimators (in mostly parametric models).

Example 3.2.12 follows Huang (1993). Example 3.2.24 is taken from lecture notes by the first author. The Lipschitz condition on $\theta \mapsto \log p_{\theta}$ can of course be relaxed, but it seems to cover all the standard examples. For one-dimensional parameters, a better approach is possible based on the maximal inequality given by Theorem 2.2.4, applied with $\psi(\varepsilon)=\varepsilon^{2}$ and the Hellinger distance. Then the pointwise-Lipschitz condition can be replaced by the condition $\int\left[p_{\theta_{1}}^{1 / 2}-p_{\theta_{2}}^{1 / 2}\right]^{2} \leq\left|\theta_{1}-\theta_{2}\right|^{2}$. See Le Cam (1970a) and Ibragimov and Has'minskii (1981) for results in this direction.
3.3. Estimators satisfying estimating equations were studied systematically by Huber (1967). Pollard $(1984,1985)$ gives the benefits of applying results from empirical processes, as in this monograph, to this problem. Theorems 3.3.1 is a generalization of results in his work to infinite dimensions. Also, see Bickel, Klaassen, Ritov, and Wellner (1993) for results of this type. Theorem 3.3.1 is used by Van der Vaart (1994a, 1994c, 1995) and Murphy (1995) to prove the asymptotic efficiency of the maximum likelihood estimator in some semiparametric models. Similar results can be found in Bickel, Klaassen, Ritov, and Wellner (1993). Example 3.3.10 is based on Van der Vaart (1994a, 1994c). For other applications of empirical processes in obtaining the limit distribution of estimators in semiparametric models, see Van der Laan (1993), Huang (1996), and Van der Vaart (1996).
3.4. A major part of this chapter is based on the exposition by Van de Geer (1993b), though the introduction of $L_{1}$-inequalities and the "Bernstein norm" are new and simplify the treatment.

Van de Geer (1990) studies least-squares and least-absolute-deviation estimators for regression functions. In the case of least-squares estimators, she uses chaining for sub-Gaussian processes, under the assumption that the error distribution is sub-Gaussian. The results on least-squares with random design were obtained by Birgé and Massart (1993). Van de Geer (1993b) considers maximum likelihood estimators for densities under the
assumption that the model is convex or that the loglikelihood ratios are uniformly bounded. Her arguments are based on chaining by bracketing.

Birgé and Massart (1993) suggest using the functions $\log \left(p+p_{0}\right) / 2 p_{0}$ as criterion functions rather than the loglikelihood ratios. They also introduce the use of the refined version of Bernstein's inequality in the bracketingchaining argument, both for regression and maximum likelihood estimators. Using this refined inequality, Wong and Shen (1995), removed unnecessary boundedness conditions and obtain a version of Theorem 3.4.4. Other references in this area are Wong and Severini (1991) and Shen and Wong (1994).

The maximum likelihood estimator for a monotone density was introduced by Grenander (1956). The rate at a point for the maximum likelihood estimator of a convex regression function is $n^{-2 / 5}$, as shown by Mammen (1991) and Wang (1993). Jongbloed (1995) obtains the same pointwise rate for the maximum likelihood estimator of a convex density.

Related papers that are not treated in this chapter are Birgé and Massart (1994), who discuss the use of many different types of sieves, and Barron, Birgé, and Massart (1995), who consider model selection via penalized minimum-contrast estimators.
3.5. The basic method of Poissonization was used by Kolmogorov (1933) and Donsker (1952) in their classic papers; see, e.g., Shorack and Wellner (1986), Chapter 8. Poissonization techniques in the study of Banach-spacevalued random variables began in Le Cam (1970b) and were developed further in Araujo and Giné (1980). Kac (or Poissonized) empirical processes have also played an important role in obtaining rates of convergence for limit theorems and invariance principles; see, e.g., Massart (1989), in particular Lemma 2, and Dudley (1984), Section 8.3, where Poissonization is used to study rates of convergence for classes of sets too large to satisfy the central limit theorem. Durst and Dudley (1981) prove a partial result in the direction of Theorem 3.1 for classes of sets. In the classical one-dimensional case $\mathcal{X}=\mathbb{R}$, there is a substantial literature concerned with finite sample and asymptotic distributions of statistics connected with the Kac empirical process; see S. Csörgő (1981) and the references therein.

Pyke (1968) proves Theorem 3.5.1 for the one-dimensional distribution function under the assumption that $\nu$ equals 1 almost surely. Billingsley (1968) and S. Csörgő (1974), following Blum, Hanson and Rosenblatt (1963), show that the result continues to hold under the present conditions, which allow a general positive limit random variable $\nu$. These results were extended by Wichura (1968) and Fernandez (1970) to allow, for instance, the $q$-metrics mentioned by Pyke (1968) in his closing remark. Theorem 3.5.1 contains their results as well as many others.

Part of Theorem 3.5.5 is contained in Theorem 3.4.9 of Araujo and Giné (1980); see also their Exercise 2 on page 122, and note that their $X_{n j}$ are assumed symmetric. Evarist Giné has shown us a proof of Theo-
rem 3.5.5 via symmetrization and desymmetrization. The present statement of Theorem 3.5.5 is from Klaassen and Wellner (1992).
3.6. The bootstrap central limit theorems, Theorems 3.6 .1 and 3.6 .2 , follow essentially from the bootstrap results of Giné and Zinn (1990), who prove the equivalence of (i) and (iii) under measurability assumptions on the class $\mathcal{F}$, the equivalence of (i) and (ii) being immediate from the multiplier central limit theorems. A new detail in the present statement is the absence of measurability assumptions.

The proofs of Giné and Zinn use symmetrization by Rademacher variables. If we write $\mathrm{s}(\mathrm{i}), \mathrm{s}(\mathrm{ii})$, and $\mathrm{s}($ iii $)$ for the corresponding symmetrized parts of Theorem 3.6.1 and s (ii)u for the unconditional symmetrized version of (ii), then the proof of Giné and Zinn (1990) consists of the steps s(i) $\Rightarrow \mathrm{s}(\mathrm{ii}) \mathrm{u} \Rightarrow \mathrm{s}(\mathrm{iii}) \Rightarrow \mathrm{s}(\mathrm{i})$. Here the first implication follows from Lemma 2.9 of Giné and Zinn (1984); the second follows from the almost-sure multiplier central limit theorem of Ledoux and Talagrand (1988) and Proposition 2.2 of Giné and Zinn (1990); the last implication comes from Proposition 2.2 again. Giné and Zinn (1990) next show that the s's can be removed from the string of implications. (They do not have s (ii) or s (ii)u in the statement of their main result, but only in their Lemma 2.1 and Proposition 2.2.)

The finite-dimensional convergence of the exchangeable bootstrap empirical process is proved by Mason and Newton (1990), who also establish Theorem 3.6.13 for the special case that $\mathcal{F}$ is the class of indicators of cells in the real line. The general version of Theorem 3.6.13 (under somewhat stronger assumptions, including that $\sum_{i=1}^{n} W_{n i}=n$ ) is from Praestgaard and Wellner (1993), as is the almost-sure part of Theorem 3.6.3. The inprobability part of Theorem 3.6.3 was noted by Arcones and Giné (1992).
3.8. For observations in the unit square, an alternative to the KolmogorovSmirnov statistic is

$$
B_{n}=\iint n\left(\mathbb{H}_{n}(s, t)-\mathbb{P}_{n}(s) \mathbb{Q}_{n}(t)\right)^{2} d \mathbb{H}_{n}(s, t)
$$

Blum, Kiefer and Rosenblatt (1961) show that under independence and continuity of the marginal distributions $P$ and $Q$

$$
B_{n} \rightsquigarrow \iint \mathbb{Z}_{P \times Q}^{2}(s, t) d P(s) d Q(t) \sim \int_{0}^{1} \int_{0}^{1} \mathbb{Z}_{[0,1]^{2}}^{2}(u, v) d u d v
$$

They also compute the characteristic function of the limit variable and use this to compute and tabulate its distribution. For higher-dimensional generalizations and extensions, see Dugue (1975) and Deheuvels (1981). The sequence $B_{n}$ is asymptotically equivalent to a statistic proposed by Hoeffding (1948).

For material on distributions related to the completely tucked Brownian sheet, see, e.g., Adler (1990), Section V.5.
3.9. The use of Hadamard instead of Fréchet differentiability to derive limiting distributions of transformed statistics was developed systematically by Reeds (1975), although there are earlier applications in work by Le Cam.

A number of the examples can be found in Gill (1989). Comprehensive reviews of the product integral can be found in Gill and Johansen (1990) and Gill (1994). We borrowed the symbol for the product integral from the latter author. They work in the more general framework of $p \times p$ matrices of elements of $D\left(\mathbb{R}^{+}\right)$, in which case the definition given here is appropriate only in the "commutative case." The limit behavior of estimators connected to multivariate trimming is studied by Nolan (1992). We have reformulated her result in terms of Hadamard differentiability, under slightly simpler conditions. The result on the Hadamard differentiability of $M$-functionals is taken from Heesterman and Gill (1992) and Van der Vaart (1995), although this is also one of the main examples in Reeds (1975). For still more applications of the delta-method, see, e.g., Grübel and Pitts (1992, 1993) and Pitts (1994).

The weak convergence of the sample quantile process was proved by Bickel (1967). Substantial refinements, which involve further interplay between analysis and probability, are due to Shorack (1972) and Csörgő and Révész (1978); see Shorack and Wellner (1986), Chapter 18. See also Shorack and Wellner (1986), Chapter 15, for connections with the wellknown Bahadur-Kiefer theorems. For further applications of the approach taken here, see Doss and Gill (1992).

The use of Hadamard differentiability does not allow conclusions about the speed of convergence. On the other hand, Fréchet differentiability, with a rate on the remainder term plus information on the speed of convergence of the original sequence, gives a rate on the linear approximation for the transformed statistics. In a series of papers, Dudley (1990, 1992, 1994) explores Fréchet differentiability of some of the standard functionals with respect to nonstandard norms, such as $p$-variation on distribution functions.
3.10. Contiguity was introduced and studied by Le Cam. See Le Cam (1960, 1969). Also see Le Cam (1986), pages 85-90, for connections with limiting experiments and different characterizations. Differentiability in quadratic mean was introduced by Le Cam as well. Le Cam's third lemma derives its name from being listed as the third in a list of basic lemmas. For the other lemmas, see the original papers by Le Cam or see Hájek and Šidák (1967).
3.11. The convolution and minimax theorems for locally asymptotically normal parametric models were established by Hájek (1970, 1972). Le Cam (1972) shows the connection with approximation of statistical experiments and states similar theorems for non-Gaussian limit experiments. The proofs for the Gaussian case in the present chapter have the benefit of being short
and easy, but they lack the insight provided by Le Cam's method, which is to show the convergence of a sequence of experiments to a limit in a general sense first and next obtain concrete results (such as a convolution theorem) from an analysis of the limit experiment. The convolution theorem for infinite-dimensional parameters was proved in increasing generality by Levit (1978), Millar (1983, 1985), Van der Vaart (1988), and Van der Vaart and Wellner (1989), among others. The assumption of asymptotic tightness and measurability can be relaxed considerably, as well as the assumption that the tangent space is linear, see Van der Vaart (1988). For many examples of tangent spaces in semi-parametric models, see Bickel, Klaassen, Ritov, and Wellner (1993).

Anderson (1963) proves a concentration lemma for symmetric distributions on Euclidean space. Lemma 3.11.4, taken from Millar (1983), extends his result to infinite-dimensional Gaussian variables.

Kiefer and Wolfowitz (1959) shows the global asymptotic minimax character of the empirical distribution function in Euclidean space. Here "global" means that they took the supremum over all probability measures, rather than over shrinking neighborhoods as in the present chapter. This is better in terms of attainment of the bound, but less interesting for the lower bound. Millar (1979) shows that the empirical distribution is also asymptotically globally minimax in certain models not consisting of all probability distributions on the sample space. His results can be further refined to local minimaxity, for which the key property is that the tangent space is sufficiently large. See Problem 3.11.1.

PART A

## Appendix

## A. 1

## Inequalities

This section presents several inequalities for sums of independent stochastic processes. For a stochastic process $\left\{X_{t}: t \in T\right\}$ indexed by some arbitrary index set, the notation $\|X\|$ is an abbreviation for the supremum $\sup _{t}\left|X_{t}\right|$.

The stochastic processes need not be measurable maps into a Banach space. Independence of the stochastic processes $X_{1}, X_{2}, \ldots$ is understood in the sense that each of the processes is defined on a product probability space $\prod_{i=1}^{\infty}\left(\Omega_{i}, \mathcal{U}_{i}, \mathrm{P}_{i}\right)$ with $X_{i}$ depending on the $i$ th coordinate of $\left(\omega_{1}, \omega_{2}, \ldots\right)$ only. The process $X_{i}$ is called symmetric if $X_{i}$ and $-X_{i}$ have the same distribution. In the case of nonmeasurability, the symmetry of independent processes $X_{1}, X_{2}, \ldots$ may be understood in the sense that outer probabilities remain the same if one or more $X_{i}$ are replaced by $-X_{i} .{ }^{\dagger}$

Throughout the chapter $S_{n}$ equals the partial sum $X_{1}+\ldots+X_{n}$ of given stochastic processes $X_{1}, X_{2}, \ldots$.
A.1.1 Proposition (Ottaviani's inequality). Let $X_{1}, \ldots, X_{n}$ be independent stochastic processes indexed by an arbitrary set. Then for $\lambda, \mu>0$,

$$
\mathrm{P}^{*}\left(\max _{k \leq n}\left\|S_{k}\right\|>\lambda+\mu\right) \leq \frac{\mathrm{P}^{*}\left(\left\|S_{n}\right\|>\lambda\right)}{1-\max _{k \leq n} \mathrm{P}^{*}\left(\left\|S_{n}-S_{k}\right\|>\mu\right)} .
$$

Proof. Let $A_{k}$ be the event that $\left\|S_{k}\right\|^{*}$ is the first $\left\|S_{j}\right\|^{*}$ that is strictly greater than $\lambda+\mu$. The event on the left is the disjoint union of $A_{1}, \ldots, A_{n}$.

[^2]Since $\left\|S_{n}-S_{k}\right\|^{*}$ is independent of $\left\|S_{1}\right\|^{*}, \ldots,\left\|S_{k}\right\|^{*}$,

$$
\begin{aligned}
\mathrm{P}\left(A_{k}\right) \min _{j \leq n} \mathrm{P}\left(\left\|S_{n}-S_{j}\right\|^{*} \leq \mu\right) & \leq \mathrm{P}\left(A_{k},\left\|S_{n}-S_{k}\right\|^{*} \leq \mu\right) \\
& \leq \mathrm{P}\left(A_{k},\left\|S_{n}\right\|^{*}>\lambda\right),
\end{aligned}
$$

since $\left\|S_{k}\right\|^{*}>\lambda+\mu$ on $A_{k}$. Sum up over $k$ to obtain the result.
A.1.2 Proposition (Lévy's inequalities). Let $X_{1}, \ldots, X_{n}$ be independent, symmetric stochastic processes indexed by an arbitrary set. Then for every $\lambda>0$ we have the inequalities

$$
\begin{aligned}
& \mathrm{P}^{*}\left(\max _{k \leq n}\left\|S_{k}\right\|>\lambda\right) \leq 2 \mathrm{P}^{*}\left(\left\|S_{n}\right\|>\lambda\right), \\
& \mathrm{P}^{*}\left(\max _{k \leq n}\left\|X_{k}\right\|>\lambda\right) \leq 2 \mathrm{P}^{*}\left(\left\|S_{n}\right\|>\lambda\right) .
\end{aligned}
$$

Proof. Let $A_{k}$ be the event that $\left\|S_{k}\right\|^{*}$ is the first $\left\|S_{j}\right\|^{*}$ that is strictly greater than $\lambda$. The event on the left in the first inequality is the disjoint union of $A_{1}, \ldots, A_{n}$. Write $T_{n}$ for the sum of the sequence $X_{1}, \ldots, X_{k},-X_{k+1}, \ldots,-X_{n}$. By the triangle inequality, $2\left\|S_{k}\right\|^{*} \leq\left\|S_{n}\right\|^{*}+ \left\|T_{n}\right\|^{*}$. It follows that

$$
\mathrm{P}\left(A_{k}\right) \leq \mathrm{P}\left(A_{k},\left\|S_{n}\right\|^{*}>\lambda\right)+\mathrm{P}\left(A_{k},\left\|T_{n}\right\|^{*}>\lambda\right)=2 \mathrm{P}\left(A_{k},\left\|S_{n}\right\|^{*}>\lambda\right),
$$

since $X_{1}, \ldots, X_{n}$ are symmetric. Sum up over $k$ to obtain the first inequality.
For the second inequality, let $A_{k}$ be the event that $\left\|X_{k}\right\|^{*}$ is the first $\left\|X_{j}\right\|^{*}$ that is strictly greater than $\lambda$. Write $T_{n}$ for the sum of the variables $-X_{1}, \ldots,-X_{k-1}, X_{k},-X_{k+1}, \ldots,-X_{n}$. By the triangle inequality, $2\left\|X_{k}\right\|^{*} \leq\left\|S_{n}\right\|^{*}+\left\|T_{n}\right\|^{*}$. Proceed as before.

An interesting consequence of Lévy's inequalities is the following theorem concerning the convergence of random series of independent processes.
A.1.3 Proposition (Lévy-Ito-Nisio). Let $X_{1}, X_{2}, \ldots$ be independent stochastic processes with sample paths in $\ell^{\infty}(T)$. Then the following statements are equivalent:
(i) $\left\{S_{n}\right\}$ converges outer almost surely;
(ii) $\left\{S_{n}\right\}$ converges in outer probability;
(iii) $\left\{S_{n}\right\}$ converges weakly.

Proof. The implications (i) ⇒ (ii) ⇒ (iii) are true for general random sequences. We must prove the implications in the converse direction.
(iii) ⇒ (ii). Since any Cauchy sequence is convergent, it suffices to show that $S_{n_{k+1}}-S_{n_{k}}$ converges in outer probability to zero as $k \rightarrow \infty$ for any sequence $n_{1}<n_{2}<\cdots$. The sequence ( $S_{n_{k+1}}, S_{n_{k}}$ ) is asymptotically tight and asymptotically measurable. By Prohorov's theorem, every subsequence
has a further subsequence along which $Y_{k}=S_{n_{k+1}}-S_{n_{k}}$ converges in distribution to a tight limit $Y$. Then $Y_{n}(t) \rightsquigarrow Y(t)$ for every $t$. For every real number $s$ at which the characteristic function of the weak limit of $S_{n}(t)$ is nonzero, in particular for every $s$ sufficiently close to zero,

$$
\mathrm{E} e^{i s Y_{k}(t)}=\frac{\mathrm{E} e^{i s S_{n_{k+1}}(t)}}{\mathrm{E} e^{i s S_{n_{k}}(t)}} \rightarrow 1
$$

Thus the characteristic function of $Y(t)$ is 1 in a neighborhood of zero. Conclude that $Y=0$ almost surely.
(ii) ⇒ (i). Write $S$ for the limit in probability of $S_{n}$. First assume that the processes $X_{j}$ are symmetric. There exists a subsequence $n_{1}<n_{2}<\cdots$ such that $\mathrm{P}^{*}\left(\left\|S_{n_{k}}-S\right\|>2^{-k}\right)<2^{-k}$ for every $k$. By the Borel-Cantelli lemma, $S_{n_{k}} \xrightarrow{\text { as* }} S$ as $k \rightarrow \infty$. By a Lévy inequality,

$$
\mathrm{P}^{*}\left(\max _{n_{k}<n \leq n_{k+1}}\left\|S_{n}-S_{n_{k}}\right\|>2^{-k+1}\right) \leq 2 \mathrm{P}^{*}\left(\left\|S_{n_{k+1}}-S_{n_{k}}\right\|>2^{-k+1}\right) .
$$

The right side is smaller than a multiple of $2^{-k}$. Hence $\max _{n_{k}<n \leq n_{k+1}} \| S_{n}- S_{n_{k}} \|^{*}$ converges almost surely to zero by the Borel-Cantelli lemma. This concludes the proof that $S_{n}$ converges outer almost surely for symmetric $X_{i}$.

Given general processes, construct an independent copy $Y_{1}, Y_{2}, \ldots$ defined on a copy of the original probability space ( $\Omega, \mathcal{U}, \mathrm{P}$ ), and let $T_{n}$ be the corresponding partial sums. Then elements of the sequence $S_{n}-T_{n}$ are the partial sums of the symmetric variables $X_{i}-Y_{i}$ and converges in outer probability. (It is formally defined on $(\Omega, \mathcal{U}, \mathrm{P}) \times(\Omega, \mathcal{U}, \mathrm{P})$.) By the preceding paragraph, $S_{n}-T_{n}$ converges outer almost surely. By Fubini's theorem there exists $\omega$ such that $S_{n}-T_{n}(\omega)$ converges outer almost surely. Then it converges also in distribution. Since $S_{n}$ converges in distribution as well, it follows that the sequence $T_{n}(\omega)$ is convergent.
A.1.4 Proposition (Hoffmann-Jørgensen inequalities). Let $X_{1}, \ldots, X_{n}$ be independent stochastic processes indexed by an arbitrary set. Then for any $\lambda, \eta>0$,

$$
\mathrm{P}^{*}\left(\max _{k \leq n}\left\|S_{k}\right\|>3 \lambda+\eta\right) \leq \mathrm{P}^{*}\left(\max _{k \leq n}\left\|S_{k}\right\|>\lambda\right)^{2}+\mathrm{P}^{*}\left(\max _{k \leq n}\left\|X_{k}\right\|>\eta\right) .
$$

If $X_{1}, \ldots, X_{n}$ are independent and symmetric, then also

$$
\mathrm{P}^{*}\left(\left\|S_{n}\right\|>2 \lambda+\eta\right) \leq 4 \mathrm{P}^{*}\left(\left\|S_{n}\right\|>\lambda\right)^{2}+\mathrm{P}^{*}\left(\max _{k \leq n}\left\|X_{k}\right\|>\eta\right) .
$$

Proof. Let $A_{k}$ be the event that $\left\|S_{k}\right\|^{*}$ is the first $\left\|S_{j}\right\|^{*}$ that is strictly greater than $\lambda$. The (disjoint) union of $A_{1}, \ldots, A_{n}$ is the event that $\max _{k \leq n}\left\|S_{k}\right\|^{*}$ is greater than $\lambda$. By the triangle inequality, $\left\|S_{j}\right\|^{*} \leq$
$\left\|S_{k-1}\right\|^{*}+\left\|X_{k}\right\|^{*}+\left\|S_{j}-S_{k}\right\|^{*}$ for every $j \geq k$. On $A_{k}$ the first term on the right is bounded by $\lambda$. Conclude that on $A_{k}$

$$
\max _{j \geq k}\left\|S_{j}\right\|^{*} \leq \lambda+\max _{k \leq n}\left\|X_{k}\right\|^{*}+\max _{j>k}\left\|S_{j}-S_{k}\right\|^{*} .
$$

On $A_{k}$ this remains true if the maximum on the left is taken over all $\left\|S_{j}\right\|^{*}$. Since the processes are independent, we obtain for every $k$

$$
\begin{aligned}
& \mathrm{P}\left(A_{k}, \max _{k \leq n}\left\|S_{k}\right\|^{*}>3 \lambda+\eta\right) \\
& \quad \leq \mathrm{P}\left(A_{k}, \max _{k \leq n}\left\|X_{k}\right\|^{*}>\eta\right)+\mathrm{P}\left(A_{k}\right) \mathrm{P}\left(\max _{j>k}\left\|S_{j}-S_{k}\right\|^{*}>2 \lambda\right)
\end{aligned}
$$

In the probability on the far right the variable $\max _{j>k}\left\|S_{j}-S_{k}\right\|^{*}$ can be bounded by $2 \max _{k \leq n}\left\|S_{k}\right\|^{*}$. Next sum over $k$ to obtain the first inequality of the proposition.

To prove the second inequality, first establish by the same method that

$$
\mathrm{P}\left(A_{k},\left\|S_{n}\right\|^{*}>2 \lambda+\eta\right) \leq \mathrm{P}\left(A_{k}, \max _{k \leq n}\left\|X_{k}\right\|^{*}>\eta\right)+\mathrm{P}\left(A_{k}\right) \mathrm{P}\left(\left\|S_{n}-S_{k}\right\|^{*}>\lambda\right) .
$$

In the probability on the far right, bound the variable $\left\|S_{n}-S_{k}\right\|^{*}$ by $\max _{k \leq n}\left\|S_{n}-S_{k}\right\|^{*}$. Next sum over $k$ to obtain

$$
\begin{aligned}
& \mathrm{P}\left(\left\|S_{n}\right\|^{*}>2 \lambda+\eta\right) \\
& \quad \leq \mathrm{P}\left(\max _{k \leq n}\left\|X_{k}\right\|^{*}>\eta\right)+\mathrm{P}\left(\max _{k \leq n}\left\|S_{k}\right\|^{*}>\lambda\right) \mathrm{P}\left(\max _{k \leq n}\left\|S_{n}-S_{k}\right\|^{*}>\lambda\right) .
\end{aligned}
$$

The processes $S_{k}$ and $S_{n}-S_{k}$ are the partial sums of the symmetric processes $X_{1}, \ldots, X_{n}$ and $X_{n}, \ldots, X_{2}$, respectively. Apply Lévy's inequality to both probabilities on the far right to conclude the proof.

## A.1.5 Proposition (Hoffmann-Jørgensen inequalities for moments).

Let $0<p<\infty$ and suppose that $X_{1}, \ldots, X_{n}$ are independent stochastic processes indexed by an arbitrary index set $T$. Then there exist constants $C_{p}$ and $0<u_{p}<1$ such that

$$
\mathrm{E}^{*} \max _{k \leq n}\left\|S_{k}\right\|^{p} \leq C_{p}\left(\mathrm{E}^{*} \max _{k \leq n}\left\|X_{k}\right\|^{p}+F^{-1}\left(u_{p}\right)^{p}\right),
$$

where $F^{-1}$ is the quantile function of the random variable $\max _{k \leq n}\left\|S_{k}\right\|^{*}$. Furthermore, if $X_{1}, \ldots, X_{n}$ are symmetric, then there exist constants $K_{p}$ and $0<v_{p}<1$ such that

$$
\mathrm{E}^{*}\left\|S_{n}\right\|^{p} \leq K_{p}\left(\mathrm{E}^{*} \max _{k \leq n}\left\|X_{k}\right\|^{p}+G^{-1}\left(v_{p}\right)^{p}\right),
$$

where $G^{-1}$ is the quantile function of the random variable $\left\|S_{n}\right\|^{*}$. For $p \geq$ 1 , the last inequality is also valid for mean-zero processes (with different constants).

Proof. Take $\lambda=\eta=t$ in the first inequality of the preceding proposition to find that, for any $\tau>0$,

$$
\begin{gathered}
\mathrm{E}^{*} \max _{k \leq n}\left\|S_{k}\right\|^{p}=4^{p} \int \mathrm{P}\left(\max _{k \leq n}\left\|S_{k}\right\|^{*}>4 t\right) d\left(t^{p}\right) \\
\leq(4 \tau)^{p}+4^{p} \int_{\tau}^{\infty} \mathrm{P}\left(\max _{k \leq n}\left\|S_{k}\right\|^{*}>t\right)^{2} d\left(t^{p}\right) \\
\quad+4^{p} \int_{\tau}^{\infty} \mathrm{P}\left(\max _{k \leq n}\left\|X_{k}\right\|^{*}>t\right) d\left(t^{p}\right) \\
\leq(4 \tau)^{p}+4^{p} \mathrm{P}\left(\max _{k \leq n}\left\|S_{k}\right\|^{*}>\tau\right) \mathrm{E}^{*} \max _{k \leq n}\left\|S_{k}\right\|^{p} \\
\quad+4^{p} \mathrm{E}^{*} \max _{k \leq n}\left\|X_{k}\right\|^{p} .
\end{gathered}
$$

Choosing $\tau$ such that $4^{p} \mathrm{P}\left(\max _{k \leq n}\left\|S_{k}\right\|^{*}>\tau\right)$ is bounded by $\frac{1}{2}$, and rearranging terms, yield the claimed inequality. The second inequality can be proved in a similar manner, this time using the second inequality of the preceding proposition.

The inequality for mean-zero processes follows from the inequality for symmetric processes by symmetrization and desymmetrization: by Jensen's inequality, $\mathrm{E}^{*}\left\|S_{n}\right\|^{p}$ is bounded by $\mathrm{E}^{*}\left\|S_{n}-T_{n}\right\|^{p}$ if $T_{n}$ is the sum of $n$ independent copies of $X_{1}, \ldots, X_{n}$. ■

Hoffmann-Jørgensen's inequality strengthens probability statements about sums to statements concerning expectations or $p$-moments, provided the corresponding moment of the maximum of the individual terms can be controlled. Thus it can be used to "invert" the consequences of Markov-type inequalities under an additional condition. A typical application is to a sequence of sums $\sum_{i=1}^{n} X_{n i}$. Boundedness in probability $\left\|\sum_{i=1}^{n} X_{n i}\right\|^{*}=O_{P}(1)$ implies that $G_{n}^{-1}(u)=O(1)$ for the sequence of quantile functions of the variables $\left\|\sum_{i=1}^{n} X_{n i}\right\|^{*}$. Conclude that the sequence of expectations $\mathrm{E}^{*}\left\|\sum_{i=1}^{n} X_{n i}\right\|^{p}$ is $O(1)$ if the same is true for the sequence $\mathrm{E}^{*} \max _{1 \leq i \leq n}\left\|X_{n i}\right\|^{p}$.

Hoffmann-Jørgensen's inequality may also be used to bound higher moments of sums in terms of a first moment plus a higher moment of the maximum of the individual terms. The first part of the following proposition is in this spirit, although its constant is much smaller than the constant obtainable from Hoffmann-Jørgensen's inequality.
A.1.6 Proposition. Let $X_{1}, \ldots, X_{n}$ be independent, mean-zero stochastic processes indexed by an arbitrary index set $T$. Then

$$
\begin{aligned}
\left\|\left\|S_{n}\right\|^{*}\right\|_{P, p} \leq K \frac{p}{\log p}\left[\| \| S_{n}\left\|^{*}\right\|_{P, 1}+\left\|\max _{1 \leq i \leq n}\right\| X_{i}\left\|^{*}\right\|_{P, p}\right] & (p>1) \\
\left\|\left\|S_{n}\right\|^{*}\right\|_{\psi_{p}} \leq K_{p}\left[\| \| S_{n}\left\|^{*}\right\|_{P, 1}+\left\|\max _{1 \leq i \leq n}\right\| X_{i}\left\|^{*}\right\|_{\psi_{p}}\right] & (0<p \leq 1) \\
\left\|\left\|S_{n}\right\|^{*}\right\|_{\psi_{p}} \leq K_{p}\left[\| \| S_{n}\left\|^{*}\right\|_{P, 1}+\left(\sum_{i=1}^{n}\| \| X_{i}\left\|^{*}\right\|_{\psi_{p}}^{q}\right)^{1 / q}\right] & (1<p \leq 2)
\end{aligned}
$$

Here $1 / p+1 / q=1$, and $K$ and $K_{p}$ are a universal constant and a constant depending on $p$ only, respectively.

Proof. The first part with the inferior constant $24\left(2^{1 / p}\right)\left(3^{p}\right)$ follows from the preceding Hoffmann-Jørgensen inequality by noting that ( $1- v) G^{-1}(v) \leq \int_{v}^{1} G^{-1}(s) d s \leq \mathrm{E}^{*}\left\|S_{n}\right\|$ for every $v$, and then substitution of $v_{p}=1-3^{-p} / 8$ and $K_{p}=2\left(3^{p}\right)$. The proofs of the first part with the improved constant $p / \log p$ and of the second and third parts are long and rely on the isoperimetric methods developed by Talagrand (1989). See Ledoux and Talagrand (1991), pages 172-175.

Another consequence of Hoffmann-Jørgensen's inequality is the following equivalence of moments of the supremum of sums of independent stochastic processes and the same moment of the maximal summand.
A.1.7 Proposition. Let $0<p<\infty$ and suppose that $X_{1}, X_{2}, \ldots$ are independent stochastic processes indexed by an arbitrary set $T$. If $\sup _{n \geq 1}\left\|S_{n}\right\|^{*}<\infty$ almost surely, then

$$
\mathrm{E}^{*} \sup _{n \geq 1}\left\|S_{n}\right\|^{p}<\infty
$$

if and only if

$$
\mathrm{E}^{*} \sup _{n \geq 1}\left\|X_{n}\right\|^{p}<\infty .
$$

Proof. Since $\left\|X_{n}\right\| \leq\left\|S_{n}\right\|+\left\|S_{n-1}\right\|$, finiteness of the first expectation clearly implies finiteness of the second expectation. For any fixed $n$, it follows from Proposition A.1.5 that

$$
\mathrm{E}^{*} \max _{k \leq n}\left\|S_{k}\right\|^{p} \leq C_{p}\left(\mathrm{E}^{*} \max _{k \leq n}\left\|X_{k}\right\|^{p}+F^{-1}\left(u_{p}\right)^{p}\right),
$$

where $F^{-1}$ is the quantile function of the random variable $\max _{k \leq n}\left\|S_{k}\right\|^{*}$, and $0<u_{p}<1$. Since $\sup _{n \geq 1}\left\|S_{n}\right\|$ is assumed finite almost surely, there is an $M$ so that $F^{-1}\left(u_{p}\right) \leq M$ for all $n$. Hence letting $n \rightarrow \infty$ in the last display shows that finiteness of the second expectation implies finiteness of the first expectation.

An interesting corollary of this proposition for normalized sums of independent stochastic processes is as follows.
A.1.8 Corollary. Let $0<p<\infty$ and let $\left\{a_{n}\right\}$ be a sequence of positive numbers that increases to infinity. Let $X_{1}, X_{2} \ldots$ be independent stochastic processes indexed by an arbitrary set $T$. If $\sup _{n \geq 1}\left(\left\|S_{n}\right\| / a_{n}\right)^{*}<\infty$ almost surely, then

$$
\mathrm{E}^{*} \sup _{n \geq 1} \frac{\left\|S_{n}\right\|^{p}}{a_{n}^{p}}<\infty
$$

if and only if

$$
\mathrm{E}^{*} \sup _{n \geq 1} \frac{\left\|X_{n}\right\|^{p}}{a_{n}^{p}}<\infty .
$$

Proof. See Ledoux and Talagrand (1991), page 159.
Verification of the second statement in the preceding corollary can be carried out by use of Problem 2.3.5.
A.1.9 Proposition (Hoeffding's inequality). Let $\left\{c_{1}, \ldots, c_{N}\right\}$ be elements of an arbitrary vector space $\mathbb{V}$, and let $U_{1}, \ldots, U_{n}$ and $V_{1}, \ldots, V_{n}$ denote samples of size $n \leq N$ drawn without and with replacement, respectively, from $\left\{c_{1}, \ldots, c_{N}\right\}$. Then, for every convex function $\phi: \mathbb{V} \rightarrow \mathbb{R}$,

$$
\mathrm{E} \phi\left(\sum_{j=1}^{n} U_{j}\right) \leq \mathrm{E} \phi\left(\sum_{j=1}^{n} V_{j}\right) .
$$

Proof. See Hoeffding (1963) and Marshall and Olkin (1979), Corollary A.2.e, page 339.
A.1.10 Proposition (Contraction principle). Let $X_{1}, \ldots, X_{n}$ be arbitrary stochastic processes and $\gamma_{1}, \ldots, \gamma_{n}$ arbitrary, real-valued (measurable) random variables with $0 \leq \gamma_{i} \leq 1$. Let $\xi_{1}, \ldots, \xi_{n}$ be independent, real random variables with zero means independent of $\left(X_{1}, \ldots, X_{n}, \gamma_{1}, \ldots, \gamma_{n}\right)$. Then

$$
\mathrm{E}^{*}\left\|\sum_{i=1}^{n} \xi_{i} \gamma_{i} X_{i}\right\| \leq \mathrm{E}^{*}\left\|\sum_{i=1}^{n} \xi_{i} X_{i}\right\| .
$$

Proof. Since the $\gamma_{i}$ can be taken out one at a time, it suffices to show that

$$
\mathrm{E}^{*}\|\xi \gamma X+Y\| \leq \mathrm{E}^{*}\|\xi X+Y\|
$$

whenever $\xi$ has zero mean and is independent of $(\gamma, X, Y)$. By the triangle inequality, the left side is bounded by

$$
\mathrm{E}^{*}\|(\xi X+Y) \gamma\|+\mathrm{E}^{*}\|Y(1-\gamma)\|=\mathrm{E}^{*}\|(\xi X+Y)\| \gamma+\mathrm{E}^{*}\|Y\|(1-\gamma) .
$$

The second term on the right can be written

$$
\mathrm{E}_{Y, \gamma}^{*}\left\|Y+\left(\mathrm{E}_{\xi} \xi\right) X\right\|(1-\gamma) .
$$

By Jensen's inequality and Fubini's theorem, it is bounded by $\mathrm{E}^{*} \| Y+ \xi X \|(1-\gamma)$. The result follows since $\gamma$ is measurable.

## Problems and Complements

1. In the first inequality of Proposition A.1.5, the constants $C_{p}=2\left(4^{p}\right)$ and $u_{p}=1-4^{-p} / 2$ will do. The second inequality is true for symmetric processes with $K_{p}=2\left(3^{p}\right)$ and $v_{p}=1-3^{-p} / 8$; for mean-zero processes with $K_{p}=4\left(6^{p}\right)$ and $v_{p}=1-3^{-p} / 16$.

## A. 2

## Gaussian Processes

Since Gaussian processes arise as the limits in distribution of empirical processes, their properties are of importance for many of the developments in Parts 2 and 3. Inequalities for Gaussian processes have also been used in a number of proofs involving multiplier processes with Gaussian multipliers. In this chapter we discuss the most important results.

## A.2.1 Inequalities and Gaussian Comparison

Throughout this section $X$ and $Y$ denote separable, Gaussian stochastic processes indexed by a semimetric space $T$, and $\|X\|$ is the supremum $\sup _{t \in T}\left|X_{t}\right|$. The process $X$ is mean-zero if $\mathrm{E} X_{t}=0$ for all $t \in T$. Let $M(X)$ denote a median of $\|X\|$, defined by the two requirements

$$
\mathrm{P}(\|X\| \leq M(X)) \geq \frac{1}{2} \quad ; \quad \mathrm{P}(\|X\| \geq M(X)) \geq \frac{1}{2}
$$

(In the proof of the following proposition, it is shown that $M(X)$ is unique.) Furthermore, define

$$
\sigma^{2}(X)=\sup _{t \in T} \operatorname{var} X_{t}
$$

The following proposition shows that the distribution of the supremum of a zero-mean Gaussian process has sub-Gaussian tails, whenever it is finite.
A.2.1 Proposition (Borell's inequality). Let $X$ be a mean-zero, separable Gaussian process $X$ with finite median. Then for every $\lambda>0$,

$$
\begin{aligned}
\mathrm{P}(\|\|X\|-M(X) \mid \geq \lambda) & \leq \exp \left(-\frac{\lambda^{2}}{2 \sigma^{2}(X)}\right) \\
\mathrm{P}(\|\|X\|-\mathrm{E}\| X \| \mid \geq \lambda) & \leq 2 \exp \left(-\frac{\lambda^{2}}{2 \sigma^{2}(X)}\right) \\
\mathrm{P}(\|X\| \geq \lambda) & \leq 2 \exp \left(-\frac{\lambda^{2}}{8 \mathrm{E}\|X\|^{2}}\right)
\end{aligned}
$$

Proof. The proof is based on finite-dimensional approximation and the concentration inequalities for the finite-dimensional, standard normal distribution given in the lemma ahead.

First, consider the case that the index set $T$ consists of finitely many points $t_{1}, \ldots, t_{k}$. Then the process $X$ can be represented as $A Z$, for $Z$ a standard normal vector and $A$ the symmetric square root of the covariance matrix of $X$. By the Cauchy-Schwarz inequality,

$$
\max _{1 \leq i \leq k}|A z|_{i} \leq \max _{1 \leq i \leq k}\left\|A_{i} .\right\|\|z\|=\max _{1 \leq i \leq k}\left(A_{i i}^{2}\right)^{1 / 2}\|z\| .
$$

This implies that the function $f(z)=\max _{i}|A z|_{i}$ is Lipschitz of norm bounded by $\sup _{t} \sigma\left(X_{t}\right)=\sigma(X)$. Apply Lemma A.2.2 to both $f$ and $-f$, and combine the results to obtain the theorem for the case where the index set is finite.

Since $X$ is separable by assumption, the supremum $\|X\|$ is the almostsure, monotone limit of a sequence of finite suprema. The supremum $M$ of the sequence of medians can be seen to be a median (the smallest) of $\|X\|$. Approximate $\|X\|-M(X)$ by a sequence of similar objects for finite suprema to obtain the first inequality of the theorem with $M=M(X)$. The proof of this inequality is complete if it is shown that $M$ is the only median of $\|X\|$.

Since the median of $\left|X_{t}\right|$ is bounded above by the median of $\|X\|$, it follows that $\mathrm{P}\left(\left|X_{t}\right| \leq M(X)\right) \geq \frac{1}{2}$ for every $t$. Taking into account the normal distribution of $X_{t}$, we obtain that $\sigma\left(X_{t}\right)$ is bounded above by $M(X) / \Phi^{-1}(3 / 4)$. Therefore, $\sigma(X)$ is finite and the exponential inequality obtained previously is nontrivial. The argument actually shows that both the left-tail probability $\mathrm{P}(\|X\| \leq M-\lambda)$ and the right-tail probability $\mathrm{P}(\|X\| \geq M+\lambda)$ are bounded by $1 / 2$ times the exponential upper bound. This means that these probabilities are strictly less than $1 / 2$ for $\lambda>0$, whence $M$ is a unique median of $\|X\|$.

To obtain the second inequality of the theorem, we note first that $\mathrm{E}\|X\|$ is finite in view of the exponential tail bound for $\|X\|-M(X)$. Next we use the following lemma and take limits along finite subsets as before.

The third inequality is trivially satisfied if $0 \leq \lambda<2 \mathrm{E}\|X\|$, because in that case the exponential is larger than $\exp \left(-\frac{1}{2}\right) \geq 0.6$. For $\lambda>2 \mathrm{E}\|X\|$,
the probability is bounded by $\mathrm{P}(\|X\|>\mathrm{E}\|X\|+\lambda / 2)$, which can be further bounded by the second inequality. $\square$
A.2.2 Lemma. Let $Z$ be a $d$-dimensional random vector with the standard normal distribution. Then for every Lipschitz function $f: \mathbb{R}^{d} \mapsto \mathbb{R}$ with $\|f\|_{\text {Lip }} \leq 1$,

$$
\begin{aligned}
\mathrm{P}(f(Z)-\operatorname{med} f(Z)>\lambda) & \leq \frac{1}{2} \exp \left(-\frac{1}{2} \lambda^{2}\right), \\
\mathrm{P}(f(Z)-\operatorname{E} f(Z)>\lambda) & \leq \exp \left(-\frac{1}{2} \lambda^{2}\right) .
\end{aligned}
$$

Proof. For the first inequality consider, the set $A=\{z: f(z) \leq \operatorname{med} f(Z)\}$. Since $f$ has Lipschitz norm bounded by 1 , the set $A^{\lambda}$ of points at distance at most $\lambda$ from $A$ is contained in the set $\{z: f(z) \leq \operatorname{med} f(Z)+\lambda\}$. It follows that

$$
\mathrm{P}(f(Z) \leq \operatorname{med} f(Z)+\lambda) \geq \mathrm{P}\left(Z \in A^{\lambda}\right) .
$$

By definition of the median, the set $A$ has probability at least $1 / 2$ under the standard normal distribution. According to the isoperimetric inequality for the normal distribution, ${ }^{\ddagger}$ a half-space $H$ with boundary at the origin is an extreme set in the sense that for any set $A$ with probability at least $1 / 2$ we have $\mathrm{P}\left(Z \in A^{\lambda}\right) \geq \mathrm{P}\left(Z \in H^{\lambda}\right)$ for every $\lambda>0$. The proof of the first inequality of the lemma is complete upon noting that $\mathrm{P}\left(Z \in H^{\lambda}\right)=\Phi(\lambda)$ and $1-\Phi(\lambda) \leq \frac{1}{2} \exp \left(-\frac{1}{2} \lambda^{2}\right)$.

For the proof of the second inequality, assume without loss of generality that $\mathrm{E} f(Z)=0$. An arbitrary Lipschitz function $f$ can be approximated by arbitrarily smooth functions with compact supports and of no larger Lipschitz norms. Therefore, it is no loss of generality to assume that $f$ is sufficiently regular. In particular assume without loss of generality that $f$ is differentiable with gradient $\nabla f$ uniformly norm bounded by 1 .

Let $Z_{t}$ be normally distributed with mean zero and covariance matrix $\left(1-e^{-2 t}\right) I$. For $t \geq 0$, define functions $P_{t} f$ by

$$
P_{t} f(x)=\mathrm{E} f\left(e^{-t} x+Z_{t}\right) .
$$

The operators $P_{t}$ form a semigroup ( $P_{0}=I$ and $P_{s} P_{t}=P_{s+t}$ ) on a domain that includes all sufficiently regular functions: the Ornstein-Uhlenbeck or Hermite semigroup defined via Mehler's formula. The generator of the group is the derivative $A=d / d t P_{t \mid t=0}$ and has the property that $d / d t P_{t}=A P_{t}$. We shall need the integration-by-parts formula

$$
-\mathrm{E} f(Z) A g(Z)=\mathrm{E}\langle\nabla f(Z), \nabla g(Z)\rangle .
$$

This is valid for sufficiently regular functions $f$ and $g$.
For fixed $r>0$, define $G(t)=E \exp \left(r P_{t} f(Z)\right)$. Then $G(0)= E \exp (r f(Z))$ is the moment-generating function of $f(Z)$ and $G(\infty)=1$.

[^3]Differentiating under the expectation and using the integration-by-parts formula. we obtain

$$
\begin{aligned}
-G^{\prime}(t) & =-r \mathrm{E} e^{r P_{t} f(Z)} A P_{t} f(Z) \\
& =r \mathrm{E}\left\langle\nabla e^{r P_{t} f(Z)}, \nabla P_{t} f(Z)\right\rangle=r^{2} \mathrm{E} e^{r P_{t} f(Z)}\left\|\nabla P_{t} f(Z)\right\|^{2}
\end{aligned}
$$

Differentiating under the expectation in the definition of $P_{t} f$, we see that the gradient $\nabla P_{t} f(x)$ is equal to $\mathrm{E} \nabla f\left(e^{-t} x+Z_{t}\right) e^{-t}$ and its norm is bounded above by $\sup _{x}\|\nabla f(x)\| e^{-t}$. Substitution in the preceding display yields the inequality $-G^{\prime}(t) \leq r^{2} e^{-2 t} G(t)$. Equivalently,

$$
(\log G)^{\prime}(t) \geq\left(\frac{1}{2} r^{2} e^{-2 t}\right)^{\prime}
$$

Since the functions $\log G$ and $\frac{1}{2} r^{2} e^{-2 t}$ are both zero at $\infty$ and hence equal, it follows that $\log G$ is smaller than $\frac{1}{2} r^{2} e^{0}$ at zero. This concludes the proof that $E \exp r f(Z)=G(0) \leq \exp \left(\frac{1}{2} r^{2}\right)$.

By Markov's inequality, it follows that $\mathrm{P}(f(Z) \geq \lambda) \leq \exp \left(\frac{1}{2} r^{2}-r \lambda\right)$ for every $r>0$. Optimize to conclude the proof of the lemma.

The process $X$ having bounded sample paths is the same as $\|X\|$ being a finite random variable. In that case the median $M(X)$ is certainly finite and $\sigma(X)$ is finite by the argument in the proof of the preceding proposition. Next, the inequalities in the preceding proposition show that $\|X\|$ has moments of all orders. In fact, we have the following proposition.
A.2.3 Proposition. Let $X$ be a mean-zero, separable Gaussian process such that $\|X\|$ is finite almost surely. Then

$$
E \exp \left(\alpha\|X\|^{2}\right)<\infty \quad \text { if and only if } \quad \alpha 2 \sigma^{2}(X)<1 .
$$

Proof. The sufficiency of the condition $\alpha 2 \sigma^{2}(X)<1$ follows by integrating Borell's inequality. The necessity may be proved by considering the individual $X_{t}$, whose normal distributions can be handled explicitly.

Thus, for Gaussian processes, finiteness of lower moments implies finiteness of higher moments. Higher moments can even be bounded by lower ones up to universal constants. The following proposition reverses the usual Liapunov inequality for moments.
A.2.4 Proposition. There exist constants $K_{p, q}$ depending on $0<p \leq q< \infty$ only such that

$$
\left(\mathrm{E}\|X\|^{q}\right)^{1 / q} \leq K_{p, q}\left(\mathrm{E}\|X\|^{p}\right)^{1 / p}
$$

for any separable Gaussian process $X$ for which $\|X\|$ is finite almost surely.

For a centered Gaussian process $\left\{X_{t}: t \in T\right\}$, let $\rho$ denote its standard deviation semimetric on $T$ defined by

$$
\rho(s, t)=\sigma\left(X_{s}-X_{t}\right), \quad s, t \in T .
$$

Let $N(\varepsilon, T, \rho)$ be the covering number of $T$ with respect to $\rho$. By Corollary 2.2.8, the expectation $\mathrm{E}\|X\|$ can be bounded above by an entropy integral with respect to this metric. Sudakov's inequality gives a bound in the opposite direction.
A.2.5 Proposition (Sudakov's inequality). For every mean-zero, separable Gaussian process $X$,

$$
\sup _{\varepsilon>0} \varepsilon \sqrt{\log N(\varepsilon, T, \rho)} \leq 3 \mathrm{E}\|X\| .
$$

Moreover, if $X$ has almost all sample paths bounded and uniformly continuous on $(T, \rho)$, then $\varepsilon \sqrt{\log N(\varepsilon, T, \rho)} \rightarrow 0$ as $\varepsilon \rightarrow 0$.

Proofs. See Ledoux and Talagrand (1991), pages 79-81. For the second part, also see Lemma 2.10.15.

The distribution of a mean-zero Gaussian process is completely determined by its covariance function. According to Anderson's lemma (Lemma 3.11.4), a smaller covariance function indicates that the process is more concentrated near zero. The following theorem is in the same spirit and shows that smaller variances of differences imply a stochastically smaller maximum value.
A.2.6 Proposition (Slepian, Fernique, Marcus, and Shepp). Let $X$ and $Y$ be separable, mean-zero Gaussian processes indexed by a common index set $T$ such that

$$
\mathrm{E}\left(X_{s}-X_{t}\right)^{2} \leq \mathrm{E}\left(Y_{s}-Y_{t}\right)^{2}, \quad \text { for all } s, t \in T
$$

Then

$$
\mathrm{P}\left(\sup _{t \in T} X_{t} \geq \lambda\right) \leq \mathrm{P}\left(\sup _{t \in T} Y_{t} \geq \lambda\right), \quad \text { for all } \lambda>0
$$

Consequently, $\mathrm{Esup}_{t \in T} X_{t} \leq \operatorname{Esup}_{t \in T} Y_{t}$ and $\mathrm{E}\left\|X_{t}\right\| \leq 2 \mathrm{E}\left\|Y_{t}\right\|$. If $T$ is a compact metric space and $Y$ has a version with continuous sample paths, then so does $X$.

Proof. See Ledoux and Talagrand (1991).

## A.2.2 Exponential Bounds

To obtain exponential bounds for $\|X\|=\sup _{t \in T}\left|X_{t}\right|$ without the centering by $M(X)$ or $\mathrm{E}\|X\|$ as in Proposition A.2.1, requires hypotheses giving control of $\mathrm{E}\|X\|$ (or equivalently of $M(X)$ ). The following theorem, due to Talagrand, is an example of results of this type.

For a given Gaussian process $X$ indexed by an arbitrary set $T$, we denote by $\rho$ its "natural semimetric" $\rho(s, t)=\sigma\left(X_{s}-X_{t}\right)$. Recall that $\sigma(X)$ is the supremum of the standard deviations $\sigma\left(X_{t}\right)$. Let $\bar{\Phi}(z)=\int_{z}^{\infty} \phi(x) d x \leq z^{-1} \phi(z)$ be the tail probability of a standard normal variable.
A.2.7 Proposition. Let $X$ be a separable, mean-zero Gaussian process such that for some $K>\sigma(X)$, some $V>0$, and some $0<\varepsilon_{0} \leq \sigma(X)$,

$$
N(\varepsilon, T, \rho) \leq\left(\frac{K}{\epsilon}\right)^{V}, \quad 0<\varepsilon<\varepsilon_{0} .
$$

Then there exists a universal constant $D$ such that, for all $\lambda \geq \sigma^{2}(X)(1+ \sqrt{V}) / \epsilon_{0}$,

$$
\mathrm{P}\left(\sup _{t \in T} X_{t} \geq \lambda\right) \leq\left(\frac{D K \lambda}{\sqrt{V} \sigma^{2}(X)}\right)^{V} \bar{\Phi}\left(\frac{\lambda}{\sigma(X)}\right) .
$$

This is closely related to Theorems 2.14.9 and 2.14.13 for empirical processes. Another result of Talagrand for Gaussian processes which is parallel to Theorem 2.14.14 in the case of empirical processes, is as follows.
A.2.8 Proposition. Let $X$ be a separable, zero-mean Gaussian process, and for $\delta>0$, let

$$
T_{\delta}=\left\{t \in T: \mathrm{E} X_{t}^{2} \geq \sigma^{2}(X)-\delta^{2}\right\}
$$

Let $V \geq W \geq 1$, and suppose that, for all $0<\delta^{2} \leq \sigma^{2}(X)$ and all $0<\epsilon \leq \delta(1+\sqrt{V}) / \sqrt{W}$,

$$
\begin{equation*}
N\left(\epsilon, T_{\delta}, \rho\right) \leq K \delta^{W} \epsilon^{-V} \tag{A.2.9}
\end{equation*}
$$

Then there exists a universal constant $D$ such that, for $\lambda \geq 2 \sigma(X) \sqrt{W}$,

$$
\mathrm{P}\left(\sup _{t \in T} X_{t} \geq \lambda\right) \leq K \frac{W^{W / 2}}{V^{V / 2}} D^{V+W}\left(\frac{\lambda}{\sigma^{2}(X)}\right)^{V-W} \bar{\Phi}\left(\frac{\lambda}{\sigma(X)}\right) .
$$

For more results in this vein, see Talagrand (1994), Samorodnitsky (1991), Adler (1990) and Adler and Brown (1986). For particular Gaussian random fields, both the renewal theoretic methods of Siegmund (1988, 1992), and the "Poisson clump heuristic" methods of Aldous (1989), yield results on the asymptotic behavior of $\mathrm{P}\left(\sup _{t \in T} X_{t} \geq \lambda\right)$, as $\lambda \rightarrow \infty$, that often seem to provide accurate approximations for $\lambda$ on the order of $1.5 \sigma(X)$. Here are some particular examples of the above theorems with connections to the results of Hogan and Siegmund (1986), Siegmund (1988, 1992), and Aldous (1989).
A.2.10 Example (Brownian sheet on $[0,1]^{2}$ ). The standard Brownian sheet $B$ is a zero-mean Gaussian process indexed by $T=[0,1]^{2}$, with covariance function

$$
\operatorname{cov}(B(s), B(t))=\left(s_{1} \wedge t_{1}\right)\left(s_{2} \wedge t_{2}\right)
$$

Then $\sigma^{2}(B)=1$, and (A.2.9) holds with $V=4$ and $W=4$. Hence, for some constant $M$, and $\lambda>0$,

$$
\mathrm{P}\left(\sup _{t \in T} B_{t} \geq \lambda\right) \leq M \lambda^{-1} \exp \left(-\frac{\lambda^{2}}{2}\right) .
$$

In fact, it was shown by Goodman (1976) that, for all $\lambda>0$,

$$
4 \int_{\lambda}^{\infty} z \bar{\Phi}(z) d z \leq \mathrm{P}\left(\sup _{t \in T} B_{t} \geq \lambda\right) \leq 4 \bar{\Phi}(\lambda)
$$

These inequalities imply that, for $\lambda \rightarrow \infty$,

$$
\mathrm{P}\left(\sup _{t \in T} B_{t} \geq \lambda\right) \sim 4 \bar{\Phi}(\lambda)=4 \mathrm{P}(B(1,1) \geq \lambda) \sim \sqrt{\frac{8}{\pi}} \lambda^{-1} \exp \left(-\frac{\lambda^{2}}{2}\right) .
$$

A.2.11 Example (Brownian bridge on $[0,1]^{2}$ ). The Brownian sheet $B^{0}$ pinned down to 0 at $t=(1,1)$ is a zero-mean Gaussian process indexed by $[0,1]^{2}$, with covariance function

$$
\operatorname{cov}\left(B^{0}(s), B^{0}(t)\right)=\left(s_{1} \wedge t_{1}\right)\left(s_{2} \wedge t_{2}\right)-s_{1} s_{2} t_{1} t_{2}
$$

Alternatively, $B^{0}$ can be defined from the Brownian sheet of Example A.2.10, by setting

$$
B^{0}\left(t_{1}, t_{2}\right)=B\left(t_{1}, t_{2}\right)-t_{1} t_{2} B(1,1) .
$$

This is just the $P$-Brownian bridge process $\mathbb{G}_{P}$ indexed by the collection of sets $\{[0, t]: t \in[0,1]\}$, with $P$ equal to the uniform distribution (Lebesgue measure) on $[0,1]^{2}$. Then $\sigma^{2}\left(B^{0}\right)=1 / 4$, and this supremum is achieved for every $t \in[0,1]^{2}$ with $t_{1} t_{2}=1 / 2$. It can be shown that (A.2.9) holds with $V=4$ and $W=1$. Therefore, for some constant $M$,

$$
\mathrm{P}\left(\sup _{t \in T} B_{t}^{0} \geq \lambda\right) \leq M \lambda^{2} \exp \left(-2 \lambda^{2}\right) .
$$

It has been shown by Hogan and Siegmund (1986) and also by Aldous (1989), page 202, that as $\lambda \rightarrow \infty$,

$$
\mathrm{P}\left(\sup _{t \in T} B_{t}^{0} \geq \lambda\right) \sim(4 \log 2) \lambda^{2} \exp \left(-2 \lambda^{2}\right) .
$$

In this case Goodman (1976) established the lower bound

$$
\mathrm{P}\left(\sup _{t \in T} B_{t}^{0} \geq \lambda\right) \geq\left(1+2 \lambda^{2}\right) \exp \left(-2 \lambda^{2}\right), \quad \lambda>0 .
$$

The asymptotic formula of Hogan and Siegmund becomes greater than Goodman's lower bound for $\lambda \geq(2(\log 4-1))^{-1 / 2}=1.138 \ldots$. For this and some numerical comparisons, see Adler (1990), Chapter V.
A.2.12 Example (Tucked brownian sheet on $[0,1]^{2}$ ). The tucked Brownian sheet is the zero-mean Gaussian process indexed by $[0,1]^{2}$, with covariance function

$$
\operatorname{cov}\left(B^{00}(s), B^{00}(t)\right)=\left(s_{1} \wedge t_{1}-s_{1} t_{1}\right)\left(s_{2} \wedge t_{2}-s_{2} t_{2}\right)
$$

This can be obtained from the Brownian sheet given in Example A.2.10, by pinning it down to 0 on the entire boundary of $[0,1]^{2}$, i.e.

$$
B^{00}\left(t_{1}, t_{2}\right)=B\left(t_{1}, t_{2}\right)-t_{1} B\left(1, t_{2}\right)-t_{2} B\left(t_{1}, 1\right)+t_{1} t_{2} B(1,1) .
$$

This process arises in testing independence and in connection with the estimation of copula functions; see Chapters 3.8 and 3.9. In this case $\sigma^{2}\left(B^{00}\right)=1 / 16$, and this supremum is uniquely achieved for $t=(1 / 2,1 / 2)$. It can be shown that (A.2.9) holds with $V=4$ and $W=2$. Therefore, for some constant $M$,

$$
\mathrm{P}\left(\sup _{t \in T} B_{t}^{00} \geq \lambda\right) \leq M \lambda \exp \left(-8 \lambda^{2}\right) .
$$

It follows from the methods of Siegmund (1988, 1992), or alternatively from Aldous (1989), that as $\lambda \rightarrow \infty$,

$$
\mathrm{P}\left(\sup _{t \in T} B_{t}^{00} \geq \lambda\right) \sim(4 \sqrt{2 \pi}) \lambda \exp \left(-8 \lambda^{2}\right) .
$$

A.2.13 Example (Kiefer-Müller process on $[0,1]^{2}$ ). The Kiefer-Müller process $Z$ on $[0,1]^{2}$ can be obtained from a Brownian sheet $B$ by way of

$$
Z\left(t_{1}, t_{2}\right)=B\left(t_{1}, t_{2}\right)-t_{2} B\left(t_{1}, 1\right) .
$$

Then $Z$ has covariance function

$$
\operatorname{cov}\left(Z\left(s_{1}, t_{1}\right), Z\left(s_{2}, t_{2}\right)\right)=\left(s_{1} \wedge s_{2}\right)\left(t_{1} \wedge t_{2}-t_{1} t_{2}\right) .
$$

This process is a special case of the $P$-Kiefer process in Chapter 2.12 with $P$ the uniform distribution on $[0,1]$ and $\mathcal{F}=\left\{1_{[0, t]}: t \in[0,1]\right\}$. In this case $\sigma^{2}(Z)=1 / 4$, and this is uniquely achieved for $(s, t)=(1,1 / 2)$. It can be shown that (A.2.9) holds with $V=4$ and $W=3$. Therefore, for some constant $M$,

$$
\mathrm{P}\left(\sup _{t \in T} Z_{t} \geq \lambda\right) \leq M \exp \left(-2 \lambda^{2}\right) .
$$

It follows from the methods of Siegmund (1988, 1992), or alternatively from Aldous (1989), that as $\lambda \rightarrow \infty$,

$$
\mathrm{P}\left(\sup _{t \in T} Z_{t} \geq \lambda\right) \sim 2 \exp \left(-2 \lambda^{2}\right) .
$$

A.2.14 Example (Brownian bridge indexed by convex subsets of $[0,1]^{2}$ ). Consider the $P$-Brownian bridge process with $P$ uniform on $[0,1]^{2}$ indexed by the collection $\mathcal{C}$ of all convex subsets of $[0,1]^{2}$. It follows from Corollary 2.7.9 (with $d=r=2$ ) that

$$
\begin{equation*}
\log N_{[]}\left(\varepsilon, \mathcal{C}, L_{2}(P)\right) \leq K\left(\frac{1}{\varepsilon}\right), \tag{A.2.15}
\end{equation*}
$$

and hence $\mathcal{C}$ is $P$-preGaussian. Although neither Theorem A.2.7 nor A.2.8 apply in this case, the methods of Samorodnitsky (1991) apply, and show that for some constants $C$ and $D$,

$$
\begin{equation*}
\mathrm{P}\left(\sup _{C \in \mathcal{C}} \mathbb{G}_{P}(C) \geq \lambda\right) \leq C \exp \left(D \lambda^{2 / 3}\right) \exp \left(-2 \lambda^{2}\right) . \tag{A.2.16}
\end{equation*}
$$

More generally, the methods of Samorodnitsky (1991) show that if the power 1 in (A.2.15) is replaced by $V$, then the power $2 / 3$ in (A.2.16) must be replaced by $2 V /(V+2)$.

## A.2.3 Majorizing Measures

A separable, zero-mean Gaussian process $\left\{X_{t}: t \in T\right\}$ indexed by an arbitrary index set $T$ is sub-Gaussian with respect to its standard deviation semimetric $\rho(s, t)=\sigma\left(X_{s}-X_{t}\right)$. Thus Corollary 2.2.8 yields for every $\delta>0$

$$
\mathrm{E} \sup _{\rho(s, t)<\delta}\left|X_{s}-X_{t}\right| \lesssim \int_{0}^{\delta} \sqrt{\log N(\varepsilon, T, \rho)} d \varepsilon
$$

where $N(\varepsilon, T, \rho)$ is the covering number of $T$ with respect to $\rho$. If the entropy integral on the right is finite, then it follows immediately that the process is uniformly $\rho$-continuous in mean. This conclusion may be strengthened to the uniform continuity of almost all sample paths with the help of the Borel-Cantelli lemma (Problem 2.2.17).

While a finite entropy integral is sufficient for the sample-path continuity of a Gaussian process, it is not necessary. Majorizing measures may be considered a refinement of entropy numbers and yield a necessary and sufficient condition for sample-path continuity.
A.2.17 Proposition. Let $\left\{X_{t}: t \in T\right\}$ be a separable zero-mean Gaussian process with standard deviation semimetric $\rho$. Then almost all sample paths $t \rightarrow X_{t}$ are uniformly $\rho$-continuous and bounded if and only if

$$
\begin{equation*}
\limsup _{\delta \downarrow 0} \int_{t \in T}^{\delta} \sqrt{\log \frac{1}{\mu(B(t, \varepsilon))}} d \varepsilon=0 \tag{A.2.18}
\end{equation*}
$$

for some Borel probability measure $\mu$ on ( $T, \rho$ ). Here $B(t, \varepsilon)$ is the $\rho$-ball of radius $\varepsilon$ around $t$.

A measure $\mu$ for which the integral in the theorem is finite is called a majorizing measure. A further result on majorizing measures is that finiteness of the integral characterizes the boundedness of the sample paths. Among the bounded processes the uniformly continuous processes are characterized by majorizing measures with the additional property that the majorizing measure integral is continuous at zero, as in (A.2.18). A chaining argument may establish that for any probability measure $\mu$ and every $\delta, \eta>0,^{\text {b }}$

$$
\begin{aligned}
& \mathrm{E} \sup _{t}\left|X_{t}-X_{t_{0}}\right| \lesssim \sup _{t} \int_{0}^{\infty} \sqrt{\log \frac{1}{\mu(B(t, \varepsilon))}} d \varepsilon \\
\mathrm{E} & \sup _{\rho(s, t)<\delta}\left|X_{s}-X_{t}\right| \lesssim \sup _{t} \int_{0}^{\eta} \sqrt{\log \frac{1}{\mu(B(t, \varepsilon))}} d \varepsilon+\delta \sqrt{N(\eta, T, \rho)}
\end{aligned}
$$

This explains the name "majorizing measure" and readily yields one direction of the preceding proposition. In the other direction, the proposition is harder to prove. This converse part is used in the proof of Theorem 2.11.11 in combination with the following lemma.
A.2.19 Lemma. Let $T$ be a semimetric space and $\mu$ be a Borel probability measure on $T$ such that (A.2.18) holds. Then there exists a probability measure $m$ on $T$ and a sequence of nested, measurable partitions $T=\cup_{i} T_{q i}$ such that $\operatorname{diam} T_{q i} \leq 2^{-q}$ for every $i$ and

$$
\lim _{q_{0} \rightarrow \infty} \sup _{t \in T} \sum_{q>q_{0}} 2^{-q} \sqrt{\log \frac{1}{m\left(T_{q} t\right)}}=0
$$

where $T_{q} t$ is the partitioning set $T_{q i}$ at level $q$ to which $t$ belongs.
Proof. The set $T$ is totally bounded: the existence of infinitely many disjoint balls $B\left(t_{i}, \delta\right)$ of fixed radius $\delta>0$ would require that $\mu\left(B\left(t_{i}, \delta\right)\right) \rightarrow 0$ as $i \rightarrow \infty$. However,

$$
\sup _{t} \delta \sqrt{\log \frac{1}{\mu(B(t, \delta))}} \leq \sup _{t} \int_{0}^{\delta} \sqrt{\log \frac{1}{\mu(B(t, \varepsilon))}} d \varepsilon .
$$

The right-hand side is finite by assumption.
Fix $\delta>0$. Find a point $t_{1}$ that (nearly) maximizes $\mu(B(t, \delta))$ over $t \in T$. Precisely, let $\mu\left(B\left(t_{1}, \delta\right)\right) \geq r \sup _{t} \mu(B(t, \delta))$ for some fixed $0<r \leq 1$. Set $m\left\{t_{1}\right\}=\mu\left(B\left(t_{1}, \delta\right)\right)$, and let $T_{1}=B\left(t_{1}, 2 \delta\right)$ be the ball of radius $2 \delta$ around $t_{1}$. For every $t \in T_{1}$ (even for every $t \in T$ ),

$$
r \mu(B(t, \delta)) \leq \mu\left(B\left(t_{1}, \delta\right)\right)=m\left\{t_{1}\right\} \leq m\left(T_{1}\right) .
$$

[^4]Next, find a $t_{2}$ that nearly maximizes $\mu(B(t, \delta))$ over $t \in T-T_{1}$. Set $m\left\{t_{2}\right\}=\mu\left(B\left(t_{2}, \delta\right)\right)$, and let $T_{2}=B\left(t_{2}, 2 \delta\right)-T_{1}$. For every $t \in T_{2}$

$$
r \mu(B(t, \delta)) \leq \mu\left(B\left(t_{2}, \delta\right)\right)=m\left\{t_{2}\right\} \leq m\left(T_{2}\right) .
$$

Continue this process, constructing disjoint sets $T_{1}, T_{2}, \ldots, T_{I}$ until the set of $t$ with $\rho\left(t, t_{i}\right) \geq 2 \delta$ for every $i$ is empty. Then $T=\cup_{i} T_{i}$ is a finite partition of $T$ in sets of diameter at most $2 \delta$ and $m\left(T_{i}\right) \geq r \mu(B(t, \delta))$ for every $t \in T_{i}$.

Apply this construction for $\delta=2^{-q-1}$ and every natural number $q$. This yields a sequence of partitions $T=\cup_{i} \bar{T}_{q i}$ and measures $\bar{m}_{q}$ such that

$$
\sum_{q>q_{0}} 2^{-q} \sqrt{\log \frac{1}{\bar{m}_{q}\left(\bar{T}_{q} t\right)}} \leq \sum_{q>q_{0}} 2^{-q} \sqrt{\log \frac{1}{r \mu\left(B\left(t, 2^{-q-1}\right)\right.}} .
$$

The right side is bounded by a multiple of

$$
\int_{0}^{2^{-q_{0}}} \sqrt{\log 1 / \mu(B(t, \varepsilon))} d \varepsilon
$$

if $\mu(B(t, \varepsilon))$ is bounded away from 1 , which may be assumed.
The present sequence of partitions need not be nested. Replace the $q$ th partition by the partition in the sets $\cap_{p=1}^{q} \bar{T}_{p, i_{p}}$, where $i_{1}, \ldots, i_{q}$ range over all possible values. For each set in the $q$ th partition, define

$$
m_{q}\left(\cap_{p=1}^{q} \bar{T}_{p, i_{p}}\right)=\prod_{p=1}^{q} \bar{m}_{p}\left(\bar{T}_{p, i_{p}}\right) .
$$

(The exact location of the mass is irrelevant.) Next, set $m=\sum_{q} 2^{-q} m_{q}$. Then $m$ is a subprobability measure and

$$
\sum_{q>q_{0}} 2^{-q} \sqrt{\log \frac{1}{m\left(T_{q} t\right)}} \leq \sum_{q>q_{0}} 2^{-q} \sqrt{\log 2^{q}+\sum_{p=1}^{q} \log \frac{1}{\bar{m}_{p}\left(\bar{T}_{p} t\right)}} .
$$

This converges to zero uniformly in $t$ as $q_{0} \rightarrow \infty$.

## A.2.4 Further Results

Many $M$-estimators are asymptotically distributed as the point of maximum of a Gaussian process. This point of maximum is not always easy to evaluate. The following proposition shows that a point of absolute maximum is unique, if it exists.
A.2.20 Proposition. Let $\left\{X_{t}: t \in T\right\}$ be a Gaussian process with continuous sample paths, indexed by a $\sigma$-compact metric space $T$. If $\operatorname{var}\left(X_{s}-X_{t}\right) \neq$ 0 for every $s \neq t$, then almost every sample path achieves its supremum at at most one point.

Proof. See Kim and Pollard (1990), Lemma 2.6.

## Problems and Complements

1. For every separable Gaussian process, $\sigma^{2}(X) \leq M^{2}(X) / \Phi^{-1}(3 / 4)^{2}$.
[Hint: See the proof of Proposition A.2.1.]
2. For every separable Gaussian process $\mathrm{E}\|X\|^{p} \leq K_{p} M(X)^{p}$ for a constant depending on $p$ only.
[Hint: Integrate Borell's inequality to bound $\mathrm{E}\|X-M(X)\|^{p}$. Next, use the preceding problem.]
3. For every separable Gaussian process, $|\mathrm{E}\|X\|-M(X)| \leq \sqrt{\pi / 2} \sigma(X)$.
4. Suppose that $\mathcal{F}$ and $\mathcal{G}$ are pre-Gaussian classes of measurable functions. Use majorizing measures to show that $\mathcal{F} \cup \mathcal{G}$ is pre-Gaussian.
5. Every tight, Borel measurable centered, Gaussian variable $X$ in $\ell^{\infty}(T)$ satisfies $\mathrm{P}(\|X\|<\varepsilon)>0$ for every $\varepsilon>0$.
[Hint: By Anderson's lemma, $\mathrm{P}(\|X-x\| \leq \varepsilon) \leq \mathrm{P}(\|X\| \leq \varepsilon)$ for every $x$. The support of $X$ can be covered by countably many balls.]
6. Verify the claim made in Example A.2.10 that (A.2.9) holds with $V=4, W=$ 4. Do the same for Example A.2.11, Example A.2.12, and Example A.2.13.
[Hint: First determine the size and shapes of the $\epsilon$-balls with respect to the semimetric $\rho$, and note that $V=4$ is consistent with Example 2.6.1 and Theorem 2.6.4. Then determine the size and shape of the $\operatorname{set}(\mathrm{s}) T_{\delta}$.]
7. Use Lévy's inequality twice to show that for the Brownian sheet $B$,

$$
\begin{aligned}
\mathrm{P}\left(\sup _{0 \leq t_{i} \leq 1} B\left(t_{1}, t_{2}\right) \geq \lambda\right) & \leq 2 \mathrm{P}\left(\sup _{0 \leq t_{2} \leq 1} B\left(1, t_{2}\right) \geq \lambda\right) \\
& \leq 4 \mathrm{P}(B(1,1) \geq \lambda)=4 \bar{\Phi}(\lambda)
\end{aligned}
$$

(In fact, from known results about the suprema of Brownian motion (the reflection principle), the second inequality holds with equality.) Similarly, use Lévy's inequality to show that for the Kiefer-Müller process $Z$

$$
\mathrm{P}\left(\sup _{0 \leq t_{i} \leq 1} Z\left(t_{1}, t_{2}\right) \geq \lambda\right) \leq 2 \mathrm{P}\left(\sup _{0 \leq t_{2} \leq 1} Z\left(1, t_{2}\right) \geq \lambda\right)=2 \exp \left(-2 \lambda^{2}\right)
$$

since the process $\left\{Z\left(1, t_{2}\right): 0 \leq t_{2} \leq 1\right\}$ is a standard Brownian bridge process on $[0,1]$, for which the distribution of the one-sided supremum is known from Doob (1949); see Shorack and Wellner (1986), page 34.

## A. 3

## Rademacher Processes

Let $\varepsilon_{1}, \ldots, \varepsilon_{n}$ be Rademacher variables and $x_{1}, \ldots, x_{n}$ arbitrary real functions on some "index" set $T$. The Rademacher process $\left\{\sum_{i=1}^{n} \varepsilon_{i} x_{i}(t): t \in T\right\}$ shares several properties with Gaussian processes. In this chapter we restrict ourselves to two propositions that have been used in Part 2. See, for instance, Ledoux and Talagrand (1991) for a further discussion.

Let $\|x\|$ be the supremum norm $\sup _{t \in T}|x(t)|$ for a given function $x: T \rightarrow \mathbb{R}$. Define

$$
\sigma^{2}=\sup _{t \in T} \operatorname{var} \sum_{i=1}^{n} \varepsilon_{i} x_{i}(t)=\left\|\sum x_{i}^{2}\right\|
$$

The tail probabilities of the norm of a Rademacher process are comparable to those of Gaussian processes. The following inequalities are similar to the Borell inequalities, although it appears likely that the constants can be improved.
A.3.1 Proposition. Let $M$ be a median of the norm of the Rademacher process $\sum_{i=1}^{n} \varepsilon_{i} x_{i}$. Then there exists a universal constant $C$ such that, for every $\lambda>0$,

$$
\begin{array}{r}
\mathrm{P}\left(\left|\left\|\sum \varepsilon_{i} x_{i}\right\|-M\right|>\lambda\right) \leq 4 \exp \left(-\frac{\lambda^{2}}{8 \sigma^{2}}\right) \\
\mathrm{P}\left(\left|\left\|\sum \varepsilon_{i} x_{i}\right\|-\mathrm{E}\left\|\sum \varepsilon_{i} x_{i}\right\|\right|>\lambda\right) \leq C \exp \left(-\frac{\lambda^{2}}{9 \sigma^{2}}\right)
\end{array}
$$

Proof. For the first inequality, see Ledoux and Talagrand (1991), Theorem 4.7, on page 100.

To obtain the second inequality set $\mu=\mathrm{E}\left\|\sum \varepsilon_{i} x_{i}\right\|$. Integrate over the first inequality to obtain $|\mu-M| \leq 4 \sqrt{2 \pi} \sigma$. For $c \lambda>|\mu-M|$, the event in the second inequality is contained in the event $\left\{\left|\left\|\sum \varepsilon_{i} x_{i}\right\|-M\right|>\right. (1-c) \lambda\}$. Choose $c>0$ sufficiently small to bound the probability of this event by $4 \exp \left(-\lambda^{2} / 9 \sigma^{2}\right)$. For $c \lambda \leq|\mu-M|$, the right side in the second inequality is never smaller than $C \exp \left(-(\mu-M)^{2} / 9 c^{2} \sigma^{2}\right)$, which is at least 1 for sufficiently large $C$.
A.3.2 Proposition (Contraction principle). For each $i$, let $x_{i}$ take its values in the interval $[-1,1]$, and let $\phi_{i}:[-1,1] \rightarrow \mathbb{R}$ be Lipschitz of norm 1 with $\phi_{i}(0)=0$. Then

$$
\mathrm{E}\left\|\sum \varepsilon_{i} \phi_{i}\left(x_{i}\right)\right\| \leq 2 \mathrm{E}\left\|\sum \varepsilon_{i} x_{i}\right\| .
$$

Proof. See Ledoux and Talagrand (1991), Theorem 4.12, on page 112.
The last proposition with the choices $\phi_{i}(x)=\frac{1}{2} x^{2}$ is applied in Chapter 2.14.2 to obtain $\mathrm{E}\left\|\sum \varepsilon_{i} x_{i}^{2}\right\| \leq 4 \mathrm{E}\left\|\sum \varepsilon_{i} x_{i}\right\|$.

## A. 4

## Isoperimetric Inequalities for Product Measures

Let ( $\mathcal{X}^{n}, \mathcal{A}^{n}$ ) be the product of $n$ copies of a measurable space ( $\mathcal{X}, \mathcal{A}$ ). Given points $x=\left(x_{1}, \ldots, x_{n}\right)$ and $y=\left(y_{1}, \ldots, y_{n}\right)$, say that $y$ controls a subset of coordinates $\left\{x_{i}: i \in I\right\}$ of $x$ if the corresponding coordinates of $y$ are the same: $y_{i}=x_{i}$ for every $i \in I$. Given vectors $y^{1}, \ldots, y^{q}$, let $f\left(y^{1}, \ldots, y^{q}, x\right)$ be the number of coordinates of $x$ that are not controlled by any $y^{j}$. Given subsets $A_{1}, \ldots, A_{q}$ of $\mathcal{X}^{n}$, define $f\left(A_{1}, \ldots, A_{q}, x\right)$ to be the minimum of the numbers $f\left(y^{1}, \ldots, y^{q}, x\right)$ when the $y^{j}$ range over $A_{j}$. Thus $n-f\left(A_{1}, \ldots, A_{q}, x\right)$ is the maximal number of coordinates of $x$ that can be controlled by the clever choice of $y^{j}$ from $A_{j}$. Also, if $f\left(A_{1}, \ldots, A_{q}, x\right)= k$, then there exist points $y^{j} \in A_{j}$ such that the number of indices $i \in \{1, \ldots, n\}$ such that $x_{i} \notin\left\{y_{i}^{1}, \ldots, y_{i}^{q}\right\}$ is $k$ (and a choice of $y^{j}$ giving more control is impossible).

A basic inequality giving an upper bound on the size of the control functions $f\left(A_{1}, \ldots, A_{q}, x\right)$ is as follows.
A.4.1 Proposition. If the coordinates of $X=\left(X_{1}, \ldots, X_{n}\right)$ are i.i.d. random elements in $\mathcal{X}$, then for any measurable sets $A_{1}, \ldots, A_{q}$ in $\mathcal{A}^{n}$ and any integer $q \geq 1$

$$
\mathrm{E}^{*} q^{f\left(A_{1}, \ldots, A_{q}, X\right)} \leq\left(\prod_{l=1}^{q} \mathrm{P}\left(X \in A_{l}\right)\right)^{-1} .
$$

Consequently, for every set $A \in \mathcal{A}^{n}$ with $\mathrm{P}(X \in A) \geq 1 / 2$

$$
\mathrm{P}^{*}(f(A, \ldots, A, X) \geq k) \leq \frac{2^{q}}{q^{k}} \leq\left(\frac{2}{q}\right)^{k}, \quad k \geq q .
$$

Here $q$ copies of $A$ appear in the left side.

Proof. It will first be shown that, for any random variables $U_{1}, \ldots, U_{q}$ taking values in $[0,1]$,

$$
\mathrm{E}\left(q \wedge \min _{1 \leq l \leq q} U_{l}^{-1}\right) \prod_{l=1}^{q} \mathrm{E} U_{l} \leq 1
$$

Here $1 / 0$ is understood to be infinite. Indeed, the random variable $U$ defined by $U^{-1}=q \wedge \min _{1 \leq l \leq q} U_{l}^{-1}$ satisfies $1 / q \leq U \leq 1$. Since $U_{l} \leq U$ for every $l$, the left side is bounded above by $\mathrm{E} U^{-1}(\mathrm{E} U)^{q}$. Since $\log x \leq x-1$, the logarithm of this expression is bounded by $\mathrm{E} U^{-1}-1+q \mathrm{E} U-q$. This is bounded above by zero, because on the interval $[1 / q, 1]$ the function $z \rightarrow z^{-1}+q z$ attains a maximum value of $1+q$ (at the boundary points).

The proof of the theorem proceeds by induction on $n$. For $n=1$ the control number $f\left(A_{1}, \ldots, A_{q}, X\right)$ equals 0 if $X$ is contained in some $A_{l}$ and 1 otherwise. Thus

$$
q^{f\left(A_{1}, \ldots, A_{q}, X\right)}=q \wedge \min _{1 \leq l \leq q} 1_{A_{l}}(X)^{-1}
$$

The inequality in the first paragraph yields the result.
Suppose the theorem is true for $n$, and consider a vector $X$ and subsets $A_{l}$ in $\mathcal{X}^{n+1}$. Write $Y$ and $Z$ for the first $n$ and the last coordinate of $X=(Y, Z)$, respectively. Furthermore, for a subset $A$ of $\mathcal{A}^{n+1}$, define the sections and projection relative to the first $n$ coordinates by

$$
\begin{aligned}
A(Z) & =\left\{Y \in \mathcal{X}^{n}:(Y, Z) \in A\right\} \\
B & =\left\{Y \in \mathcal{X}^{n}:(Y, Z) \in A, \text { for some } Z\right\}
\end{aligned}
$$

If $y^{1}, \ldots, y^{q}$ control all except $k$ coordinates of $Y$, then $\left(y^{1}, z^{1}\right), \ldots,\left(y^{q}, z^{q}\right)$ control all except at most $k+1$ coordinates of $(Y, Z)$; they control all except $k$ coordinates of $(Y, Z)$ if one $z^{j}$ is chosen equal to $Z$. Therefore, it follows that, for every $l \leq q$,

$$
\begin{aligned}
f\left(A_{1}, \ldots, A_{q}, X\right), & \leq 1+f\left(B_{1}, \ldots, B_{q}, Y\right) \\
f\left(A_{1}, \ldots, A_{q}, X\right) & \leq f\left(B_{1}, \ldots, B_{l-1}, A_{l}(Z), B_{l+1}, \ldots, B_{q}, Y\right) .
\end{aligned}
$$

Write $\mathrm{E}_{Y}$ for the expectation taken with respect to the first $n$ coordinates only and let $P$ be the distribution of $Y$. The first inequality of the display yields

$$
\mathrm{E}_{Y} q^{f\left(A_{1}, \ldots, A_{q}, X\right)} \leq q \mathrm{E}_{Y} q^{f\left(B_{1}, \ldots, B_{q}, Y\right)} \leq q\left(\prod_{l=1}^{q} P\left(B_{l}\right)\right)^{-1}
$$

by the induction hypothesis. Similarly, the second inequality together with the induction hypothesis implies that, for every $1 \leq l \leq q$,

$$
\mathrm{E}_{Y} q^{f\left(A_{1}, \ldots, A_{q}, X\right)} \leq\left(\prod_{j \neq l} P\left(B_{j}\right) P\left(A_{l}(Z)\right)\right)^{-1}
$$

Combine the last two displays to see that their common left side is bounded above by $q \wedge \min _{1 \leq l \leq q} Z_{l}^{-1}$ times $\left(\prod_{l=1}^{q} P\left(B_{l}\right)\right)^{-1}$ for the random variables $Z_{l}=P\left(A_{l}(Z)\right) / P\left(B_{l}\right)$. An application of the inequality in the first paragraph completes the proof.

Actually the preceding proof ignores issues of measurability and is false in general, because maps of the type $X \mapsto f\left(A_{1}, \ldots, A_{q}, X\right)$ need not be measurable, as required for the application of Fubini's theorem.

With some effort it can be seen that this problem does not arise in the case that the sample space is Polish with Borel $\sigma$-field and compact sets $A_{1}, \ldots, A_{q}$. This follows from the identity

$$
\left\{x: n-f\left(A_{1}, \ldots, A_{q}, x\right) \leq k\right\}=\bigcap_{\left|\cup I_{i}\right|>k} \bigcup_{i=1}^{q}\left\{x: \pi_{I_{i}} x \notin \pi_{I_{i}} A_{i}\right\}
$$

where the intersection is taken over all collections of $q$ subsets $I_{1}, \ldots, I_{q}$ of $\{1,2, \ldots, n\}$ and $\pi_{I}$ is the projection $\pi_{I}: \mathcal{X}^{n} \mapsto \mathcal{X}^{I}$ on the $I$ th coordinates. (Note that $\pi_{I} x \in \pi_{I} A$ if and only if there exists $y \in A$ that controls $\left\{x_{i}: i \in I\right\}$.) Projections of compact sets are compact, hence measurable. Thus, in this special situation the proof is correct.

Next, the case of general Borel sets in a Polish (product) space can be obtained by approximation from within by compact sets. By replacing every set $A_{i}$ by a compact $K_{i} \subset A_{i}$, the control numbers increase (there is less control), whence the left side of the theorem increases. Next, apply the theorem and note that the resulting upper bound decreases to the right side of the theorem if the probabilities $P\left(A_{i}-K_{i}\right)$ are made to decrease to zero. The latter is possible by the regularity of Borel measures on Polish spaces.

The case of Polish spaces is sufficient for most applications but can be extended to arbitrary sample spaces. We sketch the extension.

Since any event in $\mathcal{A}^{n}$ is contained in the completion of the product of sub- $\sigma$-fields of $\mathcal{A}$ that are countably generated, it is no loss of generality to assume that $\mathcal{A}$ is countably generated, say with generator the sets $A_{1}, A_{2}, \ldots$. Then the map $\phi: \mathcal{X} \mapsto\{0,1\}^{\infty}$ given by

$$
\phi(x)=\left(1_{A_{1}}(x), 1_{A_{2}}(x), \ldots\right)
$$

is Borel measurable into the Polish space $\{0,1\}^{\infty} \equiv R$ and $\mathcal{A}=\phi^{-1}(\mathcal{B})$ for the Borel sets $\mathcal{B}$. Let $\phi_{n}: \mathcal{X}^{n} \mapsto R^{n}$ be the map $\left(x_{1}, \ldots, x_{n}\right) \mapsto \left(\phi\left(x_{1}\right), \ldots, \phi\left(x_{n}\right)\right)$, and write $P$ for the underlying measure on $\mathcal{X}$.

By construction there exists for every $A \in \mathcal{A}^{n}$ a Borel set $B \in \mathcal{B}^{n}$ with $A=\phi_{n}^{-1}(B)$. Suppose that there exists a Borel set $B^{\prime} \subset B$ of the same measure under $\left(P \circ \phi^{-1}\right)^{n}$ with the property that for every $z^{\prime} \in B^{\prime}$, there exists $z \in B \cap \phi(\mathcal{X})^{n}$ such that $z_{i}=z_{i}^{\prime}$ for all $i$ such that $z_{i}^{\prime} \in \phi(\mathcal{X})$. Thus, the coordinates of $z^{\prime}$ that are not in $\phi(\mathcal{X})$ can be changed, meanwhile leaving the other coordinates the same, so as to obtain a point in $B$ with
all coordinates in $\phi(\mathcal{X})$. A vector in $B$ with all coordinates in $\phi(\mathcal{X})$ is the image of some element in $A$ and it can be seen that

$$
\left\{x: f\left(B_{1}^{\prime}, \ldots, B_{q}^{\prime}, \phi_{n}(x)\right) \leq k\right\} \subset\left\{x: f\left(A_{1}, \ldots, A_{q}, x\right) \leq k\right\} .
$$

Consequently,

$$
\left(P^{n}\right)^{*}\left(f\left(A_{1}, \ldots, A_{q}, x\right)>k\right) \leq\left(\left(P \circ \phi^{-1}\right)^{n}\right)^{*}\left(z: f\left(B_{1}^{\prime}, \ldots, B_{q}^{\prime}, z\right)>k\right) .
$$

Since $\left(P \circ \phi^{-1}\right)^{n}\left(B^{\prime}\right)=P^{n}(A)$, the problem has been reduced to the case of a Polish sample space.

The existence of the sets $B^{\prime}$ can be argued as follows. For every partition $\{1, \ldots, n\}=I \cup J$, define

$$
B_{I, J}=\left\{x \in R^{n}:\left(P \circ \phi^{-1}\right)^{J}\left(B\left(\pi_{I} x\right)\right)=0\right\}
$$

Here $B\left(\pi_{I} x\right)$ is the section of $B$ at $\pi_{I} x$, which is contained in $R^{J}$. By Fubini's theorem, each set $B_{I, J}$ is a $\left(P \circ \phi^{-1}\right)^{n}$ null set. Thus, $B^{\prime}=B- \cup_{I, J} B_{I, J}$ has the same measure as $B$. If $z^{\prime} \in B^{\prime}$, then

$$
\left(P \circ \phi^{-1}\right)^{J}\left(B\left(\pi_{I} z^{\prime}\right)\right)>0 ; \quad\left(\left(P \circ \phi^{-1}\right)^{J}\right)^{*}\left(\phi(\mathcal{X})^{J}\right)=1 .
$$

This means that the set $B\left(\pi_{I} z^{\prime}\right) \cap \phi(\mathcal{X})^{J}$ cannot be empty. If the coordinates $\left\{z_{i}^{\prime}: i \in J\right\}$ are not contained in $\phi(\mathcal{X})$, then they can be changed in the desired manner.

A typical application of the control numbers $f\left(A_{1}, \ldots, A_{q}, X\right)$ is as follows. For natural numbers $n$, let $S_{n}: \mathcal{X}^{n} \rightarrow \mathbb{R}$ be permutation-symmetric functions that satisfy

$$
\begin{align*}
S_{n}(x) & \leq S_{n+m}(x, y), & & \text { for every } x \in \mathcal{X}^{n}, y \in \mathcal{X}^{m}  \tag{A.4.2}\\
S_{n+m}(x, y) & \leq S_{n}(x)+S_{m}(y), & & \text { for every } x \in \mathcal{X}^{n}, y \in \mathcal{X}^{m} .
\end{align*}
$$

An example is the functions $S_{n}=\mathrm{E}_{\varepsilon}\left\|\sum_{i=1}^{n} \varepsilon_{i} f\left(x_{i}\right)\right\|_{\mathcal{F}}$ for Rademacher random variables $\varepsilon_{i}$. Given sets $A_{1}, \ldots, A_{q}$ in $\mathcal{X}^{n}$, the elements of a random sample $X_{1}, \ldots X_{n}$ in $\mathcal{X}$ can be split into $q+1$ sets, the first one consisting of the $k=f\left(A_{1}, \ldots, A_{q}, X\right)$ variables not controlled by the sets $A_{l}$ and the other $q$ sets consisting of variables that also occur in some $Y^{l} \in A_{l}$ for $l=1, \ldots, q$. By the "triangle inequality" in (A.4.2), the number $S_{n}\left(X_{1}, \ldots, X_{n}\right)$ can be bounded by the sum of $q+1$ terms. By the first inequality in (A.4.2), the last $q$ terms can be bounded by $S_{n}\left(Y^{l}\right)$ for $l=1, \ldots, q$. It follows that on the set $f\left(A_{1}, \ldots, A_{q}, X\right)=k$,

$$
S_{n}(X) \leq \sup _{x \in \mathcal{X}^{k}} S_{k}(x)+\sum_{l=1}^{q} \sup _{y \in A_{l}} S_{n}(y) .
$$

The first term on the right should be small if $k$ is small, while the size of the second term can be influenced by the choice of the control sets $A_{l}$. ${ }^{\sharp}$

[^5]A.4.3 Lemma. Let $S_{n}: \mathcal{X}^{n} \rightarrow[0, n]$ be permutation-symmetric functions satisfying (A.4.2). Then, for every $t>0$ and $n$,
$$
\mathrm{P}^{*}\left(S_{n} \geq t\right) \leq \exp \left(-\frac{1}{2} t \log \frac{t}{12\left(\mathrm{E}^{*} S_{n} \vee 1\right)}\right)
$$

This is true for any $S_{n}=S_{n}(X)$ and any vector $X=\left(X_{1}, \ldots, X_{n}\right)$ with i.i.d. coordinates.

Proof. Set $\mu=\mathrm{E}^{*} S_{n}$. By Markov's inequality, the set $A=\left\{S_{n} \leq 2 \mu\right\}_{*}$ has probability at least $\frac{1}{2}$. Since $S_{n} \leq n$ by assumption, the argument preceding the lemma shows that $S_{n}(X) \leq f(A, \ldots, A, X)+q 2 \mu$ for any integer $q \geq 1$. Thus, the probability in the lemma is bounded by

$$
\mathrm{P}^{*}(f(A, \ldots, A, X) \geq t-2 q \mu) \leq \frac{2^{q}}{q^{t-2 q \mu}} \leq e^{q \log q(2 \mu+1)-t \log q}
$$

for $q \geq 2$ by Theorem A.4.1. For $t \geq 12(\mu \vee 1)$ and $q=\lfloor t / 6(\mu \vee 1)\rfloor$, the exponent is bounded above by $-\frac{1}{2} t \log \lfloor t / 6(\mu \vee 1)\rfloor$. The lemma follows since $\lfloor x\rfloor \geq \frac{1}{2} x$ for $x \geq 1$. For $t \leq 12(\mu \vee 1)$ the lemma is trivially true, because the right side is larger than 1 .

## A. 5

## Some Limit Theorems

In this chapter we present the strong law of large numbers and the central limit theorem uniformly in the underlying measure, as well as the rank central limit theorem.

Let $\bar{X}_{n}$ be the average of the first $n$ variables from a sequence $X_{1}, X_{2}, \ldots$ of independent and identically distributed random vectors in $\mathbb{R}^{d}$. Let $\mathcal{P}$ be a class of underlying probability measures. For instance, let $X_{i}$ be the $i$ th coordinate projection of $\left(\mathbb{R}^{d}\right)^{\infty}$, and let $\mathcal{P}$ consist of Borel probability measures on $\mathbb{R}^{d}$.
A.5.1 Proposition. Let $X_{1}, X_{2}, \ldots$ be i.i.d. random vectors with distribution $P \in \mathcal{P}$ such that

$$
\lim _{M \rightarrow \infty} \sup _{P \in \mathcal{P}} \mathrm{E}_{P}\left|X_{1}\right|\left\{\left|X_{1}\right| \geq M\right\}=0
$$

Then the strong law of large numbers holds uniformly in $P \in \mathcal{P}$ in the sense that, for every $\varepsilon>0$,

$$
\lim _{n \rightarrow \infty} \sup _{P \in \mathcal{P}} \mathrm{P}_{P}\left(\sup _{m \geq n}\left|\bar{X}_{m}-\mathrm{E}_{P} X_{1}\right| \geq \varepsilon\right)=0
$$

Proof. See Chung (1951).
The Prohorov distance $\pi$ between probability laws on $\mathbb{R}^{d}$ dominates twice the bounded Lipschitz distance and generates the weak topology. The following theorem gives an explicit upper bound on the Prohorov distance between the distribution of $\sqrt{n} \bar{X}_{n}$ and the limiting normal distribution.

This can easily be converted into a central limit theorem uniformly in $P$ ranging over $\mathcal{P}$. Write $\pi(X, Y)$ for the Prohorov distance between the distributions of random vectors $X$ and $Y$.
A.5.2 Proposition. Let $X_{1}, \ldots, X_{n}$ be i.i.d. random vectors with mean zero and finite covariance matrix $\Sigma$. Then for every $\varepsilon>0$,

$$
\begin{aligned}
\pi\left(\sqrt{n} \bar{X}_{n}, N(0, \Sigma)\right) \leq 2 & \varepsilon^{-2} g(\varepsilon \sqrt{n}) \vee \varepsilon+4^{1 / 3} g(\varepsilon \sqrt{n})^{1 / 3} \\
& +C(d \varepsilon g(0))^{1 / 4}\left(1+\left|\log \frac{\varepsilon g(0)}{d}\right|^{1 / 2}\right)
\end{aligned}
$$

Here $C$ is an absolute constant and $g(\varepsilon)=\mathrm{E}\|X\|^{2}\{\|X\| \geq \varepsilon\}$.
Proof. For a given $\varepsilon \in(0,1)$ and $1 \leq i \leq n$, let $Y_{i}$ be the truncated variable $X_{i} 1\left\{\left|X_{i}\right| \leq \varepsilon \sqrt{n}\right\}$ and $Z_{i}$ the centered variable $Y_{i}-\mathrm{E} Y_{i}$. By Strassen's theorem, it follows that

$$
\pi\left(\sqrt{n} \bar{X}_{n}, \sqrt{n} \bar{Y}_{n}\right) \vee \pi\left(\sqrt{n} \bar{Y}_{n}, \sqrt{n} \bar{Z}_{n}\right) \leq\left(\varepsilon^{-2} \vee \varepsilon^{-1}\right) \mathrm{E}\|X\|^{2}\{\|X\| \geq \varepsilon \sqrt{n}\} \vee \varepsilon .
$$

Furthermore, $\mathrm{E}\left\|Z_{i}\right\|^{3} \leq 8 E\left\|Y_{i}\right\|^{3} \leq 8 \varepsilon \sqrt{n} \mathrm{E}\left\|X_{i}\right\|^{2}$. Thus, by Theorem 1 of Yurinskii (1977), as corrected in Theorem B on page 395 of Dehling (1983),

$$
\pi\left(\sqrt{n} \bar{Z}_{n}, N\left(0, \Sigma_{Z}\right)\right) \lesssim(d \varepsilon g(0))^{1 / 4}\left(1+\left|\log \frac{8 \varepsilon g(0)}{d}\right|^{1 / 2}\right)
$$

where $\Sigma_{Z}$ is the covariance matrix of $Z_{1}$. Finally,

$$
\pi\left(N\left(0, \Sigma_{Z}\right), N(0, \Sigma)\right)^{3} \leq 4 \mathrm{E}\|X\|^{2}\{\|X\| \geq \varepsilon \sqrt{n}\}
$$

by Lemma 2.1, page 402, of Dehling (1983).

For each $n$, let $a_{n 1}, \ldots, a_{n n}$ and $b_{n 1}, \ldots, b_{n n}$ be real numbers, and let $\left(R_{n 1}, \ldots, R_{n n}\right)$ be a random vector that is uniformly distributed on the $n!$ permutations of $\{1, \ldots, n\}$. Consider the rank statistic

$$
S_{n}=\sum_{i=1}^{n} b_{n i} a_{n, R_{n i}}
$$

The mean and variance of $S_{n}$ are equal to $E S_{n}=n \bar{a}_{n} \bar{b}_{n}$ and var $S_{n}= A_{n}^{2} B_{n}^{2} /(n-1)$, where $A_{n}^{2}$ and $B_{n}^{2}$ are the sums of squared deviations from the mean of the numbers $a_{n 1}, \ldots, a_{n n}$ and $b_{n 1}, \ldots, b_{n n}$, respectively. Thus $A_{n}^{2}=\sum_{i=1}^{n}\left(a_{n i}-\bar{a}_{n}\right)^{2}$.

## A.5.3 Proposition (Rank central limit theorem). Suppose that

$$
\max _{1 \leq i \leq n} \frac{\left|a_{n i}-\bar{a}_{n}\right|}{A_{n}} \rightarrow 0 ; \quad \max _{1 \leq i \leq n} \frac{\left|b_{n i}-\bar{b}_{n}\right|}{B_{n}} \rightarrow 0 .
$$

Then the sequence $\left(S_{n}-\mathrm{E} S_{n}\right) / \sigma\left(S_{n}\right)$ converges in distribution to a standard normal distribution if and only if

$$
\sum_{(i, j): \sqrt{n}\left|a_{n i}-\bar{a}_{n}\right|\left|b_{n j}-\bar{b}_{n}\right|>\varepsilon A_{n} B_{n}} \frac{\left|a_{n i}-\bar{a}_{n}\right|^{2}\left|b_{n j}-\bar{b}_{n}\right|^{2}}{A_{n}^{2} B_{n}^{2}} \rightarrow 0, \text { for every } \varepsilon>0 .
$$

Proof. See Hájek (1961).

## A. 6

## More Inequalities

This chapter collects well-known and less-known inequalities for binomial, multinomial, and Rademacher random variables. Some of the results are related to the inequalities obtained by other means in Chapters 2.2 and 2.14.

## A.6.1 Binomial Random Variables

Throughout this subsection $\bar{Y}_{n}$ is the average of independent Bernoulli variables $Y_{1}, \ldots, Y_{n}$ with success probability $p$.

One of the simplest inequalities for the tails of sums of bounded random variables - in particular, for the binomial distribution- is that of Hoeffding (1963).
A.6.1 Proposition (Hoeffding's inequality). Let $X_{1}, \ldots, X_{n}$ be independent random variables taking values in $[0,1]$. Let $\mu=\mathrm{E} \bar{X}_{n}$. Then for $0<t<1-\mu$,

$$
\begin{aligned}
\mathrm{P}\left(\bar{X}_{n}-\mu \geq t\right) & \leq\left(\left(\frac{\mu}{\mu+t}\right)^{\mu+t}\left(\frac{1-\mu}{1-\mu-t}\right)^{1-\mu-t}\right)^{n} \\
& \leq \exp -n t^{2} g(\mu) \\
& \leq \exp -2 n t^{2}
\end{aligned}
$$

Here $g(\mu)$ is equal to $(1-2 \mu)^{-1} \log (1 / \mu-1)$, for $0<\mu<1 / 2$, and $(2 \mu(1- \mu))^{-1}$, for $1 / 2 \leq \mu<1$.

Proof. See Hoeffding (1963).

Applied to Bernoulli variables, Hoeffding's inequality yields

$$
\mathrm{P}\left(\sqrt{n}\left|\bar{Y}_{n}-p\right| \geq \lambda\right) \leq 2 \exp -2 \lambda^{2}, \quad \lambda>0 .
$$

This inequality is valid for any $n$ and $p$. For $p$ close to zero or one, it is possible to improve on the factor 2 in the exponent considerably.
A.6.2 Proposition (Bennett's inequality). For all $n$ and $0<p<1$,

$$
\mathrm{P}\left(\sqrt{n}\left|\bar{Y}_{n}-p\right| \geq \lambda\right) \leq 2 \exp -\frac{\lambda^{2}}{2 p} \psi\left(\frac{\lambda}{\sqrt{n} p}\right), \quad \lambda>0 .
$$

Here $\psi(x)=2 h(1+x) / x^{2}$, for $h(x)=x(\log x-1)+1$.
Proof. See Bennett (1962), Hoeffding (1963), or Shorack and Wellner (1986), page 440.
A.6.3 Corollary (Kiefer's inequality). For all $n$ and $0<p<e^{-1}$,

$$
\mathrm{P}\left(\sqrt{n}\left|\bar{Y}_{n}-p\right| \geq \lambda\right) \leq 2 \exp -\lambda^{2}(\log (1 / p)-1)
$$

Proof. Since the probability on the left side is zero if $\lambda>\sqrt{n}$, we may assume that $\lambda \leq \sqrt{n}$. Then $\psi(\lambda / \sqrt{n} p) \geq \psi(1 / p)$, because $\psi$ is decreasing. Now apply Bennett's inequality and finish the proof by noting that $\psi(1 / p) /(2 p) \geq \log (1 / p)-1$ for $0<p<e^{-1}$.

For $p \downarrow 0$, the function $\log (1 / p)-1$ increases to infinity. Thus Kiefer's inequality gives bounds of the type $2 \exp -C \lambda^{2}$ for large constants $C$ for sufficiently small $p$. For example, $2 \exp -11 \lambda^{2}$ for $p \leq e^{-12}$.

For $p$ bounded away from zero and one, Hoeffding's inequality can be improved as well-at least for large values of $\lambda$.
A.6.4 Proposition (Talagrand's inequality). There exist constants $K_{1}$ and $K_{2}$ depending only on $p_{0}$, such that for $p_{0} \leq p \leq 1-p_{0}$ and all $n$,

$$
\begin{aligned}
& \mathrm{P}\left(\sqrt{n}\left(\bar{Y}_{n}-p\right)=\lambda\right) \leq \frac{K_{1}}{\sqrt{n}} \exp -\left(2 \lambda^{2}+\frac{\lambda^{4}}{4 n}\right), \quad \lambda>0, \\
& \mathrm{P}\left(\sqrt{n}\left(\bar{Y}_{n}-p\right) \geq t\right) \leq \frac{K_{2}}{\lambda} \exp -\left(2 \lambda^{2}+\frac{\lambda^{4}}{4 n}\right) \exp 5 \lambda(\lambda-t), \quad 0<t<\lambda, \\
& \mathrm{P}\left(\sqrt{n}\left(\bar{Y}_{n}-p\right) \geq \lambda\right) \leq \frac{K_{2}}{\lambda} \exp -\left(2 \lambda^{2}+\frac{\lambda^{4}}{4 n}\right), \quad \lambda>0 .
\end{aligned}
$$

Proof. Stirling's formula with bounds asserts that

$$
\sqrt{2 \pi n}\left(\frac{n}{e}\right)^{n} e^{1 /(12 n+1)} \leq n!\leq \sqrt{2 \pi n}\left(\frac{n}{e}\right)^{n} e^{1 /(12 n)} .
$$

Hence it follows, that for $1 \leq k \leq n-1$,

$$
\begin{equation*}
\binom{n}{k} p^{k}(1-p)^{n-k} \leq \frac{1}{\sqrt{2 \pi}}\left(\frac{n}{k(n-k)}\right)^{1 / 2} e^{-n \Psi(u, p)} \tag{A.6.5}
\end{equation*}
$$

Here set $u=k / n-p$ and define

$$
\Psi(u, p)=(u+p) \log \left(\frac{u+p}{p}\right)+(1-(u+p)) \log \left(\frac{1-(u+p)}{1-p}\right)
$$

The function $\Psi$ satisfies $\Psi(0, p)=0, \partial / \partial u \Psi(0, p)=0$, and

$$
\frac{\partial^{2}}{\partial u^{2}} \Psi(u, p)=\frac{4}{1-4\left(u-\left(\frac{1}{2}-p\right)\right)^{2}} \geq 4\left(1+4\left(u-\left(\frac{1}{2}-p\right)\right)^{2}\right)
$$

Integrate this inequality to obtain

$$
\frac{\partial}{\partial u} \Psi(u, p) \geq 4 u+\frac{16}{3}\left(\left(u-\left(\frac{1}{2}-p\right)\right)^{3}+\left(\frac{1}{2}-p\right)^{3}\right) \geq 4 u+\frac{4}{3} u^{3}
$$

In the last step, use the fact that the function $\beta \mapsto(u-\beta)^{3}+\beta^{3}$ takes its minimal value at $\beta=u / 2$. Integrate again to obtain the inequality $\Psi(u, p) \geq 2 u^{2}+u^{4} / 3$.

For the proof of the first part of the proposition, put $k=\sqrt{n} \lambda+n p$. Then $k \geq n p_{0}$. Furthermore, for $k \leq n\left(1-p_{0} / 2\right)$, we have $n-k \geq n p_{0} / 2$, and the right-hand side of (A.6.5) is bounded above by

$$
\frac{1}{\sqrt{2 \pi}} \frac{1}{\sqrt{n p_{0}^{2} / 2}} e^{-n\left(2 u^{2}+u^{4} / 3\right)}
$$

For $n\left(1-p_{0} / 2\right) \leq k<n$, we have $u=k / n-p \geq p_{0} / 2$, and the right-hand side of (A.6.5) is bounded by

$$
\frac{1}{\sqrt{2 \pi\left(1-p_{0} / 2\right)}} e^{-n\left(2 u^{2}+u^{4} / 3\right)} \leq \frac{K}{\sqrt{n}} e^{-n\left(2 u^{2}+u^{4} / 4\right)} \sup _{n \geq 1} \sqrt{n} e^{-n\left(p_{0} / 2\right)^{4} / 12} .
$$

Finally, for $k=n$, the inequality of the proposition can be reduced to

$$
-\log (1 / p)+2(1-p)^{2}+\frac{1}{4}(1-p)^{4} \leq \frac{1}{n} \log \left(\frac{K_{1}}{\sqrt{n}}\right)
$$

The function $h(p)$ on the left side of this last inequality is negative for $0<p<1$, with $h(0)=-\infty$ and $h(1)=0$, and has a local maximum of $-0.160144 \ldots$ at $0.344214 \ldots$ and a local minimum of $-0.184428 \ldots$ at $0.598428 \ldots$. It follows that the supremum of the left side over any interval $p_{0} \leq p \leq 1-p_{0}$ is strictly less than zero. On the other hand, the infimum of the right side over $n$ is bounded below by $-1 /\left(2 e K_{1}^{2}\right)$. Thus, the inequality is valid for sufficiently large $K_{1}$.

For the proof of the second part of the proposition, consider the function $h(x)=2 x^{2}+x^{4} / 4$. The derivative $h^{\prime}(x)=4 x+x^{3}$ is bounded below by $4 x$ and is bounded above by $5 x$ for $x \leq 1$. Since $h$ is convex,
$h(x) \geq h(u)+(x-u) h^{\prime}(u)$ for all $x$. Apply the first inequality of the proposition to find that, with $k_{0}=\lceil n p+\sqrt{n} t\rceil$,

$$
\begin{aligned}
\mathrm{P}\left(\sqrt{n}\left(\bar{Y}_{n}-p\right) \geq t\right) & \leq \sum_{k \geq k_{0}} \frac{K_{1}}{\sqrt{n}} e^{-n\left(h(u)+(k / n-p-u) h^{\prime}(u)\right)} \\
& =\frac{K_{1}}{\sqrt{n}} e^{-n h(u)} \sum_{k \geq k_{0}} e^{(n u-(k-n p)) h^{\prime}(u)} \\
& \leq \frac{K_{1}}{\sqrt{n}} e^{-n h(u)} \frac{e^{\left(n u-\left(k_{0}-n p\right)\right) h^{\prime}(u)}}{1-e^{-h^{\prime}(u)}} \\
& \leq \frac{K_{1}}{\sqrt{n}} e^{-n h(u)} \frac{1}{4 u} e^{5 n u(u-t)} .
\end{aligned}
$$

This concludes the proof of the proposition.

## A.6.2 Multinomial Random Vectors

In this section $\left(N_{1}, \ldots, N_{k}\right)$ is a multinomially distributed vector with parameters $n$ and $\left(p_{1}, \ldots, p_{k}\right)$. It is helpful to relate this to empirical processes. Let $\left\{C_{i}\right\}_{i=1}^{k}$ be a partition of a set $\mathcal{X}$ and $P$ the probability measure on the $\sigma$-field $\mathcal{C}$ generated by the partition such that $P\left(C_{i}\right)=p_{i}$. If $\mathbb{P}_{n}$ is the empirical measure corresponding to a sample of size $n$ from $P$, then the vector $\left(n \mathbb{P}_{n}\left(C_{1}\right), \ldots, n \mathbb{P}_{n}\left(C_{k}\right)\right)$ has the same distribution as $\left(N_{1}, \ldots, N_{k}\right)$.

The first two propositions concern the " $L_{1}$-" or "total variation distance" $\sum_{i=1}^{k}\left|N_{i}-n p_{i}\right|$. In the representation using the empirical process, this is equivalent to the Kolmogorov-Smirnov distance

$$
\left\|\mathbb{P}_{n}-P\right\|_{\mathcal{C}}=\sup _{C \in \mathcal{C}}\left(\mathbb{P}_{n}-P\right)(C)=\frac{1}{2} \sum_{i=1}^{k}\left|\mathbb{P}_{n}\left(C_{i}\right)-P\left(C_{i}\right)\right| .
$$

A.6.6 Proposition (Bretagnolle-Huber-Carol inequality). If the random vector $\left(N_{1}, \ldots, N_{k}\right)$ is multinomially distributed with parameters $n$ and $\left(p_{1}, \ldots, p_{k}\right)$, then

$$
\mathrm{P}\left(\sum_{i=1}^{k}\left|N_{i}-n p_{i}\right| \geq 2 \sqrt{n} \lambda\right) \leq 2^{k} \exp -2 \lambda^{2}, \quad \lambda>0
$$

Proof. In terms of the Kolmogorov-Smirnov statistic, the left side is equal to $\mathrm{P}\left(\left\|\mathbb{G}_{n}\right\|_{\mathcal{C}} \geq \lambda\right)$ Each of the probabilities $\mathrm{P}\left(\left(\mathbb{P}_{n}-P\right)(C)>\lambda\right)$ can be bounded by $\exp \left(-2 \lambda^{2}\right)$ by a one-sided version of Hoeffding's inequality. There are $2^{k}$ sets in $\mathcal{C}$. Alternatively, first reduce $\mathcal{C}$ by dropping all sets with probability more than $1 / 2$. This does not change $\left\|\mathbb{P}_{n}-P\right\|_{\mathcal{C}}$. Now the two-sided version of Hoeffding's inequality can be applied to the $2^{k-1}$ remaining sets.

The following inequality results from combining Kiefer's inequality, Corollary A.6.3, and Talagrand's inequality, Proposition A.6.4.
A.6.7 Proposition. If the random vector ( $N_{1}, \ldots, N_{k}$ ) is multinomially distributed with parameters $n$ and $\left(p_{1}, \ldots, p_{k}\right)$, then there is a universal constant $K$ such that

$$
\mathrm{P}\left(\sum_{i=1}^{k}\left|N_{i}-n p_{i}\right| \geq 2 \sqrt{n} \lambda\right) \leq \frac{K}{\lambda} 2^{k} \exp -2 \lambda^{2}, \quad \lambda>0 .
$$

Proof. The proof is slightly easier in the language of empirical processes as introduced above. Let $\mathcal{C}_{0}$ be the class of sets $C \in \mathcal{C}$ such that $P(C)<e^{-12}$, and let $\mathcal{C}_{1}$ be the class of sets with $e^{-12} \leq P(C) \leq 1 / 2$. Then $\left\|\mathbb{G}_{n}\right\|_{\mathcal{C}}=\left\|\mathbb{G}_{n}\right\|_{\mathcal{C}_{0}} \vee\left\|\mathbb{G}_{n}\right\|_{\mathcal{C}_{1}}$. By the remark following Kiefer's inequality, Corollary A.6.3, applied to $\left\|\mathbb{G}_{n}\right\|_{\mathcal{C}_{0}}$ and Talagrand's inequality, Proposition A.6.4, applied to $\left\|\mathbb{G}_{n}\right\|_{\mathcal{C}_{1}}$, there exists a universal constant $K_{2}$ such that

$$
\mathrm{P}\left(\left\|\mathbb{G}_{n}\right\|_{\mathcal{C}} \geq \lambda\right) \leq 2^{k} 2 \exp -11 \lambda^{2}+2^{k} \frac{K_{2}}{\lambda} \exp -2 \lambda^{2} .
$$

The proposition follows easily.
The last inequality for multinomial random vectors concerns a slight modification of the classical chi-square statistic (or weighted $L_{2}$-distance).
A.6.8 Proposition (Mason and van Zwet inequality). Let the random vector $\left(N_{1}, \ldots, N_{k}\right)$ be multinomially distributed with parameters $n$ and $\left(p_{1}, \ldots, p_{k}\right)$ such that $p_{i}>0$ for $i<k$. Then for every $C>0$ and $\delta>0$ there exist constants $a, b, c>0$, such that for all $n \geq 1$ and $\lambda, p_{1}, \ldots, p_{k-1}$ satisfying $\lambda \leq C n \min \left\{p_{i}: 1 \leq i \leq k-1\right\}$ and $\sum_{i=1}^{k-1} p_{i} \leq 1-\delta$, we have

$$
\mathrm{P}\left(\sum_{i=1}^{k-1} \frac{\left(N_{i}-n p_{i}\right)^{2}}{n p_{i}}>\lambda\right) \leq a \exp (b k-c \lambda) .
$$

We do not give a full derivation of this inequality here, but note that the chi-square statistic is an example of a supremum over an elliptical class of functions. Therefore, the preceding inequality can be deduced from Talagrand's general empirical process inequality, Theorem 2.14.24.

## A.6.3 Rademacher Sums

The following inequality improves Hoeffding's inequality for Rademacher sums, Lemma 2.2.7, in much the same way that Talagrand's inequality improves on Hoeffding's inequality. Let $\varepsilon_{1}, \ldots, \varepsilon_{n}$ denote independent Rademacher variables.
A.6.9 Proposition (Pinelis' inequality). For any numbers $a_{1}, \ldots, a_{n}$ with $\sum_{i=1}^{n} a_{i}^{2}=1$,

$$
\mathrm{P}\left(\left|\sum_{i=1}^{n} a_{i} \varepsilon_{i}\right| \geq \lambda\right) \leq \frac{4 e^{3}}{9}(1-\Phi(\lambda)) \leq \frac{4 e^{3}}{9 \lambda} \phi(\lambda), \quad \lambda>0
$$

A.6.10 Proposition (Khinchine's inequality). For any real numbers $a_{1}, \ldots, a_{n}$ and any $p \geq 1$, there exist constants $A_{p}$ and $B_{p}$ such that

$$
A_{p}\|a\|_{2} \leq\left\|\sum_{i=1}^{n} a_{i} \varepsilon_{i}\right\|_{p} \leq B_{p}\|a\|_{2}
$$

## Problems and Complements

1. The function $g(p)=\psi(1 / p) /(2 p)$ is bounded below by $\log (1 / p)-1$ for $0< p<e^{-1}$. It is not bounded below by $\log (1 / p)-c$ for any $c<1$.
[Hint: $\psi(1 / p) /(2 p)-(\log (1 / p)-1) \rightarrow 0$ as $p \rightarrow 0$.]
2. (Bennett's inequality plus Jensen equals Bernstein's inequality) Show that the function $\psi$ in Proposition A.6.2 is decreasing, $\psi(0)=1, x \psi(x)$ is increasing, and $\psi(x) \geq 1 /(1+x / 3)$.
[Hint: Let $f(x)=h(1+x)=(x+1) \log (x+1)-x$, and write

$$
f(x)=\int_{0}^{1} x f^{\prime}(x t) d t=\int_{0}^{1} x^{2} \int_{0}^{1} 1\{0 \leq s \leq t \leq 1\} f^{\prime \prime}(x s) d s d t
$$

where $f^{\prime}(x)=\log (1+x)$ and $f^{\prime \prime}(x)=1 /(1+x)$. Hence

$$
\psi(x)=2 \int_{0}^{1} \int_{0}^{1} 1\{0 \leq s \leq t \leq 1\} f^{\prime \prime}(x s) d s d t
$$

To prove the last inequality, interpret the right side of this identity as an expectation.]
3. The probability in Kiefer's inequality is bounded below by $\exp \left[-\lambda^{2}(1-\right. \left.p)^{-2} \log (1 / p)\right]$ when $\lambda=\sqrt{n}(1-p)$.
4. The constant $K$ resulting from the proof of Proposition A.6.7 may be minimized by choosing an optimal cut-off point instead of $e^{-12}$. This involves understanding the dependence of the constant $K_{2}$ in Proposition A.6.4 on $p_{0}$.
5. Independent binomial $\left(1, p_{i}\right)$ variables $X_{1}, \ldots, X_{n}$ satisfy

$$
\mathrm{P}\left(\sum_{i=1}^{n} X_{i}>k\right) \leq \exp \left(-n \bar{p}_{n} h\left(\frac{k}{n \bar{p}_{n}}\right)\right)<\left(\frac{e n \bar{p}_{n}}{k}\right)^{k}
$$

for the function $h(x)=x(\log x-1)+1$ and $\bar{p}_{n}$ the average of the success probabilities.

## A <br> Notes

A.1. Ottaviani (1939) proves his inequality for the case of real-valued random variables. Hoffmann-Jørgensen (1974) proves his inequalities for Banach-valued random variables. For both cases Dudley (1984) gives careful proofs for random elements in nonseparable Banach spaces.

Proposition A.1.6 is due to Talagrand (1989).
A.2. The first inequality of Proposition A.2.1 is a consequence of finer isoperimetric results obtained independently by Borell (1975) and Sudakov and Tsirel'son (1978). The second inequality was found by Ibragimov, Sudakov, and Tsirel'son (1976) and rediscovered by Maurey and Pisier (see Pisier (1986)). The present proof is based on the exposition by Ledoux (1995). See Ledoux and Talagrand (1991), page 59, for the third inequality of Proposition A.2.1 as well as other interesting results.

The moment inequality Proposition A.2.4 is given by Pisier (1986).
Adler (1990) gives a good summary of many of the Gaussian comparison results, including Sudakov's minorization inequality, Dudley's majorization inequality, and the more recent work on majorizing measures. The inequalities of Proposition A.2.6 are due to Fernique after earlier work by Slepian (1962), Marcus and Shepp (1971) and Landau and Shepp (1970). The last assertion of Proposition A.2.6 was noted by Marcus and Shepp and is stated explicitly in Jain and Marcus (1978).

The section on exponential bounds for Gaussian processes is based mostly on Talagrand (1994). The interested reader should also consult Samorodnitsky (1991), Adler and Samorodnitsky (1987), Adler (1990), and

Goodman (1976). The renewal theoretic large deviation methods of Hogan and Siegmund (1986), Siegmund (1988, 1992) give precise results on the asymptotic tail behavior for the suprema of particular Gaussian fields, especially those satisfying what Aldous (1989) calls the "uncorrelated orthogonal increments" property. See Aldous (1989), Chapter J, pages 190-219 for a variety of fascinating asymptotic formulas. Computation of the asymptotic behavior in Example A.2.12 was carried out by David Siegmund (personal communication).

The section on majorizing measures records work by Preston (1972), Fernique (1974), and Talagrand (1987c). The sufficiency of the existence of a (continuous) majorizing measure for the boundedness (and continuity) of a process was established by Fernique (1974) following preliminary results of Preston (1972). The necessity was proved for stationary Gaussian processes by Fernique (1974) and for general Gaussian processes by Talagrand (1987c). A relatively simple proof is given by Talagrand (1992). Lemma A.2.19 is adapted from Talagrand (1987c) and Ledoux and Talagrand (1991), who formulate similar results in terms of ultrametrics. For complete expositions of majorizing measures, see Adler (1990), pages 80ff., and Ledoux and Talagrand (1991), Chapters 11 and 12.
A.4. The basic inequality in this chapter was first proved by Talagrand (1989) and Ledoux and Talagrand (1991). The present elegant proof by induction is taken from Talagrand (1995), who discusses many extensions and applications. The name "isoperimetric inequality" appears not entirely appropriate. It resulted from the analogy with exponential inequalities for Gaussian variables, which can be derived from isoperimetric inequalities for the standard normal distribution. This asserts that, among all sets $A$ with $\mathrm{P}(A)$ equal to a fixed number, the probability $\mathrm{P}\left(A^{\varepsilon}\right)$ increases the least as $\varepsilon$ increases from zero for $A$ of the form $\{x:|x|>c\}$. See Ledoux and Talagrand (1991) and Ledoux (1995) for further references.
A.5. In connection to Proposition A.5.2, consult the papers by Yurinskii (1977) and Dehling (1983).
A.6. Bennett's inequality was proved by Bennett (1962); the function $\psi$ was introduced by Shorack (1980). For Kiefer's inequality, see Kiefer (1961); the present proof from Bennett's inequality is new. For Talagrand's inequality, see Talagrand (1994), and for the $L_{1}$-inequality for multinomial variables, see Bretagnolle and Huber (1978). Mason and Van Zwet (1987) prove inequality A.6.8 and use it to obtain an interesting refinement of the Komlos-Major-Tusnady inequality. Proposition A.6.9 is due to Pinelis (1994); it improves on conjectures of Eaton (1974). Problem A.6.2 was communicated to us by David Pollard.

## References

Adler, R. J. (1990). An introduction to continuity, extrema, and related topics for general Gaussian processes. IMS Lecture Notes-Monograph Series 12. Institute of Mathematical Statistics, Hayward, CA.

Adler, R. J. and Brown, L. D. (1986). Tail behaviour for suprema of empirical processes. Annals of Probability 14, 1-30.

Adler, R. J. and Samorodnitsky, G. (1987). Tail behavior for the suprema of Gaussian processes with applications to empirical processes. Annals of Probability 15, 1339-1351.

Aldous, D. (1989). Probability Approximations via the Poisson Clumping Heuristic. Springer-Verlag, New York.

Alexander, K. S. (1984). Probability inequalities for empirical processes and a law of the iterated logarithm. Annals of Probability 12, 1041-1067. (Correction: Annals of Probability 15, 428-430.)

Alexander, K. S. (1985). The non-existence of a universal multiplier moment for the central limit theorem. Lecture Notes in Mathematics 1153, 15-16, (eds., A. Beck, R. Dudley, M. Hahn, J. Kuelbs, and M. Marcus). Springer-Verlag, New York.

Alexander, K. S. (1987a). The central limit theorem for weighted empirical processes indexed by sets. Journal of Multivariate Analysis 22, 313-339.

Alexander, K. S. (1987b). Central limit theorems for stochastic processes under random entropy conditions. Probability Theory and Related Fields 75, 351-378.
Alexander, K. S. (1987c). The central limit theorem for empirical processes on Vapnik-Cĕrvonenkis classes. Annals of Probability 15, 178-203.
Alexander, K. S. (1987d). Rates of growth and sample moduli for weighted empirical processes indexed by sets. Probability Theory and Related Fields 75, 379-423.
Alexander, K. S. and Pyke, R. (1986). A uniform central limit theorem for set-indexed partial-sum processes with finite variance. Annals of Probability 14, 582-597.
Andersen, N. T. (1985). The central limit theorem for non-separable valued functions. Zeitschrift für Wahrscheinlichkeitstheorie und Verwandte Gebiete 70, 445-455.
Andersen, N. T. and Dobrić, V. (1987). The central limit theorem for stochastic processes. Annals of Probability 15, 164-177.
Andersen, N. T. and Dobrić, V. (1988). The central limit theorem for stochastic processes II. Journal of Theoretical Probability 1, 287-303.
Andersen, N. T., Giné, E., Ossiander, M., and Zinn, J. (1988). The central limit theorem and the law of iterated logarithm for empirical processes under local conditions. Probability Theory and Related Fields 77, 271-305.
Anderson, T. W. (1963). Asymptotic theory for principal component analysis. Annals of Mathematical Statistics 34, 122-148.
Araujo, A. and Giné, E. (1980). The Central Limit Theorem for Real and Banach Valued Random Variables. John Wiley, New York.
Arcones, M. and Giné, E. (1992). Bootstrap of $M$ estimators and related statistical functionals. Exploring the Limits of Bootstrap, 14-47, (eds., R. LePage and L. Billard). Wiley, New York.
Arcones, M. and Giné, E. (1993). Limit theorems for U-processes. Annals of Probability 21, 1494-1452.
Assouad, P. (1981). Sur les classes de Vapnik-C̆ervonenkis. Comptes Rendus des Séances de l'Académie des Sciences Series A 292, 921-924.
Assouad, P. (1983). Densité et dimension. Annales de l'Institut Fourier (Grenoble) 33(3), 233-282.
Ball, K. and Pajor, A. (1990). The entropy of convex bodies with "few" extreme points. Geometry of Banach Spaces, Proceedings of the conference held in Strobl, Austria, 1989 (eds., P.F.X. Müller and W. Schachermayer). London Mathematical Society Lecture Note Series 158, 25-32.

Barron, A., Birgé, L., and Massart, P. (1995). Risk bounds for model selection via penalization. Preprint.

Bass, R. F. and Pyke, R. (1985). The space $D(A)$ and weak convergence for set-indexed processes. Annals of Probability 13, 860-884.
Bauer, H. (1981). Probability Theory and Elements of Measure Theory. Holt, Rinehart, and Winston, New York.

Bennett, G. (1962). Probability inequalities for the sum of independent random variables. Journal of the American Statistical Association 57, 33-45.

Beran, R. and Millar, P. W. (1986). Confidence sets for a multivariate distribution. Annals of Statistics 14, 431-443.
Bickel, P. J. (1967). Some contributions to the theory of order statistics. Proc. Fifth Berkeley Symp. Math. Statist. Prob. 1, 575-591. University of California Press, Berkeley.
Bickel, P. J. (1969). A distribution free version of the Smirnov two sample test in the $p$-variate case. Annals of Statistics 50, 1-23.
Bickel, P. J., Klaassen, C. A. J., Ritov, Y., and Wellner, J. A. (1993). Efficient and Adaptive Estimation for Semiparametric Models. Johns Hopkins University Press, Baltimore.
Billingsley, P. (1968). Convergence of Probability Measures. John Wiley, New York.

Billingsley, P. (1971). Weak Convergence of Measures: Applications in Probability. Regional Conference Series in Mathematics 5. Society for Industrial and Applied Mathematics, Philadelphia.
Birgé, L. and Massart, P. (1993). Rates of convergence for minimum contrast estimators. Probability Theory and Related Fields 97, 113-150.

Birgé, L. and Massart, P. (1994). Minimum contrast estimators on sieves. Report 34. Mathématiques, Université de Paris-Sud, Orsay.
Birman, M. S. and Solomjak, M. Z. (1967). Piecewise-polynomial approximation of functions of the classes $W_{p}$. Mathematics of the USSR Sbornik 73, 295-317.
Blum, J. R. (1955). On the convergence of empiric distribution functions. Annals of Mathematical Statistics 26, 527-529.
Blumberg, H. (1935). The measurable boundaries of an arbitrary function. Acta Mathematica 65, 263-282.
Blum, J. R., Hanson, D. L., and Rosenblatt, J. I. (1963). On the central limit theorem for the sum of a random number of independent random variables. Zeitschrift für Wahrscheinlichkeitstheorie und Verwandte Gebiete 1, 389-393.

Blum, J. R., Kiefer, J., and Rosenblatt, M. (1961). Distribution free tests of fit based on the sample distribution function. Annals of Mathematical Statistics 32, 485-498.
Bolthausen, E. (1978). Weak convergence of an empirical process indexed by the closed convex subsets of $I^{2}$. Zeitschrift für Wahrscheinlichkeitstheorie und Verwandte Gebiete 43, 173-181.
Borell, C. (1975). The Brunn-Minkowski inequality in Gauss space. Inventiones Mathematicae 30, 205-216.
Bretagnolle, J. and Huber, C. (1978). Lois empiriques et distance de Prokhorov. Lecture Notes in Mathematics 649, 332-341.
Bronštein, E. M. (1976). Epsilon-entropy of convex sets and functions. Siberian Mathematics Journal 17, 393-398.
Cantelli, F. P. (1933). Sulla determinazione empirica delle leggi di probabilità. Giornale dell'Istituto Italiano degli Attuari 4, 421-424.
Carl, B. and Stephani, I. (1990). Entropy, Compactness, and the Approximation of Operators. Cambridge University Press, Cambridge, England.
Chibisov, D. M. (1965). An investigation of the asymptotic power of the tests of fit. Theory of Probability and Its Applications 10, 421-437.
Chow, Y. S. and Teicher, H. (1978). Probability Theory. Springer-Verlag, New York.
Chung, K. L. (1951). The strong law of large numbers. Proc. Second Berkeley Symp. Math. Statist. Prob., 342-352, (eds., L.M. LeCam, J. Neyman, and E. Scott). University of California Press, Berkeley.
Cohn, D. L. (1980). Measure Theory. Birkhäuser, Boston.
Cramér, H. (1946). Mathematical Methods of Statistics. Princeton University Press, Princeton, NJ.
Csörgő, S. (1974). On weak convergence of the empirical process with random sample size. Acta Scientiarum Mathematicarum 36, 17-25. (Correction: Acta Scientiarum Mathematicarum 36, 375-376.)
Csörgő, S. (1981). Strong approximation of empirical Kac processes. Annals of the Institute of Statistical Mathematics 33, 417-423.
Csörgő, M. and Révész, P. (1978). Strong approximations of the quantile process. Annals of Statistics 6, 882-894.
Dehardt, J. (1971). Generalizations of the Glivenko-Cantelli theorem. Annals of Mathematical Statistics 42, 2050-2055.
Deheuvels, P. (1981). An asymptotic decomposition for multivariate distri-bution-free tests of independence. Journal of Multivariate Analysis 11, 102-113.
Dehling, H. (1983). Limit theorems for sums of weakly dependent Banach space valued random variables. Zeitschrift für Wahrscheinlichkeitstheorie und Verwandte Gebiete 63, 393-432.

Devroye, L. (1982). Bounds for the uniform deviations of empirical measures. Journal of Multivariate Analysis 13, 72-79.
Donsker, M. D. (1951). An invariance principle for certain probability limit theorems. Memoirs of the American Mathematical Society 6, 1-12.
Donsker, M. D. (1952). Justification and extension of Doob's heuristic approach to the Kolmogorov-Smirnov theorems. Annals of Mathematical Statistics 23, 277-281.
Doob, J. L. (1949). Heuristic approach to the Kolmogorov-Smirnov theorems. Annals of Mathematical Statistics 20, 393-403.
Doss, H. and Gill, R. D. (1992). A method for obtaining weak convergence results for quantile processes, with applications to censored survival data. Journal of the American Statistical Association 87, 869-877.
Dudley, R. M. (1966). Weak convergence of measures on nonseparable metric spaces and empirical measures on Euclidean spaces. Illinois Journal of Mathematics 10, 109-126.
Dudley, R. M. (1967a). Measures on nonseparable metric spaces. Illinois Journal of Mathematics 11, 449-453.
Dudley, R. M. (1967b). The sizes of compact subsets of Hilbert spaces and continuity of Gaussian processes. Journal of Functional Analysis 1, 290-330.
Dudley, R. M. (1968). Distances of probability measures and random variables. Annals of Mathematical Statistics 39, 1563-1572.
Dudley, R. M. (1973). Sample functions of the Gaussian process. Annals of Probability 1, 66-103.
Dudley, R. M. (1974). Metric entropy of some classes of sets with differentiable boundaries. Journal of Approximation Theory 10, 227-236. (Correction: Journal of Approximation Theory 26 (1979), 192-193.)
Dudley, R. M. (1976). Probabilities and Metrics: Convergence of Laws on Metric Spaces. Mathematics Institute Lecture Note Series 45. Aarhus University, Aarhus, Denmark.
Dudley, R. M. (1978a). Central limit theorems for empirical measures. Annals of Probability 6, 899-929. (Correction: Annals of Probability 7, 909-911.)
Dudley, R. M. (1978b). Review of Sudakov (1976). Mathematical Reviews 55, 606-607.
Dudley, R. M. (1979). Balls in $R^{k}$ do not cut all subsets of $k+2$ points. Advances in Mathematics 31, 306-308.
Dudley, R. M. (1984). A course on empirical processes (École d'Été de Probabilités de Saint-Flour XII-1982). Lecture Notes in Mathematics 1097, 2-141, (ed., P.L. Hennequin). Springer-Verlag, New York.

Dudley, R. M. (1985). An extended Wichura theorem, definition of Donsker class, and weighted empirical distributions. Lecture Notes in Mathematics 1153, 141-178. Springer-Verlag, New York.
Dudley, R. M. (1987). Universal Donsker classes and metric entropy. Annals of Probability 15, 1306-1326.
Dudley, R. M. (1989). Real Analysis and Probability. Wadsworth, Pacific Grove.
Dudley, R. M. (1990). Nonlinear functionals of empirical measures and the bootstrap. Probability in Banach Spaces VII, Progress in Probability 21, 63-82, (eds., E. Eberlein, J. Kuelbs and M.B. Marcus). Birkhäuser, Boston.
Dudley, R. M. (1992). Fréchet differentiability, $p$-variation and uniform Donsker classes. Annals of Probability 20, 1968-1982.
Dudley, R. M. (1993). Real Analysis and Probability. Second Printing (corrected). Chapman and Hall, New York.
Dudley, R. M. (1994). The order of the remainder in derivatives of composition and inverse operators for $p$-variation norms. Annals of Statistics 22, 1-20.
Dudley, R. M., Giné, E., and Zinn, J. (1991). Uniform and universal Glivenko-Cantelli classes. Journal of Theoretical Probability 4, 485-510.
Dudley, R. M. and Koltchinskii, V. (1994). Envelope moment conditions and Donsker classes. Probability Theory and Mathematical Statistics 51, 39-49.
Dudley, R. M. and Philipp, W. (1983). Invariance principles for sums of Banach space valued random elements and empirical processes. Zeitschrift für Wahrscheinlichkeitstheorie und Verwandte Gebiete 62, 509-552.
Dugue, D. (1975). Sur des tests d'indépendence indépendants de la loi. Comptes Rendus des Séances de l'Académie des Sciences Series A 281, 1103-1104.
Durst, M. and Dudley, R. M. (1981). Empirical processes, Vap-nik-Chervonenkis classes and Poisson processes. Probability and Mathematical Statistics 1, 109-115.
Dvoretzky, A., Kiefer, J., and Wolfowitz, J. (1956). Asymptotic minimax character of the sample distribution function and of the classical multinomial estimator. Annals of Mathematical Statistics 27, 642-669.
Eames, W. and May, L. E. (1967). Measurable cover functions. Canadian Mathematics Bulletin 10, 519-523.
Eaton, M. L. (1974). A probability inequality for linear combinations of bounded random variables. Annals of Statistics 2, 609-614.

Efron, B. (1979). Bootstrap methods: Another look at the jackknife. Annals of Statistics 7, 1-26.
Erdös, P. and Kac, M. (1946). On certain limit theorems in the theory of probability. Bulletin of the American Mathematical Society 52, 292-302.
Fernandez, P. J. (1970). A weak convergence theorem for random sums of independent random variables. Annals of Mathematical Statistics 41, 710-712.
Fernique, X. (1974). Régularité des trajectoires des fonctions aléatoires gaussiennes. Lecture Notes in Mathematics 480, 1-96. SpringerVerlag, Berlin.
Fernique, X. (1978). Caracterisation des processus à trajectoires majorées ou continues. Lecture Notes in Mathematics 649, 691-706. Springer-Verlag, Berlin.
Fernique, X. (1985). Sur la convergence étroite des mesures gaussiennes. Zeitschrift für Wahrscheinlichkeitstheorie und Verwandte Gebiete 68, 331-336.
Fortet, R. and Mourier, E. (1953). Convergence de la répartition empirique vers la répartition théorique. Annales Scientifiques de l'École Normale Supérieure 70, 266-285.
Frankl, P. (1983). On the trace of finite sets. Journal of Combinatorial Theory A 34, 41-45.
Gaenssler, P. (1983). Empirical Processes. Institute of Mathematical Statistics, Hayward, CA.
Gill, R. D. (1989). Non- and semi-parametric maximum likelihood estimators and the von-Mises method (part I). Scandinavian Journal of Statistics 16, 97-128.
Gill, R. D. (1994). Lectures on survival analysis (École d'Été de Probabilités de Saint-Flour XXII-1992). Lecture Notes in Mathematics 1581, 115-241, (ed., P. Bernard). Springer-Verlag, New York.
Gill, R. D. and Johansen, S. (1990). A survey of product-integration with a view towards application in survival analysis. Annals of Statistics 18, 1501-1555.
Giné, E. and Zinn, J. (1984). Some limit theorems for empirical processes. Annals of Probability 12, 929-989.
Giné, E. and Zinn, J. (1986a). Lectures on the central limit theorem for empirical processes. Lecture Notes in Mathematics 1221, 50-11. Springer-Verlag, Berlin.
Giné, E. and Zinn, J. (1986b). Empirical processes indexed by Lipschitz functions. Annals of Probability 14, 1329-1338.
Giné, E. and Zinn, J. (1990). Bootstrapping general empirical measures. Annals of Probability 18, 851-869.

Giné, E. and Zinn, J. (1991). Gaussian characterization of uniform Donsker classes of functions. Annals of Probability 19, 758-782.
Glivenko, V. (1933). Sulla determinazione empirica della leggi di probabilità. Giornale dell'Istituto Italiano degli Attuari 4, 92-99.
Gnedenko, B. V. and Kolmogorov, A. N. (1954). Limit Distributions for Sums of Independent Random Variables. Addison Wesley, Reading, MA (revised version, 1968).
Goodman, V. (1976). Distribution estimates for functionals of the two-parameter Wiener process. Annals of Probability 4, 977-982.
Greenwood, P. E. and Shiryayev, A. N. (1985). Contiguity and the Statistical Invariance Principle. Gordon and Breach, New York.
Grenander, U. (1956). On the theory of mortality measurement, part II. Skandinavisk Aktuarietidskrift 39, 125-153.
Groeneboom, P. (1983). The concave majorant of Brownian motion. Annals of Probability 11, 1016-1027.
Groeneboom, P. (1985). Estimating a monotone density. Proceedings of the Berkeley Conference in Honor of Jerzy Neyman and Jack Kiefer, Vol. II, 539-555, (eds., Lucien M. LeCam and Richard A. Olshen). Wadsworth, Monterey, CA.
Groeneboom, P. (1987). Asymptotics for interval censored observations. Report 87-18. Department of Mathematics, University of Amsterdam.
Groeneboom, P. (1988). Brownian Motion with a parabolic drift and Airy functions. Probability Theory and Related Fields 81, 79-109.
Groeneboom, P. and Wellner, J. A. (1992). Information Bounds and Nonparametric Maximum Likelihood Estimation. Birkhäuser, Basel.
Grübel, R. and Pitts, S. M. (1992). A functional approach to the stationary waiting time and idle period distributions of the GI/G/1 queue. Annals of Probability 20, 1754-1778.
Grübel, R. and Pitts, S. M. (1993). Nonparametric estimation in renewal theory I: The empirical renewal function. Annals of Statistics 21, 1431-1451.
Hájek, J. (1961). Some extensions of the Wald-Wolfowitz-Noether theorem. Annals of Mathematical Statistics 32, 506-523.
Hájek, J. (1970). A characterization of limiting distributions of regular estimates. Zeitschrift für Wahrscheinlichkeitstheorie und Verwandte Gebiete 14, 323-330.
Hájek, J. (1972). Local asymptotic minimax and admissibility in estimation. Proc. Sixth Berkeley Symp. Math. Statist. Prob. 1, 175-194, (eds., L.M. LeCam, J. Neyman, and E. Scott).
Hájek, J. and Šidák, Z. (1967). Theory of Rank Tests. Academic Press, New York.

Hammersley, J. M. (1952). An extension of the Slutzky-Fréchet theorem. Acta Mathematica 87, 243-257.
Haussler, D. (1995). Sphere packing numbers for subsets of the Boolean $n$-cube with bounded Vapnik-Chervonenkis dimension. Journal of Combinatorial Theory A69, 217-232.
Heesterman, C. C. and Gill, R. D. (1992). A central limit theorem for $M$-estimators by the von Mises method. Statistica Neerlandica 46, 165-177.
Hjort, N. L. and Fenstad, G. (1992). On the last time and the number of times an estimator is more than epsilon from its target value. Annals of Statistics 20, 469-489.
Hoeffding, W. (1948). A non-parametric test of independence. Annals of Mathematical Statistics 19, 546-557.
Hoeffding, W. (1963). Probability inequalities for sums of bounded random variables. Journal of the American Statistical Association 58, 13-30.
Hoffmann-Jørgensen, J. (1970). The Theory of Analytic Spaces. Various Publications Series 10. Matematisk Institut, Aarhus Universitet, Aarhus, Denmark.
Hoffmann-Jørgensen, J. (1973). Sums of independent Banach space valued random variables. Aarhus Univ. Preprint Series 1972/73 15.
Hoffmann-Jørgensen, J. (1974). Sums of independent Banach space valued random variables. Studia Mathematica 52, 159-186.
Hoffmann-Jørgensen, J. (1976). Probability in Banach spaces. Lecture Notes in Mathematics 598, 164-229. Springer-Verlag, New York.
Hoffmann-Jørgensen, J. (1984). Stochastic Processes on Polish Spaces. unpublished.
Hoffmann-Jørgensen, J. (1991). Stochastic Processes on Polish Spaces. Various Publication Series 39. Aarhus Universitet, Aarhus, Denmark.
Hoffmann-Jørgensen, J. (1994). Probability with a View Towards Statistics. Chapman and Hall, New York.
Hogan, M. L. and Siegmund, D. (1986). Large deviations for the maxima of some random fields. Advances in Applied Mathematics 7, 2-22.
Huang, J. (1993). Central limit theorems for $M$-estimates. Report 251. Department of Statistics, University of Washington, Seattle.
Huang, J. (1996). Efficient estimation for the Cox model with interval censoring. Annals of Statistics, to appear.
Huber, P. (1967). The behavior of maximum likelihood estimates under nonstandard conditions. Proc. Fifth Berkeley Symp. Math. Statist. Probab. 1, 221-233, (eds., L.M. LeCam and J. Neyman). University of California Press, Berkeley.

Ibragimov, I. A. and Has'minskii, R. Z. (1981). Statistical Estimation: Asymptotic Theory. Springer-Verlag, New York.
Ibragimov, I. A., Sudakov, V. N., and Tsirel'son, B. S. (1976). Norms of Gaussian sample functions. Proceedings of the Third Japan-USSR Symposium on Probability Theory. Lecture Notes in Mathematics 550, 20-41. Springer-Verlag, New York.
Jain, N. and Marcus, M. (1975). Central limit theorems for $C(S)$-valued random variables. Journal Functional Analysis 19, 216-231.
Jain, N. and Marcus, M. (1978). Continuity of subgaussian processes. Probability on Banach Spaces, Advances in Probability 4, 81-196. Dekker, New York.
Jameson, J. O. (1974). Topology and Normed Spaces. Chapman and Hall, London.
Jongbloed, G. (1995). Three Statistical Inverse Problems. Department of Mathematics, Delft University, Delft, Netherlands.
Jupp, P. E. and Spurr, B. D. (1985). Sobolev tests for independence of directions. Annals of Statistics 13, 1140-1155.
Kac, M. (1949). On deviations between theoretical and empirical distributions. Proceedings of the National Academy of Sciences USA 35, 252-257.
Kahane, J. -P. (1968). Some Random Series of Functions. Heath, Lexington, (2nd edition: Cambridge University Press, Cambridge, England, 1985).
Kelley, J. L. (1955). General Topology. Van Nostrand, Princeton, NJ.
Kiefer, J. (1961). On large deviations of the empiric d.f. of vector chance variables and a law of iterated logarithm. Pacific Journal of Mathematics 11, 649-660.
Kiefer, J. (1969). On the deviations in the Skorokhod-Strassen approximation scheme. Zeitschrift für Wahrscheinlichkeitstheorie und Verwandte Gebiete 13, 321-332.
Kiefer, J. and Wolfowitz, J. (1958). On the deviations of the empiric distribution function of vector chance variables. Transactions of the American Mathematical Society 87, 173-186.
Kiefer, J. and Wolfowitz, J. (1959). Asymptotic minimax character of the sample distribution function for vector chance variables. Annals of Mathematical Statistics 30, 463-489.
Kim, J. and Pollard, D. (1990). Cube root asymptotics. Annals of Statistics 18, 191-219.
Klaassen, C. A. J. and Wellner, J. A. (1992). Kac empirical processes and the bootstrap. Proceedings of the Eighth International Conference on Probability in Banach Spaces, 411-429, (eds., M. Hahn and J. Kuelbs). Birkhäuser, New York.

Kolčinskii, V. I. (1981). On the central limit theorem for empirical measures. Theory of Probability and Mathematical Statistics 24, 71-82.
Kolmogorov, A. N. (1933). Sulla determinazione empirica di una legge di distribuzione. Giornale dell'Istituto Italiano degli Attuari 4, 83-91.
Kolmogorov, A. N. and Tikhomirov, V. M. (1961). Epsilon-entropy and epsilon-capacity of sets in function spaces. American Mathematical Society Translations, series 217, 277-364.
Koul, H. (1970). Some convergence theorems for ranks and weighted empirical cumulatives. Annals of Mathematical Statistics 41, 1768-1773.
Kuelbs, J. (1976). A strong convergence theorem for Banach space valued random variables. Annals of Probability 4, 744-771.
Landau, H. and Shepp, L. A. (1970). On the supremum of a Gaussian process. Sankhyà A32, 369-378.
Le Cam, L. (1957). Convergence in distribution of stochastic processes. University of California Publications in Statistics 2, 207-236.
Le Cam, L. (1960). Locally asymptotically normal families of distributions. University of California Publications in Statistics 3, 37-98.
Le Cam, L. (1969). Théorie Asymptotique de la Décision Statistique. Les Presses de l'Université de Montréal.
Le Cam, L. (1970a). On the assumptions used to prove asymptotic normality of maximum likelihood estimates. Annals of Mathematical Statistics 41, 802-828.
Le Cam, L. (1970b). Remarques sur le théorème limite central dans les espaces localement convexes. Les Probabilités sur les Structures Algébriques, 233-249. Centre National des Recherches Scientifiques, Paris.
Le Cam, L. (1972). Limits of experiments. Proc. Sixth Berkeley Symp. Math. Statist. Probab. 1, 245-261, (eds., L.M. LeCam, J. Neyman, and E. Scott). University of California Press, Berkeley.
Le Cam, L. (1986). Asymptotic Methods in Statistical Decision Theory. Springer-Verlag, New York.
Le Cam, L. (1989). On measurability and convergence in distribution. Report 211. Department of Statistics, University of California, Berkeley.
Ledoux, M. (1995). Isoperimetry and Gaussian analysis (École d'Été de Probabilités de Saint-Flour XXIV-1994). Lecture Notes in Mathematics to appear (ed., P. Bernard). Springer-Verlag, New York.
Ledoux, M. and Talagrand, M. (1986). Conditions d'intégrabilité pour les multiplicateurs dans le TLC Banachique. Annals of Probability 14, 916-921.

Ledoux, M. and Talagrand, M. (1988). Un critère sur les petite boules dans le théorème limite central. Probability Theory and Related Fields 77, 29-47.
Ledoux, M. and Talagrand, M. (1991). Probability in Banach Spaces: Isoperimetry and Processes. Springer-Verlag, Berlin.
Lehmann, E. L. (1983). Theory of Point Estimation. Wiley, New York.
Levit, B. Ya. (1978). Infinite-dimensional informational lower bounds. Theory of Probability and Its Applications 23, 388-394.
Lindvall, T. (1973). Weak convergence of probability measures and random functions in the function space $D[0, \infty)$. Journal of Applied Probability 10, 109-121.
Lorentz, G. G. (1966). Approximation of Functions. Holt, Rhinehart, Winston, New York.
Mammen, E. (1991). Nonparametric regression under qualitative smoothness assumptions. Annals of Statistics 19, 741-759.
Marcus, M. B. and Shepp, L. A. (1971). Sample behaviour of Gaussian processes. Proc. Sixth Berkeley Symp. Math. Statist. Probab. 2, 423-442.
Marcus, M. and Zinn, J. (1984). The bounded law of the iterated logarithm for the weighted empirical distribution in the non-iid case. Annals of Probability 12, 334-360.
Marshall, A. W. and Olkin, I. (1979). Inequalities: Theory of Majorization and Its Applications. Academic Press, New York.
Mason, D. M. and Newton, M. (1990). A rank statistics approach to the consistency of a general bootstrap. Annals of Statistics 20, 1611-1624.
Mason, D. M. and Van Zwet, W. R. (1987). A refinement of the KMT inequality for the uniform empirical process. Annals of Probability 15, 871-894.
Massart, P. (1986). Rates of convergence in the central limit theorem for empirical processes. Annales Institut Henri Poincaré 22, 381-423.
Massart, P. (1989). Strong approximation for multivariate empirical and related processes, via KMT constructions. Annals of Probability 17, 266-291.
Massart, P. (1990). The tight constant in the Dvoretzky-KieferWolfowitz inequality. Annals of Probability 18, 1269-1283.
May, L. E. (1973). Separation of functions. Canadian Mathematics Bulletin 16, 245-250.
Millar, P. W. (1979). Asymptotic minimax theorems for the sample distribution function. Zeitschrift für Wahrscheinlichkeitstheorie und Verwandte Gebiete 48, 233-252.

Millar, P. W. (1983). The minimax principle in asymptotic statistical theory. École d'Été de Probabilités de St. Flour XI. Lecture Notes in Mathematics 976, 76-267. Springer-Verlag, New York.
Millar, P. W. (1985). Non-parametric applications of an infinite dimensional convolution theorem. Zeitschrift für Wahrscheinlichkeitstheorie und Verwandte Gebiete 68, 545-556.
Mitoma, I. (1983). Tightness of probabilities on $C\left([0,1] ; S^{\prime}\right)$ and $D\left([0,1] ; S^{\prime}\right)$. Annals of Probability 11, 989-999.
Müller, D. W. (1968). Verteilungs-Invarianzprinzipien für das starke Gesetz der grossen Zahl. Zeitschrift für Wahrscheinlichkeitstheorie und Verwandte Gebiete 10, 173-192.
Munkres, J. (1975). Topology; a First Course. Prentice-Hall, Englewood Cliffs, NJ.
Murphy, S. A. (1994). Consistency in a proportional hazards model incorporating a random effect. Annals of Statistics 22, 712-731.
Murphy, S. A. (1995). Asymptotic theory for the frailty model. Annals of Statistics 23, 182-198.
Nolan, D. (1992). Asymptotics for multivariate trimming. Stochastic Processes and Their Applications 42, 157-169.
Ossiander, M. (1987). A central limit theorem under metric entropy with $L_{2}$ bracketing. Annals of Probability 15, 897-919.
Ottaviani, G. (1939). Sulla teoria astratta del calcolodelle probabilità proposita dal Cantelli. Giornale dell'Istituto Italiano degli Attuari 10, 10-40.
Parthasarathy, K. R. (1967). Probability Measures on Metric Spaces. Academic Press, New York.
Pinelis, I. (1994). Extremal probabilistic problems and Hotelling's $T^{2}$ test under a symmetry condition. Annals of Statistics 22, 357-368.
Pisier, G. (1981). Remarques sur un résultat non publié de B. Maurey. Séminaire d'analyse Fonctionelle, 1980-1981, Exposé No. 5. École Polytechnique, Palaiseau.
Pisier, G. (1983). Some applications of the metric entropy condition to harmonic analysis. Banach spaces, Harmonic Analysis and Probability. Lecture Notes in Mathematics 995, 123-154. Springer-Verlag, New York.
Pisier, G. (1984). Remarques sur les classes de Vapnik-Červonenkis. Annales Institut Henri Poincaré 20, 287-298.
Pisier, G. (1986). Probabilistic methods in the geometry of Banach space. Lecture Notes in Mathematics 1206, 167-241. Springer-Verlag, Berlin.
Pisier, G. (1989). The Volume of Convex Bodies and Banach Space Geometry. Cambridge University Press, Cambridge, England.

Pitts, S. M. (1994). Nonparametric estimation of the stationary waiting time distribution function for the GI/G/1 queue. Annals of Statistics 22, 1428-1446.
Pollard, D. (1981). Limit theorems for empirical processes. Zeitschrift für Wahrscheinlichkeitstheorie und Verwandte Gebiete 57, 181-195.
Pollard, D. (1982). A central limit theorem for empirical processes. Journal of the Australian Mathematical Society A 33, 235-248.
Pollard, D. (1984). Convergence of Stochastic Processes. Springer-Verlag, New York.

Pollard, D. (1985). New ways to prove central limit theorems. Econometric Theory 1, 295-314.
Pollard, D. (1989a). A maximal inequality for sums of independent processes under a bracketing condition. Preprint.
Pollard, D. (1989b). Asymptotics via empirical processes. Statistical Science 4, 341-366.

Pollard, D. (1990). Empirical Processes: Theory and Applications. NSF-CBMS Regional Conference Series in Probability and Statistics 2. Institute of Mathematical Statistics and American Statistical Association.

Pollard, D. (1995). Uniform ratio limit theorems for empirical processes. Scandinavian Journal of Statistics 22, 271-278.
Praestgaard, J. (1995). Permutation and bootstrap Kolmogorov-Smirnov tests for the equality of two distributions. Scandinavian Journal of Statistics 22, 305-322.
Praestgaard, J. and Wellner, J. A. (1993). Exchangeably weighted bootstraps of the general empirical process. Annals of Probability 21, 2053-2086.

Prakasa Rao, B. L. S. (1969). Estimation of a unimodal density. Sankya Series A 31, 23-36.
Preston, C. (1972). Continuity properties of some Gaussian processes. Annals of Mathematical Statistics 43, 285-292.
Prohorov, Yu. V. (1956). Convergence of random processes and limit theorems in probability. Theory of Probability and Its Applications 1, 157-214.

Pyke, R. (1968). The weak convergence of the empirical process with random sample size. Proceedings of the Cambridge Philosophical Society 64, 155-160.
Pyke, R. (1969). Applications of almost surely convergent constructions of weakly convergent processes. Lecture Notes in Mathematics 89, 187-200. Springer-Verlag, New York.

Pyke, R. (1970). Asymptotic results for rank statistics. Nonparametric Techniques in Statistical Inference, 21-37, (ed., M.L. Puri). Cambridge University Press, Cambridge, England.
Pyke, R. (1983). A uniform central limit theorem for partial-sum processes indexed by sets. Probability, Statistics and Analysis, 219-240, (eds., J.F.C. Kingman and G.E.H. Reuter). Cambridge University Press, Cambridge, England.
Pyke, R. (1984). Asymptotic results for empirical and partial sum processes: a review. Canadian Journal of Statistics 12, 241-264.
Pyke, R. (1992). Probability in mathematics and statistics: A century's predictor of future directions. Jahresbericht Deutschen Mathe-matiker-Vereinigung, Jubiläumstagung 1990, 239-264, (ed., W.-D. Geyer). Teubner, Stuttgart.
Pyke, R. and Shorack, G. R. (1968). Weak convergence of a two-sample empirical process and a new approach to Chernoff-Savage theorems. Annals of Mathematical Statistics 39, 755-771.
Quiroz, A. J., Nakamura, M., and Perez, F. J. (1995). Estimation of a multivariate Box-Cox transformation to elliptical symmetry via the empirical characteristic function. Preprint.
Ranga Rao, R. (1962). Relations between weak and uniform convergence of measures with applications. Annals of Mathematical Statistics 33, 659-680.
Reeds, J. A. (1976). On the Definition of von Mises Functionals. Ph.D. dissertation, Department of Statistics, Harvard University, Cambridge, MA.
Révész, P. (1976). Three theorems of multivariate empirical process. Lecture Notes in Mathematics 566, 106-126. Springer-Verlag, New York.

Revuz, D. and Yor, M. (1994). Continuous Martingales and Brownian Motion, Second Edition. Springer-Verlag, New York.
Robertson, T., Wright, F. T., and Dykstra, R. L. (1988). Order Restricted Statistical Inference. Wiley, New York.
Roussas, G. G. (1972). Contiguity of Probability Measures. Cambridge University Press, London.
Rudin, W. (1966). Real and Complex Analysis. McGraw-Hill, New York.
Rudin, W. (1973). Functional Analysis. McGraw-Hill, New York.
Runnenburg, J. Th. and Vervaat, W. (1969). Asymptotical independence of the lengths of subintervals of a randomly partitioned interval; a sample from S. Ikeda's work. Statistica Neerlandica 23, 67-77.
Samorodnitsky, G. (1991). Probability tails of Gaussian extrema. Stochastic Processes and Their Applications 38, 55-84.

Sauer, N. (1972). On the density of families of sets. Journal of Combinatorial Theory A 13, 145-147.
Sheehy, A. and Wellner, J. A. (1992). Uniform Donsker classes of functions. Annals of Probability 20, 1983-2030.
Shen, X. and Wong, W. H. (1994). Convergence rate of sieve estimates. Annals of Statistics 22, 580-615.
Shorack, G. R. (1972). Convergence of quantile and spacings processes with applications. Annals of Mathematical Statistics 43, 1400-1411.
Shorack, G. R. (1973). Convergence of reduced empirical and quantile processes with application to functions of order statistics in the non-iid case. Annals of Statistics 1, 146-152.
Shorack, G. R. (1979). The weighted empirical process of row independent random variables with arbitrary distribution functions. Statistica Neerlandica 33, 169-189.
Shorack, G. R. (1980). Some law of the iterated logarithm type results for the empirical process. Australian Journal of Statistics 22, 50-59.
Shorack, G. R. and Beirlant, J. (1986). The appropriate reduction of the weighted empirical process. Statistica Neerlandica 40, 123-128.
Shorack, G. R. and Wellner, J. A. (1986). Empirical Processes with Applications to Statistics. Wiley, New York.
Siegmund, D. (1988). Approximate tail probabilities for the maxima of some random fields. Annals of Probability 16, 487-501.
Siegmund, D. (1992). Tail approximations for maxima of random fields. Proceedings of the 1989 Singapore Probability Conference, 147-158. Walter de Gruyter, Berlin.
Skorokhod, A. V. (1956). Limit theorems for stochastic processes. Theory of Probability and Its Applications 1, 261-290.
Slepian, D. (1962). The one-sided barrier problem for Gaussian noise. Bell System Technical Journal 42, 463-501.
Smith, D. and Dudley, R. M. (1992). Exponential bounds in VapnikCrevonenkis classes of index 1. Probability in Banach Spaces VIII, Progress in Probability, 451-465, (eds., R.M. Dudley, M.G. Hahn, and J. Kuelbs).
Smolyanov, O. G. and Fomin, S. V. (1976). Measure on linear topological spaces. Russian Mathematical Surveys 31, 1-53.
Stengle, G. and Yukich, J. E. (1989). Some new Vapnik-Chervonenkis classes. Annals of Statistics 17, 1441-1446.
Stone, C. (1963). Weak convergence of stochastic processes defined on semi-infinite time intervals. Proceedings of the American Mathematical Society 14, 694-696.

Strassen, V. and Dudley, R. M. (1969). The central limit theorem and epsilon-entropy. Lecture Notes in Mathematics 89, 224-231. Springer-Verlag, New York.
Strobl, F. (1992). On the reversed sub-martingale property of empirical discrepancies in arbitrary sample spaces. Report 53. Universität München.

Sudakov, V. N. (1969). Gauss and Cauchy measures and $\epsilon$-entropy. Doklady Akademii Nauk SSSR 185, 51-53.
Sudakov, V. N. (1971). Gaussian random processes and measures of solid angles in Hilbert spaces. Soviet Mathematics-Doklady 12, 412-415.
Sudakov, V. N. (1976). Geometric Problems of the Theory of Infi-nite-Dimensional Probability Distributions. Trudy Matematicheskogo Instituta im. V.A. Steklova 141.
Sudakov, V. N. and Tsirel'son, B. S. (1978). Extremal properties of half-spaces for sperically invariant measures. Journal of Soviet Mathematics 9, 9-18.
Sun, T. G. and Pyke, R. (1982). Weak convergence of empirical processes. Report 19. Department of Statistics, University of Washington, Seattle.

Talagrand, M. (1982). Closed convex hull of set of measurable functions, Riemann-measurable functions and measurability of translations. Annales de l'Institut Fourier (Grenoble) 32, 39-69.
Talagrand, M. (1987a). Measurability problems for empirical processes. Annals of Probability 15, 204-212.
Talagrand, M. (1987b). Donsker classes and random geometry. Annals of Probability 15, 1327-1338.
Talagrand, M. (1987c). Regularity of Gaussian processes. Acta Mathematica 159, 99-149.
Talagrand, M. (1988). Donsker classes of sets. Probability Theory and Related Fields 78, 169-191.
Talagrand, M. (1989). Isoperimetry and integrability of the sum of independent Banach-space valued random variables. Annals of Probability 17, 1546-1570.
Talagrand, M. (1992). A simple proof of the majorizing measure theorem. Geometric and Functional Analysis 2, 118-125.
Talagrand, M. (1994a). Sharper bounds for Gaussian and empirical processes. Annals of Probability 22, 28-76.
Talagrand, M. (1995). Concentration of measure and isoperimetric inequalities in product spaces. Publications Mathématiques IHES 81, 73-205.

Topsoe, F. (1967a). On the connection between $P$-continuity and $P$-uniformity in weak convergence. Theory of Probability and its Applications 12, 281-290.
Topsoe, F. (1967b). Preservation of weak convergence under mappings. Annals of Mathematical Statistics 38, 1661-1665.
Tsirel'son, V. S. (1975). The density of the distribution of the maximum of a Gaussian process. Theory of Probability and Its Applications 20, 847-856.
Van de Geer, S. (1990). Estimating a regression function. Annals of Statistics 18, 907-924.
Van de Geer, S. (1991). The entropy bound for monotone functions. Report 91-10. University of Leiden.
Van de Geer, S. (1993a). Hellinger-consistency of certain nonparametric maximum likelhood estimators. Annals of Statistics 21, 14-44.
Van de Geer, S. (1993b). The method of sieves and minimum contrast estimators. Report 93-06. University of Leiden.
Van der Laan, M. (1993). Efficient and Inefficient Estimation in Semiparametric Models. Ph.D. dissertation, University of Utrecht.
Van der Vaart, A. W. (1988). Statistical Estimation in Large Parameter Spaces. CWI Tracts 44. Center for Mathematics and Computer Science, Amsterdam.
Van der Vaart, A. W. (1991). Efficiency and Hadamard differentiability. Scandinavian Journal of Statistics 18, 63-75.
Van der Vaart, A. W. (1993). New Donsker classes. Annals of Probability, to appear.
Van der Vaart, A. W. (1994a). Maximum likelihood estimation with partially censored data. Annals of Statistics 22, 1896-1916.
Van der Vaart, A. W. (1994b). Bracketing smooth functions. Stochastic Processes and Their Applications 52, 93-105.
Van der Vaart, A. W. (1994c). On a model of Hasminskii and Ibragimov. Proceedings Kolmogorov Semester at the Euler International Mathematical Institute, St. Petersburg (ed., A. Yu. Zaitsev). North Holland, Amsterdam.
Van der Vaart, A. W. (1995). Efficiency of infinite dimensional $M$-estimators. Statistica Neerlandica 49, 9-30.
Van der Vaart, A. W. (1996). Efficient estimation in semiparametric models. Annals of Statistics, to appear.
Van der Vaart, A. W. and Wellner, J. A. (1989). Prohorov and continuous mapping theorems in the Hoffmann-Jorgensen weak convergence theory with applications to convolution and asymptotic minimax theorems. Preprint. Department of Statistics, University of Washington.

Van Zuijlen, M. (1978). Properties of the empirical distribution function for independent not identically distributed random variables. Annals of Probability 6, 250-266.
Vapnik, V. N. (1982). Estimation of Dependences. Springer-Verlag, New York.
Vapnik, V. N. and Červonenkis, A. Ya. (1968). On the uniform convergence of frequencies of occurrence events to their probabilities. Soviet Mathematics-Doklady 9, 915-918.
Vapnik, V. N. and Červonenkis, A. Ya. (1971). On the uniform convergence of relative frequencies of events to their probabilities. Theory of Probability and Its Applications 16, 264-280.
Vapnik, V. N. and Červonenkis, A. Ya. (1974). The Theory of Pattern Recognition. Nauka, Moscow.
Vapnik, V. N. and Červonenkis, A. Ya. (1981). Necessary and sufficient conditions for uniform convergence of means to mathematical expectations. Theory of Probability and Its Applications 26, 147-163.
Varadarajan, V. S. (1961). Measures on topological spaces. Mathematics of the USSR Sbornik 55, 35-100. (Translation: (1965). American Mathematical Society Translations, series 2 48, 161-228, American Mathematical Society, Providence.)
Wang, Y. (1993). The limiting distribution in concave regression. Preprint. Department of Statistics, University of Missouri, Columbia.
Wellner, J. A. (1977). Distributions related to linear bounds for the empirical distribution function. Annals of Statistics 5, 1003-1016.
Wellner, J. A. (1989). Discussion of Gill's paper "Non- and semiparametric maximum likelihood estimators and the von Mises method (part I)". Scandinavian Journal of Statistics 16, 124-127.
Wellner, J. A. (1992). Empirical processes in action: A review. International Statistical Review 60, 247-269.
Wenocur, R. S. and Dudley, R. M. (1981). Some special VapnikCervonenkis classes. Discrete Mathematics 33, 313-318.
Whitt, W. (1970). Weak convergence of probability measures on the function space $C[0, \infty)$. Annals of Mathematical Statistics 41, 939-944.
Whitt, W. (1980). Some useful functions for functional limit theorems. Mathematics of Operations Research 5, 67-85.
Wichura, M. J. (1968). On the Weak Convergence of Non-Borel Probabilities on a Metric Space. Ph.D. dissertation, Columbia University, New York.
Wichura, M. J. (1970). On the construction of almost uniformly convergent random variables with given weakly convergent image laws. Annals of Mathematical Statistics 41, 284-291.

Wong, W. H. and Severini, T. A. (1991). On maximum likelihood estimation in infinite dimensional parameter spaces. Annals of Statistics 19, 603-632.
Wong, W. H. and Shen, X. (1995). Probability inequalities for likelihood ratios and convergence rates of sieve MLE's. Annals of Statistics 23, to appear.
Yurinskii, V. V. (1974). Exponential bounds for large deviations. Theory of Probability and Its Applications 19, 154-155.
Yurinskii, V. V. (1977). On the error of the Gaussian approximation for convolutions. Theory of Probability and Its Applications 22, 236-247.

## Author Index

Adler, R. J. ..... $248,275,426,442,443,465,466$
Aldous, D. ..... 442-444, 466
Alexander, K. S. ..... $142,272-274,275$
Andersen, N. T. ..... $76,270,273$
Anderson, T. W. ..... 77, 428
Araujo, A. ..... 76, 425
Arcones, M. ..... 270, 426
Assouad, P. ..... 153,271
Ball, K. ..... 270, 271
Barron, A. ..... 425
Bass, R. F. ..... 274
Bauer, H. ..... 22, 26
Beirlant, J. ..... 273
Bennett, G. ..... $103,269,460$
Beran, R. ..... 363
Bickel, P. J. ..... $406,409,424,427,428$
Billingsley, P. ..... $2,3,5,75-77,274,425$
Birgé, L. ..... $275,424,425$
Birman, M. S. ..... 271
Blum, J. R. ..... $270,425,426$
Blumberg, H. ..... 75
Bolthausen, E. ..... 271
Borell, C. ..... 465
Bretagnolle, J. ..... 466
Bronštein, E. M. ..... 163, 271
Brown, L. D. ..... 248, 275, 442
Cantelli, F. P. ..... 270
Carl, B. ..... 271
Červonenkis, A. Ya. ..... 270, 272, 274
Chibisov, D. M. ..... 3, 76
Chow, Y. S. ..... 75, 245
Chung, K. L. ..... 456
Cohn, D. L. ..... 47, 54, 76
Cramér, H. ..... 424
Csörgő, M. ..... 427
Csörgő, S . ..... 425
Dehardt, J. ..... 270
Deheuvels, P. ..... 426
Dehling, H. ..... 466
Devroye, L. ..... 249
Dobrić, V. ..... 76
Donsker, M. D. ..... 75, 225, 274, 425
Doob, J. L. ..... 75, 274, 448
Doss, H. ..... 427
Dudley, R. M. . 3, 10, 22, 75-78, 146, 150-152, 163, 234, 248, 269-275, 352, 379, 398, 425, 427, ..... 465
Dugue, D. ..... 426
Durst, M. ..... 425
Dvoretzky, A. ..... 248, 272, 274
Dykstra, R. L. ..... 298
Eames, W. ..... 75
Eaton, M. L. ..... 466
Efron, B. ..... 280
Erdös, P. ..... 274
Fenstad, G. ..... 231
Fernandez, P. J. ..... 425
Fernique, X. ..... 466
Fomin, S. V. ..... 76
Fortet, R. ..... 77
Frankl, P. ..... 270
Gaenssler, P. ..... 75, 76
Gill, R. D. ..... 427
Giné, E. ..... 76, 236, 270, 271, 273, 274, 281, 425, 426
Glivenko, V. ..... 270
Gnedenko, B. V. ..... 77
Goodman, V. ..... 443, 466
Greenwood, P. E. ..... 411
Grenander, U. ..... 425
Groeneboom, P. ..... 423
Grübel, R. ..... 427
Hájek, J. ..... 406, 409, 427, 458
Hammersley, J. M. ..... 77
Hanson, D. L. ..... 425
Has'minskii, R. Z. ..... 423, 424
Haussler, D. ..... 270
Heesterman, C. C. ..... 427
Hjort, N. L. ..... 231
Hoeffding, W. ..... 426, 436, 459, 460
Hoffmann-Jørgensen, J. ..... 75, 76, 270, 424, 465
Hogan, M. L. ..... 442, 443, 466
Huang, J. ..... 424
Huber, C. ..... 466
Huber, P. ..... 424
Ibragimov, I. A. ..... 423, 424, 465
Jain, N. ..... 273, 465
Jameson, J. O. ..... 23, 25, 72
Johansen, S. ..... 427
Jongbloed, G. ..... 425
Jupp, P. E. ..... 76
Kac, M. ..... 274
Kahane, J-P. ..... 270
Kiefer, J. ..... 248, 270, 272, 274, 426, 448, 466
Kim, J. ..... 76, 274, 423, 447
Klaassen, C. A. J. ..... 406, 409, 424, 426, 428
Kolčinskii, V. I. (= Koltchinskii, V.) ..... 146, 270, 272
Kolmogorov, A. N. ..... 77, 165, 271, 425
Koul, H. ..... 273
Kuelbs, J. ..... 379
Landau, H. ..... 465
Le Cam, L. ..... 75-77, 411, 423-425, 427
Ledoux, M. ..... 93, 269, 271-274, 379, 426, 435, 436, 439, 441, 446, 449, ..... 450, 465, 466
Lehmann, E. L. ..... 313
Levit, B. Ya. ..... 428
Lindvall, T. ..... 76
Lorentz, G. G. ..... 271
Mammen, E. ..... 425
Marcus, M. B. ..... 273, 465
Marshall, A. W. ..... 436
Mason, D. M. ..... 426, 466
Massart, P. ..... 272, 274, 275, 424, 425
May, L. E. ..... 75
Millar, P. W. ..... 363, 428
Mitoma, I. ..... 76
Mourier, E. ..... 77
Müller, D. W. ..... 231, 274
Munkres, J. ..... 65
Murphy, S. A. ..... 424
Nakamura, M. ..... 271
Newton, M. ..... 426
Nolan, D. ..... 427
Olkin, I. ..... 436
Ossiander, M. ..... 270, 273
Ottaviani, G. ..... 465
Pajor, A. ..... 270, 271
Parthasarathy, K. R. ..... 75, 76
Perez, F. J. ..... 271
Philipp, W. ..... 379
Pinelis, I. ..... 466
Pisier, G. ..... 269, 271, 465
Pitts, S. M. ..... 427
Pollard, D. ..... 48, 75, 76, 102, 270-274, 423, 424, 447
Praestgaard, J. ..... 426
Prakasa Rao, B. L. S. ..... 423
Preston, C. ..... 466
Prohorov, Yu. V. ..... 75, 76, 77
Pyke, R. ..... 3, 77, 274, 425
Quiroz, A. J. ..... 271
Ranga Rao, R. ..... 77
Reeds, J. A. ..... 427
Révész, P. ..... 427
Revuz, D. ..... 384
Ritov, Y. ..... 406, 409, 424, 428
Robertson, T. ..... 298
Rosenblatt, J. I. ..... 425
Rosenblatt, M. ..... 426
Rudin, W. ..... 319, 377, 422
Runnenburg, J. Th. ..... 283
Samorodnitsky, G. ..... 442, 445, 465
Sauer, N. ..... 270
Severini, T. A. ..... 425
Sheehy, A. ..... 272, 274
Shen, X. ..... 425
Shepp, L. A. ..... 465
Shiryayev, A. N. ..... 411
Shorack, G. R. ..... $3,102,215,249,250,273,425,427,448,460,466$
Šidák, Z. ..... 406, 409, 427
Siegmund, D. ..... 442, 443, 444, 466
Skorokhod, A. V. ..... 3, 75, 77
Slepian, D. ..... 465
Smith, D. ..... 248, 275
Smolyanov, O. G. ..... 76
Solomjak, M. Z. ..... 271
Spurr, B. D. ..... 76
Stengle, G. ..... 271
Stephani, I. ..... 271
Stone, C. ..... 76
Strassen, V. ..... 269
Strobl, F. ..... 270
Sudakov, V. N. ..... 269, 465
Talagrand, M. . 93, 118, 236, 248, 269-275, 379, 426, 435, 436, 441, 442, ..... 446, 449, 450, 465, 466
Teicher, H. ..... 75, 245
Tikhomirov, V. M. ..... 165, 271
Topsoe, F. ..... 77
Tsirel'son, V. S. ..... 465
Van de Geer, S. ..... 271, 338, 424
Van der Laan, M. ..... 424
Van der Vaart, A. W. 76, 78, 271, 273, 406, 409, 419, 421, 424, 427, ..... 428
Van Zuijlen, M. ..... 273
Van Zwet, W. R. ..... 466
Vapnik, V. N. ..... 270, 272, 274
Varadarajan, V. S. ..... 76
Vervaat, W. ..... 283
Wang, Y. ..... 425
Wellner, J. A. 76-78, 102, 215, 249, 250, 272-274, 283, 423-427, 448, ..... 460
Whitt, W. ..... 76, 77
Wichura, M. J. ..... 76, 77, 425
Wolfowitz, J. ..... 248, 272, 274, 428
Wong, W. H. ..... 425
Wright, F. T. ..... 298
Yor, M. ..... 384
Yukich, J. E. ..... 271
Yurinskii, V. V. ..... 273, 457, 466
Zinn, J. ..... 236, 270-274, 281, 426

## Subject Index

abstract integral ..... 22
algebra ..... 25
alternative
definition of $\|\cdot\|_{\psi_{p}}$ for small $p$ ..... 266
hypothesis ..... 360, 408
proof of Corollary 2.9 .9 ..... 179,187
proofs of the Donsker theorems ..... 243
analytic ..... 47
Anderson-Darling statistic ..... 235
argmax continuous mapping ..... 286
Arzelà-Ascoli ..... 41
asymptotically
equicontinuous uniformly in ..... 169
finite-dimensional ..... 49
independent ..... 31
measurable ..... 20
$B^{\prime}$-measurable ..... 416
(shift) normal ..... 412
strongly, measurable ..... 55
tight ..... 21
uniformly integrable ..... 69
uniformly $\rho$-equicontinuous in probability ..... 37
asymptotic and uniform tightness of a sequence ..... 27
asymptotic equicontinuity ..... 67
a.s. representations ..... 58, 59
Baire $\sigma$-field ..... 26
ball $\sigma$-field ..... 45
Bayesian bootstrap ..... 354
Bennett's inequality ..... 460
Bernstein norm ..... 324
Bernstein's inequality ..... 102, 103
between graphs ..... 152
block bracketing ..... 126
bootstrap Bayesian ..... 354
delta-method for ..... 378, 379, 380
empirical distribution ..... 345
empirical process ..... 345
exchangeable ..... 353
independence process ..... 369
measure ..... 345
model-based ..... 369
nonparametric ..... 345
samples ..... 345, 358
two-sample empirical measures ..... 365
wild ..... 354
without replacement ..... 356
Borel measure ..... 16, 73
Borel $\sigma$-field ..... 16
Borell's inequality ..... 438
bounded functions ..... 419
bounded Lipschitz metric ..... 73
bounded VC-major classes ..... 145
bracket ..... 83
$\varepsilon$-bracket ..... 83
bracketing
block ..... 126
by Gaussian hypotheses ..... 212
central limit theorem ..... 211
entropy with ..... 83
number ..... 83
with Hellinger metric ..... 327
Bretagnolle and Huber-Carol inequality ..... 462
Brownian
bridge ..... 82, 89, 443
motion ..... 93
sheet ..... 230, 443
tucked sheet ..... 231, 368, 444
cadlag functions ..... 46
canonically formed ..... 83
canonical representation ..... 27
cells in $\mathbb{R}^{k}$ ..... 129, 133, 135
central limit theorem ..... 50
bracketing ..... 130, 211, 221
bracketing by Gaussian hypotheses ..... 212
conditonal multiplier ..... 182, 183
Jain-Marcus ..... 213
Lindeberg-Feller ..... 411
multiplier ..... 179
rank ..... 458
rate of convergence in multivariate ..... 457
chain rule ..... 373
chaining ..... 241
chaining method ..... 90
change-point alternatives ..... 410
classical smoothness ..... 313
closed convex sets ..... 202
comparing $\psi_{p}$-norms ..... 105
completely regular ..... 48
completely regular points ..... 48
completely tucked Brownian sheet ..... 368
completeness of the bounded Lipschitz metric ..... 71
completion ..... 14, 17
conditional multiplier central limit theorem ..... 176, 181, 183
conditions that imply the Lindeberg-Feller condition ..... 411
consistency ..... 287
consistency and Lipschitz criterion functions ..... 308
consistency and concave criterion functions ..... 308
consistent lifting ..... 118
contiguity and limit experiments ..... 411
contiguous ..... 401
continuity set ..... 19, 60
continuous
argmax, mapping ..... 286
extended, mapping ..... 67
functions ..... 34
mapping ..... 20, 54
contraction principle ..... 436, 450
convergence
almost surely ..... 52
almost uniformly ..... 52
for nets ..... 4, 17, 21, 58, 411, 417
in outer probability ..... 52, 57
in probability ..... 56
outer almost surely ..... 52
weakly ..... 17
convex
densities ..... 329
functions ..... 445
sets ..... 202
convolution ..... 414
copula function ..... 389
covering number ..... $83,90,98$
Cramér-von Mises ..... 234
current status ..... 298
deficient two-sample bootstrap ..... 366
delta-method ..... 375
for bootstrap almost surely ..... 379, 380
for bootstrap in probability ..... 378
differentiable
Fréchet ..... 373
functions ..... 202
Hadamard ..... 373
Hadamard tangentially ..... 373
uniform Fréchet ..... 397
directed set ..... 4
dominated convergence ..... 13
Donsker
class ..... 81
functional ..... 226
uniformly in ..... 168
Duhamel equation ..... 390 , 398
efficiency ..... 269,399
Egorov's theorem ..... 53
elliptical classes ..... 233,234
empirical
bootstrap measure ..... 345
bootstrap process ..... 345
distribution function ..... 82
measure ..... 80
process ..... 80
process indexed by sets ..... 82
quantiles ..... 385
quantile process ..... 387
entropy
numbers ..... 83, 98
uniform ..... 81
with bracketing ..... 83
without bracketing ..... 83
envelope function ..... 84
essential infimum ..... 12
estimator
asymptotically efficient ..... 420
asymptotically optimal ..... 416
Kaplan-Meier ..... 392
M- ..... 284
maximum likelihood ..... 286, 288, 296, 315, 316, 322, 326
Nelson-Aalen ..... 365
regular ..... 413
sieved $M$ - ..... 306
$Z-$ ..... 284, 309, 397
extended continuous mapping theorem ..... 67
$\mathrm{E}^{*} T$ is not always $\mathrm{E} T^{*}$ ..... 12
formally defining bootstrap samples ..... 345, 358
forward and backward equations ..... 379
Fréchet-differentiable ..... 373
Fredholm operator ..... 319
Fubini's theorem ..... 11
functional Donsker class ..... 226
Gaussian ..... 40, 212
Gaussian-dominated ..... 212
Gaussianization ..... 194
generator ..... 439
Glivenko-Cantelli class ..... 81
Glivenko-Cantelli, uniformly in ..... 167
Hadamard and Fréchet differentiability ..... 373
Hadamard-differentiable ..... 372
Hadamard-differentiable tangentially ..... 373
half-spaces ..... 152
Hamel base ..... 54
Hamming metric ..... 137
Hausdorff distance ..... 162
Hellinger metric ..... 280, 327
hereditary ..... 136
Hoeffding's inequality ..... 100, 266, 436, 459
Hoffmann-Jørgensen inequalities ..... 432
Hoffmann-Jørgensen inequalities for moments ..... 433
independence empirical process ..... 367
i.i.d. observations ..... 208, 413
inequality
Bennett's ..... 460
Bernstein's ..... 102, 103
Borell's ..... 438
Bretagnolle and Huber-Carol ..... 462
Hoeffding's exponential ..... 439
Hoeffding's finite sampling ..... 436
Hoffmann-Jørgensen's ..... 432
Hoffmann-Jørgensen's for moments ..... 433
isoperimetric ..... 451
Khinchine's ..... 464
Kiefer's ..... 460
Le Cam's Poissonization ..... 343
Lévy's ..... 431
Mason and van Zwet's ..... 463
maximal ..... 90
multiplier ..... 352
Ottaviani's ..... 430
Pinelis's ..... 463
Sudakov's ..... 441
symmetrization ..... 108
Talagrand's ..... 460
inner integral ..... 6
inner probability ..... 6
inner regular ..... 26
integration by parts for the Duhamel equation ..... 398
intrinsic semimetric ..... 91
isoperimetric inequalities ..... 184, 451
Jain-Marcus theorem ..... 213
Kac empirical point process ..... 341
Kaplan-Meier ..... 392
Kaplan-Meier estimator ..... 392
Khinchine's inequality ..... 464
Kiefer process ..... 226, 444
Kiefer's inequality ..... 460
Kolmogorov statistic ..... 360
$k$-sample problem ..... 366
law of large numbers ..... 456
uniform in $P \in \mathcal{P}$ ..... 456
strong ..... 456
least-absolute-deviation regression ..... 305
Le Cam's Poissonization lemma ..... 343
Le Cam's third lemma ..... 404, 405
Lévy-Ito-Nisio ..... 431
Lévy's inequalities ..... 431
lifting ..... 118
likelihood ratios ..... 402
Lipschitz functions ..... 74, 163, 312
Lipschitz in parameter ..... 294, 305
Lipschitz transformations ..... 197, 198
locally asymptotically normal ..... 413
lognormality ..... 404
$L_{2,1}$-condition ..... 88
majorizing measure ..... 446
marginals ..... 35
Mason and van Zwet's inequality ..... 463
maximal inequalities ..... 90
maximal measurable minorant ..... 7
maximum likelihood ..... $286,288,296,315,316,322,326$
measurable asymptotically ..... 20
asymptotically $\mathbf{B}^{\prime}$ - ..... 416
asymptotically strongly ..... 55
class ..... 110
cover function ..... 6
majorant ..... 6
minorant ..... 7
processes with Suslin index set ..... 47
stochastic process ..... 47
measure
bootstrap empirical ..... 345
Borel ..... 16, 73
discrete ..... 23
empirical ..... 80
-like ..... 209
majorizing ..... 445
outer measure ..... 14
pooled empirical ..... 361
Radon ..... 26
regular ..... 26
trace ..... 14
two-sample bootstrap empirical ..... 365
two-sample permutation empirical ..... 362
median and median deviation ..... 314
metric
Bernstein ..... 324
bounded Lipschitz ..... 73
Hamming ..... 137
Hausdorff ..... 162
Hellinger ..... 280, 327
intrinsic semi- ..... 91
$L_{r}$ ..... 84
$L_{2,1}$ ..... 177
$L_{2, \infty}$ ..... 130
Prohorov ..... 456
semi- ..... 38, 39
space ..... 16
Skorokhod ..... 3
uniform ..... 34
$M$-estimators ..... 270
minimal measurable majorant ..... 7
minimax theorem ..... 417
monotone
convergence ..... 13
convergence for Orlicz norms ..... 105
densities ..... 329
functions ..... 202
processes ..... 215
multiplier
central limit theorem ..... 176, 179, 182, 183
inequalities ..... 177, 352
multipliers
exchangeable ..... 353
Gaussian ..... 194
Rademacher ..... 107, 111, 112, 123, 127
Poisson ..... 346, 352, 363
multivariate trimmed mean ..... 395
necessity of integrability of the envelope ..... 120
Nelson-Aalen estimator ..... 383
net convergence ..... 4, 17, 21, 58, 411, 417
nontrivial ..... 58norm
Bernstein ..... 324
Orlicz ..... 95, 244
uniform ..... 34
$L_{2,1}$ ..... 177
$L_{2, \infty}$ ..... 130
open and closed subgraphs ..... 146
Orlicz norm ..... 95
Ottaviani's inequality ..... 430
outer integral ..... 6
measure ..... 14
probability ..... 6
regular ..... 26
packing number ..... 98
parametric maximum likelihood ..... 288
partial-sum processes ..... 88
partitioning ..... 262
$P$-Brownian bridge ..... 82
$P$-completion ..... 14
$P$-Donsker ..... 81
$P$-Kac ..... 342
Peano series ..... 398
perfect ..... 10
permutation
empirical process ..... 362
independence process ..... 371
test ..... 364
picks out ..... 85
Pinelis's inequality ..... 463
$P$-measurable class ..... 110
pointwise
measurable classes ..... 110
separable class ..... 110, 116
separable processes ..... 46
separable version ..... 116
Polish ..... 17
polynomial classes ..... 86
pooled empirical measure ..... 361
portmanteau theorem ..... 18
power of the Kolmogorov-Smirnov test ..... 408
$P$-pre-Gaussian ..... 89
pre-Gaussian ..... 89
pre-Gaussian uniformly in ..... 169
pre-tight ..... 17
process
bootstrap empirical ..... 345
empirical ..... 80
empirical, indexed by sets ..... 80
empirical quantile ..... 387
Gaussian ..... 40, 212
independence empirical ..... 367
Kac empirical point ..... 341
Kiefer-Müller ..... 226, 340, 444
measurable stochastic ..... 47
measurable, with Suslin index set ..... 47
partial-sum ..... 88
permutation empirical ..... 362
permutation independence ..... 371
pointwise-separable ..... 46
Poisson ..... 342
Rademacher ..... 449
sequential empirical ..... 225
stochastic ..... 34
sub-Gaussian ..... 101
two-sample bootstrap empirical ..... 365
two-sample permutation empirical ..... 362
weighted empirical ..... 210
product
integral ..... 390
space ..... 29
topology ..... 29
Prohorov distance ..... 456
Prohorov's theorem ..... 21
projection $\sigma$-field ..... 34
properties of the ball $\sigma$-field ..... 46
quasiperfect ..... 10
quantile-quantile transformation ..... 398
Rademacher ..... 100
Rademacher process ..... 449
Radon measure ..... 26
rank central limit theorem ..... 458
rate of convergence ..... 322
regular ..... 413
regularity of Borel measures ..... 26
relatively compact ..... 23, 73
$\rho_{P}$-totally bounded uniformly ..... 169
sample path ..... 34
score function ..... 413
semicontinuous
lower ..... 18, 416
upper ..... 18, 286
separable ..... 17, 98, 115
Banach space ..... 418
modification ..... 119
version ..... 116
$\varepsilon$-separated ..... 98
separates points ..... 25
sequences ..... 232
sequential empirical process ..... 225
shatter ..... 135
sieved $M$-estimators ..... 321
$\sigma$-field
Baire ..... 26
ball ..... 44
Borel ..... 16
Skorohod space ..... 3, 46, 419
Slepian, Fernique, Marcus, and Shepp lemma ..... 441
Slutsky's lemma ..... 32
Slutsky's theorem ..... 32
smooth functions ..... 202
space
metric ..... 16
Banach ..... 91, 376, 413
Hilbert ..... 49
normed ..... 372
Skorohod ..... 3, 46, 419
topological vector ..... 372
stability of the Glivenko-Cantelli property ..... 120
standard Brownian sheet ..... 231
statistic
Anderson-Darling ..... 235
Cramér-von Mises ..... 234
Kolmogorov-Smirnov ..... 234, 408
two-sample Kolmogorov ..... 360
Watson ..... 235
Wilcoxon ..... 382
stochastic process ..... 34
strongly asymptotically measurable ..... 55
subconvex ..... 416
sub-Gaussian ..... 91, 101
subgraph ..... 141
Sudakov's inequality ..... 441
Suslin ..... 47
symmetric convex hull ..... 87, 142
symmetrization ..... 108
symmetrization for probabilities ..... 112
Talagrand's inequality ..... 460
taking the supremum over all $Q$ ..... 133
tangent set ..... 413
$\tau\left(\mathbf{B}^{\prime}\right)$-subconvex ..... 416
tight ..... 16
time reversal ..... 231
topological vector space ..... 372
total boundedness in $L_{2}(P)$ ..... 90
totally bounded ..... 17
trace measure ..... 15
truncation ..... 208
tucked Brownian sheet ..... 444
two-sample
bootstrap empirical measures ..... 365
Kolmogorov-Smirnov statistic ..... 360
permutation empirical measures ..... 362
two-sided Brownian motion ..... 295
two-sided contiguous ..... 402
uniform distance ..... 34
uniform entropy condition ..... 127
uniform entropy numbers ..... 84
uniform Fréchet differentiability ..... 397
uniform small variance exponential bound ..... 257
uniformly tight ..... 21, 27, 73
uniform tightness and weak compactness of a set of Borel measures ..... 71
universally Donsker ..... 82
universally measurable ..... 47
using $\|\cdot\|_{P, 2}$ instead of $\rho_{P}$ ..... 93
Vapnik-C̆ervonenkis or VC
-class ..... 85, 86, 135, 141
-class of sets ..... 85
-hull class ..... 87, 142
-hull class for sets ..... 142
-index ..... 135
-major class ..... 145
-subgraph class ..... 86, 141
vector lattice ..... 25
Volterra equation ..... 398
weak convergence ..... 17
weak convergence of discrete measures ..... 24
weighted bootstrap empirical measure ..... 353
weighted empirical distribution function ..... 214
weighted empirical processes ..... 210
Wilcoxon statistic ..... 382
wild bootstrap ..... 354
$Z$-estimators ..... 284, 309, 397
Zermelo-Fränkel ..... 24

## List of Symbols

$\mathbf{B}^{*}$ dual space of the Banach space $\mathbf{B}$ ..... 414
BL(ID) the set of bounded, Lipschitz functions on $\mathbb{D}$ ..... 73
$C_{b}(\mathbb{D})$ bounded, continuous, real functions on $\mathbb{D}$ ..... 16
$C(T)$ continuous functions from $T$ to $\mathbb{R}$ ..... 34
$C_{M}^{\alpha}(\mathcal{X})$ continuous functions from $\mathcal{X} \subset \mathbb{R}^{d}$ to $\mathbb{R}$ with $\|f\|_{\alpha} \leq M$ ..... 154
$\operatorname{conv}(\mathcal{F})$ convex hull of $\mathcal{F}$ ..... 142
$\operatorname{cov}(X)$ covariance matrix of a random vector $X$ ..... 181
$\delta B$ boundary of the set $B$ ..... 19
$(\mathbb{D}, d),(\mathbb{E}, e)$ metric spaces ..... 16
$D[a, b]$ cadlag functions on $[a, b]$ ..... 46
$\delta_{x}$ point mass at $x$ or Dirac measure ..... 80
$\mathrm{E}^{*}$ outer integral ..... 6
$\mathcal{F}, \mathcal{G}, \mathcal{H}$ collections of functions ..... 86,87
$\mathbb{F}_{n}$ empirical distribution function ..... 51
G P-Brownian bridge process ..... 80,81
$\mathbb{G}_{n}$ empirical process ..... 78
III real Hilbert space ..... 49
$\ell^{\infty}(T)$ set of all uniformly bounded real functions on $T$ ..... 34
$\ell^{\infty}\left(T_{1}, T_{2}, \ldots\right)$ set of all locally bounded real functions on $T=\cup_{i=1}^{\infty} T_{i}$ ..... 43
$\mathcal{L}_{r} \quad r$-integrable functions ..... 83,84
$L_{r}$ equivalence classes of $r$-integrable functions ..... 83,84
$\mathcal{L}_{\infty}$ essentially bounded functions ..... 118
$L_{\infty}$ equivalence classes of essentially bounded functions ..... 118
$\mathcal{L}(\cdot)$ law or distribution of a random variable ..... 417
$\lambda$ Lebesgue measure ..... 3, 141
lin linear span ..... 50
${ }^{2} \log m$ logarithm base 2 ..... 185
$N\left(\mu, \sigma^{2}\right)$ normal (Gaussian) distribution on $\mathbb{R}$ ..... 194
$N_{k}(\mu, \Sigma)$ normal (Gaussian) distribution on $\mathbb{R}^{k}$ ..... 81
$P, Q, H$ probability measures on underlying sample space $\mathcal{X}$ ..... 6, 361
$\mathbb{P}_{n}, \mathbb{Q}_{n}$ empirical measures ..... 80, 361
$P^{*}$ outer probability ..... 6
$\mathcal{P}$ collection of probability measures ..... 9
$\mathbb{Q}$ set of rational numbers ..... 17
$\mathbb{R}$ real numbers ..... 7
$\overline{\mathbb{R}}$ extended real numbers, $[-\infty, \infty]$ ..... 6
$\mathbb{R}^{k} \mathrm{k}$-dimensional Euclidean space ..... 20
$\rho, \rho_{0}$ semimetrics on a set $T$ or $\mathcal{F}$ ..... 37, 39
$\rho$ a lifting ..... 118
$\rho_{P}$ variance semimetric ..... 89
$\operatorname{sconv}(\mathcal{F})$ symmetric convex hull of $\mathcal{F}$ ..... 142, 191
$T$ index set for a stochastic process ..... 34
$(\bar{T}, \rho) \quad \rho$-completion of $T$ ..... 40
$T^{*}$ minimal measurable majorant of the map/function $T$, or measurable cover function of $T$ ..... 6
$U C(T, \rho)$ uniformly continuous functions from $(T, \rho)$ to $\mathbb{R}$ ..... 41
$\operatorname{var}(X)$ variance of a real random variable $X$ ..... 102
$\sigma(X)$ standard deviation of a real random variable $X$ ..... 194
$\Omega, \Omega_{n}$ sample spaces ..... 6, 17
Symbols not connected to Greek or Roman letters
$\ll$ absolutely continuous with respect to ..... 9
$\dot{\kappa}^{*}$ adjoint of the linear map $\dot{\kappa}$ ..... 444
\# approximately equals ..... 300
\# cardinality of a finite set ..... 80, 82, 99
× Cartesian product ..... 29
✓ contiguous with respect to ..... 402
$\xrightarrow{\text { as }}$ convergence almost surely ..... 52
$\xrightarrow{\text { au convergence almost uniformly }}$ ..... 52
$\xrightarrow{\mathrm{P} *}$ convergence in outer probability ..... 52
$\xrightarrow{\mathrm{P}}$ convergence in probability ..... 52, 57
$\rightarrow \quad$ convergence of real numbers ..... 2
$\xrightarrow{\text { as* }}$ convergence outer almost surely ..... 52

- end-of-proof symbol ..... 7
$\emptyset$ empty set ..... 14
~ equal in distribution to ..... 426
三 equals by definition ..... 87
⟼ function specifier ..... 6
$\underline{x}$ greatest integer less than or equal to $x$ ..... 154
$1_{A}$ indicator function of the set $A$ ..... 7
$\lesssim$ left side bounded by a constant times the right side ..... 128
~ left side bounded above and below by constants times the right side ..... 130
$\|f\|_{Q, r} \quad L_{r}(Q)$ norm of $f$ ..... 84
$\|\xi\|_{2,1} \quad L_{2,1}$ norm of the random variable $\xi$ ..... 177
V maximum ..... 147
$\wedge$ minimum ..... 147
$\|X\|_{\psi}$ Orlicz norm of the random variable $X$ ..... 95
$\Pi$ pairwise intersections of two classes of sets ..... 147
- pairwise unions of two classes of sets ..... 147
$\|f\|_{\infty}$ supremum norm of $f$ ..... 73
△ symmetric difference ..... 150
- two-sided contiguous ..... 402
$\|\cdot\|_{\mathcal{F}}$ uniform norm for maps from $\mathcal{F}$ to $\mathbb{R}$ ..... 34, 81
⇝ weak convergence ..... 18
$\stackrel{h}{\rightarrow}$ weak convergence under $P_{n, h}$ ..... 412
$\stackrel{a}{\sim}$ weak convergence under $P_{n, h}$ for $h=\sum a_{i} h_{i}$ ..... 414
$\xrightarrow{\mathrm{Q}_{\alpha}}$ weak convergence under $Q_{\alpha}$ ..... 403


## Springer Series in Statistics

(continued from p.ii)
Read/Cressie: Goodness-of-Fit Statistics for Discrete Multivariate Data.
Reinsel: Elements of Multivariate Time Series Analysis.
Reiss: A Course on Point Processes.
Reiss: Approximate Distributions of Order Statistics: With Applications to Non-parametric Statistics.
Rieder: Robust Asymptotic Statistics.
Rosenbaum: Observational Studies.
Ross: Nonlinear Estimation.
Sachs: Applied Statistics: A Handbook of Techniques, 2nd edition.
Särndal/Swensson/Wretman: Model Assisted Survey Sampling.
Schervish: Theory of Statistics.
Seneta: Non-Negative Matrices and Markov Chains, 2nd edition.
Shao/Tu: The Jackknife and Bootstrap.
Siegmund: Sequential Analysis: Tests and Confidence Intervals.
Simonoff: Smoothing Methods in Statistics.
Tanner: Tools for Statistical Inference: Methods for the Exploration of Posterior Distributions and Likelihood Functions, 2nd edition.
Tong: The Multivariate Normal Distribution.
van der Vaart/Wellner: Weak Convergence and Empirical Processes: With Applications to Statistics.
Vapnik: Estimation of Dependences Based on Empirical Data.
Weerahandi: Exact Statistical Methods for Data Analysis.
West/Harrison: Bayesian Forecasting and Dynamic Models.
Wolter: Introduction to Variance Estimation.
Yaglom: Correlation Theory of Stationary and Related Random Functions I: Basic Results.
Yaglom: Correlation Theory of Stationary and Related Random Functions II: Supplementary Notes and References.


[^0]:    ‡ Differentiability at each $y$ in a convex set plus the uniform norm continuity of the derivatives $y \mapsto B_{y}^{\prime}$ implies uniform Fréchet differentiability. See Problem 3.9.1.

[^1]:    ${ }^{\mathrm{b}}$ Van der Vaart (1988), pages 81-85.

[^2]:    ${ }^{\dagger}$ This is the case, for instance, if each $\left(\Omega_{i}, \mathcal{U}_{i}, \mathrm{P}_{i}\right)$ is a product $\left(\mathcal{X}_{i}, \mathcal{A}_{i}, P_{i}\right)^{2}$ of two identical probability spaces and $X_{i}\left(x_{1}, x_{2}\right)=Z_{i}\left(x_{1}\right)-Z_{i}\left(x_{2}\right)$ for some stochastic process $Z_{i}$.

[^3]:    ${ }^{\ddagger}$ See Ledoux (1995) for an introduction.

[^4]:    ${ }^{b}$ Ledoux and Talagrand (1991), pages 320-321, and (11.15) on page 317.

[^5]:    \# The full force of the definition of $f\left(A_{1}, \ldots, A_{q}, X\right)$ is not used for this application. The control numbers could be reduced to the minimal $k$ such that there exist $y^{l} \in A_{l}$ with at most $k$ of the $X_{i}$ not occurring in the set $\left\{y_{i}^{l}: l=1, \ldots, q, i=1, \ldots, n\right\}$.

