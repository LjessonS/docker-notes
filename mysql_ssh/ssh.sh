#!/usr/bin/expect -f

set port 10025
set user root
set host algoers.com
set password pwd
set timeout 30

spawn ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -p $port $user@$host
expect "*assword:*"

send "$password\r"
interact
