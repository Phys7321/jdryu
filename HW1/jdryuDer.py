from HW1.myder import *
import numpy as np
from math import sin
from matplotlib import pyplot as plot

x = np.arange(-5, 10, 0.15)
f = lambda x: sin(sin(1/(x*(2-x))))
y = []
for i in x:
    y.append(f(i))

dxf = x[1:]
dyf = forwardiff(f, -5, 10, 100)
dxb = x[:len(x)-1]
dyb = backwardiff(f, -5, 10, 100)
dxc = x
dyc = centraldiff(f, -5, 10, 100, 1)
dx2 = x[1:]
dy2 = centraldiff(f, -5, 10, 100, 2)
dx3 = x[1:]
dy3 = centraldiff(f, -5, 10, 100, 3)
dx4 = x[1:len(x)-1]
dy4 = centraldiff(f, -5, 10, 100, 4)

ddx = x[1:]
ddy = seconddiff(f, -5, 10, 100)

plot.plot(x, y)
plot.title('$sin^2(1/(x*(2-x)))$')
plot.xlabel("x")
plot.ylabel("y")
plot.legend('y(x)')
plot.show()
plot.close()

plot.plot(dxf, dyf, label='fd')
plot.plot(dxb, dyb, label='bd')
plot.plot(dxc, dyc, label='cd')
plot.plot(dx2, dy2, label='o2')
plot.plot(dx3, dy3, label='o3')
plot.plot(dx4, dy4, label='o4')
plot.title('derivatives of $sin^2(1/(x*(2-x)))$')
plot.xlabel("x")
plot.ylabel("$dy/dx$")
plot.legend()
plot.show()
plot.close()

plot.plot(ddx, ddy)
plot.title('second derivative of $sin^2(1/(x*(2-x)))$')
plot.xlabel("x")
plot.ylabel("$d^2y/d^2x$")
plot.show()
plot.close()
