function s = simpson(a, b, n)
    if (mod(n, 2) == 0)
        n = n + 1;
    end
    
    x = a : (b - a) / (n - 1) : b;
    s = 0;
    
    for i = 1 : 2 : (n - 2)
        s = s + f(x(i)) + 4 * f(x(i + 1)) + f(x(i + 2));
    end
    
    s = s * (b - a) / (3 * (n - 1));
    