import numpy as np
from matplotlib import pyplot


def randU(N, a, c, M):
    r = np.zeros(N)
    seed = 1.
    r[0] = seed
    for i in range(1, N):
        r[i] = (a * r[i - 1] + c) % M
    return r/M


# Part 1
# Hit and miss Monte Carlo integration
ngroups = 16

N = np.zeros(ngroups)
I = np.zeros(ngroups)
E = np.zeros(ngroups)
I_IBM = np.zeros(ngroups)
E_IBM = np.zeros(ngroups)

n0 = 100
for i in range(ngroups):
    N[i] = n0

    x = randU(n0, 5, 0, 11)
    y = randU(n0, 5, 0, 11)
    I[i] = 0.
    Nin = 0
    for j in range(n0):
        if y[j] < np.sqrt(1 - x[j] ** 2):
            Nin += 1

    I[i] = 4. * float(Nin) / float(n0)
    E[i] = abs(I[i] - np.pi)

    # This the infamous RANDU
    coef = 65539
    bigint = 2 ** 31

    x_IBM = randU(n0, coef, 0, bigint)
    y_IBM = randU(n0, coef, 0, bigint)
    I_IBM[i] = 0.
    N_IBMin = 0
    for j in range(n0):
        if y_IBM[j] < np.sqrt(1 - x_IBM[j] ** 2):
            N_IBMin += 1

    I_IBM[i] = 4. * float(N_IBMin) / float(n0)
    E_IBM[i] = abs(I_IBM[i] - np.pi)

    n0 *= 2

pyplot.plot(N, E, ls='-', c='green', lw=1)
pyplot.plot(N, E_IBM, ls='-', c='red', lw=3)
pyplot.plot(N, 1 / np.sqrt(N), ls='-', c='blue', lw=3, alpha=0.25)
pyplot.xscale('log')
pyplot.yscale('log')
pyplot.show()

# Simple Monte Carlo Integration
ngroups = 16

I = np.zeros(ngroups)
N = np.zeros(ngroups)
E = np.zeros(ngroups)

n0 = 100
for i in range(ngroups):
    N[i] = n0
    r = randU(n0, 5, 0, 11)
    I[i] = 0.
    for j in range(n0):
        x = r[j]
        I[i] += np.sqrt(1 - x ** 2)

    I[i] *= 4. / float(n0)
    E[i] = abs(I[i] - np.pi)

    # This the infamous RANDU
    coef = 65539
    bigint = 2 ** 31

    r_IBM = randU(n0, coef, 0, bigint)
    I_IBM[i] = 0.
    for j in range(n0):
        x_IBM = r_IBM[j]
        I[i] += np.sqrt(1 - x_IBM ** 2)

    I_IBM[i] *= 4. / float(n0)
    E_IBM[i] = abs(I_IBM[i] - np.pi)

    n0 *= 2

pyplot.plot(N, E, ls='-', c='green', lw=1)
pyplot.plot(N, E_IBM, ls='-', c='red', lw=3)
pyplot.plot(N, 1 / np.sqrt(N), ls='-', c='blue', lw=3, alpha=0.25)
pyplot.xscale('log')
pyplot.yscale('log')
pyplot.show()
