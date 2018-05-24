#!/usr/bin/expect
spawn ssh root@localhost -p 10022
#install nano
expect "# "
send "git clone https://github.com/heroarthur/Minix.git \r"
expect "# "
send "cd Minix \r"

interact
