// Programa que chama rotina em NASM para execução de biblioteca em C.
#include <stdio.h>

extern char* system_info(void);

int main(int argc, char* argv[]) {

    char* uname_x64linux = system_info();
    printf("%s\n", uname_x64linux);
    return 0;
}
