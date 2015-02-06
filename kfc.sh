#!/bin/bash

#Define files to check
declare -a farray=('/etc/passwd' '/etc/resolv.conf' 'test.txt')

#Uncomment echo for testing
#echo ${farray[@]}

for F in ${farray[@]}; do
  #get mtime of file
  ftime=`stat -c "%Y" $F` 
  #current time
  ctime=`date +%s` 
  #Calculate difference
  dtime=$(( ($ctime - $ftime) / 86440))  
  #Uncomment echo for testing
  #echo $F $dtime
  #Test if time diff is less than 2 days
  if [ $dtime -lt 2 ]; then
    #echo "$F changed $dtime days ago."
    #User logger to write to syslog
    /usr/bin/logger -t TEST "$F changed $dtime days ago."
  fi
done

exit 0
