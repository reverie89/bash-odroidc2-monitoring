# Simple monitoring tools for my Odroid C2
Stress test and temperature checking

## Stress test CPU
On Debian/Ubuntu

`sudo apt-get install stress`
Then:
`./stress --cpu 8 --io 4 --vm 2 --vm-bytes 128M --timeout 60s`


To stress test and monitor CPU temp for 60s (enter 2nd argument to monitor over a specific interval; default 5s),
`./stressTest.sh 60`

To check temperature over 10s only in interval of 3s (omit all arguments for current temperature, omit 2nd argument for default 5s),
`./checkTemperature.sh 10 3`


## See stats on CPU
`sudo apt-get install cpufrequtils`

`cpufreq-info`

## Setting CPU
`cpufreq-set --help`
