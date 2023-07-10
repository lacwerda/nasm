section .data
    sys_uname equ 63 ; codigo do comando 'uname' do linux x64
    buf_size equ 65  ; atribui o valor 65 à variável buf_size 
    nl equ 10        ; código do caracter de quebra de linha

section .bss
    buffer resb buf_size ; aloca 65 bytes de memória para o buffer

section .text
    global system_info

system_info:

    mov eax, sys_uname ; copia o codigo de 'uname' para o registrador eax
    mov rdi, buffer    ; copia o endereço do buffer para o registrador rdi
    xor rsi, rsi       ; zera o registrador rsi
    xor rdx, rdx       ; zera o registrador rdx
    syscall            ; faz a chamada de sistema executando o comando 'uname'


    add byte [rdi+buf_size-2], nl ; adiciona o byte de quebra de linha no final do buffer
    mov byte [rdi+buf_size-1], 0  ; adicionar o byte de caracter nulo no final do buffer

    mov rax, buffer             ; copia o buffer para o registrador de retorno
    ret                         ; return do buffer
