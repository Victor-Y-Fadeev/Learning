function p = newton(x, x0, T)
    p = T(1, 1);
    diff = 1;
    
    for i = 2 : length(x0)
        diff = diff * (x - x0(i - 1));        
        p = p + T(1, i) * diff;
    end
