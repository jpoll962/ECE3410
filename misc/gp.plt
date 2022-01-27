set terminal X11 noenhanced
set title "bipolar amplifier"
set xlabel "s"
set ylabel "V"
set grid
unset logscale x 
set xrange [0.000000e+00:1.000000e-02]
unset logscale y 
set yrange [-1.064489e-01:1.040710e-01]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set format y "%g"
set format x "%g"
plot 'gp.data' using 1:2 with lines lw 1 title "v(out)",\
'gp.data' using 3:4 with lines lw 1 title "v(in)"
