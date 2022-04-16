Lab 4, Exercise 2, ECE 3410
***********************************************
* By Chris Winstead and modified by Joe Pollock
* Half-Wave Rectifier Circuit
***********************************************

* Include the model file:
.include ../../lab_parts.md

* Voltage Input
V1 n1 0 DC 0V SIN(0 2V 1k)

* Diode
D1 n1 nout D1N914

* Load resistor
R1 nout 0 10k

**************
* ANALYSIS
**************
.control
op
print n(n1) v(nout)

tran 1u 3m

plot n(n1)
plot v(nout)
hardcopy halfwave.ps v(nout)

meas TRAN vpeak   MAX v(nout)
.endc

.end
