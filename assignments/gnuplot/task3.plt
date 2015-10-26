#!/usr/bin/gnuplot -persist

wl_300   = 9.55e-6
wl_1000  = 2.9969e-6
wl_3000  = 9.4046e-7
wl_10000 = 2.9513e-7

s_min = 1e+20
s_max = 1e+35

set xlabel "Wavelength (meters)"
#set ylabel "Intensity of light (arbitrary scale)"
set title "A small section of the solar spectrum"

set key off
set format x "%.1e"
set format y "%.1e"
set logscale x
set logscale y

set arrow from wl_300,s_min   to wl_300,s_max   nohead
set arrow from wl_1000,s_min  to wl_1000,s_max  nohead
set arrow from wl_3000,s_min  to wl_3000,s_max  nohead
set arrow from wl_10000,s_min to wl_10000,s_max nohead

plot [8e-8:7e-5][1e+20:1e+35] \
    "bb_lam.300.txt"   using 2:3 with linespoints, \
    "bb_lam.1000.txt"  using 2:3 with linespoints, \
    "bb_lam.3000.txt"  using 2:3 with linespoints, \
    "bb_lam.10000.txt" using 2:3 with linespoints
