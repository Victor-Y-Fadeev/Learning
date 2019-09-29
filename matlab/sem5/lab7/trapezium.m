function t = trapezium(a, b, n)
    x = a : (b - a) / (n - 1) : b;
    t = 0;
    
    for i = 1 : (n - 1)
        t = t + (x(i + 1) - x(i)) * (f(x(i)) + f(x(i + 1))) / 2;
    end