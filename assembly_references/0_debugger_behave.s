/*Elizabeth Adelaide*/
/*Program to look at debugger behavior*/

.section .text
.global _start

_start:
	mov r0, pc /*Move program counter into register 0*/
	mov r1, #2 /*move literal 2 into register 1 */
	add r2, r1, r1 /*sum r1 and r1 into r2*/
	bkpt /*breakpoint*/
