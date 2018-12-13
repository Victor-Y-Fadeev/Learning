function y = f_dx_dx(x, v)
    if (v == 0)
        y = - cos(x) + power(sech(x), 3) - power(tanh(x), 2) * sech(x);
    else
        x2 = x + v;
        y = (f_dx(x, v) - f_dx(x2, v)) / (x - x2);
    end
