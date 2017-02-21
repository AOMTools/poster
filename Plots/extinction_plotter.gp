#!/usr/bin/gnuplot
set terminal postscript eps color enhanced solid font "Helvetica,33" size 16cm,12cm
#set terminal wxt font "Helvetica,30" size 12.6cm,8cm
set output "ext.eps"
set border linewidth 1.5
set border 3

set ytics 0.2 nomirror format "%g"
set xtics 5 nomirror

unset title
set xlabel 'time (ms)'
set ylabel 'normalized probe transmission'
unset grid
unset key
plot [0:41][0:1.3] "extinction_norm_data.dat" w errorbar pointtype 7 lc rgb "red"
