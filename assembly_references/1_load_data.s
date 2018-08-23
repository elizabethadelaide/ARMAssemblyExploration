.data /*set up data for the program*/
var1: .word 3 /*allocate word*/
var2: .word 4 /*allocate word*/

.text /*start of code*/
.global _start

_start:
	ldr r0, adr_var1 @load the memory address of var1 via label
	ldr r1, adr_var2 @similar for var2
	ldr r2, [r0] @ load the balue (0x03) at adddress of r0 to r2
	str r2, [r1] @ store value in r2 to address in r1
	bkpt
	ldr r1, adr_var2 @similarly for r1

/*Literal Pool:*/
adr_var1: .word var1 /*address to var1 stored here*/
adr_var2: .word var2 /*address to var2 stored here*/
