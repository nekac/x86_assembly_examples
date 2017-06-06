// nn.lice
// getIndex implementation for array of n emenents

// main code that will call getIndex(array[], n, x) function

#include <stdio.h>

extern int array_start;
extern int array_end;

extern int getIndex(int array[], int n, int x);

int main() {
	
	int n = ((&array_end) - (&array_start));
	int x; // number for search 
	int i = 0; 
	int lastIndex;
	
	printf("\nArray: \n");
	for(i = 0; i < n; i++){
		printf("%i ", *(&array_start + i));
	}
	
	printf("\n");
	
	printf("Please enter number whose index in array will be search: ");
	scanf("%i", &x);
	
	lastIndex = getIndex(&array_start, n, x);
	
	if(lastIndex != -1){
		printf("Last possition of searched number in array is: %i", lastIndex);
	} else {
		printf("Number that was entered can not be find in array!");
	}
	
	printf("\n");
	
	return 0;
}