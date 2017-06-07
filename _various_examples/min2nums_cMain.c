// prog: Pronalazenje minimuma dva broja (c fajl sa main programom)
// nn.lice

#include <stdio.h>

extern char izlazni_format;
extern char ulazni_format;

int __attribute__((stdcall)) min(int x, int y);

int main(){
	int x, y, rez;
	scanf(&ulazni_format, &x, &y);
	rez = min(x,y);
	printf(&izlazni_format, x, y, rez);
	return 0;
}