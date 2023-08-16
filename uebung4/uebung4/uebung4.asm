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
erg dd 1

.code

main:
mov eax, 0
mov ebx, 0

invoke locate,0,2
mov [ein1], sval(input("Eingabe 1. Zahl: "))

;
; sval(input) überschreibt die Register, deshalb Werte im Datenspeicher z.B. [ein1] ablegen
;

invoke locate,0,3
mov [ein2], sval(input("Eingabe 2. Zahl: "))

invoke locate,0,4

mov ebx, [ein2]
add ebx, [ein1]
mov [erg], ebx

printf("Zahl1: %d\n", ein1)
printf("Zahl2: %d\n", ein2)
printf("Ergebnis: %d\n", erg)

inkey "press any key"
exit
end main