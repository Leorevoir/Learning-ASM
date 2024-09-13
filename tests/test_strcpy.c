/*
** EPITECH PROJECT, 2024
** asm
** File description:
** test_strcpy
*/

#include <string.h>
#include <stdio.h>

char *_strcpy(char *__restrict__ __dest, const char *__restrict__ __src);

int main(void)
{
    char __dest[32] = "Hello !!!";
    char __test[32] = "Hello !!!";
    char __src[] = "World!";

    strcpy(__test, __src);
    _strcpy(__dest, __src);
    if (strcmp(__dest, __test) != 0) {
        fprintf(stderr, "Error:\n\t_strcpy returns %s but excpected %s\n",
        __dest, __test);
    }
    return 0;
}
 