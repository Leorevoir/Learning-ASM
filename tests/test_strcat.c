/*
** EPITECH PROJECT, 2024
** asm
** File description:
** test_strcat
*/

#include <stdio.h>
#include <string.h>

extern char *_strcat(char *__restrict__ dest, const char *__restrict__ src);

static _Bool easy_test(void)
{
    char dest[64];
    char test[64];
    
    strcpy(dest, "Hello, ");
    strcpy(test, "Hello, ");
    _strcat(dest, "World!");
    strcat(test, "World!");
    if (strcmp(dest, test) != 0) {
        fprintf(stderr, "Error:\n\t_strcat(\"Hello, \",\
\"World!\") returned %s but expected %s\n",
            dest, test);
        return 0;
    }
    return 1;
}

static _Bool medium_test(void)
{
    char dest[64];
    char test[64];
    
    strcpy(dest, "Hello, ");
    strcpy(test, "Hello, ");
    _strcat(dest, "");
    strcat(test, "");
    if (strcmp(dest, test) != 0) {
        fprintf(stderr, "Error:\n\t_strcat(\"Hello, \",\
\"\") returned %s but expected %s\n", dest, test);
        return 0;
    }
    strcpy(dest, "");
    strcpy(test, "");
    _strcat(dest, "Hello");
    strcat(test, "Hello");
    if (strcmp(dest, test) != 0) {
        fprintf(stderr, "Error:\n\t_strcat(\"\",\
\"Hello\") returned %s but expected %s\n", dest, test);
        return 0;
    }
    return 1;
}

static _Bool hard_test(void)
{
    char dest[64];
    char test[64];
    
    strcpy(dest, "1234567890");
    strcpy(test, "1234567890");
    _strcat(dest, "abcdefghij");
    strcat(test, "abcdefghij");
    if (strcmp(dest, test) != 0) {
        fprintf(stderr, "Error:\n\t_strcat(\"1234567890\",\
\"abcdefghij\") returned %s but expected %s\n", dest, test);
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
