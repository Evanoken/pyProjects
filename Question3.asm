section .data
prompt db "Please enter your age: ", 0
odd_msg db "You belong to the SIMTech group.", 0
even_msg db "You belong to the Smartstart group.", 0
divisible_msg db "Your age is divisible by 8 and 2. You belong to the ProTech group.", 0
not_divisible_msg db "Your age is not divisible by 8.", 0

section .bss
age resb 2

section .text
global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 24
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, age
    mov edx, 2
    int 0x80

    xor eax, eax
    mov al, byte [age]
    sub eax, '0'

    and eax, 1
    jz even_age
    
    ; Age is odd
    mov eax, 4
    mov ebx, 1
    mov ecx, odd_msg
    mov edx, 47
    int 0x80
    jmp end_program

even_age:
    mov ebx, eax
    and bl, 7
    jz divisible_by_8

    mov eax, 4
    mov ebx, 1
    mov ecx, not_divisible_msg
    mov edx, 26
    int 0x80
    jmp end_program

divisible_by_8:
    mov eax, 4
    mov ebx, 1
    mov ecx, divisible_msg
    mov edx, 35
    int 0x80

end_program:
    mov eax, 1
    xor ebx, ebx
    int 0x80
