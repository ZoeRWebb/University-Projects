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
A = USV^{\top}.
```
The code produces 6 rank $k$ approximations which reconstruct the image, by accessing the only the $k^{th}$ columns of $U$ and $V$ and the element $s_{k,k}$ of $S$. As $k$ increases, more information of the image is added, and the reconstructions of the image become visibly more similar to the original image in grey-scale.

### Heat_Diffusion

The heat diffusion equation for the temperature $T$ moving with speed $c$ is given by

```math
\frac{\partial T}{\partial t} + c\frac{\partial T}{\partial x} = k\frac{\partial^{2}T}{\partial x^{2}}.
```
I discretised this so that I could calculate the temperature $T$ in position $i$ at the next time step $n+1$, $T_{i}^{(n+1)}$, from known values of the temperature at the previous time step:

```math
T_{i}^{(n+1)} = \left(\frac{\Delta t(k-c\Delta x)}{\Delta x^{2}}\right)T_{i+1}^{(n)} + \left(1+\frac{\Delta t(-2k+c\Delta x)}{\Delta x^{2}}\right)T_{i}^{(n)} + \left(\frac{k\Delta t}{\Delta x^{2}}\right)T_{i-1}^{(n)}
```

Given some initial conditions, boundary conditions and values for $c$ and $k$, the code generates new values of the temperature using an equation of the form $\textbf{T}^{(n+1)} = L\textbf{T}^{(n)}$. It produces the numerical solution, which is a plot of the temperature at position $x$ and time $t$.

## Optimisation

The following programs were written during a 1 hour test relating to optimisational methods.

### Gradient_Descent_Method

The Gradient Descent method is an iterative algorithm that, given an initial point $\textbf{x}_{0}$, will approximate the minimum value of the function.
Given the function

```math
f(x_{1},x_{2}) = x_{1}^{3} + x_{2}^{3} +3x_{1}x_{2}^{2} - 15(x_{1} + x_{2}),
```

this program defines two functions, grad and Grad_Descent. grad takes an array $\textbf{x}$ and returns the value of the gradient of the function at $\textbf{x}$. Grad_Descent takes an initial guess, a value for $\alpha$ (here, $\alpha = 0.01$), and a tolerance value. It then uses the initial value to generate $\textbf{x}^{(k+1)} = \textbf{x}^{(k)} - \nabla f(\textbf{x}^{(k)})$, where $\nabla f$ represents the grad function.
Then the program makes a contour plot of $f$, plots each $(x_{1},x_{2})$ generated in Grad_Descent on the contour, and saves the figure produced.

### Contour_Plot

This program makes a contour plot of the function $f(x,y)=xy$ and plots the circle $x^{2}+y^{2} = 1$ on it. It then marks the point $(\frac{1}{\sqrt{2}},\frac{1}{\sqrt{2}})$, which happens to be an extremiser of the function on the circle. Finally, the program plots two vectors, $\nabla f$ and $\nabla h = 2x\hat{\textbf{x}} + 2y\hat{\textbf{y}}$ at the point $(\frac{1}{\sqrt{2}},\frac{1}{\sqrt{2}})$, and saves the figure.
