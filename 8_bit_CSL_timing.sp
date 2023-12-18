t****************************************************
**** include 45nm model file
.prot
.inc '/usr/local/cds/FreePDK45/ncsu_basekit/models/hspice/hspice_nom.include'
.inc 'Eight_Bit_CSL_Adder.pex.netlist'
.unpr

**** set nominal supply voltage
.param pvdd=1.1

**** set temperature and global ground
.param ptemp=25
.param gnd=0

**** set timing parameters
.param peri0=4n
.param peri1=3n
.param peri2=6n
.param peri3=2.5n
.param peri4=12n
.param peri6=5n
.param peri7=2.5n
.param peri00=1n
.param peri01=9n
.param peri02=14n
.param peri03=3n
.param peri04=2.5n
.param peri05=5n
.param peri07=4n
.param perirst=50n
.param periclk=250p

.param load=5fF
.param rt=25ps
.param ft=25ps

.param on0=peri0*0.5-rt
.param on1=peri1*0.5-rt
.param on2=peri2*0.5-rt
.param on3=peri3*0.5-rt
.param on4=peri4*0.5-rt
.param on6=peri6*0.5-rt
.param on7=peri7*0.5-rt

.param on00=peri00*0.5-rt
.param on01=peri01*0.5-rt
.param on02=peri02*0.5-rt
.param on03=peri03*0.5-rt
.param on04=peri04*0.5-rt
.param on05=peri05*0.5-rt
.param on07=peri07*0.5-rt
.param onclk=periclk*0.5-rt
.param onrst=1n
.param stop=50n

**** set 8bit dff input and output


vclk CLK 0 pulse (0 pvdd 0 rt rt onclk periclk)
vrst RST 0 pulse (0 pvdd 0 rt rt onrst perirst)
vc0 c0 0 gnd
vc1 c1 0 pvdd
vcin cin 0 gnd

va0 a0 0 pulse (0 pvdd 1n rt rt on0 peri0)
va1 a1 0 pulse (0 pvdd 0n rt rt on1 peri1)
va2 a2 0 pulse (0 pvdd 5n rt rt on2 peri2)
va3 a3 0 pulse (0 pvdd 2n rt rt on3 peri3)
va4 a4 0 pulse (0 pvdd 0n rt rt on4 peri4)
va5 a5 0 pvdd
va6 a6 0 pulse (0 pvdd 12n rt rt on6 peri6)
va7 a7 0 pulse (0 pvdd 3n rt rt on7 peri7)

vb0 b0 0 pulse (0 pvdd 0n rt rt on00 peri00)
vb1 b1 0 pulse (0 pvdd 0n rt rt on01 peri01)
vb2 b2 0 pulse (0 pvdd 30n rt rt on02 peri02)
vb3 b3 0 pulse (0 pvdd 2n rt rt on03 peri03)
vb4 b4 0 pulse (0 pvdd 4n rt rt on04 peri04)
vb6 b6 0 gnd
vb5 b5 0 pulse (0 pvdd 2n rt rt on05 peri05)
vb7 b7 0 pulse (0 pvdd 0n rt rt on07 peri07)


v6 vdd6 0 pvdd
c0 s0 0 load
c1 s1 0 load
c2 s2 0 load
c3 s3 0 load
c4 s4 0 load
c5 s5 0 load
c6 s6 0 load
c7 s7 0 load
c8 cout 0 load

**** instantiate 8bit dff

xin vdd6 0 RST CLK s0 a0 b0 s1 a1 b1 s2 a2 b2 s3 a3 b3 s4 a4 b4 s5 a5 b5 s6 a6 b6 s7 a7 b7 cout Eight_Bit_CSL_Adder

**** set conditions and options
.ic v(xin.s0)=0
.ic v(xin.s1)=0
.ic v(xin.s2)=0
.ic v(xin.s3)=0
.ic v(xin.s4)=0
.ic v(xin.s5)=0
.ic v(xin.s6)=0
.ic v(xin.s7)=0
.ic v(xin.cout)=0


.temp ptemp
.option macmod=1 captab post

**** measure delays, output slews, and switching powers
** INVX1
.measure tran iavg6 avg i(v6) from=0 to=stop
.measure tran power6 param=iavg6*pvdd

.tran 0.01n stop
.end
