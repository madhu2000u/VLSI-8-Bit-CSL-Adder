* SPICE NETLIST
***************************************

.SUBCKT 2_to_1_mux GND VDD Sel A mux_out B
** N=7 EP=6 IP=0 FDC=6
M0 4 Sel GND GND NMOS_VTL L=5e-08 W=1e-07 AD=1.35e-14 AS=1.15e-14 PD=4.7e-07 PS=4.3e-07 $X=420 $Y=-250 $D=1
M1 mux_out 4 A GND NMOS_VTL L=5e-08 W=1e-07 AD=1.4e-14 AS=1.2e-14 PD=4.8e-07 PS=4.4e-07 $X=1190 $Y=-250 $D=1
M2 B Sel mux_out GND NMOS_VTL L=5e-08 W=1e-07 AD=1.15e-14 AS=1.4e-14 PD=4.3e-07 PS=4.8e-07 $X=1570 $Y=-250 $D=1
M3 4 Sel VDD VDD PMOS_VTL L=5e-08 W=1.6e-07 AD=1.84e-14 AS=1.84e-14 PD=5.5e-07 PS=5.5e-07 $X=420 $Y=620 $D=0
M4 mux_out Sel A VDD PMOS_VTL L=5e-08 W=1.6e-07 AD=2.24e-14 AS=1.84e-14 PD=6e-07 PS=5.5e-07 $X=1190 $Y=620 $D=0
M5 B 4 mux_out VDD PMOS_VTL L=5e-08 W=1.6e-07 AD=1.84e-14 AS=2.24e-14 PD=5.5e-07 PS=6e-07 $X=1570 $Y=620 $D=0
.ENDS
***************************************
