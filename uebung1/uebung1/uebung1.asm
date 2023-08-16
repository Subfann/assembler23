;==============================================================
 .386
 .model flat,stdcall
 option casemap:none
;========================================================
;include \masm32\include\windows.inc
;include \masm32\include\masm32rt.inc

; falls masm32 nicht auf C: installiert ist, aus dem Intranet
; das Verzeichnis masm32 nach H: kopieren
; dann aber H: vor die include-Dateien schreiben!

include H:\masm32\include\masm32.inc
include H:\masm32\include\kernel32.inc

include \masm32\macros\macros.asm

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib
.data
	var db 1
.code
main:



	;mov ecx, offset var
	;mov byte ptr[var], 6


	;mov eax, 5
	;mov ebx, 7
	;add eax, ebx

	;mov eax, 0
	;mov bl, 3
	;mov al, 4
	;add al, bl

	;mov ax, 5
	;mov dx, 9
	;mov ax, dx
	

	;mov cx, bx
	;mov ax, dx
	;add cx, ax

	mov al, 9
	mov bl, 3
	mul bl
	

exit 
end main