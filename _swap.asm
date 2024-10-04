;;
;; EPITECH PROJECT, 2024
;; Learning-ASM
;; File description:
;; _swap
;;


section .text
    global _swap


_swap:

    push rdi                ; save first string adress -> rdi
    push rsi                ; save second string adress -> rsi
    mov rax, [rdi]          ; and swap !
    mov rbx, [rsi]          ; and swap !
    mov [rdi], rbx          ; and swap !
    mov [rsi], rax          ; and swap !
    pop rdi                 ; restore rdi
    pop rsi                 ; restore rsi
    ret                     ; returns :D
