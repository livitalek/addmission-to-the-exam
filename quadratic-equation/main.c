#include <stdio.h>
#include <math.h>

float discriminant(float a, float b, float c);
float solutionX1(float a, float b, float disc);
float solutionX2(float a, float b, float disc);

int main(int argc, char argv) {
	float a, b, c, x, disc, x1, x2;
	printf("Quadratic equation: A * X^2 + B * X + C = 0\nEnter A, B, C:");
	scanf("%f %f %f", &a, &b, &c);
	if (a == 0 ) {
	printf("A = %.2f. Not quadratic equation!!!");
	} else {
		printf("%.2f * X^2 + %.2f * X + %.2f = 0\n", a, b, c);
		disc = discriminant(a, b, c);
		printf ("D = B^2 - 4 * A * C = %.2f^2 - 4 * %.2f * %.2F\nD = %.2f\n", b, a, c, disc);
		if (disc < 0) {
			printf("The discriminant less then zero. Has no real solution.\n"); 
		} else {
		x1 = solutionX1(a, b, disc);
		x2 = solutionX2(a, b, disc);
		printf("X1 = (-B - sqrt(D)) / (2 * A) = (-%.2f - sqrt(%.2f)) / (2 * %.2f)\nX1 = %.2f\n", b, disc, a, x1);
		printf("X2 = (-B - sqrt(D)) / (2 * A) = (-%.2f - sqrt(%.2f)) / (2 * %.2f)\nX2 = %.2f\n", b, disc, a, x2);
		}
	}
	return 0;
}

float discriminant(float a, float b, float c) {
	int disc;
	disc = pow(b, 2) - 4 * a * c;
	return disc;
}

float solutionX1(float a, float b, float disc) {
	int x1;
	x1 = (b * (-1) - sqrtf(disc)) / (2 * a);
	return x1;
}

float solutionX2(float a, float b, float disc) {
	int x2;
	x2 = (b * (-2) + sqrtf(disc)) / (2 * a);
	return x2;
}
