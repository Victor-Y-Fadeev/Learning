function p = polynomial(x, n)
    p = power(x, n) * factorial(2 * n) / power(factorial(n), 2) / power(2, n);
    
    i = n - 1;
    minus = -1;
    while 2 * i >= n
        % C^k_n is (-1)^(n - i) * x^2i * n! / ((n - i)! * i!)
        % for derivative * x^(-n) * 2i! / (2i - n)!
        % for legendre / (2^(n) * n!)
        p = p + minus * power(x, 2 * i - n) * factorial(2 * i) / factorial(2 * i - n) / (factorial(n - i) * factorial(i)) / power(2, n);
        minus = - 1 * minus;
        i = i - 1;
    end
