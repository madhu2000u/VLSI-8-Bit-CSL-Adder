****************************************************
**** include 45nm model file
.prot
.inc '/usr/local/cds/FreePDK45/ncsu_basekit/models/hspice/hspice_nom.include'
.inc 'inverter.pex.netlist'
.unpr

**** set nominal supply voltage
.param pvdd=1.0

**** set temperature and global ground
.param ptemp=25
.param gnd=0

**** set timing parameters
.param freq=1g
.param peri=1/freq
.param load=2fF
.param rt=200p
.param on=peri*0.5-rt
.param stop=10*peri

**** set inverter input and output
v6 vdd6 0 pvdd
c6 y6 0 load
va6 a6 0 pulse (0 pvdd 0 rt rt on peri)

**** instantiate inverter
xinvx1 a6 0 vdd6 y6 inverter

**** set conditions and options
.ic v(xinvx1.y6)=0

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
