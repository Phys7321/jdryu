"""
Challenge Problem 3, Part 4
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

nwalkers = 20
Nmeasure = 10000

for T in [10, 100, 400]:
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

    print('Temperature:', T)
    print('Steps til equilibrium:', Nwarmup)

    x = np.arange(0, Nwarmup, 1)
    pyplot.plot(x, Ewarmup, ls='-', c='blue')

    Emean = 0.
    E = []
    for j in range(Nmeasure):
        for i in range(nwalkers):
            vold = v[i]
            v[i] = metropolis(v[i], 5, T)

        E.append(np.sum(v ** 2)/nwalkers)
        Emean += np.sum(v ** 2)/nwalkers

    Emean = Emean / Nmeasure
    print('<Energy>:', Emean)

    y = np.arange(Nwarmup, Nwarmup+Nmeasure, 1)
    pyplot.plot(y, E, ls='-', c='red')
    pyplot.xscale('log')
    pyplot.show()


T = 100
for nwalkers in [10, 40]:
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

    print('N:', nwalkers)
    print('Steps til equilibrium:', Nwarmup)

    x = np.arange(0, Nwarmup, 1)
    pyplot.plot(x, Ewarmup, ls='-', c='blue')
    pyplot.show()
