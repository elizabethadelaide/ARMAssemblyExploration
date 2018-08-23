/*Run bin/sh syscall in assembly*/

.section .text
.global _start

_start:
	add	r0, pc, #12	@To ascii literal
	mov	r1, #0		@command arguments
	mov	r2, #0		@effective PC
	mov	r7, #11		@syscall 11 for execve
	svc	#0		@syscall

.ascii	"/bin/sh\0"
