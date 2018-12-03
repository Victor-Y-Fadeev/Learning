function t = chebyshev(x, n)
    k(1) = 1;
    k(2) = x;
    
    for i = 1 : n - 1
        k(i + 2) = 2 * x * k(i + 1) - k(i);
    end
    
    t = k(n + 1);
