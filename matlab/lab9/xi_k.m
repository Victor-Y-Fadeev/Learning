function x = xi_k(i, k, n)
    x = cos(pi * (4 * i - 1) / (4 * n + 2));
    
    for j = 1 : k - 1
        x = x - polynomial(x, n) / polynomial_dx(x, n); 
    end
