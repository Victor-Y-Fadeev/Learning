; @echo off
; goto l1
        .model tiny
        .386
        .code
        org 100h

_: 
jmp start

string db "hello.com",0
cont db 512 dup(0)
start:
	mov ah, 3dh
	mov al, 0
	mov dx, offset string
	int 21h
	
	mov bx, ax
	mov ah, 3fh
	mov cx, 512
	mov dx, offset cont
	int 21h

	mov ah, 3eh
	int 21h

	mov ah, 03h
	mov al, 01h
	mov ch, 00h
	mov cl, 01h
	mov dh, 00h
	mov dl, 00h
	mov bx, offset cont
	int 13h

	ret


end _

; :l1
; tasm /m5 write.bat
; tlink /x/t write.obj
; del write.obj
