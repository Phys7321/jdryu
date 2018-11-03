import math
import numpy as np
import numpy.linalg as linalg
import scipy.integrate as sci
import matplotlib.pyplot as plt
from myint import *


def epotentialx(rho, a, b, x, y):
    """
    Calculates the electric potential in 2 dimensions for a 1-dimensional charge distribution

    :param rho: charge distribution as a function over x
    :param a, b: limits for integration
    :param x, y: where the potential will be calculated
    :return: V, but cut off at some maximum to avoid the singularity right at the charge itself
    """

    dV = lambda xr: rho(xr) / linalg.norm([(x - xr), y])
    V = simpsonrule(f=dV, a=a, b=b, N=100)

    return np.where(V <= 2.5, V, 2.5)


def epotentialy(rho, a, b, x, y):
    """
    Calculates the electric potential in 2 dimensions for a 1-dimensional charge distribution

    :param rho: charge distribution as a function over y
    :param a, b: limits for integration
    :param x, y: where the potential will be calculated
    :return: V, but cut off at some maximum to avoid the singularity right at the charge itself
    """

    dV = lambda yr: rho(yr) / linalg.norm([x, (y-yr)])
    V = simpsonrule(f=dV, a=a, b=b, N=100)

    return np.where(V <= 2.5, V, 2.5)


def epotentialxy(rho, ax, bx, ay, by, x, y):
    """
    Calculates the electric potential for a 2-dimensional charge distribution

    :param rho: charge distribution as a function over y
    :param ax, bx, ay, by: limits for integration
    :param x, y: where the potential will be calculated
    :return: V, but cut off at some maximum to avoid the singularity right at the charge itself
    """

    dV = lambda xr, yr: rho(xr, yr) / linalg.norm([(x - xr), (y - yr)])
    V, Verr = sci.dblquad(dV, a=ax, b=bx, gfun=ay, hfun=by)
    return V


rho1 = lambda x: 2 * x
x = np.arange(-5.0, 5.0, 0.05)
y = np.arange(-5.0, 5.0, 0.05)
Xm, Ym = np.meshgrid(x, y, sparse=True)
Z = epotentialx(rho1, 0, 1, Xm, Ym)
im = plt.imshow(Z, cmap='Reds', extent=(-5, 5, -5, 5))
plt.plot([0, 1], [0, 0], c='w')
plt.colorbar(im)
plt.title("Electric potential for line charge (units of k)")
plt.xlabel("x")
plt.ylabel("y")
plt.show()
plt.close()

U, V = np.gradient(Z)
strm = plt.streamplot(x, y, V, U, density=2, color=V, cmap='Reds')
plt.colorbar(strm.lines)
plt.title("Electric field for line charge (units of k)")
plt.xlabel("x")
plt.ylabel("y")
plt.show()
plt.close()


# Second charge distribution
rho2x = lambda x: x**2
rho2y = lambda y: y
x = np.arange(-5.0, 5.0, 0.05)
y = np.arange(-5.0, 5.0, 0.05)
Xm, Ym = np.meshgrid(x, y, sparse=True)
Z = epotentialx(rho2x, 0, 1, Xm, Ym)
Z = Z + epotentialy(rho2y, 1, 2, Xm, Ym)
im = plt.imshow(Z, cmap='Reds', extent=(-5, 5, 5, -5))
plt.plot([0, 1], [0, 0], c='w')
plt.plot([0, 0], [1, 2], c='w')
plt.colorbar(im)
plt.title("Electric potential for L charge (units of k)")
plt.xlabel("x")
plt.ylabel("y")
plt.show()
plt.close()

U, V = np.gradient(Z)
strm = plt.streamplot(x, y, V, U, density=2, color=V, cmap='Reds')
plt.colorbar(strm.lines)
plt.title("Electric field for L charge (units of k)")
plt.xlabel("x")
plt.ylabel("y")
plt.show()
plt.close()


# Third charge distribution
rho3 = lambda y, x: x
x = np.arange(-5.0, 5.0, 0.5)
y = np.arange(-5.0, 5.0, 0.5)
Z = np.empty((len(x), len(y)))
for i in range(len(x)):
    for j in range(len(y)):
        if x[i]**2 + y[j]**2 > 4.5:
            Z[i][j] = epotentialxy(rho3, ax=-2, bx=2, ay=lambda xr: -math.sqrt(4-xr**2), by=lambda xr: math.sqrt(4-xr**2), x=x[i], y=y[j])
        else:
            Z[i][j] = y[j]
im = plt.imshow(Z, cmap='Reds', extent=(-5, 5, 5, -5))
plt.colorbar(im)
plt.title("Electric potential for disk charge (units of k)")
plt.xlabel("x")
plt.ylabel("y")
plt.show()
plt.close()

U, V = np.gradient(Z)
strm = plt.streamplot(x, y, V, U, density=2, color=V, cmap='Reds')
plt.colorbar(strm.lines)
plt.title("Electric field for disk charge (units of k)")
plt.xlabel("x")
plt.ylabel("y")
plt.show()
plt.close()
