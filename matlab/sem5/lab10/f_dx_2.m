function y = f_dx_2(x)
    y = -2 * (power(sin(x), 4) + power(sin(x), 2) + (power(sin(x), 1) - 1) * power(cos(x), 2)) / power(1 + power(sin(x), 2), 2);
