---
layout: publication
title: Upper and lower bounds on TVD and KLD between centered elliptical distributions in high-dimensional setting
date: 2025-01-01
year: 2025
authors:
  - Pavel Ievlev
  - Timofei Shashkov
venue: submitted to Statistics and Probability Letters
type: academic
status: submitted
abstract: In this paper, we derive some upper and lower bounds and inequalities for the total variation distance (TVD) and the Kullback-Leibler divergence (KLD), also known as the relative entropy, between two probability measures $\mu$ and $\nu$.
keywords:
  - total variation distance
  - Kullback-Leibler divergence
  - multivariate Student distribution
  - high-dimensional statistics
  - Gamma distribution
doi: 
arxiv: "2501.02553"
pdf: 
bibtex: |-
  @article{ievlev_shashkov_2025,
    title={Upper and lower bounds on {TVD} and {KLD} between centered elliptical distributions in high-dimensional setting},
    author={Ievlev, Pavel and Shashkov, Timofei},
    journal={submitted to Statistics and Probability Letters},
    year={2025}
  }
---
In this paper, we derive some upper and lower bounds and inequalities for the total variation distance (TVD) and the Kullback-Leibler divergence (KLD), also known as the relative entropy, between two probability measures $\mu$ and $\nu$ defined by 

$$D_{\mathrm{TV}} ( \mu, \nu ) = \sup_{B \in \mathcal{B} (\mathbb{R}^n)} \left| \mu(B) - \nu(B) \right|$$

and

$$\quad D_{\mathrm{KL}} ( \mu \, \| \, \nu ) = \int_{\mathbb{R}^n} \ln \left( \frac{d\mu(x)}{d\nu(x)} \right) \, \mu(dx)$$

correspondingly when the dimension n is high. We begin with some elementary bounds for centered elliptical distributions admitting densities and showcase how these bounds may be used by estimating the TVD and KLD between multivariate Student and multivariate normal distribution in the high-dimensional setting. Next, we show how the same approach simplifies when we apply it to multivariate Gamma distributions with independent components (in the latter case, we only study the TVD, because KLD may be calculated explicitly, see [1]). Our approach is motivated by the recent contribution by Barabesi and Pratelli [2].