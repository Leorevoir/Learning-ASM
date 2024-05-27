;;
;; EPITECH PROJECT, 2024
;; ASM
;; File description:
;; atoi
;;

%include "macros.asm"

section .data
    prompt db "Enter a number: ", 0
    result_msg db "The number is: ", 0
    newline db 10, 0xA

section .bss
    input resb 10
    number resb 10

section .text
    global _start

_start:
    ; get input
    syscall SYS_WRITE, STDOUT, prompt, 17
    syscall SYS_READ, STDIN, input, 10

    ; convert str to int
    mov ecx, input
    call atoi

    ; store result in ebx
    mov ebx, eax

    ; convert int to string and print
    mov ecx, number
    call itoa
    syscall SYS_WRITE, STDOUT, result_msg, 16
    syscall SYS_WRITE, STDOUT, number, 10
    syscall SYS_WRITE, STDOUT, newline, 1

    ; exit
    syscall SYS_EXIT, 0, 0, 0

atoi:
    xor eax, eax    ; clear EAX ~> result
    xor ebx, ebx    ; clear EBX ~> index
    xor edx, edx    ; clear EDX ~> char

atoi_loop:
    mov dl, [ecx + ebx] ; dl = str[index]
    cmp dl, 0           ; compare dl with \0
    je atoi_done        ; if dl == \0 break loop
    cmp dl, 10          ; compare dl with newline
    je atoi_done        ; if dl == newline break loop

    sub dl, '0'         ; ascii to int
    imul eax, eax, 10   ; multiply eax * 10
    add eax, edx        ; add numeric value to eax
    inc ebx             ; increment index
    jmp atoi_loop       ; loop

atoi_done:
    ret ; returns the final result (eax)

itoa:
    xor edx, edx        ; clear EDX
    mov ebx, 10
    add ecx, 10         ; start from the end of the buffer
    mov byte [ecx], 0   ; add null terminator
itoa_loop:
    dec ecx
    xor edx, edx
    div ebx             ; divide EAX by 10
    add dl, '0'         ; convert remainder to ASCII
    mov [ecx], dl
    test eax, eax
    jnz itoa_loop
    ret                 ; return result in ECX
