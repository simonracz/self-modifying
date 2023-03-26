section .data
	hello: db 'Hello World', 10
	helloLen:  equ $-hello

section .text
	global _start

_start:
	call print
	call exit

print:
	mov rax, 1		; 1 == write syscall
	mov rdi, 1		; file descriptor, 1 == stdout
	mov rsi, hello		; address of string
	mov rdx, helloLen	; length of string
	syscall
	ret

exit:
	mov rax, 60		; 60 == exit syscall
	mov rdi, 0		; 0 == EXIT_SUCCESS
	syscall
	ret

