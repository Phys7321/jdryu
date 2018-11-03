import numpy as np
from matplotlib import pyplot


def randU(N):
    r = np.zeros(N + 1)

    # bigint = 6537169170218971
    # coef = 52361276312121

    # This the infamous RANDU
    coef = 65539
    bigint = 2 ** 31

    # Just some bad choice of numbers
    # coef = 112
    # bigint = 2555

    seed = 1.
    r[0] = seed
    for i in range(1, N + 1):
        r[i] = (coef * r[i - 1]) % bigint
    return r/bigint


k_arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
N_arr = [10, 100, 1000, 10000, 100000]
for k in k_arr:
    mdev = []
    for n in N_arr:
        r = randU(n)
        moment = np.mean(r**k)
        mdev.append(abs((1/(1+k))-moment))
    pyplot.plot(N_arr, mdev, c='g')

pyplot.plot(N_arr, 1/np.sqrt(N_arr), c='r')
pyplot.xscale('log')
pyplot.title('Deviation of the Moment vs N')
pyplot.show()

m_arr = [1, 2, 3, 4, 5]
for m in m_arr:
    cdev = []
    for n in N_arr:
        r = randU(n)
        r1 = r[0:(n-m)]
        r2 = r[m:n]
        corr = np.mean(r1*r2)
        cdev.append(abs(corr-0.25))
    pyplot.plot(N_arr, cdev, c='g')

pyplot.plot(N_arr, 1/np.sqrt(N_arr), c='r')
pyplot.xscale('log')
pyplot.title('Deviation of Autocorrelation vs N')
pyplot.show()

m_arr = [1, 2, 3, 4, 5]
N_arr = [50, 100, 500, 1000, 5000, 10000, 100000, 1000000]
for m in m_arr:
    cdev = []
    for n in N_arr:
        r = randU(n)
        r1 = r[0:(n-2*m)]
        r2 = r[m:(n-m)]
        r3 = r[2*m:n]
        corr = np.mean(r1*r2*r3)
        cdev.append(abs(corr-0.125))
    pyplot.plot(N_arr, cdev, c='g')

pyplot.plot(N_arr, 1/np.sqrt(N_arr), c='r')
pyplot.xscale('log')
pyplot.title('Deviation of Autocorrelation (3D) vs N')
pyplot.show()
