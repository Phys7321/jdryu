"""
Challenge Problem 3, Part 7
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

nwalkers = 10000
Nmeasure = 10000
Tarr = [10, 40]
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
    Ems = np.mean(E**2) - (np.mean(E))**2

    print('Temperature:', T)
    print('Mean square energy fluctuation:', Ems/T**2)
