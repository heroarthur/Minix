#!/usr/bin/expect
spawn ssh root@localhost -p 10022
#install nano
expect "# "
send "pkgin in nano-2.2.6nb1 \r"
send "Y \r"
expect "# "
#install hexedit
send "pkgin in hexedit \r"
send "Y \r"
expect "# "
#install nasm
send "pkgin in nasm-2.10.09 \r"
send "Y \r"
expect "# "


send "exit\r"
#interact
