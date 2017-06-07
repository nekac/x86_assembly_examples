# nn.lice
# prog: Remove from array all appearance of given number, and return how many are in array (cdecl convention)

# int removeFromArray(int array[], int n, int x)
# array[] - array of elements that are initial given in init.s 
# n - number of elements in array
# x - number that need to be remove from array 

.intel_syntax noprefix
.arch i386

#============================================================================================
	.text
.global removeFromArray

removeFromArray:
	
	enter 8,0 # two local variables, 8B space on stack is used
	
	push ebp
	push ebx
	push edi
	push esi
	
	cmp DWORD PTR [ebp+16], 0 # no elements in array
	je finish
	
	mov edx, [ebp+16] # number that need to be removed
	mov esi, [ebp+12] # number of elements in array
	mov ebx, [ebp+8]  # array start address
	
	mov DWORD PTR  [ebp-4], 0 # inital thre is 0 elements with requested value in array, in eax will be returned
	mov [ebp-8], esi # number of elements in array, secon loop
	mov edi, 0 # counter, i = 0
	
findElement:
	cmp edi, esi # for (i = 0; i < n; i++)
	je finish
	
	cmp edx, [ebx+4*edi]
	jne nextElement
	
	inc DWORD PTR  [ebp-4] # increment counter where we save number of elements that are equal with searched
	mov ecx, edi 
	
# this for loop shift each element to left, start after that one we find	
shiftElements:	
	cmp ecx, [ebp-8] # for (j = edi; j < n; j++)
	je nextElementShift
	
	mov eax, [ebx+4*ecx+4] # eax = n[i+1]
	mov [ebx+4*ecx], eax   # n[i] = eax 
	
	inc ecx
	jmp shiftElements
	
# in this part n is decremented because element was removed, array is for one element smaller	
nextElementShift:
	# edi isn't increment because new element is on that old possition
	dec esi					# n is using here
	dec DWORD PTR [ebp-8]	# and here also
	jmp findElement
	
nextElement:
	inc edi
	jmp findElement
	
finish:
	mov eax, [ebp-4] # return value for function

	push esi
	push edi
	push ebx
	push ebp

	leave
	ret
.end
