
# see local/environment/environment for the full setup script we use at
# N.C. State.
setenv SKIP_CDS_DIALOG
setenv LD_LIBRARY_PATH
setenv CDS_AUTO_64BIT All
setenv CDS_DIR /usr/local/cds
setenv IC_DIR /usr/local/cds/ic
setenv CDK_DIR /usr/local/cds/ncsu
# replace $CDS_DIR below with the root directory of your Cadence
# installation, and $UNAME with the full path to your uname executable
set base_dir = "$CDS_DIR"
set uname    = "/bin/uname"

# These are paths to the STREAM release directories (e.g. where IC 4.4.5
# lives); change these to fit your site
setenv IC $base_dir/ic
setenv DSM $base_dir/dsmse
setenv LDV $base_dir/ldv
setenv MMSIM $base_dir/mmsim
setenv CDS $base_dir
setenv CDSHOME /usr/local/cds/ic
setenv MGC_HOME /usr/local/mgc/calibre/aoi_cal_2014
setenv SYNHOME /usr/local/synopsys

# the lib path setup looks at $CDS_SITE/cdssetup to find the "setup.loc"
# file (other things, like prependNCSUCDKInstallPath(), need $CDS_SITE
# as well) 
# note that "$cdk_dir" below is the local/ directory created when you
# untarred the CDK distribution
#setenv CDS_SITE $cdk_dir

# if you did a "relocatable installation",
# set USE_NCSU_CDK to access the CDK features
setenv USE_NCSU_CDK

# use analog netlister for everything
setenv CDS_Netlisting_Mode Analog

# Path additions

alias prepend 'if (-d \!:2) if ("$\!:1" \!~ *"\!:2"*) setenv \!:1 "\!:2":${\!:1}'
alias extend  'if (-d \!:2) if ("$\!:1" \!~ *"\!:2"*) setenv \!:1 ${\!:1}:\!:2'

prepend PATH $LDV/tools/bin
prepend PATH $LDV/tools/dfII/bin
prepend PATH $IC/tools/bin
prepend PATH $IC/tools/dfII/bin
prepend PATH $IC/tools/concice/bin
prepend PATH $IC/tools/dracula/bin
prepend PATH $DSM/tools/dsm/bin
prepend PATH $MMSIM/tools/bin
prepend PATH $SYNHOME/hspice/S-2021.09-SP2/hspice/bin
prepend PATH $SYNHOME/wv/S-2021.09-SP2/bin
prepend PATH $MGC_HOME/bin
prepend LD_LIBRARY_PATH $LDV/tools/lib
prepend LD_LIBRARY_PATH $IC/tools/lib


# this next one sets a path to our wrapper script; the script
# removes this PATH component to unmask the real executable. ONLY USE
# THIS IF YOU"RE USING THE local/bin/dfiiwrapper.pl SCRIPT.

setenv PATH $CDS/bin:$PATH

#---- Start clsbd -----------------------------------------------------
# clsbd should always be running when we start cadence tools
# note that "bar" is a simple suid root program that starts clsbd (the
# theory is that if it's running as root, a userland process is less
# likely to take it down, and it won't be killed when the user logs out.
# we want this because clsbd needs to be running on all workstations
# that run cadence tools so it can respond to queries about locks. see
# chapter 11 of "Cadence Application Infrastructure User Guide" for more
# info on cls.)

if (( "`${uname} -sr`" == "SunOS 5.4") || ( "`${uname} -sr`" == "SunOS 5.5.1") || ( "`${uname} -sr`" == "SunOS 5.6")) then
    $CDS_SITE/bin/bar > /dev/null
else
    $IC/tools/bin/clsbd > /dev/null
endif

unset base_dir uname

# Using FLEXlm license file
setenv CDS_LICENSE_FILE 5280@license0.ece.stonybrook.edu
setenv LM_LICENSE_FILE 5280@license0.ece.stonybrook.edu
setenv MGLS_LICENSE_FILE 1717@license0.ece.stonybrook.edu
setenv SNPSLMD_LICENSE_FILE 4999@license0.ece.stonybrook.edu

###############################################################################
#                                                                             #
# FreePDK Setup Script                                                        #
#    2/23/2008 by Rhett Davis (rhett_davis@ncsu.edu)                           #
#                                                                             #
###############################################################################

# Set the PDK_DIR variable to the root directory of the FreePDK distribution
setenv PDK_DIR /usr/local/cds/FreePDK45

if !(-f ${PWD}/.cdsinit ) then
  cp ${PDK_DIR}/ncsu_basekit/cdssetup/cdsinit ${PWD}/.cdsinit
endif

if !( -f ${PWD}/cds.lib ) then
  cp ${PDK_DIR}/ncsu_basekit/cdssetup/cds.lib ${PWD}/cds.lib
endif

if !( -f ${PWD}/lib.defs ) then
  cp ${PDK_DIR}/ncsu_basekit/cdssetup/lib.defs ${PWD}/lib.defs
endif

if !(-f ${PWD}/.runset.calibre.drc ) then
  cp ${PDK_DIR}/ncsu_basekit/cdssetup/runset.calibre.drc ${PWD}/.runset.calibre.drc
endif

if !(-f ${PWD}/.runset.calibre.lvs ) then
  cp ${PDK_DIR}/ncsu_basekit/cdssetup/runset.calibre.lvs ${PWD}/.runset.calibre.lvs
endif

if !(-f ${PWD}/.runset.calibre.lfd ) then
  cp ${PDK_DIR}/ncsu_basekit/cdssetup/runset.calibre.lfd ${PWD}/.runset.calibre.lfd
endif

if !(-f ${PWD}/.runset.calibre.pex ) then
  cp ${PDK_DIR}/ncsu_basekit/cdssetup/runset.calibre.pex ${PWD}/.runset.calibre.pex
endif

set present = `printenv PYTHONPATH`
if ($present == "") then
  setenv PYTHONPATH $PDK_DIR'/ncsu_basekit/techfile/cni'
else
  setenv PYTHONPATH $PYTHONPATH':'$PDK_DIR'/ncsu_basekit/techfile/cni'
endif

setenv MGC_CALIBRE_DRC_RUNSET_FILE ./.runset.calibre.drc
setenv MGC_CALIBRE_LVS_RUNSET_FILE ./.runset.calibre.lvs
setenv MGC_CALIBRE_PEX_RUNSET_FILE ./.runset.calibre.pex
