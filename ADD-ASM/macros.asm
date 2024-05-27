;;
;; EPITECH PROJECT, 2024
;; ASM
;; File description:
;; input output
;;

%macro syscall 4
    mov eax, %1
    mov ebx, %2
    mov ecx, %3
    mov edx, %4
    int 0x80
%endmacro

STDIN equ 0
STDOUT equ 1
SYS_EXIT equ 1
SYS_READ equ 3
SYS_WRITE equ 4
