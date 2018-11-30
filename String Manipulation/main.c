
#include <stdio.h>

long get_age(void);

void main () {
    long age;
    
    age = get_age();
    printf("You are at least %ld years old.\n", age);
    return;
    printf("You are at least %ld years old and you look like it too.\n", age);
}

