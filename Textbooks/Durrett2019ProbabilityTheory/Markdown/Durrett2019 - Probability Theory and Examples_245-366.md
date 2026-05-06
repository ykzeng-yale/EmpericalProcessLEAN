Theorem 4.4.1 implies $E X_{n}=E S_{N \wedge n}=E S_{0}=1$ for all $n$. Using hitting probabilities for simple random walk from Theorem 4.8.7, we have

$$
\begin{equation*}
P\left(\max _{m} X_{m} \geq M\right)=\frac{1}{M} \tag{4.4.1}
\end{equation*}
$$

so $E\left(\max _{m} X_{m}\right)=\sum_{M=1}^{\infty} P\left(\max _{m} X_{m} \geq M\right)=\sum_{M=1}^{\infty} 1 / M=\infty$. The monotone convergence theorem implies that $E \max _{m \leq n} X_{m} \uparrow \infty$ as $n \uparrow \infty$.

From Theorem 4.4.4, we get the following:
Theorem 4.4.6. $L^{p}$ convergence theorem. If $X_{n}$ is a martingale with $\sup E\left|X_{n}\right|^{p}<\infty$ where $p>1$, then $X_{n} \rightarrow X$ a.s. and in $L^{p}$.

Proof. $\left(E X_{n}^{+}\right)^{p} \leq\left(E\left|X_{n}\right|\right)^{p} \leq E\left|X_{n}\right|^{p}$, so it follows from the martingale convergence theorem (4.2.11) that $X_{n} \rightarrow X$ a.s. The second conclusion in Theorem 4.4.4 implies

$$
E\left(\sup _{0 \leq m \leq n}\left|X_{m}\right|\right)^{p} \leq\left(\frac{p}{p-1}\right)^{p} E\left|X_{n}\right|^{p}
$$

Letting $n \rightarrow \infty$ and using the monotone convergence theorem implies $\sup \left|X_{n}\right| \in L^{p}$. Since $\left|X_{n}-X\right|^{p} \leq\left(2 \sup \left|X_{n}\right|\right)^{p}$, it follows from the dominated convergence theorem, that $E\left|X_{n}-X\right|^{p} \rightarrow 0$.

The most important special case of the results in this section occurs when $p=2$. To treat this case, the next two results are useful.

Theorem 4.4.7. Orthogonality of martingale increments. Let $X_{n}$ be a martingale with $E X_{n}^{2}<\infty$ for all $n$. If $m \leq n$ and $Y \in \mathcal{F}_{m}$ has $E Y^{2}<\infty$ then

$$
E\left(\left(X_{n}-X_{m}\right) Y\right)=0
$$

and hence if $\ell<m<n$

$$
E\left(\left(X_{n}-X_{m}\right)\left(X_{m}-X_{\ell}\right)=0\right.
$$

Proof. The Cauchy-Schwarz inequality implies $E\left|\left(X_{n}-X_{m}\right) Y\right|<\infty$. Using (4.1.5), Theorem 4.1.14, and the definition of a martingale,
$E\left(\left(X_{n}-X_{m}\right) Y\right)=E\left[E\left(\left(X_{n}-X_{m}\right) Y \mid \mathcal{F}_{m}\right)\right]=E\left[Y E\left(\left(X_{n}-X_{m}\right) \mid \mathcal{F}_{m}\right)\right]=0$

Theorem 4.4.8. Conditional variance formula. If $X_{n}$ is a martingale with $E X_{n}^{2}<\infty$ for all $n$,

$$
E\left(\left(X_{n}-X_{m}\right)^{2} \mid \mathcal{F}_{m}\right)=E\left(X_{n}^{2} \mid \mathcal{F}_{m}\right)-X_{m}^{2}
$$

Remark. This is the conditional analogue of $E(X-E X)^{2}=E X^{2}- (E X)^{2}$ and is proved in exactly the same way.

Proof. Using the linearity of conditional expectation and then Theorem 4.1.14, we have

$$
\begin{aligned}
E\left(X_{n}^{2}-2 X_{n} X_{m}+X_{m}^{2} \mid \mathcal{F}_{m}\right) & =E\left(X_{n}^{2} \mid \mathcal{F}_{m}\right)-2 X_{m} E\left(X_{n} \mid \mathcal{F}_{m}\right)+X_{m}^{2} \\
& =E\left(X_{n}^{2} \mid \mathcal{F}_{m}\right)-2 X_{m}^{2}+X_{m}^{2}
\end{aligned}
$$

which gives the desired result.
Example 4.4.9. Branching processes. We continue the study begun at the end of the last section. Using the notation introduced there, we suppose $\mu=E\left(\xi_{i}^{m}\right)>1$ and $\operatorname{var}\left(\xi_{i}^{m}\right)=\sigma^{2}<\infty$. Let $X_{n}=Z_{n} / \mu^{n}$. Taking $m=n-1$ in Theorem 4.4.8 and rearranging, we have

$$
E\left(X_{n}^{2} \mid \mathcal{F}_{n-1}\right)=X_{n-1}^{2}+E\left(\left(X_{n}-X_{n-1}\right)^{2} \mid \mathcal{F}_{n-1}\right)
$$

To compute the second term, we observe

$$
\begin{aligned}
E\left(\left(X_{n}-X_{n-1}\right)^{2} \mid \mathcal{F}_{n-1}\right) & =E\left(\left(Z_{n} / \mu^{n}-Z_{n-1} / \mu^{n-1}\right)^{2} \mid \mathcal{F}_{n-1}\right) \\
& =\mu^{-2 n} E\left(\left(Z_{n}-\mu Z_{n-1}\right)^{2} \mid \mathcal{F}_{n-1}\right)
\end{aligned}
$$

It follows from Exercise 4.1.2 that on $\left\{Z_{n-1}=k\right\}$,

$$
E\left(\left(Z_{n}-\mu Z_{n-1}\right)^{2} \mid \mathcal{F}_{n-1}\right)=E\left(\left(\sum_{i=1}^{k} \xi_{i}^{n}-\mu k\right)^{2} \mid \mathcal{F}_{n-1}\right)=k \sigma^{2}=Z_{n-1} \sigma^{2}
$$

Combining the last three equations gives

$$
E X_{n}^{2}=E X_{n-1}^{2}+E\left(Z_{n-1} \sigma^{2} / \mu^{2 n}\right)=E X_{n-1}^{2}+\sigma^{2} / \mu^{n+1}
$$

since $E\left(Z_{n-1} / \mu^{n-1}\right)=E Z_{0}=1$. Now $E X_{0}^{2}=1$, so $E X_{1}^{2}=1+\sigma^{2} / \mu^{2}$, and induction gives

$$
E X_{n}^{2}=1+\sigma^{2} \sum_{k=2}^{n+1} \mu^{-k}
$$

This shows $\sup E X_{n}^{2}<\infty$, so $X_{n} \rightarrow X$ in $L^{2}$, and hence $E X_{n} \rightarrow E X$. $E X_{n}=1$ for all $n$, so $E X=1$ and $X$ is not $\equiv 0$. It follows from Exercise 4.3.11 that $\{X>0\}=\left\{Z_{n}>0\right.$ for all n$\}$.

## Exercises

4.4.1. Show that if $j \leq k$ then $E\left(X_{j} ; N=j\right) \leq E\left(X_{k} ; N=j\right)$ and sum over $j$ to get a second proof of $E X_{N} \leq E X_{k}$.
4.4.2. Generalize the proof of Theorem 4.4.1 to show that if $X_{n}$ is a submartingale and $M \leq N$ are stopping times with $P(N \leq k)=1$ then $E X_{M} \leq E X_{N}$.
4.4.3. Suppose $M \leq N$ are stopping times. If $A \in \mathcal{F}_{M}$ then

$$
L=\left\{\begin{array}{ll}
M & \text { on } A \\
N & \text { on } A^{c}
\end{array} \quad\right. \text { is a stopping time. }
$$

4.4.4. Use the stopping times from the previous exercise to strengthen the conclusion of Exercise 4.4.2 to $X_{M} \leq E\left(X_{N} \mid \mathcal{F}_{M}\right)$.
4.4.5. Prove the following variant of the conditional variance formula. If $\mathcal{F} \subset \mathcal{G}$ then

$$
E(E[Y \mid \mathcal{G}]-E[Y \mid \mathcal{F}])^{2}=E(E[Y \mid \mathcal{G}])^{2}-E(E[Y \mid \mathcal{F}])^{2}
$$

4.4.6. Suppose in addition to the conditions introduced above that $\left|\xi_{m}\right| \leq K$ and let $s_{n}^{2}=\sum_{m \leq n} \sigma_{m}^{2}$. Exercise 4.2.2 implies that $S_{n}^{2}-s_{n}^{2}$ is a martingale. Use this and Theorem 4.4.1 to conclude

$$
P\left(\max _{1 \leq m \leq n}\left|S_{m}\right| \leq x\right) \leq(x+K)^{2} / \operatorname{var}\left(S_{n}\right)
$$

4.4.7. The next result gives an extension of Theorem 4.4.2 to $p=1$. Let $X_{n}$ be a martingale with $X_{0}=0$ and $E X_{n}^{2}<\infty$. Show that

$$
P\left(\max _{1 \leq m \leq n} X_{m} \geq \lambda\right) \leq E X_{n}^{2} /\left(E X_{n}^{2}+\lambda^{2}\right)
$$

Hint: Use the fact that $\left(X_{n}+c\right)^{2}$ is a submartingale and optimize over $c$.
4.4.8. Let $X_{n}$ be a submartingale and $\log ^{+} x=\max (\log x, 0)$.

$$
E \bar{X}_{n} \leq\left(1-e^{-1}\right)^{-1}\left\{1+E\left(X_{n}^{+} \log ^{+}\left(X_{n}^{+}\right)\right)\right\}
$$

Prove this by carrying out the following steps: (i) Imitate the proof of 4.4.2 but use the trivial bound $P(A) \leq 1$ for $\lambda \leq 1$ to show

$$
E\left(\bar{X}_{n} \wedge M\right) \leq 1+\int X_{n}^{+} \log \left(\bar{X}_{n} \wedge M\right) d P
$$

(ii) Use calculus to show $a \log b \leq a \log a+b / e \leq a \log ^{+} a+b / e$.
4.4.9. Let $X_{n}$ and $Y_{n}$ be martingales with $E X_{n}^{2}<\infty$ and $E Y_{n}^{2}<\infty$.

$$
E X_{n} Y_{n}-E X_{0} Y_{0}=\sum_{m=1}^{n} E\left(X_{m}-X_{m-1}\right)\left(Y_{m}-Y_{m-1}\right)
$$

4.4.10. Let $X_{n}, n \geq 0$, be a martingale and let $\xi_{n}=X_{n}-X_{n-1}$ for $n \geq 1$. If $E X_{0}^{2}, \sum_{m=1}^{\infty} E \xi_{m}^{2}<\infty$ then $X_{n} \rightarrow X_{\infty}$ a.s. and in $L^{2}$.
4.4.11. Continuing with the notation from the previous problem. If $b_{m} \uparrow \infty$ and $\sum_{m=1}^{\infty} E \xi_{m}^{2} / b_{m}^{2}<\infty$ then $X_{n} / b_{n} \rightarrow 0$ a.s. In particular, if $E \xi_{n}^{2} \leq K<\infty$ and $\sum_{m=1}^{\infty} b_{m}^{-2}<\infty$ then $X_{n} / b_{n} \rightarrow 0$ a.s.

### 4.5 Square Integrable Martingales*

In this section, we will suppose
$X_{n}$ is a martingale with $X_{0}=0$ and $E X_{n}^{2}<\infty$ for all $n$
Theorem 4.2.6 implies $X_{n}^{2}$ is a submartingale. It follows from Doob's decomposition Theorem 4.3.2 that we can write $X_{n}^{2}=M_{n}+A_{n}$, where $M_{n}$ is a martingale, and from formulas in Theorems 4.3.2 and 4.4.8 that

$$
A_{n}=\sum_{m=1}^{n} E\left(X_{m}^{2} \mid \mathcal{F}_{m-1}\right)-X_{m-1}^{2}=\sum_{m=1}^{n} E\left(\left(X_{m}-X_{m-1}\right)^{2} \mid \mathcal{F}_{m-1}\right)
$$

$A_{n}$ is called the increasing process associated with $X_{n} . A_{n}$ can be thought of as a path by path measurement of the variance at time $n$, and $A_{\infty}=\lim A_{n}$ as the total variance in the path. Theorems 4.5.2 and 4.5.3 describe the behavior of the martingale on $\left\{A_{n}<\infty\right\}$ and $\left\{A_{n}=\infty\right\}$, respectively. The key to the proof of the first result is the following:

Theorem 4.5.1. $E\left(\sup _{m}\left|X_{m}\right|^{2}\right) \leq 4 E A_{\infty}$.
Proof. Applying the $L^{2}$ maximum inequality (Theorem 4.4.4) to $X_{n}$ gives

$$
E\left(\sup _{0 \leq m \leq n}\left|X_{m}\right|^{2}\right) \leq 4 E X_{n}^{2}=4 E A_{n}
$$

since $E X_{n}^{2}=E M_{n}+E A_{n}$ and $E M_{n}=E M_{0}=E X_{0}^{2}=0$. Using the monotone convergence theorem now gives the desired result.

Theorem 4.5.2. $\lim _{n \rightarrow \infty} X_{n}$ exists and is finite a.s. on $\left\{A_{\infty}<\infty\right\}$.
Proof. Let $a>0$. Since $A_{n+1} \in \mathcal{F}_{n}, N=\inf \left\{n: A_{n+1}>a^{2}\right\}$ is a stopping time. Applying Theorem 4.5.1 to $X_{N \wedge n}$ and noticing $A_{N \wedge n} \leq a^{2}$ gives

$$
E\left(\sup _{n}\left|X_{N \wedge n}\right|^{2}\right) \leq 4 a^{2}
$$

so the $L^{2}$ convergence theorem, 4.4.6, implies that $\lim X_{N \wedge n}$ exists and is finite a.s. Since $a$ is arbitrary, the desired result follows.

The next result is a variation on the theme of Exercise 4.4.11.
Theorem 4.5.3. Let $f \geq 1$ be increasing with $\int_{0}^{\infty} f(t)^{-2} d t<\infty$. Then $X_{n} / f\left(A_{n}\right) \rightarrow 0$ a.s. on $\left\{A_{\infty}=\infty\right\}$.
Proof. $H_{m}=f\left(A_{m}\right)^{-1}$ is bounded and predictable, so Theorem 4.2.8 implies

$$
Y_{n} \equiv(H \cdot X)_{n}=\sum_{m=1}^{n} \frac{X_{m}-X_{m-1}}{f\left(A_{m}\right)} \quad \text { is a martingale }
$$

If $B_{n}$ is the increasing process associated with $Y_{n}$ then

$$
\begin{aligned}
B_{n+1}-B_{n} & =E\left(\left(Y_{n+1}-Y_{n}\right)^{2} \mid \mathcal{F}_{n}\right) \\
& =E\left(\left.\frac{\left(X_{n+1}-X_{n}\right)^{2}}{f\left(A_{n+1}\right)^{2}} \right\rvert\, \mathcal{F}_{n}\right)=\frac{A_{n+1}-A_{n}}{f\left(A_{n+1}\right)^{2}}
\end{aligned}
$$

since $f\left(A_{n+1}\right) \in \mathcal{F}_{n}$. Our hypotheses on $f$ imply that

$$
\sum_{n=0}^{\infty} \frac{A_{n+1}-A_{n}}{f\left(A_{n+1}\right)^{2}} \leq \sum_{n=0}^{\infty} \int_{\left[A_{n}, A_{n+1}\right)} f(t)^{-2} d t<\infty
$$

so it follows from Theorem 4.5.2 that $Y_{n} \rightarrow Y_{\infty}$, and the desired conclusion follows from Kronecker's lemma, Theorem 2.5.9.

Example 4.5.4. Let $\epsilon>0$ and $f(t)=\left(t \log ^{1+\epsilon} t\right)^{1 / 2} \vee 1$. Then $f$ satisfies the hypotheses of Theorem 4.5.3. Let $\xi_{1}, \xi_{2}, \ldots$ be independent with $E \xi_{m}=0$ and $E \xi_{m}^{2}=\sigma_{m}^{2}$. In this case, $X_{n}=\xi_{1}+\cdots+\xi_{n}$ is a square integrable martingale with $A_{n}=\sigma_{1}^{2}+\cdots+\sigma_{n}^{2}$, so if $\sum_{i=1}^{\infty} \sigma_{i}^{2}=\infty$, Theorem 4.5.3 implies $X_{n} / f\left(A_{n}\right) \rightarrow 0$ generalizing Theorem 2.5.11.

From Theorem 4.5.3 we get a result due to Dubins and Freedman (1965) that extends our two previous versions in Theorems 2.3.7 and 4.3.4.

Theorem 4.5.5. Second Borel-Cantelli Lemma, III. Suppose $B_{n}$ is adapted to $\mathcal{F}_{n}$ and let $p_{n}=P\left(B_{n} \mid \mathcal{F}_{n-1}\right)$. Then

$$
\sum_{m=1}^{n} 1_{B(m)} / \sum_{m=1}^{n} p_{m} \rightarrow 1 \quad \text { a.s. on } \quad\left\{\sum_{m=1}^{\infty} p_{m}=\infty\right\}
$$

Proof. Define a martingale by $X_{0}=0$ and $X_{n}-X_{n-1}=1_{B_{n}}-P\left(B_{n} \mid \mathcal{F}_{n-1}\right)$ for $n \geq 1$ so that we have

$$
\left(\sum_{m=1}^{n} 1_{B(m)} / \sum_{m=1}^{n} p_{m}\right)-1=X_{n} / \sum_{m=1}^{n} p_{m}
$$

The increasing process associated with $X_{n}$ has

$$
\begin{aligned}
A_{n}-A_{n-1} & =E\left(\left(X_{n}-X_{n-1}\right)^{2} \mid \mathcal{F}_{n-1}\right) \\
& =E\left(\left(1_{B_{n}}-p_{n}\right)^{2} \mid \mathcal{F}_{n-1}\right)=p_{n}-p_{n}^{2} \leq p_{n}
\end{aligned}
$$

On $\left\{A_{\infty}<\infty\right\}, X_{n} \rightarrow$ a finite limit by Theorem 4.5.2, so on $\left\{A_{\infty}<\right. \infty\} \cap\left\{\sum_{m} p_{m}=\infty\right\}$

$$
X_{n} / \sum_{m=1}^{n} p_{m} \rightarrow 0
$$

$\left\{A_{\infty}=\infty\right\}=\left\{\sum_{m} p_{m}\left(1-p_{m}\right)=\infty\right\} \subset\left\{\sum_{m} p_{m}=\infty\right\}$, so on $\left\{A_{\infty}=\right. \infty\}$ the desired conclusion follows from Theorem 4.5.3 with $f(t)=t \vee$ 1.

Remark. The trivial example $B_{n}=\Omega$ for all $n$ shows we may have $A_{\infty}<\infty$ and $\sum p_{m}=\infty$ a.s.

Example 4.5.6. Bernard Friedman's urn. Consider a variant of Polya's urn (see Section 5.3) in which we add $a$ balls of the color drawn and $b$ balls of the opposite color where $a \geq 0$ and $b>0$. We will show that if we start with $g$ green balls and $r$ red balls, where $g, r>0$, then the fraction of green balls $g_{n} \rightarrow 1 / 2$. Let $G_{n}$ and $R_{n}$ be the number of green and red balls after the $n$th draw is completed. Let $B_{n}$ be the event that the $n$th ball drawn is green, and let $D_{n}$ be the number of green balls drawn in the first $n$ draws. It follows from Theorem 4.5.5 that

$$
\begin{equation*}
D_{n} / \sum_{m=1}^{n} g_{m-1} \rightarrow 1 \quad \text { a.s. on } \quad \sum_{m=1}^{\infty} g_{m-1}=\infty \tag{$\star$}
\end{equation*}
$$

which always holds since $g_{m} \geq g /(g+r+(a+b) m)$. At this point, the argument breaks into three cases.

Case 1. $a=b=c$. In this case, the result is trivial since we always add $c$ balls of each color.

Case 2. $a>b$. We begin with the observation

$$
\begin{equation*}
g_{n+1}=\frac{G_{n+1}}{G_{n+1}+R_{n+1}}=\frac{g+a D_{n}+b\left(n-D_{n}\right)}{g+r+n(a+b)} \tag{*}
\end{equation*}
$$

If $\limsup _{n \rightarrow \infty} g_{n} \leq x$ then ( $\star$ ) implies $\limsup _{n \rightarrow \infty} D_{n} / n \leq x$ and (since $a>b$ )

$$
\limsup _{n \rightarrow \infty} g_{n+1} \leq \frac{a x+b(1-x)}{a+b}=\frac{b+(a-b) x}{a+b}
$$

The right-hand side is a linear function with slope $<1$ and fixed point at $1 / 2$, so starting with the trivial upper bound $x=1$ and iterating we conclude that $\limsup g_{n} \leq 1 / 2$. Interchanging the roles of red and green shows $\liminf _{n \rightarrow \infty} g_{n} \geq 1 / 2$, and the result follows.

Case 3. $a<b$. The result is easier to believe in this case since we are adding more balls of the type not drawn but is a little harder to prove. The trouble is that when $b>a$ and $D_{n} \leq x n$, the right-hand side of (*) is maximized by taking $D_{n}=0$, so we need to also use the fact that if $r_{n}$ is fraction of red balls, then

$$
r_{n+1}=\frac{R_{n+1}}{G_{n+1}+R_{n+1}}=\frac{r+b D_{n}+a\left(n-D_{n}\right)}{g+r+n(a+b)}
$$

Combining this with the formula for $g_{n+1}$, it follows that if $\limsup _{n \rightarrow \infty} g_{n} \leq$
$x$ and $\limsup \sup _{n \rightarrow \infty} r_{n} \leq y$ then

$$
\begin{aligned}
& \limsup _{n \rightarrow \infty} g_{n} \leq \frac{a(1-y)+b y}{a+b}=\frac{a+(b-a) y}{a+b} \\
& \limsup _{n \rightarrow \infty} r_{n} \leq \frac{b x+a(1-x)}{a+b}=\frac{a+(b-a) x}{a+b}
\end{aligned}
$$

Starting with the trivial bounds $x=1, y=1$ and iterating (observe the two upper bounds are always the same), we conclude as in Case 2 that both limsups are $\leq 1 / 2$.

Remark. B. Friedman (1949) considered a number of different urn models. The result above is due to Freedman (1965), who proved the result by different methods. The proof above is due to Ornstein and comes from a remark in Freedman's paper.

Theorem 4.5.1 came from using Theorem 4.4.4. If we use Theorem 4.4.2 instead, we get a slightly better result.

Theorem 4.5.7. $E\left(\sup _{n}\left|X_{n}\right|\right) \leq 3 E A_{\infty}^{1 / 2}$.
Proof. As in the proof of Theorem 4.5.2 we let $a>0$ and let $N=\inf \{n: \left.A_{n+1}>a^{2}\right\}$. This time, however, our starting point is

$$
P\left(\sup _{m}\left|X_{m}\right|>a\right) \leq P(N<\infty)+P\left(\sup _{m}\left|X_{N \wedge m}\right|>a\right)
$$

$P(N<\infty)=P\left(A_{\infty}>a^{2}\right)$. To bound the second term, we apply Theorem 4.4.2 to $X_{N \wedge m}^{2}$ with $\lambda=a^{2}$ to get

$$
P\left(\sup _{m \leq n}\left|X_{N \wedge m}\right|>a\right) \leq a^{-2} E X_{N \wedge n}^{2}=a^{-2} E A_{N \wedge n} \leq a^{-2} E\left(A_{\infty} \wedge a^{2}\right)
$$

Letting $n \rightarrow \infty$ in the last inequality, substituting the result in the first one, and integrating gives

$$
\int_{0}^{\infty} P\left(\sup _{m}\left|X_{m}\right|>a\right) d a \leq \int_{0}^{\infty} P\left(A_{\infty}>a^{2}\right) d a+\int_{0}^{\infty} a^{-2} E\left(A_{\infty} \wedge a^{2}\right) d a
$$

Since $P\left(A_{\infty}>a^{2}\right)=P\left(A_{\infty}^{1 / 2}>a\right)$, the first integral is $E A_{\infty}^{1 / 2}$. For the second, we use Lemma 2.2.13 (in the first and fourth steps), Fubini's theorem, and calculus to get

$$
\begin{aligned}
& \int_{0}^{\infty} a^{-2} E\left(A_{\infty} \wedge a^{2}\right) d a=\int_{0}^{\infty} a^{-2} \int_{0}^{a^{2}} P\left(A_{\infty}>b\right) d b d a \\
& =\int_{0}^{\infty} P\left(A_{\infty}>b\right) \int_{\sqrt{b}}^{\infty} a^{-2} d a d b=\int_{0}^{\infty} b^{-1 / 2} P\left(A_{\infty}>b\right) d b=2 E A_{\infty}^{1 / 2}
\end{aligned}
$$

which completes the proof.

Example 4.5.8. Let $\xi_{1}, \xi_{2}, \ldots$ be i.i.d. with $P\left(\xi_{i}=1\right)=P\left(\xi_{i}=-1\right)$. Let $S_{n}=\xi_{1}+\cdots+\xi_{n}$. Theorem 4.4.1 implies that for any stopping time $N, E S_{N \wedge n}=0$. Using Theorem 4.5.7 we can conclude that if $E N^{1 / 2}<\infty$ then $E S_{N}=0$. Let $T=\inf \left\{n: S_{n}=-1\right\}$. Since $S_{T}=-1$ does not have mean 0 , it follows that $E T^{1 / 2}=\infty$.

### 4.6 Uniform Integrability, Convergence in $L^{1}$

In this section, we will give necessary and sufficient conditions for a martingale to converge in $L^{1}$. The key to this is the following definition. A collection of random variables $X_{i}, i \in I$, is said to be uniformly integrable if

$$
\lim _{M \rightarrow \infty}\left(\sup _{i \in I} E\left(\left|X_{i}\right| ;\left|X_{i}\right|>M\right)\right)=0
$$

If we pick $M$ large enough so that the sup $<1$, it follows that

$$
\sup _{i \in I} E\left|X_{i}\right| \leq M+1<\infty
$$

This remark will be useful several times below.
A trivial example of a uniformly integrable family is a collection of random variables that are dominated by an integrable random variable, i.e., $\left|X_{i}\right| \leq Y$ where $E Y<\infty$. Our first result gives an interesting example that shows that uniformly integrable families can be very large.
Theorem 4.6.1. Given a probability space ( $\Omega, \mathcal{F}_{o}, P$ ) and an $X \in L^{1}$, then $\left\{E(X \mid \mathcal{F}): \mathcal{F}\right.$ is a $\sigma$-field $\left.\subset \mathcal{F}_{o}\right\}$ is uniformly integrable.
Proof. If $A_{n}$ is a sequence of sets with $P\left(A_{n}\right) \rightarrow 0$ then the dominated convergence theorem implies $E\left(|X| ; A_{n}\right) \rightarrow 0$. From the last result, it follows that if $\epsilon>0$, we can pick $\delta>0$ so that if $P(A) \leq \delta$ then $E(|X| ; A) \leq \epsilon$. (If not, there are sets $A_{n}$ with $P\left(A_{n}\right) \leq 1 / n$ and $E\left(|X| ; A_{n}\right)>\epsilon$, a contradiction.)

Pick $M$ large enough so that $E|X| / M \leq \delta$. Jensen's inequality and the definition of conditional expectation imply

$$
\begin{aligned}
E(|E(X \mid \mathcal{F})| ;|E(X \mid \mathcal{F})|>M) & \leq E(E(|X| \mid \mathcal{F}) ; E(|X| \mid \mathcal{F})>M) \\
& =E(|X| ; E(|X| \mid \mathcal{F})>M)
\end{aligned}
$$

since $\{E(|X| \mid \mathcal{F})>M\} \in \mathcal{F}$. Using Chebyshev's inequality and recalling the definition of $M$, we have

$$
P\{E(|X| \mid \mathcal{F})>M\} \leq E\{E(|X| \mid \mathcal{F})\} / M=E|X| / M \leq \delta
$$

So, by the choice of $\delta$, we have

$$
E(|E(X \mid \mathcal{F})| ;|E(X \mid \mathcal{F})|>M) \leq \epsilon \quad \text { for all } \mathcal{F}
$$

Since $\epsilon$ was arbitrary, the collection is uniformly integrable.

A common way to check uniform integrability is to use:
Theorem 4.6.2. Let $\varphi \geq 0$ be any function with $\varphi(x) / x \rightarrow \infty$ as $x \rightarrow \infty$, e.g., $\varphi(x)=x^{p}$ with $p>1$ or $\varphi(x)=x \log ^{+} x$. If $E \varphi\left(\left|X_{i}\right|\right) \leq C$ for all $i \in I$, then $\left\{X_{i}: i \in I\right\}$ is uniformly integrable.

Proof. Let $\epsilon_{M}=\sup \{x / \phi(x): x \geq M\}$. For $i \in I$

$$
E\left(\left|X_{i}\right| ;\left|X_{i}\right|>M\right) \leq \epsilon_{M} E\left(\phi\left(\left|X_{i}\right|\right) ;\left|X_{i}\right|>M\right) \leq C \epsilon_{M}
$$

and $\epsilon_{M} \rightarrow 0$ as $M \rightarrow \infty$.
The relevance of uniform integrability to convergence in $L^{1}$ is explained by:

Theorem 4.6.3. Suppose that $E\left|X_{n}\right|<\infty$ for all $n$. If $X_{n} \rightarrow X$ in probability then the following are equivalent:
(i) $\left\{X_{n}: n \geq 0\right\}$ is uniformly integrable.
(ii) $X_{n} \rightarrow X$ in $L^{1}$.
(iii) $E\left|X_{n}\right| \rightarrow E|X|<\infty$.

Proof. (i) implies (ii). Let

$$
\varphi_{M}(x)= \begin{cases}M & \text { if } x \geq M \\ x & \text { if }|x| \leq M \\ -M & \text { if } x \leq-M\end{cases}
$$

The triangle inequality implies

$$
\left|X_{n}-X\right| \leq\left|X_{n}-\varphi_{M}\left(X_{n}\right)\right|+\left|\varphi_{M}\left(X_{n}\right)-\varphi_{M}(X)\right|+\left|\varphi_{M}(X)-X\right|
$$

Since $\left.\mid \varphi_{M}(Y)-Y\right)\left|=(|Y|-M)^{+} \leq|Y| 1_{(|Y|>M)}\right.$, taking expected value gives
$E\left|X_{n}-X\right| \leq E\left|\varphi_{M}\left(X_{n}\right)-\varphi_{M}(X)\right|+E\left(\left|X_{n}\right| ;\left|X_{n}\right|>M\right)+E(|X| ;|X|>M)$
Theorem 2.3.4 implies that $\varphi_{M}\left(X_{n}\right) \rightarrow \varphi_{M}(X)$ in probability, so the first term $\rightarrow 0$ by the bounded convergence theorem. (See Exercise 2.3.5.) If $\epsilon>0$ and $M$ is large, uniform integrability implies that the second term $\leq \epsilon$. To bound the third term, we observe that uniform integrability implies $\sup E\left|X_{n}\right|<\infty$, so Fatou's lemma (in the form given in Exercise 2.3.4) implies $E|X|<\infty$, and by making $M$ larger we can make the third term $\leq \epsilon$. Combining the last three facts shows $\limsup E\left|X_{n}-X\right| \leq 2 \epsilon$. Since $\epsilon$ is arbitrary, this proves (ii).
(ii) implies (iii). Jensen's inequality implies

$$
|E| X_{n}|-E| X| | \leq E| | X_{n}|-|X|| \leq E\left|X_{n}-X\right| \rightarrow 0
$$

(iii) implies (i). Let

$$
\psi_{M}(x)= \begin{cases}x & \text { on }[0, M-1] \\ 0 & \text { on }[M, \infty) \\ \text { linear } & \text { on }[M-1, M]\end{cases}
$$

The dominated convergence theorem implies that if $M$ is large, $E|X|- E \psi_{M}(|X|) \leq \epsilon / 2$. As in the first part of the proof, the bounded convergence theorem implies $E \psi_{M}\left(\left|X_{n}\right|\right) \rightarrow E \psi_{M}(|X|)$, so using (iii) we get that if $n \geq n_{0}$

$$
\begin{aligned}
E\left(\left|X_{n}\right| ;\left|X_{n}\right|>M\right) & \leq E\left|X_{n}\right|-E \psi_{M}\left(\left|X_{n}\right|\right) \\
& \leq E|X|-E \psi_{M}(|X|)+\epsilon / 2<\epsilon
\end{aligned}
$$

By choosing $M$ larger, we can make $E\left(\left|X_{n}\right| ;\left|X_{n}\right|>M\right) \leq \epsilon$ for $0 \leq n< n_{0}$, so $X_{n}$ is uniformly integrable.

We are now ready to state the main theorems of this section. We have already done all the work, so the proofs are short.

Theorem 4.6.4. For a submartingale, the following are equivalent:
(i) It is uniformly integrable.
(ii) It converges a.s. and in $L^{1}$.
(iii) It converges in $L^{1}$.

Proof. (i) implies (ii). Uniform integrability implies $\sup E\left|X_{n}\right|<\infty$ so the martingale convergence theorem implies $X_{n} \rightarrow X$ a.s., and Theorem 4.6.3 implies $X_{n} \rightarrow X$ in $L^{1}$. (ii) implies (iii). Trivial. (iii) implies (i). $X_{n} \rightarrow X$ in $L^{1}$ implies $X_{n} \rightarrow X$ in probability, (see Lemma 2.2.2) so this follows from Theorem 4.6.3.

Before proving the analogue of Theorem 4.6.4 for martingales, we will isolate two parts of the argument that will be useful later.

Lemma 4.6.5. If integrable random variables $X_{n} \rightarrow X$ in $L^{1}$ then

$$
E\left(X_{n} ; A\right) \rightarrow E(X ; A)
$$

Proof. $\left|E X_{m} 1_{A}-E X 1_{A}\right| \leq E\left|X_{m} 1_{A}-X 1_{A}\right| \leq E\left|X_{m}-X\right| \rightarrow 0$
Lemma 4.6.6. If a martingale $X_{n} \rightarrow X$ in $L^{1}$ then $X_{n}=E\left(X \mid \mathcal{F}_{n}\right)$.
Proof. The martingale property implies that if $m>n, E\left(X_{m} \mid \mathcal{F}_{n}\right)=X_{n}$, so if $A \in \mathcal{F}_{n}, E\left(X_{n} ; A\right)=E\left(X_{m} ; A\right)$. Lemma 4.6.5 implies $E\left(X_{m} ; A\right) \rightarrow E(X ; A)$, so we have $E\left(X_{n} ; A\right)=E(X ; A)$ for all $A \in \mathcal{F}_{n}$. Recalling the definition of conditional expectation, it follows that $X_{n}=E\left(X \mid \mathcal{F}_{n}\right)$.

Theorem 4.6.7. For a martingale, the following are equivalent:
(i) It is uniformly integrable.
(ii) It converges a.s. and in $L^{1}$.
(iii) It converges in $L^{1}$.
(iv) There is an integrable random variable $X$ so that $X_{n}=E\left(X \mid \mathcal{F}_{n}\right)$.

Proof. (i) implies (ii). Since martingales are also submartingales, this follows from Theorem 4.6.4. (ii) implies (iii). Trivial. (iii) implies (iv). Follows from Lemma 4.6.6. (iv) implies (i). This follows from Theorem 4.6.1.

The next result is related to Lemma 4.6.6 but goes in the other direction.

Theorem 4.6.8. Suppose $\mathcal{F}_{n} \uparrow \mathcal{F}_{\infty}$, i.e., $\mathcal{F}_{n}$ is an increasing sequence of $\sigma$-fields and $\mathcal{F}_{\infty}=\sigma\left(\cup_{n} \mathcal{F}_{n}\right)$. As $n \rightarrow \infty$,

$$
E\left(X \mid \mathcal{F}_{n}\right) \rightarrow E\left(X \mid \mathcal{F}_{\infty}\right) \quad \text { a.s. and in } L^{1}
$$

Proof. The first step is to note that if $m>n$ then Theorem 4.1.13 implies

$$
E\left(E\left(X \mid \mathcal{F}_{m}\right) \mid \mathcal{F}_{n}\right)=E\left(X \mid \mathcal{F}_{n}\right)
$$

so $Y_{n}=E\left(X \mid \mathcal{F}_{n}\right)$ is a martingale. Theorem 4.6.1 implies that $Y_{n}$ is uniformly integrable, so Theorem 4.6.7 implies that $Y_{n}$ converges a.s. and in $L^{1}$ to a limit $Y_{\infty}$. The definition of $Y_{n}$ and Lemma 4.6.6 imply $E\left(X \mid \mathcal{F}_{n}\right)=Y_{n}=E\left(Y_{\infty} \mid \mathcal{F}_{n}\right)$, and hence

$$
\int_{A} X d P=\int_{A} Y_{\infty} d P \quad \text { for all } A \in \mathcal{F}_{n}
$$

Since $X$ and $Y_{\infty}$ are integrable, and $\cup_{n} \mathcal{F}_{n}$ is a $\pi$-system, the $\pi-\lambda$ theorem implies that the last result holds for all $A \in \mathcal{F}_{\infty}$. Since $Y_{\infty} \in \mathcal{F}_{\infty}$, it follows that $Y_{\infty}=E\left(X \mid \mathcal{F}_{\infty}\right)$.

An immediate consequence of Theorem 4.6.8 is:
Theorem 4.6.9. Lévy's 0-1 law. If $\mathcal{F}_{n} \uparrow \mathcal{F}_{\infty}$ and $A \in \mathcal{F}_{\infty}$ then $E\left(1_{A} \mid \mathcal{F}_{n}\right) \rightarrow 1_{A}$ a.s.

To steal a line from Chung: "The reader is urged to ponder over the meaning of this result and judge for himself whether it is obvious or incredible." We will now argue for the two points of view.
"It is obvious." $1_{A} \in \mathcal{F}_{\infty}$, and $\mathcal{F}_{n} \uparrow \mathcal{F}_{\infty}$, so our best guess of $1_{A}$ given the information in $\mathcal{F}_{n}$ should approach $1_{A}$ (the best guess given $\mathcal{F}_{\infty}$ ).
"It is incredible." Let $X_{1}, X_{2}, \ldots$ be independent and suppose $A \in \mathcal{T}$, the tail $\sigma$-field. For each $n, A$ is independent of $\mathcal{F}_{n}$, so $E\left(1_{A} \mid \mathcal{F}_{n}\right)=P(A)$. As $n \rightarrow \infty$, the left-hand side converges to $1_{A}$ a.s., so $P(A)=1_{A}$ a.s.,
and it follows that $P(A) \in\{0,1\}$, i.e., we have proved Kolmogorov's 0-1 law.

The last argument may not show that Theorem 4.6.9 is "too unusual or improbable to be possible," but this and other applications of Theorem 4.6.9 below show that it is a very useful result.

A more technical consequence of Theorem 4.6.8 is:
Theorem 4.6.10. Dominated convergence theorem for conditional expectations. Suppose $Y_{n} \rightarrow Y$ a.s. and $\left|Y_{n}\right| \leq Z$ for all $n$ where $E Z<\infty$. If $\mathcal{F}_{n} \uparrow \mathcal{F}_{\infty}$ then

$$
E\left(Y_{n} \mid \mathcal{F}_{n}\right) \rightarrow E\left(Y \mid \mathcal{F}_{\infty}\right) \quad \text { a.s. }
$$

Proof. Let $W_{N}=\sup \left\{\left|Y_{n}-Y_{m}\right|: n, m \geq N\right\} . W_{N} \leq 2 Z$, so $E W_{N}<\infty$. Using monotonicity (4.1.2) and applying Theorem 4.6.8 to $W_{N}$ gives

$$
\limsup _{n \rightarrow \infty} E\left(\left|Y_{n}-Y\right| \mid \mathcal{F}_{n}\right) \leq \lim _{n \rightarrow \infty} E\left(W_{N} \mid \mathcal{F}_{n}\right)=E\left(W_{N} \mid \mathcal{F}_{\infty}\right)
$$

The last result is true for all $N$ and $W_{N} \downarrow 0$ as $N \uparrow \infty$, so (4.1.3) implies $E\left(W_{N} \mid \mathcal{F}_{\infty}\right) \downarrow 0$, and Jensen's inequality gives us

$$
\left|E\left(Y_{n} \mid \mathcal{F}_{n}\right)-E\left(Y \mid \mathcal{F}_{n}\right)\right| \leq E\left(\left|Y_{n}-Y\right| \mid \mathcal{F}_{n}\right) \rightarrow 0 \quad \text { a.s. as } n \rightarrow \infty
$$

Theorem 4.6.8 implies $E\left(Y \mid \mathcal{F}_{n}\right) \rightarrow E\left(Y \mid \mathcal{F}_{\infty}\right)$ a.s. The desired result follows from the last two conclusions and the triangle inequality.

Example 4.6.11. Suppose $X_{1}, X_{2} \ldots$ are uniformly integrable and $\rightarrow X$ a.s. Theorem 4.6.3 implies $X_{n} \rightarrow X$ in $L^{1}$ and combining this with Exercise 4.6.7 shows $E\left(X_{n} \mid \mathcal{F}\right) \rightarrow E(X \mid \mathcal{F})$ in $L^{1}$. We will now show that $E\left(X_{n} \mid \mathcal{F}\right)$ need not converge a.s. Let $Y_{1}, Y_{2}, \ldots$ and $Z_{1}, Z_{2}, \ldots$ be independent r.v.'s with

$$
\begin{array}{ll}
P\left(Y_{n}=1\right)=1 / n & P\left(Y_{n}=0\right)=1-1 / n \\
P\left(Z_{n}=n\right)=1 / n & P\left(Z_{n}=0\right)=1-1 / n
\end{array}
$$

Let $X_{n}=Y_{n} Z_{n} . P\left(X_{n}>0\right)=1 / n^{2}$ so the Borel-Cantelli lemma implies $X_{n} \rightarrow 0$ a.s. $E\left(X_{n} ;\left|X_{n}\right| \geq 1\right)=n / n^{2}$, so $X_{n}$ is uniformly integrable. Let $\mathcal{F}=\sigma\left(Y_{1}, Y_{2}, \ldots\right)$.

$$
E\left(X_{n} \mid \mathcal{F}\right)=Y_{n} E\left(Z_{n} \mid \mathcal{F}\right)=Y_{n} E Z_{n}=Y_{n}
$$

Since $Y_{n} \rightarrow 0$ in $L^{1}$ but not a.s., the same is true for $E\left(X_{n} \mid \mathcal{F}\right)$.

## Exercises

4.6.1. Let $Z_{1}, Z_{2}, \ldots$ be i.i.d. with $E\left|Z_{i}\right|<\infty$, let $\theta$ be an independent r.v. with finite mean, and let $Y_{i}=Z_{i}+\theta$. If $Z_{i}$ is $\operatorname{normal}(0,1)$ then in statistical terms we have a sample from a normal population with variance 1 and unknown mean. The distribution of $\theta$ is called the prior distribution, and $P\left(\theta \in \cdot \mid Y_{1}, \ldots, Y_{n}\right)$ is called the posterior distribution after $n$ observations. Show that $E\left(\theta \mid Y_{1}, \ldots, Y_{n}\right) \rightarrow \theta$ a.s.

In the next two exercises, $\Omega=[0,1), I_{k, n}=\left[k 2^{-n},(k+1) 2^{-n}\right)$, and $\mathcal{F}_{n}=\sigma\left(I_{k, n}: 0 \leq k<2^{n}\right)$.
4.6.2. $f$ is said to be Lipschitz continuous if $|f(t)-f(s)| \leq K|t-s|$ for $0 \leq s, t<1$. Show that $X_{n}=\left(f\left((k+1) 2^{-n}\right)-f\left(k 2^{-n}\right)\right) / 2^{-n}$ on $I_{k, n}$ defines a martingale, $X_{n} \rightarrow X_{\infty}$ a.s. and in $L^{1}$, and

$$
f(b)-f(a)=\int_{a}^{b} X_{\infty}(\omega) d \omega
$$

4.6.3. Suppose $f$ is integrable on $[0,1) . E\left(f \mid \mathcal{F}_{n}\right)$ is a step function and $\rightarrow f$ in $L^{1}$. From this it follows immediately that if $\epsilon>0$, there is a step function $g$ on $[0,1]$ with $\int|f-g| d x<\epsilon$. This approximation is much simpler than the bare-hands approach we used in Exercise 1.4.3, but of course we are using a lot of machinery.
4.6.4. Let $X_{n}$ be r.v.'s taking values in $[0, \infty)$. Let $D=\left\{X_{n}=0\right.$ for some $n \geq 1\}$ and assume

$$
P\left(D \mid X_{1}, \ldots, X_{n}\right) \geq \delta(x)>0 \quad \text { a.s. on }\left\{X_{n} \leq x\right\}
$$

Use Theorem 4.6.9 to conclude that $P\left(D \cup\left\{\lim _{n} X_{n}=\infty\right\}\right)=1$.
4.6.5. Let $Z_{n}$ be a branching process with offspring distribution $p_{k}$ (see the end of Section 5.3 for definitions). Use the last result to show that if $p_{0}>0$ then $P\left(\lim _{n} Z_{n}=0\right.$ or $\left.\infty\right)=1$.
4.6.6. Let $X_{n} \in[0,1]$ be adapted to $\mathcal{F}_{n}$. Let $\alpha, \beta>0$ with $\alpha+\beta=1$ and suppose

$$
P\left(X_{n+1}=\alpha+\beta X_{n} \mid \mathcal{F}_{n}\right)=X_{n} \quad P\left(X_{n+1}=\beta X_{n} \mid \mathcal{F}_{n}\right)=1-X_{n}
$$

Show $P\left(\lim _{n} X_{n}=0\right.$ or 1$)=1$ and if $X_{0}=\theta$ then $P\left(\lim _{n} X_{n}=1\right)=\theta$.
4.6.7. Show that if $\mathcal{F}_{n} \uparrow \mathcal{F}_{\infty}$ and $Y_{n} \rightarrow Y$ in $L^{1}$ then $E\left(Y_{n} \mid \mathcal{F}_{n}\right) \rightarrow E\left(Y \mid \mathcal{F}_{\infty}\right)$ in $L^{1}$.

### 4.7 Backwards Martingales

A backwards martingale (some authors call them reversed) is a martingale indexed by the negative integers, i.e., $X_{n}, n \leq 0$, adapted to an increasing sequence of $\sigma$-fields $\mathcal{F}_{n}$ with

$$
E\left(X_{n+1} \mid \mathcal{F}_{n}\right)=X_{n} \quad \text { for } n \leq-1
$$

Because the $\sigma$-fields decrease as $n \downarrow-\infty$, the convergence theory for backwards martingales is particularly simple.

Theorem 4.7.1. $X_{-\infty}=\lim _{n \rightarrow-\infty} X_{n}$ exists a.s. and in $L^{1}$.

Proof. Let $U_{n}$ be the number of upcrossings of $[a, b]$ by $X_{-n}, \ldots, X_{0}$. The upcrossing inequality, Theorem 4.2.10 implies $(b-a) E U_{n} \leq E\left(X_{0}-a\right)^{+}$. Letting $n \rightarrow \infty$ and using the monotone convergence theorem, we have $E U_{\infty}<\infty$, so by the remark after the proof of Theorem 4.2.11, the limit exists a.s. The martingale property implies $X_{n}=E\left(X_{0} \mid \mathcal{F}_{n}\right)$, so Theorem 4.6.1 implies $X_{n}$ is uniformly integrable and Theorem 4.6.3 tells us that the convergence occurs in $L^{1}$.

The next result identifies the limit in Theorem 4.7.1.
Theorem 4.7.2. If $X_{-\infty}=\lim _{n \rightarrow-\infty} X_{n}$ and $\mathcal{F}_{-\infty}=\cap_{n} \mathcal{F}_{n}$, then $X_{-\infty}= E\left(X_{0} \mid \mathcal{F}_{-\infty}\right)$.

Proof. Clearly, $X_{-\infty} \in \mathcal{F}_{-\infty} . X_{n}=E\left(X_{0} \mid \mathcal{F}_{n}\right)$, so if $A \in \mathcal{F}_{-\infty} \subset \mathcal{F}_{n}$ then

$$
\int_{A} X_{n} d P=\int_{A} X_{0} d P
$$

Theorem 4.7.1 and Lemma 4.6.5 imply $E\left(X_{n} ; A\right) \rightarrow E\left(X_{-\infty} ; A\right)$, so

$$
\int_{A} X_{-\infty} d P=\int_{A} X_{0} d P
$$

for all $A \in \mathcal{F}_{-\infty}$, proving the desired conclusion.
The next result is Theorem 4.6.8 backwards.
Theorem 4.7.3. If $\mathcal{F}_{n} \downarrow \mathcal{F}_{-\infty}$ as $n \downarrow-\infty$ (i.e., $\mathcal{F}_{-\infty}=\cap_{n} \mathcal{F}_{n}$ ), then

$$
E\left(Y \mid \mathcal{F}_{n}\right) \rightarrow E\left(Y \mid \mathcal{F}_{-\infty}\right) \quad \text { a.s. and in } L^{1}
$$

Proof. $X_{n}=E\left(Y \mid \mathcal{F}_{n}\right)$ is a backwards martingale, so Theorem 4.7.1 and 4.7.2 imply that as $n \downarrow-\infty, X_{n} \rightarrow X_{-\infty}$ a.s. and in $L^{1}$, where

$$
X_{-\infty}=E\left(X_{0} \mid \mathcal{F}_{-\infty}\right)=E\left(E\left(Y \mid \mathcal{F}_{0}\right) \mid \mathcal{F}_{-\infty}\right)=E\left(Y \mid \mathcal{F}_{-\infty}\right)
$$

Even though the convergence theory for backwards martingales is easy, there are some nice applications. For the rest of the section, we return to the special space utilized in Section 4.1, so we can utilize definitions given there. That is, we suppose

$$
\begin{aligned}
& \Omega=\left\{\left(\omega_{1}, \omega_{2}, \ldots\right): \omega_{i} \in S\right\} \\
& \mathcal{F}=\mathcal{S} \times \mathcal{S} \times \ldots \\
& X_{n}(\omega)=\omega_{n}
\end{aligned}
$$

Let $\mathcal{E}_{n}$ be the $\sigma$-field generated by events that are invariant under permutations that leave $n+1, n+2, \ldots$ fixed and let $\mathcal{E}=\cap_{n} \mathcal{E}_{n}$ be the exchangeable $\sigma$-field.

Example 4.7.4. Strong law of large numbers. Let $\xi_{1}, \xi_{2}, \ldots$ be i.i.d. with $E\left|\xi_{i}\right|<\infty$. Let $S_{n}=\xi_{1}+\cdots+\xi_{n}$, let $X_{-n}=S_{n} / n$, and let

$$
\mathcal{F}_{-n}=\sigma\left(S_{n}, S_{n+1}, S_{n+2}, \ldots\right)=\sigma\left(S_{n}, \xi_{n+1}, \xi_{n+2}, \ldots\right)
$$

To compute $E\left(X_{-n} \mid \mathcal{F}_{-n-1}\right)$, we observe that if $j, k \leq n+1$, symmetry implies $E\left(\xi_{j} \mid \mathcal{F}_{-n-1}\right)=E\left(\xi_{k} \mid \mathcal{F}_{-n-1}\right)$, so

$$
\begin{aligned}
E\left(\xi_{n+1} \mid \mathcal{F}_{-n-1}\right) & =\frac{1}{n+1} \sum_{k=1}^{n+1} E\left(\xi_{k} \mid \mathcal{F}_{-n-1}\right) \\
& =\frac{1}{n+1} E\left(S_{n+1} \mid \mathcal{F}_{-n-1}\right)=\frac{S_{n+1}}{n+1}
\end{aligned}
$$

Since $X_{-n}=\left(S_{n+1}-\xi_{n+1}\right) / n$, it follows that

$$
\begin{aligned}
E\left(X_{-n} \mid \mathcal{F}_{-n-1}\right) & =E\left(S_{n+1} / n \mid \mathcal{F}_{-n-1}\right)-E\left(\xi_{n+1} / n \mid \mathcal{F}_{-n-1}\right) \\
& =\frac{S_{n+1}}{n}-\frac{S_{n+1}}{n(n+1)}=\frac{S_{n+1}}{n+1}=X_{-n-1}
\end{aligned}
$$

The last computation shows $X_{-n}$ is a backwards martingale, so it follows from Theorems 4.7.1 and 4.7.2 that $\lim _{n \rightarrow \infty} S_{n} / n=E\left(X_{-1} \mid \mathcal{F}_{-\infty}\right)$. Since $\mathcal{F}_{-n} \subset \mathcal{E}_{n}, \mathcal{F}_{-\infty} \subset \mathcal{E}$. The Hewitt-Savage 0-1 law (Theorem 2.5.4) says $\mathcal{E}$ is trivial, so we have

$$
\lim _{n \rightarrow \infty} S_{n} / n=E\left(X_{-1}\right) \quad \text { a.s. }
$$

Example 4.7.5. Ballot theorem. Let $\left\{\xi_{j}, 1 \leq j \leq n\right\}$ be i.i.d. nonnegative integer-valued r.v.'s, let $S_{k}=\xi_{1}+\cdots+\xi_{k}$, and let $G=\left\{S_{j}<\right. j$ for $1 \leq j \leq n\}$. Then

$$
\begin{equation*}
P\left(G \mid S_{n}\right)=\left(1-S_{n} / n\right)^{+} \tag{4.7.1}
\end{equation*}
$$

Remark. To explain the name, consider an election in which candidate $B$ gets $\beta$ votes and $A$ gets $\alpha>\beta$ votes. Let $\xi_{1}, \xi_{2}, \ldots, \xi_{n}$ be i.i.d. and take values 0 or 2 with probability $1 / 2$ each. Interpreting 0 's and 2 's as votes for candidates $A$ and $B$, we see that $G=\{A$ leads $B$ throughout the counting $\}$ so if $n=\alpha+\beta$

$$
P(G \mid B \text { gets } \beta \text { votes })=\left(1-\frac{2 \beta}{n}\right)^{+}=\frac{\alpha-\beta}{\alpha+\beta}
$$

the result in Theorem 4.9.2.
Proof. The result is trivial when $S_{n} \geq n$, so suppose $S_{n}<n$. Computations in Example 4.7.4 show that $X_{-j}=S_{j} / j$ is a martingale w.r.t. $\mathcal{F}_{-j}=\sigma\left(S_{j}, \ldots, S_{n}\right)$. Let $T=\inf \left\{k \geq-n: X_{k} \geq 1\right\}$ and set $T=-1$ if the set is $\emptyset$. We claim that $X_{T}=1$ on $G^{c}$. To check this, note that
if $S_{j+1}<j+1$ then the fact that the $\xi_{i}$ are nonnegative integer values implies $S_{j} \leq S_{j+1} \leq j$. Since $G \subset\{T=-1\}$ and $S_{1}<1$ implies $S_{1}=0$, we have $X_{T}=0$ on $G$. Noting $\mathcal{F}_{-n}=\sigma\left(S_{n}\right)$ and using Exercise 4.4.4, we see that on $\left\{S_{n}<n\right\}$

$$
P\left(G^{c} \mid S_{n}\right)=E\left(X_{T} \mid \mathcal{F}_{-n}\right)=X_{-n}=S_{n} / n
$$

Subtracting from 1 and recalling that this computation has been done under the assumption $S_{n}<n$ gives the desired result.

Example 4.7.6. Hewitt-Savage 0-1 law. If $X_{1}, X_{2}, \ldots$ are i.i.d. and $A \in \mathcal{E}$ then $P(A) \in\{0,1\}$.

The key to the new proof is:
Lemma 4.7.7. Suppose $X_{1}, X_{2} \ldots$ are i.i.d. and let

$$
A_{n}(\varphi)=\frac{1}{(n)_{k}} \sum_{i} \varphi\left(X_{i_{1}}, \ldots, X_{i_{k}}\right)
$$

where the sum is over all sequences of distinct integers $1 \leq i_{1}, \ldots, i_{k} \leq n$ and

$$
(n)_{k}=n(n-1) \cdots(n-k+1)
$$

is the number of such sequences. If $\varphi$ is bounded, $A_{n}(\varphi) \rightarrow E \varphi\left(X_{1}, \ldots, X_{k}\right)$ a.s.

Proof. $A_{n}(\varphi) \in \mathcal{E}_{n}$, so

$$
\begin{aligned}
A_{n}(\varphi)=E\left(A_{n}(\varphi) \mid \mathcal{E}_{n}\right) & =\frac{1}{(n)_{k}} \sum_{i} E\left(\varphi\left(X_{i_{1}}, \ldots, X_{i_{k}}\right) \mid \mathcal{E}_{n}\right) \\
& =E\left(\varphi\left(X_{1}, \ldots, X_{k}\right) \mid \mathcal{E}_{n}\right)
\end{aligned}
$$

since all the terms in the sum are the same. Theorem 4.7.3 with $\mathcal{F}_{-m}= \mathcal{E}_{m}$ for $m \geq 1$ implies that

$$
E\left(\varphi\left(X_{1}, \ldots, X_{k}\right) \mid \mathcal{E}_{n}\right) \rightarrow E\left(\varphi\left(X_{1}, \ldots, X_{k}\right) \mid \mathcal{E}\right)
$$

We want to show that the limit is $E\left(\varphi\left(X_{1}, \ldots, X_{k}\right)\right)$. The first step is to observe that there are $k(n-1)_{k-1}$ terms in $A_{n}(\varphi)$ involving $X_{1}$ and $\varphi$ is bounded so if we let $1 \in i$ denote the sum over sequences that contain 1 .

$$
\frac{1}{(n)_{k}} \sum_{1 \in i} \varphi\left(X_{i_{1}}, \ldots, X_{i_{k}}\right) \leq \frac{k(n-1)_{k-1}}{(n)_{k}} \sup \phi \rightarrow 0
$$

This shows that

$$
E\left(\varphi\left(X_{1}, \ldots, X_{k}\right) \mid \mathcal{E}\right) \in \sigma\left(X_{2}, X_{3}, \ldots\right)
$$

Repeating the argument for $2,3, \ldots, k$ shows

$$
E\left(\varphi\left(X_{1}, \ldots, X_{k}\right) \mid \mathcal{E}\right) \in \sigma\left(X_{k+1}, X_{k+2}, \ldots\right)
$$

Intuitively, if the conditional expectation of a r.v. is independent of the r.v. then

$$
\begin{equation*}
E\left(\varphi\left(X_{1}, \ldots, X_{k}\right) \mid \mathcal{E}\right)=E\left(\varphi\left(X_{1}, \ldots, X_{k}\right)\right) \tag{a}
\end{equation*}
$$

To show this, we prove:
(b) If $E X^{2}<\infty$ and $E(X \mid \mathcal{G}) \in \mathcal{F}$ with $X$ independent of $\mathcal{F}$ then $E(X \mid \mathcal{G})=E X$.

Proof. Let $Y=E(X \mid \mathcal{G})$ and note that Theorem 4.1.11 implies $E Y^{2} \leq E X^{2}<\infty$. By independence, $E X Y=E X E Y=(E Y)^{2}$ since $E Y= E X$. From the geometric interpretation of conditional expectation, Theorem 4.1.15, $E((X-Y) Y)=0$, so $E Y^{2}=E X Y=(E Y)^{2}$ and $\operatorname{var}(Y)= E Y^{2}-(E Y)^{2}=0$.
(a) holds for all bounded $\varphi$, so $\mathcal{E}$ is independent of $\mathcal{G}_{k}=\sigma\left(X_{1}, \ldots, X_{k}\right)$. Since this holds for all $k$, and $\cup_{k} \mathcal{G}_{k}$ is a $\pi$-system that contains $\Omega$, Theorem 2.1.6 implies $\mathcal{E}$ is independent of $\sigma\left(\cup_{k} \mathcal{G}_{k}\right) \supset \mathcal{E}$, and we get the usual 0-1 law punch line. If $A \in \mathcal{E}$, it is independent of itself, and hence $P(A)=P(A \cap A)=P(A) P(A)$, i.e., $P(A) \in\{0,1\}$.

Example 4.7.8. de Finetti's Theorem. A sequence $X_{1}, X_{2}, \ldots$ is said to be exchangeable if for each $n$ and permutation $\pi$ of $\{1, \ldots, n\}$, $\left(X_{1}, \ldots, X_{n}\right)$ and $\left(X_{\pi(1)}, \ldots, X_{\pi(n)}\right)$ have the same distribution.

Theorem 4.7.9. de Finetti's Theorem. If $X_{1}, X_{2}, \ldots$ are exchangeable then conditional on $\mathcal{E}, X_{1}, X_{2}, \ldots$ are independent and identically distributed.

Proof. Repeating the first calculation in the proof of Lemma 4.7.7 and using the notation introduced there shows that for any exchangeable sequence:

$$
\begin{aligned}
A_{n}(\varphi)=E\left(A_{n}(\varphi) \mid \mathcal{E}_{n}\right) & =\frac{1}{(n)_{k}} \sum_{i} E\left(\varphi\left(X_{i_{1}}, \ldots, X_{i_{k}}\right) \mid \mathcal{E}_{n}\right) \\
& =E\left(\varphi\left(X_{1}, \ldots, X_{k}\right) \mid \mathcal{E}_{n}\right)
\end{aligned}
$$

since all the terms in the sum are the same. Again, Theorem 4.7.3 implies that

$$
\begin{equation*}
A_{n}(\varphi) \rightarrow E\left(\varphi\left(X_{1}, \ldots, X_{k}\right) \mid \mathcal{E}\right) \tag{4.7.2}
\end{equation*}
$$

This time, however, $\mathcal{E}$ may be nontrivial, so we cannot hope to show that the limit is $E\left(\varphi\left(X_{1}, \ldots, X_{k}\right)\right)$.

Let $f$ and $g$ be bounded functions on $\mathbf{R}^{k-1}$ and $\mathbf{R}$, respectively. If we let $I_{n, k}$ be the set of all sequences of distinct integers $1 \leq i_{1}, \ldots, i_{k} \leq n$, then

$$
\begin{aligned}
(n)_{k-1} A_{n}(f) n A_{n}(g) & =\sum_{i \in I_{n, k-1}} f\left(X_{i_{1}}, \ldots, X_{i_{k-1}}\right) \sum_{m} g\left(X_{m}\right) \\
& =\sum_{i \in I_{n, k}} f\left(X_{i_{1}}, \ldots, X_{i_{k-1}}\right) g\left(X_{i_{k}}\right) \\
& +\sum_{i \in I_{n, k-1}} \sum_{j=1}^{k-1} f\left(X_{i_{1}}, \ldots, X_{i_{k-1}}\right) g\left(X_{i_{j}}\right)
\end{aligned}
$$

If we let $\varphi\left(x_{1}, \ldots, x_{k}\right)=f\left(x_{1}, \ldots, x_{k-1}\right) g\left(x_{k}\right)$, note that

$$
\frac{(n)_{k-1} n}{(n)_{k}}=\frac{n}{(n-k+1)} \quad \text { and } \quad \frac{(n)_{k-1}}{(n)_{k}}=\frac{1}{(n-k+1)}
$$

then rearrange, we have

$$
A_{n}(\varphi)=\frac{n}{n-k+1} A_{n}(f) A_{n}(g)-\frac{1}{n-k+1} \sum_{j=1}^{k-1} A_{n}\left(\varphi_{j}\right)
$$

where $\varphi_{j}\left(x_{1}, \ldots, x_{k-1}\right)=f\left(x_{1}, \ldots, x_{k-1}\right) g\left(x_{j}\right)$. Applying (4.7.2) to $\varphi, f$, $g$, and all the $\varphi_{j}$ gives

$$
E\left(f\left(X_{1}, \ldots, X_{k-1}\right) g\left(X_{k}\right) \mid \mathcal{E}\right)=E\left(f\left(X_{1}, \ldots, X_{k-1}\right) \mid \mathcal{E}\right) E\left(g\left(X_{k}\right) \mid \mathcal{E}\right)
$$

It follows by induction that

$$
E\left(\prod_{j=1}^{k} f_{j}\left(X_{j}\right) \mid \mathcal{E}\right)=\prod_{j=1}^{k} E\left(f_{j}\left(X_{j}\right) \mid \mathcal{E}\right)
$$

When the $X_{i}$ take values in a nice space, there is a regular conditional distribution for ( $X_{1}, X_{2}, \ldots$ ) given $\mathcal{E}$, and the sequence can be represented as a mixture of i.i.d. sequences. Hewitt and Savage (1956) call the sequence presentable in this case. For the usual measure theoretic problems, the last result is not valid when the $X_{i}$ take values in an arbitrary measure space. See Dubins and Freedman (1979) and Freedman (1980) for counterexamples.

The simplest special case of Theorem 4.7.9 occurs when the $X_{i} \in \{0,1\}$. In this case
Theorem 4.7.10. If $X_{1}, X_{2} \ldots$ are exchangeable and take values in $\{0,1\}$ then there is a probability distribution on $[0,1]$ so that

$$
P\left(X_{1}=1, \ldots, X_{k}=1, X_{k+1}=0, \ldots, X_{n}=0\right)=\int_{0}^{1} \theta^{k}(1-\theta)^{n-k} d F(\theta)
$$

This result is useful for people concerned about the foundations of statistics (see Section 3.7 of Savage (1972)), since from the palatable assumption of symmetry one gets the powerful conclusion that the sequence is a mixture of i.i.d. sequences. Theorem 4.7.10 has been proved in a variety of different ways. See Feller, Vol. II (1971), p. 228-229 for a proof that is related to the moment problem. Diaconis and Freedman (1980) have a nice proof that starts with the trivial observation that the distribution of a finite exchangeable sequence $X_{m}, 1 \leq m \leq n$ has the form $p_{0} H_{0, n}+\cdots+p_{n} H_{n, n}$ where $H_{m, n}$ is "drawing without replacement from an urn with $m$ ones and $n-m$ zeros." If $m \rightarrow \infty$ and $m / n \rightarrow p$ then $H_{m, n}$ approaches product measure with density $p$. Theorem 4.7.10 follows easily from this, and one can get bounds on the rate of convergence.

## Exercises

4.7.1. Show that if a backwards martingale has $X_{0} \in L^{p}$ the convergence occurs in $L^{p}$.
4.7.2. Prove the backwards analogue of Theorem 4.6.10. Suppose $Y_{n} \rightarrow Y_{-\infty}$ a.s. as $n \rightarrow-\infty$ and $\left|Y_{n}\right| \leq Z$ a.s. where $E Z<\infty$. If $\mathcal{F}_{n} \downarrow \mathcal{F}_{-\infty}$, then $E\left(Y_{n} \mid \mathcal{F}_{n}\right) \rightarrow E\left(Y_{-\infty} \mid \mathcal{F}_{-\infty}\right)$ a.s.
4.7.3. Prove directly from the definition that if $X_{1}, X_{2}, \ldots \in\{0,1\}$ are exchangeable

$$
P\left(X_{1}=1, \ldots, X_{k}=1 \mid S_{n}=m\right)=\binom{n-k}{n-m} /\binom{n}{m}
$$

4.7.4. If $X_{1}, X_{2}, \ldots \in \mathbf{R}$ are exchangeable with $E X_{i}^{2}<\infty$ then $E\left(X_{1} X_{2}\right) \geq$ 0 .
4.7.5. Use the first few lines of the proof of Lemma 4.7.7 to conclude that if $X_{1}, X_{2}, \ldots$ are i.i.d. with $E X_{i}=\mu$ and $\operatorname{var}\left(X_{i}\right)=\sigma^{2}<\infty$ then

$$
\binom{n}{2}^{-1} \sum_{1 \leq i<j \leq n}\left(X_{i}-X_{j}\right)^{2} \rightarrow 2 \sigma^{2}
$$

### 4.8 Optional Stopping Theorems

In this section, we will prove a number of results that allow us to conclude that if $X_{n}$ is a submartingale and $M \leq N$ are stopping times, then $E X_{M} \leq E X_{N}$. Example 4.2.13 shows that this is not always true, but Exercise 4.4.2 shows this is true if $N$ is bounded, so our attention will be focused on the case of unbounded $N$.

Theorem 4.8.1. If $X_{n}$ is a uniformly integrable submartingale then for any stopping time $N, X_{N \wedge n}$ is uniformly integrable.

As in Theorem 4.2.5, the last result implies one for supermartingales with $\geq$ and one for martingales with $=$. This is true for the next two theorems as well.

Proof. $X_{n}^{+}$is a submartingale, so Theorem 4.4.1 implies $E X_{N \wedge n}^{+} \leq E X_{n}^{+}$. Since $X_{n}^{+}$is uniformly integrable, it follows from the remark after the definition that

$$
\sup _{n} E X_{N \wedge n}^{+} \leq \sup _{n} E X_{n}^{+}<\infty
$$

Using the martingale convergence theorem (4.2.11) now gives $X_{N \wedge n} \rightarrow X_{N}$ a.s. (here $X_{\infty}=\lim _{n} X_{n}$ ) and $E\left|X_{N}\right|<\infty$. With this established, the rest is easy. We write

$$
\begin{aligned}
E\left(\left|X_{N \wedge n}\right| ;\left|X_{N \wedge n}\right|>K\right)=E & \left(\left|X_{N}\right| ;\left|X_{N}\right|>K, N \leq n\right) \\
& +E\left(\left|X_{n}\right| ;\left|X_{n}\right|>K, N>n\right)
\end{aligned}
$$

Since $E\left|X_{N}\right|<\infty$ and $X_{n}$ is uniformly integrable, if $K$ is large then each term is $<\epsilon / 2$.

From the last computation in the proof of Theorem 4.8.1, we get:
Theorem 4.8.2. If $E\left|X_{N}\right|<\infty$ and $X_{n} 1_{(N>n)}$ is uniformly integrable, then $X_{N \wedge n}$ is uniformly integrable and hence $E X_{0} \leq E X_{N}$.

Theorem 4.8.3. If $X_{n}$ is a uniformly integrable submartingale then for any stopping time $N \leq \infty$, we have $E X_{0} \leq E X_{N} \leq E X_{\infty}$, where $X_{\infty}= \lim X_{n}$.

Proof. Theorem 4.4.1 implies $E X_{0} \leq E X_{N \wedge n} \leq E X_{n}$. Letting $n \rightarrow \infty$ and observing that Theorem 4.8.1 and 4.6.4 imply $X_{N \wedge n} \rightarrow X_{N}$ and $X_{n} \rightarrow X_{\infty}$ in $L^{1}$ gives the desired result.

The next result does not require uniform integrability.
Theorem 4.8.4. If $X_{n}$ is a nonnegative supermartingale and $N \leq \infty$ is a stopping time, then $E X_{0} \geq E X_{N}$ where $X_{\infty}=\lim X_{n}$, which exists by Theorem 4.2.12.

Proof. Using Theorem 4.4.1 and Fatou's Lemma,

$$
E X_{0} \geq \liminf _{n \rightarrow \infty} E X_{N \wedge n} \geq E X_{N}
$$

The next result is useful in some situations.
Theorem 4.8.5. Suppose $X_{n}$ is a submartingale and $E\left(\left|X_{n+1}-X_{n}\right| \mid \mathcal{F}_{n}\right) \leq B$ a.s. If $N$ is a stopping time with $E N<\infty$ then $X_{N \wedge n}$ is uniformly integrable and hence $E X_{N} \geq E X_{0}$.

Proof. We begin by observing that

$$
\left|X_{N \wedge n}\right| \leq\left|X_{0}\right|+\sum_{m=0}^{\infty}\left|X_{m+1}-X_{m}\right| 1_{(N>m)}
$$

To prove uniform integrability, it suffices to show that the right-hand side has finite expectation for then $\left|X_{N \wedge n}\right|$ is dominated by an integrable r.v. Now, $\{N>m\} \in \mathcal{F}_{m}$, so
$E\left(\left|X_{m+1}-X_{m}\right| ; N>m\right)=E\left(E\left(\left|X_{m+1}-X_{m}\right| \mid \mathcal{F}_{m}\right) ; N>m\right) \leq B P(N>m)$ and $E \sum_{m=0}^{\infty}\left|X_{m+1}-X_{m}\right| 1_{(N>m)} \leq B \sum_{m=0}^{\infty} P(N>m)=B E N< \infty$.

### 4.8.1 Applications to random walks

Let $\xi_{1}, \xi_{2}, \ldots$ be i.i.d., $S_{n}=S_{0}+\xi_{1}+\cdots+\xi_{n}$, where $S_{0}$ is a constant, and let $\mathcal{F}_{n}=\sigma\left(\xi_{1}, \ldots, \xi_{n}\right)$. We will now derive some result by using the three martingales from Section 4.2.

Linear martingale. If we let $\mu=E \xi_{i}$ then $X_{n}=S_{n}-n \mu$ is a martingale. (See Example 4.2.1.)

Using the linear martingale with Theorem 4.8.5 gives
Theorem 4.8.6. Wald's equation. If $\xi_{1}, \xi_{2}, \ldots$ are i.i.d. with $E \xi_{i}=\mu$, $S_{n}=\xi_{1}+\cdots+\xi_{n}$ and $N$ is a stopping time with $E N<\infty$ then $E S_{N}= \mu E N$.

Proof. Let $X_{n}=S_{n}-n \mu$ and note that $E\left(\left|X_{n+1}-X_{n}\right| \mid \mathcal{F}_{n}\right)=E \mid \xi_{i}- \mu \mid$.

Quadratic martingale. Suppose $E \xi_{i}=0$ and $E \xi_{i}^{2}=\sigma^{2} \in(0, \infty)$. Then $X_{n}=S_{n}-n \sigma^{2}$ is a martingale. (See Example 4.2.2.)

Exponential martingale. Suppose that $\phi(\theta)=E \exp \left(\theta \xi_{i}\right)<\infty$. Then $X_{n}=\exp \left(\theta S_{n}\right) / \phi(\theta)^{n}$ is martingale. (See Example 4.2.3.)

Theorem 4.8.7. Symmetric simple random walk refers to the special case in which $P\left(\xi_{i}=1\right)=P\left(\xi_{i}=-1\right)=1 / 2$. Suppose $S_{0}=x$ and let $N=\min \left\{n: S_{n} \notin(a, b)\right\}$. Writing a subscript $x$ to remind us of the starting point

$$
\text { (a) } \quad P_{x}\left(S_{N}=a\right)=\frac{b-x}{b-a} \quad P_{x}\left(S_{N}=b\right)=\frac{x-a}{b-a}
$$

(b) $E_{0} N=-a b$ and hence $E_{x} N=(b-x)(x-a)$.

Let $T_{x}=\min \left\{n: S_{n}=x\right\}$. Taking $a=0, x=1$ and $b=M$ we have

$$
P_{1}\left(T_{M}<T_{0}\right)=\frac{1}{M} \quad P_{1}\left(T_{M}<T_{0}\right)=\frac{M-1}{M}
$$

The first result proves (4.4.1). Letting $M \rightarrow \infty$ in the second we have $P_{1}\left(T_{0}<\infty\right)=1$.

Proof. (a) To see that $P(N<\infty)=1$ note that if we have $(b-a)$ consecutive steps of size +1 we will exit the interval. From this it follows that

$$
P(N>m(b-a)) \leq\left(1-2^{-(b-a)}\right)^{m}
$$

so $E N<\infty$.
Clearly $E\left|S_{N}\right|<\infty$ and $S_{n} 1_{\{N>n\}}$ are uniformly integrable so using Theorem 4.8.2 and we have

$$
x=E S_{N}=a P_{x}\left(S_{N}=a\right)+b\left[1-P_{x}\left(S_{N}=a\right)\right]
$$

Rearranging we have $P_{x}\left(S_{N}=a\right)=(b-x) /(b-a)$ subtracting this from $1, P_{x}\left(S_{N}=b\right)=(x-a) /(b-a)$.
(b) The second result is an immediate consequence of the first.

Using the stopping theorem for the bounded stopping time $N \wedge n$ we hae

$$
0=E_{0} S_{N \wedge n}^{2}-E_{0}(N \wedge n)
$$

The monotone convergence theorem implies that $E_{0}(N \wedge N) \uparrow E_{0} N$. Using the bounded convergence theorem and the result of (a) with $x=0$ implies

$$
\begin{aligned}
E_{0} S_{N \wedge n}^{2} & \rightarrow a^{2} \frac{b}{b-a}+b^{2} \frac{-a}{b-a} \\
& =-a b\left[\frac{-a}{b-a}+\frac{b}{b-a}\right]=-a b
\end{aligned}
$$

which completes the proof.
Remark. The reader should study the technique in this proof of (b) because it is useful in a number of situations. We apply Theorem 4.4.1 to the bounded stopping time $T_{b} \wedge n$, then let $n \rightarrow \infty$, and use an appropriate convergence theorem.
Theorem 4.8.8. Let $S_{n}$ be symmetric random walk with $S_{0}=0$ and let $T_{1}=\min \left\{n: S_{n}=1\right\}$.

$$
E s^{T_{1}}=\frac{1-\sqrt{1-s^{2}}}{s}
$$

Inverting the generating function we find

$$
\begin{equation*}
P\left(T_{1}=2 n-1\right)=\frac{1}{2 n-1} \cdot \frac{(2 n)!}{n!n!} 2^{-2 n} \tag{4.8.1}
\end{equation*}
$$

Proof. We will use the exponential martingale $X_{n}=\exp \left(\theta S_{n}\right) / \phi(\theta)^{n}$ with $\theta>0$. The remark after Theorem 4.8.7 implies $P_{0}\left(T_{1}<\infty\right)=1$.

$$
\phi(\theta)=E \exp \left(\theta \xi_{i}\right)=\left(e^{\theta}+e^{-\theta}\right) / 2
$$

$\phi(0)=1, \phi^{\prime}(0)=0$ and $\phi^{\prime \prime}(\theta)>0$ so if $\theta>0$ then $\phi(\theta)>1$. This implies $X_{N \wedge n} \in\left[0, e^{\theta}\right]$ and it follows form the bounded convergence theorem that

$$
1=E X\left(T_{1}\right) \quad \text { and hence } \quad e^{-\theta}=E\left(\phi(\theta)^{-T_{1}}\right)
$$

To convert this into the formula for the generating function we set

$$
\phi(\theta)=\frac{e^{\theta}+e^{-\theta}}{2}=1 / s
$$

Letting $x=e^{\theta}$ and doing some algebra we want $x+x^{-1}=2 / s$ or

$$
s x^{2}-2 x+s=0
$$

The quadratic equation implies

$$
x=\frac{2 \pm \sqrt{4-4 s^{2}}}{2 s}=\frac{1 \pm \sqrt{1-s^{2}}}{s}
$$

Since $E s^{T_{1}}=\sum_{k=1}^{\infty} s^{k} P\left(T_{1}=k\right)$ we want the solution that is 0 when $s=0$, which is $\left(1-\sqrt{1-s^{2}}\right) / s$.

To invert the generating function we we use Newton's binomial formula

$$
(1+t)^{a}=1+\binom{a}{1} t+\binom{a}{2} t^{2}+\binom{a}{3} t^{3}+\ldots
$$

where $\binom{x}{r}=x(x-1) \ldots(x-r+1) / r!$. Taking $t=-s^{2}$ and $a=1 / 2$ we have

$$
\begin{aligned}
\sqrt{1-s^{2}} & =1-\binom{1 / 2}{1} s^{2}+\binom{1 / 2}{2} s^{4}-\binom{1 / 2}{3} s^{6}+\ldots \\
\frac{1-\sqrt{1-s^{2}}}{s} & =\binom{1 / 2}{1} s-\binom{1 / 2}{2} s^{3}+\binom{1 / 2}{3} s^{5}+\ldots
\end{aligned}
$$

The coefficient of $s^{2 n-1}$ is

$$
\begin{aligned}
(-1)^{n-1} \frac{(1 / 2)(-1 / 2) \cdots(3-2 n) / 2}{n!} & =\frac{1 \cdot 3 \cdots(2 n-3)}{n!} \cdot 2^{-n} \\
& =\frac{1}{2 n-1} \frac{(2 n)!}{n!n!} 2^{-2 n}
\end{aligned}
$$

which completes the proof.

Theorem 4.8.9. Asymmetric simple random walk refers to the special case in which $P\left(\xi_{i}=1\right)=p$ and $P\left(\xi_{i}=-1\right)=q \equiv 1-p$ with $p \neq q$.
(a) If $\varphi(y)=\{(1-p) / p\}^{y}$ then $\varphi\left(S_{n}\right)$ is a martingale.
(b) If we let $T_{z}=\inf \left\{n: S_{n}=z\right\}$ then for $a<x<b$

$$
\begin{equation*}
P_{x}\left(T_{a}<T_{b}\right)=\frac{\varphi(b)-\varphi(x)}{\varphi(b)-\varphi(a)} \quad P_{x}\left(T_{b}<T_{a}\right)=\frac{\varphi(x)-\varphi(a)}{\varphi(b)-\varphi(a)} \tag{4.8.2}
\end{equation*}
$$

For the last two parts suppose $1 / 2<p<1$.
(c) If $a<0$ then $P\left(\min _{n} S_{n} \leq a\right)=P\left(T_{a}<\infty\right)=\{(1-p) / p\}^{-a}$.
(d) If $b>0$ then $P\left(T_{b}<\infty\right)=1$ and $E T_{b}=b /(2 p-1)$.

Proof. Since $S_{n}$ and $\xi_{n+1}$ are independent, Example 4.1.7 implies that on $\left\{S_{n}=m\right\}$,

$$
\begin{aligned}
E\left(\varphi\left(S_{n+1}\right) \mid \mathcal{F}_{n}\right) & =p \cdot\left(\frac{1-p}{p}\right)^{m+1}+(1-p)\left(\frac{1-p}{p}\right)^{m-1} \\
& =\{1-p+p\}\left(\frac{1-p}{p}\right)^{m}=\varphi\left(S_{n}\right)
\end{aligned}
$$

which proves (a).
Let $N=T_{a} \wedge T_{b}$. Since $\varphi\left(S_{N \wedge n}\right)$ is bounded, Theorem 4.8.2 implies

$$
\varphi(x)=E \varphi\left(S_{N}\right)=P_{x}\left(T_{a}<T_{b}\right) \varphi(a)+\left[1-P_{x}\left(T_{a}<T_{a}\right)\right] \varphi(b)
$$

Rearranging gives the formula for $P_{x}\left(T_{a}<T_{b}\right)$, subtract from 1 gives the one for $P_{x}\left(T_{b}<T_{a}\right)$.

Letting $b \rightarrow \infty$ and noting $\varphi(b) \rightarrow 0$ gives the result in (c), since $T_{a}<\infty$ if and only if $T_{a}<T_{b}$ for some $b$. To start to prove ( $d$ ) we note that $\varphi(a) \rightarrow \infty$ as $a \rightarrow-\infty$, so $P\left(T_{b}<\infty\right)=1$. For the second conclusion, we note that $X_{n}=S_{n}-(p-q) n$ is a martingale. Since $T_{b} \wedge n$ is a bounded stopping time, Theorem 4.4.1 implies

$$
0=E\left(S_{T_{b} \wedge n}-(p-q)\left(T_{b} \wedge n\right)\right)
$$

Now $b \geq S_{T_{b} \wedge n} \geq \min _{m} S_{m}$ and (c) implies $E\left(\inf _{m} S_{m}\right)>-\infty$, so the dominated convergence theorem implies $E S_{T_{b} \wedge n} \rightarrow E S_{T_{b}}$ as $n \rightarrow \infty$. The monotone convergence theorem implies $E\left(T_{b} \wedge n\right) \uparrow E T_{b}$, so we have $b=(p-q) E T_{b}$.

Example 4.8.10. A gambler is playing roulette and betting $\$ 1$ on black each time. The probability she wins $\$ 1$ is $18 / 38$, and the probability she loses $\$ 1$ is $20 / 38$. Calculate the probability that starting with $\$ 20$ she reaches $\$ 40$ before losing her money.
$(1-p) / p)=20 / 18$ so using (4.8.2) we have

$$
\begin{aligned}
P_{20}\left(T_{40}<T_{0}\right) & =\frac{(10 / 9)^{20}-1}{(10 / 9)^{40}-1} \\
& =\frac{8.225-1}{67.655-1}=0.1083
\end{aligned}
$$

## Exercises

4.8.1. Generalize Theorem 4.8.2 to show that if $L \leq M$ are stopping times and $Y_{M \wedge n}$ is a uniformly integrable submartingale, then $E Y_{L} \leq E Y_{M}$ and

$$
Y_{L} \leq E\left(Y_{M} \mid \mathcal{F}_{L}\right)
$$

4.8.2. If $X_{n} \geq 0$ is a supermartingale then $P\left(\sup X_{n}>\lambda\right) \leq E X_{0} / \lambda$.
4.8.3. Let $S_{n}=\xi_{1}+\cdots+\xi_{n}$ where the $\xi_{i}$ are independent with $E \xi_{i}=0$ and $\operatorname{var}\left(X_{i}\right)=\sigma^{2} . S_{n}^{2}-n \sigma^{2}$ is a martingale. Let $T=\min \left\{n:\left|S_{n}\right|>a\right\}$. Use Theorem 4.8.2 to show that $E T \geq a^{2} / \sigma^{2}$.
4.8.4. Wald's second equation. Let $S_{n}=\xi_{1}+\cdots+\xi_{n}$ where the $\xi_{i}$ are independent with $E \xi_{i}=0$ and $\operatorname{var}\left(\xi_{i}\right)=\sigma^{2}$. Use the martingale from the previous problem to show that if $T$ is a stopping time with $E T<\infty$ then $E S_{T}^{2}=\sigma^{2} E T$.
4.8.5. Variance of the time of gambler's ruin. Let $\xi_{1}, \xi_{2}, \ldots$ be independent with $P\left(\xi_{i}=1\right)=p$ and $P\left(\xi_{i}=-1\right)=q=1-p$ where $p<1 / 2$. Let $S_{n}=S_{0}+\xi_{1}+\cdots+\xi_{n}$ and let $V_{0}=\min \left\{n \geq 0: S_{n}=0\right\}$. Theorem 4.8.9 tells us that $E_{x} V_{0}=x /(1-2 p)$. The aim of this problem is to compute the variance of $V_{0}$. If we let $Y_{i}=\xi_{i}-(p-q)$ and note that $E Y_{i}=0$ and

$$
\operatorname{var}\left(Y_{i}\right)=\operatorname{var}\left(X_{i}\right)=E X_{i} u^{2}-\left(E X_{i}\right)^{2}
$$

then it follows that $\left(S_{n}-(p-q) n\right)^{2}-n\left(1-(p-q)^{2}\right)$ is a martingale. (a) Use this to conclude that when $S_{0}=x$ the variance of $V_{0}$ is

$$
x \cdot \frac{1-(p-q)^{2}}{(q-p)^{3}}
$$

(b) Why must the answer in (a) be of the form $c x$ ?
4.8.6. Generating function of the time of gambler's ruin. Continue with the set-up of the previous problem. (a) Use the exponential martingale and our stopping theorem to conclude that if $\theta \leq 0$, then $e^{\theta x}= E_{x}\left(\phi(\theta)^{-V_{0}}\right)$. (b) Let $0<s<1$. Solve the equation $\phi(\theta)=1 / s$, then use (a) to conclude

$$
E_{x}\left(s^{V_{0}}\right)=\left(\frac{1-\sqrt{1-4 p q s^{2}}}{2 p s}\right)^{x}
$$

(c) Why must the answer in (b) be of the form $f(s)^{x}$ ?
4.8.7. Let $S_{n}$ be a symmetric simple random walk starting at 0 , and let $T=\inf \left\{n: S_{n} \notin(-a, a)\right\}$ where $a$ is an integer. Find constants $b$ and $c$ so that $Y_{n}=S_{n}^{4}-6 n S_{n}^{2}+b n^{2}+c n$ is a martingale, and use this to compute $E T^{2}$.
4.8.8. Let $S_{n}=\xi_{1}+\cdots+\xi_{n}$ be a random walk. Suppose $\varphi\left(\theta_{o}\right)= E \exp \left(\theta_{o} \xi_{1}\right)=1$ for some $\theta_{o}<0$ and $\xi_{i}$ is not constant. In this special case of the exponetial martingale $X_{n}=\exp \left(\theta_{o} S_{n}\right)$ is a martingale. Let $\tau=\inf \left\{n: S_{n} \notin(a, b)\right\}$ and $Y_{n}=X_{n \wedge T}$. Use Theorem 4.8.2 to conclude that $E X_{\tau}=1$ and $P\left(S_{\tau} \leq a\right) \leq \exp \left(-\theta_{o} a\right)$.
4.8.9. Continuing with the set-up of the previous problem, suppose the $\xi_{i}$ are integer valued with $P\left(\xi_{i}<-1\right)=0, P\left(\xi_{i}=-1\right)>0$ and $E \xi_{i}>0$. Let $T=\inf \left\{n: S_{n}=a\right\}$ with $a<0$. Use the martingale $X_{n}=\exp \left(\theta_{o} S_{n}\right)$ to conclude that $P(T<\infty)=\exp \left(-\theta_{o} a\right)$.
4.8.10. Consider a favorable game in which the payoffs are $-1,1$, or 2 with probability $1 / 3$ each. Use the results of the previous problem to compute the probability we ever go broke (i.e, our winnings $W_{n}$ reach $\$ 0$ ) when we start with $\$ i$.
4.8.11. Let $S_{n}$ be the total assets of an insurance company at the end of year $n$. In year $n$, premiums totaling $c>0$ are received and claims $\zeta_{n}$ are paid where $\zeta_{n}$ is $\operatorname{Normal}\left(\mu, \sigma^{2}\right)$ and $\mu<c$. To be precise, if $\xi_{n}=c-\zeta_{n}$ then $S_{n}=S_{n-1}+\xi_{n}$. The company is ruined if its assets drop to 0 or less. Show that if $S_{0}>0$ is nonrandom, then

$$
P(\text { ruin }) \leq \exp \left(-2(c-\mu) S_{0} / \sigma^{2}\right)
$$

### 4.9 Combinatorics of simple random walk*

In the last section, we proved some results for simple random walks using martingales. In this section we will delve deeper into their properties using combinatorial arguments. We will not be using martingales but this section is a good transition to the study of Markov chains in the next chapter.

To facilitate discussion, we will think of the sequence $S_{0}, S_{1}, S_{2}, \ldots, S_{n}$ as being represented by a polygonal line with segments $\left(k-1, S_{k-1}\right) \rightarrow$ ( $k, S_{k}$ ). A path is a polygonal line that is a possible outcome of simple random walk. To count the number of paths from $(0,0)$ to $(n, x)$, it is convenient to introduce $a$ and $b$ defined by: $a=(n+x) / 2$ is the number of positive steps in the path and $b=(n-x) / 2$ is the number of negative steps. Notice that $n=a+b$ and $x=a-b$. If $-n \leq x \leq n$ and $n-x$ is even, the $a$ and $b$ defined above are nonnegative integers, and the number
of paths from $(0,0)$ to $(n, x)$ is

$$
\begin{equation*}
N_{n, x}=\binom{n}{a} \tag{4.9.1}
\end{equation*}
$$

Otherwise, the number of paths is 0 .

![](https://cdn.mathpix.com/cropped/886c9149-6650-4f34-867d-452deeaaf80a-027.jpg?height=293&width=849&top_left_y=661&top_left_x=670)
Figure 4.5: Reflection Principle

Theorem 4.9.1. Reflection principle. If $x, y>0$ then the number of paths from $(0, x)$ to $(n, y)$ that are 0 at some time is equal to the number of paths from $(0,-x)$ to $(n, y)$.

Proof. Suppose $\left(0, s_{0}\right),\left(1, s_{1}\right), \ldots,\left(n, s_{n}\right)$ is a path from $(0, x)$ to $(n, y)$. Let $K=\inf \left\{k: s_{k}=0\right\}$. Let $s_{k}^{\prime}=-s_{k}$ for $k \leq K, s_{k}^{\prime}=s_{k}$ for $K \leq k \leq n$. Then $\left(k, s_{k}^{\prime}\right), 0 \leq k \leq n$, is a path from ( $0,-x$ ) to ( $n, y$ ). Conversely, if $\left(0, t_{0}\right),\left(1, t_{1}\right), \ldots,\left(n, t_{n}\right)$ is a path from $(0,-x)$ to $(n, y)$ then it must cross 0 . Let $K=\inf \left\{k: t_{k}=0\right\}$. Let $t_{k}^{\prime}=-t_{k}$ for $k \leq K$, $t_{k}^{\prime}=t_{k}$ for $K \leq k \leq n$. Then $\left(k, t_{k}^{\prime}\right), 0 \leq k \leq n$, is a path from ( $0,-x$ ) to $(n, y)$ that is 0 at time $K$. The last two observations set up a one-to-one correspondence between the two classes of paths, so their numbers must be equal. $\square$

From Theorem 4.9.1 we get a result first proved in 1878.
Theorem 4.9.2. The Ballot Theorem. Suppose that in an election candidate $A$ gets $\alpha$ votes, and candidate $B$ gets $\beta$ votes where $\beta<\alpha$. The probability that throughout the counting $A$ always leads $B$ is ( $\alpha- \beta) /(\alpha+\beta)$.

Proof. Let $x=\alpha-\beta, n=\alpha+\beta$. Clearly, there are as many such outcomes as there are paths from $(1,1)$ to $(n, x)$ that are never 0 . The reflection principle implies that the number of paths from $(1,1)$ to $(n, x)$ that are 0 at some time the number of paths from $(1,-1)$ to $(n, x)$, so by
(4.9.1) the number of paths from $(1,1)$ to $(n, x)$ that are never 0 is

$$
\begin{aligned}
N_{n-1, x-1}-N_{n-1, x+1} & =\binom{n-1}{\alpha-1}-\binom{n-1}{\alpha} \\
& =\frac{(n-1)!}{(\alpha-1)!(n-\alpha)!}-\frac{(n-1)!}{\alpha!(n-\alpha-1)!} \\
& =\frac{\alpha-(n-\alpha)}{n} \cdot \frac{n!}{\alpha!(n-\alpha)!}=\frac{\alpha-\beta}{\alpha+\beta} N_{n, x}
\end{aligned}
$$

since $n=\alpha+\beta$, this proves the desired result.
Using the ballot theorem, we can compute the distribution of the time to hit 0 for simple random walk.

Lemma 4.9.3. $P\left(S_{1} \neq 0, \ldots, S_{2 n} \neq 0\right)=P\left(S_{2 n}=0\right)$.
Proof. $P\left(S_{1}>0, \ldots, S_{2 n}>0\right)=\sum_{r=1}^{\infty} P\left(S_{1}>0, \ldots, S_{2 n-1}>0, S_{2 n}=\right. 2 r$ ). From the proof of Theorem 4.9.2, we see that the number of paths from $(0,0)$ to $(2 n, 2 r)$ that are never 0 at positive times $(=$ the number of paths from ( 1,1 ) to ( $2 n, 2 r$ ) that are never 0 ) is

$$
N_{2 n-1,2 r-1}-N_{2 n-1,2 r+1}
$$

If we let $p_{n, x}=P\left(S_{n}=x\right)$ then this implies

$$
P\left(S_{1}>0, \ldots, S_{2 n-1}>0, S_{2 n}=2 r\right)=\frac{1}{2}\left(p_{2 n-1,2 r-1}-p_{2 n-1,2 r+1}\right)
$$

Summing from $r=1$ to $\infty$ gives

$$
P\left(S_{1}>0, \ldots, S_{2 n}>0\right)=\frac{1}{2} p_{2 n-1,1}=\frac{1}{2} P\left(S_{2 n}=0\right)
$$

Symmetry implies $P\left(S_{1}<0, \ldots, S_{2 n}<0\right)=(1 / 2) P\left(S_{2 n}=0\right)$, and the proof is complete.

Let $R=\inf \left\{m \geq 1: S_{m}=0\right\}$. Combining Lemma 4.9.3 with the central limit theorem for the binomial distribution, Theorem 3.1.2, gives

$$
\begin{equation*}
P(R>2 n)=P\left(S_{2 n}=0\right) \sim \pi^{-1 / 2} n^{-1 / 2} \tag{4.9.2}
\end{equation*}
$$

Since $P(R>x) / P(|R|>x)=1$, it follows from Theorem 3.8.8 that $R$ is in the domain of attraction of the stable law with $\alpha=1 / 2$ and $\kappa=1$. This implies that if $R_{n}$ is the time of the $n$th return to 0 then $R_{n} / n^{2} \Rightarrow Y$, the indicated stable law. In Example 3.8.5, we considered $\tau=T_{1}$ where $T_{x}=\inf \left\{n: S_{n}=x\right\}$. Since $S_{1} \in\{-1,1\}$ and $T_{1}={ }_{d} T_{-1}$, $R={ }_{d} 1+T_{1}$, and it follows that $T_{n} / n^{2} \Rightarrow Y$, the same stable law. In Example 8.1.12, we will use this observation to show that the limit has
the same distribution as the hitting time of 1 for Brownian motion, which has a density given in (7.4.6).

From (4.9.2) we get

$$
\begin{aligned}
P\left(T_{1}=2 n-1\right) & =P(R=2 n)=P(R>2 n-2)-P(R>2 n) \\
& =\frac{(2 n-2)!}{(n-1)!(n-1)!} 2^{-2(n-1)}-\frac{(2 n)!}{n!n!} 2^{-2 n} \\
& =\frac{(2 n)!}{n!n!} 2^{-2 n}\left(\frac{n \cdot n}{(2 n-1) \cdot 2 n} \cdot 4-1\right) \\
& =\frac{1}{2 n-1} \frac{(2 n)!}{n!n!} 2^{-2 n} \sim \frac{1}{2} \pi^{-1 / 2} n^{-3 / 2}
\end{aligned}
$$

This completes our discussion of visits to 0 . We turn now to the arcsine laws. The first one concerns

$$
L_{2 n}=\sup \left\{m \leq 2 n: S_{m}=0\right\}
$$

It is remarkably easy to compute the distribution of $L_{2 n}$.
Lemma 4.9.4. Let $u_{2 m}=P\left(S_{2 m}=0\right)$. Then $P\left(L_{2 n}=2 k\right)=u_{2 k} u_{2 n-2 k}$.
Proof. $P\left(L_{2 n}=2 k\right)=P\left(S_{2 k}=0, S_{2 k+1} \neq 0, \ldots, S_{2 n} \neq 0\right)$, so the desired result follows from Lemma 4.9.3.

Theorem 4.9.5. Arcsine law for the last visit to 0 . For $0<a< b<1$,

$$
P\left(a \leq L_{2 n} / 2 n \leq b\right) \rightarrow \int_{a}^{b} \pi^{-1}(x(1-x))^{-1 / 2} d x
$$

To see the reason for the name, substitute $y=x^{1 / 2}, d y=(1 / 2) x^{-1 / 2} d x$ in the integral to obtain

$$
\int_{\sqrt{a}}^{\sqrt{b}} \frac{2}{\pi}\left(1-y^{2}\right)^{-1 / 2} d y=\frac{2}{\pi}\{\arcsin (\sqrt{b})-\arcsin (\sqrt{a})\}
$$

Since $L_{2 n}$ is the time of the last zero before $2 n$, it is surprising that the answer is symmetric about $1 / 2$. The symmetry of the limit distribution implies

$$
P\left(L_{2 n} / 2 n \leq 1 / 2\right) \rightarrow 1 / 2
$$

In gambling terms, if two people were to bet $\$ 1$ on a coin flip every day of the year, then with probability $1 / 2$, one of the players will be ahead from July 1 to the end of the year, an event that would undoubtedly cause the other player to complain about his bad luck.

Proof of Theorem 4.9.5. From the asymptotic formula for $u_{2 n}$, it follows that if $k / n \rightarrow x$ then

$$
n P\left(L_{2 n}=2 k\right) \rightarrow \pi^{-1}(x(1-x))^{-1 / 2}
$$

To get from this to the desired result, we let $2 n a_{n}=$ the smallest even integer $\geq 2 n a$, let $2 n b_{n}=$ the largest even integer $\leq 2 n b$, and let $f_{n}(x)= n P\left(L_{2 n}=k\right)$ for $2 k / 2 n \leq x<2(k+1) / 2 n$ so we can write

$$
P\left(a \leq L_{2 n} / 2 n \leq b\right)=\sum_{k=n a_{n}}^{n b_{n}} P\left(L_{2 n}=2 k\right)=\int_{a_{n}}^{b_{n}+1 / n} f_{n}(x) d x
$$

Our first result implies that uniformly on compact sets

$$
f_{n}(x) \rightarrow f(x)=\pi^{-1}(x(1-x))^{-1 / 2}
$$

The uniformity of the convergence implies

$$
\sup _{a_{n} \leq x \leq b_{n}+1 / n} f_{n}(x) \rightarrow \sup _{a \leq x \leq b} f(x)<\infty
$$

if $0<a \leq b<1$, so the bounded convergence theorem gives

$$
\int_{a_{n}}^{b_{n}+1 / n} f_{n}(x) d x \rightarrow \int_{a}^{b} f(x) d x
$$

The next result deals directly with the amount of time one player is ahead.

Theorem 4.9.6. Arcsine law for time above 0 . Let $\pi_{2 n}$ be the number of segments $\left(k-1, S_{k-1}\right) \rightarrow\left(k, S_{k}\right)$ that lie above the axis (i.e., in $\{(x, y): y \geq 0\}$ ), and let $u_{m}=P\left(S_{m}=0\right)$.

$$
P\left(\pi_{2 n}=2 k\right)=u_{2 k} u_{2 n-2 k}
$$

and consequently, if $0<a<b<1$

$$
P\left(a \leq \pi_{2 n} / 2 n \leq b\right) \rightarrow \int_{a}^{b} \pi^{-1}(x(1-x))^{-1 / 2} d x
$$

Remark. Since $\pi_{2 n}={ }_{d} L_{2 n}$, the second conclusion follows from the proof of Theorem 4.9.5. The reader should note that the limiting density $\pi^{-1}(x(1-x))^{-1 / 2}$ has a minimum at $x=1 / 2$, and $\rightarrow \infty$ as $x \rightarrow 0$ or 1. An equal division of steps between the positive and negative side is therefore the least likely possibility, and completely one-sided divisions have the highest probability.

Proof. Let $\beta_{2 k, 2 n}$ denote the probability of interest. We will prove $\beta_{2 k, 2 n}= u_{2 k} u_{2 n-2 k}$ by induction. When $n=1$, it is clear that

$$
\beta_{0,2}=\beta_{2,2}=1 / 2=u_{0} u_{2}
$$

For a general $n$, first suppose $k=n$. From the proof of Lemma 4.9.3, we have

$$
\begin{aligned}
\frac{1}{2} u_{2 n} & =P\left(S_{1}>0, \ldots, S_{2 n}>0\right) \\
& =P\left(S_{1}=1, S_{2}-S_{1} \geq 0, \ldots, S_{2 n}-S_{1} \geq 0\right) \\
& =\frac{1}{2} P\left(S_{1} \geq 0, \ldots, S_{2 n-1} \geq 0\right) \\
& =\frac{1}{2} P\left(S_{1} \geq 0, \ldots, S_{2 n} \geq 0\right)=\frac{1}{2} \beta_{2 n, 2 n}
\end{aligned}
$$

The next to last equality follows from the observation that if $S_{2 n-1} \geq 0$ then $S_{2 n-1} \geq 1$, and hence $S_{2 n} \geq 0$.

The last computation proves the result for $k=n$. Since $\beta_{0,2 n}=\beta_{2 n, 2 n}$, the result is also true when $k=0$. Suppose now that $1 \leq k \leq n-1$. In this case, if $R$ is the time of the first return to 0 , then $R=2 m$ for some $m$ with $0<m<n$. Letting $f_{2 m}=P(R=2 m)$ and breaking things up according to whether the first excursion was on the positive or negative side gives

$$
\beta_{2 k, 2 n}=\frac{1}{2} \sum_{m=1}^{k} f_{2 m} \beta_{2 k-2 m, 2 n-2 m}+\frac{1}{2} \sum_{m=1}^{n-k} f_{2 m} \beta_{2 k, 2 n-2 m}
$$

Using the induction hypothesis, it follows that

$$
\beta_{2 k, 2 n}=\frac{1}{2} u_{2 n-2 k} \sum_{m=1}^{k} f_{2 m} u_{2 k-2 m}+\frac{1}{2} u_{2 k} \sum_{m=1}^{n-k} f_{2 m} u_{2 n-2 k-2 m}
$$

By considering the time of the first return to 0 , we see

$$
u_{2 k}=\sum_{m=1}^{k} f_{2 m} u_{2 k-2 m} \quad u_{2 n-2 k}=\sum_{m=1}^{n-k} f_{2 m} u_{2 n-2 k-2 m}
$$

and the desired result follows.

## Exercises

4.9.1. Let $a \in S, f_{n}=P_{a}\left(T_{a}=n\right)$, and $u_{n}=P_{a}\left(X_{n}=a\right)$. (i) Show that $u_{n}=\sum_{1 \leq m \leq n} f_{m} u_{n-m}$. (ii) Let $u(s)=\sum_{n \geq 0} u_{n} s^{n}, f(s)=\sum_{n \geq 1} f_{n} s^{n}$, and show $u(s)=1 /(1-f(s))$.

## Chapter 5

## Markov Chains

The main object of study in this chapter is (temporally homogeneous) Markov chains. These processes are important because the assumptions iare satisfied in many examples and leads to a rich and detailed theory.

### 5.1 Examples

We begin with the case of countable state space. In thi siutation the Markov property is that for any states $i_{0}, \ldots i_{n-1}, i$ and $j$

$$
P\left(X_{n+1}=j \mid X_{n}=i, X_{n-1}=i_{n-1}, \ldots X_{0}=i_{0}\right)=P\left(X_{n+1}=j \mid X_{n}=i\right)
$$

In words, given the present state the rest of the past is irrelevant for predicting the future. In this section we will introduce a number of examples. In each case, we will not check the Markov property, but simply give the transition probability

$$
p(i, j)=P\left(X_{n+1}=j \mid X_{n}=i\right)
$$

and leave the rest to the reader. In the next section we will be more formal.

Example 5.1.1. Random walk. Let $\xi_{1}, \xi_{2}, \ldots \in \mathbf{Z}^{d}$ be independent with distribution $\mu$. Let $X_{n}=X_{0}+\xi_{1}+\cdots+\xi_{n}$, where $X_{0}$ is constant. Then $X_{n}$ is a Markov chain with transition probability.

$$
p(i, j)=\mu(\{j-i\})
$$

Example 5.1.2. Branching processes. $S=\{0,1,2, \ldots\}$

$$
p(i, j)=P\left(\sum_{m=1}^{i} \xi_{m}=j\right)
$$

where $\xi_{1}, \xi_{2}, \ldots$ are i.i.d. nonnegative integer-valued random variables. In words each of the $i$ individuals at time $n$ (or in generation $n$ ) gives birth to an independent and identically distributed number of offspring.

The first two chains are not good examples because, as we will see, they do not converge to equilibrium.

![](https://cdn.mathpix.com/cropped/886c9149-6650-4f34-867d-452deeaaf80a-034.jpg?height=297&width=437&top_left_y=483&top_left_x=859)
Figure 5.1: Physical motivation for the Ehrenfest chain.

Example 5.1.3. Ehrenfest chain. $S=\{0,1, \ldots, r\}$

$$
\begin{aligned}
& p(k, k+1)=(r-k) / r \\
& p(k, k-1)=k / r \\
& p(i, j)=0 \quad \text { otherwise }
\end{aligned}
$$

In words, there is a total of $r$ balls in two urns; $k$ in the first and $r-k$ in the second. We pick one of the $r$ balls at random and move it to the other urn. Ehrenfest used this to model the division of air molecules between two chambers (of equal size and shape) that are connected by a small hole.

Example 5.1.4. Wright-Fisher model. Thinking of a population of $N / 2$ diploid individuals who have two copies of each of their chromosomes, or of $N$ haploid individuals who have one copy, we consider a fixed population of $N$ genes that can be one of two types: $A$ or $a$. In the simplest version of this model the population at time $n+1$ is obtained by drawing with replacement from the population at time $n$. In this case, if we let $X_{n}$ be the number of $A$ alleles at time $n$, then $X_{n}$ is a Markov chain with transition probability

$$
p(i, j)=\binom{N}{j}\left(\frac{i}{N}\right)^{j}\left(1-\frac{i}{N}\right)^{N-j}
$$

since the right-hand side is the binomial distribution for $N$ independent trials with success probability $i / N$.

In this model the states $x=0$ and $N$ that correspond to fixation of the population in the all $a$ or all $A$ states are absorbing states, that is, $p(x, x)=1$. As we will see this chain will eventually end up in state 0 or state $N$. To make this simple model more interesting, we introduce
mutations. That is, an $A$ that is drawn ends up being an $a$ in the next generation with probability $u$, while an $a$ that is drawn ends up being an $A$ in the next generation with probability $v$. In this case the probability an $A$ is produced by a given draw is

$$
\rho_{i}=\frac{i}{N}(1-u)+\frac{N-i}{N} v
$$

but the transition probability still has the binomial form

$$
p(i, j)=\binom{N}{j}\left(\rho_{i}\right)^{j}\left(1-\rho_{i}\right)^{N-j}
$$

If $u$ and $v$ are both positive, then 0 and $N$ are no longer absorbing states, so the system can converge to an equilibrium distribution as time $t \rightarrow \infty$ ?

Example 5.1.5. $\mathrm{M} / \mathrm{G} / \mathbf{1}$ queue. In this model, customers arrive according to a Poisson process with rate $\lambda$. (M is for Markov and refers to the fact that in a Poisson process the number of arrivals in disjoint time intervals is independent.) Each customer requires an independent amount of service with distribution $F$. (G is for general service distribution. 1 indicates that there is one server.) Let $X_{n}$ be the number of customers waiting in the queue at the time the $n$th customer enters service. To be precise, when $X_{0}=x$, the chain starts with $x$ people waiting in line and customer 0 just beginning her service. To understand the definition the picture in Figure 5.2 is useful:

![](https://cdn.mathpix.com/cropped/886c9149-6650-4f34-867d-452deeaaf80a-035.jpg?height=244&width=936&top_left_y=1486&top_left_x=603)
Figure 5.2: Realization of the $\mathrm{M} / \mathrm{G} / 1$ queue. Black dots indicate the times at which the customers enter service.

To define our Markov chain $X_{n}$, let

$$
a_{k}=\int_{0}^{\infty} e^{-\lambda t} \frac{(\lambda t)^{k}}{k!} d F(t)
$$

be the probability that $k$ customers arrive during a service time. Let $\xi_{1}, \xi_{2}, \ldots$ be i.i.d. with $P\left(\xi_{i}=k-1\right)=a_{k}$. We think of $\xi_{i}$ as the net number of customers to arrive during the $i$ th service time, subtracting one for the customer who completed service. We define $X_{n}$ by

$$
\begin{equation*}
X_{n+1}=\left(X_{n}+\xi_{n+1}\right)^{+} \tag{5.1.1}
\end{equation*}
$$

The positive part only takes effect when $X_{n}=0$ and $\xi_{n+1}=-1$ (e.g., $X_{2}=0, \xi_{3}=-1$ in Figure 5.2) and reflects the fact that when the queue has size 0 and no one arrives during the service time the next queue size is 0 , since we do not start counting until the next customer arrives and then the queue length will be 0 .

It is easy to see that the sequence defined in (5.1.1) is a Markov chain with transition probability

$$
\begin{aligned}
& p(0,0)=a_{0}+a_{1} \\
& p(j, j-1+k)=a_{k} \quad \text { if } j \geq 1 \text { or } k>1
\end{aligned}
$$

The formula for $a_{k}$ is rather complicated, and its exact form is not important, so we will simplify things by assuming only that $a_{k}>0$ for all $k \geq 0$ and $\sum_{k \geq 0} a_{k}=1$.

## Exercises

5.1.1. Let $\xi_{1}, \xi_{2}, \ldots$ be i.i.d. $\in\{1,2, \ldots, N\}$ and taking each value with probability $1 / N$. Show that $X_{n}=\left|\left\{\xi_{1}, \ldots, \xi_{n}\right\}\right|$ is a Markov chain and compute its transition probability.
5.1.2. Let $\xi_{1}, \xi_{2}, \ldots$ be i.i.d. $\in\{-1,1\}$, taking each value with probability $1 / 2$. Let $S_{0}=0, S_{n}=\xi_{1}+\cdots \xi_{n}$ and $X_{n}=\max \left\{S_{m}: 0 \leq m \leq n\right\}$. Show that $X_{n}$ is not a Markov chain.
5.1.3. Let $\xi_{0}, \xi_{1}, \ldots$ be i.i.d. $\in\{H, T\}$, taking each value with probability $1 / 2$. Show that $X_{n}=\left(\xi_{n}, \xi_{n+1}\right)$ is a Markov chain and compute its transition probability $p$. What is $p^{2}$ ?
5.1.4. Brother-sister mating. In this scheme, two animals are mated, and among their direct descendants two individuals of opposite sex are selected at random. These animals are mated and the process continues. Suppose each individual can be one of three genotypes $A A, A a, a a$, and suppose that the type of the offspring is determined by selecting a letter from each parent. With these rules, the pair of genotypes in the $n$th generation is a Markov chain with six states:

$$
A A, A A \quad A A, A a \quad A A, a a \quad A a, A a \quad A a, a a \quad a a, a a
$$

Compute its transition probability.
5.1.5. Bernoulli-Laplace model of diffusion. Suppose two urns, which we will call left and right, have $m$ balls each. $b$ (which we will assume is $\leq m$ ) balls are black, and $2 m-b$ are white. At each time, we pick one ball from each urn and interchange them. Let the state at time $n$ be the number of black balls in the left urn. Compute the transition probability.
5.1.6. Let $\theta, U_{1}, U_{2}, \ldots$ be independent and uniform on ( 0,1 ). Let $X_{i}=1$ if $U_{i} \leq \theta,=-1$ if $U_{i}>\theta$, and let $S_{n}=X_{1}+\cdots+X_{n}$. In words, we first pick $\theta$ according to the uniform distribution and then flip a coin with probability $\theta$ of heads to generate a random walk. Compute $P\left(X_{n+1}=1 \mid X_{1}, \ldots, X_{n}\right)$ and conclude $S_{n}$ is a temporally inhomogeneous Markov chain. This is due to the fact that " $S_{n}$ is a sufficient statistic for estimating $\theta$."

### 5.2 Construction, Markov Properties

Let $(S, \mathcal{S})$ be a measurable space. This will be the state space for our Markov chain.

A function $p: S \times \mathcal{S} \rightarrow \mathbf{R}$ is said to be a transition probability if:
(i) For each $x \in S, A \rightarrow p(x, A)$ is a probability measure on ( $S, \mathcal{S}$ ).
(ii) For each $A \in \mathcal{S}, x \rightarrow p(x, A)$ is a measurable function.

We say $X_{n}$ is a Markov chain (w.r.t. $\mathcal{F}_{n}$ ) with transition probability $p$ if

$$
P\left(X_{n+1} \in B \mid \mathcal{F}_{n}\right)=p\left(X_{n}, B\right)
$$

Given a transition probability $p$ and an initial distribution $\mu$ on ( $S, \mathcal{S}$ ), we can define a consistent set of finite dimensional distributions by

$$
\begin{align*}
P\left(X_{j} \in B_{j}, 0 \leq j \leq n\right)= & \int_{B_{0}} \mu\left(d x_{0}\right) \int_{B_{1}} p\left(x_{0}, d x_{1}\right) \\
& \cdots \int_{B_{n}} p\left(x_{n-1}, d x_{n}\right) \tag{5.2.1}
\end{align*}
$$

If we suppose that ( $S, \mathcal{S}$ ) is nice, Kolmogorov's extenson theorem, Theorem 2.1.21, allows us to construct a probability measure $P_{\mu}$ on sequence space

$$
\left(\Omega_{o}, \mathcal{F}_{\infty}\right)=\left(S^{\{0,1, \ldots\}}, \mathcal{S}^{\{0,1, \ldots\}}\right)
$$

so that the coordinate maps $X_{n}(\omega)=\omega_{n}$ have the desired distributions. Note that we have one set of very simple random variables, and a large family of measures, one for each initial condition. Of course we only need one measure for each state since

$$
P_{\mu}(A)=\int \mu(d x) P_{x}(A)
$$

An advantage of building the chain on this canonical probability space is that we can define the shift operators by

$$
\theta_{n}\left(\omega_{0}, \omega_{1}, \ldots\right)=\left(\omega_{n}, \omega_{n+1}, \ldots\right)
$$

Our next step is to show

Theorem 5.2.1. $X_{n}$ is a Markov chain (with respect to $\mathcal{F}_{n}=\sigma\left(X_{0}, X_{1}, \ldots, X_{n}\right)$ ) with transition probability $p$. That is,

$$
P_{\mu}\left(X_{n+1} \in B \mid \mathcal{F}_{n}\right)=p\left(X_{n}, B\right)
$$

Proof. To prove this, we let $A=\left\{X_{0} \in B_{0}, X_{1} \in B_{1}, \ldots, X_{n} \in B_{n}\right\}$, $B_{n+1}=B$, and observe that using the definition of the integral, the definition of $A$, and the definition of $P_{\mu}$

$$
\begin{aligned}
& \int_{A} 1_{\left(X_{n+1} \in B\right)} d P_{\mu}=P_{\mu}\left(A, X_{n+1} \in B\right) \\
& \quad=P_{\mu}\left(X_{0} \in B_{0}, X_{1} \in B_{1}, \ldots, X_{n} \in B_{n}, X_{n+1} \in B\right) \\
& \quad=\int_{B_{0}} \mu\left(d x_{0}\right) \int_{B_{1}} p\left(x_{0}, d x_{1}\right) \cdots \int_{B_{n}} p\left(x_{n-1}, d x_{n}\right) p\left(x_{n}, B_{n+1}\right)
\end{aligned}
$$

We would like to assert that the last expression is

$$
=\int_{A} p\left(X_{n}, B\right) d P_{\mu}
$$

To do this, we begin by noting that for any $C \in \mathcal{S}$

$$
\int_{B_{0}} \mu\left(d x_{0}\right) \int_{B_{1}} p\left(x_{0}, d x_{1}\right) \cdots \int_{B_{n}} p\left(x_{n-1}, d x_{n}\right) 1_{C}\left(x_{n}\right)=\int_{A} 1_{C}\left(X_{n}\right) d P_{\mu}
$$

Linearity implies that for simple functions,

$$
\int_{B_{0}} \mu\left(d x_{0}\right) \int_{B_{1}} p\left(x_{0}, d x_{1}\right) \cdots \int_{B_{n}} p\left(x_{n-1}, d x_{n}\right) f\left(x_{n}\right)=\int_{A} f\left(X_{n}\right) d P_{\mu}
$$

and the bounded convergence theorem implies that it is valid for bounded measurable $f$, e.g., $f(x)=p\left(x, B_{n+1}\right)$.

The collection of sets for which

$$
\int_{A} 1_{\left(X_{n+1} \in B\right)} d P_{\mu}=\int_{A} p\left(X_{n}, B\right) d P_{\mu}
$$

holds is a $\lambda$-system, and the collection for which it has been proved is a $\pi$-system, so it follows from the $\pi-\lambda$ theorem, Theorem 2.1.6, that the equality is true for all $A \in \mathcal{F}_{n}$. This shows that

$$
P\left(X_{n+1} \in B \mid \mathcal{F}_{n}\right)=p\left(X_{n}, B\right)
$$

and proves the desired result.
Our next small step is to show that if $X_{n}$ has transition probability $p$ then for any bounded measurable $f$

$$
\begin{equation*}
E\left(f\left(X_{n+1}\right) \mid \mathcal{F}_{n}\right)=\int p\left(X_{n}, d y\right) f(y) \tag{5.2.2}
\end{equation*}
$$

The desired conclusion is a consequence of the next result which will save us work in later proofs. Let $\mathcal{H}=$ the collection of bounded functions for which the identity holds.

Theorem 5.2.2. Monotone class theorem. Let $\mathcal{A}$ be a $\pi$-system that contains $\Omega$ and let $\mathcal{H}$ be a collection of real-valued functions that satisfies:
(i) If $A \in \mathcal{A}$, then $1_{A} \in \mathcal{H}$.
(ii) If $f, g \in \mathcal{H}$, then $f+g$, and $c f \in \mathcal{H}$ for any real number $c$.
(iii) If $f_{n} \in \mathcal{H}$ are nonnegative and increase to a bounded function $f$, then $f \in \mathcal{H}$.

Then $\mathcal{H}$ contains all bounded functions measurable with respect to $\sigma(\mathcal{A})$.
Proof. The assumption $\Omega \in \mathcal{A}$, (ii), and (iii) imply that $\mathcal{G}=\left\{A: 1_{A} \in\right. \mathcal{H}\}$ is a $\lambda$-system so by (i) and the $\pi-\lambda$ theorem, Theorem 2.1.6, $\mathcal{G} \supset \sigma(\mathcal{A})$. (ii) implies $\mathcal{H}$ contains all simple functions, and (iii) implies that $\mathcal{H}$ contains all bounded measurable functions.

To extend (5.2.2), we observe that familiar properties of conditional expectation and (5.2.2) imply

$$
\begin{aligned}
E\left(\prod_{m=0}^{n} f_{m}\left(X_{m}\right)\right) & =E E\left(\prod_{m=0}^{n} f_{m}\left(X_{m}\right) \mid \mathcal{F}_{n-1}\right) \\
& =E\left(\prod_{m=0}^{n-1} f_{m}\left(X_{m}\right) E\left(f_{n}\left(X_{n}\right) \mid \mathcal{F}_{n-1}\right)\right) \\
& =E\left(\prod_{m=0}^{n-1} f_{m}\left(X_{m}\right) \int p_{n-1}\left(X_{n-1}, d y\right) f_{n}(y)\right)
\end{aligned}
$$

The last integral is a bounded measurable function of $X_{n-1}$, so it follows by induction that if $\mu$ is the distribution of $X_{0}$, then

$$
\begin{align*}
E\left(\prod_{m=0}^{n} f_{m}\left(X_{m}\right)\right)= & \int \mu\left(d x_{0}\right) f_{0}\left(x_{0}\right) \int p_{0}\left(x_{0}, d x_{1}\right) f_{1}\left(x_{1}\right) \\
& \cdots \int p_{n-1}\left(x_{n-1}, d x_{n}\right) f_{n}\left(x_{n}\right) \tag{5.2.3}
\end{align*}
$$

Our next goal is to prove two extensions of the markov property in which $\left\{X_{n+1} \in B\right\}$ is replaced by a bounded function of the future, $h\left(X_{n}, X_{n+1}, \ldots\right)$, and $n$ is replaced by a stopping time $N$. These results, especially the second, will be the keys to developing the theory of Markov chains.

Theorem 5.2.3. The Markov property. Let $Y: \Omega_{o} \rightarrow \mathbf{R}$ be bounded and measurable.

$$
E_{\mu}\left(Y \circ \theta_{m} \mid \mathcal{F}_{m}\right)=E_{X_{m}} Y
$$

Remark. We denote the function by $Y$, a letter usually used for random variables, because that's exactly what $Y$ is, a measurable function defined
on our probability space $\Omega_{o}$. Here the subscript $\mu$ on the left-hand side indicates that the conditional expectation is taken with respect to $P_{\mu}$. The right-hand side is the function $\varphi(x)=E_{x} Y$ evaluated at $x=X_{m}$.

Proof. We begin by proving the result in a special case and then use the $\pi-\lambda$ and monotone class theorems to get the general result. Let $A= \left\{\omega: \omega_{0} \in A_{0}, \ldots, \omega_{m} \in A_{m}\right\}$ and $g_{0}, \ldots g_{n}$ be bounded and measurable. Applying (5.2.3) with $f_{k}=1_{A_{k}}$ for $k<m$, $f_{m}=1_{A_{m}} g_{0}$, and $f_{k}=g_{k-m}$ for $m<k \leq m+n$ gives

$$
\begin{aligned}
E_{\mu}\left(\prod_{k=0}^{n} g_{k}\left(X_{m+k}\right) ; A\right)= & \int_{A_{0}} \mu\left(d x_{0}\right) \int_{A_{1}} p\left(x_{0}, d x_{1}\right) \cdots \int_{A_{m}} p\left(x_{m-1}, d x_{m}\right) \\
& \cdot g_{0}\left(x_{m}\right) \int p\left(x_{m}, d x_{m+1}\right) g_{1}\left(x_{m+1}\right) \\
& \cdots \int p\left(x_{m+n-1}, d x_{m+n}\right) g_{n}\left(x_{m+n}\right) \\
= & E_{\mu}\left(E_{X_{m}}\left(\prod_{k=0}^{n} g_{k}\left(X_{k}\right)\right) ; A\right)
\end{aligned}
$$

The collection of sets for which the last formula holds is a $\lambda$-system, and the collection for which it has been proved is a $\pi$-system, so using the $\pi-\lambda$ theorem, Theorem 2.1.6, shows that the last identity holds for all $A \in \mathcal{F}_{m}$.

Fix $A \in \mathcal{F}_{m}$ and let $\mathcal{H}$ be the collection of bounded measurable $Y$ for which

$$
\begin{equation*}
E_{\mu}\left(Y \circ \theta_{m} ; A\right)=E_{\mu}\left(E_{X_{m}} Y ; A\right) \tag{*}
\end{equation*}
$$

The last computation shows that (*) holds when

$$
Y(\omega)=\prod_{0 \leq k \leq n} g_{k}\left(\omega_{k}\right)
$$

To finish the proof, we will apply the monotone class theorem, Theorem 5.2.2. Let $\mathcal{A}$ be the collection of sets of the form $\left\{\omega: \omega_{0} \in A_{0}, \ldots, \omega_{k} \in\right. \left.A_{k}\right\} . \mathcal{A}$ is a $\pi$-system, so taking $g_{k}=1_{A_{k}}$ shows (i) holds. $\mathcal{H}$ clearly has properties (ii) and (iii), so Theorem 5.2.2 implies that $\mathcal{H}$ contains the bounded functions measurable w.r.t $\sigma(\mathcal{A})$, and the proof is complete.

As corollary of Theorem 5.2.3 we get

## Theorem 5.2.4. Chapman-Kolmogorov equation.

$$
P_{x}\left(X_{m+n}=z\right)=\sum_{y} P_{x}\left(X_{m}=y\right) P_{y}\left(X_{n}=z\right)
$$

Intuitively, in order to go from $x$ to $z$ in $m+n$ steps we have to be at some $y$ at time $m$ and the Markov property implies that for a given $y$ the two parts of the journey are independent.

Proof. $P_{x}\left(X_{n+m}=z\right)=E_{x}\left(P_{x}\left(X_{n+m}=z \mid \mathcal{F}_{m}\right)\right)=E_{x}\left(P_{X_{m}}\left(X_{n}=z\right)\right)$ by the Markov property, Theorem 5.2.3 since $1_{\left(X_{n}=z\right)} \circ \theta_{m}=1_{\left(X_{n+m}=z\right)}$.

We are now ready for our second extension of the Markov property. Recall $N$ is said to be a stopping time if $\{N=n\} \in \mathcal{F}_{n}$. As in Chapter 4, let

$$
\mathcal{F}_{N}=\left\{A: A \cap\{N=n\} \in \mathcal{F}_{n} \text { for all } n\right\}
$$

be the information known at time $N$, and define the random shift operator

$$
\theta_{N} \omega= \begin{cases}\theta_{n} \omega & \text { on }\{N=n\} \\ \Delta & \text { on }\{N=\infty\}\end{cases}
$$

where $\Delta$ is an extra point that we add to $\Omega_{o}$. In the next result and its applications, we will explicitly restrict our attention to $\{N<\infty\}$, so the reader does not have to worry about the second part of the definition of $\theta_{N}$.

Theorem 5.2.5. Strong Markov property. Suppose that for each $n$, $Y_{n}: \Omega_{0} \rightarrow \mathbf{R}$ is measurable and $\left|Y_{n}\right| \leq M$ for all $n$. Then

$$
E_{\mu}\left(Y_{N} \circ \theta_{N} \mid \mathcal{F}_{N}\right)=E_{X_{N}} Y_{N} \text { on }\{N<\infty\}
$$

where the right-hand side is $\varphi(x, n)=E_{x} Y_{n}$ evaluated at $x=X_{N}, n=N$.
Proof. Let $A \in \mathcal{F}_{N}$. Breaking things down according to the value of $N$.

$$
E_{\mu}\left(Y_{N} \circ \theta_{N} ; A \cap\{N<\infty\}\right)=\sum_{n=0}^{\infty} E_{\mu}\left(Y_{n} \circ \theta_{n} ; A \cap\{N=n\}\right)
$$

Since $A \cap\{N=n\} \in \mathcal{F}_{n}$, using Theorem 5.2.3 now converts the right side into

$$
\sum_{n=0}^{\infty} E_{\mu}\left(E_{X_{n}} Y_{n} ; A \cap\{N=n\}\right)=E_{\mu}\left(E_{X_{N}} Y_{N} ; A \cap\{N<\infty\}\right)
$$

Remark. The reader should notice that the proof is trivial. All we do is break things down according to the value of $N$, replace $N$ by $n$, apply the Markov property, and reverse the process. This is the standard technique for proving results about stopping times.

Our first application of the strong Markov property will be the key to developments in the next section. Let $T_{y}^{0}=0$, and for $k \geq 1$, let

$$
T_{y}^{k}=\inf \left\{n>T_{y}^{k-1}: X_{n}=y\right\}
$$

$T_{y}^{k}$ is the time of the $k$ th return to $y$. The reader should note that $T_{y}^{1}>0$ so any visit at time 0 does not count. We adopt this convention so that if we let $T_{y}=T_{y}^{1}$ and $\rho_{x y}=P_{x}\left(T_{y}<\infty\right)$, then
Theorem 5.2.6. $P_{x}\left(T_{y}^{k}<\infty\right)=\rho_{x y} \rho_{y y}^{k-1}$.
Intuitively, in order to make $k$ visits to $y$, we first have to go from $x$ to $y$ and then return $k-1$ times to $y$.

Proof. When $k=1$, the result is trivial, so we suppose $k \geq 2$. Let $Y(\omega)=1$ if $\omega_{n}=y$ for some $n \geq 1, Y(\omega)=0$ otherwise. If $N=T_{y}^{k-1}$ then $Y \circ \theta_{N}=1$ if $T_{y}^{k}<\infty$. The strong Markov property, Theorem 5.2.5, implies

$$
E_{x}\left(Y \circ \theta_{N} \mid \mathcal{F}_{N}\right)=E_{X_{N}} Y \quad \text { on }\{N<\infty\}
$$

On $\{N<\infty\}, X_{N}=y$, so the right-hand side is $P_{y}\left(T_{y}<\infty\right)=\rho_{y y}$, and it follows that

$$
\begin{aligned}
P_{x}\left(T_{y}^{k}<\infty\right) & =E_{x}\left(Y \circ \theta_{N} ; N<\infty\right) \\
& =E_{x}\left(E_{x}\left(Y \circ \theta_{N} \mid \mathcal{F}_{N}\right) ; N<\infty\right) \\
& =E_{x}\left(\rho_{y y} ; N<\infty\right)=\rho_{y y} P_{x}\left(T_{y}^{k-1}<\infty\right)
\end{aligned}
$$

The result now follows by induction.
The next example illustrates the use of Theorem 5.2.5, and explains why we want to allow the $Y$ that we apply to the shifted path to depend on $n$.

Theorem 5.2.7. Reflection principle. Let $\xi_{1}, \xi_{2}, \ldots$ be independent and identically distributed with a distribution that is symmetric about 0 . Let $S_{n}=\xi_{1}+\cdots+\xi_{n}$. If $a>0$ then

$$
P\left(\sup _{m \leq n} S_{m} \geq a\right) \leq 2 P\left(S_{n} \geq a\right)
$$

We do the proof in two steps because that is how formulas like this are derived in practice. First, one computes intuitively and then figures out how to extract the desired formula from Theorem 5.2.5.

Proof in words. First note that if $Z$ has a distribution that is symmetric about 0 , then

$$
P(Z \geq 0) \geq P(Z>0)+\frac{1}{2} P(Z=0)=\frac{1}{2}
$$

If we let $N=\inf \left\{m \leq n: S_{m}>a\right\}$ (with $\inf \emptyset=\infty$ ), then on $\{N<\infty\}$, $S_{n}-S_{N}$ is independent of $S_{N}$ and has $P\left(S_{n}-S_{N} \geq 0\right) \geq 1 / 2$. So

$$
P\left(S_{n}>a\right) \geq \frac{1}{2} P(N \leq n)
$$

![](https://cdn.mathpix.com/cropped/886c9149-6650-4f34-867d-452deeaaf80a-043.jpg?height=396&width=705&top_left_y=320&top_left_x=726)
Figure 5.3: Proof by picture of the reflection principle.

Proof. Let $Y_{m}(\omega)=1$ if $m \leq n$ and $\omega_{n-m} \geq a, Y_{m}(\omega)=0$ otherwise. The definition of $Y_{m}$ is chosen so that $\left(Y_{N} \circ \theta_{N}\right)(\omega)=1$ if $\omega_{n} \geq a$ (and hence $N \leq n$ ), and $=0$ otherwise. The strong Markov property implies

$$
E_{0}\left(Y_{N} \circ \theta_{N} \mid \mathcal{F}_{N}\right)=E_{S_{N}} Y_{N} \quad \text { on }\{N<\infty\}=\{N \leq n\}
$$

To evaluate the right-hand side, we note that if $y>a$, then

$$
E_{y} Y_{m}=P_{y}\left(S_{n-m} \geq a\right) \geq P_{y}\left(S_{n-m} \geq y\right) \geq 1 / 2
$$

So integrating over $\{N \leq n\}$ and using the definition of conditional expectation gives

$$
\frac{1}{2} P(N \leq n) \leq E_{0}\left(E_{0}\left(Y_{N} \circ \theta_{N} \mid \mathcal{F}_{N}\right) ; N \leq n\right)=E_{0}\left(Y_{N} \circ \theta_{N} ; N \leq n\right)
$$

since $\{N \leq n\} \in \mathcal{F}_{N}$. Recalling that $Y_{N} \circ \theta_{N}=1_{\left\{S_{n} \geq a\right\}}$, the last quantity

$$
=E_{0}\left(1_{\left\{S_{n} \geq a\right\}} ; N \leq n\right)=P_{0}\left(S_{n} \geq a\right)
$$

since $\left\{S_{n}>a\right\} \subset\{N \leq n\}$. $\square$

## Exercises

5.2.1. Let $A \in \sigma\left(X_{0}, \ldots, X_{n}\right)$ and $B \in \sigma\left(X_{n}, X_{n+1}, \ldots\right)$. Use the Markov property to show that for any initial distribution $\mu$

$$
P_{\mu}\left(A \cap B \mid X_{n}\right)=P_{\mu}\left(A \mid X_{n}\right) P_{\mu}\left(B \mid X_{n}\right)
$$

In words, the past and future are conditionally independent given the present.
Hint: Write the left-hand side as $E_{\mu}\left(E_{\mu}\left(1_{A} 1_{B} \mid \mathcal{F}_{n}\right) \mid X_{n}\right)$.
5.2.2. Let $X_{n}$ be a Markov chain. Use Lévy's $0-1$ law to show that if

$$
P\left(\cup_{m=n+1}^{\infty}\left\{X_{m} \in B_{m}\right\} \mid X_{n}\right) \geq \delta>0 \quad \text { on }\left\{X_{n} \in A_{n}\right\}
$$

then $P\left(\left\{X_{n} \in A_{n}\right.\right.$ i.o. $\}-\left\{X_{n} \in B_{n}\right.$ i.o. $\left.\}\right)=0$.
5.2.3. A state $a$ is called absorbing if $P_{a}\left(X_{1}=a\right)=1$. Let $D=\left\{X_{n}=\right. a$ for some $n \geq 1\}$ and let $h(x)=P_{x}(D)$. Use the result of the previous exercise to conclude that $h\left(X_{n}\right) \rightarrow 0$ a.s. on $D^{c}$. Here a.s. means $P_{\mu}$ a.s. for any initial distribution $\mu$.

We will suppose throughout the rest of the exercises that $S$ is countable. Note that the times $V_{A}$ and $V_{x}$ of the first visit are $\inf$ over $n \geq 0$, while the hitting times $T_{A}$ and $T_{x}$ are $\inf$ over $n \geq 1$.
5.2.4. First entrance decomposition. Let $T_{y}=\inf \left\{n \geq 1: X_{n}=y\right\}$. Show that

$$
p^{n}(x, y)=\sum_{m=1}^{n} P_{x}\left(T_{y}=m\right) p^{n-m}(y, y)
$$

5.2.5. Show that $\sum_{m=0}^{n} P_{x}\left(X_{m}=x\right) \geq \sum_{m=k}^{n+k} P_{x}\left(X_{m}=x\right)$.
5.2.6. Let $T_{C}=\inf \left\{n \geq 1: X_{n} \in C\right\}$. Suppose that $S-C$ is finite and for each $x \in S-C P_{x}\left(T_{C}<\infty\right)>0$. Then there is an $N<\infty$ and $\epsilon>0$ so that for all $y \in S-C, P_{y}\left(T_{C}>k N\right) \leq(1-\epsilon)^{k}$.
5.2.7. Exit distributions. Let $V_{C}=\inf \left\{n \geq 0: X_{n} \in C\right\}$ and let $h(x)=P_{x}\left(V_{A}<V_{B}\right)$. Suppose $A \cap B=\emptyset, S-(A \cup B)$ is finite, and $P_{x}\left(V_{A \cup B}<\infty\right)>0$ for all $x \in S-(A \cup B)$. (i) Show that

$$
\begin{equation*}
h(x)=\sum_{y} p(x, y) h(y) \quad \text { for } x \notin A \cup B \tag{*}
\end{equation*}
$$

(ii) Show that if $h$ satisfies ( $*$ ) then $h\left(X\left(n \wedge V_{A \cup B}\right)\right)$ is a martingale. (iii) Use this and Exercise 5.2.6 to conclude that $h(x)=P_{x}\left(V_{A}<V_{B}\right)$ is the only solution of ( $*$ ) that is 1 on $A$ and 0 on $B$.
5.2.8. Let $X_{n}$ be a Markov chain with $S=\{0,1, \ldots, N\}$ and suppose that $X_{n}$ is a martingale. Let $V_{x}=\min \left\{n \geq 0: X_{n}=x\right\}$ and suppose $P_{x}\left(V_{0} \wedge V_{N}<\infty\right)>0$ for all $x$. Show $P_{x}\left(V_{N}<V_{0}\right)=x / N$.
5.2.9. Wright-Fisher model. Suppose $S=\{0,1, \ldots, N\}$ and consider

$$
p(i, j)=\binom{N}{j}(i / N)^{j}(1-i / N)^{N-j}
$$

Show that this chain satisfies the hypotheses of Exercise 5.2.8.
5.2.10. In brother-sister mating described in Exercise 5.1.4, $A A, A A$ and $a a, a a$ are absorbing states. Show that the number of $A$ 's in the pair is a martingale and use this to compute the probability of getting absorbed in $A A, A A$ starting from each of the states.
5.2.11. Exit Times. Let $V_{A}=\inf \left\{n \geq 0: X_{n} \in A\right\}$ and $g(x)=E_{x} V_{A}$. Suppose that $S-A$ is finite and for each $x \in S-A, P_{x}\left(V_{A}<\infty\right)>0$.
(i) Show that

$$
\begin{equation*}
g(x)=1+\sum_{y} p(x, y) g(y) \quad \text { for } x \notin A \tag{*}
\end{equation*}
$$

(ii) Show that if $g$ satisfies $(*), g\left(X\left(n \wedge V_{A}\right)\right)+n \wedge V_{A}$ is a martingale. (iii) Use this to conclude that $g(x)=E_{x} \tau_{A}$ is the only solution of (*) that is 0 on $A$.
5.2.12. In this problem we imagine that you are bored and start flipping a coin to see how many tosses $N(H H)$ you need until you get two heads in a row. Let $\xi_{0}, \xi_{1}, \ldots$ be i.i.d. $\in\{H, T\}$, taking each value with probability $1 / 2$, and let $X_{n}=\left(\xi_{n}, \xi_{n+1}\right)$ be the Markov chain from Exercise 5.1.3. Use the result of the previous exercise to compute $g(x)=$ the expected time to reach state $(H, H)$ starting from state $x$. The answer we want is

$$
E N(H H)=2+(1 / 4)[g(H<H)+g(H, T)+g(T, H)+g(T, T)]
$$

5.2.13. In this problem we consider the number of tosses $N(H H H)$ to get $H H H$, let $X_{n}$ be the number of consecutive heads we have after $n$ tosses. $X_{n}$ is a Markov chain with transition probability

|  | $\mathbf{0}$ | $\mathbf{1}$ | $\mathbf{2}$ | $\mathbf{3}$ |
| :---: | :---: | :---: | :---: | :---: |
| $\mathbf{0}$ | $1 / 2$ | $1 / 2$ | 0 | 0 |
| $\mathbf{1}$ | $1 / 2$ | 0 | $1 / 2$ | 0 |
| $\mathbf{2}$ | $1 / 2$ | 0 | 0 | $1 / 2$ |
| $\mathbf{3}$ | 0 | 0 | 0 | 1 |

Let $T_{3}$ be the time to reach state 3 . Use problem 5.2.11 to compute $E_{0} T_{3}$.

### 5.3 Recurrence and Transience

Let $T_{y}^{0}=0$, and for $k \geq 1$, let

$$
T_{y}^{k}=\inf \left\{n>T_{y}^{k-1}: X_{n}=y\right\}
$$

and recall (5.2.6)

$$
\rho_{x y}=P_{x}\left(T_{y}<\infty\right)
$$

A state $y$ is said to be recurrent if $\rho_{y y}=1$ and transient if $\rho_{y y}<1$. If $y$ is recurrent, Theorem 5.2.6 implies $P_{y}\left(T_{y}^{k}<\infty\right)=1$ for all $k$, so $P_{y}\left(X_{n}=y\right.$ i.o. $)=1$.

If $y$ is transient and we let $N(y)=\sum_{n=1}^{\infty} 1_{\left(X_{n}=y\right)}$ be the number of visits to $y$ at positive times, then

$$
\begin{align*}
E_{x} N(y) & =\sum_{k=1}^{\infty} P_{x}(N(y) \geq k)=\sum_{k=1}^{\infty} P_{x}\left(T_{y}^{k}<\infty\right) \\
& =\sum_{k=1}^{\infty} \rho_{x y} \rho_{y y}^{k-1}=\frac{\rho_{x y}}{1-\rho_{y y}}<\infty \tag{5.3.1}
\end{align*}
$$

Combining the last computation with our result for recurrent states gives
Theorem 5.3.1. $y$ is recurrent if and only if $E_{y} N(y)=\infty$.
The next result shows that recurrence is contagious.
Theorem 5.3.2. If $x$ is recurrent and $\rho_{x y}>0$ then $y$ is recurrent and $\rho_{y x}=1$.

Proof. We will first show $\rho_{y x}=1$ by showing that if $\rho_{x y}>0$ and $\rho_{y x}<1$ then $\rho_{x x}<1$. Let $K=\inf \left\{k: p^{k}(x, y)>0\right\}$. There is a sequence $y_{1}, \ldots, y_{K-1}$ so that

$$
p\left(x, y_{1}\right) p\left(y_{1}, y_{2}\right) \cdots p\left(y_{K-1}, y\right)>0
$$

Since $K$ is minimal, $y_{i} \neq x$ for $1 \leq i \leq K-1$. If $\rho_{y x}<1$, we have

$$
P_{x}\left(T_{x}=\infty\right) \geq p\left(x, y_{1}\right) p\left(y_{1}, y_{2}\right) \cdots p\left(y_{K-1}, y\right)\left(1-\rho_{y x}\right)>0
$$

a contradiction. So $\rho_{y x}=1$.
To prove that $y$ is recurrent, observe that $\rho_{y x}>0$ implies there is an $L$ so that $p^{L}(y, x)>0$. Now

$$
p^{L+n+K}(y, y) \geq p^{L}(y, x) p^{n}(x, x) p^{K}(x, y)
$$

Summing over $n$, we see

$$
\sum_{n=1}^{\infty} p^{L+n+K}(y, y) \geq p^{L}(y, x) p^{K}(x, y) \sum_{n=1}^{\infty} p^{n}(x, x)=\infty
$$

so Theorem 5.3.1 implies $y$ is recurrent.
The next fact will help us identify recurrent states in examples. First we need two definitions. $C$ is closed if $x \in C$ and $\rho_{x y}>0$ implies $y \in C$. The name comes from the fact that if $C$ is closed and $x \in C$ then $P_{x}\left(X_{n} \in C\right)=1$ for all $n$. $D$ is irreducible if $x, y \in D$ implies $\rho_{x y}>0$.

Theorem 5.3.3. Let $C$ be a finite closed set. Then $C$ contains a recurrent state. If $C$ is irreducible then all states in $C$ are recurrent.

Proof. In view of Theorem 5.3.2, it suffices to prove the first claim. Suppose it is false. Then for all $y \in C, \rho_{y y}<1$ and $E_{x} N(y)=\rho_{x y} /\left(1-\rho_{y y}\right)$, but this is ridiculous since it implies

$$
\infty>\sum_{y \in C} E_{x} N(y)=\sum_{y \in C} \sum_{n=1}^{\infty} p^{n}(x, y)=\sum_{n=1}^{\infty} \sum_{y \in C} p^{n}(x, y)=\sum_{n=1}^{\infty} 1
$$

The first inequality follows from the fact that $C$ is finite and the last equality from the fact that $C$ is closed.

To illustrate the use of the last result consider:
Example 5.3.4. A Seven-state chain. Consider the transition probability:

|  | $\mathbf{1}$ | $\mathbf{2}$ | $\mathbf{3}$ | $\mathbf{4}$ | $\mathbf{5}$ | $\mathbf{6}$ | $\mathbf{7}$ |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| $\mathbf{1}$ | .3 | 0 | 0 | 0 | .7 | 0 | 0 |
| $\mathbf{2}$ | .1 | .2 | .3 | .4 | 0 | 0 | 0 |
| $\mathbf{3}$ | 0 | 0 | .5 | .5 | 0 | 0 | 0 |
| $\mathbf{4}$ | 0 | 0 | 0 | .5 | 0 | .5 | 0 |
| $\mathbf{5}$ | .6 | 0 | 0 | 0 | .4 | 0 | 0 |
| $\mathbf{6}$ | 0 | 0 | 0 | .1 | 0 | .1 | .8 |
| $\mathbf{7}$ | 0 | 0 | 0 | 1 | 0 | 0 | 0 |

To identify the states that are recurrent and those that are transient, we begin by drawing a graph that will contain an arc from $i$ to $j$ if $p(i, j)>0$ and $i \neq j$. We do not worry about drawing the self-loops corresponding to states with $p(i, i)>0$ since such transitions cannot help the chain get somewhere new.

In the case under consideration we draw arcs from $1 \rightarrow 5,2 \rightarrow 1$, $2 \rightarrow 3,2 \rightarrow 4,3 \rightarrow 4,4 \rightarrow 6,4 \rightarrow 7,5 \rightarrow 1,6 \rightarrow 4,6 \rightarrow 7,7 \rightarrow 4$.

![](https://cdn.mathpix.com/cropped/886c9149-6650-4f34-867d-452deeaaf80a-047.jpg?height=235&width=553&top_left_y=1755&top_left_x=747)
Figure 5.4: Graph for the seven state chain.

(i) $\rho_{21}>0$ and $\rho_{12}=0$ so 2 must be transient, or we would contradict Theorem 5.3.2. Similarly, $\rho_{34}>0$ and $\rho_{43}=0$ so 3 must be transient
(ii) $\{1,5\}$ and $\{4,6,7\}$ are irreducible closed sets, so Theorem 5.3.3 implies these states are recurrent.

The last reasoning can be used to identify transient and recurrent states when $S$ is finite since for $x \in S$ either: (i) there is a $y$ with $\rho_{x y}>0$ and $\rho_{y x}=0$ and $x$ must be transient, or (ii) $\rho_{x y}>0$ implies $\rho_{y x}>0$. In case (ii), Exercise 5.3.2 implies $C_{x}=\left\{y: \rho_{x y}>0\right\}$ is an irreducible closed set. (If $y, z \in C_{x}$ then $\rho_{y z} \geq \rho_{y x} \rho_{x z}>0$. If $\rho_{y w}>0$ then $\rho_{x w} \geq \rho_{x y} \rho_{y w}>0$, so $w \in C_{x}$.) So Theorem 5.3.3 implies $x$ is recurrent.

Example 5.3.4 motivates the following:
Theorem 5.3.5. Decomposition theorem. Let $R=\left\{x: \rho_{x x}=1\right\}$ be the recurrent states of a Markov chain. $R$ can be written as $\cup_{i} R_{i}$, where each $R_{i}$ is closed and irreducible.

Remark. This result shows that for the study of recurrent states we can, without loss of generality, consider a single irreducible closed set.

Proof. If $x \in R$ let $C_{x}=\left\{y: \rho_{x y}>0\right\}$. By Theorem 5.3.2, $C_{x} \subset R$, and if $y \in C_{x}$ then $\rho_{y x}>0$. From this it follows easily that either $C_{x} \cap C_{y}=\emptyset$ or $C_{x}=C_{y}$. To prove the last claim, suppose $C_{x} \cap C_{y} \neq \emptyset$. If $z \in C_{x} \cap C_{y}$ then $\rho_{x y} \geq \rho_{x z} \rho_{z y}>0$, so if $w \in C_{y}$ we have $\rho_{x w} \geq \rho_{x y} \rho_{y w}>0$ and it follows that $C_{x} \supset C_{y}$. Interchanging the roles of $x$ and $y$ gives $C_{y} \supset C_{x}$, and we have proved our claim. If we let $R_{i}$ be a listing of the sets that appear as some $C_{x}$, we have the desired decomposition.

The rest of this section is devoted to examples. Specifically we concentrate on the question: How do we tell whether a state is recurrent or transient? Reasoning based on Theorem 5.3.2 works occasionally when $S$ is infinite.

Example 5.3.6. Branching process. If the probability of no children is positive then $\rho_{k 0}>0$ and $\rho_{0 k}=0$ for $k \geq 1$, so Theorem 5.3.3 implies all states $k \geq 1$ are transient. The state 0 has $p(0,0)=1$ and is recurrent. It is called an absorbing state to reflect the fact that once the chain enters 0 , it remains there for all time.

If $S$ is infinite and irreducible, all that Theorem 5.3.2 tells us is that either all the states are recurrent or all are transient, and we are left to figure out which case occurs.

Example 5.3.7. $M / G / 1$ queue. Let $\mu=\sum k a_{k}$ be the mean number of customers that arrive during one service time. We will now show that if $\mu>1$, the chain is transient (i.e., all states are), but if $\mu \leq 1$, it is recurrent. For the case $\mu>1$, we observe that if $\xi_{1}, \xi_{2}, \ldots$ are i.i.d. with $P\left(\xi_{m}=j\right)=a_{j+1}$ for $j \geq-1$ and $S_{n}=\xi_{1}+\cdots+\xi_{n}$, then $X_{0}+S_{n}$ and $X_{n}$ behave the same until time $N=\inf \left\{n: X_{0}+S_{n}=0\right\}$. When $\mu>1$, $E \xi_{m}=\mu-1>0$, so $S_{n} \rightarrow \infty$ a.s., and $\inf S_{n}>-\infty$ a.s. It follows from the last observation that if $x$ is large, $P_{x}(N<\infty)<1$, and the chain is transient.

To deal with the case $\mu \leq 1$, we observe that it follows from arguments in the last paragraph that $X_{n \wedge N}$ is a supermartingale. Let $T=\inf \{n: \left.X_{n} \geq M\right\}$. Since $X_{n \wedge N}$ is a nonnegative supermartingale, using Theorem 4.8.4 at time $\tau=T \wedge N$, and observing $X_{\tau} \geq M$ on $\{T<N\}, X_{\tau}=0$ on $\{N<T\}$ gives

$$
x \geq M P_{x}(T<N)
$$

Letting $M \rightarrow \infty$ shows $P_{x}(N<\infty)=1$, so the chain is recurrent.
Remark. There is another way of seeing that the $M / G / 1$ queue is transient when $\mu>1$. If we consider the customers that arrive during a person's service time to be her children, then we get a branching process. Results in Section 5.3 imply that when $\mu \leq 1$ the branching process dies out with probability one (i.e., the queue becomes empty), so the chain is recurrent. When $\mu>1$, Theorem 4.3.12 implies $P_{x}\left(T_{0}<\infty\right)=\rho^{x}$, where $\rho$ is the unique fixed point $\in(0,1)$ of the function $\varphi(\theta)=\sum_{k=0}^{\infty} a_{k} \theta^{k}$.

The next result encapsulates the techniques we used for birth and death chains and the $M / G / 1$ queue.
Theorem 5.3.8. Suppose $S$ is irreducible, and $\varphi \geq 0$ with $E_{x} \varphi\left(X_{1}\right) \leq \varphi(x)$ for $x \notin F$, a finite set, and $\varphi(x) \rightarrow \infty$ as $x \rightarrow \infty$, i.e., $\{x: \varphi(x) \leq M\}$ is finite for any $M<\infty$, then the chain is recurrent.
Proof. Let $\tau=\inf \left\{n>0: X_{n} \in F\right\}$. Our assumptions imply that $Y_{n}= \varphi\left(X_{n \wedge \tau}\right)$ is a supermartingale. Let $T_{M}=\inf \left\{n>0: X_{n} \in F\right.$ or $\varphi\left(X_{n}\right)> M\}$. Since $\{x: \varphi(x) \leq M\}$ is finite and the chain is irreducible, $T_{M}<\infty$ a.s. Using Theorem 4.8.4 4 now, we see that

$$
\varphi(x) \geq E_{x} \varphi\left(X_{T_{M}}\right) \geq M P_{x}\left(T_{M}<\tau\right)
$$

since $\varphi\left(X_{T_{M}}\right) \geq M$ when $T_{M}<\tau$. Letting $M \rightarrow \infty$, we see that $P_{x}(\tau< \infty)=1$ for all $x \notin F$. So $P_{y}\left(X_{n} \in F\right.$ i.o. $)=1$ for all $y \in S$, and since $F$ is finite, $P_{y}\left(X_{n}=z\right.$ i.o. $)=1$ for some $z \in F$.
Example 5.3.9. Birth and death chains on $\{0,1,2, \ldots\}$. Let

$$
p(i, i+1)=p_{i} \quad p(i, i-1)=q_{i} \quad p(i, i)=r_{i}
$$

where $q_{0}=0$. Let $N=\inf \left\{n: X_{n}=0\right\}$. To analyze this example, we are going to define a function $\varphi$ so that $\varphi\left(X_{N \wedge n}\right)$ is a martingale. We start by setting $\varphi(0)=0$ and $\varphi(1)=1$. For the martingale property to hold when $X_{n}=k \geq 1$, we must have

$$
\varphi(k)=p_{k} \varphi(k+1)+r_{k} \varphi(k)+q_{k} \varphi(k-1)
$$

Using $r_{k}=1-\left(p_{k}+q_{k}\right)$, we can rewrite the last equation as

$$
\begin{aligned}
& \quad q_{k}(\varphi(k)-\varphi(k-1))=p_{k}(\varphi(k+1)-\varphi(k)) \\
& \text { or } \quad \varphi(k+1)-\varphi(k)=\frac{q_{k}}{p_{k}}(\varphi(k)-\varphi(k-1))
\end{aligned}
$$

Here and in what follows, we suppose that $p_{k}, q_{k}>0$ for $k \geq 1$. Otherwise, the chain is not irreducible. Since $\varphi(1)-\varphi(0)=1$, iterating the last result gives

$$
\begin{array}{r}
\varphi(m+1)-\varphi(m)=\prod_{j=1}^{m} \frac{q_{j}}{p_{j}} \quad \text { for } m \geq 1 \\
\varphi(n)=\sum_{m=0}^{n-1} \prod_{j=1}^{m} \frac{q_{j}}{p_{j}} \quad \text { for } n \geq 1
\end{array}
$$

if we interpret the product as 1 when $m=0$. Let $T_{c}=\inf \left\{n \geq 1: X_{n}=\right. c\}$.

Theorem 5.3.10. If $a<x<b$ then

$$
P_{x}\left(T_{a}<T_{b}\right)=\frac{\varphi(b)-\varphi(x)}{\varphi(b)-\varphi(a)} \quad P_{x}\left(T_{b}<T_{a}\right)=\frac{\varphi(x)-\varphi(a)}{\varphi(b)-\varphi(a)}
$$

Proof. If we let $T=T_{a} \wedge T_{b}$ then $\varphi\left(X_{n \wedge T}\right)$ is a bounded martingale, so $\varphi(x)=E_{x} \varphi\left(X_{T}\right)$ by Theorem 4.8.2. Since $X_{T} \in\{a, b\}$ a.s.,

$$
\varphi(x)=\varphi(a) P_{x}\left(T_{a}<T_{b}\right)+\varphi(b)\left[1-P_{x}\left(T_{a}<T_{b}\right)\right]
$$

and solving gives the indicated formula.
Remark. The answer and the proof should remind the reader of our results for symmetric and asymetric simple random walk, which are special cases of this.

Letting $a=0$ and $b=M$ in Theorem 5.3.10 gives

$$
P_{x}\left(T_{0}>T_{M}\right)=\varphi(x) / \varphi(M)
$$

Letting $M \rightarrow \infty$ and observing that $T_{M} \geq M-x, P_{x}$ a.s. we have proved:
Theorem 5.3.11. 0 is recurrent if and only if $\varphi(M) \rightarrow \infty$ as $M \rightarrow \infty$, i.e.,

$$
\varphi(\infty) \equiv \sum_{m=0}^{\infty} \prod_{j=1}^{m} \frac{q_{j}}{p_{j}}=\infty
$$

If $\varphi(\infty)<\infty$ then $P_{x}\left(T_{0}=\infty\right)=\varphi(x) / \varphi(\infty)$.

## Exercises

5.3.1. Suppose $y$ is recurrent and for $k \geq 0$, let $R_{k}=T_{y}^{k}$ be the time of the $k$ th return to $y$, and for $k \geq 1$ let $r_{k}=R_{k}-R_{k-1}$ be the $k$ th interarrival time. Use the strong Markov property to conclude that under $P_{y}$, the vectors $v_{k}=\left(r_{k}, X_{R_{k-1}}, \ldots, X_{R_{k}-1}\right), k \geq 1$ are i.i.d.
5.3.2. Use the strong Markov property to show that $\rho_{x z} \geq \rho_{x y} \rho_{y z}$.
5.3.3. Show that in the Ehrenfest chain (Example 5.1.3), all states are recurrent.
5.3.4. To probe the boundary between recurrence and transience for birth and death chains, suppose $p_{j}=1 / 2+\epsilon_{j}$ where $\epsilon_{j} \sim C j^{-\alpha}$ as $j \rightarrow \infty$, and $q_{j}=1-p_{j}$. Show that (i) if $\alpha>10$ is recurrent, (ii) if $\alpha<10$ is transient, (iii) if $\alpha=1$ then 0 is transient if $C>1 / 4$ and recurrent if $C<1 / 4$.
5.3.5. Show that if we replace " $\varphi(x) \rightarrow \infty$ " by " $\varphi(x) \rightarrow 0$ " in the Theorem 5.3.8 and assume that $\varphi(x)>0$ for $x \in F$, then we can conclude that the chain is transient.
5.3.6. Let $X_{n}$ be a birth and death chain with $p_{j}-1 / 2 \sim C / j$ as $j \rightarrow \infty$ and $q_{j}=1-p_{j}$. (i) Show that if we take $C<1 / 4$ then we can pick $\alpha>0$ so that $\varphi(x)=x^{\alpha}$ satisfies the hypotheses of Theorem 5.3.8. (ii) Show that when $C>1 / 4$, we can take $\alpha<0$ and apply Exercise 5.3.5.
5.3.7. $f$ is said to be superharmonic if $f(x) \geq \sum_{y} p(x, y) f(y)$, or equivalently $f\left(X_{n}\right)$ is a supermartingale. Suppose $p$ is irreducible. Show that $p$ is recurrent if and only if every nonnegative superharmonic function is constant.
5.3.8. $\mathbf{M} / \mathbf{M} / \infty$ queue. Consider a telephone system with an infinite number of lines. Let $X_{n}=$ the number of lines in use at time $n$, and suppose

$$
X_{n+1}=\sum_{m=1}^{X_{n}} \xi_{n, m}+Y_{n+1}
$$

where the $\xi_{n, m}$ are i.i.d. with $P\left(\xi_{n, m}=1\right)=p$ and $P\left(\xi_{n, m}=0\right)=1-p$, and $Y_{n}$ is an independent i.i.d. sequence of Poisson mean $\lambda$ r.v.'s. In words, for each conversation we flip a coin with probability $p$ of heads to see if it continues for another minute. Meanwhile, a Poisson mean $\lambda$ number of conversations start between time $n$ and $n+1$. Use Theorem 5.3.8 with $\varphi(x)=x$ to show that the chain is recurrent for any $p<1$.

### 5.4 Recurrence of Random Walks*

Throughout this section, $S_{n}$ will be a random walk, i.e., $S_{n}=X_{1}+\cdots+X_{n}$ where $X_{1}, X_{2}, \ldots$ are i.i.d. The number $x \in \mathbf{R}^{d}$ is said to be a recurrent value for the random walk $S_{n}$ if for every $\epsilon>0, P\left(\left\|S_{n}-x\right\|<\epsilon\right.$ i.o. $)=1$. Here $\|x\|=\sup \left|x_{i}\right|$. The reader will see the reason for this choice of norm in the proof of Lemma 5.4.6. The Hewitt-Savage 0-1 law, Theorem 2.5.4, implies that if the last probability is $<1$, it is 0 . Our first result shows
that to know the set of recurrent values, it is enough to check $x=0$. A number $x$ is said to be a possible value of the random walk if for any $\epsilon>0$, there is an $n$ so that $P\left(\left\|S_{n}-x\right\|<\epsilon\right)>0$.

Theorem 5.4.1. The set $\mathcal{V}$ of recurrent values is either $\emptyset$ or a closed subgroup of $\mathbf{R}^{d}$. In the second case, $\mathcal{V}=\mathcal{U}$, the set of possible values.

Proof. Suppose $\mathcal{V} \neq \emptyset$. It is clear that $\mathcal{V}^{c}$ is open, so $\mathcal{V}$ is closed. To prove that $\mathcal{V}$ is a group, we will first show that
(*) if $x \in \mathcal{U}$ and $y \in \mathcal{V}$ then $y-x \in \mathcal{V}$.
This statement has been formulated so that once it is established, the result follows easily. Let

$$
p_{\delta, m}(z)=P\left(\left\|S_{n}-z\right\| \geq \delta \text { for all } n \geq m\right)
$$

If $y-x \notin \mathcal{V}$, there is an $\epsilon>0$ and $m \geq 1$ so that $p_{2 \epsilon, m}(y-x)>0$. Since $x \in \mathcal{U}$, there is a $k$ so that $P\left(\left\|S_{k}-x\right\|<\epsilon\right)>0$. Since

$$
P\left(\left\|S_{n}-S_{k}-(y-x)\right\| \geq 2 \epsilon \text { for all } n \geq k+m\right)=p_{2 \epsilon, m}(y-x)
$$

and is independent of $\left\{\left\|S_{k}-x\right\|<\epsilon\right\}$, it follows that

$$
p_{\epsilon, m+k}(y) \geq P\left(\left\|S_{k}-x\right\|<\epsilon\right) p_{2 \epsilon, m}(y-x)>0
$$

contradicting $y \in \mathcal{V}$, so $y-x \in \mathcal{V}$.
To conclude $\mathcal{V}$ is a group when $\mathcal{V} \neq \emptyset$, let $q, r \in \mathcal{V}$, and observe: (i) taking $x=y=r$ in ( $*$ ) shows $0 \in \mathcal{V}$, (ii) taking $x=r, y=0$ shows $-r \in \mathcal{V}$, and (iii) taking $x=-r, y=q$ shows $q+r \in \mathcal{V}$. To prove that $\mathcal{V}=\mathcal{U}$ now, observe that if $u \in \mathcal{U}$ taking $x=u, y=0$ shows $-u \in \mathcal{V}$ and since $\mathcal{V}$ is a group, it follows that $u \in \mathcal{V}$.

If $\mathcal{V}=\emptyset$, the random walk is said to be transient, otherwise it is called recurrent. Before plunging into the technicalities needed to treat a general random walk, we begin by analyzing the special case Polya considered in 1921. Legend has it that Polya thought of this problem while wandering around in a park near Zürich when he noticed that he kept encountering the same young couple. History does not record what the young couple thought.

## Example 5.4.2. Simple random walk on $\mathbf{Z}^{d}$.

$$
P\left(X_{i}=e_{j}\right)=P\left(X_{i}=-e_{j}\right)=1 / 2 d
$$

for each of the $d$ unit vectors $e_{j}$. To analyze this case, we begin with a result that is valid for any random walk. Let $\tau_{0}=0$ and $\tau_{n}=\inf \{m> \left.\tau_{n-1}: S_{m}=0\right\}$ be the time of the $n$th return to 0 . From the strong Markov pfroperty, it follows that

$$
P\left(\tau_{n}<\infty\right)=P\left(\tau_{1}<\infty\right)^{n}
$$

a fact that leads easily to:

Theorem 5.4.3. For any random walk, the following are equivalent:
(i) $P\left(\tau_{1}<\infty\right)=1$, (ii) $P\left(S_{m}=0\right.$ i.o.) $=1$, and (iii) $\sum_{m=0}^{\infty} P\left(S_{m}=\right. 0)=\infty$.

Proof. If $P\left(\tau_{1}<\infty\right)=1$, then $P\left(\tau_{n}<\infty\right)=1$ for all $n$ and $P\left(S_{m}=\right.$ 0 i.o.) = 1. Let

$$
V=\sum_{m=0}^{\infty} 1_{\left(S_{m}=0\right)}=\sum_{n=0}^{\infty} 1_{\left(\tau_{n}<\infty\right)}
$$

be the number of visits to 0 , counting the visit at time 0 . Taking expected value and using Fubini's theorem to put the expected value inside the sum:

$$
\begin{aligned}
E V & =\sum_{m=0}^{\infty} P\left(S_{m}=0\right)=\sum_{n=0}^{\infty} P\left(\tau_{n}<\infty\right) \\
& =\sum_{n=0}^{\infty} P\left(\tau_{1}<\infty\right)^{n}=\frac{1}{1-P\left(\tau_{1}<\infty\right)}
\end{aligned}
$$

The second equality shows (ii) implies (iii), and in combination with the last two shows that if (i) is false then (iii) is false (i.e., (iii) implies (i)).

Theorem 5.4.4. Simple random walk is recurrent in $d \leq 2$ and transient in $d \geq 3$.

To steal a joke from Kakutani (U.C.L.A. colloquium talk): "A drunk man will eventually find his way home, but a drunk bird may get lost forever."

Proof. Let $\rho_{d}(m)=P\left(S_{m}=0\right)$. $\rho_{d}(m)$ is 0 if $m$ is odd. From Theorem 3.1.3, we get $\rho_{1}(2 n) \sim(\pi n)^{-1 / 2}$ as $n \rightarrow \infty$. This and Theorem 5.4.3 gives the result in one dimension. Our next step is
Simple random walk is recurrent in two dimensions. Note that in order for $S_{2 n}=0$ we must for some $0 \leq m \leq n$ have $m$ up steps, $m$ down steps, $n-m$ to the left and $n-m$ to the right so

$$
\begin{aligned}
\rho_{2}(2 n) & =4^{-2 n} \sum_{m=0}^{n} \frac{2 n!}{m!m!(n-m)!(n-m)!} \\
& =4^{-2 n}\binom{2 n}{n} \sum_{m=0}^{n}\binom{n}{m}\binom{n}{n-m}=4^{-2 n}\binom{2 n}{n}^{2}=\rho_{1}(2 n)^{2}
\end{aligned}
$$

To see the next to last equality, consider choosing $n$ students from a class with $n$ boys and $n$ girls and observe that for some $0 \leq m \leq n$ you must choose $m$ boys and $n-m$ girls. Using the asymptotic formula $\rho_{1}(2 n) \sim(\pi n)^{-1 / 2}$, we get $\rho_{2}(2 n) \sim(\pi n)^{-1}$. Since $\sum n^{-1}=\infty$, the result follows from Theorem 5.4.3.

Remark. For a direct proof of $\rho_{2}(2 n)=\rho_{1}(2 n)^{2}$, note that if $T_{n}^{1}$ and $T_{n}^{2}$ are independent, one dimensional random walks then $T_{n}$ jumps from $x$ to $x+(1,1), x+(1,-1), x+(-1,1)$, and $x+(-1,-1)$ with equal probability, so rotating $T_{n}$ by 45 degrees and dividing by $\sqrt{2}$ gives $S_{n}$.
Simple random walk is transient in three dimensions. Intuitively, this holds since the probability of being back at 0 after $2 n$ steps is $\sim c n^{-3 / 2}$ and this is summable. We will not compute the probability exactly but will get an upper bound of the right order of magnitude. Again, since the number of steps in the directions $\pm e_{i}$ must be equal for $i=1,2,3$

$$
\begin{aligned}
\rho_{3}(2 n) & =6^{-2 n} \sum_{j, k} \frac{(2 n)!}{(j!k!(n-j-k)!)^{2}} \\
& =2^{-2 n}\binom{2 n}{n} \sum_{j, k}\left(3^{-n} \frac{n!}{j!k!(n-j-k)!}\right)^{2} \\
& \leq 2^{-2 n}\binom{2 n}{n} \max _{j, k} 3^{-n} \frac{n!}{j!k!(n-j-k)!}
\end{aligned}
$$

where in the last inequality we have used the fact that if $a_{j, k}$ are $\geq 0$ and sum to 1 then $\sum_{j, k} a_{j, k}^{2} \leq \max _{j, k} a_{j, k}$. Our last step is to show

$$
\max _{j, k} 3^{-n} \frac{n!}{j!k!(n-j-k)!} \leq C n^{-1}
$$

To do this, we note that (a) if any of the numbers $j, k$ or $n-j-k$ is $<[n / 3]$ increasing the smallest number and decreasing the largest number decreases the denominator (since $x(1-x)$ is maximized at $1 / 2$ ), so the maximum occurs when all three numbers are as close as possible to $n / 3$;
(b) Stirling's formula implies

$$
\frac{n!}{j!k!(n-j-k)!} \sim \frac{n^{n}}{j^{j} k^{k}(n-j-k)^{n-j-k}} \cdot \sqrt{\frac{n}{j k(n-j-k)}} \cdot \frac{1}{2 \pi}
$$

Taking $j$ and $k$ within 1 of $n / 3$ the first term on the right is $\leq C 3^{n}$, and the desired result follows.
Simple random walk is transient in $d>3$. Let $T_{n}=\left(S_{n}^{1}, S_{n}^{2}, S_{n}^{3}\right), N(0)=$ 0 and $N(n)=\inf \left\{m>N(n-1): T_{m} \neq T_{N(n-1)}\right\}$. It is easy to see that $T_{N(n)}$ is a three-dimensional simple random walk. Since $T_{N(n)}$ returns infinitely often to 0 with probability 0 and the first three coordinates are constant in between the $N(n), S_{n}$ is transient.

The rest of this section is devoted to proving the following facts about random walks:

- $S_{n}$ is recurrent in $d=1$ if $S_{n} / n \rightarrow 0$ in probability.
- $S_{n}$ is recurrent in $d=2$ if $S_{n} / n^{1 / 2} \Rightarrow$ a nondegenerate normal distribution.
- $S_{n}$ is transient in $d \geq 3$ if it is "truly three dimensional."

To prove the last result we will give a necessary and sufficient condition for recurrence.

The first step in deriving these results is to generalize Theorem 5.4.3.
Lemma 5.4.5. If $\sum_{n=1}^{\infty} P\left(\left\|S_{n}\right\|<\epsilon\right)<\infty$ then $P\left(\left\|S_{n}\right\|<\epsilon\right.$ i.o. $)=0$. If $\sum_{n=1}^{\infty} P\left(\left\|S_{n}\right\|<\epsilon\right)=\infty$ then $P\left(\left\|S_{n}\right\|<2 \epsilon\right.$ i.o. $)=1$.
Proof. The first conclusion follows from the Borel-Cantelli lemma. To prove the second, let $F=\left\{\left\|S_{n}\right\|<\epsilon \text { i.o. }\right\}^{c}$. Breaking things down according to the last time $\left\|S_{n}\right\|<\epsilon$,

$$
\begin{aligned}
P(F) & =\sum_{m=0}^{\infty} P\left(\left\|S_{m}\right\|<\epsilon,\left\|S_{n}\right\| \geq \epsilon \text { for all } n \geq m+1\right) \\
& \geq \sum_{m=0}^{\infty} P\left(\left\|S_{m}\right\|<\epsilon,\left\|S_{n}-S_{m}\right\| \geq 2 \epsilon \text { for all } n \geq m+1\right) \\
& =\sum_{m=0}^{\infty} P\left(\left\|S_{m}\right\|<\epsilon\right) \rho_{2 \epsilon, 1}
\end{aligned}
$$

where $\rho_{\delta, k}=P\left(\left\|S_{n}\right\| \geq \delta\right.$ for all $\left.n \geq k\right)$. Since $P(F) \leq 1$, and

$$
\sum_{m=0}^{\infty} P\left(\left\|S_{m}\right\|<\epsilon\right)=\infty
$$

it follows that $\rho_{2 \epsilon, 1}=0$. To extend this conclusion to $\rho_{2 \epsilon, k}$ with $k \geq 2$, let

$$
A_{m}=\left\{\left\|S_{m}\right\|<\epsilon,\left\|S_{n}\right\| \geq \epsilon \text { for all } n \geq m+k\right\}
$$

Since any $\omega$ can be in at most $k$ of the $A_{m}$, repeating the argument above gives

$$
k \geq \sum_{m=0}^{\infty} P\left(A_{m}\right) \geq \sum_{m=0}^{\infty} P\left(\left\|S_{m}\right\|<\epsilon\right) \rho_{2 \epsilon, k}
$$

So $\rho_{2 \epsilon, k}=P\left(\left\|S_{n}\right\| \geq 2 \epsilon\right.$ for all $\left.j \geq k\right)=0$, and since $k$ is arbitrary, the desired conclusion follows.

Our second step is to show that the convergence or divergence of the sums in Lemma 5.4.5 is independent of $\epsilon$. The previous proof works for any norm. For the next one, we need $\|x\|=\sup _{i}\left|x_{i}\right|$.
Lemma 5.4.6. Let $m$ be an integer $\geq 2$.

$$
\sum_{n=0}^{\infty} P\left(\left\|S_{n}\right\|<m \epsilon\right) \leq(2 m)^{d} \sum_{n=0}^{\infty} P\left(\left\|S_{n}\right\|<\epsilon\right)
$$

Proof. We begin by observing

$$
\sum_{n=0}^{\infty} P\left(\left\|S_{n}\right\|<m \epsilon\right) \leq \sum_{n=0}^{\infty} \sum_{k} P\left(S_{n} \in k \epsilon+[0, \epsilon)^{d}\right)
$$

where the inner sum is over $k \in\{-m, \ldots, m-1\}^{d}$. If we let

$$
T_{k}=\inf \left\{\ell \geq 0: S_{\ell} \in k \epsilon+[0, \epsilon)^{d}\right\}
$$

then breaking things down according to the value of $T_{k}$ and using Fubini's theorem gives

$$
\begin{aligned}
\sum_{n=0}^{\infty} P\left(S_{n} \in k \epsilon+[0, \epsilon)^{d}\right) & =\sum_{n=0}^{\infty} \sum_{\ell=0}^{n} P\left(S_{n} \in k \epsilon+[0, \epsilon)^{d}, T_{k}=\ell\right) \\
& \leq \sum_{\ell=0}^{\infty} \sum_{n=\ell}^{\infty} P\left(\left\|S_{n}-S_{\ell}\right\|<\epsilon, T_{k}=\ell\right)
\end{aligned}
$$

Since $\left\{T_{k}=\ell\right\}$ and $\left\{\left\|S_{n}-S_{\ell}\right\|<\epsilon\right\}$ are independent, the last sum

$$
=\sum_{m=0}^{\infty} P\left(T_{k}=m\right) \sum_{j=0}^{\infty} P\left(\left\|S_{j}\right\|<\epsilon\right) \leq \sum_{j=0}^{\infty} P\left(\left\|S_{j}\right\|<\epsilon\right)
$$

Since there are $(2 m)^{d}$ values of $k$ in $\{-m, \ldots, m-1\}^{d}$, the proof is complete.

Combining Lemmas 5.4.5 and 5.4.6 gives:
Theorem 5.4.7. The convergence (resp. divergence) of $\sum_{n} P\left(\left\|S_{n}\right\|<\epsilon\right)$ for a single value of $\epsilon>0$ is sufficient for transience (resp. recurrence).

In $d=1$, if $E X_{i}=\mu \neq 0$, then the strong law of large numbers implies $S_{n} / n \rightarrow \mu$ so $\left|S_{n}\right| \rightarrow \infty$ and $S_{n}$ is transient. As a converse, we have
Theorem 5.4.8. Chung-Fuchs theorem. Suppose $d=1$. If the weak law of large numbers holds in the form $S_{n} / n \rightarrow 0$ in probability, then $S_{n}$ is recurrent.

Proof. Let $u_{n}(x)=P\left(\left|S_{n}\right|<x\right)$ for $x>0$. Lemma 5.4.6 implies

$$
\sum_{n=0}^{\infty} u_{n}(1) \geq \frac{1}{2 m} \sum_{n=0}^{\infty} u_{n}(m) \geq \frac{1}{2 m} \sum_{n=0}^{A m} u_{n}(n / A)
$$

for any $A<\infty$ since $u_{n}(x) \geq 0$ and is increasing in $x$. By hypothesis $u_{n}(n / A) \rightarrow 1$, so letting $m \rightarrow \infty$ and noticing the right-hand side is $A / 2$ times the average of the first $A m$ terms

$$
\sum_{n=0}^{\infty} u_{n}(1) \geq A / 2
$$

Since $A$ is arbitrary, the sum must be $\infty$, and the desired conclusion follows from Theorem 5.4.7.

Theorem 5.4.9. If $S_{n}$ is a random walk in $\mathbf{R}^{2}$ and $S_{n} / n^{1 / 2} \Rightarrow$ a nondegenerate normal distribution then $S_{n}$ is recurrent.

Remark. The conclusion is also true if the limit is degenerate, but in that case the random walk is essentially one (or zero) dimensional, and the result follows from the Chung-Fuchs theorem.

Proof. Let $u(n, m)=P\left(\left\|S_{n}\right\|<m\right)$. Lemma 5.4.6 implies

$$
\sum_{n=0}^{\infty} u(n, 1) \geq\left(4 m^{2}\right)^{-1} \sum_{n=0}^{\infty} u(n, m)
$$

If $m / \sqrt{n} \rightarrow c$ then

$$
u(n, m) \rightarrow \int_{[-c, c]^{2}} n(x) d x
$$

where $n(x)$ is the density of the limiting normal distribution. If we use $\rho(c)$ to denote the right-hand side and let $n=\left[\theta m^{2}\right]$, it follows that $u\left(\left[\theta m^{2}\right], m\right) \rightarrow \rho\left(\theta^{-1 / 2}\right)$. If we write

$$
m^{-2} \sum_{n=0}^{\infty} u(n, m)=\int_{0}^{\infty} u\left(\left[\theta m^{2}\right], m\right) d \theta
$$

let $m \rightarrow \infty$, and use Fatou's lemma, we get

$$
\liminf _{m \rightarrow \infty}\left(4 m^{2}\right)^{-1} \sum_{n=0}^{\infty} u(n, m) \geq 4^{-1} \int_{0}^{\infty} \rho\left(\theta^{-1 / 2}\right) d \theta
$$

Since the normal density is positive and continuous at 0

$$
\rho(c)=\int_{[-c, c]^{2}} n(x) d x \sim n(0)(2 c)^{2}
$$

as $c \rightarrow 0$. So $\rho\left(\theta^{-1 / 2}\right) \sim 4 n(0) / \theta$ as $\theta \rightarrow \infty$, the integral diverges, and backtracking to the first inequality in the proof it follows that $\sum_{n=0}^{\infty} u(n, 1)= \infty$, proving the result.

We come now to the promised necessary and sufficient condition for recurrence. Here $\phi=E \exp \left(i t \cdot X_{j}\right)$ is the ch.f. of one step of the random walk.

Theorem 5.4.10. Let $\delta>0 . S_{n}$ is recurrent if and only if

$$
\int_{(-\delta, \delta)^{d}} R e \frac{1}{1-\varphi(y)} d y=\infty
$$

We will prove a weaker result:
Theorem 5.4.11. Let $\delta>0 . S_{n}$ is recurrent if and only if

$$
\sup _{r<1} \int_{(-\delta, \delta)^{d}} \operatorname{Re} \frac{1}{1-r \varphi(y)} d y=\infty
$$

Remark. Half of the work needed to get the first result from the second is trivial.

$$
0 \leq \operatorname{Re} \frac{1}{1-r \varphi(y)} \rightarrow \operatorname{Re} \frac{1}{1-\varphi(y)} \quad \text { as } r \rightarrow 1
$$

so Fatou's lemma shows that if the integral is infinite, the walk is recurrent. The other direction is rather difficult: the second result is in Chung and Fuchs (1951), but a proof of the first result had to wait for Ornstein (1969) and Stone (1969) to solve the problem independently. Their proofs use a trick to reduce to the case where the increments have a density and then a second trick to deal with that case, so we will not give the details here. The reader can consult either of the sources cited or Port and Stone (1969), where the result is demonstrated for random walks on Abelian groups.

Proof. The first ingredient in the solution is the
Lemma 5.4.12. Parseval relation. Let $\mu$ and $\nu$ be probability measures on $\mathbf{R}^{d}$ with ch.f.'s $\varphi$ and $\psi$.

$$
\int \psi(t) \mu(d t)=\int \varphi(x) \nu(d x)
$$

Proof. Since $e^{i t \cdot x}$ is bounded, Fubini's theorem implies

$$
\int \psi(t) \mu(d t)=\iint e^{i t x} \nu(d x) \mu(d t)=\iint e^{i t x} \mu(d t) \nu(d x)=\int \varphi(x) \nu(d x)
$$

Our second ingredient is a little calculus.
Lemma 5.4.13. If $|x| \leq \pi / 3$ then $1-\cos x \geq x^{2} / 4$.
Proof. It suffices to prove the result for $x>0$. If $z \leq \pi / 3$ then $\cos z \geq 1 / 2$,

$$
\begin{aligned}
\sin y & =\int_{0}^{y} \cos z d z \geq \frac{y}{2} \\
1-\cos x & =\int_{0}^{x} \sin y d y \geq \int_{0}^{x} \frac{y}{2} d y=\frac{x^{2}}{4}
\end{aligned}
$$

which proves the desired result.

From Example 3.3.7, we see that the density

$$
\frac{\delta-|x|}{\delta^{2}} \quad \text { when } \quad|x| \leq \delta, \quad 0 \quad \text { otherwise }
$$

has ch.f. $2(1-\cos \delta t) /(\delta t)^{2}$. Let $\mu_{n}$ denote the distribution of $S_{n}$. Using Lemma 5.4.13 (note $\pi / 3 \geq 1$ ) and then Lemma 5.4.12, we have

$$
\begin{aligned}
P\left(\left\|S_{n}\right\|<1 / \delta\right) & \leq 4^{d} \int \prod_{i=1}^{d} \frac{1-\cos \left(\delta t_{i}\right)}{\left(\delta t_{i}\right)^{2}} \mu_{n}(d t) \\
& =2^{d} \int_{(-\delta, \delta)^{d}} \prod_{i=1}^{d} \frac{\delta-\left|x_{i}\right|}{\delta^{2}} \varphi^{n}(x) d x
\end{aligned}
$$

Our next step is to sum from 0 to $\infty$. To be able to interchange the sum and the integral, we first multiply by $r^{n}$ where $r<1$.

$$
\sum_{n=0}^{\infty} r^{n} P\left(\left\|S_{n}\right\|<1 / \delta\right) \leq 2^{d} \int_{(-\delta, \delta)^{d}} \prod_{i=1}^{d} \frac{\delta-\left|x_{i}\right|}{\delta^{2}} \frac{1}{1-r \varphi(x)} d x
$$

Symmetry dictates that the integral on the right is real, so we can take the real part without affecting its value. Letting $r \uparrow 1$ and using $(\delta-|x|) / \delta \leq$ 1

$$
\sum_{n=0}^{\infty} P\left(\left\|S_{n}\right\|<1 / \delta\right) \leq\left(\frac{2}{\delta}\right)^{d} \sup _{r<1} \int_{(-\delta, \delta)^{d}} \operatorname{Re} \frac{1}{1-r \varphi(x)} d x
$$

and using Theorem 5.4.7 gives half of Theorem 5.4.11.
To prove the other direction, we begin by noting that Example 3.3.15 shows that the density $(1-\cos (x / \delta)) / \pi x^{2} / \delta$ has ch.f. $1-|\delta t|$ when $|t| \leq 1 / \delta, 0$ otherwise. Using $1 \geq \prod_{i=1}^{d}\left(1-\left|\delta x_{i}\right|\right)$ and then Lemma 5.4.12,

$$
\begin{aligned}
P\left(\left\|S_{n}\right\|<1 / \delta\right) & \geq \int_{(-1 / \delta, 1 / \delta)^{d}} \prod_{i=1}^{d}\left(1-\left|\delta x_{i}\right|\right) \mu_{n}(d x) \\
& =\int \prod_{i=1}^{d} \frac{1-\cos \left(t_{i} / \delta\right)}{\pi t_{i}^{2} / \delta} \varphi^{n}(t) d t
\end{aligned}
$$

Multiplying by $r^{n}$ and summing gives

$$
\sum_{n=0}^{\infty} r^{n} P\left(\left\|S_{n}\right\|<1 / \delta\right) \geq \int \prod_{i=1}^{d} \frac{1-\cos \left(t_{i} / \delta\right)}{\pi t_{i}^{2} / \delta} \frac{1}{1-r \varphi(t)} d t
$$

The last integral is real, so its value is unaffected if we integrate only the real part of the integrand. If we do this and apply Lemma 5.4.13, we get

$$
\sum_{n=0}^{\infty} r^{n} P\left(\left\|S_{n}\right\|<1 / \delta\right) \geq(4 \pi \delta)^{-d} \int_{(-\delta, \delta)^{d}} \operatorname{Re} \frac{1}{1-r \varphi(t)} d t
$$

Letting $r \uparrow 1$ and using Theorem 5.4.7 now completes the proof of Theorem 5.4.11.

We will now consider some examples. Our goal in $d=1$ and $d=2$ is to convince you that the conditions in Theorems 5.4.8 and 5.4.9 are close to the best possible.
$d=1$. Consider the symmetric stable laws that have ch.f. $\varphi(t)= \exp \left(-|t|^{\alpha}\right)$. To avoid using facts that we have not proved, we will obtain our conclusions from Theorem 5.4.1.1 It is not hard to use that form of the criterion in this case since

$$
\begin{aligned}
1-r \varphi(t) \downarrow 1-\exp \left(-|t|^{\alpha}\right) & \text { as } r \uparrow 1 \\
1-\exp \left(-|t|^{\alpha}\right) \sim|t|^{\alpha} & \text { as } t \rightarrow 0
\end{aligned}
$$

From this, it follows that the corresponding random walk is transient for $\alpha<1$ and recurrent for $\alpha \geq 1$. The case $\alpha>1$ is covered by Theorem 5.4.8 since these random walks have mean 0 . The result for $\alpha=1$ is new because the Cauchy distribution does not satisfy $S_{n} / n \rightarrow 0$ in probability. The random walks with $\alpha<1$ are interesting because Exercise 5.4.1 implies

$$
-\infty=\liminf S_{n}<\lim \sup S_{n}=\infty
$$

but $P\left(\left|S_{n}\right|<M\right.$ i.o. $)=0$ for any $M<\infty$.
Remark. The stable law examples are misleading in one respect. Shepp (1964) has proved that recurrent random walks may have arbitrarily large tails. To be precise, given a function $\epsilon(x) \downarrow 0$ as $x \uparrow \infty$, there is a recurrent random walk with $P\left(\left|X_{1}\right| \geq x\right) \geq \epsilon(x)$ for large $x$.
$d=2$. Let $\alpha<2$, and let $\varphi(t)=\exp \left(-|t|^{\alpha}\right)$ where $|t|=\left(t_{1}^{2}+t_{2}^{2}\right)^{1 / 2} . \varphi$ is the characteristic function of a random vector ( $X_{1}, X_{2}$ ) that has two nice properties:
(i) the distribution of ( $X_{1}, X_{2}$ ) is invariant under rotations,
(ii) $X_{1}$ and $X_{2}$ have symmetric stable laws with index $\alpha$.

Again, $1-r \varphi(t) \downarrow 1-\exp \left(-|t|^{\alpha}\right)$ as $r \uparrow 1$ and $1-\exp \left(-|t|^{\alpha}\right) \sim|t|^{\alpha}$ as $t \rightarrow 0$. Changing to polar coordinates and noticing

$$
2 \pi \int_{0}^{\delta} d x x x^{-\alpha}<\infty
$$

when $1-\alpha>-1$ shows the random walks with ch.f. $\exp \left(-|t|^{\alpha}\right), \alpha<2$ are transient. When $p<\alpha$, we have $E\left|X_{1}\right|^{p}<\infty$ by Exercise 3.8.4, so these examples show that Theorem 5.4.9 is reasonably sharp.
$d \geq 3$. The integral $\int_{0}^{\delta} d x x^{d-1} x^{-2}<\infty$, so if a random walk is recurrent in $d \geq 3$, its ch.f. must $\rightarrow 1$ faster than $t^{2}$. In Exercise 3.3.16, we observed
that (in one dimension) if $\varphi(r)=1+o\left(r^{2}\right)$ then $\varphi(r) \equiv 1$. By considering $\varphi(r \theta)$ where $r$ is real and $\theta$ is a fixed vector, the last conclusion generalizes easily to $\mathbf{R}^{d}, d>1$ and suggests that once we exclude walks that stay on a plane through 0 , no three-dimensional random walks are recurrent.

A random walk in $\mathbf{R}^{3}$ is truly three-dimensional if the distribution of $X_{1}$ has $P\left(X_{1} \cdot \theta \neq 0\right)>0$ for all $\theta \neq 0$.
Theorem 5.4.14. No truly three-dimensional random walk is recurrent.
Proof. We will deduce the result from Theorem 5.4.11. We begin with some arithmetic. If $z$ is complex, the conjugate of $1-z$ is $1-\bar{z}$, so

$$
\frac{1}{1-z}=\frac{1-\bar{z}}{|1-z|^{2}} \quad \text { and } \quad \operatorname{Re} \frac{1}{1-z}=\frac{\operatorname{Re}(1-z)}{|1-z|^{2}}
$$

If $z=a+b i$ with $a \leq 1$, then using the previous formula and dropping the $b^{2}$ from the denominator

$$
\operatorname{Re} \frac{1}{1-z}=\frac{1-a}{(1-a)^{2}+b^{2}} \leq \frac{1}{1-a}
$$

Taking $z=r \phi(t)$ and supposing for the second inequality that $0 \leq \operatorname{Re} \phi(t) \leq 1$, we have

$$
\begin{equation*}
\operatorname{Re} \frac{1}{1-r \varphi(t)} \leq \frac{1}{\operatorname{Re}(1-r \varphi(t))} \leq \frac{1}{\operatorname{Re}(1-\varphi(t))} \tag{a}
\end{equation*}
$$

The last calculation shows that it is enough to estimate

$$
\operatorname{Re}(1-\varphi(t))=\int\{1-\cos (x \cdot t)\} \mu(d x) \geq \int_{|x \cdot t|<\pi / 3} \frac{|x \cdot t|^{2}}{4} \mu(d x)
$$

by Lemma 5.4.13. Writing $t=\rho \theta$ where $\theta \in S=\{x:|x|=1\}$ gives

$$
\begin{equation*}
\operatorname{Re}(1-\varphi(\rho \theta)) \geq \frac{\rho^{2}}{4} \int_{|x \cdot \theta|<\pi / 3 \rho}|x \cdot \theta|^{2} \mu(d x) \tag{b}
\end{equation*}
$$

Fatou's lemma implies that if we let $\rho \rightarrow 0$ and $\theta(\rho) \rightarrow \theta$, then
(c) $\quad \liminf _{\rho \rightarrow 0} \int_{|x \cdot \theta(\rho)|<\pi / 3 \rho}|x \cdot \theta(\rho)|^{2} \mu(d x) \geq \int|x \cdot \theta|^{2} \mu(d x)>0$

I claim this implies that for $\rho<\rho_{0}$

$$
\begin{equation*}
\inf _{\theta \in S} \int_{|x \cdot \theta|<\pi / 3 \rho}|x \cdot \theta|^{2} \mu(d x)=C>0 \tag{d}
\end{equation*}
$$

To get the last conclusion, observe that if it is false, then for $\rho=1 / n$ there is a $\theta_{n}$ so that

$$
\int_{\left|x \cdot \theta_{n}\right|<n \pi / 3}\left|x \cdot \theta_{n}\right|^{2} \mu(d x) \leq 1 / n
$$

All the $\theta_{n}$ lie in $S$, a compact set, so if we pick a convergent subsequence we contradict (c). Combining (b) and (d) gives

$$
\operatorname{Re}(1-\varphi(\rho \theta)) \geq C \rho^{2} / 4
$$

Using the last result and (a) then changing to polar coordinates, we see that if $\delta$ is small (so $\operatorname{Re} \phi(y) \geq 0$ on $(-\delta, \delta)^{d}$ )

$$
\begin{aligned}
\int_{(-\delta, \delta)^{d}} \operatorname{Re} \frac{1}{1-r \phi(y)} d y & \leq \int_{0}^{\delta \sqrt{d}} d \rho \rho^{d-1} \int d \theta \frac{1}{\operatorname{Re}(1-\phi(\rho \theta))} \\
& \leq C^{\prime} \int_{0}^{1} d \rho \rho^{d-3}<\infty
\end{aligned}
$$

when $d>2$, so the desired result follows from Theorem 5.4.11.
Remark. The analysis becomes much simpler when we consider random walks on $\mathbf{Z}^{d}$. The inversion formula given in Exercise 3.3.2 implies

$$
P\left(S_{n}=0\right)=(2 \pi)^{-d} \int_{(-\pi, \pi)^{d}} \varphi^{n}(t) d t
$$

Multiplying by $r^{n}$ and summing gives

$$
\sum_{n=0}^{\infty} r^{n} P\left(S_{n}=0\right)=(2 \pi)^{-d} \int_{(-\pi, \pi)^{d}} \frac{1}{1-r \varphi(t)} d t
$$

In the case of simple random walk in $d=3, \phi(t)=\frac{1}{3} \sum_{j=1}^{3} \cos t_{j}$ is real.

$$
\begin{aligned}
& \frac{1}{1-r \phi(t)} \uparrow \frac{1}{1-\phi(t)} \quad \text { when } \phi(t)>0 \\
& 0 \leq \frac{1}{1-r \phi(t)} \leq 1 \quad \text { when } \phi(t) \leq 0
\end{aligned}
$$

So, using the monotone and bounded convergence theorems

$$
\sum_{n=0}^{\infty} P\left(S_{n}=0\right)=(2 \pi)^{-3} \int_{(-\pi, \pi)^{3}}\left(1-\frac{1}{3} \sum_{i=1}^{3} \cos x_{i}\right)^{-1} d x
$$

This integral was first evaluated by Watson in 1939 in terms of elliptic integrals, which could be found in tables. Glasser and Zucker (1977) showed that it was

$$
\left(\sqrt{6} / 32 \pi^{3}\right) \Gamma(1 / 24) \Gamma(5 / 24) \Gamma(7 / 24) \Gamma(11 / 24)=1.51638606 \ldots
$$

so it follows from (5.3.1) that if $\beta_{3}=P_{0}\left(T_{0}<\infty\right)$ then

$$
\sum_{n=0}^{\infty} P_{0}\left(S_{n}=0\right)=\frac{1}{1-\beta_{3}}
$$

and hence $\beta_{3}=0.34053733 \ldots$. For numerical results in $4 \leq d \leq 9$, see Kondo and Hara (1987).

## Exercises

5.4.1. For a random walk on $\mathbf{R}$, there are only four possibilities, one of which has probability one.
(i) $S_{n}=0$ for all $n$.
(ii) $S_{n} \rightarrow \infty$.
(iii) $S_{n} \rightarrow-\infty$.
(iv) $-\infty=\liminf S_{n}<\limsup S_{n}=\infty$.
5.4.2. Ladder variables. Let $\alpha(\omega)=\inf \left\{n: \omega_{1}+\cdots+\omega_{n}>0\right\}$ where $\inf \emptyset=\infty$, and set $\alpha(\Delta)=\infty$. Let $\alpha_{0}=0$ and let

$$
\alpha_{k}(\omega)=\alpha_{k-1}(\omega)+\alpha\left(\theta^{\alpha_{k-1}} \omega\right)
$$

for $k \geq 1$. At time $\alpha_{k}$, the random walk is at a record high value.
(i) If $P(\alpha<\infty)<1$ then $P\left(\sup S_{n}<\infty\right)=1$.
(ii) If $P(\alpha<\infty)=1$ then $P\left(\sup S_{n}=\infty\right)=1$.
5.4.3. Suppose $f$ is superharmonic on $\mathbf{R}^{d}$, i.e.,

$$
f(x) \geq \frac{1}{|B(x, r)|} \int_{B(x, r)} f(y) d y
$$

Let $\xi_{1}, \xi_{2}, \ldots$ be i.i.d. uniform on $B(0,1)$, and define $S_{n}$ by $S_{n}=S_{n-1}+\xi_{n}$ for $n \geq 1$ and $S_{0}=x$. (i) Show that $X_{n}=f\left(S_{n}\right)$ is a supermartingale. (ii) Use this to conclude that in $d \leq 2$, nonnegative superharmonic functions must be constant. The example $f(x)=|x|^{2-d}$ shows this is false in $d>2$.
5.4.4. Suppose $h$ is harmonic on $\mathbf{R}^{d}$, i.e.,

$$
h(x)=\frac{1}{|B(x, r)|} \int_{B(x, r)} f(y) d y
$$

Let $\xi_{1}, \xi_{2}, \ldots$ be i.i.d. uniform on $B(0,1)$, and define $S_{n}$ by $S_{n}=S_{n-1}+\xi_{n}$ for $n \geq 1$ and $S_{0}=x$. (i) Show that $X_{n}=f\left(S_{n}\right)$ is a martingale. (ii) Use this to conclude that in any dimension, bounded harmonic functions must be constant. The Hewitt-Savage 0-1 law will be useful here.

### 5.5 Stationary Measures

A measure $\mu$ is said to be a stationary measure if

$$
\sum_{x} \mu(x) p(x, y)=\mu(y)
$$

The last equation says $P_{\mu}\left(X_{1}=y\right)=\mu(y)$. Using the Markov property and induction, it follows that $P_{\mu}\left(X_{n}=y\right)=\mu(y)$ for all $n \geq 1$. If $\mu$ is a probability measure, we call $\mu$ a stationary distribution, and it represents a possible equilibrium for the chain. That is, if $X_{0}$ has distribution $\mu$ then so does $X_{n}$ for all $n \geq 1$. If we stretch our imagination a little, we can also apply this interpretation when $\mu$ is an infinite measure. (When the total mass is finite, we can divide by $\mu(S)$ to get a stationary distribution.) Before getting into the theory, we consider some examples.

Example 5.5.1. Random walk. $S=\mathbf{Z}^{d} . p(x, y)=f(y-x)$, where $f(z) \geq 0$ and $\sum f(z)=1$. In this case, $\mu(x) \equiv 1$ is a stationary measure since

$$
\sum_{x} p(x, y)=\sum_{x} f(y-x)=1
$$

A transition probability that has $\sum_{x} p(x, y)=1$ is called doubly stochastic. This is obviously a necessary and sufficient condition for $\mu(x) \equiv 1$ to be a stationary measure.

Example 5.5.2. Asymmetric simple random walk. $S=\mathrm{Z}$.

$$
p(x, x+1)=p \quad p(x, x-1)=q=1-p
$$

By the last example, $\mu(x) \equiv 1$ is a stationary measure. When $p \neq q$, $\mu(x)=(p / q)^{x}$ is a second one. To check this, we observe that

$$
\begin{aligned}
\sum_{x} \mu(x) p(x, y) & =\mu(y+1) p(y+1, y)+\mu(y-1) p(y-1, y) \\
& =(p / q)^{y+1} q+(p / q)^{y-1} p=(p / q)^{y}[p+q]=(p / q)^{y}
\end{aligned}
$$

To simplify the computations in the next two examples we introdcue a concept that is stronger than being a stationary measure. $\mu$ satisfies the detailed balance condition if

$$
\begin{equation*}
\mu(x) p(x, y)=\mu(y) p(y, x) \tag{5.5.1}
\end{equation*}
$$

Summing over $x$ gives

$$
\sum_{x} \mu(x) p(x, y)=\mu(y)
$$

(5.5.1) asserts that the amount of mass that moves from $x$ to $y$ in one jump is exactly the same as the amount that moves from $y$ to $x$. A measure $\mu$ that satisfies (5.5.1) is said to be a reversible measure. Theorem 5.5.5 will explain the term reversible.

Example 5.5.3. The Ehrenfest chain. $S=\{0,1, \ldots, r\}$.

$$
p(k, k+1)=(r-k) / r \quad p(k, k-1)=k / r
$$

In this case, $\mu(x)=2^{-r}\binom{r}{x}$ is a stationary distribution. One can check this without pencil and paper by observing that $\mu$ corresponds to flipping $r$ coins to determine which urn each ball is to be placed in, and the transitions of the chain correspond to picking a coin at random and turning it over. Alternatively, you can check that

$$
\begin{aligned}
\mu(k+1) p(k+1, k) & =2^{-r} \frac{r!}{(k+1)!(r-k-1)!} \cdot \frac{k+1}{r}=\frac{(r-1)!}{k!(r-k-1)!} \\
& =2^{-r} \frac{r!}{k!(r-k)!} \cdot \frac{r-k}{r}=\mu(k-1) p(k-1, k)=\mu(k)
\end{aligned}
$$

Example 5.5.4. Birth and death chains. $S=\{0,1,2, \ldots\}$

$$
p(x, x+1)=p_{x} \quad p(x, x)=r_{x} \quad p(x, x-1)=q_{x}
$$

with $q_{0}=0$ and $p(i, j)=0$ otherwise. In this case, there is the measure

$$
\mu(x)=\prod_{k=1}^{x} \frac{p_{k-1}}{q_{k}}
$$

which satisfies detailed balance:

$$
\mu(x) p(x, x+1)=p_{x} \prod_{k=1}^{x} \frac{p_{k-1}}{q_{k}}=\mu(x+1) p(x+1, x)
$$

The next result explains the name "reversible."
Theorem 5.5.5. Let $\mu$ be a stationary measure and suppose $X_{0}$ has "distribution" $\mu$. Then $Y_{m}=X_{n-m}, 0 \leq m \leq n$ is a Markov chain with initial measure $\mu$ and transition probability

$$
q(x, y)=\mu(y) p(y, x) / \mu(x)
$$

$q$ is called the dual transition probability. If $\mu$ is a reversible measure then $q=p$.

Proof.

$$
\begin{aligned}
P\left(Y_{m+1}=y \mid Y_{m}=x\right) & =P\left(X_{n-m-1}=y \mid X_{n-m}=x\right) \\
& =\frac{P\left(X_{n-m-1}=y, X_{n-m}=x\right)}{P\left(X_{n-m}=x\right)} \\
& =\frac{P\left(X_{n-m}=x \mid X_{n-m-1}=y\right) P\left(X_{n-m-1}=y\right)}{P\left(X_{n-m}=x\right)} \\
& =\frac{\mu(y) p(y, x)}{\mu(x)}
\end{aligned}
$$

which proves the result.

While many chains have reversible measure, most do not. If there is a pair of states with $p(x, y)>0$ and $p(y, x)=0$ then it is impossible to have $\mu(p(x, y)=\pi(y) p(y, x)$. The $M / G / 1$ queue also has this problem. The next result gives a necessary and sufficient condition for a chain to have a reversible measure.

Theorem 5.5.6. Kolmogorov's cycle condition. Suppose $p$ is irreducible. A necessary and sufficient condition for the existence of a reversible measure is that (i) $p(x, y)>0$ implies $p(y, x)>0$, and (ii) for any loop $x_{0}, x_{1}, \ldots, x_{n}=x_{0}$ with $\prod_{1 \leq i \leq n} p\left(x_{i}, x_{i-1}\right)>0$,

$$
\prod_{i=1}^{n} \frac{p\left(x_{i-1}, x_{i}\right)}{p\left(x_{i}, x_{i-1}\right)}=1
$$

Proof. To prove the necessity of this condition, we note that irreducibility implies that any stationary measure has $\mu(x)>0$ for all $x$, so (5.5.1) implies (i) holds. To check (ii), note that (5.5.1) implies that for the sequences considered above

$$
\prod_{i=1}^{n} \frac{p\left(x_{i-1}, x_{i}\right)}{p\left(x_{i}, x_{i-1}\right)}=\prod_{i=1}^{n} \frac{\mu\left(x_{i}\right)}{\mu\left(x_{i-1}\right)}=1
$$

To prove sufficiency, fix $a \in S$, set $\mu(a)=1$, and if $x_{0}=a, x_{1}, \ldots, x_{n}=x$ is a sequence with $\prod_{1 \leq i \leq n} p\left(x_{i}, x_{i-1}\right)>0$ (irreducibility implies such a sequence will exist), we let

$$
\mu(x)=\prod_{i=1}^{n} \frac{p\left(x_{i-1}, x_{i}\right)}{p\left(x_{i}, x_{i-1}\right)}
$$

The cycle condition guarantees that the last definition is independent of the path. To check (5.5.1) now, observe that if $p(y, x)>0$ then adding $x_{n+1}=y$ to the end of a path to $x$ we have

$$
\mu(x) \frac{p(x, y)}{p(y, x)}=\mu(y)
$$

Only special chains have reversible measures, but as the next result shows, many Markov chains have stationary measures.

Theorem 5.5.7. Let $x$ be a recurrent state, and let $T=\inf \{n \geq 1$ : $\left.X_{n}=x\right\}$. Then

$$
\mu_{x}(y)=E_{x}\left(\sum_{n=0}^{T-1} 1_{\left\{X_{n}=y\right\}}\right)=\sum_{n=0}^{\infty} P_{x}\left(X_{n}=y, T>n\right)
$$

defines a stationary measure.

Proof. This is called the "cycle trick." The proof in words is simple. $\mu_{x}(y)$ is the expected number of visits to $y$ in $\{0, \ldots, T-1\} . \mu_{x} p(y) \equiv \sum \mu_{x}(z) p(z, y)$ is the expected number of visits to $y$ in $\{1, \ldots, T\}$, which is $=\mu_{x}(y)$ since $X_{T}=X_{0}=x$.

![](https://cdn.mathpix.com/cropped/886c9149-6650-4f34-867d-452deeaaf80a-067.jpg?height=356&width=641&top_left_y=575&top_left_x=741)
Figure 5.5: Picture of the cycle trick.

To translate this intuition into a proof, let $\bar{p}_{n}(x, y)=P_{x}\left(X_{n}=y, T>\right. n)$ and use Fubini's theorem to get

$$
\sum_{y} \mu_{x}(y) p(y, z)=\sum_{n=0}^{\infty} \sum_{y} \bar{p}_{n}(x, y) p(y, z)
$$

Case 1. $z \neq x$.

$$
\begin{aligned}
\sum_{y} \bar{p}_{n}(x, y) p(y, z) & =\sum_{y} P_{x}\left(X_{n}=y, T>n, X_{n+1}=z\right) \\
& =P_{x}\left(T>n+1, X_{n+1}=z\right)=\bar{p}_{n+1}(x, z)
\end{aligned}
$$

so $\sum_{n=0}^{\infty} \sum_{y} \bar{p}_{n}(x, y) p(y, z)=\sum_{n=0}^{\infty} \bar{p}_{n+1}(x, z)=\mu_{x}(z)$ since $\bar{p}_{0}(x, z)=0$.
Case 2. $z=x$.
$\sum_{y} \bar{p}_{n}(x, y) p(y, x)=\sum_{y} P_{x}\left(X_{n}=y, T>n, X_{n+1}=x\right)=P_{x}(T=n+1)$
so $\sum_{n=0}^{\infty} \sum_{y} \bar{p}_{n}(x, y) p(y, x)=\sum_{n=0}^{\infty} P_{x}(T=n+1)=1=\mu_{x}(x)$ since by definition $P_{x}(T=0)=0$. $\square$

Remark. If $x$ is transient, then we have $\mu_{x} p(z) \leq \mu_{x}(z)$ with equality for all $z \neq x$.

Technical Note. To show that we are not cheating, we should prove that $\mu_{x}(y)<\infty$ for all $y$. First, observe that $\mu_{x} p=\mu_{x}$ implies $\mu_{x} p^{n}=\mu_{x}$ for all $n \geq 1$, and $\mu_{x}(x)=1$, so if $p^{n}(y, x)>0$ then $\mu_{x}(y)<\infty$. Since the last result is true for all $n$, we see that $\mu_{x}(y)<\infty$ whenever $\rho_{y x}>0$, but this is good enough. By Theorem 5.3.2, when $x$ is recurrent $\rho_{x y}>0$
implies $\rho_{y x}>0$, and it follows from the argument above that $\mu_{x}(y)<\infty$. If $\rho_{x y}=0$ then $\mu_{x}(y)=0$.

Example 5.5.8. Renewal chain. $S=\{0,1,2, \ldots\}, f_{k} \geq 0$, and $\sum_{k=1}^{\infty} f_{k}=1$.

$$
\begin{aligned}
p(0, j)=f_{j+1} & \text { for } j \geq 0 \\
p(i, i-1)=1 & \text { for } i \geq 1 \\
p(i, j)=0 & \text { otherwise }
\end{aligned}
$$

To explain the definition, let $\xi_{1}, \xi_{2}, \ldots$ be i.i.d. with $P\left(\xi_{m}=j\right)=f_{j}$, let $T_{0}=i_{0}$ and for $k \geq 1$ let $T_{k}=T_{k-1}+\xi_{k} . T_{k}$ is the time of the $k$ th arrival in a renewal process that has its first arrival at time $i_{0}$. Let

$$
Y_{m}= \begin{cases}1 & \text { if } m \in\left\{T_{0}, T_{1}, T_{2}, \ldots\right\} \\ 0 & \text { otherwise }\end{cases}
$$

and let $X_{n}=\inf \left\{m-n: m \geq n, Y_{m}=1\right\} . Y_{m}=1$ if a renewal occurs at time $m$, and $X_{n}$ is the amount of time until the first renewal $\geq n$.

An example should help clarify the definition:

$$
\begin{array}{llllllllllllll}
Y_{n} & 0 & 0 & 0 & 1 & 0 & 0 & 1 & 1 & 0 & 0 & 0 & 0 & 1 \\
X_{n} & 3 & 2 & 1 & 0 & 2 & 1 & 0 & 0 & 4 & 3 & 2 & 1 & 0
\end{array}
$$

It is clear that if $X_{n}=i>0$ then $X_{n+1}=i-1$. When $X_{n}=0$, the next $\xi$ will be equal to $k$ with probability $f_{k}$. In this case the next positive value of $Y$ is at time $n+k$, so $X_{n+1}=k-1$.
$P_{0}\left(T_{0}<\infty\right)=1$ so 0 is always recurrent. If $f_{K}>0$ but $f_{k}=0$ for $k> K$ the chain is not irreducible on $\{0,1,2, \ldots\}$ but it is on $\{0,1, \ldots K-1\}$ To compute the stationary distribution we use the cycle trick starting at 0 . The chain will hit 0 if and only if the first jump is to a point $k \geq j$ so $\mu_{0}(j)=P(\xi>j) . E_{0} T_{0}=\sum_{j=0}^{\infty} P(\xi>j)=E \xi$. If $E \xi<\infty$ then $\pi(j)=P(\xi>j) / E \xi$ is a stationary distribution.

Theorem 5.5.7 allows us to construct a stationary measure for each closed set of recurrent states. Conversely, we have:

Theorem 5.5.9. If $p$ is irreducible and recurrent (i.e., all states are) then the stationary measure is unique up to constant multiples.

Proof. Let $\nu$ be a stationary measure and let $a \in S$.

$$
\nu(z)=\sum_{y} \nu(y) p(y, z)=\nu(a) p(a, z)+\sum_{y \neq a} \nu(y) p(y, z)
$$

Using the last identity to replace $\nu(y)$ on the right-hand side,

$$
\begin{aligned}
\nu(z)=\nu(a) p(a, z) & +\sum_{y \neq a} \nu(a) p(a, y) p(y, z) \\
& +\sum_{x \neq a} \sum_{y \neq a} \nu(x) p(x, y) p(y, z) \\
=\nu(a) P_{a}\left(X_{1}=z\right) & +\nu(a) P_{a}\left(X_{1} \neq a, X_{2}=z\right) \\
& +P_{\nu}\left(X_{0} \neq a, X_{1} \neq a, X_{2}=z\right)
\end{aligned}
$$

Continuing in the obvious way, we get

$$
\begin{aligned}
\nu(z) & =\nu(a) \sum_{m=1}^{n} P_{a}\left(X_{k} \neq a, 1 \leq k<m, X_{m}=z\right) \\
& +P_{\nu}\left(X_{j} \neq a, 0 \leq j<n, X_{n}=z\right)
\end{aligned}
$$

The last term is $\geq 0$. Letting $n \rightarrow \infty$ gives $\nu(z) \geq \nu(a) \mu_{a}(z)$, where $\mu_{a}$ is the measure defined in Theorem 5.5.7 for $x=a$.

It is tempting to claim that recurrence implies

$$
P_{\nu}\left(X_{j} \neq a, 0 \leq j<n\right) \rightarrow 0
$$

but $\nu$ may be an infinite measure, so we need another approach. It follows from Theorem 5.5.7 that $\mu_{a}$ is a stationary measure with $\mu_{a}(a)=1$. (Here we are summing from 1 to $T$ rather than from 0 to $T-1$.) To turn the $\geq$ in the last equation into $=$, we observe

$$
\nu(a)=\sum_{x} \nu(x) p^{n}(x, a) \geq \nu(a) \sum_{x} \mu_{a}(x) p^{n}(x, a)=\nu(a) \mu_{a}(a)=\nu(a)
$$

Since $\nu(x) \geq \nu(a) \mu_{a}(x)$ and the left- and right-hand sides are equal we must have $\nu(x)=\nu(a) \mu_{a}(x)$ whenever $p^{n}(x, a)>0$. Since $p$ is irreducible, it follows that $\nu(x)=\nu(a) \mu_{a}(x)$ for all $x \in S$, and the proof is complete.

Theorems 5.5.7 and 5.5.9 make a good team. The first result gives us a formula for a stationary distribution we call $\mu_{x}$, and the second shows it is unique up to constant multiples. Together they allow us to derive a lot of formulas.

Having examined the existence and uniqueness of stationary measures, we turn our attention now to stationary distributions, i.e., probability measures $\pi$ with $\pi p=\pi$. Stationary measures may exist for transient chains, e.g., random walks in $d \geq 3$, but

Theorem 5.5.10. If there is a stationary distribution then all states $y$ that have $\pi(y)>0$ are recurrent.

Proof. Since $\pi p^{n}=\pi$, Fubini's theorem implies

$$
\sum_{x} \pi(x) \sum_{n=1}^{\infty} p^{n}(x, y)=\sum_{n=1}^{\infty} \pi(y)=\infty
$$

when $\pi(y)>0$. Using Theorem 5.3.1 now gives

$$
\infty=\sum_{x} \pi(x) \frac{\rho_{x y}}{1-\rho_{y y}} \leq \frac{1}{1-\rho_{y y}}
$$

since $\rho_{x y} \leq 1$ and $\pi$ is a probability measure. So $\rho_{y y}=1$.
Theorem 5.5.11. If $p$ is irreducible and has stationary distribution $\pi$, then

$$
\pi(x)=1 / E_{x} T_{x}
$$

Remark. Recycling Chung's quote regarding Theorem 4.6.9, we note that the proof will make $\pi(x)=1 / E_{x} T_{x}$ obvious, but it seems incredible that

$$
\sum_{x} \frac{1}{E_{x} T_{x}} p(x, y)=\frac{1}{E_{y} T_{y}}
$$

Proof. Irreducibility implies $\pi(x)>0$ so all states are recurrent by Theorem 5.5.10. From Theorem 5.5.7,

$$
\mu_{x}(y)=\sum_{n=0}^{\infty} P_{x}\left(X_{n}=y, T_{x}>n\right)
$$

defines a stationary measure with $\mu_{x}(x)=1$, and Fubini's theorem implies

$$
\sum_{y} \mu_{x}(y)=\sum_{n=0}^{\infty} P_{x}\left(T_{x}>n\right)=E_{x} T_{x}
$$

By Theorem 5.5.9, the stationary measure is unique up to constant multiples, so $\pi(x)=\mu_{x}(x) / E_{x} T_{x}$. Since $\mu_{x}(x)=1$ by definition, the desired result follows.

If a state $x$ has $E_{x} T_{x}<\infty$, it is said to be positive recurrent. A recurrent state with $E_{x} T_{x}=\infty$ is said to be null recurrent. Theorem 5.6.1 will explain these names. The next result helps us identify positive recurrent states.

Theorem 5.5.12. If $p$ is irreducible then the following are equivalent:
(i) Some $x$ is positive recurrent.
(ii) There is a stationary distribution.
(iii) All states are positive recurrent.

This result shows that being positive recurrent is a class property. If it holds for one state in an irreducible set, then it is true for all.

Proof. (i) implies (ii). If $x$ is positive recurrent then

$$
\pi(y)=\sum_{n=0}^{\infty} P_{x}\left(X_{n}=y, T_{x}>n\right) / E_{x} T_{x}
$$

defines a stationary distribution.
(ii) implies (iii). Theorem 5.5.11 implies $\pi(y)=1 / E_{y} T_{y}$, and irreducibility tells us $\pi(y)>0$ for all $y$, so $E_{y} T_{y}<\infty$.
(iii) implies (i). Trivial.

Example 5.5.13. Birth and death chains have a stationary distribution if and only if

$$
\sum_{x} \prod_{k=1}^{x} \frac{p_{k-1}}{q_{k}}<\infty
$$

By Theorem 5.3.11, the chain is recurrent if and only if

$$
\sum_{m=0}^{\infty} \prod_{j=1}^{m} \frac{q_{j}}{p_{j}}=\infty
$$

Example 5.5.14. $M / G / 1$ queue. Let $\mu=\sum k a_{k}$ be the mean number of customers that arrive during one service time. In Example 5.3.7, we showed that the chain is recurrent if and only if $\mu \leq 1$. We will now show that the chain is positive recurrent if and only if $\mu<1$. First, suppose that $\mu<1$. When $X_{n}>0$, the chain behaves like a random walk that has jumps with mean $\mu-1$, so if $N=\inf \left\{n \geq 0: X_{n}=0\right\}$ then $X_{N \wedge n}-(\mu-1)(N \wedge n)$ is a martingale. If $X_{0}=x>0$ then the martingale property implies

$$
x=E_{x} X_{N \wedge n}+(1-\mu) E_{x}(N \wedge n) \geq(1-\mu) E_{x}(N \wedge n)
$$

since $X_{N \wedge n} \geq 0$, and it follows that $E_{x} N \leq x /(1-\mu)$.
To prove that there is equality, observe that $X_{n}$ decreases by at most one each time and for $x \geq 1, E_{x} T_{x-1}=E_{1} T_{0}$, so $E_{x} N=c x$. To identify the constant, observe that

$$
E_{1} N=1+\sum_{k=0}^{\infty} a_{k} E_{k} N
$$

so $c=1+\mu c$ and $c=1 /(1-\mu)$. If $X_{0}=0$ then $p(0,0)=a_{0}+a_{1}$ and $p(0, k-1)=a_{k}$ for $k \geq 2$. By considering what happens on the first
jump, we see that (the first term may look wrong, but recall $k-1=0$ when $k=1$ )

$$
E_{0} T_{0}=1+\sum_{k=1}^{\infty} a_{k} \frac{k-1}{1-\mu}=1+\frac{\mu-\left(1-a_{0}\right)}{1-\mu}=\frac{a_{0}}{1-\mu}<\infty
$$

This shows that the chain is positive recurrent if $\mu<1$. To prove the converse, observe that the arguments above show that if $E_{0} T_{0}<\infty$ then $E_{k} N<\infty$ for all $k, E_{k} N=c k$, and $c=1 /(1-\mu)$, which is impossible if $\mu \geq 1$.

The last result when combined with Theorem 5.5.7 and 5.5.11 allows us to conclude that the stationary distribution has $\pi(0)=(1-\mu) / a_{0}$. This may not seem like much, but the equations in $\pi p=\pi$ are:

$$
\begin{aligned}
& \pi(0)=\pi(0)\left(a_{0}+a_{1}\right)+\pi(1) a_{0} \\
& \pi(1)=\pi(0) a_{2}+\pi(1) a_{1}+\pi(2) a_{0} \\
& \pi(2)=\pi(0) a_{3}+\pi(1) a_{2}+\pi(2) a_{1}+\pi(3) a_{0}
\end{aligned}
$$

or, in general, for $j \geq 1$

$$
\pi(j)=\sum_{i=0}^{j+1} \pi(i) a_{j+1-i}
$$

The equations have a "triangular" form, so knowing $\pi(0)$, we can solve for $\pi(1), \pi(2), \ldots$ The first expression,

$$
\pi(1)=\pi(0)\left(1-\left(a_{0}+a_{1}\right)\right) / a_{0}
$$

is simple, but the formulas get progressively messier, and there is no nice closed form solution.

To close the section, we will give a self-contained proof of
Theorem 5.5.15. If $p$ is irreducible and has a stationary distribution $\pi$ then any other stationary measure is a multiple of $\pi$.

Remark. This result is a consequence of Theorems 5.5.10 and Theorem 5.5.9, but we find the method of proof amusing.

Proof. Since $p$ is irreducible, $\pi(x)>0$ for all $x$. Let $\varphi$ be a concave function that is bounded on ( $0, \infty$ ), e.g., $\varphi(x)=x /(x+1)$. Define the entropy of $\mu$ by

$$
\mathcal{E}(\mu)=\sum_{y} \varphi\left(\frac{\mu(y)}{\pi(y)}\right) \pi(y)
$$

The reason for the name will become clear during the proof.

$$
\begin{aligned}
\mathcal{E}(\mu p) & =\sum_{y} \varphi\left(\sum_{x} \frac{\mu(x) p(x, y)}{\pi(y)}\right) \pi(y)=\sum_{y} \varphi\left(\sum_{x} \frac{\mu(x)}{\pi(x)} \cdot \frac{\pi(x) p(x, y)}{\pi(y)}\right) \pi(y) \\
& \geq \sum_{y} \sum_{x} \varphi\left(\frac{\mu(x)}{\pi(x)}\right) \frac{\pi(x) p(x, y)}{\pi(y)} \pi(y)
\end{aligned}
$$

since $\varphi$ is concave, and $\nu(x)=\pi(x) p(x, y) / \pi(y)$ is a probability distribution. Since the $\pi(y)$ 's cancel and $\sum_{y} p(x, y)=1$, the last expression $=\mathcal{E}(\mu)$, and we have shown $\mathcal{E}(\mu p) \geq \mathcal{E}(\mu)$, i.e., the entropy of an arbitrary initial measure $\mu$ is increased by an application of $p$.

If $p(x, y)>0$ for all $x$ and $y$, and $\mu p=\mu$, it follows that $\mu(x) / \pi(x)$ must be constant, for otherwise there would be strict inequality in the application of Jensen's inequality. To get from the last special case to the general result, observe that if $p$ is irreducible

$$
\bar{p}(x, y)=\sum_{n=1}^{\infty} 2^{-n} p^{n}(x, y)>0 \quad \text { for all } x, y
$$

and $\mu p=\mu$ implies $\mu \bar{p}=\mu$.

## Exercises

5.5.1. Find the stationary distribution for the Bernoulli-Laplace model of diffusion from Exercise 5.1.5.
5.5.2. Let $w_{x y}=P_{x}\left(T_{y}<T_{x}\right)$. Show that $\mu_{x}(y)=w_{x y} / w_{y x}$.
5.5.3. Show that if $p$ is irreducible and recurrent then

$$
\mu_{x}(y) \mu_{y}(z)=\mu_{x}(z)
$$

5.5.4. Suppose $p$ is irreducible and positive recurrent. Then $E_{x} T_{y}<\infty$ for all $x, y$.
5.5.5. Suppose $p$ is irreducible and has a stationary measure $\mu$ with $\sum_{x} \mu(x)=\infty$. Then $p$ is not positive recurrent.
5.5.6. Use Theorems 5.5.7 and 5.5.9 to show that for simple random walk, (i) the expected number of visits to $k$ between successive visits to 0 is 1 for all $k$, and (ii) if we start from $k$ the expected number of visits to $k$ before hitting 0 is $2 k$.
5.5.7. Let $\xi_{1}, \xi_{2}, \ldots$ be i.i.d. with $P\left(\xi_{m}=k\right)=a_{k+1}$ for $k \geq-1$, let $S_{n}=x+\xi_{1}+\cdots+\xi_{n}$, where $x \geq 0$, and let

$$
X_{n}=S_{n}+\left(\min _{m \leq n} S_{m}\right)^{-}
$$

(5.1.1) shows that $X_{n}$ has the same distribution as the $M / G / 1$ queue starting from $X_{0}=x$. Use this representation to conclude that if $\mu= \sum k a_{k}<1$, then as $n \rightarrow \infty$

$$
\frac{1}{n}\left|\left\{m \leq n: X_{m-1}=0, \xi_{m}=-1\right\}\right| \rightarrow(1-\mu) \quad \text { a.s. }
$$

and hence $\pi(0)=(1-\mu) / a_{0}$ as proved above.
5.5.8. $M / M / \infty$ queue. In this chain, introduced in Exercise 5.3.8,

$$
X_{n+1}=\sum_{m=1}^{X_{n}} \xi_{n, m}+Y_{n+1}
$$

where $\xi_{n, m}$ are i.i.d. Bernoulli with mean $p$ and $Y_{n+1}$ is an independent Poisson mean $\lambda$. Compute the distribution at time 1 when $X_{0}=$ Poissson $(\mu)$ and use the result to find the stationary distribution.
5.5.9. Let $X_{n} \geq 0$ be a Markov chain and suppose $E_{x} X_{1} \leq x-\epsilon$ for $x>K$, where $\epsilon>0$. Let $Y_{n}=X_{n}+n \epsilon$ and $\tau=\inf \left\{n: X_{n} \leq K\right\}$. $Y_{n \wedge \tau}$ is a positive supermartingale and the optional stopping theorem implies $E_{x} \tau \leq x / \epsilon$. With assumpetions about the behavior of the chain starting from points $x \leq K$ this leads to conditions for positive recurrence

### 5.6 Asymptotic Behavior

The first topic in this section is to investigate the asymptotic behavior of $p^{n}(x, y)$. If $y$ is transient, $\sum_{n} p^{n}(x, y)<\infty$, so $p^{n}(x, y) \rightarrow 0$ as $n \rightarrow \infty$. To deal with the recurrent states, we let

$$
N_{n}(y)=\sum_{m=1}^{n} 1_{\left\{X_{m}=y\right\}}
$$

be the number of visits to $y$ by time $n$.
Theorem 5.6.1. Suppose $y$ is recurrent. For any $x \in S$, as $n \rightarrow \infty$

$$
\frac{N_{n}(y)}{n} \rightarrow \frac{1}{E_{y} T_{y}} 1_{\left\{T_{y}<\infty\right\}} \quad P_{x}-\text { a.s. }
$$

Here $1 / \infty=0$.
Proof. Suppose first that we start at $y$. Let $R(k)=\min \left\{n \geq 1: N_{n}(y)=\right. k\}=$ the time of the $k$ th return to $y$. Let $t_{k}=R(k)-R(k-1)$, where $R(0)=0$. Since we have assumed $X_{0}=y, t_{1}, t_{2}, \ldots$ are i.i.d. and the strong law of large numbers implies

$$
R(k) / k \rightarrow E_{y} T_{y} \quad P_{y} \text {-a.s. }
$$

Since $R\left(N_{n}(y)\right) \leq n<R\left(N_{n}(y)+1\right)$,

$$
\frac{R\left(N_{n}(y)\right)}{N_{n}(y)} \leq \frac{n}{N_{n}(y)}<\frac{R\left(N_{n}(y)+1\right)}{N_{n}(y)+1} \cdot \frac{N_{n}(y)+1}{N_{n}(y)}
$$

Letting $n \rightarrow \infty$, and recalling $N_{n}(y) \rightarrow \infty$ a.s. since $y$ is recurrent, we have

$$
\frac{n}{N_{n}(y)} \rightarrow E_{y} T_{y} \quad P_{y} \text {-a.s. }
$$

To generalize now to $x \neq y$, observe that if $T_{y}=\infty$ then $N_{n}(y)=0$ for all $n$ and hence

$$
N_{n}(y) / n \rightarrow 0 \quad \text { on }\left\{T_{y}=\infty\right\}
$$

The strong Markov property implies that conditional on $\left\{T_{y}<\infty\right\}$, $t_{2}, t_{3}, \ldots$ are i.i.d. and have $P_{x}\left(t_{k}=n\right)=P_{y}\left(T_{y}=n\right)$, so

$$
R(k) / k=t_{1} / k+\left(t_{2}+\cdots+t_{k}\right) / k \rightarrow 0+E_{y} T_{y} \quad P_{x} \text {-a.s. }
$$

Repeating the proof for the case $x=y$ shows

$$
N_{n}(y) / n \rightarrow 1 / E_{y} T_{y} \quad P_{x} \text {-a.s. on }\left\{T_{y}<\infty\right\}
$$

and combining this with the result for $\left\{T_{y}=\infty\right\}$ completes the proof.
Remark. Theorem 5.6.1 should help explain the terms positive and null recurrent. If we start from $x$, then in the first case the asymptotic fraction of time spent at $x$ is positive and in the second case it is 0 .

Since $0 \leq N_{n}(y) / n \leq 1$, it follows from the bounded convergence theorem that $E_{x} N_{n}(y) / n \rightarrow E_{x}\left(1_{\left\{T_{y}<\infty\right\}} / E_{y} T_{y}\right)$, so

$$
\begin{equation*}
\frac{1}{n} \sum_{m=1}^{n} p^{m}(x, y) \rightarrow \rho_{x y} / E_{y} T_{y} \tag{5.6.1}
\end{equation*}
$$

The last result was proved for recurrent $y$ but also holds for transient $y$, since in that case, $E_{y} T_{y}=\infty$, and the limit is 0 , since $\sum_{m} p^{m}(x, y)<\infty$.
(5.6.1) shows that the sequence $p^{n}(x, y)$ always converges in the Cesaro sense. The next example shows that $p^{n}(x, y)$ need not converge.

## Example 5.6.2.

$$
p=\left(\begin{array}{ll}
0 & 1 \\
1 & 0
\end{array}\right) \quad p^{2}=\left(\begin{array}{ll}
1 & 0 \\
0 & 1
\end{array}\right) \quad p^{3}=p, \quad p^{4}=p^{2}, \ldots
$$

A similar problem also occurs in the Ehrenfest chain. In that case, if $X_{0}$ is even, then $X_{1}$ is odd, $X_{2}$ is even, $\ldots$ so $p^{n}(x, x)=0$ unless $n$ is even. It is easy to construct examples with $p^{n}(x, x)=0$ unless $n$ is a multiple of 3 or 17 or ...

Theorem 5.6.6 below will show that this "periodicity" is the only thing that can prevent the convergence of the $p^{n}(x, y)$. First, we need a definition and two preliminary results. Let $x$ be a recurrent state, let $I_{x}=\left\{n \geq 1: p^{n}(x, x)>0\right\}$, and let $d_{x}$ be the greatest common divisor of $I_{x} . d_{x}$ is called the period of $x$.

Example 5.6.3. Triangle and square. Consider the transition matrix:

|  | -2 | -1 | 0 | 1 | 2 | 3 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| -2 | 0 | 0 | 1 | 0 | 0 | 0 |
| -1 | 1 | 0 | 0 | 0 | 0 | 0 |
| 0 | 0 | 0.5 | 0 | 0.5 | 0 | 0 |
| 1 | 0 | 0 | 0 | 0 | 1 | 0 |
| 2 | 0 | 0 | 0 | 0 | 0 | 1 |
| 3 | 0 | 0 | 1 | 0 | 0 | 0 |

In words, from 0 we are equally likely to go to 1 or -1 . From -1 we go with probability one to -2 and then back to 0 , from 1 we go to 2 then to 3 and back to 0 . The name refers to the fact that $0 \rightarrow-1 \rightarrow-2 \rightarrow 0$ is a triangle and $0 \rightarrow 1 \rightarrow 2 \rightarrow 3 \rightarrow 0$ is a square.
![](https://cdn.mathpix.com/cropped/886c9149-6650-4f34-867d-452deeaaf80a-076.jpg?height=314&width=465&top_left_y=1246&top_left_x=846)

Clearly, $p^{3}(0,0)>0$ and $p^{4}(0,0)>0$ so $3,4 \in I_{0}$ and hence $d_{0}=1$.
The next result says that the period is a class property. In particular we can use it to conclude that in the last example all states have period 1.

Lemma 5.6.4. If $\rho_{x y}>0$ then $d_{y}=d_{x}$.
Proof. Let $K$ and $L$ be such that $p^{K}(x, y)>0$ and $p^{L}(y, x)>0$. ( $x$ is recurrent, so $\rho_{y x}>0$.)

$$
p^{K+L}(y, y) \geq p^{L}(y, x) p^{K}(x, y)>0
$$

so $d_{y}$ divides $K+L$, abbreviated $d_{y} \mid(K+L)$. Let $n$ be such that $p^{n}(x, x)>$ 0 .

$$
p^{K+n+L}(y, y) \geq p^{L}(y, x) p^{n}(x, x) p^{K}(x, y)>0
$$

so $d_{y} \mid(K+n+L)$, and hence $d_{y} \mid n$. Since $n \in I_{x}$ is arbitrary, $d_{y} \mid d_{x}$. Interchanging the roles of $y$ and $x$ gives $d_{x} \mid d_{y}$, and hence $d_{x}=d_{y}$.

If a chain is irreducible and $d_{x}=1$ it is said to be aperiodic. The easiest way to check this is to find a state with $p(x, x)>0$. The $M / G / 1$ queue has $a_{k}>0$ for all $k \geq 0$, so it has this property. The renewal chain is aperiodic if g.c.d. $\left\{k: f_{k}>0\right\}=1$.

Lemma 5.6.5. If $d_{x}=1$ then $p^{m}(x, x)>0$ for $m \geq m_{0}$.

Proof by example. Consider the renewal chain (Example 5.5.8) with $f_{5}= f_{12}=1 / 2.5,12 \in I_{0}$. Since $m, n \in I_{0}$ implies $m+n \in I_{0}$

$$
\begin{gathered}
I_{0}=\{5,10,12,15,17,20,22,24,25,27,29,30,32, \\
34,35,36,37,39,40,41,42,43, \ldots\}
\end{gathered}
$$

To check this note that 5 gives rise to $10=5+5$ and $17=5+12$, 10 to 15 and 22 , 12 to 17 and 24 , etc. Once we have five consecutive numbers in $I_{0}$, here 39-43, we have all the rest.

Proof. We begin by observing that it enough to show that $I_{x}$ will contain two consecutive integers: $k$ and $k+1$. For then it will contain $2 k, 2 k+ 1,2 k+2,3 k, 3 k+1,3 k+2,3 k+3$, and so on until we have $k$ consecutive integers and then we $(k-1) k,(k-1) k+1, \ldots(k-1) k+k-1$ and wehave the rest.

To show that there are two consecutive integers, we cheat and use a fact from number theory: if the greatest common divisor of a set $I_{x}$ is 1 then there are integers $i_{1}, \ldots i_{m} \in I_{x}$ and (positive or negative) integer coefficients $c_{i}$ so that $c_{1} i_{1}+\cdots+c_{m} i_{m}=1$. Let $a_{i}=c_{i}^{+}$and $b_{i}=\left(c_{i}\right)^{-}$. In words the $a_{i}$ are the positive coefficients and the $b_{i}$ are -1 times the negative coefficients. Rearranging the last equation gives

$$
a_{1} i_{1}+\cdots+a_{m} i_{m}=\left(b_{1} i_{1}+\cdots+b_{m} i_{m}\right)+1
$$

and we have found our two consecutive integers in $I_{x}$. In the numerical example $5 \cdot 5-2 \cdot 12=1$ which gives us consecutive integers 24 and 25 .

Theorem 5.6.6. Convergence theorem. Suppose $p$ is irreducible, aperiodic (i.e., all states have $d_{x}=1$ ), and has stationary distribution $\pi$. Then, as $n \rightarrow \infty, p^{n}(x, y) \rightarrow \pi(y)$.

Proof. Let $S^{2}=S \times S$. Define a transition probability $\bar{p}$ on $S \times S$ by

$$
\bar{p}\left(\left(x_{1}, y_{1}\right),\left(x_{2}, y_{2}\right)\right)=p\left(x_{1}, x_{2}\right) p\left(y_{1}, y_{2}\right)
$$

i.e., each coordinate moves independently. Our first step is to check that $\bar{p}$ is irreducible. This may seem like a silly thing to do first, but this is the only step that requires aperiodicity. Since $p$ is irreducible, there are
$K, L$, so that $p^{K}\left(x_{1}, x_{2}\right)>0$ and $p^{L}\left(y_{1}, y_{2}\right)>0$. From Lemma 5.6.5 it follows that if $M$ is large $p^{L+M}\left(x_{2}, x_{2}\right)>0$ and $p^{K+M}\left(y_{2}, y_{2}\right)>0$, so

$$
\bar{p}^{K+L+M}\left(\left(x_{1}, y_{1}\right),\left(x_{2}, y_{2}\right)\right)>0
$$

Our second step is to observe that since the two coordinates are independent, $\bar{\pi}(a, b)=\pi(a) \pi(b)$ defines a stationary distribution for $\bar{p}$, and Theorem 5.5.10 implies that for $\bar{p}$ all states are recurrent. Let ( $X_{n}, Y_{n}$ ) denote the chain on $S \times S$, and let $T$ be the first time that this chain hits the diagonal $\{(y, y): y \in S\}$. Let $T_{(x, x)}$ be the hitting time of $(x, x)$. Since $\bar{p}$ is irreducible and recurrent, $T_{(x, x)}<\infty$ a.s. and hence $T<\infty$ a.s. The final step is to observe that on $\{T \leq n\}$, the two coordinates $X_{n}$ and $Y_{n}$ have the same distribution. By considering the time and place of the first intersection and then using the Markov property,

$$
\begin{aligned}
P\left(X_{n}=y, T \leq n\right) & =\sum_{m=1}^{n} \sum_{x} P\left(T=m, X_{m}=x, X_{n}=y\right) \\
& =\sum_{m=1}^{n} \sum_{x} P\left(T=m, X_{m}=x\right) P\left(X_{n}=y \mid X_{m}=x\right) \\
& =\sum_{m=1}^{n} \sum_{x} P\left(T=m, Y_{m}=x\right) P\left(Y_{n}=y \mid Y_{m}=x\right) \\
& =P\left(Y_{n}=y, T \leq n\right)
\end{aligned}
$$

To finish up, we observe that

$$
\begin{aligned}
P\left(X_{n}=y\right) & =P\left(Y_{n}=y, T \leq n\right)+P\left(X_{n}=y, T>n\right) \\
& \leq P\left(Y_{n}=y\right)+P\left(X_{n}=y, T>n\right)
\end{aligned}
$$

and similarly, $P\left(Y_{n}=y\right) \leq P\left(X_{n}=y\right)+P\left(Y_{n}=y, T>n\right)$. So

$$
\left|P\left(X_{n}=y\right)-P\left(Y_{n}=y\right)\right| \leq P\left(X_{n}=y, T>n\right)+P\left(Y_{n}=y, T>n\right)
$$

and summing over $y$ gives

$$
\sum_{y}\left|P\left(X_{n}=y\right)-P\left(Y_{n}=y\right)\right| \leq 2 P(T>n)
$$

If we let $X_{0}=x$ and let $Y_{0}$ have the stationary distribution $\pi$, then $Y_{n}$ has distribution $\pi$, and it follows that

$$
\sum_{y}\left|p^{n}(x, y)-\pi(y)\right| \leq 2 P(T>n) \rightarrow 0
$$

proving the desired result. If we recall the definition of the total variation distance given in Section 3.6, the last conclusion can be written as

$$
\left\|p^{n}(x, \cdot)-\pi(\cdot)\right\| \leq P(T>n) \rightarrow 0
$$

At first glance, it may seem strange to prove the convergence theorem by running independent copies of the chain. An approach that is slightly more complicated but explains better what is happening is to define

$$
q\left(\left(x_{1}, y_{1}\right),\left(x_{2}, y_{2}\right)\right)= \begin{cases}p\left(x_{1}, x_{2}\right) p\left(y_{1}, y_{2}\right) & \text { if } x_{1} \neq y_{1} \\ p\left(x_{1}, x_{2}\right) & \text { if } x_{1}=y_{1}, x_{2}=y_{2} \\ 0 & \text { otherwise }\end{cases}
$$

In words, the two coordinates move independently until they hit and then move together. It is easy to see from the definition that each coordinate is a copy of the original process. If $T^{\prime}$ is the hitting time of the diagonal for the new chain $\left(X_{n}^{\prime}, Y_{n}^{\prime}\right)$, then $X_{n}^{\prime}=Y_{n}^{\prime}$ on $T^{\prime} \leq n$, so it is clear that

$$
\sum_{y}\left|P\left(X_{n}^{\prime}=y\right)-P\left(Y_{n}^{\prime}=y\right)\right| \leq 2 P\left(X_{n}^{\prime} \neq Y_{n}^{\prime}\right)=2 P\left(T^{\prime}>n\right)
$$

On the other hand, $T$ and $T^{\prime}$ have the same distribution so $P\left(T^{\prime}>n\right) \rightarrow$ 0 , and the conclusion follows as before. The technique used in the last proof is called coupling. Generally, this term refers to building two sequences $X_{n}$ and $Y_{n}$ on the same space to conclude that $X_{n}$ converges in distribution by showing $P\left(X_{n} \neq Y_{n}\right) \rightarrow 0$, or more generally, that for some metric $\rho, \rho\left(X_{n}, Y_{n}\right) \rightarrow 0$ in probability.

## Exercises

5.6.1. Suppose $S=\{0,1\}$ and

$$
p=\left(\begin{array}{cc}
1-\alpha & \alpha \\
\beta & 1-\beta
\end{array}\right)
$$

Use induction to show that

$$
P_{\mu}\left(X_{n}=0\right)=\frac{\beta}{\alpha+\beta}+(1-\alpha-\beta)^{n}\left\{\mu(0)-\frac{\beta}{\alpha+\beta}\right\}
$$

5.6.2. Show that if $S$ is finite and $p$ is irreducible and aperiodic, then there is an $m$ so that $p^{m}(x, y)>0$ for all $x, y$.
5.6.3. Show that if $S$ is finite, $p$ is irreducible and aperiodic, and $T$ is the coupling time defined in the proof of Theorem 5.6.6 then $P(T>n) \leq C r^{n}$ for some $r<1$ and $C<\infty$. So the convergence to equilibrium occurs exponentially rapidly in this case. Hint: First consider the case in which $p(x, y)>0$ for all $x$ and $y$ and reduce the general case to this one by looking at a power of $p$.
5.6.4. For any transition matrix $p$, define

$$
\alpha_{n}=\sup _{i, j} \frac{1}{2} \sum_{k}\left|p^{n}(i, k)-p^{n}(j, k)\right|
$$

The $1 / 2$ is there because for any $i$ and $j$ we can define r.v.'s $X$ and $Y$ so that $P(X=k)=p^{n}(i, k), P(Y=k)=p^{n}(j, k)$, and

$$
P(X \neq Y)=(1 / 2) \sum_{k}\left|p^{n}(i, k)-p^{n}(j, k)\right|
$$

Show that $\alpha_{m+n} \leq \alpha_{n} \alpha_{m}$. Here you may find the coupling interpretation may help you from getting lost in the algebra. Using Lemma 2.7.1, we can conclude that

$$
\frac{1}{n} \log \alpha_{n} \rightarrow \inf _{m \geq 1} \frac{1}{m} \log \alpha_{m}
$$

so if $\alpha_{m}<1$ for some $m$, it approaches 0 exponentially fast.
5.6.5. Strong law for additive functionals. Suppose $p$ is irreducible and has stationary distribution $\pi$. Let $f$ be a function that has $\sum|f(y)| \pi(y)< \infty$. Let $T_{x}^{k}$ be the time of the $k$ th return to $x$. (i) Show that

$$
V_{k}^{f}=f\left(X\left(T_{x}^{k}\right)\right)+\cdots+f\left(X\left(T_{x}^{k+1}-1\right)\right), \quad k \geq 1 \text { are i.i.d. }
$$

with $E\left|V_{k}^{f}\right|<\infty$. (ii) Let $K_{n}=\inf \left\{k: T_{x}^{k} \geq n\right\}$ and show that

$$
\frac{1}{n} \sum_{m=1}^{K_{n}} V_{m}^{f} \rightarrow \frac{E V_{1}^{f}}{E_{x} T_{x}^{1}}=\sum f(y) \pi(y) \quad P_{\mu}-\text { a.s. }
$$

(iii) Show that $\max _{1 \leq m \leq n} V_{m}^{|f|} / n \rightarrow 0$ and conclude

$$
\frac{1}{n} \sum_{m=1}^{n} f\left(X_{m}\right) \rightarrow \sum_{y} f(y) \pi(y) \quad P_{\mu}-\text { a.s. }
$$

for any initial distribution $\mu$.
5.6.6. Central limit theorem for additive functionals. Suppose in addition to the conditions in the Exercise 5.6.5 that $\sum f(y) \pi(y)=0$, and $E_{x}\left(V_{k}^{|f|}\right)^{2}<\infty$. (i) Use the random index central limit theorem (Exercise 3.4.6) to conclude that for any initial distribution $\mu$

$$
\frac{1}{\sqrt{n}} \sum_{m=1}^{K_{n}} V_{m}^{f} \Rightarrow c \chi \quad \text { under } P_{\mu}
$$

(ii) Show that $\max _{1 \leq m \leq n} V_{m}^{|f|} / \sqrt{n} \rightarrow 0$ in probability and conclude

$$
\frac{1}{\sqrt{n}} \sum_{m=1}^{n} f\left(X_{m}\right) \Rightarrow c \chi \quad \text { under } P_{\mu}
$$

5.6.7. Ratio Limit Theorems. Theorem 5.6.1 does not say much in the null recurrent case. To get a more informative limit theorem, suppose that $y$ is recurrent and $m$ is the (unique up to constant multiples) stationary measure on $C_{y}=\left\{z: \rho_{y z}>0\right\}$. Let $N_{n}(z)=\mid\{m \leq n$ : $\left.X_{n}=z\right\} \mid$. Break up the path at successive returns to $y$ and show that $N_{n}(z) / N_{n}(y) \rightarrow m(z) / m(y) P_{x}$-a.s. for all $x, z \in C_{y}$. Note that $n \rightarrow N_{n}(z)$ is increasing, so this is much easier than the previous problem.
5.6.8. We got (5.6.1) from Theorem 5.6.1 by taking expected value. This does not work for the ratio in the previous exercise, so we need another approach. Suppose $z \neq y$. (i) Let $\bar{p}_{n}(x, z)=P_{x}\left(X_{n}=z, T_{y}>n\right)$ and decompose $p^{m}(x, z)$ according to the value of $J=\sup \left\{j \in[1, m): X_{j}=\right. y\}$ to get

$$
\sum_{m=1}^{n} p^{m}(x, z)=\sum_{m=1}^{n} \bar{p}_{m}(x, z)+\sum_{j=1}^{n-1} p^{j}(x, y) \sum_{k=1}^{n-j} \bar{p}_{k}(y, z)
$$

(ii) Show that

$$
\sum_{m=1}^{n} p^{m}(x, z) / \sum_{m=1}^{n} p^{m}(x, y) \rightarrow \frac{m(z)}{m(y)}
$$

### 5.7 Periodicity, Tail $\sigma$-field*

Lemma 5.7.1. Suppose $p$ is irreducible, recurrent, and all states have period $d$. Fix $x \in S$, and for each $y \in S$, let $K_{y}=\left\{n \geq 1: p^{n}(x, y)>0\right\}$. (i) There is an $r_{y} \in\{0,1, \ldots, d-1\}$ so that if $n \in K_{y}$ then $n=r_{y} \bmod d$, i.e., the difference $n-r_{y}$ is a multiple of $d$. (ii) Let $S_{r}=\left\{y: r_{y}=r\right\}$ for $0 \leq r<d$. If $y \in S_{i}, z \in S_{j}$, and $p^{n}(y, z)>0$ then $n=(j-i) \bmod$ d. (iii) $S_{0}, S_{1}, \ldots, S_{d-1}$ are irreducible classes for $p^{d}$, and all states have period 1.

Proof. (i) Let $m(y)$ be such that $p^{m(y)}(y, x)>0$. If $n \in K_{y}$ then $p^{n+m(y)}(x, x)$ is positive so $d \mid(n+m)$. Let $r_{y}=(d-m(y)) \bmod d$. (ii) Let $m, n$ be such that $p^{n}(y, z), p^{m}(x, y)>0$. Since $p^{n+m}(x, z)>0$, it follows from (i) that $n+m=j \bmod d$. Since $m=i \bmod d$, the result follows. The irreducibility in (iii) follows immediately from (ii). The aperiodicity follows from the definition of the period as the g.c.d. $\left\{x: p^{n}(x, x)>0\right\}$.

A partition of the state space $S_{0}, S_{1}, \ldots, S_{d-1}$ satisfying (ii) in Lemma 5.7.1 is called a cyclic decomposition of the state space. Except for the choice of the set to put first, it is unique. (Pick an $x \in S$. It lies in some $S_{j}$, but once the value of $j$ is known, irreducibility and (ii) allow us to calculate all the sets.)

Exercise 5.7.1. Find the decomposition for the Markov chain with transition probability

|  | $\mathbf{1}$ | $\mathbf{2}$ | $\mathbf{3}$ | $\mathbf{4}$ | $\mathbf{5}$ | $\mathbf{6}$ | $\mathbf{7}$ |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| $\mathbf{1}$ | 0 | 0 | 0 | .5 | .5 | 0 | 0 |
| $\mathbf{2}$ | .3 | 0 | 0 | 0 | 0 | 0 | .7 |
| $\mathbf{3}$ | 0 | 0 | 0 | 0 | 0 | 0 | 1 |
| $\mathbf{4}$ | 0 | 0 | 1 | 0 | 0 | 0 | 0 |
| $\mathbf{5}$ | 0 | 0 | 1 | 0 | 0 | 0 | 0 |
| $\mathbf{6}$ | 0 | 1 | 0 | 0 | 0 | 0 | 0 |
| $\mathbf{7}$ | 0 | 0 | 0 | .4 | 0 | .6 | 0 |

Theorem 5.7.2. Convergence theorem, periodic case. Suppose $p$ is irreducible, has a stationary distribution $\pi$, and all states have period $d$. Let $x \in S$, and let $S_{0}, S_{1}, \ldots, S_{d-1}$ be the cyclic decomposition of the state space with $x \in S_{0}$. If $y \in S_{r}$ then

$$
\lim _{m \rightarrow \infty} p^{m d+r}(x, y)=\pi(y) d
$$

Proof. If $y \in S_{0}$ then using (iii) in Lemma 5.7.1 and applying Theorem 5.6.6 to $p^{d}$ shows

$$
\lim _{m \rightarrow \infty} p^{m d}(x, y) \text { exists }
$$

To identify the limit, we note that (5.6.1) implies

$$
\frac{1}{n} \sum_{m=1}^{n} p^{m}(x, y) \rightarrow \pi(y)
$$

and (ii) of Lemma 5.7.1 implies $p^{m}(x, y)=0$ unless $d \mid m$, so the limit in the first display must be $\pi(y) d$. If $y \in S_{r}$ with $1 \leq r<d$ then

$$
p^{m d+r}(x, y)=\sum_{z \in S_{r}} p^{r}(x, z) p^{m d}(z, y)
$$

Since $y, z \in S_{r}$ it follows from the first case in the proof that $p^{m d}(z, y) \rightarrow \pi(y) d$ as $m \rightarrow \infty . p^{m d}(z, y) \leq 1$, and $\sum_{z} p^{r}(x, z)=1$, so the result follows from the dominated convergence theorem. $\square$

Let $\mathcal{F}_{n}^{\prime}=\sigma\left(X_{n+1}, X_{n+2}, \ldots\right)$ and $\mathcal{T}=\cap_{n} \mathcal{F}_{n}^{\prime}$ be the tail $\sigma$-field. The next result is due to Orey. The proof we give is from Blackwell and Freedman (1964).

Theorem 5.7.3. Suppose $p$ is irreducible, recurrent, and all states have period $d, \mathcal{T}=\sigma\left(\left\{X_{0} \in S_{r}\right\}: 0 \leq r<d\right)$.

Remark. To be precise, if $\mu$ is any initial distribution and $A \in \mathcal{T}$ then there is an $r$ so that $A=\left\{X_{0} \in S_{r}\right\} P_{\mu}$-a.s.

Proof. We build up to the general result in three steps.
Case 1. Suppose $P\left(X_{0}=x\right)=1$. Let $T_{0}=0$, and for $n \geq 1$, let $T_{n}=\inf \left\{m>T_{n-1}: X_{m}=x\right\}$ be the time of the $n$th return to $x$. Let

$$
V_{n}=\left(X\left(T_{n-1}\right), \ldots, X\left(T_{n}-1\right)\right)
$$

The vectors $V_{n}$ are i.i.d. by Exercise 5.3.1, and the tail $\sigma$-field is contained in the exchangeable field of the $V_{n}$, so the Hewitt-Savage 0-1 law (Theorem 2.5.4, proved there for r.v's taking values in a general measurable space) implies that $\mathcal{T}$ is trivial in this case.

Case 2. Suppose that the initial distribution is concentrated on one cyclic class, say $S_{0}$. If $A \in \mathcal{T}$ then $P_{x}(A) \in\{0,1\}$ for each $x$ by case 1 . If $P_{x}(A)=0$ for all $x \in S_{0}$ then $P_{\mu}(A)=0$. Suppose $P_{y}(A)>0$, and hence $=1$, for some $y \in S_{0}$. Let $z \in S_{0}$. Since $p^{d}$ is irreducible and aperiodic on $S_{0}$, there is an $n$ so that $p^{n}(z, y)>0$ and $p^{n}(y, y)>0$. If we write $1_{A}=1_{B} \circ \theta_{n}$ then the Markov property implies

$$
1=P_{y}(A)=E_{y}\left(E_{y}\left(1_{B} \circ \theta_{n} \mid \mathcal{F}_{n}\right)\right)=E_{y}\left(E_{X_{n}} 1_{B}\right)
$$

so $P_{y}(B)=1$. Another application of the Markov property gives

$$
P_{z}(A)=E_{z}\left(E_{X_{n}} 1_{B}\right) \geq p^{n}(z, y)>0
$$

so $P_{z}(A)=1$, and since $z \in S_{0}$ is arbitrary, $P_{\mu}(A)=1$.
General Case. From case 2, we see that $P\left(A \mid X_{0}=y\right) \equiv 1$ or $\equiv 0$ on each cyclic class. This implies that either $\left\{X_{0} \in S_{r}\right\} \subset A$ or $\left\{X_{0} \in S_{r}\right\} \cap A=\emptyset P_{\mu}$ a.s. Conversely, it is clear that $\left\{X_{0} \in S_{r}\right\}=\left\{X_{n d} \in S_{r}\right.$ i.o. $\} \in \mathcal{T}$, and the proof is complete.

The next result will help us identify the tail $\sigma$-field in transient examples.

Theorem 5.7.4. Suppose $X_{0}$ has initial distribution $\mu$. The equations

$$
h\left(X_{n}, n\right)=E_{\mu}\left(Z \mid \mathcal{F}_{n}\right) \quad \text { and } \quad Z=\lim _{n \rightarrow \infty} h\left(X_{n}, n\right)
$$

set up a 1-1 correspondence between bounded $Z \in \mathcal{T}$ and bounded spacetime harmonic functions, i.e., bounded $h: S \times\{0,1, \ldots\} \rightarrow \mathbf{R}$, so that $h\left(X_{n}, n\right)$ is a martingale.

Proof. Let $Z \in \mathcal{T}$, write $Z=Y_{n} \circ \theta_{n}$, and let $h(x, n)=E_{x} Y_{n}$.

$$
E_{\mu}\left(Z \mid \mathcal{F}_{n}\right)=E_{\mu}\left(Y_{n} \circ \theta_{n} \mid \mathcal{F}_{n}\right)=h\left(X_{n}, n\right)
$$

by the Markov property, so $h\left(X_{n}, n\right)$ is a martingale. Conversely, if $h\left(X_{n}, n\right)$ is a bounded martingale, using Theorems 4.2.11 and 4.6.7 shows $h\left(X_{n}, n\right) \rightarrow Z \in \mathcal{T}$ as $n \rightarrow \infty$, and $h\left(X_{n}, n\right)=E_{\mu}\left(Z \mid \mathcal{F}_{n}\right)$.

Exercise 5.7.2. A random variable $Z$ with $Z=Z \circ \theta$, and hence $=Z \circ \theta_{n}$ for all $n$, is called invariant. Show there is a $1-1$ correspondence between bounded invariant random variables and bounded harmonic functions. We will have more to say about invariant r.v.'s in Section 7.1.

Example 5.7.5. Simple random walk in $\mathbf{d}$ dimensions. We begin by constructing a coupling for this process. Let $i_{1}, i_{2}, \ldots$ be i.i.d. uniform on $\{1, \ldots, d\}$. Let $\xi_{1}, \xi_{2}, \ldots$ and $\eta_{1}, \eta_{2}, \ldots$ be i.i.d. uniform on $\{-1,1\}$. Let $e_{j}$ be the $j$ th unit vector. Construct a coupled pair of $d$-dimensional simple random walks by

$$
\begin{aligned}
& X_{n}=X_{n-1}+e\left(i_{n}\right) \xi_{n} \\
& Y_{n}= \begin{cases}Y_{n-1}+e\left(i_{n}\right) \xi_{n} & \text { if } X_{n-1}^{i_{n}}=Y_{n-1}^{i_{n}} \\
Y_{n-1}+e\left(i_{n}\right) \eta_{n} & \text { if } X_{n-1}^{i_{n}} \neq Y_{n-1}^{i_{n}}\end{cases}
\end{aligned}
$$

In words, the coordinate that changes is always the same in the two walks, and once they agree in one coordinate, future movements in that direction are the same. It is easy to see that if $X_{0}^{i}-Y_{0}^{i}$ is even for $1 \leq i \leq d$, then the two random walks will hit with probability one.

Let $L_{0}=\left\{z \in \mathbf{Z}^{d}: z^{1}+\cdots+z^{d}\right.$ is even $\}$ and $L_{1}=\mathbf{Z}^{d}-L_{0}$. Although we have only defined the notion for the recurrent case, it should be clear that $L_{0}, L_{1}$ is the cyclic decomposition of the state space for simple random walk. If $S_{n} \in L_{i}$ then $S_{n+1} \in L_{1-i}$ and $p^{2}$ is irreducible on each $L_{i}$. To couple two random walks starting from $x, y \in L_{i}$, let them run independently until the first time all the coordinate differences are even, and then use the last coupling. In the remaining case, $x \in L_{0}$, $y \in L_{1}$ coupling is impossible.

The next result should explain our interest in coupling two $d$-dimensional simple random walks.

Theorem 5.7.6. For d-dimensional simple random walk,

$$
\mathcal{T}=\sigma\left(\left\{X_{0} \in L_{i}\right\}, i=0,1\right)
$$

Proof. Let $x, y \in L_{i}$, and let $X_{n}, Y_{n}$ be a realization of the coupling defined above for $X_{0}=x$ and $Y_{0}=y$. Let $h(x, n)$ be a bounded space-time harmonic function. The martingale property implies $h(x, 0)= E_{x} h\left(X_{n}, n\right)$. If $|h| \leq C$, it follows from the coupling that

$$
|h(x, 0)-h(y, 0)|=\left|E h\left(X_{n}, n\right)-E h\left(Y_{n}, n\right)\right| \leq 2 C P\left(X_{n} \neq Y_{n}\right) \rightarrow 0
$$

so $h(x, 0)$ is constant on $L_{0}$ and $L_{1}$. Applying the last result to $h^{\prime}(x, m)= h(x, n+m)$, we see that $h(x, n)=a_{n}^{i}$ on $L_{i}$. The martingale property implies $a_{n}^{i}=a_{n+1}^{1-i}$, and the desired result follows from Theorem 5.7.4.

Example 5.7.7. Ornstein's coupling. Let $p(x, y)=f(y-x)$ be the transition probability for an irreducible aperiodic random walk on $\mathbf{Z}$. To prove that the tail $\sigma$-field is trivial, pick $M$ large enough so that the random walk generated by the probability distribution $f_{M}(x)$ with $f_{M}(x)=c_{M} f(x)$ for $|x| \leq M$ and $f_{M}(x)=0$ for $|x|>M$ is irreducible and aperiodic. Let $Z_{1}, Z_{2}, \ldots$ be i.i.d. with distribution $f$ and let $W_{1}, W_{2} \ldots$ be i.i.d. with distribution $f_{M}$. Let $X_{n}=X_{n-1}+Z_{n}$ for $n \geq 1$. If $X_{n-1}=Y_{n-1}$, we set $X_{n}=Y_{n}$. Otherwise, we let

$$
Y_{n}= \begin{cases}Y_{n-1}+Z_{n} & \text { if }\left|Z_{n}\right|>m \\ Y_{n-1}+W_{n} & \text { if }\left|Z_{n}\right| \leq m\end{cases}
$$

In words, the big jumps are taken in parallel and the small jumps are independent. The recurrence of one-dimensional random walks with mean 0 implies $P\left(X_{n} \neq Y_{n}\right) \rightarrow 0$. Repeating the proof of Theorem 5.7.6, we see that $\mathcal{T}$ is trivial.

The tail $\sigma$-field in Theorem 5.7.6 is essentially the same as in Theorem 5.7.3. To get a more interesting $\mathcal{T}$, we look at:

Example 5.7.8. Random walk on a tree. To facilitate definitions, we will consider the system as a random walk on a group with 3 generators $a, b, c$ that have $a^{2}=b^{2}=c^{2}=e$, the identity element. To form the random walk, let $\xi_{1}, \xi_{2}, \ldots$ be i.i.d. with $P\left(\xi_{n}=x\right)=1 / 3$ for $x=a, b, c$, and let $X_{n}=X_{n-1} \xi_{n}$. (This is equivalent to a random walk on the tree in which each vertex has degree 3 but the algebraic formulation is convenient for computations.) Let $L_{n}$ be the length of the word $X_{n}$ when it has been reduced as much as possible, with $L_{n}=0$ if $X_{n}=e$. The reduction can be done as we go along. If the last letter of $X_{n-1}$ is the same as $\xi_{n}$, we erase it, otherwise we add the new letter. It is easy to see that $L_{n}$ is a Markov chain with a transition probability that has $p(0,1)=1$ and

$$
p(j, j-1)=1 / 3 \quad p(j, j+1)=2 / 3 \quad \text { for } j \geq 1
$$

As $n \rightarrow \infty, L_{n} \rightarrow \infty$. From this, it follows easily that the word $X_{n}$ has a limit in the sense that the $i$ th letter $X_{n}^{i}$ stays the same for large $n$. Let $X_{\infty}$ be the limiting word, i.e., $X_{\infty}^{i}=\lim X_{n}^{i} \cdot \mathcal{T} \supset \sigma\left(X_{\infty}^{i}, i \geq 1\right)$, but it is easy to see that this is not all. If $S_{0}=$ the words of even length, and $S_{1}=S_{0}^{c}$, then $X_{n} \in S_{i}$ implies $X_{n+1} \in S_{1-i}$, so $\left\{X_{0} \in S_{0}\right\} \in \mathcal{T}$. Can the reader prove that we have now found all of $\mathcal{T}$ ? As Fermat once said, "I have a proof but it won't fit in the margin."

Remark. This time the solution does not involve elliptic curves but uses " $h$-paths." See Furstenburg (1970) or decode the following: "Condition on the exit point (the infinite word). Then the resulting RW is an $h$ process, which moves closer to the boundary with probability $2 / 3$ and
farther with probability $1 / 3$ ( $1 / 6$ each to the two possibilities). Two such random walks couple, provided they have same parity." The quote is from Robin Pemantle, who says he consulted Itai Benajamini and Yuval Peres.

### 5.8 General State Space*

In this section, we will generalize the results from countable state space to a collection of Markov chains with uncountable state space called Harris chains. The developments here are motivated by three ideas. First, the proofs for countable state space if there is one point in the state space that the chain hits with probability one. (Think, for example, about the construction of the stationary measure via the cycle trick.) Second, a recurrent Harris chain can be modified to contain such a point. Third, the collection of Harris chains is a comfortable level of generality; broad enough to contain a large number of interesting examples, yet restrictive enough to allow for a rich theory.

We say that a Markov chain $X_{n}$ is a Harris chain if we can find sets $A, B \in \mathcal{S}$, a function $q$ with $q(x, y) \geq \epsilon>0$ for $x \in A, y \in B$, and a probability measure $\rho$ concentrated on $B$ so that:
(i) If $\tau_{A}=\inf \left\{n \geq 0: X_{n} \in A\right\}$, then $P_{z}\left(\tau_{A}<\infty\right)>0$ for all $z \in S$.
(ii) If $x \in A$ and $C \subset B$ then $p(x, C) \geq \int_{C} q(x, y) \rho(d y)$.

To explain the definition we turn to some examples:
Example 5.8.1. Countable state space. If $S$ is countable and there is a point $a$ with $\rho_{x a}>0$ for all $x$ (a condition slightly weaker than irreducibility) then we can take $A=\{a\}, B=\{b\}$, where $b$ is any state with $p(a, b)>0, \mu=\delta_{b}$ the point mass at $b$, and $q(a, b)=p(a, b)$.

Example 5.8.2. Chains with continuous densities. Suppose $X_{n} \in \mathbf{R}^{d}$ is a Markov chain with a transition probability that has $p(x, d y)= p(x, y) d y$ where $(x, y) \rightarrow p(x, y)$ is continuous. Pick $\left(x_{0}, y_{0}\right)$ so that $p\left(x_{0}, y_{0}\right)>0$. Let $A$ and $B$ be open sets around $x_{0}$ and $y_{0}$ that are small enough so that $p(x, y) \geq \epsilon>0$ on $A \times B$. If we let $\rho(C)=|B \cap C| /|B|$, where $|B|$ is the Lebesgue measure of $B$, then (ii) holds. If (i) holds, then $X_{n}$ is a Harris chain.

For concrete examples, consider:
(a) Diffusion processes are a large class of examples that lie outside the scope of this book, but are too important to ignore. When things are nice, specifically, if the generator of $X$ has Hölder continuous coefficients satisfying suitable growth conditions, see the Appendix of Dynkin (1965), then $P_{x}\left(X_{1} \in d y\right)=p(x, y) d y$, and $p$ satisfies the conditions above.
(b) The discrete Ornstein-Uhlenbeck process. Let $\xi_{1}, \xi_{2}, \ldots$ be i.i.d. standard normals and let $V_{n}=\theta V_{n-1}+\xi_{n}$. The Ornstein-Uhlenbeck process is a diffusion process $\left\{V_{t}, t \in[0, \infty)\right\}$ that models the velocity of a particle suspended in a liquid. See, e.g., Breiman (1968) Section 16.1. Looking at $V_{t}$ at integer times (and dividing by a constant to make the variance 1) gives a Markov chain with the indicated distributions.

Example 5.8.3. GI/G/1 queue, or storage model. Let $\xi_{1}, \xi_{2}, \ldots$ be i.i.d. and define $W_{n}$ inductively by $W_{n}=\left(W_{n-1}+\xi_{n}\right)^{+}$. If $P\left(\xi_{n}<0\right)>0$ then we can take $A=B=\{0\}$ and (i) and (ii) hold. To explain the first name in the title, consider a queueing system in which customers arrive at times of a renewal process, i.e., at times $0=T_{0}<T_{1}<T_{2} \ldots$ with $\zeta_{n}=T_{n}-T_{n-1}, n \geq 1$ i.i.d. Let $\eta_{n}, n \geq 0$, be the amount of service time the $n$th customer requires and let $\xi_{n}=\eta_{n-1}-\zeta_{n}$. I claim that $W_{n}$ is the amount of time the $n$th customer has to wait to enter service. To see this, notice that the $(n-1)$ th customer adds $\eta_{n-1}$ to the server's workload, and if the server is busy at all times in $\left[T_{n-1}, T_{n}\right)$, he reduces his workload by $\zeta_{n}$. If $W_{n-1}+\eta_{n-1}<\zeta_{n}$ then the server has enough time to finish his work and the next arriving customer will find an empty queue.

The second name in the title refers to the fact that $W_{n}$ can be used to model the contents of a storage facility. For an intuitive description, consider water reservoirs. We assume that rain storms occur at times of a renewal process $\left\{T_{n}: n \geq 1\right\}$, that the $n$th rainstorm contributes an amount of water $\eta_{n}$, and that water is consumed at constant rate $c$. If we let $\zeta_{n}=T_{n}-T_{n-1}$ as before, and $\xi_{n}=\eta_{n-1}-c \zeta_{n}$, then $W_{n}$ gives the amount of water in the reservoir just before the $n$th rainstorm.

History Lesson. Doeblin was the first to prove results for Markov chains on general state space. He supposed that there was an $n$ so that $p^{n}(x, C) \geq \epsilon \rho(C)$ for all $x \in S$ and $C \subset S$. See Doob (1953), Section V.5, for an account of his results. Harris (1956) generalized Doeblin's result by observing that it was enough to have a set $A$ so that (i) holds and the chain viewed on $A\left(Y_{k}=X\left(T_{A}^{k}\right)\right.$, where $T_{A}^{k}=\inf \left\{n>T_{A}^{k-1}: X_{n} \in A\right\}$ and $T_{A}^{0}=0$ ) satisfies Doeblin's condition. Our formulation, as well as most of the proofs in this section, follows Athreya and Ney (1978). For a nice description of the "traditional approach," see Revuz (1984).

Given a Harris chain on $(S, S)$, we will construct a Markov chain $\bar{X}_{n}$ with transition probability $\bar{p}$ on $(\bar{S}, \overline{\mathcal{S}})$, where $\bar{S}=S \cup\{\alpha\}$ and $\overline{\mathcal{S}}=\{B$, $B \cup\{\alpha\}: B \in \mathcal{S}\}$. The aim, as advertised earlier, is to manufacture a point $\alpha$ that the process hits with probability 1 in the recurrent case.

$$
\begin{array}{ll}
\text { If } x \in S-A & \bar{p}(x, C)=p(x, C) \text { for } C \in \mathcal{S} \\
\text { If } x \in A & \bar{p}(x,\{\alpha\})=\epsilon \\
& \bar{p}(x, C)=p(x, C)-\epsilon \rho(C) \text { for } C \in \mathcal{S} \\
\text { If } x=\alpha & \bar{p}(\alpha, D)=\int \rho(d x) \bar{p}(x, D) \text { for } D \in \overline{\mathcal{S}}
\end{array}
$$

Intuitively, $\bar{X}_{n}=\alpha$ corresponds to $X_{n}$ being distributed on $B$ according to $\rho$. Here, and in what follows, we will reserve $A$ and $B$ for the special sets that occur in the definition and use $C$ and $D$ for generic elements of $\mathcal{S}$. We will often simplify notation by writing $\bar{p}(x, \alpha)$ instead of $\bar{p}(x,\{\alpha\})$, $\mu(\alpha)$ instead of $\mu(\{\alpha\})$, etc.

Our next step is to prove three technical lemmas that will help us develop the theory below. Define a transition probability $v$ by

$$
v(x,\{x\})=1 \quad \text { if } \quad x \in S \quad v(\alpha, C)=\rho(C)
$$

In words, $V$ leaves mass in $S$ alone but returns the mass at $\alpha$ to $S$ and distributes it according to $\rho$.

Lemma 5.8.4. $v \bar{p}=\bar{p}$ and $\bar{p} v=p$.
Proof. Before giving the proof, we would like to remind the reader that measures multiply the transition probability on the left, i.e., in the first case we want to show $\mu v \bar{p}=\mu \bar{p}$. If we first make a transition according to $v$ and then one according to $\bar{p}$, this amounts to one transition according to $\bar{p}$, since only mass at $\alpha$ is affected by $v$ and

$$
\bar{p}(\alpha, D)=\int \rho(d x) \bar{p}(x, D)
$$

The second equality also follows easily from the definition. In words, if $\bar{p}$ acts first and then $v$, then $v$ returns the mass at $\alpha$ to where it came from.

From Lemma 5.8.4, it follows easily that we have:
Lemma 5.8.5. Let $Y_{n}$ be an inhomogeneous Markov chain with $p_{2 k}= v$ and $p_{2 k+1}=\bar{p}$. Then $\bar{X}_{n}=Y_{2 n}$ is a Markov chain with transition probability $\bar{p}$ and $X_{n}=Y_{2 n+1}$ is a Markov chain with transition probability $p$.

Lemma 5.8.5 shows that there is an intimate relationship between the asymptotic behavior of $X_{n}$ and of $\bar{X}_{n}$. To quantify this, we need a definition. If $f$ is a bounded measurable function on $S$, let $\bar{f}=v f$, i.e., $\bar{f}(x)=f(x)$ for $x \in S$ and $\bar{f}(\alpha)=\int f d \rho$.

Lemma 5.8.6. If $\mu$ is a probability measure on ( $S, \mathcal{S}$ ) then

$$
E_{\mu} f\left(X_{n}\right)=E_{\mu} \bar{f}\left(\bar{X}_{n}\right)
$$

Proof. Observe that if $X_{n}$ and $\bar{X}_{n}$ are constructed as in Lemma 5.8.5, and $P\left(\bar{X}_{0} \in S\right)=1$ then $X_{0}=\bar{X}_{0}$ and $X_{n}$ is obtained from $\bar{X}_{n}$ by making a transition according to $v$.

The last three lemmas will allow us to obtain results for $X_{n}$ from those for $\bar{X}_{n}$. We turn now to the task of generalizing the results from countable state space to $\bar{X}_{n}$. Before developing the theory, we will give one last example that explains why some of the statements are messy.

Example 5.8.7. Perverted O.U. process. Take the discrete O.U. process from part (b) of Example 5.8.2 and modify the transition probability at the integers $x \geq 2$ so that

$$
\begin{aligned}
& p(x,\{x+1\})=1-x^{-2} \\
& p(x, A)=x^{-2}|A| \text { for } A \subset(0,1)
\end{aligned}
$$

$p$ is the transition probability of a Harris chain, but

$$
P_{2}\left(X_{n}=n+2 \text { for all } n\right)>0
$$

I can sympathize with the reader who thinks that such chains will not arise "in applications," but it seems easier (and better) to adapt the theory to include them than to modify the assumptions to exclude them.

### 5.8.1 Recurrence and Transience

We begin with the dichotomy between recurrence and transience. Let $R=\inf \left\{n \geq 1: \bar{X}_{n}=\alpha\right\}$. If $P_{\alpha}(R<\infty)=1$ then we call the chain recurrent, otherwise we call it transient. Let $R_{1}=R$ and for $k \geq 2$, let $R_{k}=\inf \left\{n>R_{k-1}: \bar{X}_{n}=\alpha\right\}$ be the time of the $k$ th return to $\alpha$. The strong Markov property implies $P_{\alpha}\left(R_{k}<\infty\right)=P_{\alpha}(R<\infty)^{k}$, so $P_{\alpha}\left(\bar{X}_{n}=\alpha\right.$ i.o. $)=1$ in the recurrent case and $=0$ in the transient case.

The next result generalizes Lemma 5.3.2. (If $x$ is recurrent and $\rho_{x y}>0$ then $y$ is recurrent and $\rho_{y x}=1$.)

Theorem 5.8.8. Let $\lambda(C)=\sum_{n=1}^{\infty} 2^{-n} \bar{p}^{n}(\alpha, C)$. In the recurrent case, if $\lambda(C)>0$ then $P_{\alpha}\left(\bar{X}_{n} \in C\right.$ i.o. $)=1$. For $\lambda$-a.e. $x, P_{x}(R<\infty)=1$.

Proof. The first conclusion follows from Lemma NEED REF. For the second let $D=\left\{x: P_{x}(R<\infty)<1\right\}$ and observe that if $p^{n}(\alpha, D)>0$ for some $n$, then

$$
P_{\alpha}\left(\bar{X}_{m}=\alpha \text { i.o. }\right) \leq \int \bar{p}^{n}(\alpha, d x) P_{x}(R<\infty)<1
$$

Remark. Example 5.8.7 shows that we cannot expect to have $P_{x}(R< \infty)=1$ for all $x$. To see that even when the state space is countable, we need not hit every point starting from $\alpha$ see Exercise 5.8.2

### 5.8.2 Stationary Measures

Theorem 5.8.9. In the recurrent case, there is a $\sigma$-finite stationary measure $\bar{\mu} \ll \lambda$.
Proof. Let $R=\inf \left\{n \geq 1: \bar{X}_{n}=\alpha\right\}$, and let

$$
\bar{\mu}(C)=E_{\alpha}\left(\sum_{n=0}^{R-1} 1_{\left\{\bar{X}_{n} \in C\right\}}\right)=\sum_{n=0}^{\infty} P_{\alpha}\left(\bar{X}_{n} \in C, R>n\right)
$$

Repeating the proof of Theorem 5.5.7 shows that $\bar{\mu} \bar{p}=\bar{\mu}$. If we let $\mu=\bar{\mu} v$ then it follows from Lemma 5.8.4 that $\bar{\mu} v p=\bar{\mu} \bar{p} v=\bar{\mu} v$, so $\mu p=\mu$.

To prove that it is $\sigma$-finite let $G_{k, \delta}=\left\{x: \bar{p}^{k}(x, \alpha) \geq \delta\right\}$. Let $T_{1}= \inf \left\{n: X\left(T_{1}\right) \in G_{k}\right\}$ and for $m \geq 2$, let $X\left(T_{m}\right)=\inf \left\{n \geq T_{m-1}\right\}$, and let $M=\sup \left\{m: T_{m}<R\right\}$. By assumption $E M<1 / \delta$. In between $T_{m}$ and $T_{m-1}$ there can be at most $k$ visits to $G_{k, \delta}$. The fact that $\bar{\mu} \ll \lambda$ is clear by comparing the definitions.

To investigate uniqueness of the stationary measure, we begin with:
Lemma 5.8.10. If $\nu$ is a $\sigma$-finite stationary measure for $p$, then $\nu(A)< \infty$ and $\bar{\nu}=\nu \bar{p}$ is a stationary measure for $\bar{p}$ with $\bar{\nu}(\alpha)<\infty$.
Proof. We will first show that $\nu(A)<\infty$. If $\nu(A)=\infty$ then part (ii) of the definition implies $\nu(C)=\infty$ for all sets $C$ with $\rho(C)>0$. If $B=\cup_{i} B_{i}$ with $\nu\left(B_{i}\right)<\infty$ then $\rho\left(B_{i}\right)=0$ by the last observation and $\rho(B)=0$ by countable subadditivity, a contradiction. So $\nu(A)<\infty$ and $\bar{\nu}(\alpha)=\nu \bar{p}(\alpha)=\epsilon \nu(A)<\infty$. Using the fact that $\nu p=\nu$, we find

$$
\nu \bar{p}(C)=\nu(C)-\epsilon \nu(A) \rho(B \cap C)
$$

the last subtraction being well-defined since $\nu(A)<\infty$, and it follows that $\bar{\nu} v=\nu$. To check $\bar{\nu} \bar{p}=\bar{\nu}$, we observe that Lemma 5.8.4 and the last result imply $\bar{\nu} \bar{p}=\bar{\nu} v \bar{p}=\nu \bar{p}=\bar{\nu}$.

Theorem 5.8.11. Suppose $p$ is recurrent. If $\nu$ is a $\sigma$-finite stationary measure then $\nu=\bar{\nu}(\alpha) \mu$, where $\mu$ is the measure constructed in the proof of Theorem 5.8.9.

Proof. By Lemma 5.8.10, it suffices to prove that if $\bar{\nu}$ is a stationary measure for $\bar{p}$ with $\bar{\nu}(\alpha)<\infty$ then $\bar{\nu}=\bar{\nu}(\alpha) \bar{\mu}$. Repeating the proof of Theorem 5.5.9 with $a=\alpha$, it is easy to show that $\bar{\nu}(C) \geq \bar{\nu}(\alpha) \bar{\mu}(C)$. Continuing to compute as in that proof:

$$
\bar{\nu}(\alpha)=\int \bar{\nu}(d x) \bar{p}^{n}(x, \alpha) \geq \bar{\nu}(\alpha) \int \bar{\mu}(d x) \bar{p}^{n}(x, \alpha)=\bar{\nu}(\alpha) \bar{\mu}(\alpha)=\bar{\nu}(\alpha)
$$

Let $S_{n}=\left\{x: p^{n}(x, \alpha)>0\right\}$. By assumption, $\cup_{n} S_{n}=S$. If $\bar{\nu}(D)> \bar{\nu}(\alpha) \bar{\mu}(D)$ for some $D$, then $\bar{\nu}\left(D \cap S_{n}\right)>\bar{\nu}(\alpha) \bar{\mu}\left(D \cap S_{n}\right)$, and it follows that $\bar{\nu}(\alpha)>\bar{\nu}(\alpha)$ a contradiction.

### 5.8.3 Convergence Theorem

We say that a recurrent Harris chain $X_{n}$ is aperiodic if g.c.d. $\{n \geq 1$ : $\left.p^{n}(\alpha, \alpha)>0\right\}=1$. This occurs, for example, if we can take $A=B$ in the definition for then $p(\alpha, \alpha)>0$.

Theorem 5.8.12. Let $X_{n}$ be an aperiodic recurrent Harris chain with stationary distribution $\pi$. If $P_{x}(R<\infty)=1$ then as $n \rightarrow \infty$,

$$
\left\|p^{n}(x, \cdot)-\pi(\cdot)\right\| \rightarrow 0
$$

Note. Here $\|\|$ denotes the total variation distance between the measures. Lemma 5.8.8 guarantees that $\pi$ a.e. $x$ satisfies the hypothesis.

Proof. In view of Lemma 5.8.6, it suffices to prove the result for $\bar{p}$. We begin by observing that the existence of a stationary probability measure and the uniqueness result in Theorem 5.8.11 imply that the measure constructed in Theorem 5.8.9 has $E_{\alpha} R=\bar{\mu}(S)<\infty$. As in the proof of Theorem 5.6.6, we let $X_{n}$ and $Y_{n}$ be independent copies of the chain with initial distributions $\delta_{x}$ and $\pi$, respectively, and let $\tau=\inf \{n \geq 0$ : $\left.X_{n}=Y_{n}=\alpha\right\}$. For $m \geq 0$, let $S_{m}$ (resp. $T_{m}$ ) be the times at which $X_{n}$ (resp. $Y_{n}$ ) visit $\alpha$ for the ( $m+1$ )th time. $S_{m}-T_{m}$ is a random walk with mean 0 steps, so $M=\inf \left\{m \geq 1: S_{m}=T_{m}\right\}<\infty$ a.s., and it follows that this is true for $\tau$ as well. The computations in the proof of Theorem 5.6.6 show $\left|P\left(X_{n} \in C\right)-P\left(Y_{n} \in C\right)\right| \leq P(\tau>n)$. Since this is true for all $C,\left\|p^{n}(x, \cdot)-\pi(\cdot)\right\| \leq P(\tau>n)$, and the proof is complete.

### 5.8.4 GI/G/1 queue

For the rest of the section, we will concentrate on the $G I / G / 1$ queue. Let $\xi_{1}, \xi_{2}, \ldots$ be i.i.d., let $W_{n}=\left(W_{n-1}+\xi_{n}\right)^{+}$, and let $S_{n}=\xi_{1}+\cdots+\xi_{n}$. Recall $\xi_{n}=\eta_{n-1}-\zeta_{n}$, where the $\eta$ 's are service times, $\zeta$ 's are the interarrival times, and suppose $E \xi_{n}<0$ so that Exercise 5.8.5 implies there is a stationary distribution.

Explicit formulas for the distribution of $M$ are in general difficult to obtain. However, this can be done if either the arrival or service distribution is exponential. One reason for this is:

Lemma 5.8.13. Suppose $X, Y \geq 0$ are independent and $P(X>x)= e^{-\lambda x}$. Show that $P(X-Y>x)=a e^{-\lambda x}$, where $a=P(X-Y>0)$.
Proof. Let $F$ be the distribution of $Y$

$$
\begin{aligned}
P(X-Y>x) & =\int_{0}^{\infty} d F(y) e^{-\lambda(x+y)} \\
& =e^{-\lambda x} \int_{0}^{\infty} d F(y) e^{-\lambda(y)}=e^{-\lambda x} P(X-Y>0)
\end{aligned}
$$

where the last equality follows from setting $x=0$ in the first one.

Example 5.8.14. Exponential service time. Suppose $P\left(\eta_{n}>x\right)= e^{-\beta x}$ and $E \zeta_{n}>E \eta_{n}$. Let $T=\inf \left\{n: S_{n}>0\right\}$ and $L=S_{T}$, setting $L=-\infty$ if $T=\infty$. The lack of memory property of the exponential distribution implies that $P(L>x)=r e^{-\beta x}$, where $r=P(T<\infty)$. To compute the distribution of the maximum, $M$, let $T_{1}=T$ and let $T_{k}=\inf \left\{n>T_{k-1}: S_{n}>S_{T_{k-1}}\right\}$ for $k \geq 2$. The strong Markov property implies that if $T_{k}<\infty$ then $S\left(T_{k+1}\right)-S\left(T_{k}\right)={ }_{d} L$ and is independent of $S\left(T_{k}\right)$. Using this and breaking things down according to the value of $K=\inf \left\{k: L_{k+1}=-\infty\right\}$, we see that for $x>0$ the density function

$$
P(M=x)=\sum_{k=1}^{\infty} r^{k}(1-r) e^{-\beta x} \beta^{k} x^{k-1} /(k-1)!=\beta r(1-r) e^{-\beta x(1-r)}
$$

To complete the calculation, we need to calculate $r$. To do this, let

$$
\phi(\theta)=E \exp \left(\theta \xi_{n}\right)=E \exp \left(\theta \eta_{n-1}\right) E \exp \left(-\theta \zeta_{n}\right)
$$

which is finite for $0<\theta<\beta$ since $\zeta_{n} \geq 0$ and $\eta_{n-1}$ has an exponential distribution. It is easy to see that

$$
\phi^{\prime}(0)=E \xi_{n}<0 \quad \lim _{\theta \uparrow \beta} \phi(\theta)=\infty
$$

so there is a $\theta \in(0, \beta)$ with $\phi(\theta)=1$. Example 4.2.3 implies $\exp \left(\theta S_{n}\right)$ is a martingale. Theorem 4.4.1 implies $1=E \exp \left(\theta S_{T \wedge n}\right)$. Letting $n \rightarrow \infty$ and noting that ( $S_{n} \mid T=n$ ) has an exponential distribution and $S_{n} \rightarrow -\infty$ on $\{T=\infty\}$, we have

$$
1=r \int_{0}^{\infty} e^{\theta x} \beta e^{-\beta x} d x=\frac{r \beta}{\beta-\theta}
$$

Example 5.8.15. Poisson arrivals. Suppose $P\left(\zeta_{n}>x\right)=e^{-\alpha x}$ and $E \zeta_{n}>E \eta_{n}$. Let $\bar{S}_{n}=-S_{n}$. Reversing time as in (ii) of Exercise 5.8.6, we see (for $n \geq 1$ )

$$
P\left(\max _{0 \leq k<n} \bar{S}_{k}<\bar{S}_{n} \in A\right)=P\left(\min _{1 \leq k \leq n} \bar{S}_{k}>0, \bar{S}_{n} \in A\right)
$$

Let $\psi_{n}(A)$ be the common value of the last two expression and let $\psi(A)= \sum_{n \geq 0} \psi_{n}(A) . \psi_{n}(A)$ is the probability the random walk reaches a new maximum (or ladder height, see Exercise 5.4.2 in $A$ at time $n$, so $\psi(A)$ is the number of ladder points in $A$ with $\psi(\{0\})=1$. Letting the random walk take one more step

$$
P\left(\min _{1 \leq k \leq n} \bar{S}_{k}>0, \bar{S}_{n+1} \leq x\right)=\int F(x-z) d \psi_{n}(z)
$$

The last identity is valid for $n=0$ if we interpret the left-hand side as $F(x)$. Let $\tau=\inf \left\{n \geq 1: \bar{S}_{n} \leq 0\right\}$ and $x \leq 0$. Integrating by parts on
the right-hand side and then summing over $n \geq 0$ gives

$$
\begin{align*}
P\left(\bar{S}_{\tau} \leq x\right) & =\sum_{n=0}^{\infty} P\left(\min _{1 \leq k \leq n} \bar{S}_{k}>0, \bar{S}_{n+1} \leq x\right) \\
& =\int_{y \leq x} \psi[0, x-y] d F(y) \tag{5.8.1}
\end{align*}
$$

The limit $y \leq x$ comes from the fact that $\psi((-\infty, 0))=0$.
Let $\bar{\xi}_{n}=\bar{S}_{n}-\bar{S}_{n-1}=-\xi_{n}$. Exercise 5.8.13 implies $P\left(\bar{\xi}_{n}>x\right)=a e^{-\alpha x}$. Let $\bar{T}=\inf \left\{n: \bar{S}_{n}>0\right\} . E \bar{\xi}_{n}>0$ so $P(\bar{T}<\infty)=1$. Let $J=\bar{S}_{T}$. As in the previous example, $P(J>x)=e^{-\alpha x}$. Let $V_{n}=J_{1}+\cdots+J_{n}$. $V_{n}$ is a rate $\alpha$ Poisson process, so $\psi[0, x-y]=1+\alpha(x-y)$ for $x-y \geq 0$. Using (5.8.1) now and integrating by parts gives

$$
\begin{align*}
P\left(\bar{S}_{\tau} \leq x\right) & =\int_{y \leq x}(1+\alpha(x-y)) d F(y) \\
& =F(x)+\alpha \int_{-\infty}^{x} F(y) d y \quad \text { for } x \leq 0 \tag{5.8.2}
\end{align*}
$$

Since $P\left(\bar{S}_{n}=0\right)=0$ for $n \geq 1,-\bar{S}_{\tau}$ has the same distribution as $S_{T}$, where $T=\inf \left\{n: S_{n}>0\right\}$. Combining this with part (ii) of Exercise 5.8.6 gives a "formula" for $P(M>x)$. Straightforward but somewhat tedious calculations show that if $B(s)=E \exp \left(-s \eta_{n}\right)$, then

$$
E \exp (-s M)=\frac{(1-\alpha \cdot E \eta) s}{s-\alpha+\alpha B(s)}
$$

a result known as the Pollaczek-Khintchine formula. The computations we omitted can be found in Billingsley (1979) on p. 277 or several times in Feller, Vol. II (1971).

## Exercises

5.8.1. $\bar{X}_{n}$ is recurrent if and only if $\sum_{n=1}^{\infty} \bar{p}^{n}(\alpha, \alpha)=\infty$.
5.8.2. If $X_{n}$ is a recurrent Harris chain on a countable state space, then $S$ can only have one irreducible set of recurrent states but may have a nonempty set of transient states. For a concrete example, consider a branching process in which the probability of no children $p_{0}>0$ and set $A=B=\{0\}$.
5.8.3. Use Exercise 5.8.1 and imitate the proof of Theorem 5.5.10 to show that a Harris chain with a stationary distribution must be recurrent.
5.8.4. Suppose $X_{n}$ is a recurrent Harris chain. Show that if ( $A^{\prime}, B^{\prime}$ ) is another pair satisfying the conditions of the definition, then Theorem 5.8.8 implies $P_{\alpha}\left(\bar{X}_{n} \in A^{\prime}\right.$ i.o. $)=1$, so the recurrence or transience does not depend on the choice of $(A, B)$.
5.8.5. In the $G I / G / 1$ queue, the waiting time $W_{n}$ and the random walk $S_{n}=X_{0}+\xi_{1}+\cdots+\xi_{n}$ agree until $N=\inf \left\{n: S_{n}<0\right\}$, and at this time $W_{N}=0$. Use this observation as we did in Example 5.3.7 to show that Example 5.8.3 is transient when $E \xi_{n}>0$. recurrent when $E \xi_{n} \leq 0$ and there is a stationary distribution when $E \xi_{n}<0$.
5.8.6. Let $m_{n}=\min \left(S_{0}, S_{1}, \ldots, S_{n}\right)$, where $S_{n}$ is the random walk defined above. (i) Show that $S_{n}-m_{n}={ }_{d} W_{n}$. (ii) Let $\xi_{m}^{\prime}=\xi_{n+1-m}$ for $1 \leq m \leq n$. Show that $S_{n}-m_{n}=\max \left(S_{0}^{\prime}, S_{1}^{\prime}, \ldots, S_{n}^{\prime}\right)$. (iii) Conclude that as $n \rightarrow \infty$ we have $W_{n} \Rightarrow M \equiv \max \left(S_{0}^{\prime}, S_{1}^{\prime}, S_{2}^{\prime}, \ldots\right)$.
5.8.7. In the discrete O.U. process, $X_{n+1}$ is normal with mean $\theta X_{n}$ and variance 1. What happens to the recurrence and transience if instead $Y_{n+1}$ is normal with mean 0 and variance $\beta^{2}\left|Y_{n}\right|$ ?

## Chapter 6

## Ergodic Theorems

$X_{n}, n \geq 0$, is said to be a stationary sequence if for each $k \geq 1$ it has the same distribution as the shifted sequence $X_{n+k}, n \geq 0$. The basic fact about these sequences, called the ergodic theorem, is that if $E\left|f\left(X_{0}\right)\right|<\infty$ then

$$
\lim _{n \rightarrow \infty} \frac{1}{n} \sum_{m=0}^{n-1} f\left(X_{m}\right) \quad \text { exists a.s. }
$$

If $X_{n}$ is ergodic (a generalization of the notion of irreducibility for Markov chains) then the limit is $E f\left(X_{0}\right)$. Sections 7.1 and 7.2 develop the theory needed to prove the ergodic theorem. In Section 7.3, we apply the ergodic theorem to study the recurrence of random walks with increments that are stationary sequences finding remarkable generalizations of the i.i.d. case. In Section 7.4, we prove a subadditive ergodic theorem. As the examples in Sections 7.4 and 7.5 should indicate, this is a useful generalization of the ergodic theorem.

### 6.1 Definitions and Examples

$X_{0}, X_{1}, \ldots$ is said to be a stationary sequence if for every $k$, the shifted sequence $\left\{X_{k+n}, n \geq 0\right\}$ has the same distribution, i.e., for each $m$, $\left(X_{0}, \ldots, X_{m}\right)$ and $\left(X_{k}, \ldots, X_{k+m}\right)$ have the same distribution. We begin by giving four examples that will be our constant companions.

Example 6.1.1. $X_{0}, X_{1}, \ldots$ are i.i.d.
Example 6.1.2. Let $X_{n}$ be a Markov chain with transition probability $p(x, A)$ and stationary distribution $\pi$, i.e., $\pi(A)=\int \pi(d x) p(x, A)$. If $X_{0}$ has distribution $\pi$ then $X_{0}, X_{1}, \ldots$ is a stationary sequence. A special case to keep in mind for counterexamples is the chain with state space $S=\{0,1\}$ and transition probability $p(x,\{1-x\})=1$. In this case,
the stationary distribution has $\pi(0)=\pi(1)=1 / 2$ and $\left(X_{0}, X_{1}, \ldots\right)= (0,1,0,1, \ldots)$ or $(1,0,1,0, \ldots)$ with probability $1 / 2$ each.

Example 6.1.3. Rotation of the circle. Let $\Omega=[0,1), \mathcal{F}=$ Borel subsets, $P=$ Lebesgue measure. Let $\theta \in(0,1)$, and for $n \geq 0$, let $X_{n}(\omega)=(\omega+n \theta) \bmod 1$, where $x \bmod 1=x-[x],[x]$ being the greatest integer $\leq x$. To see the reason for the name, map $[0,1)$ into $\mathbf{C}$ by $x \rightarrow \exp (2 \pi i x)$. This example is a special case of the last one. Let $p(x,\{y\})=1$ if $y=(x+\theta) \bmod 1$.

Our last "example" contains all other examples as a special case,
Example 6.1.4. Let ( $\Omega, \mathcal{F}, P$ ) be a probability space. A measurable map $\varphi: \Omega \rightarrow \Omega$ is said to be measure preserving if $P\left(\varphi^{-1} A\right)=P(A)$ for all $A \in \mathcal{F}$. Let $\varphi^{n}$ be the $n$th iterate of $\varphi$ defined inductively by $\varphi^{n}=\varphi\left(\varphi^{n-1}\right)$ for $n \geq 1$, where $\varphi^{0}(\omega)=\omega$. We claim that if $X \in \mathcal{F}$, then $X_{n}(\omega)=X\left(\varphi^{n} \omega\right)$ defines a stationary sequence. To check this, let $B \in \mathcal{R}^{n+1}$ and $A=\left\{\omega:\left(X_{0}(\omega), \ldots, X_{n}(\omega)\right) \in B\right\}$. Then
$P\left(\left(X_{k}, \ldots, X_{k+n}\right) \in B\right)=P\left(\varphi^{k} \omega \in A\right)=P(\omega \in A)=P\left(\left(X_{0}, \ldots, X_{n}\right) \in B\right)$
The last example is more than an important example. In fact, it is the only example! If $Y_{0}, Y_{1}, \ldots$ is a stationary sequence taking values in a nice space, Kolmogorov's extension theorem, Theorem A.3.1, allows us to construct a measure $P$ on sequence space $\left(S^{\{0,1, \ldots\}}, \mathcal{S}^{\{0,1, \ldots\}}\right)$, so that the sequence $X_{n}(\omega)=\omega_{n}$ has the same distribution as that of $\left\{Y_{n}, n \geq 0\right\}$. If we let $\varphi$ be the shift operator, i.e., $\varphi\left(\omega_{0}, \omega_{1}, \ldots\right)=\left(\omega_{1}, \omega_{2}, \ldots\right)$, and let $X(\omega)=\omega_{0}$, then $\varphi$ is measure preserving and $X_{n}(\omega)=X\left(\varphi^{n} \omega\right)$.

In view of the observations above, it suffices to give our definitions and prove our results in the setting of Example 6.1.4. Thus, our basic set up consists of

$$
\begin{array}{cl}
(\Omega, \mathcal{F}, P) & \text { a probability space } \\
\varphi & \text { a map that preserves } P \\
X_{n}(\omega)=X\left(\varphi^{n} \omega\right) & \text { where } X \text { is a random variable }
\end{array}
$$

We will now give some important definitions. Here and in what follows we assume $\varphi$ is measure-preserving. A set $A \in \mathcal{F}$ is said to be invariant if $\varphi^{-1} A=A$. (Here, as usual, two sets are considered to be equal if their symmetric difference has probability 0 .) Let $\mathcal{I}$ be the collection of invariant events. In Exercise 6.1.1 you will prove that $\mathcal{I}$ is a $\sigma$-field.

A measure-preserving transformation on ( $\Omega, \mathcal{F}, P$ ) is said to be ergodic if $\mathcal{I}$ is trivial, i.e., for every $A \in \mathcal{I}, P(A) \in\{0,1\}$. If $\varphi$ is not ergodic then the space can be split into two sets $A$ and $A^{c}$, each having positive measure so that $\varphi(A)=A$ and $\varphi\left(A^{c}\right)=A^{c}$. In words, $\varphi$ is not irreducible.

To investigate further the meaning of ergodicity, we return to our examples, renumbering them because the new focus is on checking ergodicity.

Example 6.1.5. i.i.d. sequence. We begin by observing that if $\Omega= \mathbf{R}^{\{0,1, \ldots\}}$ and $\varphi$ is the shift operator, then an invariant set $A$ has $\{\omega: \omega \in A\}=\{\omega: \varphi \omega \in A\} \in \sigma\left(X_{1}, X_{2}, \ldots\right)$. Iterating gives

$$
A \in \cap_{n=1}^{\infty} \sigma\left(X_{n}, X_{n+1}, \ldots\right)=\mathcal{T}, \quad \text { the tail } \sigma \text {-field }
$$

so $\mathcal{I} \subset \mathcal{T}$. For an i.i.d. sequence, Kolmogorov's 0-1 law implies $\mathcal{T}$ is trivial, so $\mathcal{I}$ is trivial and the sequence is ergodic (i.e., when the corresponding measure is put on sequence space $\Omega=\mathbf{R}^{\{0,1,2, \ldots\}}$ the shift is).

Example 6.1.6. Markov chains. Suppose the state space $S$ is countable and the stationary distribution has $\pi(x)>0$ for all $x \in S$. By Theorems 5.5.10 and 5.3.5, all states are recurrent, and we can write $S=\cup R_{i}$, where the $R_{i}$ are disjoint irreducible closed sets. If $X_{0} \in R_{i}$ then with probability one, $X_{n} \in R_{i}$ for all $n \geq 1$ so $\left\{\omega: X_{0}(\omega) \in R_{i}\right\} \in \mathcal{I}$ . The last observation shows that if the Markov chain is not irreducible then the sequence is not ergodic. To prove the converse, observe that if $A \in \mathcal{I}, 1_{A} \circ \theta_{n}=1_{A}$ where $\theta_{n}\left(\omega_{0}, \omega_{1}, \ldots\right)=\left(\omega_{n}, \omega_{n+1}, \ldots\right)$. So if we let $\mathcal{F}_{n}=\sigma\left(X_{0}, \ldots, X_{n}\right)$, the shift invariance of $1_{A}$ and the Markov property imply

$$
E_{\pi}\left(1_{A} \mid \mathcal{F}_{n}\right)=E_{\pi}\left(1_{A} \circ \theta_{n} \mid \mathcal{F}_{n}\right)=h\left(X_{n}\right)
$$

where $h(x)=E_{x} 1_{A}$. Lévy's 0-1 law implies that the left-hand side converges to $1_{A}$ as $n \rightarrow \infty$. If $X_{n}$ is irreducible and recurrent then for any $y \in S$, the right-hand side $=h(y)$ i.o., so either $h(x) \equiv 0$ or $h(x) \equiv 1$, and $P_{\pi}(A) \in\{0,1\}$. This example also shows that $\mathcal{I}$ and $\mathcal{T}$ may be different. When the transition probability $p$ is irreducible $\mathcal{I}$ is trivial, but if all the states have period $d>1, \mathcal{T}$ is not. In Theorem 5.7.3, we showed that if $S_{0}, \ldots, S_{d-1}$ is the cyclic decomposition of $S$, then $\mathcal{T}=\sigma\left(\left\{X_{0} \in S_{r}\right\}: 0 \leq r<d\right)$.

Example 6.1.7. Rotation of the circle is not ergodic if $\theta=m / n$ where $m<n$ are positive integers. If $B$ is a Borel subset of $[0,1 / n)$ and

$$
A=\cup_{k=0}^{n-1}(B+k / n)
$$

then $A$ is invariant. Conversely, if $\theta$ is irrational, then $\varphi$ is ergodic. To prove this, we need a fact from Fourier analysis. If $f$ is a measurable function on $[0,1)$ with $\int f^{2}(x) d x<\infty$, then $f$ can be written as $f(x)= \sum_{k} c_{k} e^{2 \pi i k x}$ where the equality is in the sense that as $K \rightarrow \infty$

$$
\sum_{k=-K}^{K} c_{k} e^{2 \pi i k x} \rightarrow f(x) \text { in } L^{2}[0,1)
$$

and this is possible for only one choice of the coefficients $c_{k}=\int f(x) e^{-2 \pi i k x} d x$. Now

$$
f(\varphi(x))=\sum_{k} c_{k} e^{2 \pi i k(x+\theta)}=\sum_{k}\left(c_{k} e^{2 \pi i k \theta}\right) e^{2 \pi i k x}
$$

The uniqueness of the coefficients $c_{k}$ implies that $f(\varphi(x))=f(x)$ if and only if $c_{k}\left(e^{2 \pi i k \theta}-1\right)=0$. If $\theta$ is irrational, this implies $c_{k}=0$ for $k \neq 0$, so $f$ is constant. Applying the last result to $f=1_{A}$ with $A \in \mathcal{I}$ shows that $A=\emptyset$ or $[0,1)$ a.s.

## Exercises

6.1.1. Show that the class of invariant events $\mathcal{I}$ is a $\sigma$-field, and $X \in \mathcal{I}$ if and only if $X$ is invariant, i.e., $X \circ \varphi=X$ a.s.
6.1.2. Some authors call $A$ almost invariant if $P\left(A \Delta \varphi^{-1}(A)\right)=0$ and call $C$ invariant in the strict sense if $C=\varphi^{-1}(C)$. (i) Let $A$ be any set, let $B=\cup_{n=0}^{\infty} \varphi^{-n}(A)$. Show $\varphi^{-1}(B) \subset B$. (ii) Let $B$ be any set with $\varphi^{-1}(B) \subset B$ and let $C=\cap_{n=0}^{\infty} \varphi^{-n}(B)$. Show that $\varphi^{-1}(C)=C$. (iii) Show that $A$ is almost invariant if and only if there is a $C$ invariant in the strict sense with $P(A \Delta C)=0$.
6.1.3. A direct proof of ergodicity of rotation of the circle. (i) Show that if $\theta$ is irrational, $x_{n}=n \theta \bmod 1$ is dense in $[0,1)$. Hint: All the $x_{n}$ are distinct, so for any $N<\infty,\left|x_{n}-x_{m}\right| \leq 1 / N$ for some $m<n \leq N$. (ii) Use Exercise A.2.1 to show that if $A$ is a Borel set with $|A|>0$, then for any $\delta>0$ there is an interval $J=[a, b)$ so that $|A \cap J|>(1-\delta)|J|$. (iii) Combine this with (i) to conclude $P(A)=1$.
6.1.4. Any stationary sequence $\left\{X_{n}, n \geq 0\right\}$ can be embedded in a two-sided stationary sequence $\left\{Y_{n}: n \in \mathbf{Z}\right\}$.
6.1.5. If $X_{0}, X_{1}, \ldots$ is a stationary sequence and $g: \mathbf{R}^{\{0,1, \ldots\}} \rightarrow \mathbf{R}$ is measurable then $Y_{k}=g\left(X_{k}, X_{k+1}, \ldots\right)$ is a stationary sequence. If $X_{n}$ is ergodic then so is $Y_{n}$
6.1.6. Independent blocks. Let $X_{1}, X_{2} \ldots$ be a stationary sequence. Let $n<\infty$ and let $Y_{1}, Y_{2}, \ldots$ be a sequence so that $\left(Y_{n k+1}, \ldots, Y_{n(k+1)}\right)$, $k \geq 0$ are i.i.d. and $\left(Y_{1}, \ldots, Y_{n}\right)=\left(X_{1}, \ldots, X_{n}\right)$. Finally, let $\nu$ be uniformly distributed on $\{1,2, \ldots, n\}$, independent of $Y$, and let $Z_{m}=Y_{\nu+m}$ for $m \geq 1$. Show that $Z$ is stationary and ergodic.
6.1.7. Continued fractions. Let $\varphi(x)=1 / x-[1 / x]$ for $x \in(0,1)$ and $A(x)=[1 / x]$, where $[1 / x]=$ the largest integer $\leq 1 / x . a_{n}=A\left(\varphi^{n} x\right)$, $n=0,1,2, \ldots$ gives the continued fraction representation of $x$, i.e.,

$$
x=1 /\left(a_{0}+1 /\left(a_{1}+1 /\left(a_{2}+1 / \ldots\right)\right)\right)
$$

Show that $\varphi$ preserves $\mu(A)=\frac{1}{\log 2} \int_{A} \frac{d x}{1+x}$ for $A \subset(0,1)$.

### 6.2 Birkhoff's Ergodic Theorem

Throughout this section, $\varphi$ is a measure-preserving transformation on $(\Omega, \mathcal{F}, P)$. See Example 6.1.4 for details. We begin by proving a result that is usually referred to as:

Theorem 6.2.1. The ergodic theorem. For any $X \in L^{1}$,

$$
\frac{1}{n} \sum_{m=0}^{n-1} X\left(\varphi^{m} \omega\right) \rightarrow E(X \mid \mathcal{I}) \quad \text { a.s. and in } L^{1}
$$

This result due to Birkhoff (1931) is sometimes called the pointwise or individual ergodic theorem because of the a.s. convergence in the conclusion. When the sequence is ergodic, the limit is the mean $E X$. In this case, if we take $X=1_{A}$, it follows that the asymptotic fraction of time $\varphi^{m} \in A$ is $P(A)$.

The proof we give is based on an odd integration inequality due to Yosida and Kakutani (1939). We follow Garsia (1965). The proof is not intuitive, but none of the steps are difficult.

Lemma 6.2.2. Maximal ergodic lemma. Let $X_{j}(\omega)=X\left(\varphi^{j} \omega\right)$, $S_{k}(\omega)=X_{0}(\omega)+\ldots+X_{k-1}(\omega)$, and $M_{k}(\omega)=\max \left(0, S_{1}(\omega), \ldots, S_{k}(\omega)\right)$. Then $E\left(X ; M_{k}>0\right) \geq 0$.

Proof. If $j \leq k$ then $M_{k}(\varphi \omega) \geq S_{j}(\varphi \omega)$, so adding $X(\omega)$ gives

$$
X(\omega)+M_{k}(\varphi \omega) \geq X(\omega)+S_{j}(\varphi \omega)=S_{j+1}(\omega)
$$

and rearranging we have

$$
X(\omega) \geq S_{j+1}(\omega)-M_{k}(\varphi \omega) \text { for } j=1, \ldots, k
$$

Trivially, $X(\omega) \geq S_{1}(\omega)-M_{k}(\varphi \omega)$, since $S_{1}(\omega)=X(\omega)$ and $M_{k}(\varphi \omega) \geq 0$. Therefore

$$
\begin{aligned}
E\left(X(\omega) ; M_{k}>0\right) & \geq \int_{\left\{M_{k}>0\right\}} \max \left(S_{1}(\omega), \ldots, S_{k}(\omega)\right)-M_{k}(\varphi \omega) d P \\
& =\int_{\left\{M_{k}>0\right\}} M_{k}(\omega)-M_{k}(\varphi \omega) d P
\end{aligned}
$$

Now $M_{k}(\omega)=0$ and $M_{k}(\varphi \omega) \geq 0$ on $\left\{M_{k}>0\right\}^{c}$, so the last expression is

$$
\geq \int M_{k}(\omega)-M_{k}(\varphi \omega) d P=0
$$

since $\varphi$ is measure preserving.

Proof of Theorem 6.2.1. $E(X \mid \mathcal{I})$ is invariant under $\varphi$ (see Exercise 6.1.1), so letting $X^{\prime}=X-E(X \mid \mathcal{I})$ we can assume without loss of generality that $E(X \mid \mathcal{I})=0$. Let $\bar{X}=\limsup S_{n} / n$, let $\epsilon>0$, and let $D=\{\omega$ : $\bar{X}(\omega)>\epsilon\}$. Our goal is to prove that $P(D)=0 . \bar{X}(\varphi \omega)=\bar{X}(\omega)$, so $D \in \mathcal{I}$. Let

$$
\begin{gathered}
X^{*}(\omega)=(X(\omega)-\epsilon) 1_{D}(\omega) \quad S_{n}^{*}(\omega)=X^{*}(\omega)+\ldots+X^{*}\left(\varphi^{n-1} \omega\right) \\
M_{n}^{*}(\omega)=\max \left(0, S_{1}^{*}(\omega), \ldots, S_{n}^{*}(\omega)\right) \quad F_{n}=\left\{M_{n}^{*}>0\right\} \\
F=\cup_{n} F_{n}=\left\{\sup _{k \geq 1} S_{k}^{*} / k>0\right\}
\end{gathered}
$$

Since $X^{*}(\omega)=(X(\omega)-\epsilon) 1_{D}(\omega)$ and $D=\left\{\limsup S_{k} / k>\epsilon\right\}$, it follows that

$$
F=\left\{\sup _{k \geq 1} S_{k} / k>\epsilon\right\} \cap D=D
$$

Lemma 6.2.2 implies that $E\left(X^{*} ; F_{n}\right) \geq 0$. Since $E\left|X^{*}\right| \leq E|X|+\epsilon<\infty$, the dominated convergence theorem implies $E\left(X^{*} ; F_{n}\right) \rightarrow E\left(X^{*} ; F\right)$, and it follows that $E\left(X^{*} ; F\right) \geq 0$. The last conclusion looks innocent, but $F=D \in \mathcal{I}$, so it implies

$$
0 \leq E\left(X^{*} ; D\right)=E(X-\epsilon ; D)=E(E(X \mid \mathcal{I}) ; D)-\epsilon P(D)=-\epsilon P(D)
$$

since $E(X \mid \mathcal{I})=0$. The last inequality implies that

$$
0=P(D)=P\left(\limsup S_{n} / n>\epsilon\right)
$$

and since $\epsilon>0$ is arbitrary, it follows that $\limsup S_{n} / n \leq 0$. Applying the last result to $-X$ shows that $S_{n} / n \rightarrow 0$ a.s.

The clever part of the proof is over and the rest is routine. To prove that convergence occurs in $L^{1}$, let

$$
X_{M}^{\prime}(\omega)=X(\omega) 1_{(|X(\omega)| \leq M)} \quad \text { and } \quad X_{M}^{\prime \prime}(\omega)=X(\omega)-X_{M}^{\prime}(\omega)
$$

The part of the ergodic theorem we have proved implies

$$
\frac{1}{n} \sum_{m=0}^{n-1} X_{M}^{\prime}\left(\varphi^{m} \omega\right) \rightarrow E\left(X_{M}^{\prime} \mid \mathcal{I}\right) \quad \text { a.s. }
$$

Since $X_{M}^{\prime}$ is bounded, the bounded convergence theorem implies

$$
E\left|\frac{1}{n} \sum_{m=0}^{n-1} X_{M}^{\prime}\left(\varphi^{m} \omega\right)-E\left(X_{M}^{\prime} \mid \mathcal{I}\right)\right| \rightarrow 0
$$

To handle $X_{M}^{\prime \prime}$, we observe

$$
E\left|\frac{1}{n} \sum_{m=0}^{n-1} X_{M}^{\prime \prime}\left(\varphi^{m} \omega\right)\right| \leq \frac{1}{n} \sum_{m=0}^{n-1} E\left|X_{M}^{\prime \prime}\left(\varphi^{m} \omega\right)\right|=E\left|X_{M}^{\prime \prime}\right|
$$

$$
\begin{aligned}
& \text { and } E\left|E\left(X_{M}^{\prime \prime} \mid \mathcal{I}\right)\right| \leq E E\left(\left|X_{M}^{\prime \prime}\right| \mid \mathcal{I}\right)=E\left|X_{M}^{\prime \prime}\right| \text {. So } \\
& \qquad E\left|\frac{1}{n} \sum_{m=0}^{n-1} X_{M}^{\prime \prime}\left(\varphi^{m} \omega\right)-E\left(X_{M}^{\prime \prime} \mid \mathcal{I}\right)\right| \leq 2 E\left|X_{M}^{\prime \prime}\right|
\end{aligned}
$$

and it follows that

$$
\limsup _{n \rightarrow \infty} E\left|\frac{1}{n} \sum_{m=0}^{n-1} X\left(\varphi^{m} \omega\right)-E(X \mid \mathcal{I})\right| \leq 2 E\left|X_{M}^{\prime \prime}\right|
$$

As $M \rightarrow \infty, E\left|X_{M}^{\prime \prime}\right| \rightarrow 0$ by the dominated convergence theorem, which completes the proof.

Our next step is to see what Theorem 6.2.2 says about our examples.
Example 6.2.3. i.i.d. sequences. Since $\mathcal{I}$ is trivial, the ergodic theorem implies that

$$
\frac{1}{n} \sum_{m=0}^{n-1} X_{m} \rightarrow E X_{0} \quad \text { a.s. and in } L^{1}
$$

The a.s. convergence is the strong law of large numbers.
Remark. We can prove the $L^{1}$ convergence in the law of large numbers without invoking the ergodic theorem. To do this, note that

$$
\frac{1}{n} \sum_{m=1}^{n} X_{m}^{+} \rightarrow E X^{+} \quad \text { a.s. } \quad E\left(\frac{1}{n} \sum_{m=1}^{n} X_{m}^{+}\right)=E X^{+}
$$

and use Theorem 4.6.3 to conclude that $\frac{1}{n} \sum_{m=1}^{n} X_{m}^{+} \rightarrow E X^{+}$in $L^{1}$. A similar result for the negative part and the triangle inequality now give the desired result.

Example 6.2.4. Markov chains. Let $X_{n}$ be an irreducible Markov chain on a countable state space that has a stationary distribution $\pi$. Let $f$ be a function with

$$
\sum_{x}|f(x)| \pi(x)<\infty
$$

In Example 6.1.6, we showed that $\mathcal{I}$ is trivial, so applying the ergodic theorem to $f\left(X_{0}(\omega)\right)$ gives

$$
\frac{1}{n} \sum_{m=0}^{n-1} f\left(X_{m}\right) \rightarrow \sum_{x} f(x) \pi(x) \quad \text { a.s. and in } L^{1}
$$

For another proof of the almost sure convergence, see Exercise 5.6.5.

Example 6.2.5. Rotation of the circle. $\Omega=[0,1) \varphi(\omega)=(\omega+\theta) \bmod 1$. Suppose that $\theta \in(0,1)$ is irrational, so that by a result in Section 7.1 $\mathcal{I}$ is trivial. If we set $X(\omega)=1_{A}(\omega)$, with $A$ a Borel subset of $[0,1)$, then the ergodic theorem implies

$$
\frac{1}{n} \sum_{m=0}^{n-1} 1_{\left(\varphi^{m} \omega \in A\right)} \rightarrow|A| \quad \text { a.s. }
$$

where $|A|$ denotes the Lebesgue measure of $A$. The last result for $\omega=0$ is usually called Weyl's equidistribution theorem, although Bohl and Sierpinski should also get credit. For the history and a nonprobabilistic proof, see Hardy and Wright (1959), p. 390-393.

To recover the number theoretic result, we will now show that:
Theorem 6.2.6. If $A=[a, b)$ then the exceptional set is $\emptyset$.
Proof. Let $A_{k}=[a+1 / k, b-1 / k)$. If $b-a>2 / k$, the ergodic theorem implies

$$
\frac{1}{n} \sum_{m=0}^{n-1} 1_{A_{k}}\left(\varphi^{m} \omega\right) \rightarrow b-a-\frac{2}{k}
$$

for $\omega \in \Omega_{k}$ with $P\left(\Omega_{k}\right)=1$. Let $G=\cap \Omega_{k}$, where the intersection is over integers $k$ with $b-a>2 / k . P(G)=1$ so $G$ is dense in $[0,1)$. If $x \in[0,1)$ and $\omega_{k} \in G$ with $\left|\omega_{k}-x\right|<1 / k$, then $\varphi^{m} \omega_{k} \in A_{k}$ implies $\varphi^{m} x \in A$, so

$$
\liminf _{n \rightarrow \infty} \frac{1}{n} \sum_{m=0}^{n-1} 1_{A}\left(\varphi^{m} x\right) \geq b-a-\frac{2}{k}
$$

for all large enough $k$. Noting that $k$ is arbitrary and applying similar reasoning to $A^{c}$ shows

$$
\frac{1}{n} \sum_{m=0}^{n-1} 1_{A}\left(\varphi^{m} x\right) \rightarrow b-a
$$

Example 6.2.7. Benford's law. As Gelfand first observed, the equidistribution theorem says something interesting about $2^{m}$. Let $\theta=\log _{10} 2$, $1 \leq k \leq 9$, and $A_{k}=\left[\log _{10} k, \log _{10}(k+1)\right)$ where $\log _{10} y$ is the logarithm of $y$ to the base 10 . Taking $x=0$ in the last result, we have

$$
\frac{1}{n} \sum_{m=0}^{n-1} 1_{A}\left(\varphi^{m} 0\right) \rightarrow \log _{10}\left(\frac{k+1}{k}\right)
$$

A little thought reveals that the first digit of $2^{m}$ is $k$ if and only if $m \theta \bmod 1 \in A_{k}$. The numerical values of the limiting probabilities are

| 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| .3010 | .1761 | .1249 | .0969 | .0792 | .0669 | .0580 | .0512 | .0458 |

The limit distribution on $\{1, \ldots, 9\}$ is called Benford's (1938) law, although it was discovered by Newcomb (1881). As Raimi (1976) explains, in many tables the observed frequency with which $k$ appears as a first digit is approximately $\log _{10}((k+1) / k)$. Some of the many examples that are supposed to follow Benford's law are: census populations of 3259 counties, 308 numbers from Reader's Digest, areas of 335 rivers, 342 addresses of American Men of Science. The next table compares the percentages of the observations in the first five categories to Benford's law:

|  | 1 | 2 | 3 | 4 | 5 |
| :--- | :---: | :---: | :---: | :---: | :---: |
| Census | 33.9 | 20.4 | 14.2 | 8.1 | 7.2 |
| Reader's Digest | 33.4 | 18.5 | 12.4 | 7.5 | 7.1 |
| Rivers | 31.0 | 16.4 | 10.7 | 11.3 | 7.2 |
| Benford's Law | 30.1 | 17.6 | 12.5 | 9.7 | 7.9 |
| Addresses | 28.9 | 19.2 | 12.6 | 8.8 | 8.5 |

The fits are far from perfect, but in each case Benford's law matches the general shape of the observed distribution. The IRS and other government agencies use Benford's law to detect fraud. When records are made up the first digit distribution does not match Benford's law

## Exercises

6.2.1. Show that if $X \in L^{p}$ with $p>1$ then the convergence in Theorem 6.2.1 occurs in $L^{p}$.
6.2.2. (i) Show that if $g_{n}(\omega) \rightarrow g(\omega)$ a.s. and $E\left(\sup _{k}\left|g_{k}(\omega)\right|\right)<\infty$, then

$$
\lim _{n \rightarrow \infty} \frac{1}{n} \sum_{m=0}^{n-1} g_{m}\left(\varphi^{m} \omega\right)=E(g \mid \mathcal{I}) \quad \text { a.s. }
$$

(ii) Show that if we suppose only that $g_{n} \rightarrow g$ in $L^{1}$, we get $L^{1}$ convergence.
6.2.3. Wiener's maximal inequality. Let $X_{j}(\omega)=X\left(\varphi^{j} \omega\right), S_{k}(\omega)= X_{0}(\omega)+\cdots+X_{k-1}(\omega), A_{k}(\omega)=S_{k}(\omega) / k$, and $D_{k}=\max \left(A_{1}, \ldots, A_{k}\right)$. Use Lemma 6.2.2 to show that if $\alpha>0$ then

$$
P\left(D_{k}>\alpha\right) \leq \alpha^{-1} E|X|
$$

### 6.3 Recurrence

In this section, we will study the recurrence properties of stationary sequences. Our first result is an application of the ergodic theorem.

Let $X_{1}, X_{2}, \ldots$ be a stationary sequence taking values in $\mathbf{R}^{d}$, let $S_{k}= X_{1}+\cdots+X_{k}$, let $A=\left\{S_{k} \neq 0\right.$ for all $\left.k \geq 1\right\}$, and let $R_{n}=\left|\left\{S_{1}, \ldots, S_{n}\right\}\right|$ be the number of points visited at time $n$. Kesten, Spitzer, and Whitman, see Spitzer (1964), p. 40, proved the next result when the $X_{i}$ are i.i.d. In that case, $\mathcal{I}$ is trivial, so the limit is $P(A)$.

Theorem 6.3.1. As $n \rightarrow \infty, R_{n} / n \rightarrow E\left(1_{A} \mid \mathcal{I}\right)$ a.s.
Proof. Suppose $X_{1}, X_{2}, \ldots$ are constructed on $\left(\mathbf{R}^{d}\right)^{\{0,1, \ldots\}}$ with $X_{n}(\omega)= \omega_{n}$, and let $\varphi$ be the shift operator. It is clear that

$$
R_{n} \geq \sum_{m=1}^{n} 1_{A}\left(\varphi^{m} \omega\right)
$$

since the right-hand side $=\mid\left\{m: 1 \leq m \leq n, S_{\ell} \neq S_{m}\right.$ for all $\left.\ell>m\right\} \mid$. Using the ergodic theorem now gives

$$
\liminf _{n \rightarrow \infty} R_{n} / n \geq E\left(1_{A} \mid \mathcal{I}\right) \quad \text { a.s. }
$$

To prove the opposite inequality, let $A_{k}=\left\{S_{1} \neq 0, S_{2} \neq 0, \ldots, S_{k} \neq 0\right\}$. It is clear that

$$
R_{n} \leq k+\sum_{m=1}^{n-k} 1_{A_{k}}\left(\varphi^{m} \omega\right)
$$

since the sum on the right-hand side $=\mid\left\{m: 1 \leq m \leq n-k, S_{\ell} \neq S_{m}\right.$ for $m<\ell \leq m+k\} \mid$. Using the ergodic theorem now gives

$$
\limsup _{n \rightarrow \infty} R_{n} / n \leq E\left(1_{A_{k}} \mid \mathcal{I}\right)
$$

As $k \uparrow \infty, A_{k} \downarrow A$, so the monotone convergence theorem for conditional expectations, (c) in Theorem 4.1.9, implies

$$
E\left(1_{A_{k}} \mid \mathcal{I}\right) \downarrow E\left(1_{A} \mid \mathcal{I}\right) \quad \text { as } k \uparrow \infty
$$

and the proof is complete.
From Theorem 6.3.1, we get a result about the recurrence of random walks with stationary increments that is (for integer valued random walks) a generalization of a result of Chung-Fuchs, Theorem 5.4.8.
Theorem 6.3.2. Let $X_{1}, X_{2} \ldots$ be a stationary sequence taking values in $\mathbf{Z}$ with $E\left|X_{i}\right|<\infty$. Let $S_{n}=X_{1}+\cdots+X_{n}$, and let $A=\left\{S_{1} \neq\right. \left.0, S_{2} \neq 0, \ldots\right\}$. (i) If $E\left(X_{1} \mid \mathcal{I}\right)=0$ then $P(A)=0$. (ii) If $P(A)=0$ then $P\left(S_{n}=0\right.$ i.o. $)=1$.

Remark. In words, mean zero implies recurrence. The condition $E\left(X_{1} \mid \mathcal{I}\right)=$ 0 is needed to rule out trivial examples that have mean 0 but are a combination of a sequence with positive and negative means, e.g., $P\left(X_{n}=1\right.$ for all $n)=P\left(X_{n}=-1\right.$ for all $\left.n\right)=1 / 2$.

Proof. If $E\left(X_{1} \mid \mathcal{I}\right)=0$ then the ergodic theorem implies $S_{n} / n \rightarrow 0$ a.s. Now

$$
\limsup _{n \rightarrow \infty}\left(\max _{1 \leq k \leq n}\left|S_{k}\right| / n\right)=\limsup _{n \rightarrow \infty}\left(\max _{K \leq k \leq n}\left|S_{k}\right| / n\right) \leq\left(\max _{k \geq K}\left|S_{k}\right| / k\right)
$$

for any $K$ and the right-hand side $\downarrow 0$ as $K \uparrow \infty$. The last conclusion leads easily to

$$
\lim _{n \rightarrow \infty}\left(\max _{1 \leq k \leq n}\left|S_{k}\right|\right) / n=0
$$

Since $R_{n} \leq 1+2 \max _{1 \leq k \leq n}\left|S_{k}\right|$ it follows that $R_{n} / n \rightarrow 0$ and Theorem 6.3.1 implies $P(A)=0$.

Let $F_{j}=\left\{S_{i} \neq 0\right.$ for $\left.1 \leq i<j, S_{j}=0\right\}$ and

$$
G_{j, k}=\left\{S_{j+i}-S_{j} \neq 0 \text { for } 1 \leq i<k, S_{j+k}-S_{j}=0\right\} .
$$

$P(A)=0$ implies that $\sum P\left(F_{k}\right)=1$. Stationarity implies $P\left(G_{j, k}\right)= P\left(F_{k}\right)$, and for fixed $j$ the $G_{j, k}$ are disjoint, so $\cup_{k} G_{j, k}=\Omega$ a.s. It follows that

$$
\sum_{k} P\left(F_{j} \cap G_{j, k}\right)=P\left(F_{j}\right) \quad \text { and } \quad \sum_{j, k} P\left(F_{j} \cap G_{j, k}\right)=1
$$

On $F_{j} \cap G_{j, k}, S_{j}=0$ and $S_{j+k}=0$, so we have shown $P\left(S_{n}=0\right.$ at least two times $)=1$. Repeating the last argument shows $P\left(S_{n}=0\right.$ at least $k$ times) = 1 for all $k$, and the proof is complete.

Extending the reasoning in the proof of part (ii) of Theorem 6.3.2 gives a result of Kac (1947b). Let $X_{0}, X_{1}, \ldots$ be a stationary sequence taking values in $(S, \mathcal{S})$. Let $A \in \mathcal{S}$, let $T_{0}=0$, and for $n \geq 1$, let $T_{n}=\inf \left\{m>T_{n-1}: X_{m} \in A\right\}$ be the time of the $n$th return to $A$.

Theorem 6.3.3. If $P\left(X_{n} \in A\right.$ at least once $)=1$, then under $P\left(\cdot \mid X_{0} \in\right.$ A), $t_{n}=T_{n}-T_{n-1}$ is a stationary sequence with $E\left(T_{1} \mid X_{0} \in A\right)= 1 / P\left(X_{0} \in A\right)$.

Remark. If $X_{n}$ is an irreducible Markov chain on a countable state space $S$ starting from its stationary distribution $\pi$, and $A=\{x\}$, then Theorem 6.3.3 says $E_{x} T_{x}=1 / \pi(x)$, which is Theorem 5.5.11. Theorem 6.3.3 extends that result to an arbitrary $A \subset S$ and drops the assumption that $X_{n}$ is a Markov chain.

Proof. We first show that under $P\left(\cdot \mid X_{0} \in A\right), t_{1}, t_{2}, \ldots$ is stationary. To cut down on . . .'s, we will only show that

$$
P\left(t_{1}=m, t_{2}=n \mid X_{0} \in A\right)=P\left(t_{2}=m, t_{3}=n \mid X_{0} \in A\right)
$$

It will be clear that the same proof works for any finite-dimensional distribution. Our first step is to extend $\left\{X_{n}, n \geq 0\right\}$ to a two-sided
stationary sequence $\left\{X_{n}, n \in \mathbf{Z}\right\}$ using Theorem 6.1.4. Let $C_{k}=\left\{X_{-1} \notin\right. \left.A, \ldots, X_{-k+1} \notin A, X_{-k} \in A\right\}$.

$$
\left(\cup_{k=1}^{K} C_{k}\right)^{c}=\left\{X_{k} \notin A \text { for }-K \leq k \leq-1\right\}
$$

The last event has the same probability as $\left\{X_{k} \notin A\right.$ for $\left.1 \leq k \leq K\right\}$, so letting $K \rightarrow \infty$, we get $P\left(\cup_{k=1}^{\infty} C_{k}\right)=1$. To prove the desired stationarity, we let $I_{j, k}=\left\{i \in[j, k]: X_{i} \in A\right\}$ and observe that

$$
\begin{aligned}
P\left(t_{2}=m, t_{3}=n, X_{0} \in A\right) & =\sum_{\ell=1}^{\infty} P\left(X_{0} \in A, t_{1}=\ell, t_{2}=m, t_{3}=n\right) \\
& =\sum_{\ell=1}^{\infty} P\left(C_{\ell}, X_{0} \in A, t_{1}=m, t_{2}=n\right)
\end{aligned}
$$

To complete the proof, we compute

$$
\begin{aligned}
E\left(t_{1} \mid X_{0} \in A\right) & =\sum_{k=1}^{\infty} P\left(t_{1} \geq k \mid X_{0} \in A\right)=P\left(X_{0} \in A\right)^{-1} \sum_{k=1}^{\infty} P\left(t_{1} \geq k, X_{0} \in A\right) \\
& =P\left(X_{0} \in A\right)^{-1} \sum_{k=1}^{\infty} P\left(C_{k}\right)=1 / P\left(X_{0} \in A\right)
\end{aligned}
$$

since the $C_{k}$ are disjoint and their union has probability 1 .

## Exercises

6.3.1. Let $g_{n}=P\left(S_{1} \neq 0, \ldots, S_{n} \neq 0\right)$ for $n \geq 1$ and $g_{0}=1$. Show that

$$
E R_{n}=\sum_{m=1}^{n} g_{m-1}
$$

6.3.2. Imitate the proof of (i) in Theorem 6.3.2 to show that if we assume $P\left(X_{i}>1\right)=0, E X_{i}>0$, and the sequence $X_{i}$ is ergodic in addition to the hypotheses of Theorem 6.3.2, then $P(A)=E X_{i}$.
6.3.3. Show that if $P\left(X_{n} \in A\right.$ at least once $)=1$ and $A \cap B=\emptyset$ then

$$
E\left(\sum_{1 \leq m \leq T_{1}} 1_{\left(X_{m} \in B\right)} \mid X_{0} \in A\right)=\frac{P\left(X_{0} \in B\right)}{P\left(X_{0} \in A\right)}
$$

When $A=\{x\}$ and $X_{n}$ is a Markov chain, this is the "cycle trick" for defining a stationary measure. See Theorem 5.5.7.
6.3.4. Consider the special case in which $X_{n} \in\{0,1\}$, and let $\bar{P}= P\left(\cdot \mid X_{0}=1\right)$. Here $A=\{1\}$ and so $T_{1}=\inf \left\{m>0: X_{m}=1\right\}$. Show $P\left(T_{1}=n\right)=\bar{P}\left(T_{1} \geq n\right) / \bar{E} T_{1}$. When $t_{1}, t_{2}, \ldots$ are i.i.d., this reduces to the formula for the first waiting time in a stationary renewal process.

### 6.4 A Subadditive Ergodic Theorem

In this section we will prove Liggett's (1985) version of Kingman's (1968)
Theorem 6.4.1. Subadditive ergodic theorem. Suppose $X_{m, n}, 0 \leq m<n$ satisfy:
(i) $X_{0, m}+X_{m, n} \geq X_{0, n}$
(ii) $\left\{X_{n k,(n+1) k}, n \geq 1\right\}$ is a stationary sequence for each $k$.
(iii) The distribution of $\left\{X_{m, m+k}, k \geq 1\right\}$ does not depend on $m$.
(iv) $E X_{0,1}^{+}<\infty$ and for each $n, E X_{0, n} \geq \gamma_{0} n$, where $\gamma_{0}>-\infty$.

Then
(a) $\lim _{n \rightarrow \infty} E X_{0, n} / n=\inf _{m} E X_{0, m} / m \equiv \gamma$
(b) $X=\lim _{n \rightarrow \infty} X_{0, n} / n$ exists a.s. and in $L^{1}$, so $E X=\gamma$.
(c) If all the stationary sequences in (ii) are ergodic then $X=\gamma$ a.s.

Remark. Kingman assumed (iv), but instead of (i)-(iii) he assumed that $X_{\ell, m}+X_{m, n} \geq X_{\ell, n}$ for all $\ell<m<n$ and that the distribution of $\left\{X_{m+k, n+k}, 0 \leq m<n\right\}$ does not depend on $k$. In two of the four applications in the next, these stronger conditions do not hold.

Before giving the proof, which is somewhat lengthy, we will consider several examples for motivation. Since the validity of (ii) and (iii) in each case is clear, we will only check (i) and (iv). The first example shows that Theorem 6.4.1 contains Birkhoff's ergodic theorem as a special case.

Example 6.4.2. Stationary sequences. Suppose $\xi_{1}, \xi_{2}, \ldots$ is a stationary sequence with $E\left|\xi_{k}\right|<\infty$, and let $X_{m, n}=\xi_{m+1}+\cdots+\xi_{n}$. Then $X_{0, n}=X_{0, m}+X_{m, n}$, and (iv) holds.
Example 6.4.3. Range of random walk. Suppose $\xi_{1}, \xi_{2}, \ldots$ is a stationary sequence and let $S_{n}=\xi_{1}+\cdots+\xi_{n}$. Let $X_{m, n}=\left|\left\{S_{m+1}, \ldots, S_{n}\right\}\right|$. It is clear that $X_{0, m}+X_{m, n} \geq X_{0, n} .0 \leq X_{0, n} \leq n$, so (iv) holds. Applying Theorem 6.4.1 now gives $X_{0, n} / n \rightarrow X$ a.s. and in $L^{1}$, but it does not tell us what the limit is.

Example 6.4.4. Longest common subsequences. Given are ergodic stationary sequences $X_{1}, X_{2}, X_{3}, \ldots$ and $Y_{1}, Y_{2}, Y_{3}, \ldots$ be Let $L_{m, n}= \max \left\{K: X_{i_{k}}=Y_{j_{k}}\right.$ for $1 \leq k \leq K$, where $m<i_{1}<i_{2} \ldots<i_{K} \leq n$ and $\left.m<j_{1}<j_{2} \ldots<j_{K} \leq n\right\}$. It is clear that

$$
L_{0, m}+L_{m, n} \leq L_{0, n}
$$

so $X_{m, n}=-L_{m, n}$ is subadditive. $0 \leq L_{0, n} \leq n$ so (iv) holds. Applying Theorem 6.4.1 now, we conclude that

$$
L_{0, n} / n \rightarrow \gamma=\sup _{m \geq 1} E\left(L_{0, m} / m\right)
$$

The examples above should provide enough motivation for now. In the next section, we will give four more applications of Theorem 6.4.1.
Proof of Theorem 6.4.1. There are four steps. The first, second, and fourth date back to Kingman (1968). The half dozen proofs of subadditive ergodic theorems that exist all do the crucial third step in a different way. Here we use the approach of S. Leventhal (1988), who in turn based his proof on Katznelson and Weiss (1982).
Step 1. The first thing to check is that $E\left|X_{0, n}\right| \leq C n$. To do this, we note that (i) implies $X_{0, m}^{+}+X_{m, n}^{+} \geq X_{0, n}^{+}$. Repeatedly using the last inequality and invoking (iii) gives $E X_{0, n}^{+} \leq n E X_{0,1}^{+}<\infty$. Since $|x|=2 x^{+}-x$, it follows from (iv) that

$$
E\left|X_{0, n}\right| \leq 2 E X_{0, n}^{+}-E X_{0, n} \leq C n<\infty
$$

Let $a_{n}=E X_{0, n}$. (i) and (iii) imply that

$$
\begin{equation*}
a_{m}+a_{n-m} \geq a_{n} \tag{6.4.1}
\end{equation*}
$$

From this, it follows easily that

$$
\begin{equation*}
a_{n} / n \rightarrow \inf _{m \geq 1} a_{m} / m \equiv \gamma \tag{6.4.2}
\end{equation*}
$$

To prove this, we observe that the liminf is clearly $\geq \gamma$, so all we have to show is that the limsup $\leq a_{m} / m$ for any $m$. The last fact is easy, for if we write $n=k m+\ell$ with $0 \leq \ell<m$, then repeated use of (6.4.1) gives $a_{n} \leq k a_{m}+a_{\ell}$. Dividing by $n=k m+\ell$ gives

$$
\frac{a_{n}}{n} \leq \frac{k m}{k m+\ell} \cdot \frac{a_{m}}{m}+\frac{a_{\ell}}{n}
$$

Letting $n \rightarrow \infty$ and recalling $0 \leq \ell<m$ gives 6.4.2 and proves (a) in Theorem 6.4.1.

Step 2. Making repeated use of (i), we get

$$
\begin{aligned}
& X_{0, n} \leq X_{0, k m}+X_{k m, n} \\
& X_{0, n} \leq X_{0,(k-1) m}+X_{(k-1) m, k m}+X_{k m, n}
\end{aligned}
$$

and so on until the first term on the right is $X_{0, m}$. Dividing by $n=k m+\ell$ then gives

$$
\begin{equation*}
\frac{X_{0, n}}{n} \leq \frac{k}{k m+\ell} \cdot \frac{X_{0, m}+\cdots+X_{(k-1) m, k m}}{k}+\frac{X_{k m, n}}{n} \tag{6.4.3}
\end{equation*}
$$

Using (ii) and the ergodic theorem now gives that

$$
\frac{X_{0, m}+\cdots+X_{(k-1) m, k m}}{k} \rightarrow A_{m} \quad \text { a.s. and in } L^{1}
$$

where $A_{m}=E\left(X_{0, m} \mid \mathcal{I}_{m}\right)$ and the subscript indicates that $\mathcal{I}_{m}$ is the shift invariant $\sigma$-field for the sequence $X_{(k-1) m, k m}, k \geq 1$. The exact formula for the limit is not important, but we will need to know later that $E A_{m}= E X_{0, m}$.

If we fix $\ell$ and let $\epsilon>0$, then (iii) implies

$$
\sum_{k=1}^{\infty} P\left(X_{k m, k m+\ell}>(k m+\ell) \epsilon\right) \leq \sum_{k=1}^{\infty} P\left(X_{0, \ell}>k \epsilon\right)<\infty
$$

since $E X_{0, \ell}^{+}<\infty$ by the result at the beginning of Step 1. The last two observations imply

$$
\begin{equation*}
\bar{X} \equiv \limsup _{n \rightarrow \infty} X_{0, n} / n \leq A_{m} / m \tag{6.4.4}
\end{equation*}
$$

Taking expected values now gives $E \bar{X} \leq E\left(X_{0, m} / m\right)$, and taking the infimum over $m$, we have $E \bar{X} \leq \gamma$. Note that if all the stationary sequences in (ii) are ergodic, we have $\bar{X} \leq \gamma$.

Remark. If (i)-(iii) hold, $E X_{0,1}^{+}<\infty$, and inf $E X_{0, m} / m=-\infty$, then it follows from the last argument that as $X_{0, n} / n \rightarrow-\infty$ a.s. as $n \rightarrow \infty$.
Step 3. The next step is to let

$$
\underline{X}=\liminf _{n \rightarrow \infty} X_{0, n} / n
$$

and show that $E \underline{X} \geq \gamma$. Since $\infty>E X_{0,1} \geq \gamma \geq \gamma_{0}>-\underline{\infty}$, and we have shown in Step 2 that $E \bar{X} \leq \gamma$, it will follow that $\underline{X}=\bar{X}$, i.e., the limit of $X_{0, n} / n$ exists a.s. Let

$$
\underline{X}_{m}=\liminf _{n \rightarrow \infty} X_{m, m+n} / n
$$

(i) implies

$$
X_{0, m+n} \leq X_{0, m}+X_{m, m+n}
$$

Dividing both sides by $n$ and letting $n \rightarrow \infty$ gives $\underline{X} \leq \underline{X}_{m}$ a.s. However, (iii) implies that $\underline{X}_{m}$ and $\underline{X}$ have the same distribution so $\underline{X}=\underline{X}_{m}$ a.s.

Let $\epsilon>0$ and let $Z=\epsilon+(\underline{X} \vee-M)$. Since $\underline{X} \leq \bar{X}$ and $E \bar{X} \leq \gamma<\infty$ by Step 2, $E|Z|<\infty$. Let

$$
Y_{m, n}=X_{m, n}-(n-m) Z
$$

$Y$ satisfies (i)-(iv), since $Z_{m, n}=-(n-m) Z$ does, and has

$$
\begin{equation*}
\underline{Y} \equiv \liminf _{n \rightarrow \infty} Y_{0, n} / n \leq-\epsilon \tag{6.4.5}
\end{equation*}
$$

Let $T_{m}=\min \left\{n \geq 1: Y_{m, m+n} \leq 0\right\}$. (iii) implies $T_{m}={ }_{d} T_{0}$ and

$$
E\left(Y_{m, m+1} ; T_{m}>N\right)=E\left(Y_{0,1} ; T_{0}>N\right)
$$

(6.4.5) implies that $P\left(T_{0}<\infty\right)=1$, so we can pick $N$ large enough so that

$$
E\left(Y_{0,1} ; T_{0}>N\right) \leq \epsilon
$$

Let

$$
S_{m}= \begin{cases}T_{m} & \text { on }\left\{T_{m} \leq N\right\} \\ 1 & \text { on }\left\{T_{m}>N\right\}\end{cases}
$$

This is not a stopping time but there is nothing special about stopping times for a stationary sequence! Let

$$
\xi_{m}= \begin{cases}0 & \text { on }\left\{T_{m} \leq N\right\} \\ Y_{m, m+1} & \text { on }\left\{T_{m}>N\right\}\end{cases}
$$

Since $Y\left(m, m+T_{m}\right) \leq 0$ always and we have $S_{m}=1, Y_{m, m+1}>0$ on $\left\{T_{m}>N\right\}$, we have $Y\left(m, m+S_{m}\right) \leq \xi_{m}$ and $\xi_{m} \geq 0$. Let $R_{0}=0$, and for $k \geq 1$, let $R_{k}=R_{k-1}+S\left(R_{k-1}\right)$. Let $K=\max \left\{k: R_{k} \leq n\right\}$. From (i), it follows that

$$
Y(0, n) \leq Y\left(R_{0}, R_{1}\right)+\cdots+Y\left(R_{K-1}, R_{K}\right)+Y\left(R_{K}, n\right)
$$

Since $\xi_{m} \geq 0$ and $n-R_{K} \leq N$, the last quantity is

$$
\leq \sum_{m=0}^{n-1} \xi_{m}+\sum_{j=1}^{N}\left|Y_{n-j, n-j+1}\right|
$$

Here we have used (i) on $Y\left(R_{K}, n\right)$. Dividing both sides by $n$, taking expected values, and letting $n \rightarrow \infty$ gives

$$
\limsup _{n \rightarrow \infty} E Y_{0, n} / n \leq E \xi_{0} \leq E\left(Y_{0,1} ; T_{0}>N\right) \leq \epsilon
$$

It follows from (a) and the definition of $Y_{0, n}$ that

$$
\gamma=\lim _{n \rightarrow \infty} E X_{0, n} / n \leq 2 \epsilon+E(\underline{X} \vee-M)
$$

Since $\epsilon>0$ and $M$ are arbitrary, it follows that $E \underline{X} \geq \gamma$ and Step 3 is complete.
Step 4. It only remains to prove convergence in $L^{1}$. Let $\Gamma_{m}=A_{m} / m$ be the limit in (6.4.4), recall $E \Gamma_{m}=E\left(X_{0, m} / m\right)$, and let $\Gamma=\inf \Gamma_{m}$. Observing that $|z|=2 z^{+}-z$ (consider two cases $z \geq 0$ and $z<0$ ), we can write
$E\left|X_{0, n} / n-\Gamma\right|=2 E\left(X_{0, n} / n-\Gamma\right)^{+}-E\left(X_{0, n} / n-\Gamma\right) \leq 2 E\left(X_{0, n} / n-\Gamma\right)^{+}$
since

$$
E\left(X_{0, n} / n\right) \geq \gamma=\inf E \Gamma_{m} \geq E \Gamma
$$

Using the trivial inequality $(x+y)^{+} \leq x^{+}+y^{+}$and noticing $\Gamma_{m} \geq \Gamma$ now gives

$$
E\left(X_{0, n} / n-\Gamma\right)^{+} \leq E\left(X_{0, n} / n-\Gamma_{m}\right)^{+}+E\left(\Gamma_{m}-\Gamma\right)
$$

Now $E \Gamma_{m} \rightarrow \gamma$ as $m \rightarrow \infty$ and $E \Gamma \geq E \bar{X} \geq E \underline{X} \geq \gamma$ by steps 2 and 3, so $E \Gamma=\gamma$, and it follows that $E\left(\Gamma_{m}-\Gamma\right)$ is small if $m$ is large. To bound the other term, observe that (i) implies

$$
\begin{aligned}
E\left(X_{0, n} / n-\Gamma_{m}\right)^{+} & \leq E\left(\frac{X(0, m)+\cdots+X((k-1) m, k m)}{k m+\ell}-\Gamma_{m}\right)^{+} \\
& +E\left(\frac{X(k m, n)}{n}\right)^{+}
\end{aligned}
$$

The second term $=E\left(X_{0, \ell}^{+} / n\right) \rightarrow 0$ as $n \rightarrow \infty$. For the first, we observe $y^{+} \leq|y|$, and the ergodic theorem implies

$$
E\left|\frac{X(0, m)+\cdots+X((k-1) m, k m)}{k}-\Gamma_{m}\right| \rightarrow 0
$$

so the proof of Theorem 6.4.1 is complete.

### 6.5 Applications

In this section, we will give three applications of our subadditive ergodic theorem, 6.4.1. These examples are independent of each other and can be read in any order. In Example 6.5.5, we encounter situations to which Liggett's version applies but Kingman's version does not.

Example 6.5.1. Products of random matrices. Suppose $A_{1}, A_{2}, \ldots$ is a stationary sequence of $k \times k$ matrices with positive entries and let

$$
\alpha_{m, n}(i, j)=\left(A_{m+1} \cdots A_{n}\right)(i, j),
$$

i.e., the entry in row $i$ of column $j$ of the product. It is clear that

$$
\alpha_{0, m}(1,1) \alpha_{m, n}(1,1) \leq \alpha_{0, n}(1,1)
$$

so if we let $X_{m, n}=-\log \alpha_{m, n}(1,1)$ then $X_{0, m}+X_{m, n} \geq X_{0, n}$. To check (iv), we observe that

$$
\prod_{m=1}^{n} A_{m}(1,1) \leq \alpha_{0, n}(1,1) \leq k^{n-1} \prod_{m=1}^{n}\left(\sup _{i, j} A_{m}(i, j)\right)
$$

or taking logs

$$
-\sum_{m=1}^{n} \log A_{m}(1,1) \geq X_{0, n} \geq-(n \log k)-\sum_{m=1}^{n} \log \left(\sup _{i, j} A_{m}(i, j)\right)
$$

So if $E \log A_{m}(1,1)>-\infty$ then $E X_{0,1}^{+}<\infty$, and if

$$
E \log \left(\sup _{i, j} A_{m}(i, j)\right)<\infty
$$

then $E X_{0, n}^{-} \leq \gamma_{0} n$. If we observe that

$$
P\left(\log \left(\sup _{i, j} A_{m}(i, j)\right) \geq x\right) \leq \sum_{i, j} P\left(\log A_{m}(i, j) \geq x\right)
$$

we see that it is enough to assume that

$$
\begin{equation*}
E\left|\log A_{m}(i, j)\right|<\infty \quad \text { for all } i, j \tag{*}
\end{equation*}
$$

When (*) holds, applying Theorem 6.4.1 gives $X_{0, n} / n \rightarrow X$ a.s. Using the strict positivity of the entries, it is easy to improve that result to

$$
\begin{equation*}
\frac{1}{n} \log \alpha_{0, n}(i, j) \rightarrow-X \quad \text { a.s. for all } i, j \tag{6.5.1}
\end{equation*}
$$

a result first proved by Furstenberg and Kesten (1960).
An alternative approach is to let

$$
\|A\|=\max _{i} \sum_{j}|A(i, j)|=\max \left\{\|x A\|_{1}:\|x\|_{1}=1\right\},
$$

where $(x A)_{j}=\sum_{i} x_{i} A(i, j)$ and $\|x\|_{1}=\left|x_{1}\right|+\cdots+\left|x_{k}\right|$. It is clear that $\|A B\| \leq\|A\| \cdot\|B\|$ so if we let

$$
\beta_{m, n}=\left\|A_{m+1} \cdots A_{n}\right\|
$$

and $Y_{m, n}=\log \beta_{m, n}$, then $Y_{m, n}$ is subadditive. It is easy to use the subadditinve ergodic theorem to conclude

$$
\frac{1}{n} \log \left\|A_{m+1} \cdots A_{n}\right\| \rightarrow-X \quad \text { a.s. }
$$

where $X$ is the limit of $X_{0, n} / n$. From this we see that

$$
\sup _{m \geq 1}\left(E \log \alpha_{0, m}\right) / m=-X=\inf _{m \geq 1}\left(E \log \beta_{0, m}\right) / m
$$

Example 6.5.2. Increasing sequences in random permutations Let $\pi$ be a permutation of $\{1,2, \ldots, n\}$ and let $\ell(\pi)$ be the length of the longest increasing sequence in $\pi$. That is, the largest $k$ for which there are integers $i_{1}<i_{2} \ldots<i_{k}$ so that $\pi\left(i_{1}\right)<\pi\left(i_{2}\right)<\ldots<\pi\left(i_{k}\right)$. Hammersley (1970) attacked this problem by putting a rate one Poisson process in the plane, and for $s<t \in[0, \infty)$, letting $Y_{s, t}$ denote the length of the longest increasing path lying in the square $R_{s, t}$ with vertices $(s, s),(s, t),(t, t)$, and $(t, s)$. That is, the largest $k$ for which there are points $\left(x_{i}, y_{i}\right)$ in the

Poisson process with $s<x_{1}<\ldots<x_{k}<t$ and $s<y_{1}<\ldots<y_{k}<t$. It is clear that $Y_{0, m}+Y_{m, n} \leq Y_{0, n}$. Applying Theorem 6.4.1 to $-Y_{0, n}$ shows

$$
Y_{0, n} / n \rightarrow \gamma \equiv \sup _{m \geq 1} E Y_{0, m} / m \quad \text { a.s. }
$$

For each $k, Y_{n k,(n+1) k}, n \geq 0$ is i.i.d., so the limit is constant. We will show that $\gamma<\infty$ in Exercise 6.5.4.

To get from the result about the Poisson process back to the random permutation problem, let $\tau(n)$ be the smallest value of $t$ for which there are $n$ points in $R_{0, t}$. Let the $n$ points in $R_{0, \tau(n)}$ be written as ( $x_{i}, y_{i}$ ) where $0<x_{1}<x_{2} \ldots<x_{n} \leq \tau(n)$ and let $\pi_{n}$ be the unique permutation of $\{1,2, \ldots, n\}$ so that $y_{\pi_{n}(1)}<y_{\pi_{n}(2)} \ldots<y_{\pi_{n}(n)}$. It is clear that $Y_{0, \tau(n)}= \ell\left(\pi_{n}\right)$. An easy argument shows:

Lemma 6.5.3. $\tau(n) / \sqrt{n} \rightarrow 1$ a.s.
Proof. Let $S_{n}$ be the number of points in $R_{0, \sqrt{n}} . S_{n}-S_{n-1}$ are independent Poisson r.v.'s with mean 1, so the strong law of large numbers implies $S_{n} / n \rightarrow 1$ a.s. If $\epsilon>0$ then for large $n, S_{n(1-\epsilon)}<n<S_{n(1+\epsilon)}$ and hence $\sqrt{(1-\epsilon) n} \leq \tau(n) \leq \sqrt{(1+\epsilon) n}$.

It follows from Lemma 6.5.3 and the monotonicity of $m \rightarrow Y_{0, m}$ that

$$
n^{-1 / 2} \ell\left(\pi_{n}\right) \rightarrow \gamma \quad \text { a.s. }
$$

Hammersley (1970) has a proof that $\pi / 2 \leq \gamma \leq e$, and Kingman (1973) shows that $1.59<\gamma<2.49$. See Exercises 6.5.3 and 6.5.4. Subsequent work on the random permutation problem, see Logan and Shepp (1977) and Vershik and Kerov (1977), has shown that $\gamma=2$.

Example 6.5.4. First passage percolation Consider $\mathbf{Z}^{d}$ as a graph with edges connecting each $x, y \in \mathbf{Z}^{d}$ with $|x-y|=1$. Assign an independent nonnegative random variable $\tau(e)$ to each edge that represents the time required to traverse the edge going in either direction. If $e$ is the edge connecting $x$ and $y$, let $\tau(x, y)=\tau(y, x)=\tau(e)$. If $x_{0}=x, x_{1}, \ldots, x_{n}=y$ is a path from $x$ to $y$, i.e., a sequence with $\left|x_{m}-x_{m-1}\right|=1$ for $1 \leq m \leq n$, we define the travel time for the path to be $\tau\left(x_{0}, x_{1}\right)+\cdots+\tau\left(x_{n-1}, x_{n}\right)$. Define the passage time from $x$ to $y, t(x, y)=$ the infimum of the travel times over all paths from $x$ to $y$. Let $z \in \mathbf{Z}^{d}$ and let $X_{m, n}=t(m u, n u)$, where $u=(1,0, \ldots, 0)$.

Clearly $X_{0, m}+X_{m, n} \geq X_{0, n} . X_{0, n} \geq 0$ so if $E \tau(x, y)<\infty$ then (iv) holds, and Theorem 6.4.1 implies that $X_{0, n} / n \rightarrow X$ a.s. To see that the limit is constant, enumerate the edges in some order $e_{1}, e_{2}, \ldots$ and observe that $X$ is measurable with respect to the tail $\sigma$-field of the i.i.d. sequence $\tau\left(e_{1}\right), \tau\left(e_{2}\right), \ldots$

It is not hard to see that the assumption of finite first moment can be weakened. If $\tau$ has distribution $F$ with

$$
\begin{equation*}
\int_{0}^{\infty}(1-F(x))^{2 d} d x<\infty \tag{*}
\end{equation*}
$$

i.e., the minimum of $2 d$ independent copies has finite mean, then by finding $2 d$ disjoint paths from 0 to $u=(1,0, \ldots, 0)$, one concludes that $E \tau(0, u)<\infty$ and (6.1) can be applied. The condition (*) is also necessary for $X_{0, n} / n$ to converge to a finite limit. If (*) fails and $Y_{n}$ is the minimum of $t(e)$ over all the edges from $\nu$, then

$$
\limsup _{n \rightarrow \infty} X_{0, n} / n \geq \limsup _{n \rightarrow \infty} Y_{n} / n=\infty \quad \text { a.s. }
$$

Example 6.5.5. Age-dependent branching processes. This is a variation of the branching process introduced in which each individual lives for an amount of time with distribution $F$ before producing $k$ offspring with probability $p_{k}$. The description of the process is completed by supposing that the process starts with one individual in generation 0 who is born at time 0 , and when this particle dies, its offspring start independent copies of the original process.

Suppose $p_{0}=0$, let $X_{0, m}$ be the birth time of the first member of generation $m$, and let $X_{m, n}$ be the time lag necessary for that individual to have an offspring in generation $n$. In case of ties, pick an individual at random from those in generation $m$ born at time $X_{0, m}$. It is clear that $X_{0, n} \leq X_{0, m}+X_{m, n}$. Since $X_{0, n} \geq 0$, (iv) holds if we assume $F$ has finite mean. Applying Theorem 6.4.1 now, it follows that

$$
X_{0, n} / n \rightarrow \gamma \quad \text { a.s. }
$$

The limit is constant because the sequences $\left\{X_{n k,(n+1) k}, n \geq 0\right\}$ are i.i.d.
Remark. The inequality $X_{\ell, m}+X_{m, n} \geq X_{\ell, n}$ is false when $\ell>0$, because if we call $i_{m}$ the individual that determines the value of $X_{m, n}$ for $n>m$, then $i_{m}$ may not be a descendant of $i_{\ell}$.

As usual, one has to use other methods to identify the constant. Let $t_{1}, t_{2}, \ldots$ be i.i.d. with distribution $F$, let $T_{n}=t_{1}+\cdots+t_{n}$, and $\mu=\sum k p_{k}$. Let $Z_{n}(a n)$ be the number of individuals in generation $n$ born by time $a n$. Each individual in generation $n$ has probability $P\left(T_{n} \leq a n\right)$ to be born by time $a n$, and the times are independent of the offspring numbers so

$$
E Z_{n}(a n)=E E\left(Z_{n}(a n) \mid Z_{n}\right)=E\left(Z_{n} P\left(T_{n} \leq a n\right)\right)=\mu^{n} P\left(T_{n} \leq a n\right)
$$

By results in Section 2.6, $n^{-1} \log P\left(T_{n} \leq a n\right) \rightarrow-c(a)$ as $n \rightarrow \infty$. If $\log \mu-c(a)<0$ then Chebyshev's inequality and the Borel-Cantelli lemma imply $P\left(Z_{n}(a n) \geq 1\right.$ i.o. $)=0$. Conversely, if $E Z_{n}(a n)>1$ for
some $n$, then we can define a supercritical branching process $Y_{m}$ that consists of the offspring in generation $m n$ that are descendants of individuals in $Y_{m-1}$ in generation $(m-1) n$ that are born less than an units of time after their parents. This shows that with positive probability, $X_{0, m n} \leq m n a$ for all $m$. Combining the last two observations with the fact that $c(a)$ is strictly increasing gives

$$
\gamma=\inf \{a: \log \mu-c(a)>0\}
$$

The last result is from Biggins (1977). See his (1978) and (1979) papers for extensions and refinements.

## Exercises

6.5.1. To show that the convergence in (a) of Theorem 6.4.1 may occur arbitrarily slowly let $X_{m, m+k}=f(k) \geq 0$, where $f(k) / k$ is decreasing, and check that $X_{m, m+k}$ is subadddtive.
6.5.2. Consider the longest common subsequence problem, Example 6.4.4 when $X_{1}, X_{2}, \ldots$ and $Y_{1}, Y_{2}, \ldots$ are i.i.d. and take the values 0 and 1 with probability $1 / 2$ each. (a) Compute $E L_{1}$ and $E L_{2} / 2$ to get lower bounds on $\gamma$. (b) Show $\gamma<1$ by computing the expected number of $i$ and $j$ sequences of length $K=a n$ with the desired property. Chvatal and Sankoff (1975) have shown $0.727273 \leq \gamma \leq 0.866595$
6.5.3. Given a rate one Poisson process in $[0, \infty) \times[0, \infty)$, let $\left(X_{1}, Y_{1}\right)$ be the point that minimizes $x+y$. Let $\left(X_{2}, Y_{2}\right)$ be the point in $\left[X_{1}, \infty\right) \times \left[Y_{1}, \infty\right)$ that minimizes $x+y$, and so on. Use this construction to show that in Example 6.5.2 $\gamma \geq(8 / \pi)^{1 / 2}>1.59$.
6.5.4. Let $\pi_{n}$ be a random permutation of $\{1, \ldots, n\}$ and let $J_{k}^{n}$ be the number of subsets of $\{1, \ldots n\}$ of size $k$ so that the associated $\pi_{n}(j)$ form an increasing subsequence. Compute $E J_{k}^{n}$ and take $k \sim \alpha n^{1 / 2}$ to conclude that in Example 6.5.2 $\gamma \leq e$.
6.5.5. Let $\varphi(\theta)=E \exp \left(-\theta t_{i}\right)$ and

$$
Y_{n}=(\mu \varphi(\theta))^{-n} \sum_{i=1}^{Z_{n}} \exp \left(-\theta T_{n}(i)\right)
$$

where the sum is over individuals in generation $n$ and $T_{n}(i)$ is the $i$ th person's birth time. Show that $Y_{n}$ is a nonnegative martingale and use this to conclude that if $\exp (-\theta a) / \mu \varphi(\theta)>1$, then $P\left(X_{0, n} \leq a n\right) \rightarrow 0$. A little thought reveals that this bound is the same as the answer in the last exercise.

## Chapter 7

## Brownian Motion

Brownian motion is a process of tremendous practical and theoretical significance. It originated (a) as a model of the phenomenon observed by Robert Brown in 1828 that "pollen grains suspended in water perform a continual swarming motion," and (b) in Bachelier's (1900) work as a model of the stock market. These are just two of many systems that Brownian motion has been used to model. On the theoretical side, Brownian motion is a Gaussian Markov process with stationary independent increments. It lies in the intersection of three important classes of processes and is a fundamental example in each theory.

The first part of this chapter develops properties of Brownian motion. In Section 7.1, we define Brownian motion and investigate continuity properties of its paths. In Section 7.2, we prove the Markov property and a related 0-1 law. In Section 7.3, we define stopping times and prove the strong Markov property. In Section 7.4, we use the stron Markov prperty to investigate properties of the paths of Brownian motion. In Section 7.5, we introduce some martingales associated with Brownian motion and use them to obtain information about exit distribution and times. In section 7.6 we prove three versions of Itô's formula.

### 7.1 Definition and Construction

A one-dimensional Brownian motion is a real-valued process $B_{t}, t \geq 0$ that has the following properties:
(a) If $t_{0}<t_{1}<\ldots<t_{n}$ then $B\left(t_{0}\right), B\left(t_{1}\right)-B\left(t_{0}\right), \ldots, B\left(t_{n}\right)-B\left(t_{n-1}\right)$ are independent.
(b) If $s, t \geq 0$ then

$$
P(B(s+t)-B(s) \in A)=\int_{A}(2 \pi t)^{-1 / 2} \exp \left(-x^{2} / 2 t\right) d x
$$

(c) With probability one, $t \rightarrow B_{t}$ is continuous.
(a) says that $B_{t}$ has independent increments. (b) says that the increment $B(s+t)-B(s)$ has a normal distribution with mean 0 and variance $t$. (c) is self-explanatory.

Thinking of Brown's pollen grain (c) is certainly reasonable. (a) and (b) can be justified by noting that the movement of the pollen grain is due to the net effect of the bombardment of millions of water molecules, so by the central limit theorem, the displacement in any one interval should have a normal distribution, and the displacements in two disjoint intervals should be independent.

![](https://cdn.mathpix.com/cropped/886c9149-6650-4f34-867d-452deeaaf80a-118.jpg?height=474&width=708&top_left_y=760&top_left_x=728)
Figure 7.1: Simulation of two dimensional Brownian motion

Two immediate consequences of the definition that will be useful many times are:

Translation invariance. $\left\{B_{t}-B_{0}, t \geq 0\right\}$ is independent of $B_{0}$ and has the same distribution as a Brownian motion with $B_{0}=0$.

Proof. Let $\mathcal{A}_{1}=\sigma\left(B_{0}\right)$ and $\mathcal{A}_{2}$ be the events of the form

$$
\left\{B\left(t_{1}\right)-B\left(t_{0}\right) \in A_{1}, \ldots, B\left(t_{n}\right)-B\left(t_{n-1}\right) \in A_{n}\right\} .
$$

The $\mathcal{A}_{i}$ are $\pi$-systems that are independent, so the desired result follows from the $\pi-\lambda$ theorem 2.1.6.

The Brownian scaling relation. If $B_{0}=0$ then for any $t>0$,

$$
\begin{equation*}
\left\{B_{s t}, s \geq 0\right\} \stackrel{d}{=}\left\{t^{1 / 2} B_{s}, s \geq 0\right\} \tag{7.1.1}
\end{equation*}
$$

To be precise, the two families of r.v.'s have the same finite dimensional distributions, i.e., if $s_{1}<\ldots<s_{n}$ then

$$
\left(B_{s_{1}} t, \ldots, B_{s_{n} t}\right) \stackrel{d}{=}\left(t^{1 / 2} B_{s_{1}}, \ldots t^{1 / 2} B_{s_{n}}\right)
$$

Proof. To check this when $n=1$, we note that $t^{1 / 2}$ times a normal with mean 0 and variance $s$ is a normal with mean 0 and variance st. The result for $n>1$ follows from independent increments.

A second equivalent definition of Brownian motion starting from $B_{0}=$ 0 , that we will occasionally find useful is that $B_{t}, t \geq 0$, is a real-valued process satisfying
$\left(\mathrm{a}^{\prime}\right) B(t)$ is a Gaussian process (i.e., all its finite dimensional distributions are multivariate normal).
(b') $E B_{s}=0$ and $E B_{s} B_{t}=s \wedge t$.
(c') With probability one, $t \rightarrow B_{t}$ is continuous.
It is easy to see that (a) and (b) imply (a'). To get (b') from (a) and (b), suppose $s<t$ and write

$$
E B_{s} B_{t}=E\left(B_{s}^{2}\right)+E\left(B_{s}\left(B_{t}-B_{s}\right)\right)=s
$$

The converse is even easier. ( $\mathrm{a}^{\prime}$ ) and ( $\mathrm{b}^{\prime}$ ) specify the finite dimensional distributions of $B_{t}$, which by the last calculation must agree with the ones defined in (a) and (b).

The first question that must be addressed in any treatment of Brownian motion is, "Is there a process with these properties?" The answer is "Yes," of course, or this chapter would not exist. For pedagogical reasons, we will pursue an approach that leads to a dead end and then retreat a little to rectify the difficulty. Fix an $x \in \mathbf{R}$ and for each $0<t_{1}<\ldots<t_{n}$, define a measure on $\mathbf{R}^{n}$ by

$$
\begin{equation*}
\mu_{x, t_{1}, \ldots, t_{n}}\left(A_{1} \times \ldots \times A_{n}\right)=\int_{A_{1}} d x_{1} \cdots \int_{A_{n}} d x_{n} \prod_{m=1}^{n} p_{t_{m}-t_{m-1}}\left(x_{m-1}, x_{m}\right) \tag{7.1.2}
\end{equation*}
$$

where $A_{i} \in \mathcal{R}, x_{0}=x, t_{0}=0$, and

$$
p_{t}(a, b)=(2 \pi t)^{-1 / 2} \exp \left(-(b-a)^{2} / 2 t\right)
$$

From the formula above, it is easy to see that for fixed $x$ the family $\mu$ is a consistent set of finite dimensional distributions (f.d.d.'s), that is, if $\left\{s_{1}, \ldots, s_{n-1}\right\} \subset\left\{t_{1}, \ldots, t_{n}\right\}$ and $t_{j} \notin\left\{s_{1}, \ldots, s_{n-1}\right\}$ then
$\mu_{x, s_{1}, \ldots, s_{n-1}}\left(A_{1} \times \cdots \times A_{n-1}\right)=\mu_{x, t_{1}, \ldots, t_{n}}\left(A_{1} \times \cdots \times A_{j-1} \times \mathbf{R} \times A_{j} \times \cdots \times A_{n-1}\right)$
This is clear when $j=n$. To check the equality when $1 \leq j<n$, it is enough to show that

$$
\int p_{t_{j}-t_{j-1}}(x, y) p_{t_{j+1}-t_{j}}(y, z) d y=p_{t_{j+1}-t_{j-1}}(x, z)
$$

By translation invariance, we can without loss of generality assume $x=0$, but all this says is that the sum of independent normals with mean 0 and variances $t_{j}-t_{j-1}$ and $t_{j+1}-t_{j}$ has a normal distribution with mean 0 and variance $t_{j+1}-t_{j-1}$.

With the consistency of f.d.d.'s verified, we get our first construction of Brownian motion:

Theorem 7.1.1. Let $\Omega_{o}=\{$ functions $\omega:[0, \infty) \rightarrow \mathbf{R}\}$ and $\mathcal{F}_{o}$ be the $\sigma$ field generated by the finite dimensional sets $\left\{\omega: \omega\left(t_{i}\right) \in A_{i}\right.$ for $1 \leq i \leq n\}$, where $A_{i} \in \mathcal{R}$. For each $x \in \mathbf{R}$, there is a unique probability measure $\nu_{x}$ on $\left(\Omega_{o}, \mathcal{F}_{o}\right)$ so that $\nu_{x}\{\omega: \omega(0)=x\}=1$ and when $0<t_{1}<\ldots<t_{n}$

$$
\begin{equation*}
\nu_{x}\left\{\omega: \omega\left(t_{i}\right) \in A_{i}\right\}=\mu_{x, t_{1}, \ldots, t_{n}}\left(A_{1} \times \cdots \times A_{n}\right) \tag{7.1.3}
\end{equation*}
$$

This follows from a generalization of Kolmogorov's extension theorem, (7.1) in the Appendix. We will not bother with the details since at this point we are at the dead end referred to above. If $C=\{\omega: t \rightarrow \omega(t)$ is continuous\} then $C \notin \mathcal{F}_{o}$, that is, $C$ is not a measurable set. The easiest way of proving $C \notin \mathcal{F}_{o}$ is to do Exercise 7.1.4.

The above problem is easy to solve. Let $\mathbf{Q}_{2}=\left\{m 2^{-n}: m, n \geq 0\right\}$ be the dyadic rationals. If $\Omega_{q}=\left\{\omega: \mathbf{Q}_{2} \rightarrow \mathbf{R}\right\}$ and $\mathcal{F}_{q}$ is the $\sigma$-field generated by the finite dimensional sets, then enumerating the rationals $q_{1}, q_{2}, \ldots$ and applying Kolmogorov's extension theorem shows that we can construct a probability $\nu_{x}$ on $\left(\Omega_{q}, \mathcal{F}_{q}\right)$ so that $\nu_{x}\{\omega: \omega(0)=x\}=1$ and (7.1.3) holds when the $t_{i} \in \mathbf{Q}_{2}$. To extend $B_{t}$ to a process defined on $[0, \infty)$, we will show:

Theorem 7.1.2. Let $T<\infty$ and $x \in \mathbf{R} . \nu_{x}$ assigns probability one to paths $\omega: \mathbf{Q}_{2} \rightarrow \mathbf{R}$ that are uniformly continuous on $\mathbf{Q}_{2} \cap[0, T]$.
Remark. It will take quite a bit of work to prove Theorem 7.1.2. Before taking on that task, we will attend to the last measure theoretic detail: We tidy things up by moving our probability measures to $(C, \mathcal{C})$, where $C=\{$ continuous $\omega:[0, \infty) \rightarrow \mathbf{R}\}$ and $\mathcal{C}$ is the $\sigma$-field generated by the coordinate maps $t \rightarrow \omega(t)$. To do this, we observe that the map $\psi$ that takes a uniformly continuous point in $\Omega_{q}$ to its unique continuous extension in $C$ is measurable, and we set

$$
P_{x}=\nu_{x} \circ \psi^{-1}
$$

Our construction guarantees that $B_{t}(\omega)=\omega_{t}$ has the right finite dimensional distributions for $t \in \mathbf{Q}_{2}$. Continuity of paths and a simple limiting argument shows that this is true when $t \in[0, \infty)$. Finally, the reader should note that, as in the case of Markov chains, we have one set of random variables $B_{t}(\omega)=\omega(t)$, and a family of probability measures $P_{x}$, $x \in \mathbf{R}$, so that under $P_{x}, B_{t}$ is a Brownian motion with $P_{x}\left(B_{0}=x\right)=1$.

Proof. By translation invariance and scaling (7.1.1), we can without loss of generality suppose $B_{0}=0$ and prove the result for $T=1$. In this case, part (b) of the definition and the scaling relation imply

$$
E_{0}\left(\left|B_{t}-B_{s}\right|\right)^{4}=E_{0}\left|B_{t-s}\right|^{4}=C(t-s)^{2}
$$

where $C=E_{0}\left|B_{1}\right|^{4}<\infty$. From the last observation, we get the desired uniform continuity by using the following result due to Kolmogorov.

Thanks to Robin Pemantle for simplifying the proof and to Timo Seppäläinen for correcting the simplification.

Theorem 7.1.3. Suppose $E\left|X_{s}-X_{t}\right|^{\beta} \leq K|t-s|^{1+\alpha}$ where $\alpha, \beta>0$. If $\gamma<\alpha / \beta$ then with probability one there is a constant $C(\omega)$ so that

$$
|X(q)-X(r)| \leq C|q-r|^{\gamma} \quad \text { for all } q, r \in \mathbf{Q}_{2} \cap[0,1]
$$

Proof. Let $G_{n}=\left\{\left|X\left(i / 2^{n}\right)-X\left((i-1) / 2^{n}\right)\right| \leq 2^{-\gamma n}\right.$ for all $\left.0<i \leq 2^{n}\right\}$. Chebyshev's inequality implies $P(|Y|>a) \leq a^{-\beta} E|Y|^{\beta}$, so if we let $\lambda=\alpha-\beta \gamma>0$ then

$$
P\left(G_{n}^{c}\right) \leq 2^{n} \cdot 2^{n \beta \gamma} \cdot E\left|X\left(j 2^{-n}\right)-X\left(i 2^{-n}\right)\right|^{\beta}=K 2^{-n \lambda}
$$

Lemma 7.1.4. On $H_{N}=\cap_{n=N}^{\infty} G_{n}$ we have

$$
|X(q)-X(r)| \leq \frac{3}{1-2^{-\gamma}}|q-r|^{\gamma}
$$

for $q, r \in \mathbf{Q}_{2} \cap[0,1]$ with $|q-r|<2^{-N}$.
Proof of Lemma 7.1.4. Let $q, r \in \mathbf{Q}_{2} \cap[0,1]$ with $0<r-q<2^{-N}$. Let $I_{i}^{k}=\left[(i-1) / 2^{k}, i / 2^{k}\right)$ and let $m$ be the smallest value of $k$ for which $q$ and $r$ are in different intervals $I_{i}^{k}$. Since they were in the same interval on level $k-1, q \in I_{i}^{m}$ and $r \in I_{i+1}^{m}$. We can write

$$
\begin{aligned}
& r=i 2^{-m}+2^{-r(1)}+\cdots+2^{-r(\ell)} \\
& q=i 2^{-m}-2^{-q(1)}-\cdots-2^{-q(k)}
\end{aligned}
$$

where $N<r(1)<\cdots<r(\ell)$ and $N<q(1)<\cdots<q(k)$. To see this note that as we further subdivide, $r$ will lie in the left or right half. When it is in the right half we add another term.

On $H_{N}$

$$
\begin{aligned}
& \left|X(q)-X\left((i-1) 2^{-m}\right)\right| \leq \sum_{h=1}^{k}\left(2^{-q(h)}\right)^{\gamma} \leq \sum_{h=m}^{\infty}\left(2^{-\gamma}\right)^{h}=\frac{2^{-\gamma m}}{1-2^{-\gamma}} \\
& \left|X(r)-X\left(i 2^{-m}\right)\right| \leq \frac{2^{-\gamma m}}{1-2^{-\gamma}}
\end{aligned}
$$

Combining the last three inequalities with $2^{-m} \leq|q-r|$ and $1-2^{-\gamma}>1$ completes the proof of Lemma 7.1.4.

To prove Theorem 7.1.3 now, we note that

$$
P\left(H_{N}^{c}\right) \leq \sum_{n=N}^{\infty} P\left(G_{n}^{c}\right) \leq K \sum_{n=N}^{\infty} 2^{-n \lambda}=K 2^{-N \lambda} /\left(1-2^{-\lambda}\right)
$$

Since $\sum_{N=1}^{\infty} P\left(H_{N}^{c}\right)<\infty$, the Borel-Cantelli lemma, Theorem 2.3.1, implies

$$
|X(q)-X(r)| \leq A|q-r|^{\gamma} \quad \text { for } q, r \in \mathbf{Q}_{2} \text { with }|q-r|<\delta(\omega)
$$

To extend this to $q, r \in \mathbf{Q}_{2} \cap[0,1]$, let $s_{0}=q<s_{1}<\ldots<s_{n}= r$ with $\left|s_{i}-s_{i-1}\right|<\delta(\omega)$ and use the triangle inequality to conclude $|X(q)-X(r)| \leq C(\omega)|q-r|^{\gamma}$ where $C(\omega)=1+\delta(\omega)^{-1}$.

The scaling relation, (7.1.1), implies

$$
E\left|B_{t}-B_{s}\right|^{2 m}=C_{m}|t-s|^{m} \quad \text { where } \quad C_{m}=E\left|B_{1}\right|^{2 m}
$$

so using Theorem 7.1.3 with $\beta=2 m, \alpha=m-1$ and letting $m \rightarrow \infty$ gives a result of Wiener (1923).
Theorem 7.1.5. Brownian paths are Hölder continuous for any exponent $\gamma<1 / 2$.

It is easy to show:
Theorem 7.1.6. With probability one, Brownian paths are not Lipschitz continuous (and hence not differentiable) at any point.
Remark. The nondifferentiability of Brownian paths was discovered by Paley, Wiener, and Zygmund (1933). Paley died in 1933 at the age of 26 in a skiing accident while the paper was in press. The proof we are about to give is due to Dvoretsky, Erdös, and Kakutani (1961).

Proof. Fix a constant $C<\infty$ and let $A_{n}=\{\omega:$ there is an $s \in[0,1]$ so that $\left|B_{t}-B_{s}\right| \leq C|t-s|$ when $\left.|t-s| \leq 3 / n\right\}$. For $1 \leq k \leq n-2$, let

$$
\begin{aligned}
& Y_{k, n}=\max \left\{\left|B\left(\frac{k+j}{n}\right)-B\left(\frac{k+j-1}{n}\right)\right|: j=0,1,2\right\} \\
& B_{n}=\left\{\text { at least one } Y_{k, n} \leq 5 C / n\right\}
\end{aligned}
$$

The triangle inequality implies $A_{n} \subset B_{n}$. The worst case is $s=1$. We pick $k=n-2$ and observe

$$
\begin{aligned}
\left|B\left(\frac{n-3}{n}\right)-B\left(\frac{n-2}{n}\right)\right| & \leq\left|B\left(\frac{n-3}{n}\right)-B(1)\right|+\left|B(1)-B\left(\frac{n-2}{n}\right)\right| \\
& \leq C(3 / n+2 / n)
\end{aligned}
$$

Using $A_{n} \subset B_{n}$ and the scaling relation (7.1.1) now gives

$$
\begin{aligned}
P\left(A_{n}\right) \leq P\left(B_{n}\right) \leq n P(|B(1 / n)| \leq 5 C / n)^{3} & =n P\left(|B(1)| \leq 5 C / n^{1 / 2}\right)^{3} \\
& \leq n\left\{\left(10 C / n^{1 / 2}\right) \cdot(2 \pi)^{-1 / 2}\right\}^{3}
\end{aligned}
$$

since $\exp \left(-x^{2} / 2\right) \leq 1$. Letting $n \rightarrow \infty$ shows $P\left(A_{n}\right) \rightarrow 0$. Noticing $n \rightarrow A_{n}$ is increasing shows $P\left(A_{n}\right)=0$ for all $n$ and completes the proof.

