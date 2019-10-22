	; @echo off
	; goto l1
	.model	tiny
	.386
	.code
	org	100h
_: jmp start

file db "helloasm.com",0
mess db "0000:0000",13,10,"$"

int3_handler:
	push bp
	mov bp, sp
	pusha
	push ds
	
	push cs
	push cs
	pop es
	pop ds
	
	lea di, mess
	mov bx, [bp + 2]
	dec bx
	call h4
	lea di, [mess + 5]
	mov bx, [bp + 4]
	call h4

	lea dx, mess
	mov ah, 09h
	int 21h

	mov ax, [bp + 2]
	dec ax
	mov bx, ax
	add bx, offset psp
	add ax, offset prog1
	push bx
	mov bx, ax

	mov cx, [bx]
	pop bx
	
	mov byte ptr cs:[bx], cl
	mov ax, [bp + 2]
	dec ax
	mov cs:[bp + 2], ax

	pop ds
	popa
	pop bp

	iret
start:
	; OPEN FILE
	mov ah, 3dh
	lea dx, file
	int 21h

	; READ FILE
	mov bx, ax
	mov ah, 3fh
	mov cx, 100h
	lea dx, prog1
	int 21h

	; CLOSE FILE
	mov ah, 3eh
	int 21

	; COPY PROG1 TO PROG2
	mov di, offset prog2
	mov si, offset prog1
	mov cx, 100h
	rep movsb

	; SET INTERRUPT VECTOR
	mov ah, 25h
	mov al, 3
	lea dx, int3_handler
	int 21h	
	
	; MOVE FLAGS TO DX
	pushf
	pop dx

	; MOVE PROG BEGINNING TO DS
	lea cx, psp
	shr cx, 4
	mov ax, cs
	add ax, cx
	push ax
	pop ds

	; STACK PREPARATION FOR IRET
	lea cx, after_debug
	pushf
	push cs
	push cx

	; PROG'S RET
	push 0

	; AX:100h, FLAGS = DX
	push dx
	push ax
	push 100h
	
	; SET BREAKPOINTS
	mov byte ptr es:[psp + 0112h], 0cch
	mov byte ptr es:[psp + 0114h], 0cch

	; JUMP INTO PROG
	iret
after_debug:
	push cs
	pop ds
	ret
h4:
	ror bx, 8
	call h2
	ror bx, 8
h2:
	mov al, bl
	shr al, 4
	call h1
	mov al, bl
h1:
	and ax, 0fh
	cmp al, 10
	sbb al, 69h
	das
	stosb
	ret

align 16
psp:
	iret
db 100h - ($ - psp) dup(0)
prog1 db 100h dup(0)
prog2 db 100h dup(0)

end _	
; :l1
; tasm /m5 deb3.bat
; tlink /x/t deb3.obj
; del deb3.obj

