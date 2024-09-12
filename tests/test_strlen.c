/*
** EPITECH PROJECT, 2024
** luna
** File description:
** test_strlen
*/

#include <stdio.h>
#include <string.h>

extern size_t _strlen(const char *str);

int main(void)
{
    const char *str = "Hello World!";
    size_t custom = _strlen(str);
    size_t standard = strlen(str);

    if (custom != standard) {
        fprintf(stderr, "[TEST]\tError:\n\tstrlen returned %ld, but _strlen returned %ld\n",
            standard, custom);
        return 84;
    }
    return 0;
}
