# prog: Pronalazenje minimuma dva broja (asm fajl sa potprogramom)
# nn.lice

.intel_syntax noprefix
.arch i386

#============================================================================================
	.data
	.globl izlazni_format # mora da bude globl jer se izvozi
izlazni_format:
	.asciz "Minimum brojeva min(%i, %i) = %i\n"

#============================================================================================
	.text
	.globl min # potprogram koji se poziva iz main-a 
min:
	enter 0, 0
	mov ebx, [ebp+8] # 1. parametar
	cmp ebx, [ebp+12] # 2. parametar
	jle minPrvi # if(ebx < 2.parametra) skok na labelu
	mov eax, [ebp+12]
	jmp kraj
minPrvi:
	mov eax, ebx
kraj:
	leave
	ret 8
	
.end