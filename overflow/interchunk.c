/*
Demonstrates inter-chunk heap overflow
Compile without optimization flag

run in gdb

add breakpoint after gets

run with 7 A's and 16 A's

watch memory in heap
*/

#include "stdlib.h"
#include "stdio.h"

int main(int argc, char* argv[]){
	char *some_string = malloc(8); //create some_string "object" in Heap
	int *some_number = malloc(4); //create some_number "object" in Heap

	*some_number = 1234;	//assign a static value
	gets(some_string); //ask user for input

	//Check if heap was corrupted
	if (*some_number == 1234){
		puts("Memory valid");
	}
	else{
		puts("Memory corrupted");
	}

}
