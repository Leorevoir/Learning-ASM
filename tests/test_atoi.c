/*
** EPITECH PROJECT, 2024
** Learning-ASM
** File description:
** test_atoi
*/

#include <stdlib.h>
#include <stdio.h>

extern int _atoi(const char *str);

int main(void)
{
    const char *test_cases[] = {
        "123", "-456", "   789", "+42", "2147483647", "-2147483648",
        "0", "42abc", "", "   -00123abc", NULL
    };
    int expected = 0;
    int result = 0;

    for (int i = 0; test_cases[i] != NULL; i++) {
        const char *str = test_cases[i];
        expected = atoi(str);
        result = _atoi(str);
        if (result != expected) {
            fprintf(stderr, "Error:\n\t_atoi(\"%s\") returns %d but expected %d\n",
                str, result, expected);
            return 84;
        }
        printf("result: %d\n", result);
        printf("expected: %d\n", expected);
    }

    return 0;
}
