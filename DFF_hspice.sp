****************************************************
**** include 45nm model file
.prot
.inc '/usr/local/cds/FreePDK45/ncsu_basekit/models/hspice/hspice_nom.include'
.inc 'D_flip_flop.pex.netlist'
.unpr

**** set nominal supply voltage
.param pvdd=1.1

**** set temperature and global ground
.param ptemp=25
.param gnd=0

**** set timing parameters
.param freqreset=0.1g
.param perireset=1/freqreset
.param freqclk=7g
.param periclk=1/freqclk
.param freqD=0.7g
.param periD=1/freqD
.param load=5fF
.param rtreset=1p
.param rtclk=20p
.param rtD=20p
.param onreset=perireset*0.5-rtreset
.param onclk=periclk*0.5-rtclk
.param onD=periD*0.5-rtD
.param stop=20n

**** set DFF input and output
v6 vdd6 0 pvdd
c6 y6 0 load
vreset reset 0 pulse (0 pvdd 0.7n rtreset rtreset onreset perireset)
vclk clk 0 pulse (0 pvdd 0 rtclk rtclk onclk periclk)
vD D 0 pulse (0 pvdd 0.4n rtD rtD onD periD)




**** instantiate DFF
xparx1 D clk reset 0 vdd6 y6 D_flip_flop

***RESET D CLK GND VDD Q
***xparx1 a b c d y6 0 vdd6 PARITY_GENERATOR_XOR
**** set conditions and options
.ic v(xparx1.y6)=0

.temp ptemp
.option macmod=1 captab post

**** measure delays, output slews, and switching powers
** INVX1
.measure tran iavg6 avg i(v6) from=0 to=stop
.measure tran rise6 trig v(y6) val=pvdd*0.1 td=2n rise=1 targ v(y6) val=pvdd*0.9 td=2n rise=1
.measure tran fall6 trig v(y6) val=pvdd*0.9 td=2n fall=1 targ v(y6) val=pvdd*0.1 td=2n fall=1
.measure tran a6lh trig v(a6) val=pvdd*0.5 td=2n fall=4 targ v(y6) val=pvdd*0.5 td=2n rise=4
.measure tran a6hl trig v(a6) val=pvdd*0.5 td=2n rise=4 targ v(y6) val=pvdd*0.5 td=2n fall=4
.measure tran delay6 param='(a6lh+a6hl)/2'
.measure tran power6 param=iavg6*pvdd
.measure tran slew6 param=0.5*rise6+0.5*fall6

.tran 0.01n stop
.end
