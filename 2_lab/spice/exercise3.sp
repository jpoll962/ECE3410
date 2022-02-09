Lab 2, Exercise 3, ECE 3410
*************************************************
* By Chris Winstead and modififed by Joe Pollock
*************************************************

* Include the model file:
.include ../../lab_parts.md

*===== CIRCUIT DESCRIPTION ======
* Power supplies:
VDD1 ndd1 0 DC 15V
VSS1 nss1 0 DC -15V

VDD2 ndd2 0 DC 15V
VSS2 nss2 0 DC -15V

* The input voltage sources
V1 n1 0 DC 1V
V2 n4 0 DC 0V AC 1 SIN(0V 0.5V 50kHz)

* Resistors & Capacitor
R1 n1 nn1 10k
R2 nout2 nn1 5k
R3 0 nn2 10Meg
RF nn1 nout1 10k
C1 n4 nn2 10n

* Op Amp Models
X1 0 nn1 ndd1 nss1 nout1 uA741
X2 nn2 nout2 ndd2 nss2 nout2 uA741

*================================
* CONTROL COMMANDS:
*================================
.control
    *----- START OF LOOP ----*
    foreach rf_var 10k 20k 40k
        echo rf is $rf_var
        alter rf $rf_var
        *----- AC SIMULATION -----*
        ac dec 100 100 10Meg

        plot vdb(nout1)
        hardcopy circuit3_vnout1.ps vdb(nout1)

        meas ac Av0  FIND vdb(nout1) AT=10k
        let A3dB=Av0-3
        print A3dB

        meas ac fhigh WHEN vdb(nout1)=$&A3dB FALL=LAST
        meas ac flow  WHEN vdb(nout1)=$&A3dB RISE=1
        meas ac ft    WHEN vdb(nout1)=0
    end
    *----- END OF LOOP ----*

.endc

.end
