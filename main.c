// nn.lice
// arraySum implementation for array of n emenents

// main code that will call arraySum(array[], n) function

#include <stdio.h>

extern int array_start;
extern int array_end;
extern char output_format; // from arraySum.s data section

extern int __attribute__((stdcall)) arraySum(int array[], int n);


int main(){
	
	int n, i, sum;
	
	n = ((&array_end) - (&array_start));
	
	printf("\nArray for calculation:\n");
	for(i = 0; i < n; i++){
		printf("%i ", *(&array_start + i));
	}
	
	printf("\n");
	
	sum = arraySum(&array_start, n);
	
	printf(&output_format, sum);

	printf("\n");
	
	return 0;
	
}
