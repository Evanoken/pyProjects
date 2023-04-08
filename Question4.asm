section .data
    total_students dw 140
    spring_postgraduates dw 41
    autumn_postgraduates dw 54

section .text
    global _start

_start:
    sub word [total_students], [spring_postgraduates]
    sub word [total_students], [autumn_postgraduates]

    mov eax, 1
    xor ebx, ebx
    int 0x80
