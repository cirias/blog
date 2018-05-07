---
categories:
- Blog
date: 2016-06-11T14:33:58+08:00
draft: false
slug: ""
title: netflix movie recommandation
---

Baseline predictor function:

<div>$$\hat{r}_{ui}=\bar{r}+b_u+b_i$$</div>

- `$\bar{r}$` is the average of all the ratings.
- `$b_u$` is the average bias of the user's ratings.
- `$b_i$` is the average bias of the movie's ratings.


Use the following function to find `$b_u$`s and `$b_i$`s.

<div>$$minimize_{\{b_u,b_i\}}\sum_{(u,i)}(r_{ui}-\hat{r}_{ui})^2$$</div>


To fix the over fitting, plus the balencer to force `$b$` as small as possible.

<div>$$minimize_{\{b_u,b_i\}}\sum_{(u,i)}(r_{ui}-\hat{r}_{ui})^2+\lambda(\sum_ub_u^2+\sum_ib_i^2)$$</div>


The difference between raw data and baseline predictors:

<div>$$\tilde{r}_{ui}=r_{ui}-\hat{r}_{ui}$$</div>


Final predictor with collaberative filtering:

<div>$$\hat{r}_{ui}^N=(\bar{r}+b_u+b_i)+{\sum_{j\in{L_i}}d_{ij}\tilde{r}_{uj}\over{\sum_{j\in{L_i}}|d_{ij}|}}$$</div>

- `$d_{ij}$` means the __cosine coefficient__
- `L_i` is the top L similiar neighborhood
