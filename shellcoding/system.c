#include <stdio.h>


//basic function to test against
//strace -f -v on it

//calling bin/sh invokes execve()

//execve args from man
//pointer to string specifying path to a binary
//array of commang line variables
//envp array of environment variables

//from grep excecve /usr/include/arm-linux-gnuabihf/asm/unistd.h
//syscall = 11

void main(void){
	system("/bin/sh");
}
