	; @echo off
	; goto l1
	.model	tiny
	.386
	.code
	org	100h
_:
	jmp start

old_ip	dw 0		; double word (4 байта)
old_cs	dw 0
esc_fl	dw 0
string	db '$$', 13, 10, '$'

int9_handler:
	pusha				; сохраняем локальные данные на стеке
	pushf
	push	es
	push	ds
	push	cs
	push	cs
	pop	es
	pop	ds

	in	al, 60h			; получаем код клавиши с 60 порта (get code)
	mov	byte ptr  [esc_fl], al	; кастуем double word к byte и сохраняем код (save code)

	mov	bl, al		; записываем код клавиши в строку (generate string)
	lea	di, string
	call	h2

	mov	ah, 09h		;print string
	lea 	dx, string
	int	21h

	mov	al, 20h		; записываем в al индикатор конца прерывания (send signal "end of interrupt")
	out	20h, al		; отправляем в 20 порт команду завершить программу (to interrupt controller)

	pop	ds				; восстанавлеваем локальные данные со стека
	pop	es
	popf
	popa
	iret				; возвращается к исполнению прогрпммы с места вызова прерывания

start:
	; использовать dos функции для поиска прерываний плохо

	push	0			; кладем 0 на стек
	pop	es				; записываем его в es

	mov	ax, es:[4 * 9]	; записываем в ax адрес 9 прерывания (прерывания 4-х битные) (9 interrupt ip)
	mov	old_ip, ax		; сохранили instruction pointer

	mov	ax, es:[4*9+2]	; записываем 3-ю часть 9 прерывания (9 interrupt cs)
	mov	old_cs, ax		; сохраняем code segment

	cli					; отключить прерывания
	lea	ax, int9_handler	; подменяем 9 прерывание своей функцией (change 9 int handler)
	mov	es:[4*9], ax	
	mov	ax, cs			; сохраняем адрес текущего сегмента для возвращения
	mov	es:[4*9+2], ax
	sti					; включить прерывания

lp:	
	mov	ax, esc_fl		; переносим последнюю нажатую клавишу в ax
	cmp	ax, 81h			; сравниваем ее с esc_fl
	jne	lp				; если не ESC повторяем

escape:					; восстанавливаем прерывание по умолчанию
	cli
	mov	ax, old_ip	;return old 9 int handler
	mov	es:[4*9], ax
	mov	ax, old_cs
	mov	es:[4*9+2], ax
	sti  

	ret

h2: 
	mov al, bl ; bl = ah = scan-code

	shr al, 4  ; al = high nibble (полубайт)
	call h1

	mov al, bl ; al = low nibble

h1:
	; DI - start of string

	and ax, 0fh ; ah = last nibble
	cmp al, 10  ; check if its letter or number (10 = 0Ah)
	sbb al, 69h ; al = al - (69h + CF)
	das	    ; 
	stosb	    ; store AL as ES:DI
	
exit:   ret
end _	
; :l1
; tasm /m5 keyboard.bat
; tlink /x/t keyboard.obj
; del keyboard.obj

