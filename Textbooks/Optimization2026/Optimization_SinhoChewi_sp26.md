# Lectures on Optimization 

Sinho Chewi

March 22, 2026

## Contents

1 Introduction and basics of convex functions ..... 3
1.1 Overview of the course ..... 3
1.2 Preliminaries on convexity and smoothness ..... 8
2 Gradient flow ..... 12
3 Gradient descent: smooth case ..... 17
4 Lower bounds for smooth optimization ..... 23
4.1 Reductions between the convex and strongly convex settings ..... 24
4.2 Lower bounds ..... 25
5 Acceleration ..... 28
5.1 Quadratic case: the conjugate gradient method ..... 28
5.2 General case: continuous time ..... 33
5.3 General case: discrete time ..... 36
6 Non-smooth convex optimization ..... 39
6.1 Convex analysis ..... 39
6.2 Projected subgradient methods ..... 45
6.3 Cutting plane methods ..... 49
6.4 Lower bounds ..... 52
7 Frank-Wolfe ..... 57
8 Proximal methods ..... 60
8.1 Algorithms and examples ..... 61
8.2 Convergence analysis ..... 64
9 Fenchel duality ..... 66
9.1 (Optional) Connection with classical mechanics ..... 67
9.2 Duality correspondences ..... 72
10 Mirror methods ..... 76
10.1 Bregman divergences and relative convexity/smoothness ..... 77
10.2 Algorithms and convergence analysis ..... 80
10.3 Online algorithms and multiplicative weights ..... 84
11 Alternating minimization ..... 89
11.1 Alternating projections ..... 90
11.2 Convergence analysis for alternating minimization ..... 92
11.3 Case study: entropic optimal transport ..... 97
12 Stochastic optimization ..... 103
12.1 Stochastic mirror proximal gradient descent ..... 103
12.2 Implications for statistical generalization ..... 107
12.3 Central limit theorem for Polyak-Ruppert averaging ..... 110
12.4 Variance reduction ..... 120
13 Interior point methods ..... 127
13.1 Self-concordant analysis of Newton's method ..... 127
13.2 Following the central path ..... 132
13.3 Barrier calculus and applications ..... 134
13.4 Convergence analysis ..... 136
A Background on symmetric matrices ..... 139

## 1 Introduction and basics of convex functions

These lecture notes accompany S\&DS 4320/6320 (Advanced Optimization Techniques), taught at Yale University in Spring 2025 and Spring 2026. They are not meant to be comprehensive.

The notes are primarily based on the books [Bub15; Nes18], as well as my personal understanding of the subject formed through discussions with many people over the years. Please send me feedback via email. I thank Linghai Liu, Leda Wang, Ruixiao Wang, Ilias Zadik, and Matthew S. Zhang for corrections.

Audience. This course focuses on the theory of optimization. In particular, the course is mathematical in nature and taught in a theorem-proof format. The course assumes familiarity with basic proofs and logical reasoning, as well as linear algebra, multivariate calculus, and probability theory.

The reader should also be familiar with asymptotic notions (big-O notation). We use the shorthand notation $a \lesssim b$ (resp. $a \gtrsim b$ ) to mean that $a \leq C b$ (resp. $a \geq b / C$ ) for an absolute constant $C>0$ (i.e., a constant that does not depend on other parameters of the problem), and $a \asymp b$ to mean that both $a \lesssim b$ and $a \gtrsim b$ hold. We use $a=O(b)$ and $a \lesssim b$ interchangeably.

### 1.1 Overview of the course

The basic problem of optimization is to compute an approximate minimizer of a given function $f: \mathcal{X} \rightarrow \mathbb{R}$. In this course, $\mathcal{X}$ is always taken to be a subset of $\mathbb{R}^{d}$, although generalizations are possible (e.g., to manifolds).

Black-box optimization and the oracle model. What does it mean to "compute"? The answer depends on the representation of $f$ and our model of computation. We start by studying black-box optimization. In this model, we presume that we can evaluate $f$, and possibly its derivatives, at any chosen point $x \in X$.

The advantage of the black-box model is that it applies very generally: it is difficult to find situations in which we need to optimize a function but we cannot even evaluate it! Consequently, algorithms developed in this model can be applied to the majority of problems encountered in practice ${ }^{1}$-witness the ubiquity of gradient descent.

[^0]The disadvantage is that by its very generality, it cannot take advantage of additional structural information about $f$ which can bring computational savings. That is why, later in the course, we turn toward the study of structured optimization problems.

It is easy, at least at an intuitive level, to describe algorithms which are valid in the black-box model. Namely, they are algorithms which only "interact" with $f$ through evaluations of $f$ and its derivatives. The existence of an algorithm, together with a corresponding mathematical analysis of the number of iterations to reach an approximate minimizer contingent upon assumptions on $f$, provide an upper bound on the complexity of the optimization task. In this course, we are also interested in lower bounds, which delineate fundamental limitations encountered by any algorithm. In order to prove such a lower bound, we need to formalize the notion of "interaction" alluded to above, and this leads to the important concept of an oracle.

First, observe that it does not make sense to discuss the complexity of optimizing a single function $f$. For if $x_{\star}$ is the minimizer of $f$, we can consider the algorithm "output $x_{\star}$ ", which yields the correct answer in one iteration. But this algorithm is silly, since it utterly fails at optimizing any other function whose minimizer does not happen to be $x_{\star}$. Reflecting upon this situation, we do not consider an optimization algorithm to be sensible when it happens to succeed for one particular problem; rather, we expect it to succeed on many similar problems. Hence, we talk about a class of functions $\mathcal{F}$ of interest, and we require our algorithms to succeed on every $f \in \mathcal{F}$.

The algorithm is designed to succeed on $\mathcal{F}$ and thus, in an anthropomorphic sense, it "knows" $\mathcal{F}$. However, it does not know which particular $f \in \mathcal{F}$ it is trying to optimize. (If it possessed knowledge of $f$, then we run into the issue from before, namely it could simply output the minimizer.) The role of the oracle is to act as an intermediary between the algorithm and the function. Namely, we assume that the algorithm is allowed to ask certain questions ("queries") to the oracle for $f$, and this is the only means by which the algorithm can gather more information about $f$. The allowable queries and responses determine the nature of the oracle, e.g.:

- a zeroth-order oracle accepts a query point $x \in \mathbb{R}^{d}$ and outputs $f(x)$;
- a first-order oracle accepts a query point $x \in \mathbb{R}^{d}$ and outputs $(f(x), \nabla f(x))$.

Most of the course focuses on optimization with a first-order oracle, but other oracles are possible (e.g., linear optimization oracles and proximal oracles). The zeroth-order and first-order oracles are easy to justify, as they correspond to the black-box model described above. As the oracles become more exotic, it becomes necessary to show that they are reasonable, by describing important applications in which such access to $f$ is feasible.

The query complexity of $\mathcal{F}$ for a particular choice of oracle, as a function of the prescribed tolerance $\varepsilon$, is then (informally) defined to be the minimum number $N$ such
that there exists an algorithm which, for any $f \in \mathcal{F}$, makes $N$ queries to the oracle for $f$ and outputs a point $x$ with $f(x)-\min f \leq \varepsilon$.

It is worth noting that query complexity is not the same as computational complexity. Indeed, query complexity only counts the number of interactions with the oracle, and the algorithm is allowed to perform unlimited computations between interactions. In principle, this could lead to a situation in which query complexity is wholly unrepresentative of the true computational cost of optimization-this would be the case if optimal algorithms in the oracle model were contrived and impractical. Thankfully, this is not the case. The oracle model is widely adopted as the standard model for optimization because it is the setting in which we can make precise claims about complexity, and because it generally aligns with optimization in practice.

This summarizes the conceptual framework for optimization theory-the "identity cards of the field" [Nes18], although a careful treatment of the framework only becomes necessary when discussing lower bounds (and hence we elaborate on the details then). As a branch of mathematics, the theory of optimization could be defined as the quest to characterize the query complexity of various classes $\mathcal{F}$, under various oracle models, and thereby identify optimal algorithms. This indeed remains a core element of the field, but as query complexity reaches maturity, research has shifted toward different types of questions, often inspired by practical developments.

The role of convexity. In order to optimize efficiently, we need to place assumptions on $f$, ideally minimal ones. For example, we can assume that $f$ is continuous. In this course, however, we are interested in quantitative rates of convergence for algorithms, and for this purpose, a qualitative assumption such as continuity is not enough. A quantitative form of continuity is to assume that $f$ is L-Lipschitz in the $\ell_{\infty}$ norm:

$$
\begin{equation*}
|f(x)-f(y)| \leq L \max _{i \in[d]}|x[i]-y[i]| \quad \text { for all } x, y \in \mathcal{X} \tag{1.1}
\end{equation*}
$$

Also, for concreteness, let us take $\mathcal{X}$ to be the cube, $\mathcal{X}=[0,1]^{d}$. In the language of the framework above, we consider the class

$$
\begin{equation*}
\mathcal{F}=\left\{f:[0,1]^{d} \rightarrow \mathbb{R} \mid f \text { satisfies }(1.1)\right\} \tag{1.2}
\end{equation*}
$$

One can then prove the following negative result.

Theorem 1.1. For any $0<\varepsilon<L / 2$ and any deterministic algorithm, the complexity of $\varepsilon$-approximately minimizing functions in the class defined in (1.2) to within $\varepsilon$ using a zeroth-order oracle is at least $\left\lfloor\frac{L}{2 \varepsilon}\right\rfloor^{d}$.

Thus, for $\varepsilon<L / 2$, the complexity grows exponentially with the dimension. The proof is not difficult; see, e.g., [Nes18, Theorem 1.1.2]. It is also robust: variants of the result can be proven when the notion of Lipschitzness is w.r.t. the $\ell_{2}$ norm; when the oracle is taken to be a first-order oracle; when the algorithm is allowed to be randomized; etc. The message is clear: in order for optimization to be tractable in the worst case, we must impose some structural assumptions.

The black-box oracles we have been considering are local in nature: given a query point $x \in \mathbb{R}^{d}$, the oracle reveals some information about the behavior of $f$ in a local neighborhood of $x$. Assumptions such as Lipschitzness effectively govern how large this local neighborhood is. But ultimately, to render optimization tractable, we must ensure that local information yields global consequences. As justified in the next subsection, a key assumption that makes this possible is convexity.

Of course, not every problem is convex, and non-convex optimization often still succeeds. But for the purpose of understanding the core principles underlying optimization, there is no better starting place. It is important to remember that convex problems abound in every application domain; here, we give two classical examples from statistics.

Example 1.2 (logistic regression). The data consists of $n$ pairs $\left(X_{i}, Y_{i}\right) \in \mathbb{R}^{d} \times\{0,1\}$, where $X_{i}$ is a vector of covariates and $Y_{i}$ is a binary response. The statistical model assumes that the pairs are independently drawn, the covariates are deterministic, and $Y_{i}$ has a Bernoulli distribution with parameter $\exp \left(\left\langle\theta, X_{i}\right\rangle\right) /\left\{1+\exp \left(\left\langle\theta, X_{i}\right\rangle\right)\right\}$. The goal is to infer the parameter $\theta$.

The maximum likelihood estimator (MLE) for this model is the solution to the convex optimization problem

$$
\widehat{\theta}_{\mathrm{MLE}} \in \underset{\theta \in \mathbb{R}^{d}}{\arg \min } \frac{1}{n} \sum_{i=1}^{n}\left(\log \left(1+\exp \left\langle\theta, X_{i}\right\rangle\right)-Y_{i}\left\langle\theta, X_{i}\right\rangle\right) .
$$

Example 1.3 (LASSO). The data consists of $n$ pairs $\left(X_{i}, Y_{i}\right) \in \mathbb{R}^{d} \times \mathbb{R}$. The statistical model assumes that the pairs are independently drawn, and that $Y_{i}=\left\langle\theta, X_{i}\right\rangle+\xi_{i}$, where the $\xi_{i}$ 's are i.i.d. noise variables independent of the $X_{i}$ 's. When the parameter $\theta$ is assumed to be sparse, it is standard to use the LASSO estimator, which is the solution to the convex optimization problem

$$
\widehat{\theta}_{\mathrm{LASSO}}=\underset{\theta \in \mathbb{R}^{d}}{\arg \min }\left\{\frac{1}{2 n} \sum_{i=1}^{n}\left(Y_{i}-\left\langle\theta, X_{i}\right\rangle\right)^{2}+\lambda\|\theta\|_{1}\right\} .
$$

Here, $\lambda>0$ is the regularization parameter and $\|\cdot\|_{1}$ denotes the $\ell_{1}$ norm, defined via $\|\theta\|_{1}:=\sum_{i=1}^{d}|\theta[i]|$.

In these examples, the estimator is defined as the solution to a convex problem which is not solvable in closed form, necessitating the use of numerical optimization. Actually, it is not that most problems in the "wild" are convex and hence there was a need to develop convex optimization. In fact, it often goes the other way around: convex optimization is such a powerful tool that problems are intentionally formulated to be convex. This is the case for the LASSO estimator, which can be motivated as a convex relaxation of the (statistically superior) $\ell_{0}$-constrained least-squares estimator.

First-order methods. This course largely focuses on first-order methods, namely, gradient descent and its variants. This class of methods is natural from the perspective of the theory. Equally importantly, first-order methods are lightweight and therefore scalable to large problem sizes, making them the method of choice even for highly non-convex settings which fall squarely outside of the theory.

Beyond the black-box model. After developing results for the black-box model, we study structured problems which admit more efficient solutions. The LASSO estimator of Example 1.3 can be treated as a "composite" optimization problem (a sum of a smooth and a non-smooth function), and the estimators in both Example 1.2 and Example 1.3 (and empirical risk minimization more generally) are "finite sum" problems whose computation can be sped up via the use of stochastic gradients. Other examples include the use of alternative geometries (mirror descent) and the use of coordinate-wise structure (alternating maximization/coordinate descent).

We also study interior-point methods, which are a practically effective suite of algorithms which solve linear programs (LPs) and semidefinite programs (SDPs) with polynomial iteration complexities.

Further topics are considered as time permits.

### 1.2 Preliminaries on convexity and smoothness

We assume familiarity with the basic notion of convexity, and we briefly review it here.

Definition 1.4. A subset $\mathcal{C} \subseteq \mathbb{R}^{d}$ is convex if for all $x, y \in \mathcal{C}$ and all $t \in[0,1]$, the point $(1-t) x+t y$ also lies in $\mathcal{C}$.

Definition 1.5. Let $\mathcal{C}$ be convex and let $\alpha \geq 0$. A function $f: \mathcal{C} \rightarrow \mathbb{R}$ is $\alpha$-convex if for all $x, y \in \mathcal{C}$ and all $t \in[0,1]$,

$$
\begin{equation*}
f((1-t) x+t y) \leq(1-t) f(x)+t f(y)-\frac{\alpha}{2} t(1-t)\|y-x\|^{2} \tag{1.3}
\end{equation*}
$$

When $\alpha=0$, this is just the usual definition of a convex function. When $\alpha>0$, we say that the function is strongly convex.

The definition above has the advantage that it does not require $f$ to be differentiable. However, for the purposes of checking and utilizing convexity, it is convenient to have the following equivalent reformulations, which should be committed to memory. For simplicity, we focus on the case $\mathcal{C}=\mathbb{R}^{d}$.

Proposition 1.6 (convexity equivalences). Let $\mathcal{C}=\mathbb{R}^{d}$ and $\alpha \geq 0$.

1. If $f$ is continuously differentiable, (1.3) is equivalent to each of the following:

$$
\begin{align*}
f(y) & \geq f(x)+\langle\nabla f(x), y-x\rangle+\frac{\alpha}{2}\|y-x\|^{2}  \tag{1.4}\\
& \text { for all } x, y \in \mathbb{R}^{d} .  \tag{1.5}\\
\langle\nabla f(y)-\nabla f(x), y-x\rangle \geq \alpha\|y-x\|^{2} & \text { for all } x, y \in \mathbb{R}^{d} .
\end{align*}
$$

2. If $f$ is twice continuously differentiable, (1.3) is equivalent to

$$
\begin{equation*}
\left\langle v, \nabla^{2} f(x) v\right\rangle \geq \alpha\|v\|^{2} \quad \text { for all } v, x \in \mathbb{R}^{d} \tag{1.6}
\end{equation*}
$$

Proof. Assume that $f$ is continuously differentiable.
(1.3) ⇒ (1.4): Rearranging (1.3) yields, for $t>0$,

$$
f(y) \geq f(x)+\frac{f((1-t) x+t y)-f(x)}{t}+\frac{\alpha(1-t)}{2}\|y-x\|^{2} .
$$

Sending $t \searrow 0$ yields (1.4).
(1.4) ⇒ (1.5): Swap $x$ and $y$ in (1.4) and add the resulting inequality back to (1.4).
(1.5) ⇒ (1.3): By the fundamental theorem of calculus, for $v:=y-x$,

$$
\begin{aligned}
f(y) & =f(x)+\int_{0}^{1}\langle\nabla f(x+s v), v\rangle \mathrm{d} s \\
f((1-t) x+t y) & =f(x)+\int_{0}^{1}\langle\nabla f(x+s t v), t v\rangle \mathrm{d} s
\end{aligned}
$$

Hence, (1.5) yields

$$
\begin{aligned}
f((1-t) x+t y)-(1-t) f(x)-t f(y) & =-t \int_{0}^{1}\langle\nabla f(x+s v)-\nabla f(x+s t v), v\rangle \mathrm{d} s \\
& \leq-t \int_{0}^{1} \alpha s(1-t)\|v\|^{2} \mathrm{~d} s=-\frac{\alpha}{2} t(1-t)\|v\|^{2}
\end{aligned}
$$

Finally, assume that $f$ is twice continuously differentiable. Letting $y=x+\varepsilon v$ in (1.5) and sending $\varepsilon \searrow 0$ establishes (1.6). Conversely, the fundamental theorem of calculus shows that

$$
\langle\nabla f(y)-\nabla f(x), y-x\rangle=\int_{0}^{1}\left\langle\nabla^{2} f(x+t(y-x))(y-x), y-x\right\rangle \mathrm{d} t
$$

and hence (1.6) implies (1.5).
The equivalent statements each have their own interpretation: for $\alpha=0$, (1.3) states that $f$ lies below each of its secant lines between the intersection points; (1.4) states that $f$ globally lies above each of its tangent lines; (1.5) states that $\nabla f$ is a monotone vector field; and (1.6) is a statement about curvature.

As noted above, the key feature of convexity is that local information yields global conclusions. Before describing this, let us first recall some basic facts about optimization. For simplicity, we consider unconstrained optimization throughout.

Lemma 1.7 (existence of minimizer). Let $f: \mathbb{R}^{d} \rightarrow \mathbb{R}$ be continuous and its level sets be bounded. Then, there exists a global minimizer of $f$.

Proof. The proof uses some analysis. Let $x_{0} \in \mathbb{R}^{d}$ and let $\mathcal{K}:=\left\{f \leq f\left(x_{0}\right)\right\}$ denote the level set. By the continuity assumption, $\mathcal{K}$ is closed and bounded, thus compact. Let $\left\{x_{n}\right\}_{n \in \mathbb{N}}$ be a minimizing sequence, $f\left(x_{n}\right) \rightarrow \inf f$. By compactness, it admits a subsequence, still denoted $\left\{x_{n}\right\}_{n \in \mathbb{N}}$, which converges to some $x_{\star} \in \mathbb{R}^{d}$. By continuity, $f\left(x_{\star}\right)=\lim _{n \rightarrow \infty} f\left(x_{n}\right)=\inf f$.

Lemma 1.8 (necessary conditions for optimality). Let $f: \mathbb{R}^{d} \rightarrow \mathbb{R}$ be minimized at $x_{\star}$.

1. If $f$ is continuously differentiable, then $\nabla f\left(x_{\star}\right)=0$.
2. If $f$ is twice continuously differentiable, then $\nabla^{2} f\left(x_{\star}\right) \geq 0$.

Proof. Let $v \in \mathbb{R}^{d}$ and $\varepsilon>0$; then, $f\left(x_{\star}+\varepsilon v\right)-f\left(x_{\star}\right) \geq 0$. If $f$ is continuously differentiable, this yields $\int_{0}^{1}\left\langle\nabla f\left(x_{\star}+\varepsilon t v\right), v\right\rangle \mathrm{d} t \geq 0$. By continuity of $\nabla f$, sending $\varepsilon \searrow 0$ proves that $\left\langle\nabla f\left(x_{\star}\right), v\right\rangle \geq 0$ for all $v \in \mathbb{R}^{d}$, which entails $\nabla f\left(x_{\star}\right)=0$.

If $f$ is twice continuously differentiable, we can expand once more to obtain $0 \leq \int_{0}^{1} \int_{0}^{1}\left\langle\nabla^{2} f\left(x_{\star}+\varepsilon s t v\right) v, v\right\rangle \mathrm{d} s \mathrm{~d} t$. By continuity of $\nabla^{2} f$, sending $\varepsilon \searrow 0$ then proves that $\left\langle\nabla^{2} f\left(x_{\star}\right) v, v\right\rangle \geq 0$ for all $v \in \mathbb{R}^{d}$.

The conditions $\nabla f\left(x_{\star}\right)=0, \nabla^{2} f\left(x_{\star}\right) \geq 0$ are necessary for optimality, but not sufficient in general. The issue is that the proof of Lemma 1.8 is entirely local, so the same conclusion holds even if $x_{\star}$ is only assumed to be a local minimizer. On the other hand, under the assumption of convexity, the first-order necessary condition becomes sufficient.

Lemma 1.9 (sufficient condition for optimality). Let $f: \mathbb{R}^{d} \rightarrow \mathbb{R}$ be convex and continuously differentiable, and let $\nabla f\left(x_{\star}\right)=0$. Then, $x_{\star}$ is a global minimizer of $f$.

In particular, every local minimizer of $f$ is a global minimizer.

Proof. This easily follows from (1.4) with $x=x_{\star}$.
Next, we note that the minimizer is unique if $f$ is strictly convex.

Lemma 1.10 (uniqueness of minimizer). Assume that $f: \mathbb{R}^{d} \rightarrow \mathbb{R}$ is strictly convex, i.e., for all distinct $x, y \in \mathbb{R}^{d}$ and $t \in(0,1), f((1-t) x+t y)<(1-t) f(x)+t f(y)$. Then, if $f$ admits a minimizer $x_{\star}$, it is unique.

Proof. If we had two distinct minimizers $x_{\star}, \tilde{x}_{\star}$, so that $f\left(x_{\star}\right)=f\left(\tilde{x}_{\star}\right)$, then strict convexity would imply $f\left(\frac{1}{2} x_{\star}+\frac{1}{2} \tilde{x}_{\star}\right)<f\left(x_{\star}\right)$, which is a contradiction.

If $f$ is strongly convex, then it is strictly convex. Also, from, e.g., (1.4), we see that $f$ grows at least quadratically at $\infty$, which implies that it has bounded level sets. We can therefore conclude:

Corollary 1.11. Let $f: \mathbb{R}^{d} \rightarrow \mathbb{R}$ be strongly convex and continuously differentiable. Then, it admits a unique minimizer $x_{\star}$, which is characterized by $\nabla f\left(x_{\star}\right)=0$.

Finally, when discussing algorithms, we also need a dual condition-an upper bound on the Hessian-which in this context is called smoothness. ${ }^{2}$

Definition 1.12. Let $\beta \geq 0$. We say that $f: \mathbb{R}^{d} \rightarrow \mathbb{R}$ is $\beta$-smooth if it is continuously differentiable and

$$
\begin{equation*}
f(y) \leq f(x)+\langle\nabla f(x), y-x\rangle+\frac{\beta}{2}\|y-x\|^{2} \quad \text { for all } x, y \in \mathbb{R}^{d} \tag{1.7}
\end{equation*}
$$

The following proposition is established in the same way as Proposition 1.6, so we omit the proof.

Proposition 1.13 (smoothness equivalences). Let $f: \mathbb{R}^{d} \rightarrow \mathbb{R}$ be continuously differentiable and $\beta \geq 0$. Then, $f$ is $\beta$-smooth if and only if

$$
\langle\nabla f(y)-\nabla f(x), y-x\rangle \leq \beta\|y-x\|^{2} \quad \text { for all } x, y \in \mathbb{R}^{d}
$$

If $f$ is twice continuously differentiable, this is also equivalent to

$$
\left\langle v, \nabla^{2} f(x) v\right\rangle \leq \beta\|v\|^{2} \quad \text { for all } v, x \in \mathbb{R}^{d}
$$

If $f$ is convex, $\beta$-smooth, and twice continuously differentiable, then $0 \leq \nabla^{2} f \leq \beta I$, which implies that the gradient $\nabla f$ is $\beta$-Lipschitz:

$$
\begin{equation*}
\|\nabla f(y)-\nabla f(x)\| \leq \beta\|y-x\| \quad \text { for all } x, y \in \mathbb{R}^{d} \tag{1.8}
\end{equation*}
$$

This remains true even without assuming twice differentiability (Exercise 3.1).

## Bibliographical notes

For further discussion on the oracle model, see [NY83, §1].

## Exercises

Exercise 1.1. Let $f=\frac{\alpha}{2}\|\cdot\|^{2}$, where $\alpha \geq 0$. Show via direct computation that (1.3) holds with equality.
Exercise 1.2. Show that for any twice continuously differentiable function $f: \mathbb{R} \rightarrow \mathbb{R}$ and any $t \in[0,1]$,

$$
f(t)=(1-t) f(0)+t f(1)-\int_{0}^{1} f^{\prime \prime}(s) \min \{s(1-t),(1-s) t\} \mathrm{d} s
$$

[^1]
## 2 Gradient flow

Before we turn toward our main first-order algorithm of interest, namely gradient descent, we first study the situation in continuous time via the gradient flow. Throughout this section, we let $\left(x_{t}\right)_{t \geq 0}$ denote the gradient flow for $f$ :

$$
\begin{equation*}
\dot{x}_{t}=-\nabla f\left(x_{t}\right) . \tag{GF}
\end{equation*}
$$

This is an ordinary differential equation (ODE), and since the main purpose of this section is to develop intuition, we assume that $f$ is twice continuously differentiable and do not worry about showing that (GF) is well-posed. We use the following notation throughout these notes:

$$
x_{\star} \in \arg \min f, \quad f_{\star}:=\min f=f\left(x_{\star}\right) .
$$

Generally, we always assume that $f$ admits a minimizer.
The most basic property of GF is that it always decreases the function value.

Lemma 2.1 (descent property of GF). For any $f: \mathbb{R}^{d} \rightarrow \mathbb{R}$, the gradient flow $\left(x_{t}\right)_{t \geq 0}$ of $f$ satisfies

$$
\partial_{t} f\left(x_{t}\right)=-\left\|\nabla f\left(x_{t}\right)\right\|^{2} \leq 0 .
$$

Proof. By the chain rule, $\partial_{t} f\left(x_{t}\right)=\left\langle\nabla f\left(x_{t}\right), \dot{x}_{t}\right\rangle=-\left\|\nabla f\left(x_{t}\right)\right\|^{2}$.
To obtain quantitative convergence results, we now use the assumption of convexity. Our first result shows that under strong convexity, the gradient flow contracts.

Theorem 2.2 (contraction of GF). Let $f: \mathbb{R}^{d} \rightarrow \mathbb{R}$ be $\alpha$-convex. Let $\left(y_{t}\right)_{t \geq 0}$ be another gradient flow for $f$, i.e., $\dot{y}_{t}=-\nabla f\left(y_{t}\right)$. Then, for all $t \geq 0$,

$$
\left\|y_{t}-x_{t}\right\| \leq \exp (-\alpha t)\left\|y_{0}-x_{0}\right\| .
$$

Proof. We differentiate the squared distance between the two flows:

$$
\partial_{t}\left(\left\|y_{t}-x_{t}\right\|^{2}\right)=2\left\langle y_{t}-x_{t}, \dot{y}_{t}-\dot{x}_{t}\right\rangle=-2\left\langle y_{t}-x_{t}, \nabla f\left(y_{t}\right)-\nabla f\left(x_{t}\right)\right\rangle \leq-2 \alpha\left\|y_{t}-x_{t}\right\|^{2},
$$

where the last inequality is (1.5). The proof is concluded by applying Grönwall's lemma (see Lemma 2.3) below.

The proof above arrives at what is called a differential inequality, that is, an inequality which holds between a quantity and its derivative(s). This is a common strategy for analyzing ODEs/PDEs, and it can be loosely viewed as the continuous-time analogue of induction. The following standard lemma is useful for handling such inequalities.

Lemma 2.3 (Grönwall). Suppose that $u:[0, T] \rightarrow \mathbb{R}$ is a continuously differentiable curve that satisfies the differential inequality

$$
\dot{u}(t) \leq A u(t)+B(t), \quad t \in[0, T]
$$

Then, it holds that

$$
u(t) \leq u(0) \exp (A t)+\int_{0}^{t} B(s) \exp (A(t-s)) \mathrm{d} s, \quad t \in[0, T]
$$

Proof. The idea is to differentiate $t \mapsto \exp (-A t) u(t)$ :

$$
\partial_{t}[\exp (-A t) u(t)]=\exp (-A t)\{-A u(t)+\dot{u}(t)\} \leq B(t) \exp (-A t)
$$

By the fundamental theorem of calculus,

$$
\exp (-A t) u(t)-u(0) \leq \int_{0}^{t} B(s) \exp (-A s) \mathrm{d} s
$$

Rearranging yields the result.
There are many variants of Grönwall's lemma that can be proven in similar ways, e.g., we can allow time-varying $A$ as well.

Returning to Theorem 2.2, we can apply Lemma 2.3 with $A=-2 \alpha$ and $B=0$ to conclude that $\left\|y_{t}-x_{t}\right\|^{2} \leq \exp (-2 \alpha t)\left\|y_{0}-x_{0}\right\|^{2}$, which proves the theorem. Note in particular that we can take $y_{t}=x_{\star}$ for all $t \geq 0$, so it yields the following statement about convergence to the minimizer: $\left\|x_{t}-x_{\star}\right\| \leq \exp (-\alpha t)\left\|x_{0}-x_{\star}\right\|$.

The next result is about convergence in function value, and unlike Theorem 2.2, it yields convergence for the case $\alpha=0$ as well.

Theorem 2.4 (convergence of GF in function value). Let $f: \mathbb{R}^{d} \rightarrow \mathbb{R}$ be $\alpha$-convex, $\alpha \geq 0$. Then, for all $t \geq 0$,

$$
f\left(x_{t}\right)-f_{\star} \leq \frac{\alpha}{2(\exp (\alpha t)-1)}\left\|x_{0}-x_{\star}\right\|^{2}
$$

When $\alpha=0$, the right-hand side should be interpreted as its limiting value as $\alpha \rightarrow 0$, namely, $\frac{1}{2 t}\left\|x_{0}-x_{\star}\right\|^{2}$.

Proof. We differentiate $t \mapsto\left\|x_{t}-x_{\star}\right\|^{2}$, but this time we apply (1.4):

$$
\partial_{t}\left(\left\|x_{t}-x_{\star}\right\|^{2}\right)=-2\left\langle\nabla f\left(x_{t}\right), x_{t}-x_{\star}\right\rangle \leq-\alpha\left\|x_{t}-x_{\star}\right\|^{2}-2\left(f\left(x_{t}\right)-f_{\star}\right)
$$

Applying Grönwall's lemma (Lemma 2.3) with $A=-\alpha, B(t)=-2\left(f\left(x_{t}\right)-f_{\star}\right)$,

$$
0 \leq\left\|x_{t}-x_{\star}\right\|^{2} \leq \exp (-\alpha t)\left\|x_{0}-x_{\star}\right\|^{2}-2 \int_{0}^{t} \exp (-\alpha(t-s))\left(f\left(x_{s}\right)-f_{\star}\right) \mathrm{d} s
$$

By the descent property (Lemma 2.1), $f\left(x_{s}\right) \geq f\left(x_{t}\right)$, so that

$$
\begin{aligned}
\int_{0}^{t} \exp (-\alpha(t-s))\left(f\left(x_{s}\right)-f_{\star}\right) \mathrm{d} s & \geq\left(f\left(x_{t}\right)-f_{\star}\right) \int_{0}^{t} \exp (-\alpha(t-s)) \mathrm{d} s \\
& =\left(f\left(x_{t}\right)-f_{\star}\right) \frac{1-\exp (-\alpha t)}{\alpha}
\end{aligned}
$$

Rearranging yields the result.
When $\alpha>0$, Theorem 2.4 shows that $f\left(x_{t}\right)-f_{\star}=O(\exp (-\alpha t))$. When $\alpha=0$, the rate becomes $f\left(x_{t}\right)-f_{\star}=O(1 / t)$. Actually, the rate in Theorem 2.4 is not sharp (see Exercise 2.1 and Exercise 2.2). However, the statement and proof are chosen because they form the basis of our approach in discrete time.

Next, we observe that convexity is not needed for convergence in function value. Due to the descent property (Lemma 2.1), it suffices to have a lower bound on the norm of the gradient to ensure that we make sufficient progress. For example, we can impose the following condition.

Definition 2.5. Let $f: \mathbb{R}^{d} \rightarrow \mathbb{R}$ be continuously differentiable and $\alpha>0$. We say that $f$ satisfies a Polyak-Lojasiewicz (PL) inequality with constant $\alpha$ if

$$
\begin{equation*}
\|\nabla f(x)\|^{2} \geq 2 \alpha\left(f(x)-f\left(x_{\star}\right)\right) \quad \text { for all } x \in \mathbb{R}^{d} \tag{PŁ}
\end{equation*}
$$

The next statement is an immediate corollary of Lemma 2.1, (PŁ), and Grönwall's lemma (Lemma 2.3).

Corollary 2.6 (convergence of GF under PŁ). Let $f: \mathbb{R}^{d} \rightarrow \mathbb{R}$ satisfy (PŁ) with constant $\alpha>0$. Then, for all $t \geq 0$,

$$
f\left(x_{t}\right)-f_{\star} \leq\left(f\left(x_{0}\right)-f_{\star}\right) \exp (-2 \alpha t)
$$

We present a few key properties of the PŁ inequality.
Proposition 2.7 (strong convexity ⇒ PŁ $\Rightarrow$ quadratic growth). Let $f: \mathbb{R}^{d} \rightarrow \mathbb{R}$ and $\alpha>0$. The following implications hold.

1. If $f$ is $\alpha$-convex, then $f$ satisfies ( $\mathrm{P} Ł$ ) with constant $\alpha$.
2. If $f$ satisfies (PŁ) with constant $\alpha$, then it satisfies the following quadratic growth property:

$$
\begin{equation*}
f(x)-f_{\star} \geq \frac{\alpha}{2} \inf _{x_{\star} \in \mathcal{X}_{\star}}\left\|x-x_{\star}\right\|^{2}, \quad \text { for all } x \in \mathbb{R}^{d} \tag{QG}
\end{equation*}
$$

where $X_{\star}$ denotes the set of minimizers of $f$.

## Proof.

1. Setting $y=x_{\star}$ in (1.4), we obtain

$$
\begin{aligned}
-\left(f(x)-f_{\star}\right) & \geq\left\langle\nabla f(x), x_{\star}-x\right\rangle+\frac{\alpha}{2}\left\|x-x_{\star}\right\|^{2} \\
& \geq-\|\nabla f(x)\|\left\|x_{\star}-x\right\|+\frac{\alpha}{2}\left\|x-x_{\star}\right\|^{2} \geq-\frac{1}{2 \alpha}\|\nabla f(x)\|^{2},
\end{aligned}
$$

where the last inequality uses $a b \leq \frac{\lambda}{2} a^{2}+\frac{1}{2 \lambda} b^{2}$ for all $\lambda>0$.
2. Let $\left(x_{t}\right)_{t \geq 0}$ denote the gradient flow for $f$ started at $x_{0}=x$. For simplicity, we present a proof assuming that the gradient flow converges to a point $x_{\star}$, although this assumption can be avoided (cf. [KNS16]). By Corollary 2.6, we see that $x_{\star} \in \mathfrak{X}_{\star}$.
We start by observing that

$$
\partial_{t}\left(\left\|x_{t}-x_{0}\right\|^{2}\right)=-2\left\langle\nabla f\left(x_{t}\right), x_{t}-x_{0}\right\rangle \leq 2\left\|\nabla f\left(x_{t}\right)\right\|\left\|x_{t}-x_{0}\right\|
$$

and hence

$$
\partial_{t}\left\|x_{t}-x_{0}\right\| \leq\left\|\nabla f\left(x_{t}\right)\right\|
$$

We differentiate the following quantity: $\mathscr{L}_{t}:=\sqrt{\frac{\alpha}{2}}\left\|x_{t}-x_{0}\right\|+\sqrt{f\left(x_{t}\right)-f_{\star}}$.

$$
\dot{\mathscr{L}}_{t} \leq \sqrt{\frac{\alpha}{2}}\left\|\nabla f\left(x_{t}\right)\right\|-\frac{\left\|\nabla f\left(x_{t}\right)\right\|^{2}}{2 \sqrt{f\left(x_{t}\right)-f_{\star}}} \leq 0
$$

where we applied (PŁ). Since $\mathscr{L}_{0}=\sqrt{f(x)-f_{\star}}$ and $\mathscr{L}_{\infty}=\sqrt{\frac{\alpha}{2}}\left\|x-x_{\star}\right\|$, we deduce the result from $\mathscr{L}_{0} \geq \mathscr{L}_{\infty}$. $\square$

Hence, strong convexity implies (PŁ), but is (PŁ) truly weaker than convexity? Indeed, there are examples. In particular, the P Ł condition has been of interest in recent years because it holds for certain overparametrized models (Exercise 2.3).

We conclude this section by studying the implication of Lemma 2.1 alone. The fundamental theorem of calculus shows that

$$
\frac{1}{t} \int_{0}^{t}\left\|\nabla f\left(x_{s}\right)\right\|^{2} \mathrm{~d} s \leq \frac{f\left(x_{0}\right)-f\left(x_{t}\right)}{t} \leq \frac{f\left(x_{0}\right)-f_{\star}}{t} .
$$

We therefore arrive at the following simple consequence.

Corollary 2.8 (convergence of GF in gradient norm). For any $f: \mathbb{R}^{d} \rightarrow \mathbb{R}$,

$$
\min _{s \in[0, t]}\left\|\nabla f\left(x_{s}\right)\right\| \leq \sqrt{\frac{f\left(x_{0}\right)-f_{\star}}{t}} .
$$

(In contrast, note that if we additionally assume convexity, then Exercise 2.1 shows that $\left\|\nabla f\left(x_{t}\right)\right\|=O(1 / t)$.)

This implies there exists a sequence of times $\left\{t_{n}\right\}_{n \in \mathbb{N}} / \infty$ such that $\left\|\nabla f\left(x_{t_{n}}\right)\right\| \rightarrow 0$. (Indeed, $\min _{s \in[n, 2 n]}\left\|\nabla f\left(x_{s}\right)\right\|=O\left(1 / n^{1 / 2}\right)$, so we can choose $t_{n} \in[n, 2 n]$.) However, the gradient flow may not converge. Famously, it is a result of [Łoj63] that for real analytic $f$, if the gradient flow remains bounded, then it does converge, and hence necessarily to a stationary point. Of course, such a stationary point may not be a global minimizer.

The idea of subsequent sections is to replicate the preceding analysis in discrete time.

## Bibliographical notes

My understanding of Theorem 2.4, Exercise 2.1, and Exercise 2.2 is based on extensive discussions with Jason M. Altschuler, Adil Salim, Andre Wibisono, and Ashia Wilson. The proof in Exercise 2.1 is taken from [OV01], and the extension in Exercise 2.2 to $\alpha>0$ is recorded in [LMW24, §F]. Both of these references pertain to the Langevin diffusion, but underneath the hood they make use of principles from optimization; see [Che26] for an introduction to this perspective.

The PŁ inequality is attributed to [Łoj63; Pol63] and it was popularized in [KNS16]. The proof that ( PE ) implies the quadratic growth inequality goes back at least to the celebrated work of [OV00].

## Exercises

Exercise 2.1. Let $f$ be convex. Show that the following quantity is decreasing, $\dot{\mathscr{L}}_{t} \leq 0$ :

$$
\mathscr{L}_{t}:=t^{2}\left\|\nabla f\left(x_{t}\right)\right\|^{2}+2 t\left(f\left(x_{t}\right)-f_{\star}\right)+\left\|x_{t}-x_{\star}\right\|^{2}
$$

Deduce the following gradient bound:

$$
\left\|\nabla f\left(x_{t}\right)\right\|^{2} \leq \frac{1}{t^{2}}\left\|x_{0}-x_{\star}\right\|^{2}
$$

Moreover, use (1.4) to argue that $2 t\left(f\left(x_{t}\right)-f_{\star}\right) \leq t^{2}\left\|\nabla f\left(x_{t}\right)\right\|^{2}+\left\|x_{t}-x_{\star}\right\|^{2}$, hence

$$
\begin{equation*}
f\left(x_{t}\right)-f_{\star} \leq \frac{1}{4 t}\left\|x_{0}-x_{\star}\right\|^{2} \tag{2.1}
\end{equation*}
$$

Note that this improves upon Theorem 2.4 by a factor of 2 . Furthermore, show that (2.1) is sharp, as follows: for any $R, t>0$, let $f: x \mapsto \frac{R}{2 t} \max \{0, x\}, x_{0}=R$, and show that (2.1) holds with equality.

Exercise 2.2. Extend Exercise 2.1 to the case $\alpha>0$. Toward this end, consider

$$
\mathscr{L}_{t}:=A_{t}\left\|\nabla f\left(x_{t}\right)\right\|^{2}+2 B_{t}\left(f\left(x_{t}\right)-f_{\star}\right)+\left\|x_{t}-x_{\star}\right\|^{2}
$$

Choose $A_{t}, B_{t}$ carefully to ensure that $\dot{\mathscr{L}}_{t} \leq-\alpha \mathscr{L}_{t}$, and thereby deduce the following sharp bounds:

$$
\left\|\nabla f\left(x_{t}\right)\right\|^{2} \leq \frac{\alpha^{2}\left\|x_{0}-x_{\star}\right\|^{2}}{\exp (2 \alpha t)(1-\exp (-\alpha t))^{2}}, \quad f\left(x_{t}\right)-f_{\star} \leq \frac{\alpha\left\|x_{0}-x_{\star}\right\|^{2}}{2(\exp (2 \alpha t)-1)}
$$

Exercise 2.3. Let $f: \mathbb{R}^{n} \rightarrow \mathbb{R}$ be $\alpha$-convex with $\alpha>0$, and let $g: \mathbb{R}^{d} \rightarrow \mathbb{R}^{n}$ with $d \geq n$. Assume that $g$ is surjective and that for all $x \in \mathbb{R}^{d}$, if $\nabla g(x)$ denotes the Jacobian at $x$ (interpreted as a $d \times n$ matrix), then $\nabla g(x)^{\top} \nabla g(x) \geq \sigma I_{n}$. Show that the composition $f \circ g$ satisfies (PŁ) with constant $\alpha \sigma$. Note that for $d>n$, there are typically multiple minimizers of $f \circ g$.

## 3 Gradient descent: smooth case

In this section, we study the gradient descent algorithm:

$$
\begin{equation*}
x_{n+1}:=x_{n}-h \nabla f\left(x_{n}\right) \tag{GD}
\end{equation*}
$$

From the perspective of numerical analysis, this is the Euler or forward discretization of (GF). Our aim is to show that if $f$ is smooth, and the step size is sufficiently small (as a function of the smoothness), then the conclusions for (GF) transfer to (GD). Throughout this section, we assume that $f$ is twice continuously differentiable and $\beta$-smooth.

Some of the results in this section pertain to a single step of (GD), so we use the following notation:

$$
x^{+}:=x-h \nabla f(x) .
$$

The first step is to establish the descent property.

Lemma 3.1 (descent lemma). For any $\beta$-smooth $f: \mathbb{R}^{d} \rightarrow \mathbb{R}$, if $h \leq 1 / \beta$, then

$$
f\left(x^{+}\right)-f(x) \leq-\frac{h}{2}\|\nabla f(x)\|^{2}
$$

Proof. By the smoothness inequality (1.7),

$$
f\left(x^{+}\right) \leq f(x)+\left\langle\nabla f(x), x^{+}-x\right\rangle+\frac{\beta}{2}\left\|x^{+}-x\right\|^{2}=f(x)-h\|\nabla f(x)\|^{2}+\frac{\beta h^{2}}{2}\|\nabla f(x)\|^{2} .
$$

If $h \leq 1 / \beta$, then $-h(1-\beta h / 2) \leq-h / 2$.
It is natural to state the subsequent results in terms of the following parameter.
Definition 3.2. Let $f$ be $\alpha$-convex and $\beta$-smooth. Then, the condition number of $f$ is defined to be the ratio $\kappa:=\beta / \alpha \geq 1$.

When $f$ is quadratic, $f(x)=\frac{1}{2}\langle x, A x\rangle$ with $A$ symmetric, then $\alpha, \beta$ correspond to the minimum and maximum eigenvalues of $A$ respectively, and the ratio $\beta / \alpha$ is known in numerical linear algebra as the condition number of the matrix $A$. Thus, Definition 3.2 provides a natural generalization of this notion. With this definition in hand, we now arrive at our first convergence result for (GD).

Theorem 3.3 (contraction of GD). Let $f$ be $\alpha$-convex and $\beta$-smooth. For all $x, y \in \mathbb{R}^{d}$ and step size $h \leq 1 / \beta$,

$$
\left\|y^{+}-x^{+}\right\| \leq(1-\alpha h)^{1 / 2}\|y-x\|
$$

Proof. Expanding the square,

$$
\left\|y^{+}-x^{+}\right\|^{2}=\|y-x\|^{2}-2 h\langle y-x, \nabla f(y)-\nabla f(x)\rangle+h^{2}\|\nabla f(y)-\nabla f(x)\|^{2} .
$$

By (3.5) in Exercise 3.1 below, for $h \leq 1 / \beta$ and from (1.5) we have

$$
\left\|y^{+}-x^{+}\right\|^{2} \leq\|y-x\|^{2}-h\langle\nabla y-x, \nabla f(y)-\nabla f(x)\rangle \leq(1-\alpha h)\|y-x\|^{2} .
$$

In particular, if we take $y=x_{\star}, h=1 / \beta$, and iterate, it yields

$$
\left\|x_{N}-x_{\star}\right\| \leq\left(1-\frac{1}{\kappa}\right)^{N / 2}\left\|x_{0}-x_{\star}\right\| \leq \exp \left(-\frac{N}{2 \kappa}\right)\left\|x_{0}-x_{\star}\right\| .
$$

Thus, to obtain $\left\|x_{N}-x_{\star}\right\| \leq \varepsilon$, it suffices to take $N \geq 2 \kappa \log \left(\left\|x_{0}-x_{\star}\right\| / \varepsilon\right)$.
The essence of these proofs is that the first-order term (scaling as $h$ ) replicates the continuous-time calculation, and we must apply smoothness in an appropriate way to control the second-order term (scaling as $h^{2}$ ). In the above proof, note that if we naïvely use Lipschitzness of the gradient (1.8) to control the second-order term, it leads to the suboptimal choice of step size $h=1 /(\beta \kappa)$, and a contraction factor of $\left(1-1 / \kappa^{2}\right)^{1 / 2}$. To obtain $\left\|x_{N}-x_{\star}\right\| \leq \varepsilon$, we would then have the estimate $N \geq 2 \kappa^{2} \log \left(\left\|x_{0}-x_{\star}\right\| / \varepsilon\right)$, which is substantially worse. In conclusion, a bit of finesse is necessary. (In fact, Theorem 3.3 can also be improved, and the sharp rate is derived in Exercise 3.2.)

Next, we turn toward the analogue of Theorem 2.4.
Theorem 3.4 (convergence of GD in function value). Let $f$ be $\alpha$-convex and $\beta$-smooth. For any step size $h \leq 1 / \beta$,

$$
\begin{equation*}
\left\|x^{+}-x_{\star}\right\|^{2} \leq(1-\alpha h)\left\|x-x_{\star}\right\|^{2}-2 h\left(f\left(x^{+}\right)-f_{\star}\right) \tag{3.1}
\end{equation*}
$$

Therefore,

$$
\begin{equation*}
f\left(x_{N}\right)-f_{\star} \leq \frac{\alpha}{2\left\{(1-\alpha h)^{-N}-1\right\}}\left\|x_{0}-x_{\star}\right\|^{2} \tag{3.2}
\end{equation*}
$$

When $\alpha=0$, the right-hand side should be interpreted as its limiting value as $\alpha \rightarrow 0$, namely, $\frac{1}{2 N h}\left\|x_{0}-x_{\star}\right\|^{2}$.

Proof. Expanding the square and applying convexity via (1.4),

$$
\begin{aligned}
\left\|x^{+}-x_{\star}\right\|^{2} & =\left\|x-x_{\star}\right\|^{2}-2 h\left\langle\nabla f(x), x-x_{\star}\right\rangle+h^{2}\|\nabla f(x)\|^{2} \\
& \leq(1-\alpha h)\left\|x-x_{\star}\right\|^{2}-2 h\left(f(x)-f_{\star}\right)+h^{2}\|\nabla f(x)\|^{2}
\end{aligned}
$$

For $h \leq 1 / \beta$, the descent lemma (Lemma 3.1) now implies (3.1).
The proof of (3.2), based on iterating the recursive inequality (3.1), is justified after Lemma 3.5 below.

We remark for later use that the proof of (3.1) goes through even if we replace $x_{\star}$ with any other point $z \in \mathbb{R}^{d}$, i.e.,

$$
\begin{equation*}
\left\|x^{+}-z\right\|^{2} \leq(1-\alpha h)\|x-z\|^{2}-2 h\left(f\left(x^{+}\right)-f(z)\right), \quad \text { for all } z \in \mathbb{R}^{d} \tag{3.3}
\end{equation*}
$$

Iterating (3.1) is a matter of unrolling the recursion, but in order to maintain the analogy with continuous time, we refer to the lemma below as "discrete Grönwall".

Lemma 3.5 (discrete Grönwall). Suppose that for some $A>0$,

$$
u_{n+1} \leq A u_{n}+B_{n} \quad \text { for } n=0,1, \ldots, N-1
$$

Then,

$$
u_{N} \leq A^{N} u_{0}+\sum_{n=1}^{N} A^{N-n} B_{n-1}
$$

Proof. We multiply the given inequality by $A^{-(n+1)}$ to form a telescoping sum:

$$
A^{-N} u_{N}-u_{0}=\sum_{n=0}^{N-1} A^{-(n+1)}\left(u_{n+1}-A u_{n}\right) \leq \sum_{n=0}^{N-1} A^{-(n+1)} B_{n}
$$

Rearrange to obtain the result.
To complete the proof of Theorem 3.4, we apply Lemma 3.5 with $u_{n}=\left\|x_{n}-x_{\star}\right\|^{2}$, $A=1-\alpha h$, and $B_{n}=-2 h\left(f\left(x_{n+1}\right)-f_{\star}\right)$, yielding

$$
2 h \sum_{n=1}^{N}(1-\alpha h)^{N-n}\left(f\left(x_{n}\right)-f_{\star}\right) \leq(1-\alpha h)^{N}\left\|x_{0}-x_{\star}\right\|^{2}
$$

For $h \leq 1 / \beta$, the descent lemma (Lemma 3.1) implies $f\left(x_{n}\right)-f_{\star} \geq f\left(x_{N}\right)-f_{\star}$, so

$$
f\left(x_{N}\right)-f_{\star} \leq \frac{\left\|x_{0}-x_{\star}\right\|^{2}}{2 h \sum_{n=1}^{N}(1-\alpha h)^{-n}}=\frac{\alpha\left\|x_{0}-x_{\star}\right\|^{2}}{2\left\{(1-\alpha h)^{-N}-1\right\}}
$$

In particular, let us set $h=1 / \beta$. For $\alpha>0$ it yields

$$
f\left(x_{N}\right)-f_{\star} \leq \frac{\alpha\left\|x_{0}-x_{\star}\right\|^{2}}{2\left\{(1-1 / \kappa)^{-N}-1\right\}}
$$

and for $\alpha=0$, it yields

$$
f\left(x_{N}\right)-f_{\star} \leq \frac{\beta\left\|x_{0}-x_{\star}\right\|^{2}}{2 N}
$$

The proof of convergence under (PŁ) is strikingly easy.
Theorem 3.6 (convergence of GD under PE ). Let $f$ be $\beta$-smooth and satisfy (PŁ) with constant $\alpha>0$. Then, for all $h \leq 1 / \beta$,

$$
f\left(x_{N}\right)-f_{\star} \leq(1-\alpha h)^{N}\left(f\left(x_{0}\right)-f_{\star}\right)
$$

Proof. By the descent lemma (Lemma 3.1) and (PŁ),

$$
\begin{aligned}
f\left(x^{+}\right)-f_{\star}=f(x)-f_{\star}+f\left(x^{+}\right)-f(x) & \leq f(x)-f_{\star}-\frac{h}{2}\|\nabla f(x)\|^{2} \\
& \leq(1-\alpha h)\left(f(x)-f_{\star}\right)
\end{aligned}
$$

Finally, we present the result for obtaining a stationary point.
Theorem 3.7. Let $f$ be $\beta$-smooth and $h \leq 1 / \beta$. Then,

$$
\min _{n=0,1, \ldots, N-1}\left\|\nabla f\left(x_{n}\right)\right\| \leq \sqrt{\frac{2\left(f\left(x_{0}\right)-f_{\star}\right)}{N h}}
$$

Proof. Telescope the descent lemma (Lemma 3.1):

$$
\frac{h}{2 N} \sum_{n=0}^{N-1}\left\|\nabla f\left(x_{n}\right)\right\|^{2} \leq \frac{1}{N} \sum_{n=0}^{N-1}\left(f\left(x_{n}\right)-f\left(x_{n+1}\right)\right) \leq \frac{f\left(x_{0}\right)-f_{\star}}{N} .
$$

We summarize the results for GD in Table 1.

| Assumptions | Criterion | Iterations |
| :---: | :---: | :---: |
| $\alpha$-convex, $\beta$-smooth | $\left\\|x_{N}-x_{\star}\right\\| \leq \varepsilon$ | $O(\kappa \log (R / \varepsilon))$ |
| $\alpha$-convex, $\beta$-smooth | $f\left(x_{N}\right)-f_{\star} \leq \varepsilon$ | $O\left(\kappa \log \left(\alpha R^{2} / \varepsilon\right)\right)$ |
| convex, $\beta$-smooth | $f\left(x_{N}\right)-f_{\star} \leq \varepsilon$ | $O\left(\beta R^{2} / \varepsilon\right)$ |
| $\alpha$-(PŁ), $\beta$-smooth | $f\left(x_{N}\right)-f_{\star} \leq \varepsilon$ | $O\left(\kappa \log \left(\Delta_{0} / \varepsilon\right)\right)$ |
| $\beta$-smooth | $\min _{n=0,1, \ldots, N-1}\left\\|\nabla f\left(x_{n}\right)\right\\| \leq \varepsilon$ | $O\left(\beta \Delta_{0} / \varepsilon^{2}\right)$ |

Table 1: Rates for GD with step size $1 / \beta$. Here, $R:=\left\|x_{0}-x_{\star}\right\|$ and $\Delta_{0}:=f\left(x_{0}\right)-f_{\star}$.

> Example 3.8 (logistic regression revisited). For fun, let us revisit logistic regression (Example 1.2) from a statistical lens. For concreteness, we consider Gaussian design, $X_{i} \stackrel{\text { i.i.d. }}{\sim}$ normal $(0, I)$, and assume that the data is generated from the model with a true parameter $\theta^{\star}$. Let $\widehat{\mathcal{L}}$ denote the MLE objective, let $\mathcal{L}:=\mathbb{E} \widehat{\mathcal{L}}$ denote the population risk, and let $R:=\left\|\theta^{\star}\right\| \geq 1$. The state-of-the-art result [CLM24] shows that if $n \gtrsim R d$ for a sufficiently large implied constant, $\widehat{\theta}_{\text {MLE }}$ exists with probability $\geq 1-\exp (-d)$ and satisfies the optimal risk bound $\mathcal{L}\left(\widehat{\theta}_{\text {MLE }}\right)-\mathcal{L}\left(\theta^{\star}\right) \lesssim d / n$.

> In practice, we cannot compute $\widehat{\theta}_{\text {MLE }}$ exactly, so we use optimization. From [CLM24], any estimator $\widehat{\theta}$ satisfying $\widehat{\mathcal{L}}(\widehat{\theta})-\widehat{\mathcal{L}}\left(\widehat{\theta}_{\text {MLE }}\right) \lesssim d / n$ satisfies the same statistical risk bound as $\widehat{\theta}_{\text {MLE }}$, up to a universal constant. We take $\widehat{\theta}=\widehat{\theta}_{\text {GD }}$ to be the output of GD after $N$ steps, and check how large $N$ must be in order for this to hold. As justified in Exercise 3.4, we can expect an iteration complexity of $N \asymp R^{2} n / d$.

## Bibliographical notes

My understanding of Theorem 3.4 is again based on extensive discussions with Jason M. Altschuler, Adil Salim, Andre Wibisono, and Ashia Wilson.

## Exercises

Exercise 3.1. Let $f: \mathbb{R}^{d} \rightarrow \mathbb{R}$ be convex and $\beta$-smooth. Apply Lemma 3.1 to the function $y \mapsto f(y)-\langle\nabla f(x), y\rangle$ and observe that this function is minimized at $x$ in order to prove

$$
\begin{equation*}
f(y) \geq f(x)+\langle\nabla f(x), y-x\rangle+\frac{1}{2 \beta}\|\nabla f(y)-\nabla f(x)\|^{2} . \tag{3.4}
\end{equation*}
$$

From this, deduce that

$$
\begin{equation*}
\|\nabla f(y)-\nabla f(x)\|^{2} \leq \beta\langle\nabla f(y)-\nabla f(x), y-x\rangle . \tag{3.5}
\end{equation*}
$$

Finally, use the Cauchy-Schwarz inequality to show that $\nabla f$ is $\beta$-Lipschitz, i.e., that (1.8) holds. Note that this proof that convexity and $\beta$-smoothness together imply (1.8) does not require $f$ to be twice differentiable.

Exercise 3.2. Let $f$ be $\alpha$-convex and $\beta$-smooth. Let $T:=\operatorname{id}-h \nabla f$ denote the one-step GD mapping. By the fundamental theorem of calculus,

$$
\begin{aligned}
\left\|y^{+}-x^{+}\right\|=\|T(y)-T(x)\| & =\left\|\int_{0}^{1} \nabla T((1-t) x+t y)(y-x) \mathrm{d} t\right\| \\
& \leq\left(\int_{0}^{1}\|\nabla T((1-t) x+t y)\|_{\mathrm{op}} \mathrm{~d} t\right)\|y-x\|
\end{aligned}
$$

For any $z \in \mathbb{R}^{d}$, bound the eigenvalues of $\nabla T(z)$ and show that the choice of step size $h$ which minimizes the bound on $\|\nabla T(z)\|_{\mathrm{op}}$ is $h=2 /(\alpha+\beta)$. Deduce the sharp rate

$$
\left\|y^{+}-x^{+}\right\| \leq \frac{\kappa-1}{\kappa+1}\|y-x\|
$$

Note that for large $\kappa$, the contraction factor is approximately $\exp (-2 / \kappa)$, so this improves upon the iteration complexity implied by Theorem 3.3 by a factor of nearly 4 .

Exercise 3.3. Let $f(x):=\frac{1}{2}\langle x, A x\rangle$ where $A>0$. Write out the iterates of GD explicitly, and check how sharp the results of this section are.

Exercise 3.4. What does Theorem 3.4 imply for logistic regression (Example 1.2)? In the setting of Example 3.8, use the fact that $\lambda_{\text {max }}\left(\frac{1}{n} \sum_{i=1}^{n} X_{i} X_{i}^{\top}\right) \lesssim 1$ with high probability ${ }^{3}$ to justify the claimed $R^{2} n / d$ iteration complexity.

## 4 Lower bounds for smooth optimization

The goal of this section is to establish lower complexity bounds for convex smooth optimization. Refer to §1.1 for a conceptual first discussion of the oracle model.

Before doing so, we present some reductions between the convex and strongly convex settings which save us some effort.

[^2]
### 4.1 Reductions between the convex and strongly convex settings

For brevity, let us say that an algorithm successfully optimizes a function class $\mathscr{F}$ in $\phi(\mathscr{F}, R, \varepsilon)$ iterations if, given any $f \in \mathscr{F}$ and $x_{0} \in \mathbb{R}^{d}$ with $\left\|x_{0}-x_{\star}\right\| \leq R$, it outputs $x$ with $f(x)-f_{\star} \leq \varepsilon$ using no more than $\phi(\mathscr{F}, R, \varepsilon)$ queries to a first-order oracle for $f$.

Lemma 4.1. Assume there is an algorithm which successfully optimizes the class of convex and $\beta$-smooth functions in $\phi\left(\beta R^{2} / \varepsilon\right)$ iterations.

Then, there is an explicit algorithm which successfully optimizes the class of $\alpha$ convex and $\beta$-smooth functions in $O\left(\phi(8 \kappa) \log \left(\alpha R^{2} / \varepsilon\right)\right)$ iterations.

Proof. For any $\bar{x} \in \mathbb{R}^{d}$ and $\varepsilon>0$, let $\mathcal{A}(\bar{x}, \bar{\varepsilon})$ denote the output of the given algorithm, starting from $\bar{x}$ and with error tolerance $\bar{\varepsilon}$. By assumption, it outputs $\hat{x}$ with $f(\hat{x})-f_{\star} \leq \bar{\varepsilon}$ in $\phi\left(\beta \bar{R}^{2} / \bar{\varepsilon}\right)$ iterations, where $\bar{R}:=\left\|\bar{x}-x_{\star}\right\|$.

Let $f$ be $\alpha$-strongly convex and $\beta$-smooth, and let $R:=\left\|x_{0}-x_{\star}\right\|$. We define a sequence of points as follows. Let $x_{1}:=\mathcal{A}\left(x_{0}, \varepsilon_{1}\right)$. By (QG), we have

$$
\frac{\alpha}{2}\left\|x_{1}-x_{\star}\right\|^{2} \leq f\left(x_{1}\right)-f_{\star} \leq \varepsilon_{1}
$$

Set $\varepsilon_{1}=\alpha R^{2} / 8$, so that

$$
\begin{equation*}
\left\|x_{1}-x_{\star}\right\| \leq R_{1}:=R / 2=\left\|x_{0}-x_{\star}\right\| / 2 . \tag{4.1}
\end{equation*}
$$

For $\kappa:=\beta / \alpha$, this requires $\phi(8 \kappa)$ iterations.
In general, at round $k$, let $x_{k+1}:=\mathcal{A}\left(x_{k}, \alpha R_{k}^{2} / 8\right)$, where $R_{k}:=R / 2^{k}$. By the same reasoning as (4.1), each round requires $\phi(8 \kappa)$ iterations and yields a point $x_{k+1}$ with $\left\|x_{k+1}-x_{\star}\right\| \leq R_{k+1}$. Thus, if repeat this procedure for $O\left(\log \left(\alpha R^{2} / \varepsilon\right)\right)$ rounds, we can reach a point $\tilde{x}$ satisfying $\tilde{R}:=\left\|\tilde{x}-x_{\star}\right\| \leq \sqrt{\varepsilon / \alpha}$.

Finally, let $x:=\mathcal{A}(\tilde{x}, \varepsilon)$, so that $f(x)-f_{\star} \leq \varepsilon$. The complexity of this final step is $\phi\left(\beta \tilde{R}^{2} / \varepsilon\right)=\phi(\kappa)$.

For example, if we combine the $\alpha=0$ case of Theorem 3.4 with Lemma 4.1, taking $\phi(x)=O(x)$, we recover the $\alpha>0$ case of Theorem 3.4, up to constants.

Lemma 4.2. Assume there is an algorithm which successfully optimizes the class of $\alpha$-convex and $\beta$-smooth functions in $\phi(\kappa) \log \left(\alpha R^{2} / \varepsilon\right)$ iterations.

Then, there is an explicit algorithm which successfully optimizes the class of convex and $\beta$-smooth functions in $O\left(\phi\left(2 \beta R^{2} / \varepsilon\right)\right)$ iterations.

Proof. Let $f$ be convex and $\beta$-smooth. We apply the given algorithm to the regularized function $f_{\delta}:=f+\frac{\delta}{2}\left\|\cdot-x_{0}\right\|^{2}$, obtaining a point $x$ such that $f_{\delta}(x) \leq \min f_{\delta}+\varepsilon / 2$. If $x_{\delta, \star}$ denotes the minimizer of $f_{\delta}$, then

$$
f(x) \leq f_{\delta}(x) \leq f_{\delta}\left(x_{\delta, \star}\right)+\frac{\varepsilon}{2} \leq f_{\delta}\left(x_{\star}\right)+\frac{\varepsilon}{2}=f_{\star}+\frac{\delta}{2}\left\|x_{0}-x_{\star}\right\|^{2}+\frac{\varepsilon}{2} .
$$

We now set $\delta=\varepsilon / R^{2}$, so that $f(x)-f_{\star} \leq \varepsilon$.
It remains to estimate the complexity. We first note that $f_{\delta}\left(x_{\delta, \star}\right) \leq f_{\delta}\left(x_{\star}\right)$ implies $\left\|x_{0}-x_{\star, \delta}\right\| \leq\left\|x_{0}-x_{\star}\right\|$, so the initial distance to the minimizer of $f_{\delta}$ is also bounded by $R$. We can assume that $\varepsilon \leq \beta R^{2}$ (or else the minimization problem is trivial). Then, the smoothness of $f_{\delta}$ is bounded by $\beta+\delta \leq 2 \beta$, and the condition number of $f_{\delta}$ is bounded by $2 \beta R^{2} / \varepsilon$. Substitute these quantities into the complexity of the given algorithm.

Thus, the $\alpha>0$ case of Theorem 3.4 and Lemma 4.2 recover the $\alpha=0$ case of Theorem 3.4 up to constants.

Taken together, Lemma 4.1 and Lemma 4.2 show that the 0 -convex and strongly convex settings are essentially equivalent to each other, in that an optimal method for one class yields an optimal method for the other class. Thus, we now aim to address the following question: what is the smallest possible $\phi(\cdot)$ ?

### 4.2 Lower bounds

According to the discussion in §1.1, establishing a lower complexity bound requires showing that any algorithm which interacts with the first-order oracle using at most a prescribed number of queries cannot have performance better than the lower bound. Actually, although this is possible (see [NY83]), it is not especially easy. It was shown by Nesterov in an earlier edition of [Nes18] that by imposing natural restrictions on the class of algorithms under consideration, it is possible to establish the lower bounds in a more transparent way. Accordingly, his approach has become standard in the field, and it is the approach we adopt here as well. It does, however, have the drawback of not applying to general query algorithms; for example, it does not apply against randomized algorithms.

The class of algorithms we consider is the following one.

Definition 4.3. An algorithm is called a gradient span algorithm if it deterministically generates a sequence of points $\left\{x_{n}\right\}_{n \in \mathbb{N}}$ such that for all $n \in \mathbb{N}$,

$$
x_{n+1} \in x_{0}+\operatorname{span}\left\{\nabla f\left(x_{0}\right), \ldots, \nabla f\left(x_{n}\right)\right\}
$$

For example, GD is a gradient span algorithm. On the basis of this assumption, we now establish the following result; recall the asymptotic notation $\gtrsim$, which only hides a universal constant.

Theorem 4.4 (lower bound for convex, smooth minimization). For any $1 \leq N \leq \frac{d-1}{2}$, $\beta>0$, and $x_{0} \in \mathbb{R}^{d}$, there exists a convex and $\beta$-smooth function $f: \mathbb{R}^{d} \rightarrow \mathbb{R}$ such that for any gradient span algorithm,

$$
f\left(x_{N}\right)-f_{\star} \gtrsim \frac{\beta\left\|x_{0}-x_{\star}\right\|^{2}}{N^{2}}
$$

In other words, in order to obtain $f\left(x_{N}\right)-f_{\star} \leq \varepsilon$, the number of iterations must satisfy

$$
N \gtrsim \sqrt{\frac{\beta\left\|x_{0}-x_{\star}\right\|^{2}}{\varepsilon}} .
$$

Before proving this result, we observe that by applying Lemma 4.2 with $\phi(x) \asymp \sqrt{x}$, it yields the following corollary.

Theorem 4.5 (lower bound for strongly convex, smooth minimization). For any $0< \alpha<\beta$, any $\varepsilon>0$, any $d$ sufficiently large, and any $x_{0} \in \mathbb{R}^{d}$, there exists an $\alpha$-convex and $\beta$-smooth function $f: \mathbb{R}^{d} \rightarrow \mathbb{R}$ such that for any gradient span algorithm, in order to obtain $f\left(x_{N}\right)-f_{\star} \leq \varepsilon$, the number of iterations must satisfy

$$
N \gtrsim \sqrt{\kappa} \log \frac{\alpha\left\|x_{0}-x_{\star}\right\|^{2}}{\varepsilon} .
$$

Proof of Theorem 4.4. By translating the problem, we may assume $x_{0}=0$. The construction is based on the following function:

$$
f_{n}: \mathbb{R}^{d} \rightarrow \mathbb{R}, \quad f_{n}(x):=\frac{\beta}{4}\left\{\frac{1}{2}\left(x[1]^{2}+\sum_{k=1}^{n-1}(x[k]-x[k+1])^{2}+x[n]^{2}\right)-x[1]\right\}
$$

For any $v \in \mathbb{R}^{d}$,

$$
\left\langle v, \nabla^{2} f_{n}(x) v\right\rangle=\frac{\beta}{4}\left(v[1]^{2}+\sum_{k=1}^{n-1}(v[k]-v[k+1])^{2}+v[n]^{2}\right) \leq \beta\|v\|^{2},
$$

so each $f_{n}$ is convex and $\beta$-smooth.

We prove by induction that when we apply a gradient span algorithm to $f_{d}$, the $n$-th iterate $x_{n}$ belongs to the subspace

$$
\mathcal{V}_{n}:=\left\{x \in \mathbb{R}^{d}: x[k]=0 \text { for all } k=n+1, \ldots, d\right\}
$$

Clearly, $x_{0} \in \mathcal{V}_{0}$. Inductively, suppose that $x_{k} \in \mathcal{V}_{k}$ for all $k \leq n$. Then,

$$
\nabla f_{d}\left(x_{k}\right)=\frac{\beta}{4}\left(x_{k}[1] e_{1}+\sum_{j=1}^{k}\left(x_{k}[j]-x_{k}[j+1]\right)\left(e_{j}-e_{j+1}\right)\right)-\frac{\beta}{4} e_{1} \in \mathcal{V}_{k+1}
$$

hence

$$
x_{n+1} \in \operatorname{span}\left\{\nabla f_{d}\left(x_{0}\right), \ldots, \nabla f_{d}\left(x_{n}\right)\right\} \subseteq \mathcal{V}_{n+1}
$$

This completes the induction. Also, since $f_{N}=f_{d}$ on $\mathcal{V}_{N}$, it follows that

$$
f_{d}\left(x_{N}\right)=f_{N}\left(x_{N}\right) \geq\left(f_{N}\right)_{\star}
$$

The next step is to estimate $\left(f_{n}\right)_{\star}:=\min f_{n}$ for all $n$. By setting the gradient to zero, $\nabla f_{n}\left(x_{n, \star}\right)=0$, we obtain the following system of equations:

$$
\begin{aligned}
2 x_{n, \star}[1]-x_{n, \star}[2] & =1, \\
x_{n, \star}[k-1]-2 x_{n, \star}[k]+x_{n, \star}[k+1] & =0, \quad \text { for } k=1, \ldots, n-1, \\
-x_{n, \star}[n-1]+2 x_{n, \star}[n] & =0 .
\end{aligned}
$$

The solution is $x_{n, \star}[k]=1-\frac{k}{n+1}$ for all $k \in[n]$. Writing $f_{n}(x)=\frac{\beta}{4}\left\{\frac{1}{2}\left\langle x, A_{n} x\right\rangle-\left\langle e_{1}, x\right\rangle\right\}$, the system above reads $A_{n} x_{n, \star}=e_{1}$, hence

$$
\left(f_{n}\right)_{\star}=f_{n}\left(x_{n, \star}\right)=-\frac{\beta}{8}\left\langle e_{1}, x_{n, \star}\right\rangle=-\frac{\beta}{8}\left(1-\frac{1}{n+1}\right) .
$$

Moreover, $\left\|x_{0}-x_{n, \star}\right\|^{2}=\left\|x_{n, \star}\right\|^{2} \leq n$. Finally, it yields

$$
\begin{aligned}
f_{d}\left(x_{N}\right)-\left(f_{d}\right)_{\star} \geq\left(f_{N}\right)_{\star}-\left(f_{d}\right)_{\star} & =\frac{\beta}{8}\left(\frac{1}{N+1}-\frac{1}{d+1}\right) \\
& \geq \frac{\beta\left\|x_{0}-x_{d, \star}\right\|^{2}}{8 d}\left(\frac{1}{N+1}-\frac{1}{d+1}\right)
\end{aligned}
$$

Choosing $d \asymp N$, e.g., $d=2 N+1$, yields the stated lower bound.

Notably, the iteration complexity lower bounds Theorem 4.4 and Theorem 4.5 are smaller than the bounds attained by GD in Theorem 3.4 by a square root. As developed in the next sections, in fact the lower bounds are tight and GD is suboptimal.

We make two further remarks. First, it is perhaps surprising that the lower bound construction is a quadratic function; in some sense, quadratics are the hardest convex and smooth functions to optimize. Second, the lower bound requires the ambient dimension to be larger than the iteration count; this is crucial for the proof technique, which relies on the algorithm discovering one new dimension per iteration. This turns out to be fundamental because there are better methods in low dimension, for quadratics and even for general convex functions.

## Exercises

Exercise 4.1. In the setting of Theorem 4.4 and using the same construction as in the proof, show that $\left\|x_{N}-x_{\star}\right\|^{2} \gtrsim\left\|x_{0}-x_{\star}\right\|^{2}$. In other words, in the 0 -convex case, it is not possible to make progress in the sense of distance to the minimizer by more than a constant factor.

Exercise 4.2. We used the reductions from §4.1 to reduce the strongly convex lower bound to the 0 -convex lower bound for the sake of brevity, but it is of course possible to develop the strongly convex lower bound directly. Consider the function

$$
f: \mathbb{R}^{\infty} \rightarrow \mathbb{R}, \quad f(x):=\frac{\beta-\alpha}{8}\left\{x[1]^{2}+\sum_{n=1}^{\infty}(x[n]-x[n+1])^{2}-2 x[1]\right\}+\frac{\alpha}{2}\|x\|^{2}
$$

By adapting the proof of Theorem 4.4, show that any gradient span algorithm satisfies

$$
f\left(x_{N}\right)-f_{\star} \geq \frac{\alpha}{2}\left\|x_{N}-x_{\star}\right\|^{2} \geq \frac{\alpha}{2}\left(\frac{\sqrt{\kappa}-1}{\sqrt{\kappa}+1}\right)^{2 N}\left\|x_{0}-x_{\star}\right\|^{2} .
$$

## 5 Acceleration

We now show that the lower bounds of Theorem 4.4 and Theorem 4.5 can be attained via algorithms which improve upon GD. This is known as the acceleration phenomenon in optimization. We begin with the quadratic case.

### 5.1 Quadratic case: the conjugate gradient method

In this section, the objective function is quadratic:

$$
f: \mathbb{R}^{d} \rightarrow \mathbb{R}, \quad f(x)=\frac{1}{2}\langle x, A x\rangle-\langle b, x\rangle
$$

where $A$ is a symmetric matrix, $A \succ 0$. Note also that minimizing $f$ corresponds to solving the system of equations $A x_{\star}=b$. We now introduce the conjugate gradient method.

The method is succinctly described as follows:

$$
\begin{equation*}
x_{n+1}:=\arg \min \left\{f(x) \mid x \in x_{0}+\operatorname{span}\left\{\nabla f\left(x_{0}\right), \nabla f\left(x_{1}\right), \ldots, \nabla f\left(x_{n}\right)\right\}\right\} \tag{CG}
\end{equation*}
$$

This scheme is very natural in light of the definition of a gradient span algorithm (Definition 4.3) that we encountered for the lower bounds. However, it is not yet clear that (CG) can be implemented cheaply. Using the fact that $f$ is quadratic, our aim is to show that (CG) can be rewritten as a simple iteration that uses one gradient query per step.

As is usually the case in linear algebra, instead of working with the set of vectors $\left\{\nabla f\left(x_{0}\right), \nabla f\left(x_{1}\right), \ldots, \nabla f\left(x_{n}\right)\right\}$, it is more convenient to work with an orthogonal set $\left\{p_{0}, p_{1}, \ldots, p_{n}\right\}$. Here, orthogonality is with respect to the inner product $\langle\cdot, \cdot\rangle_{A}$, i.e., we will require $\left\langle p_{i}, A p_{j}\right\rangle=0$ for all $i \neq j$. We start with $p_{0}:=\nabla f\left(x_{0}\right)$, and we write $\mathcal{K}_{n}:=\operatorname{span}\left\{p_{0}, p_{1}, \ldots, p_{n}\right\}$. We must address the following two questions:

- Given $\mathcal{K}_{n}$ and $x_{n}$, how can we compute $x_{n+1}=\arg \min _{x_{0}+\mathcal{K}_{n}} f$ ?
- Given $\mathcal{K}_{n}$ and $\nabla f\left(x_{n+1}\right)$, how can we compute $p_{n+1}$ and thus $\mathcal{K}_{n+1}$ ?

For the first question, we may assume inductively that $x_{n}=\arg \min _{x_{0}+\mathcal{K}_{n-1}} f$, which means that $\left\langle\nabla f\left(x_{n}\right), p_{k}\right\rangle=0$ for all $k<n$. The next point is taken to be $x_{n+1}=x_{n}+h_{n} p_{n}$, chosen so that $\left\langle\nabla f\left(x_{n+1}\right), p_{k}\right\rangle=0$ for all $k \leq n$. Since $\nabla f$ is linear,

$$
\left\langle\nabla f\left(x_{n+1}\right), p_{k}\right\rangle=\left\langle\nabla f\left(x_{n}\right)+h_{n} A p_{n}, p_{k}\right\rangle
$$

For $k<n$, this equals zero by the inductive hypothesis on $x_{n}$, and the orthogonality of $\left\{p_{0}, p_{1}, \ldots, p_{n}\right\}$. We choose $h_{n}$ to ensure that this equals zero for $k=n$ too:

$$
h_{n}=-\frac{\left\langle\nabla f\left(x_{n}\right), p_{n}\right\rangle}{\left\|p_{n}\right\|_{A}^{2}}
$$

For the second question, we want to compute the Gram-Schmidt orthogonalization of $\nabla f\left(x_{n+1}\right)$ w.r.t. $\left\{p_{0}, p_{1}, \ldots, p_{n}\right\}$ in the $\langle\cdot, \cdot\rangle_{A}$ inner product. We claim that $\nabla f\left(x_{n+1}\right)$ is already $A$-orthogonal to $p_{k}$ for $k<n$, so that

$$
\begin{equation*}
p_{n+1}=\nabla f\left(x_{n+1}\right)-\left\langle\nabla f\left(x_{n+1}\right), p_{n}\right\rangle_{A} \frac{p_{n}}{\left\|p_{n}\right\|_{A}^{2}} \tag{5.1}
\end{equation*}
$$

To justify this, we show that for $k<n, A p_{k} \in \mathcal{K}_{k+1}$, hence

$$
\left\langle\nabla f\left(x_{n+1}\right), p_{k}\right\rangle_{A}=\left\langle\nabla f\left(x_{n+1}\right), A p_{k}\right\rangle=0
$$

using the fact shown above that $\nabla f\left(x_{n+1}\right)$ is orthogonal (in the usual inner product) to $\mathcal{K}_{n}$. Finally, the boxed equation is shown through the following lemma.

Lemma 5.1. For all $n \in \mathbb{N}$,

$$
\mathcal{K}_{n}=\operatorname{span}\left\{p_{0}, A p_{0}, \ldots, A^{n} p_{0}\right\} .
$$

Proof. We proceed via induction, where the case $n=0$ is obvious. Assuming it holds at iteration $n$, let us show that $p_{n+1} \in \widetilde{\mathcal{K}}_{n+1}:=\operatorname{span}\left\{p_{0}, A p_{0}, \ldots, A^{n+1} p_{0}\right\}$. By (5.1), it suffices to show that $\nabla f\left(x_{n+1}\right) \in \widetilde{\mathcal{K}}_{n+1}$. However, as discussed above, $\nabla f\left(x_{n+1}\right)=\nabla f\left(x_{n}\right)+ h_{n} A p_{n}=p_{0}+h_{0} A p_{0}+\cdots+h_{n} A p_{n} \in \widetilde{\mathcal{K}}_{n+1}$.

Conversely, we must show that $A^{n+1} p_{0} \in \mathcal{K}_{n+1}$. Since $A^{n} p_{0} \in \mathcal{K}_{n}$, we can write $A^{n} p_{0}=\sum_{k=0}^{n} c_{k} p_{k}$, thus $A^{n+1} p_{0}=\sum_{k=0}^{n} c_{k} A p_{k}$. By the inductive hypothesis, each $A p_{k}$ for $k<n$ belongs to $\mathcal{K}_{n}$, so it suffices to have $A p_{n} \in \mathcal{K}_{n+1}$. However, we can observe that $A p_{n}=h_{n}^{-1}\left(\nabla f\left(x_{n+1}\right)-\nabla f\left(x_{n}\right)\right) \in \mathcal{K}_{n+1}$ by (5.1). $\square$

Definition 5.2. The subspaces $\left\{\mathcal{K}_{n}\right\}_{n \in \mathbb{N}}$ are called Krylov subspaces.

Finally, let us write the iterations in a form which is convenient for implementation. Note first that $\left\langle\nabla f\left(x_{n}\right), \nabla f\left(x_{n+1}\right)\right\rangle=0$ (indeed, $\nabla f\left(x_{n+1}\right)$ is orthogonal to all of $\mathcal{K}_{n}$ ). So,

$$
\frac{\left\langle\nabla f\left(x_{n+1}\right), p_{n}\right\rangle_{A}}{\left\|p_{n}\right\|_{A}^{2}}=\frac{\left\langle\nabla f\left(x_{n+1}\right), \nabla f\left(x_{n+1}\right)-\nabla f\left(x_{n}\right)\right\rangle}{h_{n}\left\|p_{n}\right\|_{A}^{2}}=-\frac{\left\|\nabla f\left(x_{n+1}\right)\right\|^{2}}{\left\langle\nabla f\left(x_{n}\right), p_{n}\right\rangle}
$$

and $\left\|\nabla f\left(x_{n}\right)\right\|^{2}=\left\langle\nabla f\left(x_{n}\right), \nabla f\left(x_{n}\right)\right\rangle=\left\langle\nabla f\left(x_{n}\right), p_{n}\right\rangle$ using (5.1) and the fact that $\nabla f\left(x_{n}\right)$ is orthogonal to $\mathcal{K}_{n-1}$. This yields the following iteration, where we write $r_{n}:=A x_{n}-b= \nabla f\left(x_{n}\right)$ for the residual.

$$
x_{n+1}=x_{n}-\frac{\left\|r_{n}\right\|^{2}}{\left\langle p_{n}, A p_{n}\right\rangle} p_{n}, \quad r_{n+1}=r_{n}-\frac{\left\|r_{n}\right\|^{2}}{\left\langle p_{n}, A p_{n}\right\rangle} A p_{n}, \quad p_{n+1}=r_{n+1}+\frac{\left\|r_{n+1}\right\|^{2}}{\left\|r_{n}\right\|^{2}} p_{n}
$$

This algorithm requires one matrix-vector multiplication per iteration, namely, the computation of $A p_{n}$.

Note that if $p_{n+1}=0$, then $\nabla f\left(x_{n+1}\right) \in \mathcal{K}_{n}$, yet $\nabla f\left(x_{n+1}\right) \perp \mathcal{K}_{n}$ and thus $\nabla f\left(x_{n+1}\right)=0$, $x_{n+1}=x_{\star}$. Since $p_{d+1}=0$ (an orthogonal set in $\mathbb{R}^{d}$ cannot have more than $d$ non-zero elements), we arrive at the following conclusion.

Theorem 5.3 (termination of CG). The CG algorithm returns the exact minimizer in at most $d$ iterations.

Let us now show that CG can find an approximate minimizer at the accelerated rate.

Theorem 5.4 (accelerated convergence for CG). Let $0<\alpha I \leq A \leq \beta I$. Then, CG outputs $x_{N}$ satisfying $f\left(x_{N}\right)-f_{\star} \leq \varepsilon$ in $N=O\left(\sqrt{\kappa} \log \frac{f\left(x_{0}\right)-f_{\star}}{\varepsilon}\right)$ iterations.

Proof. By the descent lemma (Lemma 3.1) and the defining property of CG,

$$
f\left(x_{n+1}\right) \leq f\left(x_{n}-\frac{1}{\beta} \nabla f\left(x_{n}\right)\right) \leq f\left(x_{n}\right)-\frac{1}{2 \beta}\left\|\nabla f\left(x_{n}\right)\right\|^{2},
$$

so that

$$
f\left(x_{0}\right)-f_{\star} \geq \frac{1}{2 \beta} \sum_{n=0}^{N-1}\left\|\nabla f\left(x_{n}\right)\right\|^{2}
$$

On the other hand, since $\nabla f\left(x_{n}\right) \perp x_{k+1}-x_{k}$ for $k<n$,

$$
f_{\star}-f\left(x_{n}\right) \geq\left\langle\nabla f\left(x_{n}\right), x_{\star}-x_{n}\right\rangle=\left\langle\nabla f\left(x_{n}\right), x_{\star}-x_{0}\right\rangle
$$

If we sum these inequalities and use orthogonality of the gradients,

$$
\begin{aligned}
N\left(f\left(x_{N}\right)-f_{\star}\right) & \leq \sum_{n=0}^{N-1}\left(f\left(x_{n}\right)-f_{\star}\right) \leq\left\langle\sum_{n=0}^{N-1} \nabla f\left(x_{n}\right), x_{0}-x_{\star}\right\rangle \leq\left\|\sum_{n=0}^{N-1} \nabla f\left(x_{n}\right)\right\|\left\|x_{0}-x_{\star}\right\| \\
& \leq\left(\sum_{n=0}^{N-1}\left\|\nabla f\left(x_{n}\right)\right\|^{2}\right)^{1 / 2} \sqrt{\frac{2\left(f\left(x_{0}\right)-f_{\star}\right)}{\alpha}} \leq 2 \sqrt{\kappa}\left(f\left(x_{0}\right)-f_{\star}\right) .
\end{aligned}
$$

Let $N$ be such that $f\left(x_{N}\right)-f_{\star} \geq\left(f\left(x_{0}\right)-f_{\star}\right) / 2$. The inequality above then implies that $N \leq 4 \sqrt{\kappa}$. Thus, every $4 \sqrt{\kappa}$ iterations, the objective gap decreases by a factor of 2 .

Using the reduction in Lemma 4.2, this also yields an accelerated algorithm for minimizing smooth, weakly convex quadratics. We now sketch an alternative proof in order to explain the classical link with polynomial approximation.

Due to Lemma 5.1, $x_{N}-x_{0} \in \mathcal{K}_{N-1}$ can be written in the form $x_{N}-x_{0}=\sum_{n=0}^{N-1} c_{n} A^{n} p_{0}$, so $x_{N}-x_{\star}=x_{0}-x_{\star}+\sum_{n=0}^{N-1} c_{n} A^{n+1}\left(x_{0}-x_{\star}\right)=P_{N}(A)\left(x_{0}-x_{\star}\right)$ where $P_{N}$ is a polynomial of degree at most $N$ satisfying $P_{N}(0)=1$. Conversely, if $Q_{N}$ is any other degree- $N$ polynomial with $Q_{N}(0)=1$, then $\tilde{x}_{N}:=x_{0}+A^{-1}\left(Q_{N}(A)-I\right) p_{0} \in x_{0}+\mathcal{K}_{N-1}$ satisfies $\tilde{x}_{N}-x_{\star}=x_{0}-x_{\star}+A^{-1}\left(Q_{N}(A)-I\right) p_{0}=Q_{N}(A)\left(x_{0}-x_{\star}\right)$.

This equivalence, together with the fact that the output $x_{N}$ of CG minimizes $f$ over $x_{0}+\mathcal{K}_{N-1}$, shows that

$$
f\left(x_{N}\right)-f_{\star}=\frac{1}{2} \min \left\{\left\|Q_{N}(A)\left(x_{0}-x_{\star}\right)\right\|_{A}^{2}: Q_{N} \in \mathbb{R}_{\leq N}[X], Q_{N}(0)=1\right\}
$$

where $\mathbb{R}_{\leq N}[X]$ denotes the set of polynomials with real-valued coefficients and with degree at most $N$. Furthermore, since $A$ and $Q_{N}(A)$ commute,

$$
\left\|Q_{N}(A)\left(x_{0}-x_{\star}\right)\right\|_{A}^{2} \leq\left\|Q_{N}(A)\right\|_{\text {op }}^{2}\left\|x_{0}-x_{\star}\right\|_{A}^{2} \leq\left(\max _{\left[\lambda_{\min }(A), \lambda_{\max }(A)\right]}\left|Q_{N}\right|^{2}\right)\left\|x_{0}-x_{\star}\right\|_{A}^{2} .
$$

We have arrived at the following result.

Lemma 5.5 (CG and polynomial approximation). Assume that $0<\alpha I \leq A \leq \beta I$. Then, the output $x_{N}$ of CG satisfies

$$
f\left(x_{N}\right)-f_{\star} \leq \min \left\{\max _{\lambda \in[\alpha, \beta]}\left|Q_{N}(\lambda)\right|^{2}: Q_{N} \in \mathbb{R}_{\leq N}[X], Q_{N}(0)=1\right\}\left(f\left(x_{0}\right)-f_{\star}\right)
$$

Informally, this result states that CG performs as well as the best possible degree- $N$ polynomial in $A$. To bound the rate of convergence of CG, it therefore remains to exhibit a judicious polynomial $Q_{N}$. This is accomplished by the family of Chebyshev polynomials, on which many volumes have been written.

Definition 5.6. The degree- $n$ Chebyshev polynomial $T_{n}$ is defined so that $\cos (n \theta)= T_{n}(\cos \theta)$ for all $\theta \in \mathbb{R}$.

It is not obvious at first glance that $T_{n}$ is indeed a degree- $n$ polynomial, but this can be established via trigonometric identities. The use of the Chebyshev polynomials to establish a rate of convergence for CG is explored in Exercise 5.1.

Here, we point out another interesting fact that arises from this connection. Recall from the proof of Lemma 5.5 that if we can compute $\tilde{x}_{N}:=x_{0}+A^{-1}\left(Q_{N}(A)-I\right) p_{0}$, then it incurs error at most $f\left(\tilde{x}_{N}\right)-f_{\star} \leq\left(\max _{\lambda \in[\alpha, \beta]}\left|Q_{N}(\lambda)\right|^{2}\right)\left(f\left(x_{0}\right)-f_{\star}\right)$. In particular, rather than using CG, we can try to compute the polynomial $x \mapsto\left(Q_{N}(x)-1\right) / x$ directly, where $Q_{N}$ is the polynomial in Exercise 5.1 which witnesses the fast convergence of CG. Although we omit the details, it is worth noting that the family of Chebyshev polynomials satisfies a so-called three-term recurrence:

$$
T_{n+1}(x)=2 x T_{n}(x)-T_{n-1}(x), \quad x \in \mathbb{R}
$$

In fact, orthogonal families of polynomials usually do. ${ }^{4}$ From an algorithmic standpoint, it leads to an optimization algorithm of the form

$$
x_{n+1}=c_{0} A x_{n}+c_{1} x_{n-1}+c_{2} b
$$

[^3]where $c_{0}, c_{1}, c_{2} \in \mathbb{R}$ are fixed coefficients. Note that unlike GD, $x_{n+1}$ depends on the previous two iterates. This is often referred to as momentum, and also forms the basis for acceleration for general convex functions.

Remark 5.7 (practicality of CG). Solving the linear system $A x=b$ via Gaussian elimination requires $O\left(d^{3}\right)$ operations and is numerically unstable, whereas for wellconditioned matrices $A$, CG returns an approximate solution in $\widetilde{O}(\sqrt{\kappa})$ iterations, each of which requires a matrix-vector multiplication. A matrix-vector multiplication requires $O\left(d^{2}\right)$ time in the worst case, but can be faster if $A$ is sparse. In practice, CG is widely used, especially when combined with other strategies such as preconditioning.

### 5.2 General case: continuous time

Although it does not follow the historical development of events, we begin our treatment of acceleration for general convex smooth functions in continuous time. As identified in [SBC16], the continuous-time ODE is

$$
\begin{align*}
& \dot{x}_{t}=p_{t}  \tag{AGF}\\
& \dot{p}_{t}=-\nabla f\left(x_{t}\right)-\gamma_{t} p_{t}
\end{align*}
$$

We refer to (AGF) as the accelerated gradient flow, and the variable $p_{t}$ admits the physical interpretation of momentum (for a particle with unit mass). The dynamics consists of two parts: the equations

$$
\begin{aligned}
& \dot{x}_{t}=p_{t} \\
& \dot{p}_{t}=-\nabla f\left(x_{t}\right)
\end{aligned}
$$

are known as Hamilton's equations, and they are the standard first-order reformulation of Newton's law of motion $\ddot{x}_{t}=-\nabla f\left(x_{t}\right)$ with potential energy $f$. Hamilton's equations conserve the energy (or Hamiltonian) $H(x, p):=f(x)+\frac{1}{2}\|p\|^{2}$, and this conservation property is perhaps undesirable for an optimization algorithm which seeks to minimize $f$. Thus, the second part of the dynamics, $\dot{p}_{t}=-\gamma_{t} p_{t}$ adds a dissipative friction force, where $\gamma_{t} \geq 0$ is a possibly time-varying coefficient of friction.

In the case where $f$ is merely assumed to be convex, it turns out that the right choice of friction coefficient is $\gamma_{t}=3 / t$. This is mysterious at first sight and was obtained by taking the continuous-time limit of Nesterov's discrete algorithm in the next subsection. We begin with a convergence analysis in this setting. (Similar caveats as for §2 apply here; we assume that $f$ is smooth, that it admits a minimizer $x_{\star}$, and that (AGF) is well-posed.)

Theorem 5.8 (convergence of AGF under convexity). Let $f: \mathbb{R}^{d} \rightarrow \mathbb{R}$ be convex and let $\left(x_{t}\right)_{t \geq 0}$ evolve along AGF with $\gamma_{t}=3 / t$ and $p_{0}=0$. Then, for all $t \geq 0$,

$$
f\left(x_{t}\right)-f_{\star} \leq \frac{2\left\|x_{0}-x_{\star}\right\|^{2}}{t^{2}}
$$

Proof. Consider the auxiliary point $z_{t}:=x_{t}+\frac{t}{2} p_{t}$, and the Lyapunov function

$$
\mathscr{L}_{t}:=\frac{t^{2}}{2}\left(f\left(x_{t}\right)-f_{\star}\right)+\left\|z_{t}-x_{\star}\right\|^{2}
$$

The computation below shows that $\dot{\mathscr{L}}_{t} \leq 0$, which implies the result. The choice of Lyapunov function is mysterious, so we partially demystify it after the proof.

Straightforward differentiation and convexity yield

$$
\begin{aligned}
\dot{\mathscr{L}}_{t} & =t\left(f\left(x_{t}\right)-f_{\star}\right)+\frac{t^{2}}{2}\left\langle\nabla f\left(x_{t}\right), p_{t}\right\rangle-t\left\langle\nabla f\left(x_{t}\right), z_{t}-x_{\star}\right\rangle \\
& =t\left(f\left(x_{t}\right)-f_{\star}\right)-t\left\langle\nabla f\left(x_{t}\right), x_{t}-x_{\star}\right\rangle \leq 0
\end{aligned}
$$

Although the Lyapunov function above appears fortuitous, it can be derived in a reasonably systematic manner; see Exercise 5.2. The strongly convex case is similar, and is left as Exercise 5.3.

Theorem 5.9 (convergence of AGF under strong convexity). Let $f: \mathbb{R}^{d} \rightarrow \mathbb{R}$ be $\alpha$-convex and let $\left(x_{t}\right)_{t \geq 0}$ evolve along AGF with $\gamma_{t}=2 \sqrt{\alpha}$ and $p_{0}=0$. For all $t \geq 0$,

$$
f\left(x_{t}\right)-f_{\star} \leq 2 \exp (-\sqrt{\alpha} t)\left(f\left(x_{0}\right)-f_{\star}\right)
$$

We plot the non-monotonic behavior of AGF in Figure 1, which helps to explain the need for choosing a different Lyapunov function $\mathscr{L}_{t}$.

Recall that under convexity and $\alpha$-convexity, the objective gap $f\left(x_{t}\right)-f_{\star}$ for GF converges at the rates $O(1 / t)$ and $O(\exp (-2 \alpha t))$ respectively. On the other hand, for AGF, the convergence happens at the rates $O\left(1 / t^{2}\right)$ and $O(\exp (-\sqrt{\alpha} t))$ respectively. This is strongly suggestive of the square root factor speed-up, that is, acceleration. However, we caution that it is dangerous to deduce conclusions from continuous-time analysis alone. For example, we can run any ODE faster, which can make the continuous-time convergence rate arbitrarily fast; however, this does not translate into a better discretetime algorithm, since speeding up time makes the ODE more unstable and therefore requires a smaller step size for discretization.

![](https://cdn.mathpix.com/cropped/6a4b6b6a-023b-49e3-b926-a2896fa123e3-035.jpg?height=603&width=1023&top_left_y=339&top_left_x=552)
Figure 1: We compare the gradient flow with AGF for $f(x):=\frac{1}{2}\left(\alpha x[1]^{2}+x[2]^{2}\right)$ and $\gamma=2 \sqrt{\alpha}$, where $\alpha=1 / 16$ and $x_{0}=(1,1)$. Note that the loss is not monotonic over time, hence the need for a different Lyapunov function $\mathscr{L}_{t}$.

So how, then, can we discretize AGF? Part of the subtlety of acceleration is that not all discretizations work. For example, we could consider

$$
\begin{aligned}
& x_{n+1} \approx x_{n}+h p_{n+1} \\
& p_{n+1} \approx p_{n}-h \nabla f\left(x_{n}\right)-\gamma_{n} h p_{n}
\end{aligned}
$$

which is equivalent to the update

$$
x_{n+1}=x_{n}-h^{2} \nabla f\left(x_{n}\right)+\left(1-\gamma_{n} h\right)\left(x_{n}-x_{n-1}\right) .
$$

Or, if we do not presume to know the coefficients for the discrete-time scheme in advance, we could write the update as

$$
x_{n+1}=x_{n}-\eta_{n} \nabla f\left(x_{n}\right)+\theta_{n}\left(x_{n}-x_{n-1}\right) .
$$

In other words, we take a gradient step and then apply momentum. This is known as Polyak's heavy ball method, and although it can be tuned to converge at the rate of CG for quadratic objectives, this same tuning leads to divergence for general convex functions [LRP16]. On the other hand, the optimal method in the next subsection can be written in the form

$$
x_{n+1}=x_{n}+\theta_{n}\left(x_{n}-x_{n-1}\right)-\eta_{n} \nabla f\left(x_{n}+\theta_{n}\left(x_{n}-x_{n-1}\right)\right) .
$$

In other words, we add momentum and then take a gradient step.

### 5.3 General case: discrete time

The acceleration phenomenon is undoubtedly one of the most elusive and fascinating aspects of optimization, so it is no surprise that it has been explored through many different angles over the course of countless research papers. At this junction, we must choose how to present the method and in what level of detail.

Having explored acceleration carefully in the quadratic case and in continuous time, here we follow the expedient route by giving perhaps the most direct and shortest proof, at the cost of generality and intuition. ${ }^{5}$

We analyze the following method with $x_{-1}=x_{0}$ :

$$
\begin{equation*}
x_{n+1}:=x_{n}+\theta_{n}\left(x_{n}-x_{n-1}\right)-\frac{1}{\beta} \nabla f\left(x_{n}+\theta_{n}\left(x_{n}-x_{n-1}\right)\right) . \tag{AGD}
\end{equation*}
$$

Theorem 5.10 (convergence of AGD). Let $f$ be convex and $\beta$-smooth. Define the sequence: $\lambda_{0}:=0$ and $\lambda_{n+1}:=\frac{1}{2}\left(1+\sqrt{1+4 \lambda_{n}^{2}}\right)$ for $n \in \mathbb{N}$. Set $\theta_{n}:=\left(\lambda_{n}-1\right) / \lambda_{n+1}$. Then, AGD satisfies

$$
f\left(x_{N}\right)-f_{\star} \leq \frac{2 \beta\left\|x_{0}-x^{\star}\right\|^{2}}{N^{2}} .
$$

Proof. Let $y_{n}:=x_{n}+\theta_{n}\left(x_{n}-x_{n-1}\right)$, so that $x_{n+1}=y_{n}-\frac{1}{\beta} \nabla f\left(y_{n}\right)$. Recall from (3.3) that for any $z \in \mathbb{R}^{d}$, it holds that

$$
\left\|x_{n+1}-z\right\|^{2} \leq\left\|y_{n}-z\right\|^{2}-\frac{2}{\beta}\left(f\left(x_{n+1}\right)-f(z)\right) .
$$

Rearranging, it yields

$$
f\left(x_{n+1}\right)-f(z) \leq \frac{\beta}{2}\left(\left\|y_{n}-z\right\|^{2}-\left\|x_{n+1}-z\right\|^{2}\right)=-\frac{\beta}{2}\left\|x_{n+1}-y_{n}\right\|^{2}-\beta\left\langle x_{n+1}-y_{n}, y_{n}-z\right\rangle .
$$

We apply this inequality with two points, $z=x_{n}$ and $z=x_{\star}$. By multiplying the first inequality by $\lambda_{n+1}-1 \geq 0$ and adding it to the second inequality, it implies

$$
\begin{aligned}
& \left(\lambda_{n+1}-1\right)\left(f\left(x_{n+1}\right)-f\left(x_{n}\right)\right)+f\left(x_{n+1}\right)-f_{\star} \\
& \quad \leq-\frac{\beta \lambda_{n+1}}{2}\left\|x_{n+1}-y_{n}\right\|^{2}-\beta\left\langle x_{n+1}-y_{n}, \lambda_{n+1} y_{n}-\left(\lambda_{n+1}-1\right) x_{n}-x_{\star}\right\rangle
\end{aligned}
$$

[^4]$$
=\frac{\beta}{2 \lambda_{n+1}}\left(\left\|\lambda_{n+1} y_{n}-\left(\lambda_{n+1}-1\right) x_{n}-x_{\star}\right\|^{2}-\left\|\lambda_{n+1} x_{n+1}-\left(\lambda_{n+1}-1\right) x_{n}-x_{\star}\right\|^{2}\right),
$$
where the last line uses the identity $\|a\|^{2}+2\langle a, b\rangle=\|a+b\|^{2}-\|b\|^{2}$. Our goal is to produce a telescoping sum, which is the case if we ensure that
$$
\lambda_{n+1} x_{n+1}-\left(\lambda_{n+1}-1\right) x_{n}=\lambda_{n+2} y_{n+1}-\left(\lambda_{n+2}-1\right) x_{n+1}
$$

By substituting in $y_{n+1}=x_{n+1}+\theta_{n+1}\left(x_{n+1}-x_{n}\right)$, some algebra shows that it suffices to take $\theta_{n+1}=\left(\lambda_{n+1}-1\right) / \lambda_{n+2}$.

After multiplying the above inequality by $\lambda_{n+1}$ and summing, we find that

$$
\frac{\beta}{2}\left\|\lambda_{1} y_{0}-\left(\lambda_{1}-1\right) x_{0}-x_{\star}\right\|^{2} \geq \sum_{n=0}^{N-1}\left\{\lambda_{n+1}^{2}\left(f\left(x_{n+1}\right)-f_{\star}\right)-\lambda_{n+1}\left(\lambda_{n+1}-1\right)\left(f\left(x_{n}\right)-f_{\star}\right)\right\}
$$

We also want the right-hand side to telescope, so we set $\lambda_{n+1}\left(\lambda_{n+1}-1\right)=\lambda_{n}^{2}$, which yields the recursion $\lambda_{n+1}=\frac{1}{2}\left(1+\sqrt{1+4 \lambda_{n}^{2}}\right)$. With $\lambda_{0}=0$, it yields

$$
f\left(x_{N}\right)-f_{\star} \leq \frac{\beta\left\|y_{0}-x_{\star}\right\|^{2}}{2 \lambda_{N}^{2}}=\frac{\beta\left\|x_{0}-x_{\star}\right\|^{2}}{2 \lambda_{N}^{2}}
$$

Finally, it is straightforward to show by induction that $\lambda_{N} \geq N / 2$.
By applying the reduction in Lemma 4.1, it also yields an accelerated algorithm for the strongly convex case, i.e., an algorithm that achieves $f\left(x_{N}\right)-f_{\star} \leq \varepsilon$ in $O\left(\sqrt{\kappa} \log \frac{\alpha R^{2}}{\varepsilon}\right)$ iterations, where $R:=\left\|x_{0}-x_{\star}\right\|$.

Example 5.11. If we apply the accelerated method to logistic regression (see Example 3.8), it improves the iteration complexity from $O\left(R^{2} n / d\right)$ to $O(R \sqrt{n / d})$.

## Bibliographical notes

The simple proof of Theorem 5.4 is taken from [NY83]. The discussion on Chebyshev polynomials follows [Vis12].

The literature on acceleration is too large to be surveyed here, but we mention a recent result in a somewhat different direction: what is the best rate of GD just by changing the step sizes? Thus, we consider the iteration $x_{n+1}=x_{n}-h_{n} \nabla f\left(x_{n}\right)$, with the only freedom being to choose the sequence $\left\{h_{n}\right\}_{n \in \mathbb{N}}$. It turns out a constant step size schedule is not optimal, and as established in [AP24a; AP24b], the so-called silver step size schedule achieves the rates of Lemma 4.1 and Lemma 4.2 with $\phi(x)=x^{\log _{\rho} 2} \approx x^{0.786}$ with $\rho:=1+\sqrt{2}$. This is a rate intermediate between the unaccelerated rate of GD and the accelerated rate of AGD.

## Exercises

Exercise 5.1. Define the polynomial $Q_{n}(x)=T_{n}\left(\frac{\alpha+\beta-2 x}{\beta-\alpha}\right) / T_{n}\left(\frac{\alpha+\beta}{\beta-\alpha}\right)$. Show that $Q_{n}(0)=1$ and use Definition 5.6 to establish the identity

$$
T_{n}(x)=\frac{1}{2}\left(\left(x-\sqrt{x^{2}-1}\right)^{n}+\left(x+\sqrt{x^{2}-1}\right)^{n}\right) \quad \text { for } x \in[-1,1]
$$

One can show that this identity actually holds for all $x \in \mathbb{R}$. Use this to show that

$$
\max _{x \in[\alpha, \beta]}\left|Q_{n}(x)\right| \leq 2\left(\frac{\sqrt{\kappa}-1}{\sqrt{\kappa}+1}\right)^{n}
$$

Note that by combining this with Lemma 5.5, it yields an exponential rate of convergence for CG matching the lower bound of Exercise 4.2.

Exercise 5.2. To better understand the proof of Theorem 5.8, consider a Lyapunov function of the form

$$
\mathscr{L}_{t}=\left\|x_{t}-x_{\star}\right\|^{2}+a_{t}\left\langle x_{t}-x_{\star}, p_{t}\right\rangle+b_{t}\left\|p_{t}\right\|^{2}+c_{t}\left(f\left(x_{t}\right)-f_{\star}\right)
$$

Note that this is the most general Lyapunov function consisting of a combination of a quadratic function in $x_{t}-x_{\star}$ and $p_{t}$, as well as the objective gap; here, it is crucial that we include the mixed term $a_{t}\left\langle x_{t}-x_{\star}, p_{t}\right\rangle$. Our goal is to choose the coefficients $a_{t}, b_{t}, c_{t}$ so that $\dot{\mathscr{L}}_{t} \leq 0$.

Compute the derivative in time of $\mathscr{L}_{t}$ along AGF with $\gamma_{t}=3 / t$, and apply convexity to the term $\left\langle\nabla f\left(x_{t}\right), x_{t}-x_{\star}\right\rangle$. In the resulting expression, since the terms $\left\langle x_{t}-x_{\star}, p_{t}\right\rangle$ and $\left\langle\nabla f\left(x_{t}\right), p_{t}\right\rangle$ do not have definite signs, ensure that the coefficients in front of these terms vanish through a suitable choice of $a_{t}, b_{t}, c_{t}$. Show that this leads to $a_{t}=t+\bar{a} t^{3}$ for some $\bar{a} \geq 0$. Next, from the remaining terms, obtain the condition $\dot{b}_{t} \leq \min \left\{\frac{a_{t}}{2}, \frac{6 b_{t}}{t}-a_{t}\right\}$, which implies $3 \dot{b}_{t} \leq 6 b_{t} / t$, hence we consider $b_{t}=b_{0}+\bar{b} t^{2}$ for some $b_{0}, \bar{b} \geq 0$. Furthermore, argue that we must take $\bar{a}=0$ and $\bar{b}=\frac{1}{4}$. To ensure that $\mathscr{L}_{0}$ only depends on $\left\|x_{0}-x_{\star}\right\|$, we set $b_{0}=c_{0}=0$. Finally, check that with these choices, we have $b_{t} \geq a_{t}^{2} / 4$, which is necessary to ensure that $\mathscr{L}_{t} \geq c_{t}\left(f\left(x_{t}\right)-f_{\star}\right)$.

Show that the Lyapunov function derived in this way coincides with the one used in Theorem 5.8.

Exercise 5.3. Prove Theorem 5.9.
Hint: Let $z_{t}:=x_{t}+\frac{2}{\gamma} p_{t}$ and consider

$$
\mathscr{L}_{t}:=f\left(x_{t}\right)-f_{\star}+\frac{\alpha}{2}\left\|z_{t}-x_{\star}\right\|^{2}
$$

## 6 Non-smooth convex optimization

Thus far, we have considered the unconstrained minimization of convex and smooth functions $f$. The next step is to consider a far more general class of problems by allowing for constraints and non-smoothness.

The two issues are related. To minimize $f$ over a convex set $\mathcal{C}$, it is equivalent to minimize $f+\chi_{\mathcal{C}}$ over all of $\mathbb{R}^{d}$, where $\chi_{\mathcal{C}}$ is the convex indicator function for $\mathcal{C}$ :

$$
\chi_{\mathcal{C}}(x):= \begin{cases}0, & x \in \mathcal{C}  \tag{6.1}\\ +\infty, & x \notin \mathcal{C}\end{cases}
$$

In this reformulation, the objective function is allowed to take the value $+\infty$ and is certainly non-smooth. Even if we do not reformulate the problem in this way, convex constraint sets often arise as the intersection of primitive constraints: $\mathcal{C}=\left\{f_{i} \leq 0\right.$ for all $\left.i \in[m]\right\}$. This is equivalent to $\mathcal{C}=\left\{\max _{i \in[m]} f_{i} \leq 0\right\}$, and the function $\max _{i \in[m]} f_{i}$ is non-smooth.

On the other hand, without strong convexity, it is not guaranteed that $f$ admits a minimizer over all of $\mathbb{R}^{d}$ (e.g., $f$ is a linear function, or consider the exponential function over $\mathbb{R}$ ). It often makes sense to consider non-smooth minimization over bounded sets. Thus, we tackle constraints and non-smoothness together.

Although we do not assume smoothness, we still need some minimal regularity for the function $f$. As justified in Lemma 6.7, convex functions are actually Lipschitz continuous in the interior of their domains, so it is natural to take as our new function class under consideration the class of convex and Lipschitz functions over bounded convex sets.

### 6.1 Convex analysis

We now work with convex functions $f: \mathbb{R}^{d} \rightarrow \mathbb{R} \cup\{\infty\}$. The fact that $f$ can now take on the value $+\infty$ leads to some technical issues, but it allows us to seamlessly handle constraints. Convexity can be defined in the usual way, but it is sometimes convenient to instead work with the epigraph.

Definition 6.1. The epigraph of $f: \mathbb{R}^{d} \rightarrow \mathbb{R} \cup\{\infty\}$ is the following subset of $\mathbb{R}^{d} \times \mathbb{R}$ :

$$
\text { epi } f:=\left\{(x, t) \in \mathbb{R}^{d} \times \mathbb{R}: f(x) \leq t\right\}
$$

Definition 6.2. A function $f: \mathbb{R}^{d} \rightarrow \mathbb{R} \cup\{\infty\}$ is convex if for all $x, y \in \mathbb{R}^{d}$ and all $t \in[0,1]$, it holds that

$$
f((1-t) x+t y) \leq(1-t) f(x)+t f(y)
$$

Equivalently, $f$ is convex if and only if epi $f$ is a convex set.

Definition 6.3. The domain of a function $f: \mathbb{R}^{d} \rightarrow \mathbb{R} \cup\{\infty\}$ is the set

$$
\operatorname{dom} f:=\left\{x \in \mathbb{R}^{d}: f(x)<\infty\right\}
$$

The first point to emphasize is that at this level of generality, $f$ can still be quite pathological. Indeed, consider the following function:

$$
f(x):= \begin{cases}0, & \|x\|<1  \tag{6.2}\\ \phi(x), & \|x\|=1 \\ +\infty, & \|x\|>1\end{cases}
$$

where $\phi$ is an arbitrary non-negative function defined on the sphere $\{\|\cdot\|=1\}$. Then, one can check that $f$ is convex. However, $\phi$ need not be continuous or be coherent in any way whatsoever. To avoid these types of situations, the basic regularity property that we impose is that $f$ is lower semicontinuous.

Definition 6.4. A function $f: \mathbb{R}^{d} \rightarrow \mathbb{R} \cup\{\infty\}$ is lower semicontinuous if for all sequences $\left\{x_{n}\right\}_{n \in \mathbb{N}}$ converging to a point $x \in \mathbb{R}^{d}$, it holds that

$$
f(x) \leq \liminf _{n \rightarrow \infty} f\left(x_{n}\right)
$$

In other words, when we pass to the limit of a convergent sequence, the value of $f$ can only drop down. One way to motivate the relevance of this condition for convex optimization is that we often consider suprema $f=\sup _{\omega \in \Omega} f_{\omega}$ where $\left\{f_{\omega}\right\}_{\omega \in \Omega}$ is a collection of continuous functions; in fact, in many cases, we consider suprema of affine functions. When $\Omega$ is finite, we know that the maximum of finitely many continuous functions is continuous. But when $\Omega$ is infinite, the suprema of infinitely many continuous functions need not be continuous. The class of lower semicontinuous functions is the smallest class of functions which contains all continuous functions and is closed under taking arbitrary suprema. Further properties are explored in Exercise 6.1.

It follows from that exercise that $f$ is convex and lower semicontinuous if and only if its epigraph is closed and convex. So, when it comes to functions, we impose convexity and lower semicontinuity; and when it comes to sets, we impose convexity and closedness. For example, one can also check that the convex indicator $\chi_{\text {e }}$ is lower semicontinuous if and only if $\mathcal{C}$ is closed. We use the following terminology. ${ }^{6}$

Definition 6.5. A convex function $f: \mathbb{R}^{d} \rightarrow \mathbb{R} \cup\{\infty\}$ is regular if: it is not identically equal to $+\infty$, it is lower semicontinuous, and its domain has non-empty interior.

Note that the definition excludes one more pathological case, the function $f(x)=+\infty$ for all $x \in \mathbb{R}^{d}$, which is of no interest to us. Since the domain of a convex function is a convex set, if it has empty interior then it must be contained in a lower-dimensional affine space, and when we restrict to that space, the domain then has a non-empty interior; this is usually summarized by saying that any non-empty convex set has a non-empty relative interior. We do not delve into the details here, but this is why we regard the condition that the domain has non-empty interior as "without loss of generality".

We also note that in the proof of existence of a minimizer, it is really only lower semicontinuity that matters.

Lemma 6.6 (existence of minimizer). Let $f: \mathbb{R}^{d} \rightarrow \mathbb{R} \cup\{\infty\}$ be lower semicontinuous and its level sets be bounded. Then, there exists a global minimizer of $f$.

Proof. The proof is the same as for Lemma 1.7, except that lower semicontinuity substitutes for continuity.

Regularity. Our next order of business is to establish properties of regular convex functions which allow us to manipulate them in proofs. In particular, we show that they are "almost" differentiable, even though we did not assume it a priori; the source of this regularity is the convexity condition.

Lemma 6.7 (Lipschitz continuity). Let $f: \mathbb{R}^{d} \rightarrow \mathbb{R} \cup\{\infty\}$ be convex and let $x_{0} \in \operatorname{int} \operatorname{dom} f$. Then, $f$ is locally Lipschitz continuous around $x_{0}$.

Proof. We may assume that $x_{0}=0$. Since 0 belongs to the interior of $\operatorname{dom} f$, we can fit a simplex centered at the origin inside the domain: namely, there exists $\varepsilon>0$ such that $\mathcal{C}:=\operatorname{conv}\left\{ \pm \varepsilon e_{k}: k \in[d]\right\}$ belongs to dom $f$. First, we show that $f$ is bounded on $\mathcal{C}$ : the

[^5]upper bound follows because $f\left( \pm \varepsilon e_{k}\right)<\infty$ for all $k \in[d]$ and the maximum of $f$ over $\mathcal{C}$ is attained at one of the vertices (why?). For the lower bound, by convexity we have $f(x) \geq 2 f(0)-f(-x) \geq 2 f(0)-\max _{\mathcal{C}} f$ for all $x \in \mathcal{C}$.

Next, we show that $f$ is Lipschitz on the smaller set $\mathcal{C}^{\prime}:=\operatorname{conv}\left\{ \pm \frac{\varepsilon}{2} e_{k}: k \in[d]\right\}$. The point is that there is a constant $c_{d, \varepsilon}>0$ such that for all $x, y \in \mathcal{C}^{\prime}$, there is a point $y^{+} \in \mathcal{C}$ such that the line segment from $x$ to $y$ is contained in the line segment from $x$ to $y^{+}$, and the extension is not too short: $\left\|y^{+}-x\right\| \geq c_{d, \varepsilon}$. Then, by convexity,

$$
f(y)=f\left(\frac{\left\|y^{+}-y\right\|}{\left\|y^{+}-x\right\|} x+\frac{\|y-x\|}{\left\|y^{+}-x\right\|} y^{+}\right) \leq \frac{\left\|y^{+}-y\right\|}{\left\|y^{+}-x\right\|} f(x)+\frac{\|y-x\|}{\left\|y^{+}-x\right\|} f\left(y^{+}\right),
$$

hence

$$
f(y)-f(x) \leq \frac{\|y-x\|}{\left\|y^{+}-x\right\|}\left(f\left(y^{+}\right)-f(x)\right) \leq \frac{\sup _{\mathcal{C}} f-\inf _{\mathcal{C}} f}{c_{d, \varepsilon}}\|y-x\|
$$

Interchanging $x$ and $y$ proves the Lipschitz bound.
This lemma shows that locally near $x_{0}, f(x)$ grows at most linearly in the distance $\left\|x-x_{0}\right\|$ (as opposed to, say, $\sqrt{\left\|x-x_{0}\right\|}$ ). This suggests that $f$ may be differentiable at $x_{0}$. This is not quite right, because $f$ may have a kink at $x_{0}$, but nevertheless we can find an appropriate substitute for differentiability.

Definition 6.8. Let $f: \mathbb{R}^{d} \rightarrow \mathbb{R} \cup\{\infty\}$ be convex. We say that $p \in \mathbb{R}^{d}$ is a subgradient of $f$ at $x$ if for all $y \in \mathbb{R}^{d}$, it holds that

$$
\begin{equation*}
f(y) \geq f(x)+\langle p, y-x\rangle \tag{6.3}
\end{equation*}
$$

We denote the set of subgradients of $f$ at $x$ as $\partial f(x)$, and we refer to this set as the subdifferential of $f$ at $x$. Also, we set

$$
\partial f:=\left\{(x, p) \in \mathbb{R}^{d} \times \mathbb{R}^{d}: p \in \partial f(x)\right\}
$$

Note that by definition, if $0 \in \partial f(x)$, then $x$ is a global minimizer of $f$.
If $f$ is differentiable at $x_{0} \in \operatorname{int} \operatorname{dom} f$, then $\partial f\left(x_{0}\right)$ is a singleton: $\partial f\left(x_{0}\right)=\left\{\nabla f\left(x_{0}\right)\right\}$ (Exercise 6.2). However, the subdifferential can be multi-valued. A key example is the absolute value function, $f: x \mapsto|x|$, for which $\partial f(0)=[-1,1]$.

For the purpose of optimization, it is enough to have at least one subgradient, which is the content of the following theorem.

Theorem 6.9 (subdifferential). Let $f: \mathbb{R}^{d} \rightarrow \mathbb{R} \cup\{\infty\}$ be a regular convex function. If $x_{0} \in \operatorname{int} \operatorname{dom} f$, then $\partial f\left(x_{0}\right)$ is non-empty, bounded, convex, and closed.

We follow a traditional route of deducing the non-emptiness from a separation theorem. The proof of the following result is deferred.

Theorem 6.10 (supporting hyperplane). Let $\mathcal{C}$ be a closed and convex set, and let $x \in \partial \mathcal{C}$. Then, there exists a non-zero $p \in \mathbb{R}^{d}$ such that

$$
\langle p, x\rangle \leq \inf _{\mathcal{C}}\langle p, \cdot\rangle .
$$

Proof of Theorem 6.9. Since $\left(x_{0}, f\left(x_{0}\right)\right) \in \partial \operatorname{epi} f$, and epi $f$ is closed and convex (by regularity of $f$ ), there is a supporting hyperplane ( $p, q$ ):

$$
\left\langle p, x_{0}\right\rangle+q f\left(x_{0}\right) \leq \inf _{(x, t) \in \operatorname{epi} f}\{\langle p, x\rangle+q t\}
$$

We can normalize the coefficients so that $\|p\|^{2}+q^{2}=1$, and we note that $q \geq 0$.
If $x$ is sufficiently close to $x_{0}$, then

$$
\left\langle p, x_{0}-x\right\rangle \leq q\left(f(x)-f\left(x_{0}\right)\right) \leq L q\left\|x-x_{0}\right\|,
$$

where $L$ is the Lipschitz constant of $f$ near $x_{0}$. Taking $x=x_{0}-\varepsilon p$ for small $\varepsilon>0$, we deduce that $\|p\| \leq L q$, hence from the normalization condition, $q \neq 0$. Thus, for any $x \in \operatorname{dom} f$, we deduce that

$$
f(x) \geq f\left(x_{0}\right)-\frac{1}{q}\left\langle p, x-x_{0}\right\rangle
$$

thus, $-p / q \in \partial f\left(x_{0}\right)$.
The set $\partial f\left(x_{0}\right)$ is closed and convex as an intersection of the constraints in (6.3). Boundedness follows from Exercise 6.3.

Constraints. When the constraint set $\mathcal{C}$ is simple, it is reasonable to suppose that we can compute the projection onto $\mathcal{C}$. We study some properties of this projection operator.

Definition 6.11. Let $\mathcal{C}$ be closed and convex. The projection onto $\mathcal{C}$ is the mapping $\Pi_{\mathcal{C}}: \mathbb{R}^{d} \rightarrow \mathcal{C}$ defined by

$$
\Pi_{\mathcal{C}}(x):=\underset{y \in \mathcal{C}}{\arg \min }\|y-x\|^{2}
$$

The "arg min" is non-empty because $\mathcal{C}$ is closed, and the uniqueness of the minimizer follows from a strict convexity argument as in Lemma 1.10. When $\mathcal{C}$ is a linear subspace, then $\Pi_{\mathcal{C}}$ coincides with the linear algebra definition of projection, and in this case $\Pi_{\mathcal{C}}$ is linear. In general, however, $\Pi_{\mathcal{C}}$ is a non-linear operator.

The following lemma characterizes the projection.
Lemma 6.12 (characterization of projection). Let $\mathcal{C}$ be closed and convex, and let $x \notin \mathcal{C}$. Then, $\Pi_{\mathcal{C}}(x)$ is the unique point satisfying the following condition:

$$
\begin{equation*}
\left\langle\Pi_{\mathcal{C}}(x)-x, x^{\prime}-\Pi_{\mathcal{C}}(x)\right\rangle \geq 0 \quad \text { for all } x^{\prime} \in \mathcal{C} \tag{6.4}
\end{equation*}
$$

Proof. As in the proof of Lemma 1.8, the first-order necessary condition for optimality reads $\left\langle\Pi_{\mathcal{C}}(x)-x, v\right\rangle \geq 0$. However, because the optimization problem is constrained to lie in $\mathcal{C}$, this time we do not have the inequality for all $v$, but only for $v$ of the form $x^{\prime}-\Pi_{\mathcal{C}}(x)$ where $x^{\prime} \in \mathcal{C}$.

This lemma furnishes the following important property.
Lemma 6.13 (convex projections are non-expansive). Let $\mathcal{C}$ be closed and convex. Then, for all $x, y \in \mathbb{R}^{d}$,

$$
\left\|\Pi_{\mathcal{C}}(y)-\Pi_{\mathcal{C}}(x)\right\| \leq\|y-x\| .
$$

Proof. By (6.4),

$$
\begin{aligned}
& \left\langle\Pi_{\mathcal{C}}(x)-x, \Pi_{\mathcal{C}}(y)-\Pi_{\mathcal{C}}(x)\right\rangle \geq 0 \\
& \left\langle\Pi_{\mathcal{C}}(y)-y, \Pi_{\mathcal{C}}(x)-\Pi_{\mathcal{C}}(y)\right\rangle \geq 0
\end{aligned}
$$

Adding these inequalities yields

$$
\left\|\Pi_{\mathcal{C}}(y)-\Pi_{\mathcal{C}}(x)\right\|^{2} \leq\left\langle\Pi_{\mathcal{C}}(y)-\Pi_{\mathcal{C}}(x), y-x\right\rangle \leq\left\|\Pi_{\mathcal{C}}(y)-\Pi_{\mathcal{C}}(x)\right\|\|y-x\| .
$$

Actually, we can now return to prove the supporting hyperplane theorem.
Proof of Theorem 6.10. First, we show that if $\mathcal{C}$ is a closed convex set and $x \notin \mathcal{C}$, then we can separate $\mathcal{C}$ from $x$. Namely, by (6.4), the vector $p:=\Pi_{\mathcal{C}}(x)-x$ is non-zero and satisfies

$$
\inf _{x^{\prime} \in \mathcal{C}}\left\langle p, x^{\prime}\right\rangle \geq\left\langle p, \Pi_{\mathcal{C}}(x)\right\rangle=\left\|\Pi_{\mathcal{C}}(x)-x\right\|^{2}+\langle p, x\rangle \geq\langle p, x\rangle
$$

To prove the supporting hyperplane theorem, note that since $x \in \partial \mathcal{C}$, there is a sequence of points $\left\{x_{n}\right\}_{n \in \mathbb{N}}$ which lies outside of $\mathcal{C}$, such that $x_{n} \rightarrow x$. For each $n$, let $p_{n}$ be a hyperplane that separates $\mathcal{C}$ from $x_{n}$, and by normalizing we may assume that $\left\|p_{n}\right\|=1$. Since $\left\{p_{n}\right\}_{n \in \mathbb{N}}$ is a bounded sequence, it contains a subsequence which converges to some unit vector $p$. By taking limits, it is easy to see that $p$ is a supporting hyperplane.

### 6.2 Projected subgradient methods

Methods for constrained optimization differ based on what they assume about the constraint set. The first method we study assumes access to the projection mapping $\Pi_{\mathcal{C}}$ for the set $\mathcal{C}$. This assumption is appropriate when the set $\mathcal{C}$ is particularly "simple", e.g., $\mathcal{C}$ is the ball $\mathcal{C}=\{\|\cdot\| \leq R\}$, in which case the projection can be computed in closed form. When $\mathcal{C}$ is more complex, e.g., $\mathcal{C}$ is a polytope, we need more sophisticated methods.

Projected subgradient descent is the following method:

$$
\begin{equation*}
x_{n+1}:=\Pi_{\mathcal{C}}\left(x_{n}-h \frac{p_{n}}{\left\|p_{n}\right\|}\right), \quad p_{n} \in \partial f\left(x_{n}\right) . \tag{PSD}
\end{equation*}
$$

Note that we use the normalized subgradient $p_{n} /\left\|p_{n}\right\|$. If we think about the example of the absolute value function $|\cdot|$ with subdifferential $[-1,1]$ at the origin, we see that the magnitude of an arbitrary element of the subdifferential need not be informative. Instead, the intuition behind non-smooth optimization is to use the subgradients as separating directions: in particular, by convexity, $f(x)-f\left(x_{n}\right) \geq\left\langle p_{n}, x-x_{n}\right\rangle$, so any minimizer must lie on one side of the hyperplane defined by $p_{n}$.

We let $x_{\star}$ denote a minimizer of $f$ over the closed convex set $\mathcal{C}$, and $f_{\star}:=f\left(x_{\star}\right)$.
Theorem 6.14 (convergence of PSD). Let $f$ be convex and $L$-Lipschitz continuous on the closed convex set $\mathcal{C}$. Then, PSD satisfies

$$
f\left(\frac{1}{N} \sum_{n=0}^{N-1} x_{n}\right)-f_{\star} \leq \frac{1}{N} \sum_{n=0}^{N-1}\left(f\left(x_{n}\right)-f_{\star}\right) \leq \frac{L}{2 N h}\left\|x_{0}-x_{\star}\right\|^{2}+\frac{L h}{2} .
$$

In particular, by setting $h=R / \sqrt{N}$, where $R$ is an upper bound on $\left\|x_{0}-x_{\star}\right\|$, it yields the convergence rate

$$
f\left(\frac{1}{N} \sum_{n=0}^{N-1} x_{n}\right)-f_{\star} \leq \frac{L R}{\sqrt{N}} .
$$

Proof. The first inequality holds by convexity, so we focus on the second. The idea is similar to the proof of Theorem 3.4, except that instead of using smoothness to handle the error term, we use Lipschitzness. By expanding the squared distance to the minimizer,

$$
\begin{aligned}
\left\|x_{n+1}-x_{\star}\right\|^{2} & =\left\|\Pi_{\mathcal{C}}\left(x_{n}-h \frac{p_{n}}{\left\|p_{n}\right\|}\right)-\Pi_{\mathcal{C}}\left(x_{\star}\right)\right\|^{2} \leq\left\|x_{n}-h \frac{p_{n}}{\left\|p_{n}\right\|}-x_{\star}\right\|^{2} \\
& =\left\|x_{n}-x_{\star}\right\|^{2}-\frac{2 h}{\left\|p_{n}\right\|}\left\langle p_{n}, x_{n}-x_{\star}\right\rangle+h^{2}
\end{aligned}
$$

$$
\leq\left\|x_{n}-x_{\star}\right\|^{2}-\frac{2 h}{\left\|p_{n}\right\|}\left(f\left(x_{n}\right)-f_{\star}\right)+h^{2}
$$

where we used Lemma 6.13. Since $\left\|p_{n}\right\| \leq L$ for all $n$ (Exercise 6.3), we sum the inequalities:

$$
\frac{1}{N} \sum_{n=0}^{N-1}\left(f\left(x_{n}\right)-f_{\star}\right) \leq \frac{L}{2 N h}\left\|x_{0}-x_{\star}\right\|^{2}+\frac{L h}{2}
$$

Thus, the averaged iterate $\bar{x}_{N}$ satisfies $f\left(\bar{x}_{N}\right)-f_{\star} \leq \varepsilon$ provided $N \geq L^{2} R^{2} / \varepsilon^{2}$. Note that this convergence rate is substantially worse than the one for the smooth case (Theorem 3.4). Another difference is that the descent lemma (Lemma 3.1) is available in the smooth case which implies monotonic decrease of the objective value; here, there is no descent lemma, so the guarantee only holds for the averaged iterate, and averaging is crucial (Figure 2). The analysis can also be performed under strong convexity, see Exercise 6.5.

Interestingly, if we only assume that $f$ is $L$-Lipschitz continuous over $\operatorname{B}\left(x_{\star}, R\right)$, rather than on all of $\mathcal{C}$, it is still possible to show that $\min _{n=0, \ldots, N-1} f\left(x_{n}\right)-f_{\star} \leq L R / \sqrt{N}$, although the proof becomes more involved [Nes18, §3.2.3].

![](https://cdn.mathpix.com/cropped/6a4b6b6a-023b-49e3-b926-a2896fa123e3-046.jpg?height=553&width=1286&top_left_y=1203&top_left_x=423)
Figure 2: We plot the iterates of PSD, with and without iterate averaging, for the function $f(x):=|x[1]|+ 2|x[2]|$ with step size $h=0.15$.

The analysis above shows that when the projection operator is cheap to compute, optimization under constraints is straightforward provided that we interleave the gradient steps with projection steps. We next tackle a more general setting in which we separate out the constraints into a "simple" set $\mathcal{C}$ for which we can compute the projection operator, and additional functional constraints $\left\{f_{i} \leq 0\right.$ for all $\left.i \in[m]\right\}$. Thus, we consider

$$
\min \left\{f(x) \mid x \in \mathcal{C}, f_{i}(x) \leq 0 \text { for all } i \in[m]\right\}
$$

We assume that $f, f_{1}, \ldots, f_{m}$ are all regular convex functions, and write $f_{\text {max }}:=\max _{i \in[m]} f_{i}$. The next algorithm is known as the projected subgradient method with functional constraints. For $n=0,1, \ldots, N-1$ :

- If $f_{\text {max }}\left(x_{n}\right) \leq \varepsilon$, set

$$
x_{n+1}:=\Pi_{\mathcal{C}}\left(x_{n}-\frac{\varepsilon}{\left\|p_{n}\right\|^{2}} p_{n}\right), \quad p_{n} \in \partial f\left(x_{n}\right)
$$

- Otherwise, set

$$
x_{n+1}:=\Pi_{\mathcal{C}}\left(x_{n}-\frac{f_{\max }\left(x_{n}\right)}{\left\|p_{n}\right\|^{2}} p_{n}\right), \quad p_{n} \in \partial f_{\max }\left(x_{n}\right)
$$

The algorithm requires computing elements of the subdifferential for the function $\max _{i \in[m]} f_{i}$. We therefore first identify this subdifferential.

Lemma 6.15 (subdifferential of a maximum). Let $f_{1}, \ldots, f_{m}$ be regular convex functions. Then, for all $x \in \mathbb{R}^{d}$,

$$
\partial\left(\max _{i \in[m]} f_{i}\right)(x)=\operatorname{conv}\left\{\partial f_{i}(x) \mid i \in[m], f_{i}(x)=\max _{j \in[m]} f_{j}(x)\right\}
$$

Proof. ( $\supseteq$ ) Let $f_{\text {max }}:=\max _{i \in[m]} f_{i}$ and $I_{\star}(x):=\left\{i \in[m]: f_{i}(x)=f_{\text {max }}(x)\right\}$. If $\lambda$ is a probability vector and $p_{i} \in \partial f_{i}(x)$ for all $i \in I_{\star}(x)$, then

$$
f_{\max }(y) \geq \sum_{i \in I_{\star}(x)} \lambda_{i} f_{i}(y) \geq \sum_{i \in I_{\star}(x)} \lambda_{i}\left(f_{i}(x)+\left\langle p_{i}, y-x\right\rangle\right)=f_{\max }(x)+\left\langle\sum_{i \in I_{\star}(x)} p_{i}, y-x\right\rangle .
$$

Hence, $\sum_{i \in I_{\star}(x)} \lambda_{i} p_{i} \in \partial f_{\text {max }}(x)$.
$(\subseteq)$ Since the purpose of this lemma from the perspective of these notes is simply to compute an element of $\partial f_{\text {max }}(x)$, we omit the proof of this direction. It can be proven, e.g., via Lagrangian duality or via more subdifferential theory.

The next theorem provides the convergence rate for the method.

Theorem 6.16 (convergence of PSD under functional constraints). Let $f, f_{1}, \ldots, f_{m}$ be convex and $L$-Lipschitz on the closed convex set $\mathcal{C}$. Then, PSD under functional constraints satisfies

$$
\begin{equation*}
\min \left\{f\left(x_{n}\right) \mid n=0,1, \ldots, N-1, f_{\max }\left(x_{n}\right) \leq \varepsilon\right\}-f_{\star} \leq \varepsilon \tag{6.5}
\end{equation*}
$$

provided that

$$
N \geq \frac{L^{2}\left\|x_{0}-x_{\star}\right\|^{2}}{\varepsilon^{2}}
$$

The theorem says that after $N$ iterations, we can find a point $\hat{x}_{N}$ which almost satisfies the functional constraints, in the sense that $f_{\text {max }}\left(\hat{x}_{N}\right) \leq \varepsilon$, and moreover $f\left(\hat{x}_{N}\right)-f_{\star} \leq \varepsilon$. The number of iterations is no more than the case without functional constraints.

Proof of Theorem 6.16. There are two cases for the algorithm. If the iteration $n$ belongs to the first case, then as we saw in the proof of Theorem 6.14,

$$
\left\|x_{n+1}-x_{\star}\right\|^{2} \leq\left\|x_{n}-x_{\star}\right\|^{2}-\frac{2 \varepsilon}{\left\|p_{n}\right\|^{2}}\left(f\left(x_{n}\right)-f_{\star}\right)+\frac{\varepsilon^{2}}{\left\|p_{n}\right\|^{2}} .
$$

If $f\left(x_{n}\right)-f_{\star} \leq \varepsilon$, then since $f_{\text {max }}\left(x_{n}\right) \leq \varepsilon$ (by the definition of the first case), we have met the success condition (6.5). Otherwise, $f\left(x_{n}\right)-f_{\star}>\varepsilon$, and the inequality above implies

$$
\left\|x_{n+1}-x_{\star}\right\|^{2}<\left\|x_{n}-x_{\star}\right\|^{2}-\frac{\varepsilon^{2}}{\left\|p_{n}\right\|^{2}} \leq\left\|x_{n}-x_{\star}\right\|^{2}-\frac{\varepsilon^{2}}{L^{2}}
$$

What happens in the second case? Here, we also show that $\left\|x_{n+1}-x_{\star}\right\|<\left\|x_{n}-x_{\star}\right\|$ : since $x_{\star}$ satisfies the functional constraints and $x_{n}$ does not, the subgradient $p_{n} \in \partial f_{\text {max }}\left(x_{n}\right)$ still acts as a separating hyperplane. Indeed,

$$
\begin{aligned}
\left\|x_{n+1}-x_{\star}\right\|^{2} & =\left\|\Pi_{\mathcal{C}}\left(x_{n}-\frac{f_{\max }\left(x_{n}\right)}{\left\|p_{n}\right\|^{2}} p_{n}\right)-\Pi_{\mathcal{C}}\left(x_{\star}\right)\right\|^{2} \leq\left\|x_{n}-\frac{f_{\max }\left(x_{n}\right)}{\left\|p_{n}\right\|^{2}} p_{n}-x_{\star}\right\|^{2} \\
& =\left\|x_{n}-x_{\star}\right\|^{2}-\frac{2 f_{\max }\left(x_{n}\right)}{\left\|p_{n}\right\|^{2}}\left\langle p_{n}, x_{n}-x_{\star}\right\rangle+\frac{f_{\max }\left(x_{n}\right)^{2}}{\left\|p_{n}\right\|^{2}} \\
& \leq\left\|x_{n}-x_{\star}\right\|^{2}-\frac{2 f_{\max }\left(x_{n}\right)}{\left\|p_{n}\right\|^{2}} f_{\max }\left(x_{n}\right)+\frac{f_{\max }\left(x_{n}\right)^{2}}{\left\|p_{n}\right\|^{2}}<\left\|x_{n}-x_{\star}\right\|^{2}-\frac{\varepsilon^{2}}{L^{2}}
\end{aligned}
$$

Summing these inequalities across the iterations yields

$$
\left\|x_{N}-x_{\star}\right\|^{2}<\left\|x_{0}-x_{\star}\right\|^{2}-\frac{N \varepsilon^{2}}{L^{2}} .
$$

For $N \geq L^{2}\left\|x_{0}-x_{\star}\right\|^{2} / \varepsilon^{2}$, this is not possible unless we reach the success condition (6.5) by iteration $N$.

Example 6.17 (soft-margin SVM). An example of a problem that can be tackled via projected subgradient methods is soft-margin support vector machine (SVM) classification. Suppose that we have a dataset $\left\{\left(x_{i}, y_{i}\right)\right\}_{i \in[n]}$, where $x_{i} \in \mathbb{R}^{d}$ and $y_{i} \in\{ \pm 1\}$. The output of the soft-margin SVM is the classifier $x \mapsto \operatorname{sgn}\left(\left\langle\theta^{\star}, x\right\rangle\right)$, where $\theta^{\star}$ minimizes

$$
\theta \mapsto \frac{1}{n} \sum_{i=1}^{n} \ell_{\text {hinge }}\left(y_{i},\left\langle\theta, x_{i}\right\rangle\right)+\frac{\lambda}{2}\|\theta\|^{2}
$$

Here, $\ell_{\text {hinge }}(y, \hat{y}):=\max \{0,1-y \hat{y}\}$ is the hinge loss, $\lambda>0$ is a regularization parameter, and we have omitted the bias term (which can be handled by augmenting the feature vector $x$ as usual). This objective is strongly convex and Lipschitz over bounded sets, so we can apply projected subgradient descent (projecting onto, e.g., a Euclidean ball).

### 6.3 Cutting plane methods

Non-smooth optimization uses subgradient directions in order to "localize" the solution set. Pursuing this line of reasoning further leads to the family of cutting plane methods.

Suppose that we wish to minimize $f$ over a bounded, closed, convex set $\mathcal{C}$. Let $\mathcal{C}_{\star}$ denote the set of minimizers. The idea is to construct a sequence of convex sets $\mathfrak{C}=\mathfrak{C}_{0}, \mathfrak{C}_{1}, \mathfrak{C}_{2}, \ldots$, which shrink toward $\mathcal{C}_{\star}$. The set $\mathcal{C}_{n}$ represents possible candidates for the solution to the problem at iteration $n$.

If $x_{n} \in \mathcal{C}_{n}$ and $p_{n} \in \partial f\left(x_{n}\right)$, then the subgradient inequality reads

$$
0 \geq f\left(x_{\star}\right)-f\left(x_{n}\right) \geq\left\langle p_{n}, x_{\star}-x_{n}\right\rangle \quad \text { for all } x_{\star} \in \mathcal{C}_{\star}
$$

Thus,

$$
\mathcal{C}_{\star} \subseteq \mathcal{C}_{n} \cap\left\{x \in \mathbb{R}^{d}:\left\langle p_{n}, x\right\rangle \leq\left\langle p_{n}, x_{n}\right\rangle\right\}
$$

We can take $\mathcal{C}_{n+1}$ to be any superset of the right-hand side above.
To finish specifying the scheme, we need a rule for choosing the points $x_{n}$ and the sets $\mathcal{C}_{n}$, with the goal of $\mathcal{C}_{n}$ shrinking as fast as possible. The key is the following lemma from convex geometry, which we do not prove.

Lemma 6.18 (Grünbaum). Let $\mathcal{C} \subseteq \mathbb{R}^{d}$ be a convex body (i.e., a compact convex set with non-empty interior) and let $x_{\mathcal{C}}$ denote the centroid of $\mathcal{C}: x_{\mathcal{C}}:=(\operatorname{vol} \mathcal{C})^{-1} \int_{\mathcal{C}} x \mathrm{~d} x$. Then, for any half-space $\mathcal{H}$ containing $x_{\mathfrak{e}}$,

$$
\frac{\operatorname{vol}(\mathcal{C} \cap \mathcal{H})}{\operatorname{vol}(\mathcal{C})} \geq\left(\frac{d}{d+1}\right)^{d} \geq \frac{1}{\mathrm{e}}
$$

where $\mathrm{e} \approx 2.72$ is a numerical constant.
Consequently, if we choose $x_{n}$ to be the centroid of $\mathcal{C}_{n}$ and set

$$
\begin{equation*}
\mathcal{C}_{n+1}=\mathcal{C}_{n} \cap\left\{\left\langle p_{n}, \cdot\right\rangle \leq\left\langle p_{n}, x_{n}\right\rangle\right\}, \quad x_{n}=x_{\mathcal{C}_{n}} \tag{CoGM}
\end{equation*}
$$

then Grünbaum's inequality shows that $\operatorname{vol}\left(\mathcal{C}_{n} \backslash \mathcal{C}_{n+1}\right) / \operatorname{vol}\left(\mathcal{C}_{n}\right) \leq 1 / \mathrm{e}$, or

$$
\frac{\operatorname{vol}\left(\mathcal{C}_{n+1}\right)}{\operatorname{vol}\left(\mathcal{C}_{n}\right)} \leq 1-\frac{1}{\mathrm{e}} .
$$

Thus, we cut away a constant fraction of the volume at each iteration. This is known as the center of gravity method.

As stated, CoGM is not a practical method. The feasible set $\mathcal{C}_{n}$ at iteration $n$ can be quite complicated, making it prohibitively expensive to compute its centroid. Centroids can be computed via Markov chain Monte Carlo (MCMC) methods for numerical integration, with guarantees available due to recent advances in log-concave sampling, but it is generally understood that this is a more difficult computational problem than the original convex optimization problem we set out to solve. Nevertheless, CoGM achieves the optimal complexity bound in the oracle model, so let us analyze its efficiency.

Theorem 6.19 (center of gravity). Let $D:=\operatorname{diam} \mathcal{C}$ and let $f: \mathbb{R}^{d} \rightarrow \mathbb{R}$ be convex and $L$-Lipschitz on $\mathcal{C}$. Then, CoGM satisfies

$$
f\left(x_{N-1}\right)-f_{\star} \leq D L\left(1-\frac{1}{\mathrm{e}}\right)^{N / d}
$$

Proof. By the argument above, at iteration $N, \operatorname{vol}\left(\mathcal{C}_{N}\right) / \operatorname{vol}(\mathcal{C}) \leq \lambda^{N}$, where we can take $\lambda=1-1 / \mathrm{e}$. Now consider the set $\hat{\mathcal{C}}:=(1-t) x_{\star}+t \mathcal{C}$, where we choose $t$ so that $\operatorname{vol}(\hat{\mathcal{C}})>\operatorname{vol}\left(\mathcal{C}_{N}\right)$; since $\operatorname{vol}(\hat{\mathcal{C}})=t^{d} \operatorname{vol}(\mathcal{C})$, we can take any $t>\lambda^{N / d}$. With this choice, there exists $\hat{x} \in \mathcal{C} \backslash \mathcal{C}_{N}$. By the definition of $\mathcal{C}_{N}$,

$$
f\left(x_{N-1}\right)-f_{\star} \leq f(\hat{x})-f_{\star} \leq t\left(\sup _{\mathrm{e}} f-f_{\star}\right) \leq t D L .
$$

The result follows by letting $t \searrow \lambda^{N / d}$.

Thus, in principle, we can achieve $f\left(x_{N-1}\right)-f_{\star} \leq \varepsilon$ in $O(d \log (D L / \varepsilon))$ iterations. Compared to Theorem 6.14, this result incurs only a logarithmic dependence on the ratio $D L / \varepsilon$, i.e., we can output a high-accuracy solution even for poorly conditioned convex sets. On the other hand, it incurs dependence on the dimension.

Recall that the lower bound for convex smooth optimization (Theorem 4.4) only applies in dimension $d \gtrsim \sqrt{\beta R^{2} / \varepsilon}$. The center of gravity method explains why: a $\beta$ smooth function over a ball of radius $R$ is also $\beta R$-Lipschitz, so Theorem 6.19 yields an oracle complexity of $O\left(d \log \left(\beta R^{2} / \varepsilon\right)\right)$ in this case. This is smaller than the lower bound of $\Omega\left(\sqrt{\beta R^{2} / \varepsilon}\right)$ in Theorem 4.4 when $d \ll \sqrt{\beta R^{2} / \varepsilon} / \log \left(\beta R^{2} / \varepsilon\right)$, so a lower bound construction cannot exist in any smaller dimension. ${ }^{7}$ Note also that for convex quadratic minimization, there are methods which find the minimizer in $d$ queries (e.g., Theorem 5.3 for CG); the center of gravity method almost achieves this guarantee for general convex optimization.

Toward making cutting plane methods more practical, a famous example is the ellipsoid method. In this scheme, we take each set $\mathcal{C}_{n}$ to be an ellipsoid,

$$
\begin{equation*}
\mathcal{C}_{n}=\left\{x \in \mathbb{R}^{d}:\left\langle x-x_{n}, \Sigma_{n}^{-1}\left(x-x_{n}\right)\right\rangle \leq 1\right\} . \tag{6.6}
\end{equation*}
$$

At the next iteration, we must find a new ellipsoid $\mathcal{C}_{n+1}$ such that

$$
\begin{equation*}
\mathcal{C}_{n+1} \supseteq \mathcal{C}_{n} \cap\left\{x \in \mathbb{R}^{d}:\left\langle p_{n}, x\right\rangle \leq\left\langle p_{n}, x_{n}\right\rangle\right\} \tag{6.7}
\end{equation*}
$$

Here, we use the following geometric lemma (Exercise 6.8).

Lemma 6.20 (ellipsoid). Let $\mathcal{C}_{n}$ be the ellipsoid (6.6) and let $p_{n} \in \mathbb{R}^{d}$ be a non-zero vector. Define $\mathcal{C}_{n+1}:=\left\{x \in \mathbb{R}^{d}:\left\langle x-x_{n+1}, \Sigma_{n+1}^{-1}\left(x-x_{n+1}\right)\right\rangle \leq 1\right\}$, where

$$
\begin{aligned}
x_{n+1} & :=x_{n}-\frac{1}{d+1} \frac{\Sigma_{n} p_{n}}{\sqrt{\left\langle p_{n}, \Sigma_{n} p_{n}\right\rangle}} \\
\Sigma_{n+1} & :=\frac{d^{2}}{d^{2}-1}\left(\Sigma_{n}-\frac{2}{d+1} \frac{\Sigma_{n} p_{n} p_{n}^{\top} \Sigma_{n}}{\left\langle p_{n}, \Sigma_{n} p_{n}\right\rangle}\right)
\end{aligned}
$$

Then, for $d>1, \mathscr{C}_{n+1}$ satisfies (6.7) and

$$
\frac{\operatorname{vol}\left(\mathcal{C}_{n+1}\right)}{\operatorname{vol}\left(\mathcal{C}_{n}\right)}=\sqrt{\frac{d-1}{d+1}\left(\frac{d^{2}}{d^{2}-1}\right)^{d}}=1-\Omega\left(\frac{1}{d}\right)
$$

[^6]By following the proof of Theorem 6.19, replacing $\lambda$ by $1-\Omega(1 / d)$, one obtains the same guarantee as for CoGM but with iteration count $O\left(d^{2} \log (L D / \varepsilon)\right)$. (See Exercise 6.7 for details.) Thus, the cost of obtaining an implementable version of the center of gravity method is a larger query complexity. Naturally, there have been numerous follow-up works in the field which aim at achieving the best of both worlds.

### 6.4 Lower bounds

In this section, we study lower bounds for convex non-smooth optimization.
Theorem 6.21 (lower bound for convex, non-smooth minimization). For any $x_{0} \in \mathbb{R}^{d}$, $d>N$, and $L, R>0$, there exists a convex and $L$-Lipschitz function $f$ over $\mathrm{B}\left(x_{\star}, R\right)$ such that $x_{0} \in \mathrm{~B}\left(x_{\star}, R\right)$ and for any gradient span algorithm,

$$
f\left(x_{N}\right)-f_{\star} \gtrsim \frac{L R}{\sqrt{N}}
$$

Proof. Assume $x_{0}=0$ and define the function $f: \mathbb{R}^{d} \rightarrow \mathbb{R}$ by

$$
f(x):=\gamma \max _{i \in[d]} x[i]+\frac{\alpha}{2}\|x\|^{2},
$$

where $\alpha, \gamma>0$ are to be chosen. Note that this function is Lipschitz with constant $\gamma+\alpha\left(\left\|x_{\star}\right\|+R\right)$. Also, if $I_{\star}(x):=\left\{i \in[d]: x[i]=\max _{j \in[d]} x[j]\right\}$, then from Lemma 6.15,

$$
\partial f(x)=\alpha x+\gamma \operatorname{conv}\left\{e_{i}: i \in I_{\star}(x)\right\} .
$$

The optimal point is $x_{\star}[k]=-\gamma /(\alpha d)$ for $k \in[d]$, by checking that $0 \in \partial f\left(x_{\star}\right)$. Thus, $\left\|x_{\star}\right\|=\gamma /(\alpha \sqrt{d})$ and the Lipschitz constant is at most $2 \gamma+\alpha R$.

We take a subgradient oracle which, given a point $x$, outputs $\alpha x+\gamma e_{i} \in \partial f(x)$, where $i=\min I_{\star}(x)$ is the first coordinate of $x$ that achieves the maximum. From this property, it is straightforward to show via induction that $x_{n} \in \mathcal{V}_{n}$ for all $n$, where $\mathcal{V}_{n}$ is the subspace from the proof of Theorem 4.4.

Since $d>N$, it follows that $f\left(x_{N}\right) \geq 0$. On the other hand,

$$
f_{\star}=f\left(x_{\star}\right)=-\frac{\gamma^{2}}{\alpha d}+\frac{\gamma^{2}}{2 \alpha d}=-\frac{\gamma^{2}}{2 \alpha d} .
$$

We set $d=N+1, \gamma=L / 4, \alpha=\gamma /(R \sqrt{d})$ (to ensure that $\left\|x_{0}-x_{\star}\right\| \leq R$ ), which leads to a Lipschitz constant of $L / 2+L /(4 \sqrt{d}) \leq L$. It yields

$$
f\left(x_{N}\right)-f_{\star} \geq-f\left(x_{\star}\right) \gtrsim \frac{L R}{\sqrt{N}}
$$

Note that this matches the guarantee of PSD (Theorem 6.14), so projected subgradient descent is optimal in the non-smooth setting. In other words, without smoothness, there is no acceleration phenomenon.

There is a version of Theorem 6.21 in the strongly convex case (Exercise 6.9).

Theorem 6.22 (lower bound for strongly convex, non-smooth minimization). For any $x_{0} \in \mathbb{R}^{d}, d>N$, and $\alpha, L>0$, there exists $R>0$ and an $\alpha$-convex and $L$-Lipschitz function $f$ over $\mathrm{B}\left(x_{\star}, R\right)$ such that $x_{0} \in \mathrm{~B}\left(x_{\star}, R\right)$ and for any gradient span algorithm,

$$
f\left(x_{N}\right)-f_{\star} \gtrsim \frac{L^{2}}{\alpha N}
$$

Next, in the low-dimensional setting, the following lower bound holds.

Theorem 6.23 (lower bound for convex, non-smooth minimization II). The oracle complexity of minimizing convex, $L$-Lipschitz functions over $[-R, R]^{d}$ to accuracy $\varepsilon$ is at least $\Omega(d \log (L R / \varepsilon))$.

This shows that CoGM is optimal as well. Actually, we do not prove Theorem 6.23; instead, we focus on the related but harder task of feasibility.

Definition 6.24. Let $0<\delta<R$. Let $\mathcal{C} \subseteq[-R, R]^{d}$ be a closed convex set such that there exists a ball $\mathrm{B}\left(x_{\star}, \delta\right) \subseteq \mathcal{C}$. The feasibility problem with parameters ( $\delta, R$ ) is the problem of outputting a point in int $\mathcal{C}$, given access to a separation oracle. Namely, given a point $x \in \mathbb{R}^{d}$, the separation oracle either reports that $x \in \mathcal{C}$, or it outputs a non-zero vector $p \in \mathbb{R}^{d}$ such that $\sup _{e}\langle p, \cdot\rangle \leq\langle p, x\rangle$.

If one can solve the feasibility problem, then one can solve the convex Lipschitz minimization problem. Indeed, given a convex, $L$-Lipschitz function $f$ over $[-R, R]^{d}$, suppose for the sake of argument that we know the optimal value $f_{\star}$. Consider the feasibility problem for set $\mathcal{C}:=\left\{f-f_{\star} \leq \varepsilon\right\}$. For $x_{\star}:=\arg \min _{[-R, R]^{d}} f$, we claim that $\mathrm{B}\left(x_{\star}, \varepsilon / L\right) \subseteq \mathcal{C}$; indeed this follows from $L$-Lipschitzness. ${ }^{8}$ Also, the subgradient oracle

[^7]for $f$ yields a separation oracle for $\mathcal{C}$. Thus, solving the feasibility problem for $\mathcal{C}$ with parameters $(\varepsilon / L, R)$ yields an $\varepsilon$-solution to the problem of minimizing $f$.

Since the feasibility problem is harder, the following theorem is weaker than Theorem 6.23. However, it is easier to prove, and it contains most of the main ideas.

Theorem 6.25 (lower bound for feasibility). For any deterministic algorithm, the feasibility problem with parameters $(\varepsilon, R)$ requires $\Omega(d \log (R / \varepsilon))$ queries.

Proof. We play a game with the algorithm. Suppose that the algorithm has chosen query points $x_{1}, \ldots, x_{n}$ thus far. Our goal is to choose a vector $p_{n}$-which is supposed to correspond to the output of a separation oracle-and we provide the algorithm with this vector, which it then uses to produce a new point $x_{n+1}$ and so on. Simultaneously, we also maintain a sequence of convex bodies (actually, boxes) $\mathcal{C}_{0}, \mathcal{C}_{1}, \ldots, \mathcal{C}_{N}$.

At the end of the game, the algorithm has produced points $x_{1}, \ldots, x_{N}$, and we have produced vectors $p_{1}, \ldots, p_{N}$. By itself, this is not yet meaningful; the algorithm is not designed to produce useful results, unless $p_{1}, \ldots, p_{N}$ are valid outputs from a separation oracle corresponding to a convex body $\mathcal{C}$ satisfying the assumptions of the feasibility problem. So, we aim to choose $p_{1}, \ldots, p_{N}$ so that this holds with $\mathcal{C}=\mathcal{C}_{N}$. Now, we can use the following post hoc reasoning: had we run the algorithm with the separation oracle for $\mathcal{C}_{N}$ from the outset, then the algorithm would have output the same sequence of points $x_{1}, \ldots, x_{N}$, because it is deterministic, so this construction yields a valid lower bound (i.e., it requires more than $N$ iterations to solve the feasibility problem). This proof technique is known as the method of resisting oracles, and its main drawback is that it does not apply to randomized algorithms. ${ }^{9}$

Let us instantiate the resisting oracle for the feasibility problem. At each iteration $n$, the convex body $\mathcal{C}_{n}$ is the box $\left\{x \in \mathbb{R}^{d}: a_{n} \leq x \leq b_{n}\right\}$; here, $a_{n}, b_{n} \in \mathbb{R}^{d}$ and the inequality is interpreted pointwise. We start with $a_{0}=-R \mathbf{1}_{d}, b_{0}=+R \mathbf{1}_{d}$, where $\mathbf{1}_{d}$ is the all-ones vector; thus, $\mathrm{C}_{0}=[-R, R]^{d}$.

When the algorithm makes the first query $x_{1}$, we update the box by cutting it in half, based on the first coordinate of $x_{1}$. Namely, if $x_{1}[1] \leq 0$, we set $a_{1}[1]=0$, and $a_{1}[k]=a_{0}[k]$ for all $k>1$; we output the separating vector $-e_{1}$. If $x_{1}[1] \geq 0$, we set $b_{1}[1]=0$ and $b_{1}[k]=b_{0}[k]$ for all $k>1$; we output the separating vector $+e_{1}$. In either case, $\operatorname{vol}\left(\mathcal{C}_{1}\right)=\frac{1}{2} \operatorname{vol}\left(\mathcal{C}_{0}\right)$ and $x_{1} \notin \operatorname{int} \mathcal{C}_{1}$.

When the algorithm makes the second query $x_{2}$, we repeat this procedure except that we cut the box in half along the second coordinate. We continue in this fashion, cycling through the coordinates.

[^8]Let $c_{n}$ denote the center of $\mathcal{C}_{n}$. We now claim that for each $n, \mathrm{~B}\left(c_{n}, r_{n}\right) \subseteq \mathcal{C}_{n}$, where $r_{n}=(R / 2)(1 / 2)^{n / d}$. Indeed, this is true for $n=0$. Also, for $n=a d$ for integer $a$, each side of the box has length $R(1 / 2)^{a}$, so the result is true in this case too. Finally, for $n=a d+b$, we have $\mathrm{B}\left(c_{(a+1) d}, R / 2^{a+1}\right) \subseteq \mathcal{C}_{(a+1) d} \subseteq \mathcal{C}_{n}$ hence $\mathrm{B}\left(c_{n}, R / 2^{a+1}\right) \subseteq \mathcal{C}_{n}$, and we note that $R / 2^{a+1} \leq(R / 2)(1 / 2)^{n / d}$.

The resisting oracle construction succeeds up to iteration $N$ provided that $\mathrm{C}_{N}$ contains a ball of radius $\varepsilon$. It therefore suffices to have $(R / 2)(1 / 2)^{N / d} \geq \varepsilon$, i.e., $N \gtrsim d \log (R / \varepsilon)$.

## Exercises

## Exercise 6.1.

1. Prove that a function $f$ is lower semicontinuous if and only if for all $c \in \mathbb{R}$, the level set $\{f \leq c\}$ is closed.
2. Prove that a supremum of lower semicontinuous functions is lower semicontinuous.
3. Show that the function defined in (6.2) is lower semicontinuous if and only if $\phi=0$.

Exercise 6.2. Prove that if $f$ is differentiable at $x_{0} \in \operatorname{int} \operatorname{dom} f$, then $\partial f\left(x_{0}\right)=\left\{\nabla f\left(x_{0}\right)\right\}$.
Exercise 6.3. Let $f: \mathbb{R}^{d} \rightarrow \mathbb{R}$ be continuous and convex on a convex set $C$. Prove that $f$ is Lipschitz continuous over $\mathcal{C}$ with constant $L$ if and only if for every $x_{0} \in \operatorname{int} \mathcal{C}$ and every $p \in \partial f\left(x_{0}\right)$, we have $\|p\| \leq L$.

## Exercise 6.4.

1. Compute the subdifferential of the Euclidean norm $\|\cdot\|$.
2. Let $\lambda_{\text {max }}: \mathrm{S}^{d} \rightarrow \mathbb{R}$ be the maximum eigenvalue function, and let $A \in \mathrm{~S}^{d}$. Show that if $v$ is a unit eigenvector corresponding to the largest eigenvalue of $A$, then $v v^{\top} \in \partial \lambda_{\max }(A)$.

Exercise 6.5. Assume that $f$ is $\alpha$-strongly convex and $L$-Lipschitz continuous over the closed convex set $\mathcal{C}$. Prove that for PSD,

$$
f\left(\bar{x}_{N}\right)-f_{\star} \leq \frac{\alpha}{2\left\{(1-\alpha h / L)^{-N}-1\right\}}\left\|x_{0}-x_{\star}\right\|^{2}+\frac{L h}{2}
$$

where $\bar{x}_{N}$ is a suitable averaged iterate. Deduce that by setting $h=\varepsilon / L$, one can achieve $f\left(\bar{x}_{N}\right)-f_{\star} \leq \varepsilon$ in $O\left(\frac{L^{2}}{\alpha \varepsilon} \log \left(\frac{\alpha R^{2}}{\varepsilon}\right)\right)$ iterations (compared with $O\left(L^{2} R^{2} / \varepsilon^{2}\right)$ iterations, as implied by Theorem 6.14).

Also, show that under these assumptions, $\left\|x_{0}-x_{\star}\right\| \leq 2 L / \alpha$.

Exercise 6.6. This exercise shaves off a logarithmic factor from the previous exercise. Assume that $f$ is $\alpha$-strongly convex and $L$-Lipschitz continuous over the closed convex set $\mathcal{C}$. Consider the iteration

$$
x_{n+1}=\Pi_{\mathcal{C}}\left(x_{n}-h_{n} p_{n}\right), \quad p_{n} \in \partial f\left(x_{n}\right)
$$

where $h_{n}:=2 /(\alpha(n+1))$. Show that

$$
f\left(\bar{x}_{N}\right)-f_{\star} \leq \frac{2 L^{2}}{\alpha(N+1)}
$$

where $\bar{x}_{N}$ is a suitably averaged iterate. Thus, we can achieve $f\left(\bar{x}_{N}\right)-f_{\star} \leq \varepsilon$ in $O\left(\frac{L^{2}}{\alpha \varepsilon}\right)$ iterations, without any extraneous logarithmic factors.

Exercise 6.7. The analysis of the ellipsoid method (and general cutting plane schemes) presents an additional difficulty: since the next set $\mathcal{C}_{n+1}$ is only chosen to be a superset of $\mathcal{C}_{n} \cap\left\{\left\langle p_{n}, \cdot\right\rangle \leq\left\langle p_{n}, x_{n}\right\rangle\right\}$, it is not guaranteed that $\mathcal{C} \subseteq \mathcal{C}_{n}$ for all $n$; in particular, the chosen point $x_{n}$ may lie outside of $\mathcal{C}$.

Assume that we have access to a separation oracle for $\mathcal{C}$ : given a point $x \notin \mathcal{C}$, the oracle outputs a non-zero vector $p \in \mathbb{R}^{d}$ such that $\sup _{e}\langle p, \cdot\rangle \leq\langle p, x\rangle$. Modify the cutting plane method as follows: if a chosen point $x_{n}$ does not lie in $\mathcal{C}$, then let $p_{n}$ be vector that separates $x_{n}$ from $\mathcal{C}$ and instead update $\mathcal{C}_{n+1}$ to be a superset of $\mathcal{C}_{n} \cap\left\{\left\langle p_{n}, \cdot\right\rangle \leq\left\langle p_{n}, x_{n}\right\rangle\right\}$. We also allow $\mathcal{C}_{0} \supseteq \mathcal{C}$, so that $x_{0}$ is not necessarily feasible either. Prove that if the sets are chosen so that $\operatorname{vol}\left(\mathcal{C}_{n+1}\right) / \operatorname{vol}\left(\mathcal{C}_{n}\right) \leq \lambda<1$ for all $n$, then the following assertions hold.

1. If $\operatorname{vol}\left(\mathcal{C}_{N}\right)<\operatorname{vol}(\mathcal{C})$, then there exists $n<N$ with $x_{n} \in \mathcal{C}$.
2. If $\operatorname{vol}\left(\mathcal{C}_{N}\right)<\operatorname{vol}(\mathcal{C})$, then there exists $n<N$ with $x_{n} \in \mathcal{C}$ and

$$
f\left(x_{n}\right)-f_{\star} \leq D L \lambda^{N / d}\left(\frac{\operatorname{vol} \mathcal{C}_{0}}{\operatorname{vol} \mathcal{C}}\right)^{1 / d}
$$

Hint: Define a sequence of sets $\mathcal{C}_{0}^{\prime}, \mathcal{C}_{1}^{\prime}, \mathcal{C}_{2}^{\prime}, \ldots$ as follows. Start with $\mathcal{C}_{0}^{\prime}=\mathcal{C}$ and $n_{-1}:=0$. For each $k \in \mathbb{N}$, let $n_{k}$ denote the first integer greater than $n_{k-1}$ for which $x_{n_{k}} \in \mathcal{C}$ and set $\mathcal{C}_{k+1}^{\prime}:=\mathcal{C}_{k}^{\prime} \cap\left\{\left\langle p_{n_{k}}, \cdot\right\rangle \leq\left\langle p_{n_{k}}, x_{n_{k}}\right\rangle\right\}$. Prove via induction that if $k(N)$ is the largest integer such that $n_{k(N)} \leq N$, then $\mathcal{C}_{n_{k(N)}}^{\prime} \subseteq \mathcal{C}_{N}$.

## Exercise 6.8. Prove Lemma 6.20.

Exercise 6.9. Prove Theorem 6.22. (Use the same construction as in the proof of Theorem 6.21, but choose the parameters $\alpha$ and $\gamma$ differently.)

## 7 Frank-Wolfe

In order to overcome the lower bounds in the black-box setting, we must take advantage of additional structure in the problem. The first method we study in this vein is the Frank-Wolfe or conditional gradient method. Instead of assuming access to a projection oracle for the constraint set $\mathcal{C}$, it instead assumes access to a linear optimization oracle (LOO) over the set $\mathcal{C}$ :

$$
\begin{equation*}
\text { Given } p \in \mathbb{R}^{d} \text {, output } \underset{\mathcal{C}}{\arg \min }\langle p, \cdot\rangle \text {. } \tag{LOO}
\end{equation*}
$$

Here, we assume that $\mathcal{C}$ is compact (bounded and closed).
The oracle equivalently maximizes the convex function $-\langle p, \cdot\rangle$ over $\mathcal{C}$, so the $\arg \min$ is attained at a vertex of $\mathcal{C}$. Let us define these concepts properly.

Definition 7.1. A point $x \in \mathfrak{C}$ is called an extreme point or a vertex of $\mathfrak{C}$ if there do not exist $x_{0}, x_{1} \in \mathcal{C}$ and $t \in(0,1)$ such that $x=(1-t) x_{0}+t x_{1}$.

Theorem 7.2. Every compact convex set is the convex hull of its extreme points.

For example, the set of vertices of the closed unit ball $\overline{\mathrm{B}(0,1)}$ is the sphere $\partial \mathrm{B}(0,1)$. It follows that to implement (LOO), it suffices to solve $\arg \min _{\text {vertices of }} e\langle p, \cdot\rangle$.

We now present the Frank-Wolfe method for minimizing $f$ over $\mathcal{C}$ :

$$
\begin{equation*}
x_{n+1}:=\left(1-h_{n}\right) x_{n}+h_{n} \operatorname{LOO}\left(\nabla f\left(x_{n}\right)\right) . \tag{FW}
\end{equation*}
$$

Theorem 7.3 (convergence of FW). Let $f$ be convex and $\beta$-smooth over $\mathcal{C}$. Let $D:= \operatorname{diam} \mathcal{C}$ and $h_{n}=2 /(n+2)$. Then, for any $N \geq 1$, FW satisfies

$$
f\left(x_{N}\right)-f_{\star} \leq \frac{2 \beta D^{2}}{N+1}
$$

Proof. Let $y_{n}:=\operatorname{LOO}\left(\nabla f\left(x_{n}\right)\right)$. Using $\beta$-smoothness,

$$
\begin{aligned}
f\left(x_{n+1}\right)-f\left(x_{n}\right) & \leq\left\langle\nabla f\left(x_{n}\right), x_{n+1}-x_{n}\right\rangle+\frac{\beta}{2}\left\|x_{n+1}-x_{n}\right\|^{2} \\
& \leq h_{n}\left\langle\nabla f\left(x_{n}\right), y_{n}-x_{n}\right\rangle+\frac{\beta D^{2} h_{n}^{2}}{2} \leq h_{n}\left\langle\nabla f\left(x_{n}\right), x_{\star}-x_{n}\right\rangle+\frac{\beta D^{2} h_{n}^{2}}{2}
\end{aligned}
$$

$$
\leq-h_{n}\left(f\left(x_{n}\right)-f_{\star}\right)+\frac{\beta D^{2} h_{n}^{2}}{2}
$$

Rearranging,

$$
f\left(x_{n+1}\right)-f_{\star} \leq\left(1-h_{n}\right)\left(f\left(x_{n}\right)-f_{\star}\right)+\frac{\beta D^{2} h_{n}^{2}}{2}
$$

For $h_{n}=2 /(n+2)$, we now prove the error bound by induction on $n$, where the base case $n=0$ follows from the inequality above. If the error bound holds at iteration $n$, then

$$
f\left(x_{n+1}\right)-f_{\star} \leq \frac{n}{n+2} \frac{2 \beta D^{2}}{n+1}+\frac{2 \beta D^{2}}{(n+2)^{2}} \leq \frac{2 \beta D^{2}}{n+2}
$$

The analysis above is actually not the most natural one, since it fails to capture the affine invariance of the Frank-Wolfe algorithm (Exercise 7.1).

Besides positing different oracle access than projected gradient methods, the FrankWolfe method has the appealing property of producing sparse solutions. This connects with results known as approximate Carathéodory theorems. First, let us recall the classical statement of Carathéodory's theorem.

Theorem 7.4 (Carathéodory). Let $\mathcal{C} \subseteq \mathbb{R}^{d}$ be a compact convex set and let $x \in \mathcal{C}$. Then, $x$ can be written as a convex combination of $d+1$ vertices of $\mathcal{C}$.

Caution: in this theorem, the choice of $d+1$ vertices of course depends on $x$ itself. If every point in $\mathcal{C}$ could be written as a convex combination of the same $d+1$ vertices, this would say that $\mathcal{C}$ only has $d+1$ vertices at all.

Carathéodory's theorem says that even if a convex body has exponentially many vertices, such as the cube $[-1,1]^{d}$, any given point has a succinct representation using only $d+1$ vertices. However, the size of the representation grows with the ambient dimension. What happens if we relax the requirement that the representation is exact? The following simple argument, often attributed to B. Maurey, shows that the size of the representation is dimension-free, and the convex combination even uses equal weights.

Theorem 7.5 (approximate Carathéodory). Let $\mathcal{C} \subseteq \mathbb{R}^{d}$ be a compact convex set with diameter $D$, let $0<\varepsilon<1$, and let $x \in \mathcal{C}$. Then, there exist vertices $y_{1}, \ldots, y_{N} \in \mathcal{C}$ with

$$
\left\|x-\frac{1}{N} \sum_{i=1}^{N} y_{i}\right\| \leq \varepsilon D, \quad N \leq \frac{1}{\varepsilon^{2}}
$$

Proof. By Theorem 7.4, there exist vertices $\bar{y}_{1}, \ldots, \bar{y}_{d+1} \in \mathcal{C}$ and a probability distribution $\lambda$ over $[d+1]$ such that $x=\sum_{j=1}^{d+1} \lambda_{j} \bar{y}_{j}$. Now consider the distribution $\mu=\sum_{j=1}^{d+1} \lambda_{j} \delta_{\bar{y}_{j}}$ and sample points $Y_{1}, \ldots, Y_{N} \stackrel{\text { i.i.d. }}{\sim} \mu$. Note that each $Y_{i}$ is a vertex of $\mathcal{C}$. Then, since the mean of $\mu$ is $x$, the usual variance calculation shows that

$$
\mathbb{E}\left[\left\|x-\frac{1}{N} \sum_{i=1}^{N} Y_{i}\right\|^{2}\right]=\frac{\sum_{j=1}^{d+1} \lambda_{j}\left\|x-\bar{y}_{j}\right\|^{2}}{N} \leq \frac{D^{2}}{N} .
$$

Choose $N$ to make the right-hand side at most $\varepsilon^{2} D^{2}$.
The approximate Caratheódory theorem has implications, e.g., for controlling the covering numbers of polytopes. But more broadly, the proof technique is quite influential and is at the root of other important developments, e.g., the existence of neural networks of small width which approximate functions in the Barron class [Bar93; Bac17].

Now comes the punchline: Franke-Wolfe renders the approximate Carathéodory theorem constructive. Indeed, suppose that the LOO always outputs a vertex. After $N-1$ iterations of FW starting from a vertex, the iterate $x_{N-1}$ is a convex combination of at most $N$ vertices. At the same time, if we apply Theorem 7.3 to the 2 -smooth function $f: z \mapsto\|x-z\|^{2}$, where $x \in \mathcal{C}$ and $f_{\star}=0$, we see that $\left\|x_{N-1}-x\right\|^{2} \leq 4 D^{2} / N$.

The full statement of Theorem 7.3 can therefore be seen as a generalization of the approximate Carathéodory principle: the iterate of FW is a sparse combination of vertices which is approximately optimal. We next demonstrate an example in which this sparsity property is crucial.

Example 7.6 (low-rank estimation). Consider the nuclear norm ball

$$
\mathcal{C}=\left\{X \in \mathbb{R}^{d \times d}:\|X\|_{*}=\sum_{i=1}^{d} \sigma_{i}(X) \leq 1\right\} .
$$

This constraint set often arises in low-rank matrix recovery as a convex relaxation of a rank constraint. Projection onto the set $\mathcal{C}$ requires projecting the singular values onto the simplex; this requires computing a full SVD, which uses $O\left(d^{3}\right)$ arithmetic operations. On the other hand, since

$$
\mathcal{C}=\operatorname{conv}\left\{u v^{\top}: u, v \in \mathbb{R}^{d},\|u\|=\|v\|=1\right\}
$$

the LOO for $\mathcal{C}$ involves solving, for any $P \in \mathbb{R}^{d \times d}$,

$$
\underset{X \in \mathcal{C}}{\arg \min }\langle P, X\rangle=\arg \min \left\{\left\langle P, u v^{\top}\right\rangle: u, v \in \mathbb{R}^{d},\|u\|=\|v\|=1\right\}
$$

Solving this amounts to computing the top singular vector of $P$, which is often implemented via power iteration at cost $O\left(d^{2}\right)$ per step. Moreover, FW yields an $\varepsilon$-accurate solution with $\operatorname{rank} O(1 / \varepsilon)$.

## Exercises

Exercise 7.1. Show that FW is affine-invariant in the following sense. Let $A \in \mathbb{R}^{d \times d}$ be an invertible matrix. Show that the iterates $\left\{\hat{x}_{n}\right\}_{n \in \mathbb{N}}$ of FW applied to the problem of minimizing $\hat{x} \mapsto f(A \hat{x})$ over the set $A^{-1} \mathrm{C}$ are related to the iterates $\left\{x_{n}\right\}_{n \in \mathbb{N}}$ of FW on the original problem via $x_{n}=A \hat{x}_{n}$.

## 8 Proximal methods

Can we solve non-smooth problems at the same rate as smooth problems? The black-box lower bounds say no in general, but if the non-smooth part is "simple" in the sense that it admits an implementable proximal oracle, the answer becomes yes.

Definition 8.1. Let $f: \mathbb{R}^{d} \rightarrow \mathbb{R} \cup\{\infty\}$. The proximal oracle for $f$ is the mapping prox $_{f}: \mathbb{R}^{d} \rightarrow \mathbb{R}^{d}$ given by

$$
\operatorname{prox}_{f}(y):=\underset{x \in \mathbb{R}^{d}}{\arg \min }\left\{f(x)+\frac{1}{2}\|y-x\|^{2}\right\}
$$

If $f$ is a regular convex function, then the optimization problem defining the proximal oracle is strongly convex, so it admits a unique minimizer by Lemma 1.10 and Lemma 6.6. Note also that

$$
\operatorname{prox}_{h f}(y)=\underset{x \in \mathbb{R}^{d}}{\arg \min }\left\{h f(x)+\frac{1}{2}\|y-x\|^{2}\right\}=\underset{x \in \mathbb{R}^{d}}{\arg \min }\left\{f(x)+\frac{1}{2 h}\|y-x\|^{2}\right\}
$$

where $h>0$ plays the role of a step size.
The value of the optimization problem defining $\operatorname{prox}_{f}$ also has a name.
Definition 8.2. Let $f: \mathbb{R}^{d} \rightarrow \mathbb{R} \cup\{\infty\}$. The Moreau-Yosida envelope of $f$ with parameter $h>0$ is the mapping $f_{h}: \mathbb{R}^{d} \rightarrow \mathbb{R} \cup\{\infty\}$ given by

$$
f_{h}(y):=\inf _{x \in \mathbb{R}^{d}}\left\{f(x)+\frac{1}{2 h}\|y-x\|^{2}\right\}
$$

### 8.1 Algorithms and examples

The proximal oracle is a regularized version of the original optimization problem. Assuming for the moment that we can compute the proximal oracle easily, let us explore its uses for algorithm design.

The simplest algorithm is to repeatedly iterate the proximal mapping. This is known as the proximal point method.

$$
\begin{equation*}
x_{n+1}:=\operatorname{prox}_{h f}\left(x_{n}\right) \tag{PPM}
\end{equation*}
$$

Assume for the moment that $f$ is smooth and that the next point $x_{n+1}$ can be obtained from the first-order optimality condition for $\operatorname{prox}_{h f}$. This leads to

$$
0=\nabla f\left(x_{n+1}\right)+\frac{1}{h}\left(x_{n+1}-x_{n}\right) \Longleftrightarrow x_{n+1}=x_{n}-h \nabla f\left(x_{n+1}\right)
$$

Note that this is similar to the GD update, except that the gradient is evaluated at the subsequent point $x_{n+1}$. In numerical analysis, we say that GD is an explicit discretization of
the gradient flow, whereas PPM is an implicit discretization. The advantage of an explicit method is easy of implementation; it does not require solving a (non-linear) system in order to perform an update. The advantage of an implicit method is stability.

Recall that the results in §2 for GF do not require smoothness of $f$, whereas the results in §3 for GD do. (We studied the non-smooth case for GD in §6.2, but it requires decreasing step sizes and averaging.) Shortly, we shall see that PPM is similar to GF, in that it also does not require smoothness.

The most powerful results using the proximal oracle, however, are for the problem of composite optimization. Here, the goal is to minimize a sum of functions:

$$
\text { minimize } \quad F:=f+g .
$$

We assume that $f$ is smooth and that $g$ is non-smooth.

Example 8.3 (LASSO as composite optimization). The computation of the LASSO estimator from Example 1.3 is the canonical example of composite optimization, where

$$
f: \theta \mapsto \frac{1}{2 n} \sum_{i=1}^{n}\left(Y_{i}-\left\langle\theta, X_{i}\right\rangle\right)^{2}, \quad g: \theta \mapsto \lambda\|\theta\|_{1}
$$

In this example, the non-smooth part is particularly simple, so we can compute its proximal oracle in closed form. First, note that it is coordinate-wise decomposable:

$$
\begin{aligned}
\operatorname{prox}_{\lambda\|\cdot\|_{1}}(y) & =\underset{x \in \mathbb{R}^{d}}{\arg \min }\left\{\lambda\|x\|_{1}+\frac{1}{2}\|y-x\|^{2}\right\} \\
& =\sum_{i=1}^{d}\left(\underset{x[i] \in \mathbb{R}}{\arg \min }\left\{\lambda|x[i]|+\frac{1}{2}(y[i]-x[i])^{2}\right\}\right) e_{i}
\end{aligned}
$$

Therefore, it suffices to solve the problem in dimension one. A direct computation (see Exercise 8.1) then yields

$$
\operatorname{prox}_{\lambda|\cdot|}(y)=(|y|-\lambda)_{+} \operatorname{sgn} y=: \operatorname{thresh}_{\lambda}(y)
$$

where $(\cdot)_{+}:=\max \{0, \cdot\}$ denotes the positive part. The operator thes $\mathrm{h}_{\lambda}$, known as the soft thresholding operator (Figure 3), reduces the magnitude of its input by $\lambda$, or to 0 if the original magnitude is less than $\lambda$. The proximal operator for $\lambda\|\cdot\|_{1}$ simply applies thresh $_{\lambda}$ to each coordinate.

![](https://cdn.mathpix.com/cropped/6a4b6b6a-023b-49e3-b926-a2896fa123e3-063.jpg?height=646&width=865&top_left_y=343&top_left_x=635)
Figure 3: The soft thresholding operator.

Example 8.4 (constrained optimization as composite optimization). Consider the problem of minimizing a smooth function $f$ over a closed convex set $\mathcal{C}$. We can also treat this as composite optimization with

$$
g=\chi_{\mathcal{C}} .
$$

(Recall the convex indicator defined in (6.1).) In this case, the proximal oracle for $g$ is

$$
\operatorname{prox}_{h \chi_{\mathcal{C}}}(y)=\underset{x \in \mathbb{R}^{d}}{\arg \min }\left\{\chi_{\mathcal{C}}(x)+\frac{1}{2 h}\|y-x\|^{2}\right\}=\underset{x \in \mathcal{C}}{\arg \min }\left\{\frac{1}{2 h}\|y-x\|^{2}\right\}=\Pi_{\mathcal{C}}(y) .
$$

So, the proximal oracle for $\chi_{\mathrm{e}}$ is the projection oracle for $\mathcal{C}$.

The above examples motivate the assumption that we have access to the proximal oracle for the non-smooth part $g$. Further examples of computable proximal oracles can be found on the website proximity-operator.net.

The algorithm we consider in this context is known as proximal gradient descent.

$$
\begin{equation*}
x_{n+1}:=\underset{x \in \mathbb{R}^{d}}{\arg \min }\left\{f\left(x_{n}\right)+\left\langle\nabla f\left(x_{n}\right), x-x_{n}\right\rangle+g(x)+\frac{1}{2 h}\left\|x-x_{n}\right\|^{2}\right\} . \tag{PGD}
\end{equation*}
$$

In other words, we take the objective function $F=f+g$ and linearize only the smooth
part. The update can be rewritten as follows. By completing the square,

$$
x_{n+1}=\underset{x \in \mathbb{R}^{d}}{\arg \min }\left\{g(x)+\frac{1}{2 h}\left\|x-x_{n}+h \nabla f\left(x_{n}\right)\right\|^{2}\right\}=\operatorname{prox}_{h g}\left(x_{n}-h \nabla f\left(x_{n}\right)\right)
$$

This corresponds to taking an explicit step on $f$, followed by an implicit step on $g$. It is not obvious that this algorithm converges to $x_{\star}$, the minimizer of $F=f+g$. However, note that if $g$ is differentiable, then

$$
x_{n+1}=x_{n}-h \nabla f\left(x_{n}\right)-h \nabla g\left(x_{n+1}\right)
$$

If $x_{n}=x_{\star}$, then $x_{n+1}=x_{\star}$ is the solution since $0=\nabla F\left(x_{\star}\right)=\nabla f\left(x_{\star}\right)+\nabla g\left(x_{\star}\right)$. Thus, provided that $f$ and $g$ are convex and differentiable, $x_{\star}$ is the unique fixed point.

For the LASSO problem, the iteration reads

$$
x_{n+1}=\operatorname{thresh}_{\lambda h}\left(x_{n}-h \nabla f\left(x_{n}\right)\right)
$$

In the literature, this is known as the iterative shrinking-thresholding algorithm (ISTA). For constrained optimization, proximal gradient descent is projected gradient descent.

### 8.2 Convergence analysis

We study the convergence of PGD, since it includes PPM as a special case (take $f=0$ ).
Theorem 8.5 (convergence of PGD). Let $f$ be $\alpha_{f}$-convex and $\beta_{f}$-smooth, and let $g$ be $\alpha_{g}$-convex. Let the step size $h$ satisfy $h \leq 1 / \beta_{f}$, let $x^{+}$denote the next iterate of PGD started from $x$, and let $y \in \mathbb{R}^{d}$. Then,

$$
\begin{equation*}
\left(1+\alpha_{g} h\right)\left\|y-x^{+}\right\|^{2} \leq\left(1-\alpha_{f} h\right)\|y-x\|^{2}-2 h\left(F\left(x^{+}\right)-F(y)\right) . \tag{8.1}
\end{equation*}
$$

In particular, if we set $y=x_{\star}$ and iterate, it yields

$$
F\left(x_{N}\right)-F_{\star} \leq \frac{\alpha_{f}+\alpha_{g}}{2\left(\lambda_{h}^{-N}-1\right)}\left\|x_{0}-x_{\star}\right\|^{2}
$$

where $\lambda_{h}:=\left(1-\alpha_{f} h\right) /\left(1+\alpha_{g} h\right)$.
Proof. Let $\psi_{x}$ denote the objective function in the definition of PGD. Then, $\psi_{x}$ is $\left(\alpha_{g}+1 / h\right)$ strongly convex with minimizer $x^{+}$, so by the quadratic growth inequality,

$$
\psi_{x}(y) \geq \psi_{x}\left(x^{+}\right)+\frac{\alpha_{g}+1 / h}{2}\left\|y-x^{+}\right\|^{2}
$$

On one hand, by $\alpha_{f}$-convexity,

$$
\psi_{x}(y)=f(x)+\langle\nabla f(x), y-x\rangle+g(y)+\frac{1}{2 h}\|y-x\|^{2} \leq F(y)+\frac{1 / h-\alpha_{f}}{2}\|y-x\|^{2}
$$

On the other hand, by $\beta_{f}$-smoothness,

$$
\begin{aligned}
\psi_{x}\left(x^{+}\right) & =f(x)+\left\langle\nabla f(x), x^{+}-x\right\rangle+g\left(x^{+}\right)+\frac{1}{2 h}\left\|x^{+}-x\right\|^{2} \\
& \geq F\left(x^{+}\right)+\frac{1 / h-\beta_{f}}{2}\left\|x^{+}-x\right\|^{2} \geq F\left(x^{+}\right)
\end{aligned}
$$

Combining these inequalities and rearranging,

$$
\left(1+\alpha_{g} h\right)\left\|y-x^{+}\right\|^{2} \leq\left(1-\alpha_{f} h\right)\|y-x\|^{2}-2 h\left(F\left(x^{+}\right)-F(y)\right) .
$$

Note that by taking $y=x$, it yields the descent property

$$
F\left(x^{+}\right)-F(x) \leq-\frac{1+\alpha_{g} h}{2 h}\left\|x-x^{+}\right\|^{2} \leq 0
$$

The final bound follows from Lemma 3.5 and algebra.
Refined analyses of PPM are presented in Exercise 8.3, Corollary 9.13, and Exercise 9.2.
The key feature of Theorem 8.5 is that it essentially recovers the smooth rate for GD despite the presence of non-smoothness in the objective. Thus, for the LASSO problem (Example 8.3), we can solve it as quickly as if it were a smooth problem via ISTA.

Moreover, the one-step inequality (8.1) is the PGD analogue of the inequality (3.3) which holds for GD, and in turn, (3.3) is the only property of GD which plays a role in the proof of Nesterov acceleration (Theorem 5.10); the remainder of the proof is purely algebraic. This naturally leads to an accelerated algorithm for composite optimization.

Starting with $x_{-1}=x_{0}$, consider

$$
\begin{equation*}
x_{n+1}:=\mathrm{PGD}_{F, 1 / \beta}\left(x_{n}+\theta_{n}\left(x_{n}-x_{n-1}\right)\right) \tag{APGD}
\end{equation*}
$$

where $\mathrm{PGD}_{F, 1 / \beta}$ denotes one step of PGD on $F=f+g$ with step size $h=1 / \beta$.
Theorem 8.6 (convergence of APGD). Let $f$ be convex and $\beta$-smooth, and let $g$ be convex. Define the sequence: $\lambda_{0}:=0$ and $\lambda_{n+1}:=\frac{1}{2}\left(1+\sqrt{1+4 \lambda_{n}^{2}}\right)$ for $n \in \mathbb{N}$. Set $\theta_{n}:=\left(\lambda_{n}-1\right) / \lambda_{n+1}$. Then, APGD satisfies

$$
F\left(x_{N}\right)-F_{\star} \leq \frac{2 \beta\left\|x_{0}-x_{\star}\right\|^{2}}{N^{2}}
$$

When applied to LASSO, this algorithm is known as fast ISTA or FISTA. Rates in the strongly convex setting can be obtained from the reduction in Lemma 4.1.

## Exercises

Exercise 8.1. Verify the computation of $\operatorname{prox}_{\lambda|\cdot|}$ in Example 8.3.
Exercise 8.2. Prove that even for non-convex $f$, as long as $x^{+}:=\operatorname{prox}_{h f}(x)$ is well-defined,

$$
f\left(x^{+}\right)-f_{\star} \leq \frac{1}{2 h}\left\|x-x_{\star}\right\|^{2}
$$

Thus, if we can implement PPM for arbitrarily large step sizes $h>0$, we can solve non-convex optimization.

Exercise 8.3. To avoid technical difficulties, assume that $f$ is convex and differentiable everywhere. Show that for the PPM, (8.1) can be refined as follows: for all $y \in \mathbb{R}^{d}$,

$$
\left\|x^{+}-y\right\|^{2} \leq\|x-y\|^{2}-2 h\left(f\left(x^{+}\right)-f(y)\right)-h^{2}\left\|\nabla f\left(x^{+}\right)\right\|^{2}
$$

Next, in analogy to Exercise 2.1, define the Lyapunov function

$$
\mathscr{L}_{n}:=n^{2} h^{2}\left\|\nabla f\left(x_{n}\right)\right\|^{2}+2 n h\left(f\left(x_{n}\right)-f_{\star}\right)+\left\|x_{n}-x_{\star}\right\|^{2},
$$

where $\left\{x_{n}\right\}_{n \in \mathbb{N}}$ are the iterates of PPM, and show that $\mathscr{L}_{n+1} \leq \mathscr{L}_{n}$. (Use the fact that PPM is contractive, see Corollary 9.13.) Deduce the bounds

$$
\left\|\nabla f\left(x_{N}\right)\right\| \leq \frac{\left\|x_{0}-x_{\star}\right\|}{N h}, \quad f\left(x_{N}\right)-f_{\star} \leq \frac{\left\|x_{0}-x_{\star}\right\|^{2}}{4 N h} .
$$

Observe that if $h \searrow 0$ while $N h \rightarrow t$, it recovers the results of Exercise 2.1.

## 9 Fenchel duality

In this section, we study a notion of duality for convex functions.

Definition 9.1. Let $f: \mathbb{R}^{d} \rightarrow \mathbb{R} \cup\{\infty\}$ be proper ( $\operatorname{dom} f \neq \varnothing$ ). The convex conjugate or Fenchel-Legendre conjugate of $f$ is the function $f^{*}: \mathbb{R}^{d} \rightarrow \mathbb{R} \cup\{\infty\}$ defined by

$$
f^{*}(y):=\sup _{x \in \mathbb{R}^{d}}\{\langle x, y\rangle-f(x)\}
$$

For any proper function $f$, the conjugate $f^{*}$ is always convex and lower semicontinuous, since it is a supremum of affine functions. Conversely, if $f$ is a regular convex function (thus: proper, convex, and lower semicontinuous), then $f=f^{* *}$ (Theorem 9.7).

## Example 9.2. The verification of these examples is left as Exercise 9.1.

1. If $f(x)=\frac{1}{2}\langle x, A x\rangle$ where $A \rightarrow 0$, then $f^{*}(y)=\frac{1}{2}\left\langle y, A^{-1} y\right\rangle$.
2. If $f(x)=|x|^{p} / p$ for $p>1$ and $x \in \mathbb{R}$, then $f^{*}(y)=|y|^{q} / q$ where $1 / p+1 / q=1$.
3. Let $|||\cdot|||$ denote a norm over $\mathbb{R}^{d}$ (not necessarily Euclidean), and let $\left|||\cdot||_{*}\right.$ denote the dual norm: $\|y\|_{*}:=\sup \left\{\langle x, y\rangle: x \in \mathbb{R}^{d},\|x\| \leq 1\right\}$.
If $f(x)=\|x\|$, then $f^{*}(y)=\chi \mathfrak{C}(y)$ where $\mathcal{C}:=\left\{y \in \mathbb{R}^{d}:\|y\|_{*} \leq 1\right\}$ is the closed unit ball in the dual norm.

Before formally establishing further properties of this duality, we take a detour to explain the origin of this concept in classical mechanics.

## 9.1 (Optional) Connection with classical mechanics

Disclaimer: The material in this subsection is not necessarily the most relevant for optimization, and it is included for the sake of broader historical context. We make no attempt to be rigorous: assume all functions are smooth, etc.

Newton's law of motion states that the trajectory $\left(x_{t}\right)_{t \geq 0}$ of a particle of mass $m$ obeys the differential equation $m \ddot{x}_{t}=F\left(x_{t}\right)$, where $F$ is the force. The force is typically given as the gradient of a potential: $F=-\nabla \phi$.

In 1662, Pierre de Fermat proposed an explanation for the law of refraction via his principle of least action: light takes the path which minimizes the total travel time. Is there such a principle for classical mechanics as well? In 1760, Joseph-Louis Lagrange found such a variational principle: let $L(x, v):=\frac{1}{2} m\|v\|^{2}-\phi(x)$ denote the Lagrangian, where $v$ denotes the velocity of the particle. Note that the Lagrangian is the difference of the kinetic energy and the potential energy. The action functional is

$$
\mathscr{A}\left(\left(x_{t}\right)_{t \in[0, T]}\right):=\int_{0}^{T} L\left(x_{t}, \dot{x}_{t}\right) \mathrm{d} t
$$

Lagrangian mechanics states that if a particle starts at $x_{0}$ at time 0 , and ends at $x_{T}$ at time $T$, then the path it takes in between is a stationary point of the action functional subject to the endpoint constraints.

We solve for the path using calculus of variations. Let $x_{[0, T]}:=\left(x_{t}\right)_{t \in[0, T]}$ be a shorthand for the path. If $x_{[0, T]}$ is a stationary point, it means that for any perturbation $\delta x_{[0, T]}$, the difference $\mathscr{A}\left(x_{[0, T]}+\delta x_{[0, T]}\right)-\mathscr{A}\left(x_{[0, T]}\right)$ should vanish to first order in $\delta x_{[0, T]}$. The
endpoint constraints require that $\delta x_{0}=\delta x_{T}=0$. Thus,

$$
\begin{aligned}
& \mathscr{A}\left(x_{[0, T]}+\delta x_{[0, T]}\right)-\mathscr{A}\left(x_{[0, T]}\right)=\int_{0}^{T}\left\{L\left(x_{t}+\delta x_{t}, \dot{x}_{t}+\delta \dot{x}_{t}\right)-L\left(x_{t}, \dot{x}_{t}\right)\right\} \mathrm{d} t \\
& \quad=\int_{0}^{T}\left\{\left\langle\nabla_{x} L\left(x_{t}, \dot{x}_{t}\right), \delta x_{t}\right\rangle+\left\langle\nabla_{v} L\left(x_{t}, \dot{x}_{t}\right), \delta \dot{x}_{t}\right\rangle\right\} \mathrm{d} t+o(\|\delta x\|) \\
& \quad=\int_{0}^{T}\left\langle\nabla_{x} L\left(x_{t}, \dot{x}_{t}\right)-\partial_{t} \nabla_{v} L\left(x_{t}, \dot{x}_{t}\right), \delta x_{t}\right\rangle \mathrm{d} t+o(\|\delta x\|)
\end{aligned}
$$

The stationary point therefore satisfies the Euler-Lagrange equation

$$
\partial_{t} \nabla_{v} L\left(x_{t}, \dot{x}_{t}\right)=\nabla_{x} L\left(x_{t}, \dot{x}_{t}\right)
$$

For $L(x, v)=\frac{1}{2} m\|v\|^{2}-\phi(x)$, it recovers Newton's equation.
We now introduce the Legendre transform. Define the Hamiltonian $H$ to be the convex conjugate of $L$ with respect to the $v$-variable, i.e.,

$$
H(x, p):=\sup _{v \in \mathbb{R}^{d}}\{\langle p, v\rangle-L(x, v)\}
$$

The first-order condition reveals that

$$
p=\nabla_{v} L(x, v)
$$

Instead of working with the variables ( $x, v$ ), we now work with the variables ( $x, p$ ). The inverse of the transformation is given by

$$
\begin{equation*}
v=\nabla_{p} H(x, p) \tag{9.1}
\end{equation*}
$$

Indeed, we will argue that a regular convex function $f$ satisfies $f=f^{* *}$ (Theorem 9.7). Assuming that $v \mapsto L(x, v)$ is regular convex, it yields the dual representation

$$
L(x, v)=\sup _{p \in \mathbb{R}^{d}}\{\langle p, v\rangle-H(x, p)\}
$$

and the first-order condition for this problem yields (9.1).
Thus, if we define $p_{t}:=\nabla_{v} L\left(x_{t}, \dot{x}_{t}\right)$, we can reformulate the Euler-Lagrange equation as follows. First, $\dot{x}_{t}=v_{t}=\nabla_{p} H\left(x_{t}, p_{t}\right)$ by (9.1). Also, $\nabla_{x} H(x, p)=-\nabla_{x} L(x, v)$ by the envelope theorem, so $\dot{p}_{t}=\partial_{t} \nabla_{v} L\left(x_{t}, \dot{x}_{t}\right)=\nabla_{x} L\left(x_{t}, \dot{x}_{t}\right)=-\nabla_{x} H\left(x_{t}, p_{t}\right)$. In summary,

$$
\dot{x}_{t}=\nabla_{p} H\left(x_{t}, p_{t}\right), \quad \dot{p}_{t}=-\nabla_{x} H\left(x_{t}, p_{t}\right)
$$

These are known as Hamilton's equations, and it is easy to verify that they conserve the Hamiltonian: $\partial_{t} H\left(x_{t}, p_{t}\right)=0$. Compared to Newton's law, which is a second-order differential equation for the trajectory, Hamilton's equations are a system of coupled first-order differential equations evolving in phase space.

For our running example, $p=m v$ is interpreted as the momentum, and

$$
H(x, p)=\left\langle p, \frac{p}{m}\right\rangle-\frac{1}{2} m\left\|\frac{p}{m}\right\|^{2}+\phi(x)=\frac{1}{2 m}\|p\|^{2}+\phi(x)
$$

which is the total energy (kinetic plus potential). Hamilton's equations read

$$
m \dot{x}_{t}=p_{t}, \quad p_{t}=-\nabla \phi\left(x_{t}\right) .
$$

What does duality say about the action functional? Surprisingly, it relates back to other concepts we have already seen. Specialize now to the case where the Lagrangian only depends on $v(\phi=0$; no external potential, so we expect particles to move in straight lines). Define the following function of space and time:

$$
u(t, x):=\inf \left\{\int_{0}^{t} L\left(\dot{x}_{s}\right) \mathrm{d} s+f\left(x_{0}\right) \mid x:[0, t] \rightarrow \mathbb{R}^{d}, x_{t}=x\right\}
$$

In words, we minimize the action functional up to time $t$, subject to the constraint that we hit $x$ at time $t$. We also add an initial cost $f\left(x_{0}\right)$. The function $u$ resembles the notion of the value function or cost-to-go function in dynamic programming, and indeed it satisfies a dynamic programming principle: for $0 \leq s<t$,

$$
\begin{equation*}
u(t, y)=\inf _{x \in \mathbb{R}^{d}}\left\{(t-s) L\left(\frac{y-x}{t-s}\right)+u(s, x)\right\} \tag{9.2}
\end{equation*}
$$

The heuristic derivation of this identity is as follows: consider a potential candidate $x$ for the value of the path at time $s$. Given $x$, the best possible value of $\int_{0}^{s} L\left(\dot{x}_{r}\right) \mathrm{d} r+f\left(x_{0}\right)$ is $u(s, x)$. For the remaining part, by convexity,

$$
\int_{s}^{t} L\left(\dot{x}_{r}\right) \mathrm{d} r \geq(t-s) L\left(\frac{1}{t-s} \int_{s}^{t} \dot{x}_{r} \mathrm{~d} r\right)=(t-s) L\left(\frac{y-x}{t-s}\right)
$$

The lower bound is achieved if $\dot{x}_{r}$ is constant for $r \in[s, t]$, i.e., $x_{[s, t]}$ is a straight line.
In particular, since $u(0, \cdot)=f$, we see that

$$
\begin{equation*}
u(t, y):=\inf _{x \in \mathbb{R}^{d}}\left\{t L\left(\frac{y-x}{t}\right)+f(x)\right\} \tag{9.3}
\end{equation*}
$$

Definition 9.3. The Hopf-Lax semigroup $\left(Q_{t}\right)_{t \geq 0}$ is a family of operators which maps functions to functions, such that $Q_{t} f(y)$ is defined to be the right-hand side of (9.3).

The dynamic programming principle (9.2) shows that $Q_{t} f=Q_{t-s}\left(Q_{s} f\right)$. Thus, we have the properties $Q_{0}=\mathrm{id}$, $Q_{s+t}=Q_{s} Q_{t}=Q_{t} Q_{s}$ for all $s, t \geq 0$, which are the defining properties of a semigroup.

These concepts are fundamental, so it is unsurprising that they have been rediscovered in different contexts. In the context of convex analysis, the corresponding operation is known as the infimal convolution.

Definition 9.4. Let $f, g: \mathbb{R}^{d} \rightarrow \mathbb{R} \cup\{\infty\}$. The infimal convolution of $f$ and $g$, denoted $f \square g$, is the function defined by

$$
(f \square g)(y):=\inf _{x \in \mathbb{R}^{d}}\{f(x)+g(y-x)\} .
$$

In this notation, $Q_{t} f=t L(\cdot / t) \square f$. Interestingly, the operation of convex conjugation turns addition into infimal convolution and vice versa.

Theorem 9.5 (convex conjugation and infimal convolution). Let $f, g$ be regular convex functions. Then,

$$
(f \square g)^{*}=f^{*}+g^{*} .
$$

Conversely, if int $\operatorname{dom} f \cap \operatorname{int} \operatorname{dom} g \neq \varnothing$, then

$$
(f+g)^{*}=f^{*} \square g^{*}
$$

Proof. For the first statement, note that

$$
\begin{aligned}
(f \square g)^{*}(y) & =\sup _{x \in \mathbb{R}^{d}}\{\langle x, y\rangle-(f \square g)(x)\}=\sup _{x \in \mathbb{R}^{d}}\left\{\langle x, y\rangle-\inf _{z \in \mathbb{R}^{d}}\{f(z)+g(x-z)\}\right\} \\
& =\sup _{x, z \in \mathbb{R}^{d}}\{\langle z, y\rangle-f(z)+\langle x-z, y\rangle-g(x-z)\}=f^{*}(y)+g^{*}(y) .
\end{aligned}
$$

The first statement also implies that $\left(f^{*} \square g^{*}\right)^{*}=f^{* *}+g^{* *}=f+g$ by Theorem 9.7. By applying convex conjugation to both sides, $\left(f^{*} \square g^{*}\right)^{* *}=(f+g)^{*}$, which implies the second statement if $f^{*} \square g^{*}$ equals its double conjugate. For this, we need to know that $f^{*} \square g^{*}$ is regular convex, which follows from the condition on the domains (see [Roc97, Theorem 16.4]).

There is a surprising analogy with the Fourier transform, which transforms convolution into multiplication. Recall that for $f, g: \mathbb{R}^{d} \rightarrow \mathbb{C}$, the Fourier transform is
given by $\mathscr{F} f(\xi):=\int f(x) \exp (-2 \pi \mathbf{i}\langle\xi, x\rangle) \mathrm{d} x$, the convolution is given by $(f * g)(y):= \int f(x) g(y-x) \mathrm{d} x$, and we have the key property $\mathscr{F}(f * g)=\mathscr{F} f \mathscr{F} g$.

To see a connection more precisely, note that we usually work with the algebra $(+, \cdot)$ with its familiar properties: there is an additive identity 0 such that $x+0=0+x=x$ for all $x$; every $x$ has an additive inverse $-x$ satisfying $x+(-x)=0$; multiplication distributes over addition; etc. Now introduce a new structure, consisting of the operations (min, + ). This shares some properties with the usual algebra: the identity element for min is $+\infty$, and + distributes over $\min$, i.e., $x+\min (y, z)=\min (x+y, x+z)$. However, we also lose some properties: e.g., not every element has an inverse for the min operation. This is sometimes known as the min-plus algebra despite the fact that it is not technically an algebra; more accurately, it is called the tropical semiring.

If we think of integrals as continuous summations, then convolution is a sum of products; infimal convolution is a min of sums. Hence, infimal convolution is the tropical analogue of convolution. The following table summarizes further analogies.

| $(+, \times)$ | $(\mathrm{min},+)$ |
| :---: | :---: |
| convolution | infimal convolution |
| Fourier transform | convex conjugate |
| Gaussians | convex quadratics |
| diffusion processes | gradient flow |
| heat equation | Hamilton-Jacobi equation |
| heat semigroup | Hopf-Lax semigroup |

We conclude this discussion by using this perspective to show that the Hopf-Lax semigroup solves the following PDE, known as the Hamilton-Jacobi equation:

$$
\begin{equation*}
\partial_{t} u+H\left(\nabla_{x} u\right)=0 . \tag{9.4}
\end{equation*}
$$

The proof is patterned on the following derivation of the solution to the heat equation $\partial_{t} u=\Delta u$ with initial condition $u(0, \cdot)=f$; here $\Delta u=\sum_{i=1}^{d} \partial_{i}^{2} u$ is the Laplacian. If we take the Fourier transform of both sides of the equation, then $\partial_{t} \mathscr{F} u=\mathscr{F} \Delta u=-4 \pi^{2}\|\cdot\|^{2} \mathscr{F} u$, where the last equality follows from differentiating the Fourier transform under the integral. This implies that $\partial_{t} \log \mathscr{F} u=-4 \pi^{2}\|\cdot\|^{2}$, or $\mathscr{F} u(t, \cdot)=\mathscr{F} f \exp \left(-4 \pi^{2} t\|\cdot\|^{2}\right)$. Using the fact that the inverse Fourier transform transforms multiplication into convolution, one can then show that $u(t, \cdot)=f * \mathscr{F} \exp \left(-4 \pi^{2} t\|\cdot\|^{2}\right)=f * \operatorname{normal}(0,4 t I)$.

In the same way, we start with (9.4) and take the convex conjugate of both sides. Using the shorthand notation $f_{t}:=u(t, \cdot)$, and since $f_{t}^{*}(p)=\sup _{v \in \mathbb{R}^{d}}\left\{\langle p, v\rangle-f_{t}(v)\right\}$ with the supremum attained at $v=\nabla f_{t}^{*}(p)$,

$$
\partial_{t} f_{t}^{*}(p)=-\partial_{t} f_{t}\left(\nabla f_{t}^{*}(p)\right)=H\left(\nabla f_{t}\left(\nabla f_{t}^{*}(p)\right)\right)=H(p) .
$$

Hence, $f_{t}^{*}=t H+f$ and $f_{t}=(t H)^{*} \square f=t L(\cdot / t) \square f$. Thus, the solution to (9.4) is given by the Hopf-Lax semigroup as claimed.

When $L=H=\frac{1}{2}\|\cdot\|^{2}$, (9.4) becomes $\partial_{t} u+\frac{1}{2}\left\|\nabla_{x} u\right\|^{2}=0$ and the Hopf-Lax semigroup $Q_{t} f$ coincides with the Moreau-Yosida envelope (Definition 8.2). This yields an unexpected connection between the Hamilton-Jacobi equation and the PPM.

### 9.2 Duality correspondences

Theorem 9.6 (Fenchel-Young). Let $f: \mathbb{R}^{d} \rightarrow \mathbb{R} \cup\{\infty\}$ be regular and convex. Then,

$$
f(x)+f^{*}(p) \geq\langle p, x\rangle \quad \text { for all } p, x \in \mathbb{R}^{d}
$$

Moreover, equality holds if and only if $p \in \partial f(x)$, if and only if $x \in \partial f^{*}(p)$.
Proof. The inequality is trivial from the definition of $f^{*}$. If equality holds, then for any $p^{\prime}, x^{\prime} \in \mathbb{R}^{d}$,

$$
\begin{aligned}
f\left(x^{\prime}\right) & \geq\left\langle p, x^{\prime}\right\rangle-f^{*}(p)=f(x)+\left\langle p, x^{\prime}-x\right\rangle \\
f^{*}\left(p^{\prime}\right) & \geq\left\langle p^{\prime}, x\right\rangle-f(x)=f^{*}(p)+\left\langle x, p^{\prime}-p\right\rangle
\end{aligned}
$$

i.e., $p \in \partial f(x)$ and $x \in \partial f^{*}(p)$. Conversely, if $p \in \partial f(x)$, then

$$
f^{*}(p)=\sup _{x^{\prime} \in \mathbb{R}^{d}}\left\{\left\langle p, x^{\prime}\right\rangle-f\left(x^{\prime}\right)\right\} \leq\langle p, x\rangle-f(x)
$$

Theorem 9.7 (double conjugation). Let $f: \mathbb{R}^{d} \rightarrow \mathbb{R} \cup\{\infty\}$. Then, $f \geq f^{* *}$.
Moreover, if $f$ is regular and convex, then equality holds: $f=f^{* *}$.
Proof. For the first statement,

$$
\begin{equation*}
f^{* *}(z)=\sup _{y \in \mathbb{R}^{d}}\left\{\langle y, z\rangle-\sup _{x \in \mathbb{R}^{d}}\{\langle x, y\rangle-f(x)\}\right\}=\sup _{y \in \mathbb{R}^{d}} \inf _{x \in \mathbb{R}^{d}}\{\langle y, z-x\rangle+f(x)\} \leq f(z) \tag{9.5}
\end{equation*}
$$

by choosing $x=z$.
Now assume that $f$ is regular and convex. If $z \in \operatorname{int} \operatorname{dom} f$, then by Theorem 6.9 there exists $p \in \partial f(z)$, so that $f(x) \geq f(z)+\langle p, x-z\rangle$ for all $x \in \mathbb{R}^{d}$. By taking $y=p$,

$$
f^{* *}(z) \geq \inf _{x \in \mathbb{R}^{d}}\{\langle p, z-x\rangle+f(x)\} \geq f(z)
$$

which proves the equality for such $z$. For brevity, we omit the proof for $z \notin \operatorname{int} \operatorname{dom} f$ (see, e.g., [Roc97, Theorem 12.2]).

This result implies that in general, if $f_{*}$ is the largest convex and lower semicontinuous function which is smaller than $f$, then $f_{*}=f^{* *}$. Indeed, $f_{*} \geq f^{* *}$ by definition, whereas $f \geq f_{*}$ implies $f^{* *} \geq\left(f_{*}\right)^{* *}=f_{*}$. The proof above also shows that whenever $\partial f(x) \neq \varnothing$, then $f(x)=f^{* *}(x)$. In particular, if $x_{\star}$ is a minimizer of $f$, then $0 \in \partial f\left(x_{\star}\right)$ and $f\left(x_{\star}\right)= f^{* *}\left(x_{\star}\right)$; moreover, by taking $y=0$ in (9.5) we see that $\inf f=\inf f^{* *}$. Thus, we can start with a non-convex function $f$ and "convexify" it by replacing it with $f^{* *}$ while preserving the optimal value, although this is seldom useful in practice.

Properties of $f$ are often reflected as "dual" properties for $f^{*}$. For example, if $f$ is regular convex, the following assertions hold (see [Roc97]):

- $f$ is Lipschitz if and only if $\operatorname{dom} f^{*}$ is bounded.
- epi $f$ contains no non-vertical half-lines if and only if $\operatorname{dom} f^{*}=\mathbb{R}^{d}$.
- $f$ has no lines along which it is affine if and only if int $\operatorname{dom} f^{*} \neq \varnothing$.
- $f$ has bounded level sets if and only if $0 \in \operatorname{int} \operatorname{dom} f^{*}$.
- $f$ is differentiable at $x$ with $\nabla f(x)=p$ if and only if $\left(p, f^{*}(p)\right)$ is an exposed point of epi $f^{*}$. (An exposed point of a convex set is a point at which some linear function attains its strict maximum over the convex set.)

For our purposes, we are most interested in conditions under which $\nabla f$ is a well-defined bijection from an open convex set $\mathcal{C}$ to its image $\nabla f(\mathcal{C})$, with inverse given by $(\nabla f)^{-1}= \nabla f^{*}$. In this case, the correspondence between $f$ and $f^{*}$ is known as the Legendre transformation and we informally discussed it in the previous subsection. We accept the results in the following discussion without proof; see [Roc97, §26] for details.

Definition 9.8. Let $f: \mathbb{R}^{d} \rightarrow \mathbb{R} \cup\{\infty\}$ be regular convex.

- We say that $f$ is essentially smooth if $f$ is differentiable on $\mathcal{C}:=\operatorname{int} \operatorname{dom} f$ and $\lim _{n \rightarrow \infty}\left\|\nabla f\left(x_{n}\right)\right\| \rightarrow \infty$ whenever $\left\{x_{n}\right\}_{n \in \mathbb{N}}$ is a sequence in $\mathcal{C}$ converging to $\partial \mathcal{C}$.
- We say that $f$ is essentially strictly convex if $f$ is strictly convex on every convex subset of $\operatorname{dom} \partial f:=\left\{x \in \mathbb{R}^{d}: \partial f(x) \neq \varnothing\right\}$.

Lemma 9.9. A regular convex function $f$ is essentially smooth if and only if $f^{*}$ is essentially strictly convex.

Theorem 9.10. Let $f$ be regular, strictly convex, and essentially smooth over $\mathcal{C}= \operatorname{int} \operatorname{dom} f$. Then, $f^{*}$ is regular, strictly convex, and essentially smooth over $\mathcal{C}^{*}:=$ int $\operatorname{dom} f^{*}$. Moreover, $\nabla f: \mathcal{C} \rightarrow \mathcal{C}^{*}$ is a continuous bijection with $(\nabla f)^{-1}=\nabla f^{*}$.

Definition 9.11. We say that a function $f: \mathbb{R}^{d} \rightarrow \mathbb{R} \cup\{\infty\}$ is of Legendre type if it satisfies the assumptions of Theorem 9.10.

To summarize, the condition that $f$ is regular convex ensures duality at the level of $f=f^{* *}$. The condition that $f$ is of Legendre type ensures duality at the level of $(\nabla f)^{-1}=\nabla f^{*}$. Note also that if $f, f^{*}$ are sufficiently smooth, then by differentiating the equality $\nabla f\left(\nabla f^{*}\right)=$ id one obtains the identity

$$
\nabla^{2} f \circ \nabla f^{*}=\left[\nabla^{2} f^{*}\right]^{-1}
$$

In particular, $\nabla^{2} f \succeq \alpha I$ is equivalent to $\left[\nabla^{2} f^{*}\right]^{-1} \leq \alpha^{-1} I$, i.e., there is a duality between the properties of strong convexity and smoothness. Let us prove this last fact without assuming differentiability.

Lemma 9.12 (convexity-smoothness duality). Let $f: \mathbb{R}^{d} \rightarrow \mathbb{R} \cup\{\infty\}$ be regular and $\alpha$-convex for some $\alpha>0$. Then, $f^{*}$ is $\alpha^{-1}$-smooth.

Proof. By the duality correspondences (including Lemma 9.9), $\operatorname{dom} f^{*}=\mathbb{R}^{d}$ and $f^{*}$ is differentiable everywhere. For two points $y, y^{\prime} \in \mathbb{R}^{d}$, let $x, x^{\prime} \in \mathbb{R}^{d}$ achieve the suprema in the definitions of $f^{*}(y), f^{*}\left(y^{\prime}\right)$ respectively. By Theorem 9.6, $x=\nabla f^{*}(y)$ and $x^{\prime}=\nabla f^{*}\left(y^{\prime}\right)$. Then, by strong convexity of $f-\langle\cdot, y\rangle$,

$$
f\left(x^{\prime}\right)-\left\langle x^{\prime}, y\right\rangle \geq f(x)-\langle x, y\rangle+\frac{\alpha}{2}\left\|x^{\prime}-x\right\|^{2}
$$

Adding this to the analogous inequality with $x$ and $x^{\prime}$ swapped,

$$
\begin{aligned}
\alpha\left\|\nabla f^{*}\left(y^{\prime}\right)-\nabla f^{*}(y)\right\|^{2}=\alpha\left\|x^{\prime}-x\right\|^{2} & \leq\langle x, y\rangle+\left\langle x^{\prime}, y^{\prime}\right\rangle-\left\langle x^{\prime}, y\right\rangle-\left\langle x, y^{\prime}\right\rangle \\
& =\left\langle x^{\prime}-x, y^{\prime}-y\right\rangle
\end{aligned}
$$

Rearranging this after Cauchy-Schwarz proves $\left\|\nabla f^{*}\left(y^{\prime}\right)-\nabla f^{*}(y)\right\| \leq \alpha^{-1}\left\|y^{\prime}-y\right\|$.
Corollary 9.13 (contractivity of the proximal operator). Let $f: \mathbb{R}^{d} \rightarrow \mathbb{R} \cup\{\infty\}$ be $\alpha$-convex. Then, $\operatorname{prox}_{f}$ is $1 /(1+\alpha)$-Lipschitz.

Proof. We can write

$$
\operatorname{prox}_{f}(y):=\underset{x \in \mathbb{R}^{d}}{\arg \min }\left\{f(x)+\frac{1}{2}\|y-x\|^{2}\right\}=-\underset{x \in \mathbb{R}^{d}}{\arg \max }\left\{\langle x, y\rangle-f(x)-\frac{1}{2}\|x\|^{2}\right\}
$$

This shows that - prox $_{f}$ is the gradient of the convex conjugate of the function $f+\frac{1}{2}\|\cdot\|^{2}$, which is $(1+\alpha)$-convex.

For a closed convex set $\mathcal{C}, \Pi_{\mathcal{C}}=\operatorname{prox}_{\chi_{\mathcal{C}}}$, so this corollary recovers Lemma 6.13. It also shows that PPM with an $\alpha$-convex function contracts with rate $1 /(1+\alpha h)$.

## Bibliographical notes

The treatment of classical mechanics is based on [Eva10, §3.3]. Variational principles also lead to an influential perspective on acceleration, see [WWJ16].

The problem of minimizing an action functional can be generalized to the problem of optimal control, and in that context, the corresponding Hamilton-Jacobi equation is known as the Hamilton-Jacobi-Bellman equation. The analogy between dynamic programming and diffusions can be pushed even further to obtain "laws of large numbers" and "central limit theorems" for the former, see $[\mathrm{Bac}+92, § 9.4]$.

The result of Exercise 9.2 is from [Che+22].

## Exercises

Exercise 9.1. Verify the assertions in Example 9.2.
Exercise 9.2. To avoid technical difficulties, assume that $f$ is differentiable everywhere and satisfies (PŁ) with constant $\alpha>0$. The goal of this exercise is to derive the sharp rate of convergence of the PPM in this setting (which turns out to be non-trivial).

For any $x \in \mathbb{R}^{d}$, let $\left(Q_{t}\right)_{t \geq 0}$ denote the Hopf-Lax semigroup and $x_{t}:=\operatorname{prox}_{t f}(x)$. From the Hamilton-Jacobi equation (9.4) or via direct computation, show that $\partial_{t} Q_{t} f(x)= -\left\|x_{t}-x\right\|^{2} /\left(2 t^{2}\right)$. Use this to deduce that

$$
\begin{equation*}
\partial_{t}\left\{Q_{t} f(x)-f_{\star}\right\} \leq-\frac{\alpha}{1+\alpha t}\left\{Q_{t} f(x)-f_{\star}\right\} \tag{9.6}
\end{equation*}
$$

Finally, by adapting Grönwall's lemma (Lemma 2.3), use this to prove the sharp rate

$$
f\left(x_{h}\right)-f_{\star} \leq \frac{f(x)-f_{\star}}{(1+\alpha h)^{2}}
$$

Exercise 9.3. The inequality (9.6) implies that

$$
\begin{equation*}
Q_{h} f(x)-f_{\star} \leq \frac{1}{1+\alpha h}\left(f(x)-f_{\star}\right) \tag{9.7}
\end{equation*}
$$

In this exercise, we give an alternative proof of this fact under the assumption that $f$ is $\alpha$-convex. As a consequence, we also obtain a result for $\alpha=0$.

Write out the definition of $Q_{h} f(x)$ as an infimum, and choose as a test point the interpolant $(1-t) x_{\star}+t x$. Pick $t>0$ to derive (9.7). Also, in the case $\alpha=0$, show that if $f(x)-f_{\star} \leq\left\|x-x_{\star}\right\|^{2} / h$,

$$
Q_{h} f(x)-f_{\star} \leq\left(1-\frac{f(x)-f_{\star}}{2\left\|x-x_{\star}\right\|^{2}} h\right)\left(f(x)-f_{\star}\right)
$$

## 10 Mirror methods

Consider the following situation.

Example 10.1 (optimization in a different norm). Suppose that $f: \mathbb{R}^{d} \rightarrow \mathbb{R} \cup\{\infty\}$ is convex and that we wish to minimize it over the simplex $\Delta_{d}:=\left\{x \in \mathbb{R}_{+}^{d}: \sum_{i=1}^{d} x[i]=1\right\}$. If $f$ is Lipschitz, then we can apply PSD and obtain an $\varepsilon$-approximate solution in $O\left(L^{2} R^{2} / \varepsilon^{2}\right)$ iterations. Here, $L$ is the Lipschitz constant, and $R \leq 2$ is the radius.

For example, suppose that we have $d$ actions and that the loss of the $i$-th action is $\ell[i]$, where the losses are bounded: $|\ell[i]| \leq 1$. If we choose an action randomly according to a probability distribution $x \in \Delta_{d}$, the expected loss is $\langle\ell, x\rangle=: f(x)$. We then seek to minimize the expected loss over $\Delta_{d} .^{\dagger}$ The Lipschitz constant of $f$ is $\|\ell\|$, which could be as large as $\sqrt{d}$ in the worst case; the resulting complexity estimate of $O\left(d / \varepsilon^{2}\right)$ is poor in high dimension.

Implicit in this discussion, however, is that we are measuring the Lipschitz constant and the radius with respect to the usual Euclidean norm. In this setting, however, it may make more sense to use the $\ell_{1}$ norm, in which case the Lipschitz constant is $\|\ell\|_{\infty} \leq 1$.
${ }^{\dagger}$ Trivially, the solution to the optimization problem is given by the distribution which puts all of its mass on $\arg \min _{i \in[d]} \ell[i]$. This problem is simply meant to illustrate the pitfalls of naïvely using the Euclidean norm, but it also forms the basis for the more interesting setting of Example 10.14.

Until now, we have identified points $x$ and gradients $\nabla f(x)$ as part of the same space $\mathbb{R}^{d}$, but this is because of the self-dual nature of the Euclidean norm. Suppose now that $(\mathcal{X},\|\cdot\| \cdot \|)$ is a general (finite-dimensional) normed vector space and $f: \mathcal{X} \rightarrow \mathbb{R} \cup\{\infty\}$. The dual space is ( $X^{*},\|\cdot| |\|_{*}$ ), where $X^{*}$ is the space of linear functionals $\ell: X \rightarrow \mathbb{R}$, equipped
with the dual norm $\|\ell\|_{*}:=\sup \{|\ell(x)|:\|x\| \mid \leq 1\}$. The derivative of $f$ at $x$ is defined to be the linearization at $x$ : if there exists an element $\ell \in \mathcal{X}^{*}$ such that

$$
|f(x+v)-f(x)-\ell(v)|=o(\||v \||) \quad \text { as } v \rightarrow 0
$$

we say that $f$ is differentiable ${ }^{10}$ at $x$ and we write $D f(x)$ for the functional $\ell$. Note that in this formalism, the derivative $D f(x)$ is an element of the dual space.

Above, we wrote $D f(x)$ instead of $\nabla f(x)$ to emphasize that in this context, we should no longer think of $D f(x)$ as belonging to the original space $X$. However, when $X=\mathbb{R}^{d}$, it is still convenient to identify $D f(x)$ as a vector in $\mathbb{R}^{d}$, and we therefore continue to use the notation $\nabla f(x)$. This is fine as long as we remember the following two points:

- It does not make sense to add a point $x \in X$ to a gradient $\nabla f(x) \in X^{*}$.
- The size of $\nabla f(x)$ should be measured in the dual norm $\|\cdot\| \|_{*}$.

In the context of Example 10.1, the dual norm for $\|\cdot\|_{1}$ is the $\ell_{\infty}$ norm $\|\cdot\|_{\infty}$.
Immediately, the first point above rules out GD and PSD as sensible algorithms. A first attempt to remedy this issue is to somehow develop analogues of these algorithms in different norms, but this is seriously complicated by the fact that non-Euclidean norms lack crucial properties, e.g., we cannot "expand the square" as we did in previous proofs.

Instead, the idea of [NY83] is to use the Fenchel-Legendre duality.
Throughout this section, $\phi: \mathbb{R}^{d} \rightarrow \mathbb{R} \cup\{\infty\}$ is a convex function of Legendre type. We refer to it as the mirror map.

The idea is to use the auxiliary function $\phi$ to map the iterate $x_{n}$ into the dual space via $x_{n}^{*}=\nabla \phi\left(x_{n}\right)$. Now that we are in the dual space, it makes sense to take a gradient step: $x_{n+1}^{*}=x_{n}^{*}-h \nabla f\left(x_{n}\right)$. Then, we use $\nabla \phi^{*}$ to return: $x_{n+1}=\nabla \phi^{*}\left(x_{n+1}\right)$. The goal of this section is to formalize this idea and its analysis.

### 10.1 Bregman divergences and relative convexity/smoothness

We introduce a key definition which substitutes for the squared Euclidean norm.
Definition 10.2. Given a function $\phi: \mathbb{R}^{d} \rightarrow \mathbb{R} \cup\{\infty\}$ of Legendre type over $\mathcal{C}_{\phi}$, the corresponding Bregman divergence associated with $\phi$ is the map $D_{\phi}: \mathbb{R}^{d} \times \mathcal{C}_{\phi} \rightarrow \mathbb{R} \cup\{\infty\}$ defined by

$$
D_{\phi}(x, y):=\phi(x)-\phi(y)-\langle\nabla \phi(y), x-y\rangle .
$$

[^9]In words, $D_{\phi}(\cdot, y)$ is defined by subtracting from $\phi$ its linearization at $y$. We can observe the following properties:

- $D_{\phi} \geq 0$ : this is equivalent to the convexity of $\phi$.
- $D_{\phi}$ is convex with respect to its first argument.
- If $\phi$ is twice continuously differentiable, then

$$
\begin{equation*}
D_{\phi}(x, y) \sim \frac{1}{2}\left\langle x-y, \nabla^{2} \phi(y)(x-y)\right\rangle \quad \text { as } x \rightarrow y \tag{10.1}
\end{equation*}
$$

The last property indicates that $D_{\phi}$ should behave as a squared distance between $x$ and $y$. In some respects this is true, e.g., $D_{\phi}$ satisfies a Pythagorean inequality (Exercise 10.1). However, (10.1) is a purely local statement, and a priori there does not seem to be a reason for $D_{\phi}$ to have useful global properties. For example, $D_{\phi}$ is asymmetric, and $\sqrt{D_{\phi}}$ does not in general satisfy a triangle inequality. Nevertheless, it turns out that $D_{\phi}$ is a powerful global measure of progress, which is arguably the greatest surprise of mirror methods.

## Example 10.3 (mirror maps).

1. Let $\phi(x)=\frac{1}{2}\|x\|^{2}$. Then, $\nabla \phi$ is the identity mapping and $D_{\phi}$ is one-half times the squared Euclidean distance. So, our study of mirror methods subsumes the preceding Euclidean methods.
2. Let $\phi(x)=\sum_{i=1}^{d}\{x[i] \log x[i]-x[i]\}$ for $x \in \mathbb{R}_{+}^{d}$. Then, $\nabla \phi(x)=\log x$, where $\log$ is applied coordinate-wise. The associated Bregman divergence is the KullbackLeibler divergence $D_{\phi}(x, y)=\sum_{i=1}^{d}\{x[i] \log (x[i] / y[i])-x[i]+y[i]\}$.
3. Let $\phi(X)=\operatorname{tr}(X \log X-X)$ for $X \succ 0$; this is known as the von Neumann entropy. The associated Bregman divergence is the quantum relative entropy $D_{\phi}(X, Y)=\operatorname{tr}(X(\log X-\log Y)-X+Y)$.

Let us define notions of convexity and smoothness relative to $\phi$.

Definition 10.4. Let $f: \mathbb{R}^{d} \rightarrow \mathbb{R} \cup\{\infty\}$ be differentiable on int dom $f \subseteq \mathcal{C}_{\phi}$.

- We say that $f$ is $\alpha$-convex relative to $\phi$ if $D_{f} \geq \alpha D_{\phi}$.
- We say that $f$ is $\beta$-smooth relative to $\phi$ if $D_{f} \leq \beta D_{\phi}$.

Similarly to §1.2, there are equivalent reformulations of these definitions; see [LFN18, Proposition 1.1] for details.

Proposition 10.5 (relative convexity). For any $\alpha \geq 0$, the following are equivalent.

- $f$ is $\alpha$-convex relative to $\phi$.
- $f-\alpha \phi$ is convex.
- $\langle\nabla f(y)-\nabla f(x), y-x\rangle \geq \alpha\langle\nabla \phi(y)-\nabla \phi(x), y-x\rangle$ for all $x, y \in \operatorname{int} \operatorname{dom} f$.

If $f$ is twice continuously differentiable on $\operatorname{int} \operatorname{dom} f$, the above are also equivalent to:

- $\nabla^{2} f \succeq \alpha \nabla^{2} \phi$ on int $\operatorname{dom} f$.

Proposition 10.6 (relative smoothness). For any $\beta \geq 0$, the following are equivalent.

- $f$ is $\beta$-smooth relative to $\phi$.
- $\beta \phi-f$ is convex.
- $\langle\nabla f(y)-\nabla f(x), y-x\rangle \leq \beta\langle\nabla \phi(y)-\nabla \phi(x), y-x\rangle$ for all $x, y \in \operatorname{int} \operatorname{dom} f$.

If $f$ is twice continuously differentiable on $\operatorname{int} \operatorname{dom} f$, the above are also equivalent to:

- $\nabla^{2} f \leq \beta \nabla^{2} \phi$ on int dom $f$.

For the case of $\phi=\frac{1}{2}\|\cdot\|^{2}$, we recover the usual notions of convexity and smoothness described in §1.2. These relative definitions satisfy similar properties as convexity/smoothness, e.g., if $f_{1}, f_{2}$ are respectively $\alpha_{1}$ - and $\alpha_{2}$-convex relative to $\phi$ and $\lambda_{1}, \lambda_{2}>0$, then $\lambda_{1} f_{1}+\lambda_{2} f_{2}$ is ( $\lambda_{1} \alpha_{1}+\lambda_{2} \alpha_{2}$ )-convex relative to $\phi$. Also, we have a growth bound.

Lemma 10.7 (relative growth). Suppose that $f$ is $\alpha$-convex relative to $\phi$ for some $\alpha>0$, and that $f$ is minimized at an interior point $x_{\star}$ of its domain. Then, for all $x \in \mathbb{R}^{d}$,

$$
f(x)-f_{\star} \geq \alpha D_{\phi}\left(x, x_{\star}\right)
$$

Proof. The left-hand side is $D_{f}\left(x, x_{\star}\right)$.
Other useful properties of Bregman divergences are explored in Exercise 10.1.

### 10.2 Algorithms and convergence analysis

Briefly, let us first consider the continuous-time picture. Since we add the gradient of $f$ in the dual space, the dynamics we consider evolve according to

$$
\begin{equation*}
\partial_{t} \nabla \phi\left(x_{t}\right)=-\nabla f\left(x_{t}\right) \tag{10.2}
\end{equation*}
$$

By the chain rule, this is equivalent to the following evolution in the primal space:

$$
\begin{equation*}
\dot{x}_{t}=-\left[\nabla^{2} \phi\left(x_{t}\right)\right]^{-1} \nabla f\left(x_{t}\right) . \tag{10.3}
\end{equation*}
$$

This can be interpreted as a preconditioned gradient flow.
Despite the fact that (10.2) and (10.3) are equivalent in continuous time, they lead to different discretizations. The discretization of (10.3) is usually called natural gradient descent and it is related to the subject of information geometry [AN00]. In fact, one can view the use of the mirror map $\phi$ as equipping the space $\mathcal{C}_{\phi}$ with a Riemannian metric, namely, a local inner product $\langle u, v\rangle_{x}:=\left\langle u, \nabla^{2} \phi(x) v\right\rangle$. This turns $\mathcal{C}_{\phi}$ into a so-called Hessian manifold. From this perspective, the natural objects are geometric in nature: geodesics, length, curvature, etc.

However, this is not what we consider; mirror descent is obtained from discretization of (10.2) in the dual. This conceptual point is so important that we isolate it into a remark.

Remark 10.8. The key distinguishing feature of mirror methods from preconditioned or Riemannian gradient methods is the existence of the global progress measure given by the Bregman divergence $D_{\phi}$. In contrast, preconditioned/Riemannian gradient methods are purely local in nature.

Now that we have emphasized the conceptual underpinnings of the methods, let us now turn to concrete algorithms. We begin with the smooth case, and we consider the following mirror proximal gradient descent method:

$$
\begin{equation*}
x_{n+1}:=\underset{x \in \mathbb{R}^{d}}{\arg \min }\left\{f\left(x_{n}\right)+\left\langle\nabla f\left(x_{n}\right), x-x_{n}\right\rangle+g(x)+\frac{1}{h} D_{\phi}\left(x, x_{n}\right)\right\} \tag{MPGD}
\end{equation*}
$$

Note that this incorporates the proximal splitting considered in §8, except that we replace $\frac{1}{2}\left\|x-x_{n}\right\|^{2}$ with the more general $D_{\phi}\left(x, x_{n}\right)$. We consider this iteration for the sake of generality, since it encompasses the following algorithms.

- When $g=0$, since $\nabla_{1} D_{\phi}\left(x, x_{n}\right)=\nabla \phi(x)-\nabla \phi\left(x_{n}\right)$, the first-order optimality condition reads

$$
\nabla \phi\left(x_{n+1}\right)=\nabla \phi\left(x_{n}\right)-h \nabla f\left(x_{n}\right) .
$$

This is known as mirror descent.

- When $f=0$, we obtain

$$
x_{n+1}=\underset{x \in \mathbb{R}^{d}}{\arg \min }\left\{g(x)+\frac{1}{h} D_{\phi}\left(x, x_{n}\right)\right\}=: \operatorname{prox}_{h g}^{\phi}\left(x_{n}\right)
$$

which is the mirror proximal point method.

- When $g=\chi \in$, where $\mathcal{C} \subseteq \mathcal{C}_{\phi}$ is a closed convex set,

$$
\begin{aligned}
x_{n+1} & =\underset{x \in \mathcal{C}}{\arg \min }\left\{\left\langle\nabla f\left(x_{n}\right), x-x_{n}\right\rangle+\frac{1}{h}\left(\phi(x)-\left\langle\nabla \phi\left(x_{n}\right), x-x_{n}\right\rangle\right)\right\} \\
& =\underset{x \in \mathcal{C}}{\arg \min }\left\{\phi(x)-\left\langle\nabla \phi\left(x_{n}\right)-h \nabla f\left(x_{n}\right), x-x_{n}\right\rangle\right\} \\
& =\Pi_{\mathcal{C}}^{\phi}\left(\nabla \phi^{*}\left(\nabla \phi\left(x_{n}\right)-h \nabla f\left(x_{n}\right)\right)\right)
\end{aligned}
$$

where $\Pi_{\mathcal{C}}^{\phi}$ is the Bregman projection (see Exercise 10.1). This is the mirror analogue of projected gradient descent.

Theorem 10.9 (convergence of MPGD). Let $f$ be $\alpha_{f}$-convex and $\beta_{f}$-smooth, and let $g$ be $\alpha_{g}$-convex, all relative to $\phi$. Let the step size $h$ satisfy $h \leq 1 / \beta_{f}$, let $x^{+}$denote the next iterate of MPGD started from $x$, and let $y \in \mathbb{R}^{d}$. Then,

$$
\left(1+\alpha_{g} h\right) D_{\phi}\left(y, x^{+}\right) \leq\left(1-\alpha_{f} h\right) D_{\phi}(y, x)-h\left(F\left(x^{+}\right)-F(y)\right)
$$

In particular, if we set $y=x_{\star}$ and iterate, it yields

$$
F\left(x_{N}\right)-F_{\star} \leq \frac{\alpha_{f}+\alpha_{g}}{\lambda_{h}^{-N}-1} D_{\phi}\left(x_{\star}, x_{0}\right)
$$

where $\lambda_{h}:=\left(1-\alpha_{f} h\right) /\left(1+\alpha_{g} h\right)$.

Proof. The proof is patterned upon the proof of Theorem 8.5. Let $\psi_{x}$ denote the objective in (MPGD) starting from $x$ (rather than $x_{n}$ ). Then, $\psi_{x}$ is $\left(\alpha_{g}+1 / h\right)$-convex relative to $\phi$ with minimizer $x^{+}$, so by the growth inequality (Lemma 10.7),

$$
\psi_{x}(y) \geq \psi_{x}\left(x^{+}\right)+\left(\alpha_{g}+\frac{1}{h}\right) D_{\phi}\left(y, x^{+}\right)
$$

On one hand, by $\alpha_{f}$-convexity,

$$
\psi_{x}(y)=f(x)+\langle\nabla f(x), y-x\rangle+g(y)+\frac{1}{h} D_{\phi}(y, x)
$$

$$
=f(y)-D_{f}(y, x)+g(y)+\frac{1}{h} D_{\phi}(y, x) \leq F(y)+\left(\frac{1}{h}-\alpha_{f}\right) D_{\phi}(y, x) .
$$

On the other hand, by $\beta_{f}$-smoothness,

$$
\begin{aligned}
\psi_{x}\left(x^{+}\right) & =f(x)+\left\langle\nabla f(x), x^{+}-x\right\rangle+g\left(x^{+}\right)+\frac{1}{h} D_{\phi}\left(x^{+}, x\right) \\
& =f\left(x^{+}\right)-D_{f}\left(x^{+}, x\right)+g\left(x^{+}\right)+\frac{1}{h} D_{\phi}\left(x^{+}, x\right) \geq F\left(x^{+}\right)+\left(\frac{1}{h}-\beta_{f}\right) D_{\phi}\left(x^{+}, x\right)
\end{aligned}
$$

Drop the term $\left(1 / h-\beta_{f}\right) D_{\phi}\left(x^{+}, x\right)$ and combine the inequalities to prove the one-step bound. If we set $y=x$ in the one-step bound, it yields the descent lemma $F\left(x^{+}\right)-F(x) \leq -h^{-1}\left(1+\alpha_{g} h\right) D_{\phi}\left(x, x^{+}\right) \leq 0$, so we can iterate the one-step bound using the discrete Grönwall lemma (Lemma 3.5).

Although this result is the analogue of the smooth convergence rate for GD (Theorem 3.4), since $\nabla \phi$ necessarily blows up at the boundary $\partial \mathcal{C}_{\phi}$, so can $\nabla f$. Therefore, this theorem actually covers examples in which $f$ is not at all smooth in the usual sense.

To relate this back to Example 10.1, consider convexity/smoothness relative to a norm.

Definition 10.10. A function $f$ is $\alpha$-convex (resp. $\beta$-smooth) relative to a norm $\|\cdot\| \cdot \|$ if for all $x, y \in \operatorname{int} \operatorname{dom} f$,

$$
D_{f}(x, y) \geq \frac{\alpha}{2}\|y-x\|^{2} \quad\left(\text { resp. } D_{f} \leq \frac{\beta}{2}\|y-x\|^{2}\right)
$$

Suppose that $\phi$ is strongly convex relative to a norm $\|\cdot\| \cdot \|$. Then, to check that $f$ is smooth relative to $\phi$, it suffices to check that $f$ is smooth relative to $\|\|\cdot\|\|$, so the norm can act as a useful intermediary. Moreover, whereas the Bregman structure is crucial for carrying out the iterative analysis of MPGD, the norm structure is often convenient too, e.g., for the use of tools such as Cauchy-Schwarz.

To illustrate this, we now consider the non-smooth case. Here, we assume that $f$ is Lipschitz with respect to $|||\cdot|||$ :

$$
|f(x)-f(y)| \leq L\left|\|x-y \mid\| \quad \text { for all } x, y \in \mathcal{C}_{\phi}\right.
$$

We again consider MPGD, except that $\nabla f\left(x_{n}\right)$ should be interpreted as a subgradient; we leave the notation unchanged because it should not cause confusion. The Lipschitz condition is then equivalent to the subgradient bound

$$
\|\nabla f(x)\|_{*} \leq L \quad \text { for all } x \in \mathcal{C}_{\phi}
$$

Theorem 10.11 (convergence of MPGD, non-smooth case). Let $f$ and $g$ be convex, and let $f$ be $L$-Lipschitz with respect to a norm $\left\||\| \cdot| \mid\right.$. Let $\phi$ be $\alpha_{\phi}$-convex relative to $|||\cdot|||$. Then, for MPGD, it holds that

$$
F\left(\frac{1}{N} \sum_{n=1}^{N} x_{n}\right)-F_{\star} \leq \frac{1}{N} \sum_{n=1}^{N}\left(F\left(x_{n}\right)-F_{\star}\right) \leq \frac{D_{\phi}\left(x_{\star}, x_{0}\right)}{N h}+\frac{2 L^{2} h}{\alpha_{\phi}} .
$$

In particular, if $R_{\phi}^{2} \geq D_{\phi}\left(x_{\star}, x_{0}\right)$ and we choose step size $h^{2}=\alpha_{\phi} R_{\phi}^{2} /\left(2 L^{2} N\right)$, then

$$
F\left(\frac{1}{N} \sum_{n=1}^{N} x_{n}\right)-F_{\star} \leq L R_{\phi} \sqrt{\frac{8}{\alpha_{\phi} N}} .
$$

Proof. Following the proof of Theorem 10.9, we still have

$$
\psi_{x}\left(x^{+}\right)+\frac{1}{h} D_{\phi}\left(x_{\star}, x^{+}\right) \leq \psi_{x}\left(x_{\star}\right) \leq F\left(x_{\star}\right)+\frac{1}{h} D_{\phi}\left(x_{\star}, x\right)
$$

In the lower bound for $\psi_{x}\left(x^{+}\right)$, we originally used smoothness to upper bound $D_{f}\left(x^{+}, x\right)$, which is no longer available to us. Instead, by Cauchy-Schwarz,

$$
\begin{aligned}
D_{f}\left(x^{+}, x\right)=f\left(x^{+}\right)-f(x)-\left\langle\nabla f(x), x^{+}-x\right\rangle & \leq L\left\|\mid x^{+}-x\right\|\|+\| \nabla f(x)\| \|_{*}\left\|x^{+}-x\right\| \\
& \leq 2 L\left\|x^{+}-x\right\| \|
\end{aligned}
$$

Thus,

$$
\begin{aligned}
\psi_{x}\left(x^{+}\right)=F\left(x^{+}\right)-D_{f}\left(x^{+}, x\right)+\frac{1}{h} D_{\phi}\left(x^{+}, x\right) & \geq F\left(x^{+}\right)-2 L\left\|x^{+}-x\right\|+\frac{\alpha_{\phi}}{2 h}\left\|x^{+}-x\right\| \|^{2} \\
& \geq F\left(x^{+}\right)-\frac{2 L^{2} h}{\alpha_{\phi}} .
\end{aligned}
$$

This leads to the one-step bound

$$
D_{\phi}\left(x_{\star}, x^{+}\right) \leq D_{\phi}\left(x_{\star}, x\right)-h\left(F\left(x^{+}\right)-F_{\star}\right)+\frac{2 L^{2} h^{2}}{\alpha_{\phi}}
$$

Iterating this inequality finishes the proof.

Example 10.12 (optimization over the simplex). We return to Example 10.1, and we use the entropic mirror map $\phi(x)=\sum_{i=1}^{d}\{x[i] \log x[i]-x[i]\}$. Then, $\phi$ is 1 -convex relative to the $\ell_{1}$-norm $\|\cdot\|_{1}$ over the probability simplex $\Delta_{d}$; this is known as Pinsker's inequality (Exercise 10.3).

To minimize $f: \mathbb{R}^{d} \rightarrow \mathbb{R} \cup\{\infty\}$ over $\Delta_{d}$, we apply MPGD with $g=\chi_{\Delta_{d}}$. Then,

$$
\nabla \phi^{*}\left(\nabla \phi\left(x_{n}\right)-h \nabla f\left(x_{n}\right)\right)=x_{n} \odot \exp \left(-h \nabla f\left(x_{n}\right)\right),
$$

where exp is applied pointwise and $\odot$ is the Hadamard (or pointwise) product. Also, one can check that $\Pi_{\Delta_{d}}^{\phi}(x)=x /\|x\|_{1}$ simply normalizes the vector (Exercise 10.4). Hence, the algorithm reads

$$
x_{n+1}=\frac{x_{n} \odot \exp \left(-h \nabla f\left(x_{n}\right)\right)}{\left\|x_{n} \odot \exp \left(-h \nabla f\left(x_{n}\right)\right)\right\|_{1}}
$$

Consider initializing at the uniform distribution $x_{0}=\mathbf{1}_{d} / d$. Then, for any $x_{\star} \in \Delta_{d}$,

$$
D_{\phi}\left(x_{\star}, x_{0}\right)=\mathrm{KL}\left(x_{\star} \| x_{0}\right)=\log d-\sum_{i=1}^{d} x_{0}[i] \log \frac{1}{x_{0}[i]} \leq \log d
$$

by Jensen's inequality. Consequently, we can take $R_{\phi}=\sqrt{\log d}$, and

$$
f\left(\frac{1}{N} \sum_{n=1}^{N} x_{n}\right)-f_{\star} \leq L_{1} \sqrt{\frac{8 \log d}{N}}
$$

where $L_{1}$ is the Lipschitz constant of $f$ in the $\ell_{1}$ norm. This estimate is far better than the one described in Example 10.1 for the Euclidean norm; we only pay an overhead which is logarithmic in the dimension.

### 10.3 Online algorithms and multiplicative weights

Let us examine the proof of Theorem 10.11 once more. In that proof, we start with

$$
\psi_{x}\left(x^{+}\right)+\frac{1}{h} D_{\phi}\left(y, x^{+}\right) \leq \psi_{x}(y)
$$

which holds for all $y \in \mathbb{R}^{d}$. If we expand out the terms, this is equivalent to

$$
\left\langle\nabla f(x), x^{+}-x\right\rangle+g\left(x^{+}\right)+\frac{1}{h} D_{\phi}\left(x^{+}, x\right)+\frac{1}{h} D_{\phi}\left(y, x^{+}\right)
$$

$$
\leq\langle\nabla f(x), y-x\rangle+g(y)+\frac{1}{h} D_{\phi}(y, x) .
$$

On the left-hand side, if we apply Lipschitzness,

$$
\left\langle\nabla f(x), x^{+}-x\right\rangle+\frac{1}{h} D_{\phi}\left(x^{+}, x\right) \geq-\|\nabla f(x)\|\left\|_{*}\right\| x^{+}-x\| \|+\frac{\alpha_{\phi}}{2 h}\left\|x^{+}-x\right\|^{2} \geq-\frac{L^{2} h}{2 \alpha_{\phi}}
$$

If we now specialize to the case $g=\chi$, then for any $y \in \mathcal{C}$,

$$
\langle\nabla f(x), x-y\rangle \leq \frac{1}{h}\left(D_{\phi}(y, x)-D_{\phi}\left(y, x^{+}\right)\right)+\frac{L^{2} h}{2 \alpha_{\phi}}
$$

Normally, we apply convexity to further lower bound the left-hand side, but let us now refrain from doing so. We make the observation that in the derivation thus far, we have not used any property of $f$; in fact, the same inequality holds even if $\nabla f(x)$ is replaced by an arbitrary vector $p \in \mathbb{R}^{d}$ with bounded dual norm, provided that we redefine the update in MPGD accordingly.

We now define the online version of mirror descent. Let $\mathcal{C} \subseteq \mathcal{C}_{\phi}$ be a closed convex set, and let $\left\{p_{n}\right\}_{n \in \mathbb{N}}$ be an arbitrary sequence of vectors. Define the updates

$$
\begin{equation*}
x_{n+1}:=\underset{x \in \mathcal{C}}{\arg \min }\left\{\left\langle p_{n}, x-x_{n}\right\rangle+\frac{1}{h} D_{\phi}\left(x, x_{n}\right)\right\}=\Pi_{\mathcal{C}}^{\phi}\left(\nabla \phi^{*}\left(\nabla \phi\left(x_{n}\right)-h p_{n}\right)\right) \tag{OMD}
\end{equation*}
$$

We immediately obtain the following theorem.

Theorem 10.13 (regret guarantee for OMD). Let $\mathcal{C} \subseteq \mathcal{C}_{\phi}$ be a closed convex set, let $\phi$ be $\alpha_{\phi}$-convex relative to a norm $\||\cdot|| |$, and suppose that $\left\{p_{n}\right\}_{n=0}^{N-1}$ are bounded in dual norm by $L$, i.e., $\|\left|p_{n}\right|| |_{*} \leq L$ for all $n$. Then, OMD satisfies

$$
\sum_{n=0}^{T-1}\left\langle p_{n}, x_{n}\right\rangle \leq \inf _{y \in \mathcal{C}}\left\{\sum_{n=0}^{T-1}\left\langle p_{n}, y\right\rangle+\frac{D_{\phi}\left(y, x_{0}\right)}{h}\right\}+\frac{L^{2} T h}{2 \alpha_{\phi}}
$$

In particular, if $R_{\phi}^{2} \geq \sup _{y \in \mathcal{C}} D_{\phi}\left(y, x_{0}\right)$ and $h=R_{\phi} \sqrt{2 \alpha_{\phi}} /(L \sqrt{T})$, then

$$
\sum_{n=0}^{T-1}\left\langle p_{n}, x_{n}\right\rangle \leq \inf _{y \in \mathcal{C}} \sum_{n=0}^{T-1}\left\langle p_{n}, y\right\rangle+L R_{\phi} \sqrt{2 T / \alpha_{\phi}}
$$

In the setting of online learning (with full information feedback), at each round $n$, the player must play an action $x_{n}$ belonging to some set $\mathcal{C}$ of actions. An adversary then
chooses a loss function $\ell_{n}$ belonging to some class of losses, the player incurs the loss $\ell_{n}\left(x_{n}\right)$, and the function $\ell_{n}(\cdot)$ is revealed to the player. Thus, the total loss incurred by the player after $T$ rounds is $\sum_{n=0}^{T-1} \ell_{n}\left(x_{n}\right)$. Since the losses are chosen in an adversarial fashion, one cannot hope to compete with a changing benchmark, so the measure of progress is to compare against the best fixed point that one could have played in hindsight, which incurs loss $\inf _{y \in \mathcal{C}} \sum_{n=0}^{T-1} \ell_{n}(y)$. The difference $\sum_{n=0}^{T-1} \ell_{n}\left(x_{n}\right)-\inf _{y \in \mathcal{C}} \sum_{n=0}^{T-1} \ell_{n}(y)$ is called the regret, and the goal is to minimize it. In particular, regret bounds that scale linearly with $T$ are often considered "trivial", whereas regret bounds that scale as $o(T)$ indicate that the algorithm has learned from its past mistakes.

With this context in mind, Theorem 10.13 is a regret guarantee for the OMD algorithm for the linear bandit problem in which the loss functions are linear, $\ell_{n}(\cdot)=\left\langle p_{n}, \cdot\right\rangle$, and the vectors belong to the dual norm ball $\left\{\||\cdot|\|_{*} \leq L\right\}$. This result is already interesting in the Euclidean case $\phi=\frac{1}{2}\|\cdot\|^{2}$, but the simplex setting is of particular interest to its connection with a well-established algorithm.

Example 10.14 (learning from expert advice). On each day $n$, an investor seeks to predict the price of a stock. There are $d$ so-called "experts" who give daily predictions. On the following day, the investor compares their predictions with reality and assigns them losses $\ell_{n}[1], \ldots, \ell_{n}[d] \in[-1,1]$. (For example, we could set $\ell_{n}[i]=+1$ if expert $i$ incorrectly predicted the direction of change of the stock price on day $n$, and $\ell_{n}[i]=-1$ otherwise.) Not all of the experts are necessarily reliable, but some might be. Can we aggregate the expert forecasts and compete with the best of them in hindsight, i.e., incur small regret?

The algorithm maintains a vector $x_{n} \in \Delta_{d}$ in the probability simplex. On each day $n$, the algorithm picks an expert $i_{n} \sim x_{n}$ and trusts the advice of the $i_{n}$-th expert. Note that the expected loss incurred by the algorithm is $\mathbb{E}_{i_{n} \sim x_{n}} \ell_{n}\left[i_{n}\right]=\left\langle\ell_{n}, x_{n}\right\rangle$, where $\ell_{n} \in \mathbb{R}^{d}$ is the vector of losses. (This is the online version of Example 10.1.) The regret is

$$
\sum_{n=0}^{T-1}\left\langle\ell_{n}, x_{n}\right\rangle-\inf _{x \in \Delta_{d}} \sum_{n=0}^{T-1}\left\langle\ell_{n}, x\right\rangle=\sum_{n=0}^{T-1}\left\langle\ell_{n}, x_{n}\right\rangle-\min _{i \in[d]} \sum_{n=0}^{T-1} \ell_{n}[i]
$$

We update the vector $x_{n}$ using OMD with $p_{n}=\ell_{n}$ and the entropic mirror map $\phi$. Note that $\left\|\ell_{n}\right\|_{*}=\left\|\ell_{n}\right\|_{\infty} \leq 1$, and by Example 10.12, we can take $x_{0}=\mathbf{1}_{d} / d$ for which $R_{\phi} \leq \sqrt{\log d}$. Therefore, Theorem 10.13 implies

$$
\operatorname{Regret}_{T}(\mathrm{OMD}) \leq \sqrt{2 T \log d}
$$

The corresponding algorithm, with updates

$$
x_{n+1}=\frac{x_{n} \odot \exp \left(-h \ell_{n}\right)}{\left\|x_{n} \odot \exp \left(-h \ell_{n}\right)\right\|_{1}}
$$

is known as the multiplicative weights algorithm.

## Bibliographical notes

The definitions and usage of relative convexity and smoothness are from [BBT17; LFN18]. An interesting discussion of the various ways to discretize (10.2) and (10.3) can be found in the paper [GWS21]. The example in Exercise 10.7 is taken from [BBT17].

This section provides an introduction to online learning, although it should be noted that many of the interesting questions revolve around the more challenging setting of bandit feedback, i.e., after each round $n$, the player only receives the value $\ell_{n}\left(x_{n}\right)$ of the incurred loss rather than the full loss function $\ell_{n}(\cdot)$. Tackling this setting requires
significant new ideas; see, e.g., [BC12] for an exposition.

## Exercises

## Exercise 10.1.

1. Prove that for all $x, x^{\prime} \in \mathcal{C}_{\phi}, D_{\phi}\left(x, x^{\prime}\right)=D_{\phi^{*}}\left(\nabla \phi\left(x^{\prime}\right), \nabla \phi(x)\right)$.
2. Let $\mathcal{C} \subseteq \mathcal{C}_{\phi}$ be a closed convex set and let $\Pi_{\mathcal{C}}^{\phi}: \mathcal{C}_{\phi} \rightarrow \mathcal{C}$ denote the Bregman projection operator:

$$
\Pi_{\mathcal{C}}^{\phi}(x):=\underset{\mathcal{C}_{\cap} \mathcal{C}_{\phi}}{\arg \min } D_{\phi}(\cdot, x)
$$

Show that $\left\langle\nabla \phi\left(\Pi_{\mathcal{C}}^{\phi}(x)\right)-\nabla \phi(x), \Pi_{\mathcal{C}}^{\phi}(x)-z\right\rangle \leq 0$ for all $z \in \mathcal{C}$. Use this to justify the Pythagorean inequality

$$
D_{\phi}(z, x) \geq D_{\phi}\left(z, \Pi_{\mathcal{C}}^{\phi}(x)\right)+D_{\phi}\left(\Pi_{\mathcal{C}}^{\phi}(x), x\right)
$$

3. Let $X$ be a random variable with $\mathbb{E}|\phi(X)|<\infty$. For any $v \in \mathcal{C}_{\phi}$, establish the identity $\mathbb{E} D_{\phi}(X, v)-\mathbb{E} D_{\phi}(X, \mathbb{E} X)=D_{\phi}(\mathbb{E} X, v)$. From this, deduce that the Bregman barycenter coincides with the usual mean: $\arg \min _{v \in \mathcal{C}_{\phi}} \mathbb{E} D_{\phi}(X, v)=\mathbb{E} X$.

Exercise 10.2. Show that if $\phi$ is $\alpha$-convex relative to a norm $\||\cdot|| |$, then $\phi^{*}$ is $\alpha^{-1}$-smooth relative to the dual norm $\||\cdot|\|_{*}$.

Exercise 10.3. Prove that the entropic mirror map is 1 -convex relative to $\|\cdot\|_{1}$ over the probability simplex $\Delta_{d}$.

Exercise 10.4. For the entropic mirror map $\phi$, prove that the Bregman projection $\Pi_{\Delta_{d}}^{\phi}$ onto the probability simplex simply normalizes the vector: $x \mapsto x /\|x\|_{1}$.

## Exercise 10.5.

1. More generally, show that MPGD can be rewritten as the update

$$
x_{n+1}=\operatorname{prox}_{h g}^{\phi}\left(\nabla \phi^{*}\left(\nabla \phi\left(x_{n}-h \nabla f\left(x_{n}\right)\right)\right)\right) .
$$

2. Consider the mirror map $\phi: x \mapsto-\sum_{i=1}^{d} \log x[i]$, defined over $\mathbb{R}_{+}^{d}$. Compute $\operatorname{prox}_{h\|\cdot\|_{1}}^{\phi}$, the Bregman proximal operator for $\|\cdot\|_{1}$.

Exercise 10.6. Let $\phi$ be a mirror map and assume that $F=f+g$, where $f$ is $\alpha_{f}$-convex and $g$ is $\alpha_{g}$-convex, $\alpha_{f}, \alpha_{g} \geq 0$. Instead of assuming that $f$ is relatively smooth, however, we instead assume that $D_{f} \leq \beta_{f} D_{\phi}^{(1+s) / 2}$ for some $0 \leq s<1$.

Note that when $\phi=\|\cdot\|^{2} / 2$, this corresponds to

$$
f(y)-f(x)-\langle\nabla f(x), y-x\rangle \leq \beta_{f}\left(\frac{\|y-x\|}{2}\right)^{1+s}, \quad \text { for all } x, y \in \mathbb{R}^{d}
$$

The case $s=0$ corresponds to Lipschitz $f$, whereas the case $s \nearrow 1$ corresponds to smooth $f$. The case $0 \leq s<1$ corresponds to partial smoothness (Hölder continuity of $\nabla f$ ).

We consider the update

$$
x^{+}:=\underset{y \in \mathbb{R}^{d}}{\arg \min }\left\{f(x)+\langle\nabla f(x), y-x\rangle+g(y)+\frac{1}{h} D_{\phi}(y, x)\right\}
$$

1. Prove that there is a constant $C_{s}>0$ depending only on $s$ (which you do not need to specify) such that

$$
\left(1+\alpha_{g} h\right) D_{\phi}\left(y, x^{+}\right) \leq\left(1-\alpha_{f} h\right) D_{\phi}(y, x)-h\left(F\left(x^{+}\right)-F(y)\right)+C_{s}\left(\beta_{f} h\right)^{2 /(1-s)} .
$$

2. Suppose that $\alpha_{f}=\alpha_{g}=0$. What iteration complexity does this imply to reach $F\left(\bar{x}_{N}\right)-F_{\star} \leq \varepsilon$, as a function of $\beta_{f}, R:=\sqrt{D_{\phi}\left(x_{\star}, x_{0}\right)}$, s, and $\varepsilon$ ? (Ignore numerical constants depending on $s$.)

Exercise 10.7. Consider the problem of recovering an image $x \in \mathbb{R}_{++}^{d}$ from a noisy observation $y \approx A x$, where $y \in \mathbb{R}_{+}^{n}$ and $A \in \mathbb{R}_{++}^{n \times d}$ is a matrix with positive entries. To solve this problem, we can set up the problem of minimizing

$$
x \mapsto D_{\phi_{\mathrm{ent}}}(y, A x)+\lambda\|x\|_{1}
$$

where $\phi_{\text {ent }}$ is the entropic mirror map. We apply MPGD, using the negative logarithm as a mirror map, i.e., $\phi: x \mapsto-\sum_{i=1}^{d} \log x[i]$. Show that the first term in the objective is relatively convex and smooth, with smoothness constant bounded by $\|y\|_{1}$. Deduce that we can obtain an $\varepsilon$-approximate solution in $O\left(\|y\|_{1} D_{\phi}\left(x_{\star}, x_{0}\right) / \varepsilon\right)$ iterations. Also, write out the algorithm iterates explicitly.

## 11 Alternating minimization

In this section, we study the method of alternating minimization. The goal is to minimize a function $f$ by decomposing the optimization variable $x$ into $D$ variables $x^{1}, \ldots, x^{D}$. In
this decomposition, the individual variables do not have to be one-dimensional, so we let $x^{i} \in \mathbb{R}^{d_{i}}$. The method is defined as follows:

$$
x_{n+1}^{i}:=\underset{x^{i} \in \mathbb{R}^{d_{i}}}{\arg \min } f\left(x_{n+1}^{1}, \ldots, x_{n+1}^{i-1}, x^{i}, x_{n}^{i+1}, \ldots, x_{n}^{D}\right) .
$$

In other words, we iterate through the variables cyclically and minimize $f$ over the $i$-th variable $x^{i}$, holding the other variables fixed. The decomposition is chosen so that it is cheap to compute the minimizer over each individual variable.

Example 11.1 (low-rank matrix recovery). Suppose that we want to recover an unknown matrix $X_{\star} \in \mathbb{R}^{p_{1} \times p_{2}}$ which is observed through noisy observations $y_{i} \approx\left\langle A_{i}, X_{\star}\right\rangle$; here, the matrices $A_{i} \in \mathbb{R}^{p_{1} \times p_{2}}$ are part of the design and are known. If we further posit that $X_{\star}$ is low-rank, say of rank at most $r$, then we aim to solve

$$
\operatorname{minimize}_{X \in \mathbb{R}^{p_{1} \times p_{2}}} \sum_{i=1}^{n}\left(y_{i}-\left\langle A_{i}, X\right\rangle\right)^{2} \quad \text { such that } \quad \operatorname{rank} X \leq r
$$

The rank constraint is difficult to deal with, so we instead factorize the matrix as $X=U V^{\top}$ where $U \in \mathbb{R}^{p_{1} \times r}$ and $V \in \mathbb{R}^{p_{2} \times r}$. This factorization is known as the BurerMonteiro factorization, after [BM03; BM05]. The problem becomes

$$
\operatorname{minimize}_{U \in \mathbb{R}^{p_{1} \times r}, V \in \mathbb{R}^{p_{2} \times r}} \sum_{i=1}^{n}\left(y_{i}-\left\langle A_{i}, U V^{\top}\right\rangle\right)^{2} .
$$

This is a non-convex problem, but at least it is now amenable to gradient-based methods. Alternatively, we can apply alternating minimization. In words, we minimize over $U$ while holding $V$ fixed, and then minimize over $V$ while holding $U$ fixed, and so on. Each iteration corresponds to solving an unconstrained least-squares problem and admits a closed-form solution.

Although we present Example 11.1 as motivation for the design of alternating minimization methods in practice, as usual in these notes, we focus on guarantees in the convex case. Nevertheless, the analysis of the convex case still applies to relevant problems; see the bibliographical notes for examples.

### 11.1 Alternating projections

We can use alternating minimization to find a point in the intersection of two closed convex sets $\mathcal{C}_{1}$ and $\mathcal{C}_{2}$. In this case, we take

$$
f(x, y)=\chi_{e_{1}}(x)+\chi_{e_{2}}(y)+\|y-x\|^{2}
$$

If there exists $x_{\star} \in \mathcal{C}_{1} \cap \mathcal{C}_{2}$, then $\left(x_{\star}, x_{\star}\right)$ is a minimizer for $f$, and the alternating minimization algorithm reads

$$
\begin{aligned}
x_{n+1} & :=\underset{x \in \mathbb{R}^{d}}{\arg \min } f\left(x, y_{n}\right)=\Pi_{\mathcal{C}_{1}}\left(y_{n}\right) \\
y_{n+1} & :=\underset{y \in \mathbb{R}^{d}}{\arg \min } f\left(x_{n+1}, y\right)=\Pi_{\mathcal{C}_{2}}\left(x_{n+1}\right)
\end{aligned}
$$

Thus, we alternate projecting onto $\mathcal{C}_{1}$ and onto $\mathcal{C}_{2}$. This method is quite useful when projections onto $\mathcal{C}_{1}, \mathcal{C}_{2}$ individually are cheap, but the projection onto $\mathcal{C}_{1} \cap \mathcal{C}_{2}$ is expensive. The method easily generalizes to the intersection of more than two convex sets.

As a "warm up", we first study the method of alternating projections. Actually, we consider a generalization to alternating Bregman projections, which is needed for §11.3:

$$
\begin{equation*}
x_{n+1}:=\Pi_{\mathcal{C}_{1}}^{\phi}\left(y_{n}\right), \quad y_{n+1}:=\Pi_{\mathcal{C}_{2}}^{\phi}\left(x_{n+1}\right) \tag{ABP}
\end{equation*}
$$

where $\Pi_{\mathcal{C}}^{\phi}$ is the Bregman projection from Exercise 10.1. We assume that $\mathcal{C}_{1} \cap \mathcal{C}_{2} \neq \varnothing$ and that $\mathrm{C}_{1}, \mathrm{C}_{2} \subseteq \mathrm{C}_{\phi}$.

Lemma 11.2. For any $x_{\star} \in \mathcal{C}_{1} \cap \mathcal{C}_{2}$, the iterates of ABP satisfy

$$
\sum_{n=0}^{\infty}\left\{D_{\phi}\left(x_{n}, y_{n-1}\right)+D_{\phi}\left(y_{n}, x_{n}\right)\right\} \leq D_{\phi}\left(x_{\star}, y_{0}\right)
$$

Also, monotonicity holds:

$$
D_{\phi}\left(x_{\star}, y_{0}\right) \geq D_{\phi}\left(x_{\star}, x_{1}\right) \geq D_{\phi}\left(x_{\star}, y_{1}\right) \geq \cdots
$$

Proof. By the Pythagorean inequality (Exercise 10.1),

$$
D_{\phi}\left(x_{\star}, y_{n}\right) \geq D_{\phi}\left(x_{\star}, \Pi_{\mathcal{C}_{1}}^{\phi}\left(y_{n}\right)\right)+D_{\phi}\left(\Pi_{\mathcal{C}_{1}}^{\phi}\left(y_{n}\right), y_{n}\right)=D_{\phi}\left(x_{\star}, x_{n+1}\right)+D_{\phi}\left(x_{n+1}, y_{n}\right) .
$$

By adding this to a similar inequality for the other projection and summing,

$$
D_{\phi}\left(x_{\star}, y_{0}\right) \geq \sum_{n=1}^{\infty}\left\{D_{\phi}\left(x_{n}, y_{n-1}\right)+D_{\phi}\left(y_{n}, x_{n}\right)\right\}
$$

We can use the preceding lemma to prove a convergence result for ABP . The following corollary relies on two additional technical assumptions for $\phi$ which must be checked, but note that they hold for the Euclidean case $\phi=\frac{\|\cdot\|^{2}}{2}$.

Corollary 11.3 (convergence of ABP). Assume that the following conditions hold:

1. For any $x \in \mathcal{C}_{\phi}$, the sublevel sets of $D_{\phi}(x, \cdot)$ are compact.
2. If $\left\{z_{n}\right\}_{n \in \mathbb{N}},\left\{z_{n}^{\prime}\right\}_{n \in \mathbb{N}} \subseteq \mathcal{C}_{\phi}$ are such that $D_{\phi}\left(z_{n}, z_{n}^{\prime}\right) \rightarrow 0$, then $z_{n}-z_{n}^{\prime} \rightarrow 0$.

Then, the iterates of ABP satisfy $x_{n} \rightarrow x_{\star}$ and $y_{n} \rightarrow x_{\star}$ for some $x_{\star} \in \mathcal{C}_{1} \cap \mathcal{C}_{2}$.

Proof. The first assumption ensures that there is a convergent subsequence $\left\{x_{n_{k}}\right\}_{k \in \mathbb{N}}$ that converges to some $x_{\star} \in \mathcal{C}_{\phi}$. Since $x_{n} \in \mathcal{C}_{1}$ for all $n$ and $\mathcal{C}_{1}$ is closed, then $x_{\star} \in \mathcal{C}_{1}$. Moreover, by Lemma 11.2, $D_{\phi}\left(\Pi_{\mathcal{C}_{2}}^{\phi}\left(x_{n}\right), x_{n}\right)=D_{\phi}\left(y_{n}, x_{n}\right) \rightarrow 0$, so the second property shows that $\Pi_{\mathcal{C}_{2}}^{\phi}\left(x_{n}\right)-x_{n} \rightarrow 0$. Since $\mathcal{C}_{2}$ is closed, $x_{\star} \in \mathcal{C}_{2}$ as well.

To upgrade the subsequential convergence to full convergence, we observe that $D_{\phi}\left(x_{\star}, x_{n_{k}}\right) \rightarrow 0$, whence the monotonicity statement in Lemma 11.2 implies $D_{\phi}\left(x_{\star}, x_{n}\right) \rightarrow$ 0 and $D_{\phi}\left(x_{\star}, y_{n}\right) \rightarrow 0$. By the second assumption, $x_{n} \rightarrow x_{\star}$ and $y_{n} \rightarrow x_{\star}$.

Furthermore, Lemma 11.2 implies

$$
\begin{equation*}
\min _{n=1, \ldots, N}\left\{D_{\phi}\left(x_{n}, y_{n-1}\right)+D_{\phi}\left(y_{n}, x_{n}\right)\right\} \leq \frac{D_{\phi}\left(x_{\star}, y_{0}\right)}{N} . \tag{11.1}
\end{equation*}
$$

This does not, however, imply a rate of convergence for $x_{n}$ to $x_{\star}$. For example, if $\mathfrak{C}_{1}$ and $\mathfrak{C}_{2}$ are two lines that meet each other at a very small angle, then the successive projections can lie very close to each other even though they are both very far from the common point of intersection.

### 11.2 Convergence analysis for alternating minimization

We now return to the alternating minimization method. We use the shorthand $x^{S}$ to denote the components in $S, x^{S}:=\left\{x^{i}\right\}_{i \in S}$, where we abbreviate consecutive indices $\{i, \ldots, j\}$ as $i: j$. We perform an analysis in the smooth case. However, similarly to how gradient-based methods do not suffer from non-smoothness provided that one has access to a proximal oracle, it turns out that coordinate-based methods do not suffer from non-smoothness provided that the non-smooth part respects the coordinate decomposition. Hence, we consider the slightly more general problem of minimizing

$$
F: \mathbb{R}^{d_{1} \times \cdots \times d_{D}} \rightarrow \mathbb{R}, \quad F\left(x^{1: D}\right):=f\left(x^{1: D}\right)+\sum_{i=1}^{D} g_{i}\left(x^{i}\right)
$$

where $f$ is convex and smooth, and each $g_{i}$ is convex. For shorthand, write $g:=\bigoplus_{i=1}^{D} g_{i}$, that is, $g\left(x^{1: D}\right):=\sum_{i=1}^{D} g_{i}\left(x^{i}\right)$. The algorithm reads

$$
\begin{equation*}
x_{n+1}^{i} \in \underset{x^{i} \in \mathbb{R}^{d_{i}}}{\arg \min }\left\{f\left(x_{n+1}^{1: i-1}, x^{i}, x_{n}^{i+1: D}\right)+g_{i}\left(x^{i}\right)\right\} \tag{AM}
\end{equation*}
$$

Theorem 11.4 (convergence of AM). Assume that $f$ is convex and $\beta$-smooth, and that each $g_{i}$ is convex. Then, AM achieves $F\left(x_{N}^{1: D}\right)-F_{\star} \leq \varepsilon$ if

$$
N \geq\left(\log _{1 / 2} \frac{F\left(x_{0}^{1: D}\right)-F_{\star}}{4 \beta D^{2} R^{2}}\right)_{+}+\frac{8 \beta D^{2} R^{2}}{\varepsilon}
$$

where $R:=\sup _{n \in \mathbb{N}}\left\|x_{n}^{1: D}-x_{\star}^{1: D}\right\|$.
Proof. By (3.4),

$$
\begin{gathered}
f\left(x_{n}^{1: D}\right) \geq f\left(x_{n+1}^{1}, x_{n}^{2: D}\right)+\left\langle\nabla_{1} f\left(x_{n+1}^{1}, x_{n}^{2: D}\right), x_{n}^{1}-x_{n+1}^{1}\right\rangle \\
+\frac{1}{2 \beta}\left\|\nabla f\left(x_{n+1}^{1}, x_{n}^{2: D}\right)-\nabla f\left(x_{n}^{1: D}\right)\right\|^{2}
\end{gathered}
$$

On the other hand, since $\nabla_{1} f\left(x_{n+1}^{1}, x_{n}^{2: D}\right) \in-\partial g_{1}\left(x_{n+1}^{1}\right)$,

$$
g_{1}\left(x_{n}^{1}\right)+\left\langle\nabla_{1} f\left(x_{n+1}^{1}, x_{n}^{2: D}\right), x_{n}^{1}-x_{n+1}^{1}\right\rangle \geq g_{1}\left(x_{n+1}^{1}\right)
$$

By summing these two inequalities together with the corresponding ones for the other coordinates, we obtain a "descent lemma"

$$
F\left(x_{n}^{1: D}\right)-F\left(x_{n+1}^{1: D}\right) \geq \frac{1}{2 \beta} \sum_{i=1}^{D}\left\|\nabla f\left(x_{n+1}^{1: i}, x_{n}^{i+1: D}\right)-\nabla f\left(x_{n+1}^{1: i-1}, x_{n}^{i: D}\right)\right\|^{2}
$$

Next,

$$
\begin{aligned}
F\left(x_{n+1}^{1: D}\right)-F_{\star} & \leq\left\langle\nabla f\left(x_{n+1}^{1: D}\right), x_{n+1}^{1: D}-x_{\star}^{1: D}\right\rangle+g\left(x_{n+1}^{1: D}\right)-g\left(x_{\star}^{1: D}\right) \\
& =\sum_{i=1}^{D}\left\{\left\langle\nabla_{i} f\left(x_{n+1}^{1: D}\right), x_{n+1}^{i}-x_{\star}^{i}\right\rangle+g_{i}\left(x_{n+1}^{i}\right)-g_{i}\left(x_{\star}^{i}\right)\right\} \\
& \leq \sum_{i=1}^{D}\left\langle\nabla_{i} f\left(x_{n+1}^{1: D}\right)-\nabla_{i} f\left(x_{n+1}^{1: i}, x_{n}^{i+1: D}\right), x_{n+1}^{i}-x_{\star}^{i}\right\rangle
\end{aligned}
$$

$$
\begin{aligned}
& \leq \sum_{i=1}^{D}\left\|\nabla f\left(x_{n+1}^{1: D}\right)-\nabla f\left(x_{n+1}^{1: i}, x_{n}^{i+1: D}\right)\right\|\left\|x_{n+1}^{i}-x_{\star}^{i}\right\| \\
& \leq \sum_{i=1}^{D}\left(\sum_{j=i}^{D-1}\left\|\nabla f\left(x_{n+1}^{1: j+1}, x_{n}^{j+2: D}\right)-\nabla f\left(x_{n+1}^{1: j}, x_{n}^{j+1: D}\right)\right\|\right)\left\|x_{n+1}^{i}-x_{\star}^{i}\right\| \\
& \leq\left(\sum_{i=0}^{D-1}\left\|\nabla f\left(x_{n+1}^{1: i+1}, x_{n}^{i+2: D}\right)-\nabla f\left(x_{n+1}^{1: i}, x_{n}^{n+1: D}\right)\right\|\right)\left(\sum_{i=1}^{D}\left\|x_{n+1}^{i}-x_{\star}^{i}\right\|\right) \\
& \leq D \sqrt{\left(\sum_{i=0}^{D-1}\left\|\nabla f\left(x_{n+1}^{1: i+1}, x_{n}^{i+2: D}\right)-\nabla f\left(x_{n+1}^{1: i}, x_{n}^{n+1: D}\right)\right\|^{2}\right)\left(\sum_{i=1}^{D}\left\|x_{n+1}^{i}-x_{\star}^{i}\right\|^{2}\right)} \\
& \leq D R \sqrt{\sum_{i=0}^{D-1}\left\|\nabla f\left(x_{n+1}^{1: i+1}, x_{n}^{i+2: D}\right)-\nabla f\left(x_{n+1}^{1: i}, x_{n}^{n+1: D}\right)\right\|^{2}}
\end{aligned}
$$

Combined with the previous inequality, it yields, for $\Delta_{n}:=F\left(x_{n}^{1: D}\right)-F_{\star}$,

$$
\Delta_{n+1}-\Delta_{n} \leq-\frac{1}{2 \beta} \sum_{i=1}^{D}\left\|\nabla f\left(x_{n+1}^{1: i}, x_{n}^{i+1: D}\right)-\nabla f\left(x_{n+1}^{1: i-1}, x_{n}^{i: D}\right)\right\|^{2} \leq-\frac{1}{2 \beta D^{2} R^{2}} \Delta_{n+1}^{2}
$$

If $\Delta_{n+1} \geq \Delta_{n} / 2$, this yields $\Delta_{n+1}-\Delta_{n} \leq-\Delta_{n}^{2} /\left(8 \beta D^{2} R^{2}\right)$, so in general

$$
\Delta_{n+1} \leq \max \left\{\frac{1}{2},\left(1-\frac{\Delta_{n}}{8 \beta D^{2} R^{2}}\right)\right\} \Delta_{n}
$$

This implies that the error decays exponentially fast until iteration $n_{0}$ which satisfies $\Delta_{n_{0}} \leq 4 \beta D^{2} R^{2}$. Thereafter,

$$
\frac{1}{\Delta_{n}}-\frac{1}{\Delta_{n+1}}=\frac{\Delta_{n+1}-\Delta_{n}}{\Delta_{n} \Delta_{n+1}} \leq-\frac{1}{8 \beta D^{2} R^{2}}
$$

which yields

$$
\Delta_{N} \leq \frac{8 \beta D^{2} R^{2} \Delta_{n_{0}}}{8 \beta D^{2} R^{2}+\left(N-n_{0}\right) \Delta_{n_{0}}} \leq \frac{8 \beta D^{2} R^{2}}{N-n_{0}}
$$

Although Theorem 11.4 provides a convergence guarantee for AM, it incurs a poor dependence on the number of blocks $D$-the complexity scales as $D^{3}$. It turns out that this
can be alleviated by randomly choosing a block at each iteration. More precisely, define the following randomized alternating minimization algorithm:

$$
x_{n+1}:=\underset{x^{i(n)} \in \mathbb{R}^{d_{i(n)}}}{\arg \min }\left\{f\left(x_{n}^{1: i(n)-1}, x^{i(n)}, x_{n}^{i(n)+1: D}\right)+g_{i(n)}\left(x^{i(n)}\right)\right\}, \quad i(n) \sim \text { uniform }([D])
$$

(RAM)
The analysis below also handles anisotropic smoothness: we assume that for each $i$,

$$
f\left(x^{1: i-1}, \cdot, x^{i+1: D}\right) \text { is } \beta_{i} \text {-smooth for each } x^{1: D} \in \mathbb{R}^{d_{1} \times \cdots \times d_{D}} .
$$

We refer to this condition succinctly by saying that $f$ is $\boldsymbol{\beta}$-smooth, where $\boldsymbol{\beta}=\left(\beta_{1}, \ldots, \beta_{D}\right)$. It induces the norm

$$
\left\|x^{1: D}\right\|_{\beta}:=\left(\sum_{i=1}^{D} \beta_{i}\left\|x^{i}\right\|^{2}\right)^{1 / 2}
$$

Theorem 11.5 (convergence of RAM). Assume that $f$ is $\boldsymbol{\beta}$-smooth and $\alpha_{f}$-convex w.r.t. $\|\cdot\|_{\beta}$. Also, assume that $g$ is $\alpha_{g}$-convex w.r.t. $\|\cdot\|_{\beta}$. Then, the iterates of RAM satisfy the following bounds. If $\alpha_{f}+\alpha_{g}>0$, then

$$
\mathbb{E} F\left(x_{N}^{1: D}\right)-F_{\star} \leq\left(1-\frac{\alpha_{f}+\alpha_{g}}{\left(1+\alpha_{g}\right) D}\right)^{N}\left(F\left(x_{0}^{1: D}\right)-F_{\star}\right)
$$

Otherwise, if $\alpha_{f}+\alpha_{g}=0$, then

$$
\mathbb{E} F\left(x_{N}^{1: D}\right)-F_{\star} \leq \frac{2 D R_{\beta}^{2}}{N}
$$

where $R_{\boldsymbol{\beta}} \geq \sup _{n \in \mathbb{N}} \max \left\{\sqrt{F\left(x_{n}^{1: D}\right)-F_{\star}},\left\|x_{n}^{1: D}-x_{\star}^{1: D}\right\|_{\boldsymbol{\beta}}\right\}$ almost surely.

Before proving the theorem, let us compare the computational costs implied by these various results in the weakly convex case. Suppose, for the sake of argument, that computing a full gradient $\nabla f$ is $O(D)$. If the proximal oracle for $g$ is available, we can run PGD to obtain an $\varepsilon$-solution at cost $O\left(\beta D R^{2} / \varepsilon\right)$. On the other hand, each iteration of AM requires minimization with respect to one of the variables, leading to a total cost of roughly $O\left(\beta D^{3} R^{2} / \varepsilon\right)$, assuming that minimization over one variable is comparable in cost to computing a partial gradient.

For RAM, let $\beta_{\text {max }}:=\max _{i \in[D]} \beta_{i}$. The overall smoothness of $f$ satisfies $\beta_{\text {max }} \leq \beta \leq \sum_{i=1}^{D} \beta_{i} \leq D \beta_{\text {max }}$ and, ignoring the first term in the definition of $R_{\boldsymbol{\beta}}, R_{\boldsymbol{\beta}}^{2} \leq \beta_{\text {max }} R^{2}$. ${ }^{11}$ The cost for RAM is therefore $O\left(\beta_{\text {max }} D R^{2} / \varepsilon\right)$, which is "never worse" than the rate for PGD, but could be substantially better when $\beta$ is closer to the upper bound $D \beta_{\text {max }}$. This is the case when the directions of high smoothness are not aligned with the coordinate directions (e.g., imagine that the Hessian matrix looks like the all-ones matrix). Thus, RAM can "adapt" to directional smoothness, which is particularly appealing since RAM has no tuning parameters (not even a step size!).

Proof of Theorem 11.5. Let $y^{1: D} \in \mathbb{R}^{d_{1} \times \cdots \times d_{D}}$ and let $\mathbb{E}_{n}$ denote the expectation over $i(n)$ only. Then,

$$
\begin{aligned}
\mathbb{E}_{n} F\left(x_{n+1}^{1: D}\right) \leq & \mathbb{E}_{n} F\left(x_{n}^{1: i(n)-1}, y^{i(n)}, x_{n}^{i(n)+1: D}\right) \\
\leq & \mathbb{E}_{n}\left[f\left(x_{n}^{1: D}\right)+\left\langle\nabla_{i(n)} f\left(x_{n}^{1: D}\right), y^{i(n)}-x_{n}^{i(n)}\right\rangle+\frac{\beta_{i(n)}}{2}\left\|y^{i(n)}-x_{n}^{i(n)}\right\|^{2}\right] \\
& \quad+\mathbb{E}_{n}\left[\sum_{i \neq i(n)} g_{i}\left(x_{n}^{i}\right)+g_{i(n)}\left(y^{i(n)}\right)\right] \\
= & f\left(x_{n}^{1: D}\right)+\frac{1}{D}\left\langle\nabla f\left(x_{n}^{1: D}\right), y^{1: D}-x_{n}^{1: D}\right\rangle+\frac{1}{2 D}\left\|y^{1: D}-x_{n}^{1: D}\right\|_{\beta}^{2} \\
& \quad+\frac{D-1}{D} g\left(x_{n}^{1: D}\right)+\frac{1}{D} g\left(y^{1: D}\right) \\
\leq & \frac{D-1}{D} f\left(x_{n}^{1: D}\right)+\frac{1}{D} f\left(y^{1: D}\right)+\frac{1-\alpha_{f}}{2 D}\left\|y^{1: D}-x_{n}^{1: D}\right\|_{\beta}^{2} \\
& \quad+\frac{D-1}{D} g\left(x_{n}^{1: D}\right)+\frac{1}{D} g\left(y^{1: D}\right) .
\end{aligned}
$$

By taking the infimum over $y^{1: D}$, we have shown that

$$
\mathbb{E}_{n} F\left(x_{n+1}^{1: D}\right) \leq \frac{D-1}{D} F\left(x_{n}^{1: D}\right)+\frac{1}{D} Q_{1 /\left(1-\alpha_{f}\right)} F\left(x_{n}^{1: D}\right)
$$

where $\left(Q_{t}\right)_{t \geq 0}$ denotes the Hopf-Lax semigroup (Definition 9.3) with respect to $\|\cdot\|_{\boldsymbol{\beta}}$. By Exercise 9.3, we have

$$
\frac{Q_{1 /\left(1-\alpha_{f}\right)} F\left(x_{n}^{1: D}\right)-F_{\star}}{F\left(x_{n}^{1: D}\right)-F_{\star}} \leq \begin{cases}\left(1-\alpha_{f}\right) /\left(1+\alpha_{g}\right), & \text { if } \alpha_{f}+\alpha_{g}>0 \\ 1-\left(F\left(x_{n}^{1: D}\right)-F_{\star}\right) /\left(2 R_{\beta}^{2}\right), & \text { if } \alpha_{f}+\alpha_{g}=0\end{cases}
$$

[^10]By taking the expectation again, in the first case it yields

$$
\mathbb{E} F\left(x_{n+1}^{1: D}\right)-F_{\star} \leq\left(1-\frac{\alpha_{f}+\alpha_{g}}{\left(1+\alpha_{g}\right) D}\right)\left\{\mathbb{E} F\left(x_{n}^{1: D}\right)-F_{\star}\right\},
$$

and in the second case, by Jensen's inequality,

$$
\begin{aligned}
\mathbb{E} F\left(x_{n+1}^{1: D}\right)-F_{\star} & \leq \mathbb{E}\left[\left(1-\frac{F\left(x_{n}^{1: D}\right)-F_{\star}}{2 D R_{\beta}^{2}}\right)\left\{F\left(x_{n}^{1: D}\right)-F_{\star}\right\}\right] \\
& \leq\left(1-\frac{\mathbb{E} F\left(x_{n}^{1: D}\right)-F_{\star}}{2 D R_{\beta}^{2}}\right)\left\{\mathbb{E} F\left(x_{n}^{1: D}\right)-F_{\star}\right\}
\end{aligned}
$$

The results follow by iterating these inequalities.

### 11.3 Case study: entropic optimal transport

As a case study, we apply these ideas to a concrete problem of modern interest. Namely, over the past decade, there has been considerable interest in applications of optimal transport to machine learning, among other domains. In this problem, we are given two probability distributions $\mu, v$ over spaces $\mathcal{X}$ and $y$ respectively, as well as a cost function $c: X \times Y \rightarrow \mathbb{R}$. In this section, we focus on the case where $X, y$ are finite sets, although the ideas presented here readily generalize. The optimal transport cost between $\mu$ and $v$ with cost $c$ is

$$
\mathrm{OT}(\mu, v):=\inf \{\mathbb{E} c(X, Y): X \sim \mu, Y \sim v\}
$$

where the infimum is taken over all couplings ( $X, Y$ ), i.e., jointly defined random variables with marginal laws $\mu$ and $v$ respectively. A particularly common choice is the Euclidean cost, $c(x, y)=\|y-x\|^{2}$, but other choices are common too. Since the structure of the cost does not play any role here, we leave it general.

Focus on the case where $\mathcal{X}, y$ are finite sets. If we write $\gamma$ for the joint distribution of $(X, Y)$, the optimal transport problem can be written

$$
\underset{\gamma \in \mathbb{R}_{+}^{X \times y}}{\operatorname{minimize}} \quad \sum_{x \in \mathcal{X}, y \in \mathcal{Y}} c_{x, y} \gamma_{x, y} \quad \text { such that } \quad\left\{\begin{array}{l}
\sum_{y \in \mathcal{Y}} \gamma_{x, y}=\mu_{x} \text { for all } x \in \mathcal{X}, \\
\sum_{x \in \mathcal{X}} \gamma_{x, y}=v_{y} \text { for all } y \in \mathcal{Y} .
\end{array}\right.
$$

More compactly, if we write $C=\left(c_{x, y}\right)_{x \in \mathcal{X}, y \in \mathcal{Y}}$ for the cost matrix and $\mathbf{1}_{x}, \mathbf{1}_{y}$ for the all-ones vectors on $X$ and on $y$ respectively, this can be written

$$
\underset{\gamma \in \mathbb{R}_{+}^{x \times y}}{\operatorname{minimize}} \quad\langle C, \gamma\rangle \quad \text { such that } \quad\left\{\begin{array}{l}
\gamma 1 y=\mu \\
\gamma^{\top} 1 x=v
\end{array}\right.
$$

This is readily recognized as a linear program, but solving it as such is expensive. There are specialized combinatorial algorithms-see [PC19]-but the computational cost scales at least as $d^{3}$ if $d=|X|=|Y|$ (for simplicity, the input dimensions are the same).

On the other hand, the size of the input matrix $C$ is $d^{2}$, and optimistically we ask if we can solve the problem in $\widetilde{O}\left(d^{2}\right)$ time-that is, nearly linear time in the size of the input. We shall see that this is the case, provided that we add some entropic regularization to the problem, as popularized in machine learning by Cuturi [Cut13].

Given a regularization parameter $\varepsilon_{\text {reg }}>0$, the goal is to instead solve

$$
\underset{\gamma \in \mathbb{R}_{+}^{X \times y}}{\operatorname{minimize}} \quad\langle C, \gamma\rangle+\varepsilon_{\mathrm{reg}} \mathrm{KL}(\gamma \| \mu \otimes v) \quad \text { such that } \quad\left\{\begin{array}{l}
\gamma \mathbf{1}_{y}=\mu  \tag{11.2}\\
\gamma^{\top} \mathbf{1}_{x}=v
\end{array}\right.
$$

Call the value of this problem $\mathrm{OT}_{\varepsilon_{\text {reg }}}(\mu, v)$. Why does this make the problem so much easier to solve? The answer is that by Kantorovich duality, the dual to the unregularized problem turns out to be

$$
\underset{f \in \mathbb{R}^{x}, g \in \mathbb{R}^{y}}{\operatorname{maximize}} \quad \sum_{x \in \mathcal{X}} f_{x} \mu_{x}+\sum_{y \in \mathcal{Y}} g_{y} v_{y} \quad \text { such that } \quad f_{x}+g_{y} \leq c_{x, y} \text { for all } x \in \mathcal{X}, y \in y
$$

which is still a constrained problem. On the other hand, the dual to the regularized problem is unconstrained.

Theorem 11.6 (EOT duality). Consider the following dual problem:

$$
\begin{equation*}
\operatorname{maximize}_{f \in \mathbb{R}^{X}, g \in \mathbb{R}^{y}} \sum_{x \in \mathcal{X}} f_{x} \mu_{x}+\sum_{y \in \mathcal{Y}} g_{y} v_{y}-\varepsilon_{\mathrm{reg}}\left(\sum_{x \in \mathcal{X}, y \in \mathcal{Y}} \exp \left(\frac{f_{x}+g_{y}-c_{x, y}}{\varepsilon_{\mathrm{reg}}}\right) \mu_{x} v_{y}-1\right) \tag{11.3}
\end{equation*}
$$

Let $f^{\star}, g^{\star}$ solve the dual problem. Then, $\gamma^{\star}$ defined by

$$
\begin{equation*}
\gamma_{x, y}^{\star}:=\exp \left(\frac{f_{x}^{\star}+g_{y}^{\star}-c_{x, y}}{\varepsilon_{\mathrm{reg}}}\right) \mu_{x} v_{y} \tag{11.4}
\end{equation*}
$$

is the unique solution to the entropic optimal transport problem.
Moreover, $\gamma^{\star}$ is characterized as the unique distribution of the form (11.4) for some $f^{\star}, g^{\star}$ with the correct marginals.

For a proof, see, e.g., [CNR25, Proposition 4.3], although in this discrete setting it can be proven via Lagrange multipliers (Exercise 11.3).

By replacing $c_{x, y}$ with $c_{x, y} / \varepsilon_{\text {reg }}$ and rescaling $f_{x}, g_{y}$ accordingly, we may set $\varepsilon_{\text {reg }}=1$ without loss of generality, so we adopt this convention henceforth.

Let $\mathfrak{D}(f, g)$ denote the dual functional, i.e., the objective of (11.3). Since the dual is unconstrained, we propose to solve it by alternating maximization. Namely, given iterates $f^{n}, g^{n}$, we set

$$
f^{n+1}:=\underset{f \in \mathbb{R}^{x}}{\arg \max } \mathcal{D}\left(f, g^{n}\right), \quad g^{n+1}:=\underset{g \in \mathbb{R}^{y}}{\arg \max } \mathcal{D}\left(f^{n+1}, g\right)
$$

By solving for the first-order conditions, the updates can be written explicitly:

$$
\begin{equation*}
f_{x}^{n+1}=-\log \sum_{y \in \mathcal{Y}} \exp \left(g_{y}^{n}-c_{x, y}\right) v_{y}, \quad g_{y}^{n+1}=-\log \sum_{x \in \mathcal{X}} \exp \left(f_{x}^{n+1}-c_{x, y}\right) \mu_{x} \tag{11.5}
\end{equation*}
$$

At this point, one can try to apply Theorem 11.4, but the correct geometry for this problem is not Euclidean.

Instead, consider what happens to the matrices

$$
\gamma_{x, y}^{n}:=\exp \left(f_{x}^{n}+g_{y}^{n}-c_{x, y}\right) \mu_{x} v_{y}, \quad \gamma_{x, y}^{n+1 / 2}:=\exp \left(f_{x}^{n+1}+g_{y}^{n}-c_{x, y}\right) \mu_{x} v_{y}
$$

Performing the update $f^{n} \mapsto f^{n+1}$ implicitly performs the update $\gamma^{n} \mapsto \gamma^{n+1 / 2}$. The $X$-marginal of $\gamma^{n+1 / 2}$ is computed as follows:

$$
\sum_{y \in \mathcal{Y}} \gamma_{x, y}^{n+1 / 2}=\mu_{x} \sum_{x \in \mathcal{X}} \exp \left(f_{x}^{n+1}+g_{y}^{n}-c_{x, y}\right) v_{y}=\mu_{x}
$$

by (11.5). Thus, $\gamma^{n+1 / 2}$ has the correct $X$-marginal $\mu$, although its $y$-marginal may not be correct. In fact, one can see that $\gamma^{n+1 / 2}$ is obtained from $\gamma^{n}$ by normalizing its rows to fix its $\mathcal{X}$-marginal. Similarly, the update $g^{n} \mapsto g^{n+1}$ implicitly performs the update $\gamma^{n+1 / 2} \mapsto \gamma^{n+1}$, and $\gamma^{n+1}$ has the correct $y$-marginal $v$. In this form, this is known as Sinkhorn's matrix scaling algorithm [Sin64]. In words, Sinkhorn's algorithm iteratively "fixes the rows, and then fixes the columns, and then fixes the rows…".

We can therefore identify Sinkhorn's algorithm as an instance of alternating Bregman projections. Indeed, we define the constraint sets

$$
\mathcal{C}^{\mu}:=\left\{\gamma \in \mathbb{R}_{+}^{x \times y}: \gamma \mathbf{1} y=\mu\right\}, \quad \mathcal{C}_{v}:=\left\{\gamma \in \mathbb{R}_{+}^{x \times y}: \gamma^{\top} \mathbf{1} x=v\right\}
$$

and we let $\phi: \gamma \mapsto \sum_{x \in \mathcal{X}, y \in \mathcal{Y}}\left(\gamma_{x, y} \log \gamma_{x, y}-\gamma_{x, y}\right)$ denote the entropic mirror map, then similarly to Exercise 10.4 one can show that the Bregman projections onto $\mathcal{C}^{\mu}$ and $\mathcal{C}_{v}$ normalize the rows and columns respectively. This yields

$$
\gamma^{n+1 / 2}=\Pi_{\mathcal{C}_{\mu}}^{\phi}\left(\gamma^{n}\right), \quad \gamma^{n+1}=\Pi_{\mathcal{C}_{v}}^{\phi}\left(\gamma^{n+1 / 2}\right)
$$

From this perspective, Sinkhorn's algorithm aims to find a point in the intersection $\mathcal{C}^{\mu} \cap \mathcal{C}_{\nu}$. Does this mean that the intersection is a singleton, which is the solution to the entropic optimal transport problem? No! Note that the intersection $\mathcal{C}^{\mu} \cap \mathcal{C}_{v}$ only encodes the constraints of the original problem, not the objective which depends on the cost function $c$. In fact, by Theorem 11.6, different choices of $c$ give rise to different entropic optimal couplings, so $\mathcal{C}^{\mu} \cap \mathcal{C}_{v}$ is certainly not a singleton.

What is true, however, is that if $\Gamma_{c}$ denotes the set of joint distributions of the form (11.4), then the unique element of $\mathcal{C}^{\mu} \cap \mathcal{C}_{v} \cap \Gamma_{c}$ solves the entropic optimal transport problem. This is the last statement of Theorem 11.6. Moreover, Sinkhorn's algorithm maintains the property that if we initialize at an element of $\Gamma_{c}$, e.g., by taking $f^{0}=g^{0}=0$, then the algorithm iterates all remain in $\Gamma_{c}$. So, remarkably, the alternating Bregman projections do indeed solve our problem.

Let us now see what Lemma 11.2 implies for Sinkhorn's algorithm. In the following, we assume that we initialize at a probability distribution $\gamma^{0} \in \Gamma_{c}$, e.g., we can take

$$
\gamma^{0}=\frac{\exp (-c)(\mu \otimes v)}{\|\exp (-c)(\mu \otimes v)\|_{1}}
$$

Theorem 11.7 (convergence of Sinkhorn's algorithm). Initialize Sinkhorn's algorithm at a probability distribution $\gamma^{0} \in \Gamma_{c}$. Suppose that the number of iterations $N$ satisfies

$$
N \geq \frac{2 \mathrm{KL}\left(\gamma^{\star} \| \gamma^{0}\right)}{\varepsilon^{2}}
$$

Then, there exists an iteration $n \in\{0,1, \ldots, N-1\}$ and $\hat{\gamma} \in\left\{\gamma^{n}, \gamma^{n+1 / 2}\right\}$ such that if $\hat{\mu}, \hat{v}$ denote the marginals of $\hat{\gamma}$, then

$$
\|\hat{\mu}-\mu\|_{1}+\|\hat{v}-v\|_{1} \leq \varepsilon
$$

Proof. By (11.1), we know that

$$
\min _{n=0,1, \ldots, N-1}\left\{\mathrm{KL}\left(\gamma^{n+1 / 2} \| \gamma^{n}\right)+\mathrm{KL}\left(\gamma^{n+1} \| \gamma^{n+1 / 2}\right)\right\} \leq \frac{\mathrm{KL}\left(\gamma^{\star} \| \gamma^{0}\right)}{N} .
$$

Let $\mu^{n}$ denote the $\mathfrak{X}$-marginal of $\gamma^{n}$ :

$$
\mu_{x}^{n}=\sum_{y \in \mathcal{Y}} \gamma_{x, y}^{n}=\mu_{x} \exp \left(f_{x}^{n}\right) \sum_{y \in \mathcal{Y}} \exp \left(g_{y}^{n}-c_{x, y}\right) v_{y}=\mu_{x} \exp \left(f_{x}^{n}-f_{x}^{n+1}\right)
$$

Therefore, since the $X$-marginal of $\gamma^{n+1 / 2}$ is $\mu$,

$$
\begin{aligned}
\mathrm{KL}\left(\gamma^{n+1 / 2} \| \gamma^{n}\right) & =\sum_{x \in \mathcal{X}, y \in \mathcal{Y}} \gamma_{x, y}^{n+1 / 2} \log \frac{\exp \left(f_{x}^{n+1}+g_{y}^{n}-c_{x, y}\right)}{\exp \left(f_{x}^{n}+g_{y}^{n}-c_{x, y}\right)}=\sum_{x \in \mathcal{X}, y \in \mathcal{Y}} \gamma_{x, y}^{n+1 / 2}\left(f_{x}^{n+1}-f_{x}^{n}\right) \\
& =\sum_{x \in \mathcal{X}} \mu_{x}\left(f_{x}^{n+1}-f_{x}^{n}\right)=\sum_{x \in \mathcal{X}} \mu_{x} \log \frac{\mu_{x}}{\mu_{x}^{n}}=\mathrm{KL}\left(\mu \| \mu^{n}\right) \geq \frac{1}{2}\left\|\mu^{n}-\mu\right\|_{1}^{2}
\end{aligned}
$$

where the last inequality is Pinsker's inequality. The result follows.
However, this is not the last word on Sinkhorn's algorithm. For instance, it does not provide convergence of the last iterate. It turns out that Sinkhorn's algorithm admits a third interpretation: as an instantiation of mirror descent (Exercise 11.4). Using this, one can prove the following theorem.

Theorem 11.8 (convergence of Sinkhorn's algorithm, II). Initialize Sinkhorn's algorithm at a probability distribution $\gamma^{0} \in \Gamma_{c}$. Then, if $\mu^{N}$ denotes the $X$-marginal of $\gamma^{N}$,

$$
\mathrm{KL}\left(\mu^{N} \| \mu\right) \leq \frac{\mathrm{KL}\left(\gamma^{\star} \| \gamma^{0}\right)}{N} .
$$

## Bibliographical notes

The analysis of alternating minimization has recently inspired analyses of the coordinate ascent variational inference (CAVI) algorithm [AL24; LZ24], the expectation maximization (EM) algorithm [CJ25], and Gibbs sampling [ALZ24]. The proof of Theorem 11.5 is also taken from [LZ24].

For an introduction to optimal transport for statisticians, see [CNR25]. Other treatments of optimal transport, aimed at more mathematical audiences, include [Vil03; Vil09; San15]. The literature on (entropic) optimal transport is vast, so we only mention a few relevant references: the proof of Theorem 11.7 is similar in spirit to [ANR17]; Sinkhorn's algorithm as interpreted as mirror descent in [Lég21]; and the interpretation in Exercise 11.4 is from [AKL22].

## Exercises

Exercise 11.1. Here, we present a simple convergence analysis of alternating minimization in the case where there are only two blocks, $f$ satisfies (PŁ) with constant $\alpha$ and is $\beta$ smooth, and $g=0$.

For any $h>0$, by definition of alternating minimization,

$$
f\left(x_{n+1}^{1}, x_{n}^{2}\right) \leq f\left(x_{n}^{1}-h \nabla_{1} f\left(x_{n}^{1}, x_{n}^{2}\right), x_{n}^{2}\right)
$$

Apply the descent lemma for GD (Lemma 3.1), the fact that $\nabla_{2} f\left(x_{n}^{1}, x_{n}^{2}\right)=0$ (why?), and the PŁ inequality to deduce a one-step inequality $f\left(x_{n+1}^{1}, x_{n}^{2}\right)-f_{\star} \leq(1-\alpha / \beta)\left(f\left(x_{n}^{1}, x_{n}^{2}\right)-f_{\star}\right)$. Deduce that

$$
f\left(x_{N}^{1}, x_{N}^{2}\right)-f_{\star} \leq\left(1-\frac{\alpha}{\beta}\right)^{2 N}\left(f\left(x_{0}^{1}, x_{0}^{2}\right)-f_{\star}\right)
$$

Exercise 11.2. Consider coordinate descent with the Gauss-Southwell rule:

$$
x_{n+1}:=x_{n}-h \nabla_{i_{n}} f\left(x_{n}\right) e_{i_{n}}, \quad i_{n}=\underset{i \in[d]}{\arg \max }\left|\nabla_{i} f\left(x_{n}\right)\right|
$$

This is a "greedy" version of coordinate descent.

1. Show that

$$
x_{n+1}=\underset{x \in \mathbb{R}^{d}}{\arg \min }\left\{f\left(x_{n}\right)+\left\langle\nabla f\left(x_{n}\right), x-x_{n}\right\rangle+\frac{1}{2 h}\left\|x-x_{n}\right\|_{1}^{2}\right\}
$$

2. Therefore, argue that if $f$ is smooth in the $\ell_{1}$-norm,

$$
f(y) \leq f(x)+\langle\nabla f(x), y-x\rangle+\frac{\beta}{2}\|y-x\|_{1}^{2}
$$

then for $h=1 / \beta$ we have the descent lemma

$$
f\left(x_{n+1}\right) \leq f\left(x_{n}\right)-\frac{1}{2 \beta}\left\|\nabla f\left(x_{n}\right)\right\|_{\infty}^{2}
$$

3. If $f$ satisfies a PL inequality in the $\ell^{1}$-norm,

$$
\|\nabla f(x)\|_{\infty}^{2} \geq 2 \alpha\left(f(x)-f_{\star}\right), \quad \text { for all } x \in \mathbb{R}^{d}
$$

then for $\kappa=\beta / \alpha$,

$$
f\left(x_{N}\right)-f_{\star} \leq\left(1-\frac{1}{\kappa}\right)^{N}\left(f\left(x_{0}\right)-f_{\star}\right)
$$

The moral of the story is that coordinate methods operate in the $\ell_{1}$ geometry.

## Exercise 11.3.

1. Setting $\varepsilon_{\text {reg }}=1$ in (11.2), show that the objective is equivalent to minimizing $\gamma \mapsto \mathrm{KL}\left(\gamma \| \gamma^{0}\right)$, where $\gamma_{x, y}^{0}=\mu_{x} v_{y} \exp \left(-c_{x, y}\right)$.
2. Introduce two Lagrange multipliers $\kappa, \lambda \in \mathbb{R}$ and argue that (11.2) is equivalent to

$$
\min _{\gamma \in \mathbb{R}_{+}^{X \times y}} \max _{\kappa, \lambda \in \mathbb{R}}\left\{\mathrm{KL}\left(\gamma \| \gamma^{0}\right)+\kappa(\gamma \mathbf{1} y-\mu)+\lambda\left(\gamma^{\top} \mathbf{1} x-v\right)\right\} .
$$

Without justification, assume that we can switch the min and max, so that the above problem is equivalent to

$$
\max _{\kappa, \lambda \in \mathbb{R}} \min _{\gamma \in \mathbb{R}_{+}^{x \times y}}\left\{\mathrm{KL}\left(\gamma \| \gamma^{0}\right)+\kappa\left(\gamma \mathbf{1}_{y}-\mu\right)+\lambda\left(\gamma^{\top} \mathbf{1}_{x}-v\right)\right\} .
$$

Argue that the solution $\gamma$ to this problem is of the form $\gamma_{x, y}=\exp \left(f_{x}+g_{y}-c_{x, y}\right) \mu_{x} v_{y}$ for some $f \in \mathbb{R}^{x}, g \in \mathbb{R}^{y}$.

Exercise 11.4. For a joint distribution $\gamma$, let $\left(\Pi_{x}\right)_{\#} \gamma$ denote its $X$-marginal. Consider the objective functional $\mathcal{F}: \gamma \mapsto \mathrm{KL}\left(\left(\Pi_{x}\right)_{\#} \gamma \| \mu\right)$. Show that the iteration $\gamma^{n} \mapsto \gamma^{n+1}$ of Sinkhorn's algorithm can be viewed as one step of mirror descent on $\mathcal{F}$ with the entropic mirror map $\phi$, constraint set $\mathcal{C}_{v}$, and step size 1 . By checking relative convexity and smoothness, prove Theorem 11.8.

## 12 Stochastic optimization

Our next topic is optimization with stochastic gradients. Besides its relevance in situations where the gradient cannot be computed exactly, stochastic optimization is particularly important for machine learning and statistics for at least two reasons. First, it can be viewed as a method for directly minimizing the population risk, and we can establish generalization bounds provided that we perform a single pass over our data. Second, it is routinely used to minimize empirical risk functions by approximating the full gradient by mini-batches over the data. Our treatment therefore centers around these applications.

### 12.1 Stochastic mirror proximal gradient descent

We start with the fundamental convergence result. Suppose that we wish to minimize $F=f+g$, where we only have access to stochastic gradients for $f$. More precisely, we assume that at each $x \in \operatorname{int} \operatorname{dom} f$, we can compute a random vector $\hat{\nabla} f(x)$ which is unbiased: $\mathbb{E} \hat{\nabla} f(x)=\nabla f(x)$. Actually, we can also let $f$ be non-smooth, in which case
we require that $\mathbb{E} \hat{\nabla} f(x) \in \partial f(x)$. The analysis below can also handle the case where the stochastic gradient is biased, at the expense of an additional error term.

Let $\phi: \mathbb{R}^{d} \rightarrow \mathbb{R} \cup\{\infty\}$ be a mirror map. We consider the following iteration:

$$
\begin{equation*}
x_{n+1}:=\underset{x \in \mathbb{R}^{d}}{\arg \min }\left\{f\left(x_{n}\right)+\left\langle\hat{\nabla} f\left(x_{n}\right), x-x_{n}\right\rangle+g(x)+\frac{1}{h} D_{\phi}\left(x, x_{n}\right)\right\} \tag{SMPGD}
\end{equation*}
$$

This is the stochastic mirror proximal gradient descent algorithm. ${ }^{12}$ For most applications, we do not need all of these aspects (stochastic, mirror, proximal) simultaneously, but we may as well include them to emphasize that a unified proof is possible. Anyway, it is helpful to include a proximal term since it allows for projections, and the use of a Bregman divergence is a bonus since it covers stochastic mirror descent.

Theorem 12.1 (convergence of SMPGD). Let $\phi$ be a mirror map which is $\alpha_{\phi}$-convex relative to a norm $\|\cdot\| \cdot \|$. We assume that $f$ is $\alpha_{f}$-convex and $g$ is $\alpha_{g}$-convex, relative to $\phi$; we let $\lambda_{h}:=\left(1-\alpha_{f} h\right) /\left(1+\alpha_{g} h\right)$. We assume that the stochastic gradient is unbiased.

- (smooth case) Assume that $f$ is $\beta_{f}$-smooth relative to $\phi$, that $h \leq 1 /\left(2 \beta_{f}\right)$, and that we have a variance bound for the stochastic gradient:

$$
\begin{equation*}
\mathbb{E}\left[\|\mid \hat{\nabla} f(x)-\nabla f(x)\|_{*}^{2}\right] \leq \sigma^{2} d \quad \text { for all } x \in \mathcal{C}_{\phi} \tag{12.1}
\end{equation*}
$$

Then, for a suitably averaged iterate $\bar{x}_{N}$,

$$
\mathbb{E} F\left(\bar{x}_{N}\right)-F_{\star} \leq \frac{\alpha_{f}+\alpha_{g}}{\lambda_{h}^{-N}-1} D_{\phi}\left(x_{\star}, x_{0}\right)+\frac{\left(1+\alpha_{g} h\right) \sigma^{2} d h}{\alpha_{\phi}}
$$

- (non-smooth case) Assume that the stochastic gradients are $L^{2}$-bounded,

$$
\begin{equation*}
\mathbb{E}\left[\|\|\hat{\nabla} f(x)\|\|_{*}^{2}\right] \leq L^{2} \quad \text { for all } x \in \mathcal{C}_{\phi} \tag{12.2}
\end{equation*}
$$

Then, for a suitably averaged iterate $\bar{x}_{N}$,

$$
\mathbb{E} F\left(\bar{x}_{N}\right)-F_{\star} \leq \frac{\alpha_{f}+\alpha_{g}}{\lambda_{h}^{-N}-1} D_{\phi}\left(x_{\star}, x_{0}\right)+\frac{2\left(1+\alpha_{g} h\right) L^{2} h}{\alpha_{\phi}}
$$

Proof. We prove a one-step inequality for

$$
x^{+}:=\arg \min \psi_{x}, \quad \psi_{x}(y):=f(x)+\langle\hat{\nabla} f(x), y-x\rangle+g(y)+\frac{1}{h} D_{\phi}(y, x)
$$

[^11]By the relative growth inequality (Lemma 10.7), for any $y \in \mathcal{C}_{\phi}$,

$$
\left(\alpha_{g}+\frac{1}{h}\right) D_{\phi}\left(y, x^{+}\right)+\psi_{x}\left(x^{+}\right) \leq \psi_{x}(y)
$$

For the right-hand side, in both cases,

$$
\begin{aligned}
\mathbb{E} \psi_{x}(y) & =f(x)+\langle\nabla f(x), y-x\rangle+g(y)+\frac{1}{h} D_{\phi}(y, x)=F(y)-D_{f}(y, x)+\frac{1}{h} D_{\phi}(y, x) \\
& \leq F(y)+\frac{1-\alpha_{f} h}{h} D_{\phi}(y, x)
\end{aligned}
$$

Smooth case. Here, we lower bound $\mathbb{E} \psi_{x}\left(x^{+}\right)$as follows: since $h \leq 1 /\left(2 \beta_{f}\right)$,

$$
\begin{aligned}
\mathbb{E} \psi_{x}\left(x^{+}\right) & =\mathbb{E}\left[f(x)+\left\langle\hat{\nabla} f(x), x^{+}-x\right\rangle+g\left(x^{+}\right)+\frac{1}{h} D_{\phi}\left(x^{+}, x\right)\right] \\
& =\mathbb{E}\left[f(x)+\left\langle\nabla f(x), x^{+}-x\right\rangle+g\left(x^{+}\right)+\frac{1}{h} D_{\phi}\left(x^{+}, x\right)+\left\langle\hat{\nabla} f(x)-\nabla f(x), x^{+}-x\right\rangle\right] \\
& =\mathbb{E}\left[F\left(x^{+}\right)-D_{f}\left(x^{+}, x\right)+\frac{1}{h} D_{\phi}\left(x^{+}, x\right)+\left\langle\hat{\nabla} f(x)-\nabla f(x), x^{+}-x\right\rangle\right] \\
& \geq \mathbb{E}\left[F\left(x^{+}\right)+\frac{1}{2 h} D_{\phi}\left(x^{+}, x\right)-\|\hat{\nabla} f(x)-\nabla f(x)\|\left\|_{*}\right\| x^{+}-x\| \|\right] \\
& \geq \mathbb{E}\left[F\left(x^{+}\right)+\frac{\alpha_{\phi}}{4 h}\left\|x^{+}-x\right\| \|^{2}\right]-\sqrt{\mathbb{E}\left[\| \| \hat{\nabla} f(x)-\nabla f(x)\| \|_{*}^{2}\right] \mathbb{E}\left[\| \| x^{+}-x\| \|^{2}\right]} \\
& \geq \mathbb{E}\left[F\left(x^{+}\right)+\frac{\alpha_{\phi}}{4 h}\left\|x^{+}-x\right\| \|^{2}\right]-\sqrt{\sigma^{2} d \mathbb{E}\left[\| \| x^{+}-x\| \|^{2}\right]} \geq \mathbb{E} F\left(x^{+}\right)-\frac{\sigma^{2} d h}{\alpha_{\phi}} .
\end{aligned}
$$

This leads to the one-step bound

$$
\left(1+\alpha_{g} h\right) \mathbb{E} D_{\phi}\left(y, x^{+}\right) \leq\left(1-\alpha_{f} h\right) D_{\phi}(y, x)-h\left(\mathbb{E} F\left(x^{+}\right)-F(y)\right)+\frac{\sigma^{2} d h^{2}}{\alpha_{\phi}}
$$

Non-smooth case. In this case, note that

$$
\|\nabla f(x)\|\left\|_{*}=\right\| \mathbb{E} \hat{\nabla} f(x)\left\|\|_{*} \leq \sqrt{\mathbb{E}\left[\| \| \hat{\nabla} f(x)\| \|_{*}^{2}\right]} \leq L\right.
$$

so that $f$ is $L$-Lipschitz with respect to $|||\cdot|||$. Then,

$$
\begin{aligned}
\mathbb{E} \psi_{x}\left(x^{+}\right) & =\mathbb{E}\left[f(x)+\left\langle\hat{\nabla} f(x), x^{+}-x\right\rangle+g\left(x^{+}\right)+\frac{1}{h} D_{\phi}\left(x^{+}, x\right)\right] \\
& =\mathbb{E}\left[F\left(x^{+}\right)+f(x)-f\left(x^{+}\right)+\left\langle\hat{\nabla} f(x), x^{+}-x\right\rangle+\frac{1}{h} D_{\phi}\left(x^{+}, x\right)\right]
\end{aligned}
$$

$$
\begin{aligned}
& \geq \mathbb{E}\left[F\left(x^{+}\right)-L\left\|x^{+}-x\right\|\|-\| \mid \hat{\nabla} f(x)\| \|_{*}\left\|x^{+}-x\right\| \|+\frac{1}{h} D_{\phi}\left(x^{+}, x\right)\right] \\
& \geq \mathbb{E}\left[F\left(x^{+}\right)+\frac{\alpha_{\phi}}{2 h}\left\|x^{+}-x\right\| \|^{2}\right]-2 L \sqrt{\mathbb{E}\left[\left\|\left|x^{+}-x\right|\right\|^{2}\right]} \geq \mathbb{E} F\left(x^{+}\right)-\frac{2 L^{2} h}{\alpha_{\phi}} .
\end{aligned}
$$

This leads to the one-step bound

$$
\left(1+\alpha_{g} h\right) \mathbb{E} D_{\phi}\left(y, x^{+}\right) \leq\left(1-\alpha_{f} h\right) D_{\phi}(y, x)-h\left(\mathbb{E} F\left(x^{+}\right)-F(y)\right)+\frac{2 L^{2} h^{2}}{\alpha_{\phi}} .
$$

Completing the proof. Observe that the one-step bounds have exactly the same form in both cases. We take $y=x_{\star}$ and iterate as usual. Let $E=\sigma^{2} d h^{2} / \alpha_{\phi}$ in the first case, and $E=2 L^{2} h^{2} / \alpha_{\phi}$ in the second case. Then, the discrete Grönwall lemma (Lemma 3.5) and some computations yield

$$
\sum_{n=1}^{N} \frac{\lambda_{h}^{N-n}}{\sum_{k=1}^{N} \lambda_{h}^{k}}\left\{\mathbb{E} F\left(x_{n}\right)-F_{\star}\right\} \leq \frac{\alpha_{f}+\alpha_{g}}{\lambda_{h}^{-N}-1} D_{\phi}\left(x_{\star}, x_{0}\right)+\frac{1+\alpha_{g} h}{h} E
$$

This yields a convergence rate for a suitably averaged iterate.
For simplicity, let us assume that $\alpha_{\phi}=1$ and $R^{2} \geq D_{\phi}\left(x_{\star}, x_{0}\right)$. We let $\alpha:=\alpha_{f}+\alpha_{g}$. To obtain $\varepsilon$ error, Theorem 12.1 implies the rates in Table 2.

| Assumptions | Iterations |
| :---: | :---: |
| convex, smooth | $O\left(\sigma^{2} d R^{2} / \varepsilon^{2}\right)$ |
| strongly convex, smooth | $O\left(\sigma^{2} d \log \left(\alpha R^{2} / \varepsilon\right) /(\alpha \varepsilon)\right)$ |
| convex, non-smooth | $O\left(L^{2} R^{2} / \varepsilon^{2}\right)$ |
| strongly convex, non-smooth | $O\left(L^{2} \log \left(\alpha R^{2} / \varepsilon\right) /(\alpha \varepsilon)\right)$ |

Table 2: Rates for SMPGD with an appropriate step size and averaging.

A few remarks are in order.

1. The effect of the stochasticity of the gradients, at least under our assumptions, is qualitatively the same as the effect of non-smoothness. Indeed, the rates of $O\left(1 / \varepsilon^{2}\right)$ under convexity and $O(1 / \varepsilon)$ under strong convexity reflect the rates for PSD in §6.2. Similarly, in this setting we do not have a descent lemma, and hence we should average the iterates.
2. In the non-smooth case, stochasticity of the gradients does not hurt the rate at all, provided that the stochastic gradients satisfy an appropriate $L^{2}$ bound.
3. By Jensen's inequality, it is not hard to see that (12.2) implies (12.1) with $\sigma^{2} d \leq 4 L^{2}$. Hence, the variance bound (12.1) is indeed a weaker assumption, although the analysis requires a stronger assumption-smoothness-for $f$. At first glance, it may seem that (12.1) and (12.2) are similar, but the former is a variance bound and the latter is an $L^{2}$ bound. Suppose, for instance, that $\|\|\cdot\| \mid$ is the Euclidean norm, and that $\hat{\nabla} f$ is computed on the basis of a mini-batch of $B$ samples. Then, we expect (12.1) to decay as $1 / B$, whereas (12.2) does not.
4. Since stochastic optimization behaves like non-smooth optimization, we also expect that it is not possible to "accelerate". Indeed, many of the rates in Theorem 12.1 can be shown to be optimal up to logarithmic terms [RR11; Aga+12].

### 12.2 Implications for statistical generalization

Suppose that we have a dataset $\left\{Z_{i}: i \in[n]\right\} \subseteq Z$ of i.i.d. samples, a parameter space $\Theta \subseteq \mathbb{R}^{d}$, and a loss $\ell: \Theta \times z \rightarrow \mathbb{R}$. Define the empirical risk and the population risk:

$$
\mathcal{R}_{n}(\theta):=\frac{1}{n} \sum_{i=1}^{n} \ell\left(\theta ; Z_{i}\right), \quad \mathcal{R}(\theta):=\mathbb{E} \mathcal{R}_{n}(\theta)
$$

We further assume that $\theta \mapsto \ell(\theta ; z)$ is $L$-Lipschitz for all $z \in Z$, and that $\Theta$ is is the ball $\mathrm{B}(0, R)$ of radius $R$.

Example 12.2 (regression). Suppose that $Z_{i}=\left(X_{i}, Y_{i}\right)$ with $X_{i} \in \mathbb{R}^{d}$ and $Y_{i} \in[-1,1]$. Assume that for each $\theta \in \Theta$, we have a predictor $f_{\theta}: \mathbb{R}^{d} \rightarrow[-1,1]$. Then, we can consider the squared loss

$$
\ell(\theta ; z)=\ell(\theta ;(x, y))=\left(y-f_{\theta}(x)\right)^{2}
$$

If we further consider linear regression, $f_{\theta}: x \mapsto\langle\theta, x\rangle$, then $f_{\theta}$ is $4 r$-Lipschitz for all $z=(x, y)$ with $\|x\| \leq r$ and $|y| \leq 1$. Linear regression is not as restrictive as it may seem, since we can imagine that each $X_{i}$ is actually the output of a high-dimensional feature map, in which case we obtain kernel regression.

The setting we have described is actually the standard one for statistical learning theory, and it covers much more than regression (e.g., classification and density estimation), but
regression is a good representative example. Also, since our conclusions below will not involve the dimension $d$, we can think of the function class as infinite-dimensional.

Define the minimizers

$$
\widehat{\theta}_{n} \in \underset{\theta \in \Theta}{\arg \min } \mathcal{R}_{n}(\theta), \quad \theta^{\star} \in \underset{\theta \in \Theta}{\arg \min } \mathcal{R}(\theta)
$$

We view $\theta^{\star}$ as the ground truth value of the parameter that we wish to recover. Since we do not have access to the population risk $\mathcal{R}$, we must base our procedures on the samples $\left\{Z_{i}\right\}_{i \in[n]}$, so it is natural to use $\widehat{\theta}_{n}$, the empirical risk minimizer (ERM), as our estimator. This is the starting point for statistical theory, but it says nothing about how we can actually compute $\widehat{\theta}_{n}$.

The power of stochastic gradient descent (SGD) is that we can view it as a method to directly minimize the population risk. We consider the iteration

$$
\begin{equation*}
\theta_{k+1}:=\theta_{k}-h \nabla_{\theta} \ell\left(\theta_{k} ; Z_{k+1}\right) \tag{SGD}
\end{equation*}
$$

If we denote $\hat{\nabla} \mathcal{R}(\theta)=\nabla_{\theta} \ell(\theta ; Z)$, then this is indeed an unbiased stochastic gradient: $\mathbb{E} \hat{\nabla} \mathcal{R}(\theta)=\nabla \mathcal{R}(\theta)$. Due to our Lipschitz assumption, we also know that

$$
\mathbb{E}\left[\|\hat{\nabla} \mathcal{R}(\theta)\|^{2}\right] \leq L^{2}
$$

However, the implicit assumption in Theorem 12.1 is that the randomness is fresh at each iteration, so we are not allowed to reuse any samples. This limits the total number of iterations of SGD to the sample size $n$, and we refer to this as one-pass SGD.

From Theorem 12.1, if we further assume that $\theta \mapsto \ell(\theta ; z)$ is convex for every $z \in z$, then SGD with an optimized step size and averaging satisfies

$$
\mathbb{E} \mathcal{R}\left(\bar{\theta}_{n}\right)-\mathcal{R}\left(\theta^{\star}\right) \lesssim \frac{L R}{\sqrt{n}}
$$

Here, the guarantee is in terms of the difference between the expected risk of our estimator, the averaged iterate of SGD, and the best possible risk. This is known as the excess risk and it is the best we can hope for, since $\theta^{\star}$ may not be identifiable (unique).

How does this compare to the performance of ERM? Analysis of the ERM estimator starts with the following decomposition:

$$
\begin{aligned}
\mathcal{R}\left(\widehat{\theta}_{n}\right)-\mathcal{R}\left(\theta^{\star}\right) & =\mathcal{R}\left(\widehat{\theta}_{n}\right)-\mathcal{R}_{n}\left(\widehat{\theta}_{n}\right)+\underbrace{\mathcal{R}_{n}\left(\widehat{\theta}_{n}\right)-\mathcal{R}_{n}\left(\theta^{\star}\right)}_{\leq 0}+\mathcal{R}_{n}\left(\theta^{\star}\right)-\mathcal{R}\left(\theta^{\star}\right) \\
& \leq 2 \sup _{\theta \in \Theta}\left|\mathcal{R}_{n}(\theta)-\mathcal{R}(\theta)\right|
\end{aligned}
$$

We therefore want to show that $\sup _{\theta \in \Theta}\left|\mathcal{R}_{n}(\theta)-\mathcal{R}(\theta)\right|$ tends to zero at a certain rate, which is known as a uniform convergence argument. This is a type of stochastic process (since $\mathcal{R}_{n}$ is random) known as an empirical process, and sophisticated tools have been developed for its study. After applying a number of them (symmetrization, contraction principle, control of the Rademacher complexity), one can show that

$$
\begin{equation*}
\mathbb{E} \mathcal{R}\left(\widehat{\theta}_{n}\right)-\mathcal{R}\left(\theta^{\star}\right) \lesssim \frac{L R}{\sqrt{n}} \tag{12.3}
\end{equation*}
$$

just as for SGD.
Actually, it is worth remarking that the bounds from empirical process theory depend on various notions of the complexity of the class $\{\ell(\theta ; \cdot): \theta \in \Theta\}$. A traditional approach measures this complexity essentially by counting the number of free parameters in the class (Vapnik-Chervonenkis or VC theory), and would not match the dimension-free rate attained by SGD. In order to do so, one needs to turn toward "size-based" measures of complexity that take into account the fact that $\Theta$ lies in a ball, hence the need to control the Rademacher complexity directly.

Anyway, we can show that the ERM estimator satisfies (12.3), and moreover, this argument does not require convexity of the loss. However, when we discuss how to compute the ERM estimator, we need to assume convexity anyway. Let us suppose that we compute it by running GD (or more specifically, PSD) on the empirical risk $\mathcal{R}_{n}$. Since the statistical error is already $L R / \sqrt{n}$, we only need to optimize to this level of accuracy. Applying Theorem 6.14, we see that the number of iterations of PSD is roughly $n$. This is the same number of iterations as one-pass SGD, except that each iteration of SGD is roughly $n$ times cheaper than the corresponding one for PSD.

In conclusion, one-pass SGD produces an estimator which has comparable statistical performance to the ERM estimator, with a computational cost roughly $n$ times cheaper than minimizing the empirical risk directly using PSD.

The $n^{-1 / 2}$ dependence on the sample size $n$ is known as a "slow rate". It can be improved when we additionally assume that for every $z \in Z, \theta \mapsto \ell(\theta ; z)$ is $\alpha$-convex for some $\alpha>0$. In this case, Theorem 12.1 yields

$$
\mathbb{E} \mathcal{R}\left(\bar{\theta}_{n}\right)-\mathcal{R}\left(\theta^{\star}\right) \lesssim \frac{L^{2}}{\alpha n}
$$

(Actually, Theorem 12.1 yields a slightly worse result by a logarithmic factor, but this can be fixed with a time-varying choice of step sizes.) Due to strong convexity, it also implies parameter recovery:

$$
\sqrt{\mathbb{E}\left[\left\|\bar{\theta}_{n}-\theta^{\star}\right\|^{2}\right]} \lesssim \frac{L}{\alpha \sqrt{n}}
$$

What about for the ERM estimator? This time, one needs a refined argument based on localized Rademacher complexities, and it again eventually yields

$$
\mathbb{E} \mathcal{R}\left(\widehat{\theta}_{n}\right)-\mathcal{R}\left(\theta^{\star}\right) \lesssim \frac{L^{2}}{\alpha n} .
$$

As for computation, by applying PSD and the result of Exercise 6.5 (again, omitting the logarithmic factor which can be removed with better step sizes), the conclusion is the same: the number of iterations is the same as for SGD, but each iteration is roughly $n$ times more expensive.

This discussion suggests that, at least when the risk is convex, averaged one-pass SGD is expected to be an excellent estimator, both computationally and statistically. The next subsection will further reinforce this point.

### 12.3 Central limit theorem for Polyak-Ruppert averaging

Disclaimer: This subsection is somewhat technical, so rather than tracing through all of the details, you are encouraged to follow the high-level ideas.

We now turn to a celebrated result in stochastic optimization: namely, that the iterates of SGD with Polyak-Ruppert averaging obey a central limit theorem. Let

$$
\begin{equation*}
\theta_{n+1}:=\theta_{n}-h_{n+1} \hat{\nabla} f\left(\theta_{n}\right), \quad \bar{\theta}_{n}:=\frac{1}{n} \sum_{j=0}^{n-1} \theta_{j} \tag{ASGD}
\end{equation*}
$$

Our goal is to show that $\sqrt{n}\left(\bar{\theta}_{n}-\theta^{\star}\right) \rightarrow$ normal $(0, \Sigma)$ for a certain covariance matrix $\Sigma$. Throughout, we write

$$
\hat{\nabla} f\left(\theta_{n}\right)=\nabla f\left(\theta_{n}\right)+\xi_{n+1},
$$

where conditionally on $\theta_{n}$, the random vector $\xi_{n+1}$ has zero mean. Our condition on the step sizes is

$$
\begin{equation*}
h_{n}=n^{-\gamma}, \quad \text { for some } \frac{1}{2}<\gamma<1 . \tag{12.4}
\end{equation*}
$$

We recall some preliminaries on convergence in distribution.

- We say that a sequence $\left\{X_{n}\right\}_{n \in \mathbb{N}}$ of random vectors converges in distribution (or converges weakly in law) to a probability distribution $\mu$, denoted $X_{n} \xrightarrow{\mathrm{~d}} \mu$, if $\mathbb{E} f\left(X_{n}\right) \rightarrow \int f \mathrm{~d} \mu$ for every bounded, continuous function $f: \mathbb{R}^{d} \rightarrow \mathbb{R}$. This is the same notion of convergence as in the classical central limit theorem (CLT).
- We say that $\left\{X_{n}\right\}_{n \in \mathbb{N}}$ tends to 0 in probability if for all $\varepsilon>0, \mathbb{P}\left(\left\|X_{n}\right\| \geq \varepsilon\right) \rightarrow 0$. If $\mathbb{E}\left\|X_{n}\right\| \rightarrow 0$, then $X_{n} \rightarrow 0$ in probability; this follows from Markov's inequality.
- If $X_{n}=Y_{n}+Z_{n}$, and $Z_{n} \rightarrow 0$ in probability, then $\left\{X_{n}\right\}_{n \in \mathbb{N}}$ and $\left\{Y_{n}\right\}_{n \in \mathbb{N}}$ have the same distributional limit.

Quadratic case. We begin with the quadratic case with

$$
f: \mathbb{R}^{d} \rightarrow \mathbb{R}, \quad f(\theta)=\frac{1}{2}\left\langle\theta-\theta^{\star}, A\left(\theta-\theta^{\star}\right)\right\rangle
$$

We assume $A \succ 0$. We do not treat this case separately merely as a "warm-up"; the analysis here is crucial for the general case as well.

Theorem 12.3 (CLT for ASGD, quadratic case). Assume that $f$ is a strongly convex quadratic function, and that the step sizes satisfy the condition (12.4). Assume that conditionally on $\theta_{n}$, each $\xi_{n+1}$ is mean zero and has covariance $\Xi_{n+1}$, such that $n^{-1} \sum_{k=1}^{n} \Xi_{k} \rightarrow S_{\infty}$ in probability and $\sup _{n \geq 1} \mathbb{E} \operatorname{tr} \Xi_{n}<\infty$. Then,

$$
\sqrt{n}\left(\bar{\theta}_{n}-\theta^{\star}\right) \xrightarrow{\mathrm{d}} \operatorname{normal}\left(0, A^{-1} S_{\infty} A^{-1}\right)
$$

Before turning toward the proof, let us consider a simple example.
Example 12.4 (estimating the mean of a Gaussian). Suppose that we have samples $\left\{X_{n}\right\}_{n \in \mathbb{N}} \stackrel{\text { i.i.d. }}{\sim} \operatorname{normal}\left(\theta^{\star}, A^{-1}\right)$ for a known covariance matrix $A \succ 0$, and we wish to estimate the mean $\theta^{\star}$. We consider

$$
\theta_{n+1}=\theta_{n}-h_{n+1} A\left(\theta_{n}-X_{n+1}\right), \quad \bar{\theta}_{n}=\frac{1}{n} \sum_{j=0}^{n-1} \theta_{j}
$$

This corresponds to the quadratic loss function with $\xi_{n}=A\left(\theta^{\star}-X_{n}\right)$. In this case, the $\left\{\xi_{n}\right\}_{n \in \mathbb{N}}$ are i.i.d., with mean zero and covariance matrix $A$.

If we use the sample mean, then

$$
\sqrt{n}\left(\frac{1}{n} \sum_{j=1}^{n} X_{j}-\theta^{\star}\right) \sim \operatorname{normal}\left(0, A^{-1}\right)
$$

On the other hand, the CLT for ASGD with $S_{\infty}=A$ shows that

$$
\sqrt{n}\left(\bar{\theta}_{n}-\theta^{\star}\right) \rightarrow \operatorname{normal}\left(0, A^{-1}\right)
$$

The first step is to write out the iterates. For $\delta_{n}:=\theta_{n}-\theta^{\star}$,

$$
\delta_{n+1}=\delta_{n}-h_{n+1} A \delta_{n}-h_{n+1} \xi_{n+1}=\left(I-h_{n+1} A\right) \delta_{n}-h_{n+1} \xi_{n+1}
$$

Unrolling,

$$
\delta_{n}=\left[\prod_{j=1}^{n}\left(I-h_{j} A\right)\right] \delta_{0}-\sum_{j=1}^{n}\left[h_{j} \prod_{k=j+1}^{n}\left(I-h_{k} A\right)\right] \xi_{j} .
$$

Defining $\bar{\delta}_{n}:=n^{-1} \sum_{j=0}^{n-1} \delta_{j}$, it yields

$$
\begin{align*}
\bar{\delta}_{n} & =\frac{1}{n} \sum_{j=0}^{n-1}\left[\prod_{k=1}^{j}\left(I-h_{k} A\right)\right] \delta_{0}-\frac{1}{n} \sum_{j=0}^{n-1} \sum_{k=1}^{j}\left[h_{k} \prod_{\ell=k+1}^{j}\left(I-h_{\ell} A\right)\right] \xi_{k} \\
& =\frac{1}{n} \sum_{j=0}^{n-1}\left[\prod_{k=1}^{j}\left(I-h_{k} A\right)\right] \delta_{0}-\frac{1}{n} \sum_{k=1}^{n-1} \underbrace{h_{k} \sum_{j=k}^{n-1}\left[\prod_{\ell=k+1}^{j}\left(I-h_{\ell} A\right)\right]}_{=: M_{k}^{n}} \xi_{k} \\
& =\frac{1}{n} M_{0}^{n} \delta_{0}-\frac{1}{n} \sum_{k=1}^{n-1} A^{-1} \xi_{k}-\frac{1}{n} \sum_{k=1}^{n-1}\left(M_{k}^{n}-A^{-1}\right) \xi_{k} \tag{12.5}
\end{align*}
$$

where we set $h_{0}:=1$. The intuition is that if all of the $h_{\ell}$ were the same, then $M_{k}^{n}$ would equal $h \sum_{j=k}^{n-1}(I-h A)^{j-k} \rightarrow A^{-1}$ as $n \rightarrow \infty$, so we hope that the last term tends to zero.

Lemma 12.5. The $M_{k}^{n}$ matrices are uniformly bounded in operator norm. Also,

$$
\frac{1}{n} \sum_{k=1}^{n-1}\left\|M_{k}^{n}-A^{-1}\right\|_{\mathrm{op}} \rightarrow 0 \quad \text { as } n \rightarrow \infty
$$

Proof sketch. For intuition, suppose that $S=\sum_{n=0}^{\infty}(I-h A)^{n}$ for $h<1 /\|A\|_{\text {op }}$. To show that $h S=A^{-1}$, one can argue that $(I-h A) S=S-I$, which leads to $h S=A^{-1}$. We want to replicate this type of proof, but it is significantly complicated due to the time-varying step sizes. Let $B_{j}^{k}:=\prod_{\ell=j}^{k}\left(I-h_{\ell} A\right)$, so that $M_{k}^{n}=h_{k} \sum_{j=k}^{n-1} B_{k+1}^{j}$. We start with an equation for the $B$ 's: since

$$
B_{j}^{k+1}=B_{j}^{k}-h_{k+1} A B_{j}^{k}=\cdots=I-A \sum_{\ell=j-1}^{k} h_{\ell+1} B_{j}^{\ell},
$$

we can write

$$
M_{k}^{n}=h_{k} \sum_{j=k}^{n-1} B_{k+1}^{j}=\sum_{j=k}^{n-1}\left(h_{k}-h_{j+1}+h_{j+1}\right) B_{k+1}^{j}=\sum_{j=k}^{n-1}\left(h_{k}-h_{j+1}\right) B_{k+1}^{j}+A^{-1}\left(I-B_{k+1}^{n}\right)
$$

Therefore,

$$
A M_{k}^{n}-I=A \sum_{j=k}^{n-1}\left(h_{k}-h_{j+1}\right) B_{k+1}^{j}-B_{k+1}^{n}
$$

Since $A$ is bounded above and below,

$$
\frac{1}{n} \sum_{k=1}^{n-1}\left\|M_{k}^{n}-A^{-1}\right\|_{\mathrm{op}} \lesssim \frac{1}{n} \sum_{k=1}^{n-1} \sum_{j=k}^{n-1}\left|h_{k}-h_{j+1}\right|\left\|B_{k+1}^{j}\right\|_{\mathrm{op}}+\frac{1}{n} \sum_{k=2}^{n}\left\|B_{k}^{n}\right\|_{\mathrm{op}}
$$

Also, it is easy to see that for sufficiently small step sizes (which is all that matters in the asymptotic regime),

$$
\left\|B_{k}^{n}\right\|_{\mathrm{op}} \leq \prod_{\ell=k}^{n}\left(I-\alpha h_{\ell}\right) \leq \exp \left(-\alpha \sum_{\ell=k}^{n} h_{\ell}\right)
$$

So, for the second term,

$$
\frac{1}{n} \sum_{k=2}^{n}\left\|B_{k}^{n}\right\|_{\mathrm{op}} \leq \frac{1}{n} \sum_{k=1}^{n} \exp \left(-\alpha \sum_{\ell=k}^{n} h_{\ell}\right)
$$

Let $\tau_{k}:=\sum_{\ell=1}^{k} h_{\ell} \approx(1-\gamma)^{-1} k^{1-\gamma}$. If, for any $t>0$, we define $\tau(t)=t^{1-\gamma}$, the summation is roughly equivalent to the following integral (up to replacing $\alpha$ by $\alpha /(1-\gamma)$ ):

$$
I:=\int_{1}^{n} \exp (-\alpha(\tau(n)-\tau(k))) \mathrm{d} k
$$

For ease of presentation, we focus on bounding the integral instead. By change of variables, $t=\tau(k)$,

$$
I \asymp \int_{1}^{n^{1-\gamma}} t^{\gamma /(1-\gamma)} \exp \left(-\alpha\left(n^{1-\gamma}-t\right)\right) \mathrm{d} t \lesssim n^{\gamma} \int_{1}^{n^{1-\gamma}} \exp \left(-\alpha\left(n^{1-\gamma}-t\right)\right) \mathrm{d} t \lesssim n^{\gamma}
$$

Since $\gamma<1$, the second term tends to zero.

As for the first term, we follow a similar strategy and approximate it via

$$
\begin{aligned}
& \frac{1}{n} \iint_{1 \leq k \leq j \leq n}\left(\frac{1}{k^{\gamma}}-\frac{1}{j^{\gamma}}\right) \exp (-\alpha(\tau(j)-\tau(k))) \mathrm{d} j \mathrm{~d} k \\
& \quad \asymp \frac{1}{n} \iint_{1 \leq s \leq t \leq n^{1-\gamma}} \underbrace{\left(t^{\gamma /(1-\gamma)}-s^{\gamma /(1-\gamma)}\right)}_{\text {apply Taylor expansion }} \exp (-\alpha(t-s)) \mathrm{d} s \mathrm{~d} t \\
& \quad \lesssim \frac{n^{2 \gamma-1}}{n} \iint_{1 \leq s \leq t \leq n^{1-\gamma}}(t-s) \exp (-\alpha(t-s)) \mathrm{d} s \mathrm{~d} t \lesssim \frac{n^{\gamma}}{n} \int_{1}^{n^{1-\gamma}} t \exp (-\alpha t) \mathrm{d} t \rightarrow 0
\end{aligned}
$$

This completes the heuristic proof of the convergence. The first statement, about the boundedness of the $M_{k}^{n}$, can be proved via similar arguments.

Returning to (12.5), note that

$$
\sqrt{n} \bar{\delta}_{n}=\frac{1}{n^{1 / 2}} M_{0}^{n} \delta_{0}-\frac{1}{n^{1 / 2}} \sum_{k=1}^{n-1} A^{-1} \xi_{k}-\frac{1}{n^{1 / 2}} \sum_{k=1}^{n-1}\left(M_{k}^{n}-A^{-1}\right) \xi_{k}
$$

where $\mathbb{E}\left\|M_{0}^{n} \delta_{0}\right\| / \sqrt{n} \rightarrow 0$. For the last term, we use the fact that the $\xi_{k}$ 's are orthogonal: for $k<\ell$, by conditioning on $\theta_{1: \ell-1}:=\left(\theta_{1}, \ldots, \theta_{\ell-1}\right)$,

$$
\mathbb{E}\left\langle\left(M_{k}^{n}-A^{-1}\right) \xi_{k},\left(M_{\ell}^{n}-A^{-1}\right) \xi_{\ell}\right\rangle=\mathbb{E}\left\langle\left(M_{k}^{n}-A^{-1}\right) \xi_{k},\left(M_{\ell}^{n}-A^{-1}\right) \mathbb{E}\left[\xi_{\ell} \mid \theta_{1: \ell-1}\right]\right\rangle=0
$$

Therefore,

$$
\begin{aligned}
\frac{1}{n} \mathbb{E}\left[\left\|\sum_{k=1}^{n-1}\left(M_{k}^{n}-A^{-1}\right) \xi_{k}\right\|^{2}\right] & =\frac{1}{n} \sum_{k=1}^{n-1} \mathbb{E}\left[\left\|\left(M_{k}^{n}-A^{-1}\right) \xi_{k}\right\|^{2}\right]=\frac{1}{n} \sum_{k=1}^{n-1}\left\langle\left(M_{k}^{n}-A^{-1}\right)^{2}, \mathbb{E} \Xi_{k}\right\rangle \\
& \lesssim \frac{1}{n} \sum_{k=1}^{n}\left\|M_{k}^{n}-A^{-1}\right\|_{\mathrm{op}} \rightarrow 0
\end{aligned}
$$

Hence, to obtain a distributional limit for $\sqrt{n} \bar{\delta}_{n}$, it suffices to obtain one for the second term above. This will be accomplished via martingale theory.

Martingale CLT. In the context of stochastic optimization, the noise sequence $\left\{\xi_{n}\right\}_{n \in \mathbb{N}}$ is not i.i.d.; indeed, we want to consider

$$
\xi_{n}=\hat{\nabla} f\left(\theta_{n}\right)-\nabla f\left(\theta_{n}\right)
$$

and since the iterates $\left\{\theta_{n}\right\}_{n \in \mathbb{N}}$ are random and depend on the noise sequence, it leads to a complicated dependence structure for the noise sequence. Nevertheless, it falls within the framework of martingale theory.

Definition 12.6. An increasing sequence of $\sigma$-algebras $\left\{\mathscr{F}_{n}\right\}_{n \in \mathbb{N}}$ is called a filtration. We think of $\mathscr{F}_{n}$ as the information available to an observer up to iteration $n$.

A sequence of random vectors $\left\{X_{n}\right\}_{n \in \mathbb{N}}$ is called a martingale if for all $n, X_{n}$ is $\mathscr{F}_{n}$-measurable, $\mathbb{E}\left\|X_{n}\right\|<\infty$, and

$$
\mathbb{E}\left[X_{n+1} \mid \mathscr{F}_{n}\right]=X_{n} .
$$

In other words, the difference $X_{n+1}-X_{n}$ is conditionally unbiased given the information $\mathscr{F}_{n}$ available at iteration $n$. If we set $X_{n}:=\sum_{k=1}^{n} \xi_{k}$, then $\left\{X_{n}\right\}_{n \in \mathbb{N}}$ is a martingale; we sometimes refer to the noise sequence $\left\{\xi_{n}\right\}_{n \in \mathbb{N}}$ as a martingale difference sequence.

Our next goal is to establish the following theorem.
Theorem 12.7 (martingale CLT). Let $\left\{\xi_{n}\right\}_{n \in \mathbb{N}}$ be a martingale difference sequence and write $\Xi_{n+1}:=\operatorname{cov}\left(\xi_{n+1} \mid \mathscr{F}_{n}\right)$. Assume that $\sup _{n \in \mathbb{N}} \mathbb{E} \operatorname{tr} \Xi_{n}<\infty$ and that $n^{-1} \sum_{k=1}^{n} \Xi_{k} \rightarrow S_{\infty}$ in probability. Then,

$$
\frac{1}{\sqrt{n}} \sum_{k=1}^{n} \xi_{k} \xrightarrow{\mathrm{~d}} \operatorname{normal}\left(0, S_{\infty}\right) \quad \text { as } n \rightarrow \infty
$$

This is a special case of a more general theorem on triangular arrays of LindebergFeller type. For simplicity, we prove it under the stronger hypothesis that $\left\{\xi_{n}\right\}_{n \in \mathbb{N}}$ is uniformly bounded.

Proof. Let $X_{k}:=n^{-1 / 2} \sum_{\ell=1}^{k} \xi_{\ell}$; note that this depends on $n$ but we suppress it from the notation. Consider the characteristic function: for $\mathbf{i}:=\sqrt{-1}$ and $\lambda \in \mathbb{R}^{d}$,

$$
\phi_{n}(\lambda):=\mathbb{E} \exp \left(\mathbf{i}\left\langle\lambda, X_{n}\right\rangle\right)
$$

Due to standard results on Fourier inversion, it suffices to prove that the characteristic function $\phi_{n}$ converges pointwise to the characteristic function of the Gaussian,

$$
\phi_{\infty}(\lambda):=\mathbb{E} \exp (\mathbf{i}\langle\lambda, Z\rangle)=\exp \left(-\frac{1}{2}\left\langle\lambda, S_{\infty} \lambda\right\rangle\right), \quad Z \sim \operatorname{normal}\left(0, S_{\infty}\right)
$$

Let $S_{k}:=n^{-1} \sum_{\ell=1}^{k} \Xi_{\ell}$. We start by writing

$$
\begin{aligned}
\left|\phi_{n}(\lambda)-\phi_{\infty}(\lambda)\right| \leq & \left|\mathbb{E}\left[\exp \left(\mathbf{i}\left\langle\lambda, X_{n}\right\rangle\right)\left(1-\exp \left(\frac{1}{2}\left\langle\lambda, S_{n} \lambda\right\rangle-\frac{1}{2}\left\langle\lambda, S_{\infty} \lambda\right\rangle\right)\right)\right]\right| \\
& +\left|\exp \left(-\frac{1}{2}\left\langle\lambda, S_{\infty} \lambda\right\rangle\right)\left(\mathbb{E} \exp \left(\mathbf{i}\left\langle\lambda, X_{n}\right\rangle+\frac{1}{2}\left\langle\lambda, S_{n} \lambda\right\rangle\right)-1\right)\right|
\end{aligned}
$$

$$
\begin{aligned}
\leq \mathbb{E} \mid 1 & \left.-\exp \left(\frac{1}{2}\left\langle\lambda, S_{n} \lambda\right\rangle-\frac{1}{2}\left\langle\lambda, S_{\infty} \lambda\right\rangle\right) \right\rvert\, \\
& +\left|\mathbb{E} \exp \left(\mathbf{i}\left\langle\lambda, X_{n}\right\rangle+\frac{1}{2}\left\langle\lambda, S_{n} \lambda\right\rangle\right)-1\right|
\end{aligned}
$$

Since $\left\{\xi_{n}\right\}_{n \in \mathbb{N}}$ is bounded, say by $B$, then $\left\|\Xi_{k}\right\|_{\text {op }} \leq B^{2}$, so $\left\{S_{n}\right\}_{n \in \mathbb{N}}$ is bounded. Since $S_{n} \rightarrow S_{\infty}$ in probability, the first term above tends to zero as $n \rightarrow \infty$.

For the second term, we peel off the terms in $X_{n}$ by conditioning. Indeed,

$$
\begin{aligned}
\mathbb{E}\left[\exp \left(\mathbf{i}\left\langle\lambda, X_{n}\right\rangle\right) \mid \mathscr{F}_{n-1}\right] & =\mathbb{E}\left[\exp \left(\mathbf{i}\left\langle\lambda, X_{n-1}+n^{-1 / 2} \xi_{n}\right\rangle\right) \mid \mathscr{F}_{n-1}\right] \\
& =\exp \left(\mathbf{i}\left\langle\lambda, X_{n-1}\right\rangle\right) \mathbb{E}\left[\exp \left(\mathbf{i}\left\langle\lambda, n^{-1 / 2} \xi_{n}\right\rangle\right) \mid \mathscr{F}_{n-1}\right]
\end{aligned}
$$

By Taylor expansion,

$$
\mathbb{E}\left[\exp \left(\mathbf{i}\left\langle\lambda, n^{-1 / 2} \xi_{n}\right\rangle\right) \mid \mathscr{F}_{n-1}\right]=\mathbb{E}\left[\left.1+\frac{\mathbf{i}}{n^{1 / 2}}\left\langle\lambda, \xi_{n}\right\rangle-\frac{1}{2 n}\left\langle\lambda, \xi_{n}\right\rangle^{2}+O\left(n^{-3 / 2}\right) \right\rvert\, \mathscr{F}_{n-1}\right]
$$

where the error term $O\left(n^{-3 / 2}\right)$ is uniform, due to the assumption of boundedness. By the martingale property, this equals

$$
1-\frac{1}{2 n}\left\langle\lambda, \Xi_{n} \lambda\right\rangle+O\left(n^{-3 / 2}\right)=\exp \left(-\frac{1}{2 n}\left\langle\lambda, \Xi_{n} \lambda\right\rangle+O\left(n^{-3 / 2}\right)\right)
$$

Hence,

$$
\begin{aligned}
\mathbb{E} \exp \left(\mathbf{i}\left\langle\lambda, X_{n}\right\rangle+\frac{1}{2}\left\langle\lambda, S_{n} \lambda\right\rangle\right) & =\mathbb{E} \exp \left(\mathbf{i}\left\langle\lambda, X_{n-1}\right\rangle+\frac{1}{2}\left\langle\lambda, S_{n} \lambda\right\rangle-\frac{1}{2 n}\left\langle\lambda, \Xi_{n} \lambda\right\rangle+O\left(n^{-3 / 2}\right)\right) \\
& =\mathbb{E} \exp \left(\mathbf{i}\left\langle\lambda, X_{n-1}\right\rangle+\frac{1}{2}\left\langle\lambda S_{n-1} \lambda\right\rangle+O\left(n^{-3 / 2}\right)\right)
\end{aligned}
$$

Iterating,

$$
\mathbb{E} \exp \left(\mathbf{i}\left\langle\lambda, X_{n}\right\rangle+\frac{1}{2}\left\langle\lambda, S_{n} \lambda\right\rangle\right)=\exp \left(O\left(n^{-1 / 2}\right)\right)
$$

so the second error term above also tends to zero.
This completes the proof of Theorem 12.3 since, if $n^{-1 / 2} \sum_{k=1}^{n} \xi_{k} \xrightarrow{\mathrm{~d}} \operatorname{normal}\left(0, S_{\infty}\right)$, it follows that $n^{-1 / 2} \sum_{k=1}^{n} A^{-1} \xi_{k} \xrightarrow{\mathrm{~d}} \operatorname{normal}\left(0, A^{-1} S_{\infty} A^{-1}\right)$.

General case. We now return to ASGD for a general function $f$. In this case, the CLT still holds, where we take $A=\nabla^{2} f\left(\theta^{\star}\right)$ to be the Hessian at the minimizer.

Theorem 12.8 (CLT for ASGD, general case). Assume that $f$ is a strongly convex, smooth, and has a bounded third derivative, and that the step sizes satisfy the condition (12.4). Assume that conditionally on $\theta_{n}$, each $\xi_{n+1}$ is mean zero and has covariance $\Xi_{n+1}$, such that $n^{-1} \sum_{k=1}^{n} \Xi_{k} \rightarrow S_{\infty}$ in probability and $\sup _{n \geq 1} \mathbb{E} \operatorname{tr} \Xi_{n}<\infty$. Then,

$$
\sqrt{n}\left(\bar{\theta}_{n}-\theta^{\star}\right) \xrightarrow{\mathrm{d}} \operatorname{normal}\left(0, A^{-1} S_{\infty} A^{-1}\right), \quad A:=\nabla^{2} f\left(\theta^{\star}\right)
$$

Write the iterate for ASGD as

$$
\begin{aligned}
\theta_{n+1} & =\theta_{n}-h_{n+1}\left(\nabla f\left(\theta_{n}\right)+\xi_{n+1}\right) \\
& =\theta_{n}-h_{n+1} A\left(\theta_{n}-\theta^{\star}\right)-h_{n+1} \xi_{n+1}-h_{n+1} \underbrace{\left(\nabla f\left(\theta_{n}\right)-A\left(\theta_{n}-\theta^{\star}\right)\right)}_{=: \zeta_{n}})
\end{aligned}
$$

which leads to

$$
\delta_{n+1}=\delta_{n}-h_{n+1} A \delta_{n}-h_{n+1}\left(\xi_{n+1}+\zeta_{n}\right)
$$

By applying the derivation of (12.5), replacing $\xi_{n+1}$ with $\xi_{n+1}+\zeta_{n}$, we obtain

$$
\sqrt{n} \bar{\delta}_{n}=\frac{1}{n^{1 / 2}} M_{0}^{n} \delta_{0}-\frac{1}{n^{1 / 2}} \sum_{k=1}^{n-1} A^{-1}\left(\xi_{k}+\zeta_{k-1}\right)-\frac{1}{n^{1 / 2}} \sum_{k=1}^{n-1}\left(M_{k}^{n}-A^{-1}\right)\left(\xi_{k}+\zeta_{k-1}\right)
$$

We must show that the extra terms involving the $\zeta_{k}$ 's vanish in the limit. Since the $M_{k}^{n}$ matrices are bounded, it suffices to show that

$$
\frac{1}{\sqrt{n}} \sum_{k=1}^{n} \mathbb{E}\left\|\zeta_{k}\right\| \rightarrow 0
$$

Since we assume that the third derivative of $f$ is bounded, Taylor expansion shows that

$$
\left\|\zeta_{n}\right\|=\left\|\nabla f\left(\theta_{n}\right)-\nabla^{2} f\left(\theta^{\star}\right)\left(\theta_{n}-\theta^{\star}\right)\right\| \lesssim\left\|\theta_{n}-\theta^{\star}\right\|^{2}
$$

By our usual argument, for $n$ large so that $h_{n}$ is small,

$$
\begin{aligned}
\mathbb{E}\left[\left\|\theta_{n+1}-\theta^{\star}\right\|^{2}\right] & =\mathbb{E}\left[\left\|\theta_{n}-\theta^{\star}\right\|^{2}-2 h_{n+1}\left\langle\nabla f\left(\theta_{n}\right), \theta_{n}-\theta^{\star}\right\rangle+h_{n+1}^{2}\left\|\hat{\nabla} f\left(\theta_{n}\right)\right\|^{2}\right] \\
& =\mathbb{E}\left[\left\|\theta_{n}-\theta^{\star}\right\|^{2}-2 h_{n+1}\left\langle\nabla f\left(\theta_{n}\right), \theta_{n}-\theta^{\star}\right\rangle\right]
\end{aligned}
$$

$$
\begin{aligned}
& +\mathbb{E}\left[h_{n+1}^{2}\left\|\nabla f\left(\theta_{n}\right)\right\|^{2}+h_{n+1}^{2}\left\|\hat{\nabla} f\left(\theta_{n}\right)-\nabla f\left(\theta_{n}\right)\right\|^{2}\right] \\
\leq & \mathbb{E}\left[\left(1-\alpha h_{n+1}\right)\left\|\theta_{n}-\theta^{\star}\right\|^{2}+h_{n+1}^{2} \operatorname{tr} \Xi_{n}\right] \\
= & \left(1-\alpha h_{n+1}\right) \mathbb{E}\left[\left\|\theta_{n}-\theta^{\star}\right\|^{2}\right]+O\left(h_{n+1}^{2}\right)
\end{aligned}
$$

Iterating,

$$
\mathbb{E}\left[\left\|\theta_{n}-\theta^{\star}\right\|^{2}\right] \leq \exp \left(-\alpha \sum_{k=1}^{n} h_{k}\right)\left\|\theta_{0}-\theta^{\star}\right\|^{2}+\sum_{k=1}^{n} O\left(h_{k}^{2}\right) \exp \left(-\alpha \sum_{\ell=k+1}^{n} h_{\ell}\right) .
$$

The estimate for the summation in the second term is similar to the computation that appears in Lemma 12.5, except that it corresponds to the integral

$$
I^{\prime}:=\int_{1}^{n} \frac{1}{k^{2 \gamma}} \exp (-\alpha(\tau(n)-\tau(k))) \mathrm{d} k
$$

A trickier calculation eventually shows that

$$
\begin{equation*}
\mathbb{E}\left[\left\|\theta_{n}-\theta^{\star}\right\|^{2}\right] \leq \exp \left(-\Omega\left(n^{1-\gamma}\right)\right)\left\|\theta_{0}-\theta^{\star}\right\|^{2}+O\left(n^{-\gamma}\right)=O\left(n^{-\gamma}\right) . \tag{12.6}
\end{equation*}
$$

Hence,

$$
\frac{1}{\sqrt{n}} \sum_{k=1}^{n} \mathbb{E}\left\|\zeta_{k}\right\| \lesssim \frac{1}{\sqrt{n}} \sum_{k=1}^{n} \mathbb{E}\left[\left\|\theta_{k}-\theta^{\star}\right\|^{2}\right] \lesssim \frac{1}{\sqrt{n}} \sum_{k=1}^{n} \frac{1}{k^{\gamma}} \asymp n^{1 / 2-\gamma} .
$$

This tends to zero provided $\gamma>1 / 2$, completing the proof of Theorem 12.8.

Application to parameter recovery. We now consider the example of parameter recovery in a parametric family of densities $\left\{p_{\theta}\right\}_{\theta \in \Theta}$. Write $\ell(\theta ; z):=\log \left(1 / p_{\theta}(z)\right)$. In this case, the empirical risk minimizer $\widehat{\theta}_{n}$ corresponds to the maximum likelihood estimator (MLE), and if $Z_{1}, \ldots, Z_{n} \stackrel{\text { i.i.d. }}{\sim} p_{\theta^{\star}}$, the population minimizer is indeed $\theta^{\star}$ (provided that the model is identifiable).

Consider one-pass averaged SGD, so that

$$
\xi_{k+1}=\nabla_{\theta} \ell\left(\theta_{k} ; Z_{k+1}\right)-\int \nabla_{\theta} \ell\left(\theta_{k} ; z\right) p_{\theta^{\star}}(\mathrm{d} z)
$$

This is conditionally unbiased, and if we define

$$
I(\theta):=\operatorname{cov}_{p_{\theta^{\star}}} \nabla_{\theta} \ell(\theta ; Z)
$$

then $\Xi_{k+1}=I\left(\theta_{k}\right)$. Now, adopt the following assumptions:

- For each $z \in Z$, the function $\theta \mapsto \ell(\theta ; z)$ is strongly convex, smooth, and has a bounded third derivative.
- $I(\cdot)$ is Lipschitz continuous.

The second assumption, together with the fact that $\theta_{n} \rightarrow \theta^{\star}$ in probability by (12.6), implies that $\Xi_{n}=I\left(\theta_{n-1}\right) \rightarrow I\left(\theta^{\star}\right)$ in probability, hence $n^{-1} \sum_{k=1}^{n} \Xi_{k} \rightarrow I\left(\theta^{\star}\right)$ in probability as well. Actually, since $\mathbb{E}\left\|I\left(\theta_{n-1}\right)-I\left(\theta^{\star}\right)\right\|_{\mathrm{op}} \lesssim \mathbb{E}\left\|\theta_{n-1}-\theta^{\star}\right\| \rightarrow 0$, it readily implies that $\sup _{n \in \mathbb{N}} \mathbb{E} \operatorname{tr} \Xi_{n}<\infty$. All of the assumptions of Theorem 12.8 are met.

The value of $I(\cdot)$ at $\theta^{\star}$ is special: it is called the Fisher information matrix and we denote it by $\mathscr{F}$ :

$$
\mathscr{I}:=I\left(\theta^{\star}\right)=\operatorname{cov}_{p_{\theta^{\star}}} \nabla_{\theta} \ell\left(\theta^{\star} ; Z\right) .
$$

Since

$$
\begin{aligned}
\int \nabla_{\theta} \ell(\theta ; z) p_{\theta}(\mathrm{d} z) & =-\int \nabla_{\theta} \log p_{\theta}(z) p_{\theta}(\mathrm{d} z)=-\int \nabla_{\theta} p_{\theta}(z) \mathrm{d} z \\
& =-\nabla_{\theta} \int p_{\theta}(\mathrm{d} z)=0
\end{aligned}
$$

it follows that

$$
\begin{aligned}
0 & =\nabla_{\theta} \int \nabla_{\theta} \ell\left(\theta^{\star} ; z\right) p_{\theta^{\star}}(\mathrm{d} z)=\int \nabla_{\theta}^{2} \ell\left(\theta^{\star} ; z\right) p_{\theta^{\star}}(\mathrm{d} z)+\int \nabla_{\theta} \ell\left(\theta^{\star} ; z\right) \otimes \nabla_{\theta} p_{\theta^{\star}}(z) \mathrm{d} z \\
& =\int \nabla_{\theta}^{2} \ell\left(\theta^{\star} ; z\right) p_{\theta^{\star}}(\mathrm{d} z)-\int \nabla_{\theta} \ell\left(\theta^{\star} ; z\right) \otimes \nabla_{\theta} \ell\left(\theta^{\star} ; z\right) p_{\theta^{\star}}(\mathrm{d} z)
\end{aligned}
$$

Combined with the fact that $\int \nabla_{\theta} \ell\left(\theta^{\star} ; z\right) p_{\theta^{\star}}(\mathrm{d} z)=0$, we can identify the second term above as $\operatorname{cov}_{p_{\theta^{\star}}} \nabla_{\theta} \ell\left(\theta^{\star} ; Z\right)$, hence

$$
\mathcal{I}=\int \nabla_{\theta}^{2} \ell\left(\theta^{\star} ; z\right) p_{\theta^{\star}}(\mathrm{d} z)=\nabla^{2} \mathcal{R}\left(\theta^{\star}\right)
$$

since $\mathcal{R}(\theta)=\int \ell(\theta ; z) p_{\theta^{\star}}(\mathrm{d} z)$ for every $\theta \in \Theta$. Therefore, Theorem 12.8 implies

$$
\sqrt{n}\left(\bar{\theta}_{n}-\theta^{\star}\right) \xrightarrow{\mathrm{d}} \operatorname{normal}\left(0, \mathscr{I}^{-1}\right) .
$$

On the other hand, it is classical that under these assumptions, the MLE also has an asymptotically Gaussian limit:

$$
\sqrt{n}\left(\widehat{\theta}_{n}-\theta^{\star}\right) \xrightarrow{\mathrm{d}} \operatorname{normal}\left(0, \mathscr{I}^{-1}\right) .
$$

This is a celebrated result in statistics because the asymptotic covariance $\mathscr{F}^{-1}$ is also a lower bound on the covariance of any unbiased estimator of $\theta^{\star}$, by the Cramér-Rao or information inequality. Moreover, via comparison of experiments, it is known that no estimator can perform better than the MLE, in the sense that the MLE is locally asymptotically minimax optimal. We have just shown that this asymptotic optimality property also carries over to Polyak-Ruppert averaging of SGD. Finally, we remark that when $p_{\theta}=\operatorname{normal}\left(\theta, A^{-1}\right)$, this encompasses Example 12.4.

### 12.4 Variance reduction

In §12.2, we argued that the generalization bounds for GD and SGD are comparable, yet the overall computational cost for GD is roughly $n$ times larger due to the larger per-iteration cost. In making this comparison, our assumption was that we do not aim to completely minimize the empirical risk; we simply want the optimization error to be comparable to the statistical error. However, if our goal is indeed to fully minimize the empirical risk $\mathcal{R}_{n}$, then GD can be faster than SGD for high-accuracy solutions.

In this section, the structural assumption we impose on the objective $f$ is that it is a finite sum of $n$ functions:

$$
f=\frac{1}{n} \sum_{i=1}^{n} f_{i}
$$

In this setting, it makes sense to measure the complexity in terms of the number of gradient evaluations of the individual functions $f_{i}$.

For example, in the convex and smooth setting, assume that the cost of computing the full gradient of $\mathcal{R}_{n}$ is $n$ times larger than the cost of computing the gradient of a single term (corresponding to a single sample). Then, in order to obtain an $\varepsilon$-approximate minimizer of $\mathcal{R}_{n}$, the overall computational cost for GD is $O\left(n \beta R^{2} / \varepsilon\right)$ (Theorem 3.4). For SGD, we take our stochastic gradient $\hat{\nabla} f(x)$ to be $\nabla f_{i}(x)$ for a randomly chosen index $i \sim$ uniform $([n])$. Then, the variance of the stochastic gradient is

$$
\begin{aligned}
\frac{1}{n} \sum_{i=1}^{n} & \left\|\nabla f_{i}(x)-\nabla f(x)\right\|^{2} \\
& \lesssim \frac{1}{n} \sum_{i=1}^{n}\left\|\nabla f_{i}\left(x_{\star}\right)\right\|^{2}+\frac{1}{n} \sum_{i=1}^{n}\left\|\nabla f_{i}(x)-\nabla f_{i}\left(x_{\star}\right)\right\|^{2}+\left\|\nabla f(x)-\nabla f\left(x_{\star}\right)\right\|^{2} \\
& \lesssim \underbrace{\frac{1}{n} \sum_{i=1}^{n}\left\|\nabla f_{i}\left(x_{\star}\right)\right\|^{2}}_{c_{0}}+\underbrace{\beta^{2}}_{c_{1}}\left\|x-x_{\star}\right\|^{2} .
\end{aligned}
$$

We can apply (a variant of) Exercise 12.1 to conclude that for sufficiently small $\varepsilon$, the complexity of SGD is $O\left(c_{0} R^{2} / \varepsilon^{2}\right)$. In the strongly convex and smooth setting, the rates are $\widetilde{O}\left(n \kappa \log \left(\alpha R^{2} / \varepsilon\right)\right)$ and $\widetilde{O}\left(c_{0} /(\alpha \varepsilon)\right)$ respectively. In general, these rates are incomparable.

In this section, we show that we can improve upon these rates through a technique known as variance reduction. Namely, the method we develop runs in a number of iterations comparable to GD, but with a per-iteration cost comparable to SGD.

To see why there is a possibility for variance reduction, note that if we run SGD, the variance of the stochastic gradient is bounded away from zero-even at the minimizer $x_{\star}$-due to the presence of the $c_{0}$ term. However, if the iterates of the algorithm are converging to the minimizer, $x_{n} \rightarrow x_{\star}$, then we can hope that the variance of the gradient estimator also tends to zero.

This intuition is carried out by the family of variance reduction methods, of which we pick one representative one: stochastic variance reduced gradient descent (SVRG) [JZ13]. We generalize our setting to a composite objective:

$$
F=f+g=\frac{1}{n} \sum_{i=1}^{n} f_{i}+g
$$

The algorithm proceeds via "epochs", where the $t$-th epoch runs for $N_{t}$ iterations. In the $t$-th epoch, we initialize $x_{0}^{t}:=x_{N_{t-1}}^{t-1}$ (that is, we start the $t$-epoch at the last iterate of the previous epoch). The algorithm is described as follows:

$$
\begin{align*}
& x_{n+1}^{t}:=\underset{x \in \mathbb{R}^{d}}{\arg \min }\left\{\left\langle\hat{\nabla}_{n}^{t} f, x-x_{n}^{t}\right\rangle+g(x)+\frac{1}{2 h}\left\|x-x_{t}^{n}\right\|^{2}\right\},  \tag{SVRG}\\
& \hat{\nabla}_{n}^{t} f:=\nabla f_{i_{n}^{t}}\left(x_{n}^{t}\right)-\nabla f_{i_{n}^{t}}\left(\bar{x}_{0}^{t}\right)+\nabla f\left(\bar{x}_{0}^{t}\right), \quad i_{n}^{t} \sim \text { uniform }([n]) .
\end{align*}
$$

Here, $\bar{x}_{0}^{t}$ is a certain average of iterates from the previous epoch $t-1$. Note that in each epoch, we compute (and store) the full gradient $\nabla f\left(\bar{x}_{0}^{t}\right)$, which requires $n$ gradient computations, and then each subsequent iteration requires only one gradient computation. Therefore, the $t$-th epoch requires $n+N_{t}$ gradient computations, and the total cost after $T$ epochs is $T n+\sum_{t=0}^{T-1} N_{t}$.

The intuition here is that if we take the expectation over $i_{n}^{t}$, then

$$
\mathbb{E} \hat{\nabla}_{n}^{t} f=\mathbb{E}\left[\nabla f_{i_{n}^{t}}\left(x_{n}^{t}\right)-\nabla f_{i_{n}^{t}}\left(\bar{x}_{0}^{t}\right)+\nabla f\left(\bar{x}_{0}^{t}\right)\right]=\nabla f\left(x_{n}^{t}\right),
$$

so the gradient estimator is indeed unbiased. But the extra centered term that we added to the gradient estimator, $-\nabla f_{i_{n}^{t}}\left(\bar{x}_{0}^{t}\right)+\nabla f\left(\bar{x}_{0}^{t}\right)$, reduces the variance: since $\bar{x}_{0}^{t}, x_{n}^{t} \rightarrow x_{\star}$, we expect that

$$
\hat{\nabla}_{n}^{t} f-\nabla f\left(x_{n}^{t}\right)=\nabla f_{i_{n}^{t}}\left(x_{n}^{t}\right)-\nabla f_{i_{n}^{t}}\left(\bar{x}_{0}^{t}\right)+\nabla f\left(\bar{x}_{0}^{t}\right)-\nabla f\left(x_{n}^{t}\right) \rightarrow 0
$$

Theorem 12.9 (convergence of SVRG). Assume that $f$ is $\alpha_{f}$-convex and $\beta$-smooth, and that $g$ is $\alpha_{g}$-convex. Then, the following assertions hold for a suitable choice of step size $h$ and averaged iterate $\bar{x}_{0}^{t}$. Let $\Delta_{0}:=F\left(x_{0}\right)-F_{\star}+\beta\left\|x_{0}-x_{\star}\right\|^{2}$.

- If $\alpha_{f}+\alpha_{g}=0$, then SVRG can achieve $\mathbb{E} F\left(\bar{x}_{0}^{T}\right)-F_{\star} \leq \varepsilon$ with a total number of gradient evaluations at most $O\left(n \log \left(\Delta_{0} / \varepsilon\right)+\Delta_{0} / \varepsilon\right)$.
- If $\alpha_{f}+\alpha_{g}>0$, then SVRG can achieve $\mathbb{E} F\left(\bar{x}_{0}^{T}\right)-F_{\star} \leq \varepsilon$ with a total number of gradient evaluations at most $O\left((n+\kappa) \log \left(\Delta_{0} / \varepsilon\right)\right)$, where $\kappa:=\beta /\left(\alpha_{f}+\alpha_{g}\right)$, where $\kappa:=\beta /\left(\alpha_{f}+\alpha_{g}\right)$.

Proof. We start by analyzing a single epoch; thus, for simplicity of notation, we drop the superscript $t$. The one-step inequality for SGD (see Theorem 12.1) shows that

$$
\begin{gathered}
\mathbb{E} F\left(x_{n+1}\right)-F_{\star} \leq \frac{1-\alpha_{f} h}{2 h} \mathbb{E}\left[\left\|x_{n}-x_{\star}\right\|^{2}\right]-\frac{1+\alpha_{g} h}{2 h} \mathbb{E}\left[\left\|x_{n+1}-x_{\star}\right\|^{2}\right] \\
+h \mathbb{E}\left[\left\|\hat{\nabla}_{n} f-\nabla f\left(x_{n}\right)\right\|^{2}\right]
\end{gathered}
$$

We upper bound the variance of the stochastic gradient: by (3.4),

$$
\begin{aligned}
\mathbb{E}[\| & \left.\nabla f_{i_{n}}\left(x_{n}\right)-\nabla f_{i_{n}}\left(\bar{x}_{0}\right)+\nabla f\left(\bar{x}_{0}\right)-\nabla f\left(x_{n}\right) \|^{2}\right] \leq \mathbb{E}\left[\left\|\nabla f_{i_{n}}\left(x_{n}\right)-\nabla f_{i_{n}}\left(\bar{x}_{0}\right)\right\|^{2}\right] \\
& \leq 2 \mathbb{E}\left[\left\|\nabla f_{i_{n}}\left(x_{n}\right)-\nabla f_{i_{n}}\left(x_{\star}\right)\right\|^{2}\right]+2 \mathbb{E}\left[\left\|\nabla f_{i_{n}}\left(\bar{x}_{0}\right)-\nabla f_{i_{n}}\left(x_{\star}\right)\right\|^{2}\right] \\
& \leq 2 \beta \mathbb{E}\left[D_{f_{i_{n}}}\left(x_{n}, x_{\star}\right)+D_{f_{i_{n}}}\left(\bar{x}_{0}, x_{\star}\right)\right]=2 \beta \mathbb{E}\left[D_{f}\left(x_{n}, x_{\star}\right)+D_{f}\left(\bar{x}_{0}, x_{\star}\right)\right] \\
& \leq 2 \beta \mathbb{E}\left[D_{F}\left(x_{n}, x_{\star}\right)+D_{F}\left(\bar{x}_{0}, x_{\star}\right)\right]=2 \beta \mathbb{E}\left[F\left(x_{n}\right)-F_{\star}+F\left(\bar{x}_{0}\right)-F_{\star}\right]
\end{aligned}
$$

Note that this already captures the intuition above, namely, the variance decreases with the objective gap. Therefore, we end up with the recursion

$$
\begin{gathered}
\mathbb{E} F\left(x_{n+1}\right)-F_{\star} \leq \frac{1-\alpha_{f} h}{2 h} \mathbb{E}\left[\left\|x_{n}-x_{\star}\right\|^{2}\right]-\frac{1+\alpha_{g} h}{2 h} \mathbb{E}\left[\left\|x_{n+1}-x_{\star}\right\|^{2}\right] \\
+2 \beta h \mathbb{E}\left[F\left(x_{n}\right)-F_{\star}+F\left(\bar{x}_{0}\right)-F_{\star}\right] .
\end{gathered}
$$

We now choose $h=1 /(8 \beta)$ so that $2 \beta h=1 / 4$. After dividing by $1+\alpha_{g} h$ and iterating using Lemma 3.5, it yields

$$
\begin{aligned}
\frac{\mathbb{E}\left[\left\|x_{N}-x_{\star}\right\|^{2}\right]}{2 h} \leq & \frac{\lambda_{h}^{N} \mathbb{E}\left[\left\|x_{0}-x_{\star}\right\|^{2}\right]}{2 h} \\
& +\underbrace{\sum_{n=1}^{N} \lambda_{h}^{N-n}\left(\frac{1}{4}\left\{\mathbb{E} F\left(x_{n-1}\right)-F_{\star}+\mathbb{E} F\left(\bar{x}_{0}\right)-F_{\star}\right\}-\left\{\mathbb{E} F\left(x_{n}\right)-F_{\star}\right\}\right)}_{=(\star)} .
\end{aligned}
$$

Since by assumption $1 /\left(4 \lambda_{h}\right) \leq 1 / 3$, the last summation is at most

$$
\begin{aligned}
(\star)= & -\sum_{n=1}^{N} \lambda_{h}^{N-n}\left(1-\frac{1}{4 \lambda_{h}}\right)\left(\mathbb{E} F\left(x_{n}\right)-F_{\star}\right)-\frac{1}{4 \lambda_{h}}\left(\mathbb{E} F\left(x_{N}\right)-F_{\star}\right) \\
& +\frac{\lambda_{h}^{N-1}}{4}\left(\mathbb{E} F\left(x_{0}\right)-F_{\star}\right)+\frac{S}{4}\left(\mathbb{E} F\left(\bar{x}_{0}\right)-F_{\star}\right) \\
\leq- & \frac{2}{3} \sum_{n=1}^{N} \lambda_{h}^{N-n}\left(\mathbb{E} F\left(x_{n}\right)-F_{\star}\right)-\frac{1}{4 \lambda_{h}}\left(\mathbb{E} F\left(x_{N}\right)-F_{\star}\right) \\
& +\frac{\lambda_{h}^{N-1}}{4}\left(\mathbb{E} F\left(x_{0}\right)-F_{\star}\right)+\frac{S}{3}\left(\mathbb{E} F\left(\bar{x}_{0}\right)-F_{\star}\right),
\end{aligned}
$$

where $S:=\sum_{n=0}^{N-1} \lambda_{h}^{n}$. Thus, the above inequality can be rearranged to yield

$$
\begin{aligned}
& \frac{\lambda_{h}^{N} \mathbb{E}\left[\left\|x_{0}-x_{\star}\right\|^{2}\right]}{2 h S}+\frac{\lambda_{h}^{N-1}}{4 S}\left(\mathbb{E} F\left(x_{0}\right)-F_{\star}\right)+\frac{1}{3}\left(\mathbb{E} F\left(\bar{x}_{0}\right)-F_{\star}\right) \\
& \quad \geq \frac{\mathbb{E}\left[\left\|x_{N}-x_{\star}\right\|^{2}\right]}{2 h S}+\frac{1}{4 \lambda_{h} S}\left(\mathbb{E} F\left(x_{N}\right)-F_{\star}\right)+\frac{2}{3} \sum_{n=1}^{N} \frac{\lambda_{h}^{N-n}}{S}\left(\mathbb{E} F\left(x_{n}\right)-F_{\star}\right)
\end{aligned}
$$

The goal now is to make this inequality telescope across the epochs. We recall that $x_{0}^{t+1}=x_{N_{t}}^{t}$, and we define $\bar{x}_{0}^{t+1}:=S_{t}^{-1} \sum_{n=1}^{N_{t}} \lambda_{h}^{N_{t}-n} x_{n}^{t}$, where $S_{t}:=\sum_{n=0}^{N_{t}} \lambda_{h}^{n}$. By applying convexity to the last term, the inequality can be rewritten

$$
\begin{aligned}
& \frac{\lambda_{h}^{N_{t}} \mathbb{E}\left[\left\|x_{0}^{t}-x_{\star}\right\|^{2}\right]}{2 h S_{t}}+\frac{\lambda_{h}^{N_{t}-1}}{4 S_{t}}\left(\mathbb{E} F\left(x_{0}^{t}\right)-F_{\star}\right)+\frac{1}{3}\left(\mathbb{E} F\left(\bar{x}_{0}^{t}\right)-F_{\star}\right) \\
& \quad \geq \frac{\mathbb{E}\left[\left\|x_{0}^{t+1}-x_{\star}\right\|^{2}\right]}{2 h S_{t}}+\frac{1}{4 \lambda_{h} S_{t}}\left(\mathbb{E} F\left(x_{0}^{t+1}\right)-F_{\star}\right)+\frac{2}{3}\left(\mathbb{E} F\left(\bar{x}_{0}^{t+1}\right)-F_{\star}\right)
\end{aligned}
$$

We now divide the proof up into two cases.
Convex case. In this case, $\lambda_{h}=1$, so $S_{t}=N_{t}$. Here, we set $N_{t+1}=2 N_{t}$, which leads to

$$
\begin{aligned}
& \frac{\mathbb{E}\left[\left\|x_{0}^{t}-x_{\star}\right\|^{2}\right]}{2 h N_{t}}+\frac{1}{4 N_{t}}\left(\mathbb{E} F\left(x_{0}^{t}\right)-F_{\star}\right)+\frac{1}{3}\left(\mathbb{E} F\left(\bar{x}_{0}^{t}\right)-F_{\star}\right) \\
& \quad \geq 2\left[\frac{\mathbb{E}\left[\left\|x_{0}^{t+1}-x_{\star}\right\|^{2}\right]}{2 h N_{t+1}}+\frac{1}{4 N_{t+1}}\left(\mathbb{E} F\left(x_{0}^{t+1}\right)-F_{\star}\right)+\frac{1}{3}\left(\mathbb{E} F\left(\bar{x}_{0}^{t+1}\right)-F_{\star}\right)\right] .
\end{aligned}
$$

The inequality clearly telescopes and shows that $\mathbb{E} F\left(\bar{x}_{0}^{T}\right)-F_{\star} \leq \varepsilon$ after $T$ epochs, where $T \leq \log _{2}\left[O\left(F\left(x_{0}\right)-F_{\star}+\beta\left\|x_{0}-x_{\star}\right\|^{2}\right) / \varepsilon\right]$ and $h \asymp 1 / \beta$. The number of gradient evaluations is $T n+\sum_{t=0}^{T-1} N_{t}=T n+2^{T}$, which yields the final result.

Strongly convex case. In this case, we set $N_{t}=N$ for all $t$, where $N$ is chosen so that $\lambda_{h}^{N} \leq 1 / 2$. With $h \asymp 1 / \beta$, this leads to $N \asymp \kappa$ and

$$
\begin{aligned}
& \frac{\mathbb{E}\left[\left\|x_{0}^{t}-x_{\star}\right\|^{2}\right]}{4 h S}+\frac{1}{8 \lambda_{h} S}\left(\mathbb{E} F\left(x_{0}^{t}\right)-F_{\star}\right)+\frac{1}{3}\left(\mathbb{E} F\left(\bar{x}_{0}^{t}\right)-F_{\star}\right) \\
& \quad \geq 2\left[\frac{\mathbb{E}\left[\left\|x_{0}^{t+1}-x_{\star}\right\|^{2}\right]}{4 h S}+\frac{1}{8 \lambda_{h} S}\left(\mathbb{E} F\left(x_{0}^{t+1}\right)-F_{\star}\right)+\frac{1}{3}\left(\mathbb{E} F\left(\bar{x}_{0}^{t+1}\right)-F_{\star}\right)\right] .
\end{aligned}
$$

Again, this telescopes, and the computational cost is $T n+T N=O(T(n+\kappa))$.
The result of Theorem 12.9 indeed improves upon the rates for GD. Before presenting the final rate comparison, however, we note that the rates in Theorem 12.9 are generally incomparable with the ones achieved via acceleration, i.e., for AGD. One can ask whether acceleration can also be combined with variance reduction, and the answer is yes; we state a representative result from [Sha+18].

Theorem 12.10 (accelerated SVRG). Assume that each $f_{i}$ is convex and $\beta_{i}$-smooth, and that $g$ is $\alpha$-convex. ${ }^{\dagger}$ Then, there is an algorithm which achieves the following guarantees. Let $\Delta_{0}:=F\left(x_{0}\right)-F_{\star}+\beta\left\|x_{0}-x_{\star}\right\|^{2}$.

- If $\alpha=0$, then the algorithm obtains an $\varepsilon$-approximate solution with a total number of gradient evaluations at most $O\left(n \log \left(\Delta_{0} / \varepsilon\right)+\sqrt{n \Delta_{0} / \varepsilon}\right)$.
- If $\alpha>0$, then the algorithm obtains an $\varepsilon$-approximate solution with a total number of gradient evaluations at most $O\left((n+\sqrt{n k}) \log \left(\Delta_{0} / \varepsilon\right)\right)$.
${ }^{\dagger}$ The cited paper works under slightly different assumptions compared to Theorem 12.9, but they are broadly comparable.

These accelerated rates are almost the best possible due to nearly matching lower bounds [WS16]. Interestingly, in this setting, randomness is crucial for attaining the optimal complexity; otherwise, among the class of deterministic algorithms, AGD is the best possible (but strictly worse than Theorem 12.10).

The rates for the finite sum setting are presented in Table 3.

## Bibliographical notes

In the convex, Lipschitz setting, a detailed study of the role of geometry in stochastic optimization (and in particular, when it is necessary to use non-linear methods such as mirror descent) can be found in [CLD25].

| Algorithm | Iterations (Convex) | Iterations (Strongly Convex) |
| :---: | :---: | :---: |
| $\mathrm{SGD}^{\dagger}$ | $O\left(c_{0} R^{2} / \varepsilon^{2}\right)$ | $O\left(c_{0} /(\alpha \varepsilon)\right)$ |
| GD | $O\left(n \Delta_{0} / \varepsilon\right)$ | $O\left(n \kappa \log \left(\Delta_{0} / \varepsilon\right)\right)$ |
| AGD | $O\left(n \sqrt{\Delta_{0} / \varepsilon}\right)$ | $O\left(n \sqrt{\kappa} \log \left(\Delta_{0} / \varepsilon\right)\right)$ |
| SVRG | $O\left(n \log \left(\Delta_{0} / \varepsilon\right)+\Delta_{0} / \varepsilon\right)$ | $O\left((n+\kappa) \log \left(\Delta_{0} / \varepsilon\right)\right)$ |
| ASVRG | $O\left(n \log \left(\Delta_{0} / \varepsilon\right)+\sqrt{\Delta_{0} / \varepsilon}\right)$ | $O\left((n+\sqrt{n \kappa}) \log \left(\Delta_{0} / \varepsilon\right)\right)$ |

Table 3: Rates for finite sum minimization.

For more discussion on the statistical performance of SGD, see [Bac24]. For an exposition to empirical process theory and statistics, see any standard reference, e.g., [Wai19].

The CLT for ASGD was first established in [PJ92]. The treatment of the martingale CLT follows [Bil95]. For an exposition to asymptotic statistics, see [Vaa98].

The proof of Theorem 12.9 is inspired by [AY16], although care was taken to unify the convex and strongly convex proofs.

## Exercises

Exercise 12.1. Often, stochastic gradients do not have uniformly bounded variance. For example, suppose we have the objective function $f: x \mapsto \frac{1}{2 n} \sum_{i=1}^{n}\left\langle a_{i}, x\right\rangle^{2}$, with stochastic gradient $\hat{\nabla} f(x)=\left\langle a_{i}, x\right\rangle a_{i}$ with $i \sim$ uniform $([n])$. Then, the variance of the stochastic gradient is

$$
\mathbb{E}\left[\|\hat{\nabla} f(x)-\nabla f(x)\|^{2}\right]=\frac{1}{n} \sum_{i=1}^{n}\left\|\left(a_{i} a_{i}^{\top}-\frac{1}{n} \sum_{j=1}^{n} a_{j} a_{j}^{\top}\right) x\right\|^{2},
$$

which grows quadratically with $\|x\|$.
Assume therefore that $f$ is $\alpha$-strongly convex and $\beta$-smooth with respect to the Euclidean norm, and that the following variance condition holds:

$$
\mathbb{E}\left[\|\hat{\nabla} f(x)-\nabla f(x)\|^{2}\right] \leq c_{0}+c_{1}\left\|x-x_{\star}\right\|^{2} \quad \text { for all } x \in \mathbb{R}^{d} .
$$

Show that the iterates of stochastic gradient descent satisfy the following guarantee. If $\varepsilon$ is sufficiently small and the step size $h$ is chosen appropriately, then $\mathbb{E} f\left(\bar{x}_{N}\right)-f_{\star} \leq \varepsilon$ for a suitably averaged iterate $\bar{x}_{N}$ and all

$$
N \gtrsim \frac{c_{0}}{\alpha \varepsilon} \log \frac{\alpha\left\|x_{0}-x_{\star}\right\|^{2}}{\varepsilon} .
$$

Exercise 12.2. Let $f: \mathbb{R}^{d} \rightarrow \mathbb{R}$ be $\alpha$-PŁ and $\beta$-smooth, $\kappa:=\beta / \alpha$. Assume that we have access to a stochastic gradient $\hat{\nabla} f$ which is unbiased and satisfies the variance bound (12.1) for the Euclidean norm $\|\cdot\|$. Prove that SGD with step size $h \leq 1 / \beta$ achieves the bound

$$
\mathbb{E} f\left(x_{N}\right)-f_{\star} \leq(1-\alpha h)^{N}\left(f\left(x_{0}\right)-f_{\star}\right)+\frac{\kappa \sigma^{2} d h}{2}
$$

What rate does this imply to reach $\mathbb{E} f\left(x_{N}\right)-f_{\star} \leq \varepsilon$ ?
Exercise 12.3. Consider linear regression with fixed design: our dataset is $\left\{\left(X_{i}, Y_{i}\right)\right\}_{i \in[n]}$, where the covariates $X_{i}$ are deterministic and fixed, and the $Y_{i}$ are independent with

$$
Y_{i}=\left\langle\theta^{\star}, X_{i}\right\rangle+\xi_{i}, \quad \xi_{i} \sim \operatorname{normal}\left(0, \sigma^{2} I\right)
$$

The empirical and population risks are

$$
\mathcal{R}_{n}(\theta):=\frac{1}{n} \sum_{i=1}^{n}\left(Y_{i}-\left\langle\theta, X_{i}\right\rangle\right)^{2}, \quad \mathcal{R}(\theta):=\mathbb{E} \mathcal{R}_{n}(\theta)
$$

1. Show that the population risk is given by $\mathcal{R}(\theta)=\sigma^{2}+\left\|X\left(\theta-\theta^{\star}\right)\right\|^{2} / n$, where $X \in \mathbb{R}^{n \times d}$ is the matrix whose rows are $\left\{X_{i}^{\top}\right\}_{i \in[n]}$.
2. Show that the ERM of minimal norm is the least-squares estimator $\widehat{\theta}_{n}=\left(X^{\top} X\right)^{\dagger} X^{\top} Y$, where ${ }^{\dagger}$ denotes the Moore-Penrose pseudoinverse. Show that the excess risk of the ERM is given by

$$
\mathbb{E} \mathcal{R}\left(\widehat{\theta}_{n}\right)-\mathcal{R}\left(\theta^{\star}\right)=\frac{\sigma^{2} \operatorname{rank} X}{n}
$$

3. Consider the iterates of GD on the empirical risk $\mathcal{R}_{n}$. Show that for a step size $h$ sufficiently small, it holds that

$$
\mathbb{E} \mathcal{R}\left(\theta_{N}\right)-\mathcal{R}\left(\theta^{\star}\right) \leq \frac{\sigma^{2} \operatorname{rank} X}{n}+O\left(\frac{\left\|\theta_{0}-\theta^{\star}\right\|^{2}}{N h}\right) .
$$

Hints: For all of these parts, make extensive use of the singular value decomposition of $X$. For the third part, write an exact recursion for $\theta_{k}-\theta^{\star}$, iterate this recursion, and then compute the excess risk. Use the fact that $\max _{x \in[0,1]} x(1-x)^{N} \lesssim 1 / N$ for $N \geq 1$.

## 13 Interior point methods

We present polynomial-time methods for solving linear programs (LPs) and semidefinite programs (SDPs), among other structured optimization problems, through the family of interior point methods.

### 13.1 Self-concordant analysis of Newton's method

We begin with an analysis of Newton's method: to minimize a function $f: \mathbb{R}^{d} \rightarrow \mathbb{R}$, we consider the iteration

$$
\begin{equation*}
x_{n+1}=x_{n}-\left[\nabla^{2} f\left(x_{n}\right)\right]^{-1} \nabla f\left(x_{n}\right) \tag{NM}
\end{equation*}
$$

The method is derived as follows: consider the local quadratic approximation of $f$ around the current iterate $x_{n}$ :

$$
f(x) \approx f\left(x_{n}\right)+\left\langle\nabla f\left(x_{n}\right), x-x_{n}\right\rangle+\frac{1}{2}\left\langle x-x_{n}, \nabla^{2} f\left(x_{n}\right)\left(x-x_{n}\right)\right\rangle .
$$

It is straightforward to check that, provided $\nabla^{2} f\left(x_{n}\right)>0$, the minimizer of the quadratic approximation is given by the next iterate $x_{n+1}$ of NM. Unlike the methods we have studied thus far, Newton's method is a second-order method in that it uses Hessian information. Since the Hessian of $f$ may not even be invertible everywhere if $f$ is not strictly convex, Newton's method is not always well-defined, and we certainly cannot expect Newton's method to converge globally without further assumptions. However, unlike first-order methods, Newton's method exhibits local quadratic convergence.

Theorem 13.1 (local quadratic convergence of NM). Assume that $\nabla^{2} f\left(x_{\star}\right) \geq \alpha I>0$ and that $\nabla^{2} f$ is $\gamma$-Lipschitz in the operator norm:

$$
\left\|\nabla^{2} f(x)-\nabla^{2} f(y)\right\|_{\mathrm{op}} \leq \gamma\|x-y\| \quad \text { for all } x, y \in \mathbb{R}^{d} .
$$

Then, provided $\left\|x_{0}-x_{\star}\right\| \leq \alpha /(2 \gamma)$, NM satisfies

$$
\begin{equation*}
\left\|x_{n+1}-x_{\star}\right\| \leq \frac{\gamma}{\alpha}\left\|x_{n}-x_{\star}\right\|^{2} \leq \frac{1}{2}\left\|x_{n}-x_{\star}\right\| . \tag{13.1}
\end{equation*}
$$

Proof. By Taylor expansion,

$$
x_{n+1}-x_{\star}=x_{n}-x_{\star}-\left[\nabla^{2} f\left(x_{n}\right)\right]^{-1} \nabla f\left(x_{n}\right)
$$

$$
\begin{aligned}
& =\left[\nabla^{2} f\left(x_{n}\right)\right]^{-1} \int_{0}^{1}\left[\nabla^{2} f\left(x_{n}\right)-\nabla^{2} f\left((1-t) x_{\star}+t x_{n}\right)\right]\left(x_{n}-x_{\star}\right) \mathrm{d} t \\
\left\|x_{n+1}-x_{\star}\right\| & \leq \gamma\left\|\left[\nabla^{2} f\left(x_{n}\right)\right]^{-1}\right\|_{\mathrm{op}} \int_{0}^{1}(1-t)\left\|x_{n}-x_{\star}\right\|^{2} \mathrm{~d} t \\
& \leq \frac{\gamma}{2}\left\|\left[\nabla^{2} f\left(x_{n}\right)\right]^{-1}\right\|_{\mathrm{op}}\left\|x_{n}-x_{\star}\right\|^{2}
\end{aligned}
$$

On the other hand,

$$
\lambda_{\min }\left(\nabla^{2} f\left(x_{n}\right)\right) \geq \lambda_{\min }\left(\nabla^{2} f\left(x_{\star}\right)\right)-\gamma\left\|x_{n}-x_{\star}\right\| \geq \alpha-\gamma\left\|x_{n}-x_{\star}\right\| \geq \frac{\alpha}{2}
$$

since inductively we have $\left\|x_{n}-x_{\star}\right\| \leq \alpha /(2 \gamma)$. Thus, $\left\|\left[\nabla^{2} f\left(x_{n}\right)\right]^{-1}\right\|_{\mathrm{op}} \leq 2 / \alpha$.
The inequality (13.1) implies that the error at iteration $n+1$ is proportional to the square of the error at iteration $n$, hence "quadratic" convergence. To see what rate of convergence this implies, multiply both sides by $\gamma / \alpha$, yielding

$$
\frac{\gamma}{\alpha}\left\|x_{n+1}-x_{\star}\right\| \leq\left(\frac{\gamma}{\alpha}\left\|x_{n}-x_{\star}\right\|\right)^{2} .
$$

Thus,

$$
\log \frac{\alpha}{\gamma\left\|x_{n+1}-x_{\star}\right\|} \geq 2 \log \frac{\alpha}{\gamma\left\|x_{n}-x_{\star}\right\|}
$$

Iterating, it yields

$$
\left\|x_{N}-x_{\star}\right\| \leq \exp \left(-2^{N} \log \frac{\alpha}{\gamma\left\|x_{0}-x_{\star}\right\|}\right) \leq \exp \left(-(\log 2) 2^{N}\right)
$$

Hence, as soon as $x_{0}$ lies in the region of local quadratic convergence, $\left\|x_{0}-x_{\star}\right\| \leq \alpha /(2 \gamma)$, achieving $\left\|x_{N}-x_{\star}\right\| \leq \varepsilon$ only requires a further $O(\log \log (1 / \varepsilon))$ iterations.

Our main interest in Newton's method is as a subroutine for developing interior point methods. For this purpose, local quadratic convergence is actually not as relevant as another key property: namely, affine invariance. If $A$ is an invertible matrix, then the iterates of NM on the transformed function $\hat{x} \mapsto f(A \hat{x})$ are equal to $A^{-1}$ times the iterates of NM on the original function $f$. (This is the same notion of affine invariance that we encountered for the Frank-Wolfe algorithm in Exercise 7.1.)

From this perspective, the analysis of Theorem 13.1 is not satisfactory, since the ratio $\gamma / \alpha$ is not affine-invariant. Thus, instead of assuming that $\nabla^{2} f$ is Lipschitz with respect to the Euclidean norm, let us instead assume that it is Lipschitz with respect to the norm generated by $\nabla^{2} f$ itself.

Definition 13.2. Let $f: \mathbb{R}^{d} \rightarrow \mathbb{R} \cup\{\infty\}$ be convex. For $x \in \operatorname{int} \operatorname{dom} f$, the local norm of $v \in \mathbb{R}^{d}$ at $x$ is

$$
\|v\|_{x}:=\sqrt{\left\langle v, \nabla^{2} f(x) v\right\rangle}
$$

The dual local norm of $v^{*} \in \mathbb{R}^{d}$ is

$$
\left\|v^{*}\right\|_{x}^{*}:=\sqrt{\left\langle v^{*},\left[\nabla^{2} f(x)\right]^{-1} v^{*}\right\rangle}
$$

Definition 13.3. Let $f: \mathbb{R}^{d} \rightarrow \mathbb{R} \cup\{\infty\}$ be a regular convex with an open domain. Then, $f$ is self-concordant with parameter $M>0$ if for all $x \in \operatorname{int} \operatorname{dom} f$ and $v \in \mathbb{R}^{d}$,

$$
\nabla^{3} f(x)[v, v, v] \leq 2 M\|v\|_{x}^{3}
$$

If this inequality holds with $M=1$, we simply say that $f$ is self-concordant.
The fact that $f$ is regular convex with an open domain implies that it tends to $+\infty$ at the boundary of its domain, i.e., it acts as a barrier. Clearly, any quadratic function is self-concordant. The main example of a self-concordant function is $-\log$, which is used as a building block for further self-concordant functions in §13.3.

Example 13.4 (self-concordance of -log). Direct computation shows that for the univariate function $f: x \mapsto-\log x$ over $\mathbb{R}_{+}$,

$$
f^{\prime}(x)=-\frac{1}{x}, \quad f^{\prime \prime}(x)=\frac{1}{x^{2}}, \quad f^{\prime \prime \prime}(x)=-\frac{2}{x^{3}}
$$

Hence,

$$
\left|f^{\prime \prime \prime}(x)\right|=\frac{2}{x^{3}} \leq 2\left[f^{\prime \prime}(x)\right]^{3 / 2}
$$

which shows that $-\log$ is self-concordant (with parameter 1).
Notice that even though - log blows up at the boundary of its domain, it still satisfies self-concordance. This provides a hint as to why the notion of self-concordance is useful for constrained minimization.

Putting aside the development of further examples for now, let us describe some key properties of self-concordant functions.

Definition 13.5. Given a convex function $f: \mathbb{R}^{d} \rightarrow \mathbb{R} \cup\{\infty\}, x \in \operatorname{int} \operatorname{dom} f$, and $r>0$, the Dikin ellipsoid of $f$ at $x$ with radius $r$ is

$$
\operatorname{Dikin}(x, r):=\left\{y \in \mathbb{R}^{d}:\|y-x\|_{x}<r\right\} .
$$

Self-concordance implies that the Hessian of $f$ is stable inside the Dikin ellipsoid.
Lemma 13.6 (self-concordance). Let $f: \mathbb{R}^{d} \rightarrow \mathbb{R} \cup\{\infty\}$ be a self-concordant function with parameter $M$, and let $x, y \in \operatorname{dom} f$.

1. For any $v \in \mathbb{R}^{d}, \nabla^{3} f[v, \cdot, \cdot] \leq 2 M\|v\|_{x} \nabla^{2} f(x)$.
2. $\operatorname{Dikin}(x, 1 / M) \subseteq \operatorname{dom} f$.
3. If $y \in \operatorname{Dikin}(x, 1 / M)$, then

$$
\frac{\|y-x\|_{x}}{1+M\|y-x\|_{x}} \leq\|y-x\|_{y} \leq \frac{\|y-x\|_{x}}{1-M\|y-x\|_{x}}
$$

4. If $y \in \operatorname{Dikin}(x, 1 / M)$ and $v \in \mathbb{R}^{d}$, then

$$
\left(1-M\|y-x\|_{x}\right)^{2} \nabla^{2} f(x) \leq \nabla^{2} f(y) \leq \frac{1}{\left(1-M\|y-x\|_{x}\right)^{2}} \nabla^{2} f(x)
$$

5. It holds that

$$
\langle\nabla f(y)-\nabla f(x), y-x\rangle \geq \frac{\|y-x\|_{x}^{2}}{1+M\|y-x\|_{x}}
$$

Proof. The first statement follows from general theory about multilinear forms, see [NN94, Appendix 1].

Let $z_{t}:=(1-t) x+t y$ and $\phi(t):=\left\langle y-x, \nabla^{2} f\left(z_{t}\right)(y-x)\right\rangle^{-1 / 2}$. Then, by the definition of self-concordance,

$$
\left|\phi^{\prime}(t)\right|=\left|\frac{\nabla^{3} f\left(z_{t}\right)[y-x, y-x, y-x]}{2\left\langle y-x, \nabla^{2} f\left(z_{t}\right)(y-x)\right\rangle^{3 / 2}}\right| \leq M\|y-x\|_{x}
$$

Hence, $\phi(0)-M \leq \phi(1) \leq \phi(0)+M$, which yields the third statement. The second statement follows from the third since $y \in \operatorname{Dikin}(x, 1 / M)$ implies that $\|y-x\|_{z_{t}}$ is bounded for $t \in[0,1]$, which contradicts the fact that $f$ blows up at $\partial \operatorname{dom} f$.

For the fourth statement, let $\psi(t):=\left\langle v, \nabla^{2} f\left(z_{t}\right) v\right\rangle$. Then, by the definition of selfconcordance and the first and third statements,

$$
\begin{aligned}
\left|\psi^{\prime}(t)\right| & \leq\left|\nabla^{3} f\left(z_{t}\right)[y-x, v, v]\right| \leq 2 M\|y-x\|_{x_{t}}\|v\|_{x_{t}}^{2}=\frac{2 M}{t}\left\|z_{t}-x\right\|_{x_{t}}\|v\|_{x_{t}}^{2} \\
& \leq \frac{2 M\|y-x\|_{x}}{1-M t\|y-x\|_{x}} \psi(t)
\end{aligned}
$$

Letting

$$
C:=\int_{0}^{1} \frac{2 M\|y-x\|_{x}}{1-M t\|y-x\|_{x}} \mathrm{~d} t=2 \log \frac{1}{1-M\|y-x\|_{x}}
$$

a suitable generalization of Grönwall's inequality (Lemma 2.3) implies

$$
\psi(0) \exp (-C) \leq \psi(1) \leq \psi(0) \exp (C)
$$

For the last statement,

$$
\begin{aligned}
\langle\nabla f(y)-\nabla f(x), y-x\rangle & =\int_{0}^{1}\left\langle\nabla^{2} f\left(z_{t}\right)(y-x), y-x\right\rangle \mathrm{d} t \geq \int_{0}^{1} \frac{\|y-x\|_{x}^{2}}{\left(1+M t\|y-x\|_{x}\right)^{2}} \mathrm{~d} t \\
& =\frac{\|y-x\|_{x}^{2}}{1+M\|y-x\|_{x}}
\end{aligned}
$$

We are now ready to analyze the local convergence of Newton's method under selfconcordance. It is convenient to measure convergence via the following object.

Definition 13.7. Let $f: \mathbb{R}^{d} \rightarrow \mathbb{R} \cup\{\infty\}$ be convex. The Newton decrement of $f$ at $x \in \operatorname{int} \operatorname{dom} f$ is the quantity

$$
\lambda_{f}(x):=\|\nabla f(x)\|_{x}^{*}=\left\|x^{+}-x\right\|_{x}
$$

where $x^{+}:=x-\left[\nabla^{2} f(x)\right]^{-1} \nabla f(x)$.

Theorem 13.8 (local quadratic convergence of NM under self-concordance). Consider a self-concordant function $f: \mathbb{R}^{d} \rightarrow \mathbb{R} \cup\{\infty\}$ with parameter $M$. Then,

$$
\lambda_{f}\left(x-\left[\nabla^{2} f(x)\right]^{-1} \nabla f(x)\right) \leq \frac{M \lambda_{f}(x)^{2}}{\left(1-M \lambda_{f}(x)\right)^{2}}
$$

Proof. Let $x^{+}:=x-\left[\nabla^{2} f(x)\right]^{-1} \nabla f(x)$. By Lemma 13.6,

$$
\lambda_{f}\left(x^{+}\right)=\left\|\nabla f\left(x^{+}\right)\right\|_{x^{+}}^{*} \leq \frac{\left\|\nabla f\left(x^{+}\right)\right\|_{x}}{1-M\left\|x^{+}-x\right\|_{x}}=\frac{\left\|\nabla f\left(x^{+}\right)\right\|_{x}}{1-M \lambda_{f}(x)}
$$

Then, for $z_{t}:=(1-t) x+t x^{+}$,

$$
\nabla f\left(x^{+}\right)=\nabla f(x)+\int_{0}^{1} \nabla^{2} f\left(z_{t}\right)\left(x^{+}-x\right) \mathrm{d} t=\underbrace{\left(\int_{0}^{1} \nabla^{2} f\left(z_{t}\right) \mathrm{d} t-\nabla^{2} f(x)\right)}_{=: \Delta}\left(x^{+}-x\right)
$$

Thus,

$$
\begin{aligned}
\left\|\nabla f\left(x^{+}\right)\right\|_{x}^{2} & =\left\langle\Delta\left(x^{+}-x\right),\left[\nabla^{2} f(x)\right]^{-1} \Delta\left(x^{+}-x\right)\right\rangle \\
& \leq\left\|\left[\nabla^{2} f(x)\right]^{-1 / 2} \Delta\left[\nabla^{2} f(x)\right]^{-1} \Delta\left[\nabla^{2} f(x)\right]^{-1 / 2}\right\|_{\mathrm{op}}\left\|x^{+}-x\right\|_{x}^{2} \\
& =\left\|\left[\nabla^{2} f(x)\right]^{-1 / 2} \Delta\left[\nabla^{2} f(x)\right]^{-1 / 2}\right\|_{\mathrm{op}}^{2} \lambda_{f}(x)^{2}
\end{aligned}
$$

To bound the operator norm, we take any unit vector $v \in \mathbb{R}^{d}$ and compute

$$
\begin{aligned}
& \left\langle v,\left[\nabla^{2} f(x)\right]^{-1 / 2} \Delta\left[\nabla^{2} f(x)\right]^{-1 / 2} v\right\rangle \\
& \quad=\int_{0}^{1}\left\langle\left[\nabla^{2} f(x)\right]^{-1 / 2} v,\left[\nabla^{2} f\left(z_{t}\right)-\nabla^{2} f(x)\right]\left[\nabla^{2} f(x)\right]^{-1 / 2} v\right\rangle \mathrm{d} t \\
& \quad \leq \int_{0}^{1}\left\langle\left[\nabla^{2} f(x)\right]^{-1 / 2} v,\left(\frac{1}{\left(1-M t \lambda_{f}(x)\right)^{2}}-1\right) \nabla^{2} f(x)\left[\nabla^{2} f(x)\right]^{-1 / 2} v\right\rangle \mathrm{d} t \\
& \quad=\int_{0}^{1}\left(\frac{1}{\left(1-M t \lambda_{f}(x)\right)^{2}}-1\right) \mathrm{d} t=\frac{M \lambda_{f}(x)}{1-M \lambda_{f}(x)}
\end{aligned}
$$

Putting everything together yields the result.

### 13.2 Following the central path

We now consider the following structured minimization problem:

$$
\underset{x \in \mathcal{C}}{\operatorname{minimize}} \quad\langle a, x\rangle
$$

One can also consider non-linear objective functions, but this setup is already enough to capture LPs and SDPs.

Our main assumption is that we have explicit access to a self-concordant function $\phi$ with $\overline{\operatorname{dom} \phi}=\mathcal{C}$. Motivation for this assumption is provided in [Nes18, §5.1.1], in which Nesterov argues that a fundamental conceptual contradiction lies at the heart of black-box optimization. Namely, black-box optimization assumes that the problem under consideration is convex, but in order to verify convexity in practice, one often needs to exploit some structure of the problem.

The typical strategy to verify convexity is to appeal to the fact that convexity is preserved under various operations (conic combinations, composition with affine mappings, taking suprema, etc.), and thereby reduce the question to checking convexity of a few primitive building blocks. Similarly, as we describe in §13.3, one can develop a barrier calculus which produces self-concordant functions for convex sets $\mathcal{C}$ which are built up out of primitive building blocks by applying basic operations. Consequently, one can furnish a self-concordant barrier for a huge number of problems of practical interest.

Once we have such a function $\phi$, how can we use it to solve the constrained optimization problem? As the name suggests, the family of interior point methods maintain iterates which lie in the interior of $\mathcal{C}$ (unlike other methods, such as cutting plane methods, projected gradient methods, the simplex algorithm, etc.), by using the function $\phi$ as a barrier to exiting $\mathcal{C}$. Although there are many types of interior point methods, here we focus on following the so-called central path, i.e., the path

$$
t \mapsto x_{\star}(t):=\underset{x \in \mathbb{R}^{d}}{\arg \min }\{\underbrace{t\langle a, x\rangle+\phi(x)}_{=: f_{t}(x)}\}
$$

When $t=0, x_{\star}(0):=\arg \min \phi$ is called the analytical center of $\mathcal{C}$ (relative to $\phi$ ). We discuss later how to obtain a point close to $x_{\star}(0)$ (and thereby initialize the scheme). On the other hand, as $t \rightarrow \infty$, we expect that $x_{\star}(t) \rightarrow x_{\star}=\arg \min _{x \in \mathcal{C}}\langle a, x\rangle$.

Suppose that the algorithm is currently on the central path at the point $x_{\star}(t)$. The path following scheme proceeds by incrementing $t$ to some $t^{+}>t$. To compute the next point $x_{\star}\left(t^{+}\right)$, we must minimize the function $f_{t^{+}}$, and we can use the previous point $x_{\star}(t)$ as a warm start. In fact, since $f_{t^{+}}$is self-concordant, a natural choice is to apply a step of Newton's method, which requires $x_{\star}(t)$ to be in the region of local convergence for $f_{t^{+}}$. This places a constraint on how fast we can increase $t$.

We remark that although the use of Newton's method is standard, it is not the only choice; one could use, e.g., a few steps of preconditioned gradient descent.

Next, let us calculate the increment for $t$, starting at $x_{\star}(t)$. From Theorem 13.8, taking $M=1$, we want to ensure that $\lambda_{f_{t^{+}}}\left(x_{\star}(t)\right)<1$. However, since $t a+\nabla \phi\left(x_{\star}(t)\right)=0$,

$$
\lambda_{f_{t^{+}}}\left(x_{\star}(t)\right)=\left\|t^{+} a+\nabla \phi\left(x_{\star}(t)\right)\right\|_{x_{\star}(t)}^{*}=\left(t^{+}-t\right)\|a\|_{x_{\star}(t)}^{*}=\frac{t^{+}-t}{t}\left\|\nabla \phi\left(x_{\star}(t)\right)\right\|_{x_{\star}(t)}^{*}
$$

In order for this to be controlled, we want a uniform bound on $\|\nabla \phi(x)\|_{x}^{*}$. Note that even though the objective function is changing with time, the local norms above are unambiguous because $\nabla^{2} f_{t}$ is independent of $t$.

Definition 13.9. A self-concordant function $f: \mathbb{R}^{d} \rightarrow \mathbb{R} \cup\{\infty\}$ is a $\boldsymbol{v}$-self-concordant barrier if $\|\nabla f(x)\|_{x}^{*} \leq \sqrt{v}$ for all $x \in \operatorname{dom} f$.

Assuming that $\phi$ is a $v$-self-concordant barrier, it follows that we can take $t^{+}= (1+\Omega(1 / \sqrt{v})) t$. Therefore, we expect the number of iterations of the scheme to scale as $\widetilde{O}(\sqrt{v})$ (up to logarithmic factors).

Before carrying out the full analysis (which takes into account the fact that we do not exactly follow the central path, as well as the issue of initialization), we first consider elements of the barrier calculus and applications.

### 13.3 Barrier calculus and applications

Example 13.10 (-log is a 1 -self-concordant barrier). Indeed, by explicit calculation, the self-concordant function $x \mapsto f(x)=-\log x$ satisfies

$$
\frac{f^{\prime}(x)^{2}}{f^{\prime \prime}(x)}=1
$$

Starting from this example, we can build many more.
Proposition 13.11 (barrier calculus).

1. Let $f_{1}, f_{2}$ be $v_{1}$ - and $v_{2}$-self-concordant barriers respectively. Then, $f_{1}+f_{2}$ is a ( $v_{1}+v_{2}$ )-self-concordant barrier for $\operatorname{dom} f_{1} \cap \operatorname{dom} f_{2}$.
2. Let $f_{1}, f_{2}$ be $v_{1}$ - and $v_{2}$-self-concordant barriers respectively. Then, $(x, y) \mapsto f_{1}(x)+f_{2}(y)$ is a ( $v_{1}+v_{2}$ )-self-concordant barrier for $\operatorname{dom} f_{1} \times \operatorname{dom} f_{2}$.
3. Let $\mathscr{A}: x \mapsto A x+b$ be an affine map and let $f$ be a $v$-self-concordant barrier with $\operatorname{dom} f \subseteq$ range $\mathscr{A}$. Then, the composition $x \mapsto f(\mathscr{A}(x))$ is a $v$-self-concordant barrier for the set $\mathscr{A}^{-1}(\operatorname{dom} f)$.
4. Let $f$ be a $v$-self-concordant barrier over $\mathbb{R}^{d_{1}} \times \mathbb{R}^{d_{2}}$. Then, $x \mapsto \inf _{y \in \mathbb{R}^{d_{2}}} f(x, y)$ is a $v$-self-concordant barrier.

We do not prove these statements since the verification can be tedious.
Since the barrier parameter $v$ plays a decisive role in determining the iteration complexity, it is important to know what the best possible value for $v$ is.

Proposition 13.12 (lower bound for the barrier parameter). Let $\mathcal{C} \subseteq \mathbb{R}^{d}$ be a convex polytope such that there exists a point in $\partial \mathfrak{C}$ which belongs to exactly $k$ of the $(d-1)$ dimensional facets of $\mathcal{C}$, with the normals to these facets being linearly independent. Then, any $v$-self-concordant barrier for $\mathcal{C}$ satisfies $v \geq k$.

In particular, for the cube, the non-negative orthant, and the simplex, this holds with $k=d$.

Proof. See [NN94, Proposition 2.3.6].
On the other hand, for any convex body $\mathcal{C}$, there exists a $d$-self-concordant barrier.
Theorem 13.13 (optimal self-concordant barriers). Let $\mathcal{C} \subseteq \mathbb{R}^{d}$ be a convex body. The following are $d$-self-concordant barriers for $\mathcal{C}$ :

- ([Che23]) the entropic barrier, defined as the convex conjugate of the map $\theta \mapsto \log \int_{\mathfrak{C}} \exp \langle\theta, x\rangle \mathrm{d} x ;$
- ([LY21]) the universal barrier, defined as the map $x \mapsto \log \operatorname{vol} \mathcal{C}^{\circ}(x)$, where $\mathcal{C}^{\circ}(x):=\left\{y \in \mathbb{R}^{d}:\langle y, z-x\rangle \leq 1\right.$ for all $\left.z \in \mathcal{C}\right\}$ is the polar of $\mathcal{C}$ with respect to $x$.

Although these results are elegant, they are quite useless in practice since the constructed barriers do not lend themselves to easy implementation. Instead, we present the canonical example of logarithmic barriers, although many more sophisticated barriers have been developed subsequently.

## Example 13.14 (logarithmic barriers).

1. Let $\mathcal{C}=\left\{x \in \mathbb{R}^{d}: A x \leq b\right\}$ be a polytope, where $A \in \mathbb{R}^{m \times d}$ and $b \in \mathbb{R}^{m}$. If we let $\left\{a_{i}\right\}_{i \in[m]}$ denote the rows of $A$, then $x \mapsto-\log \left(b_{i}-\left\langle a_{i}, x\right\rangle\right)$ is a 1 -self-concordant barrier for the set $\left\{\left\langle a_{i}, \cdot\right\rangle \leq b_{i}\right\}$, by Example 13.10 and Proposition 13.11. Hence, by Proposition 13.11 again, $x \mapsto-\sum_{i=1}^{m} \log \left(b_{i}-\left\langle a_{i}, x\right\rangle\right)$ is an $m$-self-concordant barrier for $\mathcal{C}$.

Since we assume that $\mathcal{C}$ is a convex body (in particular, compact), we must have $m \geq d$. From Theorem 13.13, we know that a $d$-self-concordant barrier for $\mathcal{C}$ exists, but the logarithmic barrier is far more tractable.
2. Let $\mathcal{C}=\mathrm{S}_{+}^{d}$ be the cone of PSD matrices. Then, one can show via direct calculation that $X \mapsto-\log \operatorname{det} X$ is a $d$-self-concordant barrier for $\mathcal{C}$, and that this is the best possible value for the barrier parameter [Nes18, Theorem 5.4.3, Lemma 5.4.7].
This is perhaps surprising since the dimension of $\mathrm{S}_{+}^{d}$ as a vector space is $d(d+1) / 2$.

We are about to show that interior point methods achieve an iteration complexity of roughly $\widetilde{O}(\sqrt{v})$. With the barriers constructed above, we obtain the following results.

- Linear programs (LPs). An LP consists of minimizing a linear function $x \mapsto\langle a, x\rangle$ over a polytope $\mathcal{C}=\left\{x \in \mathbb{R}^{d}: A x \leq b\right\}$. Let $A$ be of size $m \times d$. Then, the arithmetic cost of taking a Newton step with the logarithmic barrier is roughly $O\left(d^{2} m\right)$, so the overall computational cost is $\widetilde{O}\left(d^{2} m^{3 / 2}\right)$. For $m \asymp d$, this is $\widetilde{O}\left(d^{7 / 2}\right)$.
- Semidefinite programs (SDPs). An SDP consists of minimizing a linear function $X \mapsto\langle A, X\rangle$ over the PSD cone $\mathcal{C}=\mathrm{S}_{+}^{d}$, possibly with other linear constraints. One can show that the arithmetic cost of a Newton step is $O\left(d^{4}\right)$, which leads to an overall computational cost of $\widetilde{O}\left(d^{9 / 2}\right)$.

As mentioned in the bibliographical notes, there are numerous improvements over these basic results and it remains an active area of research.

### 13.4 Convergence analysis

Here, we roughly analyze the iteration complexity of the path following scheme. We recall the setup from §13.2.

Lemma 13.15 (properties of self-concordant barriers). Let $f: \mathbb{R}^{d} \rightarrow \mathbb{R} \cup\{\infty\}$ be a $v$-self-concordant barrier.

1. For any $v \in \mathbb{R}^{d}$,

$$
\langle\nabla f(x), v\rangle^{2} \leq v\left\langle v, \nabla^{2} f(x) v\right\rangle .
$$

2. For all $x, y \in \operatorname{dom} f$,

$$
\langle\nabla f(x), y-x\rangle \leq v
$$

## Proof.

1. By Cauchy-Schwarz,

$$
|\langle\nabla f(x), v\rangle| \leq\|\nabla f(x)\|_{x}^{*}\|v\|_{x} \leq \sqrt{v}\|v\|_{x}
$$

2. For $t \in[0,1]$, let $z_{t}:=(1-t) x+t y$. Then,

$$
\partial_{t}\left\langle\nabla f\left(z_{t}\right), y-x\right\rangle=\left\langle\nabla^{2} f\left(z_{t}\right)(y-x), y-x\right\rangle \geq \frac{1}{v}\left\langle\nabla f\left(z_{t}\right), y-x\right\rangle^{2}
$$

This implies that $\partial_{t}\left\langle\nabla f\left(z_{t}\right), y-x\right\rangle^{-1} \leq-1 / v$, which leads to the desired inequality.

Main stage. Assume that at iteration $n$, we have a pair $\left(t_{n}, x_{n}\right) \in \mathbb{R}_{+} \times \mathbb{R}^{d}$ such that

$$
\lambda_{f_{t_{n}}}\left(x_{n}\right) \leq \frac{1}{4}
$$

When we update $t_{n} \mapsto t_{n+1}$, we note that

$$
\begin{aligned}
\lambda_{t_{n+1}}\left(x_{n}\right) & =\left\|t_{n+1} a+\nabla \phi\left(x_{n}\right)\right\|_{x_{n}}^{*}=\left\|\frac{t_{n+1}}{t_{n}}\left(t_{n} a+\nabla \phi\left(x_{n}\right)\right)+\left(1-\frac{t_{n+1}}{t_{n}}\right) \nabla \phi\left(x_{n}\right)\right\|_{x_{n}}^{*} \\
& \leq \frac{t_{n+1}}{t_{n}} \lambda_{f_{t_{n}}}\left(x_{n}\right)+\left(\frac{t_{n+1}}{t_{n}}-1\right) \sqrt{v}
\end{aligned}
$$

Set $t_{n+1}=\left(1+c_{0} / \sqrt{v}\right) t_{n}$. This yields

$$
\lambda_{t_{n+1}}\left(x_{n}\right) \leq\left(1+\frac{c_{0}}{\sqrt{v}}\right) \frac{1}{4}+c_{0} \leq \frac{1+c_{0}}{4}+c_{0}
$$

since we can assume $v \geq 1$. The update $x_{n} \mapsto x_{n+1}$ is a Newton's step for $f_{t_{n+1}}$, so by Theorem 13.8 we have

$$
\lambda_{t_{n+1}}\left(x_{n+1}\right) \leq \frac{\lambda_{t_{n+1}}\left(x_{n}\right)^{2}}{\left(1-\lambda_{t_{n+1}}\left(x_{n}\right)\right)^{2}} \leq\left(\frac{\left(1+c_{0}\right) / 4+c_{0}}{1-\left(1+c_{0}\right) / 4-c_{0}}\right)^{2} \leq \frac{1}{4}
$$

provided that $c_{0}$ is sufficiently small: $c_{0} \leq 1 / 16$ suffices.
This implies that

$$
t_{N}=\left(1+\frac{c_{0}}{\sqrt{v}}\right)^{N} t_{0}
$$

so that the value of $t$ increases exponentially fast. Once $t$ is sufficiently large, we have a nearly optimal solution to the original problem.

Lemma 13.16. For any $(t, x) \in \mathbb{R}_{+} \times \mathbb{R}^{d}$,

$$
\langle a, x\rangle-\left\langle a, x_{\star}\right\rangle \leq \frac{1}{t}\left(v+\frac{\left(\lambda_{f_{t}}(x)+\sqrt{v}\right) \lambda_{f_{t}}(x)}{1-\lambda_{f_{t}}(x)}\right)
$$

Proof. First, by Lemma 13.15,

$$
\left\langle a, x_{\star}(t)\right\rangle-\left\langle a, x_{\star}\right\rangle=\frac{1}{t}\left\langle\nabla \phi\left(x_{\star}(t)\right), x_{\star}-x_{\star}(t)\right\rangle \leq \frac{v}{t} .
$$

Next,

$$
\langle a, x\rangle-\left\langle a, x_{\star}(t)\right\rangle=\frac{1}{t}\left\langle\nabla f_{t}(x)-\nabla \phi(x), x-x_{\star}(t)\right\rangle \leq \frac{\lambda_{f_{t}}(x)+\sqrt{v}}{t}\left\|x-x_{\star}(t)\right\|_{x}
$$

From Lemma 13.6,

$$
\frac{\left\|x-x_{\star}(t)\right\|_{x}^{2}}{1+\left\|x-x_{\star}(t)\right\|_{x}} \leq\langle\nabla f_{t}(x)-\underbrace{\nabla f_{t}\left(x_{\star}(t)\right)}_{=0}, x-x_{\star}(t)\rangle \leq \lambda_{f_{t}}(x)\left\|x-x_{\star}(t)\right\|_{x}
$$

Thus, $\left\|x-x_{\star}(t)\right\|_{x} /\left(1+\left\|x-x_{\star}(t)\right\|_{x}\right) \leq \lambda_{f_{t}}(x)$, or, upon rearranging,

$$
\left\|x-x_{\star}(t)\right\|_{x} \leq \frac{\lambda_{f_{t}}(x)}{1-\lambda_{f_{t}}(x)}
$$

Putting everything together completes the proof.
The lemma implies that in order to obtain an $\varepsilon$-approximate solution, it suffices to take $N$ such that $t_{N} \gtrsim v / \varepsilon$. The number of iterations is therefore $O\left(\sqrt{v} \log \left(v /\left(\varepsilon t_{0}\right)\right)\right)$.

Preliminary stage. The remaining missing piece is to obtain $\left(t_{0}, x_{0}\right)$ such that $\lambda_{f_{t_{0}}}\left(x_{0}\right) \leq 1 / 4$. The idea here is to use another path following scheme to obtain the initial point. Namely, if we replace the vector $a$ with $-\nabla \phi\left(\bar{x}_{0}\right)$, where $\bar{x}_{0}$ is an arbitrary point in $\mathcal{C}$, we obtain the central path

$$
t \mapsto \bar{x}_{\star}(t)=\underset{\bar{x} \in \mathbb{R}^{d}}{\arg \min }\{\underbrace{-t\left\langle\nabla \phi\left(\bar{x}_{0}\right), \bar{x}\right\rangle+\phi(\bar{x})}_{=: \bar{f}_{t}(\bar{x})}\} .
$$

Note that this central path connects $\bar{x}_{\star}(1)=\bar{x}_{0}$ to $\bar{x}_{\star}(0)=x_{\star}(0)=\arg \min \phi$. Therefore, we should follow the central path by decreasing $t$. By a similar analysis (see [Nes18, §5.3.5]), one can show that $O\left(\sqrt{v} \log \left(v\left\|\nabla \phi\left(\bar{x}_{0}\right)\right\|_{x_{\star}(0)}^{*}\right)\right)$ iterations of the path following scheme suffices in order to initialize the main stage. Here, the quantity $\left\|\nabla \phi\left(\bar{x}_{0}\right)\right\|_{x_{\star}(0)}^{*}$ is a measure of how far the initial guess $\bar{x}_{0}$ is from the true analytical center $x_{\star}(0)$.

Actually, this still does not fully resolve the initialization issue, since it may be difficult to find any strictly feasible point $\bar{x}_{0}$ at all. In some situations, one can first augment the problem so that it is trivial to find a strictly feasible starting point, and then one can use yet another path following scheme to compute a strictly feasible point for the original problem. We omit the details.

## Bibliographical notes

The presentation of this section is heavily inspired by [Bub15]. A comprehensive guide to interior point methods can be found in [NN94].

There are many ways to speed up interior point methods beyond the basic theory covered here, e.g., by amortizing the computations cleverly across steps, or by using improved self-concordant barriers. This remains an active area of research and we do not survey recent developments here.

The universal barrier was introduced and shown to be $O(d)$-self-concordant in [NN94]. The entropic barrier was introduced and shown to be ( $1+o(1)) d$-self-concordant in [BE19]. The cited references [LY21; Che23] in Theorem 13.13 obtained the optimal barrier parameter $d$ for these two barriers respectively.

## A Background on symmetric matrices

A matrix $A \in \mathbb{R}^{d \times d}$ is called symmetric if $A=A^{\top}$. The fundamental fact about such matrices is that their eigenvalues are real, and they can be diagonalized.

Theorem A. 1 (spectral theorem for symmetric matrices). Let $A \in \mathbb{R}^{d \times d}$ be symmetric. Then, $A$ admits the decomposition $A=U \Lambda U^{\top}$, where $U \in \mathbb{R}^{d \times d}$ is an orthogonal matrix ( $U U^{\top}=U^{\top} U=I$ ) and $\Lambda$ is a diagonal matrix whose diagonal entries are the eigenvalues $\lambda_{1}, \ldots, \lambda_{d} \in \mathbb{R}$ of $A$.

Equivalently, we can write $A=\sum_{i=1}^{d} \lambda_{i} u_{i} u_{i}^{\top}$, where $\left\{u_{i}\right\}_{i=1}^{d}$ are unit eigenvectors, thus $\left\|u_{i}\right\|=1$ and $A u_{i}=\lambda_{i} u_{i}$ for all $i \in[d]$. Moreover, the eigenvectors form an orthonormal basis for $\mathbb{R}^{d}:\left\langle u_{i}, u_{j}\right\rangle=0$ if $i \neq j$.

A special subclass of these matrices, particularly relevant for convex optimization, is the class of positive semidefinite matrices.

Definition A.2. A symmetric matrix $A \in \mathbb{R}^{d \times d}$ is positive semidefinite (PSD), written $A \succeq 0$, if all of its eigenvalues are non-negative. It is positive definite (PD), written $A \succ 0$, if all of its eigenvalues are strictly positive.

Note that a PD matrix has positive determinant, so it is invertible. We denote the sets of symmetric matrices, positive semidefinite matrices, and positive definite matrices by $\mathrm{S}^{d}, \mathrm{~S}_{+}^{d}$, and $\mathrm{S}_{++}^{d}$ respectively.

Lemma A.3. A symmetric matrix $A$ has eigenvalues in the range $[\underline{\lambda}, \bar{\lambda}]$ if and only if

$$
\underline{\lambda}\|v\|^{2} \leq\langle v, A v\rangle \leq \bar{\lambda}\|v\|^{2} \quad \text { for all } v \in \mathbb{R}^{d}
$$

Proof. By rescaling, we can restrict to unit vectors $v$, and by Theorem A.1,

$$
\langle v, A v\rangle=\sum_{i=1}^{d} \lambda_{i}\left\langle u_{i}, v\right\rangle^{2}
$$

Since $\left\{u_{i}\right\}_{i=1}^{d}$ is an orthonormal basis, $\sum_{i=1}^{d}\left\langle u_{i}, v\right\rangle^{2}=\|v\|^{2}=1$. Thus, the expression above is minimized over unit vectors $v$ when $v=u_{i_{\text {min }}}$, where $i_{\text {min }}$ is the index of the minimum eigenvalue $\lambda_{\text {min }}$ of $A$, in which case $\langle v, A v\rangle=\lambda_{\text {min }}\|v\|^{2}$. Similarly, the expression above is maximized over unit vectors $v$ by taking $v$ to be an eigenvector corresponding to the maximum eigenvalue $\lambda_{\text {max }}$, in which case $\langle v, A v\rangle=\lambda_{\text {max }}\|v\|^{2}$.

Therefore, a matrix $A$ is PSD (resp. PD) if

$$
\langle v A v\rangle \geq 0 \quad(\text { resp. }>0), \quad \text { for all } v \in \mathbb{R}^{d} .
$$

We next extend the definition of the symbols $>, \succeq$.

Definition A.4. Let $A, B$ be two symmetric $d \times d$ matrices. We write $A \geq B$ (resp. $A>B$ ) if $A-B \geq 0$ (resp. $A-B>0$ ). This is known as the Loewner order (or sometimes the PSD order).

Thus, $A \geq B$ means

$$
\langle v, A v\rangle \geq\langle v, B v\rangle \quad \text { for all } v \in \mathbb{R}^{d}
$$

Note that $\geq$ is a partial order, meaning that not all pairs of symmetric matrices are comparable in this ordering. For example, the matrices

$$
\left[\begin{array}{cc}
1 / 2 & 0 \\
0 & 2
\end{array}\right] \quad \text { and } \quad\left[\begin{array}{cc}
2 & 0 \\
0 & 1 / 2
\end{array}\right]
$$

are incomparable, because one has a larger eigenvalue in one direction, but the other has a larger eigenvalue in a different direction. The notations $A \geq \alpha I$ (resp. $A \leq \beta I$ ) are convenient ways to express that all eigenvalues of $A$ are at least $\alpha$ (resp. at most $\beta$ ).

Finally, we define the operator norm for matrices.
Definition A.5. Let $A \in \mathbb{R}^{d_{1} \times d_{2}}$ be a matrix. The operator norm of $A$ is

$$
\|A\|_{\text {op }}:=\max \{\|A v\|:\|v\|=1\}
$$

The operator norm has an explicit description: note that $\|A v\|^{2}=\left\langle v A^{\top} A v\right\rangle$, and that $A^{\top} A$ is symmetric. By Lemma A.3, $\|A v\|^{2} \leq C^{2}$ for all unit vectors $v \in \mathbb{R}^{d_{2}}$ if and only if the eigenvalues of $A^{\top} A$ lie in the range [ $-C^{2}, C^{2}$ ], which is true if and only if the absolute values of the eigenvalues of $A^{\top} A$ are bounded by $C^{2}$. Thus, the operator norm of $A$ is the square root of the largest absolute eigenvalue of $A^{\top} A$ :

$$
\|A\|_{\mathrm{op}}=\max \left\{\sqrt{|\lambda|}: \lambda \text { an eigenvalue of } A^{\top} A\right\}
$$

It can be shown that the eigenvalues of $A^{\top} A$ are the same as the eigenvalues of $A A^{\top}$ (except possibly with a different number of zero eigenvalues), so $\|A\|_{\text {op }}$ is also the square root of the largest absolute eigenvalue of $A A^{\top}$.

This is easier to describe when $A$ is symmetric. In this case, $A^{\top} A=A^{2}$ has eigenvalues which are the squares of the eigenvalues of $A$. Thus, when $A$ is symmetric,

$$
\|A\|_{\mathrm{op}}=\max \{|\lambda|: \lambda \text { an eigenvalue of } A\} .
$$

So, $\|A\|_{\mathrm{op}} \leq C$ if and only if $-C I \leq A \leq C I$.

## References

[Aga+12] A. Agarwal, P. L. Bartlett, P. Ravikumar, and M. J. Wainwright. "Informationtheoretic lower bounds on the oracle complexity of stochastic convex optimization". In: IEEE Trans. Inform. Theory 58.5 (2012), pp. 3235-3249.
[AKL22] P.-C. Aubin-Frankowski, A. Korba, and F. Léger. "Mirror descent with relative smoothness in measure spaces, with application to Sinkhorn and EM". In: Advances in Neural Information Processing Systems. Ed. by S. Koyejo, S. Mohamed, A. Agarwal, D. Belgrave, K. Cho, and A. Oh. Vol. 35. Curran Associates, Inc., 2022, pp. 17263-17275.
[AL24] M. Arnese and D. Lacker. "Convergence of coordinate ascent variational inference for log-concave measures via optimal transport". In: arXiv preprint 2404.08792 (2024).
[ALZ24] F. Ascolani, H. Lavenant, and G. Zanella. "Entropy contraction of the Gibbs sampler under log-concavity". In: arXiv preprint 2410.00858 (2024).
[AN00] S.-i. Amari and H. Nagaoka. Methods of information geometry. Vol. 191. Translations of Mathematical Monographs. Translated from the 1993 Japanese original by Daishi Harada. American Mathematical Society, Providence, RI; Oxford University Press, Oxford, 2000, pp. x+206.
[ANR17] J. M. Altschuler, J. Niles-Weed, and P. Rigollet. "Near-linear time approximation algorithms for optimal transport via Sinkhorn iteration". In: Advances in Neural Information Processing Systems 30. Ed. by I. Guyon, U. V. Luxburg, S. Bengio, H. Wallach, R. Fergus, S. Vishwanathan, and R. Garnett. Curran Associates, Inc., 2017, pp. 1964-1974.
[AP24a] J. M. Altschuler and P. A. Parrilo. "Acceleration by stepsize hedging: multi-step descent and the silver stepsize schedule". In: J. ACM (Dec. 2024).
[AP24b] J. M. Altschuler and P. A. Parrilo. "Acceleration by stepsize hedging: silver stepsize schedule for smooth convex optimization". In: Mathematical Programming (2024).
[AY16] Z. Allen-Zhu and Y. Yuan. "Improved SVRG for non-strongly-convex or sum-of-non-convex objectives". In: Proceedings of the 33rd International Conference on Machine Learning. Ed. by M. F. Balcan and K. Q. Weinberger. Vol. 48. Proceedings of Machine Learning Research. New York, New York, USA: PMLR, June 2016, pp. 1080-1089.
[Bac+92] F. L. Baccelli, G. Cohen, G. J. Olsder, and J.-P. Quadrat. Synchronization and linearity. Wiley Series in Probability and Mathematical Statistics: Probability and Mathematical Statistics. An algebra for discrete event systems. John Wiley \& Sons, Ltd., Chichester, 1992, pp. xx+489.
[Bac17] F. Bach. "Breaking the curse of dimensionality with convex neural networks". In: Journal of Machine Learning Research 18.19 (2017), pp. 1-53.
[Bac24] F. Bach. Learning theory from first principles. MIT Press, 2024.
[Bar93] A. R. Barron. "Universal approximation bounds for superpositions of a sigmoidal function". In: IEEE Trans. Inform. Theory 39.3 (1993), pp. 930-945.
[BBT17] H. H. Bauschke, J. Bolte, and M. Teboulle. "A descent lemma beyond Lipschitz gradient continuity: first-order methods revisited and applications". In: Math. Oper. Res. 42.2 (2017), pp. 330-348.
[BC12] S. Bubeck and N. Cesa-Bianchi. "Regret analysis of stochastic and nonstochastic multi-armed bandit problems". In: Foundations and Trends ${ }^{\circledR}$ in Machine Learning 5.1 (2012), pp. 1-122.
[BE19] S. Bubeck and R. Eldan. "The entropic barrier: exponential families, logconcave geometry, and self-concordance". In: Math. Oper. Res. 44.1 (2019), pp. 264-276.
[Bil95] P. Billingsley. Probability and measure. Third. Wiley Series in Probability and Mathematical Statistics. A Wiley-Interscience Publication. John Wiley \& Sons, Inc., New York, 1995, pp. xiv+593.
[BM03] S. Burer and R. D. C. Monteiro. "A nonlinear programming algorithm for solving semidefinite programs via low-rank factorization". In: vol. 95. 2. Computational semidefinite and second order cone programming: the state of the art. 2003, pp. 329-357.
[BM05] S. Burer and R. D. C. Monteiro. "Local minima and convergence in low-rank semidefinite programming". In: Math. Program. 103.3 (2005), pp. 427-444.
[Bub15] S. Bubeck. "Convex optimization: algorithms and complexity". In: Foundations and Trends ${ }^{\circledR}$ in Machine Learning 8.3-4 (2015), pp. 231-357.
[Che+22] Y. Chen, S. Chewi, A. Salim, and A. Wibisono. "Improved analysis for a proximal algorithm for sampling". In: Proceedings of Thirty Fifth Conference on Learning Theory. Ed. by P.-L. Loh and M. Raginsky. Vol. 178. Proceedings of Machine Learning Research. PMLR, July 2022, pp. 2984-3014.
[Che23] S. Chewi. "The entropic barrier is $n$-self-concordant". In: Geometric Aspects of Functional Analysis: Israel Seminar (GAFA) 2020-2022. Ed. by R. Eldan, B. Klartag, A. Litvak, and E. Milman. Cham: Springer International Publishing, 2023, pp. 209-222.
[Che26] S. Chewi. Log-concave sampling. Available online at chewisinho.github.io. Forthcoming, 2026.
[CJ25] R. Caprio and A. M. Johansen. "Fast convergence of the expectation-maximization algorithm under a logarithmic Sobolev inequality". In: Biometrika 112.4 (Aug. 2025), asaf061.
[CLD25] C. Cheng, D. Levy, and J. C. Duchi. "Geometry, computation, and optimality in stochastic optimization". In: arXiv preprint 1909.10455 (2025).
[CLM24] H. Chardon, M. Lerasle, and J. Mourtada. "Finite-sample performance of the maximum likelihood estimator in logistic regression". In: arXiv preprint 2411.02137 (2024).
[CNR25] S. Chewi, J. Niles-Weed, and P. Rigollet. Statistical optimal transport. Lecture Notes in Mathematics. École d'Été de Probabilités de Saint-Flour XLIX-2019. Springer Cham, 2025, pp. xiv+260.
[Cut13] M. Cuturi. "Sinkhorn distances: lightspeed computation of optimal transport". In: Advances in Neural Information Processing Systems. Ed. by C. Burges, L. Bottou, M. Welling, Z. Ghahramani, and K. Weinberger. Vol. 26. Curran Associates, Inc., 2013.
[Eva10] L. C. Evans. Partial differential equations. Second. Vol. 19. Graduate Studies in Mathematics. American Mathematical Society, Providence, RI, 2010, pp. xxii+749.
[GWS21] S. Gunasekar, B. Woodworth, and N. Srebro. "Mirrorless mirror descent: a natural derivation of mirror descent". In: Proceedings of the 24th International Conference on Artificial Intelligence and Statistics. Ed. by A. Banerjee and K. Fukumizu. Vol. 130. Proceedings of Machine Learning Research. PMLR, Apr. 2021, pp. 2305-2313.
[JZ13] R. Johnson and T. Zhang. "Accelerating stochastic gradient descent using predictive variance reduction". In: Advances in Neural Information Processing Systems. Ed. by C. J. Burges, L. Bottou, M. Welling, Z. Ghahramani, and K. Q. Weinberger. Vol. 26. Curran Associates, Inc., 2013.
[KNS16] H. Karimi, J. Nutini, and M. Schmidt. "Linear convergence of gradient and proximal-gradient methods under the Polyak-Łojasiewicz condition".In: European Conference on Machine Learning and Knowledge Discovery in DatabasesVolume 9851. ECML PKDD 2016. Riva del Garda, Italy: Springer-Verlag, 2016, pp. 795-811.
[Lég21] F. Léger. "A gradient descent perspective on Sinkhorn". In: Appl. Math. Optim. 84.2 (2021), pp. 1843-1855.
[LFN18] H. Lu, R. M. Freund, and Y. Nesterov. "Relatively smooth convex optimization by first-order methods, and applications". In: SIAM 7. Optim. 28.1 (2018), pp. 333-354.
[LMW24] J. Liang, S. Mitra, and A. Wibisono. "On independent samples along the Langevin diffusion and the unadjusted Langevin algorithm". In: arXiv preprint 2402.17067 (2024).
[Łoj63] S. Łojasiewicz. "Une propriété topologique des sous-ensembles analytiques réels". In: Les Équations aux Dérivées Partielles (Paris, 1962). Éditions du Centre National de la Recherche Scientifique (CNRS), Paris, 1963, pp. 87-89.
[LRP16] L. Lessard, B. Recht, and A. Packard. "Analysis and design of optimization algorithms via integral quadratic constraints". In: SIAM 7. Optim. 26.1 (2016), pp. 57-95.
[LY21] Y. T. Lee and M.-C. Yue. "Universal barrier is $n$-self-concordant". In: Math. Oper. Res. 46.3 (2021), pp. 1129-1148.
[LZ24] H. Lavenant and G. Zanella. "Convergence rate of random scan coordinate ascent variational inference under log-concavity". In: SIAM 7. Optim. 34.4 (2024), pp. 3750-3761.
[Nes18] Y. Nesterov. Lectures on convex optimization. Vol. 137. Springer Optimization and Its Applications. Springer, 2018, pp. xxiii+589.
[NN94] Y. Nesterov and A. S. Nemirovski. Interior-point polynomial algorithms in convex programming. Vol. 13. SIAM Studies in Applied Mathematics. Society for Industrial and Applied Mathematics (SIAM), Philadelphia, PA, 1994, pp. $\mathrm{x}+405$.
[NY83] A. S. Nemirovski and D. B. Yudin. Problem complexity and method efficiency in optimization. Wiley-Interscience Series in Discrete Mathematics. Translated from the Russian and with a preface by E. R. Dawson. John Wiley \& Sons, Inc., New York, 1983, pp. xv+388.
[OV00] F. Otto and C. Villani. "Generalization of an inequality by Talagrand and links with the logarithmic Sobolev inequality". In: 7. Funct. Anal. 173.2 (2000), pp. 361-400.
[OV01] F. Otto and C. Villani. "Comment on: "Hypercontractivity of Hamilton-Jacobi equations" [J. Math. Pures Appl. (9) 80 (2001), no. 7, 669-696] by S. G. Bobkov, I. Gentil and M. Ledoux". In: J. Math. Pures Appl. (9) 80.7 (2001), pp. 697-700.
[PC19] G. Peyré and M. Cuturi. Computational optimal transport: with applications to data science. Now, 2019.
[PJ92] B. T. Polyak and A. B. Juditsky. "Acceleration of stochastic approximation by averaging". In: SIAM 7. Control Optim. 30.4 (1992), pp. 838-855.
[Pol63] B. T. Polyak. "Gradient methods for minimizing functionals". In: Ž. Vyčisl. Mat i Mat. Fiz. 3 (1963), pp. 643-653.
[Roc97] R. T. Rockafellar. Convex analysis. Princeton Landmarks in Mathematics. Reprint of the 1970 original, Princeton Paperbacks. Princeton University Press, Princeton, NJ, 1997, pp. xviii+451.
[RR11] M. Raginsky and A. Rakhlin. "Information-based complexity, feedback and dynamics in convex programming". In: IEEE Trans. Inform. Theory 57.10 (2011), pp. 7036-7056.
[San15] F. Santambrogio. Optimal transport for applied mathematicians. Vol. 87. Progress| in Nonlinear Differential Equations and their Applications. Calculus of variations, PDEs, and modeling. Birkhäuser/Springer, Cham, 2015, pp. xxvii+353.
[SBC16] W. Su, S. Boyd, and E. J. Candès. "A differential equation for modeling Nesterov's accelerated gradient method: theory and insights". In: 7. Mach. Learn. Res. 17 (2016), Paper No. 153, 43.
[Sha+18] F. Shang, L. Jiao, K. Zhou, J. Cheng, Y. Ren, and Y. Jin. "ASVRG: accelerated proximal SVRG". In: Proceedings of the 10th Asian Conference on Machine Learning. Ed. by J. Zhu and I. Takeuchi. Vol. 95. Proceedings of Machine Learning Research. PMLR, Nov. 2018, pp. 815-830.
[Sin64] R. Sinkhorn. "A relationship between arbitrary positive matrices and doubly stochastic matrices". In: Ann. Math. Statist. 35 (1964), pp. 876-879.
[Vaa98] A. W. van der Vaart. Asymptotic statistics. Vol. 3. Cambridge Series in Statistical and Probabilistic Mathematics. Cambridge University Press, Cambridge, 1998, pp. xvi+443.
[Ver18] R. Vershynin. High-dimensional probability. Vol. 47. Cambridge Series in Statistical and Probabilistic Mathematics. An introduction with applications in data science, With a foreword by Sara van de Geer. Cambridge University Press, Cambridge, 2018, pp. xiv+284.
[Vil03] C. Villani. Topics in optimal transportation. Vol. 58. Graduate Studies in Mathematics. American Mathematical Society, Providence, RI, 2003, pp. xvi+370.
[Vil09] C. Villani. Optimal transport. Vol. 338. Grundlehren der Mathematischen Wissenschaften [Fundamental Principles of Mathematical Sciences]. Old and new. Springer-Verlag, Berlin, 2009, pp. xxii+973.
[Vis12] N. K. Vishnoi. " $L x=b$ Laplacian solvers and their algorithmic applications". In: Found. Trends Theor. Comput. Sci. 8.1-2 (2012), front matter, 1-141.
[Wai19] M. J. Wainwright. High-dimensional statistics. Vol. 48. Cambridge Series in Statistical and Probabilistic Mathematics. A non-asymptotic viewpoint. Cambridge University Press, Cambridge, 2019, pp. xvii+552.
[WS16] B. E. Woodworth and N. Srebro. "Tight complexity bounds for optimizing composite objectives". In: Advances in Neural Information Processing Systems. Ed. by D. Lee, M. Sugiyama, U. Luxburg, I. Guyon, and R. Garnett. Vol. 29. Curran Associates, Inc., 2016.
[WWJ16] A. Wibisono, A. C. Wilson, and M. I. Jordan. "A variational perspective on accelerated methods in optimization". In: Proc. Natl. Acad. Sci. USA 113.47 (2016), E7351-E7358.


[^0]:    ${ }^{1}$ There is a caveat: in this course, we solely consider continuous optimization problems. Combinatorial optimization is an entirely different beast.

[^1]:    ${ }^{2}$ This is not to be confused with the mathematical usage of "smoothness" as "infinitely differentiable".

[^2]:    ${ }^{3}$ This is a standard fact about the Wishart distribution; see, e.g., [Ver18, Theorem 4.4.5].

[^3]:    ${ }^{4}$ This arises in connection with second-order differential operators.

[^4]:    ${ }^{5}$ Perhaps I will change my mind in a future edition of these notes.

[^5]:    ${ }^{6}$ This is not standard terminology but it is convenient.

[^6]:    ${ }^{7}$ This discussion is not entirely correct since Theorem 4.4 only applies to gradient span algorithms, which does not cover CoGM. However, the moral of the discussion is true for bona fide oracle lower bounds.

[^7]:    ${ }^{8}$ Actually this is not exactly true because $x_{\star}$ could lie near the boundary of $[-R, R]^{d}$. To fix this, one could instead look for a minimizer of $f$ over $\mathcal{C}^{\prime}:=[-R+\delta, R-\delta]^{d}$, i.e., define $x_{\delta, \star}$ to be a minimizer over this smaller cube and set $\mathcal{C}:=\mathcal{C}^{\prime} \cap\left\{f-f\left(x_{\delta, \star}\right) \leq \varepsilon\right\}$. If we take $\delta=\varepsilon /(L \sqrt{d})$, then by $L$-Lipschitzness we see that any point in $\mathcal{C}$ is a $2 \varepsilon$-minimizer of $f$ over $[-R, R]^{d}$, and now $\mathrm{B}\left(x_{\delta, \star}, \delta\right) \subseteq \mathcal{C}$. This does not really change the argument.

[^8]:    ${ }^{9}$ Lower bounds for randomized algorithms require the use of information theory.

[^9]:    ${ }^{10}$ Strictly speaking, this is the Fréchet derivative.

[^10]:    ${ }^{11}$ The result for RAM requires an almost sure bound on the iterates, but let us ignore this detail for the sake of this discussion.

[^11]:    ${ }^{12}$ Yes, the name is comically long.

