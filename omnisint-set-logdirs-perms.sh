#!/bin/bash

# Find all log directories in /var/log
logdirs=$(find /var/log -type d -name '*log*')

# Iterate over each log directory and set default owner and log file permissions
for logdir in $logdirs
do
  sudo chown root:root "$logdir"
  sudo chmod 755 "$logdir"
  sudo find "$logdir" -type f -exec chmod 644 {} \;
done