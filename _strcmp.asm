;;
;; EPITECH PROJECT, 2024
;; asm
;; File description:
;; _strcmp
;;

section .text
    global _strcmp


_strcmp:
    push rdi                ; save first string adress -> rdi
    push rsi                ; save second string adress -> rsi


loop:
    mov al, [rdi]           ; save first str[i] in al
    mov bl, [rsi]           ; save second str[i] in bl
    cmp al, bl              ; compare al with bl
    jne diff                ; if different, jump to diff
    test al, al             ; check for \0
    jz done                 ; if both str are equal, jump to done
    inc rdi                 ; first str++
    inc rsi                 ; second str++
    jmp loop                ; loop


diff:
    sub al, bl              ; s1[i] - s2[i]
    movzx rax, al           ; result to the return value rax
    jmp restore             ; jump to restore


done:
    xor rax, rax            ; rax -> 0


restore:
    pop rdi                 ; restore rdi
    pop rsi                 ; restore rsi
    ret                     ; returns :D

