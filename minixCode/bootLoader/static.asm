WELCOME_MSG: db 'Hello!', 0xd, 0xa, 0x0  ; napis kończy się znakiem nowej linii (0xd, 0xa) i nullem (0x0)
BUFFER times 64 db 0                     ; inicjacja 64-bajtowego bufora

start:
    mov ax, BUFFER
