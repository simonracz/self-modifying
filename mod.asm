section .data
	hello: db 'Hello'
	helloLen:  equ $-hello
	world: db ' World', 10
	worldLen: equ $-world

section .text
	global _start

_start:	
	call print
	mov byte [print_world - 1], 90h ; we overwrite jmp instruction
	mov byte [print_world - 2], 90h ; with 2 NOPs
	call print
	call exit

print:
	mov rax, 1		; 1 == write syscall
	mov rdi, 1		; file descriptor, 1 == stdout
	jmp print_hello

print_world:
	mov rsi, world
	mov rdx, worldLen
	syscall
	ret

print_hello:
	mov rsi, hello		; address of string
	mov rdx, helloLen	; length of string
	syscall
	ret

exit:
	mov rax, 60		; 60 == exit syscall
	mov rdi, 0		; 0 == EXIT_SUCCESS
	syscall
	ret

