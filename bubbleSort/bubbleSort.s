# nn.lice
# bubbleSort implementation for array of n emenents (cdecl convention)

# void arraySort(array[], n)
# array[] - start address of array
# n - number of elements in array 

## bubbleSort ##
#
#	for (i = 0 ; i < ( n - 1 ); i++){
#		for (j = 0 ; j < n - i - 1; j++){
#			if (array[j] > array[j+1]){
#				temp       = array[j];
#				array[j]   = array[j+1];
#				array[j+1] = temp;
#			}
#		}
#	}

# =========================================================================================

.intel_syntax noprefix
.arch i386

# =========================================================================================
	.text
.global arraySort

arraySort:
	enter 4, 0
	
	push ebp
	push edx
	push edi
	push esi
	
	cmp DWORD PTR [ebp+12], 1 # only one element in array 
	je finish
	
	mov esi, DWORD PTR [ebp+12] # num of elements 
	mov ebx, DWORD PTR [ebp+8]  # start address 
	mov edi, 0 # counter, i = 0
	dec esi
	mov DWORD PTR [ebp-4], esi
	
sorting: # for(i; i < (n-1); i++)
	cmp edi, DWORD PTR [ebp-4] # i < (n-1)
	je finish
	
	mov esi, DWORD PTR [ebp-4]
	mov ecx, 0 # counter, j = 0 
	sub esi, edi # esi -= edi 
	
move: # for(j; j < (n-1)-i; j++)
	cmp ecx, esi # j < (n-1) - i
	je nextElementOutside
	
	mov eax, DWORD PTR [ebx+ecx*4] # eax = array[j]
	mov edx, DWORD PTR [ebx+ecx*4+4] # edx = array[j+1]
	cmp eax, edx # if(array[j] > array[j+1])
	jle nextElementInside
	
	xchg eax, edx # what is done when "if" condition is true
	
	mov DWORD PTR [ebx+ecx*4], eax
	mov DWORD PTR [ebx+ecx*4+4], edx
	
nextElementInside:
	inc ecx
	jmp move
	
nextElementOutside:
	inc edi
	jmp sorting 
	
finish:

	pop esi # leave stack registers in condition before function call
	pop edi
	pop edx
	pop ebp

	leave
	ret
.end
