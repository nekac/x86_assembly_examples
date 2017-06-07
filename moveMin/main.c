// nn.lice
// moveMin implementation for array of n emenents

// main code that will call moveMin(array[], n) function

#include <stdio.h>

extern int array_start;
extern int array_end;

extern __attribute__((stdcall)) moveMin(int array[], int n);

int main() {
	
	int n = ((&array_end) - (&array_start));
	int i = 0; 
	int j = 0;
	
	printf("\nArray: \n");
	for(i = 0; i < n; i++){
		printf("%i ", *(&array_start + i));
	}
	
	moveMin(&array_start, n);
	
	printf("\nArray after moving: \n");
	for(j = 0; j < n; j++){
		printf("%i ", *(&array_start + j));
	}
	
	printf("\n\n");
	
	return 0;
}
