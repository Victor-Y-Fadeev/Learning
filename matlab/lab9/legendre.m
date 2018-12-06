function integral = legendre(a, b, n)
    k = n;
    integral = 0;
    
    for i = 1 : n
        x = xi_k(i, k, n);
        integral = integral + f(x) * 2 / ((1 - power(x, 2)) * power(polynomial_dx(x, n), 2));
    end
    
    integral = integral * (b - a) / 2;
