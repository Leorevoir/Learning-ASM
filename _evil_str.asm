;;
;; EPITECH PROJECT, 2024
;; asm
;; File description:
;; _strcat
;;

section .text
    global _evil_str


extern _strlen


_evil_str:
    push rdi                    ; save rdi (str)
    
    test rdi, rdi               ; check if str is null
    jz done                     ; if so, jump to done

    call _strlen                ; rax -> strlen(str)
    mov rcx, rax                ; save length in rcx
    dec rcx                     ; rcx = length - 1
    shr rax, 1                  ; rax = length / 2

    xor rbx, rbx                ; rbx = 0 (our loop counter)

loop:
    cmp ebx, eax                ; check if we've reached half the string
    jge done                    ; if so, we're done

    mov rdi, [rsp]              ; load str address
    mov sil, [rdi + rbx]        ; load str[i] into sil (because i dont use it elsewhere)
    mov dl, [rdi + rcx]         ; load str[length - 1 - i] into dl (because i dont use it elsewhere)

    mov [rdi + rbx], dl         ; store dl in str[i]
    mov [rdi + rcx], sil        ; store sil in str[length - 1 - i]

    inc ebx                     ; i++
    dec ecx                     ; decrement the end pointer
    jmp loop                    ; continue looping

done:
    pop rdi                     ; restore rdi (str)
    mov rax, rdi                ; set return value to str
    ret                         ; return str
