function p = polynomial_dx(x, n)
    p = (polynomial(x, n - 1) - x * polynomial(x, n)) * n / (1 - power(x, 2));
