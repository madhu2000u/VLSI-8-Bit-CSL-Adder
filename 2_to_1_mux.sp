* SPICE NETLIST
***************************************

.SUBCKT 2_to_1_mux Sel GND VDD A mux_out B
** N=7 EP=6 IP=0 FDC=6
M0 4 Sel GND GND NMOS_VTL L=5e-08 W=2.7e-07 AD=3.645e-14 AS=3.105e-14 PD=8.1e-07 PS=7.7e-07 $X=2150 $Y=485 $D=1
M1 mux_out 4 A GND NMOS_VTL L=5e-08 W=2.7e-07 AD=3.78e-14 AS=3.24e-14 PD=8.2e-07 PS=7.8e-07 $X=2950 $Y=485 $D=1
M2 B Sel mux_out GND NMOS_VTL L=5e-08 W=2.7e-07 AD=3.105e-14 AS=3.78e-14 PD=7.7e-07 PS=8.2e-07 $X=3330 $Y=485 $D=1
M3 4 Sel VDD VDD PMOS_VTL L=5e-08 W=4e-07 AD=4.6e-14 AS=4.6e-14 PD=1.03e-06 PS=1.03e-06 $X=2150 $Y=1695 $D=0
M4 mux_out Sel A VDD PMOS_VTL L=5e-08 W=4e-07 AD=5.6e-14 AS=4.6e-14 PD=1.08e-06 PS=1.03e-06 $X=2950 $Y=1695 $D=0
M5 B 4 mux_out VDD PMOS_VTL L=5e-08 W=4e-07 AD=4.6e-14 AS=5.6e-14 PD=1.03e-06 PS=1.08e-06 $X=3330 $Y=1695 $D=0
.ENDS
***************************************
