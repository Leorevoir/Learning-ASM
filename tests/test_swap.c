/*
** EPITECH PROJECT, 2024
** Learning-ASM
** File description:
** test_swap
*/

#include <stdlib.h>
#include <string.h>
#include <stdio.h>

extern void _swap(char *str1, char *str2);

/*
 * check for the core dump
 */
static void easy_test(void)
{
    char *str1 = NULL;
    char *str2 = NULL;

    _swap(str1, str2);
}

_Bool medium_test(void)
{
    const char *test = "Hello";
    const char *test2 = "World";
    char *str1 = strdup(test);
    char *str2 = strdup(test2);

    _swap(str1, str2);
    if (strcmp(str1, "World") != 0 || strcmp(str2, "Hello") != 0) {
        fprintf(stderr, "[TEST]\tError:\n\tStrings are not swapped\n");
        return 1;
    }
    printf("result: %s -> %s\n", str1, str2);
    printf("expected: World -> Hello\n");
    free(str1);
    free(str2);
    return 0;
}

int main(void)
{
    easy_test();
    if (medium_test()) {
        return 84;
    }
    return 0;
}
