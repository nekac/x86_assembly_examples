// nn.lice
// getIndex implementation for array of n emenents

// main code that will call getIndex(array[], n, x) function

#include <stdio.h>

extern int array_start;
extern int array_end;
extern char output_format;

extern int lessThan(int array[], int n, int x);

int main() {
	
	int n = ((&array_end) - (&array_start));
	int x; // number for compare
	int i = 0;
	int arraySize;
	
	printf("\nArray: \n");
	for(i = 0; i < n; i++){
		printf(&output_format, *(&array_start + i));
	}
	
	printf("\n");
	
	printf("Please enter number, bellow it all elements will be removed from array... \n");
	scanf("%i", &x);
	
	arraySize = lessThan(&array_start, n, x);
	
	printf("Array after removing: \n");
	for(i = 0; i < arraySize; i++){
		printf(&output_format, *(&array_start + i));
	}
	
	printf("\n");
	
	return 0;
}