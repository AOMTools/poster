#!/usr/bin/gnuplot
set terminal postscript eps color enhanced solid font "Helvetica,33" size 16cm,8cm
#set terminal wxt font "Helvetica,30" size 12.6cm,8cm
set output "mode_vol.eps"
set border linewidth 1.5
set border 3
#set autoscale
f0 = 'mode_vol'

set ytics nomirror format "10^%T"
set xtics 0.5 nomirror
#set logscale x 
#set yrange [0:1.2]
set xrange [0:2.2]
unset title
set xlabel 'length / radius'
set ylabel 'effective mode volume ({/Symbol l}^3)'
unset grid 
unset key



set logscale y 10
plot f0 using 1:2 w lines lw 3 lc rgb "red"

unset output
