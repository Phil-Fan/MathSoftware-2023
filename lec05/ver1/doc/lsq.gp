set terminal eps
set output "output.eps"

plot "output.dat" using 1:2 title "Data Points" 

unset output
