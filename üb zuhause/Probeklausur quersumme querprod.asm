;==============================================================
  .386
  .model flat,stdcall
  option casemap:none
;==============================================================
; 
; 
; Test 
;
 include \masm32\include\windows.inc
 include \masm32\include\masm32.inc
 include \masm32\include\kernel32.inc

 includelib \masm32\lib\kernel32.lib
 includelib \masm32\lib\masm32.lib

 include \masm32\macros\macros.asm
 
 ;für sval-Macro
 include \masm32\include\masm32rt.inc
 
;==============================================================
.data


text1 db "Eric , Spielmann" , 0

EingabeZiffer dd 1

erg1 dd 1
erg2 dd 1



;==============================================================
.code

up1 proc
push ebp
mov ebp, esp

; Ergebnis Quersumme
mov ecx, 0

mov edx, 0
mov edx, [ebp+28]
add ecx, edx

mov edx, 0
mov edx, [ebp+24]
add ecx, edx

mov edx, 0
mov edx, [ebp+20]
add ecx, edx

mov edx, 0
mov edx, [ebp+16]
add ecx, edx

mov edx, 0
mov edx, [ebp+12]
add ecx, edx

mov edx, 0
mov edx, [ebp+8]
add ecx, edx

; Ergebnis der Multiplikation
mov eax, 0
mov eax, [ebp+28]
mov edx, [ebp+24]
mul edx

mov edx, [ebp+20]
mul edx

mov edx, [ebp+16]
mul edx

mov edx, [ebp+12]
mul edx

mov edx, [ebp+8]
mul edx

mov [ebp+32], eax

mov [ebp+36], ecx
mov esp, ebp
pop ebp

ret
up1 endp

;==============================================================
main:

cls
invoke locate,0,0
invoke StdOut, addr text1
invoke locate ,0,1

mov eax, 0
mov ebx, 0
mov ecx, 0
mov edx, 0

; Einlesen der Ziffer als Zeichenkette

mov [EingabeZiffer], 0
mov [EingabeZiffer], input("6-stellige Matrikelnummer eingeben: ")

mov ebx, [EingabeZiffer]


mov eax, 0
push eax

mov eax, 0
push eax

;Übergabe der einzelnen Ziffer 

mov eax, 0
mov al, byte ptr[ebx+0]
sub al, 30h
push eax

mov eax, 0
mov al, byte ptr[ebx+1]
sub al, 30h
push eax

mov eax, 0
mov al, byte ptr[ebx+2]
sub al, 30h
push eax

mov eax, 0
mov al, byte ptr[ebx+3]
sub al, 30h
push eax

mov eax, 0
mov al, byte ptr[ebx+4]
sub al, 30h
push eax

mov eax, 0
mov al, byte ptr[ebx+5]
sub al, 30h
push eax

call up1

pop edx
pop edx
pop edx
pop edx
pop edx
pop edx

pop eax
mov [erg2], 0
mov [erg2], eax

pop eax
mov [erg1], 0
mov [erg1], eax


printf("Quersumme= %d \n", [erg1])
printf("Querprodukt= %d \n", [erg2])

inkey "Taste drücken zum Beenden..."

exit
end main