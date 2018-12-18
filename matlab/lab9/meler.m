function integral = meler(a, b, n)
    integral = 0;
    
    for i = 1 : n
        x = (a + b) / 2 +((b - a) / 2) * cos((pi + 2 * pi * (i - 1)) / (2 * n));
        integral = integral + f(x) * pi / n;
    end
