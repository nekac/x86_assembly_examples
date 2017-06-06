// nn.lice
// bubbleSort implementation for array of n emenents

// main code that will call arraySort(array[], n) function

#include <stdio.h>

extern int array_start;
extern int array_end;

extern arraySort(int array[], int n);

int main(){
	
	int n = ((&array_end) - (&array_start)); // size of array 

	arraySort(&array_start, n);
	
	int i = 0;
	for(i; i < n; ++i){
		printf("%i \n", *(&array_start + i));
	}	
	
	return 0;
}
