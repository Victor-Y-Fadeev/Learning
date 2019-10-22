; @echo off
; goto l1
        .model tiny
        .386
        .code
        org 100h

_: jmp start

txt db 'H',0fh,'e',0fh,'l',0fh,'l',0fh,'o',0fh,' ',0fh,'w',0fh,'o',0fh,'r',0fh,'l',0fh,'d',0fh		; Строка которую хотим вывести (0fh - спецсимвол вывода)
txtlen = $-txt			; длинна строки (из текущего адреса ($) вычитаем адрес начала строки)

start:
	mov ax, 0003h
	int 10h
	cld				; записать 0 в df
	
	mov ax, 0B800h	; адрес видеодрайвера
	mov es, ax
	
	mov di, 0
	mov si, offset txt
	sub si, 100h		; удаляем хедер исполняющейся программы
	add si, 7c00h		; сдвигаем до расположения исполняющейся программы из bios
	mov cx, txtlen
	cld

	rep movsb
ret
	db 510 - ($ - _) dup(0), 55h, 0aah		; забиваем нулями оставшиеся байты до 510 и добавляем 2 спецсимвола 
end _

; :l1
; tasm /m5 hello.bat
; tlink /x/t hello.obj
; del hello.obj
