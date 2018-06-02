#!/usr/bin/expect

spawn ssh root@localhost -p 10022
expect "# "
send "cd /usr/src/minix/fs/mfs && clear && pwd \r"
expect "# "
interact


#send "pkgin in '\r' "
