import numpy as np
from matplotlib import pyplot

# Part 2
# Simple Monte Carlo integration
n0 = 1000000
r = np.random.random(n0)

x = np.sqrt(r)
Itot = np.sum(x/2)/n0
print("Importance Sampling: ", Itot)

# Part 3
# Minimizing variance
n0 = 1000000
r = np.random.random(n0)

a = np.arange(0.001, 0.5, 0.005)
I = np.zeros(np.size(a))
Ivar = np.zeros(np.size(a))
i = 0

for ai in a:
    norm = (-1+ai+np.e**(-ai))/ai
    x = -np.log(1-r)/ai/norm
    I = norm*np.sqrt(x)/(1-np.e**(-ai*x))
    I[i] = np.sum(I)/n0
    Ivar[i] = np.sqrt(np.absolute(I[i]**2 - np.sum(I**2))/n0)
    i += 1

pyplot.plot(a, Ivar)
pyplot.xlabel('a')
pyplot.ylabel('Variance of MC integral')
pyplot.show()
