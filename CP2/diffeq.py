# -*- coding: utf-8 -*-
"""
Created on Fri Sep 21 16:42:19 2018

@author: Tom K

Modified by @jdryu
"""


def euler(func, x, t, h):
    return x + func(x, t)*h


def rk2(func, x, t, h):
    k1 = h * func(x, t)
    k2 = h * func(x + 0.5 * k1, t + 0.5 * h)
    x_next = x + k2

    return x_next


def rk4(func, x, t, h):
    k1 = h*func(x, t)
    k2 = h*func(x+0.5*k1, t+0.5*h)
    k3 = h*func(x+0.5*k2, t+0.5*h)
    k4 = h*func(x+k3, t+h)
    x_next = x + (k1+2*k2+2*k3+k4)/6

    return x_next
