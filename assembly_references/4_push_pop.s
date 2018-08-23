/*push/pop using load multiple*/
/*dissasemble to show translation*/
/*$objdump -D out*/

/*in gdb:*/
/*example x/w $sp at each command*/

.text
.global _start

_start:
	mov r0, #3 /*load 3 into r0*/
	mov r1, #4 /*load 4 into r1*/
	push {r0, r1} /*push SP*/
	pop {r2, r3} /*pop sp*/
	stmdb sp!, {r0, r1} /*spelled out push command*/
	ldmia sp!, {r4, r5} /*spelled out pop command*/
	bkpt
