; @echo off
; goto l1
	.model tiny
	.386
	.code
	org 100h
_:	jmp start 

vend_f	db "vendors.txt", 0
dev_f	db "devices.txt", 0
vend_n	db "0000"
dev_n	db "0000"
shift	db "0000",13,10,'$'
enter	db ">>>>>>>",13,10,'$'
string	db "                                                                                ",'$'

start:
	xor ecx, ecx
bus_lp:
	mov eax, 80000000h
	shl ecx, 8
	or eax, ecx
	shr ecx, 8

	mov dx, 0cf8h
	out dx, eax

	mov dx, 0cfch
	in eax, dx

	cmp eax, 0FFFFFFFFh
	je skip
	

	mov ebx, eax
	lea di, vend_n
	call h4

	shr ebx, 16
	lea di, dev_n
	call h4

	push cx

	call find_vend
	call find_dev

	pop cx
	
;	jmp bus_lp
	
skip:
	inc cx
	cmp cx, 0FFFFh
	jne bus_lp
	ret

find_dev:
	;open
	lea dx, dev_f
	mov ah, 3dh
	mov al, 0h
	int 21h

	mov bx, ax

	;shift
	mov ah, 42h
	mov al, 0
	mov ch, byte ptr [shift]
	mov cl, byte ptr [shift+1]
	mov dh, byte ptr [shift+2]
	mov dl, byte ptr [shift+3]
	int 21h

read_dev:
	;read
	mov ah, 3fh
	mov cx, 80
	lea dx, string
	int 21h

	lea di, dev_n
	jmp cmp_nums_dev

close_dev:
	;close
	mov ah, 3eh
	int 21h	

	;print	
	mov ah, 09h
	lea dx, string
	int 21h

	mov ah, 09h
	lea dx, enter
	int 21h

	ret

find_vend:
	;open
	lea dx, vend_f
	mov ah, 3dh
	mov al, 0h
	int 21h

	mov bx, ax
read_vend:
	;read
	mov ah, 3fh
	mov cx, 76
	lea dx, string
	int 21h

	mov ah, 3fh
	mov cx, 4
	lea dx, shift
	int 21h

	lea di, vend_n
	jmp cmp_nums_vend

close_vend:
	;close
	mov ah, 3eh
	int 21h	

	;print	
	mov ah, 09h
	lea dx, string
	int 21h
	
	ret

cmp_nums_vend:
	lea si, string
	cmpsb
	jne read_vend
	cmpsb
	jne read_vend
	cmpsb
	jne read_vend
	cmpsb
	jne read_vend

	je close_vend

cmp_nums_dev:
	lea si, string
	cmpsb
	jne read_dev
	cmpsb
	jne read_dev
	cmpsb
	jne read_dev
	cmpsb
	jne read_dev

	je close_dev


h4:	ror bx, 8
	call h2
	ror bx, 8
h2:	mov al, bl
	shr al, 4
	call h1
	mov al, bl
h1:	and ax, 0fh
	cmp al, 10
	sbb al, 69h
	das
	stosb
	ret
end _
; :l1
; tasm /m5 lab4.bat
; tlink /x/t lab4.obj
; del lab4.obj