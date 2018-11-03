"""
Challenge Problem 1.1 from 9/17/18 Lecture
"""

import math
import matplotlib.pyplot as plt
from myint import *


def myintegral(fun, amp, mass, lim1, lim2, count, met):
    f = lambda x: fun(a=amp, m=mass, x=x)
    if met == "trapz" or met == "trapezoid" or met == "trapezoidrule":
        I = trapezoidrule(f, a=lim1, b=lim2, N=count)
        err = trapezoiderr(f, a=lim1, b=lim2, N=count)

    elif met == "simps" or met == "simpson" or met == "simpsonrule":
        I = simpsonrule(f, lim1, lim2, count)
        err = simpsonerr(f, lim1, lim2, count)

    elif met == "cubic" or met == "cubicrule":
        I = cubicrule(f, lim1, lim2, count)
        err = "N/A"

    elif met == "quartic" or met == "quarticrule":
        I = quarticrule(f, lim1, lim2, count)
        err = "N/A"

    elif met == "romberg" or met == "rombergrule":
        I, err = rombergrule(f, lim1, lim2, count, accuracy=10**(-9))

    # print("\nIntegral method =", met, "\nIntegral results =", I, "\nError estimate =", err)

    return I, err


V = lambda x: x**4
# V = lambda x: sin(x)

func = lambda a, m, x: (4/(math.sqrt(2)*m))/math.sqrt(abs(V(a) - V(x)))

mets = ["trapz", "simps", "cubic", "quartic", "romberg"]
Namp = 100
N = 100

intgrl = plt.subplot(121)
interr = plt.subplot(122)

for met in mets:
    # print("Integral method =", met)
    amp = 0
    x = []
    y = []
    xerr = []
    yerr = []

    for i in range(Namp):
        amp = amp + 3 / Namp
        I, err = myintegral(func, amp=amp, mass=1, lim1=0, lim2=amp-(amp/N), count=N, met=met)
        x.append(amp)
        y.append(I)
        if err != "N/A":
            xerr.append(amp)
            yerr.append(err)

    intgrl.plot(x, y, label=met)
    if yerr is not []:
        interr.plot(xerr, yerr, label=met)

ileg = intgrl.legend(loc=2, shadow=True, fancybox=True)
ileg.get_frame().set_alpha(0.5)
intgrl.set(xlabel='Amplitude', ylabel='Period')
# intgrl.set_ylim(0, 1)

eleg = interr.legend(loc=2, shadow=True, fancybox=True)
eleg.get_frame().set_alpha(0.5)
interr.set(xlabel='Amplitude', ylabel='Approx Error')
interr.set_ylim(0, 0.1)

plt.show()
