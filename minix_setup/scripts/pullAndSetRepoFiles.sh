#!/usr/bin/expect
spawn ssh root@localhost -p 10022


#clone repository and set working directory
send "cd /home \r"
expect "# "
send "git clone git://github.com/heroarthur/Minix \r"
expect "# "
send "cd Minix && cp -r minixCode ../ && cd .. && rm -r Minix && cd minixCode \r"
send "./setUpSourceAndTools \r"
expect "# "
#clear terminal 
send "clear && pwd \r"
interact
