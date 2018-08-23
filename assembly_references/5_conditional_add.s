/*Performs conditional addition*/
/*use gdb to check conditional flag*/

.global main

main:
	mov r0, #2	/*init variable*/
	cmp r0, #3	/*compare to number to 3. Negative bit gets set to 1*/
	addlt r0, r0, #1 /*increase r0 IF r0 was smaller than 3*/
	cmp r0, #3 	/*compare r0 to 3 again. Zero bit -> 1, Negative -> 1*/
	addlt r0, r0, #1 /*Increase IF less than 3*/
	bx lr
