/*
** EPITECH PROJECT, 2024
** asm
** File description:
** test_strlen
*/

#include <stdio.h>
#include <string.h>

extern size_t _strlen(const char *str);

static _Bool easy_test(void)
{
    const char *str1 = "Hello World!";
    size_t custom = _strlen(str1);
    size_t standard = strlen(str1);

    if (custom != standard) {
        fprintf(stderr, "Error:\n\t_strlen(\"%s\") returned %ld,\
but expected %ld\n", str1, custom, standard);
        return 0;
    }
    return 1;
}

static _Bool medium_test(void)
{
    const char *str2 = "";
    size_t custom = _strlen(str2);
    size_t standard = strlen(str2);

    if (custom != standard) {
        fprintf(stderr, "Error:\n\t_strlen(\"%s\") returned %ld,\
but expected %ld\n", str2, custom, standard);
        return 0;
    }
    return 1;
}

static _Bool hard_test(void)
{
    const char *str3 = "   !@#$%^&*()";
    size_t custom = _strlen(str3);
    size_t standard = strlen(str3);

    if (custom != standard) {
        fprintf(stderr, "Error:\n\t_strlen(\"%s\") returned %ld,\
but expected %ld\n", str3, custom, standard);
        return 0;
    }
    return 1;
}

int main(void)
{
    if (!easy_test()) {
        return 84;
    }
    if (!medium_test()) {
        return 84;
    }
    if (!hard_test()) {
        return 84;
    }
    return 0;
}
