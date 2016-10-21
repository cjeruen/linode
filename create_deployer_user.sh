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
spawn ssh xxxx@xxxxxxxxxxx
expect "password: "
send "password\r"
expect "$ "
send "sudo adduser deployer\r"
expect "password for deployer:"
send "password\r"
expect "Enter new UNIX password:"
send "password\r"
expect "Retype new UNIX password:"
send "password\r"
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
curl --url 'smtps://smtp.gmail.com:465' --ssl-reqd --mail-from 'sender@gmail.com' --mail-rcpt 'rcpt@gmail.com' --upload-file log.txt --user 'sender@gmail.com:password'
exit
