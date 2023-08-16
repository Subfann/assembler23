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

include \masm32\include\masm32.inc
include \masm32\include\kernel32.inc

include \masm32\macros\macros.asm

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib
.data
 
.code
up1 proc
; ebp = 2.ter basepointer im Stack
push ebp

;neue Instanz für ebp
mov ebp, esp

mov eax, [ebp+12]
mov ebx, [ebp+8]

cmp eax, ebx

JE m1
JB m2
JA m3

m1: mov ecx, 0
JMP m4

m2: mov ecx, 2
JMP m4

m3: mov ecx, 1

m4: 

mov [ebp+16], ecx


mov esp, ebp
pop ebp

ret
up1 endp

main:
mov eax, 0
;Reservierung von 1 Eintrag für die Rückgabe des Ergebnis
push eax

; 2 Parameter auf den Stack
mov eax, 5
push eax
mov eax, 5
push eax

call up1

; 2 Parameter löschen auf Stack
pop edx
pop edx

; jetzt auf Ergebnisse zugreifen
pop eax


exit 
end main