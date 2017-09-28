#include "function.h"
#include "ctest.h"

CTEST(disc, test_1_pos) {
	const float a = 1;
	const float b = 2;
	const float c = -3;

	const float exp = 16;

	const float real = discriminant(a, b, c);

	ASSERT_DBL_NEAR(exp, real);
}

CTEST(disc, test_2_neg) {
	const float a = 1;
	const float b = 2;
	const float c = 3;

	const float exp = -8;

	const float real = discriminant(a, b, c);

	ASSERT_DBL_NEAR(exp, real);
}

CTEST(disc, test_3_zero) {
    const float a = 1;
    const float b = 4;
    const float c = 4;

    const float exp = 0;

    const float real = discriminant(a, b, c);
    ASSERT_DBL_NEAR(exp, real);
}

CTEST(x1, test_1_pos) {
    const float disc = 16;
    const float b = -8;
    const float a = 1;

    const float exp = 2;

    const float real = solutionX1(a, b, disc);
    ASSERT_DBL_NEAR(exp, real);
}

CTEST(x1, test_2_neg) {
    const float disc = 4;
    const float b = 2;
    const float a = 1;

    const float exp = -2;

    const float real = solutionX1(a, b, disc);
    ASSERT_DBL_NEAR(exp, real);
}

CTEST(x1, test_3_zero) {
    const float disc = 16;
    const float b = -4;
    const float a = 1;

    const float exp = 0;

    const float real = solutionX1(a, b, disc);
    ASSERT_DBL_NEAR(exp, real);
}

CTEST(x2, test_1_pos) {
    const float disc = 16;
    const float b = 2;
    const float a = 1;

    const float exp = 1;

    const float real = solutionX2(a, b, disc);
    ASSERT_DBL_NEAR(exp, real);
}

CTEST(x2, test_2_zero) {
    const float disc = 4;
    const float b = 2;
    const float a = 1;

    const float exp = 0;

    const float real = solutionX2(a, b, disc);
    ASSERT_DBL_NEAR(exp, real);
}

CTEST(x2, test_3_neg) {
    const float disc = 16;
    const float b = 8;
    const float a = 1;

    const float exp = -2;

    const float real = solutionX2(a, b, disc);
    ASSERT_DBL_NEAR(exp, real);
}
