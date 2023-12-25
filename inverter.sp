* SPICE NETLIST
***************************************

.SUBCKT inverter vin gnd vdd vout
** N=4 EP=4 IP=0 FDC=2
M0 vout vin gnd gnd NMOS_VTL L=5e-08 W=2.7e-07 AD=3.24e-14 AS=3.24e-14 PD=7.8e-07 PS=7.8e-07 $X=240 $Y=-200 $D=1
M1 vout vin vdd vdd PMOS_VTL L=5e-08 W=4e-07 AD=4.8e-14 AS=4.8e-14 PD=1.04e-06 PS=1.04e-06 $X=240 $Y=1160 $D=0
.ENDS
***************************************
