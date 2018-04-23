#!/bin/bash

runduration=${1}
sleeptimer=${2}
if [ -z ${1} ]; then
	runduration=1
fi
if [ -z ${2} ]; then
	sleeptimer=5
fi
end=0
while [ $end -lt $runduration ]; do
	C=`cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq`
	T=`cat /sys/class/thermal/thermal_zone0/temp`
	echo "`date +%H:%M:%S` $C $T" | awk '{ printf "%s: %4dMHz @ %-.2fC\n",$1, $2/1000,$3/1000 }'
	if [ ${runduration} -gt 1 ]; then
		sleep ${sleeptimer}
		end=$(( ${end}+${sleeptimer} ))
	else
		break
	fi
done
