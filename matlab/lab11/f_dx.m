function y = f_dx(x, v)
    if (v == 0)
        y = tanh(x) * sech(x) - sin(x);
    else
        x2 = x + v;
        y = (f(x) - f(x2)) / (x - x2);
    end
