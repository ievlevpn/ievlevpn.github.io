---
layout: talk
title: Asymptotic Behavior of Path Functionals for Vector-Valued Gaussian Processes at High Levels
date: 2025-07-15
year: 2025
venue: 44th Conference on Stochastic Processes and their Applications
location: Wrocław, Poland
type: invited
duration: 
audience_size: 
slides: /vault/assets/slides/2025-slides-SPA-conference.pdf
video: 
abstract: 
topics:
---
Understanding how long a stochastic system stays in a "safe" region is a core
question in risk management, queueing and reliability. In this project we study
high exceedance probabilities of the form
$$
  \mathbb{P} \{ \Gamma_{[0,T]} ( \hat{\boldsymbol{u}} ( \boldsymbol{X} - u \boldsymbol{b} ) ) > L_u \},
$$
as $u \to \infty$, where $\Gamma_{[0,T]}$ is a functional of a continuous
$d$-dimensional Gaussian process $\mathbf X(t)$ on $[0,T]$, and $L_u$ is some
sequence of thresholds, chosen appropriately for each $\Gamma$. The class of
functionals we treat is quite broad, including functionals of the form
$$
\Gamma_E ( \boldsymbol{f} ) = \int_{E} G ( \boldsymbol{f} ( t ) ) \, d t
\quad \text{and} \quad
\Gamma_{E \times F} ( \boldsymbol{f} ) = \sup_{t \in E} \inf_{s \in F} 
\min_{i = 1, \dots, d} f_i ( t, s ),
$$
where $G$ is some function satisfying additional assumptions. In particular,
this class includes the classical sojourn time, Parisian (moving-window infimum)
functional, area under the curve, as well as compositions of those with
continuous but not necessarily linear operators. Regarding the class of the
Gaussian processes, we study both stationary and non-stationary cases under the
assumptions similar to those of [Dębicki-Hashorva-Wang (2019)](https://doi.org/10.1016/j.spa.2020.04.008).

Key technical contributions include the extension of Pickands-type arguments to
these vector-valued settings and general functionals, supported by lemmas
detailing conditional process behaviour, uniform convergence, and properties of
the functionals themselves. The presentation will outline the main theorems,
discuss the crucial assumptions, and illustrate the framework's applicability
with examples. This work provides a unified approach to understanding extreme
sojourns for a broad class of Gaussian models.