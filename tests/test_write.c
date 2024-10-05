/*
** EPITECH PROJECT, 2024
** luna
** File description:
** test_write
*/

#include <stdio.h>
#include <unistd.h>
#include <string.h>

extern ssize_t _write(int fd, const void *buf, size_t count);

int main(void)
{
    const char *str = "Hello, World!\n";
    ssize_t result = write(1, str, strlen(str));
    ssize_t expected = _write(1, str, strlen(str));

    if (result != expected) {
        fprintf(stderr, "[TEST]\tError:\n\twrite returned %ld, but _write returned %ld\n",
            result, expected);
        return 84;
    }
    printf("result: %ld\n", result);
    printf("expected: %ld\n", expected);
    return 0;
}
