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
 
 ;f�r sval-Macro
 include \masm32\include\masm32rt.inc
 

.data


text0 db "Quersumme Matrikelnummer, Max. Matrikelnummer: ",0
text1 db "Brugger, Alexander"

par1 db 10
ein db 1
ergebnis dd 1
ergebnis2 dd 1

.code

up1 proc
push ebp
mov ebp, esp
mov edx, 0
mov dl, byte ptr[ebp+8]
add dl, byte ptr[ebp+12]
add dl, byte ptr[ebp+16]
add dl, byte ptr[ebp+20]
add dl, byte ptr[ebp+24]
add dl, byte ptr[ebp+28]
mov byte ptr[ebp+32], dl

mov ebx, 0

mov ebx, [ebp+8]
mov ecx, [ebp+12]
cmp ebx, ecx
jb m4
jmp m5

m4:
mov ebx, ecx

m5:
mov ecx, 0
mov ecx, [ebp+16]
cmp ebx, ecx
jb m6
jmp m7

m6:
mov ebx, ecx

m7:
mov ecx, 0
mov ecx, [ebp+20]
cmp ebx, ecx
jb m8
jmp m9

m8:
mov ebx, ecx

m9:
mov ecx, 0
mov ecx, [ebp+24]
cmp ebx, ecx
jb m10
jmp m11

m10:
mov ebx, ecx

m11:
mov ecx, 0
mov ecx, [ebp+24]
cmp ebx, ecx
jb m12
jmp m13

m12:
mov ebx, ecx

m13:

mov byte ptr[ebp+36], bl

;mov [ergebnis], edx

pop ebp
ret
up1 endp

main:
cls
invoke StdOut, addr text0
invoke locate,0,1
invoke StdOut, addr text1
invoke locate,0,2
mov eax, 0
mov eax, input("Bitte geben Sie Ihre Matrikelnumemr ein (genau 6 Stellen): ")


mov ecx, 0
push ecx
push ecx
mov ergebnis, 0
mov edx, 0

mov bl, 0
mov bl, [eax+0]
sub bl, 30h
movzx ecx, bl
push ecx

mov bl, 0
mov bl, [eax+1]
sub bl, 30h
movzx ecx, bl
push ecx

mov bl, 0
mov bl, [eax+2]
sub bl, 30h
movzx ecx, bl
push ecx

mov bl, 0
mov bl, [eax+3]
sub bl, 30h
movzx ecx, bl
push ecx

mov bl, 0
mov bl, [eax+4]
sub bl, 30h
movzx ecx, bl
push ecx

mov bl, 0
mov bl, [eax+5]
sub bl, 30h
movzx ecx, bl
push ecx


call up1

pop edx
pop edx
pop edx
pop edx
pop edx
pop edx
pop edx
mov ergebnis, edx

pop edx
mov ergebnis2, edx

printf("Quersumme: %d \n", [ergebnis])
printf("Max. Zahl: %d \n", [ergebnis2])

inkey "press any key"

exit
end main
