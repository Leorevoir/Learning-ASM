;;
;; EPITECH PROJECT, 2024
;; ASM
;; File description:
;; my_add
;;

%include "macros.asm"

section .data
    prompt1 db "Enter first number: ", 0
    len1 equ $ - prompt1
    prompt2 db "Enter second number: ", 0
    len2 equ $ - prompt2
    result_msg db "The sum is: ", 0
    len3 equ $ - result_msg
    newline db 0xa, 0

section .bss
    input1 resb 2
    input2 resb 2
    res resb 1

section .text
    global _start

_start:
    ; read first number
    syscall SYS_WRITE, STDOUT, prompt1, len1
    syscall SYS_READ, STDIN, input1, 2

    ; read second number
    syscall SYS_WRITE, STDOUT, prompt2, len2
    syscall SYS_READ, STDIN, input2, 2

    mov eax, [input1]   ; store input1 in eax
    sub eax, '0'        ; conveert it in integer

    mov ebx, [input2]   ; store input2 in ebx
    sub ebx, '0'        ; convert it in integer

    add eax, ebx    ; add eax and ebx
    add eax, '0'    ; convert the result back to ASCII

    ; store the result in res
    mov [res], eax

    ; print the result message
    syscall SYS_WRITE, STDOUT, result_msg, len3

    ; print the result
    syscall SYS_WRITE, STDOUT, res, 1

    ; print a newline
    syscall SYS_WRITE, STDOUT, newline, 1

    ; exit
    syscall SYS_EXIT, 0, 0, 0
