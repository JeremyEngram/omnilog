#!/bin/bash

echo "By combining these steps into a Bash script, you can easily create a log for each script in /opt at /var/log/forensics, automatically add the same logs created to /var/log/syslog, and logrotate them for later analysis. Here is an example script:"

logdir="/var/log/forensics"
scriptdir="/opt"
logrotateconf="/etc/logrotate.d/mylogrotate.conf"

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

# Rotate the logs
sudo logrotate -f "$logrotateconf"