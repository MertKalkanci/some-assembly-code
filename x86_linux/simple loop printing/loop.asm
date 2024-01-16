global _start

section .data
    msg db "myloop",0x0a;Counter
    len equ $ - msg

section .code
_start:
    call loopprintfunc
    mov eax, 1
    mov ebx, 0
    int 0x80

loopprintfunc:
    ;prolouge of func
    push ebp
    mov ebp, esp
    mov eax, 5      ; repeat 5 times
    mov ecx, 0      ;counter set 0
loopstart:
    ;comparission
    cmp ecx, eax
    jge loopfinish  ;if finished finish loop
    push eax        ;save eax value to esp
    push ecx        ;save ecx value to esp
    ;inside of the loop
    ;printing
    mov eax, 4      ;syscall number
    mov ebx, 1      ;stdout file descriptor
    mov ecx, msg    ;bytes to write
    mov edx, len    ;len of bytes to write
    int 0x80        ;syscall
    ;restore counter and accumulator
    pop ecx
    pop eax
    add ecx, 1
    jmp loopstart
loopfinish:
    ;epilogue of func
    mov esp, ebp
    pop ebp
    ret

