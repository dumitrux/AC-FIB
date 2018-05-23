#include <stdio.h>
#include <math.h>

int main() {
	double x, y, res;
	x = 665857;
	y = 470832;
	res = pow(x,4.0)-4*pow(y,4.0)-4*pow(y,2.0);
	printf("res = %lf \n\n", res);
}
