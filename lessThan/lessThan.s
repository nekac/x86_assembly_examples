# nn.lice
# prog: Remove all elements that are less than given element (cdecl convention)

# int lessThan(int array[], int n, int x)
# array[] - array of elements that are initial given in init.s 
# n - number of elements in array
# x - number for comparation

.intel_syntax noprefix
.arch i386

#============================================================================================
	.data 
.global output_format
output_format:
	.asciz "%i "
	
#============================================================================================
	.text
.global lessThan

lessThan:
	enter 0, 0
	
	push ebp
	push ebx
	push edi
	push esi
	
	cmp DWORD PTR [ebp+12], 1 # only one element in array
	je finish
	
	mov ebx, [ebp+8]  # start address
	mov edi, [ebp+12] # num of elements
	mov edx, [ebp+16] # num for compare
	mov esi, 0 # counter i = 0
	
comparation:
	cmp esi, edi 
	je finish
	
	cmp [ebx+4*esi], edx # if (next < edx) => remove from array
	jge nextElement
	
	mov ecx, esi # current counter
	
shiftLoop:
	cmp ecx, edi
	je decreaseArray
	
	mov eax, [ebx+4*ecx+4]
	mov [ebx+4*ecx], eax
	
	inc ecx
	jmp shiftLoop
	
decreaseArray:
	dec edi
	jmp comparation
	
nextElement:
	inc esi
	jmp comparation
	
finish:
	
	mov eax, edi # new size of array
	
	push esi
	push edi
	push ebx
	push ebp
	
	leave
	ret
.end
