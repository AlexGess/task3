#include <cstdio>
#include <cstdint>
#include <cstddef>

extern "C" {
char * my_strtok_r(char *str, const char *delim, char **saveptr);
}


int main(void) {

    static char str[] = "The end of each     token is found by scanning forward";
    char *t_str, *saveptr;
    size_t len, i;

    const char *delimiters = " ";

    t_str = my_strtok_r(str, delimiters, &saveptr);

    for (i = 0; t_str; ++i) {
        len = saveptr - t_str - 1;
        printf("%zu: %s\n", len, t_str);
        t_str = my_strtok_r(NULL, delimiters, &saveptr);
    }
    printf("total: %zu\n", i);

    return 0;
}
