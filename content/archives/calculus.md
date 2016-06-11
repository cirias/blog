+++
categories = ["Blog"]
date = "2016-05-30T21:30:32+08:00"
draft = true
slug = ""
title = "Calculus"

+++

# LIMIT

## DEFINITION OF ONE-SIDED LIMIT

Suppose `$f(x)$` gets really close to `$R$` for values of `$x$` that get really close to (but are not equal to) `$a$` from the right. Then we say `$R$` is the right-hand limit of the function `$f(x)$` as xx approaches aa from the right.

We write

<div>$$f(x) \rightarrow R\quad as\quad x \rightarrow a^+$$</div>
or
<div>$$\lim _{x\rightarrow \mathbf{a^+}} f(x) = R.$$</div>
If `$f(x)$` gets really close to LL for values of `$x$` that get really close to (but are not equal to) `$a$` from the left, we say that `$L$` is the left-hand limit of the function `$f(x)$` as `$x$` approaches `$a$` from the left.

We write

<div>$$ f(x) \rightarrow L\quad as\quad x \rightarrow a^- $$</div>
or
<div>$$ \lim _{x\rightarrow \mathbf{a^-}} f(x) = L. $$</div>


## DEFINITION OF THE LIMIT

The Limit in Words

If a function `$f(x)$` approaches some value `$L$` as `$x$` approaches `$a$` from both the right and the left, then the limit of `$f(x)$` exists and equals `$L$`.

The Limit in Symbols

If

<div>$$\displaystyle {\lim _{x\rightarrow a^+} f(x)} = \displaystyle {\lim _{x\rightarrow a^-} f(x)} = L$$</div>
then

<div>$$ \displaystyle {\lim _{x\rightarrow a} f(x) = L}. $$</div>

Alternatively,

<div>$$ f(x) \rightarrow L \quad \mathrm{as} \quad x\rightarrow a. $$</div>

Remember that `$x$` is approaching `$a$` but does not equal `$a$`.


## THE LIMIT LAWS:

Suppose `$\displaystyle {\lim _{x\rightarrow a} f(x) = L}, \qquad \displaystyle {\lim _{x\rightarrow a} g(x) = M}$.`

Then we get the following Limit Laws:

Limit Law for Addition:	`$\displaystyle {\lim _{x\rightarrow a} \left[f(x)+g(x)\right] }=L+M$`

Limit Law for Subtraction:	`$\displaystyle {\lim _{x\rightarrow a} \left[f(x)-g(x)\right] }=L-M$`

Limit Law for Multiplication:	`$\displaystyle {\lim _{x\rightarrow a} \left[f(x)\cdot g(x)\right] }=L\cdot M.$`


## BASIC CONTINUOUS FUNCTIONS

Note: we have not proven all of the following facts, but you should feel free to use them.

The following functions are continuous at all real numbers:

all polynomials

`$ \sqrt[3]{x} $`

`$|x|$`

`$\cos(x)$` and `$\sin(x)$`

exponential functions `$a^x$` with base `$a>0$`

The following functions are continuous at the specified values of `$x$`:

`$ \sqrt x$`, for `$x >0$`

`$ \tan(x)$`, at all `$x$` where it is defined

logarithmic functions `$\log _{a} x$` with base `$a>0$`, for `$x > 0$`


## INTERMEDIATE VALUE THEOREM

If `$f$` is a function which is continuous on the interval `$[a,b]$`, and MM lies between the values of `$f(a)$` and `$f(b)$`, then there is at least one point `$c$` between `$a$` and `$b$` such that `$f(c) = M$`.

(A function `$f$` is continuous on a closed interval `$[a,b]$` if it is right-continuous at `$a$`, left-continuous at `$b$`, and continuous at all points between `$a$` and `$b$`.)


## LIMIT LAW FOR DIVISION

If `$\displaystyle {\lim _{x\rightarrow a} f(x) = L}$` and `$\displaystyle {\lim _{x\rightarrow a} g(x) = M}$`, then:

If `$M \ne 0$`, then `$\displaystyle { \lim _{x\rightarrow a} \frac{f(x)}{g(x)} = \frac{L}{M}}$`.

If `$M = 0$` but `$L \ne 0$`, then `$\displaystyle {\lim _{x\rightarrow a} \frac{f(x)}{g(x)}}$` does not exist.

If both `$M = 0$` and `$L = 0$`, then `$\displaystyle {\lim _{x\rightarrow a} \frac{f(x)}{g(x)}}$` might exist, or it might not exist. More work is necessary to determine whether the last type of limit exists, and what it is if it does exist.

# DERIVATIVE

## WHAT IS THE DERIVATIVE? AVERAGE VS INSTANTANEOUS RATES OF CHANGE

Instantaneous rate of change

## WHAT IS THE DERIVATIVE?

Geometric Interpretation of the Derivative: Tangent and Secant Lines
Instantaneous rate of change

Slope of the tangent line at that point

## WHAT THE DERIVATIVE IS.

- Instantaneous rate of change
- Slope of the tangent line at a point
- A function

## HOW DO WE CALCULATE  f'?

1. Slopes of tangent lines
2. Limits
3. Formulas

### DERIVATIVES OF CONSTANT MULTIPLES - PROOF

Suppose that `$g(x)=kf(x)$` for all `$x$`, where `$k$` is a constant. We want to prove that `$g'(x) = kf'(x)$` at any point `$x$` where `$f$` is differentiable.

We know that

<div>
$$ g'(x) = \lim _{\Delta x \rightarrow 0} \frac{g(x+ \Delta x) - g(x)}{\Delta x} $$
$$= \lim _{\Delta x \rightarrow 0} \frac{kf(x + \Delta x) - kf(x)}{\Delta x} $$
$$= \lim _{\Delta x \rightarrow 0} k\frac{f(x + \Delta x) - f(x)}{\Delta x} $$
$$= \lim _{\Delta x \rightarrow 0} k \ \lim _{\Delta x \rightarrow 0} \frac{f(x + \Delta x) - f(x)}{\Delta x}.  $$
</div>

The first limit is just `$k$`, and the second limit is the definition of `$f'(x)$`. So we get `$g'(x) = k f'(x)$`.

### DERIVATIVES OF CONSTANT MULTIPLES

If `$g(x) = kf(x)$` for some constant kk, then

<div>$$g'(x) = kf'(x)$$</div>

at all points where `$f$` is differentiable.

### DERIVATIVES OF SUMS

If `$h(x) = f(x) + g(x)$`, then

<div>$$h'(x) = f'(x) + g'(x)$$</div>

at all points where `$f$` and `$g$` are differentiable.

### DERIVATIVES OF DIFFERENCES

Similarly, if `$j(x) = f(x) - g(x)$`, then

<div>$$j'(x) = f'(x) - g'(x)$$</div>

at all points where `$f$` and gg are differentiable.

### THE POWER RULE

If `$n$` is any fixed number, and `$f(x) = x^ n$`, then `$f'(x) = n x^{n-1}$`.

## Leibniz NOTATION

<div>$$f'(x)$$</div>
<div>$$\frac{df}{dx}$$</div>
<div>$$\frac{dy}{dx}$$</div>
<div>$$\frac{d}{dx}f$$</div>
<div>$$\frac{d}{dx}y$$</div>

## WHAT IS THE SECOND DERIVATIVE?

- Acceleration
- Derivative of a derivative
- A function
- A rate of change of a rate of change

### SECOND DERIVATIVE AND CONCAVITY SUMMARY

On intervals where `$f^{\prime \prime } > 0$`, the function `$f$` is concave up.

On intervals where `$f^{\prime \prime } < 0$`, the function `$f$` is concave down.

## DERIVATIVE OF SINE AND COSINE

The derivative of of the trig functions are:

<div>$$\frac{d}{dx} \sin (x) = \cos (x)$$</div>
<div>$$\frac{d}{dx} \cos (x) = -\sin (x)$$</div>
<div>$$\frac{d^2}{dx^2} \sin (x) = -\sin (x)$$</div>
<div>$$\frac{d^2}{dx^2} \cos (x) = -\cos (x)$$</div>

# Help Links

http://meta.math.stackexchange.com/questions/5020/mathjax-basic-tutorial-and-quick-reference
