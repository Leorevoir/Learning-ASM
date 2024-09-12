;;
;; EPITECH PROJECT, 2024
;; asm
;; File description:
;; _strcat
;;


; char *my_strcat(char *dest, char const *src)
; {
;     int a = 0;
;     int b = 0;

;     if (dest == 0 || src == 0) {
;         return (0);
;     }
;     while (dest[a] != '\0') {
;         a++;
;     }
;     while (src[b] != '\0') {
;         dest[a] = src[b];
;         a++;
;         b++;
;     }
;     dest[a] = '\0';
;     return (dest);
; }

section .text
    global _strcat

extern _strlen

_strcat:
    push rdi                ; save rdi (dest)
    push rsi                ; save rsi (src)
    call _strlen            ; rax -> strlen(dest)
    mov rcx, rax            ; save rax in rcx
    pop rsi                 ; restore rsi
    pop rdi                 ; restore rdi
    add rdi, rcx            ; move rdi to the end of dest

loop:
    mov al, [rsi]           ; al = src[i]
    mov [rdi], al           ; save al to dest[i]
    inc rsi                 ; src[i]++
    inc rdi                 ; dest[i]++
    test al, al             ; check for \0
    jnz loop                ; loop !

    sub rdi, rcx            ; restore rdi to dest start
    mov rax, rdi            ; return value is *des
    ret                     ; return :D
