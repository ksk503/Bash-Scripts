#!/bin/bash
# Basic script to get epoch times

# Test to ensure at least one argument
if [[ $# -lt 1 ]] ;
  then
    echo
    echo "Usage: epoch.sh start-date end-date[optional]"
    echo "Ex: epoch.sh '2014-02-01 12:00' '2014-02-28 23:59:59'"
    echo
    exit 0
fi

# Set sd (start date) and ed (end date) variables
sd=$1
ed=$2

# Do the needful
function epoch {
  start=$(date -d "$sd" +%s)
  end=$(date -d "$ed" +%s)
}


function outage {
  echo "Start Date: $start"
  if [[ -z "$ed" ]] ;
    then
      exit 0
  else
    echo "End Date:   $end"
fi
}

# Run function and print out results
epoch
outage

exit 0
