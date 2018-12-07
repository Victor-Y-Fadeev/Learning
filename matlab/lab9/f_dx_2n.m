function y = f_dx_2n(x, n)
    y = power(- 1, n - 1) * factorial(n - 1) * power(1 + x, - n);
