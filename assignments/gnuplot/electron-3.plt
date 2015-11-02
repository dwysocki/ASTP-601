#!/usr/bin/gnuplot -persist

set term epslatex standalone color colortext 10
set output "electron.tex"

set xlabel 'Time ($\mu$s)'
set ylabel "Position (cm)"
set title  "Motion of an Electron"

set label 1 at 0,30 'Is there a $\mu$?'

unset key

plot [-1:6] "electron_good.dat" using 1:2:3 with yerrorbars

unset output