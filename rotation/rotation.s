# nn.lice
# Prog: array elements rotation (stdcall convention for call)

# void rotate(int array[], int n, int x)
# array[] - start address of array that need to be rotated
# n - number of elements in array
# x - number of rotations

.intel_syntax noprefix
.arch i386

#============================================================
	.text
.global rotate

rotate:
	
	enter 4, 0
	
	push ebp
	push ebx
	push esi
	push edi
	
	cmp DWORD PTR [ebp+12], 1 # only one number in array
	je finish
	
	mov ebx, [ebp+8]  # array start address 
	mov edi, [ebp+12] # num of elements
	mov esi, [ebp+16] # num of rotations
	mov DWORD PTR [ebp-4], 0 # rotations counter
	
rotation:
	
	cmp [ebp-4], esi # if all rotations are finished
	je finish

	mov ecx, 1 # num of elements counter, restart counter
	mov edx, [ebx+0] # edx = first_element
	
shiftElements:
		
	cmp ecx, edi
	je nextRotation
	
	mov eax, [ebx+4*ecx]
	mov [ebx+4*ecx-4], eax
	inc ecx
	jmp shiftElements

nextRotation:
	mov DWORD PTR [ebx+4*edi-4], edx # put on last place
	inc DWORD PTR [ebp-4]
	jmp rotation
	
finish: 

	push edi
	push esi
	push ebx
	push ebp
	
	leave
	ret 12 # remove parameters (stdcall)
.end
