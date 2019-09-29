function x = inverse_quadratic(x0, x1, x2, n)
    x(1) = x0;
    x(2) = x1;
    x(3) = x2;
    
    for i = 4 : n
        x_i = [x(i - 3) x(i - 2) x(i - 1)];
        y_i = f(x_i);
        
        [a, b, c] = polynomial(y_i, x_i);
        x(i) = c;
    end
