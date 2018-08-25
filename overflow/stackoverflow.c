/*run gcc and dissamble in gef

a. add breakpoint after gets is called
b. give gets a string that fits within the buffer, watch the stack
c. run the program again, but give a string that goes outside the buffer
d. the stack is now overflowed

note: gets throws deprecation warning because of this stackoverflow vulnerability
*/

int main(int argc, char **argv){
	char buffer[8];
	gets(buffer);
}
