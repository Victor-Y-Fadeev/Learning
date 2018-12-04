function x = direct_quadratic(x0, x1, x2, n)
    x(1) = x0;
    x(2) = x1;
    x(3) = x2;
    
    for i = 4 : n
        x_i = [x(i - 3) x(i - 2) x(i - 1)];
        y_i = f(x);
        
        [a, b, c] = polynomial(x_i, y_i);    
        x0 = (- b - sqrt(power(b, 2) - 4 * a * c)) / (2 * a);
        x1 = (- b + sqrt(power(b, 2) - 4 * a * c)) / (2 * a);
    
        if (abs(f(x0)) < abs(f(x1)))
            x(i) = x0;
        else
            x(i) = x1;
        end    
    end
