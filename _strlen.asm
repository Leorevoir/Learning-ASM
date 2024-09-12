;;
;; EPITECH PROJECT, 2024
;; asm
;; File description:
;; _strlen
;;

section .text
    global _strlen

_strlen:
                            ; rdi = string
    xor rax, rax            ; rax = 0 -> length

loop:
    cmp byte [rdi], 0       ; compare byte at rdi with 0
    je end                  ; if equal to 0, jump to end
    inc rdi                 ; rdi = rdi + 1
    inc rax                 ; rax = rax + 1
    jmp loop                ; jump to loop


end:
    ret                     ; return rax -> length
