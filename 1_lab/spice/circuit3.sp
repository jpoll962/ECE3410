Lab 1, Circuit 3
** Created by Joe Pollock
Vin n1 0 DC 0V AC 1 SIN(1V 2V 10k)
C1 n1 n2 1n
R1 n2 0 10k
.control
***********************
* TRANSIENT SIMULATION
***********************
tran 1u 1m
plot v(n2)
hardcopy tran_circuit3.ps v(n2)
***********************
* AC SIMULATION
***********************
ac dec 10 100 10e6
set units=degrees
plot vdb(n2)
plot vp(n2)
hardcopy magnitude_circuit3.ps vdb(n2)
hardcopy phase_circuit3.ps vp(n2)
meas ac y1 FIND vdb(n2) AT=1k
meas ac y2 FIND vdb(n2) AT=10k
meas ac y3 FIND vdb(n2) AT=50k
meas ac f3dB WHEN vdb(n2)=-3
meas ac p3dB FIND vp(n2) AT=$&f3dB
echo The -3dB frequency is $&f3dB Hz
echo with Phase phi=$&p3dB degrees
.endc
.end