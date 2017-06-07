# prog: Test primer za if-then-else
# nn.lice

# if (n < 5)
#	n = n*3 + 1;
# else
#	n = n/2;

.intel_syntax noprefix
.arch i386

#==========================================================================================
.data
ulazni_format:
	.asciz "%i" # string za formatiranje scanf funkcije
izlazni_format_mnozenje: 
	.asciz "Rezultat nakon izvrsenja petlje je %i\n" 
izlazni_format_deljenje: 
	.asciz "Rezultat nakon izvrsenja petlje je %i i ostatak %i\n" 

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

petlja:
	enter 0, 0
	mov eax, [ebp+8]
	cmp eax, 5
	jge elseGrana # uvek se za skok ide na suprotan uslov od postavljenog
ifGrana:
	mov ecx, 3
	mul ecx
	add eax, 1
	mov ecx, 0 # flag da je mnozenje, nema ostatka 
	jmp kraj
elseGrana:
	mov ecx, 2
	div ecx
	mov ecx, 1 # flag da je deljenje, ima ostatka 
kraj:
	leave 
	ret

main:
	enter 4, 0
	lea eax, [ebp-4]
	push eax
	push offset ulazni_format
	call scanf
	add esp, 8

	push [ebp-4]
	call petlja
	# funkcija u stdcall oslobadja prostor

	# izlazni format u zavisnosti od odradjenje grane u potprogramu
	cmp ecx, 0
	jne deljenje
mnozenje:
	push eax
	push offset izlazni_format_mnozenje
	call printf
	add esp, 8
	jmp zavrsetak
deljenje: 
	push edx
	push eax
	push offset izlazni_format_deljenje
	call printf
	add esp, 12
zavrsetak:
	leave
	ret
.end
	