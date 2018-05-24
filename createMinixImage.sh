#!/bin/bash
qemu-img create -f qcow2 -o backing_file=/home/karol/Pulpit/MINIX_image/backfile/minix.img /home/karol/Pulpit/MINIX_image/work2/minix.img
qemu-system-x86_64 -enable-kvm -curses -drive file=/home/karol/Pulpit/MINIX_image/work2/minix.img -localtime -net user,hostfwd=tcp::10022-:22 -net nic,model=virtio -m 1024M
