function y = f_dx_dx(x)
    y = - cos(x) + power(sech(x), 3) - power(tanh(x), 2) * sech(x);
