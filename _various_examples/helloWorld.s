# prog: Hello world!
# nn.lice

# uobicajen pocetak programa
.intel_syntax noprefix
.arch i386

#==========================================================================================
.data # sekcija za podatke i inicijalizaciju
poruka:
	.ascii "Hello world!\n" 
kraj_poruke:
	.equ duzina_poruke, kraj_poruke - poruka # racunanje duzine stringa se vrsi
											 # na osnovu adresa labela	

#==========================================================================================
.text # sekcija sa izvrsnim kodom
	.extern write # uvoz metode write(1,&poruka,duzina_poruke)
	.extern exit
	.equ velicina_lokalnih_promenljivih, 0 # inicijalno za enter direktivu
	.globl main

main:
	enter velicina_lokalnih_promenljivih, 0 # 1. broj bajtova na steku za lokalne
											# 2. nivo ugnjezdenosti, za C uvek 0
	push duzina_poruke
	push offset poruka
	push 1
	call write
	add esp, 12 # prema cdecl konvenciji pozivalac skida parametre sa steka

	mov eax, 0 # povratna vrednost main funkcije
	leave
	ret
.end
