function r = rectangles(func, a, b, n)
    x = a : (b - a) / n : b;
    r = 0;
    
    for i = 1 : n
        r = r + func((x(i) + x(i + 1)) / 2) * (x(i + 1) - x(i));
    end
    