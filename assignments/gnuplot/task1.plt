#!/usr/bin/gnuplot -persist

g = 9.8
h_0 = 50

h(t) = h_0 - 0.5*g*t*t

plot [0:2] h(x)