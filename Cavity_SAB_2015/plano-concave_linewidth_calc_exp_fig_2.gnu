gnuplot> set terminal postscript enhanced color eps size 20cm,15cm
Terminal type set to 'postscript'
Options are 'eps enhanced defaultplex \
   leveldefault color colortext \
   dashed dashlength 1.0 linewidth 1.0 butt noclip \
   palfuncparam 2000,0.003 \
   size 20.00cm, 15.00cm "Helvetica" 14 '
gnuplot> set output 'plano_concave_transmission.eps'
gnuplot> set xrange [1.4:1.6]
gnuplot> set yrange [0:40]
gnuplot> set xtics 1.4,0.05,1.6 offset 0,-2.5 font 'Helvetica, 40pt'
gnuplot> set ytics 0,10,40 offset -3,0 font 'Helvetica, 40pt'
gnuplot> set xlabel 'frequency (GHz)' offset 0,-5 font 'Helvetica, 50pt' 
gnuplot> set ylabel 'transmission %' offset -5,0 font 'Helvetica, 50pt'
gnuplot> set key off
gnuplot> plot 'plano-concave_trans_fig_3.dat' u 3:1 w l lw 4 lt 0,\
>'plano-concave_trans_fig_3.dat' u 3:2 w l lt 2 lw 6 lc 0
gnuplot> set ylabel 'transmission %' offset -7,0 font 'Helvetica, 50pt'
gnuplot> plot 'plano-concave_trans_fig_3.dat' u 3:1 w l lw 6 lt 0,\
>'plano-concave_trans_fig_3.dat' u 3:2 w l lt 1 lw 6 lc 0
gnuplot> replot
gnuplot> set terminal postscript enhanced color eps size 20cm,15cm
Terminal type set to 'postscript'
Options are 'eps enhanced defaultplex \
   leveldefault color colortext \
   dashed dashlength 1.0 linewidth 1.0 butt noclip \
   palfuncparam 2000,0.003 \
   size 20.00cm, 15.00cm "Helvetica" 14 '
gnuplot> set output 'plano_concave_transmission.eps'
gnuplot> plot 'plano-concave_trans_fig_3.dat' u 3:1 w l lw 6 lt 0,\
>'plano-concave_trans_fig_3.dat' u 3:2 w l lt 1 lw 6 lc 0
gnuplot> set ylabel 'transmission %' offset -8,0 font 'Helvetica, 50pt'
gnuplot> set terminal postscript enhanced color eps size 20cm,15cm
Terminal type set to 'postscript'
Options are 'eps enhanced defaultplex \
   leveldefault color colortext \
   dashed dashlength 1.0 linewidth 1.0 butt noclip \
   palfuncparam 2000,0.003 \
   size 20.00cm, 15.00cm "Helvetica" 14 '
gnuplot> set output 'plano_concave_transmission.eps'
gnuplot> plot 'plano-concave_trans_fig_3.dat' u 3:1 w l lw 6 lt 0,\
>'plano-concave_trans_fig_3.dat' u 3:2 w l lt 1 lw 6 lc 0
gnuplot> 
