function p = newton_2(x, x0, T)
    p = T(1, 1);
    diff = 1;
    q = (x - x0(1)) / (x0(2) - x0(1));
    
    for i = 2 : length(x0)
        diff = diff * (q - i + 2) / (i - 1);        
        p = p + T(1, i) * diff;
    end
