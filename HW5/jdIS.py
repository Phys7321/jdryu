import numpy as np
from matplotlib import pyplot

# Part 2
# Simple Monte Carlo integration
n0 = 1000000
r = np.random.random(n0)

x = np.sqrt(r)/2
Itot = np.sum(x)/n0
print("Importance Sampling: ", Itot)

# Part 3
# Minimizing variance
n0 = 1000000
r = np.random.random(n0)

a = np.arange(0.5, 1.8, 0.1)
I = np.zeros(np.size(a))
Ivar = np.zeros(np.size(a))

for ai in a:
    x =
    Itot = np.sum(x)/n0
