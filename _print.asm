;; EPITECH PROJECT, 2024
;; asm
;; File description:
;; _print

section .text
    global _print

extern _strlen
extern _write


_print:
    push rdi                ; save string adress -> rdi
    call _strlen            ; save strlen(str) -> rax
    pop rsi                 ; get string adress -> rsi
    mov rdi, 1              ; fd = stdout -> rdi
    mov rdx, rax            ; save rax (strlen) in rdx before _write syscall
    call _write             ; syscall _write
    ret                     ; return ! :D
