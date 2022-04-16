Lab 4, Exercise 5, ECE 3410
***************************
* By Joe Pollock w/ documentation from Chris Winstead
* DC Restoration Circuit
***************************

* Include the model file:
.include ../../lab_parts.md

* Voltage Input
V1 n1 0 DC 0V SIN(0 3V 1k)

* Diode
D1 0    nout   D1N914

* Capacitor
C1 n1 nout 10n

**************
* ANALYSIS
**************
.control
tran 1u 5m
plot n(n1) v(nout)
hardcopy clampedcap.ps n(n1) v(nout)

* Measurements:
echo Results at 1kHz:
meas TRAN vtrough MIN v(nout)
meas TRAN vpp     PP  v(nout) FROM=3m TO=5m

.endc

.end
