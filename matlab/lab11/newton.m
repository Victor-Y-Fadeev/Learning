function x = newton(x0, n)
    x(1) = x0;
    
    for i = 1 : n - 1
        x(i + 1) = x(i) -  f(x(i)) / f_dx(x(i)); 
    end
