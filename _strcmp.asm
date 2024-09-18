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
    movzx eax, byte [rdi]   ; load first str[i] in eax (zero-extended)
    movzx ebx, byte [rsi]   ; load second str[i] in ebx (zero-extended)
    cmp al, bl              ; compare al with bl
    jne diff                ; if different, jump to diff
    test al, al             ; check for \0
    jz done                 ; if both str are equal, jump to done
    inc rdi                 ; first str++
    inc rsi                 ; second str++
    jmp loop                ; loop


diff:
    sub eax, ebx            ; s1[i] - s2[i] (signed result)
    jmp restore             ; jump to restore


done:
    xor rax, rax            ; rax -> 0


restore:
    pop rdi                 ; restore rdi
    pop rsi                 ; restore rsi
    ret                     ; returns :D
