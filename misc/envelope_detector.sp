* envelope detector circuit

* Generic Diode Model:
.model diode d(Is=2.0298e-15, n=2)

* The input is a damped 10Hz sine wave that
* looks like an impulse:
Vin 1 0 SIN(0 2 1k 0.25 8)

* Peak detector circuit:
D1 1 2 diode
C1 2 0 10nF
R1 2 0 10k

* Transient simulation:
.tran 1m 1.5

.end
