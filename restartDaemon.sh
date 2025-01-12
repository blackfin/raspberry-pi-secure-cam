#!/bin/bash

if [ "X${1}" == "Xstop" ] ; then

S=`/usr/bin/ps awuux | /usr/bin/grep [t]emperature.sh | /usr/bin/awk '{print $2}'`
echo "--> $S"
if [ "X$S" != "X" ] ; then
    echo "Stop readTemperature.sh: kill -9 $S"
    kill -9 $S
fi

S=`/usr/bin/ps awuux | /usr/bin/grep [p]ython3 | /usr/bin/awk '{print $2}'`
echo "--> $S"
if [ "X$S" != "X" ] ; then
   echo "Stop pytnon kill -9 $S"
   kill -9 $S   
fi	

S=`/usr/bin/ps awuux | /usr/bin/grep [s]treamDev.sh | /usr/bin/awk '{print $2}'`
echo "--> $S"
if [ "X$S" != "X" ] ; then
    echo "Stop streamDev.sh: kill -9 $S"
    kill -9 $S
fi

S=`/usr/bin/ps awuux | /usr/bin/grep '/[u]sr/bin/ffmpeg' | /usr/bin/awk '{print $2}'`
echo "--> $S"
if [ "X$S" != "X" ] ; then
    echo "Stop /usr/bin/ffmpeg: kill -9 $S"
    kill -9 $S
fi

exit
fi

exit
