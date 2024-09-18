/*
** EPITECH PROJECT, 2024
** asm
** File description:
** test_print
*/

#include <stdio.h>

extern void _print(const char *string);

/*
 * as it is a basic write(1, str, strlen(str)), i am too lazy to write a test
 * for it so i just checked if it compiled with the right output and it did lmao
 */
int main(void)
{
    const char *string = "Hello World!\n";

    _print(string);
    return 0;
}
