/*
** EPITECH PROJECT, 2024
** asm
** File description:
** test_print
*/

#include <stdio.h>

extern void _print(const char *string);

int main(void)
{
    const char *string = "Hello World!\n";

    _print(string);
    return 0;
}
