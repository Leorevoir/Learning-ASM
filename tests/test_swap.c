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

int main(void)
{
    char *str1 = malloc(10);
    char *str2 = malloc(10);

    strcpy(str1, "Hello");
    strcpy(str2, "World");
    _swap(str1, str2);
    if (strcmp(str1, "World") != 0 || strcmp(str2, "Hello") != 0) {
        fprintf(stderr, "[TEST]\tError:\n\tStrings are not swapped\n");
        return 84;
    }
    free(str1);
    free(str2);
    return 0;
}