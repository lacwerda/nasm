section .data
    ; Coloque aqui quaisquer dados estáticos que você precise

section .text
    global _start

    ; Função para imprimir um número inteiro
    print_number:
        mov eax, 4
        mov ebx, 1
        mov ecx, num_buffer
        mov edx, 1
        int 0x80
        ret

section .data
    num_buffer db 0

section .text
_start:
    ; Coloque aqui o código de inicialização do programa

    ; Macro FOR_LOOP
    %macro FOR_LOOP 4
        mov %1, %2
        cmp %1, %3  ; compara parametros 1 e 3
        ; vai pro final do loop caso parametro 1 seja maior que parametro 3
        jg %%end_loop

        %%loop:
            ; Coloque aqui o código que você deseja executar no loop
            mov eax, 1
            call print_number  ; imprime o numero no buffer

            add %1, %4  ; soma parametros 1 e 4
            cmp %1, %3  ; compara parametros 1 e 3
            ; vai pro comeco do loop caso parametro 1 seja menor ou igual que parametro 3
            jle %%loop 

        %%end_loop:
    %endmacro

    ; Chamada da macro FOR_LOOP
    FOR_LOOP ecx, 1, 10, 1

    ; Coloque aqui o restante do seu código

    ; Termina o programa
    mov eax, 1
    xor ebx, ebx
    int 0x80
