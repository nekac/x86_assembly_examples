# nn.lice
# rotate implementation for array of n emenents

# this code initialize array of six elements (it can be changed for any size of array)

.intel_syntax noprefix
.arch i386

#========================================================================
	.data
.global array_start;
.global array_end;

array_start:
	.long 1
	.long 2
	.long 3
	.long 4
	.long 5
	.long 6
array_end:
.end
