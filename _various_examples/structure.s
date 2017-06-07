# prog: Struktura (prikaz skrivenog pokazivaca)
# nn.lice

# typedef struct {
#	int a, b;
# } struc;

# struc f(int x, int y){
#	struc a;
#	a.a=x;
#	a.b=y;
#	return a;
# }

# void main(){
#	struc r= f(0x1122, 0x3344);
# }

.intel_syntax noprefix
.arch i386

#==========================================================================================
.data 
messageX: 	.asciz "Unesite vrednost X\n"
messageXi: 	.asciz "X=%i\n"
messageY: 	.asciz "Unesite vrednost Y\n"
messageYi: 	.asciz "Y=%i\n"

ulazni_format: 	.asciz "%i"
izlazni_format: .asciz "Rezultat je: \n %i \n %i \n"

#==========================================================================================
.text
	.extern printf
	.extern scanf
	.extern exit
	.globl _start

_start:
	call main
	push 0
	call exit

f:
	enter 16, 0
	# edx = x
	mov edx, [ebp+12]
	mov [ebp-8], edx
	# eax = y
	mov eax, [ebp+16]
	mov [ebp-4], eax
	# ecx = skriveni adresa
	mov ecx, [ebp+8]

	mov eax, [ebp-8]
	mov edx, [ebp-4]

	mov [ecx], eax
	mov [ecx+4], edx

	mov eax, [ebp+8]

	leave
	ret 4


main:
	enter 16, 0
	
	# poruka za unosenje X vrednosti
	push offset messageX
	call printf
	add esp, 4
	
	# citanje X vrednosti
	lea eax, [ebp-16]
	push eax
	push offset ulazni_format
	call scanf
	add esp, 8

	# ispis vrednosti X
	mov eax, [ebp-16]
	push eax
	push offset messageXi
	call printf
	add esp, 8

	# poruka za unosenje Y vrednosti
	push offset messageY
	call printf
	add esp, 4

	# citanje Y vrednosti
	lea eax, [ebp-12]
	push eax
	push offset ulazni_format
	call scanf
	add esp, 8

	# ispis vrednosti Y
	mov eax, [ebp-12]
	push eax
	push offset messageYi
	call printf
	add esp, 8

	# smestanje parametara na stek
	mov eax, [ebp-12]
	push eax
	mov eax, [ebp-16]
	push eax
	mov eax, esp  
	add eax, 8
	push eax # skriveni pokazivac
	call f
	add esp, 8 # x i y se skidaju, a funkcija skriveni oslobodi

	# stampanje povratne vrednosti
	mov ebx, [eax+4] # skriveni pa njegove lokacije
	push ebx
	mov ebx, [eax]
	push ebx
	push offset izlazni_format
	call printf
	add esp, 8
	leave
	ret

.end







