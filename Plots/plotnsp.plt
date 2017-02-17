#!/usr/bin/gnuplot
set terminal postscript eps color enhanced solid font "Helvetica,33" size 16cm,12cm
#set terminal wxt font "Helvetica,30" size 12.6cm,8cm
set output "nsplit.eps"
set border linewidth 1.5
set border 3
#set autoscale
#f1 = '2016-07-05/sat_curve_2us/sat_curve_2016_07_05'
#f1 = '2016-07-15/sat_2us_2015_07_15'
f1 = 'T_atom'
f2 = 'fit_T_atom'
f3 = 'T_woatom'
f4 = 'fit_T_woatom'

set ytics 10 nomirror format "%g" 
set xtics 50 nomirror
#set logscale x 
#set yrange [0:0.33]
set xrange [-60:130]
unset title
set xlabel 'rel. probe frequency(MHz)'
set ylabel 'probe transmission (cts/ms)'
unset grid 
unset key

#plot f1 u (($4-bg_blue)*conversion_countrate_to_pW):($2-bg_red):(sqrt($3)/$8/probetime) w yerr pt 7 ps 1.0 lc rgb "red" #lw 3 , f(x) lw 3 lc rgb "red" 
plot f1 using 1:2:3 w yerr pt 7 ps 1.0 lc rgb "red", f2 using 1:2 with l lw 3 lc rgb "red",\
f3 using 1:2:3 w yerr pt 7 lc rgb "blue",f4 using 1:2 with l lw 3 lc rgb "blue"

unset output
