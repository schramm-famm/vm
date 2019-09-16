#!/usr/bin/expect
spawn ssh-copy-id -i schramm-famm_rsa -f schramm-famm
expect "yes/no"
send "yes\r"
expect "password:"
send "vagrant\r"
expect eof
