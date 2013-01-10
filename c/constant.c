#include <stdio.h>

int main(void){

	//注意这里的%c只能匹配一个字符，如果输入多个字符编译的时候会警告，并且只取最后一个字符
	printf("char: %c\n int: %d\n float: %f",'f',123,45.112);
	return 0;
}
