
#include <stdio.h>

unsigned int sqrt(unsigned int);

void main () {
    unsigned int i;
	int d = 16129;
	int e = 16384;
	int f = 65536;
    for (i = 0; i < 200; i++) {
        printf("The integer square root of %u is %u.\n", i, sqrt(i));
    }

	printf("The integer square root of %u is %u.\n", d, sqrt(d));
	printf("The integer square root of %u is %u.\n", e, sqrt(e));
	printf("The integer square root of %u is %u.\n", f, sqrt(f));
    return;
}

