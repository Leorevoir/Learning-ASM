/*
** EPITECH PROJECT, 2024
** asm
** File description:
** test_strcmp
*/

#include <stdio.h>
#include <string.h>

extern int _strcmp(const char *__s1, const char *__s2);

static _Bool easy_test(void)
{
    const char *str1 = "Hello";
    const char *str2 = "Hello";
    int result = _strcmp(str1, str2);

    if (result != 0) {
        fprintf(stderr, "Error:\n\t_strcmp(\"%s\",\
\"%s\") returned %d but expected 0\n", str1, str2, result);
        return 0;
    }
    printf("result: %d\n", result);
    printf("expected: %d\n", result);
    return 1;
}

static _Bool medium_test(void)
{
    const char *str1 = "Hello";
    const char *str2 = "Hellp";
    int result = _strcmp(str1, str2);

    if (result >= 0) {
        fprintf(stderr, "Error:\n\t_strcmp(\"%s\",\
\"%s\") returned %d but expected a negative value\n", str1, str2, result);
        return 0;
    }
    printf("result: %d\n", result);
    printf("expected: %d\n", result);
    return 1;
}

static _Bool hard_test(void)
{
    const char *str1 = "Hello World!";
    const char *str2 = "Hello";
    int result = _strcmp(str1, str2);

    if (result <= 0) {
        fprintf(stderr, "Error:\n\t_strcmp(\"%s\",\
\"%s\") returned %d but expected a positive value\n", str1, str2, result);
        return 0;
    }
    printf("result: %d\n", result);
    printf("expected: %d\n", result);
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
