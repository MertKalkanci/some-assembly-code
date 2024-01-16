global _start ;declare start function
_start:
mov eax, 1      ;sys exit call
mov ebx, 42     ;sys exit call program exit code
sub ebx, 2      ;subtract 2 from exitcall
int 0x80        ;execute a syscall 