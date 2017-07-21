+++
categories = ["Blog"]
date = "2016-05-19T11:27:32+08:00"
draft = true
slug = ""
title = "How CDMA works"

+++

1. near-far problem: if all transmitters send signal with the same strength of power, the base station won't recevie the signal from farer transmitter. Cause the near one's signal is much bigger then far one's.
2. not only that, each transmitter's signal is the interference to the others. The situation become much complicated. The signal of each transmitter recieved by the reciever is not only dicided by the signal power itself but also depend on the others' power. It comes to Signal to Interference Ratio.

<div>$$SIR = {P_iG_{ii}\over{\sum_{j=1}^NP_jG_{ij}}+n_i}$$</div>

3. the solution is Distributed Power Control. It is distributed and iterative.

<div>$$P_i[t+1] = {{\gamma_i\over{SIR_i[t]}}P_i[t]}$$</div>

4. DPC through optimization

  the problem is a __Linear Programming__ problem.

  Objective: minimize `$\sum_{i=1}^NP_i$`
  Constraint: `$SIR(\overrightarrow{P}) \geq \gamma_i, i = 1,2,...,N$`
  Variable: `$\overrightarrow{P}$`

5. DPC as a Game

  Notions:
  * Prisoner Dilemma
  * Best Response
  * Dominant Strategy
  * Nash Equilibrium

  Players: transmitters `1,2,...,N` 
  Strategy space: `$P_i: \gamma_i archieved$` 
  Payoff function: `$P_i$` 
