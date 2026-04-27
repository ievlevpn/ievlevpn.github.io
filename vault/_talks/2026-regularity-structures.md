---
layout: talk
title: Introduction to Regularity Structures
date: 2026-03-22
year: 2026
venue: Mini-course (4 lectures)
location:
type: lecture
duration:
audience_size:
slides: "[[regularity-structures-notes.pdf]]"
video:
abstract:
topics:
  - Singular SPDEs and the failure of classical Picard iteration
  - Rough path theory, Chen relations, and lifts of stochastic integration
  - Concrete regularity structures, Hopf algebras, and the structure group $G^+$
  - Hölder–Besov spaces, models, and the metric on the space of models
  - Modelled distributions and Hairer's reconstruction theorem
  - Products, derivatives, and abstract integration on regularity structures
  - Multilevel Schauder estimates and the lifted Green function $\mathcal{K}^M$
  - Fixed-point theorem and short-time existence of solutions
  - Building a regularity structure from an SPDE via Picard iterations
  - Renormalization structures, BHZ character, Chandra–Hairer convergence
  - Stochastic quantization and the $\Phi^4_3$ Euclidean field theory
---
A four-lecture mini-course on Hairer's theory of regularity structures, a framework for making sense of singular stochastic PDEs such as $\Phi^4_3$, KPZ, and PAM. The exposition is largely based on Bailleul and Hoshino's *A Tourist's Guide to Regularity Structures and Singular Stochastic PDEs* ([arXiv:2006.03524](https://arxiv.org/abs/2006.03524)); the course follows the standard arc of the theory, but with emphasis on motivation: each algebraic object is introduced as the answer to an analytic question.

The starting point is that subcritical semilinear parabolic SPDEs $u_t = \Delta u + F(u, \partial u, \zeta)$ are typically ill-posed, with Picard iterations producing products of distributions that are not even defined. Smoothing the noise $\zeta_\varepsilon = \zeta * \rho_\varepsilon$ makes the equation well-posed, but the solutions $u_\varepsilon$ in general do not converge as $\varepsilon \to 0$. The aim of regularity structures is to build a deterministic, factorized solution map $\zeta \to M^\zeta \to \mathrm{Sol}$ such that the second arrow is continuous, and a finite-dimensional renormalization group $G^-$ that acts on the space of models, producing a family $(u^{(k)})_{k \in G^-}$ of candidate solutions, one of which is the physically relevant limit.

After motivating the formalism through rough path theory and a careful rereading of the Taylor expansion, we develop the algebraic side (regularity structures, models, structure group $G^+$), the analytic side (Hölder–Besov spaces, modelled distributions, reconstruction theorem), multilevel Schauder estimates and the lifted Green function $\mathcal{K}^M$, and finally the fixed-point theorem on modelled distributions that produces short-time solutions. The last lecture turns to renormalization: building the regularity structure of an equation from Picard iterations, the renormalization structure $\mathcal{U} = (U, U^-)$ and its splitting map $\delta$, the BHZ character and the Chandra–Hairer convergence theorem, and a brief look at stochastic quantization of the $\Phi^4_3$ Euclidean field theory via the Parisi–Wu prescription.

## Lectures

> [!lecture] 1. Motivation, rough paths, and abstract Taylor expansions
> Singular SPDEs and why naive Picard iteration produces ill-defined products of distributions. Solutions as families $(\bar u^{(k)})_{k \in G}$ indexed by a renormalization group; the factorization $\zeta \to M^\zeta \to \mathrm{Sol}$ as a way to "decouple probability and analysis". A quick tour of rough path theory: Chen relations, the lift $(X, \mathbb{X})$, and rough integration as the prototype for everything that follows. Reading Taylor expansions as a *jet of coefficients* against an abstract basis of monomial-like symbols.
> [video](https://youtu.be/M6S3zjOYQlE)

> [!lecture] 2. Regularity structures, models, and modelled distributions
> Concrete regularity structures $\mathcal{T} = (T^+, T)$: the graded bialgebra $T^+$ encoding reexpansion, the comodule $T$ encoding local behaviour, the structure group $G^+$ of characters acting via $\hat g$. Hölder–Besov spaces via parabolic rescaling and the heat-kernel test family $p_t(x, \cdot)$. Models $M = (g, \Pi)$ and the metric $d_\gamma(M, M')$. Modelled distributions $\mathcal{D}^\gamma(T, g)$ as a coordinate-free notion of jet, and the reconstruction theorem: a unique continuous operator $R^M: \mathcal{D}^\gamma \to C^{\beta_0 \wedge 0}$ with $R^M f \approx \Pi^g_x f(x)$ near $x$.
> [video](https://youtu.be/83mfQmnIkPE)

> [!lecture] 3. Calculus on modelled distributions and lifting the SPDE
> Regular products $\star: V_\alpha \times W_\beta \to T_{\alpha + \beta}$, derivatives as continuous linear maps lowering homogeneity, and abstract integration operators $\mathcal{I}, \mathcal{I}_n$ encoding $\partial^n K$. Multilevel Schauder estimates: building the lifted Green function $\mathcal{K}^M = \mathcal{I} + \mathcal{J}^M + \mathcal{N}^M$ such that $R^M \circ \mathcal{K}^M = K \circ R^M$. Lifting the SPDE to a fixed-point equation $\boldsymbol u = \boldsymbol h + \mathcal{P}^M_t(f^\star(\boldsymbol u) \,\Xi + g^\star(\boldsymbol u, D\boldsymbol u))$ on $\mathcal{D}^\gamma$, and short-time existence and continuity of the solution map $(M, \boldsymbol h) \mapsto \boldsymbol u$.
> [video](https://youtu.be/6e80yw9BdQ8)

> [!lecture] 4. Renormalization, Chandra–Hairer, and stochastic quantization
> Reading off the regularity structure of an equation (here $\Phi^4_3$) from Picard iterations as a list of trees of negative homogeneity. Renormalization structures $\mathcal{U} = (U, U^-)$, the splitting map $\delta: U \to U^- \otimes U$ that chops out divergent subforests, and the renormalization group $G^-_\mathrm{ad} \subset G^-$ acting on models by $M \mapsto {}^k M$. The BHZ character $k^\zeta = h^\zeta \circ S'_-$ via the negative twisted antipode, and the Chandra–Hairer convergence theorem for renormalized models in the $d_\gamma$-metric. A short coda on stochastic quantization: the Parisi–Wu prescription $\partial_t \Phi = -\delta S / \delta \Phi + \xi$ and how the $\Phi^4_3$ Euclidean field theory motivates the whole programme.
> [video](https://youtu.be/8hkRZvrMO4Q)
