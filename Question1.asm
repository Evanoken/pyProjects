section .data
    welcome_msg db 'Hello Its my pleasure to introduce myself to you.', 0
    skill_msg db 'On skills am well equiped with hardware and web development technology its my pleasure to share with you what I posses.', 0
    team_msg db 'I prefer working with colleagues who are collaborative, dedicated, and open-minded.', 0

section .text
    global _start

_start:
    mov eax, 4     
    mov ebx, 1     
    mov ecx, welcome_msg 
    mov edx, 87   
    int 0x80      

    mov eax, 4    
    mov ebx, 1   
    mov ecx, skill_msg  
    mov edx, 63     
    int 0x80         

    mov eax, 4       
    mov ebx, 1       
    mov ecx, team_msg   
    mov edx, 77      
    int 0x80         

    mov eax, 1       
    xor ebx, ebx    
    int 0x80         
