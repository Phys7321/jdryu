from matplotlib import pyplot
from CP2.diffeq import *

T0 = 10.                        # initial temperature
Ts = 83.                        # temp. of the environment
r = 0.1                         # cooling rate
dt = 5.0                        # time step
my_color = ['red', 'green', 'blue', 'black']
Tfun = lambda x, t: -r*(x-Ts)

em_dt = []
em_Tat10 = []
dt = 10.0
for j in range(20):
    T = T0
    current_time = 0
    while current_time <= 10.0:
        T = euler(Tfun, T, current_time, dt)
        current_time = current_time + dt

    em_dt.append(1/dt)
    em_Tat10.append(T)

    dt = dt/2.0

pyplot.plot(em_dt, em_Tat10, label='Euler\'s method', color='blue', ls='-', lw=1)

rk2_dt = []
rk2_Tat10 = []
dt = 10.0
for j in range(20):
    T = T0
    current_time = 0
    while current_time <= 10.0:
        T = rk4(Tfun, T, current_time, dt)
        current_time = current_time + dt

    rk2_dt.append(1/dt)
    rk2_Tat10.append(T)

    dt = dt/2.0

pyplot.plot(rk2_dt, rk2_Tat10, label='Runge-Kutta (2nd order)', color='green', ls='-', lw=1)

rk4_dt = []
rk4_Tat10 = []
dt = 10.0
for j in range(20):
    T = T0
    current_time = 0
    while current_time <= 10.0:
        T = rk4(Tfun, T, current_time, dt)
        current_time = current_time + dt

    rk4_dt.append(1/dt)
    rk4_Tat10.append(T)

    dt = dt/2.0

pyplot.plot(rk4_dt, rk4_Tat10, label='Runge-Kutta (4th order)', color='red', ls='-', lw=1)

pyplot.title("Convergence")
pyplot.semilogx()
pyplot.xlabel('1/dt')
pyplot.ylabel('temperature at t=10')
pyplot.ylim(55, 80)
pyplot.legend()

pyplot.show()
pyplot.clf()
pyplot.close()

