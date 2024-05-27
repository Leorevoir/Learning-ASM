;;
;; EPITECH PROJECT, 2024
;; ASM
;; File description:
;; input output
;;

%include "macros.asm"

section .bss
    input resb 32   ; add memory for the input

section .data
    prompt_msg db "Enter input: ", 0    ; 0 for the \0
    input_msg db "Input was: ", 0xA

section .text
    global _start

_start:
    ; print prompt_msg
    syscall SYS_WRITE, STDOUT, prompt_msg, 13

    ; read user input
    syscall SYS_READ, STDIN, input, 32

    ; print input_msg
    syscall SYS_WRITE, STDOUT, input_msg, 11

    ; print user input
    syscall SYS_WRITE, STDOUT, input, 32

    ; exit the program
    syscall SYS_EXIT, 0, 0, 0
