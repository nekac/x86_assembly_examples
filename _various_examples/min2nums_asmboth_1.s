# prog: Pronalazenje minimuma dva broja (asm fajl sa main programom)
# nn.lice

.intel_syntax noprefix
.arch i386

#============================================================================================
	.data
ulazni_format:
	.asciz "%i%i"
.extern izlazni_format # u okviru drugog .asm fajla definisan format

#============================================================================================
	.text
	.extern write
	.extern exit
	.globl _start
	
_start:
	call main
	push 0
	call exit # kao exit(0) poziv, ekvivalentno
	
	.extern min # funkcija za izracunavanje se uvozi iz drugog fajla
	
main:
	enter 8, 0
	
	lea eax, [ebp-4]
	push eax
	sub eax, 4
	push eax
	push offset ulazni_format
	call scanf
	add esp, 12
	
	push [ebp-8]
	push [ebp-4]
	call min # stdcall se koristi, funkcija sklanja parametre sa steka
	
	push eax
	push [ebp-4]
	push [ebp-8]
	push offset izlazni_format
	call printf
	
	leave
	ret
.end
	