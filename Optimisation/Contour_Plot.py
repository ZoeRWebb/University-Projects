# -*- coding: utf-8 -*-
"""
Created on Fri Oct 28 15:28:32 2022

@author: webbz2
"""

#Q1a

import numpy as np
import matplotlib.pyplot as plt

x1_i = np.linspace(-1,1,100)
x2_i = np.linspace(-1,1,100)
x1,x2 = np.meshgrid(x1_i,x2_i)
f = x1*x2
plt.contour(x1,x2,f,20)
plt.colorbar()
plt.xlabel(r'$x$')
plt.ylabel(r'$y$')

#Q1b

theta = np.linspace(0,2*np.pi,100)
h_x1 = np.cos(theta)
h_x2 = np.sin(theta)
plt.plot(h_x1,h_x2)

#Q1c

plt.plot(1/(np.sqrt(2)),1/(np.sqrt(2)),'o')

#Q1d

X = 1/(np.sqrt(2))
Y = 1/(np.sqrt(2))
plt.quiver(X,Y,Y,X)
plt.quiver(X,Y,2*X,2*Y)
plt.savefig('prob1.pdf')