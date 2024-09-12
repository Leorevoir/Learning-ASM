;;
;; EPITECH PROJECT, 2024
;; asm
;; File description:
;; _write
;;

section .text
    global _write

_write:
    mov rax, 1              ; syscall for write x86-64
    syscall                 ; call kernel
    ret                     ; return

