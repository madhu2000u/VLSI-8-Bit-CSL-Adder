* SPICE NETLIST
***************************************

.SUBCKT inverter vin gnd vdd vout
** N=4 EP=4 IP=0 FDC=2
M0 vout vin gnd gnd NMOS_VTL L=5e-08 W=1e-07 AD=1.2e-14 AS=1.2e-14 PD=4.4e-07 PS=4.4e-07 $X=240 $Y=-200 $D=1
M1 vout vin vdd vdd PMOS_VTL L=5e-08 W=1.575e-07 AD=1.89e-14 AS=1.89e-14 PD=5.55e-07 PS=5.55e-07 $X=240 $Y=1160 $D=0
.ENDS
***************************************
