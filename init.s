# nn.lice
# arraySum implementation for array of n emenents

# this code initialize array of 100 elements with some repetition values (it can be changed for any size of array)

.intel_syntax noprefix
.arch i386

#============================================================================================

.global array_start
.global array_end

array_start:
.rep 32
	.long 2, 5, 7
.endr
	.long 6
	.long 9
	.long 3
	.long 8
array_end:

.end
