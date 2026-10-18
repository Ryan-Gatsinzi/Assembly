global _start

section .text
_start:
    ; 1. Write the message to stdout
    mov rax, 1                  ; 'write' system call number
    mov rdi, 1                  ; file descriptor 1 is stdout
    mov rsi, message            ; memory address of our string
    mov rdx, 14                 ; length of our string (including newline)
    syscall                     ; invoke Linux kernel to print

    ; 2. Exit the program cleanly
    mov rax, 60                 ; 'exit' system call number
    xor rdi, rdi                ; exit code 0 (success)
    syscall                     ; invoke Linux kernel to exit

section .data
    message: db "Hello, World!", 10  ; 10 is the ASCII code for a newline (\n)

