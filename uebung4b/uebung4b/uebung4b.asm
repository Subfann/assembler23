;==============================================================
  .386
  .model flat,stdcall
  option casemap:none
;==============================================================
; Test am 20.05.2015 ohne Fehler
; wenn Consolenfenster nicht weggeht, dann mit Mauszeiger in Quelltextfenster klicken
;
 include c:\masm32\include\windows.inc
 include c:\masm32\include\masm32.inc
 include c:\masm32\include\kernel32.inc

 includelib c:\masm32\lib\kernel32.lib
 includelib c:\masm32\lib\masm32.lib

 include c:\masm32\macros\macros.asm
 
 ;für sval-Macro
 include c:\masm32\include\masm32rt.inc
 

.data

ein1 dd 1
ein2 dd 1
ein3 dd 1
ein4 dd 1
ein5 dd 1
ein6 dd 1
erg dd 1

.code



main:
mov eax, 0
mov ebx, 0
mov ecx, 0

invoke locate,0,2
;ebx als temporäre Adress immer 32 bit
mov ebx, input("Matrikelnummer: ")

mov al, [ebx + 0]
sub al, 30h

mov cl, 0
add cl, al

mov al, 0
mov al, [ebx + 1]
sub al, 30h

add cl, al

mov al, 0
mov al, [ebx + 2]
sub al, 30h

add cl, al

mov al, 0
mov al, [ebx + 3]
sub al, 30h

add cl, al

mov al, 0
mov al, [ebx + 4]
sub al, 30h

add cl, al

mov al, 0
mov al, [ebx + 5]
sub al, 30h

add cl, al





printf("Ergebnis: %d\n", cl)

inkey "press any key"
exit
end main
