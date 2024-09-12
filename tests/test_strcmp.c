/*
** EPITECH PROJECT, 2024
** asm
** File description:
** test_strcmp
*/

#include <stdio.h>
#include <string.h>

extern int _strcmp(const char *__s1, const char *__s2);

int main(void)
{
    const char *first = "Hello, world!";
    const char *second = "Helld, world!";
    const int test1 = _strcmp(first, first);
    const int test2 = _strcmp(first, second);

    if (strcmp(first, first) != test1) {
        fprintf(stderr, "Error:\n\t_strcmp did not return the right value\
 if both strings are the equal.\n\texpected:\t0\n\tgot\t%d\n", test1);
        return 84;
    }
    if (strcmp(first, second) != test2) {
        fprintf(stderr, "Error:\n\t_strcmp did not return the right value\
 if both strings are differents.\n\texpected:\t11\n\tgot\t%d\n", test2);
        return 84;
    }
    return 0;
}
