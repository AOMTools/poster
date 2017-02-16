#!/usr/bin/gnuplot
set terminal postscript eps color enhanced solid font "Helvetica,33" size 25cm,8cm
#set terminal wxt font "Helvetica,30" size 12.6cm,8cm
set output "fluo.eps"
set border linewidth 1.5
set border 3
#set autoscale
f1 = 'sample_fluo.dat'

set ytics 10 nomirror format "%g" 
set xtics 0.5 nomirror
#set logscale x 
#set yrange [0:0.33]
#set xrange [-100:100]
unset title
set xlabel 'time (s)'
set ylabel 'fluorescence (cts/ms)'
unset grid 
unset key

plot f1 using 1:2 w lines lc rgb "red"

unset output
