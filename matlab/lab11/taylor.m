function x = taylor(x0, n, v)
    x(1) = x0;
    
    for i = 1 : n - 1
        a = f_dx_dx(x(i), v) / 2;
        b = f_dx(x(i), v) - x(i) * f_dx_dx(x(i), v);
        c = f(x(i)) - x(i) * f_dx(x(i), v) + power(x(i), 2) * f_dx_dx(x(i), v) / 2;

        x0 = (- b - sqrt(power(b, 2) - 4 * a * c)) / (2 * a);
        x1 = (- b + sqrt(power(b, 2) - 4 * a * c)) / (2 * a);

        if (abs(f(x0)) < abs(f(x1)))
            x(i + 1) = x0;
        else
            x(i + 1) = x1;
        end
    end
