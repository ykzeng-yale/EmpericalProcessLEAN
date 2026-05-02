Sufficiency. By Fubini's theorem,

$$
\begin{align*}
\frac{1}{u} \int_{-u}^{u}\left(1-\varphi_{n}(t)\right) d t & =\int_{-\infty}^{\infty}\left[\frac{1}{u} \int_{-u}^{u}\left(1-e^{i t x}\right) d t\right] \mu_{n}(d x)  \tag{26.22}\\
& =2 \int_{-\infty}^{\infty}\left(1-\frac{\sin u x}{u x}\right) \mu_{n}(d x) \\
& \geq 2 \int_{|x| \geq 2 / u}\left(1-\frac{1}{|u x|}\right) \mu_{n}(d x) \\
& \geq \mu_{n}\left[x:|x| \geq \frac{2}{u}\right]
\end{align*}
$$

(Note that the first integral is real.) Since $\varphi$ is continuous at the origin and $\varphi(0)=1$, there is for positive $\epsilon$ a $u$ for which $u^{-1} \int_{-u}^{u}(1-\varphi(t)) d t<\epsilon$. Since $\varphi_{n}$ converges to $\varphi$, the bounded convergence theorem implies that there exists an $n_{0}$ such that $u^{-1} \int_{-u}^{u}\left(1-\varphi_{n}(t)\right) d t<2 \epsilon$ for $n \geq n_{0}$. If $a=2 / u$ in (26.22), then $\mu_{n}[x:|x| \geq a]<2 \epsilon$ for $n \geq n_{0}$. Increasing $a$ if necessary will ensure that this inequality also holds for the finitely many $n$ preceding $n_{0}$. Therefore, $\left(\mu_{n}\right)$ is tight.

By the corollary to Theorem 25.10, $\mu_{n} \Rightarrow \mu$ will follow if it is shown that each subsequence $\left\{\mu_{n_{k}}\right\}$ that converges weakly at all converges weakly to $\mu$. But if $\mu_{n_{k}} \Rightarrow \nu$ as $k \rightarrow \infty$, then by the necessity half of the theorem, already proved, $\nu$ has characteristic function $\lim _{k} \varphi_{n_{k}}(t)=\varphi(t)$. By Theorem 26.2, $\nu$ and $\mu$ must coincide. $\square$

Two corollaries, interesting in themselves, will make clearer the structure of the proof of sufficiency given above. In each, let $\mu_{n}$ be probability measures on the line with characteristic functions $\varphi_{n}$.

Corollary 1. Suppose that $\lim _{n} \varphi_{n}(t)=g(t)$ for each $t$, where the limit function $g$ is continuous at 0 . Then there exists a $\mu$ such that $\mu_{n} \Rightarrow \mu$, and $\mu$ has characteristic function $g$.

Proof. The point of the corollary is that $g$ is not assumed at the outset to be a characteristic function. But in the argument following (26.22), only $\varphi(0)=1$ and the continuity of $\varphi$ at 0 were used; hence $\left\{\mu_{n}\right\}$ is tight under the present hypothesis. If $\mu_{n_{k}} \Rightarrow \nu$ as $k \rightarrow \infty$, then $\nu$ must have characteristic function $\lim _{k} \varphi_{n_{k}}(t)=g(t)$. Thus $g$ is, in fact, a characteristic function, and the proof goes through as before. $\square$

In this proof the continuity of $g$ was used to establish tightness. Hence if $\left\{\mu_{n}\right\}$ is assumed tight in the first place, the hypothesis of continuity can be suppressed:

Corollary 2. Suppose that $\lim _{n} \varphi_{n}(t)=g(t)$ exists for each $t$ and that $\left\{\mu_{n}\right\}$ is tight. Then there exists a $\mu$ such that $\mu_{n} \Rightarrow \mu$, and $\mu$ has characteristic function $g$.

This second corollary applies, for example, if the $\mu_{n}$ have a common bounded support.

Example 26.2. If $\mu_{n}$ is the uniform distribution over $(-n, n)$, its characteristic function is $(n t)^{-1} \sin t n$ for $t \neq 0$, and hence it converges to $I_{\{0\}}(t)$. In this case $\left\{\mu_{n}\right\}$ is not tight, the limit function is not continuous at 0 , and $\mu_{n}$ does not converge weakly.

## Fourier Series*

Let $\mu$ be a probability measure on $\mathscr{R}^{1}$ that is supported by $[0,2 \pi]$. Its Fourier coefficients are defined by

$$
\begin{equation*}
c_{m}=\int_{0}^{2 \pi} e^{i m x} \mu(d x), \quad m=0, \pm 1, \pm 2, \ldots \tag{26.23}
\end{equation*}
$$

These coefficients, the values of the characteristic function for integer arguments, suffice to determine $\mu$ except for the weights it may put at 0 and $2 \pi$. The relation between $\mu$ and its Fourier coefficients can be expressed formally by

$$
\begin{equation*}
\mu(d x) \sim \frac{1}{2 \pi} \sum_{l=-\infty}^{\infty} c_{l} e^{-i l x} d x \tag{26.24}
\end{equation*}
$$

if the $\mu(d x)$ in (26.23) is replaced by the right side of (26.24), and if the sum over $l$ is interchanged with the integral, the result is a formal identity.

To see how to recover $\mu$ from its Fourier coefficients, consider the symmetric partial sums $s_{m}(t)=(2 \pi)^{-1} \Sigma_{l=-m}^{m} c_{l} e^{-i l t}$ and their Cesàro averages $\sigma_{m}(t)= m^{-1} \sum_{t=0}^{m-1} s_{l}(t)$. From the trigonometric identity [A24]

$$
\begin{equation*}
\sum_{l=0}^{m-1} \sum_{k=-1}^{l} e^{i k x}=\frac{\sin ^{2} \frac{1}{2} m x}{\sin ^{2} \frac{1}{2} x} \tag{26.25}
\end{equation*}
$$

it follows that

$$
\begin{equation*}
\sigma_{m}(t)=\frac{1}{2 \pi m} \int_{0}^{2 \pi} \frac{\sin ^{2} \frac{1}{2} m(x-t)}{\sin ^{2} \frac{1}{2}(x-t)} \mu(d x) \tag{26.26}
\end{equation*}
$$

[^0]If $\mu$ is $(2 \pi)^{-1}$ times Lebesgue measure confined to $[0,2 \pi]$, then $c_{0}=1$ and $c_{m}=0$ for $m \neq 0$, so that $\sigma_{m}(t)=s_{m}(t)=(2 \pi)^{-1}$; this gives the identity

$$
\begin{equation*}
\frac{1}{2 \pi m} \int_{-\pi}^{\pi} \frac{\sin ^{2} \frac{1}{2} m s}{\sin ^{2} \frac{1}{2} s} d s=1 \tag{26.27}
\end{equation*}
$$

Suppose that $0<a<b<2 \pi$, and integrate (26.26) over ( $a, b$ ). Fubini's theorem (the integrand is nonnegative) and a change of variable lead to

$$
\begin{equation*}
\int_{a}^{b} \sigma_{m}(t) d t=\int_{0}^{2 \pi}\left[\frac{1}{2 \pi m} \int_{a-x}^{b-x} \frac{x \sin ^{2} \frac{1}{2} m s}{\sin ^{2} \frac{1}{2} s} d s\right] \mu(d x) \tag{26.28}
\end{equation*}
$$

The denominator in (26.27) is bounded away from 0 outside ( $-\delta, \delta$ ), and so as $m$ goes to $\infty$ with $\delta$ fixed $(0<\delta<\pi)$,

$$
\frac{1}{2 \pi m} \int_{\delta<|s|<\pi} \frac{\sin ^{2} \frac{1}{2} m s}{\sin ^{2} \frac{1}{2} s} d s \rightarrow 0, \quad \frac{1}{2 \pi m} \int_{|s|<\delta} \frac{\sin ^{2} \frac{1}{2} m s}{\sin ^{2} \frac{1}{2} s} d s \rightarrow 1
$$

Therefore, the expression in brackets in (26.28) goes to 0 if $0 \leq x<a$ or $b<x \leq 2 \pi$, and it goes to 1 if $a<x<b$; and because of (26.27), it is bounded by 1 . It follows by the bounded convergence theorem that

$$
\begin{equation*}
\mu(a, b]=\lim _{m} \int_{a}^{b} \sigma_{m}(t) d t \tag{26.29}
\end{equation*}
$$

if $\mu(a)=\mu\{b\}=0$ and $0<a<b<2 \pi$.
This is the analogue of (26.16). If $\mu$ and $\nu$ have the same Fourier coefficients, it follows from (26.29) that $\mu(A)=\nu(A)$ for $A \subset(0,2 \pi)$ and hence that $\mu\{0,2 \pi\}= \nu\{0,2 \pi\}$. It is clear from periodicity that the coefficients (26.23) are unchanged if $\mu\{0\}$ and $\mu(2 \pi)$ are altered but $\mu\{0\}+\mu\{2 \pi\}$ is held constant.

Suppose that $\mu_{n}$ is supported by $[0,2 \pi]$ and has coefficients $c_{m}^{(n)}$, and suppose that $\lim _{n} c_{m}^{(n)}=c_{m}$ for all $m$. Since $\left\{\mu_{n}\right\}$ is tight, $\mu_{n} \Rightarrow \mu$ will hold if $\mu_{n_{k}} \Rightarrow \nu(k \rightarrow \infty)$ implies $\nu=\mu$. But in this case $\nu$ and $\mu$ have the same coefficients $c_{m}$, and hence they are identical except perhaps in the way they split the mass $\nu\{0,2 \pi\}= \mu\{0,2 \pi\}$ between the points 0 and $2 \pi$. But this poses no problem if $\mu\{0,2 \pi\}=0$ : If $\lim _{n} c_{m}^{(n)}=c_{m}$ for all $m$ and $\mu\{0\}=\mu\{2 \pi\}=0$, then $\mu_{n} \Rightarrow \mu$.

Example 26.3. If $\mu$ is $(2 \pi)^{-1}$ times Lebesgue measure confined to the interval $[0,2 \pi]$, the condition is that $\lim _{n} c_{m}^{(n)}=0$ for $m \neq 0$. Let $x_{1}, x_{2}, \ldots$ be a sequence of reals, and let $\mu_{n}$ put mass $n^{-1}$ at each point $2 \pi\left\{x_{k}\right\}, 1 \leq k \leq n$, where $\left\{x_{k}\right\}=x_{k}-\left\lfloor x_{k}\right\rfloor$ denotes fractional part. This is the probability measure (25.3) rescaled to [ $0,2 \pi$ ]. The sequence $x_{1}, x_{2}, \ldots$ is uniformly distributed modulo 1 if and only if

$$
\frac{1}{n} \sum_{k=1}^{n} e^{2 \pi i\left(x_{k}\right) m}=\frac{1}{n} \sum_{k=1}^{n} e^{2 \pi i x_{k} m} \rightarrow 0
$$

for $m \neq 0$. This is Weyl's criterion.

If $x_{k}=k \theta$, where $\theta$ is irrational, then $\exp (2 \pi i \theta m) \neq 1$ for $m \neq 0$ and hence

$$
\frac{1}{n} \sum_{k=1}^{n} e^{2 \pi i k \theta m}=\frac{1}{n} e^{2 \pi i \theta m} \frac{1-e^{2 \pi i n \theta m}}{1-e^{2 \pi i \theta m}} \rightarrow 0 .
$$

Thus $\theta, 2 \theta, 3 \theta, \ldots$ is uniformly distributed modulo 1 if $\theta$ is irrational, which gives another proof of Theorem 25.1.

## PROBLEMS

26.1. A random variable has a lattice distribution if for some $a$ and $b, b>0$, the lattice $[a+n b: n=0, \pm 1, \ldots]$ supports the distribution of $X$. Let $X$ have characteristic function $\varphi$.
(a) Show that a necessary condition for $X$ to have a lattice distribution is that $|\varphi(t)|=1$ for some $t \neq 0$.
(b) Show that the condition is sufficient as well.
(c) Suppose that $|\varphi(t)|=\left|\varphi\left(t^{\prime}\right)\right|=1$ for incommensurable $t$ and $t^{\prime}(t \neq 0$, $t^{\prime} \neq 0, t / t^{\prime}$ irrational). Show that $P[X=c]=1$ for some constant $c$.
26.2. If $\mu(-\infty, x]=\mu[-x, \infty)$ for all $x$ (which implies that $\mu(A)=\mu(-A)$ for all $A \in \mathscr{R}^{1}$ ), then $\mu$ is symmetric. Show that this holds if and only if the characteristic function is real.
26.3. Consider functions $\varphi$ that are real and nonnegative and satisfy $\varphi(-t)= \varphi(t)$ and $\varphi(0)=1$.
(a) Suppose that $d_{1}, d_{2}, \ldots$ are positive and $\sum_{k=1}^{\infty} d_{k}=\infty$, that $s_{1} \geq s_{2} \geq \cdots \geq$ 0 and $\lim _{k} s_{k}=0$, and that $\sum_{k=1}^{\infty} s_{k} d_{k}=1$. Let $\varphi$ be the convex polygon whose successive sides have slopes $-s_{1},-s_{2}, \ldots$ and lengths $d_{1}, d_{2}, \ldots$ when projected on the horizontal axis: $\varphi$ has value $1-\sum_{j=1}^{k} s d_{j}$ at $t_{k}=d_{1}+\cdots+d_{k}$. If $s_{n}=0$, there are in effect only $n$ sides. Let $\varphi_{0}(t)=(1-|t|) I_{(-1,1)}(t)$ be the characteristic function in the last line in the table on p. 348, and show that $\varphi(t)$ is a convex combination of the characteristic functions $\varphi_{0}\left(t / t_{k}\right)$ and hence is itself a characteristic function.
(b) Pólya's criterion. Show that $\varphi$ is a characteristic function if it is even and continuous and, on $[0, \infty)$, nonincreasing and convex $(\varphi(0)=1$ ).
![](https://cdn.mathpix.com/cropped/14d6db67-b1d9-4598-a5c8-7abb965d6cc7-004.jpg?height=624&width=859&top_left_y=2104&top_left_x=467)
26.4. $\uparrow$ Let $\varphi_{1}$ and $\varphi_{2}$ be characteristic functions, and show that the set $A=[t$ : $\left.\varphi_{1}(t)=\varphi_{2}(t)\right]$ is closed, contains 0 , and is symmetric about 0 . Show that every set with these three properties can be such an $A$. What does this say about the uniqueness theorem?
26.5. Show by Theorem 26.1 and integration by parts that if $\mu$ has a density $f$ with integrable derivative $f^{\prime}$, then $\varphi(t)=o\left(t^{-1}\right)$ as $|t| \rightarrow \infty$. Extend to higher derivatives.
26.6. Show for independent random variables uniformly distributed over ( $-1,+1$ ) that $X_{1}+\cdots+X_{n}$ has density $\pi^{-1} \int_{0}^{\infty}((\sin t) / t)^{n} \cos t x d t$ for $n \geq 2$.
26.7. 21.17 Uniqueness theorem for moment generating functions. Suppose that $F$ has a moment generating function in $\left(-s_{0}, s_{0}\right), s_{0}>0$. From the fact that $\int_{-\infty}^{\infty} e^{z x} d F(x)$ is analytic in the strip $-s_{0}<\operatorname{Re} z<s_{0}$, prove that the moment generating function determines $F$. Show that it is enougn that the moment generating function exist in $\left[0, s_{0}\right), s_{0}>0$.
26.8. 21.2026 .7 ↑ Show that the gamma density (20.47) has characteristic function

$$
\frac{1}{(1-i t / \alpha)^{u}}=\exp \left[-u \log \left(1-\frac{i t}{\alpha}\right)\right],
$$

where the logarithm is the principal part. Show that $\int_{0}^{\infty} e^{z x} f(x ; \alpha, u) d x$ is analytic for $\operatorname{Re} z<\alpha$.
26.9. Use characteristic functions for a simple proof that the family of Cauchdistributions defined by (20.45) is closed under convolution; compare th argument in Problem 20.14(a). Do the same for the normal distributic (compare Example 20.6) and for the Poisson and gamma distributions.
26.10. Suppose that $F_{n} \Rightarrow F$ and that the characteristic functions are dominated by integrable function. Show that $F$ has a density that is the limit of the densit of the $F_{n}$.
26.11. Show for all $a$ and $b$ that the right side of (26.16) is $\mu(a, b)+\frac{1}{2} \mu\{a\}+\frac{1}{2} \mu$
26.12. By the kind of argument leading to (26.16), show that

$$
\begin{equation*}
\mu\{a\}=\lim _{T \rightarrow \infty} \frac{1}{2 T} \int_{-T}^{T} e^{-i t a} \varphi(t) d t \tag{26.30}
\end{equation*}
$$

26.13. $\uparrow$ Let $x_{1}, x_{2}, \ldots$ be the points of positive $\mu$-measure. By the following prove that

$$
\begin{equation*}
\lim _{T \rightarrow \infty} \frac{1}{2 T} \int_{-T}^{T}|\varphi(t)|^{2} d t=\sum_{k}\left(\mu\left\{x_{k}\right\}\right)^{2} \tag{26.31}
\end{equation*}
$$

Let $X$ and $Y$ be independent and have characteristic function $\varphi$.
(a) Show by (26.30) that the left side of (26.31) is $P[X-Y=0]$.
(b) Show (Theorem 20.3) that $P[X-Y=0]=\int_{-\infty}^{\infty} P[X=y] \mu(d y)= \sum_{k}\left(\mu\left\{x_{k}\right\}\right)^{2}$.
26.14. $\uparrow$ Show that $\mu$ has no point masses if $\varphi^{2}(t)$ is integrable.
26.15. (a) Show that if $\left\{\mu_{n}\right\}$ is tight, then the characteristic functions $\varphi_{n}(t)$ are uniformly equicontinuous (for each $\epsilon$ there is a $\delta$ such that $|s-t|<\delta$ implies that $\left|\varphi_{n}(s)-\varphi_{n}(t)\right|<\epsilon$ for all $n$ ).
(b) Show that $\mu_{n} \Rightarrow \mu$ implies that $\varphi_{n}(t) \rightarrow \varphi(t)$ uniformly on bounded sets.
(c) Show that the convergence in part (b) need not be uniform over the entire line.
26.16. 14.5 26.15 † For distribution functions $F$ and $G$, define $d^{\prime}(F, G)= \sup _{t}|\varphi(t)-\psi(t)| /(1+|t|)$, where $\varphi$ and $\psi$ are the corresponding characteristic functions. Show that this is a metric and equivalent to the Lévy metric.
26.17. $25.16 \uparrow$ A real function $f$ has mean value

$$
\begin{equation*}
M[f(x)]=\lim _{T \rightarrow \infty} \frac{1}{2 T} \int_{-T}^{T} f(x) d x \tag{26.32}
\end{equation*}
$$

provided that $f$ is integrable over each $[-T, T]$ and the limit exists.
(a) Show that, if $f$ is bounded and $e^{i t f(x)}$ has a mean value for each $t$, then $f$ has a distribution in the sense of (25.18).
(b) Show that

$$
M\left[e^{i t x}\right]= \begin{cases}1 & \text { if } t=0  \tag{26.33}\\ 0 & \text { if } t \neq 0\end{cases}
$$

Of course, $f(x)=x$ has no distribution.
21 8. Suppose that $X$ is irrational with probability 1 . Let $\mu_{n}$ be the distribution of the fractional part $\{n X\}$. Use the continuity theorem and Theorem 25.1 to show that $n^{-1} \sum_{k=1}^{n} \mu_{k}$ converges weakly to the uniform distribution on $[0,1]$.

26 ? 25.13 ↑ The uniqueness theorem for characteristic functions can be derived from the Weierstrass approximation theorem. Fill in the details of the following argument. Let $\mu$ and $\nu$ be probability measures on the line. For continuous $f$ with bounded support choose $a$ so that $\mu(-a, a)$ and $\nu(-a, a)$ are nearly 1 and $f$ vanishes outside ( $-a, a$ ). Let $g$ be periodic and agree with $f$ in ( $-a, a$ ), and by the Weierstrass theorem uniformly approximate $g(x)$ by a trigonometric sum $p(x)=\sum_{k=1}^{N} a_{k} e^{i i_{k} x}$. If $\mu$ and $\nu$ have the same characteristic function, then $\int f d \mu \approx \int g d \mu \approx \int p d \mu=\int p d \nu \approx \int g d \nu \approx \int f d \nu$.
26.20. Use the continuity theorem to prove the result in Example 25.2 concerning the convergence of the binomial distribution to the Poisson.
26.21. According to Example 25.8, if $X_{n} \Rightarrow X, a_{n} \rightarrow a$, and $b_{n} \rightarrow b$, then $a_{n} X_{n}+b_{n} \Rightarrow a X+b$. Prove this by means of characteristic functions.
26.22. $26.126 .15 \uparrow$ According to Theorem 14.2, if $X_{n} \Rightarrow X$ and $a_{n} X_{n}+b_{n} \Rightarrow Y$, where $a_{n}>0$ and the distributions of $X$ and $Y$ are nondegenerate, then $a_{n} \rightarrow a>0, b_{n} \rightarrow b$, and $a X+b$ and $Y$ have the same distribution. Prove this by characteristic functions. Let $\varphi_{n}, \varphi, \psi$ be the characteristic functions of $X_{n}, X, Y$.
(a) Show that $\left|\varphi_{n}\left(a_{n} t\right)\right| \rightarrow|\psi(t)|$ uniformly on bounded sets and hence that $a_{n}$ cannot converge to 0 along a subsequence.
(b) Interchange the roles of $\varphi$ and $\psi$ and show that $a_{n}$ cannot converge to infinity along a subsequence.
(c) Show that $a_{n}$ converges to some $a>0$.
(d) Show that $e^{i t b_{n}} \rightarrow \psi(t) / \varphi(a t)$ in a neighborhood of 0 and hence that $\int_{0}^{1} e^{i s b_{n}} d s \rightharpoonup \int_{0}^{1}(\psi(s) / \varphi(a s)) d s$. Conclude that $b_{n}$ converges.
26.23. Prove a continuity theorem for moment generating functions as defined by (22.4) for probability measures on $[0, \infty)$. For uniqueness, see Theorem 22.2; the analogue of (26.22) is

$$
\frac{2}{u} \int_{0}^{u}(1-M(s)) d s \geq \mu\left(\frac{2}{u}, \infty\right)
$$

26.24. $26.4 \uparrow$ Show by example that the values $\varphi(m)$ of the characteristic function at integer arguments may not determine the distribution if it is not supported by $[0,2 \pi]$.
26.25. If $f$ is integrable over $[0,2 \pi]$, define its Fourier coefficients as $\int_{0}^{2 \pi} e^{i m x} f(x) d x$. Show that these coefficients uniquely determine $f$ up to sets of measure 0 .
26.26. 19.8 26.25↑ Show that the trigonometric system (19.17) is complete.
26.27. The Fourier-series analogue of the condition (26.19) is $\sum_{m}\left|c_{m}\right|<\infty$. Show that it implies $\mu$ has density $f(x)=(2 \pi)^{-1} \sum_{m} c_{m} e^{-i m x}$ on $[0,2 \pi]$, where $f$ is continuous and $f(0)=f(2 \pi)$. This is the analogue of the inversion formula (26.20).
26.28. ↑ Show that

$$
(\pi-x)^{2}=\frac{\pi^{2}}{3}+4 \sum_{m=1}^{\infty} \frac{\cos m x}{m^{2}}, \quad 0 \leq x \leq 2 \pi
$$

Show that $\sum_{m=1}^{\infty} 1 / m^{2}=\pi^{2} / 6$ and $\sum_{m=1}^{\infty}(-1)^{m+1} / m^{2}=\pi^{2} / 12$.
26.29. (a) Suppose $X^{\prime}$ and $X^{\prime \prime}$ are independent random variables with values in $[0,2 \pi]$, and let $X$ be $X^{\prime}+X^{\prime \prime}$ reduced module $2 \pi$. Show that the corresponding Fourier coefficients satisfy $c_{m}=c_{m}^{\prime} c_{m}^{\prime \prime}$.
(b) Show that if one or the other of $X^{\prime}$ and $X^{\prime \prime}$ is uniformly distributed, so is $X$.
26.30. $26.25 \uparrow$ The theory of Fourier series can be carried over from $[0,2 \pi]$ to the unit circle in the complex plane with normalized circular Lebesgue measure $P$. The circular functions $e^{i m x}$ become the powers $\omega^{m}$, and an integrable $f$ is determined to within sets of measure 0 by its Fourier coefficients $c_{m}= \int_{\Omega} \omega^{m} f(\omega) P(d \omega)$. Suppose that $A$ is invariant under the rotation through the angle arg $c$ (Example 24.4). Find a relation on the Fourier coefficients of $I_{A}$, and conclude that the rotation is ergodic if $c$ is not a root of unity. Compare the proof on p. 316.

## SECTION 27. THE CENTRAL LIMIT THEOREM

## Identically Distributed Summands

The central limit theorem says roughly that the sum of many independent random variables will be approximately normally distributed if each summand has high probability of being small. Theorem 27.1, the Lindeberg-Lévy theorem, will give an idea of the techniques and hypotheses needed for the more general results that follow.

Throughout, $N$ will denote a random variable with the standard normal distribution:

$$
\begin{equation*}
P[N \in A]=\frac{1}{\sqrt{2 \pi}} \int_{A} e^{-x^{2} / 2} d x \tag{27.1}
\end{equation*}
$$

Theorem 27.1. Suppose that $\left\{X_{n}\right\}$ is an independent sequence of random variables having the same distribution with mean $c$ and finite positive variance $\sigma^{2}$. If $S_{n}=X_{1}+\cdots+X_{n}$, then

$$
\begin{equation*}
\frac{S_{n}-n c}{\sigma \sqrt{n}} \Rightarrow N . \tag{27.2}
\end{equation*}
$$

By the argument in Example 25.7, (27.2) implies that $n^{-1} S_{n} \Rightarrow c$. The central limit theorem and the strong law of large numbers thus refine the weak law of large numbers in different directions.

Since Theorem 27.1 is a special case of Theorem 27.2, no proof is really necessary. To understand the methods of this section, however, consider the special case in which $X_{k}$ takes the values $\pm 1$ with probability $1 / 2$ each. Each $X_{k}$ then has characteristic function $\varphi(t)=\frac{1}{2} e^{i t}+\frac{1}{2} e^{-i t}=\cos t$. By (26.12) and (26.13), $S_{n} / \sqrt{n}$ has characteristic function $\varphi^{n}(t / \sqrt{n})$, and so, by the continuity theorem, the problem is to show that $\cos ^{n} t / \sqrt{n} \rightarrow E\left[e^{i t N}\right]= e^{-t^{2} / 2}$, or that $n \log \cos t / \sqrt{n}$ (well defined for large $n$ ) goes to $-\frac{1}{2} t^{2}$. But this follows by 1'Hopital's rule: Let $t / \sqrt{n}=x$ go continuously to 0 .

For a proof closer in spirit to those that follow, note that (26.5) for $n=2$ gives $\left|\varphi(t)-\left(1-\frac{1}{2} t^{2}\right)\right| \leq|t|^{3}\left(\left|X_{k}\right| \leq 1\right)$. Therefore,

$$
\begin{equation*}
\left|\varphi\left(\frac{t}{\sqrt{n}}\right)-\left(1-\frac{t^{2}}{2 n}\right)\right| \leq \frac{|t|^{3}}{n^{3 / 2}} . \tag{27.3}
\end{equation*}
$$

Rather than take logarithms, use (27.5) below, which gives ( $n$ large)

$$
\begin{equation*}
\left.\left\lvert\, \varphi^{n}\left(\frac{t}{\sqrt{n}}\right)-\left(1-\frac{t^{2}}{2 n}\right)\right.\right)^{n} \left\lvert\, \leq \frac{|t|^{3}}{\sqrt{n}} \rightarrow 0 .\right. \tag{27.4}
\end{equation*}
$$

But of course $\left(1-t^{2} / 2 n\right)^{n} \rightarrow e^{-t^{2} / 2}$, which completes the proof for this special case.

Logarithms for complex arguments can be avoided by use of the following simple lemma.

Lemma 1. Let $z_{1}, \ldots, z_{m}$ and $w_{1}, \ldots, w_{m}$ be complex numbers of modulus at most 1 ; then

$$
\begin{equation*}
\left|z_{1} \cdots z_{m}-w_{1} \cdots w_{m}\right| \leq \sum_{k=1}^{m}\left|z_{k}-w_{k}\right| . \tag{27.5}
\end{equation*}
$$

Proof. This follows by induction from $z_{1} \cdots z_{m}-w_{1} \cdots w_{m}= \left(z_{1}-w_{1}\right)\left(z_{2} \cdots z_{m}\right)+w_{1}\left(z_{2} \cdots z_{m}-w_{2} \cdots w_{m}\right)$. $\square$

Two illustrations of Theorem 27.1:

Example 27.1. In the classical De Moivre-Laplace theorem, $X_{n}$ takes the values 1 and 0 with probabilities $p$ and $q=1-p$, so that $c=p$, and $\sigma^{2}=p q$. Here $S_{n}$ is the number of successes in $n$ Bernoulli trials, and ( $S_{n}$ $n p) / \sqrt{n p q} \Rightarrow N$. $\square$

Example 27.2. Suppose that one wants to estimate the parameter $\alpha$ of an exponential distribution (20.10) on the basis of an independent sample $X_{1}, \ldots, X_{n}$. As $n \rightarrow \infty$ the sample mean $\bar{X}_{n}=n^{-1} \sum_{k=1}^{n} X_{k}$ converges in probability to the mean $1 / \alpha$ of the distribution, and hence it is natural to use $1 / \bar{X}_{n}$ to estimate $\alpha$ itself. How good is the estimate? The variance of the exponential distribution being $1 / \alpha^{2}$ (Example 21.3), $\alpha \sqrt{n}\left(\bar{X}_{n}-1 / \alpha\right) \Rightarrow N$ by the Lindeberg-Lévy theorem. Thus $\bar{X}_{n}$ is approximately normally distributed with mean $1 / \alpha$ and standard deviation $1 / \alpha \sqrt{n}$.

By Skorohod's Theorem 25.6 there exist on a single probability space random variables $\bar{Y}_{n}$ and $Y$ having the respective distributions of $\bar{X}_{n}$ and $N$ and satisfying $\alpha \sqrt{n}\left(\bar{Y}_{n}(\omega)-1 / \alpha\right) \rightarrow Y(\omega)$ for each $\omega$. Now $\bar{Y}_{n}(\omega) \rightarrow 1 / \alpha$ and $\alpha^{-1} \sqrt{n}\left(\bar{Y}_{n}(\omega)^{-1}-\alpha\right)=\alpha \sqrt{n}\left(\alpha^{-1}-\bar{Y}_{n}(\omega)\right) / \alpha \bar{Y}_{n}(\omega) \rightarrow-Y(\omega)$. Since $-Y$ has
the distribution of $N$ and $\bar{Y}_{n}$ has the distribution of $\bar{X}_{n}$, it follows that

$$
\frac{\sqrt{n}}{\alpha}\left(\frac{1}{\bar{X}_{n}}-\alpha\right) \Rightarrow N ;
$$

thus $1 / \bar{X}_{n}$ is approximately normally distributed with mean $\alpha$ and standard deviation $\alpha / \sqrt{n}$. In effect, $1 / \bar{X}_{n}$ has been studied through the local linear approximation to the function $1 / x$. This is called the delta method. $\square$

## The Lindeberg and Lyapounov Theorems

Suppose that for each $n$

$$
\begin{equation*}
X_{n 1}, \ldots, X_{n r_{n}} \tag{27.6}
\end{equation*}
$$

are independent; the probability space for the sequence may change with $n$. Such a collection is called a triangular array of random variables. Put $S_{n}=X_{n 1}+\cdots+X_{n r_{n}}$. Theorem 27.1 covers the special case in which $r_{n}=n$ and $X_{n k}=X_{k}$. Example 6.3 on the number of cycles in a random permutation shows that the idea of triangular array is natural and useful. The central limit theorem for triangular arrays will be applied in Example 27.3 to the same array.

To establish the asymptotic normality of $S_{n}$ by means of the ideas in the preceding proof requires expanding the characteristic function of each $X_{n k}$ to second-order terms and estimating the remainder. Suppose that the means are 0 and the variances are finite; write

$$
\begin{equation*}
E\left[X_{n k}\right]=0, \quad \sigma_{n k}^{2}=E\left[X_{n k}^{2}\right], \quad s_{n}^{2}=\sum_{k=1}^{r_{n}} \sigma_{n k}^{2} . \tag{27.7}
\end{equation*}
$$

The assumption that $X_{n k}$ has mean 0 entails no loss of generality. Assume $s_{n}^{2}>0$ for large $n$. A successful remainder estimate is possible under the assumption of the Lindeberg condition:

$$
\begin{equation*}
\lim _{n \rightarrow \infty} \sum_{k=1}^{r_{n}} \frac{1}{s_{n}^{2}} \int_{\left|X_{n k}\right| \geq \epsilon s_{n}} X_{n k}^{2} d P=0 \tag{27.8}
\end{equation*}
$$

for $\epsilon>0$.

Theorem 27.2. Suppose that for each $n$ the sequence $X_{n 1}, \ldots, X_{n r_{n}}$ is independent and satisfies (27.7). If (27.8) holds for all positive $\epsilon$, then $S_{n} / s_{n} \Rightarrow N$.

This theorem contains the preceding one: Suppose that $X_{n k}=X_{k}$ and $r_{n}=n$, where the entire sequence $\left\{X_{k}\right\}$ is independent and the $X_{k}$ all have the same distribution with mean 0 and variance $\sigma^{2}$. Then (27.8) reduces to

$$
\begin{equation*}
\lim _{n \rightarrow \infty} \frac{1}{\sigma^{2}} \int_{\left|X_{1}\right| \geq \epsilon \sigma \sqrt{n}} X_{1}^{2} d P=0 \tag{27.9}
\end{equation*}
$$

which holds because $\left[\left|X_{1}\right| \geq \epsilon \sigma \sqrt{n}\right] \downarrow \varnothing$ as $n \uparrow \infty$.
Proof of the Theorem. Replacing $X_{n k}$ by $X_{n k} / s_{n}$ shows that there is no loss of generality in assuming

$$
\begin{equation*}
s_{n}^{2}=\sum_{k=1}^{r_{n}} \sigma_{n k}^{2}=1 \tag{27.10}
\end{equation*}
$$

By ( $26.4_{2}$ ),

$$
\left|e^{i t x}-\left(1+i t x-\frac{1}{2} t^{2} x^{2}\right)\right| \leq \min \left\{|t x|^{2},|t x|^{3}\right\} .
$$

Therefore, the characteristic function $\varphi_{n k}$ of $X_{n k}$ satisfies

$$
\begin{equation*}
\left|\varphi_{n k}(t)-\left(1-\frac{1}{2} t^{2} \sigma_{n k}^{2}\right)\right| \leq E\left[\min \left\{\left|t X_{n k}\right|^{2},\left|t X_{n k}\right|^{3}\right\}\right] . \tag{27.11}
\end{equation*}
$$

Note that the expected value is finite.
For positive $\epsilon$ the right side of (27.11) is at most

$$
\int_{\left|X_{n k}\right|<\epsilon}\left|t X_{n k}\right|^{3} d P+\int_{\left|X_{n k}\right| \geq \epsilon}\left|t X_{n k}\right|^{2} d P \leq \epsilon|t|^{3} \sigma_{n k}^{2}+t^{2} \int_{\left|X_{n k}\right| \geq \epsilon} X_{n k}^{2} d P
$$

Since the $\sigma_{n k}^{2}$ add to 1 and $\epsilon$ is arbitrary, it follows by the Lindeberg condition that

$$
\begin{equation*}
\sum_{k=1}^{r_{n}}\left|\varphi_{n k}(t)-\left(1-\frac{1}{2} t^{2} \sigma_{n k}^{2}\right)\right| \rightarrow 0 \tag{27.12}
\end{equation*}
$$

for each fixed $t$. The objective now is to show that

$$
\begin{align*}
\prod_{k=1}^{r_{n}} \varphi_{n k}(t) & =\prod_{k=1}^{r_{n}}\left(1-\frac{1}{2} t^{2} \sigma_{n k}^{2}\right)+o(1)  \tag{27.13}\\
& =\prod_{k=1}^{r_{n}} e^{-t^{2} \sigma_{n k}^{2} / 2}+o(1)=e^{-t^{2} / 2}+o(1)
\end{align*}
$$

For $\epsilon$ positive,

$$
\sigma_{n k}^{2} \leq \epsilon^{2}+\int_{\left|X_{n k}\right| \geq \epsilon} X_{n k}^{2} d P
$$

and so it follows by the Lindeberg condition (recall that $s_{n}$ is now 1) that

$$
\begin{equation*}
\max _{1 \leq k \leq r_{n}} \sigma_{n k}^{2} \rightarrow 0 . \tag{27.14}
\end{equation*}
$$

For large enough $n, 1-\frac{1}{2} t^{2} \sigma_{n k}^{2}$ are all between 0 and 1 , and by (27.5), $\Pi_{k=1}^{r_{n}} \varphi_{n k}(t)$ and $\Pi_{k=1}^{r_{n}}\left(1-\frac{1}{2} t^{2} \sigma_{n k}^{2}\right)$ differ by at most the sum in (27.12). This establishes the first of the asymptotic relations in (27.13).

Now (27.5) also implies that

$$
\left|\prod_{k=1}^{r_{n}} e^{-t^{2} \sigma_{n k}^{2} / 2}-\prod_{k=1}^{r_{n}}\left(1-\frac{1}{2} t^{2} \sigma_{n k}^{2}\right)\right| \leq \sum_{k=1}^{r_{n}}\left|e^{-t^{2} \sigma_{n k}^{2} / 2}-1+\frac{1}{2} t^{2} \sigma_{n k}^{2}\right|
$$

For complex $z$,

$$
\begin{equation*}
\left|e^{z}-1-z\right| \leq|z|^{2} \sum_{k=2}^{\infty} \frac{|z|^{k-2}}{k!} \leq|z|^{2} e^{|z|} . \tag{27.15}
\end{equation*}
$$

Using this in the right member of the preceding inequality bounds it by $t^{4} e^{t^{2}} \sum_{k=1}^{r_{n}} \sigma_{n k}^{4}$; by (27.14) and (27.10), this sum goes to 0 , from which the second equality in (27.13) follows.

It is shown in the next section (Example 28.4) that if the independent array $\left\{X_{n k}\right\}$ satisfies (27.7), and if $S_{n} / s_{n} \Rightarrow N$, then the Lindeberg condition holds, provided $\max _{k \leq r_{n}} \sigma_{n k}^{2} / s_{n}^{2} \rightarrow 0$. But this converse fails without the extra condition: Take $X_{n k}= X_{k}$ normal with mean 0 and variance $\sigma_{n k}^{2}=\sigma_{k}^{2}$, where $\sigma_{1}^{2}=1$ and $\sigma_{n}^{2}=n s_{n-1}^{2}$.

Example 27.3. Goncharov's theorem. Consider the sum $S_{n}=\sum_{k=1}^{n} X_{n k}$ in Example 6.3. Here $S_{n}$ is the number of cycles in a random permutation on $n$ letters, the $X_{n k}$ are independent, and

$$
P\left[X_{n k}=1\right]=\frac{1}{n-k+1}=1-P\left[X_{n k}=0\right]
$$

The mean $m_{n}$ is $L_{n}=\sum_{k=1}^{n} k^{-1}$, and the variance $s_{n}^{2}$ is $L_{n}+O(1)$. Lindeberg's condition for $X_{n k}-(n-k+1)^{-1}$ is easily verified because these random variables are bounded by 1 .

The theorem gives $\left(S_{n}-L_{n}\right) / s_{n} \Rightarrow N$. Now, in fact, $L_{n}=\log n+O(1)$, and so (see Example 25.8) the sum can be renormalized: $\left(S_{n}-\log n\right) / \sqrt{\log n} \Rightarrow N$. $\square$

Suppose that the $\left|X_{n k}\right|^{2+\delta}$ are integrable for some positive $\delta$ and that Lyapounov's condition

$$
\begin{equation*}
\lim _{n} \sum_{k=1}^{r_{n}} \frac{1}{s_{n}^{2+\delta}} E\left[\left|X_{n k}\right|^{2+\delta}\right]=0 \tag{27.16}
\end{equation*}
$$

holds. Then Lindeberg's condition follows because the sum in (27.8) is bounded by

$$
\sum_{k=1}^{r_{n}} \frac{1}{s_{n}^{2}} \int_{\left|X_{n k}\right| \geq \epsilon s_{n}} \frac{\left|X_{n k}\right|^{2+\delta}}{\epsilon^{\delta} s_{n}^{\delta}} d P \leq \frac{1}{\epsilon^{\delta}} \sum_{k=1}^{r_{n}} \frac{1}{s_{n}^{2+\delta}} E\left[\left|X_{n k}\right|^{2+\delta}\right] .
$$

Hence Theorem 27.2 has this corollary:

Theorem 27.3. Suppose that for each $n$ the sequence $X_{n 1}, \ldots, X_{n r_{n}}$ is independent and satisfies (27.7). If (27.16) holds for some positive $\delta$, then $S_{n} / s_{n} \Rightarrow N$.

Example 27.4. Suppose that $X_{1}, X_{2}, \ldots$ are independent and uniformly bounded and have mean 0 . If the variance $s_{n}^{2}$ of $S_{n}=X_{1}+\cdots+X_{n}$ goes to $\infty$, then $S_{n} / s_{n} \Rightarrow N$ : If $K$ bounds the $X_{n}$, then

$$
\sum_{k=1}^{n} \frac{1}{s_{n}^{3}} E\left[\left|X_{k}\right|^{3}\right] \leq \sum_{k=1}^{n} \frac{K E\left[X_{k}^{2}\right]}{s_{n}^{3}}=\frac{K}{s_{n}} \rightarrow 0,
$$

which is Lyapounov's condition for $\delta=1$. $\square$

Example 27.5. Elements are drawn from a population of size $n$, randomly and with replacement, until the number of distinct elements that have been sampled is $r_{n}$, where $1 \leq r_{n} \leq n$. Let $S_{n}$ be the drawing on which this first happens. A coupon collector requires $S_{n}$ purchases to fill out a given portion of the complete set. Suppose that $r_{n}$ varies with $n$ in such a way that $r_{n} / n \rightarrow \rho, 0<\rho<1$. What is the approximate distribution of $S_{n}$ ?

Let $Y_{p}$ be the trial on which success first occurs in a Bernoulli sequence with probability $p$ for success: $P\left[Y_{p}=k\right]=q^{k-1} p$, where $q=1-p$. Since the moment generating function is $p e^{s} /\left(1-q e^{s}\right), E\left[Y_{p}\right]=p^{-1}$ and $\operatorname{Var}\left[Y_{p}\right]=q p^{-2}$. If $k-1$ distinct items have thus far entered the sample, the waiting time until the next distinct one enters is distributed as $Y_{p}$ as $p=(n-k+1) / n$. Therefore, $S_{n}$ can be represented as $\sum_{k=1}^{r_{n}} X_{n k}$ for independent summands $X_{n k}$ distributed as $Y_{(n-k+1) / n}$. Since $r_{n} \sim \rho n$, the mean and variance above give

$$
m_{n}=E\left[S_{n}\right]=\sum_{k=1}^{r_{n}}\left(1-\frac{k-1}{n}\right)^{-1} \sim n \int_{0}^{p} \frac{d x}{1-x}
$$

and

$$
s_{n}^{2}=\sum_{k=1}^{r_{n}} \frac{k-1}{n}\left(1-\frac{k-1}{n}\right)^{-2} \sim n \int_{0}^{p} \frac{x d x}{(1-x)^{2}}
$$

Lyapou nov's theorem applies for $\delta=2$, and to check (27.16) requires the inequality

$$
\begin{equation*}
E\left[\left(Y_{p}-p^{-1}\right)^{4}\right] \leq K p^{-4} \tag{27.17}
\end{equation*}
$$

for some $K$ independent of $p$. A calculation with the moment generating function shows that the left side is in fact $q p^{-4}\left(1+7 q+q^{2}\right)$. It now follows that

$$
\begin{align*}
\sum_{k=1}^{r_{n}} E\left[\left(X_{n k}-\frac{n}{n-k+1}\right)^{4}\right] & \leq K \sum_{k=1}^{r_{n}}\left(1-\frac{k-1}{n}\right)^{-4}  \tag{27.18}\\
& \sim K n \int_{0}^{\rho} \frac{d x}{(1-x)^{4}}
\end{align*}
$$

Since (27.16) follows from this, Theorem 27.3 applies: $\left(S_{n}-m_{n}\right) / s_{n} \Rightarrow N$. $\square$

## Dependent Variables*

The assumption of independence in the preceding theorems can be relaxed in various ways. Here a central limit theorem will be proved for sequences in which random variables far apart from one another are nearly independent in a sense to be defined.

For a sequence $X_{1}, X_{2}, \ldots$ of random variables, let $\alpha_{n}$ be a number such that

$$
\begin{equation*}
|P(A \cap B)-P(A) P(B)| \leq \alpha_{n} \tag{27.19}
\end{equation*}
$$

for $A \in \sigma\left(X_{1}, \ldots, X_{k}\right), B \in \sigma\left(X_{k+n}, X_{k+n+1}, \ldots\right)$, and $k \geq 1, n \geq 1$. Suppose that $\alpha_{n} \rightarrow 0$, the idea being that $X_{k}$ and $X_{k+n}$ are then approximately independent for large $n$. In this case the sequence $\left\{X_{n}\right\}$ is said to be $\alpha$-mixing. If the distribution of the random vector ( $X_{n}, X_{n+1}, \ldots, X_{n+j}$ ) does not depend on $n$, the sequence is said to be stationary.

Example 27.6. Let $\left\{Y_{n}\right\}$ be a Markov chain with finite state space and positive transition probabilities $p_{i j}$, and suppose that $X_{n}=f\left(Y_{n}\right)$, where $f$ is some real function on the state space. If the initial probabilities $p_{i}$ are the stationary ones (see Theorem 8.9), then clearly $\left\{X_{n}\right\}$ is stationary. Moreover, by (8.42), $\left|p_{i j}^{(n)}-p_{j}\right| \leq \rho^{n}$, where $\rho<1$. By (8.11), $P\left[Y_{1}=i_{1}, \ldots, Y_{k}=i_{k}\right.$, $\left.Y_{k+n}=j_{0}, \ldots, Y_{k+n+l}=j_{l}\right]=p_{i_{1}} p_{i_{1} i_{2}} \cdots p_{i_{k-1} i_{k}} p_{i_{k} j_{0}}^{(n)} p_{j_{0} j_{1}} \cdots p_{j_{1-1} j_{l}}$, which differs

[^1]from $P\left[Y_{1}=i_{1}, \ldots, Y_{k}=i_{k}\right] P\left[Y_{k+n}=j_{0}, \ldots, Y_{k+n+l}=j_{l}\right]$ by at most $p_{i_{1}} p_{i_{1} i_{2}} \ldots p_{i_{k-1} i_{k}} \rho^{n} p_{j_{0} j_{1}} \ldots p_{j_{1-1} i_{1}}$. It follows by addition that, if $s$ is the number of states, then for sets of the form $A=\left[\left(Y_{1}, \ldots, Y_{k}\right) \in H\right]$ and $B= \left[\left(Y_{k+n}, \ldots, Y_{k+n+l}\right) \in H^{\prime}\right]$, (27.19) holds with $\alpha_{n}=s \rho^{n}$. These sets (for $k$ and $n$ fixed) form fields generating $\sigma$-fields which contain $\sigma\left(X_{1}, \ldots, X_{k}\right)$ and $\sigma\left(X_{k+n}, X_{k+n+1}, \ldots\right)$, respectively. For fixed $A$ the set of $B$ satisfying (27.19) is a monotone class, and similarly if $A$ and $B$ are interchanged. It follows by the monotone class theorem (Theorem 3.4) that $\left\{X_{n}\right\}$ is $\alpha$-mixing with $\alpha_{n}=s \rho^{n}$. $\square$

The sequence is $m$-dependent if ( $X_{1}, \ldots, X_{k}$ ) and ( $X_{k+n}, \ldots, X_{k+n+l}$ ) are independent whenever $n>m$. In this case the sequence is $\alpha$-mixing with $\alpha_{n}=0$ for $n>m$. In this terminology an independent sequence is 0 -dependent.

Example 27.7. Let $Y_{1}, Y_{2}, \ldots$ be independent and identically distributed, and put $X_{n}=f\left(Y_{n}, \ldots, Y_{n+m}\right)$ for a real function $f$ on $R^{m+1}$. Then $\left\{X_{n}\right\}$ is stationary and $m$-dependent. $\square$

Theorem 27.4. Suppose that $X_{1}, X_{2}, \ldots$ is stationary and $\alpha$-mixing with $\alpha_{n}=O\left(n^{-5}\right)$ and that $E\left[X_{n}\right]=0$ and $E\left[X_{n}^{12}\right]<\infty$. If $S_{n}=X_{1}+\cdots \div X_{n}$, then

$$
\begin{equation*}
n^{-1} \operatorname{Var}\left[S_{n}\right] \rightarrow \sigma^{2}=E\left[X_{1}^{2}\right]+2 \sum_{k=1}^{\infty} E\left[X_{1} X_{1+k}\right], \tag{27.20}
\end{equation*}
$$

where the series converges absolutely. If $\sigma>0$, then $S_{n} / \sigma \sqrt{n} \Rightarrow N$.
The conditions $\alpha_{n}=O\left(n^{-5}\right)$ and $E\left[X_{n}^{12}\right]<\infty$ are stronger than necessary; they are imposed to avoid technical complications in the proof. The idea of the proof, which goes back to Markov, is this: Split the sum $X_{1}+\cdots+X_{n}$ into alternate blocks of length $b_{n}$ (the big blocks) and $l_{n}$ (the little blocks). Namely, let

$$
\begin{equation*}
U_{n i}=X_{(i-1)\left(b_{n}+l_{n}\right)+1}+\cdots+X_{(i-1)\left(b_{n}+l_{n}\right)+b_{n}}, \quad 1 \leq i \leq r_{n}, \tag{27.21}
\end{equation*}
$$

where $r_{n}$ is the largest integer $i$ for which $(i-1)\left(b_{n}+l_{n}\right)+b_{n}<n$. Further, let

$$
\begin{align*}
V_{n i} & =X_{(i-1)\left(b_{n}+l_{n}\right)+b_{n}+1}+\cdots+X_{i\left(b_{n}+l_{n}\right)}, \quad 1 \leq i<r_{n}, \\
V_{n r_{n}} & =X_{\left(r_{n}-1\right)\left(b_{n}+l_{n}\right)+b_{n}+1}+\cdots+X_{n} . \tag{27.22}
\end{align*}
$$

Then $S_{n}=\sum_{i=1}^{r_{n}} U_{n i}+\sum_{i=1}^{r_{n}} V_{n i}$, and the technique will be to choose the $l_{n}$ small enough that $\sum_{i} V_{n i}$ is small in comparison with $\sum_{i} U_{n i}$ but large enough
that the $U_{n i}$ are nearly independent, so that Lyapounov's theorem can be adapted to prove $\sum_{i} U_{n i}$ asymptotically normal.

Lemma 2. If $Y$ is measurable $\sigma\left(X_{1}, \ldots, X_{k}\right)$ and bounded by $C$, and if $Z$ is measurable $\sigma\left(X_{k+n}, X_{k+n+1}, \ldots\right)$ and bounded by $D$, then

$$
\begin{equation*}
|E[Y Z]-E[Y] E[Z]| \leq 4 C D \alpha_{n} . \tag{27.23}
\end{equation*}
$$

Proof. It is no restriction to take $C=D=1$ and (by the usual approximation method) to take $Y=\sum_{i} y_{i} I_{A_{i}}$ and $Z=\sum_{j} z_{j} I_{B_{j}}$ simple ( $\left|y_{i}\right|,\left|z_{j}\right| \leq 1$ ). If $d_{i j}=P\left(A_{i} \cap B_{j}\right)-P\left(A_{i}\right) P\left(B_{j}\right)$, the left side of (27.23) is $\left|\sum_{i j} y_{i} z_{j} d_{i j}\right|$. Take $\xi_{i}$ to be +1 or -1 as $\sum_{j} z_{j} d_{i j}$ is positive or not; now take $\eta_{j}$ to be +1 or -1 as $\sum_{i} \xi_{i} d_{i j}$ is positive or not. Then

$$
\begin{aligned}
\left|\sum_{i, j} y_{i} z_{j} d_{i j}\right| & \leq \sum_{i}\left|\sum_{j} z_{j} d_{i j}\right|=\sum_{i} \xi_{i} \sum_{j} z_{j} d_{i j} \\
& \leq \sum_{j}\left|\sum_{i} \xi_{i} d_{i j}\right|=\sum_{j} \eta_{j} \sum_{i} \xi_{i} d_{i j}=\sum_{i, j} \xi_{i} \eta_{j} d_{i j} .
\end{aligned}
$$

Let $A^{(0)}\left[B^{(0)}\right]$ be the union of the $A_{i}\left[B_{j}\right]$ for which $\xi_{i}=+1\left[\eta_{j}=+1\right]$, and let $A^{(1)}=\Omega-A^{(0)}\left[B^{(1)}=\Omega-B^{(0)}\right]$. Then

$$
\sum_{i, j} \xi_{i} \eta_{j} d_{i j} \leq \sum_{u, \iota}\left|P\left(A^{(u)} \cap B^{(\iota)}\right)-P\left(A^{(u)}\right) P\left(B^{(\iota)}\right)\right| \leq 4 \alpha_{n}
$$

Lemma 3. If $Y$ is measurable $\sigma\left(X_{1}, \ldots, X_{k}\right)$ and $E\left[Y^{4}\right] \leq C$, and if $Z$ is measurable $\sigma\left(X_{k+n}, X_{k+n+1}, \ldots\right)$ and $E\left[Z^{4}\right] \leq D$, then

$$
\begin{equation*}
|E[Y Z]-E[Y] E[Z]| \leq 8(1+C+D) \alpha_{n}^{1 / 2} . \tag{27.24}
\end{equation*}
$$

Proof. Let $Y_{0}=Y I_{\left[\left|Y^{\prime}\right| \leq a\right]}, Y_{1}=Y I_{[|Y|>a]}, Z_{0}=Z I_{[|Z| \leq a]}, Z_{1}=Z I_{[|Z|>a]}$. By Lemma $2,\left|E\left[Y_{0} Z_{0}\right]-E\left[Y_{0}\right] E\left[Z_{0}\right]\right| \leq 4 a^{2} \alpha_{n}$. Further,

$$
\begin{aligned}
\left|E\left[Y_{0} Z_{1}\right]-E\left[Y_{0}\right] E\left[Z_{1}\right]\right| & \leq E\left[\left|Y_{0}-E\left[Y_{0}\right]\right| \cdot\left|Z_{1}-E\left[Z_{1}\right]\right|\right] \\
& \leq 2 a \cdot 2 E\left[\left|Z_{1}\right|\right] \leq 4 a E\left[\left|Z_{1}\right| \cdot\left|Z_{1} / a\right|^{3}\right] \leq 4 D / a^{2} .
\end{aligned}
$$

Similary, $\left|E\left[Y_{1} Z_{0}\right]-E\left[Y_{1}\right] E\left[Z_{0}\right]\right| \leq 4 C / a^{2}$. Finally,

$$
\begin{aligned}
\left|E\left[Y_{1} Z_{1}\right]-E\left[Y_{1}\right] E\left[Z_{1}\right]\right| & \leq \operatorname{Var}^{1 / 2}\left[Y_{1}\right] \operatorname{Var}^{1 / 2}\left[Z_{1}\right] \leq E^{1 / 2}\left[Y_{1}^{2}\right] E^{1 / 2}\left[Z_{1}^{2}\right] \\
& \leq E^{1 / 2}\left[Y_{1}^{4} / a^{2}\right] E^{1 / 2}\left[Z_{1}^{4} / a^{2}\right] \leq C^{1 / 2} D^{1 / 2} / a^{2}
\end{aligned}
$$

Adding these inequalities gives $4 a^{2} \alpha_{n}+4(C+D) a^{-2}+C^{1 / 2} D^{1 / 2} a^{-2}$ as a
bound for the left side of (27.24). Take $a=\alpha_{i 1}^{-1 / 4}$ and observe that $4+4(C+ D)+C^{1 / 2} D^{1 / 2} \leq 4+4\left(C^{1 / 2}+D^{1 / 2}\right)^{2} \leq 4+8(C+D)$. $\square$

Proof of Theorem 27.4. By Lemma 3, $\left|E\left[X_{1} X_{1+n}\right]\right| \leq 8(1+ \left.2 E\left[X_{1}^{4}\right]\right) \alpha_{n}^{1 / 2}=O\left(n^{-5 / 2}\right)$, and so the series in (27.20) converges absolutely. If $\rho_{k}=E\left[X_{1} X_{1+k}\right]$, then by stationary $E\left[S_{n}^{2}\right]=n \rho_{0}+2 \sum_{k=1}^{n-1}(n-k) \rho_{k}$ and therefore $\left|\sigma^{2}-n^{-1} E\left[S_{n}^{2}\right]\right| \leq 2 \sum_{k=n}^{\infty}\left|\rho_{k}\right|+2 n^{-1} \sum_{i=1}^{n-1} \sum_{k=i}^{\infty}\left|\rho_{k}\right|$; hence (27.20).

By stationarity again,

$$
E\left[S_{n}^{4}\right] \leq 4!n \sum\left|E\left[X_{1} X_{1+i} X_{1+i+j} X_{1+i+j+k}\right]\right|,
$$

where the indices in the sum are constrained by $i, j, k \geq 0$ and $i+j+k<n$. By Lemma 3 the summand is at most

$$
8\left(1+E\left[X_{1}^{4}\right]+E\left[X_{1+i}^{4} X_{1+i+j}^{4} X_{1+i+j+k}^{4}\right]\right) \alpha_{i}^{1 / 2},
$$

which is at most ${ }^{\dagger}$

$$
8\left(1+E\left[X_{1}^{4}\right]+E\left[X_{1}^{12}\right]\right) \alpha_{i}^{1 / 2}=K_{1} \alpha_{i}^{1 / 2} .
$$

Similarly, $K_{1} \alpha_{k}^{1 / 2}$ is a bound. Hence

$$
\begin{aligned}
E\left[S_{n}^{4}\right] & \leq 4!n^{2} \sum_{\substack{i, k \geq 0 \\
i+k<n}} K_{1} \min \left\{\alpha_{i}^{1 / 2}, \alpha_{k}^{1 / 2}\right\} \\
& \leq K_{2} n^{2} \sum_{0 \leq i \leq k} \alpha_{k}^{1 / 2}=K_{2} n^{2} \sum_{k=0}^{\infty}(k+1) \alpha_{k}^{1 / 2} .
\end{aligned}
$$

Since $\alpha_{k}=O\left(k^{-5}\right)$, the series here converges, and therefore

$$
\begin{equation*}
E\left[S_{n}^{4}\right] \leq K n^{2} \tag{27.25}
\end{equation*}
$$

for some $K$ independent of $n$.
Let $b_{n}=\left\lfloor n^{3 / 4}\right\rfloor$ and $l_{n}=\left\lfloor n^{1 / 4}\right\rfloor$. If $r_{n}$ is the largest integer $i$ such that $(i-1)\left(b_{n}+l_{n}\right)+b_{n}<n$, then

$$
\begin{equation*}
b_{n} \sim n^{3 / 4}, \quad l_{n} \sim n^{1 / 4}, \quad r_{n} \sim n^{1 / 4} . \tag{27.26}
\end{equation*}
$$

Consider the random variables (27.21) and (27.22). By (27.25), (27.26), and ${ }^{\dagger} E|X Y Z| \leq E^{1 / 3}|X|^{3} \cdot E^{2 / 3}|Y Z|^{3 / 2} \leq E^{1 / 3}|X|^{3} \cdot E^{1 / 3}|Y|^{3} \cdot E^{1 / 3}|Z|^{3}$.
stationarity,

$$
\begin{aligned}
P\left[\left|\frac{1}{\sigma \sqrt{n}} \sum_{i=1}^{r_{n}-1} V_{n i}\right| \geq \epsilon\right] & \leq \sum_{i=1}^{r_{n}-1} P\left[\left|V_{n i}\right| \geq \frac{\epsilon \sigma \sqrt{n}}{r_{n}}\right] \\
& \leq \frac{r_{n}^{4}}{\epsilon^{4} \sigma^{4} n^{2}} r_{n} K l_{n}^{2} \sim \frac{K}{\epsilon^{4} \sigma^{4} n^{1 / 4}} \rightarrow 0 ;
\end{aligned}
$$

(27.25) and (27.26) also give

$$
P\left[\frac{1}{\sigma \sqrt{n}}\left|V_{n r_{n}}\right| \geq \epsilon\right] \leq \frac{K\left(b_{n}+l_{n}\right)^{2}}{\epsilon^{4} \sigma^{4} n^{2}} \sim \frac{K}{\epsilon^{4} \sigma^{4} n^{1 / 2}} \rightarrow 0 .
$$

Therefore, $\sum_{i=1}^{r_{n}} V_{n i} / \sigma \sqrt{n} \Rightarrow 0$, and by Theorem 25.4 it suffices to prove that $\sum_{i=1}^{r_{n}} U_{n i} / \sigma \sqrt{n} \Rightarrow N$.

Let $U_{n i}^{\prime}, 1 \leq i \leq r_{n}$, be independent random variables having the distribution common to the $U_{n i}$. By Lemma 2 extended inductively the characteristic functions of $\sum_{i=1}^{r} U_{n i} / \sigma \sqrt{n}$ and of $\sum_{i=1}^{r} U_{n i}^{r} / \sigma \sqrt{n}$ differ by at most ${ }^{\dagger} 16 r_{n} \alpha_{I_{n}}$. Since $\alpha_{n}=O\left(n^{-5}\right)$, this difference is $O\left(n^{-1}\right)$ by (27.26).

The characteristic function of $\sum_{i^{n}=1}^{r_{n}} U_{n i} / \sigma \sqrt{n}$ will thus approach $e^{-t^{2} / 2}$ if that of $\sum_{n=1}^{r_{n}} U_{n i}^{\prime} / \sigma \sqrt{n}$ does. It therefore remains only to show that $\sum_{i=1}^{r_{n}} U_{n i}^{\prime} / \sigma \sqrt{n} \Rightarrow N$. Now $E\left[\left|U_{n i}^{\prime}\right|^{2}\right]=E\left[U_{n 1}^{2}\right] \sim b_{n} \sigma^{2}$ by (27.20). Further, $E\left[\left|U_{n i}^{\prime}\right|^{4}\right] \leq K b_{n}^{2}$ by (27.25). Lyapounov's condition (27.16) for $\delta=2$ therefore follows because

$$
\frac{r_{n} E\left[\left|U_{n 1}^{\prime}\right|^{4}\right]}{\left(r_{n} E\left[\left|U_{n 1}^{\prime}\right|^{2}\right]\right)^{2}} \sim \frac{E\left[\left|U_{n 1}^{\prime}\right|^{4}\right]}{r_{n} b_{n}^{2} \sigma^{4}} \leq \frac{K}{r_{n} \sigma^{4}} \rightarrow 0 .
$$ $\square$

Example 27.8. Let $\left\{Y_{n}\right\}$ be the stationary Markov process of Example 27.6. Let $f$ be a function on the state space, put $m=\sum_{i} p_{i} f(i)$, and define $X_{n}=f\left(Y_{n}\right)-m$. Then $\left\{X_{n}\right\}$ satisfies the conditions of Theorem 27.4. If $\beta_{i j}=\delta_{i j} p_{i}-p_{i} p_{j}+2 p_{i} \Sigma_{k=1}^{\infty}\left(p_{i j}^{(k)}-p_{j}\right)$, then the $\sigma^{2}$ in (27.20) is $\Sigma_{i j} \beta_{i j}(f(i)- m)(f(j)-m)$, and $\sum_{k=1}^{n} f\left(Y_{k}\right)$ is approximately normally distributed with mean $n m$ and standard deviation $\sigma \sqrt{n}$.

If $f(i)=\delta_{i_{0} i}$, then $\sum_{k=1}^{n} f\left(Y_{k}\right)$ is the number of passages through the state $i_{0}$ in the first $n$ steps of the process. In this case $m=p_{i_{0}}$ and $\sigma^{2}= p_{i_{0}}\left(1-p_{i_{0}}\right)+2 p_{i_{0}} \sum_{k=1}^{\infty}\left(p_{i_{0} i_{0}}^{(k)}-p_{i_{0}}\right)$. $\square$

Example 27.9. If the $X_{n}$ are stationary and $m$-dependent and have mean 0 , Theorem 27.4 applies and $\sigma^{2}=E\left[X_{1}^{2}\right]+2 \sum_{k=1}^{m} E\left[X_{1} X_{1+k}\right]$. Example 27.7 is a case in point. Taking $m=1$ and $f(x, y)=x-y$ in that example gives an instance where $\sigma^{2}=0$. $\square$

[^2]
## PROBLEMS

27.1. Prove Theorem 23.2 by means of characteristic functions. Hint: Use (27.5) to compare the characteristic function of $\sum_{k=1}^{r} Z_{n k}$ with $\exp \left[\sum_{k} p_{n k}\left(e^{i t}-1\right)\right]$.
27.2. If $\left\{X_{n}\right\}$ is independent and the $X_{n}$ all have the same distribution with finite first moment, then $n^{-1} S_{n} \rightarrow E\left[X_{1}\right]$ with probability 1 (Theorem 22.1), so that $n^{-1} S_{n} \Rightarrow E\left[X_{1}\right]$. Prove the latter fact by characteristic functions. Hint: Use (27.5).
27.3. For a Poisson variable $Y_{\lambda}$ with mean $\lambda$, show that $\left(Y_{\lambda}-\lambda\right) / \sqrt{\lambda} \Rightarrow N$ as $\lambda \rightarrow \infty$. Show that (22.3) fails for $t=1$.
27.4. Suppose that $\left|X_{n k}\right| \leq M_{n}$ with probability 1 and $M_{n} / s_{n} \rightarrow 0$ Verify Lyapounov's condition and then Lindeberg's condition.
27.5. Suppose that the random variables in any single row of the triangular array are identically distributed. To what do Lindeberg's and Lyapounov's conditions reduce?
27.6. Suppose that $Z_{1}, Z_{2}, \ldots$ are independent and identically distributed with mean 0 and variance 1 , and suppose that $X_{n k}=\sigma_{n k} Z_{k}$. Write down the Lindeberg condition and show that it holds if $\max _{k \leq r_{n}} \sigma_{n k}^{2}=o\left(\sum_{k=1}^{r_{n}} \sigma_{n k}^{2}\right)$.
27.7. Construct an example where Lindeberg's condition holds but Lyapounov's does not.
27.8. $22.9 \uparrow$ Prove a central limit theorem for the number $R_{n}$ of records up to time $n$.
27.9. 6.3 ↑ Let $S_{n}$ be the number of inversions in a random permutation on $n$ letters. Prove a central limit theorem for $S_{n}$.
27.10. The $\delta$-method. Suppose that Theorem 27.1 applies to $\left\{X_{n}\right\}$, so that $\sqrt{n} \sigma^{-1}\left(\bar{X}_{n}-c\right) \Rightarrow N$, where $\bar{X}_{n}=n^{-1} \sum_{k=1}^{n} X_{k}$. Use Theorem 25.6 as in Example 27.2 to show that, if $f(x)$ has a nonzero derivative at $c$, then $\sqrt{n}\left(f\left(\bar{X}_{n}\right)-\right. f(c)) / \sigma\left|f^{\prime}(c)\right| \Rightarrow N: \bar{X}_{n}$ is approximately normal with mean $c$ and standard deviation $\sigma / \sqrt{n}$, and $f\left(\bar{X}_{n}\right)$ is approximately normal with mean $f(c)$ and standard deviation $\left|f^{\prime}(c)\right| \sigma / \sqrt{n}$. Example 27.2 is the case $f(x)=1 / x$.
27.11. Suppose independent $X_{n}$ have density $|x|^{-3}$ outside $(-1,+1)$. Show that $(n \log n)^{-1 / 2} S_{n} \Rightarrow N$.
27.12. There can be asymptotic normality even if there are no moments at all. Construct a simple example.
27.13. Let $d_{n}(\omega)$ be the dyadic digits of a point $\omega$ drawn at random from the unít interval. For a $k$-tuple $\left(u_{1}, \ldots, u_{k}\right)$ of 0's and 1's, let $N_{n}\left(u_{1}, \ldots, u_{k} ; \omega\right)$ be the number of $m \leq n$ for which $\left(d_{m}(\omega), \ldots, d_{m+k-1}(\omega)\right)=\left(u_{1}, \ldots, u_{k}\right)$. Prove a central limit theorem for $N_{n}\left(u_{1}, \ldots, u_{k} ; \omega\right)$. (See Problem 6.12.)
27.14. The central limit theorem for a random number of summands. Let $X_{1}, X_{2}, \ldots$ be independent, identically distributed random variables with mean 0 and variance $\sigma^{2}$, and let $S_{n}=X_{1}+\cdots+X_{n}$. For each positive $t$, let $\nu_{i}$ be a random variable assuming positive integers as values; it need not be independent of the $X_{n}$. Suppose that there exist positive constants $a_{1}$ and $\theta$ such that

$$
a_{t} \rightarrow \infty, \quad \frac{\nu_{t}}{a_{t}} \Rightarrow \theta
$$

as $t \rightarrow \infty$. Snow by the following steps that

$$
\begin{equation*}
\frac{S_{\nu_{1}}}{\sigma \sqrt{\nu_{1}}} \Rightarrow N, \quad \frac{S_{\nu_{1}}}{\sigma \sqrt{\theta a_{1}}} \Rightarrow N . \tag{27.27}
\end{equation*}
$$

(a) Show that it may be assumed that $\theta=1$ and the $a$, are integers.
(b) Show that it suffices to prove the second relation in (27.27).
(c) Show that it suffices to prove $\left(S_{\nu_{t}}-S_{a_{i}}\right) / \sqrt{a_{t}} \Rightarrow 0$.
(d) Show that

$$
\begin{aligned}
P\left[\left|S_{\nu_{t}}-S_{a_{t}}\right| \geq \epsilon \sqrt{a_{t}}\right] \leq & P\left[\left|\nu_{t}-a_{t}\right| \geq \epsilon^{3} a_{t}\right] \\
& +P\left[\max _{\left|k-a_{t}\right| \leq \epsilon^{3} a_{t}}\left|S_{k}-S_{a_{t}}\right| \geq \epsilon \sqrt{a_{t}}\right],
\end{aligned}
$$

and conclude from Kolmogorov's inequality that the last probability is at most $2 \epsilon \sigma^{2}$
27.15. $21.2123 .1023 .14 \dagger$ A central limit theorem in renewal theory. Let $X_{1}, X_{2}, \ldots$ be independent, identically distributed positive random variables with mean $m$ and variance $\sigma^{2}$, and as in Problem 23.10 let $N_{t}$ be the maximum $n$ for which $S_{n} \leq t$. Prove by the following steps that

$$
\frac{N_{t}-t m^{-1}}{\sigma t^{1 / 2} m^{-3 / 2}} \Rightarrow N
$$

(a) Show by the results in Problems 21.21 and 23.10 that $\left(S_{N_{t}}-t\right) / \sqrt{t} \Rightarrow 0$.
(b) Show that it suffices to prove that

$$
\frac{N_{t}-S_{N_{t}} m^{-1}}{\sigma t^{1 / 2} m^{-3 / 2}}=\frac{-\left(S_{N_{t}}-m N_{t}\right)}{\sigma t^{1 / 2} m^{-1 / 2}} \Rightarrow N .
$$

(c) Show (Problem 23.10) that $N_{t} / t \Rightarrow m^{-1}$, and apply the theorem in Problem 27.14.
27.16. Show by partial integration that

$$
\begin{equation*}
\frac{1}{\sqrt{2 \pi}} \int_{x}^{\infty} e^{-u^{2} / 2} d u \sim \frac{1}{\sqrt{2 \pi}} \frac{1}{x} e^{-x^{2} / 2} \tag{27.28}
\end{equation*}
$$

as $x \rightarrow \infty$.
27.17. $\uparrow$ Suppose that $X_{1}, X_{2}, \ldots$ are independent and identically distributed with mean 0 and variance 1 , and suppose that $a_{n} \rightarrow \infty$. Formally combine the central limit theorem and (27.28) to obtain

$$
\begin{equation*}
P\left[S_{n} \geq a_{n} \sqrt{n}\right] \sim \frac{1}{\sqrt{2 \pi}} \frac{1}{a_{n}} e^{-a_{n}^{2} / 2}=e^{-a_{n}^{2}\left(1+\zeta_{n}\right) / 2} \tag{27.29}
\end{equation*}
$$

where $\zeta_{n} \rightarrow 0$ if $a_{n} \rightarrow \infty$. For a case in which this does hold, see Theorem 9.4.
27.18. $21.2 \uparrow$ Stirling's formula. Let $S_{n}=X_{1}+\cdots+X_{n}$, where the $X_{n}$ are independent and each has the Poisson distribution with parameter 1. Prove successively.
(a) $E\left[\left(\frac{S_{n}-n}{\sqrt{n}}\right)^{-}\right]=e^{-n} \sum_{k=0}^{n}\left(\frac{n-k}{\sqrt{n}}\right) \frac{n^{k}}{k!}=\frac{n^{n+(1 / 2)} e^{-n}}{n!}$.
(b) $\left(\frac{S_{n}-n}{\sqrt{n}}\right)^{-} \Rightarrow N^{-}$.
(c) $E\left[\left(\frac{S_{n}-n}{\sqrt{n}}\right)^{-}\right] \rightarrow E\left[N^{-}\right]=\frac{1}{\sqrt{2 \pi}}$.
(d) $n!\sim \sqrt{2 \pi} n^{n+(1 / 2)} e^{-n}$.
27.19. Let $l_{n}(\omega)$ be the length of the run of 0 's starting at the $n$th place in the dyadic expansion of a point $\omega$ drawn at random from the unit interval; see Example 4.1.
(a) Show that $l_{1}, l_{2}, \ldots$ is an $\alpha$-mixing sequence, where $\alpha_{n}=4 / 2^{n}$.
(b) Show that $\sum_{k=1}^{n} l_{k}$ is approximately normally distributed with mean $n$ and variance $6 n$.
27.20. Prove under the hypotheses of Theorem 27.4 that $S_{n} / n \rightarrow 0$ with probability 1 . Hint: Use (27.25).
27.21. $26.126 .29 \uparrow$ Let $X_{1}, X_{2}, \ldots$ be independent and identically distributed, and suppose that the distribution common to the $X_{n}$ is supported by $[0,2 \pi]$ and is not a lattice distribution. Let $S_{n}=X_{1}+\cdots+X_{n}$, where the sum is reduced modulo $2 \pi$. Show that $S_{n} \Rightarrow U$, where $U$ is uniformly distributed over $[0,2 \pi]$.

## SECTION 28. INFINITELY DIVISIBLE DISTRIBUTIONS*

Suppose that $Z_{\lambda}$ has the Poisson distribution with parameter $\lambda$ and that $X_{n 1}, \ldots, X_{n n}$ are independent and $P\left[X_{n k}=1\right]=\lambda / n, P\left[X_{n k}=0\right]=1-\lambda / n$. According to Example 25.2, $X_{n 1}+\cdots+X_{n n} \Rightarrow Z_{\lambda}$. This contrasts with the central limit theorem, in which the limit law is normal. What is the class of all possible limit laws for independent triangular arrays? A suitably restricted form of this question will be answered here.

## Vague Convergence

The theory requires two preliminary facts about convergence of measures Let $\mu_{n}$ and $\mu$ be finite measures on $\left(R^{1}, \mathscr{R}^{1}\right)$. If $\mu_{n}(a, b] \rightarrow \mu(a, b]$ for every finite interval for which $\mu\{a\}=\mu\{b\}=0$, then $\mu_{n}$ converges vaguely to $\mu$, written $\mu_{n} \rightarrow_{i} \mu$. If $\mu_{n}$ and $\mu$ are probability measures, it is not hard to see that this is equivalent to weak convergence $\mu_{n} \Rightarrow \mu$. On the other hand, if $\mu_{n}$ is a unit mass at $n$ and $\mu\left(R^{1}\right)=0$, then $\mu_{n} \rightarrow_{1} \mu$, but $\mu_{n} \Rightarrow \mu$ makes no sense, because $\mu$ is not a probability measure.

The first fact needed is this: Suppose that $\mu_{n} \rightarrow{ }_{\imath} \mu$ and

$$
\begin{equation*}
\sup _{n} \mu_{n}\left(R^{1}\right)<\infty ; \tag{28.1}
\end{equation*}
$$

then

$$
\begin{equation*}
\int f d \mu_{n} \rightarrow \int f d \mu \tag{28.2}
\end{equation*}
$$

for every continuous real $f$ that vanishes at $\pm \infty$ in the sense that $\lim _{|x| \rightarrow \infty} f(x)=0$. Indeed, choose $M$ so that $\mu\left(R^{1}\right)<M$ and $\mu_{n}\left(R^{1}\right)<M$ for all $n$. Given $\epsilon$, choose $a$ and $b$ so that $\mu\{a\}=\mu\{b\}=0$ and $|f(x)|<\epsilon / M$ if $x \notin A=(a, b]$. Then $\left|f_{A^{c}} f d \mu_{n}\right|<\epsilon$ and $\left|\int_{A^{i}} f d \mu\right|<\epsilon$. If $\mu(A)>0$, define $\nu(B)=\mu(B \cap A) / \mu(A)$ and $\nu_{n}(B)=\mu_{n}(B \cap A) / \mu_{n}(A)$. It is easy to see that $\nu_{n} \Rightarrow \nu$, so that $\int f d \nu_{n} \rightarrow \int f d \nu$. But then $\int_{A} f d \mu_{n}- \int_{A} f d \mu \mid<\epsilon$ for large $n$, and hence $\left|\int f d \mu_{n}-\int f d \mu\right|<3 \epsilon$ for large $n$. If $\mu(A)=0$, then $f_{A} f d \mu_{n} \rightarrow 0$, and the argument is even simpler.

The other fact needed below is this: If (28.1) holds, then there is a subsequence $\left\{\mu_{n_{k}}\right\}$ and a finite measure $\mu$ such that $\mu_{n_{k} \rightarrow i} \mu$ as $k \rightarrow \infty$. Indeed, let $F_{n}(x)= \mu_{n}(-\infty, x]$. Since the $F_{n}$ are uniformly bounded because of (28.1), the proof of Helly's theorem shows there exists a subsequence ( $F_{n_{k}}$ ) and a bounded, nondecreasing, right-continuous function $F$ such that $\lim _{k} F_{n_{k}}(x)=F(x)$ at continuity points $x$ of $F$. If $\mu$ is the measure for which $\mu(a, b]=F(b)-F(a)$ (Theorem 12.4), then clearly $\mu_{n_{k}} \rightarrow \iota \mu$.

## The Possible Limits

Let $X_{n 1}, \ldots, X_{n r_{n}}, n=1,2, \ldots$, be a triangular array as in the preceding section. The random variables in each row are independent, the means are 0 ,

[^3]and the variances are finite:
$$
\begin{equation*}
E\left[X_{n k}\right]=0, \quad \sigma_{n k}^{2}=E\left[X_{n k}^{2}\right], \quad s_{n}^{2}=\sum_{k=1}^{r_{n}} \sigma_{n k}^{2} \tag{28.3}
\end{equation*}
$$

Assume $s_{n}^{2}>0$ and put $S_{n}=X_{n 1}+\cdots+X_{n r_{n}}$. Here it will be assumed that the total variance is bounded:

$$
\begin{equation*}
\sup _{n} s_{n}^{2}<\infty . \tag{28.4}
\end{equation*}
$$

In order that the $X_{n k}$ be small compared with $S_{n}$, assume that

$$
\begin{equation*}
\lim _{n} \max _{k \leq r_{n}} \sigma_{n k}^{2}=0 \tag{28.5}
\end{equation*}
$$

The arrays in the preceding section were normalized by replacing $X_{n k}$ by $X_{n k} / s_{n}$. This has the effect of replacing $s_{n}$ by 1 , in which case of course (28.4) holds, and (28.5) is the same thing as $\max _{k} \sigma_{n k}^{2} / s_{n}^{2} \rightarrow 0$.

A distribution function $F$ is infinitely divisible if for each $n$ there is a distribution function $F_{n}$ such that $F$ is the $n$-fold convolution $F_{n} * \cdots * F_{n}$ ( $n$ copies) of $F_{n}$. The class of possible limit laws will turn out to consist of the infinitely divisible distributions with mean 0 and finite variance. ${ }^{\dagger}$ It will be possible to exhibit the characteristic functions of these laws in an explicit way.

Theorem 28.1. Suppose that

$$
\begin{equation*}
\varphi(t)=\exp \int_{R^{\prime}}\left(e^{i t x}-1-i t x\right) \frac{1}{x^{2}} \mu(d x) \tag{28.6}
\end{equation*}
$$

where $\mu$ is a finite measure. Then $\varphi$ is the characteristic function of an infinitely divisible distribution with mean 0 and variance $\mu\left(R^{1}\right)$.

By (26.42), the integrand in (28.6) converges to $-t^{2} / 2$ as $x \rightarrow 0$; take this as its value at $x=0$. By (26.41), the integrand is at most $t^{2} / 2$ in modulus and so is integrable.

The formula (28.6) is the canonical representation of $\varphi$, and $\mu$ is the canonical measure.

Before proceeding to the proof, consider three examples.
Example 28.1. If $\mu$ consists of a mass of $\sigma^{2}$ at the origin, (28.6) is $e^{-\sigma^{2} l^{2} / 2}$, the characteristic function of a centered normal distribution $F$. It is certainly infinitely divisible-take $F_{n}$ normal with variance $\sigma^{2} / n$.
${ }^{\dagger}$ There do exist infinitely divisible distributions without moments (see Problems 28.3 and 28.4), but they do not figure in the theory of this section

Example 28.2. Suppose that $\mu$ consists of a mass of $\lambda x^{2}$ at $x \neq 0$. Then (28.6) is $\exp \lambda\left(e^{i t x}-1-i t x\right)$; but this is the characteristic function of $x\left(Z_{\lambda}-\right. \lambda$ ), where $Z_{\lambda}$ has the Poisson distribution with mean $\lambda$. Thus (28.6) is the characteristic function of a distribution function $F$, and $F$ is infinitely divisible-take $F_{n}$ to be the distribution function of $x\left(Z_{\lambda / n}-\lambda / n\right)$.

Example 28.3. If $\varphi_{j}(t)$ is given by (28.6) with $\mu_{j}$ for the measure, and if $\mu=\sum_{j=1}^{k} \mu_{j}$, then (28.6) is $\varphi_{1}(t) \ldots \varphi_{k}(t)$. It follows by the preceding two examples that (28.6) is a characteristic function if $\mu$ consists of finitely many point masses. It is easy to check in the preceding two examples that the distribution corresponding to $\varphi(t)$ has mean 0 and variance $\mu\left(R^{1}\right)$, and since the means and variances add, the same must be true in the present example. $\square$

Proof of Theorem 28.1. Let $\mu_{k}$ have mass $\mu\left(j 2^{-k},(j+1) 2^{-k}\right]$ at $j 2^{-k}$ for $j=0, \pm 1, \ldots, \pm 2^{2 k}$. Then $\mu_{k} \rightarrow, \mu$. As observed in Example 28.3, if $\varphi_{k}(t)$ is (28.6) with $\mu_{k}$ in place of $\mu$, then $\varphi_{k}$ is a characteristic function. For each $t$ the integrand in (28.6) vanishes at $\pm \infty$; since $\sup _{k} \mu_{k}\left(R^{1}\right)<\infty$, $\varphi_{k}(t) \rightarrow \varphi(t)$ follows (see (28.2)). By Corollary 2 to Theorem 26.3, $\varphi(t)$ is itself a characteristic function. Further, the distribution corresponding to $\varphi_{k}(t)$ has second moment $\mu_{k}\left(R^{1}\right)$, and since this is bounded, it follows (Theorem 25.11) that the distribution corresponding to $\varphi(t)$ has a finite second moment. Differentiation (use Theorem 16.8) shows that the mean is $\varphi^{\prime}(0)=0$ and the variance is $-\varphi^{\prime \prime}(0)=\mu\left(R^{1}\right)$. Thus (28.6) is always the characteristic function of a distribution with mean 0 and variance $\mu\left(R^{1}\right)$.

If $\psi_{n}(t)$ is (28.6) with $\mu / n$ in place of $\mu$, then $\varphi(t)=\psi_{n}^{n}(t)$, so that the distribution corresponding to $\varphi(t)$ is indeed infinitely divisible. $\square$

The representation (28.6) shows that the normal and Poisson distributions are special cases in a very large class of infinitely divisible laws.

Theorem 28.2. Every infinitely divisible distribution with mean 0 and finite variance is the limit law of $S_{n}$ for some independent triangular array satisfying (28.3), (28.4), and (28.5). $\square$

The proof requires this preliminary result:
Lemma. If $X$ and $Y$ are independent and $X+Y$ has a second moment, then $X$ and $Y$ have second moments as well.

Proof. Since $X^{2}+Y^{2} \leq(X+Y)^{2}+2|X Y|$, it suffices to prove $|X Y|$ integrable, and by Fubini's theorem applied to the joint distribution of $X$ and $Y$ it suffices to prove $|X|$ and $|Y|$ individually integrable. Since $|Y| \leq|x|+ |x+Y|, E[|Y|]=\infty$ would imply $E[|x+Y|]=\infty$ for each $x$; by Fubini's
theorem again $E[|Y|]=\infty$ would therefore imply $E[|X+Y|]=\infty$, which is impossible. Hence $E[|Y|]<\infty$, and similarly $E[|X|]<\infty$.

Proof of Theorem 28.2. Let $F$ be infinitely divisible with mean 0 and variance $\sigma^{2}$. If $F$ is the $n$-fold convolution of $F_{n}$, then by the lemma (extended inductively) $F_{n}$ has finite mean and variance, and these must be 0 and $\sigma^{2} / n$. Take $r_{n}=n$ and take $X_{n 1}, \ldots, X_{n n}$ independent, each with distribution function $F_{n}$.

Theorem 28.3. If $F$ is the limit law of $S_{n}$ for an independent triangular array satisfying (28.3), (28.4), and (28.5), then $F$ has characteristic function of the form (28.6) for some finite measure $\mu$.

Proof. The proof will yield information making it possible to identify the limit. Let $\varphi_{n k}(t)$ be the characteristic function of $X_{n k}$. The first step is to prove that

$$
\begin{equation*}
\prod_{k=1}^{r_{n}} \varphi_{n k}(t)-\exp \sum_{k=1}^{r_{n}}\left(\varphi_{n k}(t)-1\right) \rightarrow 0 \tag{28.7}
\end{equation*}
$$

for each $t$. Since $|z| \leq 1$ implies that $\left|e^{z-1}\right|=e^{\mathrm{Re} z-1} \leq 1$, it follows by (27.5) that the difference $\delta_{n}(t)$ in (28.7) satisfies $\left|\delta_{n}(t)\right| \leq \sum_{k=1}^{r_{n}} \mid \varphi_{n k}(t)- \exp \left(\varphi_{n k}(t)-1\right) \mid$. Fix $t$. If $\varphi_{n k}(t)-1=\theta_{n k}$, then $\left|\theta_{n k}\right| \leq t^{2} \sigma_{n k}^{2} / 2$, and it follows by (28.4) and (28.5) that $\max _{k}\left|\theta_{n k}\right| \rightarrow 0$ and $\sum_{k}\left|\theta_{n k}\right|=O(1)$. Therefore, for sufficiently large $n,\left|\delta_{n}(t)\right| \leq \sum_{k}\left|1+\theta_{n k}-e^{\theta_{n k}}\right| \leq e^{2} \sum_{k}\left|\theta_{n k}\right|^{2} \leq e^{2} \max _{k}\left|\theta_{n k}\right|$. $\Sigma_{k}\left|\theta_{n k}\right|$ by (27.15). Hence (28.7).

If $F_{n k}$ is the distribution function of $X_{n k}$, then

$$
\begin{aligned}
\sum_{k=1}^{r_{n}}\left(\varphi_{n k}(t)-1\right) & =\sum_{k=1}^{r_{n}} \int_{R^{1}}\left(e^{i t x}-1\right) d F_{n k}(x) \\
& =\sum_{k=1}^{r_{n}} \int_{R^{1}}\left(e^{i t x}-1-i t x\right) d F_{n k}(x)
\end{aligned}
$$

Let $\mu_{n}$ be the finite measure satisfying

$$
\begin{equation*}
\mu_{n}(-\infty, x]=\sum_{k=1}^{r_{n}} \int_{y \leq x} y^{2} d F_{n k}(y) \tag{28.8}
\end{equation*}
$$

and put

$$
\begin{equation*}
\varphi_{n}(t)=\exp \int_{R^{1}}\left(e^{i t x}-1-i t x\right) \frac{1}{x^{2}} \mu_{n}(d x) \tag{28.9}
\end{equation*}
$$

Then (28.7) can be written

$$
\begin{equation*}
\prod_{k=1}^{r_{n}} \varphi_{n k}(t)-\varphi_{n}(t) \rightarrow 0 \tag{28.10}
\end{equation*}
$$

By (28.8), $\mu_{n}\left(R^{1}\right)=s_{n}^{2}$, and this is bounded by assumption. Thus (28.1) holds, and some subsequence $\left\{\mu_{n_{n}}\right\}$ converges vaguely to a finite measure $\mu$. Since the integrand in (28.9) vanishes at $\pm \infty, \varphi_{n_{a}}(t)$ converges to (28.6). But, of course, $\lim _{n} \varphi_{n}(t)$ must coincide with the characteristic function of the limit law $F$, which exists by hypothesis. Thus $F$ must have characteristic function of the form (28.6). $\square$

Theorems 28.1, 28.2, and 28.3 together show that the possible limit laws are exactly the infinitely divisible distributions with mean 0 and finite variance, and they give explicitly the form the characteristic functions of such laws must have.

## Characterizing the Limit

Theorem 28.4. Suppose that $F$ has characteristic function (28.6) and that an independent triangular array satisfies (28.3), (28.4), and (28.5). Then $S_{n}$ has limit law $F$ if and only if $\mu_{n} \rightarrow_{c} \mu$, where $\mu_{n}$ is defined by (28.8).

Proof. Since (28.7) holds as before, $S_{n}$ has limit law $F$ if and only if $\varphi_{n}(t)$ (defined by (28.9)) converges for each $t$ to $\varphi(t)$ (defined by (28.6)). If $\mu_{n} \rightarrow_{v} \mu$, then $\varphi_{n}(t) \rightarrow \varphi(t)$ follows because the integrand in (28.9) and (28.6) vanishes at $\pm \infty$ and because (28.1) follows from (28.4).

Now suppose that $\varphi_{n}(t) \rightarrow \varphi(t)$. Since $\mu_{n}\left(R^{1}\right)=s_{n}^{2}$ is bounded, each subsequence $\left\{\mu_{n_{u}}\right\}$ contains a further subsequence $\left\{\mu_{n_{u(i)}}\right\}$ converging vaguely to some $\nu$. If it can be shown that $\nu$ necessarily coincides with $\mu$, it will follow by the usual argument that $\mu_{n} \rightarrow_{\iota} \mu$. But by the definition (28.9) of $\varphi_{n}(t)$, it follows that $\varphi(t)$ must coincide with $\psi(t)=\exp \int_{R^{1}}\left(e^{i t x}-1-i t x\right) x^{-2} \nu(d x)$. Now $\varphi^{\prime}(t)=i \varphi(t) \int_{R^{1}}\left(e^{i t x}-1\right) x^{-1} \mu(d x)$, and similarly for $\psi^{\prime}(t)$. Hence $\varphi(t)= \psi(t)$ implies that $\int_{R^{1}}\left(e^{i t x}-1\right) x^{-1} \nu(d x)=\int_{R^{1}}\left(e^{i t x}-1\right) x^{-1} \mu(d x)$. A further differentiation gives $\int_{R^{i}} e^{i t x} \mu(d x)=\int_{R^{1}} e^{i t x} \nu(d x)$. This implies that $\mu\left(R^{1}\right)= \nu\left(R^{1}\right)$, and so $\mu=\nu$ by the uniqueness theorem for characteristic functions. $\square$

Example 28.4. The normal case. According to the theorem, $S_{n} \Rightarrow N$ if and only if $\mu_{n}$ converges vaguely to a unit mass at 0 . If $s_{n}^{2}=1$, this holds if and only if $\sum_{k=1}^{r_{n}} \int_{|x| \geq \epsilon} x^{2} d F_{n k}(x) \rightarrow 0$, which is exactly Lindeberg's condition. $\square$

Example 28.5. The Poisson case. Let $Z_{n 1}, \ldots, Z_{n r_{n}}$ be an independent triangular array, and suppose $X_{n k}=Z_{n k}-m_{n k}$ satisfies the conditions of the
theorem, where $m_{n k}=E\left[Z_{n k}\right]$. If $Z_{A}$ has the Poisson distribution with parameter $\lambda$, then $\sum_{k} X_{n k} \Rightarrow Z_{\lambda}-\lambda$ if and only if $\mu_{n}$ converges vaguely to a mass of $\lambda$ at 1 (see Example 28.2). If $s_{n}^{2} \rightarrow \lambda$, the requirement is $\mu_{n}[1-\epsilon$, $1+\epsilon] \rightarrow \lambda$, or

$$
\begin{equation*}
\sum_{k} \int_{\left|Z_{n k}-m_{n k}-1\right|>\epsilon}\left(Z_{n k}-m_{n k}\right)^{2} d P \rightarrow 0 \tag{28.11}
\end{equation*}
$$

for positive $\epsilon$. If $s_{n}^{2}$ and $\sum_{k} m_{n k}$ both converge to $\lambda$, (28.11) is a necessary and sufficient condition for $\sum_{k} Z_{n k} \Rightarrow Z_{\lambda}$. The conditions are easily checked under the hypotheses of Theorem 23.2: $Z_{n k}$ assumes the values 1 and 0 with probabilities $p_{n k}$ and $1-p_{n k}, \sum_{k} p_{n k} \rightarrow \lambda$, and $\max _{k} p_{n k} \rightarrow 0$.

## PROBLEMS

28.1. Show that $\mu_{n} \rightarrow_{i} \mu$ implies $\mu\left(R^{1}\right) \leq \liminf _{n} \mu_{n}\left(R^{1}\right)$. Thus in vague convergence mass can "escape to infinity" but mass cannot "enter from infinity."
28.2. (a) Show that $\mu_{n} \rightarrow, \mu$ if and only if (28.2) holds for every continuous $f$ with bounded support.
(b) Show that if $\mu_{n} \rightarrow, \mu$ but (28.1) does not hold, then there is a continuous $f$ vanishing at $\pm \infty$ for which (28.2) does not hold.
28.3. 23.7 ↑ Suppose that $N, Y_{1}, Y_{2}, \ldots$ are independent, the $Y_{n}$ have a common distribution function $F$, and $N$ has the Poisson distribution with mean $\alpha$. Then $S=Y_{1}+\cdots+Y_{N}$ has the compound Poisson distribution.
(a) Show that the distribution of $S$ is infinitely divisible. Note that $S$ may not have a mean.
(b) The distribution function of $S$ is $\sum_{n=0}^{\infty} e^{-\alpha} \alpha^{n} F^{n *}(x) / n!$, where $F^{n *}$ is the $n$-fold convolution of $F$ (a unit jump at 0 for $n=0$ ). The characteristic function of $S$ is $\exp \alpha \int_{-\infty}^{\infty}\left(e^{i t x}-1\right) d F(x)$.
(c) Show that, if $F$ has mean 0 and finite variance, then the canonical measure $\mu$ in (28.6) is specified by $\mu(A)=\alpha f_{A} x^{2} d F(x)$.
28.4. (a) Let $\nu$ be a finite measure, and define

$$
\begin{equation*}
\varphi(t)=\exp \left[i \gamma t+\int_{-\infty}^{\infty}\left(e^{i t x}-1-\frac{i t x}{1+x^{2}}\right) \frac{1+x^{2}}{x^{2}} \nu(d x)\right] \tag{28.12}
\end{equation*}
$$

where the integrand is $-t^{2} / 2$ at the origin. Show that this is the characteristic function of an infinitely divisible distribution.
(b) Show that the Cauchy distribution (see the table on p. 348) is the case where $\gamma=0$ and $\nu$ has density $\pi^{-1}\left(1+x^{2}\right)^{-1}$ with respect to Lebesgue measure.
28.5. Show that the Cauchy, exponential, and gamma (see (20.47)) distributions are infinitely divisible.
28.6. Find the canonical representation (28.6) of the exponential distribution with mean 1:
(a) The characteristic function is $\int_{0}^{\infty} e^{i t x} e^{-x} d x=(1-i t)^{-1}=\varphi(t)$.
(b) Show that (use the principal branch of the logarithm or else operate formally for the moment) $d(\log \varphi(t)) / d t=i \varphi(t)=i \int_{0}^{\infty} e^{i t x} e^{-x} d x$. Integrate with respect to $t$ to obtain

$$
\begin{equation*}
\frac{1}{1-i t}=\exp \int_{0}^{\infty}\left(e^{i t x}-1\right) \frac{e^{-x}}{x} d x \tag{28.13}
\end{equation*}
$$

Verify ( 2813 ) after the fact by showing that the ratio of the two sides has derivative 0 .
(c) Multiply (28.13) by $e^{-i t}$ to center the exponential distribution at its mean: The canonical measure $\mu$ has density $x e^{-x}$ over $(0, \infty)$.
28.7. $\uparrow$ If $X$ and $Y$ are independent and each has the exponential density $e^{-x}$, then $X-Y$ has the double exponential density $\frac{1}{2} e^{-|x|}$ (see the table on p. 348). Show that its characteristic function is

$$
\frac{1}{1+t^{2}}=\exp \int_{-\infty}^{\infty}\left(e^{i t x}-1-i t x\right) \frac{1}{x^{2}}|x| e^{-|x|} d x
$$

28.8. $\uparrow$ Suppose $X_{1}, X_{2}, \ldots$ are independent and each has the double exponential density. Show that $\sum_{n=1}^{\infty} X_{n} / n$ converges with probability 1 . Show that the distribution of the sum is infinitely divisible and that its canonical measure has density $|x| e^{-|x|} /\left(1-e^{-|x|}\right)=\sum_{n=1}^{\infty}|x| e^{-|n x|}$.
28.9. $26.8 \uparrow$ Show that for the gamma density $e^{-x} x^{u-1} / \Gamma(u)$ the canonical measure has density uxe $e^{-x}$ over $(0, \infty)$.

The remaining problems require the notion of a stable law. A distribution function $F$ is stable if for each $n$ there exist constants $a_{n}$ and $b_{n}, a_{n}>0$, such that, if $X_{1}, \ldots, X_{n}$ are independent and have distribution function $F$, then $a_{n}^{-1}\left(X_{1}\right. \left.+\cdots+X_{n}\right)+b_{n}$ also has distribution function $F$.
28.10. Suppose that for all $a, a^{\prime}, b, b^{\prime}$ there exist $a^{\prime \prime}, b^{\prime \prime}$ (here $a, a^{\prime}, a^{\prime \prime}$ are all positive) such that $F(a x+b) * F\left(a^{\prime} x+b^{\prime}\right)=F\left(a^{\prime \prime} x+b^{\prime \prime}\right)$. Show that $F$ is stable.
28.11. Show that a stable law is infinitely divisible.
28.12. Show that the Poisson law, although infinitely divisible, is not stable.
28.13. Show that the normal and Cauchy laws are stable.
28.14. $28.10 \uparrow$ Suppose that $F$ has mean 0 and variance 1 and that the dependence of $a^{\prime \prime}, b^{\prime \prime}$ on $a, a^{\prime}, b, b^{\prime}$ is such that

$$
F\left(\frac{x}{\sigma_{1}}\right) * F\left(\frac{x}{\sigma_{2}}\right)=F\left(\frac{x}{\sqrt{\sigma_{1}^{2}+\sigma_{2}^{2}}}\right)
$$

Show that $F$ is the standard normal distribution.
28.15. (a) Let $Y_{n k}$ be independent random variables having the Poisson distribution with mean $c n^{\alpha} /|k|^{1+\alpha}$, where $c>0$ and $0<\alpha<2$. Let $Z_{n}=n^{-1} \sum_{k=-n^{2}}^{n^{2}} Y_{n k}$ (omit $k=0$ in the sum), and show that if $c$ is properly chosen then the characteristic function of $Z_{n}$ converges to $e^{-| |^{\alpha}}$.
(b) Show for $0<\alpha \leq 2$ that $e^{-\mu \mu^{\alpha}}$ is the characteristic function of a symmetric stable distribution; it is called the symmetric stable law of exponent $\alpha$. The case $\alpha=2$ is the normal law, and $\alpha=1$ is the Cauchy law.

## SECTION 29. LIMIT THEOREMS IN $\boldsymbol{R}^{\boldsymbol{k}}$

If $F_{n}$ and $F$ are distribution functions on $R^{k}$, then $F_{n}$ converges weakly to $F$, written $F_{n} \Rightarrow F$, if $\lim _{n} F_{n}(x)=F(x)$ for all continuity points $x$ of $F$. The corresponding distributions $\mu_{n}$ and $\mu$ are in this case also said to converge weakly: $\mu_{n} \Rightarrow \mu$. If $X_{n}$ and $X$ are $k$-dimensional random vectors (possibly on different probability spaces), $X_{n}$ converges in distribution to $X$, written $X_{n} \Rightarrow X$, if the corresponding distribution functions converge weakly. The definitions are thus exactly as for the line.

## The Basic Theorems

The closure $A^{-}$of a set in $R^{k}$ is the set of limits of sequences in $A$; the interior is $A^{\circ}=R^{k}-\left(R^{k}-A\right)^{-}$; and the boundary is $\partial A=A^{-}-A^{\circ}$. A Borel set $A$ is a $\mu$-continuity set if $\mu(\partial A)=0$. The first theorem is the $k$-dimensional version of Theorem 25.8.

Theorem 29.1. For probability measures $\mu_{n}$ and $\mu$ on $\left(R^{k}, \mathscr{R}^{k}\right)$, each of the following conditions is equivalent to the weak convergence of $\mu_{n}$ to $\mu$ :
(i) $\lim _{n} \int f d \mu_{n}=\int f d \mu$ for bounded continuous $f$;
(ii) $\limsup _{n} \mu_{n}(C) \leq \mu(C)$ for closed $C$;
(iii) $\liminf _{n} \mu_{n}(G) \geq \mu(G)$ for open $G$;
(iv) $\lim _{n} \mu_{n}(A)=\mu(A)$ for $\mu$-continuity sets $A$.

Proof. It will first be shown that (i) through (iv) are all equivalent.
(i) implies (ii): Consider the distance $\operatorname{dist}(x, C)=\inf [|x-y|: y \in C]$ from $x$ to $C$. It is continuous in $x$. Let

$$
\varphi_{j}(t)= \begin{cases}1 & \text { if } t \leq 0 \\ 1-j t & \text { if } 0 \leq t \leq j^{-1} \\ 0 & \text { if } j^{-1} \leq t\end{cases}
$$

Then $f_{j}(x)=\varphi_{j}$ (dist $(x, C)$ ) is continuous and bounded by 1 , and $f_{j}(x) \downarrow I_{C}(x)$ as $j \uparrow \infty$ because $C$ is closed. If (i) holds, then $\limsup _{n} \mu_{n}(C) \leq \lim _{n} \int f_{j} d \mu_{n} =\int f_{j} d \mu$. As $j \uparrow \infty, \int f_{j} d \mu \downarrow \int I_{C} d \mu=\mu(C)$.
(ii) is equivalent to (iii). Take $C=R^{k}-G$.
(ii) and (iii) imply (iv): From (ii) and (iii) follows

$$
\begin{aligned}
\mu\left(A^{\circ}\right) & \leq \lim \inf _{n} \mu_{n}\left(A^{\circ}\right) \leq \lim \inf _{n} \mu_{n}(A) \\
& \leq \lim \sup _{n} \mu_{n}(A) \leq \lim \sup _{n} \mu_{n}\left(A^{-}\right) \leq \mu\left(A^{-}\right) .
\end{aligned}
$$

Clearly (iv) follows from this.
(iv) implies (i): Suppose that $f$ is continuous and $|f(x)|$ is bounded by $K$. Given $\epsilon$, choose reals $\alpha_{0}<\alpha_{1}<\cdots<\alpha_{i}$ so that $\alpha_{0}<-K<K<\alpha_{i}$, $\alpha_{i}- \alpha_{i-1}<\epsilon$, and $\mu\left[x: f(x)=\alpha_{i}\right]=0$. The last condition can be achieved because the sets $[x: f(x)=\alpha]$ are disjoint for different $\alpha$. Put $A_{i}=[x$ : $\left.\alpha_{i-1}<f(x) \leq \alpha_{i}\right]$. Since $f$ is continuous, $A_{i}^{-} \subset\left[x: \alpha_{i-1} \leq f(x) \leq \alpha_{i}\right]$ and $A_{i}^{0} \supset\left[x: \alpha_{i-1}<f(x)<\alpha_{i}\right]$. Therefore, $\partial A_{i} \subset\left[x: f(x)=\alpha_{i-1}\right] \cup\left[x: f(x)=\alpha_{i}!\right.$, and therefore $\mu\left(\partial A_{i}\right)=0$. Now $\left|\int f d \mu_{n}-\sum_{i=1}^{l} \alpha_{i} \mu_{n}\left(A_{i}\right)\right| \leq \epsilon$ and similarly for $\mu$, and $\sum_{i=1}^{l} \alpha_{i} \mu_{n}\left(A_{i}\right) \rightarrow \sum_{i=1}^{l} \alpha_{i} \mu\left(A_{i}\right)$ because of (iv). Since $\epsilon$ was arbitrary, (i) follows.

It remains to prove these four conditions equivalent to weak convergence.
(iv) implies $\mu_{n} \Rightarrow \mu$ : Consider the corresponding distribution functions. If $S_{x}=\left[y: \quad y_{i} \leq x_{i}, i=1, \ldots, k\right]$, then $F$ is continuous at $x$ if and only if $\mu\left(\partial S_{x}\right)=0$; see the argument following (20.18). Therefore, if $F$ is continuous at $x, F_{n}(x)=\mu_{n}\left(S_{x}\right) \rightarrow \mu\left(S_{x}\right)=F(x)$, and $F_{n} \Rightarrow F$.
$\mu_{n} \Rightarrow \mu$ implies (iii): Since only countably many parallel hyperplanes can have positive $\mu$-measure, there is a dense set $D$ of reals such that $\mu[x$ : $\left.x_{i}=d\right]=0$ for $d \in D$ and $i=1, \ldots, k$. Let $\mathscr{A}$ be the class of rectangles $A=\left[x: a_{i}<x_{i} \leq b_{i}, i=1, \ldots, k\right]$ for which the $a_{i}$ and the $b_{i}$ all lie in $D$. All $2^{k}$ vertices of such a rectangle are continuity points of $F$, and so $F_{n} \Rightarrow F$ implies (see (12.12)) that $\mu_{n}(A)=\Delta_{A} F_{n} \rightarrow \Delta_{A} F=\mu(A)$. It follows by the inclusion-exclusion formula that $\mu_{n}(B) \rightarrow \mu(B)$ for finite unions $B$ of elements of $\mathscr{A}$. Since $D$ is dense on the line, an open set $G$ in $R^{k}$ is a countable union of sets $A_{m}$ in $\mathscr{A}$. But $\mu\left(\cup_{m \leq M} A_{m}\right)=\lim _{n} \mu_{n}\left(\cup_{m \leq M} A_{m}\right) \leq \liminf _{n} \mu_{n}(G)$. Letting $M \rightarrow \infty$ gives (iii). $\square$

Theorem 29.2. Suppose that $h: R^{k} \rightarrow R^{i}$ is measurable and that the set $D_{h}$ of its discontinuities is measurable. ${ }^{\dagger}$ If $\mu_{n} \Rightarrow \mu$ in $R^{k}$ and $\mu\left(D_{h}\right)=0$, then $\mu_{n} h^{-1} \Rightarrow \mu h^{-1}$ in $R^{i}$.

[^4]Proof. Let $C$ be a closed set in $R^{j}$. The closure $\left(h^{-1} C\right)^{-}$in $R^{k}$ satisfies $\left(h^{-1} C\right)^{-} \subset D_{h} \cup h^{-1} C$. If $\mu_{n} \Rightarrow \mu$, then part (ii) of Theorem 29.1 gives

$$
\begin{aligned}
\limsup _{n} \mu_{n} h^{-1}(C) & \leq \lim \sup _{n} \mu_{n}\left(\left(h^{-1} C\right)^{-}\right) \leq \mu\left(\left(h^{-1} C\right)^{-}\right) \\
& \leq \mu\left(D_{h}\right)+\mu\left(h^{-1} C\right)
\end{aligned}
$$

Using (ii) again gives $\mu_{n} h^{-1} \Rightarrow \mu h^{-1}$ if $\mu\left(D_{h}\right)=0$.
Theorem 29.2 is the $k$-dimensional version of the mapping theorem-Theorem 25.7. The two proofs just given provide in the case $k=1$ a second approach to the theory of Section 25, which there was based on Skorohod's theorem (Theorem 25.6). Skorohod's theorem does extend to $R^{k}$, but the proof is harder. ${ }^{\dagger}$

Theorems 29.1 and 29.2 can of course be stated in terms of random vectors. For example, $X_{n} \Rightarrow X$ if and only if $P[X \in G] \leq \liminf _{n} P\left[X_{n} \in G\right]$ for all open sets $G$.

A sequence $\left\{\mu_{n}\right\}$ of probability measures on $\left(R^{k}, \mathscr{R}^{k}\right)$ is tight if for every $\epsilon$ there is a bounded rectangle $A$ such that $\mu_{n}(A)>1-\epsilon$ for all $n$.

Theorem 29.3. If $\left\{\mu_{n}\right\}$ is a tight sequence of probability measures, there is a subsequence $\left\{\mu_{n_{i}}\right\}$ and a probability measure $\mu$ such that $\mu_{n_{i}} \Rightarrow \mu$ as $i \rightarrow \infty$.

Proof. Take $S_{x}=\left[y: y_{j} \leq x_{j}, j \leq k\right]$ and $F_{n}(x)=\mu_{n}\left(S_{x}\right)$. The proof of Helly's theorem (Theorem 25.9) carries over: For points $x$ and $y$ in $R^{k}$, interpret $x \leq y$ as meaning $x_{u} \leq y_{u}, u=1, \ldots, k$, and $x<y$ as meaning $x_{u}<y_{u}, u=1, \ldots, k$. Consider rational points $r$-points whose coordinates are all rational-and by the diagonal method [A14] choose a sequence $\left\{n_{i}\right\}$ along which $\lim _{i} F_{n_{i}}(r)=G(r)$ exists for each such $r$. As before, define $F(x)=\inf [G(r): x<r]$. Although $F$ is clearly nondecreasing in each variable, a further argument is required to prove $\Delta_{A} F \geq 0$ (see (12.12)).

Given $\epsilon$ and a rectangle $A=\left(a_{1}, b_{1}\right] \times \cdots \times\left(a_{k}, b_{k}\right]$, choose a $\delta$ such that if $z=(\delta, \ldots, \delta)$, then for each of the $2^{k}$ vertices $x$ of $A, x<r<x+z$ implies $|F(x)-G(r)|<\epsilon / 2^{k}$. Now choose rational points $r$ and $s$ such that $a<r<a+z$ and $b<s<b+z$. If $B=\left(r_{1}, s_{1}\right] \times \cdots \times\left(r_{k}, s_{k}\right]$, then $\mid \Delta_{A} F- \Delta_{B} G \mid<\epsilon$. Since $\Delta_{B} G=\lim _{i} \Delta_{B} F_{n_{i}} \geq 0$ and $\epsilon$ is arbitrary, it follows that $\Delta_{A} F \geq 0$.

With the present interpretation of the symbols, the proof of Theorem 25.9 shows that $F$ is continuous from above and $\lim _{i} F_{n_{i}}(x)=F(x)$ for continuity points $x$ of $F$.

[^5]By Theorem 12.5, there is a measure $\mu$ on ( $R^{k}, \mathscr{R}^{k}$ ) such that $\mu(A)=\Delta_{A} F$ for rectangles $A$. By tightness, there is for given $\epsilon$ a $t$ such that $\mu_{n}[y$ : $\left.-t<y_{j} \leq t, j \leq k\right]>1-\epsilon$ for all $n$. Suppose that all coordinates of $x$ exceed $t$ : If $r>x$, then $F_{n}(r)>1-\epsilon$ and hence ( $r$ rational) $G(r) \geq 1-\epsilon$, so that $F(x) \geq 1-\epsilon$. Suppose, on the other hand, that some coordinate of $x$ is less than $-t$ : Choose a rational $r$ such that $x<r$ and some coordinate of $r$ is less than $-t$; then $F_{n}(r)<\epsilon$, hence $G(r) \leq \epsilon$, and so $F(x) \leq \epsilon$. Therefore, for every $\epsilon$ there is a $t$ such that

$$
F(x) \begin{cases}\geq 1-\epsilon & \text { if } x_{j}>t \text { for all } j  \tag{29.1}\\ \leq \epsilon & \text { if } x_{j}<-t \text { for some } j\end{cases}
$$

If $B_{s}=\left[y:-s<y_{j} \leq x_{j}, j \leq k\right]$, then $\mu\left(S_{x}\right)=\lim _{s} \mu\left(B_{s}\right)=\lim _{s} \Delta_{B_{s}} F$. Of the $2^{k}$ teims in the sum $\Delta_{B_{\mathrm{s}}} F$, all but $F(x)$ go to $0(s \rightarrow \infty)$ because of the second part of (29.1). Thus $\mu\left(S_{x}\right)=F(x) .^{\dagger}$ Because of the other part of (29.1), $\mu$ is a probability measure. Therefore, $F_{n} \Rightarrow F$ and $\mu_{n} \Rightarrow \mu$.

Obviously Theorem 29.3 implies that tightness is a sufficient condition that each subsequence of $\left\{\mu_{n}\right\}$ contain a further subsequence converging weakly to some probability measure. (An easy modification of the proof of Theorem 25.10 shows that tightness is necessary for this as well.) And clearly the corollary to Theorem 25.10 now goes through:

Corollary. If $\left\{\mu_{n}\right\}$ is a tight sequence of probability measures, and if each subsequence that converges weakly at all converges weakly to the probability measure $\mu$, then $\mu_{n} \Rightarrow \mu$.

## Characteristic Functions

Consider a random vector $X=\left(X_{1}, \ldots, X_{k}\right)$ and its distribution $\mu$ in $R^{k}$. Let $t \cdot x=\sum_{u=1}^{k} t_{u} x_{u}$ denote inner product. The characteristic function of $X$ and of $\mu$ is defined over $R^{k}$ by

$$
\begin{equation*}
\varphi(t)=\int_{R^{k}} e^{i t x} \mu(d x)=E\left[e^{i t x}\right] \tag{29.2}
\end{equation*}
$$

To a great extent its properties parallel those of the one-dimensional characteristic function and can be deduced by parallel arguments.
${ }^{\dagger}$ This requires proof because there exist (Problem 12.10) functions $F^{\prime}$ other than $F$ for which $\mu(A)=\Delta_{A} F^{\prime}$ holds for all rectangles $A$.

The inversion formula (26.16) takes this form: For a bounded rectangle $A=\left[x: a_{u}<x_{u} \leq b_{u}, u \leq k\right]$ such that $\mu(\partial A)=0$,

$$
\begin{equation*}
\mu(A)=\lim _{T \rightarrow \infty} \frac{1}{(2 \pi)^{k}} \int_{B_{T} u=1}^{k} \prod_{i t_{u}}^{k} \frac{e^{-i t_{u} a_{u}}-e^{-i t_{u} b_{u}}}{i t} \varphi(t) d t \tag{29.3}
\end{equation*}
$$

where $B_{T}=\left[t \in R^{k}:\left|t_{u}\right| \leq T, u \leq k\right]$ and $d t$ is short for $d t_{1} \cdots d t_{k}$. To prove it, replace $\varphi(t)$ by the middle term in (29.2) and reverse the integrals as in (26.17): The integral in (29.3) is

$$
I_{T}=\frac{1}{(2 \pi)^{k}} \int_{R^{k}}\left[\int_{B_{T} u=1}^{k} \prod_{i t_{u}}^{k} \frac{e^{-i t_{u} a_{u}}-e^{-i t_{u} b_{u}}}{i t_{u} x_{u}} d t\right] \mu(d x)
$$

The inner integral may be evaluated by Fubini's theorem in $R^{k}$, which gives

$$
\begin{aligned}
I_{T}=\int_{R^{k}} \prod_{u=1}^{k} & {\left[\frac{\operatorname{sgn}\left(x_{u}-a_{u}\right)}{\pi} S\left(T \cdot\left|x_{u}-a_{u}\right|\right)\right.} \\
& \left.-\frac{\operatorname{sgn}\left(x_{u}-b_{u}\right)}{\pi} S\left(T \cdot\left|x_{u}-b_{u}\right|\right)\right] \mu(d x) .
\end{aligned}
$$

Since the integrand converges to $\prod_{u=1}^{k} \psi_{a_{u}, b_{u}}\left(x_{u}\right)$ (see (26.18)), (29.3) follows as in the case $k=1$.

The proof that weak convergence implies (iii) in Theorem 29.1 shows that for probability measures $\mu$ and $\nu$ on $R^{k}$ there exists a dense set $D$ of reals such that $\mu(\partial A)=\nu(\partial A)=0$ for all rectangles $A$ whose vertices have coordinates in $D$. If $\mu(A)=\nu(A)$ for such rectangles, then $\mu$ and $\nu$ are identical by Theorem 3.3.

Thus the characteristic function $\varphi$ uniquely determines the probability measure $\mu$ Further properties of the characteristic function can be derived from the one-dimensional case by means of the following device of Cramér and Wold. For $t \in R^{k}$, define $h_{t}: R^{k} \rightarrow R^{1}$ by $h_{t}(x)=t \cdot x$. For real $\alpha,[x: t \cdot x \leq \alpha]$ is a half space, and its $\mu$-measure is

$$
\begin{equation*}
\mu[x: t \cdot x \leq \alpha]=\mu h_{l}^{-1}(-\infty, \alpha] . \tag{29.4}
\end{equation*}
$$

By change of variable, the characteristic function of $\mu h_{\imath}^{-1}$ is

$$
\begin{align*}
\int_{R^{1}} e^{i s y} \mu h_{1}^{-1}(d y) & =\int_{R^{k}} e^{i s(1 x)} \mu(d x)  \tag{29.5}\\
& =\varphi\left(s t_{1}, \ldots, s t_{k}\right), \quad s \in R^{1} .
\end{align*}
$$

To know the $\mu$-measure of every half space is (by (29.4)) to know each $\mu h_{t}^{-1}$ and hence is (by (29.5) for $s=1$ ) to know $\varphi(t)$ for every $t$; and to know the
characteristic function $\varphi$ of $\mu$ is to know $\mu$. Thus $\mu$ is uniquely determined by the values it gives to the half spaces. This result, very simple in its statement, seems to require Fourier methods-no elementary proof is known.

If $\mu_{n} \Rightarrow \mu$ for probability measures on $R^{k}$, then $\varphi_{n}(t) \rightarrow \varphi(t)$ for the corresponding characteristic functions by Theorem 29.1. But suppose that the characteristic functions converge pointwise. It follows by (29.5) that for each $t$ the characteristic function of $\mu_{n} h_{t}^{-1}$ converges pointwise on the line to the characteristic function of $\mu h_{t}^{-1}$; by the continuity theorem for characteristic functions on the line then, $\mu_{n} h_{i}^{-1} \Rightarrow \mu h_{t}^{-1}$. Take the $u$ th component of $t$ to be 1 and the others 0 ; then the $\mu_{n} h_{t}^{-1}$ are the marginals for the $u$ th coordinate. Since $\left\{\mu_{n} \dot{h}_{t}^{-1}\right\}$ is weakly convergent, there is a bounded interval ( $\left.a_{u}, b_{u}\right]$ such that $\mu_{n}\left[x \in R^{k}: a_{u}<x_{u} \leq b_{u}\right]=\mu_{n} h_{t}^{-1}\left(a_{u}, b_{u}\right]>1-\epsilon / k$ for all $n$. But then $\mu_{n}(A)>1-\epsilon$ for the bounded rectangle $A=\left[x: a_{u}<x_{u} \leq b_{u}\right.$, $u=1, \ldots, k]$. The sequence $\left\{\mu_{n}\right\}$ is therefore tight. If a subsequence $\left\{\mu_{n_{i}}\right\}$ converges weakly to $\nu$, then $\varphi_{n_{i}}(t)$ converges to the characteristic function of $\nu$, which is therefore $\varphi(t)$. By uniqueness, $\nu=\mu$, so that $\mu_{n_{i}} \Rightarrow \mu$. By the corollary to Theorem 29.3, $\mu_{n} \Rightarrow \mu$. This proves the continuity theorem for $\dot{k}$-dimensional characteristic functions: $\mu_{n} \Rightarrow \mu$ if and only if $\varphi_{n}(t) \rightarrow \varphi(t)$ for all $t$.

The Cramér-Wold idea leads also to the following result, by means of which certain limit theorems can be reduced in a routine way to the one-dimensional case.

Theorem 29.4. For random vectors $X_{n}=\left(X_{n 1}, \ldots, X_{n k}\right)$ and $Y= \left(Y_{1}, \ldots, Y_{k}\right)$, a necessary and sufficient condition for $X_{n} \Rightarrow Y$ is that $\sum_{u=1}^{k} t_{u} X_{n u} \Rightarrow \sum_{u=1}^{k} t_{u} Y_{u}$ for each ( $t_{1}, \ldots, t_{k}$ ) in $R^{k}$.

Proof. The necessity follows from a consideration of the continuous mapping $h_{t}$ above-use Theorem 29.2. As for sufficiency, the condition implies by the continuity theorem for one-dimensional characteristic functions that for each $\left(t_{1}, \ldots, t_{k}\right)$

$$
E\left[e^{i s \sum_{n=1}^{k} t_{n} X_{n u}}\right] \rightarrow E\left[e^{i s \sum_{n=1}^{k} t_{n} Y_{n}}\right]
$$

for all real $s$. Taking $s=1$ shows that the characteristic function of $X_{n}$ converges pointwise to that of $Y$.

## Normal Distributions in $\boldsymbol{R}^{\boldsymbol{k}}$

By Theorem 20.4 there is (on some probability space) a random vector $X=\left(X_{1}, \ldots, X_{k}\right)$ with independent components each having the standard normal distribution. Since each $X_{u}$ has density $e^{-x^{2} / 2} / \sqrt{2 \pi}, X$ has density
(see (20.25))

$$
\begin{equation*}
f(x)=\frac{1}{(2 \pi)^{k / 2}} e^{-|x|^{2} / 2}, \tag{29.6}
\end{equation*}
$$

where $|x|^{2}=\sum_{u=1}^{k} x_{u}^{2}$ denotes Euclidean norm. This distribution plays the role of the standard normal distribution in $R^{k}$. Its characteristic function is

$$
\begin{equation*}
E\left[\prod_{u=1}^{k} e^{i t_{u} x_{u}}\right]=\prod_{u=1}^{k} e^{-t_{u}^{2} / 2}=e^{-|t|^{2} / 2} . \tag{29.7}
\end{equation*}
$$

Let $A=\left[a_{u t}\right]$ be a $k \times k$ matrix, and put $Y=A X$. where $X$ is viewed as a column vector. Since $E\left[X_{\alpha} X_{\beta}\right]=\delta_{\alpha \beta}$, the matrix $\Sigma=\left[\sigma_{u \iota}\right]$ of the covariances of $Y$ has entries $\sigma_{u l}=E\left[Y_{u} Y_{l}\right]=\sum_{\alpha=1}^{k} a_{u \alpha} a_{l \alpha}$. Thus $\Sigma=A A^{\prime}$, where the prime denotes transpose. The matrix $\Sigma$ is symmetric and nonnegative definite: $\sum_{u t} \sigma_{u t} x_{u} x_{\imath}=\left|A^{\prime} x\right|^{2} \geq 0$. View $t$ also as a column vector with transpose $t^{\prime}$, and note that $t \cdot x=t^{\prime} x$. The characteristic function of $A X$ is thus

$$
\begin{equation*}
E\left[e^{i t^{\prime}(A X)}\right]=E\left[e^{i\left(A^{\prime} t\right)^{\prime} X}\right]=e^{-\mid A^{\prime} t^{2} / 2}=e^{-t^{\prime} \Sigma t / 2} . \tag{29.8}
\end{equation*}
$$

Define a centered normal distribution as any probability measure whose characteristic function has this form for some symmetric nonnegative definite $\Sigma$.

If $\Sigma$ is symmetric and nonnegative definite, then for an appropriate orthogonal matrix $U, U^{\prime} \Sigma U=D$ is a diagonal matrix whose diagonal elements are the eigenvalues of $\Sigma$ and hence are nonnegative. If $D_{0}$ is the diagonal matrix whose elements are the square roots of those of $D$, and if $A=U D_{0}$, then $\Sigma=A A^{\prime}$. Thus for every nonnegative definite $\Sigma$ there exists a centered normal distribution (namely the distribution of $A X$ ) with covariance matrix $\Sigma$ and characteristic function $\exp \left(-\frac{1}{2} t^{\prime} \Sigma t\right)$.

If $\Sigma$ is nonsingular, so is the $A$ just constructed. Since $X$ has density (29.6), $Y=A X$ has, by the Jacobian transformation formula (20.20), density $f\left(A^{-1} x\right) \operatorname{det} A^{-1} \mid$. From $\Sigma=A A^{\prime}$ follows $\left|\operatorname{det} A^{-1}\right|=(\operatorname{det} \Sigma)^{-1 / 2}$. Moreover, $\Sigma^{-1}=\left(A^{\prime}\right)^{-1} A^{-1}$, so that $\left|A^{-1} x\right|^{2}=x^{\prime} \Sigma^{-1} x$. Thus the normal distribution has density $(2 \pi)^{k / 2}(\operatorname{det} \Sigma)^{-1 / 2} \exp \left(-\frac{1}{2} x^{\prime} \Sigma^{-1} x\right)$ if $\Sigma$ is nonsingular. If $\Sigma$ is singular, the $A$ constructed above must be singular as well, so that $A X$ is confined to some hyperplane of dimension $k-1$ and the distribution can have no density.

By (29.8) and the uniqueness theorem for characteristic functions in $R^{k}$, a centered normal distribution is completely determined by its covariance matrix. Suppose the off-diagonal elements of $\Sigma$ are 0 , and let $A$ be the diagonal matrix with the $\sigma_{i i}^{1 / 2}$ along the diagonal. Then $\Sigma=A \mathcal{A}^{\prime}$, and if $X$ has the standard normal distribution, the components $X_{i}$ are independent and hence so are the components $\sigma_{i i}^{1 / 2} X_{i}$ of $A X$. Therefore, the components of a
normally distributed random vector are independent if and only if they are uncorrelated.

If $M$ is a $j \times k$ matrix and $Y$ has in $R^{k}$ the centered normal distribution with covariance matrix $\Sigma$, then $M Y$ has in $R^{j}$ the characteristic function $\exp \left(-\frac{1}{2}\left(M^{\prime} t\right)^{\prime} \Sigma\left(M^{\prime} t\right)\right)=\exp \left(-\frac{1}{2} t^{\prime}\left(M \Sigma M^{\prime}\right) t\right)\left(t \in R^{j}\right)$. Hence $M Y$ has the centered normal distribution in $R^{j}$ with covariance matrix $M \Sigma M^{\prime}$. Thus a linear transformation of a normal distribution is itself normal.

These normal distributions are special in that all the first moments vanish. The general normal distribution is a translation of one of these centered distributions. It is completely determined by its means and covariances.

## The Central Limit Theorem

Let $X_{n}=\left(X_{n 1}, \ldots, X_{n \dot{k}}\right)$ be independent random vectors all having the same distribution. Suppose that $E\left[X_{n u}^{2}\right]<\infty$; let the vector of means be $c= \left(c_{1}, \ldots, c_{k}\right)$, where $c_{u}=E\left[X_{n u}\right]$, and let the covariance matrix be $\Sigma=\left[\sigma_{u u}\right]$, where $\sigma_{u t}=E\left[\left(X_{n u}-c_{u}\right)\left(X_{n t}-c_{1}\right)\right]$. Put $S_{n}=X_{1}+\cdots+X_{n}$.

Theorem 29.5. Under these assumptions, the distribution of the random vector $\left(S_{n}-n c\right) / \sqrt{n}$ converges weakly to the centered normal distribution with covariance matrix $\Sigma$.

Proof. Let $Y=\left(Y_{1}, \ldots, Y_{k}\right)$ be a normally distributed random vector with 0 means and covariance matrix $\Sigma$. For given $t=\left(t_{1}, \ldots, t_{k}\right)$, let $Z_{n}= \sum_{u=1}^{k} t_{u}\left(X_{n u}-c_{u}\right)$ and $Z=\sum_{u=1}^{k} t_{u} Y_{u}$. By Theorem 29.4, it suffices to prove that $n^{-1 / 2} \sum_{j=1}^{n} Z_{i} \Rightarrow Z$ (for arbitrary $t$ ). But this is an instant consequence of the Lindeberg-Lévy theorem (Theorem 27.1).

## PROBLEMS

29.1. A real function $f$ on $R^{k}$ is everywhere upper semicontinuous (see Problem 13.8) if for each $x$ and $\epsilon$ there is a $\delta$ such that $|x-y|<\delta$ implies that $f(y)<f(x)+\epsilon ; f$ is lower semicontinuous if $-f$ is upper semicontinuous.
(a) Use condition (iii) of Theorem 29.1, Fatou's lemma, and (21.9) to show that, if $\mu_{n} \Rightarrow \mu$ and $f$ is bounded and lower semicontinuous, then

$$
\begin{equation*}
\lim \inf _{n} / f d \mu_{n} \geq \int f d \mu \tag{29.9}
\end{equation*}
$$

(b) Show that, if (29.9) holds for all bounded, lower semicontinuous functions $f$, then $\mu_{n} \Rightarrow \mu$.
(c) Prove the analogous results for upper semicontinuous functions.
29.2. (a) Show for probability measures on the line that $\mu_{n} \times \nu_{n} \Rightarrow \mu \times \nu$ if and only if $\mu_{n} \Rightarrow \mu$ and $\nu_{n} \Rightarrow \nu$.
(b) Suppose that $X_{n}$ and $Y_{n}$ are independent and that $X$ and $Y$ are independent. Show that, if $X_{n} \Rightarrow X$ and $Y_{n} \Rightarrow Y$, then $\left(X_{n}, Y_{n}\right) \Rightarrow(X, Y)$ and hence that $X_{n}+Y_{n} \Rightarrow X+Y$.
(c) Show that part (b) fails without independence.
(d) If $F_{n} \Rightarrow F$ and $G_{n} \Rightarrow G$, then $F_{n} * G_{n} \Rightarrow F * G$. Prove this by part (b) and also by characteristic functions.
29.3. (a) Show that $\left\{\mu_{n}\right\}$ is tight if and only if for each $\epsilon$ there is a compact set $K$ such that $\mu_{n}(K)>1-\epsilon$ for all $n$.
(b) Show that $\left\{\mu_{n}\right\}$ is tight if and only if each of the $k$ sequences of marginal distributions is tight on the line.
29.4. Assume of $\left(X_{n}, Y_{n}\right)$ that $X_{n} \Rightarrow X$ and $Y_{n} \Rightarrow c$. Show that $\left(X_{n}, Y_{n}\right) \Rightarrow(X, c)$. This is an example of Problem 29.2(b) where $X_{n}$ and $Y_{n}$ need not be assumed independent.
29.5. Prove analogues for $R^{k}$ of the corollaries to Theorem 26.3.
29.6. Suppose that $f(X)$ and $g(Y)$ are uncorrelated for all bounded continuous $f$ and $g$. Show that $X$ and $Y$ are independent. Hint: Use characteristic functions.
29.7. $20.16 \dagger$ Suppose that the random vector $X$ has a centered $k$-dimensional normal distribution whose covariance matrix has 1 as an eigenvalue of multiplicity $r$ and 0 as an eigenvalue of multiplicity $k-r$. Show that $|X|^{2}$ has the chi-squared distribution with $r$ degrees of freedom.
29.8. $\uparrow$ Multinomial sampling. Let $p_{1}, \ldots, p_{k}$ be positive and add to 1 , and let $Z_{1}, Z_{2}, \ldots$ be independent $k$-dimensional random vectors such that $Z_{n}$ has with probability $p_{i}$ a 1 in the $i$ th component and 0 's elsewhere. Then $f_{n}= \left(f_{n 1}, \ldots, f_{n k}\right)=\sum_{m=1}^{n} Z_{m}$ is the frequency count for a sample of size $n$ from a multinomial population with cell probabilities $p_{i}$. Put $X_{n i}=\left(f_{n i}-n p_{i}\right) / \sqrt{n p_{i}}$ and $X_{n}=\left(X_{n 1}, \ldots, X_{n k}\right)$.
(a) Show that $X_{n}$ has mean values 0 and covariances $\sigma_{i j}=\left(\delta_{i j} p_{j}-\right. \left.p_{i} p_{j}\right) / \sqrt{p_{i} p_{j}}$.
(b) Show that the chi squared statistic $\sum_{i=1}^{k}\left(f_{n l}-n p_{i}\right)^{2} / n p_{i}$ has asymptotically the chi-squared distribution with $k-1$ degrees of freedom.
29.9. 20.26 ↑ A theorem of Poincaré. (a) Suppose that $X_{n}=\left(X_{n 1}, \ldots, X_{n n}\right)$ is uniformly distributed over the surface of a sphere of radius $\sqrt{n}$ in $R^{n}$. Fix $t$, and show that $X_{n 1}, \ldots, X_{n t}$ are in the limit independent, each with the standard normal distribution. Hint: If the components of $Y_{n}=\left(Y_{n 1}, \ldots, Y_{n n}\right)$ are independent, each with the standard normal distribution, then $X_{n}$ has the same distribution as $\sqrt{n} Y_{n} /\left|Y_{n}\right|$.
(b) Suppose that the distribution of $X_{n}=\left(X_{n 1}, \ldots, X_{n n}\right)$ is spherically symmetric in the sense that $X_{n} /\left|X_{n}\right|$ is uniformly distributed over the unit sphere. Assume that $\left|X_{n}\right|^{2} / n \Rightarrow 1$, and show that $X_{n 1}, \ldots, X_{n t}$ are asymptotically independent and normal.
29.10. Let $X_{n}=\left(X_{n 1}, \ldots, X_{n k}\right), n=1,2, \ldots$, be random vectors satisfying the mixing condition (27.19) with $\alpha_{n}=O\left(n^{-5}\right)$. Suppose that the sequence is stationary (the distribution of $\left(X_{n}, \ldots, X_{n+j}\right)$ is the same for all $n$ ), that $E\left[X_{n u}\right]=0$, and that the $X_{n u}$ are uniformly bounded. Show that if $S_{n}=X_{1}+\cdots+X_{n}$, then $S_{n} / \sqrt{n}$ has in the limit the centered normal distribution with covariances

$$
E\left[X_{1 u} X_{1 u}\right]+\sum_{j=1}^{\infty} E\left[X_{1 u} X_{1+j .1}\right]+\sum_{j=1}^{\infty} E\left[X_{1+j . u} X_{1 u}\right]
$$

Hint: Use the Cramér-Wold device.
29.11. $\uparrow$ As in Example 27.6, let $\left\{Y_{n}\right\}$ be a Markov chain with finite state space $S=\{1, \ldots, s\}$, say. Suppose the transition probabilities $p_{u l}$ are all positive and the initial probabilities $p_{u}$ are the stationary ones. Let $f_{n u}$ be the number of $i$ for which $1 \leq i \leq n$ and $Y_{i}=u$. Show that the normalized frequency count

$$
n^{-1 / 2}\left(f_{n 1}-n p_{1}, \ldots, f_{n k}-n p_{k}\right)
$$

has in the limit the centered normal distribution with covariances

$$
\delta_{u \imath}-p_{u} p_{\imath}+\sum_{j=1}^{\infty}\left(p_{u \imath}^{(j)}-p_{u} p_{\imath}\right)+\sum_{j=1}^{\infty}\left(p_{\imath u}^{(j)}-p_{\imath} p_{u}\right) .
$$

29.12. Assume that

$$
\Sigma=\left[\begin{array}{ll}
\sigma_{11} & \sigma_{12} \\
\sigma_{12} & \sigma_{22}
\end{array}\right]
$$

is positive definite, invert it explicitly, and show that the corresponding two-dimensional normal density is

$$
\begin{equation*}
f\left(x_{1}, x_{2}\right)=\frac{1}{2 \pi D^{1 / 2}} \exp \left[-\frac{1}{2 D}\left(\sigma_{22} x_{1}^{2}-2 \sigma_{12} x_{1} x_{2}+\sigma_{11} x_{2}^{2}\right)\right] \tag{29.10}
\end{equation*}
$$

where $D=\sigma_{11} \sigma_{22}-\sigma_{12}^{2}$.
29.13. Suppose that $Z$ has the standard normal distribution in $R^{1}$. Ler $\mu$ be the mixture with equal weights of the distributions of $(Z, Z)$ and $(Z,-Z)$, and let ( $X, Y$ ) have distribution $\mu$. Prove:
(a) Although each of $X$ and $Y$ is normal, they are not jointly normal.
(b) Although $X$ and $Y$ are uncorrelated, they are not independent.

## SECTION 30. THE METHOD OF MOMENTS*

## The Moment Problem

For some distributions the characteristic function is intractable but moments can nonetheless be calculated. In these cases it is sometimes possible to prove weak convergence of the distributions by establishing that the moments converge. This approach requires conditions under which a distribution is uniquely determined by its moments, and this is for the same reason that the continuity theorem for characteristic functions requires for its proof the uniqueness theorem.

Theorem 30.1. Let $\mu$ be a probability measure on the line having finite moments $\alpha_{k}=\int_{-\infty}^{\infty} x^{k} \mu(d x)$ of all orders. If the power series $\Sigma_{k} \alpha_{k} r^{k} / k!$ has a positive radius of convergence, then $\mu$ is the only probability measure with the moments $\alpha_{1}, \alpha_{2}, \ldots$.

Proof. Let $\beta_{k}=\int_{-\infty}^{\infty}|x|^{k} \mu(d x)$ be the absolute moments. The first step is to show that

$$
\begin{equation*}
\frac{\beta_{k} r^{k}}{k!} \rightarrow 0, \quad k \rightarrow \infty, \tag{30.1}
\end{equation*}
$$

for some positive $r$. By hypothesis there exists an $s, 0<s<1$, such that $\alpha_{k} s^{k} / k!\rightarrow 0$. Choose $0<r<s$; then $2 k r^{2 k-1}<s^{2 k}$ for large $k$. Since $|x|^{2 k-1} \leq 1+|x|^{2 k}$,

$$
\frac{\beta_{2 k-1} r^{2 k-1}}{(2 k-1)!} \leq \frac{r^{2 k-1}}{(2 k-1)!}+\frac{\beta_{2 k} s^{2 k}}{(2 k)!}
$$

for large $k$. Hence (30.1) holds as $k$ goes to infinity through odd values; since $\beta_{k}=\alpha_{k}$ for $k$ even, (30.1) follows.

By (26.4),

$$
\left|e^{i t x}\left(e^{i h x}-\sum_{k=0}^{n} \frac{(i h x)^{k}}{k!}\right)\right| \leq \frac{|h x|^{n+1}}{(n+1)!},
$$

and therefore the characteristic function $\varphi$ of $\mu$ satisfies

$$
\left|\varphi(t+h)-\sum_{k=0}^{n} \frac{h^{k}}{k!} \int_{-\infty}^{\infty}(i x)^{k} e^{i t x} \mu(d x)\right| \leq \frac{|h|^{n+1} \beta_{n+1}}{(n+1)!}
$$

[^6]By (26.10), the integral here is $\varphi^{(k)}(t)$. By (30.1),

$$
\begin{equation*}
\varphi(t+h)=\sum_{k=0}^{\infty} \frac{\varphi^{(k)}(t)}{k!} h^{k}, \quad|h| \leq r . \tag{30.2}
\end{equation*}
$$

If $\nu$ is another probability measure with moments $\alpha_{k}$ and characteristic function $\psi(t)$, the same argument gives

$$
\begin{equation*}
\psi(t+h)=\sum_{k=0}^{\infty} \frac{\psi^{(k)}(t)}{k!} h^{k}, \quad|h| \leq r . \tag{30.3}
\end{equation*}
$$

Take $t=0$; since $\varphi^{(k)}(0)=i^{k} \alpha_{k}=\psi^{(k)}(0)$ (see (26.9)), $\varphi$ and $\psi$ agree in $(-r, r)$ and hence have identical derivatives there. Taking $t=r-\epsilon$ and $t=-r+\epsilon$ in (30.2) and (30.3) shows that $\varphi$ and $\psi$ also agree in $(-2 r+\epsilon, 2 r -\epsilon$ ) and hence in ( $-2 r, 2 r$ ). But then they must by the same argument agree in ( $-3 r, 3 r$ ) as well, and so on. ${ }^{\dagger}$ Thus $\varphi$ and $\psi$ coincide, and by the uniqueness theorem for characteristic functions, so do $\mu$ and $\nu$. $\square$

A probability measure satisfying the conclusion of the theorem is said to be determined by its moments.

Example 30.1. For the standard normal distribution, $\mid \alpha_{k}!\leq k!$, and so the theorem implies that it is determined by its moments. $\square$

But not all measures are determined by their moments:
Example 30.2. If $N$ has the standard normal density, then $e^{N}$ has the log-normal derisity

$$
f(x)= \begin{cases}\frac{1}{\sqrt{2 \pi}} \frac{1}{x} e^{-(\log x)^{2} / 2} & \text { if } x>0, \\ 0 & \text { if } x \leq 0 .\end{cases}
$$

Put $g(x)=f(x)(1+\sin (2 \pi \log x))$. If

$$
\int_{0}^{\infty} x^{k} f(x) \sin (2 \pi \log x) d x=0, \quad k=0,1,2, \ldots
$$

then $g$, which is nonnegative, will be a probability density and will have the same moments as $f$. But a change of variable $\log x=s+k$ reduces the

[^7]integral above to
$$
\frac{1}{\sqrt{2 \pi}} e^{k^{2} / 2} \int_{-\infty}^{\infty} e^{-s^{2} / 2} \sin 2 \pi s d s
$$
which vanishes because the integrand is odd.
Theorem 30.2. Suppose that the distribution of $X$ is determined by its moments, that the $X_{n}$ have moments of all orders, and that $\lim _{n} E\left[X_{n}^{r}\right]= E\left[X^{r}\right]$ for $r=1,2, \ldots$. Then $X_{n} \Rightarrow X$.

Proof. Let $\mu_{n}$ and $\mu$ be the distributions of $X_{n}$ and $X$. Since $E\left[X_{n}^{2}\right]$ converges, it is bounded, say by $K$. By Markov's inequality, $P\left[\left|X_{n}\right| \geq x\right] \leq K / x^{2}$, which implies that the sequence $\left\{\mu_{n}\right\}$ is tight.

Suppose that $\mu_{n_{k}} \Rightarrow \nu$, and let $Y$ be a random variable with distribution $\nu$. If $u$ is an even integer exceeding $r$, the convergence and hence boundedness of $E\left[X_{n}^{u}\right]$ implies that $E\left[X_{n_{k}}^{r}\right] \rightarrow E\left[Y^{r}\right]$, by the corollary to Theorem 25.12. By the hypothesis, then, $E\left[Y^{r}\right]=E\left[X^{r}\right]$-that is, $\nu$ and $\mu$ have the same moments. Since $\mu$ is by hypothesis determined by its moments, $\nu$ must be the same as $\mu$, and so $\mu_{n_{k}} \Rightarrow \mu$. The conclusion now follows by the corollary to Theorem 25.10.

Convergence to the log-normal distribution cannot be proved by establishing convergence of moments (take $X$ to have density $f$ and the $X_{n}$ to have density $g$ in Example 30.2). Because of Example 30.1, however, this approach will work for a normal limit.

## Moment Generating Functions

Suppose that $\mu$ has a moment generating function $M(s)$ for $s \in\left[-s_{0}, s_{0}\right]$, $s_{0}>0$. By (21.22), the hypothesis of Theorem 30.1 is satisfied, and so $\mu$ is determined by its moments, which are in turn determined by $M(s)$ via (21.23). Thus $\mu$ is determined by $M(s)$ if it exists in a neighborhood of $0 .^{\dagger}$ The version of this for one-sided transforms was proved in Section 22-see Theorem 22.2.

Suppose that $\mu_{n}$ and $\mu$ have moment generating functions in a common interval $\left[-s_{0}, s_{0}\right], s_{0}>0$, and suppose that $M_{n}(s) \rightarrow M(s)$ in this interval. Since $\mu_{n}\left[(-a, a)^{c}\right] \leq e^{-s_{0} a}\left(M_{n}\left(-s_{0}\right)+M_{n}\left(s_{0}\right)\right)$, it follows easily that $\left\{\mu_{n}\right\}$ is tight. Since $M(s)$ determines $\mu$, the usual argument now gives $\mu_{n} \Rightarrow \mu$.

[^8]
## Central Limit Theorem by Moments

To understand the application of the method of moments, consider once again a sum $S_{n}=X_{n 1}+\cdots+X_{n k_{n}}$, where $X_{n 1}, \ldots, X_{n k_{n}}$ are independent and

$$
\begin{equation*}
E\left[X_{n k}\right]=0, \quad E\left[X_{n k}^{2}\right]=\sigma_{n k}^{2}, \quad s_{n}^{2}=\sum_{k=1}^{k_{n}} \sigma_{n k}^{2} \tag{30.4}
\end{equation*}
$$

Suppose further that for each $n$ there is an $M_{n}$ such that $\left|X_{n k}\right| \leq M_{n}$, $k=1, \ldots, k_{n}$, with probability 1 . Finally, suppose that

$$
\begin{equation*}
\frac{M_{n}}{s_{n}} \rightarrow 0 . \tag{30.5}
\end{equation*}
$$

All moments exist, and ${ }^{\dagger}$

$$
\begin{equation*}
S_{n}^{r}=\sum_{u=1}^{r} \sum^{\prime} \frac{r!}{r_{1}!\cdots r_{u}!} \frac{1}{u!} \sum^{\prime \prime} X_{n t_{1}}^{r_{1}} \cdots X_{n i_{u}}^{r_{u}}, \tag{30.6}
\end{equation*}
$$

where $\Sigma^{\prime}$ extends over the $u$-tuples ( $r_{1}, \ldots, r_{u}$ ) of positive integers satisfying $r_{1}+\cdots+r_{u}=r$ and $\sum^{\prime \prime}$ extends over the $u$-tuples ( $i_{1}, \ldots, i_{u}$ ) of distinct integers in the range $1 \leq i_{\alpha} \leq k_{n}$.

By independence, then,

$$
\begin{equation*}
E\left[\left(\frac{S_{n}}{s_{n}}\right)^{r}\right]=\sum_{u=1}^{r} \sum^{\prime} \frac{r!}{r_{1}!\cdots r_{u}!} \frac{1}{u!} A_{n}\left(r_{1}, \ldots, r_{u}\right), \tag{30.7}
\end{equation*}
$$

where

$$
\begin{equation*}
A_{n}\left(r_{1}, \ldots, r_{u}\right)=\sum^{\prime \prime} \frac{1}{s_{n}^{r}} E\left[X_{n t_{1}}^{r_{1}}\right] \cdots E\left[X_{n t_{n}}^{r_{n}}\right] \tag{30.8}
\end{equation*}
$$

and $\Sigma^{\prime}$ and $\Sigma^{\prime \prime}$ have the same ranges as before. To prove that (30.7) converges to the $r$ th moment of the standard normal distribution, it suffices to show that

$$
\lim _{n} A_{n}\left(r_{1}, \ldots, r_{u}\right)=\left\{\begin{array}{ll}
1 & \text { if } r_{1}=\cdots=r_{u}=2  \tag{30.9}\\
0 & \text { otherwise }
\end{array} .\right.
$$

Indeed, if $r$ is even, all terms in (30.7) will then go to 0 except the one for which $u=r / 2$ and $r_{\alpha} \equiv 2$, which will go to $r!/\left(r_{1}!\cdots r_{u}!u!\right)=1 \times 3 \times 5 \times \cdots \times(r-1)$. And if $r$ is odd, the terms will go to 0 without exception.
${ }^{\dagger}$ To deduce this from the multinomial formula, restrict the inner sum to $u$-tuples satisfying $1 \leq i_{1}<\cdots<i_{u} \leq k_{n}$ and compensate by striking out the $1 / u!$.

If $r_{\alpha}=1$ for some $\alpha$, then (30.9) holds because by (30.4) each summand in (30.8) vanishes. Suppose that $r_{\alpha} \geq 2$ for each $\alpha$ and $r_{\alpha}>2$ for some $\alpha$. Then $r>2 u$, and since $\left|E\left[X_{n i}^{r_{q}}\right]\right| \leq M_{n}^{\left(r_{\alpha}-2\right)} \sigma_{n i}^{2}$, it follows that $A_{n}\left(r_{1}, \ldots, r_{u}\right) \leq \left(M_{n} / s_{n}\right)^{r-2 u} A_{n}(2, \ldots, 2)$. But this goes to 0 because (30.5) holds and because $A_{n}(2, \ldots, 2)$ is bounded by 1 (it increases to 1 if the sum in (30.8) is enlarged to include all the $u$-tuples $\left(i_{1}, \ldots, i_{u}\right)$ ).

It remains only to check (30.9) for $r_{1}=\cdots=r_{u}=2$. As just noted, $A_{n}(2, \ldots, 2)$ is at most 1 , and it differs from 1 by $\sum s_{n}^{-2 u} \sigma_{n i_{k}}^{2}$, the sum extending over the ( $i_{1}, \ldots, i_{u}$ ) with at least one repeated index. Since $\sigma_{n i}^{2} \leq M_{n}^{2}$, the terms for example with $i_{u}=i_{u-1}$ sum to at most $M_{n}^{2} s_{n}^{-2 u} \sum \sigma_{n i_{1}}^{2} \cdots \sigma_{n i_{u-1}}^{2} \leq M_{n}^{2} s_{n}^{-2}$. Thus $1-A_{n}(2, \ldots, 2) \leq u^{2} M_{n}^{2} s_{n}^{-2} \rightarrow 0$.

This proves that the moments ( 307 ) converge to those of the normal distribution and hence that $S_{n} / s_{n} \Rightarrow N$

## Application to Sampling Theory

Suppose that $n$ numbers

$$
x_{n 1}, x_{n 2}, \ldots, x_{n n},
$$

not necessarily distinct, are associated with the elements of a population of size $n$. Suppose that these numbers are normalized by the requirement

$$
\begin{equation*}
\sum_{h=1}^{n} x_{n ' h}=0, \quad \sum_{h=1}^{n} x_{n h}^{2}=1, \quad M_{n}=\max _{h \leq n}\left|x_{n h}\right| . \tag{30.10}
\end{equation*}
$$

An ordered sample $X_{n 1}, \ldots, X_{n k_{n}}$ is taken, where the sampling is without replacement. By (30.10), $E\left[X_{n k}\right]=0$ and $E\left[X_{n k}^{2}\right]=1 / n$. Let $s_{n}^{2}=k_{n} / n$ be the fraction of the population sampled. If the $X_{n k}$ were independent, which they are not, $S_{n}=X_{n 1}+\cdots+X_{n k_{n}}$ would have variance $s_{n}^{2}$. If $k_{n}$ is small in comparison with $n$, the effects of dependence should be small. It will be shown that $S_{n} / s_{n} \Rightarrow N$ if

$$
\begin{equation*}
s_{n}^{2}=\frac{k_{n}}{n} \rightarrow 0, \quad \frac{M_{n}}{s_{n}} \rightarrow 0, \quad k_{n} \rightarrow \infty . \tag{30.11}
\end{equation*}
$$

Since $M_{n}^{2} \geq n^{-1}$ by (30.10), the second condition here in fact implies the third.

The moments again have the form (30.7), but this time $E\left[X_{n i_{1}}^{r_{1}} \cdots X_{n i_{u}}^{r_{u}}\right]$ cannot be factored as in (30.8). On the other hand, this expected value is by symmetry the same for each of the $\left(k_{n}\right)_{u}=k_{n}\left(k_{n}-1\right) \cdots\left(k_{n}-u+1\right)$ choices of the indices $i_{\alpha}$ in the sum $\Sigma^{\prime \prime}$. Thus

$$
A_{n}\left(r_{1}, \ldots, r_{u}\right)=\frac{\left(k_{n}\right)_{u}}{s_{n}^{r}} E\left[X_{n 1}^{r_{1}} \cdots X_{n u}^{r_{u}}\right] .
$$

The problem again is to prove (30.9).

The proof goes by induction on $u$. Now $A_{n}(r)=k_{n} s_{n}^{-r} n^{-1} \sum_{h=1}^{n} x_{n h}^{r}$, so that $A_{n}(1)=0$ and $A_{n}(2)=1$. If $r \geq 3$, then $\left|x_{n h}^{r}\right| \leq M_{n}^{r-2} x_{n h}^{2}$, and so $\left|A_{n}(r)\right| \leq \left(M_{n} / s_{n}\right)^{r-2} \rightarrow 0$ by (30.11).

Next suppose as induction hypothesis that (30.9) holds with $u-1$ in place of $u$. Since the sampling is without replacement, $E\left[X_{n 1}^{r_{1}} \cdots X_{n_{u}}^{r_{u}}\right]=\sum x_{n h_{1}}^{r_{1}} \cdots x_{n h_{u}}^{r_{u_{u}}} /(n)_{u}$, where the summation extends over the $u$-tuples ( $h_{1}, \ldots, h_{u}$ ) of distinct integers in the range $1 \leq h_{\alpha} \leq n$. In this last sum enlarge the range by requiring of $\left(h_{1}, h_{2}, \ldots, h_{u}\right)$ only that $h_{2}, \ldots, h_{u}$ be distinct, and then compensate by subtracting away the terms where $h_{1}=h_{2}$, where $h_{1}=h_{3}$, and so on. The result is

$$
\begin{aligned}
E\left[X_{n 1}^{r} \cdots X_{n u}^{r_{u}}\right]= & \frac{n(n)_{u-1}}{(n)_{u}} E\left[X_{n 1}^{r}\right] E\left[X_{n 2}^{r 2} \cdots X_{n u}^{r_{u}}\right] \\
& -\sum_{\alpha=2}^{u} \frac{(n)_{u-1}}{(n)_{u}} E\left[X_{n 2}^{r 2} \cdots X_{n \alpha}^{r_{1}+r_{\alpha}} \cdots X_{r u}^{r_{u}}\right] .
\end{aligned}
$$

This takes the place of the factorization made possible in (30.8) by the assumed independence there. It gives

$$
\begin{aligned}
A_{n}\left(r_{1}, \ldots, r_{u}\right)= & \frac{n}{n-u+1} \frac{k_{n}-u+1}{k_{n}} A_{n}\left(r_{1}\right) A_{n}\left(r_{2}, \ldots, r_{u}\right) \\
& -\frac{k_{n}-u+1}{n-u+1} \sum_{\alpha=2}^{u} A_{n}\left(r_{2}, \ldots, r_{1}+r_{\alpha}, \ldots, r_{u}\right)
\end{aligned}
$$

By the induction hypothesis the last sum is bounded, and the factor in front goes to 0 by (30.11). As for the first term on the right, the factor in front goes to 1 . If $r_{1} \neq 2$, then $A_{n}\left(r_{1}\right) \rightarrow 0$ and $A_{n}\left(r_{2}, \ldots, r_{u}\right)$ is bounded, and so $A_{n}\left(r_{1}, \ldots, r_{u}\right) \rightarrow 0$. The same holds by symmetry if $r_{\alpha} \neq 2$ for some $\alpha$ other than 1 . If $r_{1}=\cdots=r_{u}=2$, then $A_{n}\left(r_{1}\right)=1$, and $A_{n}\left(r_{2}, \ldots, r_{u}\right) \rightarrow 1$ by the induction hypothesis.

Thus (30.9) holds in all cases, and $S_{n} / s_{n} \Rightarrow N$ follows by the method of moments.

## Application to Number Theory

Let $g(m)$ be the number of distinct prime factors of the integer $m$; for example $g\left(3^{4} \times 5^{2}\right)=2$. Since there are infinitely many primes, $g(m)$ is unbounded above; for the same reason, it drops back to 1 for infinitely many $m$ (for the primes and their powers). Since $g$ fluctuates in an irregular way, it is natural to inquire into its average behavior.

On the space $\Omega$ of positive integers, let $P_{n}$ be the probability measure that places mass $1 / n$ at each of $1,2, \ldots, n$, so that among the first $n$ positive
integers the proportion that are contained in a given set $A$ is just $P_{n}(A)$. The problem is to study $P_{n}[m: g(m) \leq x]$ for large $n$.

If $\delta_{p}(m)$ is 1 or 0 according as the prime $p$ divides $m$ or not, then

$$
\begin{equation*}
g(m)=\sum_{p} \delta_{p}(m) . \tag{30.12}
\end{equation*}
$$

Probability theory can be used to investigate this sum because under $P_{n}$ the $\delta_{p}(m)$ behave somewhat like independent random variables. If $p_{1}, \ldots, p_{u}$ are distinct primes, then by the fundamental theorem of arithmetic, $\delta_{p_{1}}(m)= \cdots=\delta_{p_{u}}(m)=1$-that is, each $p_{i}$ divides $m$-if and only if the product $p_{1} \cdots p_{u}$ divides $m$. The probability under $P_{n}$ of this is just $n^{-1}$ times the number of $m$ in the range $1 \leq m \leq n$ that are multiples of $p_{1} \cdots p_{u}$, and this number is the integer part of $n / p_{1} \cdots p_{u}$. Thus

$$
\begin{equation*}
P_{n}\left[m: \delta_{p_{i}}(m)=1, i=1, \ldots, u\right]=\frac{1}{n}\left|\frac{n}{p_{1} \cdots p_{u}}\right| \tag{30.13}
\end{equation*}
$$

for distinct $p_{i}$.
Now let $X_{p}$ be independent random variables (on some probability space, one variable for each prime $p$ ) satisfying

$$
P\left[X_{p}=1\right]=\frac{1}{p}, \quad P\left[X_{p}=0\right]=1-\frac{1}{p}
$$

If $p_{1}, \ldots, p_{u}$ are distinct, then

$$
\begin{equation*}
P\left[X_{p_{i}}=1, i=1, \ldots, u\right]=\frac{1}{p_{1} \cdots p_{u}} \tag{30.14}
\end{equation*}
$$

For fixed $p_{1}, \ldots, p_{u}$, (30.13) converges to (30.14) as $n \rightarrow \infty$. Thus the behavior of the $X_{p}$ can serve as a guide to that of the $\delta_{p}(m)$. If $m \leq n$, (30.12) is $\sum_{p \leq n} \delta_{p}(m)$, because no prime exceeding $m$ can divide it. The idea ${ }^{\dagger}$ is to compare this sum with the corresponding sum $\sum_{p \leq n} X_{p}$.

This will require from number theory the elementary estimate ${ }^{\ddagger}$

$$
\begin{equation*}
\sum_{p \leq x} \frac{1}{p}=\log \log x+O(1) \tag{30.15}
\end{equation*}
$$

The mean and variance of $\sum_{p \leq n} X_{p}$ are $\sum_{p \leq n} p^{-1}$ and $\sum_{p \leq n} p^{-1}\left(1-p^{-1}\right)$; since $\Sigma_{p} p^{-2}$ converges, each of these two sums is asymptotically $\log \log n$.

[^9]Comparing $\sum_{p \leq n} \delta_{p}(m)$ with $\sum_{p \leq n} X_{p}$ then leads one to conjecture the Erdös-Kac central limit theorem for the prime divisor function:

Theorem 30.3. For all $x$,

$$
\begin{equation*}
P_{n}\left[m: \frac{g(m)-\log \log n}{\sqrt{\log \log n}} \leq x\right] \rightarrow \frac{1}{\sqrt{2 \pi}} \int_{-\infty}^{x} e^{-u^{2} / 2} d u . \tag{30.16}
\end{equation*}
$$

Proof. The argument uses the method of moments. The first step is to show that (30.16) is unaffected if the range of $p$ in (30.12) is further restricted. Let $\left\{\alpha_{n}\right\}$ be a sequence going to infinity slowly enough that

$$
\begin{equation*}
\frac{\log \alpha_{n}}{\log n} \rightarrow 0 \tag{30.17}
\end{equation*}
$$

but fast enough that

$$
\begin{equation*}
\sum_{\alpha_{n}<p \leq n} \frac{1}{p}=o(\log \log n)^{1 / 2} . \tag{30.18}
\end{equation*}
$$

Because of (30.15), these two requirements are met if, for example, $\log \alpha_{n}= (\operatorname{Iog} n) / \log \log n$.

Now define

$$
\begin{equation*}
g_{n}(m)=\sum_{p \leq \alpha_{n}} \delta_{p}(m) . \tag{30.19}
\end{equation*}
$$

For a function $f$ of positive integers, iet

$$
E_{n}[f]=n^{-1} \sum_{m=1}^{n} f(m)
$$

denote its expected value computed with respect to $P_{n}$. By (30.13) for $u=1$,

$$
E_{n}\left[\sum_{p>\alpha_{n}} \delta_{p}\right]=\sum_{\alpha_{n}<p \leq n} P_{n}\left[m: \delta_{p}(m)=1\right] \leq \sum_{\alpha_{n}<p \leq n} \frac{1}{p} .
$$

By (30.18) and Markov's inequality,

$$
P_{n}\left[m:\left|g(m)-g_{n}(m)\right| \geq \epsilon(\log \log n)^{1 / 2}\right] \rightarrow 0 .
$$

Therefore (Theorem 25.4), (30.16) is unaffected if $g_{n}(m)$ is substituted for $g(m)$.

Now compare (30.19) with the corresponding sum $S_{n}=\sum_{p \leq \alpha_{n}} X_{p}$. The mean and variance of $S_{n}$ are

$$
c_{n}=\sum_{p \leq \alpha_{n}} \frac{1}{p}, \quad s_{n}^{2}=\sum_{p \leq \alpha_{n}} \frac{1}{p}\left(1-\frac{1}{p}\right),
$$

and each is $\log \log n+o(\log \log n)^{1 / 2}$ by (30.18). Thus (see Example 25.8), (30.16) with $g(m)$ replaced as above is equivalent to

$$
\begin{equation*}
P_{n}\left[m: \frac{g_{n}(m)-c_{n}}{s_{n}} \leq x\right] \rightarrow \frac{1}{\sqrt{2 \pi}} \int_{-\infty}^{x} e^{-u^{2} / 2} d u \tag{30.20}
\end{equation*}
$$

It therefore suffices to prove (30.20).
Since the $X_{p}$ are bounded, the analysis of the moments (30.7) applies here. The only difference is that the summands in $S_{n}$ are indexed not by the integers $k$ in the range $k \leq k_{n}$ but by the primes $p$ in the range $p \leq \alpha_{n}$; also, $X_{p}$ must be replaced by $X_{p}-p^{-1}$ to center it. Thus the $r$ th moment of $\left(S_{n}-c_{n}\right) / s_{n}$ converges to that of the normal distribution, and so (30.20) and (30.16) will follow by the method of moments if it is shown that as $n \rightarrow \infty$,

$$
\begin{equation*}
E\left[\left(\frac{S_{n}-c_{n}}{s_{n}}\right)^{r}\right]-E_{n}\left[\left(\frac{g_{n}-c_{n}}{s_{n}}\right)^{r}\right] \rightarrow 0 \tag{30.21}
\end{equation*}
$$

for each $r$.
Now $E\left[S_{n}^{\prime}\right]$ is the sum

$$
\begin{equation*}
\sum_{u=1}^{r} \sum^{\prime} \frac{r!}{r_{1}!\cdots r_{u}!} \frac{1}{u!} \sum^{\prime \prime} E\left[X_{p_{1}}^{r_{1}} \cdots X_{p_{u}}^{r_{u}}\right], \tag{30.22}
\end{equation*}
$$

where the range of $\Sigma^{\prime}$ is as in (30.6) and (30.7), and $\Sigma^{\prime \prime}$ extends over the $u$-tuples ( $p_{1}, \ldots, p_{u}$ ) of distinct primes not exceeding $\alpha_{n}$. Since $X_{p}$ assumes only the values 0 and 1 , from the independence of the $X_{p}$ and the fact that the $p_{i}$ are distinct, it follows that the summand in (30.22) is

$$
\begin{equation*}
E\left[X_{p_{1}} \cdots X_{p_{u}}\right]=\frac{1}{p_{1} \cdots p_{u}} . \tag{30.23}
\end{equation*}
$$

By the definition (30.19), $E_{n}\left[g_{n}^{r}\right]$ is just (30.22) with the summand replaced by $E_{n}\left[\delta_{p_{1}}^{r_{1}} \cdots \delta_{p_{u}}^{r_{u}}\right]$. Since $\delta_{p}(m)$ assumes only the values 0 and 1 , from (30.13) and the fact that the $p_{i}$ are distinct, it follows that this summand is

$$
\begin{equation*}
E_{n}\left[\delta_{p_{1}} \cdots \delta_{p_{u}}\right]=\frac{1}{n}\left\lfloor\frac{n}{p_{1} \cdots p_{u}}\right\rfloor \tag{30.24}
\end{equation*}
$$

But (30.23) and (30.24) differ by at most $1 / n$, and hence $E\left[S_{n}^{r}\right]$ and $E_{n}\left[g_{n}^{r}\right]$ differ by at most the sum (30.22) with the summand replaced by $1 / n$. Therefore,

$$
\begin{equation*}
\left|E\left[S_{n}^{r}\right]-E_{n}\left[g_{n}^{r}\right]\right| \leq \frac{1}{n}\left(\sum_{p \leq \alpha_{n}} 1\right)^{r} \leq \frac{\alpha_{n}^{r}}{n} . \tag{30.25}
\end{equation*}
$$

Now

$$
E\left[\left(S_{n}-c_{n}\right)^{r}\right]=\sum_{k=0}^{r}\binom{r}{k} E\left[S_{n}^{k}\right]\left(-c_{n}\right)^{-\alpha},
$$

and $E_{n}\left[\left(g_{n}-c_{n}\right)^{r}\right]$ has the analogous expansion. Comparing the two expansions term for term and applying (30.25) shows that

$$
\begin{align*}
& \left|E\left[\left(S_{n}-c_{n}\right)^{r}\right]-E_{n}\left[\left(g_{n}-c_{n}\right)^{r}\right]\right|  \tag{30.26}\\
& \quad \leq \sum_{k=0}^{r}\binom{r}{k} \frac{\alpha_{n}^{k}}{n} c_{n}^{r-k}=\frac{1}{n}\left(\alpha_{n}+c_{n}\right)^{r}
\end{align*}
$$

Since $c_{n} \leq \alpha_{n}$, and since $\alpha_{n}^{r} / n \rightarrow 0$ by (30.17), (30.21) follows as required.
The method of proof requires passing from (30.12) to (30.19). Without this, the $\alpha_{n}$ on the right in (30.26) would instead be $n$, and it would not follow that the difference on the left goes to 0 ; hence the truncation (30.19) for an $\alpha_{n}$ small enough to satisfy (30.17). On the other hand, $\alpha_{n}$ must be large enough to satisfy (30.18), in order that the truncation leave (30.16) unaffected.

## PROBLEMS

30.1. From the central limit theorem under the assumption (30.5) get the full Lindeberg theorem by a truncation argument.
30.2. For a sample of size $k_{n}$ with replacement from a population of size $n$, the probability of no duplicates is $\prod_{j=0}^{k}{ }_{0}^{-1}(1-j / n)$. Under the assumption $k_{n} / \sqrt{n} \rightarrow 0$ in addition to (30.10), deduce the asymptotic normality of $S_{n}$ by a reduction to the independent case.
30.3. By adapting the proof of (21.24), show that the moment generating function of $\mu$ in an arbitrary interval determines $\mu$.
30.4. $25.1330 .3 \uparrow$ Suppose that the moment generating function of $\mu_{n}$ converges to that of $\mu$ in some interval. Show that $\mu_{n} \Rightarrow \mu$.
30.5. Let $\mu$ be a probability measure on $R^{k}$ for which $f_{R^{k}}\left|x_{i}\right|^{r} \mu(d x)<\infty$ for $i= 1, \ldots, k$ and $r=1,2, \ldots$. Consider the cross moments

$$
\alpha\left(r_{1}, \ldots, r_{k}\right)=\int_{R^{k}} x_{1}^{r_{1}} \cdots x_{k}^{r_{k}} \mu(d x)
$$

for nonnegative integers $r_{i}$.
(a) Suppose for each $i$ that

$$
\begin{equation*}
\sum_{r} \frac{\theta^{r}}{r!} \int_{R^{k}}\left|x_{i}\right|^{r} \mu(d x) \tag{30.27}
\end{equation*}
$$

has a positive radius of convergence as a power series in $\theta$. Show that $\mu$ is determined by its moments in the sense that, if a probability measure $\nu$ satisfies $\alpha\left(r_{1}, \ldots, r_{k}\right)=\int x_{1}^{r_{1}} \cdot x_{k}^{r_{k}} \nu(d x)$ for all $r_{1}, \ldots r_{k}$, then $\nu$ coincides with $\mu$.
(b) Show that a $k$-dimensional normal distribution is determined by its moments.
30.6. $\uparrow$ Let $\mu_{n}$ and $\mu$ be probability measures on $R^{k}$. Suppose that for each $i$, (30.27) has a positive radius of convergence. Suppose that

$$
\int_{R^{k}} x_{1}^{r_{1}} \cdots x_{k}^{r_{k}} \mu_{n}(d x) \rightarrow \int_{R^{k}} x_{1}^{r_{1}} \cdots x_{k}^{r_{k}} \mu(d x)
$$

for all nonnegative integers $r_{1}, \ldots, r_{k}$. Show that $\mu_{n} \Rightarrow \mu$.
30.7. $30.5 \uparrow$ Suppose that $X$ and $Y$ are bounded random variables and that $X^{m}$ and $Y^{n}$ are uncorrelated for $m, n=1,2, \ldots$. Show that $X$ and $Y$ are independent.
30.8. $26.1730 .6 \dagger$ (a) In the notation (26.32), show for $\lambda \neq 0$ that

$$
\begin{equation*}
M\left[(\cos \lambda x)^{r}\right]=\binom{r}{r / 2} \frac{1}{2^{r}} \tag{30.28}
\end{equation*}
$$

for even $r$ and that the mean is 0 for odd $r$. It follows by the method of moments that $\cos \lambda x$ has a distribution in the sense of (25.18), and in fact of course the relative measure is

$$
\begin{equation*}
\rho[x: \cos \lambda x \leq u]=1-\frac{1}{\pi} \arccos u, \quad-1<u<1 . \tag{30.29}
\end{equation*}
$$

(b) Suppose that $\lambda_{1}, \lambda_{2}, \ldots$ are linearly independent over the field of rationals in the sense that, if $n_{1} \lambda_{1}+\cdots+n_{m} \lambda_{m}=0$ for integers $n_{\nu}$, then $n_{1}=\cdots= n_{m}=0$. Show that

$$
\begin{equation*}
M\left[\prod_{\nu=1}^{k}\left(\cos \lambda_{\nu} x\right)^{r_{\nu}}\right]=\prod_{\nu=1}^{k} M\left[\left(\cos \lambda_{\nu} x\right)^{r_{\nu}}\right] \tag{30.30}
\end{equation*}
$$

for nonnegative integers $r_{1}, \ldots, r_{k}$.
(c) Let $X_{1}, X_{2}, \ldots$ be independent and have the distribution function on the right in (30.29). Show that

$$
\begin{equation*}
\rho\left[x: \sum_{j=1}^{k} \cos \lambda_{j} x \leq u\right]=P\left[X_{1}+\cdots+X_{k} \leq u\right] . \tag{30.31}
\end{equation*}
$$

(d) Show that

$$
\begin{equation*}
\lim _{k \rightarrow \infty} \rho\left[x: u_{1}<\sqrt{\frac{2}{k}} \sum_{j=1}^{k} \cos \lambda_{j} x \leq u_{2}\right]=\frac{1}{\sqrt{2 \pi}} \int_{u_{1}}^{u_{2}} e^{-i^{2} / 2} d u . \tag{30.32}
\end{equation*}
$$

For a signal that is the sum of a large number of pure cosine signals with incommensurable frequencies, (30.32) describes the relative amount of time the signal is between $u_{1}$ and $u_{2}$.
30.9. 6.16 ↑ From (30.16), deduce once more the Hardy-Ramanujan theorem (see (6.10)).
30.10. $\uparrow$ (a) Prove that (if $P_{n}$ puts probability $1 / n$ at $1, \ldots, n$ )

$$
\begin{equation*}
\lim _{n} P_{n}\left[m:\left|\frac{\log \log m-\log \log n}{\sqrt{\log \log n}}\right| \geq \epsilon\right]=0 . \tag{30.33}
\end{equation*}
$$

(b) From (30.16) deduce that (see (2.35) for the notation)

$$
\begin{equation*}
D\left[m: \frac{g(m)-\log \log m}{\sqrt{\log \log m}} \leq x\right]=\frac{1}{\sqrt{2 \pi}} \int_{-\infty}^{x} e^{-u^{2} / 2} d u . \tag{30.34}
\end{equation*}
$$

30.11. ↑ Let $G(m)$ be the number of prime factors in $m$ with multiplicity counted. In the notation of Problem 5.19, $G(m)=\sum_{p} \alpha_{p}(m)$.
(a) Show for $k \geq 1$ that $P_{n}\left[m: \alpha_{p}(m)-\delta_{p}(m) \geq k\right] \leq 1 / p^{k+1}$; hence $E_{n}\left[\alpha_{p}-\right. \left.\delta_{p}\right] \leq 2 / p^{2}$.
(b) Show that $E_{n}[G-g]$ is bounded.
(c) Deduce from (30.16) that

$$
P_{n}\left[m: \frac{G(m)-\log \log n}{\sqrt{\log \log n}} \leq x\right] \rightarrow \frac{1}{\sqrt{2 \pi}} \int_{-\infty}^{x} e^{-u^{2} / 2} d u .
$$

(d) Prove for $G$ the analogue of (30.34).
30.12. ↑ Prove the Hardy-Ramanujan theorem in the form

$$
D\left[m:\left|\frac{g(m)}{\log \log m}-1\right| \geq \epsilon\right]=0 .
$$

Prove this with $G$ in place of $g$.

## Derivatives and Conditional Probability

## SECTION 31. DERIVATIVES ON THE LINE*

This section on Lebesgue's theory of derivatives for real functions of a real variable serves to introduce the general theory of Radon-Nikodym derivatives, which underlies the modern theory of conditional probability. The results here are interesting in themselves and will be referred to later for purposes of illustration and comparison, but they will not be required in subsequent proofs.

## The Fundamental Theorem of Calculus

To what extent are the operations of integration and differentiation inverse to one another? A function $F$ is by definition an indefinite integral of another function $f$ on $[a, b]$ if

$$
\begin{equation*}
F(x)-F(a)=\int_{a}^{x} f(t) d t \tag{31.1}
\end{equation*}
$$

for $a \leq x \leq b ; F$ is by definition a primitive of $f$ if it has derivative $f$ :

$$
\begin{equation*}
F^{\prime}(x)=f(x) \tag{31.2}
\end{equation*}
$$

for $a \leq x \leq b$. According to the fundamental theorem of calculus (see(17.5)), these concepts coincide in the case of continuous $f$ :

Theorem 31.1. Suppose that $f$ is continuous on $[a, b]$.
(i) An indefinite integral of $f$ is a primitive of $f$ : if (31.1) holds for all $x$ in $[a, b]$, then so does (31.2).
(ii) A primitive of $f$ is an indefinite integral of $f$ : if (31.2) holds for all $x$ in $[a, b]$, then so does (31.1).

[^10]A basic problem is to investigate the extent to which this theorem holds if $f$ is not assumed continuous. First consider part (i). Suppose $f$ is integrable, so that the right side of (31.1) makes sense. If $f$ is 0 for $x<m$ and 1 for $x \geq m(a<m<b)$, then an $F$ satisfying (31.1) has no derivative at $m$. It is thus too much to ask that (31.2) hold for all $x$. On the other hand, according to a famous theorem of Lebesgue, if (31.1) holds for all $x$, then (31.2) holds almost everywhere-that is, except for $x$ in a set of Lebesgue measure 0 . In this section almost everywhere will refer to Lebesgue measure only. This result, the most one could hope for, will be proved below (Theorem 31.3).

Now consider part (ii) of Theorem 31.1. Suppose that (31.2) holds almost everywnere, as in Lebesgue's theorem, just stated. Does (31.1) follow? The answer is no: If $f$ is identically 0 , and if $F(x)$ is 0 for $x<m$ and 1 for $x \geq m$ ( $a<m<b$ ), then (31.2) holds almost everywhere, but (31.1) fails for $x \geq m$. The question was wrongly posed, and the trouble is not far to seek: If $f$ is integrable and (31.1) holds, then

$$
\begin{equation*}
F(x+h)-F(x)=\int_{a}^{b} I_{(x, x+h)}(t) f(t) d t \rightarrow 0 \tag{31.3}
\end{equation*}
$$

as $h \downarrow 0$ by the dominated convergence theorem. Together with a similar argument for $h \uparrow 0$ this shows that $F$ must be continuous. Hence the question becomes this: If $F$ is continuous and $f$ is integrable, and if (31.2) holds almost everywhere, does (31.1) follow? The answer, strangely enough, is still no: In Example 31.1 there is constructed a continuous, strictly increasing $F$ for which $F^{\prime}(x)=0$ except on a set of Lebesgue measure 0 , and (31.1) is of course impossible if $f$ vanishes almost everywhere and $F$ is strictly increasing. This leads to the problem of characterizing those $F$ for which (31.1) does follow if (31.2) holds outside a set of Lebesgue measure 0 and $f$ is integrable. In other words, which functions are the integrals of their (almost everywhere) derivatives? Theorem 31.8 gives the characterization.

It is possible to extend part (ii) of Theorem 31.1 in a different direction. Suppose that (31.2) holds for every $x$, not just almost everywhere. In Example 17.4 there was given a function $F$, everywhere differentiable, whose derivative $f$ is not integrable, and in this case the right side of (31.1) has no meaning. If, however, (31.2) holds for every $x$, and if $f$ is integrable, then (31.1) does hold for all $x$. For most purposes of probability theory, it is natural to impose conditions only almost everywhere, and so this theorem will not be proved here. ${ }^{\dagger}$

The program then is first to show that (31.1) for integrable $f$ implies that (31.2) holds almost everywhere, and second to characterize those $F$ for which the reverse implication is valid. For the most part, $f$ will be nonnegative and $F$ will be nondecreasing. This is the case of greatest interest for probability theory; $F$ can be regarded as a distribution function and $f$ as a density.

[^11]In Chapters 4 and 5 many distribution functions $F$ were either shown to have a density $f$ with respect to Lebesgue measure or were assumed to have one, but such $F$ 's were never intrinsically characterized, as they will be in this section.

## Derivatives of Integrals

The first step is to show that a nondecreasing function has a derivative almost everywhere. This requires two preliminary results. Let $\lambda$ denote Lebesgue measure.

Lemma 1. Let $A$ be a bounded linear Borel set, and let $\mathscr{I}$ be a collection of open intervals covering $A$. Then $\mathscr{I}$ contains a finite, disjoint subcollection $I_{1}, \ldots, I_{k}$ for which $\sum_{i=1}^{k} \lambda\left(I_{i}\right) \geq \lambda(A) / 6$.

Proof. By regularity (Theorem 12.3) $A$ contains a compact subset $K$ satisfying $\lambda(K) \geq \lambda(A) / 2$. Choose in $\mathscr{I}$ a finite subcollection $\mathscr{I}_{0}$ covering $K$. Let $I_{1}$ be an interval in $\mathscr{I}_{0}$ of maximal length; discard from $\mathscr{I}_{0}$ the interval $I_{1}$ and all the others that intersect $I_{1}$. Among the intervals remaining in $\mathscr{I}_{0}$, let $I_{2}$ be one of maximal length; discard $I_{2}$ and all intervals that intersect it. Continue this way until $\mathscr{I}_{0}$ is exhausted. The $I_{i}$ are disjoint. Let $J_{i}$ be the interval with the same midpoint as $I_{i}$ and three times the length. If $I$ is an interval in $\mathscr{I}_{0}$ that is cast out because it meets $I_{i}$, then $I \subset J_{i}$. Thus each discarded interval is contained in one of the $J_{i}$, and so the $J_{i}$ cover $K$. Hence $\sum \lambda\left(I_{i}\right)=\sum \lambda\left(J_{i}\right) / 3 \geq \lambda(K) / 3 \geq \lambda(A) / 6$.

If

$$
\begin{equation*}
\Delta: a=a_{0}<a_{1}<\cdots<a_{k}=b \tag{31.4}
\end{equation*}
$$

is a partition of an interval $[a, b]$ and $F$ is a function over $[a, b]$, let

$$
\begin{equation*}
\|F\|_{\Delta}=\sum_{i=1}^{k}\left|F\left(a_{i}\right)-F\left(a_{i-1}\right)\right| . \tag{31.5}
\end{equation*}
$$

Lemma 2. Consider a partition (31.4) and a nonnegative $\theta$. If

$$
\begin{equation*}
F(a) \leq F(b) \tag{31.6}
\end{equation*}
$$

and if

$$
\begin{equation*}
\frac{F\left(a_{i}\right)-F\left(a_{i-1}\right)}{a_{i}-a_{i-1}} \leq-\theta \tag{31.7}
\end{equation*}
$$

for a set of intervals $\left[a_{i-1}, a_{i}\right]$ of total length $d$, then

$$
\|F\|_{\Delta} \geq|F(b)-F(a)|+2 \theta d
$$

This also holds if the inequalities in (31.6) and (31.7) are reversed and $-\theta$ is replaced by $\theta$ in the latter.

Proof. The figure shows the case where $k=2$ and the left-hand interval satisfies (31.7). Here $F$ falls at least $\theta d$ over $[a, a+d]$, rises the same amount over $[a+d, u]$, and then rises $F(b)-F(a)$ over $[u, b]$.
![](https://cdn.mathpix.com/cropped/14d6db67-b1d9-4598-a5c8-7abb965d6cc7-054.jpg?height=510&width=720&top_left_y=670&top_left_x=549)

For the general case, let $\sum^{\prime}$ denote summation over those $i$ satisfying (31.7) and let $\sum^{\prime \prime}$ denote summation over the remaining $i(1 \leq i \leq k)$. Then

$$
\begin{aligned}
\|F\|_{\Delta} & =\sum^{\prime}\left(F\left(a_{i-1}\right)-F\left(a_{i}\right)\right)+\sum^{\prime \prime}\left|F\left(a_{i}\right)-F\left(a_{i-1}\right)\right| \\
& \geq \sum^{\prime}\left(F\left(a_{i-1}\right)-F\left(a_{i}\right)\right)+\left|\sum^{\prime \prime}\left(F\left(a_{i}\right)-F\left(a_{i-1}\right)\right)\right| \\
& =\sum^{\prime}\left(F\left(a_{i-1}\right)-F\left(a_{i}\right)\right)+\left|(F(b)-F(a))+\sum^{\prime}\left(F\left(a_{i-1}\right)-F\left(a_{i}\right)\right)\right| .
\end{aligned}
$$

As all the differences in this last expression are nonnegative, the absolutevalue bars can be suppressed; therefore,

$$
\begin{aligned}
\|F\|_{\Delta} & \geq F(b)-F(a)+2 \sum^{\prime}\left(F\left(a_{i-1}\right)-F\left(a_{i}\right)\right) \\
& \geq F(b)-F(a)+2 \theta \sum^{\prime}\left(a_{i}-a_{i-1}\right)
\end{aligned}
$$

A function $F$ has at each $x$ four derivates, the upper and lower right derivatives

$$
\begin{aligned}
& D^{F}(x)=\limsup _{h \downarrow 0} \frac{F(x+h)-F(x)}{h} \\
& D_{F}(x)=\liminf _{h \downarrow 0} \frac{F(x+h)-F(x)}{h}
\end{aligned}
$$

and the upper and lower left derivatives

$$
\begin{aligned}
& F D(x)=\limsup _{h \downarrow 0} \frac{F(x)-F(x-h)}{h} \\
& { }_{F} D(x)=\liminf _{h \downarrow 0} \frac{F(x)-F(x-h)}{h}
\end{aligned}
$$

There is a derivative at $x$ if and only if these four quantities have a common value. Suppose that $F$ has finite derivative $F^{\prime}(x)$ at $x$. If $u \leq x \leq v$, then

$$
\begin{aligned}
\left|\frac{F(v)-F(u)}{v-u}-F^{\prime}(x)\right| \leq & \frac{v-x}{v-u}\left|\frac{F(v)-F(x)}{v-x}-F^{\prime}(x)\right| \\
& +\frac{x-u}{v-u}\left|\frac{F(x)-F(u)}{x-u}-F^{\prime}(x)\right|
\end{aligned}
$$

Therefore,

$$
\begin{equation*}
\frac{F(v)-F(u)}{v-u} \rightarrow F^{\prime}(x) \tag{31.8}
\end{equation*}
$$

as $u \uparrow x$ and $v \downarrow x$; that is to say, for each $\epsilon$ there is a $\delta$ such that $u \leq x \leq v$ and $0<v-u<\delta$ together imply that the quantities on either side of the arrow differ by less than $\epsilon$.

Suppose that $F$ is measurable and that it is continuous except possibly at countably many points. This will be true if $F$ is nondecreasing or is the difference of two nondecreasing functions. Let $M$ be a countable, dense set containing all the discontinuity points of $F$; let $r_{n}(x)$ be the smallest number of the form $k / n$ exceeding $x$. Then

$$
D^{F}(x)=\lim _{n \rightarrow \infty} \sup _{\substack{x<y<r_{n}(x) \\ y \in M}} \frac{F(y)-F(x)}{y-x}
$$

the function inside the limit is measurable because the $x$-set where it exceeds $\alpha$ is

$$
\bigcup_{y \in M}\left[x: x<y<r_{n}(x), F(y)-F(x)>\alpha(y-x)\right]
$$

Thus $D^{F}(x)$ is measurable, as are the other three derivates. This does not exclude infinite values. The set where the four derivates have a common finite value $F^{\prime}$ is therefore a Borel set. In the following theorem, set $F^{\prime}=0$ (say) outside this set; $F^{\prime}$ is then a Borel function.

Theorem 31.2. A nondecreasing function $F$ is differentiable almost everywhere, the derivative $F^{\prime}$ is nonnegative, and

$$
\begin{equation*}
\int_{a}^{b} F^{\prime}(t) d t \leq F(b)-F(a) \tag{31.9}
\end{equation*}
$$

for all $a$ and $b$.
This and the following theorems can also be formulated for functions over an interval.

Proof. If it can be shown that

$$
\begin{equation*}
D^{F}(x) \leq_{F} D(x) \tag{31.10}
\end{equation*}
$$

except on a set of Lebesgue measure 0 , then by the same result applied to $G(x)=-F(-x)$ it will follow that ${ }^{F} D(x)=D^{G}(-x) \leq_{G} D(-x)=D_{F}(x)$ almost everywhere. This will imply that $D_{F}(x) \leq D^{F}(x) \leq_{F} D(x) \leq{ }^{F} D(x) \leq D_{F}(x)$ almost everywhere, since the first and third of these inequalities are obvious, and so, outside a set of Lebesgue measure $0, F$ will have a derivative, possibly infinite. Since $F$ is nondecreasing, $F^{\prime}$ must be nonnegative, and once (31.9) is proved, it will follow that $F^{\prime}$ is finite almost everywhere.

If (31.10) is violated for a particular $x$, then for some pair $\alpha, \beta$ of rationals satisfying $\alpha<\beta, x$ will lie in the set $A_{\alpha \beta}=\left[x:{ }_{F} D(x)<\alpha<\beta<D^{F}(x)\right]$. Since there are only countably many of these sets, (31.10) will hold outside a set of Lebesgue measure 0 if $\lambda\left(A_{\alpha \beta}\right)=0$ for all $\alpha$ and $\beta$.

Put $G(x)=F(x)-\frac{1}{2}(\alpha+\beta) x$ and $\theta=\frac{1}{2}(\beta-\alpha)$. Since differentiation is linear, $A_{\alpha \beta}=B_{\theta}=\left[x:{ }_{G} D(x)<-\theta<\theta<D^{G}(x)\right]$. Since $F$ and $G$ have only countably many discontinuities, it suffices to prove that $\lambda\left(C_{\theta}\right)=0$, where $C_{\theta}$ is the set of points in $B_{\theta}$ that are continuity points of $G$. Consider an interval ( $a, b$ ), and suppose for the moment that $G(a) \leq G(b)$. For each $x$ in $C_{\theta}$ satisfying $a<x<b$, from ${ }_{G} D(x)<-\theta$ it follows that there exists an open interval ( $a_{x}, b_{x}$ ) for which $x \in\left(a_{x}, b_{x}\right) \subset(a, b)$ and

$$
\begin{equation*}
\frac{G\left(b_{x}\right)-G\left(a_{x}\right)}{b_{x}-a_{x}}<-\theta . \tag{31.11}
\end{equation*}
$$

There exists by Lemma 1 a finite, disjoint collection ( $a_{x_{i}}, b_{x_{i}}$ ) of these intervals of total length $\sum\left(b_{x_{i}}-a_{x_{i}}\right) \geq \lambda\left((a, b) \cap C_{\theta}\right) / 6$. Let $\Delta$ be the partition (31.4) of $[a, b]$ with the points $a_{x_{i}}$ and $b_{x_{i}}$ in the role of the $a_{1}, \ldots, a_{k-1}$. By Lemma 2,

$$
\begin{equation*}
\|G\|_{\Delta} \geq|G(b)-G(a)|+\frac{1}{3} \theta \lambda\left((a, b) \cap C_{\theta}\right) . \tag{31.12}
\end{equation*}
$$

If instead of $G(a) \leq G(b)$ the reverse inequality holds, choose $a_{x}$ and $b_{x}$ so that the ratio in (31.11) exceeds $\theta$, which is possible because $D^{G}(x)>\theta$ for $x \in C_{\theta}$. Again (31.12) follows.

In each interval $[a, b]$ there is thus a partition (31.4) satisfying (31.12). Apply this to each interval $\left[a_{i-1}, a_{i}\right]$ in the partition. This gives a partition $\Delta_{1}$ that refines $\Delta$, and adding the corresponding inequalities (31.12) leads to

$$
\|G\|_{\Delta_{1}} \geq\|G\|_{\Delta}+\frac{1}{3} \theta \lambda\left((a, b) \cap C_{\theta}\right) .
$$

Continuing leads to a sequence of successively finer partitions $\Delta_{n}$ such that

$$
\begin{equation*}
\|G\|_{\Delta_{n}} \geq n \frac{\theta}{3} \lambda\left((a, b) \cap C_{\theta}\right) . \tag{31.13}
\end{equation*}
$$

Now $\|G\|_{\Delta}$ is bounded by $|F(b)-F(a)|+\frac{1}{2}|\alpha+\beta|(b-a)$ because $F$ is monotonic. Thus (31.13) is impossible unless $\lambda\left((a, b) \cap C_{\theta}\right)=0$. Since ( $a, b$ ) can be any interval, $\lambda\left(C_{\theta}\right)=0$. This proves (31.10) and establishes the differentiability of $F$ almost everywhere.

It remains to prove (31.9). Let

$$
\begin{equation*}
f_{n}(x)=\frac{F\left(x+n^{-1}\right)-F(x)}{n^{-1}} \tag{31.14}
\end{equation*}
$$

Now $f_{n}$ is nonnegative, and by what has been shown, $f_{n}(x) \rightarrow F^{\prime}(x)$ except on a set of Lebesgue measure 0 . By Fatou's lemma and the fact that $F$ is nondecreasing,

$$
\begin{aligned}
\int_{a}^{b} F^{\prime}(x) d x & \leq \liminf _{n} \int_{a}^{b} f_{n}(x) d x \\
& =\lim \inf _{n}\left[n \int_{b}^{b+n^{-1}} F(x) d x-n \int_{a}^{a+n^{-1}} F(x) d x\right] \\
& \leq \lim \inf _{n}\left[F\left(b+n^{-1}\right)-F(a)\right]=F(b+)-F(a)
\end{aligned}
$$

Replacing $b$ by $b-\epsilon$ and letting $\epsilon \rightarrow 0$ gives (31.9).
Theorem 31.3. If $f$ is nonnegative and integrable, and if $F(x)=\int_{-\infty}^{x} f(t) d t$, then $F^{\prime}(x)=f(x)$ except on a set of Lebesgue measure 0 .

Since $f$ is nonnegative, $F$ is nondecreasing and hence by Theorem 31.2 is differentiable almost everywhere. The problem is to show that the derivative $F^{\prime}$ coincides with $f$ almost everywhere.

Proof for Bounded $f$. Suppose first that $f$ is bounded by $M$. Define $f_{n}$ by (31.14). Then $f_{n}(x)=n \int_{x}^{x+n^{-1}} f(t) d t$ is bounded by $M$ and converges almost everywhere to $F^{\prime}(x)$, so that the bounded convergence theorem gives

$$
\begin{aligned}
\int_{a}^{b} F^{\prime}(x) d x & =\lim _{n} \int_{a}^{b} f_{n}(x) d x \\
& =\lim _{n}\left[n \int_{b}^{b+n^{-1}} F(x) d x-n \int_{a}^{a+n^{-1}} F(x) d x\right]
\end{aligned}
$$

Since $F$ is continuous (see (31.3)), this last limit is $F(b)-F(a)=\int_{a}^{b} f(x) d x$.
Thus $\int_{A} F^{\prime}(x) d x=\int_{A} f(x) d x$ for bounded intervals $A=(a, b]$. Since these form a $\pi$-system, it follows (Theorem 16.10 (iii)) that $F^{\prime}=f$ almost everywhere.

Proof for Integrable $f$. Apply the result for bounded functions to $f$ truncated at $n$ : If $h_{n}(x)$ is $f(x)$ or $n$ as $f(x) \leq n$ or $f(x)>n$, then $H_{n}(x)= \int_{-\infty}^{x} h_{n}(t) d t$ differentiates almost everywhere to $h_{n}(x)$ by the case already treated. Now $F(x)=H_{n}(x)+\int_{-\infty}^{x}\left(f(t)-h_{n}(t)\right) d t$; the integral here is nondecreasing because the integrand is nonnegative, and it follows by Theorem 31.2 that it has almost everywhere a nonnegative derivative. Since differentiation is linear, $F^{\prime}(x) \geq H_{n}^{\prime}(x)=h_{n}(x)$ almost everywhere. As $n$ was arbitrary, $F^{\prime}(x) \geq f(x)$ almost everywhere, and so $\int_{a}^{b} F^{\prime}(x) d x \geq \int_{a}^{b} f(x) d x=F(b)-F(a)$. But the reverse inequality is a consequence of (31.9). Therefore, $\int_{a}^{b}\left(F^{\prime}(x)-\right. f(x)) d x=0$, and as before $F^{\prime}=f$ except on a set of Lebesgue measure 0 . $\square$

## Singular Functions

If $f(x)$ is nonnegative and integrable, differentiating its indefinite integral $\int_{-\infty}^{x} f(t) d t$ leads back to $f(x)$ except perhaps on a set of Lebesgue measure 0 . That is the content of Theorem 31.3. The converse question is this: If $F(x)$ is nondecreasing and hence has almost everywhere a derivative $F^{\prime}(x)$, does integrating $F^{\prime}(x)$ lead back to $F(x)$ ? As stated before, the answer turns out to be no even if $F(x)$ is assumed continuous:

Example 31.1. Let $X_{1}, X_{2}, \ldots$ be independent, identically distributed random variables such that $P\left[X_{n}=0\right]=p_{0}$ and $P\left[X_{n}=1\right]=p_{1}=1-p_{0}$, and let $X=\sum_{n=1}^{\infty} X_{n} 2^{-n}$. Let $F(x)=P[X \leq x]$ be the distribution function of $X$. For an arbitrary sequence $u_{1}, u_{2}, \ldots$ of 0 's and 1 's, $P\left[X_{n}=u_{n}, n=1,2, \ldots\right]= \lim _{n} p_{u_{1}} \cdots p_{u_{n}}=0$; since $x$ can have at most two dyadic expansions $x=\sum_{n} u_{n} 2^{-n}, P[X=x]=0$. Thus $F$ is everywhere continuous. Of course, $F(0)=0$ and $F(1)=1$. For $0 \leq k<2^{n}, k 2^{-n}$ has the form $\sum_{i=1}^{n} u_{i} 2^{-i}$ for some $n$-tuple ( $u_{1}, \ldots, u_{n}$ ) of 0 's and 1 's. Since $F$ is continuous,

$$
\begin{align*}
F\left(\frac{k+1}{2^{n}}\right)-F\left(\frac{k}{2^{n}}\right) & =P\left[\frac{k}{2^{n}}<X<\frac{k+1}{2^{n}}\right]  \tag{31.15}\\
& =P\left[X_{i}=u_{i}, i \leq n\right]=p_{u_{1}} \cdots p_{u_{n}} .
\end{align*}
$$

This shows that $F$ is strictly increasing over the unit interval.
If $p_{0}=p_{1}=\frac{1}{2}$, the right side of (31.15) is $2^{-n}$, and a passage to the limit shows that $F(x)=x$ for $0 \leq x \leq 1$. Assume, however, that $p_{0} \neq p_{1}$. It will be shown that $F^{\prime}(x)=0$ except on a set of Lebesgue measure 0 in this case. Obviously the derivative is 0 outside the unit interval, and by Theorem 31.2 it exists almost everywhere inside it. Suppose then that $0<x<1$ and that $F$ has a derivative $F^{\prime}(x)$ at $x$. It will be shown that $F^{\prime}(x)=0$.

For each $n$ choose $k_{n}$ so that $x$ lies in the interval $I_{n}=\left(k_{n} 2^{-n}\right.$, $\left.\left(k_{n}+1\right) 2^{-n}\right] ; I_{n}$ is that dyadic interval of rank $n$ that contains $x$. By (31.8),

$$
\frac{P\left[X \in I_{n}\right]}{2^{-n}}=\frac{F\left(\left(k_{n}+1\right) 2^{-n}\right)-F\left(k_{n} 2^{-n}\right)}{2^{-n}} \rightarrow F^{\prime}(x) .
$$

![](https://cdn.mathpix.com/cropped/14d6db67-b1d9-4598-a5c8-7abb965d6cc7-059.jpg?height=1370&width=1338&top_left_y=223&top_left_x=228)

Graph of $F(x)$ for $p_{0}=.25, p_{1}=.75$. Because of the recursion (31.17), the part of the graph over $[0, .5]$ and the part over $[.5,1]$ are identical, apart from changes in scale, with the whole graph Each segment of the curve therefore contains scaled copies of the whole, the extreme irregularity this implies is obscured by the fact that the accuracy is only to within the width of the printed line.

If $F^{\prime}(x)$ is distinct from 0 , the ratio of two successive terms here must go to 1 , so that

$$
\begin{equation*}
\frac{P\left[X \in I_{n+1}\right]}{P\left[X \in I_{n}\right]} \rightarrow \frac{1}{2} . \tag{31.16}
\end{equation*}
$$

If $I_{n}$ consists of the reals with nonterminating base- 2 expansions beginning with the digits $u_{1}, \ldots, u_{n}$, then $P\left[X \in I_{n}\right]=p_{u_{1}} \cdots p_{u_{n}}$ by (31.15). But $I_{n+1}$ must for some $u_{n+1}$ consist of the reals beginning $u_{1}, \ldots, u_{n}, u_{n+1}$ ( $u_{n+1}$ is 1 or 0 according as $x$ lies to the right of the midpoint of $I_{n}$ or not). Thus $P\left[X \in I_{n+1}\right] / P\left[X \in I_{n}\right]=p_{u_{n+1}}$ is either $p_{0}$ or $p_{1}$, and (31.16) is possible only if $p_{0}=p_{1}$, which was excluded by hypothesis.

Thus $F$ is continuous and strictly increasing over $[0,1]$, but $F^{\prime}(x)=0$ except on a set of Lebesgue measure 0 . For $0 \leq x \leq \frac{1}{2}$ independence gives
$F(x)=P\left[X_{1}=0, \quad \sum_{n=2}^{\infty} X_{n} 2^{-n+1} \leq 2 x\right]=p_{0} F(2 x)$. Similarly, $F(x)-p_{0}= p_{1} F(2 x-1)$ for $\frac{1}{2} \leq x \leq 1$. Thus

$$
F(x)= \begin{cases}p_{0} F(2 x) & \text { if } 0 \leq x \leq \frac{1}{2},  \tag{31.17}\\ p_{0}+p_{1} F(2 x-1) & \text { if } \frac{1}{2} \leq x \leq 1 .\end{cases}
$$

In Section 7, $F(x)$ (there denoted $Q(x)$ ) entered as the probability of success at bold play; see (7.30) and (7.33). $\square$

A function is singular if it has derivative 0 except on a set of Lebesgue measure 0 . Of course, a step function constant over intervals is singular. What is remarkable (indeed, singular) about the function in the preceding example is that it is continuous and strictly increasing but nonetheless has derivative 0 except on a set of Lebesgue measure 0 . Note that there is strict inequality in (31.9) for this $F$.

Further properties of nondecreasing functions can be discovered through a study of the measures they generate. Assume from now on that $F$ is nondecreasing, that $F$ is continuous from the right (this is only a normalization), and that $0=\lim _{x \rightarrow-\infty} F(x) \leq \lim _{x \rightarrow+\infty} F(x)=m<\infty$. Call such an $F$ a distribution function, even though $m$ need not be 1 . By Theorem 12.4 there exists a unique measure $\mu$ on the Borel sets of the line for which

$$
\begin{equation*}
\mu(a, b]=F(b)-F(a) . \tag{31.18}
\end{equation*}
$$

Of course, $\mu\left(R^{1}\right)=m$ is finite.
The larger $F^{\prime}$ is, the larger $\mu$ is:
Theorem 31.4. Suppose that $F$ and $\mu$ are related by (31.18) and that $F^{\prime}(x)$ exists throughout a Borel set $A$.
(i) If $F^{\prime}(x) \leq \alpha$ for $x \in A$, then $\mu(A) \leq \alpha \lambda(A)$.
(ii) If $F^{\prime}(x) \geq \alpha$ for $x \in A$, then $\mu(A) \geq \alpha \lambda(A)$.

Proof. It is no restriction to assume $A$ bounded. Fix $\in$ for the moment. Let $E$ be a countable, dense set, and let $A_{n}=\bigcap(A \cap I)$, where the intersection extends over the intervals $I=(u, v]$ for which $u, v \in E, 0<\lambda(I)<n^{-1}$, and

$$
\begin{equation*}
\mu(I)<(\alpha+\epsilon) \lambda(I) . \tag{31.19}
\end{equation*}
$$

Then $A_{n}$ is a Borel set and (see (31.8)) $A_{n} \uparrow A$ under the hypothesis of (i). By Theorem 11.4 there exist disjoint intervals $I_{n k}$ (open on the left, closed on
the right) such that $A_{n} \subset \cup_{k} I_{n k}$ and

$$
\begin{equation*}
\sum_{k} \lambda\left(I_{n k}\right)<\lambda\left(A_{n}\right)+\epsilon . \tag{31.20}
\end{equation*}
$$

It is no restriction to assume that each $I_{n k}$ has endpoints in $E$, meets $A_{n}$, and satisfies $\lambda\left(I_{n k}\right)<n^{-1}$. Then (31.19) applies to each $I_{n k}$, and hence

$$
\mu\left(A_{n}\right) \leq \sum_{k} \mu\left(I_{n \dot{k}}\right) \leq(\alpha+\epsilon) \sum_{k} \lambda\left(I_{n k}\right) \leq(\alpha+\epsilon)\left(\lambda\left(A_{n}\right)+\epsilon\right) .
$$

In the extreme terms here let $n \rightarrow \infty$ and then $\epsilon \rightarrow 0$; (i) follows.
To prove (ii), let the countable, dense set $E$ contain all the discontinuity points of $F$, and use the same argument with $\mu(I) \geq(\alpha-\epsilon) \lambda(I)$ in place of (31.19) and $\sum_{k} \mu\left(I_{n k}\right)<\mu\left(A_{n}\right)+\epsilon$ in place of (31.20). Since $E$ contains all the discontinuity points of $F$, it is again no restriction to assume that each $I_{n k}$ has endpoints in $E$, meets $A_{n}$, and satisfies $\lambda\left(I_{n k}\right)<n^{-1}$. It follows that

$$
\mu\left(A_{n}\right)+\epsilon>\sum_{k} \mu\left(I_{n k}\right) \geq(\alpha-\epsilon) \sum_{k} \lambda\left(I_{n k}\right) \geq(\alpha-\epsilon) \lambda\left(A_{n}\right) .
$$

Again let $n \rightarrow \infty$ and then $\epsilon \rightarrow 0$.
The measures $\mu$ and $\lambda$ have disjoint supports if there exist Borel sets $S_{\mu}$ and $S_{\lambda}$ such that

$$
\left\{\begin{array}{l}
\mu\left(R^{1}-S_{\mu}\right)=0, \quad \lambda\left(R^{1}-S_{\lambda}\right)=0  \tag{31.21}\\
S_{\mu} \cap S_{\lambda}=0
\end{array}\right.
$$

Theorem 31.5. Suppose that $F$ and $\mu$ are related by (31.18). A necessary and sufficient condition for $\mu$ and $\lambda$ to have disjoint supports is that $F^{\prime}(x)=0$ except on a set of Lebesgue measure 0 .

Proof. By Theorem 31.4, $\mu\left[x:|x| \leq a, F^{\prime}(x) \leq \epsilon\right] \leq 2 a \epsilon$, and so (let $\epsilon \rightarrow 0$ and then $a \rightarrow \infty) \mu\left[x: F^{\prime}(x)=0\right]=0$. If $F^{\prime}(x)=0$ outside a set of Lebesgue measure 0 , then $S_{\lambda}=\left[x: F^{\prime}(x)=0\right]$ and $S_{\mu}=R^{1}-S_{\lambda}$ satisfy (31.21).

Suppose that there exist $S_{\mu}$ and $S_{\lambda}$ satisfying (31.21). By the other half of Theorem 31.4, $\epsilon \lambda\left[x: F^{\prime}(x) \geq \epsilon\right]=\epsilon \lambda\left[x: x \in S_{\lambda}, F^{\prime}(x) \geq \epsilon\right] \leq \mu\left(S_{\lambda}\right)=0$, and so (let $\epsilon \rightarrow 0) F^{\prime}(x)=0$ except on a set of Lebesgue measure 0 . $\square$

Example 31.2. Suppose that $\mu$ is discrete, consisting of a mass $m_{k}$ at each of countably many points $x_{k}$. Then $F(x)=\sum m_{k}$, the sum extending over the $k$ for which $x_{k} \leq x$. Certainly, $\mu$ and $\lambda$ have disjoint supports, and so $F^{\prime}$ must vanish except on a set of Lebesgue measure 0 . This is directly obvious if the $x_{k}$ have no limit points, but not, for example, if they are dense. $\square$

Example 31.3. Consider again the distribution function $F$ in Example 31.1. Here $\mu(A)=P[X \in A]$. Since $F$ is singular, $\mu$ and $\lambda$ have disjoint supports. This fact has an interesting direct probabilistic proof.

For $x$ in the unit interval, let $d_{1}(x), d_{2}(x), \ldots$ be the digits in its nonterminating dyadic expansion, as in Section 1. If ( $k 2^{-n},(k+1) 2^{-n}$ ] is the dyadic interval of rank $n$ consisting of the reals whose expansions begin with the digits $u_{1}, \ldots, u_{n}$, then, by (31.15),

$$
\begin{equation*}
\mu\left(\frac{k}{2^{n}}, \frac{k+1}{2^{n}}\right]=\mu\left[x: d_{i}(x)=u_{i}, i \leq n\right]=p_{u_{1}} \cdots p_{u_{n}} . \tag{31.22}
\end{equation*}
$$

If the unit interval is regarded as a probability space under the measure $\mu$, then the $d_{i}(x)$ become random variables, and (31.22) says that these random variables are independent and identically distributed and $\mu\left[x: d_{i}(x)=0\right]=p_{0}$, $\mu\left[x: d_{i}(x)=1\right]=p_{1}$.

Since these random variables have expected value $p_{1}$, the strong law of large numbers implies that their averages go to $p_{1}$ with probability 1 :

$$
\begin{equation*}
\mu\left[x \in\left(0,1 \frac{1}{2}: \lim _{n} \frac{1}{n} \sum_{i=1}^{n} d_{i}(x)=p_{1}\right]=1 .\right. \tag{31.23}
\end{equation*}
$$

On the other hand, by the normal number theorem,

$$
\begin{equation*}
\lambda\left[x \in(0,1]: \lim _{n} \frac{1}{n} \sum_{i=1}^{n} d_{i}(x)=\frac{1}{2}\right]=1 . \tag{31.24}
\end{equation*}
$$

(Of course, (31.24) is just (31.23) for the special case $p_{0}=p_{1}=\frac{1}{2}$; in this case $\mu$ and $\lambda$ coincide in the unit interval.) If $p_{1} \neq \frac{1}{2}$, the sets in (31.23) and (31.24) are disjoint, so that $\mu$ and $\lambda$ do have disjoint supports.

It was shown in Example 31.1 that if $F^{\prime}(x)$ exists at all $(0<x<1)$, then it is 0 . By part (i) of Theorem 31.4 the set where $F^{\prime}(x)$ fails to exist therefore has $\mu$-measure 1 ; in particular, this set is uncountable. $\square$

In the singular case, according to Theorem 31.5, $F^{\prime}$ vanishes on a support of $\lambda$. It is natural to ask for the size of $F^{\prime}$ on a support of $\mu$. If $B$ is the $x$-set where $F$ has a finite derivative, and if (31.21) holds, then by Theorem 31.4, $\mu\left[x \in B: \quad F^{\prime}(x) \leq n\right]=\mu\left[x \in B \cap S_{\mu}: \quad F^{\prime}(x) \leq n\right] \leq n \lambda\left(S_{\mu}\right)=0$, and hence $\mu(B)=0$. The next theorem goes further.

Theorem 31.6. Suppose that $F$ and $\mu$ are related by (31.18) and that $\mu$ and $\lambda$ have disjoint supports. Then, except for $x$ in a set of $\mu$-measure 0 , ${ }_{F} D(x)=\infty$.

If $\mu$ has finite support, then clearly ${ }_{F} D(x)=\infty$ if $\mu\{x\}>0$, while $D_{F}(x)=0$ for all $x$. Since $F$ is continuous from the right, ${ }_{F} D$ and $D_{F}$ play different roles. ${ }^{\dagger}$

Proof. Let $A_{n}$ be the set where ${ }_{F} D(x)<n$. The problem is to prove that $\mu\left(A_{n}\right)=0$, and by (31.21) it is enough to prove that $\mu\left(A_{n} \cap S_{\mu}\right)=0$. Further, by Theorem 12.3 it is enough to prove that $\mu(K)=0$ if $K$ is a compact subset of $A_{n} \cap S_{\mu}$.

Fix $\leqslant$. Since $\lambda(K)=0$, there is an open $G$ such that $K \subset G$ and $\lambda(G)<\epsilon$. If $x \in K$, then $x \in A_{n}$, and by the definition of ${ }_{F} D$ and the right-continuity of $F$, there is an open interval $I_{x}$ for which $x \in I_{x} \subset G$ and $\mu\left(I_{x}\right)<n \lambda\left(I_{x}\right)$. By compactness, $K$ has a finite subcover $I_{x_{1}}, \ldots, I_{x_{k}}$. If some three of these have a nonempty intersection, one of them must be contained in the union of the other two. Such superfluous intervals can be removed from the subcover, and it is therefore possible to assume that no point of $K$ lies in more than two of the $I_{x_{i}}$. But then

$$
\begin{aligned}
\mu(K) & \leq \mu\left(\bigcup_{i} I_{\lambda_{i}}\right) \leq \sum_{i} \mu\left(I_{x_{i}}\right) \leq n \sum_{i} \lambda\left(I_{x_{i}}\right) \\
& \leq 2 n \lambda\left(\bigcup_{i} I_{\mathrm{x}_{i}}\right) \leq 2 n \lambda(G) \leq 2 n \epsilon .
\end{aligned}
$$

Since $\epsilon$ was arbitrary, $\lambda(K)=0$, as required. $\square$

Example 31.4. Restrict the $F$ of Examples 31.1 and 31.3 to $(0,1)$, and let $g$ be the inverse. Thus $F$ and $g$ are continuous, strictly increasing mappings of $(0,1)$ onto itself. If $A=\left[x \in(0,1): F^{\prime}(x)=0\right]$, then $\lambda(A)=1$, as shown in the examples, while $\mu(A)=$ 0 . Let $H$ be a set in ( 0,1 ) that is not a Lebesgue set. Since $H-A$ is contained in a set of Lebesgue measure 0 , it is a Lebesgue set; hence $H_{0}=H \cap A$ is not a Lebesgue set, since otherwise $H=H_{0} \cup(H-A)$ would be a Lebesgue set. If $B=(0, x]$, then $\lambda g^{-1}(B)=\lambda(0, F(x)]=F(x)=\mu(B)$, and it follows that $\lambda g^{-1}(B)=\mu(B)$ for all Borel sets $B$. Since $g^{-1} H_{0}$ is a subset of $g^{-1} A$ and $\lambda\left(g^{-1} A\right)=\mu(A)=0, g^{-1} H_{0}$ is a Lebesgue set. On the other hand, if $g^{-1} H_{0}$ were a Borel set, $H_{0}=F^{-1}\left(g^{-1} H_{0}\right)$ would also be a Borel set. Thus $g^{-1} H_{0}$ provides an example of a Lebesgue set that is not a Borel set. ${ }^{\ddagger}$ $\square$

## Integrals of Derivatives

Return now to the problem of extending part (ii) of Theorem 31.1, to the problem of characterizing those distribution functions $F$ for which $F^{\prime}$ integrates back to $F$ :

$$
\begin{equation*}
F(x)=\int_{-\infty}^{x} F^{\prime}(t) d t \tag{31.25}
\end{equation*}
$$

[^12]The first step is easy: If (31.25) holds, then $F$ has the form

$$
\begin{equation*}
F(x)=\int_{-\infty}^{x} f(t) d t \tag{31.26}
\end{equation*}
$$

for a nonnegative, integrable $f$ (a density), namely $f=F^{\prime}$. On the other hand, (31.26) implies by Theorem 31.3 that $F^{\prime}=f$ outside a set of Lebesgue measure 0 , whence (31.25) foliows. Thus (31.25) holds if and only if $F$ has the form (31.26) for some $f$, and the problem is to characterize functions of this form. The function of Example 31.1 is not among them.

As observed earlier (see (31.3)), an $F$ of the form (31.26) with $f$ integrable is continuous. It has a still stronger property: For each $\epsilon$ there exists a $\delta$ such that

$$
\begin{equation*}
\int_{A} f(x) d x<\epsilon \quad \text { if } \lambda(A)<\delta \tag{31.27}
\end{equation*}
$$

Indeed, if $A_{n}=[x: f(x)>n]$, then $A_{n} \downarrow \varnothing$, and since $f$ is integrable, the dominated convergence theorem implies that $\int_{A_{n}} f(x) d x<\epsilon / 2$ for large $n$. Fix such an $n$ and take $\delta=\epsilon / 2 n$. If $\lambda(A)<\delta$, then $\int_{A} f(x) d x \leq \int_{A-A_{n}} f(x) d x+\int_{A_{n}} f(x) d x \leq n \lambda(A)+\epsilon / 2<\epsilon$.

If $F$ is given by (31.26), then $F(b)-F(a)=\int_{a}^{b} f(x) d x$, and (31.27) has this consequence: For every $\epsilon$ there exists a $\delta$ such that for each finite collection $\left[a_{i}, b_{i}\right], i=1, \ldots, k$, of nonoverlapping ${ }^{\dagger}$ intervals,

$$
\begin{equation*}
\sum_{i=1}^{k}\left|F\left(b_{i}\right)-F\left(a_{i}\right)\right|<\epsilon \quad \text { if } \sum_{i=1}^{k}\left(b_{i}-a_{i}\right)<\delta . \tag{31.28}
\end{equation*}
$$

A function $F$ with this property is said to be absolutely continuous. ${ }^{\ddagger}$ A function of the form (31.26) ( $f$ integrable) is thus absolutely continuous.

A continuous distribution function is uniformly continuous, and so for every $\epsilon$ there is a $\delta$ such that the implication in (31.28) holds provided that $k=1$. The definition of absolute continuity requires this to hold whatever $k$ may be, which puts severe restrictions on $F$. Absolute continuity of $F$ can be characterized in terms of the measure $\mu$ :

Theorem 31.7. Suppose that $F$ and $\mu$ are related by (31.18). Then $F$ is absolutely continuous in the sense of (31.28) if and only if $\mu(A)=0$ for every $A$ for which $\lambda(A)=0$.

[^13]Proof. Suppose that $F$ is absolutely continuous and that $\lambda(A)=0$. Given $\epsilon$, choose $\delta$ so that (31.28) holds. There exists a countable disjoint union $B=\bigcup_{k} I_{k}$ of intervals such that $A \subset B$ and $\lambda(B)<\delta$. By (31.28) it follows that $\mu\left(\bigcup_{k=1}^{n} I_{k}\right) \leq \epsilon$ for each $n$ and hence that $\mu(A) \leq \mu(B) \leq \epsilon$. Since $\epsilon$ was arbitrary, $\mu(A)=0$.

If $F$ is not absolutely continuous, then there exists an $\epsilon$ such that for every $\delta$ some finite disjoint union $A$ of intervals satisfies $\lambda(A)<\delta$ and $\mu(A) \geq \epsilon$. Choose $A_{n}$ so that $\lambda\left(A_{n}\right)<n^{-2}$ and $\mu\left(A_{n}\right) \geq \epsilon$. Then $\lambda\left(\limsup \sup _{n}\right)=0$ by the first Borel-Cantelli lemma (Theorem 4.3, the proof of which does not require $P$ to be a probability measure or even finite). On the other hand, $\mu\left(\limsup _{n} A_{n}\right) \geq \epsilon>0$ by Theorem 4.1 (the proof of which applies because $\mu$ is assumed finite).

This result leads to a characterization of indefinite integrals.
Theorem 31.8. A distribution function $F(x)$ has the form $\int_{-\infty}^{x} f(t) d t$ for an integrable $f$ if and only if it is absolutely continuous in the sense of (31.28).

Proof. That an $F$ of the form (31.26) is absolutely continuous was proved in the argument leading to the definition (31.28). For another proof, apply Theorem 31.7: if $F$ has this form, then $\lambda(A)=0$ implies that $\mu(A)= \int_{A} f(t) d t=0$.

To go the other way, define for any distribution function $F$

$$
\begin{equation*}
F_{\mathrm{ac}}(x)=\int_{-\infty}^{x} F^{\prime}(t) d t \tag{31.29}
\end{equation*}
$$

and

$$
\begin{equation*}
F_{\mathrm{s}}(x)=F(x)-F_{\mathrm{ac}}(x) . \tag{31.30}
\end{equation*}
$$

Then $F_{\mathrm{s}}$ is right-continuous, and by (31.9) it is both nonnegative and nondecreasing. Since $F_{\mathrm{ac}}$ comes form a density, it is absolutely continuous. By Theorem 31.3, $F_{\mathrm{ac}}^{\prime}=F^{\prime}$ and hence $F_{\mathrm{s}}^{\prime}=0$ except on a set of Lebesgue measure 0 . Thus $F$ has a decomposition

$$
\begin{equation*}
F(x)=F_{\mathrm{a} c}(x)+F_{\mathrm{s}}(x) \tag{31.31}
\end{equation*}
$$

where $F_{\mathrm{ac}}$ has a density and hence is absolutely continuous and $F_{\mathrm{s}}$ is singular. This is called the Lebesgue decomposition.

Suppose that $F$ is absolutely continuous. Then $F_{\mathrm{s}}$ of (31.30) must, as the difference of absolutely continuous functions, be absolutely continuous itself. If it can be shown that $F_{\mathrm{s}}$ is identically 0 , it will follow that $F=F_{\mathrm{ac}}$ has the required form. It thus suffices to show that a distribution function that is both absolutely continuous and singular must vanish.

If a distribution function $F$ is singular, then by Theorem 31.5 there are disjoint supports $S_{\mu}$ and $S_{\lambda}$. But if $F$ is also absolutely continuous, then from $\lambda\left(S_{\mu}\right)=0$ it follows by Theorem 31.7 that $\mu\left(S_{\mu}\right)=0$. But then $\mu\left(R^{1}\right)=0$, and so $F(x) \equiv 0$.

This theorem identifies the distribution functions that are integrals of their derivatives as the absolutely continuous functions. Theorem 31.7, on the other hand, characterizes absolute continuity in a way that extends to spaces $\Omega$ without the geometric structure of the line necessary to a treatment involving distribution functions and ordinary derivatives. ${ }^{\dagger}$ The extension is studied in Section 32.

## Functions of Bounded Variation

The remainder of this section briefly sketches the extension of the preceding theory to functions that are not monotone. The results are for simplicity given only for a finite interval $[a, b]$ and for functions $F$ on $[a, b]$ satisfying $F(a)=0$.

If $F(x)=\int_{a}^{x} f(t) d t$ is an indefinite integral, where $f$ is integrable but not necessarily nonnegative, then $F(x)=\int_{a}^{x} f^{+}(t) d t-\int_{a}^{x} f^{-}(t) d t$ exhibits $F$ as the difference of two nondecreasing functions. The problem of characterizing indefinite integrals thus leads to the preliminary problem of characterizing functions representable as a difference of nondecreasing functions.

Now $F$ is said to be of bounded variation over $[a, b]$ if $\sup _{\Delta}\|F\|_{\Delta}$ is finite, where $\|F\|_{\mathrm{A}}$ is defined by (31.5) and $\Delta$ ranges over all partitions (31.4) of $[a, b]$. Clearly, a difference of nondecreasing functions is of bounded variation. But the converse holds as well: For every finite collection $\Gamma$ of nonoverlapping intervals $\left[x_{i}, y_{i}\right]$ in $[a, b]$, put

$$
P_{\Gamma}=\sum\left(F\left(y_{i}\right)-F\left(x_{i}\right)\right)^{+}, \quad N_{\Gamma}=\sum\left(F\left(y_{i}\right)-F\left(x_{i}\right)\right)^{-} .
$$

Now define

$$
P(x)=\sup _{\Gamma} P_{\Gamma}, \quad N(x)=\sup _{\Gamma} N_{\Gamma},
$$

where the suprema extend over partitions $\Gamma$ of $[a, x]$. If $F$ is of bounded variation, then $P(x)$ and $N(x)$ are finite. For each such $\Gamma, P_{\Gamma}=N_{\Gamma}+F(x)$. This gives the inequalities

$$
P_{\Gamma} \leq N(x)+F(x), \quad P(x) \geq N_{\Gamma}+F(x),
$$

which in turn lead to the inequalities

$$
P(x) \leq N(x)+F(x), \quad P(x) \geq N(x)+F(x) .
$$

Thus

$$
\begin{equation*}
F(x)=P(x)-N(x) \tag{31.32}
\end{equation*}
$$

gives the required representation: A function is the difference of two nondecreasing functions if and only if it is of bounded variation.

[^14]If $T_{\mathrm{r}}=P_{\mathrm{r}}+N_{\mathrm{r}}$, then $T_{\mathrm{r}}=\sum\left|F\left(y_{i}\right)-F\left(x_{i}\right)\right|$. According to the definition (31.28), $F$ is absolutely continuous if for every $\epsilon$ there exists a $\delta$ such that $T_{\mathrm{r}}<\epsilon$ whenever the intervals in the collection $\Gamma$ have total length less than $\delta$. If $F$ is absolutely continuous, take the $\delta$ corresponding to an $\epsilon$ of 1 and decompose $[a, b]$ into a finite number, say $n$, of subintervals $\left[u_{j-1}, u_{j}\right]$ of lengths less than $\delta$. Any partition $\Delta$ of [ $a, b$ ] can by the insertion of the $u_{j}$ be split into $n$ sets of intervals each of total length less than $\delta$, and it follows ${ }^{\dagger}$ that $\|F\|_{\Delta} \leq n$. Therefore, an absolutely continuous function is necessarily of bounded variation.

An absolutely continuous $F$ thus has a representation (31.32). It follows by the definitions that $P(y)-P(x)$ is at most $\sup _{\Gamma} T_{\Gamma}$, where $\Gamma$ ranges over the partitions of $[x, y]$. If $\left[x_{i}, y_{i}\right]$ are nonoverlapping intervals, then $\sum\left(P\left(y_{i}\right)-P\left(x_{i}\right)\right)$ is at most $\sup _{\Gamma} T_{\Gamma}$, where now $\Gamma$ ranges over the collections of intervals that partition each of the $\left[x_{i}, y_{i}\right]$ Therefore, if $F$ is absolutely continuous, there exists for each $\epsilon$ a $\delta$ such that $\sum\left(y_{i}-x_{i}\right)<\delta$ implies that $\sum\left(P\left(y_{i}\right)-P\left(x_{i}\right)\right)<\epsilon$. In other words, $P$ is absolutely continuous. Similarly, $N$ is absolutely continuous.

Thus an absolutely continuous $F$ is the difference of two nondecreasing absolutely continuous functions. By Theorem 31.8, each of these is an indefinite integral, which implies that $F$ is an indefinite integral as well: For an $F$ on $[a, b]$ satisfying $F(a)=0$, absolute continuity is a necessary and sufficient condition for $F$ to be an indefinite integral-to have the form $F(x)=\int_{a}^{x} f(t) d t$ for an integrable $f$.

## PROBLEMS

31.1. Extend Examples 31.1 and 31.3: Let $p_{0}, \ldots, p_{r-1}$ be nonnegative numbers adding to 1 , where $r \geq 2$; suppose there is no $i$ such that $p_{i}=1$. Let $X_{1}$, $X_{2}, \ldots$ be independent, identically distributed random variables such that $P\left[X_{n}=i\right]=p_{i}, 0 \leq i<r$, and put $X=\sum_{n=1}^{\infty} X_{n} r^{-n}$. Let $F$ be the distribution function of $X$. Show that $F$ is continuous. Show that $F$ is strictly increasing over the unit interval if and only if all the $p_{i}$ are strictly positive. Show that $F(x) \equiv x$ for $0 \leq x \leq 1$ if $p_{i} \equiv r^{-1}$ and that otherwise $F$ is singular; prove singularity by extending the arguments both of Example 31.1 and of Exampie 31.3. What is the analogue of (31.17)?
31.2. $\uparrow$ In Problem 31.1 take $r=3$ and $p_{0}=p_{2}=\frac{1}{2}, p_{1}=0$. The corresponding $F$ is called the Cantor function. The complement in $[0,1]$ of the Cantor set (see Problems 1.5 and 3.16) consists of the middle third $\left(\frac{1}{3}, \frac{2}{3}\right)$, the middle thirds $\left(\frac{1}{9}, \frac{2}{9}\right)$ and $\left(\frac{7}{9}, \frac{8}{9}\right)$, and so on. Show that $F$ is $\frac{1}{2}$ on the first of these intervals, $\frac{1}{4}$ on the second, $\frac{3}{4}$ on the third, and so on. Show by direct argument that $F^{\prime}=0$ except on a set of Lebesgue measure 0 .
31.3. A real function $f$ of a real variable is a Lebesgue function if $[x: f(x) \leq \alpha]$ is a Lebesgue set for each $\alpha$.
(a) Show that, if $f_{1}$ is a Borel function and $f_{2}$ is a Lebesgue function, then the composition $f_{1} f_{2}$ is a Lebesgue function.
(b) Show that there exists a Lebesgue function $f$, and a Lebesgue (even Borel, even continuous) function $f_{2}$ such that $f_{1} f_{2}$ is not a Lebesgue function. Hint: Use Example 31.4.

[^15]31.4. ↑ An arbitrary function $f$ on ( 0,1 ] can be represented as a composition of a Lebesgue function $f_{1}$ and a Borel function $f_{2}$. For $x$ in ( 0,1 ], let $d_{n}(x)$ be the $n$th digit in its nonterminating dyadic expansion, and define $f_{2}(x)= \sum_{n=1}^{\infty} 2 d_{n}(x) / 3^{n}$. Show that $f_{2}$ is increasing and that $f_{2}(0,1]$ is contained in the Cantor set. Take $f_{1}(x)$ to be $f\left(f_{2}^{-1}(x)\right)$ if $x \in f_{2}(0,1]$ and 0 if $x \in(0,1]-f_{2}(0,1]$. Now show that $f=f_{1} f_{2}$.
31.5. Let $r_{1}, r_{2}, \ldots$ be an enumeration of the rationals in ( 0,1 ) and put $F(x)= \sum_{k r_{k} \leq x} 2^{-k}$. Define $\varphi$ by (14.5) and prove that it is continuous and singular.
31.6. Suppose that $\mu$ and $F$ are related by (31.18). If $F$ is not absolutely continuous, then $\mu(A)>0$ for some set $A$ of Lebesgue measure 0 . It is an interesting fact, however, that almost all translates of $A$ must have $\mu$-measure 0 . From Fubini's theorem and the fact that $\lambda$ is invariant under translation and reflection through 0 , show that, if $\lambda(A)=0$ and $\mu$ is $\sigma$-finite, then $\mu(A+x)=0$ for $x$ outside a set of Lebesgue measure 0 .
31.7. 17.4 $31.6 \uparrow$ Show that $F$ is absolutely continuous if and only if for each Borel set $A, \mu(A+x)$ is continuous in $x$.
31.8. Let $F_{*}(x)=\lim _{\delta \rightarrow 0} \inf (F(v)-F(u)) /(v-u)$, where the infimum extends over $u$ and $v$ such that $u<x<v$ and $v-u<\delta$. Define $F^{*}(x)$ as this limit with the infimum replaced by a supremum. Show that in Theorem 31.4, $F^{\prime}$ can be replaced by $F^{*}$ in part (i) and by $F_{*}$ in part (ii). Show that in Theorem 31.6, ${ }_{F} D$ can be replaced by $F_{*}$ (note that $F_{*}(x) \leq{ }_{F} D(x)$ ).
31.9 Lebesgue's density theorem. A point $x$ is a density point of a Borel set $A$ if $\lambda((u, v] \cap A) /(v-u) \rightarrow 1$ as $u \uparrow x$ and $v \downarrow x$. From Theorems 31.2 and 31.4 deduce that almost all points of $A$ are density points. Similarly, $\lambda((u, v] \cap A) /(v-u) \rightarrow 0$ almost everywhere on $A^{c}$.
31.10. Let $f:[a, b] \rightarrow R^{k}$ be an aic; $f(t)=\left(f_{1}(t), \ldots, f_{k}(t)\right)$. Show that the arc is rectifiable if and only if each $f_{i}$ is of bounded variation over $[a, b]$.
31.11. $\uparrow$ Suppose that $F$ is continuous and nondecreasing and that $F(0)=0$, $F(1)=1$. Then $f(x)=(x, F(x))$ defines an arc $f:[0,1] \rightarrow R^{2}$. It is easy to see by monotonicity that the arc is rectifiable and that, in fact, its length satisfies $L(f) \leq 2$. It is also easy, given $\epsilon$, to produce functions $F$ for which $L(f)>2-\epsilon$. Show by the arguments in the proof of Theorem 31.4 that $L(f)=2$ if $F$ is singular.
31.12. Suppose that the characteristic function of $F$ satisfies $\limsup _{t \rightarrow \infty}|\varphi(t)|=1$. Show that $F$ is singular. Compare the lattice case (Problem 26.1). Hint: Use the Lebesgue decomposition and the Riemann-Lebesgue theorem.
31.13. Suppose that $X_{1}, X_{2}, \ldots$ are independent and assume the values $\pm 1$ with probability $\frac{1}{2}$ each, and let $X=\sum_{n=1}^{\infty} X_{n} / 2^{n}$. Show that $X$ is uniformly distributed over $[-1,+1]$. Calculate the characteristic functions of $X$ and $X_{n}$ and deduce (1.40). Conversely, establish (1.40) by trigonometry and conclude that $X$ is uniformly distributed over $[-1,+1]$.
31.14. (a) Suppose that $X_{1}, X_{2}, \ldots$ are independent and assume the values 0 and 1 with probability $\frac{1}{2}$ each. Let $F$ and $G$ be the distribution functions of $\sum_{n=1}^{\infty} X_{2 n-1} / 2^{2 n-t}$ and $\sum_{n=1}^{\infty} X_{2 n} / 2^{2 n}$. Show that $F$ and $G$ are singular but that $F * G$ is absolutely continuous.
(b) Show that the convolution of an absolutely continuous distribution function with an arbitrary distribution function is absolutely continuous.
31.15. 31.2 ↑ Show that the Cantor function is the distribution function of $\sum_{n=1}^{\infty} X_{n} / 3^{n}$, where the $X_{n}$ are independent and assume the values 0 and 2 with probability $\frac{1}{2}$ each. Express its characteristic function as an infinite product.
31.16. Show for the $F$ of Example 31.1 that ${ }_{F} D(1)=\infty$ and $D^{F}(0)=0$ if $p_{0}<\frac{1}{2}$. From (3117) deduce that ${ }_{F} D(x)=\infty$ and $D^{F}(x)=0$ for all dyadic rationals $x$. Analyze the case $p_{0}>\frac{1}{2}$ and sketch the graph
31.17. $6.14 \uparrow$ Let $F$ be as in Example 31.1, and let $\mu$ be the corresponding probability measure on the unit interval. Let $d_{n}(x)$ be the $n$th digit in the nonterminating binary expansion of $x$, and let $s_{n}(x)=\sum_{k=1}^{n} d_{k}(x)$. If $I_{n}(x)$ is the dyadic interval of order $n$ containing $x$, then
$$
\begin{equation*}
-\frac{1}{n} \log \mu\left(I_{n}(x)\right)=-\left(1-\frac{s_{n}(x)}{n}\right) \log p_{0}-\frac{s_{n}(x)}{n} \log p_{1} . \tag{31.33}
\end{equation*}
$$
(a) Show that (31.33) converges on a set of $\mu$-measure 1 to the entropy $h=-p_{0} \log p_{0}-p_{1} \log p_{1}$. From the fact that this entropy is less than $\log 2$ if $p_{0} \neq \frac{1}{2}$, deduce in this case that on a set of $\mu$-measure $1, F$ does not have a finite derivative.
(b) Show that (31.33) converges to $-\frac{1}{2} \log p_{0}-\frac{1}{2} \log p_{1}$ on a set of Lebesgue measure 1. If $p_{0} \neq \frac{1}{2}$ this limit exceeds $\log 2$ (arithmetic versus geometric means), and so $\mu\left(I_{n}(x)\right) / 2^{-n} \rightarrow 0$ except on a set of Lebesgue measure 0 . This does not prove that $F^{\prime}(x)$ exists almost everywhere, but it does show that, except for $x$ in a set of Lebesgue measure 0 . if $F^{\prime}(x)$ does exist, then it is 0 .
(c) Show that, if $(31.33)$ converges to $l$, then
$$
\lim _{n} \frac{\mu\left(I_{n}(x)\right)}{\left(2^{-n}\right)^{\alpha}}= \begin{cases}\infty & \text { if } \alpha>l / \log 2  \tag{31.34}\\ 0 & \text { if } \alpha<l / \log 2\end{cases}
$$

If (31.34) holds, then (roughly) $F$ satisfies a Lipschitz condition ${ }^{\dagger}$ of (exact) order $l / \log 2$. Thus $F$ satisfies a Lipschitz condition of order $h / \log 2$ on a set of $\mu$-measure 1 and a Lipschitz condition of order $\left(-\frac{1}{2} \log p_{0}-\frac{1}{2} \log p_{1}\right) / \log 2$ on a set of Lebesgue measure 1.
31.18. van der Waerden's continuous, nowhere differentiable function is $f(x)= \sum_{k=0}^{\infty} a_{k}(x)$, where $a_{0}(x)$ is the distance from $x$ to the nearest integer and $a_{k}(x)=2^{-k} a_{0}\left(2^{k} x\right)$. Show by the Weierstrass $M$-test that $f$ is continuous. Use (31.8) and the ideas in Example 31.1 to show that $f$ is nowhere differentiable.

[^16]31.19. Show (see (31.31)) that (apart from addition of constants) a function can have only one representation $F_{1}+F_{2}$ with $F_{1}$ absolutely continuous and $F_{2}$ singular.
31.20. Show that the $F_{\mathrm{s}}$ in the Lebesgue decomposition can be further split into $F_{\mathrm{d}}+F_{\mathrm{cs}}$, where $F_{\mathrm{cs}}$ is continuous and singular and $F_{\mathrm{d}}$ increases only in jumps in the sense that the corresponding measure is discrete. The complete decomposition is then $F=F_{\mathrm{ac}}+F_{\mathrm{cs}}+F_{\mathrm{d}}$.
31.21. (a) Suppose that $x_{1}<x_{2}<\cdots$ and $\sum_{n}\left|F\left(x_{n}\right)\right|=\infty$. Show that, if $F$ assumes the value 0 in each interval ( $x_{n}, x_{n+1}$ ), then it is of unbounded variation.
(b) Define $F$ over $[0,1]$ by $F(0)=0$ and $F(x)=x^{\alpha} \sin x^{-1}$ for $x>0$. For which values of $\alpha$ is $F$ of bounded variation?
31.22. 14.4 ↑ If $f$ is nonnegative and Lebesgue integrable, then by Theorem 31.3 and (31.8), except for $x$ in a set of Lebesgue measure 0 ,
$$
\begin{equation*}
\frac{1}{v-u} \int_{u}^{t} f(t) d t \rightarrow f(x) \tag{31.35}
\end{equation*}
$$
if $u \leq x \leq v, u<v$, and $u, v \rightarrow x$. There is an analogue in which Lebesgue measure is replaced by a general probability measure $\mu$ : If $f$ is nonnegative and integrable with respect to $\mu$, then as $h \downarrow 0$,
$$
\begin{equation*}
\frac{1}{\mu(x-h, x+h]} \int_{(x-h, x+h]} f(t) \mu(d t) \rightarrow f(x) \tag{31.36}
\end{equation*}
$$
on a set of $\mu$-measure 1 . Let $F$ be the distribution function corresponding to $\mu$, and put $\varphi(u)=\inf [x: u \leq F(x)]$ for $0<u<1$ (see (14.5)). Deduce (31.36) from (31.35) by change of variable and Problem 14.4.

## SECTION 32. THE RADON-NIKODYM THEOREM

If $f$ is a nonnegative function on a measure space ( $\Omega, \mathscr{F}, \mu$ ), then $\nu(A)= \int_{A} f d \mu$ defines another measure on $\mathscr{F}$. In the terminology of Section 16, $\nu$ has density $f$ with respect to $\mu$; see (16.11). For each $A$ in $\mathscr{F}, \mu(A)=0$ implies that $\nu(A)=0$. The purpose of this section is to show conversely that if this last condition holds and $\nu$ and $\mu$ are $\sigma$-finite on $\mathscr{F}$, then $\nu$ has a density with respect to $\mu$. This was proved for the case ( $R^{1}, \mathscr{R}^{1}, \lambda$ ) in Theorems 31.7 and 31.8. The theory of the preceding section, although illuminating, is not required here.

## Additive Set Functions

Throughout this section, ( $\Omega, \mathscr{F}$ ) is a measurable space. All sets involved are assumed as usual to lie in $\mathscr{F}$.

An additive set function is a function $\varphi$ from $\mathscr{F}$ to the reals for which

$$
\begin{equation*}
\varphi\left(\bigcup_{n} A_{n}\right)=\sum_{n} \varphi\left(A_{-n}\right) \tag{32.1}
\end{equation*}
$$

if $A_{1}, A_{2}, \ldots$ is a finite or infinite sequence of disjoint sets. A set function differs from a measure in that the values $\varphi(A)$ may be negative but must be finite-the special values $+\infty$ and $-\infty$ are prohibited. It will turn out that the series on the right in ( 32.1 ) must in fact converge absolutely, but this need not be assumed. Note that $\varphi(\varnothing)=0$.

Example 32.1. If $\mu_{1}$ and $\mu_{2}$ are finite measures, then $\varphi(A)=\mu_{1}(A)- \mu_{2}(A)$ is an additive set function. It will turn out that the general adoitive set function has this form. A speciai case of this if $\varphi(A)=\int_{A} f d \mu$, where $f$ is integrable (not necessarily nonnegative). $\square$

The proof of the main theorem of this section (Theorem 32.2) requires cerlain facts about additive set functions, even though the statement of the theorem involves only measures.

Lemma 1. If $E_{u} \uparrow E$ or $E_{u} \downarrow E$, then $\varphi\left(E_{u}\right) \rightarrow \varphi(E)$.

Proof. If $E_{u} \uparrow E$, then $\varphi(E)=\varphi\left(E_{1} \cup \cup_{u=1}^{\infty}\left(E_{u+1}-E_{u}\right)\right)=\varphi\left(E_{1}\right)+ \sum_{u=1}^{\infty} \varphi\left(E_{u+1}-E_{u}\right)=\lim _{\iota}\left[\varphi\left(E_{1}\right)+\sum_{u=1}^{L-1} \varphi\left(E_{u+1}-E_{u}\right)\right]=\lim _{\iota} \varphi\left(E_{\iota}\right)$ by (32.1). If $E_{u} \downarrow E$, then $E_{u}^{c} \uparrow E^{c}$, and hence $\varphi\left(E_{u}\right)=\varphi(\Omega)-\varphi\left(E_{u}^{c}\right) \rightarrow \varphi(\Omega)- \varphi\left(E^{c}\right)=\varphi(E)$. $\square$

Although this result is essentially the same as the corresponding ones for measures, it does require separate proof. Note that the limits need not be monotone unless $\varphi$ happens to be a measure.

## The Hahn Decomposition

Theorem 32.1. For any additive set function $\varphi$, there exist disjoint sets $A^{+}$ and $A^{-}$such that $A^{+} \cup A^{-}=\Omega, \varphi(E) \geq 0$ for all $E$ in $A^{+}$, and $\varphi(E) \leq 0$ for all $E$ in $A^{-}$.

A set $A$ is positive if $\varphi(E) \geq 0$ for $E \subset A$ and negative if $\varphi(E) \leq 0$ for $E \subset A$. The $A^{+}$and $A^{-}$in the theorem decompose $\Omega$ into a positive and a negative set. This is the Hahn decomposition.

If $\varphi(A)=\int_{A} f d \mu$ (see Example 32.1), the result is easy: take $A^{+}=[f \geq 0]$ and $A^{-}=[f<0]$.

Proof. Let $\alpha=\sup [\varphi(A): A \in \mathscr{F}]$. Suppose that there exists a set $A^{+}$ satisfying $\varphi\left(A^{+}\right)=\alpha$ (which implies that $\alpha$ is finite). Let $A^{-}=\Omega-A^{+}$. If $A \subset A^{+}$and $\varphi(A)<0$, then $\varphi\left(A^{+}-A\right)>\alpha$, an impossibility; hence $A^{+}$is a positive set. If $A \subset A^{-}$and $\varphi(A)>0$, then $\varphi\left(A^{+} \cup A\right)>\alpha$, an impossibility; hence $A^{-}$is a negative set.

It is therefore only necessary to construct a set $A^{+}$for which $\varphi\left(A^{+}\right)=\alpha$. Choose sets $A_{n}$ such that $\varphi\left(A_{n}\right) \rightarrow \alpha$, and let $A=\cup_{n} A_{n}$. For each $n$ consider the $2^{n}$ sets $B_{n i}$ (some perhaps empty) that are intersections of the form $\bigcap_{k=1}^{n} A_{k}^{\prime}$, where each $A_{k}^{\prime}$ is either $A_{k}$ or else $A-A_{k}$. The collection $\mathscr{B}_{n}=\left[B_{n i}: 1 \leq i \leq 2^{n}\right]$ of these sets partitions $A$. Clearly, $\mathscr{B}_{n}$ refines $\mathscr{B}_{n-1}$ : each $B_{n j}$ is contained in exactly one of the $B_{n-1, i}$.

Let $C_{n}$ be the union of those $B_{n i}$ in $\mathscr{B}_{n}$ for which $\varphi\left(B_{n i}\right)>0$. Since $A_{n}$ is the union of certain of the $B_{\eta i}$, it follows that $\varphi\left(A_{n}\right) \leq \varphi\left(C_{n}\right)$. Since the partitions $\mathscr{B}_{1}, \mathscr{B}_{2}, \ldots$ are successively finer, $m<n$ implies that $\left(C_{n t} \cup \cdots \cup\right. \left.C_{n-1} \cup C_{n}\right)-\left(C_{m} \cup \cdots \cup C_{n-1}\right)$ is the union (perhaps empty) of certain of the sets $B_{n i}$; the $B_{n i}$ in this union must satisfy $\varphi\left(B_{n i}\right)>0$ because they are contained in $C_{n}$. Therefore, $\varphi\left(C_{m} \cup \cdots \cup C_{n-1}\right) \leq \varphi\left(C_{m} \cup \cdots \cup C_{n}\right)$, so that by induction $\varphi\left(A_{m}\right) \leq \varphi\left(C_{m}\right) \leq \varphi\left(C_{m} \cup \cdots \cup C_{n}\right)$. If $D_{m}=\cup_{n=m}^{\infty} C_{n}$, then by Lemma 1 (take $\left.E_{l}=C_{i n} \cup \cdots \cup C_{m+c}\right) \varphi\left(A_{m}\right) \leq \varphi\left(D_{m}\right)$. Let $A^{+}=\cap_{m=1}^{\infty} D_{m}$ (note that $A^{+}=\limsup C_{n}$ ), so that $D_{m} \downarrow A^{+}$. By Lemma $1, \alpha=\lim _{m} \varphi\left(A_{m}\right) \leq \lim _{m} \varphi\left(D_{m}\right)=\varphi\left(A^{+}\right)$. Thus $A^{+}$does have maximal $\varphi$-value. $\square$

If $\varphi^{+}(A)=\varphi\left(A \cap A^{+}\right)$and $\varphi^{-}(A)=-\varphi\left(A \cap A^{-}\right)$, then $\varphi^{+}$and $\varphi^{-}$are finite measures. Thus

$$
\begin{equation*}
\varphi(A)=\varphi^{+}(A)-\varphi^{-}(A) \tag{32.2}
\end{equation*}
$$

represents the set function $\varphi$ as the difference of two finite measures having disjoint supports. If $E \subset A$, then $\varphi(E) \leq \varphi^{+}(E) \leq \varphi^{+}(A)$, and there is equality if $E=A \cap A^{+}$. Therefore, $\varphi^{+}(A)=\sup _{E \subset A} \varphi(E)$. Similarly, $\varphi^{-}(A)= -\inf _{E \subset A} \varphi(E)$. The measures $\varphi^{+}$and $\varphi^{-}$are called the upper and lower variations of $\varphi$, and the measure $|\varphi|$ with value $\varphi^{+}(A)+\varphi^{-}(A)$ at $A$ is called the total variation. The representation (32.2) is the Jordan decomposition.

## Absolute Continuity and Singularity

Measures $\mu$ and $\nu$ on ( $\Omega, \mathscr{F}$ ) are by definition mutually singular if they have disjoint supports-that is, if there exist sets $S_{\mu}$ and $S_{\nu}$ such that

$$
\left\{\begin{array}{l}
\mu\left(\Omega-S_{\mu}\right)=0, \quad \nu\left(\Omega-S_{\nu}\right)=0,  \tag{32.3}\\
S_{\mu} \cap S_{\nu}=\varnothing .
\end{array}\right.
$$

In this case $\mu$ is also said to be singular with respect to $\nu$ and $\nu$ singular with respect to $\mu$. Note that measures are automatically singular if one of them is identically 0 .

According to Theorem 31.5 a finite measure on $R^{1}$ with distribution function $F$ is singular with respect to Lebesgue measure in the sense of (32.3) if and only if $F^{\prime}(x)=0$ except on a set of Lebesgue measure 0 . In Section 31 the latter condition was taken as the definition of singularity, but of course it is the requirement of disjoint supports that can be generalized from $R^{1}$ to an arbitrary $\Omega$.

The measure $\nu$ is absolutely continuous with respect to $\mu$ if for each $A$ in $\mathscr{F}, \mu(A)=0$ implies $\nu(A)=0$. In this case $\nu$ is also said to be dominated by $\mu$, and the relation is indicated by $\nu \ll \mu$. If $\nu \ll \mu$ and $\mu \ll \nu$, the measures are equivalent, indicated by $\nu \equiv \mu$.

A finite measure on the line is by Theorem 31.7 absolutely continuous in this sense with respect to Lebesgue measure if and only if the corresponding distribution function $F$ satisfies the condition (31.28). The latter condition, taken in Section 31 as the definition of absolute continuity, is again not the one that generalizes from $R^{1}$ to $\Omega$.

There is an $\epsilon-\delta$ idea related to the definition of absolute continuity given above. Suppose that for every $\epsilon$ there exists a $\delta$ such that

$$
\begin{equation*}
\nu(A)<\epsilon \quad \text { if } \mu(A)<\delta . \tag{32.4}
\end{equation*}
$$

If this condition holds, $\mu(A)=0$ implies that $\nu(A)<\epsilon$ for all $\epsilon$, and so $\nu \ll \mu$. Suppose, on the other hand, that this condition fails and that $\nu$ is finite. Then for some $\epsilon$ there exist sets $A_{n}$ such that $\mu\left(A_{n}\right)<n^{-2}$ and $\nu\left(A_{n}\right) \geq \epsilon$. If $A=\limsup _{n} A_{n}$, then $\mu(A)=0$ by the first Borel-Cantelli lemma (which applies to arbitrary measures), but $\nu(A) \geq \epsilon>0$ by the righthand inequality in (4.9) (which applies because $\nu$ is finite). Hence $\nu \ll \mu$ fails, and so (32.4) follows if $\nu$ is finite and $\nu \ll \mu$. If $\nu$ is finite, in order that $\nu \ll \mu$ it is therefore necessary and sufficient that for every $\epsilon$ there exist a $\delta$ satisfying (32.4). This condition is not suitable as a definition, because it need not follow from $\nu \ll \mu$ if $\nu$ is infinite. ${ }^{\boldsymbol{\dagger}}$

## The Main Theorem

If $\nu(A)=\int_{A} f d \mu$, then certainly $\nu \ll \mu$. The Radon-Nikodym theorem goes in the opposite direction:

Theorem 32.2. If $\mu$ and $\nu$ are $\sigma$-finite measures such that $\nu \ll \mu$, then there exists a nonnegative $f$, a density, such that $\nu(A)=\int_{A} f d \mu$ for all $A \in \mathscr{F}$. For two such densities $f$ and $g, \mu[f \neq g]=0$.

[^17]The uniqueness of the density up to sets of $\mu$-measure 0 is settled by Theorem 16.10. It is only the existence that must be proved.

The density $f$ is integrable $\mu$ if and only if $\nu$ is finite. But since $f$ is integrable $\mu$ over $A$ if $\nu(A)<\infty$, and since $\nu$ is assumed $\sigma$-finite, $f<\infty$ except on a set of $\mu$-measure 0 ; and $f$ can be taken finite everywhere. By Theorem 16.11, integrals with respect to $\nu$ can be calculated by the formula

$$
\begin{equation*}
\int_{A} h d \nu=\int_{A} h f d \mu \tag{32.5}
\end{equation*}
$$

The density whose existence is to be proved is called the Radon-Nikodym derivative of $\nu$ with respect to $\mu$ and is often denoted $d \nu / d \mu$. The term derivative is appropriate because of Theorems 31.3 and 31.8: For an absolutely continuous distribution function $F$ on the line, the corresponding measure $\mu$ has with respect to Lebesgue measure the Radon-Nikodym derivative $F^{\prime}$. Note that ( 32.5 ) can be written

$$
\begin{equation*}
\int_{A} h d \nu=\int_{A} h \frac{d \nu}{d \mu} d \mu \tag{32.6}
\end{equation*}
$$

Suppose that Theorem 32.2 holds for finite $\mu$ and $\nu$ (which is in fact enough for the probabilistic applications in the sections that follow). In the $\sigma$-finite case there is a countable decomposition of $\Omega$ into $\mathscr{F}$-sets $A_{n}$ for which $\mu\left(A_{n}\right)$ and $\nu\left(A_{n}\right)$ are both finite. If

$$
\begin{equation*}
\mu_{n}(A)=\mu\left(A \cap A_{n}\right), \quad \nu_{n}(A)=\nu\left(A \cap A_{n}\right) \tag{32.7}
\end{equation*}
$$

then $\nu \ll \mu$ implies $\nu_{n} \ll \mu_{n}$, and so $\nu_{n}(A)=\int_{A} f_{n} d \mu_{n}$ for some density $f_{n}$. Since $\mu_{n}$ has density $I_{A_{n}}$ with respect to $\mu$ (Example 16.9),

$$
\begin{aligned}
\nu(A) & =\sum_{n} \nu_{n}(A)=\sum_{n} \int_{A} f_{n} d \mu_{n}=\sum_{n} \int_{A} f_{n} I_{A_{n}} d \mu \\
& =\int_{A} \sum_{n} f_{n} I_{A_{n}} d \mu
\end{aligned}
$$

Thus $\sum_{n} f_{n} I_{A_{n}}$ is the density sought.
It is therefore enough to treat finite $\mu$ and $\nu$. This requires a preliminary result.

Lemma 2. If $\mu$ and $\nu$ are finite measures and are not mutually singular, then there exists a set $A$ and a positive $\epsilon$ such that $\mu(A)>0$ and $\epsilon \mu(E) \leq \nu(E)$ for all $E \subset A$.

Proof. Let $A_{n}^{+} \cup A_{n}^{-}$be a Hahn decomposition for the set function $\nu-n^{-1} \mu$; put $M=\cup_{n} A_{n}^{+}$, so that $M^{c}=\bigcap_{n} A_{n}^{-}$. Since $M^{c}$ is in the negative set $A_{n}^{-}$for $\nu-n^{-1} \mu$, it follows that $\nu\left(M^{c}\right) \leq n^{-1} \mu\left(M^{c}\right)$; since this holds for all $n, \nu\left(M^{c}\right)=0$. Thus $M$ supports $\nu$, and from the fact that $\mu$ and $\nu$ are not mutually singular it follows that $M^{c}$ cannot support $\mu$-that is, that $\mu(M)$ must be positive. Therefore, $\mu\left(A_{n}^{+}\right)>0$ for some $n$. Take $A=A_{n}^{+}$and $\epsilon=n^{-1}$.

Example 32.2. Suppose that $(\Omega, \mathscr{F})=\left(R^{1}, \mathscr{P}^{1}\right), \mu$ is Lebesgue measure $\lambda$, and $\nu(a, b]=F(b)-F(a)$. If $\nu$ and $\lambda$ do not have disjoint supports, then by Theorem 31.5, $\lambda\left[x: F^{\prime}(x)>0\right]>0$ and hence for some $\epsilon, A=\left[x: F^{\prime}(x)>\right. \epsilon$ ] satisfies $\lambda(A)>0$. If $E=(a, b]$ is a sufficiently small interval about an $x$ in $A$, then $\nu(E) / \lambda(E)=(F(b)-F(a)) /(b-a) \geq \epsilon$, which is the same thing as $\epsilon \lambda(E) \leq \nu(E)$.

Thus Lemma 2 ties in with derivatives and quotients $\nu(E) / \mu(E)$ for "small" sets $E$. Martingale theory links Radon-Nikodym derivatives with such quotients; see Theorem 35.7 and Example 35.10.

Proof of Theorem 32.2. Suppose that $\mu$ and $\nu$ are finite measures satisfying $\nu \ll \mu$. Let $\mathscr{A}$ be the class of nonnegative functions $g$ such that $\int_{E} g d \mu \leq \nu(E)$ for all $E$. If $g$ and $g^{\prime}$ lie in $\mathscr{G}$, then $\max \left(g, g^{\prime}\right)$ also lies in $\mathscr{G}$ because

$$
\begin{aligned}
\int_{E} \max \left(g, g^{\prime}\right) d \mu & =\int_{E \cap\left[g \geq g^{\prime}\right]} g d \mu+\int_{E \cap\left[g^{\prime}>g\right]} g^{\prime} d \mu \\
& \leq \nu\left(E \cap\left[g \geq g^{\prime}\right]\right)+\nu\left(E \cap\left[g^{\prime}>g\right]\right)=\nu(E)
\end{aligned}
$$

Thus $\mathscr{A}$ is closed under the formation of finite maxima. Suppose that functions $g_{n}$ lie in $\mathscr{I}$ and $g_{n} \uparrow g$. Then $\int_{E} g d \mu=\lim _{n} \int_{E} g_{n} d \mu \leq \nu(E)$ by the monotone convergence theorem, so that $g$ lies in $\mathscr{G}$. Thus $\mathscr{G}$ is closed under nondecreasing passages to the limit.

Let $\alpha=\sup \int g d \mu$ for $g$ ranging over $\mathscr{G}(\alpha \leq \nu(\Omega))$. Choose $g_{n}$ in $\mathscr{G}$ so that $\int g_{n} d \mu>\alpha-n^{-1}$. If $f_{n}=\max \left(g_{1}, \ldots, g_{n}\right)$ and $f=\lim f_{n}$, then $f$ lies in $\mathscr{G}$ and $\int f d \mu=\lim _{n} \int f_{n} d \mu \geq \lim _{n} \int g_{n} d \mu=\alpha$. Thus $f$ is an element of $\mathscr{G}$ for which $\int f d \mu$ is maximal.

Define $\nu_{\mathrm{ac}}$ by $\nu_{\mathrm{ac}}(E)=\int_{E} f d \mu$ and $\nu_{\mathrm{s}}$ by $\nu_{\mathrm{s}}(E)=\nu(E)-\nu_{\mathrm{ac}}(E)$. Thus

$$
\begin{equation*}
\nu(E)=\nu_{\mathrm{ac}}(E)+\nu_{\mathrm{s}}(E)=\int_{E} f d \mu+\nu_{\mathrm{s}}(E) \tag{32.8}
\end{equation*}
$$

Since $f$ is in $\mathscr{A}, \nu_{\mathrm{s}}$ as well as $\nu_{\mathrm{ac}}$ is a finite measure-that is, nonnegative. Of course, $\nu_{\mathrm{ac}}$ is absolutely continuous with respect to $\mu$.

Suppose that $\nu_{\mathrm{s}}$ fails to be singular with respect to $\mu$. It then follows from Lemma 2 that there are a set $A$ and a positive $\epsilon$ such that $\mu(A)>0$ and $\epsilon \mu(E) \leq \nu_{\mathrm{s}}(E)$ for all $E \subset A$. Then for every $E$

$$
\begin{aligned}
\int_{E}\left(f+\epsilon I_{A}\right) d \mu & =\int_{E} f d \mu+\epsilon \mu(E \cap A) \leq \int_{E} f d \mu+\nu_{\mathrm{s}}(E \cap A) \\
& =\int_{E \cap A} f d \mu+\nu_{\mathrm{s}}(E \cap A)+\int_{E-A} f d \mu \\
& =\nu(E \cap A)+\int_{E-A} f d \mu \leq \nu(E \cap A)+\nu(E-A) \\
& =\nu(E)
\end{aligned}
$$

In other words, $f+\epsilon I_{A}$ lies in $\mathscr{G}$; since $\int\left(f+\epsilon I_{A}\right) d \mu=\alpha+\epsilon \mu(A)>\alpha$, this contradicts the maximality of $f$.

Therefore, $\mu$ and $\nu_{\mathrm{s}}$ are mutually singular, and there exists an $S$ such that $\nu_{\mathrm{s}}(S)=\mu\left(S^{c}\right)=0$. But since $\nu \ll \mu, \nu_{\mathrm{s}}\left(S^{c}\right) \leq \nu\left(S^{c}\right)=0$, and so $\nu_{\mathrm{s}}(\Omega)=0$. The rightmost term in (32.8) thus drops out.

Absolute continuity was not used until the last step of the proof, and what the argument shows is that $\nu$ always has a decomposition (32.8) into an absolutely continuous part and a singular part with respect to $\mu$. This is the Lebesgue decomposition, and it generalizes the one in the preceding section (see (31.31)).

## PROBLEMS

32.1. There are two ways to show that the convergence in (32.1) must be absolute: Use the Jordan decomposition. Use the fact that a series converges absolutely if it has the same sum no matter what order the terms are taken in.
32.2. If $A^{+} \cup A^{-}$is a Hahn decomposition of $\varphi$, there may be other ones $A_{1}^{+} \cup A_{1}^{-}$. Construct an example of this. Show that there is uniqueness to the extent that $\varphi\left(A^{+} \Delta A_{1}^{+}\right)=\varphi\left(A^{-} \Delta A_{1}^{-}\right)=0$.
32.3. Show that absolute continuity does not imply the $\epsilon-\delta$ condition (32.4) if $\nu$ is infinite. Hint. Let $\mathscr{F}$ consist of all subsets of the space of integers, let $\nu$ be counting measure, and let $\mu$ have mass $n^{-2}$ at $n$. Note that $\mu$ is finite and $\nu$ is $\sigma$-finite.
32.4. Show that the Radon-Nikodym theorem fails if $\mu$ is not $\sigma$-finite, even if $\nu$ is finite. Hint: Let $\mathscr{F}$ consist of the countable and the cocountable sets in an uncountable $\Omega$, let $\mu$ be counting measure, and let $\nu(A)$ be 0 or 1 as $A$ is countable or cocountable.
32.5. Let $\mu$ be the restriction of planar Lebesgue measure $\lambda_{2}$ to the $\sigma$-field $\mathscr{F}=\left\{A \times R^{1}: A \in \mathscr{R}^{1}\right\}$ of vertical strips. Define $\nu$ on $\mathscr{F}$ by $\nu\left(A \times R^{1}\right)=\lambda_{2}(A \times(0,1)$ ). Show that $\nu$ is absolutely continuous with respect to $\mu$ but has no density. Why does this not contradict the Radon-Nikodym theorem?
32.6. Let $\mu, B$, and $\rho$ be $\sigma$-finite measures on ( $\Omega, \mathscr{F}$ ). Assume the Radon-Nikodym derivatives here are everywhere nonnegative and finite.
(a) Show that $\nu \ll \mu$ and $\mu \ll \rho$ imply that $\nu \ll \rho$ and

$$
\frac{d \nu}{d \rho}=\frac{d \nu}{d \mu} \frac{d \mu}{d \rho}
$$

(b) Show that $\nu \equiv \mu$ implies

$$
\frac{d \nu}{d \mu}=I_{[d \mu / d \nu>0]}\left(\frac{d \mu}{d \nu}\right)^{-1}
$$

(c) Suppose that $\mu \ll \rho$ and $\nu \ll \rho$, and let $A$ be the set where $d \nu / d \rho>0= d \mu / d \rho$. Show that $\nu \ll \mu$ if and only if $\rho(A)=0$, in which case

$$
\frac{d \nu}{d \mu}=I_{\left[d_{\mu} / d \rho>0\right]} \frac{d \nu / d \rho}{d \mu / d \rho} .
$$

32.7. Show that there is a Lebesgue decomposition (32.8) in the $\sigma$-finite as well as the finite case. Prove that it is unique.
32.8. The Radon-Nikodym theorem holds if $\mu$ is $\sigma$-finite, even if $\nu$ is not. Assume at first that $\mu$ is finite (and $\nu \ll \mu$ ).
(a) Let $\mathscr{B}$ be the class of ( $\mathscr{F}$-sets) $B$ such that $\mu(E)=0$ or $\nu(E)=\infty$ for each $E \subset B$. Show that $\mathscr{B}$ contains a set $\boldsymbol{B}_{0}$ of maximal $\mu$-measure.
(b) Let $\mathscr{C}$ be the class of sets in $\Omega_{0}=B_{0}^{c}$ that are countable unions of sets of finite $\nu$-measure. Show that $\mathscr{b}$ contains a set $C_{0}$ of maximal $\mu$-measure. Let $D_{0}=\Omega_{0}-C_{0}$.
(c) Deduce from the maximality of $B_{0}$ and $C_{0}$ that $\mu\left(D_{0}\right)=\nu\left(D_{0}\right)=0$.
(d) Let $\nu_{0}(A)=\nu\left(A \cap \Omega_{0}\right)$. Using the Radon-Nikodym theorem for the pair $\mu, \nu_{0}$, prove it for $\mu, \nu$.
(e) Now show that the theorem holds if $\mu$ is merely $\sigma$-finite.
(f) Show that if the density can be taken everywhere finite, then $\nu$ is $\sigma$-finite.
32.9. Let $\mu$ and $\nu$ be finite measures on $(\Omega, \mathscr{F})$, and suppose that $\mathscr{F}^{\circ}$ is a $\sigma$-field contained in $\mathscr{F}$. Then the restrictions $\mu^{\circ}$ and $\nu^{\circ}$ of $\mu$ and $\nu$ to $\mathscr{F}^{\circ}$ are measures on ( $\Omega, \mathscr{F}^{\circ}$ ). Let $\nu_{\mathrm{ac}}, \nu_{\mathrm{s}}, \nu_{\mathrm{ac}}^{\circ}, \nu_{\mathrm{s}}^{\circ}$ be, respectively, the absolutely continuous and singular parts of $\nu$ and $\nu^{\circ}$ with respect to $\mu$ and $\mu^{\circ}$. Show that $\nu_{\mathrm{dc}}^{\circ}(E) \geq \nu_{\mathrm{ac}}(E)$ and $\nu_{\mathrm{s}}^{\circ}(E) \leq \nu_{\mathrm{s}}(E)$ for $E \in \mathscr{F}^{\circ}$.
32.10. Suppose that $\mu, \nu, \nu_{n}$ are finite measures on ( $\Omega, \mathscr{F}$ ) and that $\nu(A)=\sum_{n} \nu_{n}(A)$ for all $A$. Let $\nu_{n}(A)=\int_{A} f_{n} d \mu+\nu_{n}^{\prime}(A)$ and $\nu(A)=\int_{A} f d \mu+\nu^{\prime}(A)$ be the decompositions (32.8); here $\nu^{\prime}$ and $\nu_{n}^{\prime}$ are singular with respect to $\mu$. Show that $f=\sum_{n} f_{n}$ except on a set of $\mu$-measure 0 and that $\nu^{\prime}(A)=\sum_{n} \nu_{n}^{\prime}(A)$ for all $A$. Show that $\nu \ll \mu$ if and only if $\nu_{n} \ll \mu$ for all $n$.
32.11. 32.2 ↑ Absolute continuity of a set function $\varphi$ with respect to a measure $\mu$ is defined just as if $\varphi$ were itself a measure: $\mu(A)=0$ must imply that $\varphi(A)=0$. Show that, if this holds and $\mu$ is $\sigma$-finite, then $\varphi(A)=\int_{A} f d \mu$ for some integrable $f$. Show that $A^{+}=[\omega: f(\omega) \geq 0]$ and $A^{-}=[\omega: f(\omega)<0]$ give a Hahn decomposition for $\varphi$. Show that the three variations satisfy $\varphi^{+}(A)= \int_{A} f^{+} d \mu, \varphi^{-}(A)=\int_{A} f^{-} d \mu$, and $|\varphi|(A)=\int_{A}|f| d \mu$. Hint: To construct $f$, start with (32.2).
32.12. $\uparrow \mathrm{A}$ signed measure $\varphi$ is a set function that satisfies (32.1) if $A_{1}, A_{2}, \ldots$ are disjoint and may assume one of the values $+\infty$ and $-\infty$ but not both. Extend the Hahn and Jordan decompositions to signed measures
32.13. $31.22 \uparrow$ Suppose that $\mu$ and $\nu$ are a probability measure and a $\sigma$-finite measure on the line and that $\nu \ll \mu$. Show that the Radon-Nikodym derivative $f$ satisfies

$$
\lim _{h \rightarrow 0} \frac{\nu(x-h, x+h]}{\mu(x-h, x+h]}=f(x)
$$

on a set of $\mu$-measure 1 .
32.14. Find on the unit interval uncountably many probability measures $\mu_{p}, 0<p<1$, with supports $S_{p}$ such that $\mu_{p}\{x\}=0$ for each $x$ and $p$ and the $S_{p}$ are disjoint in pairs.
32.15. Let $\mathscr{F}_{0}$ be the field consisting of the finite and the cofinite sets in an uncountable $\Omega$. Define $\varphi$ on $\mathscr{F}_{0}$ by taking $\varphi(A)$ to be the number of points in $A$ if $A$ is finite, and the negative of the number of points in $A^{c}$ if $A$ is cofinite. Show that (32.1) holds (this is not true if $\Omega$ is countable). Show that there are no negative sets for $\varphi$ (except the empty set), that there is no Hahn decomposition, and that $\varphi$ does not have bounded range.

## SECTION 33. CONDITIONAL PROBABILITY

The concepts of conditional probability and expected value with respect to a $\sigma$-field underlie much of modern probability theory. The difficulty in understanding these ideas has to do not with mathematical detail so much as with probabilistic meaning, and the way to get at this meaning is through calculations and examples, of which there are many in this section and the next.

## The Discrete Case

Consider first the conditional probability of a set $A$ with respect to another set $B$. It is defined of course by $P(A \mid B)=P(A \cap B) / P(B)$, unless $P(B)$ vanishes, in which case it is not defined at all.

It is helpful to consider conditional probability in terms of an observer in possession of partial information. ${ }^{\dagger}$ A probability space $(\Omega, \mathscr{F}, P)$ describes

[^18]the working of a mechanism, governed by chance, which produces a result $\omega$ distributed according to $P ; P(A)$ is for the observer the probability that the point $\omega$ produced lies in $A$. Suppose now that $\omega$ lies in $B$ and that the observer learns this fact and no more. From the point of view of the observer, now in possession of this partial information about $\omega$, the probability that $\omega$ also lies in $A$ is $P(A \mid B)$ rather than $P(A)$. This is the idea lying back of the definition.

If, on the other hand, $\omega$ happens to lie in $B^{c}$ and the observer learns of this, his probability instead becomes $P\left(A \mid B^{c}\right)$. These two conditional probabilities can be linked together by the simple function

$$
f(\omega)= \begin{cases}P(A \mid B) & \text { if } \omega \in B  \tag{33.1}\\ P\left(A \mid B^{c}\right) & \text { it } \omega \in B^{c}\end{cases}
$$

The observer learns whether $\omega$ lies in $B$ or in $B^{c}$; his new probability for the event $\omega \in A$ is then just $f(\omega)$. Although the observer does not in general know the argument $\omega$ of $f$, he can calculate the value $f(\omega)$ because he knows which of $B$ and $B^{c}$ contains $\omega$. (Note conversely that from the value $f(\omega)$ it is possible to determine whether $\omega$ lies in $B$ or in $B^{c}$, unless $P(A \mid B)= P\left(A \mid B^{c}\right)$-that is, unless $A$ and $B$ are independent, in which case the conditional probability coincides with the unconditional one anyway.)

The sets $B$ and $B^{c}$ partition $\Omega$, and these ideas carry over to the general partition. Let $B_{1}, B_{2}, \ldots$ be a finite or countable partition of $\Omega$ into $\mathscr{F}$-sets, and let $\mathscr{I}$ consist of all the unions of the $B_{i}$. Then $\mathscr{I}$ is the $\sigma$-field generated by the $B_{i}$. For $A$ in $\mathscr{F}$, consider the function with values

$$
\begin{equation*}
f(\omega)=P\left(A \mid B_{i}\right)=\frac{P\left(A \cap B_{i}\right)}{P\left(B_{i}\right)} \quad \text { if } \omega \in B_{i}, \quad i=1,2, \ldots . \tag{33.2}
\end{equation*}
$$

If the observer learns which element $B_{i}$ of the partition it is that contains $\omega$, then his new probability for the event $\omega \in A$ is $f(\omega)$. The partition $\left\{B_{i}\right\}$, or equivalently the $\sigma$-field $\mathscr{A}$, can be regarded as an experiment, and to learn which $B_{i}$ it is that contains $\omega$ is to learn the outcome of the experiment. For this reason the function or random variable $f$ defined by (33.2) is called the conditional probability of $A$ given $\mathscr{A}$ and is denoted $P[A \| \mathscr{E}]$. This is written $P[A \| \mathscr{G}]_{\omega}$ whenever the argument $\omega$ needs to be explicitly shown.

Thus $P[A \| \mathscr{G}]$ is the function whose value on $B_{i}$ is the ordinary conditional probability $P\left(A \mid B_{i}\right)$. This definition needs to be completed, because $P\left(A \mid B_{i}\right)$ is not defined if $P\left(B_{i}\right)=0$. In this case $P[A \| \mathscr{G}]$ will be taken to have any constant value on $B_{i}$; the value is arbitrary but must be the same over all of the set $B_{i}$. If there are nonempty sets $B_{i}$ for which $P\left(B_{i}\right)=0$, $P[A \| \mathscr{G}]$ therefore stands for any one of a family of functions on $\Omega$. A specific such function is for emphasis often called a version of the conditional
probability. Note that any two versions are equal except on a set of probability 0 .

Example 33.1. Consider the Poisson process. Suppose that $0 \leq s \leq t$, and let $A=\left[N_{s}=0\right]$ and $B_{i}=\left[N_{t}=i\right], i=0,1, \ldots$. Since the increments are independent (Section 23), $P\left(A \mid B_{i}\right)=P\left[N_{s}=0\right] P\left[N_{t}-N_{s}=i\right] / P\left[N_{t}=i\right]$, and since they have Poisson distributions (see (23.9)), a simple calculation reduces this to

$$
\begin{equation*}
P\left[N_{s}=0 \| \mathscr{G}\right]_{\omega}=\left(1-\frac{s}{t}\right)^{i} \quad \text { if } \omega \in B_{i}, \quad i=0,1,2, \ldots \tag{33.3}
\end{equation*}
$$

Since $i=N_{t}(\omega)$ on $B_{i}$, this can be written

$$
\begin{equation*}
P\left[N_{s}=0 \| \mathscr{G}\right]_{\omega}=\left(1-\frac{s}{t}\right)^{N_{t}(\omega)} . \tag{33.4}
\end{equation*}
$$

Here the experiment or observation corresponding to $\left\{B_{i}\right\}$ or $\mathscr{G}$ determines the number of events-telephone calls, say-occurring in the time interval $[0, t]$. For an observer who knows this number but not the locations of the calls within $[0, t]$, (33.4) gives his probability for the event that none of them occurred before time $s$. Although this observer does not known $\omega$, he knows $N_{t}(\omega)$, which is all he needs to calculate the right side of (33.4). $\square$

Example 33.2. Suppose that $X_{0}, X_{1}, \ldots$ is a Markov chain with state space $S$ as in Section 8. The events

$$
\begin{equation*}
\left[X_{0}=i_{0}, \ldots, X_{n}=i_{n}\right] \tag{33.5}
\end{equation*}
$$

form a finite or countable partition of $\Omega$ as $i_{0}, \ldots, i_{n}$ range over $S$. If $\mathscr{G}_{n}$ is the $\sigma$-field generated by this partition, then by the defining condition (8.2) for Markov chains, $P\left[X_{n+1}=j \| \mathscr{G}_{n}\right]_{\omega}=p_{i_{n} j}$ holds for $\omega$ in (33.5). The sets

$$
\begin{equation*}
\left[X_{n}=i\right] \tag{33.6}
\end{equation*}
$$

for $i \in S$ also partition $\Omega$, and they generate a $\sigma$-field $\mathscr{G}_{n}^{0}$ smaller than $\mathscr{G}_{n}$. Now (8.2) also stipulates $P\left[X_{n+1}=j \| \mathscr{G}_{n}^{0}\right]_{\omega}=p_{i j}$ for $\omega$ in (33.6), and the essence of the Markov property is that

$$
\begin{equation*}
P\left[X_{n+1}=j \| \mathscr{E}_{n}\right]=P\left[X_{n+1}=j \| \mathscr{G}_{n}^{0}\right] . \tag{33.7}
\end{equation*}
$$ $\square$

## The General Case

If $\mathscr{A}$ is the $\sigma$-field generated by a partition $B_{1}, B_{2}, \ldots$, then the general element of $\mathscr{I}$ is a disjoint union $B_{i_{1}} \cup B_{i_{2}} \cup \cdots$, finite or countable, of certain of the $B_{i}$. To know which set $B_{i}$ it is that contains $\omega$ is the same thing
as to know which sets in $\mathscr{A}$ contain $\omega$ and which do not. This second way of looking at the matter carries over to the general $\sigma$-field $\mathscr{G}$ contained in $\mathscr{F}$. (As always, the probability space is $(\Omega, \mathscr{F}, P)$.) The $\sigma$-field $\mathscr{G}$ will not in general come from a partition as above.

One can imagine an observer who knows for each $G$ in $\mathscr{A}$ whether $\omega \in G$ or $\omega \subseteq G^{c}$. Thus the $\sigma$-field $\mathscr{G}$ can in principle be identified with an experiment or observation. This is the point of view adopted in Section 4; see p. 57. It is natural to try and define conditional probabilities $P[A \| \mathscr{G}]$ with respect to the experiment $\mathscr{G}$. To do this, fix an $A$ in $\mathscr{F}$ and define a finite measure $\nu$ on $\mathscr{A}$ by

$$
\nu(G)=P(A \cap G), \quad G \in \mathscr{G} .
$$

Then $P(G)=0$ implies that $\nu(G)=0$. The Radon-Nikodym theorem can be applied to the measures $\nu$ and $P$ on the measurable space $(\Omega, \mathscr{G})$ because the first one is absolutely continuous with respect to the second. ${ }^{\dagger}$ It follows that there exists a function or random variable $f$, measurable $\mathscr{I}$ and integrable with respect to $P$, such that ${ }^{\dagger} P(A \cap G)=\nu(G)=\int_{G} f d P$ for all $G$ in $\mathscr{A}$.

Denote this function $f$ by $P[A \| \mathscr{G}]$. It is a random variable with two properties:
(i) $P[A \| \mathscr{G}]$ is measurable $\mathscr{G}$ and integrable.
(ii) $P[A \| \mathscr{G}]$ satisfies the functional equation

$$
\begin{equation*}
\int_{G} P[A \| \mathscr{G}] d P=P(A \cap G), \quad G \in \mathscr{G} \tag{33.8}
\end{equation*}
$$

There will in general be many such random variables $P[A \| \mathscr{G}]$, but any two of them are equal with probability 1 . A specific such random variable is called a version of the conditional probability.

If $\mathscr{I}$ is generated by a partition $B_{1}, B_{2}, \ldots$ the function $f$ defined by (33.2) is measurable $\mathscr{G}$ because $[\omega: f(\omega) \in H]$ is the union of those $B_{i}$ over which the constant value of $f$ lies in $H$. Any $G$ in $\mathscr{A}$ is a disjoint union $G=\cup_{k} B_{i_{k}}$, and $P(A \cap G)=\sum_{k} P\left(A \mid B_{i_{k}}\right) P\left(B_{i_{k}}\right)$, so that (33.2) satisfies (33.8) as well. Thus the general definition is an extension of the one for the discrete case.

Condition (i) in the definition above in effect requires that the values of $P[A \| \mathscr{G}]$ depend only on the sets in $\mathscr{G}$. An observer who knows the outcome of $\mathscr{A}$ viewed as an experiment knows for each $G$ in $\mathscr{A}$ whether it contains $\omega$ or not; for each $x$ he knows this in particular for the set $\left[\omega^{\prime}: P[A \| \mathscr{A}]_{\omega^{\prime}}=x\right]$,

[^19]and hence he knows in principle the functional value $P[A \| \mathscr{G}]_{\omega}$ even if he does not know $\omega$ itself. In Example 33.1 a knowledge of $N_{t}(\omega)$ suffices to determine the value of (33.4)- $\omega$ itself is not needed.

Condition (ii) in the definition has a gambling interpretation. Suppose that the observer, after he has learned the outcome of $\mathscr{A}$, is offered the opportunity to bet on the event $A$ (unless $A$ lies in $\mathscr{G}$, he does not yet know whether or not it occurred). He is required to pay an entry fee of $P[A \| \mathscr{G}]$ units and will win 1 unit if $A$ occurs and nothing otherwise. If the observer decides to bet and pays his fee, he gains $1-P[A \| \mathscr{G}]$ if $A$ occurs and $-P[A \| \mathscr{G}]$ otherwise, so that his gain is

$$
(1-P[A \| \mathscr{G}]) I_{A}+(-P[A \| \mathscr{G}]) I_{A^{*}}=I_{A}-P[A \| \mathscr{H}] .
$$

If he declines to bet, his gain is of course 0 . Suppose that he adopts the strategy of betting if $G$ occurs but not otherwise, where $G$ is some set in $\mathscr{G}$. He can actually carry out this strategy, since after learning the outcome of the experiment $\mathscr{I}$ he knows whether or not $G$ occurred. His expected gain with this strategy is his gain integrated over $G$ :

$$
\int_{G}\left(I_{A}-P[A \| \mathscr{G}]\right) d P
$$

But (33.8) is exactly the requirement that this vanish for each $G$ in $\mathscr{I}$. Condition (ii) requires then that each strategy be fair in the sense that the observer stands neither to win nor to lose on the average. Thus $P[A \| \mathscr{G}]$ is the just entry fee, as intuition requires.

Example 33.3. Suppose that $A \in \mathscr{G}$, which will always hold if $\mathscr{A}$ coincides with the whole $\sigma$-field $\mathscr{F}$. Then $I_{A}$ satisfies conditions (i) and (ii), so that $P[A \| \mathscr{G}]=I_{A}$ with probability 1 . If $A \in \mathscr{G}$, then to know the outcome of $\mathscr{A}$ viewed as an experiment is in particular to know whether or not $A$ has occurred. $\square$

Example 33.4. If $\mathscr{G}$ is $\{0, \Omega\}$, the smallest possible $\sigma$-field, every function measurable $\mathscr{I}$ must be constant. Therefore, $P[A \| \mathscr{G}]_{\omega}=P(A)$ for all $\omega$ in this case. The observer learns nothing from the experiment $\mathscr{G}$. $\square$

According to these two examples, $P[A|\mid\{0, \Omega\}]$ is identically $P(A)$, whereas $I_{A}$ is a version of $P[A \| \mathscr{F}]$. For any $\mathscr{G}$, the function identically equal to $P(A)$ satisfies condition (i) in the definition of conditional probability, whereas $I_{A}$ satisfies condition (ii). Condition (i) becomes more stringent as $\mathscr{A}$ decreases, and condition (ii) becomes more stringent as $\mathscr{G}$ increases. The two conditions work in opposite directions and between them delimit the class of versions of $P[A \| \mathscr{G}]$.

Example 33.5. Lèt $\Omega$ be the plane $R^{2}$ and let $\mathscr{F}$ be the class $\mathscr{R}^{2}$ of planar Borel sets. A point of $\Omega$ is a pair $(x, y)$ of reals. Let $\mathscr{G}$ be the $\sigma$-field consisting of the vertical strips, the product sets $E \times R^{1}=[(x, y): x \in E]$, where $E$ is a linear Borel set. If the observer knows for each strip $E \times R^{1}$ whether or not it contains ( $x, y$ ), then, as he knows this for each one-point set $E$, he knows the value of $x$. Thus the experiment $\mathscr{I}$ consists in the determination of the first coordinate of the sample point. Suppose now that $P$ is a probability measure on $\mathscr{R}^{2}$ having a density $f(x, y)$ with respect to planar Lebesgue measure: $P(A)=\iint_{A} f(x, y) d x d y$. Let $A$ be a horizontal strip $R^{1} \times F=[(x, y): y \in F], F$ being a linear Borel set. The conditional probability $P[A \| \mathscr{G}]$ can be calculated explicitly.

Put

$$
\begin{equation*}
\varphi(x, y)=\frac{\int_{F} f(x, t) d t}{\int_{R^{1}} f(x, t) d t} . \tag{33.9}
\end{equation*}
$$

Set $\varphi(x, y)=0$, say, at points where the denominator here vanishes; these points form a set of $P$-measure 0 . Since $\varphi(x, y)$ is a function of $x$ alone, it is measurable $\mathscr{A}$. The general element of $\mathscr{G}$ being $E \times R^{1}$, it will follow that $\varphi$ is a version of $P[A \| \mathscr{G}]$ if it is shown that

$$
\begin{equation*}
\int_{E \times R^{1}} \varphi(x, y) d P(x, y)=P\left(A \cap\left(E \times R^{1}\right)\right) . \tag{33.10}
\end{equation*}
$$

Since $A=R^{1} \times F$, the right side here is $P(E \times F)$. Since $P$ has density $f$, Theorem 16.11 and Fubini's theorem reduce the left side to

$$
\begin{aligned}
\int_{E}\left\{\int_{R^{1}} \varphi(x, y) f(x, y) d y\right\} d x & =\int_{E}\left\{\int_{F} f(x, t) d t\right\} d x \\
& =\iint_{E \times F} f(x, y) d x d y=P(E \times F)
\end{aligned}
$$

Thus (33.9) does give a version of $P\left[R^{1} \times F \| \mathscr{G}\right]$. $\square$

The right side of (33.9) is the classical formula for the conditional probability of the event $R^{1} \times F$ (the event that $y \in F$ ) given the event $\{x\} \times R^{1}$ (given the value of $x$ ). Since the event $\{x\} \times R^{1}$ has probability 0 , the formula $P(A \mid B)=P(A \cap B) / P(B)$ does not work here. The whole point of this section is the systematic development of a notion of conditional probability that covers conditioning with respect to events of probability 0 . This is accomplished by conditioning with respect to collections of events-that is, with respect to $\sigma$-fields $\mathscr{G}$.

Example 33.6. The set $A$ is by definition independent of the $\sigma$-field $\mathscr{A}$ if it is independent of each $G$ in $\mathscr{G}: P(A \cap G)=P(A) P(G)$. This being the same thing as $P(A \cap G)=\int_{G} P(A) d P, A$ is independent of $\mathscr{A}$ if and only if $P[A \| \mathscr{G}]=P(A)$ with probability 1 . $\square$

The $\sigma$-field $\sigma(X)$ generated by a random variable $X$ consists of the sets $[\omega: X(\omega) \in H]$ for $H \in \mathscr{R}^{1}$; see Theorem 20.1. The conditional probability of $A$ given $X$ is defined as $P[A \| \sigma(X)]$ and is denoted $P[A \| X]$. Thus $P[A \| X]=P[A \| \sigma(X)]$ by definition. From the experiment corresponding to the $\sigma$-field $\sigma(X)$, one learns which of the sets $\left[\omega^{\prime}: X\left(\omega^{\prime}\right)=x\right]$ contains $\omega$ and hence learns the value $X(\omega)$. Example 33.5 is a case of this: take $X(x, y)=x$ for ( $x, y$ ) in the sample space $\Omega=R^{2}$ there.

This definition applies without change to random vector, or, equivalentiy, to a finite set of random variables. It can be adapted to arbitrary sets of random variables as well. For any such set $\left[X_{t}, t \in T\right]$, the $\sigma$-field $\sigma\left[X_{t}\right.$, $t \in T]$ it generates is the smallest $\sigma$-field with respect to which each $X_{t}$ is measurable. It is generated by the collection of sets of the form $\left[\omega: X_{t}(\omega) \in\right. H]$ for $t$ in $T$ and $H$ in $\mathscr{R}^{1}$. The conditional probability $P\left[A \| X_{t}, t \in T\right]$ of $A$ with respect to this set of random variables is by definition the conditional probability $P\left[A \| \sigma\left[X_{t}, t \in T\right]\right]$ of $A$ with respect to the $\sigma$-field $\sigma\left[X_{t}, t \in T\right]$.

In this notation the property (33.7) of Markov chains becomes

$$
\begin{equation*}
P\left[X_{n+1}=j \| X_{0}, \ldots, X_{n}\right]=P\left[X_{n+1}=j \| X_{n}\right] . \tag{33.11}
\end{equation*}
$$

The conditional probability of $\left[X_{n+1}=j\right]$ is the same for someone who knows the present state $X_{n}$ as for someone who knows the present state $X_{n}$ and the past states $X_{0}, \ldots, X_{n-1}$ as well.

Example 33.7. Let $X$ and $Y$ be random vectors of dimensions $j$ and $k$, let $\mu$ be the distribution of $X$ over $R^{j}$, and suppose that $X$ and $Y$ are independent. According to (20.30),

$$
P[X \in H,(X, Y) \in J]=\int_{H} P[(x, Y) \in J] \mu(d x)
$$

for $H \in \mathscr{R}^{j}$ and $J \in \mathscr{R}^{j+k}$. This is a consequence of Fubini's theorem; it has a conditional-probability interpretation. For each $x$ in $R^{j}$ put

$$
\begin{equation*}
f(x)=P[(x, Y) \in J]=P\left[\omega^{\prime}:\left(x, Y\left(\omega^{\prime}\right)\right) \in J\right] . \tag{33.12}
\end{equation*}
$$

By Theorem 20.1(ii), $f(X(\omega))$ is measurable $\sigma(X)$, and since $\mu$ is the distribution of $X$, a change of variable gives

$$
\int_{[X \in H]} f(X(\omega)) P(d \omega)=\int_{H} f(x) \mu(d x)=P([(X, Y) \in J] \cap[X \in H]) .
$$

Since $[X \in H]$ is the general element of $\sigma(X)$, this proves that

$$
\begin{equation*}
f(X(\omega))=P[(X, Y) \in J \| X]_{\omega} \tag{33.13}
\end{equation*}
$$

with probability 1. $\square$

The fact just proved can be written

$$
\begin{aligned}
P[(X, Y) \in J \| X]_{\omega} & =P[(X(\omega), Y) \in J] \\
& =P\left[\omega^{\prime}:\left(X(\omega), Y\left(\omega^{\prime}\right)\right) \in J\right] .
\end{aligned}
$$

Replacing $\omega^{\prime}$ by $\omega$ on the right here causes a notational collision like the one replacing $y$ by $x$ causes in $\int_{a}^{b} f(x, y) d y$.

Suppose that $X$ and $Y$ are independent random variables and that $Y$ has distribution function $F$. For $J=[(u, v): \max \{u, v\} \leq m]$, (33.12) is 0 for $m<x$ and $F(m)$ for $m \geq x$; if $M=\max \{X, Y\}$, then (33.13) gives

$$
\begin{equation*}
P[M \leq m \| X]_{\omega}=I_{[X \leq m]}(\omega) F(m) \tag{33.14}
\end{equation*}
$$

with probability 1. All equations involving conditional probabilities must be qualified in this way by the phrase with probability 1 , because the conditional probability is unique only to within a set of probability 0 .

The following theorem is useful for checking conditional probabilities.
Theorem 33.1. Let $\mathscr{P}$ be a $\pi$-system generating the $\sigma$-field $\mathscr{G}$, and suppose that $\Omega$ is a finite or countable union of sets in $\mathscr{P}$. An integrable function $f$ is a version of $P[A \| \mathscr{G}]$ if it is measurable $\mathscr{G}$ and if

$$
\begin{equation*}
\int_{G} f d P=P(A \cap G) \tag{33.15}
\end{equation*}
$$

holds for all $G$ in $\mathscr{P}$.
Proof. Apply Theorem 10.4. $\square$

The condition that $\Omega$ is a finite or countable union of $\mathscr{P}$ sets cannot be suppressed; see Example 10.5.

Example 33.8. Suppose that $X$ and $Y$ are independent random variables with a common distribution function $F$ that is positive and continuous. What is the conditional probability of [ $X \leq x$ ] given the random variable $M=\max [X, Y]$ ? As it should clearly be 1 if $M \leq x$, suppose that $M>x$. Since $X \leq x$ requires $M=Y$, the chance of which is $\frac{1}{2}$ by symmetry, the conditional probability of [ $X \leq x$ ] should by independence be $\frac{1}{2} F(x) / F(m)=\frac{1}{2} P[X \leq x \mid X \leq m]$ with the random variable $M$ substituted
for $m$. Intuition thus gives

$$
\begin{equation*}
P[X \leq x \| M]_{\omega}=I_{[M \leq x]}(\omega)+\frac{1}{2} I_{[M>x]}(\omega) \frac{F(x)}{F(M(\omega))} . \tag{33.16}
\end{equation*}
$$

It suffices to check (33.15) for sets $G=[M \leq m]$, because these form a $\pi$-system generating $\sigma(M)$. The functional equation reduces to

$$
\begin{equation*}
P[M \leq \min \{x, m\}]+\frac{1}{2} \int_{x<M \leq m} \frac{F(x)}{F(M)} d P=P[M \leq m, X \leq x] . \tag{33.17}
\end{equation*}
$$

Since the other case is easy, suppose that $x<m$. Since the distribution of $(X, Y)$ is product measure, it follows by Fubini's theorem and the assumed continuity of $F$ that

$$
\begin{aligned}
\int_{x<M \leq m} \frac{1}{F(M)} d P=\iint_{\substack{u \leq i \\
x<i \leq m}} & \frac{1}{F(v)} d F(u) d F(v) \\
& +\iint_{\substack{i<u \\
x<u \leq m}} \frac{1}{F(u)} d F(u) d F(v)=2(F(m)-F(x))
\end{aligned}
$$

which gives (33.17). $\square$

Example 33.9. A collection $\left[X_{t}: t \geq 0\right]$ of random variables is a Markov process in continuous time if for $k \geq 1,0 \leq t_{1} \leq \cdots \leq t_{k} \leq u$, and $H \in \mathscr{R}^{1}$,

$$
\begin{equation*}
P\left[X_{u} \in H \| X_{t_{1}}, \ldots, X_{t_{k}}\right]=P\left[X_{u} \in H \| X_{t_{k}}\right] \tag{33.18}
\end{equation*}
$$

holds with probability 1 . The analogue for discrete time is (33.11). (The $X_{n}$ there have countable range as well, and the transition probabilities are constant in time, conditions that are not imposed here.)

Suppose that $t \leq u$. Looking on the right side of (33.18) as a version of the conditional probability on the left shows that

$$
\begin{equation*}
\int_{G} P\left[X_{u} \in H \| X_{t}\right] d P=P\left(\left[X_{u} \in H\right] \cap G\right) \tag{33.19}
\end{equation*}
$$

if $0 \leq t_{1} \leq \cdots \leq t_{k}=t \leq u$ and $G \in \sigma\left(X_{t_{1}}, \ldots, X_{t_{k}}\right)$. Fix $t, u$, and $H$, and let $k$ and $t_{1}, \ldots, t_{k}$ vary. Consider the class $\mathscr{P}=\cup \sigma\left(X_{t_{1}}, \ldots, X_{t_{k}}\right)$, the union extending over all $k \geq 1$ and all $k$-tuples satisfying $0 \leq t_{1} \leq \cdots \leq t_{k}=t$. If $A \in \sigma\left(X_{t_{1}}, \ldots, X_{t_{k}}\right)$ and $B \in \sigma\left(X_{s_{1}}, \ldots, X_{s_{i}}\right)$, then $A \cap B \in \sigma\left(X_{r_{1}}, \ldots, X_{r_{j}}\right)$, where the $r_{\alpha}$ are the $s_{\beta}$ and the $t_{\gamma}$ merged together. Thus $\mathscr{P}$ is a $\pi$-system. Since $\mathscr{P}$ generates $\sigma\left[X_{s}: s \leq t\right]$ and $P\left[X_{u} \in H \| X_{t}\right]$ is measurable with respect to this $\sigma$-field, it follows by (33.19) and Theorem 33.1 that $P\left[X_{u} \in\right. \left.H \| X_{\imath}\right]$ is a version of $P\left[X_{u} \in H \| X_{s}, s \leq t\right]$ :

$$
\begin{equation*}
P\left[X_{u} \in H \| X_{s}, s \leq t\right]=P\left[X_{u} \in H \| X_{t}\right], \quad t \leq u, \tag{33.20}
\end{equation*}
$$

with probability 1 .

This says that for calculating conditional probabilities about the future, the present $\sigma\left(X_{t}\right)$ is equivalent to the present and the entire past $\sigma\left[X_{s}\right.$ : $s \leq t$ ]. This follows from the apparently weaker condition (33.18). $\square$

Example 33.10. The Poisson process $\left[N_{t}: t \geq 0\right]$ has independent increments (Section 23). Suppose that $0 \leq t_{1} \leq \cdots \leq t_{k} \leq u$. The random vector ( $N_{t_{1}}, N_{t_{2}}-N_{t_{1}}, \ldots, N_{t_{k}}-N_{t_{k-1}}$ ) is independent of $N_{u}-N_{t_{k}}$ and so (Theorem 20.2) ( $N_{t_{1}}, N_{t_{2}}, \ldots, N_{t_{k}}$ ) is independent of $N_{u}-N_{t_{k}}$. If $J$ is the set of points ( $x_{1}, \ldots, x_{k}, y$ ) in $R^{k+1}$ such that $x_{k}+y \in H$, where $H \in \mathscr{R}^{1}$, and if $\nu$ is the distribution of $N_{u}-N_{r_{k}}$, then (33.12) is $P\left[\left(x_{1}, \ldots, x_{k}, N_{u}-N_{t_{k}}\right) \in J\right]=P\left[x_{k}\right. \left.+N_{u}-N_{t_{k}} \in H\right]=\nu\left(H-x_{k}\right)$. Therefore, (33.13) gives $P\left[N_{u} \in\right. \left.H \| N_{t_{1}}, \ldots, N_{t_{k}}\right]=\nu\left(H-N_{t_{k}}\right)$. This holds also if $k=1$, and hence $P\left[N_{u} \in\right. \left.H \| N_{t_{1}}, \ldots, N_{t_{k}}\right]=P\left[N_{u} \in H \| N_{t_{k}}\right]$. The Poisson process thus has the Markov property (33.18); this is a consequence solely of the independence of the increments. The extended Markov property (33.20) follows. $\square$

## Properties of Conditional Probability

Theorem 33.2. With probability $1, P[\varnothing \| \mathscr{A}]=0, P[\Omega \| \mathscr{G}]=1$; and

$$
\begin{equation*}
0 \leq P[A \| \mathscr{G}] \leq 1 \tag{33.21}
\end{equation*}
$$

for each $A$. If $A_{1}, A_{2}, \ldots$ is a finite or countable sequence of disjoint sets, then

$$
\begin{equation*}
P\left[\bigcup_{n} A_{n} \| \mathscr{G}\right]=\sum_{n} P\left[A_{n} \| \mathscr{G}\right] \tag{33.22}
\end{equation*}
$$

with probability 1.
Proof. For each version of the conditional probability, $\int_{G} P[A \| \mathscr{G}] d P= P(A \cap G) \geq 0$ for each $G$ in $\mathscr{E}$; since $P[A \| \mathscr{G}]$ is measurable $\mathscr{G}$, it must be nonnegative except on a set of $P$-measure 0 . The other inequality in (33.21) is proved the same way.

If the $A_{n}$ are disjoint and if $G$ lies in $\mathscr{G}$, it follows (Theorem 16.6) that

$$
\begin{aligned}
\int_{G}\left(\sum_{n} P\left[A_{n} \| \mathscr{G}\right]\right) d P & =\sum_{n} \int_{G} P\left[A_{n} \| \mathscr{G}\right] d P=\sum_{n} P\left(A_{n} \cap G\right) \\
& =P\left(\left(\bigcup_{n} A_{n}\right) \cap G\right) .
\end{aligned}
$$

Thus $\sum_{n} P\left[A_{n} \| \mathscr{G}\right]$, which is certainly measurable $\mathscr{G}$, satisfies the functional equation for $P\left[\cup_{n} A_{n} \| \mathscr{G}\right]$, and so must coincide with it except perhaps on a set of $P$-measure 0 . Hence (33.22). $\square$

Additional useful facts can be established by similar arguments. If $A \subset B$, then

$$
\begin{equation*}
P[B-A \| \mathscr{G}]=P[B \| \mathscr{G}]-P[A \| \mathscr{G}], \quad P[A \| \mathscr{G}] \leq P[B \| \mathscr{G}] . \tag{33.23}
\end{equation*}
$$

The inclusion-exclusion formula

$$
\begin{equation*}
P\left[\bigcup_{i=1}^{n} A_{i} \| \mathscr{G}\right]=\sum_{i} P\left[A_{i} \| \mathscr{G}\right]-\sum_{i<j} P\left[A_{i} \cap A_{j} \| \mathscr{G}\right]+\cdots \tag{33.24}
\end{equation*}
$$

holds. If $A_{n} \uparrow A$, then

$$
\begin{equation*}
P\left[A_{n} \| \mathscr{G}\right] \uparrow P[A \| \mathscr{G}], \tag{33.25}
\end{equation*}
$$

and if $A_{n} \downarrow A$, then

$$
\begin{equation*}
P\left[A_{n} \| \mathscr{G}\right] \downarrow P[A \| \mathscr{G}] . \tag{33.26}
\end{equation*}
$$

Further, $P(A)=1$ implies that

$$
\begin{equation*}
P[A \| \mathscr{G}]=1, \tag{33.27}
\end{equation*}
$$

and $P(A)=0$ implies that

$$
\begin{equation*}
P[A \| \mathscr{G}]=0 . \tag{33.28}
\end{equation*}
$$

Of course (33.23) through (33.28) hold with probability 1 only.

## Difficulties and Curiosities

This section has been devoted almost entirely to examples connecting the abstract definition (33.8) with the probabilistic idea lying back of it. There are pathological examples showing that the interpretation of conditional probability in terms of an observer with partial information breaks down in certain cases.

Example 33.11. Let ( $\Omega, \mathscr{F}, P$ ) be the unit interval $\Omega$ with Lebesgue measure $P$ on the $\sigma$-field $\mathscr{F}$ of Borel subsets of $\Omega$. Take $\mathscr{G}$ to be the $\sigma$-field of sets that are either countable or cocountable. Then the function identically equal to $P(A)$ is a version of $P[A \| \mathscr{G}]$ : (33.8) holds because $P(G)$ is either 0 or 1 for every $G$ in $\mathscr{G}$. Therefore,

$$
\begin{equation*}
P[A \| \mathscr{G}]_{\omega}=P(A) \tag{33.29}
\end{equation*}
$$

with probability 1 . But since $\mathscr{I}$ contains all one-point sets, to know which
elements of $\mathscr{A}$ contain $\omega$ is to know $\omega$ itself. Thus $\mathscr{A}$ viewed as an experiment should be completely informative-the observer given the information in $\mathscr{G}$ should know $\omega$ exactly-and so one might expect that

$$
P[A \| \mathscr{G}]_{\omega}= \begin{cases}1 & \text { if } \omega \in A,  \tag{33.30}\\ 0 & \text { if } \omega \notin A .\end{cases}
$$

This is Example 4.10 in a new form.
The mathematical definition gives (33.29); the heuristic considerations lead to (33.30). Of course, (33.29) is right and (33.30) is wrong. The heuristic view breaks down in certain cases but is nonetheless illuminating and cannot, since it does not intervene in proofs, lead to any difficulties.

The point of view in this section has been "global." To each fixed $A$ in $\mathscr{F}$ has been atiached a function (usually a family of functions) $P[A \| \mathscr{G}]_{\omega}$ defined over all of $\Omega$. What happens if the point of view is reversed-if $\omega$ is fixed and $A$ varies over $\mathscr{F}$ ? Will this result in a probability measure on $\mathscr{F}$ ? Intuition says it should, and if it does, then (33.21) through (33.28) all reduce to standard facts about measures.

Suppose that $B_{1}, \ldots, B_{r}$ is a partition of $\Omega$ into $\mathscr{F}$-sets, and let $\mathscr{G}= \sigma\left(B_{1}, \ldots, B_{r}\right)$. If $P\left(B_{1}\right)=0$ and $P\left(B_{i}\right)>0$ for the other $i$, then one version of $P[A \| \mathscr{G}]$ is

$$
P[A \| \mathscr{G}]_{\omega}= \begin{cases}17 & \text { if } \omega \in B_{1}, \\ \frac{P\left(A \cap B_{i}\right)}{P\left(B_{i}\right)} & \text { if } \omega \in B_{i}, i=2, \ldots, r .\end{cases}
$$

With this choice of version for each $A, P[A \| \mathscr{G}]_{\omega}$ is, as a function of $A$, a probability measure on $\mathscr{F}$ if $\omega \in B_{2} \cup \cdots \cup B_{r}$, but not if $\omega \in B_{1}$. The "wrong" versions have been chosen. If, for example,

$$
P[A \| \mathscr{G}]_{\omega}= \begin{cases}P(A) & \text { if } \omega \in B_{1} \\ \frac{P\left(A \cap B_{i}\right)}{P\left(B_{i}\right)} & \text { if } \omega \in B_{i}, i=2, \ldots, r\end{cases}
$$

then $P[A \| \mathscr{I}]_{\omega}$ is a probability measure in $A$ for each $\omega$. Clearly, versions such as this one exist if $\mathscr{G}$ is finite.

It might be thought that for an arbitrary $\sigma$-field $\mathscr{G}$ in $\mathscr{F}$ versions of the various $P[A \| \mathscr{G}]$ can be so chosen that $P[A \| \mathscr{G}]_{\omega}$ is for each fixed $\omega$ a probability measure as $A$ varies over $\mathscr{F}$. It is possible to construct a
counterexample showing that this is not so. ${ }^{\dagger}$ The example is possible because the exceptional $\omega$-set of probability 0 where (33.22) fails depends on the sequence $A_{1}, A_{2}, \ldots$; if there are uncountably many such sequences, it can happen that the union of these exceptional sets has positive probability whatever versions $P[A \| \mathscr{G}]$ are chosen.

The existence of such pathological examples turns out not to matter. Example 33.9 illustrates the reason why. From the assumption (33.18) the notably stronger conclusion (33.20) was reached. Since the set $\left[X_{u} \in H\right]$ is fixed throughout the argument, it does not matter that conditional probabilities may not, in fact, be measures. What does matter for the theory is Theorem 33.2 and its extensions.

Consider a point $\omega_{0}$ with the property that $P(G)>0$ for every $G$ in $\mathscr{A}$ that contains $\omega_{0}$. This will be true if the one-point set $\left\{\omega_{0}\right\}$ lies in $\mathscr{F}$ and has positive probability. Fix any versions of the $P[A \| \mathscr{G}]$. For each $A$ the set $[\omega$ : $\left.P[A \| \mathscr{G}]_{\omega}<0\right]$ lies in $\mathscr{G}$ and has probability 0 ; it therefore cannot contain $\omega_{0}$. Thus $P[A \| \mathscr{G}]_{\omega_{0}} \geq 0$. Similarly, $P[\Omega \| \mathscr{G}]_{\omega_{0}}=1$, and, if the $A_{n}$ are disjoint, $P\left[\bigcup_{n} A_{n} \| \mathscr{G}\right]_{\omega_{0}}=\sum_{n} P[A \| \mathscr{G}]_{\omega_{0}}$. Therefore, $P[A \| \mathscr{G}]_{\omega_{0}}$ is a probability measure as $A$ ranges over $\mathscr{F}$.

Thus conditional probabilities behave like probabilities at points of positive probability. That they may not do so at points of probability 0 causes no problem because individual such points have no effect on the probabilities of sets. Of course, sets of points individually having probability 0 do have an effect, but here the global point of view reenters.

## Conditional Probability Distributions

Let $X$ be a random variable on $(\Omega, \mathscr{F}, P)$, and let $\mathscr{G}$ be a $\sigma$-field in $\mathscr{F}$.
Theorem 33.3. There exists a function $\mu(H, \omega)$, defined for $H$ in $\mathscr{R}^{1}$ and $\omega$ in $\Omega$, with these two properties:
(i) For each $\omega$ in $\Omega, \mu(\cdot, \omega)$ is a probability measure on $\mathscr{P}^{1}$.
(ii) For each $H$ in $\mathscr{R}^{1}, \mu(H, \cdot)$ is a version of $P[X \in H \| \mathscr{G}]$.

The probability measure $\mu(\cdot, \omega)$ is a conditional distribution of $X$ given $\mathscr{G}$. If $\mathscr{A}=\sigma(Z)$, it is a conditional distribution of $X$ given $Z$.

Proof. For each rational $r$, let $F(r, \omega)$ be a version of $P[X \leq r \| \mathscr{G}]_{\omega}$. If $r \leq s$, then by (33.23),

$$
\begin{equation*}
F(r, \omega) \leq F(s, \omega) \tag{33.31}
\end{equation*}
$$

[^20]for $\omega$ outside a $\mathscr{G}$-set $A_{r s}$ of probability 0 . By (33.26),
$$
\begin{equation*}
F(r, \omega)=\lim _{n} F\left(r+n^{-1}, \omega\right) \tag{33.32}
\end{equation*}
$$
for $\omega$ outside a $\mathscr{G}$-set $B_{r}$ of probability 0 . Finally, by (33.25) and (33.26),
$$
\begin{equation*}
\lim _{r \rightarrow-\infty} F(r, \omega)=0, \quad \lim _{r \rightarrow \infty} F(r, \omega)=1 \tag{33.33}
\end{equation*}
$$
outside a $\mathscr{G}$-set $C$ of probability 0 . As there are only countably many of these exceptional sets, their union $E$ lies in $\mathscr{G}$ and has probability 0 .

For $\omega \notin E$ extend $F(\cdot, \omega)$ to all of $R^{1}$ by setting $F(x, \omega)=\inf [F(r, \omega)$ : $x<r]$. For $\omega \in E$ take $F(x, \omega)=F(x)$, where $F$ is some arbitrary but fixed distribution function. Suppose that $\omega \notin E$. By (33.31) and (33.32), $F(x, \omega)$ agrees with the first definition on the rationals and is nondecreasing; it is right-continuous; and by ( 33.33 ) it is a probability distribution function. Therefore, there exists a probability measure $\mu(\cdot, \boldsymbol{\omega})$ on ( $R^{1}, \mathscr{R}^{1}$ ) with distribution function $F(\cdot, \omega)$. For $\omega \in E$, let $\mu(\cdot, \omega)$ be the probability measure corresponding to $F(x)$. Then condition (i) is satisfied.

The class of $H$ for which $\mu(H, \cdot)$ is measurable $\mathscr{A}$ is a $\lambda$-system containing the sets $H=(-\infty, r]$ for rational $r$; therefore $\mu(H, \cdot)$ is measurable $\mathscr{I}$ for $H$ in $\mathscr{R}^{1}$.

By construction, $\mu((-\infty, r], \omega)=P[X \leq r \| \mathscr{G}]_{\omega}$ with probability 1 for rational $r$; that is, for $H=(-\infty, r]$ as well as for $H=R^{1}$,

$$
\int_{G} \mu(H, \omega) P(d \omega)=P([X \in H] \cap G)
$$

for all $G$ in $\mathscr{A}$. Fix $G$. Each side of this equation is a measure as a runction of $H$, and so the equation must hold for all $H$ in $\mathscr{R}^{1}$.

Example 33.12. Let $X$ and $Y$ be random variables whose joint distribution $\nu$ in $R^{2}$ has density $f(x, y)$ with respect to Lebesgue measure: $P[(X, Y) \in A]=\nu(A)=\iint_{A} f(x, y) d x d y$. Let $g(x, y)=f(x, y) / \int_{R^{1}} f(x, t) d t$, and let $\mu(H, x)=\int_{H} g(x, y) d y$ have probability density $g(x, \cdot)$; if $\int_{R^{1}} f(x, t) d t=0$, let $\mu(\cdot, x)$ be an arbitrary probability measure on the line. Then $\mu(H, X(\omega))$ will serve as the conditional distribution of $Y$ given $X$. Indeed, (33.10) is the same thing as $\int_{E \times R^{1}} \mu(F, x) d \nu(x, y)=\nu(E \times F)$, and a change of variable gives $\int_{[X \in E]} \mu(F, X(\omega)) P(d \omega)=P[X \in E, Y \in F]$. Thus $\mu(F, X(\omega))$ is a version of $P[Y \in F \| X]_{\omega}$. This is a new version of Example 33.5.

## PROBLEMS

33.1. 20.27 Borel's paradox. Suppose that a random point on the sphere is specified by longitude $\Theta$ and latitude $\Phi$, but restrict $\Theta$ by $0 \leq \Theta<\pi$, so that $\Theta$ specifies the complete meridian circle (not semicircle) containing the point, and compensate by letting $\Phi$ range over ( $-\pi, \pi$ ].
(a) Show that for given $\Theta$ the conditional distribution of $\Phi$ has density $\frac{1}{4}|\cos \phi|$ over $(-\pi,+\pi]$. If the point lies on, say, the meridian circle through Greenwich, it is therefore not uniformly distributed over that great circle.
(b) Show that for given $\Phi$ the conditional distribution of $\Theta$ is uniform over $(0, \pi)$. If the point lies on the equator ( $\Phi$ is 0 or $\pi$ ), it is therefore uniformly distributed over that great circle.

Since the point is uniformly distributed over the spherical surface and great circles are indistinguishable, (a) and (b) stand in apparent contradiction. This shows again the inadmissibility of conditioning with respect to an isolated event of probability 0 . The relevant $\sigma$-field must not be lost sight of.
33.2. $20.16 \uparrow$ Let $X$ and $Y$ be independent, each having the standard normal distribution, and let $(R, \Theta)$ be the polar coordinates for $(X, Y)$.
(a) Show that $X+Y$ and $X-Y$ are independent and that $R^{2}=\left[(X+Y)^{2}+\right. \left.(X-Y)^{2}\right] / 2$, and conclude that the conditional distribution of $R^{2}$ given $X-Y$ is the chi-squared distribution with one degree of freedom translated by $(X-Y)^{2} / 2$.
(b) Show that the conditional distribution of $R^{2}$ given $\Theta$ is chi-squared with two degrees of freedom.
(c) If $X-Y=0$, the conditional distribution of $R^{2}$ is chi-squared with one degree of freedom. If $\Theta=\pi / 4$ or $\Theta=5 \pi / 4$, the conditional distribution of $R^{2}$ is chi-squared with two degrees of freedom. But the events $[X-Y=0]$ and $[\Theta=\pi / 4] \cup[\Theta=5 \pi / 4]$ are the same. Resolve the apparent contradiction.
33.3. ↑ Paradoxes of a somewhat similar kind arise in very simple cases.
(a) Of three prisoners, call them 1,2 , and 3 , two have been chosen by lot for execution. Prisoner 3 says to the guard, "Which of 1 and 2 is to be executed? One of them will be, and you give me no information about myself in telling me which it is." The guard finds this reasonable and says, "Prisoner 1 is to be executed." And now 3 reasons, "I know that 1 is to be executed; the other will be either 2 or me, and so my chance of being executed is now only $\frac{1}{2}$, instead of the $\frac{2}{3}$ it was before," Apparently, the guard has given him information.

If one looks for a $\sigma$-field, it must be the one describing the guard's answer, and it then becomes clear that the sample space is incompletely specified. Suppose that, if 1 and 2 are to be executed, the guard's response is " 1 " with probability $p$ and " 2 " with probability $1-p$; and, of course, suppose that, if 3 is to be executed, the guard names the other victim. Calculate the conditional probabilities.
(b) Assume that among families with two children the four sex distributions are equally likely. You have been introduced to one of the two children in such a family, and he is a boy. What is the conditional probability that the other is a boy as well?
33.4. (a) Consider probability spaces ( $\Omega, \mathscr{F}, P$ ) and ( $\Omega^{\prime}, \mathscr{F}^{\prime}, P^{\prime}$ ); suppose that $T$ : $\Omega \rightarrow \Omega^{\prime}$ is measurable $\mathscr{F} / \mathscr{F}^{\prime}$ and $P^{\prime}=P T^{-1}$. Let $\mathscr{G}^{\prime}$ be a $\sigma$-field in $\mathscr{F}^{\prime}$, and take $\mathscr{G}$ to be the $\sigma$-field $\left[T^{-1} G^{\prime}: G^{\prime} \in \mathscr{G}^{\prime}\right]$. For $A^{\prime} \in \mathscr{F}^{\prime}$, show by (16.18) that $P\left[T^{-1} A^{\prime} \| \mathscr{G}\right]_{\omega}=P^{\prime}\left[A^{\prime} \| \mathscr{G}^{\prime}\right]_{T \omega}$ with $P$-probability 1 .
(b) Now take $\left(\Omega^{\prime}, \mathscr{F}^{\prime}, P^{\prime}\right)=\left(R^{2}, \mathscr{R}^{2}, \mu\right)$, whele $\mu$ is the distribution of a random vector $(X, Y)$ on $(\Omega, \mathscr{F}, P)$. Suppose that $(X, Y)$ has density $f$, and show by (33.9) that

$$
P[Y \in F \| X]_{\omega}=\frac{\int_{F} f(X(\omega), t) d t}{\int_{R^{1}} f(X(\omega), t) d t}
$$

with probability 1.
33.5. $\uparrow$ (a) There is a slightly different approach to conditional probability. Let $(\Omega, \mathscr{F}, P)$ be a probability space, $\left(\Omega^{\prime}, \mathscr{F}^{\prime}\right)$ a measurable space, and $T: \Omega \rightarrow \Omega^{\prime}$ a mapping measurable $\mathscr{F} / \mathscr{F}^{\prime}$. Define a measure $\nu$ on $\mathscr{F}^{\prime}$ by $\nu\left(A^{\prime}\right)=P(A \cap \left.T^{-1} A^{\prime}\right)$ for $A^{\prime} \in \mathscr{F}^{\prime}$. Prove that there exists a function $p\left(A \mid \omega^{\prime}\right)$ on $\Omega^{\prime}$, measurable $\mathscr{F}^{\prime}$ and integrable $P T^{-1}$, such that $\int_{A^{\prime}} p\left(A \mid \omega^{\prime}\right) P T^{-1}\left(d \omega^{\prime}\right)=P\left(A \cap T^{-1} A^{\prime}\right)$ for all $A^{\prime}$ in $\mathscr{F}^{\prime}$. Intuitively, $p\left(A \mid \omega^{\prime}\right)$ is the conditional probability that $\omega \in A$ for someone who knows that $T \omega=\omega^{\prime}$. Let $\mathscr{A}=\left[T^{-1} A^{\prime}: A^{\prime} \in \mathscr{F}\right]$; show that $\mathscr{A}$ is a $\sigma$-field and that $p(A \mid T \omega)$ is a version of $P[A \| \mathscr{G}]_{\omega}$.
(b) Connect this with part (a) of the preceding problem.
33.6. $\uparrow$ Suppose that $T=X$ is a random variable, $\left(\Omega^{\prime}, \mathscr{F}^{\prime}\right)=\left(R^{1}, \mathscr{R}^{1}\right)$, and $x$ is the general point of $R^{1}$. In this case $p(A \mid x)$ is sometimes written $P[A \mid X=x]$. What is the problem with this notation?
33.7. For the Poisson process (see Example 33.1) show that for $0<s<t$,

$$
P\left[N_{s}=k \| N_{t}\right]= \begin{cases}\binom{N_{t}}{k}\left(\frac{s}{t}\right)^{k}\left(1-\frac{s}{t}\right)^{N_{t}-k}, & k \leq N_{t} \\ 0, & k>N_{t}\end{cases}
$$

Thus the conditional distribution (in the sense of Theorem 33.3) of $N_{s}$ given $N_{t}$ is binomial with parameters $N_{t}$ and $s / t$.
33.8. $29.12 \uparrow$ Suppose that $\left(X_{1}, X_{2}\right)$ has the centered normal distribution-has in the plane the distribution with density (29.10). Express the quadratic form in the exponential as

$$
\frac{1}{\sigma_{11}} x_{1}^{2}+\frac{\sigma_{11}}{D}\left(x_{2}-\frac{\sigma_{12}}{\sigma_{11}} x_{1}\right)^{2}
$$

integrate out the $x_{2}$ and show that

$$
\frac{f\left(x_{1}, x_{2}\right)}{\int_{-\infty}^{\infty} f\left(x_{1}, t\right) d t}=\frac{1}{\sqrt{2 \pi \tau}} \exp \left[-\frac{1}{2 \tau}\left(x_{2}-\frac{\sigma_{12}}{\sigma_{11}} x_{1}\right)^{2}\right],
$$

where $\tau=\sigma_{22}-\sigma_{12}^{2} \sigma_{11}^{-1}$. Describe the conditional distribution of $X_{2}$ given $X_{1}$.
33.9. (a) Suppose that $\mu(H, \omega)$ has property (i) in Theorem 33.3, and suppose that $\mu(H, \cdot)$ is a version of $P[X \in H \| \mathscr{G}]$ for $H$ in a $\pi$-system generating $\mathscr{R}^{1}$. Show that $\mu(\cdot, \omega)$ is a conditional distribution of $X$ given $\mathscr{G}$.
(b) Use Theorem 12.5 to extend Theorem 33.3 from $R^{1}$ to $R^{k}$.
(c) Show that conditional probabilities can be defined as genuine probabilities on spaces of the special form $\left(\Omega, \sigma\left(X_{1}, \ldots, X_{k}\right), P\right)$.
33.10. ↑ Deduce from (33.16) that the conditional distribution of $X$ given $M$ is

$$
\frac{1}{2} I_{[M \in H]}(\omega)+\frac{1}{2} \frac{\mu(H \cap(-\infty, M(\omega)])}{\mu(-\infty, M(\omega)])},
$$

where $\mu$ is the distribution corresponding to $F$ (positive and continuous). Hint: First check $H=(-\infty, x]$.
33.11. $4.10 \quad 12.4 \uparrow$ The following construction shows that conditional probabilities may not give measures. Complete the details.

In Problem 4.10 it is shown that there exist a probability space ( $\Omega, \mathscr{F}, P$ ), a $\sigma$-field $\mathscr{G}$ in $\mathscr{F}$, and a set $H$ in $\mathscr{F}$ such that $P(H)=\frac{1}{2}, H$ and $\mathscr{G}$ are independent, $\mathscr{A}$ contains all the singletons, and $\mathscr{I}$ is generated by a countable subclass. The countable subclass generating $\mathscr{E}$ can be taken to be a $\pi$-system $\mathscr{P}=\left\{B_{1}, B_{2}, \ldots\right\}$ (pass to the finite intersections of the sets in the original class).

Assume that it is possible to choose versions $P[A \| \mathscr{G}]$ so that $P[A \| \mathscr{G}]_{\omega}$ is for each $\omega$ a probability measure as $A$ varies over $\mathscr{F}$. Let $C_{n}$ be the $\omega$-set where $P\left[B_{n} \| \mathscr{G}\right]_{\omega}=I_{B_{n}}(\omega)$; show (Example 33.3) that $C=\bigcap_{n} C_{n}$ has probability 1 . Show that $\omega \in C$ implies that $P[G \| \mathscr{A}]_{\omega}=I_{G}(\omega)$ for all $G$ in $\mathscr{A}$ and hence that $P[\{\omega\} \| \mathscr{G}]_{\omega}=1$.

Now $\omega \in H \cap C$ implies that $P[H \| \mathscr{G}]_{\omega} \geq P[\{\omega\} \| \mathscr{G}]_{\omega}=1$ and $\omega \in H^{c} \cap C$ implies that $P[H \| \mathscr{G}]_{\omega} \leq P[\Omega-\{\omega\} \| \mathscr{G}]_{\omega}=0$. Thus $\omega \in C$ implies that $P[H \| \mathscr{G}]_{\omega}=I_{H}(\omega)$. But since $H$ and $\mathscr{G}$ are independent, $P[H \| \mathscr{G}]_{\omega}= P(H)=\frac{1}{2}$ with probability 1 , a contradiction.

This example is related to Example 4.10 but concerns mathematical fact instead of heuristic interpretation.
33.12. Let $\alpha$ and $\beta$ be $\sigma$-finite measures on the line, and let $f(x, y)$ be a probability density with respect to $\alpha \times \beta$. Define

$$
\begin{equation*}
g_{x}(y)=\frac{f(x, y)}{\int_{R^{\prime}} f(x, t) \beta(d t)}, \tag{33.34}
\end{equation*}
$$

unless the denominator vanishes, in which case take $g_{x}(y)=0$, say. Show that, if ( $X, Y$ ) has density $f$ with respect to $\alpha \times \beta$, then the conditional distribution of $Y$ given $X$ has density $g_{X}(y)$ with respect to $\beta$. This generalizes Examples 33.5 and 33.12, where $\alpha$ and $\beta$ are Lebesgue measure.
33.13. $18.20 \uparrow$ Suppose that $\mu$ and $\nu_{x}$ (one for each real $x$ ) are probability measures on the line, and suppose that $\nu_{x}(B)$ is a Borel function in $x$ for each $B \in \mathscr{R}^{1}$. Then (see Problem 18 20)

$$
\begin{equation*}
\pi(E)=\int_{R^{1}} \nu_{x}[y \cdot(x, y) \in E] \mu(d x) \tag{33.35}
\end{equation*}
$$

defines a probability measure on $\left(R^{2}, \mathscr{R}^{2}\right)$.
Suppose that ( $X, Y$ ) has distribution $\pi$, and show that $\nu_{X}$ is a version of the conditional distribution of $Y$ given $X$.
33.14. $\uparrow$ Let $\alpha$ and $\beta$ be $\sigma$-finite measures on the line. Specialize the setup of Problem 33.13 by supposing that $\mu$ has density $f(x)$ with respect to $\alpha$ and $\nu_{x_{5}}$ has density $g_{x}(y)$ with respect to $\beta$. Assume that $g_{x}(y)$ is measurable $\mathscr{R}^{2}$ in the pair $(x, y)$, so that $\nu_{x}(B)$ is automatically measurable in $x$. Show that (33.35) has density $f(x) g_{x}(y)$ with respect to $\alpha \times \beta: \pi(E)= \iint_{E} f(x) g_{x}(y) \alpha(d x) \beta(d y)$. Sliow that (33.34) is consistent with $f(x, y)= f(x) g_{x}(y)$. Put

$$
p_{y}(x)=\frac{f(x) g_{x}(y)}{\int_{R^{\prime}} f(s) g_{s}(y) \alpha(d s)}
$$

Suppose that ( $X, Y$ ) has density $f(x) g_{x}(y)$ with respect to $\alpha \times \beta$, and show that $p_{Y}(x)$ is a density with respect to $\alpha$ for the conditional distribution of $X$ given $Y$.

In the language of Bayes, $f(x)$ is the prior density of a parameter $x, g_{x}(y)$ is the conditional density of the observation $y$ given the parameter, and $p_{y}(x)$ is the posterior density of the parameter given the observation.
33.15. $\uparrow$ Now suppose that $\alpha$ and $\beta$ are Lebesgue measure, that $f(x)$ is positive, continuous, and bounded, and that $g_{x}(y)=e^{-(y-x)^{2} n / 2} / \sqrt{2 \pi / n}$. Thus the observation is distributed as the average of $n$ independent normal variables with mean $x$ and variance 1 . Show that

$$
\frac{1}{\sqrt{n}} p_{y}\left(y+\frac{x}{\sqrt{n}}\right) \rightarrow \frac{1}{\sqrt{2 \pi}} e^{-x^{2} / 2}
$$

for fixed $x$ and $y$. Thus the posterior density is approximately that of a normal distribution with mean $y$ and variance $1 / n$.
33.16. $32.13 \uparrow$ Suppose that $X$ has distribution $\mu$. Now $P[A \| X]_{\omega}=f(X(\omega))$ for some Borel function $f$. Show that $\lim _{h \rightarrow 0} P[A \mid x-h<X \leq x+h]=f(x)$ for $x$ in a set of $\mu$-measure 1. Roughly speaking, $P[A \mid x-h<X \leq x+h] \rightarrow P[A \mid X =x]$. Hint: Take $\nu(B)=P(A \cap[X \in B])$ in Problem 32.13.

## SECTION 34. CONDITIONAL EXPECTATION

In this section the theory of conditional expectation is developed from first principles. The properties of conditional probabilities will then follow as special cases. The preceding section was long only because of the examples in it; the theory itself is quite compact.

## Definition

Suppose that $X$ is an integrable random variable on ( $\Omega, \mathscr{F}, P$ ) and that $\mathscr{G}$ is a $\sigma$-field in $\mathscr{F}$. There exists a random variable $E[X \| \mathscr{G}]$, called the conditional expected value of $X$ given $\mathscr{G}$, having these two properties:
(i) $E[X \| \mathscr{G}]$ is measurable $\mathscr{G}$ and integrable.
(ii) $E[X \| \mathscr{G}]$ satisfies the functional equation

$$
\begin{equation*}
\int_{G} E\left[X \|_{\mathscr{A}}\right] d P=\int_{G} X d P, \quad G \in \mathscr{A} \tag{34.1}
\end{equation*}
$$

To prove the existence of such a random variable, consider first the case of nonnegative $X$. Define a measure $\nu$ on $\mathscr{G}$ by $\nu(G)=\int_{G} X d P$. This measure is finite because $X$ is integrable, and it is absolutely continuous with respect to $P$. By the Radon-Nikodym theorem there is a function $f$, measurable $\mathscr{G}$, such that $\nu(G)=\int_{G} f d P .^{\dagger}$ This $f$ has properties (i) and (ii). If $X$ is not necessarily nonnegative, $E\left[X^{+} \| \mathscr{G}\right]-E\left[X^{-} \| \mathscr{G}\right]$ clearly has the required properties.

There will in general be many such random variables $E[X \| \mathscr{G}]$; any one of them is called a version of the conditional expected value. Any two versions are equal with probability 1 (by Theorem 16.10 applied to $P$ restricted to $\mathscr{G}$ ).

Arguments like those in Examples 33.3 and 33.4 show that $E[X \|\{0, \Omega\}]= E[X]$ and that $E[X \| \mathscr{F}]=X$ with probability 1 . As $\mathscr{A}$ increases, condition (i) becomes weaker and condition (ii) becomes stronger.

The value $E[X \| \mathscr{G}]_{\omega}$ at $\omega$ is to be interpreted as the expected value of $X$ for someone who knows for each $G$ in $\mathscr{A}$ whether or not it contains the point $\omega$, which itself in general remains unknown. Condition (i) ensures that $E[X \| \mathscr{G}]$ can in principle be calculated from this partial information alone. Condition (ii) can be restated as $\int_{G}(X-E[X \| \mathscr{E}]) d P=0$; if the observer, in possession of the partial information contained in $\mathscr{G}$, is offered the opportunity to bet, paying an entry fee of $E[X \| \mathscr{E}]$ and being returned the amount $X$, and if he adopts the strategy of betting if $G$ occurs, this equation says that the game is fair.

[^21]Example 34.1. Suppose that $B_{1}, B_{2}, \ldots$ is a finite or countable partition of $\Omega$ generating the $\sigma$-field $\mathscr{G}$. Then $E[X \| \mathscr{G}]$ must, since it is measurable $\mathscr{G}$, have some constant value over $B_{i}$, say $\alpha_{i}$. Then (34.1) for $G=B_{i}$ gives $\alpha_{i} P\left(B_{i}\right)=f_{B_{i}} X d P$. Thus

$$
\begin{equation*}
E[X \| \mathscr{G}]_{\omega}=\frac{1}{P\left(B_{i}\right)} \int_{B_{i}} X d P, \quad \omega \in B_{i}, \quad P\left(B_{i}\right)>0 \tag{34.2}
\end{equation*}
$$

If $P\left(B_{i}\right)=0$, the value of $E[X \| \mathscr{G}]$ over $B_{i}$ is constant but arbitrary. $\square$

Example 34.2. For an indicator $I_{A}$ the defining properties of $E\left[I_{A} \| \mathscr{G}\right]$ and $P[A \| \mathscr{G}]$ coincide; therefore, $E\left[I_{A} \| \mathscr{G}\right]=P[A \| \mathscr{G}]$ with probability 1 . It is easily checked that, more generally, $E[X \| \mathscr{G}]=\sum_{i} \alpha_{i} P\left[A_{i} \| \mathscr{G}\right]$ with probability 1 for a simple function $X=\sum_{i} \alpha_{i} I_{A_{i}}$. $\square$

In analogy with the case of conditional probability, if $\left[X_{t}, t \in T\right]$ is a collection of random variables, $E\left[X \| X_{t}, t \in T\right]$ is by definition $E[X \| \mathscr{G}]$ with $\sigma\left[X_{t}, t \in T\right]$ in the role of $\mathscr{G}$.

Example 34.3. Let $\mathscr{I}$ be the $\sigma$-field of sets invariant under a measurepreserving transformation $T$ on $(\Omega, \mathscr{F}, P)$. For $f$ integrable, the limit $\hat{\hat{f}}$ in (24.7) is $E[f \| \mathscr{I}]$ : Since $\hat{f}$ is invariant, it is measurable $\mathscr{I}$. If $G$ is invariant, then the averages $a_{n}$ in the proof of the ergodic theorem (p. 318) satisfy $E\left[I_{G} a_{n}\right]=E\left[I_{G} f\right]$. But since the $a_{n}$ converge to $\hat{f}$ and are uniformly integrable, $E\left[I_{G} \hat{f}\right]=E\left[I_{G} f\right]$. $\square$

## Properties of Conditional Expectation

To prove the first result, apply Theorem 16.10 (iii) to $f$ and $E[X \| \mathscr{G}]$ on $(\Omega, \mathscr{G}, P)$.

Theorem 34.1. Let $\mathscr{P}$ be a $\pi$ system generating the $\sigma$-field $\mathscr{G}$, and suppose that $\Omega$ is a finite or countable union of sets in $\mathscr{G}$. An integrable function $f$ is a version of $E[X \| \mathscr{A}]$ if it is measurable $\mathscr{G}$ and if

$$
\begin{equation*}
\int_{G} f d P=\int_{G} X d P \tag{34.3}
\end{equation*}
$$

holds for all $G$ in $\mathscr{P}$.
In most applications it is clear that $\Omega \in \mathscr{P}$.
All the equalities and inequalities in the following theorem hold with probability 1 .

Theorem 34.2. Suppose that $X, Y, X_{n}$ are integrable.
(i) If $X=a$ with probability 1 , then $E[X \| \mathscr{G}]=a$.
(ii) For constants $a$ and $b, E[a X+b Y \| \mathscr{G}]=a E[X \| \mathscr{G}]+b E[Y \| \mathscr{G}]$.
(iii) If $X \leq Y$ with probability 1 , then $E[X \| \mathscr{G}] \leq E[Y \| \mathscr{G}]$.
(iv) $|E[X \| \mathscr{G}]| \leq E[|X| \| \mathscr{G}]$.
(v) If $\lim _{n} X_{n}=X$ with probability $1,\left|X_{n}\right| \leq Y$, and $Y$ is integrable, then $\lim _{n} E\left[X_{n} \| \mathscr{G}\right]=E[X \| \mathscr{G}]$ with probability 1.

Proof. If $X=a$ with probability 1 , the function identically equal to $a$ satisfies conditions (i) and (ii) in the definition of $E[X \| \mathscr{G}]$, and so (i) above follows by uniqueness.

As for (ii), $a E[X \| \mathscr{G}]+b E[Y \| \mathscr{H}]$ is integrable and measurable $\mathscr{G}$, and

$$
\begin{aligned}
\int_{G}(a E[X \| \mathscr{G}]+b E[Y \| \mathscr{G}]) d P & =a \int_{G} E[X \| \mathscr{A}] d P+b \int_{G} E[Y \| \mathscr{E}] d P \\
& =a \int_{G} X d P+b \int_{G} Y d P=\int_{G}(a X+b Y) d P
\end{aligned}
$$

for all $G$ in $\mathscr{G}$, so that this function satisfies the functional equation.
If $X \leq Y$ with probability 1 , then $\int_{G}(E[Y \| \mathscr{G}]-E[X \| \mathscr{G}]) d P=\int_{G}(Y- X) d P \geq 0$ for all $G$ in $\mathscr{G}$. Since $E[Y \| \mathscr{G}]-E[X \| \mathscr{G}]$ is measurable $\mathscr{G}$, it must be nonnegative with probability 1 (consider the set $G$ where it is negative). This proves (iii), which clearly implies (iv) as well as the fact that $E[X \| \mathscr{G}]=E[Y \| \mathscr{G}]$ if $X=Y$ with probability 1.

To prove (v), consider $\left.Z_{n}=\sup _{k \geq n} \mid X_{k}-X\right]$. Now $Z_{n} \downarrow 0$ with probability 1 , and by (ii), (iii), and (iv), $\left|E\left[X_{n} \| \mathscr{G}\right]-E[X \| \mathscr{G}]\right| \leq E\left[Z_{n} \| \mathscr{G}\right]$. It suffices, therefore, to show that $E\left[Z_{n} \| \mathscr{G}\right] \downarrow 0$ with probability 1 . By (iii) the sequence $E\left[Z_{n} \| \mathscr{I}\right]$ is nonincreasing and hence has a limit $Z$; the problem is to prove that $Z=0$ with probability 1 , or, $Z$ being nonnegative, that $E[Z]=0$. But $0 \leq Z_{n} \leq 2 Y$, and so (34.1) and the dominated convergence theorem give $E[Z]=\int E[Z \| \mathscr{G}] d P \leq \int E\left[Z_{n} \| \mathscr{G}\right] d P=E\left[Z_{n}\right] \rightarrow 0$. $\square$

The properties (33.21) through (33.28) can be derived anew from Theorem 34.2. Part (ii) shows once again that $E\left[\sum_{i} \alpha_{i} I_{A_{i}} \| \mathscr{G}\right]=\sum_{i} \alpha_{i} P\left[A_{i} \| \mathscr{G}\right]$ for simple functions.

If $X$ is measurable $\mathscr{G}$, then clearly $E[X \| \mathscr{G}]=X$ with probability 1 . The following generalization of this is used constantly. For an observer with the information in $\mathscr{G}, X$ is effectively a constant if it is measurable $\mathscr{G}$ :

Theorem 34.3. If $X$ is measurable $\mathscr{G}$, and if $Y$ and $X Y$ are integrable, then

$$
\begin{equation*}
E[X Y \| \mathscr{G}]=X E[Y \| \mathscr{G}] \tag{34.4}
\end{equation*}
$$

with probability 1.

Proof. It will be shown first that the right side of (34.4) is a version of the left side if $X=I_{G_{0}}$ and $G_{0} \in \mathscr{G}$. Since $I_{G_{0}} E[Y \| \mathscr{G}]$ is certainly measurable $\mathscr{G}$, it suffices to show that it satisfies the functional equation $\int_{G} I_{G_{0}} E[Y \| \mathscr{G}] d P=\int_{G} I_{G_{0}} Y d P, G \in \mathscr{G}$. But this reduces to $\int_{G \cap G_{0}} E[Y \| \mathscr{H}] d P =\int_{G \cap G_{0}} Y d P$, which holds by the definition of $E[Y \| \mathscr{G}]$. Thus (34.4) holds if $X$ is the indicator of an element of $\mathscr{E}$.

It follows by Theorem 34.2(ii) that (34.4) holds if $X$ is a simple function measurable $\mathscr{G}$. For the general $X$ that is measurable $\mathscr{G}$, there exist simple functions $X_{n}$, measurable $\mathscr{G}$, such that $\left|X_{r}\right| \leq|X|$ and $\lim _{n} X_{n}=X$ (Theorem 13.5). Since $\left|X_{n} Y\right| \leq|X Y|$ and $|X Y|$ is integrable, Theorem 34.2(v) implies that $\lim _{n} E\left[X_{n} Y \| \mathscr{G}\right]=E[X Y \| \mathscr{G}]$ with probability 1 . But $E\left[X_{n} Y \| \mathscr{G}\right]= X_{n} E[Y \| \mathscr{G}]$ by the case already treated, and of course $\lim _{n} X_{n} E[Y \| \mathscr{G}]= X E[Y \| \mathscr{G}]$. (Note that $\left|X_{n} E[Y \| \mathscr{G}]\right|=\left|E\left[X_{n} Y \| \mathscr{G}\right]\right| \leq E\left[\left|X_{n} Y\right| \| \mathscr{G}\right] \leq E[|X Y| \| \mathscr{G}]$, so that the limit $X E[Y \mid \mathscr{A}]$ is integrable.) Thus (34.4) holds in general. Notice that $X$ has not been assumed integrable.

Taking a conditional expected value can be thought of as an averaging or smoothing operation. This leads one to expect that averaging $X$ with respect to $\mathscr{G}_{2}$ and then averaging the result with respect to a coarser (smaller) $\sigma$-field $\mathscr{H}_{1}$ should lead to the same resuit as would averaging with respect to $\mathscr{G}_{1}$ in the first place:

Theorem 34.4. If $X$ is integrable and the $\sigma$-fields $\mathscr{H}_{1}$ and $\mathscr{G}_{2}$ satisfy $\mathscr{G}_{1} \subset \mathscr{G}_{2}$, then

$$
\begin{equation*}
E\left[E\left[X \| \mathscr{G}_{2}\right] \| \mathscr{G}_{1}\right]=E\left[X \| \mathscr{G}_{1}\right] \tag{34.5}
\end{equation*}
$$

with probability 1.
Proof. The left side of (34.5) is measurable $\mathscr{A}_{1}$, and so to prove that it is a version of $E\left[X \| \mathscr{H}_{1}\right]$, it is enough to verify $\int_{G} E\left[E\left[X \| \mathscr{H}_{2}\right] \| \mathscr{G}_{1}\right] d P=\int_{G} X d P$ for $G \in \mathscr{G}_{1}$. But if $G \in \mathscr{G}_{1}$, then $G \in \mathscr{G}_{2}$, and the left side here is $\int_{G} E\left[X \| \mathscr{H}_{2}\right] d P=\int_{G} X d P$.

If $\mathscr{H}_{2}=\mathscr{F}$, then $E\left[X \| \mathscr{G}_{2}\right]=X$, so that (34.5) is trivial. If $\mathscr{G}_{1}=\{0, \Omega\}$ and $\mathscr{I}_{2}=\mathscr{A}$, then (34.5) becomes

$$
\begin{equation*}
E[E[X \| \mathscr{G}]]=E[X] \tag{34.6}
\end{equation*}
$$

the special case of (34.1) for $G=\Omega$.
If $\mathscr{H}_{1} \subset \mathscr{H}_{2}$, then $E\left[X \| \mathscr{H}_{1}\right]$, being measurable $\mathscr{H}_{1}$, is also measurable $\mathscr{H}_{2}$, so that taking an expected value with respect to $\mathscr{H}_{2}$ does not alter it: $E\left[E\left[X \| \mathscr{G}_{1}\right] \| \mathscr{G}_{2}\right]=E\left[X \| \mathscr{G}_{1}\right]$. Therefore, if $\mathscr{G}_{1} \subset \mathscr{G}_{2}$, taking iterated expected values in either order gives $E\left[X \| \mathscr{G}_{1}\right]$.

The remaining result of a general sort needed here is Jensen's inequality for conditional expected values: If $\varphi$ is a convex function on the line and $X$ and $\varphi(X)$ are both integrable, then

$$
\begin{equation*}
\varphi(E[X \| \mathscr{G}]) \leq E[\varphi(X) \| \mathscr{G}] \tag{34.7}
\end{equation*}
$$

with probability 1 . For each $x_{0}$ take a support line [A33] through $\left(x_{0}, \varphi\left(x_{0}\right)\right)$ : $\varphi\left(x_{0}\right)+A\left(x_{0}\right)\left(x-x_{0}\right) \leq \varphi(x)$. The slope $A\left(x_{0}\right)$ can be taken as the right-hand derivative of $\varphi$, so that it is nondecreasing in $x_{0}$. Now

$$
\varphi(E[X \| \mathscr{G}])+A(E[X \| \mathscr{G}])(X-E[X \| \mathscr{G}]) \leq \varphi(X) .
$$

Suppose that $E[X \| \mathscr{G}]$ is bounded. Then all three terms here are integrable (if $\varphi$ is convex on $R^{1}$, then $\varphi$ and $A$ are bounded on bounded sets), and taking expected values with respect to $\mathscr{I}$ and using (34.4) on the middle term gives (34.7).

To prove (34.7) in general, let $G_{n}=[|E[X \| \mathscr{G}]| \leq n]$. Then $E\left[I_{G_{n}} X \| \mathscr{G}\right]= I_{G_{n}} E[X \| \mathscr{G}]$ is bounded, and so (34.7) holds for $I_{G_{n}} X$ : $\varphi\left(I_{G_{n}} E[X \| \mathscr{H}]\right) \leq E\left[\varphi\left(I_{G_{n}} X\right) \| \mathscr{G}\right]$. Now $E\left[\varphi\left(I_{G_{n}} X\right) \| \mathscr{G}\right]=E\left[I_{G_{n}} \varphi(X)+I_{G_{n}^{c}} \varphi(0) \| \mathscr{G}\right]= I_{G_{n}} E[\varphi(X) \| \mathscr{A}]+I_{G_{n}^{c}} \varphi(0) \rightarrow E\left[\varphi\left(X^{n}\right) \| \mathscr{H}\right]$. Since $\varphi\left(I_{G_{n}}^{n} E[X \| \mathscr{H}]\right)$ converges to $\varphi(E[X \| \mathscr{G}])$ by the continuity of $\varphi$, (34.7) follows. If $\varphi(x)=|x|$, (34.7) gives part (iv) of Theorem 34.2 again.

## Conditional Distributions and Expectations

Theorem 34.5. Let $\mu(\cdot, \omega)$ be a conditional distribution with respect to $\mathscr{A}$ of a random variable $X$, in the sense of Theorem 33.3. If $\varphi: R^{1} \rightarrow R^{1}$ is a Borel function for which $\varphi(X)$ is integrabie, then $\int_{R^{1}} \varphi(x) \mu(d x, \omega)$ is a version of $E[\varphi(X) \| \mathscr{I}]_{\omega}$.

Proof. If $\varphi=I_{H}$ and $H \in \mathscr{R}^{1}$, this is an immediate consequence of the definition of conditional distribution, and by Theorem 34.2(ii) it follows for $\varphi$ a simple function over $R^{1}$. For the general nonnegative $\varphi$, choose simple $\varphi_{n}$ such that $0 \leq \varphi_{n}(x) \uparrow \varphi(x)$ for each $x$ in $R^{1}$. By the case already treated, $\int_{R^{i}} \varphi_{n}(x) \mu(d x, \omega)$ is a version of $E\left[\varphi_{n}(X) \| \mathscr{G}\right]_{\omega}$. The integral converges by the monotone convergence theorem in ( $R^{1}, \mathscr{R}^{1}, \mu(\cdot, \omega)$ ) to $\int_{R^{1}} \varphi(x) \mu(d x, \omega)$ for each $\omega$, the value $+\infty$ not excluded, and $E\left[\varphi_{n}(X) \| \mathscr{G}\right]_{\omega}$ converges to $E[\varphi(X) \| \mathscr{A}]_{\omega}$ with probability 1 by Theorem 34.2(v). Thus the result holds for nonnegative $\varphi$, and the general case follows from splitting into positive and negative parts.

It is a consequence of the proof above that $\int_{R^{1}} \varphi(x) \mu(d x, \omega)$ is measurable and finite with probability 1 . If $X$ is itself integrable, it follows by the
theorem for the case $\varphi(x)=x$ that

$$
E[X \| \mathscr{G}]_{\omega}=\int_{-\infty}^{\infty} x \mu(d x, \omega)
$$

with probability 1 . If $\varphi(X)$ is integrable as well, then

$$
\begin{equation*}
E[\varphi(X) \| \mathscr{A}]_{\omega}=\int_{-\infty}^{\infty} \varphi(x) \mu(d x, \omega) \tag{34.8}
\end{equation*}
$$

with probability 1 . By Jensen's inequality (21.14) for unconditional expected values, the right side of (34.8) is at least $\varphi\left(\int_{-\infty}^{\infty} x \mu(d x, \omega)\right)$ if $\varphi$ is convex. This gives another proof of (34.7).

## Sufficient Subfields*

Suppose that for each $\theta$ in an index set $\Theta, P_{6}$ is a probability measure on ( $\Omega, \mathscr{F}$ ). In statistics the problem is to draw inferences about the unknown parameter $\theta$ from an observation $\omega$.

Denote by $P_{\theta}[A \| \mathscr{G}]$ and $E_{\theta}[X \| \mathscr{G}]$ conditional probabilities and expected values calculated with respect to the probability measure $P_{\theta}$ on ( $\Omega, \mathscr{F}$ ). A $\sigma$-field $\mathscr{I}$ in $\mathscr{F}$ is sufficient for the family $\left[P_{\theta}: \theta \in \Theta\right]$ if versions $P_{\theta}[A \| \mathscr{G}]$ can be closen that are independent of $\theta$-that is, if there exists a function $p(A, \omega)$ of $A \in \mathscr{F}$ and $\omega \in \Omega$ such that, for each $A \in \mathscr{F}$ and $\theta \in \Theta, p(A, \cdot)$ is a version of $P_{\theta}[A \| \mathscr{G}]$. There is no requirement that $p(\cdot, \omega)$ be a measure for $\omega$ fixed. The idea is that although there may be information in $\mathscr{F}$ not already contained in $\mathscr{G}$, this information is irrelevant to the drawing of inferences about $\theta .{ }^{\dagger}$ A sufficient statistic is a random variable or random vector $T$ such that $\sigma(T)$ is a sufficient subfield.

A family $\mathscr{M}$ of measures dominates another family $\mathscr{N}$ if, for each $A$, from $\mu(A)=0$ for all $\mu$ in $\mathscr{M}$, it follows that $\nu(A)=0$ for all $\nu$ in $\mathscr{N}$. If each of $\mathscr{M}$ and $\mathscr{N}$ dominates the other, they are equivalent. For sets consisting of a single measure these are the concepts introduced in Section 32.

Theorem 34.6. Suppose that $\left[P_{\theta}: \theta \in \Theta\right]$ is dominated by the $\sigma$-finite measure $\mu . A$ necessary and sufficient condition for $\mathscr{I}$ to be sufficient is that the density $f_{\theta}$ of $P_{\theta}$ with respect to $\mu$ can be put in the form $f_{\theta}=g_{\theta} h$ for a $g_{\theta}$ measurable $\mathscr{I}$.

It is assumed throughout that $g_{\theta}$ and $h$ are nonnegative and of course that $h$ is measurable $\mathscr{F}$. Theorem 34.6 is called the factorization theorem, the condition being that the density $f_{\theta}$ splits into a factor depending on $\omega$ only through $\mathscr{G}$ and a factor independent of $\theta$. Although $g_{\theta}$ and $h$ are not assumed integrable $\mu$, their product $f_{\theta}$, as the density of a finite measure, must be. Before proceeding to the proof, consider an application.

Example 34.4. Let $(\Omega, \mathscr{F})=\left(R^{k}, \mathscr{R}^{k}\right)$, and for $\theta>0$ let $P_{\theta}$ be the measure having with respect to $k$-dimensional Lebesgue measure the density

$$
f_{\theta}(x)=f_{\theta}\left(x_{1}, \ldots, x_{k}\right)= \begin{cases}\theta^{-k} & \text { if } 0 \leq x_{i} \leq \theta, i=1, \ldots, k \\ 0 & \text { otherwise }\end{cases}
$$

[^22]If $X_{i}$ is the function on $R^{k}$ defined by $X_{i}(x)=x_{i}$, then under $P_{\theta}, X_{1}, \ldots, X_{k}$ are independent random variables, each uniformly distributed over [ $0, \theta$ ]. Let $T(x)= \max _{i \leq k} X_{i}(x)$. If $g_{\theta}(t)$ is $\theta^{-k}$ for $0 \leq t \leq \theta$ and 0 otherwise, and if $h(x)$ is 1 or 0 according as all $x_{i}$ are nonnegative or not, then $f_{\theta}(x)=g_{\theta}(T(x)) h(x)$. The factorization criterion is thus satisfied, and $T$ is a sufficient statistic.

Sufficiency is clear on intuitive grounds as well: $\theta$ is not involved in the conditional distribution of $X_{1}, \ldots, X_{k}$ given $T$ because, roughly speaking, a random one of them equals $T$ and the others are independent and uniform over $[0, T]$. If this is true, the distribution of $X_{i}$ given $T$ ought to have a mass of $k^{-1}$ at $T$ and a uniform distribution of mass $1-k^{-1}$ over $[0, T]$, so that

$$
\begin{equation*}
E_{\theta}\left[X_{i} \| T\right]=\frac{1}{k} T+\frac{k-1}{k} \frac{T}{2}=\frac{k+1}{2 k} T . \tag{34.9}
\end{equation*}
$$

For a proof of this fact, needed later, note that by (219)

$$
\begin{align*}
\int_{T \leq t} X_{i} d P_{\theta} & =\int_{0}^{\infty} P_{\theta}\left[T \leq t, X_{i} \geq u\right] d u  \tag{3410}\\
& =\int_{0}^{t} \frac{t-u}{\theta}\left(\frac{t}{\theta}\right)^{k-1} d u=\frac{t^{k+1}}{2 \theta^{k}}
\end{align*}
$$

if $0 \leq t \leq \theta$. On the other hand, $P_{\theta}[T \leq t]=(t / \theta)^{k}$, so that under $P_{\theta}$ the distribution of $T$ has density $k t^{k-1} / \theta^{k}$ over $[0, \theta]$. Thus

$$
\begin{equation*}
\int_{T \leq t} \frac{k+1}{2 k} T d P_{\theta}=\frac{k+1}{2 k} \int_{0}^{t} u k \frac{u^{k-1}}{\theta^{k}} d u=\frac{t^{k+1}}{2 \theta^{k}} . \tag{34.11}
\end{equation*}
$$

Since (34.10) and (34.11) agree, (34.9) follows by Theorem 34.1.
The essential ideas in the proof of Theorem 34.6 are most easily understood through a preliminary consideration of special cases.

Lemma 1. Suppose that $\left[P_{\theta}: \theta \in \Theta\right]$ is dominated by a probability measure $P$ and that each $P_{\theta}$ has with respect to $P$ a density $g_{\theta}$ that is measurable $\mathscr{G}$. Then $\mathscr{G}$ is sufficient, and $P[A \| \mathscr{G}]$ is a version of $P_{\theta}[A \| \mathscr{G}]$ for each $\theta$ in $\Theta$.

Proof. For $G$ in $\mathscr{G}$, (34.4) gives

$$
\begin{aligned}
\int_{G} P[A \| \mathscr{G}] d P_{\theta} & =\int_{G} E\left[I_{A} \| \mathscr{G}\right] g_{\theta} d P=\int_{G} E\left[I_{A} g_{\theta} \| \mathscr{G}\right] d P \\
& =\int_{G} I_{A} g_{\theta} d P=\int_{A \cap G} g_{\theta} d P=P_{\theta}(A \cap G)
\end{aligned}
$$

Therefore, $P[A \| \mathscr{G}]$-the conditional probability calculated with respect to $P$-does serve as a version of $P_{\theta}[A \| \mathscr{G}]$ for each $\theta$ in $\Theta$. Thus $\mathscr{G}$ is sufficient for the family
[ $P_{\theta}: \theta \in \Theta$ ]-even for this family augmented by $P$ (which might happen to lie in the family to start with).

For the necessity, suppose first that the family is dominated by one of its members.
Lemma 2. Suppose that $\left[P_{\theta}: \theta \in \Theta\right]$ is dominated by $P_{\theta_{0}}$ for some $\theta_{0} \in \Theta$. If $\mathscr{G}$ is sufficient, then each $P_{\theta}$ has with respect to $P_{\theta_{0}}$ a density $g_{\theta}$ that is measurable $\mathscr{G}$.

Proof. Let $p(A, \omega)$ be the function in the definition of sufficiency, and take $P_{\theta}[A \| \mathscr{G}]_{\omega}=p(A, \omega)$ for all $A \in \mathscr{F}, \omega \in \Omega$, and $\theta \in \Theta$. Let $d_{\theta}$ be any density of $P_{\theta}$ with respect to $P_{\theta_{0}}$. By a number of applications of (34.4),

$$
\begin{aligned}
\int_{A} E_{\theta_{0}}\left[d_{\theta} \| \mathscr{G}\right] d P_{\theta_{0}} & =\int I_{A} E_{\theta_{0}}\left[d_{\theta} \| \mathscr{G}\right] d P_{\theta_{0}} \\
& =\int E_{\theta_{0}}\left\{I_{A} E_{\theta_{0}}\left[d_{\theta} \| \mathscr{G}\right] \| \mathscr{G}\right\} d P_{\theta_{0}}=\int E_{\theta_{0}}\left\{I_{A} \| \mathscr{G}\right\} E_{\theta_{0}}\left[d_{\theta} \| \mathscr{G}\right] d P_{\theta_{0}} \\
& =\int E_{\theta_{0}}\left[E_{\theta_{0}}\left\{I_{A} \| \mathscr{G}\right) d_{\theta} \| \mathscr{G}\right] d P_{\theta_{u}}=\int E_{\theta_{0}}\left(I_{A} \| \mathscr{G}\right) d_{\theta} d P_{\theta_{0}} \\
& =\int P_{\theta_{0}}[A \| \mathscr{G}] d P_{\theta}=\int P_{\theta}[A \| \mathscr{G}] d P_{\theta}=P_{\theta}(A)
\end{aligned}
$$

the next-to-last equality by sufficiency (the integrand on either side being $p(A, \cdot)$ ). Thus $g_{\theta}=E_{\theta_{\theta}}\left[d_{\theta} \| \mathscr{G}\right]$, which is measurable $\mathscr{G}$, can serve as a density for $P_{\theta}$ with respect to $P_{\theta_{0}}$.

To complete the proof of Theorem 34.6 requires one more lemma of a technical sort.

Lemma 3. If $\left[P_{\theta}: \theta \in \Theta\right]$ is dominated by a $\sigma$-finite measure, then it is equivalent to some finite or countably infinite subfamily.

In many examples, the $P_{\theta}$ are all equivalent to each other, in which case the subfamily can be taken to consist of a single $P_{\theta_{0}}$.

Proof. Since $\mu$ is $\sigma$-sinite, there is a finite or countable partition of $\Omega$ into $\mathscr{F}$-sets $A_{n}$ such that $0<\mu\left(A_{n}\right)<\infty$. Choose positive constants $a_{n}$, one for each $A_{n}$, in such a way that $\sum_{n} a_{n}<\infty$. The finite measure with value $\sum_{n} a_{n} \mu\left(A \cap A_{n}\right) / \mu\left(A_{n}\right)$ at $A$ dominates $\mu$. In proving the lemma it is therefore no restriction to assume the family dominated by a finite measure $\mu$.

Each $P_{\theta}$ is dominated by $\mu$ and hence has a density $f_{\theta}$ with respect to it. Let $S_{\theta}=\left[\omega: f_{\theta}(\omega)>0\right]$. Then $P_{\theta}(A)=P_{\theta}\left(A \cap S_{\theta}\right)$ for all $A$, and $P_{\theta}(A)=0$ if and only if $\mu\left(A \cap S_{\theta}\right)=0$. In particular, $S_{\theta}$ supports $P_{\theta}$.

Call a set $B$ in $\mathscr{F}$ a kernel if $B \subset S_{\theta}$ for some $\theta$, and call a finite or countable union of kernels a chain. Let $\alpha$ be the supremum of $\mu(C)$ over chains $C$. Since $\mu$ is finite and a finite or countable union of chains is a chain, $\alpha$ is finite and $\mu(C)=\alpha$ for some chain $C$. Suppose that $C=\cup_{n} B_{n}$, where each $B_{n}$ is a kernel, and suppose that $B_{n} \subset S_{\theta_{n}}$.

The problem is to show that $\left[P_{\theta}: \theta \in \Theta\right]$ is dominated by $\left[P_{\theta_{1}}: n=1,2, \ldots\right]$ and hence equivalent to it. Suppose that $P_{\theta_{n}}(A)=0$ for all $n$. Then $\mu\left(A \cap S_{\theta_{n}}\right)=0$, as observed above. Since $C \subset \cup_{n} S_{\theta_{11}}, \mu(A \cap C)=0$, and it follows that $P_{\theta}(A \cap C)=0$
whatever $\theta$ may be. But suppose that $P_{\theta}(A-C)>0$. Then $P_{\theta}\left((A-C) \cap S_{\theta}\right)= P_{\theta}(A-C)$ is positive, and so $(A-C) \cap S_{\theta}$ is a kernel, disjoint from $C$, of positive $\mu$-measure; this is impossible because of the maximality of $C$. Thus $P_{\theta}(A-C)$ is 0 along with $P_{\theta}(A \cap C)$, and so $P_{\theta}(A)=0$.

Suppose that $\left[P_{\theta}: \theta \in \Theta\right]$ is dominated by a $\sigma$-finite $\mu$, as in Theorem 34.6, so that, by Lemma 3, it contains a finite or infinite sequence $P_{\theta_{1}}, P_{\theta_{2}}, \ldots$ equivalent to the entire family. Fix one such sequence, and choose positive constants $c_{n}$, one for each $\theta_{n}$, in such a way that $\Sigma_{n} c_{n}=1$. Now define a probability measure $P$ on $\mathscr{F}$ by

$$
\begin{equation*}
P(A)=\sum_{n} c_{n} P_{\theta_{n}}(A) \tag{34.12}
\end{equation*}
$$

Clearly, $P$ is equivalent to [ $P_{\theta_{1}}, P_{\theta}, \ldots$ ] and hence to [ $P_{\theta}: \theta \in \Theta$ ], and all three are dominated by $\mu$.

$$
\begin{equation*}
P \equiv\left[P_{\theta_{1}}, P_{\theta_{2}}, \ldots\right] \equiv\left[P_{\theta}: \theta \in \Theta\right] \ll \mu . \tag{34.13}
\end{equation*}
$$

Proof of Sufficiency in Theorem 34.6. If each $P_{\theta}$ has density $g_{\theta} h$ with respect to $\mu$, then by the construction (34.12), $P$ has density $f h$ with respect to $\mu$, where $f=\sum_{n} c_{n} g_{\theta_{n}}$. Put $r_{\theta}=g_{\theta} / f$ if $f>0$, and $r_{\theta}=0$ (say) if $f=0$. If each $g_{\theta}$ is measurable $\mathscr{G}$, the same is true of $f$ and hence of the $r_{\theta}$. Since $P[f=0]=0$ and $P$ is equivalent to the entire family, $P_{\theta}[f=0]=0$ for all $\theta$. Therefore,

$$
\begin{aligned}
\int_{A} r_{\theta} d P & =\int_{A} r_{\theta} f h d \mu=\int_{A \cap[f>0]} r_{\theta} f h d \mu=\int_{A \cap[f>0]} g_{\theta} h d \mu \\
& =P_{\theta}(A \cap[f>0])=P_{\theta}(A)
\end{aligned}
$$

Each $P_{\theta}$ thus has with respect to the probability measure $P$ a density measurable $\mathscr{I}$, and it follows by Lemma 1 that $\mathscr{G}$ is sufficient

Proof of Necessity in Theorem 34.6. Let $p(A, \omega)$ be a function such that, for each $A$ and $\theta, p(A, \cdot)$ is a version of $P_{\theta}[A \| \mathscr{G}]$, as required by the definition of sufficiency. For $P$ as in (34.12) and $G \in \mathscr{Z}$,

$$
\begin{align*}
\int_{G} p(A, \omega) P(d \omega) & =\sum_{n} c_{n} \int_{G} p(A, \omega) P_{\theta_{n}}(d \omega)  \tag{34.14}\\
& =\sum_{n} c_{n} \int_{G} P_{\theta_{n}}[A \| \mathscr{G}] d P_{\theta_{n}} \\
& =\sum_{n} c_{n} P_{\theta_{n}}(A \cap G)=P(A \cap G)
\end{align*}
$$

Thus $p(A, \cdot)$ serves as a version of $P[A \| \mathscr{G}]$ as well, and $\mathscr{G}$ is still sufficient if $P$ is added to the family Since $P$ dominates the augmented family, Lemma 2 implies that each $P_{\theta}$ has with respect to $P$ a density $g_{\theta}$ that is measurable $\mathscr{G}$. But if $h$ is the density of $P$ with respect to $\mu$ (see (34.13)), then $P_{\theta}$ has density $g_{\theta} h$ with respect to $\mu$.

A sub- $\sigma$-field $\mathscr{G}_{0}$ sufficient with respect to $\left[P_{\theta}: \theta \in \Theta\right]$ is minimal if, for each sufficient $\mathscr{G}, \mathscr{G}_{0}$ is essentially contained in $\mathscr{G}$ in the sense that for each $A$ in $\mathscr{G}_{0}$ there is a $B$ in $\mathscr{I}$ such that $P_{\theta}(A \Delta B)=0$ for all $\theta$ in $\Theta$. A sufficient $\mathscr{G}$ represents a compression of the information in $\mathscr{F}$, and a minimal sufficient $\mathscr{G}_{0}$ represents the greatest possible compression.

Suppose the densities $f_{\theta}$ of the $P_{\theta}$ with respect to $\mu$ have the property that $f_{\theta}(\omega)$ is measurable $\mathscr{E} \times \mathscr{F}$, where $\mathscr{E}$ is a $\sigma$-field in $\Theta$. Let $\pi$ be a probability measure on $\mathscr{E}$, and define $P$ as $\int_{\Theta} P_{\theta} \pi(d \theta)$, in the sense that $P(A)=\int_{\Theta} \int_{A} f_{\theta}(\omega) \mu(d \omega) \pi(d \theta)= \int_{\Theta} P_{\theta}(A) \pi(d \theta)$. Obviously, $P \ll\left[P_{\theta}: \theta \in \Theta\right]$. Assume that

$$
\begin{equation*}
\left[P_{\theta}: \theta \in \Theta\right] \ll P=\int_{\Theta} P_{\theta} \pi(d \theta) . \tag{3415}
\end{equation*}
$$

If $\pi$ has mass $c_{n}$ at $\theta_{n}$, then $P$ is given by (34.12), and of course, (35.15) holds if (34.13) does. Let $r_{\theta}$ be a density for $P_{\theta}$ with respect to $P$.

Theorem 34.7. If (34.15) holds, then $\mathscr{G}_{0}=\sigma\left[r_{\theta}: \theta \in \Theta\right]$ is a minimal sufficient sub-r-field.

Proof. That $\mathscr{G}_{0}$ is sufficient follows by Theorem 34.6. Suppose that $\mathscr{G}$ is sufficient. It follows by a simple extension of (34.14) that $\mathscr{I}$ is still sufficient if $P$ is added to the family, and then it follows by Lemma 2 that each $P_{\theta}$ has with respect to $P$ a density $g_{\theta}$ that is measurable $\mathscr{G}$. Since densities are essentially unique, $P\left[g_{\theta}=r_{\theta}\right]=1$. Let $\mathscr{H}$ be the class of $A$ in $\mathscr{G}_{0}$ such that $P(A \Delta B)=0$ for some $B$ in $\mathscr{G}$. Then $\mathscr{H}$ is a $\sigma$-field containing each set of the form $A=\left[r_{\theta} \in H\right]$ (take $B=\left[g_{\theta} \in H\right]$ and hence containing $\mathscr{G}_{0}$. Since, by (34.15), $P$ dominates each $P_{\theta}, \mathscr{H}_{0}$ is essentially contained in $\mathscr{G}$, in the sense of the definition. $\square$

## Minimum-Variance Estimation*

To illustrate sufficiency, let $g$ be a real function on $\Theta$, and consider the problem of estimating $g(\theta)$. One possibility is that $\Theta$ is a subset of the line and $g$ is the identity; another is that $\Theta$ is a subset of $R^{k}$ and $g$ picks out one of the coordinates. (This problem is considered from a slightly different point of view at the end of Section 19.) An estimate of $g(\theta)$ is a random variable $Z$, and the estimate is unbiased if $E_{\theta}[Z]=g(\theta)$ for all $\theta$. One measure of the accuracy of the estimate $Z$ is $E_{\theta}[(Z- g(\theta))^{2}$ ].

If $\mathscr{G}$ is sufficient, it follows by linearity (Theorem 34.2(ii)) that $E_{\theta}\left[X \|_{A} \mathscr{G}\right]$ has for simple $X$ a version that is independent of $\theta$. Since there are simple $X_{n}$ such that $\left|X_{n}\right| \leq|X|$ and $X_{n} \rightarrow X$, the same is true of any $X$ that is integrable with respect to each $P_{\theta}$ (use Theorem 34.2(v)). Suppose that $\mathscr{I}$ is, in fact, sufficient, and denote by $E[X \| \mathscr{E}]$ a version of $E_{\theta}[X \| \mathscr{E}]$ that is independent of $\theta$.

Theorem 34.8. Suppose that $E_{\theta}\left[(Z-g(\theta))^{2}\right]<\infty$ for all $\theta$ and that $\mathscr{A}$ is sufficient. Then

$$
\begin{equation*}
E_{\theta}\left[(E[Z \| \mathscr{G}]-g(\theta))^{2}\right] \leq E_{\theta}\left[(Z-g(\theta))^{2}\right] \tag{34.16}
\end{equation*}
$$

for all $\theta$. If $Z$ is unbiased, then so is $E[Z \| \mathscr{G}]$.

[^23]Proof. By Jensens's inequality (34.7) for $\varphi(x)=(x-g(\theta))^{2},(E[Z \| \mathscr{G}]-g(\theta))^{2} \leq E_{\theta}\left[(Z-g(\theta))^{2} \| \mathscr{G}\right]$. Applying $E_{\theta}$ to each side gives (34.16). The second statement follows from the fact that $E_{\theta}[E[Z \| \mathscr{A}]]=E_{\theta}[Z]$.

This, the Rao-Blackwell theorem, says that $E[Z \| \mathscr{G}]$ is at least as good an estimate as $Z$ if $\mathscr{G}$ is sufficient.

Example 34.5. Returning to Example 34.4, note that each $X_{i}$ has mean $\theta / 2$ under $P_{\theta}$, so that if $\bar{X}=k^{-1} \sum_{i=1}^{k} X_{i}$ is the sample mean, then $2 \bar{X}$ is an unbiased estimate of $\theta$. But there is a better one. By (34.9), $E_{\theta}[2 \bar{X} \| T]=(k+1) T / k=T^{\prime}$, and by the Rao-Blackwell theorem, $T^{\prime}$ is an unbiased estimate with variance at most that of $2 \bar{X}$.

In fact, for an arbitrary unbiased estimate $Z, E_{\theta}\left[\left(T^{\prime}-\theta\right)^{2}\right] \leq E_{\theta}\left[(Z-\theta)^{2}\right]$. To prove this, let $\delta=T^{\prime}-E[Z \| T]$. By Theorem 20.1(ii), $\delta=f(T)$ for some Borel function $f$, and $E_{\theta}[f(T)]=0$ for all $\theta$. Taking account of the density for $T$ leads to $\int_{0}^{\theta} f(x) x^{k-1} d x=0$, so that $f(x) x^{k-1}$ integrates to 0 over all intervals. Therefore, $f(x)$ along with $f(x) x^{k-1}$ vanishes for $x>0$, except on a set of Lebesgue measure 0 , and hence $P_{\theta}[f(T)=0]=1$ and $P_{\theta}\left[T^{\prime}=E[Z \| T]\right]=1$ for all $\theta$. Therefore, $E_{\theta}\left[\left(T^{\prime}-\right.\right. \left.\theta)^{2}\right]=E_{\theta}\left[(E[Z \| T]-\theta)^{2}\right] \leq E_{\theta}\left[(Z-\theta)^{2}\right]$ for $Z$ unbiased, and $T^{\prime}$ has minimum variance among all unbiased estimates of $\theta$.

## PROBLEMS

34.1. Work out for conditional expected values the analogues of Problems 33.4, 33.5, and 33.9 .
34.2. In the context of Examples 33.5 and 33.12 , show that the conditional expected value of $Y$ (if it is integrable) given $X$ is $g(X)$, where

$$
g(x)=\frac{\int_{-\infty}^{\infty} f(x, y) y d y}{\int_{-\infty}^{\infty} f(x, y) d y}
$$

34.3. Show that the independence of $X$ and $Y$ implies that $E[Y \| X]=E[Y]$, which in turn implies that $E[X Y]=E[X] E[Y]$. Show by examples in an $\Omega$ of three points that the reverse implications are both false.
34.4. (a) Let $B$ be an event with $P(B)>0$, and define a probability measure $P_{0}$ by $P_{0}(A)=P(A \mid B)$. Show that $P_{0}[A \| \mathscr{G}]=P[A \cap B \| \mathscr{G}] / P[B \| \mathscr{G}]$ on a set of $P_{0}$-measure 1.
(b) Suppose that $\mathscr{H}$ is generated by a partition $B_{1}, B_{2}, \ldots$, and let $\mathscr{G} \vee \mathscr{H}= \sigma(\mathscr{G} \cup \mathscr{H})$. Show that with probability 1 ,

$$
P[A \| \mathscr{G} \vee \mathscr{H}]=\sum_{i} I_{B_{i}} \frac{P\left[A \cap B_{i} \| \mathscr{G}\right]}{P\left[B_{i} \| \mathscr{G}\right]} .
$$

34.5. The equation (34.5) was proved by showing that the left side is a version of the right side. Prove it by showing that the right side is a version of the left side.
34.6. Prove for bounded $X$ and $Y$ that $E[Y E[X \| \mathscr{G}]]=E[X E[Y \| \mathscr{G}]]$.
34.7. $33.9 \uparrow$ Generalize Theorem 34.5 by replacing $X$ with a random vector
34.8. Assume that $X$ is nonnegative but not necessarily integrable. Show that it is still possible to define a nonnegative random variable $E[X \| \mathscr{A}]$, measurable $\mathscr{A}$, such that (34.1) holds. Prove versions of the monotone convergence theorem and Fatou's lemma.
34.9. (a) Show for nonnegative $X$ that $E[X \| \mathscr{G}]=\int_{0}^{\infty} P[X>t \| \mathscr{G}] d t$ with probability 1 .
(b) Generalize Markov's inequality: $P[|X| \geq \alpha \| \mathscr{G}] \leq \alpha^{-k} E\left[|X|^{k} \| \mathscr{G}\right]$ with probability 1.
(c) Similarly generalize Chevyshev's and Hölder's inequalities.
34.10. (a) Show that, if $\mathscr{G}_{1} \subset \mathscr{G}_{2}$ and $E\left[X^{2}\right]<\infty$, then $E\left[\left(X-E\left[X \| \mathscr{G}_{2}\right]\right)^{2}\right] \leq E[(X \left.\left.-E\left[X \| \mathscr{G}_{1}\right\}\right)^{2}\right]$. The dispersion of $X$ about its conditional mean becomes smaller as the $\sigma$-field grows.
(b) Define $\operatorname{Var}[X \| \mathscr{G}]=E\left[(X-E[X \| \mathscr{G}])^{2} \| \mathscr{G}\right]$. Prove that $\operatorname{Var}[X]= E[\operatorname{Var}[X \| \mathscr{G}]]+\operatorname{Var}[E[X \| \mathscr{G}]]$.
34.11. Let $\mathscr{G}_{1}, \mathscr{G}_{2}, \mathscr{G}_{3}$ be $\sigma$-fields in $\mathscr{F}$, let $\mathscr{G}_{i}$, be the $\sigma$-field generated by $\mathscr{G}_{i} \cup \mathscr{G}_{j}$, and let $A_{i}$ be the generic set in $\mathscr{G}_{i}$. Consider three conditions:
(i) $P\left[A_{3} \| \mathscr{G}_{12}\right]=P\left[A_{3} \| \mathscr{G}_{2}\right]$ for all $A_{3}$.
(ii) $P\left[A_{1} \cap A_{3} \| \mathscr{G}_{2}\right]=P\left[A_{1} \| \mathscr{G}_{2}\right] P\left[A_{3} \| \mathscr{G}_{2}\right]$ for all $A_{1}$ and $A_{3}$.
(iii) $P\left[A_{1} \| \mathscr{G}_{23}\right]=P\left[A_{1} \| \mathscr{G}_{2}\right]$ for all $A_{1}$.

If $\mathscr{G}_{1}, \mathscr{G}_{2}$, and $\mathscr{G}_{3}$ are interpreted as descriptions of the past, present, and future, respectively, (i) is a general version of the Markov property: the conditional probability of a future event $A_{3}$ given the past and present $\mathscr{G}_{12}$ is the same as the conditional probability given the present $\mathscr{G}_{2}$ alone. Condition (iii) is the same with time reversed. And (ii) says that past and future events $A_{1}$ and $A_{3}$ are conditionally independent given the present $\mathscr{G}_{2}$. Prove the three conditions equivalent.
34.12. $33.734 .11 \uparrow$ Use Example 33.10 to calculate $P\left[N_{s}=k \| N_{u}, u \geq t\right](s \leq t)$ for the Poisson process.
34.13. Let $L^{2}$ be the Hilbert space of square-integrable random variables on $(\Omega, \mathscr{F}, P)$. For $\mathscr{A}$ a $\sigma$-field in $\mathscr{F}$, let $M_{\mathscr{G}}$ be the subspace of elements of $L^{2}$ that are measurable $\mathscr{G}$. Show that the operator $P_{\mathscr{G}}$ defined for $X \in L^{2}$ by $P_{\mathscr{G}} X=E[X \| \mathscr{G}]$ is the perpendicular projection on $M_{\mathscr{G}}$.
34.14. $\uparrow$ Suppose in Problem 34.13 that $\mathscr{I}=\sigma(Z)$ for a random variable $Z$ in $L^{2}$. Let $S_{Z}$ be the one-dimensional subspace spanned by $Z$. Show that $S_{Z}$ may be much smaller than $M_{\sigma(Z)}$, so that $E[X \| Z]$ (for $X \in L^{2}$ ) is by no means the projection of $X$ on $Z$. Hint: Take $Z$ the identity function on the unit interval with Lebesgue measure.
34.15. ↑ Problem 34.13 can be turned around to give an alternative approach to conditional probability and expected value. For a $\sigma$-field $\mathscr{G}$ in $\mathscr{F}$, let $P_{\mathscr{G}}$ be the perpendicular projection on the subspace $M_{\mathscr{G}}$. Show that $P_{\mathscr{G}} X$ has for $X \in L^{2}$ the two properties required of $E[X \| \mathscr{G}]$. Use this to define $E[X \| \mathscr{G}]$ for $X \in L^{2}$ and then extend it to all integrable $X$ via approximation by random variables in $L^{2}$. Now define conditional probability.
34.16. Mixing sequences. A sequence $A_{1}, A_{2}, \ldots$ of $\mathscr{F}$-sets in a probability space ( $\Omega, \mathscr{F}, P$ ) is muxing with constant $\alpha$ if

$$
\begin{equation*}
\lim _{n} P\left(A_{n} \cap E\right)=\alpha P(E) \tag{34.17}
\end{equation*}
$$

for every $E$ in $\mathscr{F}$. Then $\alpha=\lim _{n} P\left(A_{n}\right)$.
(a) Show that $\left(A_{r}\right)$ is mixing with constant $\alpha$ if and only if

$$
\begin{equation*}
\lim _{n} \int_{A_{n}} X d P=\alpha \int X d P \tag{34.18}
\end{equation*}
$$

for each integrable $X$ (measurable $\mathscr{F}$ ).
(b) Suppose that (34.17) holds for $E \in \mathscr{P}$, where $\mathscr{P}$ is a $\pi$-system, $\Omega \in \mathscr{P}$, and $A_{n} \in \sigma(\mathscr{P})$ for all $n$. Show that $\left\{A_{p}\right\}$ is mixing. Hint: First check (34.18) for $X$ measurable $\sigma(\mathscr{P})$ and then use conditional expected values with respect to $\sigma(\mathscr{P})$.
(c) Show that, if $P_{0}$ is a probability measure on ( $\Omega, \mathscr{F}$ ) and $P_{0} \ll P$, then mixing is preserved if $P$ is replaced by $P_{0}$ -
34.17. $\uparrow$ Application of mixing to the central limit theorem. Let $X_{1}, X_{2}, \ldots$ be random variables on ( $\Omega, \mathscr{F}, P$ ), independent and identically distributed with mean 0 and variance $\sigma^{2}$, and put $S_{n}=X_{1}+\cdots+X_{n}$. Then $S_{n} / \sigma \sqrt{n} \Rightarrow N$ by the Lindeberg-Lévy theorem. Show by the steps below that this still holds if $P$ is replaced by any probability measure $P_{0}$ on $(\Omega, \mathscr{F})$ that $P$ dominates. For example, the central limit theorem applies to the sums $\sum_{k=1}^{n} r_{k}(\omega)$ of Rademacher functions if $\omega$ is chosen according to the uniform density over the unit interval, and this result shows that the same is true if $\omega$ is chosen according to an arbitrary density.

Let $Y_{n}=S_{n} / \sigma \sqrt{n}$ and $Z_{n}=\left(S_{n}-S_{[\log n]}\right) / \sigma \sqrt{n}$, and take $\mathscr{P}$ to consist of the sets of the form $\left[\left(X_{1}, \ldots, X_{k}\right) \in H\right], k \geq 1, H \in \mathscr{R}^{k}$. Prove successively:
(a) $P\left[Y_{n} \leq x\right] \rightarrow P[N \leq x]$.
(b) $P\left[\left|Y_{n}-Z_{n}\right| \geq \epsilon\right] \rightarrow 0$.
(c) $P\left[Z_{n} \leq x\right] \rightarrow P[N \leq x]$.
(d) $P\left(E \cap\left[Z_{n} \leq x\right]\right) \rightarrow P(E) P[N \leq x]$ for $E \in \mathscr{P}$.
(e) $P\left(E \cap\left[Z_{n} \leq x\right]\right) \rightarrow P(E) P[N \leq x]$ for $E \in \mathscr{F}$.
(f) $P_{0}\left[Z_{n} \leq x\right] \rightarrow P[N \leq x]$.
(g) $P_{0}\left[\left|Y_{n}-Z_{n}\right| \geq \epsilon\right] \rightarrow 0$.
(h) $P_{0}\left[Y_{n} \leq x\right] \rightarrow P[N \leq x]$.
34.18. Suppose that $\mathscr{G}$ is a sufficient subfield for the family of probability measures $P_{\theta}, \theta \in \Theta$, on $(\Omega, \mathscr{F})$. Suppose that for each $\theta$ and $A, p(A, \omega)$ is a version of $P_{\theta}[A \| \mathscr{G}]_{\omega}$. and suppose further that for each $\omega, p(\cdot, \omega)$ is a probability
measure on $\mathscr{F}$. Define $Q_{\theta}$ on $\mathscr{F}$ by $Q_{\theta}(A)=\int_{\Omega} p(A, \omega) P_{\theta}(d \omega)$, and show that $Q_{\theta}=P_{\theta}$.

The idea is that an observer with the information in $\mathscr{I}$ (but ignorant of $\omega$ itself) in principle knows the values $p(A, \omega)$ because each $p(A, \cdot)$ is measurable $\mathscr{G}$. If he has the appropriate randomization device, he can draw an $\omega^{\prime}$ from $\Omega$ according to the probability measure $p(\cdot, \omega)$, and his $\omega^{\prime}$ will have the same distribution $Q_{\theta}=P_{\theta}$ that $\omega$ has. Thus, whatever the value of the unknown $\theta$, the observer can on the basis of the information in $\mathscr{G}$ alone, and without knowing $\omega$ itself, construct a probabilistic replica of $\omega$.
34.19. $34.13 \uparrow$ In the context of the discussion on p. 252 , let $\overline{\mathscr{F}}$ be the $\sigma$-field of sets of the form $\Theta \times A$ for $A \in \mathscr{F}$. Show that under the probability measure $Q, t_{0}$ is the conditional expected value of $\bar{g}_{0}$ given $\overline{\mathscr{F}}$.
34.20. (a) In Example 34.4, take $\pi$ to have density $e^{-\theta}$ over $\Theta=(0, \infty)$. Show by Theorem 34.7 that $T$ is a minimal sufficient statistic (in the sense that $\sigma(T)$ is minimal).
(b) Let $P_{\theta}$ be the distribution for samples of size $n$ from a normal distribution with parameter $\theta=\left(m, \sigma^{2}\right), \sigma^{2}>0$, and let $\pi$ put unit mass at $(0,1)$. Show that the sampie mean and variance form a minimal sufficient statistic.

## SECTION 35. MARTINGALES

## Definition

Let $X_{1}, X_{2}, \ldots$ be a sequence of random variables on a probability space ( $\Omega, \mathscr{F}, P$ ), and let $\mathscr{F}_{1}, \mathscr{F}_{2}, \ldots$ be a sequence of $\sigma$-fields in $\mathscr{F}$. The sequence $\left\{\left(X_{n}, \mathscr{F}_{n}\right): n=1,2, \ldots\right\}$ is a martingale if these four conditions hold:
(i) $\mathscr{F}_{n} \subset \mathscr{F}_{n+1}$;
(ii) $X_{n}$ is measurable $\mathscr{F}_{n}$;
(iii) $E\left[\left|X_{n}\right|\right]<\infty$;
(iv) with probability 1 ,

$$
\begin{equation*}
E\left[X_{n+1} \| \mathscr{F}_{n}\right]=X_{n} . \tag{35.1}
\end{equation*}
$$

Alternatively, the sequence $X_{1} . X_{2}, \ldots$ is said to be a martingale relative to the $\sigma$-fields $\mathscr{F}_{1}, \mathscr{F}_{2}, \ldots$. Condition (i) is expressed by saying the $\mathscr{F}_{n}$ form a filtration and condition (ii) by saying the $X_{n}$ are adapted to the filtration.

If $X_{n}$ represents the fortune of a gambler after the $n$th play and $\mathscr{F}_{n}$ represents his information about the game at that time, (35.1) says that his expected fortune after the next play is the same as his present fortune. Thus a martingale represents a fair game, and sums of independent random variables with mean 0 give one example. As will be seen below, martingales arise in very diverse connections.

The sequence $X_{1}, X_{2}, \ldots$ is defined to be a martingale if it is a martingale relative to some sequence $\mathscr{F}_{1}, \mathscr{F}_{2}, \ldots$ In this case, the $\sigma$-fields $\mathscr{G}_{n}= \sigma\left(X_{1}, \ldots, X_{n}\right)$ always work: Obviously, $\mathscr{A}_{n} \subset \mathscr{A}_{n+1}$ and $X_{n}$ is measurable $\mathscr{A}_{n}$, and if (35.1) holds, then $E\left[X_{n+1} \| \mathscr{G}_{n}\right]=E\left[E\left[X_{n+1} \| \mathscr{F}_{n}\right] \| \mathscr{G}_{n}\right]=E\left[X_{n} \| \mathscr{G}_{n}\right]= X_{n}$ by (34.5). For these special $\sigma$-fields $\mathscr{G}_{n}$, (35.1) reduces to

$$
\begin{equation*}
E\left[X_{n+1} \| X_{1}, \ldots, X_{n}\right]=X_{n} . \tag{35.2}
\end{equation*}
$$

Since $\sigma\left(X_{1}, \ldots, \mathrm{X}_{n}\right) \subset \mathscr{F}_{n}$ if and only if $X_{n}$ is measurable $\mathscr{F}_{n}$ for each $n$, the $\sigma\left(X_{1}, \ldots, X_{n}\right)$ are the smallest $\sigma$-fields with respect to which the $X_{n}$ are a martingale.

The essential condition is embodied in (35.1) and in its specialization (35.2). Condition (iii) is of course needed to ensure that $E\left[X_{n+1} \| \mathscr{F}_{n}\right]$ exists. Condition (iv) says that $X_{n}$ is a version of $E\left[X_{n+1} \| \mathscr{F}_{n}\right]$; since $X_{n}$ is measurable $\mathscr{F}_{n}$, the requirement reduces to

$$
\begin{equation*}
\int_{A} X_{n+1} d P=\int_{A} X_{n} d P, \quad A \in \mathscr{F}_{n} \tag{35.3}
\end{equation*}
$$

Since the $\mathscr{F}_{n}$ are nested, $A \in \mathscr{F}_{n}$ implies that $\int_{A} X_{n} d P=\int_{A} X_{n+1} d P= \cdots=\int_{A} X_{n+k} d P$. Therefore, $X_{n}$, being measurable $\mathscr{F}_{n}$, is a version of $E\left[X_{n+k} \| \mathscr{F}_{n}\right]$ :

$$
\begin{equation*}
E\left[X_{n+k} \| \mathscr{F}_{n}\right]=X_{n} \tag{35.4}
\end{equation*}
$$

with probability 1 for $k \geq 1$. Note that for $A=\Omega$, (35.3) gives

$$
\begin{equation*}
E\left[X_{1}\right]=E\left[X_{2}\right]=\cdots . \tag{35.5}
\end{equation*}
$$

The defining conditions for a martingale can also be given in terms of the differences

$$
\begin{equation*}
\Delta_{n}=X_{n}-X_{n-1} \tag{35.6}
\end{equation*}
$$

( $\Delta_{1}=X_{1}$ ). By linearity, (35.1) is the same thing as

$$
\begin{equation*}
E\left[\Delta_{n+1} \| \mathscr{F}_{n}\right]=0 . \tag{35.7}
\end{equation*}
$$

Note that, since $X_{k}=\Delta_{1}+\cdots+\Delta_{k}$ and $\Delta_{k}=X_{k}-X_{k-1}$, the sets $X_{1}, \ldots, X_{n}$ and $\Delta_{1}, \ldots, \Delta_{n}$ generate the same $\sigma$-field:

$$
\begin{equation*}
\sigma\left(X_{1}, \ldots, X_{n}\right)=\sigma\left(\Delta_{1}, \ldots, \Delta_{n}\right) . \tag{35.8}
\end{equation*}
$$

Example 35.1. Let $\Delta_{1}, \Delta_{2}, \ldots$ be independent, integrable random variables such that $E\left[\Delta_{n}\right]=0$ for $n \geq 2$. If $\mathscr{F}_{n}^{-}$is the $\sigma$-field (35.8), then by independence $E\left[\Delta_{n+1} \| \mathscr{F}_{n}\right]=E\left[\Delta_{n+1}\right]=0$. If $\Delta$ is another random variable,
independent of the $\Delta_{n}$, and if $\mathscr{F}_{n}$ is replaced by $\sigma\left(\Delta, \Delta_{1}, \ldots, \Delta_{n}\right)$, then the $X_{n}=\Delta_{1}+\cdots+\Delta_{n}$ are still a martingale relative to the $\mathscr{F}_{n}$. It is natural and convenient in the theory to allow $\sigma$-fields $\mathscr{F}_{n}$ larger than the minimal ones (35.8).

Example 35.2. Let $(\Omega, \mathscr{F}, P)$ be a probability space, let $\nu$ be a finite measure on $\mathscr{F}$, and let $\mathscr{F}_{1}, \mathscr{F}_{2}, \ldots$ be a nondecreasing sequence of $\sigma$-fields in $\mathscr{F}$. Suppose that $P$ dominates $\nu$ when both are restricted to $\mathscr{F}_{n}$-that is, suppose that $A \in \mathscr{F}_{n}$ and $P(A)=0$ together imply that $\nu(A)=0$. There is then a density or Radon-Nikodym derivative $X_{n}$ of $\nu$ with respect to $P$ when both are restricted to $\mathscr{F}_{n} ; X_{n}$ is a function that is measurable $\mathscr{F}_{n}$ and integrable with respect to $P$, and it satisfies

$$
\begin{equation*}
\int_{A} X_{n} d P=\nu(A), \quad A \in \mathscr{F}_{n} \tag{35.9}
\end{equation*}
$$

If $A \in \mathscr{F}_{n}$, then $A \in \mathscr{F}_{n+1}$ as well, so that $\int_{A} X_{n+1} d P=\nu(A)$; this and (35.9) give (35.3). Thus the $X_{n}$ are a martingale with respect to the $\mathscr{F}_{n}$.

Example 35.3. For a specialization of the preceding example, let $P$ be Lebesgue measure on the $\sigma$-field $\mathscr{F}$ of Borel subsets of $\Omega=(0,1]$, and let $\mathscr{F}_{n}$ be the finite $\sigma$-field generated by the partition of $\Omega$ into dyadic intervals $\left(k 2^{-n},(k+1) 2^{-n}\right], 0 \leq k<2^{n}$. If $A \in \mathscr{F}_{n}$ and $P(A)=0$, then $A$ is empty. Hence $P$ dominates every finite measure $\nu$ on $\mathscr{F}_{n}$. The Radon-Nikodym derivative is

$$
\begin{equation*}
X_{n}(\omega)=\frac{\nu\left(k 2^{-n},(k+1) 2^{-n}\right]}{2^{-n}} \quad \text { if } \omega \in\left(k 2^{-n},(k+1) 2^{-n}\right] . \tag{35.10}
\end{equation*}
$$

There is no need here to assume that $P$ dominates $\nu$ when they are viewed as measures on all of $\mathscr{F}$. Suppose that $\nu$ is the distribution of $\sum_{k=1}^{\infty} Z_{k} 2^{-k}$ for independent $Z_{k}$ assuming values 1 and 0 with probabilities $p$ and $1-p$. This is the measure in Examples 31.1 and 31.3 (there denoted by $\mu)$, and for $p \neq \frac{1}{2}, \nu$ is singular with respect to Lebesgue measure $P$. It is nonetheless absolutely continuous with respect to $P$ when both are restricted to $\mathscr{F}_{n}$.

Example 35.4. For another specialization of Example 35.2, suppose that $\nu$ is a probability measure $Q$ on $\mathscr{F}$ and that $\mathscr{F}_{n}=\sigma\left(Y_{1}, \ldots, Y_{n}\right)$ for random variables $Y_{1}, Y_{2}, \ldots$ on ( $\Omega, \mathscr{F}$ ). Suppose that under the measure $P$ the distribution of the random vector ( $Y_{1}, \ldots, Y_{n}$ ) has density $p_{n}\left(y_{1}, \ldots, y_{n}\right)$ with respect to $n$-dimensional Lebesgue measure and that under $Q$ it has density $q_{n}\left(y_{1}, \ldots, y_{n}\right)$. To avoid technicalities, assume that $p_{n}$ is everywhere positive.

Then the Radon-Nikodym derivative for $Q$ with respect to $P$ on $\mathscr{F}_{n}$ is

$$
\begin{equation*}
X_{n}=\frac{q_{n}\left(Y_{1}, \ldots, Y_{n}\right)}{p_{n}\left(Y_{1}, \ldots, Y_{n}\right)} \tag{35.11}
\end{equation*}
$$

To see this, note that the general element of $\mathscr{F}_{n}$ is $\left[\left(Y_{1}, \ldots, Y_{n}\right) \in H\right]$, $H \in \mathscr{P}^{n}$; by the change-of-variable formula,

$$
\begin{aligned}
\int_{\left[\left(Y_{1}, \ldots, Y_{n}\right) \in H\right]} X_{n} d P & =\int_{H} \frac{q_{n}\left(y_{1}, \ldots, y_{n}\right)}{p_{n}\left(y_{1}, \ldots, y_{n}\right)} p_{n}\left(y_{1}, \ldots, y_{n}\right) d y_{1} \cdots d y_{n} \\
& =Q\left[\left(Y_{1}, \ldots, Y_{n}\right) \in H\right] .
\end{aligned}
$$

In statistical terms, (35.11) is a likelihood ratio: $p_{n}$ and $q_{n}$ are rival densities, and the larger $X_{n}$ is, the more strongly one prefers $q_{n}$ as an explanation of the observation $\left(Y_{1}, \ldots, Y_{n}\right)$. The analysis is carried out under the assumption that $P$ is the measure actually governing the $Y_{n}$; that is, $X_{n}$ is a martingale under $P$ and not in general under $Q$.

In the most common case the $Y_{n}$ are independent and identically distributed under both $P$ and $Q: p_{n}\left(y_{1}, \ldots, y_{n}\right)=p\left(y_{1}\right) \cdots p\left(y_{n}\right)$ and $q_{n}\left(y_{1}, \ldots, y_{n}\right)=q\left(y_{1}\right) \cdots q\left(y_{n}\right)$ for densities $p$ and $q$ on the line, where $p$ is assumed everywhere positive for simplicity. Suppose that the measures corresponding to the densities $p$ and $q$ are not identical, so that $P\left[Y_{n} \in H\right] \neq Q\left[Y_{n} \in H\right]$ for some $H \in \mathscr{R}^{1}$. If $\left.Z_{n}=I_{1} Y_{n} \in H\right]$, then by the strong law of large numbers, $n^{-1} \sum_{k=1}^{n} Z_{k}$ converges to $P\left[Y_{1} \in H\right]$ on a set (in $\mathscr{F}$ ) of $P$-measure 1 and to $Q\left[Y_{1} \in H\right]$ on a (disjoint) set of $Q$-measure 1. Thus $P$ and $Q$ are mutually singular on $\mathscr{F}$ even though $P$ dominates $Q$ on $\mathscr{F}_{n}$. $\square$

Example 35.5. Suppose that $Z$ is an integrable random variable on ( $\Omega, \mathscr{F}, P$ ) and that $\mathscr{F}_{n}$ are nondecreasing $\sigma$-fields in $\mathscr{F}$. If

$$
\begin{equation*}
X_{n}=E\left[Z \| \mathscr{F}_{n}^{-}\right], \tag{35.12}
\end{equation*}
$$

then the first three conditions in the martingale definition are satisfied, and by (34.5), $E\left[X_{n+1} \| \mathscr{F}_{n}^{-}\right]=E\left[E\left[Z\left\|\mathscr{F}_{n+1}\right\| \mathscr{F}_{n}^{-}\right]=E\left[Z \| \mathscr{F}_{n}^{-}\right]=X_{n}\right.$. Thus $X_{n}$ is a martingale relative to $\mathscr{F}_{n}$. $\square$

Example 35.6. Let $N_{n k}, n, k=1,2, \ldots$, be an independent array of identically distributed random variables assuming the values $0,1,2, \ldots$. Define $Z_{0}, Z_{1}, Z_{2}, \ldots$ inductively by $Z_{0}(\omega)=1$ and $Z_{n}(\omega)=N_{n, 1}(\omega) +\cdots+N_{n, Z_{n-1}(\omega)}(\omega) ; Z_{n}(\omega)=0$ if $Z_{n-1}(\omega)=0$. If $N_{n k}$ is thought of as the number of progeny of an organism, and if $Z_{n-1}$ represents the size at time $n-1$ of a population of these organisms, then $Z_{n}$ represents the size at time $n$. If the expected number of progeny is $E\left[N_{n k}\right]=m$, then $E\left[Z_{n} \| Z_{n-1}\right]= Z_{n-1} m$, so that $X_{n}=Z_{n} / m^{n}, n=0,1,2, \ldots$, is a martingale. The sequence $Z_{0}, Z_{1}, \ldots$ is a branching process. $\square$

In the preceding definition and examples, $n$ ranges over the positive integers. The definition makes sense if $n$ ranges over $1,2, \ldots, N$; here conditions (ii) and (iii) are required for $1 \leq n \leq N$ and conditions (i) and (iv) only for $1 \leq n<N$. It is, in fact, clear that the definition makes sense if the indices range over an arbitrary ordered set. Although martingale theory with an interval of the line as the index set is of great interest and importance, here the index set will be discrete.

## Submartingales

Random variables $X_{n}$ are a submartingale relative to $\sigma$-fields $\mathscr{F}_{n}$ if (i), (ii), and (iii) of the definition above hold and if this condition holds in place of (iv).
(iv') with probability 1 ,

$$
\begin{equation*}
E\left[X_{n+1} \| \mathscr{F}_{n}\right] \geq X_{n} . \tag{35.13}
\end{equation*}
$$

As before, the $X_{n}$ are a submartingale if they are a submartingale with respect to some sequence $\mathscr{F}_{n}$, and the special sequence $\mathscr{F}_{n}^{-}=\sigma\left(X_{1}, \ldots, X_{n}\right)$ works if any does. The requirement (35.13) is the same thing as

$$
\begin{equation*}
\int_{A} X_{n+1} d P \geq \int_{A} X_{n} d P, \quad A \in \mathscr{F}_{n} \tag{35.14}
\end{equation*}
$$

This extends inductively (see the argument for (35.4)), and so

$$
\begin{equation*}
E\left[X_{n+k} \| \mathscr{F}_{n}\right] \geq X_{n} \tag{35.15}
\end{equation*}
$$

for $k \geq 1$. Taking expected values in (35.15) gives

$$
\begin{equation*}
E\left[X_{1}\right] \leq E\left[X_{2}\right] \leq \cdots . \tag{35.16}
\end{equation*}
$$

Example 35.7. Suppose that the $\Delta_{n}$ are independent and integrable, as in Example 35.1, but assume that $E\left[\Delta_{n}\right]$ is for $n \geq 2$ nonnegative rather than 0 . Then the partial sums $\Delta_{1}+\cdots+\Delta_{n}$ form a submartingale. $\square$

Example 35.8. Suppose that the $X_{n}$ are a martingale relative to the $\mathscr{F}_{n}$. Then $\left|X_{n}\right|$ is measurable $\mathscr{F}_{n}^{-}$and integrable, and by Theorem 34.2(iv), $E\left[\left|X_{n+1}\right| \mid \mathscr{F}_{n}\right] \geq\left|E\left[X_{n+1}| | \mathscr{F}_{n}\right]\right|=\left|X_{n}\right|$. Thus the $\left|X_{n}\right|$ are a submartingale relative to the $\mathscr{F}_{n}$. Note that even if $X_{1}, \ldots, X_{n}$ generate $\mathscr{F}_{n}$, in general $\left|X_{1}\right|, \ldots,\left|X_{n}\right|$ will generate a $\sigma$-field smaller than $\mathscr{F}_{n}$. $\square$

Reversing the inequality in (35.13) gives the definition of a supermartingale. The inequalities in (35.14), (35.15), and (35.16) become reversed as well. The theory for supermartingales is of course symmetric to that of submartingales.

## Gambling

Consider again the gambler whose fortune after the $n$th play is $X_{n}$ and whose information about the game at that time is represented by the $\sigma$-field $\mathscr{F}_{n}$. If $\mathscr{F}_{n}=\sigma\left(X_{1}, \ldots, X_{n}\right)$, he knows the sequence of his fortunes and nothing else, but $\mathscr{F}_{n}$ could be larger. The martingale condition (35.1) stipulates that his expected or average fortune after the next play equals his present fortune, and so the martingale is the model for a fair game. Since the condition (35.13) for a submartingale stipulates that he stands to gain (or at least not lose) on the average, a submartingale represents a game favorable to the gambler. Similarly, a supermartingale represents a game unfavorable to the gambler. ${ }^{\dagger}$

Examples of such games were studied in Section 7, and some of the results there have immediate generalizations. Start the martingale at $n=0, X_{0}$ representing the gambler's initial fortune. The difference $\Delta_{n}=X_{n}-X_{n-1}$ represents the amount the gambler wius on the $n$th play, ${ }^{\ddagger}$ a negative win being of course a loss. Suppose instead that $\Delta_{n}$ represents the amount he wins if he puts up unit stakes. If instead of unit stakes he wagers the amount $W_{n}$ on the $n$th play, $W_{n} \Delta_{n}$ represents his gain on that play. Suppose that $W_{n} \geq 0$, and that $W_{n}$ is measurable $\mathscr{F}_{n-1}$ to exclude prevision: Before the $n$th play the information available to the gambler is that in $\mathscr{F}_{n-1}$, and his choice of stake $W_{n}$ must be based on this alone. For simplicity take $W_{n}$ bounded. Then $W_{n} \Delta_{n}$ is integrable, and it is measurable $\mathscr{F}_{n}$ if $\Delta_{n}$ is, and if $X_{n}$ is a martingale, then $E\left[W_{n} \Delta_{n} \| \mathscr{F}_{n-1}\right]=W_{n} E\left[\Delta_{n} \| \mathscr{F}_{n-1}\right]=0$ by (34.2). Thus

$$
\begin{equation*}
X_{0}+W_{1} \Delta_{1}+\cdots+W_{n} \Delta_{n} \tag{35.17}
\end{equation*}
$$

is a martingale relative to the $\mathscr{F}_{n}$. The sequence $W_{1}, W_{2}, \ldots$ represents a betting system, and transforming a fair game by a betting system preserves fairness; that is, transforming $X_{n}$ into (35.17) preserves the martingale property.

The various betting systems discussed in Section 7 give rise to various martingales, and these martingales are not in general sums of independent random variables-are not in general the special martingales of Example 35.1. If $W_{n}$ assumes only the values 0 and 1 , the betting system is a selection system; see Section 7.

If the game is unfavorable to the gambler-that is, if $X_{n}$ is a supermartin-gale-and if $W_{n}$ is nonnegative, bounded, and measurable $\mathscr{F}_{n-1}$, then the same argument shows that (35.17) is again a supermartingale, is again unfavorable. Betting systems are thus of no avail in unfavorable games.

The stopping-time arguments of Section 7 also extend. Suppose that $\left\{X_{n}\right\}$ is a martingale relative to $\left\{\mathscr{F}_{n}^{-}\right\}$; it may have come from another martingale

[^24]via transformation by a betting system. Let $\tau$ be a random variable taking on nonnegative integers as values, and suppose that
$$
\begin{equation*}
[\tau=n] \in \mathscr{F}_{n} . \tag{35.18}
\end{equation*}
$$

If $\tau$ is the time the gambler stops, $[\tau=n]$ is the event he stops just after the $n$th play, and (35.18) requires that his decision is to depend only on the information $\mathscr{F}_{n}$ available to him at that time. His fortune at time $n$ for this stopping rule is

$$
X_{n}^{*}= \begin{cases}X_{n} & \text { if } n \leq \tau,  \tag{35.19}\\ X_{\tau} & \text { if } n \geq \tau\end{cases}
$$

Here $X_{\tau}$ (which has value $X_{r(\omega)}(\omega)$ at $\omega$ ) is the gambler's ultimate fortune, and it is his fortune for all times subsequent to $\tau$.

The problem is to show that $X_{0}^{*}, X_{1}^{*}, \ldots$ is a martingale relative to $\mathscr{F}_{0}, \mathscr{F}_{1}, \ldots$. First,

$$
E\left[\left|X_{n}^{*}\right|\right]=\sum_{k=0}^{n-1} \int_{[\tau=k]}\left|X_{k}\right| d P+\int_{[\tau \geqslant n]}\left|X_{n}\right| d P \leq \sum_{k=0}^{n} E\left[\left|X_{k}\right|\right]<\infty
$$

Since $[\tau>n]=\Omega-[\tau \leq n] \in \mathscr{F}_{n}^{-}$,

$$
\left[X_{n}^{*} \in H\right]=\bigcup_{k=0}^{n}\left[\tau=k, X_{k} \in H\right] \cup\left[\tau>n, X_{n} \in H\right] \in \mathscr{F}_{n}
$$

Moreover,

$$
\int_{A} X_{n}^{*} d P=\int_{A \cap\lfloor\tau>n\rfloor} X_{n} d P+\int_{A \cap\lfloor\tau \leq n\rfloor} X_{\tau} d P
$$

and

$$
\int_{A} X_{n+1}^{*} d P=\int_{A \cap[\tau>n]} X_{n+1} d P+\int_{A \cap \mid \tau \leq n]} X_{\tau} d P
$$

Because of (35.3), the right sides here coincide if $A \in \mathscr{F}_{n}$; this establishes (35.3) for the sequence $X_{1}^{*}, X_{2}^{*}, \ldots$, which is thus a martingale. The same kind of argument works for supermartingales.

Since $X_{n}^{*}=X_{\tau}$ for $n \geq \tau, X_{n}^{*} \rightarrow X_{\tau}$. As pointed out in Section 7, it is not always possible to integrate to the limit here. Let $X_{n}=a+\Delta_{1}+\cdots+\Delta_{n}$, where the $\Delta_{n}$ are independent and assume the values $\pm 1$ with probability $\frac{1}{2}$ ( $X_{0}=a$ ), and let $\tau$ be the smallest $n$ for which $\Delta_{1}+\cdots+\Delta_{n}=1$. Then $E\left[X_{0}^{*}\right]=a$ and $X_{\tau}=a+1$. On the other hand, if the $X_{n}$ are uniformly bounded or uniformly integrable, it is possible to integrate to the limit: $E\left[X_{\tau}\right]=E\left[X_{0}\right]$.

## Functions of Martingales

Convex functions of martingales are submartingales:
Theorem 35.1. (i) If $X_{1}, X_{2}, \ldots$ is a martingale relative to $\mathscr{F}_{1}, \mathscr{F}_{2}, \ldots$, if $\varphi$ is convex, and if the $\varphi\left(X_{n}\right)$ are integrable, then $\varphi\left(X_{1}\right), \varphi\left(X_{2}\right), \ldots$ is a submartingale relative to $\mathscr{F}_{1}, \mathscr{F}_{2}$.
(ii) If $X_{1}, X_{2}, \ldots$ is a submartingale relative to $\mathscr{F}_{1}, \mathscr{F}_{2}, \ldots$, if $\varphi$ is nondecreasing and convex, and if the $\varphi\left(X_{n}\right)$ are integrable, then $\varphi\left(X_{1}\right), \varphi\left(X_{2}\right), \ldots$ is a submartingale relative to $\mathscr{F}_{1}, \mathscr{F}_{2}, \ldots$.

Proof. In the submartingale case, $X_{n} \leq E\left[X_{n+1} \| \mathscr{F}_{n}\right]$, and if $\varphi$ is nondecreasing, then $\varphi\left(X_{n}\right) \leq \varphi\left(E\left[X_{n+1} \| \mathscr{F}_{n}\right]\right)$. In the martingale case, $X_{n}= E\left[X_{n+1} \| \mathscr{F}_{n}\right]$, and so $\varphi\left(X_{n}\right)=\varphi\left(E\left[X_{n+1} \| \mathscr{F}_{n}\right]\right)$. If $\varphi$ is convex, then by Jensen's inequality (34.7) for conditional expectations, it follows that $\varphi\left(E\left[X_{n+1} \| \mathscr{F}_{n}\right]\right) \leq E\left[\varphi\left(X_{n+1}\right) \| \mathscr{F}_{n}\right]$. $\square$

Example 35.8 is the case of part (i) for $\varphi(x)=|x|$.

## Stopping Times

Let $\tau$ be a random variable taking as values positive integers or the special value $\infty$. It is a stopping time with respect to $\left\{\mathscr{F}_{n}\right\}$ if $[\tau=k] \in \mathscr{F}_{k}$ for each finite $k$ (see (35.18)), or, equivalently, if $[\tau \leq k] \in \mathscr{F}_{k}$ for each finite $k$. Define

$$
\begin{equation*}
\mathscr{F}_{\tau}=\left[A \in \mathscr{F}: A \cap[\tau \leq k] \in \mathscr{F}_{k}, 1 \leq k<\infty\right] . \tag{35.20}
\end{equation*}
$$

This is a $\sigma$-field, and the definition is unchanged if $[\tau \leq k]$ is replaced by $[\tau=k]$ on the right. Since clearly $[\tau=j] \in \mathscr{F}_{\tau}$ for finite $j, \tau$ is measurable $\mathscr{F}_{\tau}$.

If $\tau(\omega)<\infty$ for all $\omega$ and $\mathscr{F}_{n}=\sigma\left(X_{1}, \ldots, X_{n}\right)$, then $I_{A}(\omega)=I_{A}\left(\omega^{\prime}\right)$ for all $A$ in $\mathscr{F}_{\tau}$ if and only if $X_{i}(\omega)=X_{i}\left(\omega^{\prime}\right)$ for $i \leq \tau(\omega)=\tau\left(\omega^{\prime}\right)$ : The information in $\mathscr{F}_{\tau}$ consists of the values $\tau(\omega), X_{1}(\omega), \ldots, X_{\tau(\omega)}(\omega)$.

Suppose now that $\tau_{1}$ and $\tau_{2}$ are two stopping times and $\tau_{1} \leq \tau_{2}$. If $A \in \mathscr{F}_{\tau_{1}}$, then $A \cap\left[\tau_{1} \leq k\right] \in \mathscr{F}_{k}$ and hence $A \cap\left[\tau_{2} \leq k\right]=A \cap\left[\tau_{1} \leq k\right] \cap \left[\tau_{2} \leq k\right] \in \mathscr{F}_{k}: \mathscr{F}_{\tau_{1}} \subset \mathscr{F}_{\tau_{2}}$.

Theorem 35.2. If $X_{1}, \ldots, X_{n}$ is a submartingale with respect to $\mathscr{F}_{1}, \ldots, \mathscr{F}_{n}$ and $\tau_{1}, \tau_{2}$ are stopping times satisfying $1 \leq \tau_{1} \leq \tau_{2} \leq n$, then $X_{\tau_{1}}, X_{\tau_{2}}$ is a submartingale with respect to $\mathscr{F}_{\tau_{1}} \mathscr{F}_{\tau_{2}}$.

This is the optional sampling theorem. The proof will show that $X_{\tau_{1}}, X_{\tau_{2}}$ is a martingale if $X_{1}, \ldots, X_{n}$ is.

Proof. Since the $X_{\tau_{i}}$ are dominated by $\sum_{k=1}^{n}\left|X_{k}\right|$, they are integrable. It is required to show that $E\left[X_{\tau_{2}} \| \mathscr{F}_{\tau_{1}}\right] \geq X_{\tau_{1}}$, or

$$
\begin{equation*}
\int_{A}\left(X_{\tau_{2}}-X_{\tau_{1}}\right) d P \geq 0, \quad A \in \mathscr{F}_{\tau_{1}} \tag{35.21}
\end{equation*}
$$

But $A \in \mathscr{F}_{T_{1}}$ implies that $A \cap\left[\tau_{1}<k \leq \tau_{2}\right]=\left(A \cap\left[\tau_{1} \leq k-1\right]\right) \cap\left[\tau_{2} \leq k-1\right]^{c}$ lies in $\mathscr{F}_{k-1}$. If $\Delta_{k}=X_{k}-X_{k-1}$, then

$$
\begin{aligned}
\int_{A}\left(X_{\tau_{2}}-X_{\tau_{1}}\right) d P & =\int_{A} \sum_{k=1}^{n} I_{\left[\tau_{1}<k \leq \tau_{2}\right]} \Delta_{k} d P \\
& =\sum_{k=1}^{n} \int_{A \cap\left[\tau_{1}<k \leq \tau_{2}\right]} \Delta_{k} d P \geq 0
\end{aligned}
$$

by the submartingale property. $\square$

## Inequalities

There are two inequalities that are fundamental to the theory of martingales.
Theorem 35.3. If $X_{1}, \ldots, X_{n}$ is a submartingale, then for $\alpha>0$,

$$
\begin{equation*}
P\left[\max _{i \leq n} X_{i} \geq \alpha\right] \leq \frac{1}{\alpha} E\left[\left|X_{n}\right|\right] . \tag{35,22}
\end{equation*}
$$

This extends Kolmogorov's inequality: If $S_{1}, S_{2}, \ldots$ are partial sums of independent random variables with mean 0 , they form a martingale; if the variances are finite, then $S_{1}^{2}, S_{2}^{2}, \ldots$ is a submartingale by Theorem 35.1(i), and (35.22) for this submartingale is exactly Kolmogorov's inequality (22.9).

Proof. Let $\tau_{2}=n$; let $\tau_{1}$ be the smallest $k$ such that $X_{k} \geq \alpha$, if there is one, and $n$ otherwise. If $M_{k}=\max _{i \leq k} X_{i}$, then $\left[M_{n} \geq \alpha\right] \cap\left[\tau_{1} \leq k\right]= \left[M_{k} \geq \alpha\right] \in \mathscr{F}_{k}$, and hence $\left[M_{n} \geq \alpha\right]$ is in $\mathscr{F}_{\tau_{l}}$. By Theorem 35.2,

$$
\begin{align*}
\alpha P\left[M_{n} \geq \alpha\right] & \leq \int_{\left[M_{n} \geq \alpha\right]} X_{\tau_{1}} d P \leq \int_{\left[M_{n} \geq \alpha\right]} X_{n} d P  \tag{35.23}\\
& \leq \int_{\left[M_{n} \geq \alpha\right]} X_{n}^{+} d P \leq E\left[X_{n}^{+}\right] \leq E\left[\left|X_{n}\right|\right]
\end{align*}
$$ $\square$

This can also be proved by imitating the argument for Kolmogorov's inequality in Section 23. For improvements to (35.22), use the other integrals
in (35.23). If $X_{1}, \ldots, X_{n}$ is a martingale, $\left|X_{1}\right|, \ldots,\left|X_{n}\right|$ is a submartingale, and so (35.22) gives $P\left[\max _{i \leq n}\left|X_{i}\right| \geq \alpha\right] \leq \alpha^{-1} E\left[\left|X_{n}\right|\right]$.

The second fundamental inequality requires the notion of an upcrossing. Let $[\alpha, \beta]$ be an interval $(\alpha<\beta)$ and let $X_{1}, \ldots, X_{n}$ be random variables. Inductively define variables $\tau_{1}, \tau_{2}, \ldots$ :
$\tau_{1}$ is the smallest $j$ such that $1 \leq j \leq n$ and $X_{j} \leq \alpha$, and is $n$ if there is no such $j$;
$\tau_{k}$ for even $k$ is the smallest $j$ such that $\tau_{k-1}<j \leq n$ and $X_{j} \geq \beta$, and is $n$ if there is no such $j$;
$\tau_{k}$ for odd $k$ exceeding 1 is the smallest $j$ such that $\tau_{k-1}<j \leq n$ and $X_{j} \leq \alpha$, and is $n$ if there is no such $j$.

The number $U$ of upcrossings of $[\alpha, \beta]$ by $X_{1}, \ldots, X_{n}$ is the largest $i$ such that $X_{\tau_{2 i-1}} \leq \alpha<\beta \leq X_{\tau_{2 i}}$. In the diagram, $n=20$ and there are three upcrossings.
![](https://cdn.mathpix.com/cropped/14d6db67-b1d9-4598-a5c8-7abb965d6cc7-118.jpg?height=567&width=1533&top_left_y=1277&top_left_x=146)

Theorem 35.4. For a submartingale $X_{1}, \ldots, X_{n}$, the number $U$ of upcrossings of $[\alpha, \beta]$ satisfies

$$
\begin{equation*}
\left.E_{[ }^{\mathrm{r}} U\right] \leq \frac{E\left[\left|X_{n}\right|\right]+|\alpha|}{\beta-\alpha} \tag{35.24}
\end{equation*}
$$

Proof. Let $Y_{k}=\max \left\{0, X_{k}-\alpha\right\}$ and $\theta=\beta-\alpha$. By Theorem 35.1(ii), $Y_{1}, \ldots, Y_{n}$ is a submartingale. The $\tau_{k}$ are unchanged if in the definitions $X_{j} \leq \alpha$ is replaced by $Y_{j}=0$ and $X_{j} \geq \beta$ by $Y_{j} \geq \theta$, and so $U$ is also the number of upcrossings of $[0, \theta]$ by $Y_{1}, \ldots, Y_{n}$. If $k$ is even and $\tau_{k-1}$ is a stopping time, then for $j<n$,

$$
\left[\tau_{k}=j\right]=\bigcup_{i=1}^{j-1}\left[\tau_{k-1}=i, Y_{i+1}<\theta, \ldots, Y_{j-1}<\theta, Y_{j} \geq \theta\right]
$$

lies in $\mathscr{F}_{j}$ and $\left[\tau_{k}=n\right]=\left[\tau_{k} \leq n-1\right]^{c}$ lies in $\mathscr{F}_{n}$, and so $\tau_{k}$ is also a stopping time. With a similar argument for odd $k$, this shows that the $\tau_{k}$ are all stopping times. Since the $\tau_{k}$ are strictly increasing until they reach $n, \tau_{n}=n$. Therefore,

$$
Y_{n}=Y_{\tau_{n}} \geq Y_{\tau_{n}}-Y_{\tau_{1}}=\sum_{k=2}^{n}\left(Y_{\tau_{k}}-Y_{\tau_{k-1}}\right)=\Sigma_{e}+\Sigma_{o},
$$

where $\Sigma_{e}$ and $\Sigma_{o}$ are the sums over the even $k$ and the odd $k$ in the range $2 \leq k \leq n$. By Theorem 35.2, $\Sigma_{o}$ has nonnegative expected value, and therefore, $E\left[Y_{n}\right] \geq E\left[\Sigma_{e}\right]$.

If $Y_{\tau_{2 i-1}}=0<\theta \leq Y_{\tau_{2 i}}$ (which is the same thing as $X_{\tau_{2 i-1}} \leq \alpha<\beta \leq X_{\tau_{2 i}}$ ), then the difference $Y_{\tau_{2 i}}-Y_{\tau_{2 i-1}}$ appears in the sunt $\Sigma_{e}$ and is at least $\theta$. Since there are $U$ of these differences, $\Sigma_{e} \geq \theta U$, and therefore $E\left[Y_{n}\right] \geq \theta E[U]$. In terms of the original variables, this is

$$
(\beta-\alpha) E[U] \leq \int_{\left[X_{n}>\alpha\right]}\left(X_{n}-\alpha\right) d P \leq E\left[\left|X_{n}\right|\right]+|\alpha| .
$$ $\square$

In a sense, an upcrossing of $[\alpha, \beta]$ is easy: since the $X_{k}$ form a submartingale, they tend to increase. But before another upcrossing can occur, the sequence must make its way back down below $\alpha$, which it resists. Think of the extreme case where the $X_{k}$ are strictly increasing constants. This is reflected in the proof. Each of $\Sigma_{e}$ and $\Sigma_{o}$ has nonnegative expected value, but for $\Sigma_{e}$ the proof uses the stronger inequality $E\left[\Sigma_{e}\right] \geq E[\theta U]$.

## Convergence Theorems

The martingale convergence theorem, due to Doob, has a number of forms. The simplest one is this:

Theorem 35.5. Let $X_{1}, X_{2}, \ldots$ be a submartingale. If $K=\sup _{n} E\left[\left|X_{n}\right|\right]<\infty$, then $X_{n} \rightarrow X$ with probability 1 , where $X$ is a random variable satisfying $E[|X|] \leq K$.

Proof. Fix $\alpha$ and $\beta$ for the moment, and let $U_{n}$ be the number of upcrossings of $[\alpha, \beta]$ by $X_{1}, \ldots, X_{n}$. By the upcrossing theorem, $E\left[U_{n}\right] \leq \left(E\left[\left|X_{n}\right|\right]+|\alpha|\right) /(\beta-\alpha) \leq(K+|\alpha|) /(\beta-\alpha)$. Since $U_{n}$ is nondecreasing and $E\left[U_{n}\right]$ is bounded, it follows by the monotone convergence theorem that $\sup _{n} U_{n}$ is integrable and hence finite-valued almost everywhere.

Let $X^{*}$ and $X_{*}$ be the limits superior and inferior of the sequence $X_{1}, X_{2}, \ldots$; they may be infinite. If $X_{*}<\alpha<\beta<X^{*}$, then $U_{n}$ must go to infinity. Since $U_{n}$ is bounded with probability 1, $P\left[X_{*}<\alpha<\beta<X^{*}\right]=0$.

Now

$$
\begin{equation*}
\left[X_{*}<X^{*}\right]=\bigcup\left[X_{*}<\alpha<\beta<X^{*}\right], \tag{35.25}
\end{equation*}
$$

where the union extends over all pairs of rationals $\alpha$ and $\beta$. The set on the left therefore has probability 0 .

Thus $X^{*}$ and $X_{*}$ are equal with probability 1 , and $X_{n}$ converges to their common value $X$, which may be $\pm \infty$. By Fatou's lemma, $E[|X|] \leq \liminf _{n} E\left[\left|X_{n}\right|\right] \leq K$. Since it is integrable, $X$ is finite with probability 1 . $\square$

If the $X_{n}$ form a martingale, then by (35.16) applied to the submartingale $\left|X_{1}\right|,\left|X_{2}\right|, \ldots$ the $E\left[\left|X_{n}\right|\right]$ are nondecreasing, so that $K=\lim _{n} E\left[\left|X_{n}\right|\right]$. The hypothesis in the theorem that $K$ be finite is essential: If $X_{n}=\Delta_{1}+\cdots+\Delta_{n}$, where the $\Delta_{n}$ are independent and assume values $\pm 1$ with probability $\frac{1}{2}$, then $X_{n}$ does not converge; $E\left[\left|X_{n}\right|\right]$ goes to infinity in this case.

If the $X_{n}$ form a nonnegative martingale, then $E\left[\left|X_{n}\right|\right]=E\left[X_{n}\right]=E\left[X_{1}\right]$ by (35.5), and $K$ is necessarily finite.

Example 35.9. The $X_{n}$ in Example 35.6 are nonnegative, and so $X_{n}= Z_{n} / m^{n} \rightarrow X$, where $X$ is nonnegative and integrable. If $m<1$, then, since $Z_{n}$ is an integer, $Z_{n}=0$ for large $n$, and the population dies out. In this case, $X=0$ with probability 1 . Since $E\left[X_{n}\right]=E\left[X_{0}\right]=1$, this shows that $E\left[X_{n}\right] \rightarrow E[X]$ may fail in Theorem 35.5. $\square$

Theorem 35.5 has an important application to the martingale of Example 35.5, and this requires a lemma.

Lemma. If $Z$ is integrable and $\mathscr{F}_{n}$ are arbitrary $\sigma$-fields, then the random variables $E\left[Z \| \mathscr{F}_{n}\right]$ are uniformly integrable.

For the definition of uniform integrability, see (16.21). The $\mathscr{F}_{n}$ must, of course, lie in the $\sigma$-field $\mathscr{S}^{\sigma}$, but they need not, for example, be nondecreasing.

Proof of the Lemma. Since $\left|E\left[Z \| \mathscr{F}_{n}\right]\right| \leq E\left[|Z| \| \mathscr{F}_{n}\right], Z$ may be assumed nonnegative. Let $A_{\alpha n}=\left[E\left[Z \| \mathscr{F}_{n}\right] \geq \alpha\right]$. Since $A_{\alpha n} \in \mathscr{F}_{n}$

$$
\int_{A_{a n}} E\left[Z \| \mathscr{F}_{n}\right] d P=\int_{A_{a n}} Z d P .
$$

It is therefore enough to find, for given $\epsilon$, an $\alpha$ such that this last integral is less than $\epsilon$ for all $n$. Now $\int_{A} Z d P$ is, as a function of $A$, a finite measure dominated by $P$; by the $\epsilon-\delta$ version of absolute continuity (see (32.4)) there is a $\delta$ such that $P(A)<\delta$ implies that $\int_{A} Z d P<\epsilon$. But $P\left[E\left[Z \| \mathscr{F}_{n}\right] \geq \alpha\right] \leq \alpha^{-1} E\left[E\left[Z \| \mathscr{F}_{n}^{-}\right]\right]=\alpha^{-1} E[Z]<\delta$ for large enough $\alpha$. $\square$

Suppose that $\mathscr{F}_{n}$ are $\sigma$-fields satisfying $\mathscr{F}_{1} \subset \mathscr{F}_{2} \subset \cdots$. If the union $\cup_{n=1}^{\infty} \mathscr{F}_{n}$ generates the $\sigma$-field $\mathscr{F}_{\infty}$, this is expressed by $\mathscr{F}_{n} \uparrow \mathscr{F}_{\infty}$. The requirement is not that $\mathscr{F}_{\infty}$ coincide with the union, but that it be generated by it.

Theorem 35.6. If $\mathscr{F}_{n} \uparrow \mathscr{F}_{\infty}$ and $Z$ is integrable, then

$$
\begin{equation*}
E\left[Z \| \mathscr{F}_{n}\right] \rightarrow E\left[Z \| \mathscr{F}_{\infty}\right] \tag{35.26}
\end{equation*}
$$

with probability 1.
Proof. According to Example 35.5, the random variables $X_{n}=E\left[Z \| \mathscr{F}_{n}\right]$ form a martingale relative to the $\mathscr{F}_{n}$. By the lemma, the $X_{n}$ are uniformly integrable. Since $E\left[\left|X_{n}\right|\right] \leq E[|Z|]$, by Theorem 35.5 the $X_{n}$ converge to an integrable $X$. The problem is to identify $X$ with $E\left[Z \| \mathscr{F}_{\infty}\right]$.

Because of the uniform integrability, it is possible (Theorem 16.14) to integrate to the limit: $\int_{A} X d P=\lim _{n} \int_{A} X_{n} d P$. If $A \in \mathscr{F}_{k}$ and $n \geq k$, then $\int_{A} X_{n} d P=\int_{A} E\left[Z \| \mathscr{F}_{n}\right] d P=\int_{A} Z d P$. Therefore, $\int_{A} X d P=\int_{A} Z d P$ for all $A$ in the $\pi$-system $\cup_{k=1}^{\infty} \mathscr{F}_{k}$; since $X$ is measurable $\mathscr{F}_{\infty}$, it follows by Theorem 34.1 that $X$ is a version of $E\left[Z \| \mathscr{F}_{\infty}\right]$. $\square$

## Applications: Derivatives

Theorem 35.7. Suppose that ( $\Omega, \mathscr{F}, P$ ) is a probability space, $\nu$ is a finite measure on $\mathscr{F}$, and $\mathscr{F}_{n} \uparrow \mathscr{F}_{\infty} \subset \mathscr{F}$. Suppose that $P$ dominates $\nu$ on each $\mathscr{F}_{n}$, and let $X_{n}$ be the corresponding Radon-Nikodym derivatives. Then $X_{n} \rightarrow X$ with probability 1 , where $X$ is integrable.
(i) If $P$ dominates $\nu$ on $\mathscr{F}_{\infty}$, then $X$ is the corresponding Radon-Nikodym derivative.
(ii) If $P$ and $\nu$ are mutually singular on $\mathscr{F}_{\infty}$, then $X=0$ with probability 1 .

Proof. The situation is that of Example 35.2. The density $X_{n}$ is measurable $\mathscr{F}_{n}$ and satisfies (35.9). Since $X_{n}$ is nonnegative, $E\left[\left|X_{n}\right|\right]=E\left[X_{n}\right]= \nu(\Omega)$, and it follows by Theorem 35.5 that $X_{n}$ converges to an integrable $X$. The limit $X$ is measurable $\mathscr{F}_{\infty}$.

Suppose that $P$ dominates $\nu$ on $\mathscr{F}_{\infty}$ and let $Z$ be the Radon-Nikodym derivative: $Z$ is measurable $\mathscr{F}_{\infty}$, and $\int_{A} Z d P=\nu(A)$ for $A \in \mathscr{F}_{\infty}$. It follows that $\int_{A} Z d P=\int_{A} X_{n} d P$ for $A$ in $\mathscr{F}_{n}$, and so $X_{n}=E\left[Z \| \mathscr{F}_{n}\right]$. Now Theorem 35.6 implies that $X_{n} \rightarrow E\left[Z \| \mathscr{F}_{\infty}\right]=Z$.

Suppose, on the other hand, that $P$ and $\nu$ are mutually singular on $\mathscr{F}_{\infty}$, so that there exists a set $S$ in $\mathscr{F}_{\infty}$ such that $\nu(S)=0$ and $P(S)=1$. By Fatou's lemma $\int_{A} X d P \leq \liminf _{n} \int_{A} X_{n} d P$. If $A \in \mathscr{F}_{k}$, then $\int_{A} X_{n} d P=\nu(A)$ for $n \geq k$, and so $\int_{A} X d P \leq \nu(A)$ for $A$ in the field $\bigcup_{k=1}^{\infty} \mathscr{F}_{k}$. It follows by the monotone class theorem that this holds for all $A$ in $\mathscr{F}_{\infty}$. Therefore, $\int X d P=\int_{S} X d P \leq \nu(S)=0$, and $X$ vanishes with probability 1 . $\square$


[^0]:    *This topic may be omitted

[^1]:    *This topic may be omitted.

[^2]:    ${ }^{\dagger}$ The 4 in (27.23) has become 16 to allow for splitting into real and imaginary parts.

[^3]:    *This section may be omitted.

[^4]:    ${ }^{\dagger}$ The argument in the footnote on p. 334 shows that in fact $D_{h} \in \mathscr{R}^{k}$ always holds.

[^5]:    ${ }^{\dagger}$ The approach of this section carries over to general metric spaces; for this theory and its applications, see Billingsley ${ }_{1}$ and Billingsley ${ }_{2}$. Since Skorohod's theorem is no easier in $R^{k}$ than in the general metric space, it is not treated here.

[^6]:    *This section may be omitted.

[^7]:    ${ }^{\dagger}$ This process is a version of analytic continuation.

[^8]:    ${ }^{\dagger}$ For another proof, see Problem 26.7. The present proof does not require the idea of analyticity.

[^9]:    ${ }^{\dagger}$ Compare Problems 2.18, 5.19, and 6.16.
    ${ }^{\ddagger}$ See, for example, Problem 18.17, or Hardy\&Wrioht, Chapter XXII.

[^10]:    *This section may be omitted.

[^11]:    ${ }^{\dagger}$ For a proof, see $\operatorname{Rudin}_{2}$, p 179

[^12]:    ${ }^{\dagger}$ See Problem 31.8
    ${ }^{\ddagger}$ For a different argument, see Problem 3.14.

[^13]:    ${ }^{\dagger}$ Intervals are nonoverlapping if their interiors are disjoint. In this definition it is immaterial whether the intervals are regarded as closed or open or half-open, since this has no effect on (31.28).
    ${ }^{\ddagger}$ The definition applies to all functions, not just to distribution functions If $F$ is a distribution function as in the present discussion, the absolute-value bars in (31.28) are unnecessary

[^14]:    ${ }^{\dagger}$ Theorems 31.3 and 318 do have geometric analogues in $R^{k}$; see Rudin ${ }_{2}$, Chapter 8.

[^15]:    ${ }^{\dagger}$ This uses the fact that $\|F\|_{\Delta}$ cannot decrease under passage to a finer partition.

[^16]:    ${ }^{\dagger}$ A Lipschitz condition of order $\alpha$ holds at $x$ if $F(x+h)-F(x)=O\left(|h|^{\alpha}\right)$ as $h \rightarrow 0$, for $\alpha>1$ this implies $F^{\prime}(x)=0$, and for $0<\alpha<1$ it is a smoothness condition stronger than continuity and weaker than differentiability.

[^17]:    ${ }^{\dagger}$ See Problem 32.3.

[^18]:    ${ }^{\dagger}$ As always, observer, information, know, and so on are informal, nonmathematical terms; see the related discussion in Section 4 (p. 57).

[^19]:    ${ }^{\dagger}$ Let $P_{0}$ be the restriction of $P$ to $\mathscr{G}$ (Example 10.4), and find on $(\Omega, \mathscr{G})$ a density $f$ for $\nu$ with respect to $P_{0}$. Then, for $G \in \mathscr{G}, \nu(G)=\int_{G} f d P_{0}=\int_{G} f d P$ (Example 16.4). If $g$ is another such density, then $P[f \neq g]=P_{0}[f \neq g]=0$.

[^20]:    ${ }^{\dagger}$ The argument is outlined in Problem 33.11. It depends on the construction of certain nonmeasurable sets.

[^21]:    ${ }^{\dagger}$ As in the case of conditional probabilities, the integral is the same on $(\Omega, \mathscr{F}, P)$ as on $(\Omega, \mathscr{G})$ with $P$ restricted to $\mathscr{G}$ (Example 16.4).

[^22]:    *This topic may be omitted.
    ${ }^{\dagger}$ See Problem 34.19.

[^23]:    *This topic may be omitted.

[^24]:    ${ }^{\dagger}$ There is a reversal of terminology here: a subfair game (Section 7) is against the gambler, while a submartingale favors him.
    ${ }^{4}$ The notation has, of course, changed. The $F_{n}$ and $X_{n}$ of Section 7 have become $X_{n}$ and $\Delta_{n}$.

