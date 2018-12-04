function x = secant(x0, x1, n)
    x(1) = x0;
    x(2) = x1;
    
    for i = 3 : n
        x(i) = x1 - f(x1) * (x1 - x0) / (f(x1) - f(x0));
        
        if (x(i) * x0 > 0)
            x0 = x1;
        end
        
        x1 = x(i);
    end
