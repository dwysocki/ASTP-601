#!/usr/bin/gnuplot -persist

set xlabel "Wavelength (Angstroms)"
set ylabel "Intensity of light (arbitrary scale)"
set title "A small section of the solar spectrum"

set key bottom right
set xtics 0.05
set grid

plot [6547.6:6547.8][9000:10000] "spec_closeup.txt" using 1:2 with linespoints