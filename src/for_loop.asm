section .data
    num db 'OK '
    len equ $ - num

section .text
    extern exit

%macro print_number 0
    pusha
    mov eax, 4                ; sys_write system call
    mov ebx, 1                ; stdout file descriptor
    mov ecx, num              ; endereço do número a ser impresso
    mov edx, len              ; tamanho do número
    int 0x80                  ; chamar a syscall
    popa
%endmacro
    
%macro for_loop 4
    pusha
    .loopfor:
        %2                  ; comparação do for
        je .end_loop        ; sair do loop se a comparação for falsa
        %4                  ; corpo do for
        %3                  ; incrementação do for
        jmp .loopfor
        .end_loop:
    popa
%endmacro

%macro compare 0
    cmp ebx, 10
%endmacro

%macro incremento 0
    inc ebx
%endmacro

global _start
section .text
_start:
    mov ebx, 0              ; contador de loop

    for_loop ebx, compare,  incremento, print_number

    mov eax, 1               ; código de saída para o sistema operacional
    xor ebx, ebx
    int 0x80
