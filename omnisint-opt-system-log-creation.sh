#!/bin/bash

echo "To create a recursive Bash shell script to create a log for each script in /opt at /var/log/forensics and automatically add the same logs created to /var/log/syslog and logrotate them, you can follow these steps:"
echo "This script first creates the log directory if it doesn't exist and sets the default log file permissions and ownership. It then finds all scripts in /opt that have a .sh extension and iterates over each script to create a log file for it in /var/log/forensics. The log file is named after the script with a .log extension and has default permissions and ownership. It also adds the log message to /var/log/syslog with the tag of the script name."

logdir="/var/log/forensics"
scriptdir="/opt"

# Create log directory if it doesn't exist
if [ ! -d "$logdir" ]; then
  sudo mkdir -p "$logdir"
fi

# Set default log file permissions and ownership
sudo chown root:root "$logdir"
sudo chmod 755 "$logdir"

# Find all scripts in script directory
scripts=$(find "$scriptdir" -type f -name '*.sh')

# Iterate over each script and create a log file for it
for script in $scripts
do
  scriptname=$(basename "$script")
  logfile="$logdir/$scriptname.log"
  touch "$logfile"
  sudo chown root:root "$logfile"
  sudo chmod 644 "$logfile"
  echo "$(date) Created log file for $scriptname at $logfile"
  logger -t "$scriptname" "Created log file at $logfile"
done