/*
** EPITECH PROJECT, 2024
** asm
** File description:
** test_print
*/

#include <unistd.h>
#include <string.h>
#include <stdio.h>

extern ssize_t _print(const char *string);

int main(void)
{
    const char *string = "Hello World!\n";
    ssize_t result = _print(string);
    ssize_t expected = write(1, string, strlen(string));

    if (result != expected) {
        fprintf(stderr, "Error:\n\t_print(\"%s\") returned %ld,\
        but expected %ld\n", string, result, expected);
        return 84;
    }
    printf("result: %ld\n", result);
    printf("expected: %ld\n", expected);
    return 0;
}
