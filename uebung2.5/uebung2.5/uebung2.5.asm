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
text0 db "Bitte Name, Vorname eingeben", 13,10,0

var1 dd 1
var2 dd 1
var3 dd 1
var4 dd 1

pos1 dd 1
pos2 dd 1
pos3 dd 1



.code

up1 proc
push ebp
mov ebp, esp
mov ecx, 0
mov ecx, 1

mov eax, 0
mov eax, [ebp+8]
mul ecx

mov eax, 0
mov eax, [ebp+12]
mul ecx

mov eax, 0
mov eax, [ebp+16]
mul ecx

mov [ebp+32], ecx

mov esp, ebp
pop ebp
ret
up1 endp


up2 proc
push ebp
mov ebp, esp

mov eax, 0
mov ebx, 0
mov ecx, 0
mov edx, 0

mov eax, [ebp+16]
mov ebx, [ebp+12]
mov ecx, [ebp+8]

;Ermittlung groesste Ziffer
mov edx, 0

cmp eax, ebx
jb m7
ja m8

m7: cmp ebx, ecx
jb m9
ja m10

m9: mov edx, 3 ;groesste ziffer auf position 3
jmp m12

m10: mov edx, 2 ;groesste ziffer auf position2
cmp eax, ecx
;jb m14
;ja m15

m8: cmp eax, ecx
ja m11

m11: mov edx, 1 ;groesste ziffer auf position 1

m12: mov edx, 0
mov edx, 1

m13: mov edx, 0
mov edx, 2

;m14: mov edx, 


ret
up2 endp

main:

cls


invoke StdOut, addr text0
invoke locate,0,2

mov eax, 0
push eax
push eax
push eax
push eax

mov ebx,0
mov ebx, sval(input("1.te Ziffer bitte eingeben: "))
mov eax, 0
mov eax, ebx
push eax

mov ebx,0
mov ebx, sval(input("2.te Ziffer bitte eingeben: "))
mov eax, 0
mov eax, ebx
push eax

mov ebx,0
mov ebx, sval(input("3.te Ziffer bitte eingeben: "))
mov eax, 0
mov eax, ebx
push eax

call up1

call up2

pop eax
pop eax
pop eax

pop eax
pop eax 
pop eax

pop eax
mov [var1], eax

printf("Das Produkt = %d \n", [var1])

printf("Ende")





exit
end main