// nn.lice
// rotate implementation for array of n emenents

// main code that will call rotate(array[], n, x) function

#include <stdio.h>

extern int array_start;
extern int array_end;

extern void __attribute__((stdcall)) rotate(int array[], int n, int x);

int main(){
	
	int n, x, i;
	
	x = 3; // num of rotations is changing when testing

	n = ((&array_end) - (&array_start));

	rotate(&array_start, n, x);
	
	for(i=0;i<n;i++){
		printf("%i ", *(&array_start + i));
	}

	printf("\n");
	
	return 0;
	
}
