// prog: Pronalazenje minimuma dva broja (c fajl sa programom)
// nn.lice

// funcija za izracunavanje minimuma dva broja u C jeziku
int __attribute__((stdcall)) minimum(int a, int b) {
	return a < b ? a : b; // daje minimum
}