/*Use Thumb mode conditional*/

.syntax unified @Setup syntax to read thumb mode

.text
.global _start

_start:
	.code 32
	add r3, pc, #1	@increase value of PC by 1 and add it to R#
	bx r3		@ branch + exchange to the address in r3->switch to thumb, due to LSB is 1


	/*Will output error about multiple conditionals, although there is only one*/
	.code 16	@Thumb statr
	cmp r0, #10	@compare r0 to 10
	ite eq		@structure, if R0 is equal to 10
	addeq r1, #2	@...then R1 = R1 + 2
	addne r1, #3	@...else R1 = R1 + 3
	bkpt
