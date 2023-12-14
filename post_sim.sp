Using: /usr/local/synopsys/hspice/S-2021.09-SP2/hspice/linux64/hspice timing.sp
 ****** PrimeSim HSPICE -- S-2021.09-SP2 linux64 (Feb 24 2022 7505118) ******
  Copyright (c) 1986 - 2023 by Synopsys, Inc. All Rights Reserved.
  This software and the associated documentation are proprietary
  to Synopsys, Inc. This software may only be used in accordance
  with the terms and conditions of a written license agreement with
  Synopsys, Inc. All other use, reproduction, or distribution of
  this software is strictly prohibited.
  Input File: timing.sp                                                         
  Command line options: /usr/local/synopsys/hspice/S-2021.09-SP2/hspice/linux64/hspice timing.sp
  Start time: Tue Sep 26 23:44:51 2023
 lic:  
 lic: FLEXlm: SDK_12.9.8 
 lic: USER:   msudhanan            HOSTNAME: lab26.ece.stonybrook.edu 
 lic: HOSTID: 31811a45             PID:      24366 
 lic: Using FLEXlm license file: 
 lic: 4999@license0.ece.stonybrook.edu 
 lic: Checkout 1 hspice 
 lic: License/Maintenance for hspice will expire on 11-nov-2024/2022.06 
 lic: 1(in_use)/50(total) FLOATING license(s) on SERVER 4999@license0.ece.stonybrook.edu 
 lic:   
  **warning** Global net name "gnd" in subckt pin list. The pin will be connected to the local net. Recommend to not use global net names in subckt pin lists.
1****** PrimeSim HSPICE -- S-2021.09-SP2 linux64 (Feb 24 2022 7505118) ******
 ******  
 ****************************************************

 ****** circuit name directory
 circuit number to circuit name directory
   number circuitname                     definition         multiplier
        0 main circuit
  **info** (timing.sp:26) DC voltage reset to initial transient source value in source 0:va6. new dc=0.0000D+00
  **warning** More warning messages are suppressed. Set option WARNLIMIT to increase the limit.
  **warning** (timing.sp:32) Node name y6 in .IC or .NODESET cannot be found. Nodal initial condition is ignored. Enter a valid node.
  
      
 *****************************************************************
 ******  option summary
 ******
 runlvl  = 3         bypass  = 2.0000    
  Opening plot unit= 15
 file=timing.pa0

 **info** dc convergence successful at Newton-Raphson method 
 ******  
 ****************************************************

 ****** operating point information tnom=  25.000 temp=  25.000 ******
 ****** operating point status is voltage   simulation time is     0.     
    node    =voltage      node    =voltage      node    =voltage

 +0:a6      =   0.      0:vdd6    =   1.0000  0:y6      = 999.9772m


 maximum nodal capacitance=   2.000E-15         on node     0:y6              

    nodal  capacitance table 

    node    =    cap      node    =    cap      node    =    cap

 +0:a6      =   0.      0:vdd6    =   0.      0:y6      =   2.0000f

 
 ******
 ****************************************************

 ****** transient analysis tnom=  25.000 temp=  25.000 ******
 iavg6=  -5.0718u  from=   0.             to=  10.0000n
 rise6=  82.1810p  targ=   2.6662n   trig=   2.5841n
 fall6=  78.3901p  targ=   2.1610n   trig=   2.0826n
 a6lh=  27.7883p  targ=   5.6278n   trig=   5.6000n
 a6hl=  24.9657p  targ=   5.1250n   trig=   5.1000n
 delay6=  26.3770p
 power6=  -5.0718u
 slew6=  80.2855p

          ***** job concluded
 ******  
 ****************************************************

 ****** job statistics summary tnom=  25.000 temp=  25.000 ******
  
 ******  Machine Information  ******
 CPU:
 model name	: 11th Gen Intel(R) Core(TM) i7-11700 @ 2.50GHz
 cpu MHz	: 3500.366
 CPU(s)		: 16
  
 OS:
 Linux version 3.10.0-1160.66.1.el7.x86_64 (mockbuild@kbuilder.bsys.centos.org) (gcc version 4.8.5 20150623 (Red Hat 4.8.5-44) (GCC) ) #1 SMP Wed May 18 16:02:34 UTC 2022

 System loadavg : 8.52 8.51 8.42 11/1150 24369


  ******  PrimeSim HSPICE Threads Information  ******

  Command Line Threads Count :     1
  Available CPU Count        :    16
  Actual Threads Count       :     1


  ******  Circuit Statistics  ******
  # nodes       =      40 # elements   =      76
  # resistors   =      28 # capacitors =      44 # inductors   =       0
  # mutual_inds =       0 # vccs       =       0 # vcvs        =       0
  # cccs        =       0 # ccvs       =       0 # volt_srcs   =       2
  # curr_srcs   =       0 # diodes     =       0 # bjts        =       0
  # jfets       =       0 # mosfets    =       2 # U elements  =       0
  # T elements  =       0 # W elements =       0 # B elements  =       0
  # S elements  =       0 # P elements =       0 # va device   =       0
  # vector_srcs =       0 # N elements =       0


  ******  Runtime Statistics (seconds)  ******

  analysis           time    # points   tot. iter  conv.iter
  op point           0.01           1           8
  transient          0.01        1001         758         283 rev=        20
  readin             0.02
  errchk             0.00
  setup              0.01
  output             0.00


           peak memory used        485.21 megabytes
           total cpu time            0.04 seconds
           total elapsed time        0.09 seconds
           job started at     23:44:51 09/26/2023
           job ended   at     23:44:51 09/26/2023

>info:         ***** hspice job concluded
           job total runtime         0.09 seconds


 lic: Release hspice token(s) 
 lic: total license checkout elapse time:        0.04(s)
