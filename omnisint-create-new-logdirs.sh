#!/bin/bash

echo "CREATE NEW LOGDIRS IN /VAR/LOG FOR OMNISINT FRAMEWORK"

# Ask the user for the name of the new log directory
echo "Enter the name of the new log directory:"
read logdir

# Create the new log directory in /var/log
sudo mkdir "/var/log/$logdir"

# Set default owner and log file permissions for the new log directory
sudo chown root:root "/var/log/$logdir"
sudo chmod 755 "/var/log/$logdir"
sudo find "/var/log/$logdir" -type f -exec chmod 644 {} \;

# Set default owner and log file permissions for all log directories in /var/log
logdirs=$(find /var/log -type d -name '*log*')

for logdir in $logdirs
do
  sudo chown root:root "$logdir"
  sudo chmod 755 "$logdir"
  sudo find "$logdir" -type f -exec chmod 644 {} \;
done