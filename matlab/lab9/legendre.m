function integral = legendre(a, b, n)
    k = n;
    integral = 0;
    
    for i = 1 : n
        [x, xf] = xi_k(i, k, a, b, n);
        integral = integral + f(xf) * 2 / ((1 - power(x, 2)) * power(polynomial_dx(x, n), 2));
    end
    
    integral = integral * (b - a) / 2;
