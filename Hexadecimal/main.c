
#include <stdio.h>

void hex_str(unsigned int, char *);

#define NUM_TESTS 11

unsigned int tests[NUM_TESTS] = {
         1,
        34,
       819,
     17476,
    349525,
   6710886,
 125269879,
  19088743,
2309737967,
3735928559,
3235822174};


void main () {
    int i;
    char result[11];

    for (i = 0; i < NUM_TESTS; i++) {
        hex_str(tests[i], result);
        printf("%10u = %s\n", tests[i], result);
    }
    return;
}

