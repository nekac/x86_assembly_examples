// nn.lice
// removeFromArray implementation for array of n emenents

// main code that will call removeFromArray(array[], n, x) function

#include <stdio.h>

extern int array_start;
extern int array_end;

extern int removeFromArray(int array[], int n, int x);

int main(){
	
	int n, i, x, num;
	
	n = ((&array_end) - (&array_start));
	
	printf("\nInitial array: \n");
	for(i = 0; i < n; i++){
		printf("%i ", *(&array_start + i));
	}
	
	printf("\n");
	
	printf("Insert number that will be removed from array:");
	scanf("%i", &x);

	num = removeFromArray(&array_start, n, x);
	
	printf("Array after removing element/s: \n");
	for(i = 0; i < (n-num); i++){
		printf("%i ", *(&array_start + i));
	}
	
	printf("\n");
	
	printf("Number of removed elements: %i\n", num);
	
	printf("\n");
	
	return 0;
	
}