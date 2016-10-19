#!/bin/bash
# redirect stdout/stderr to a file
touch tom.txt
exec &> tom.txt
error_function()
{
if [ "$?" = "0" ]; then
	echo "$1 created"
else
	echo "$1 can't create" 1>&2
	exit 1
fi
}

echo "sdasdadasdasd"
{
  /usr/bin/expect << EOF
spawn ssh xxxx@xxxxxxx
expect "password: "
send "********"
send "error_function user \r"
expect "$ "
send "sudo adduser tomcruise212\r"
expect "password for deployer:"
send "********"
send "error_function password\r"
expect "Enter new UNIX password:"
send "********"
send "error_function\r"
expect "Retype new UNIX password:"
send "********"
send "error_function\r"
expect "Full Name []:"
send "\n"
expect "Room Number []:"
send "\n"
expect "Work Phone []:"
send "\n"
expect "Home Phone []:"
send "\n"
expect "Other []:"
send "\n"
expect "Is the information correct?"
send "y\n"
expect "$ "
EOF
}
ERR="user"
error_function $ERR
curl --url 'smtps://smtp.gmail.com:465' --ssl-reqd --mail-from 'sender@gmail.com' --mail-rcpt 'recipent@gmail.com' --upload-file tom.txt --user 'sendeer@gmail.com:password'
exit
