function y = f_2n_xi(a, b, n)
        invert = @(x) - abs(f_dx_2n(x, n));
        xi = fminbnd(invert, a, b);
        
        y = abs(f_dx_2n(xi, n));
