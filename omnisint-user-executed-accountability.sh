#!/bin/bash

# Edit /etc/rsyslog.d/bash.conf
sudo nano /etc/rsyslog.d/sshcmdslog.conf <<EOF
local6.*    /var/log/commands.log
EOF

# Open /root/.bashrc
sudo nano /root/.bashrc <<EOF
# Enable CLI Logging
whoami="\$(whoami)@\$(echo \$SSH_CONNECTION | awk '{print \$1}')"
export PROMPT_COMMAND='RETRN_VAL=\$?;logger -p local6.debug "\$whoami [$$] \$(history 1 | sed "s/^[ ]*[0-9]\+[ ]*//" )"'
EOF

# Restart rsyslog service
sudo service rsyslog restart
