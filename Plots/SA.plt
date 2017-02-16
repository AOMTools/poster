#!/usr/bin/gnuplot
set terminal postscript eps color enhanced solid font "Helvetica,33" size 12cm,8cm
#set terminal wxt font "Helvetica,30" size 12.6cm,8cm
set output "SA.eps"
set border linewidth 1.5
set border 3
#set autoscale
f0 = 'SA_0.dat'
f1 = 'SA_1.dat'
f2 = 'SA_2.dat'

set ytics 5 nomirror format "%g" 
set xtics 50 nomirror
#set logscale x 
#set yrange [0:0.33]
#set xrange [-100:100]
unset title
set xlabel 'time (ms)'
set ylabel 'fluorescence (cts/ms)'
unset grid 
unset key

plot f0 using 1:2 w lines lw 3 lc rgb "red", f1 using 1:2 w lines lw 3 lc rgb "green", f2 using 1:2 w lines lw 3 lc rgb "blue"

unset output
