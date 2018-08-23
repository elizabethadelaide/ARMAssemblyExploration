/*Uses immediate as offset*/
.data /*set up data for the program*/
var1: .word 3 /*allocate word*/
var2: .word 4 /*allocate word*/

.text /*start of code*/
.global _start

_start:
	ldr r0, adr_var1 @load the memory address of var1 via label
	ldr r1, adr_var2 @similar for var2
	ldr r2, [r0] @ load the balue (0x03) at adddress of r0 to r2
	str r2, [r1, #2] @ store value in r2 to address in r1 with offset
	str r2, [r1, #4]! @pre-index address mode, memory at R1+4,modify R1
	ldr r3, [r1], #4 @post-index address mode. Memory at R1. Modify R1.
	bkpt
	ldr r1, adr_var2 @similarly for r1

/*Literal Pool:*/
adr_var1: .word var1 /*address to var1 stored here*/
adr_var2: .word var2 /*address to var2 stored here*/
