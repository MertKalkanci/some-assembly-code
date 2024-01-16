global _start

section .data
    msg db "Hello World!", 0x0a ;Hello World!\n
    len equ $ - msg

section .writing
_start:
    ;printing
    mov eax, 4      ;syscall number
    mov ebx, 1      ;stdout file descriptor
    mov ecx, msg    ;bytes to write
    mov edx, len    ;len of bytes to write
    int 0x80        ;syscall
    ;exit
    mov eax, 1      ;syscall number
    mov ebx, 0      ;exitcode
    int 0x80        ;syscall
