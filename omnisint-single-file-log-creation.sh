#!/bin/bash

logfile="/var/log/mylog.log"

while true
do
  echo "$(date) The server has booted up." >> "$logfile"
  sleep 60
done