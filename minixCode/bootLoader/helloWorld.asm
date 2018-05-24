mov ah, 0xe 
mov al, 'H' 
int 0x10 
mov ah, 0xe  
mov al, 'e'                                
int 0x10
mov ah, 0xe  
mov al, 'l'                                
int 0x10
mov ah, 0xe  
mov al, 'l'                                
int 0x10
mov ah, 0xe  
mov al, 'o'                                
int 0x10
mov ah, 0xe 
mov al, ' '                                
int 0x10

mov ah, 0xe 
mov al, 'W'                                
int 0x10 
mov ah, 0xe  
mov al, 'r'                                
int 0x10
mov ah, 0xe  
mov al, 'd'                                
int 0x10
mov ah, 0xe  
mov al, '!'                                
int 0x10
loop:
    jmp loop

times 510-($-$$) db 0

