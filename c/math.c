#include <math.h>
#include <stdio.h>

//如果使用了数学函数gcc编译的时候必须要加上-lm参数如：gcc -lm math.c -o math.o
int main(void)
{
	double pi = 3.1416;
	printf("sin(pi/2)=%f\nln1=%f\n",sin(pi/2),log(1.0));
	return 0;
}
