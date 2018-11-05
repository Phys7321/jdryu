"""
Challenge Problem 3, Part 5, 6
"""

import numpy as np
from matplotlib import pyplot


def metropolis(vold, delta, T):
    vtrial = np.random.random()
    vtrial = vold + (2 * vtrial - 1) * delta
    weight = np.exp(-(vtrial ** 2 - vold ** 2) / T)
    vnew = vold
    if (weight >= 1):  # Accept
        vnew = vtrial
    elif (weight != 0):
        r = np.random.random()
        if (r <= weight):  # Accept
            vnew = vtrial
    return vnew


# Measurement loop

nwalkers = 1000
Nmeasure = 1000
Tarr = range(10, 110, 10)
Earr = []
colors = ['r', 'y', 'g', 'b', 'purple']
binwidth = 10
i = 0

for T in Tarr:
    v = np.zeros(nwalkers)
    v.fill(20)
    equicount = 0
    Nwarmup = 0
    Ewarmup = []

    while equicount < 5:
        Nwarmup += 1
        for i in range(nwalkers):
            vold = v[i]
            v[i] = metropolis(v[i], 5, T)
        Ewarmup.append(np.sum(v ** 2) / nwalkers)

        if Nwarmup > 10:
            Enew = np.sum(v**2)/nwalkers
            Eavg = np.mean(Ewarmup[-5:])
            dE = abs(Enew - Eavg) / Eavg
            if dE < 0.01:
                equicount += 1

    E = (v**2)
    Earr.append(np.mean(E))

    print('Temperature:', T)
    print('Steps til equilibrium:', Nwarmup)
    print('Mean energy:', np.mean(E))
    pyplot.hist(E, bins=np.arange(0., 500., binwidth), density=True, histtype='step', color=colors[(i%5)])

    i += 1

pyplot.show()
