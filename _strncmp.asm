section .text
    global _strncmp

_strncmp:
    push rdi                ; save first string address
    push rsi                ; save second string address
    xor rcx, rcx            ; initialize counter to 0


loop:
    cmp rcx, rdx            ; check if we've reached n (third argument)
    je done                 ; if so, we're done

    movzx eax, byte [rdi + rcx]
    movzx ebx, byte [rsi + rcx]
    cmp al, bl              ; compare al with bl
    jne diff                ; if different, jump to diff
    test al, al             ; check for \0
    jz done                 ; if end of string jump done
    inc rcx                 ; increment counter
    jmp loop                ; continue loop


diff:
    sub eax, ebx            ; s1[i] - s2[i] (signed result)
    jmp restore             ; jump to restore


done:
    xor rax, rax            ; rax -> 0


restore:
    pop rsi                 ; restore rsi
    pop rdi                 ; restore rdi
    ret                     ; returns :D
