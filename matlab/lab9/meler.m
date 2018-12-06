function integral = meler(a, b, n)
    integral = 0;
    
    for i = 1 : n
        x = ((b - a) / 2) * (1 + cos((pi + 2 * pi * (i - 1)) / (2 * n)));
        integral = integral + f(x) * pi / n;
    end
