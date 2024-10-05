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

    test rdi, rdi           ; check if str1 is null
    jz done                 ; if so, jump to done
    test rsi, rsi           ; check if str2 is null
    jz done                 ; if so, jump to done

    mov rax, [rdi]          ; and swap !
    mov rbx, [rsi]          ; and swap !
    mov [rdi], rbx          ; and swap !
    mov [rsi], rax          ; and swap !
    jmp done


done:
    pop rdi
    pop rsi
    ret
