* Example SPICE simulation for homework problems
* Generic MOSFET models:
.model nmos nmos (level=2 KP=550u VT0=1.9 lambda=0.01)
.model pmos pmos (level=2 KP=75u VT0=-0.75 lambda=0.01)

* Nodes:
* 1 - VDD
* 2 - Drain of NMOS
* 3 - Gate of NMOS

VDD 1 0 DC 4V
VIN 3 0 DC 4V
R1 1 2 75k

* MOSFET statement: MX Drain Gate Source Substrate ModelName
M1 2 3 0 0 nmos

.plot v(2)
* Operating point simulation:
.op
.tran 0.1ns 15ns
.end