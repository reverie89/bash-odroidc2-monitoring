#!/bin/bash
file=temperature.log

GOV=`cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor`
MIN=`cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq`
MAX=`cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq`

echo "$GOV $MIN $MAX" | awk '{ printf "Governor: %s\nMin Freq: %4dMhz\nMax Freq: %4dMhz\n", $1, $2/1000, $3/1000 }'

# run stress test for X seconds AND checktemp.sh concurrently, >> ${file} for logging
echo "Entering stress test..." #>> ${file}
stress --cpu 8 --io 4 --vm 2 --vm-bytes 128M --timeout ${1}s & \
./checkTemperature.sh ${1} ${2} #>> ${file} && \
#cat ${file}
