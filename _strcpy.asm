;;
;; EPITECH PROJECT, 2024
;; asm
;; File description:
;; _strcpy
;;

section .text
    global _strcpy

_strcpy:
    push rbp
    mov rbp, rsp
    push rdi

loop:
    mov al, [rsi]
    mov [rdi], al
    inc rsi
    inc rdi
    test al, al
    jnz loop

    pop rdi
    mov rsp, rbp
    pop rbp
    ret
