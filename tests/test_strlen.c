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
    size_t result = _strlen(str1);
    size_t expected = strlen(str1);

    if (result != expected) {
        fprintf(stderr, "Error:\n\t_strlen(\"%s\") returned %ld,\
but expected %ld\n", str1, result, expected);
        return 0;
    }
    printf("result: %ld\n", result);
    printf("expected: %ld\n", expected);
    return 1;
}

static _Bool medium_test(void)
{
    const char *str2 = "";
    size_t result = _strlen(str2);
    size_t expected = strlen(str2);

    if (result != expected) {
        fprintf(stderr, "Error:\n\t_strlen(\"%s\") returned %ld,\
but expected %ld\n", str2, result, expected);
        return 0;
    }
    printf("result: %ld\n", result);
    printf("expected: %ld\n", expected);
    return 1;
}

static _Bool hard_test(void)
{
    const char *str3 = "   !@#$%^&*()";
    size_t result = _strlen(str3);
    size_t expected = strlen(str3);

    if (result != expected) {
        fprintf(stderr, "Error:\n\t_strlen(\"%s\") returned %ld,\
but expected %ld\n", str3, result, expected);
        return 0;
    }
    printf("result: %ld\n", result);
    printf("expected: %ld\n", expected);
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
