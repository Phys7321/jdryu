# -*- coding: utf-8 -*-
"""
Created on Sun Sep  9 16:50:22 2018

@author: Tom K
"""


def forwardiff(f, a, b, N):
    h = (b - a) / N
    g = []
    for k in range(1, N):
        dy = (f(a + k * h) - f(a + (k - 1) * h)) / h
        g.append(dy)
    return g


def backwardiff(f, a, b, N):
    h = (b - a) / N
    g = []
    for k in range(0, N - 1):
        dy = (f(a + (k + 1) * h) - f(a + k * h)) / h
        g.append(dy)
    return g


def centraldiff(f, a, b, N, order):
    h = (b - a) / N
    g = []
    if order == 1:
        for k in range(0, N):
            dy = (f(a + (k + 1/2) * h) - f(a + (k - 1/2) * h)) / h
            g.append(dy)
    elif order == 2:
        for k in range(1, N):
            dy = ((1/2) * f(a + (k + 1) * h) - (1/2) * f(a + (k - 1) * h)) / h
            g.append(dy)
    elif order == 3:
        for k in range(1, N):
            dy = ((1/24) * f(a + (k - 3/2) * h) - (27/24) * f(a + (k - 1/2) * h) +
                  (27/24) * f(a + (k + 1/2) * h) - (1/24) * f(a + (k - 3/2) * h)) / h
            g.append(dy)
    elif order == 4:
        for k in range(1, N-1):
            dy = ((1/12) * f(a + (k - 2) * h) - (2/3) * f(a + (k - 1) * h) +
                  (2/3) * f(a + (k + 1) * h) - (1/12) * f(a + (k + 2) * h)) / h
            g.append(dy)
    return g


def seconddiff(f, a, b, N):
    h = (b - a) / N
    g = []
    for k in range(1, N):
        dy = (f(a + (k+1) * h) - 2 * f(a + k * h) + f(a + (k-1) * h)) / h**2
        g.append(dy)
    return g
