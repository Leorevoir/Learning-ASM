/*
** EPITECH PROJECT, 2024
** asm
** File description:
** test_strcpy
*/

#include <string.h>
#include <stdio.h>

extern char *_strcpy(char *__restrict__ __dest, const char *__restrict__ __src);

static _Bool easy_test(void)
{
    char dest[64];
    char test[64];

    strcpy(test, "Hello World!");
    _strcpy(dest, "Hello World!");
    if (strcmp(dest, test) != 0) {
        fprintf(stderr, "Error:\n\t_strcpy returned %s but expected %s\n",
            dest, test);
        return 0;
    }
    return 1;
}

static _Bool medium_test(void)
{
    char dest[64];
    char test[64];
    
    strcpy(test, "");
    _strcpy(dest, "");
    if (strcmp(dest, test) != 0) {
        fprintf(stderr, "Error:\n\t_strcpy returned %s but expected %s\n",
            dest, test);
        return 0;
    }
    return 1;
}

static _Bool hard_test(void)
{
    char dest[64];
    char test[64];
    
    strcpy(test, "A very long string that will be copied properly.");
    _strcpy(dest, "A very long string that will be copied properly.");
    if (strcmp(dest, test) != 0) {
        fprintf(stderr, "Error:\n\t_strcpy returned %s but expected %s\n",
            dest, test);
        return 0;
    }
    return 1;
}

int main(void)
{
    if (!easy_test()) {
        return 84;
    }
    if (!medium_test()) {
        return 84;
    }
    if (!hard_test()) {
        return 84;
    }
    return 0;
}
