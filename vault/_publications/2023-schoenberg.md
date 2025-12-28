---
layout: publication
title: A matrix-valued Schoenberg's problem and its applications
date: 2023-06-01
year: 2023
authors:
  - Pavel Ievlev
  - Svyatoslav Novikov
venue: Electronic Communications in Probability
type: academic
status: published
description: We present criteria for positive definiteness of matrix-valued exponential functions involving absolute values and sign functions. Applications include multivariate fractional Ornstein-Uhlenbeck processes and variogram modelling.
keywords:
  - Matrix-valued positive definite functions
  - Positive definiteness
  - Multivariate processes
  - Gaussian processes
  - Multivariate Ornstein-Uhlenbeck process
  - Multivariate fractional Brownian motion
  - Cross-variogram
  - Stationary time-series
doi: 10.1214/23-ecp562
bibtex: |-
  @article {MR4684061,
      AUTHOR = {Ievlev, Pavel and Novikov, Svyatoslav},
      TITLE = {A matrix-valued {S}choenberg's problem and its applications},   
      JOURNAL = {Electron. Commun. Probab.},
      FJOURNAL = {Electronic Communications in Probability},
      VOLUME = {28},
      YEAR = {2023},
      PAGES = {Paper No. 48, 12},
      ISSN = {1083-589X},
      MRCLASS = {42A82 (47A56 60G15 60G60)},
      MRNUMBER = {4684061},
      MRREVIEWER = {Ana\ Paula\ Peron},
      DOI = {10.1214/23-ecp562},
      URL = {https://doi.org/10.1214/23-ecp562}
  }
---

In this paper we present a criterion for positive definiteness of the matrix-valued function
$$f(t) := \exp(-|t|^\alpha[B^+ + B^- \text{sign}(t)]),$$
where $\alpha \in (0, 2]$ and $B^\pm$ are real symmetric and antisymmetric $d \times d$ matrices. We also find a criterion for positive definiteness of its multidimensional generalization 
$$f(t) := \exp(- \int_{\mathbb{S}^{d-1}} |t^\top s|^\alpha[B^+ + B^- \text{sign}(t^\top s)]d\Lambda(s))$$ 
where $\Lambda$ is a finite measure on the unit sphere $\mathbb{S}^{d-1} \subset \mathbb{R}^d$ under a more restrictive assumption that $B^\pm$ commute and are normal. The associated stationary Gaussian random field may be viewed as a generalization of the univariate fractional Ornstein-Uhlenbeck process. This generalization turns out to be particularly useful for the asymptotic analysis of $\mathbb{R}^d$-valued Gaussian random fields. Another possible application of these findings may concern variogram modelling and general stationary time series analysis.
