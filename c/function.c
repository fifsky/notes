#include <stdio.h>

//如果函数定义在函数调用之后则需要在调用前对函数进行申明，如

void myname(void);

int main(void){
	
	printf("my name is:");
	myname();
	return 0;
}

//这里定义在调用后面

void myname(void){
	
	printf("fifsky");
}
