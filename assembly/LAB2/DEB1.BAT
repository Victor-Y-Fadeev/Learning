; @echo off
; goto l1
	.model	tiny
	.386
	.code
	org	100h
_:	
	jmp	start
kek	db	'$$$$$'
filename db	"helloasm.com",0
errmes	db	"Error",13,10,"$"
finish	db	"Finish",13,10,"$"
outmes	db	"0000:0000",13,10,"$"
old_int1_offset	dw	0
old_int1_cs	dw	0

int1_handler:
	push	bp
	mov	bp, sp

	pusha
	push	ds

	push	cs
	pop	es
	push	cs
	pop	ds	

	lea	di, outmes
	mov	bx, [bp+2]
	call	h4
	lea	di, [outmes+5]
	mov	bx, [bp+4]
	call	h4

	lea	dx, outmes
	mov	ah, 09h
	int	21h

	pop	ds
	popa

	pop	bp
	iret

start:
	mov	ax, 3D00h	; Функция Open file
	lea	dx, filename	; копируем в dx адрес строки
	int	21h				; вызываем функцию, в ax возвращается указатель на файл
	
	mov	bx, ax		; кладем в bx указатель на файл (Read file)
	mov	ah, 3Fh		; функция чтения
	mov	cx, 100h	; читаем первые 100 байт (записали сколько надо)
	lea	dx, prog	; указываем куда считать
	int	21h

	mov	ah, 3Eh		; Функция Close file
	int	21h

	mov	ah, 35h		; функция поиска старого прерывания
	mov	al, 1		; номер прерывания
	int	21h
	mov	old_int1_offset, bx	; ip
	mov	old_int1_cs, es		; cs

	mov	ax, 2501h		; 25 функция - поставить вектор прерывания (01 - первое прерывание)
	lea	dx, int1_handler	; указатель на мою функцию прерывания
	int	21h

	pushf			; Change flags register
	pop	dx
	or	dx, 100h	; TF:=1	

	mov	bx, 100h

	lea	cx, psp
	shr	cx, 4

	mov	ax, cs
	add	ax, cx
	
	push	ax
	pop	ds

	pushf
	push	cs			; address for called program
	lea	cx, after_debug		; to return to
	push	cx
	xor	cx, cx
	push	cx

	push	dx
	push	ax
	push	bx
	iret

after_debug:
	push	cs
	pop	ds
	lea	dx, finish
	mov	ah, 09h
	int	21h
	ret

er:
	lea	dx, errmes
	mov	ah, 09h
	int	21h
	ret

h4:	ror	bx, 8
	call	h2
	ror	bx, 8
h2:	mov	al, bl
	shr	al, 4
	call	h1
	mov	al, bl
h1:	; al - number, di - destination
	and	ax, 0fh
	cmp	al, 10
	sbb	al, 69h
	das
	stosb
	ret

align	16
psp:
	iret
	db	100h-($-psp) dup(0)	; program segment prefix
prog	db	100h dup(0)

end _	
; :l1
; tasm /m5 deb1.bat
; tlink /x/t deb1.obj
; del deb1.obj

