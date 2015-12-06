#! /bin/bash

PROGNAME=$(basename $0)
red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
reset=`tput sgr0`

find ~ -type d -name 'node_modules' 2> finderr | while read dir; do
  if [ `grep -o "node_modules" <<< "$dir" | grep ""  -c` == 1 ]
  then
    if [ -f "$dir/.metadata_never_index" ]
    then
      echo "${PROGNAME}: ${yellow}$dir already has been ignored ${reset}"
    else
      echo "${PROGNAME}: ${green}Adding ignore to $dir ${reset}"
      touch "$dir/.metadata_never_index"
    fi
  fi
done
  # if [ `grep -o "Permission denied" <<< "$dir" | grep ""  -c` > 0 ]; then
  #   echo "${PROGNAME}: ${red}Permission denieded for `$dir` ${reset}"
  # fi

echo "${reset}All done"
