function r = rectangles(a, b, n)
    x = a : (b - a) / (n - 1) : b;
    r = 0;
    
    for i = 1 : (n - 1)
        r = r + f((x(i) + x(i + 1)) / 2) * (x(i + 1) - x(i));
    end
    