; ===================================================
.386
.model flat, stdcall
option casemap: none
; ===================================================

include \masm32\include\windows.inc
include \masm32\include\masm32rt.inc
include \masm32\include\masm32.inc
include \masm32\include\kernel32.inc
include \masm32\macros\macros.asm
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib


.data

datum db "25 Oktober 2021", 0
nam db "Spielmann, Eric", 0
matrikel db "Matrikel-Nr.: 217108", 0


eingabe db "Geben Sie 4 Zahlen ein, zu: a b c d", 0


a1 dd 1
b1 dd 1
c1 dd 1
d1 dd 1


x1 dd 1
y1 dd 1

z1 dd 1






.code

prg proc
push ebp
mov ebp, esp


; div eg z     +16
;n1 y		   +12
;n2 x		    +8
;ret			+4



;ret    +4
;d	+8 (7push)  1pop
;c	+12 (6push)  2pop
;b	+16 (5push)  3pop
;a	+20 (4push)  4pop
;x	+24 (3push)  5pop
;y      +28 (2push)  6pop
;z      +32 (1push)   7pop



; cd Produkt berechnen
mov eax, dword ptr [ebp + 8]  ; d
mul dword ptr [ebp + 12] ; c
mov dword ptr [ebp + 28], eax ; Produkt (y)


; ab Produkt berechnen
mov eax, dword ptr [ebp + 16]  ; b
mul dword ptr [ebp + 20] ; a
mov dword ptr [ebp + 24], eax ; Produkt (x)



;Div Rechnung


mov edx, 0
mov eax, dword ptr [ebp + 24]			; x
mov ebx, dword ptr [ebp +28]			; y
add eax, ebx									 ; eax= eax: ebx (erg wird in eax gespeichert)

mov dword ptr [ebp + 32], eax				 ; erg von eax in var



mov esp, ebp
pop ebp
ret
prg endp






main:

								;erste Seite
invoke locate, 1, 2
invoke StdOut, addr datum



invoke locate, 1, 12
invoke StdOut, addr nam




invoke locate, 1, 14
invoke StdOut, addr matrikel

								;zweite Seite

invoke locate, 1, 20
invoke StdOut, addr eingabe							; ausgabe Text dass zahlen eingegeben werden sollen


invoke locate, 1, 21
mov dword ptr [a1], sval(input("Zahl a: "))		; nutzer wird aufgefordet zahlen einzugeben und gibt ein

invoke locate, 1, 22
mov dword ptr [b1], sval(input("Zahl b: "))

invoke locate, 1, 23
mov dword ptr [c1], sval(input("Zahl c: "))

invoke locate, 1, 24
mov dword ptr [d1], sval(input("Zahl d: "))

												
											;Rechnung


mov eax, 0
mov ebx, 0
mov ecx, 0
mov edx, 0


push ebx ;z
push ebx ;y
push ebx ;x

push dword ptr [a1]
push dword ptr [b1]
push dword ptr [c1]
push dword ptr [d1]


call prg									;erg in eax

pop eax
pop eax
pop eax
pop eax


invoke locate, 1, 25	
pop eax ;						;ausgabe der Rechnunng
printf("X= %d", eax)

						;erg in eax



invoke locate, 1, 26
pop eax ;
printf("Y= %d", eax)
				;erg rechnung aus register  in var


								;vorbereitung für stac

invoke locate, 1, 27
pop eax							; z
printf("Z= %d", eax)





invoke locate, 0, 28
inkey "press any key"


exit
end main