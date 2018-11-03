import numpy as np
from matplotlib import pyplot
import matplotlib.animation as animation
from JSAnimation.IPython_display import display_animation

K = 0.49
c = 0.217
rho = 2.7
alpha = K/c/rho

l = 50    # length of the bar
dx = 0.2  # space step
nx = int(l/dx)  # number of points in space
x = np.arange(0,l+dx,dx)    # the +1 is necessary to store the value at l
dt = 0.015
C = dx**2/dt
r = alpha/C

print(r)

t0 = np.zeros(nx+1)
t1 = np.zeros(nx+1)     # these arrays will contain the new displacements at t, and t+delta

# Initial conditions
t0[:] = 100.
t0[0] = 0.
t0[nx] = 0.


fig = pyplot.figure()
ax = pyplot.axes(xlim=(0, l), ylim=(0, 120), xlabel='x', ylabel='T')
points, = ax.plot([], [], marker='', linestyle='-', lw=3)


def evolve(i):
    global t0, t1

    for ix in range(1,nx):
        t1[ix] = t0[ix] + r*(t0[ix+1]+t0[ix-1]-2*t0[ix])

    points.set_data(x, t0)

    for ix in range(nx):
        t0[ix] = t1[ix]

    return points


anim = animation.FuncAnimation(fig, evolve, frames=2000, interval=10)

display_animation(anim, default_mode='once')

for i in range(20):
   evolve(i)
pyplot.plot(x, t0, color='blue', ls='-', lw=3)
