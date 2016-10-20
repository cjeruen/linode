#!/bin/bash
# redirect stdout/stderr to a file
touch log.txt
exec &> log.txt
error_function()
{
if [ "$?" = "0" ]; then
	echo "$1 created"
else
	echo "$1 can't create" 1>&2
	exit 1
fi
}

echo "creating deployer"
{
  /usr/bin/expect << EOF
spawn ssh root@139.162.7.190
expect "password: "
send "Parity1234@\r"
expect "$ "
send "sudo adduser deployer\r"
expect "password for deployer:"
send "Parity1234@\r"
expect "Enter new UNIX password:"
send "Parity1234@\r"
expect "Retype new UNIX password:"
send "Parity1234@\r"
send "error_function\r"
expect "Full Name []:"
send "\r"
expect "Room Number []:"
send "\r"
expect "Work Phone []:"
send "\r"
expect "Home Phone []:"
send "\r"
expect "Other []:"
send "\r"
expect "Is the information correct?"
send "Y\r"
expect "$ "
send "exit\r"
close
EOF
}
ERR="user"
error_function $ERR
curl --url 'smtps://smtp.gmail.com:465' --ssl-reqd --mail-from 'iaansomhler@gmail.com' --mail-rcpt 'mothirajha.chandramohan@desidime.com' --upload-file log.txt --user 'iaansomhler@gmail.com:desi12345'
exit
