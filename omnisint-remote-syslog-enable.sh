#!/bin/bash

# Uncomment the UDP lines
sudo sed -i 's/# Provides UDP syslog reception/$ModLoad imudp.so\n$UDPServerRun 514/' /etc/rsyslog.conf

# Uncomment the TCP lines
sudo sed -i 's/# Provides TCP syslog reception/$ModLoad imtcp.so\n$InputTCPServerRun 514/' /etc/rsyslog.conf

# Configure template for incoming logs
sudo bash -c 'cat <<EOF >> /etc/rsyslog.conf
$template DynamicFile,"/var/log/%HOSTNAME%/forwarded-logs.log" 
*.* -?DynamicFile
EOF'

# Restart rsyslog service
sudo systemctl restart rsyslog

# Open UDP port 514 in UFW
sudo ufw --add-port=514/udp --permanent
sudo ufw --reload

# Add remote log server IP
sudo bash -c 'echo "*.* @IP" >> /etc/rsyslog.conf'

# Restart rsyslog service again
sudo systemctl restart rsyslog
