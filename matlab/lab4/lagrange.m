function p = lagrange(x, x0)
    p = 0;
    
    for k = 1 : length(x0)
        p = p + f(x0(k)) * l_k(x, k, x0);
    end
