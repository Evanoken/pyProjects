section .data
    postgraduates_times db 'There are %d postgraduates in total for this academic year.', 10, 0
    spring_term_postgraduates dd 41
    autumn_term_postgraduates dd 54
    total_postgraduates dd 0

section .text
    global _start

_start:
    mov eax, [spring_term_postgraduates]  
    add eax, [autumn_term_postgraduates] 
    mov [total_postgraduates], eax       

    mov eax, 1       
    mov ebx, 1       
    mov ecx, postgraduates_times 
    mov edx, 25    
    push dword [total_postgraduates]   
    call printf    
    add esp, 4      

    mov eax, 1      
    xor ebx, ebx    
    int 0x80         

extern printf

