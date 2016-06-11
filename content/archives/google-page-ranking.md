+++
categories = ["Blog"]
date = "2016-06-11T11:09:02+08:00"
draft = true
slug = ""
title = "google page ranking"

+++

Page rank is base on two factors:
1. revelance of the keyword and the page
2. importance of the page.

Focus on the importance of the page.

Assume the importance of a page will evenly spread with all the outgoing links.
Then a page's importance can be all its neighbor's importance divide by their outlinks' count:

<div>$$\sum_{j\rightarrow A}{\pi_i\over O_j}$$</div>

`$H$` is a matrix that its `$(i, j)$`th entry is `$1\over O_i$` if the page `$i$` have link to page `$j$`, otherwise is 0.

`$\pi[k]$` is an N * 1 column vector that `$\pi[k][i]$` is the importance of page `$i$`.

Initialize `$\pi[0]$` to 1. Then use the following function to iterate `$\pi$`. Finally, `$\pi$` wiil converge to consitence.

<div>$$\pi^T[k]=\pi^T[k-1]H$$</div>

If some page never link to any other page, we say people on this page have equivalent chance to goto all the other pages.
`$w$` is a vector that the `$w[i]$` equal to 1 if the page 1 is dangling, otherwise it is 0.

<div>$$\hat{H}=H+{1\over{N}}w1^T$$</div>

And there might be many consistent score vectors, all compatible with the given `$\hat{H}$`.
We add a random vector to `$\hat{H}$`, we say there is a chance of `$(1 − \theta)$` that you will jump to some other random webpage, without clicking any links.

<div>$$G=\theta\hat{H}+(1-\theta){1\over{N}}11^T$$</div>

Finally, we got:

<div>$$\pi^T[k]=\pi^T[k-1]G$$</div>
