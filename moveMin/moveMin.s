# nn.lice
# prog: Move all min elements in array at start of array (stdcall convention)

# void moveMin(int array[], int n)
# array[] - array of elements that are initial given in init.s 
# n - number of elements in array

.intel_syntax noprefix
.arch i386

#============================================================================================
	.text
.global moveMin

moveMin:
	enter 0, 0
	
	push ebp
	push ebx
	push edi
	push esi
	
	cmp DWORD PTR [ebp+12], 1 # only one element in array
	je finish
	
	mov edi, [ebp+12] # num of elements 
	mov ebx, [ebp+8]  # array start address
	mov esi, 1 # counter, i = 1
	mov ecx, 0 # current number position, j = 0
	mov edx, [ebx + 0] # on start first element is announced as min, in edx is always min value
	
findMin:
	cmp esi, edi # for (i = 1; i < n; i++)
	je moveElement
	
	mov eax, [ebx+4*esi] # in eax is value of next element
	
	cmp eax, edx # if (next < current) => next is minimum
	jge nextElement 
	
	mov edx, eax # edx = current_min
	
nextElement:
	inc esi
	jmp findMin

	
# here we know that in edx is min value in array, now compare every element with min and exchange is necessary
moveElement:
	cmp ecx, edi # for (j = 0; j < n; j++)
	je finish
	
	cmp edx, [ebx+4*ecx] # if (edx == n[j])
	jne nextPosition
	
	mov esi, ecx # index position, esi is now use for other purpose

shifElements:
	cmp esi, 0 # min is already on first position
	je putOnFirst
	
	mov eax, [ebx+4*esi-4]
	mov [ebx+4*esi], eax 
	
	dec esi
	jmp shifElements

putOnFirst:
	mov [ebx + 0], edx

nextPosition:
	inc ecx
	jmp moveElement
	
finish:
	push esi
	push edi
	push ebx
	push ebp
	
	leave
	ret 8 # function call have two arguments 
.end
