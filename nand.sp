* SPICE NETLIST
***************************************

.SUBCKT nand NAND_A NAND_B
** N=7 EP=2 IP=0 FDC=4
M0 5 NAND_A 3 6 NMOS_VTL L=5e-08 W=1e-07 AD=1.5e-14 AS=1.2e-14 PD=5e-07 PS=4.4e-07 $X=-120 $Y=-60 $D=1
M1 3 NAND_B 5 6 NMOS_VTL L=5e-08 W=1e-07 AD=1.2e-14 AS=1.5e-14 PD=4.4e-07 PS=5e-07 $X=280 $Y=-60 $D=1
M2 3 NAND_A 4 7 PMOS_VTL L=5e-08 W=1.6e-07 AD=2.4e-14 AS=1.92e-14 PD=6.2e-07 PS=5.6e-07 $X=-120 $Y=840 $D=0
M3 4 NAND_B 3 7 PMOS_VTL L=5e-08 W=1.6e-07 AD=1.92e-14 AS=2.4e-14 PD=5.6e-07 PS=6.2e-07 $X=280 $Y=840 $D=0
.ENDS
***************************************
