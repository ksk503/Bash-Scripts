#!/bin/bash

declare -a farray=('/etc/passwd' '/etc/resolv.conf' 'test.txt')
filetime=`stat -c "%Y" $1`
currtime=`date +%s`

timediff=$(( (currtime - filetime) / 86440 ))
echo $timediff

echo ${farray[@]}
for F in ${farray[@]}; do
  ftime=`stat -c "%Y" $F`
  ctime=`date +%s`
  dtime=$(( ($ctime - $ftime) / 86440))
  echo $dtime
done
