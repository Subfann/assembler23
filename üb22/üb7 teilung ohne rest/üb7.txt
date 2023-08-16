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


text0 db "Programm zur Berechnung ob eine Zahl ohne Rest teilbar: ",0

zehn dd 1
ein1 dd 1
teiler1 dd 1
ein2 dd 1
teiler2 dd 1
ein3 dd 1
teiler3 dd 1
ein4 dd 1
teiler4 dd 1
ein5 dd 1
teiler5 dd 1
ein6 dd 1
teiler6 dd 1
ein7 dd 1
teiler7 dd 1
ein8 dd 1
teiler8 dd 1
ein9 dd 1
teiler9 dd 1
ein10 dd 1
teiler10 dd 1
erg dd 1




.code

up1 proc
push ebp
mov ebp, esp

mov eax, 0
mov ebx, 0
mov ecx, 0
mov edx, 0
jmp m99

m1:
mov byte ptr[ebp+16], 1
jmp m2

m99:
mov eax, [ebp+12]
mov ebx, [ebp+8]
div ebx
cmp edx, 0
je m1
mov byte ptr [ebp+16], 0

m2:


mov esp, ebp
pop ebp
ret
up1 endp



main:
cls
invoke StdOut, addr text0
mov eax, 0
mov ebx, 0
mov [zehn], 10

push eax

invoke locate,0,1
mov eax, sval(input("Eingabe der 1. Zahl: "))
mov [ein1], eax
push eax
invoke locate,0,2
mov eax, sval(input("Eingabe des Teilers der 1.Zahl: "))
mov [teiler1], eax
push eax
call up1
pop eax
pop eax
pop eax
cmp eax, 0
je m3
jmp m4
m3:
printf("Die Zahl : %d ist durch ",[ein1])
printf("%d MIT Rest Teilbar\n", [teiler1])
jmp m5
m4:
printf("Die Zahl : %d ist durch ",[ein1])
printf("%d OHNE Rest Teilbar\n", [teiler1])

m5:
invoke locate,0,4
push eax
mov eax, sval(input("Eingabe der 2. Zahl: "))
mov [ein2], eax
push eax
invoke locate,0,5
mov eax, sval(input("Eingabe des Teilers der 2.Zahl: "))
mov [teiler2], eax
push eax
call up1
pop eax
pop eax
pop eax
cmp eax, 0
je m6
jmp m7
m6:
printf("Die Zahl : %d ist durch ",[ein2])
printf("%d MIT Rest Teilbar\n", [teiler2])
jmp m8
m7:
printf("Die Zahl : %d ist durch ",[ein2])
printf("%d OHNE Rest Teilbar\n", [teiler2])

m8:

invoke locate,0,7
push eax
mov eax, sval(input("Eingabe der 3. Zahl: "))
mov [ein3], eax
push eax
invoke locate,0,8
mov eax, sval(input("Eingabe des Teilers der 3.Zahl: "))
mov [teiler3], eax
push eax
call up1
pop eax
pop eax
pop eax
cmp eax, 0
je m9
jmp m10
m9:
printf("Die Zahl : %d ist durch ",[ein3])
printf("%d MIT Rest Teilbar\n", [teiler3])
jmp m11
m10:
printf("Die Zahl : %d ist durch ",[ein3])
printf("%d OHNE Rest Teilbar\n", [teiler3])

m11:
invoke locate,0,10
push eax
mov eax, sval(input("Eingabe der 4. Zahl: "))
mov [ein4], eax
push eax
invoke locate,0,11
mov eax, sval(input("Eingabe des Teilers der 4.Zahl: "))
mov [teiler4], eax
push eax
call up1
pop eax
pop eax
pop eax
cmp eax, 0
je m12
jmp m13
m12:
printf("Die Zahl : %d ist durch ",[ein4])
printf("%d MIT Rest Teilbar\n", [teiler4])
jmp m14
m13:
printf("Die Zahl : %d ist durch ",[ein4])
printf("%d OHNE Rest Teilbar\n", [teiler4])

m14:
invoke locate,0,13
push eax
mov eax, sval(input("Eingabe der 5. Zahl: "))
mov [ein5], eax
push eax
invoke locate,0,14
mov eax, sval(input("Eingabe des Teilers der 5.Zahl: "))
mov [teiler5], eax
push eax
call up1
pop eax
pop eax
pop eax
cmp eax, 0
je m15
jmp m16
m15:
printf("Die Zahl : %d ist durch ",[ein5])
printf("%d MIT Rest Teilbar\n", [teiler5])
jmp m17
m16:
printf("Die Zahl : %d ist durch ",[ein5])
printf("%d OHNE Rest Teilbar\n", [teiler5])

m17:
invoke locate,0,16
push eax
mov eax, sval(input("Eingabe der 6. Zahl: "))
mov [ein6], eax
push eax
invoke locate,0,17
mov eax, sval(input("Eingabe des Teilers der 6.Zahl: "))
mov [teiler6], eax
push eax
call up1
pop eax
pop eax
pop eax
cmp eax, 0
je m18
jmp m19
m18:
printf("Die Zahl : %d ist durch ",[ein6])
printf("%d MIT Rest Teilbar\n", [teiler6])
jmp m20
m19:
printf("Die Zahl : %d ist durch ",[ein6])
printf("%d OHNE Rest Teilbar\n", [teiler6])

m20:
invoke locate,0,19
push eax
mov eax, sval(input("Eingabe der 7. Zahl: "))
mov [ein7], eax
push eax
invoke locate,0,20
mov eax, sval(input("Eingabe des Teilers der 7.Zahl: "))
mov [teiler7], eax
push eax
call up1
pop eax
pop eax
pop eax
cmp eax, 0
je m21
jmp m22
m21:
printf("Die Zahl : %d ist durch ",[ein7])
printf("%d MIT Rest Teilbar\n", [teiler7])
jmp m23
m22:
printf("Die Zahl : %d ist durch ",[ein7])
printf("%d OHNE Rest Teilbar\n", [teiler7])

m23:
invoke locate,0,22
push eax
mov eax, sval(input("Eingabe der 8. Zahl: "))
mov [ein8], eax
push eax
invoke locate,0,23
mov eax, sval(input("Eingabe des Teilers der 8.Zahl: "))
mov [teiler8], eax
push eax
call up1
pop eax
pop eax
pop eax
cmp eax, 0
je m24
jmp m25
m24:
printf("Die Zahl : %d ist durch ",[ein8])
printf("%d MIT Rest Teilbar\n", [teiler8])
jmp m26
m25:
printf("Die Zahl : %d ist durch ",[ein8])
printf("%d OHNE Rest Teilbar\n", [teiler8])

m26:
invoke locate,0,25
push eax
mov eax, sval(input("Eingabe der 9. Zahl: "))
mov [ein9], eax
push eax
invoke locate,0,26
mov eax, sval(input("Eingabe des Teilers der 9.Zahl: "))
mov [teiler9], eax
push eax
call up1
pop eax
pop eax
pop eax
cmp eax, 0
je m27
jmp m28
m27:
printf("Die Zahl : %d ist durch ",[ein9])
printf("%d MIT Rest Teilbar\n", [teiler9])
jmp m29
m28:
printf("Die Zahl : %d ist durch ",[ein9])
printf("%d OHNE Rest Teilbar\n", [teiler9])

m29:
invoke locate,0,28
push eax
mov eax, sval(input("Eingabe der 10. Zahl: "))
mov [ein10], eax
push eax
invoke locate,0,29
mov eax, sval(input("Eingabe des Teilers der 10.Zahl: "))
mov [teiler10], eax
push eax
call up1
pop eax
pop eax
pop eax
cmp eax, 0
je m30
jmp m31
m30:
printf("Die Zahl : %d ist durch ",[ein10])
printf("%d MIT Rest Teilbar\n", [teiler10])
jmp m32
m31:
printf("Die Zahl : %d ist durch ",[ein10])
printf("%d OHNE Rest Teilbar\n", [teiler10])

m32:






end main
