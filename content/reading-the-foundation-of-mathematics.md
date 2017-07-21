+++
categories = ["Blog"]
date = "2016-11-12T11:15:24+08:00"
draft = true
slug = ""
title = "reading the foundation of mathematics"

+++

1. Two different ways of learning. Intuitive vs formal.
2. Review intuitive math.
  1. 0.999... is equal 1, some real number has two expressions.
3. Set
4. Relation and Order
  0. Pair has order. TODO Def?
  1. Relation is the set of pair.
5. Funciton
  0. Function is a relation that for each element in domain set there exists only corresponding element in range set. TODO need correct
  1. injective, surjective, bijective
6. Logic
7. Proof

8. Natural Number
  1. 0 belong to set S.
  2. function s is surjective.
  3. if for each n belong to S infer s(n) belong to S, then S is N\*


### Relation

Equivalance:

  - (E1) x ~ x for all x in X (~ is reflexive),
  - (E2) If x ~ y then y ~ x (~ is symmetric),
  - (E3) If x ~ y and y ~ z then x ~ z (~ is transitive).

  
Weak Order:

  - (WO1) _a R b_ and _b R c_ imply _a R c_
  - (WO2) either _a R b_ or _b R a_ (or both)
  - (WO3) _a R b_ and _b R a_ imply _a = b_


Strict Order:

  - (SO1) a S b and b S c imply a S c
  - (SO2) Given `$a, b \in A$`, then precisely one of the following hold (and not the other two):
    a S b, b S a, a = b.

### Real Number

(a) Arithmetic

  - (A1) a + b = b + a
  - (A2) a + (b + c) = (a + b) + c
  - (A3) There exists `$0 \in  \mathbb{R}$` such that a + 0 = a for all `$a \in \mathbb{R}$`
  - (A4) Given `$a \in \mathbb{R}$` there exists `$-a \in \mathbb{R}$` such that a + (-a) = 0
  - (M1) ab = ba
  - (M2) a(bc) = (ab)c
  - (M3) There exists `$1 \in \mathbb{R}$`, such that `$1 \ne 0$`, and 1a = a for all `$a \in \mathbb{R}$`
  - (M4) Given `$a \in \mathbb{R}, a \ne 0$`, there exists `$a^{-1} \in \mathbb{R}$` such that `$aa^{-1} = 1$`
  - (D) a(b + c) = ab + ac

(b)
