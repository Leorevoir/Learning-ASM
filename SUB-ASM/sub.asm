;;
;; EPITECH PROJECT, 2024
;; Learning-ASM
;; File description:
;; sub
;;

%include "macros.asm"

section .data
    prompt1 db "Enter first number: ", 0
    len1 equ $ - prompt1
    prompt2 db "Enter second number: ", 0
    len2 equ $ - prompt2
    result_msg db "The difference is: ", 0
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

    mov eax, [input1]   ; stock input1 in eax
    sub eax, '0'        ; convert to int

    mov ebx, [input2]   ; stock input2 in ebx
    sub ebx, '0'        ; convert to int

    sub eax, ebx        ; eax - ebx

    add eax, '0'        ; convert result to ascii

    mov [res], eax      ; stock result in res

    ; print result msg
    syscall SYS_WRITE, STDOUT, result_msg, len3

    ; print result
    syscall SYS_WRITE, STDOUT, res, 1

    ; add \n
    syscall SYS_WRITE, STDOUT, newline, 1

    ; exit
    syscall SYS_EXIT, 0, 0, 0
