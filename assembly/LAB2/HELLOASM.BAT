	; @echo off
	; goto l1
	.model	tiny
	.386
	.code
	org	100h
_:jmp start

hello db "Hello, ASM",13,10,"$"

start:

lea dx, hello
mov ah, 9h
int 21h
ret

end _	
; :l1
; tasm /m5/l helloasm.bat
; tlink /x/t helloasm.obj
; del helloasm.obj

