function x0 = derivative(x, y, k)
    result = 2;
    
    last = (y(1) - y(2)) / (x(1) - x(2));
    
    
    for i = 3 : length(x)
        k2 = (y(i - 1) - y(i)) / (x(i - 1) - x(i));
        if (abs(k - k2) < abs(k - last))
            last = k2;
            result = i;
        end
    end
    
    x0 = x(result);
