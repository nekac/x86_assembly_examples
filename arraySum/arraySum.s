# nn.lice
# prog: Sum all elements in array and display result (stdcall convention)

# int arraySum(array[], int n);
# array[] - array of elements that are initial given in init.s 
# n - number of elements in array

.intel_syntax noprefix
.arch i386

#============================================================================================
	.data 
.global output_format
output_format:
	.asciz "Sum of all numbers in array is: %i\n" # format for display result

#============================================================================================
	.text
.global arraySum

arraySum:
	
	enter 4,0 # acumulate result on stack and then get that into eax
	
	# beacause of convention some registers need to be saved after function call (just prevention)
	push ebp
	push ebx
	push edi
	push esi
	
	cmp DWORD PTR [ebp+12], 0 # there is nothing to calculate
	je finish
	
	mov ebx, DWORD PTR [ebp+8]  # array start address
	mov esi, DWORD PTR [ebp+12] # num of elements in array 
	mov edi, 0 	   # counter, i = 0
	mov DWORD PTR [ebp-4], 0 # sum start value, sum = 0
	
calculate:
	cmp edi, esi # for ( i = 0; i < n; i++)
	je finish
	
	mov edx, DWORD PTR [ebx+4*edi]
	add DWORD PTR [ebp-4], edx # add new element on current sum, sum += n[i]
	
	inc edi
	jmp calculate
	
finish:
	
	mov eax, [ebp-4] # final sum of elements in array
	
	push esi
	push edi
	push ebx
	push ebp
	
	leave
	ret 8 # because there are two arguments in function call
.end
