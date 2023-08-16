;==============================================================
  .386
  .model flat,stdcall
  option casemap:none
;==============================================================
; Test am 03.05.2013 ohne Fehler
; wenn Consolenfenster nicht weggeht, dann mit Mauszeiger in Quelltextfenster klicken
; Test mit Zahlen bis 65535
;
 include \masm32\include\windows.inc
 include \masm32\include\masm32.inc
 include \masm32\include\kernel32.inc

 includelib \masm32\lib\kernel32.lib
 includelib \masm32\lib\masm32.lib

 include \masm32\macros\macros.asm
 
 ;für sval-Macro
 include \masm32\include\masm32rt.inc
 

.data


text0 db "Programm zur Buchstabensuche: ",0

ein1 db 1
ein2 db 1
ein3 dd 1


.code

main:


cls
invoke StdOut, addr text0
mov edx, 0
invoke locate,0,1

mov ebx, input("Eingabe des Wortes: ")
;mov [ein1], bl

mov eax,0
mov ecx, input("Eingabe des Buchstaben: ")
mov al, byte ptr [ecx+0]
mov [ein2], al

mov edx, 0



m1:

cmp byte ptr [ebx + edx], 00h 
je m3

mov cl, [ein2]

cmp cl, byte ptr [ebx + edx] 
je m2

inc edx
jmp m1

m2:
mov [ein3], edx
printf("Der Buchstabe befindet sich an der Stelle: %d\n",[ein3]) ;Printf macht Register kaputt, darum vorher umspeichern
mov edx, 0
mov edx, [ein3]
inc edx
jmp m1


m3:


printf("ENDE")
exit
end main
