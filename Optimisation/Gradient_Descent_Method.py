# -*- coding: utf-8 -*-
"""
Created on Fri Oct 28 15:37:00 2022

@author: webbz2
"""
#Q2a
import numpy as np

def grad(x):
    
    x1 = x[0]
    x2 = x[1]
    gradf = np.zeros(2)
    gradf[0] = 3*x1**2 + 3*x2**2 - 15
    gradf[1] = 3*x2**2 + 6*x1*x2 - 15
    norm = np.linalg.norm(gradf)
    return(gradf, norm)
    
def Grad_Descent(x0, alpha, tolerance):
    
    x = x0
    count = 0
    xlist = [x]
    norm = 100
    while norm > tolerance:
        g, norm = grad(x)
        x = x- alpha*g
        xlist.append(x)
        count += 1
    print(xlist[-1])
    return(xlist)



#Q2b

import matplotlib.pyplot as plt

xlist = np.array(Grad_Descent([3,-1],0.01,10**-8))

x1_i = np.linspace(-4,4,100)
x2_i = np.linspace(-4,4,100)
x1,x2 = np.meshgrid(x1_i,x2_i)
f = x1**3 + x2**3 + 3*x1*x2**2 - 15*(x1 + x2)
plt.contour(x1,x2,f,20)
plt.colorbar()
plt.xlabel(r'$x_1$')
plt.ylabel(r'$x_2$')

X1 = xlist[:,0]
X2 = xlist[:,1]
plt.plot(X1,X2,'C3o-')
plt.savefig('prob.pdf')