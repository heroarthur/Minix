#!/usr/bin/expect

spawn ssh root@localhost -p 10022
expect "# "
interact


#send "pkgin in '\r' "
