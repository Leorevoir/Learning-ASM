/*
** EPITECH PROJECT, 2024
** Learning-ASM
** File description:
** test_evil_str
*/

#include <stdlib.h>
#include <string.h>
#include <stdio.h>

extern char *_evil_str(char *str);

/*
 * one of my first C function, an old one
 * wanted to use the original old one
 * and rewrite it in x86-64 assembly
 */
static char *evil_str(char *str)
{
    int leng = strlen(str);
    char temp = ' ';
    int i = 0;

    if (!str) {
        return (str);
    }
    for (i = 0; i < leng / 2; i++) {
        temp = str[i];
        str[i] = str[leng - 1 - i];
        str[leng - 1 - i] = temp;
    }
    return (str);
}


int main(void)
{
    const char *test = "abcdef";
    char *result = NULL;
    char *expected = NULL;

    result = strdup("abcdef");
    expected = strdup("abcdef");
    _evil_str(result);
    evil_str(expected);
    if (strcmp(result, expected) != 0) {
        fprintf(stderr, "Error:\n\t_evil_str returned \"%s\"\n\
        but excpected \"%s\"\n", result, expected);
        free(result);
        free(expected);
        return 84;
    }
    printf("result: %s\n", result);
    printf("expected: %s\n", expected);
    free(result);
    free(expected);
    return 0;
}
