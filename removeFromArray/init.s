# nn.lice
# removeFromArray implementation for array of n emenents

# this code initialize array of six elements (it can be changed for any size of array)

.intel_syntax noprefix
.arch i386

#============================================================================================
	.data
.global array_start
.global array_end

array_start:
	.long 4
	.long 2
	.long 7
	.long 3
	.long 2
	.long 5
array_end:
.end
