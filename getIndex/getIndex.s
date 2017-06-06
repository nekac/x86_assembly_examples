# nn.lice
# prog: Find index of the last position of number that user insert (cdecl convention)

# int getIndex(int array[], int n, int x)
# array[] - array of elements that are initial given in init.s 
# n - number of elements in array
# x - number whose index need to be find


.intel_syntax noprefix
.arch i386

#============================================================================================
	.text
.global getIndex 

getIndex:
	enter 0,0
	
	push ebp
	push ebx
	push edi
	push esi
	
	cmp DWORD PTR [ebp+12], 1 # no point with only one element 
	je finish 
	
	mov edi, DWORD PTR [ebp+16] # number whose index we need to find
	mov esi, DWORD PTR [ebp+12] # number of elements in array
	mov ebx, DWORD PTR [ebp+8]  # array start address
	
	dec esi # (n-1) 
	mov ecx, 0 # counter that will go through array, i = 0
	mov eax, -1 # if given number is not in array, for error flag is -1
	
findIndex:
	cmp ecx, esi # for (i = 0; i < n - 1; i++)
	je finish
	
	mov edx, DWORD PTR [ebx+4*ecx]
	cmp edx, edi # n[i] == x
	jne nextElement
	
	mov eax, ecx # eax = n[i], n[i] is where x is discovered
	
nextElement:
	inc ecx
	jmp findIndex
	
finish:
	push esi # leave stack registers in untouched condition
	push edi
	push ebx
	push ebp

	leave
	ret
.end

