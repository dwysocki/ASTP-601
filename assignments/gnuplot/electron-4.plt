#!/usr/bin/gnuplot -persist

set term epslatex standalone color colortext 10
set output "electron-fit.tex"

set xlabel 'Time ($\mu$s)'
set ylabel "Position (cm)"
set title  "Motion of an Electron"

unset key

f(x) = a + b*x
fit f(x) "electron_good.dat" using 1:2 via a,b


plot [-1:6] "electron_good.dat" using 1:2:3 with yerrorbars, f(x)

unset output