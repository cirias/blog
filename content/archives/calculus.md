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


### LINEAR APPROXIMATION

The linear approximation for a function \ f f near a point x=ax=a is given by the following equivalent formulas:

<div>$$\Delta f \approx \left. \frac{df}{dx} \right|_{x=a} \cdot \Delta x \qquad \ \mathrm{for} \ \Delta x \ \mathrm{near} \ 0$$</div>
<div>$$f(x) \approx f'(a) (x-a) + f(a) \ \ \ \mathrm{for} \ x \ \mathrm{near} \ a$$</div>

### THE PRODUCT RULE

If `$h(x) = f(x)g(x)$`, then

<div> $$ h'(x) = f(x)g'(x)+ g(x)f'(x) $$ </div>

at all points where the derivatives `$f'(x)$` and `$g'(x)$` are defined.

### THE QUOTIENT RULE

If `$h(x) = \frac{f(x)}{g(x)}$` for all `$x$`, then

<div> $$ h'(x) = \frac{f'(x)g(x)-f(x)g'(x)}{g(x)^2} $$ </div>

at all points where `$f$` and `$g$` are differentiable and `$g(x) \ne 0$`.

### DERIVATIVES OF ALL TRIGONOMETRIC FUNCTIONS

<div> $$ {\frac{d}{dx}} \sin x = \cos x $$ </div>
<div> $$ {\frac{d}{dx}} \cos x = -\sin x $$ </div>
<div> $$ {\frac{d}{dx}} \tan x = \frac{1}{\cos ^2 x} $$ </div>
<div> $$ {\frac{d}{dx}} \cot x = -\frac{1}{\sin ^2 x} $$ </div>
<div> $$ {\frac{d}{dx}} \sec x = \frac{\sin x}{\cos ^2 x} $$ </div>
<div> $$ {\frac{d}{dx}} \csc x = -\frac{\cos x}{\sin ^2 x} $$ </div>

### THE CHAIN RULE

If `$h(x) = f(g(x))$`, then

<div> $$ h'(x) = f'\left(g(x)\right) g'(x) $$ </div>

at all points where the derivatives `$f'(g(x))$` and `$g'(x)$` are defined.

Alternatively, if `$y = f(u)$`, and `$u=g(x)$`, then

<div> $$ \left. \frac{dy}{dx} \right|_{x = a} = \left. \frac{dy}{du} \right|_{u=g(a)} \left. \frac{du}{dx} \right|_{x=a} $$ </div>

at any point `$x=a$` where the derivatives on the right hand side are defined.

### IMPLICIT FUNCTIONS

The idea behind the previous problem was that immediately differentiating `$y=x^{m/n}$` was hard. But differentiating the implicit function `$y^ n=x^ m$` was a whole lot easier. This happens any time your function is more simply described implicitly. An implicit function is an equation involving both `$x$` and `$y$` (or any two variables really). You could solve for `$y$` as a function of `$x$`, but often times, that computation is messy (or impossible). If a function is not implicit, we say that it is explicit.

### DEFINITION OF INVERSE FUNCTION

If functions `$f$` and `$g$` satisfy `$g\left(f(x)\right) = x$` and `$f\left(g(y)\right) = y$`, then we say `$g$` is the inverse of `$f$`, and denote it by `$f^{-1}$`. (Similarly, `$f = g^{-1}$`.)

If a function `$f$` has an inverse function `$f^{-1}$`, then `$f^{-1}(b)= a$` if and only if `$f(a) = b$`.

### DERIVATIVES OF INVERSE FUNCTIONS

If `$g$` is a (full or partial) inverse of a function `$f$`, then

<div> $$ {g'(x) = \frac{1}{f'\left(g(x)\right)}} $$ </div>

at all `$x$` where `${f'\left(g(x)\right)}$` exists and is non-zero.

### THE DERIVATIVE OF AN EXPONENTIAL FUNCTION

The derivative of the exponential function is

<div> $$ \frac{d}{dx}a^ x = M(a) a^ x $$, </div>

where the mystery number `$M(a)$` is the slope of the tangent line at zero:

<div> $$ M(a) =\left. \frac{d}{dx}a^ x\right|_{x=0} = \lim _{\Delta x\rightarrow 0} \frac{a^{\Delta x}-1}{\Delta x} $$. </div>

### DEFINITION OF `$e$`
The base `$e$` is the unique real number so that `$M(e) = \left.\frac{d}{dx} e^ x\right|_{x=0} = 1$`. Then

<div> $$ \frac{d}{dx}e^ x = e^ x $$. </div>

### PROPERTIES OF `$\ln x$`
`$\log _{10}(x)$` is the inverse function of `$10^ x$`.

The natural log, denoted `$\ln (x)$`, is the inverse function of `$e^ x$`.

<div> $$ \ln e^ x =x $$ </div>

<div> $$ e^{\ln x} = x $$ </div>

<div> $$ \ln (ab) = \ln (a) + \ln (b) $$ </div>

<div> $$ \ln (a^ b) = b\ln (a) $$ </div>

### THE DERIVATIVE OF THE NATURAL LOGARITHM

Our collection of basic functions that we can differentiate now has one more entry:

<div> $$ \frac{d}{dx} \ln x = \frac{1}{x} $$ </div>

### DIFFERENTIATING EXPONENTIAL FUNCTIONS WITH OTHER BASES

We can finally identify our mystery number, and differentiate exponential functions with any base.

For any positive constant `$a$`,

<div> $$ \frac{d}{dx} a^ x = a^ x \ln a $$. </div>

#### METHOD 1: CHANGE TO BASE E

To calculate `$\left( f(x)^{g(x)} \right)^{\prime }$`,

first change base `$f(x)^{g(x)} = e^{g(x)\ln f(x)}$`,

then differentiate using the chain rule, and the derivatives of the exponential and natural logarithm functions.

#### METHOD 2: LOGARITHMIC DIFFERENTIATION

To calculate `$u^{\prime }$`,

first calculate `$\left(\ln (u)\right)^{\prime }$`,

then use the formula

<div> $$ \frac{u^{\prime }}{u} = \left(\ln (u)\right)^{\prime } $$ </div>

and solve for `$u'$`.

# Help Links

http://meta.math.stackexchange.com/questions/5020/mathjax-basic-tutorial-and-quick-reference
