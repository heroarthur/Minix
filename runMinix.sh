#!/bin/bash
qemu-system-x86_64 -enable-kvm -curses -drive file=/home/karol/Pulpit/MINIX_image/work2/minix.img -localtime -net user,hostfwd=tcp::10022-:22 -net nic,model=virtio -m 1024M
