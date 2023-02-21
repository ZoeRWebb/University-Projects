# University-Projects
This repository contains programs developed for assignments in my three-year university course. This document outlines the function of each program.

## Numerical_Analysis
This folder consists of three files, each submitted as pieces of coursework for a module regarding numerical methods on differential equations and linear algebra.

### Van_der_Pol_Oscillator

The Van der Pol non-linear oscillator is given by

```math
\frac{d^{2}f}{dt^{2}}-\mu(1-f^{2})\frac{df}{dt}+f = 0.
```
Using the forward Euler method, I broke the equation down into two recursive formulae by hand, giving

```math
\begin{cases}
x_{n+1} = x_{n} + \Delta ty\\y_{n+1} = y_{n} + \Delta t(-x_{n} + \mu(1-x^{2}_{n})y_{n}).
\end{cases}
```
Then I wrote the MATLAB code, which employs a for loop to generate a numerical approximation to the solution of the equation, considering given initial conditions and a value for $\mu$. In this instance, $\mu = 1$, and the code produces a plot of the approximate solution, where the amplitude increases over the time period $0 <= t <= 50$. A value of $\mu = 0.1$ produces an oscillation which is more frequent than when $\mu = 1$, and the amplitude is generally constant in the same time period. There is also a slight curvature to the oscillation. A value of $\mu = 4$ gives an oscillation that is less frequent and generally constant in amplitude over that same time period, and the curvature in the oscillation is exaggerated.

### Image_Compression_SVD

Given an image, this MATLAB code converts the image into an $m \times n \times 3$ matrix representing RGB scale, where $m \times n$ is the dimension of the image. Singular Value Decomposition is then performed on a grey-scale version of that matrix $A$, giving three matrices $U$, $S$ and $V$, satisfying
```math
A = USV^{T}.
```
The code produces 6 rank $k$ approximations which reconstruct the image, by accessing the only the $k^{th}$ columns of $U$ and $V$ and the element $s_{k,k}$ of $S$. As $k$ increases, more information of the image is added, and the reconstructions of the image become visibly more similar to the original image in grey-scale.
