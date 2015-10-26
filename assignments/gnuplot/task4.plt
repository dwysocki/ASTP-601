#!/usr/bin/gnuplot -persist

set xlabel "Inverse Temperature (K-1)"
#set ylabel "Peak Wavelength (meters)"
set title "Wien's law"

set key off
#set format x "%.1e"
#set format y "%.1e"
#set logscale x
#set logscale y

plot "wien.txt" using 1:2 with linespoints