; https://stackoverflow.com/questions/43769467/x86-assembly-pointers
; 1 Speicherzelle = 8bit (1Byte)


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


; Wieso kann eine db-Variable (8bit lang) mehr als 1 Zeichen (8bit) halten?
; https://stackoverflow.com/questions/73322270/how-can-db-hold-a-string-more-than-2-characters-if-its-size-1-byte-8-bits
text0 db "Spielmann, Eric",0

spieler1_wort dd ?
spieler2_wort dd ?

current_char_comparator_result dd ?
abc dd ?

spieler1_wort_alphabet db 26
; [spieler1_wort_alphabet+0 = a] = 0
; [spieler1_wort_alphabet+1 = b] = 0
; [spieler1_wort_alphabet+2 = c] = 0

spieler2_wort_alphabet db 3
; [spieler2_wort_alphabet+0] = 0
; [spieler2_wort_alphabet+1] = 0
; [spieler2_wort_alphabet+2] = 0

.code

char_comparator proc
push ebp ; Base-Pointer sichern
mov ebp, esp ; da wir Stack-Pointer in Base-Pointer setzen

mov eax, 0
mov ebx, 0
mov ecx, 0
mov edx, 0

mov al, byte ptr[ebp+12] ; Buchstabe von Wort 1
mov bl, byte ptr[ebp+16] ; Buchstabe von Wort 2

cmp al, bl
je is_correct
jne continue

is_correct:
mov eax, 0
mov al, 'r'
mov [ebp+8], eax ; Ergebnis

continue:
pop ebp ; Base-Pointer wiederherstellen
ret
char_comparator endp



contains_char proc
push ebp ; Base-Pointer sichern
mov ebp, esp ; da wir Stack-Pointer in Base-Pointer setzen

mov eax, 0
mov ebx, 0
mov ecx, 0
mov edx, 0

; 1. Zeichen von Wort 1

mov eax, [ebp+24]
mov bl, [eax] ; wenn t = 116 von ASCII-Tabelle

sub bl, 97 ; t = 19
mov [spieler1_wort_alphabet+ebx], 1

; 1. Zeichen von Wort 2

mov ecx, [ebp+20]
mov dl, [ecx] ; wenn Spieler 2 als ersten Buchstaben t eingibt -> dl = 116

sub dl, 97 ; wenn dl = t (116) -> 116 - 97 -> dl = 19
mov [spieler2_wort_alphabet], dl

; Array von [spieler1_wort_alphabet] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0}
; Array von [spieler2_wort_alphabet] = {19,0,0}

; überprüfe, ob 1. Zeichen von spieler2_wort in spieler1_wort_alphabet als true gekennzeichnet ist

mov eax, 0
mov ebx, 0
mov ecx, 0
mov edx, 0

mov dl, [spieler2_wort_alphabet]
add dl, 97

cmp [spieler1_wort_alphabet+edx], 1
jne cont_char2

mov eax, "i"
mov [ebp+8], eax

cont_char2:

pop ebp

ret
contains_char endp

main:
cls

invoke StdOut, addr text0
invoke locate,0,1

mov eax, input("Spieler 1 - Geben Sie ein Wort ein (3 Stellen): ")
mov [spieler1_wort], eax
print [spieler1_wort]

cls

mov eax, 0
mov eax, input("Spieler 2 - Erraten Sie das Wort: ")
mov [spieler2_wort], eax

mov eax, 0
mov ebx, 0
mov ecx, 0
mov edx, 0

; 1. Buchstabe für Wort 1 auf Stack
mov eax, [spieler1_wort]
mov bl, byte ptr[eax]
push ebx

; 1. Buchstabe für Wort 2 auf Stack
mov eax, [spieler2_wort]
mov bl, byte ptr[eax]
push ebx

; Reservierung für Ergebnis
mov eax, "f"
push eax

call char_comparator

pop edx

mov [current_char_comparator_result], edx
invoke StdOut, addr current_char_comparator_result

pop edx
pop edx


; 2. Buchstabe für Wort 1 auf Stack
mov eax, [spieler1_wort]
mov bl, byte ptr[eax+1]
push ebx

; 2. Buchstabe für Wort 2 auf Stack
mov eax, [spieler2_wort]
mov bl, byte ptr[eax+1]
push ebx

; Reservierung für Ergebnis
mov eax, "f"
push eax

call char_comparator

pop edx

mov [current_char_comparator_result], edx
invoke StdOut, addr current_char_comparator_result

pop edx
pop edx
pop edx


; 3. Buchstabe für Wort 1 auf Stack
mov eax, [spieler1_wort]
mov bl, byte ptr[eax+2]
push ebx

; 3. Buchstabe für Wort 2 auf Stack
mov eax, [spieler2_wort]
mov bl, byte ptr[eax+2]
push ebx

; Reservierung für Ergebnis
mov eax, "f"
push eax

call char_comparator

pop edx

mov [current_char_comparator_result], edx
invoke StdOut, addr current_char_comparator_result

pop edx
pop edx
pop edx

; ist Buchstabe in beiden enthalten

mov eax, [spieler1_wort]
push eax

mov eax, [spieler2_wort]
push eax

mov eax, "n" ; Ergebnis für Zeichen 1 von Spieler 2 Wort
push eax

mov eax, "n" ; Ergebnis für Zeichen 2 von Spieler 2 Wort
push eax

mov eax, "n" ; Ergebnis für Zeichen 3 von Spieler 2 Wort
push eax

call contains_char

pop edx

mov [current_char_comparator_result], edx
invoke StdOut, addr current_char_comparator_result

inkey "press any key"

exit
end main