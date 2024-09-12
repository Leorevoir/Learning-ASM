/*
** EPITECH PROJECT, 2024
** asm
** File description:
** test_strcat
*/

#include <stdio.h>
#include <string.h>

extern char *_strcat(char *__restrict__ dest, const char *__restrict__ *src);


int main(void)
{
    char __dest[32] = "Hello, ";
    char __test[32] = "Hello, ";
    char __src[] = "World!";

    _strcat(__dest, __src);
    strcat(__test, __src);
    if (strcmp(__dest, __test) != 0) {
        fprintf(stderr, "Error:\n\t_strcat returns %s but expected %s\n",
            __dest, __test);
    }
    return 0;
}
