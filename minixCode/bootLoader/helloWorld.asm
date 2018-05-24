mov ah, 0xe 
mov al, 'H' 
int 0x10 

loop:
    jmp loop

times 510-($-$$) db 0
dw 0xaa55

