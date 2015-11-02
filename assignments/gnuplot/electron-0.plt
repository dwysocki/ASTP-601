#!/usr/bin/gnuplot -persist

set xlabel "Time (us)"
set ylabel "Position (cm)"

plot "electron_bad.dat" using 1:2:3 with yerrorbars