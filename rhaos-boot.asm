BITS 16
[org 0x7c00]

cli

xor ax, ax
mov es, ax

; Display setting
mov ah, 0x0e

mov ebp, 8000h
mov esp, ebp

; Read another sector from hdd

; Read Sectors From Drive
mov dl, 80h
; Sectors To Read Count
mov ah, 2h
; Sectors To Read Count
mov al, 0x1
; Cylinder
xor ch, ch
; Sector
mov cl, 0x1

; Head
mov dh, 0

; offset to es segment
mov bx, 9000h
int 13h

# Jump to c environment
call 9000h

loop:
jmp loop

message:
	dw "Hello"
	times 510-($-$$) db 0
	dw 0xaa55
