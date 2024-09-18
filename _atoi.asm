;;
;; EPITECH PROJECT, 2024
;; Learning-ASM
;; File description:
;; _atoi
;;

section .data
    INT_MAX: dq 0x7FFFFFFF  ; 2^31 - 1
    INT_MIN: dq 0x80000000  ; -2^31

section .text
    global _atoi

_atoi:
    xor rax, rax            ; initialize result to 0
    xor rcx, rcx            ; initialize index to 0
    mov r8, 1               ; initialize sign to +

skip_whitespace:
    movzx rdx, byte [rdi + rcx]
    cmp dl, ' '             ; compare with space >:]
    jne check_sign          ; if not check sign !
    inc rcx                 ; rcx++
    jmp skip_whitespace     ; loop !

check_sign:
    cmp dl, '-'             ; compare with -
    jne check_plus          ; if not check plus !
    neg r8                  ; change sign to negative
    inc rcx                 ; rcx++
    jmp check_digits        ; loop digits !

check_plus:
    cmp dl, '+'             ; compare with +
    jne check_digits        ; if not check digits !
    inc rcx                 ; rcx++

check_digits:
    movzx rdx, byte [rdi + rcx]
    sub dl, '0'             ; convert to int
    cmp dl, 9               ; check if it is in the range 0-9
    ja done                 ; if not i'm done.

    mov r9, [INT_MAX]       ; check for STACK OVERFLOW
    cmp rax, r9             ; is rax getting too big ?
    jg overflow             ; yes it is D:
    imul rax, 10            ; multiply by 10
    jo overflow             ; check if it didnt overflowed during the multiplication
    add rax, rdx            ; add the digit to the result
    jo overflow             ; check again if it overflowed -_-

    inc rcx                 ; rcx++
    jmp check_digits        ; loop again !

overflow:
    mov rax, [INT_MAX]      ; we hit the ceiling
    test r8, r8             ; check if the sign was negative
    jns done                ; no? then we are done
    mov rax, [INT_MIN]      ; yes... so it is INT_MIN not INT_MAX
    ret                     ; return !

done:
    imul rax, r8            ; apply the sign to the result
    ret                     ; return the result
