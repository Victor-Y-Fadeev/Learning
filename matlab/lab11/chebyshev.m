function x = chebyshev(x0, n)
    x(1) = x0;
    
    for i = 1 : n - 1
        x(i + 1) = x(i) -  f(x(i)) / f_dx(x(i)) - f_dx_dx(x(i)) * power(f(x(i)), 2) / (2 * power(f_dx(x(i)), 3)); 
    end
