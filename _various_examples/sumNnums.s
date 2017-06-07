# prog: Rekurzivno sabiranje prvih N prirodnih brojeva (stdcall konvencija)
# nn.lice

.intel_syntax noprefix
.arch i386

#==========================================================================================
.data
ulazni_format:
	.asciz "%i" # string za formatiranje scanf funkcije
izlazni_format: 
	.asciz "Suma prvih N=%i prirodnih brojeva je %i\n" # string za printf

#==========================================================================================
.text
	.extern scanf
	.extern printf
	.extern exit
	.globl _start # labela koju likner prepoznaje, poziva se main odatle

_start:
	call main
	push 0 
	call exit

suma:
	enter 0, 0
	mov eax, [ebp+8]
	mov	ecx, eax  	# inicijalizacija brojača
	jcxz 2f 		# ako je ecx = 0, preskače se petlja
	mov eax, 0  	# početna vrednost  sume
1:	add eax, ecx 	# računanje sume
	loop 1b	    	# skok na početak  petlje ako je ecx>0 (loop radi ecx--)
2:	leave  			# prva sledeća instrukcija
	ret 4			# stdcall konvencija pozivanja
	
main:
	enter 4, 0
	lea eax, [ebp-4]
	push eax
	push offset ulazni_format
	call scanf
	add esp, 8
	
	push [ebp-4]
	call suma
	# funkcija oslobadja prostor
	
	push eax
	push [ebp-4]
	push offset izlazni_format
	call printf
	add esp, 12
	
	leave
	ret
.end
