# Prog: Sabiranje dva broja cdecl & stdcall
# nn.lice

.intel_syntax noprefix
.arch i386

#==========================================================================================
.data
ulazni_format:
	.asciz "%i%i" # string za formatiranje scanf funkcije
izlazni_format: 
	.asciz "%i + %i = %i\n" # string za printf
#==========================================================================================
.text
	.extern write
	.extern exit
	.globl _start # labela koju likner prepoznaje, poziva se main odatle

_start:
	call main
	push 0 # parametar za poziv exit
	call exit

saberi: # potprogram (stdcall konvencija)
	enter 0, 0
	mov eax, [ebp+8] # 1.uneti broj (x)
	add eax, [ebp+12] # 2.uneti broj (y)
	leave
	ret 8 # oslobadja parametre poziva koji su na steku ostali
	# ret ako bi se radilo o cdecl konvenciji

main:
	enter 8, 0
	
	lea eax, [ebp-4] # u eax ucitavanje adrese na koju ukazuje ebp-4
	push eax # 3.argument (adresa prve pomocne)
	sub eax, 4
	push eax # 2.argument (adresa druge pomocne)
	push offset ulazni_format # 1.argument
	call scanf
	add esp, 12 # oslobadjanje prostora gde su argumenti jer je cdecl scanf

	push [ebp-8] # dohvati prvi ucitani broj - 2.argument
	push [ebp-4] # dohvati drugi ucitani broj - 1.argument
	call saberi
	# add esp, 8 # ako bi se radilo o cdecl kovenciji, pozivalac oslobadja

	push eax # 4.argument je suma
	push [ebp-4] # 3. argument - drugi ucitani broj
	push [ebp-8] # 2. argument - prvi ucitani broj
	push offset izlazni_format # 1.argument je format instrukcije
	call printf
	add esp, 16 # oslobodi zauzetost za 4 parametra poziva 

	leave # izlaz iz main-a
	ret
.end
