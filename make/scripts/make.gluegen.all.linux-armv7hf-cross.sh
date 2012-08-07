#! /bin/sh

SDIR=`dirname $0` 

if [ -e $SDIR/setenv-build-jogl-x86_64.sh ] ; then
    . $SDIR/setenv-build-jogl-x86_64.sh
fi

# arm-linux-gnueabihf == armhf triplet
PATH=`pwd`/lib/linux/arm-linux-gnueabihf/bin:$PATH
export PATH

#    -Dc.compiler.debug=true 
#    -Dgluegen.cpptasks.detected.os=true \
#    -DisUnix=true \
#    -DisLinux=true \
#    -DisLinuxARMv7=true \
#    -DisX11=false \

export NODE_LABEL=.

export HOST_UID=jogamp
export HOST_IP=jogamp02
export HOST_RSYNC_ROOT=PROJECTS/JOGL

export TARGET_UID=jogamp
export TARGET_IP=panda01
export TARGET_ROOT=/home/jogamp/projects-cross
export TARGET_ANT_HOME=/usr/share/ant

export TARGET_PLATFORM_ROOT=/opt-linux-armv7-armhf
export TARGET_PLATFORM_LIBS=$TARGET_PLATFORM_ROOT/usr/lib
export TARGET_JAVA_LIBS=$TARGET_PLATFORM_ROOT/jre/lib/arm

export GLUEGEN_CPPTASKS_FILE="lib/gluegen-cpptasks-linux-armv6hf.xml"

#export JUNIT_DISABLED="true"
export JUNIT_RUN_ARG0="-Dnewt.test.Screen.disableScreenMode"

ant \
    -Drootrel.build=build-linux-armv7hf \
    $* 2>&1 | tee make.gluegen.all.linux-armv7hf-cross.log


