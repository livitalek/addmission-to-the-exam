#include "function.h"
#include <math.h>

float discriminant(float a, float b, float c) {
	float disc;
	disc = b * b - 4 * a * c;
	return disc;
}

float solutionX1(float a, float b, float disc) {
	float x1;
	x1 = (b * (-1) - sqrt(disc)) / (2 * a);
	return x1;
}

float solutionX2(float a, float b, float disc) {
	float x2;
	x2 = (b * (-1) + sqrt(disc)) / (2 * a);
	return x2;
}
