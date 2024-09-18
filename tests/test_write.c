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

/*
 * as it is a basic write(1, &char, 1), i am too lazy to write a test
 * for it so i just checked if it compiled with the right output and it did lmao
 */
int main(void)
{
    const char *str = "Hello, World!\n";
    ssize_t real = write(1, str, strlen(str));
    ssize_t custom = _write(1, str, strlen(str));

    if (real != custom) {
        fprintf(stderr, "[TEST]\tError:\n\twrite returned %ld, but _write returned %ld\n",
            real, custom);
        return 84;
    }
    return 0;
}
