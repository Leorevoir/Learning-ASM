/*
** EPITECH PROJECT, 2024
** asm
** File description:
** test_strncmp
*/

#include <stdio.h>
#include <string.h>

extern int _strncmp(const char *s1, const char *s2, size_t n);

static _Bool easy_test(void)
{
    const char *str1 = "Hello";
    const char *str2 = "Hello";
    int result = _strncmp(str1, str2, 5);
    int expected = strncmp(str1, str2, 5);

    if (result != expected) {
        fprintf(stderr, "Error:\n\t_strncmp(\"%s\", \"%s\", 5)\
returned %d but expected %d\n",
                str1, str2, result, expected);
        return 0;
    }
    printf("result: %d\n", result);
    printf("expected: %d\n", expected);
    return 1;
}

static _Bool medium_test(void)
{
    const char *str1 = "Hello";
    const char *str2 = "Hellp";
    int result = _strncmp(str1, str2, 4); 
    int expected = strncmp(str1, str2, 4);

    if (result != expected) {
        fprintf(stderr, "Error:\n\t_strncmp(\"%s\", \"%s\", 4)\
returned %d but expected %d\n", str1, str2, result, expected);
        return 0;
    }
    result = _strncmp(str1, str2, 5);
    expected = strncmp(str1, str2, 5);
    if (result != expected) {
        fprintf(stderr, "Error:\n\t_strncmp(\"%s\", \"%s\", 5)\
returned %d but expected %d\n", str1, str2, result, expected);
        return 0;
    }
    printf("result: %d\n", result);
    printf("expected: %d\n", expected);
    return 1;
}

static _Bool hard_test(void)
{
    const char *str1 = "Hello World!";
    const char *str2 = "Hello";
    int result = _strncmp(str1, str2, 10);
    int expected = strncmp(str1, str2, 10);

    if (result != expected) {
        fprintf(stderr, "Error:\n\t_strncmp(\"%s\", \"%s\", 10)\
returned %d but expected %d\n", str1, str2, result, expected);
        return 0;
    }
    printf("result: %d\n", result);
    printf("expected: %d\n", expected);
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
