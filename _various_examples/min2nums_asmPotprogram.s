	.intel_syntax noprefix		# Koristi se Intel sintaksa bez prefiksa za registre.
	.arch i386			# 80386 instrukcijski set.

#============================================================================================
	.data				# Pocetak data sekcije.
.globl 	izlazni_format
izlazni_format:
	.asciz "Minimum brojeva min(%i, %i) = %i\n"	
.globl 	ulazni_format
ulazni_format:
	.asciz "%i%i"	

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

