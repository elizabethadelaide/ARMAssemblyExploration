/*Creates a heapoverflow situation

Compile with optimization flag to make it easier to read (-O)

run gdb, examine heap in case of
entering 7 and 8 characters into gets

use vmmap in gef to find heap memory location

list words in heap

memory corruption of number in structure occurs when 8 characters is entered
*/
#include "stdlib.h"
#include "stdio.h"

//object model
//8 bytes for name
//4 bytes for number
struct u_data{
	char name[8];
	int number;
};

int main(int argc, char* argv){
	//create object in heap:
	struct u_data* objA = malloc(sizeof(struct u_data));

	//set number of object to static value
	objA->number = 1234;
	//set name according to user input
	gets(objA->name);

	//check if static value is intact
	if (objA->number == 1234){
		puts("Memory valid");
	}
	else{
		puts("Memory courrupted");
	}
}

