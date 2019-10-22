; @echo off
; goto l1
        .model tiny
        .386
        .code
        org 100h

_:
	mov ax, 0003h
	int 10h
	cld	

	mov dx, 0

	mov si, 256
	mov al, 0
	mov ah, 9
	mov cx, 1
	mov bl, 00011111b

cloop:
	int 10h
	push ax
	mov ah, 2
	
	inc dl
	int 10h
	mov ax, 0920h
	int 10h
	mov ah, 2
	inc dl
	int 10h
	pop ax

	inc al
	test al, 0fh
	jnz continue_loop

	push ax
	
	mov ah, 2
	inc dh
	mov dl, 0
	int 10h
	pop ax

continue_loop:
	dec si
	jnz cloop
	cli
	hlt	
end _

; :l1
; tasm /m5 ascii.bat
; tlink /x/t ascii.obj
; del ascii.obj
