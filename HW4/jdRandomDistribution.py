import numpy as np
from matplotlib import pyplot


def metropolis(xold, delta, sigma2):
    xtrial = np.random.random()
    xtrial = xold+(2*xtrial-1)*delta
    weight = np.exp(-0.5*(xtrial**2-xold**2)/sigma2)
    xnew = xold
    accept = 0
    if weight >= 1:     # Accept
        xnew = xtrial
        accept = 1
    else:
        r = np.random.random()
        if r <= weight:    # Accept
            xnew = xtrial
            accept = 1
    return xnew, accept


N = 100000

x = np.zeros(N)
delta = 2.
sigma = 10.
sigma2 = sigma**2

# Only here to get a better starting point
xwalker = 20.
Nwarmup = 500000
for i in range(Nwarmup):
    xwalker, accept = metropolis(xwalker, delta, sigma2)

delta_arr = []
accept_arr = []
equil_arr = []
for d in range(10, 100, 1):
    # initiating values for each delta iteration
    delta = 0.1*d
    accept = 0
    xms = 0
    i = 1

    x = np.zeros(N)
    x[0] = xwalker
    while i < N and abs(xms - sigma2) >= 0.001:
        x0 = x[i-1]
        for j in range(10):
            x0, a = metropolis(x0, delta, sigma2)
        x[i], a = metropolis(x0, delta, sigma2)
        accept += a
        xms = np.mean(x**2)
        i += 1
    delta_arr.append(delta)
    accept_arr.append(100*accept/(i-1))
    equil_arr.append(i-1)

# binwidth = sigma/10
# pyplot.hist(x, bins=np.arange(-50, 50., binwidth), density=True)
#
# norm = 1./(sigma*np.sqrt(2*np.pi))
# pyplot.plot(np.arange(-50., 50., binwidth), norm*np.exp(-0.5*np.arange(-50., 50., binwidth)**2/sigma2), ls='-', c='red', lw=3)

pyplot.plot(delta_arr, accept_arr, c='r', lw=3)
pyplot.ylabel('Acceptance rate (%)')
pyplot.xlabel('delta')
pyplot.show()

pyplot.plot(delta_arr, equil_arr, c='b', lw=3)
pyplot.ylabel('Equilibriation time (# of iterations)')
pyplot.xlabel('delta')
pyplot.show()
