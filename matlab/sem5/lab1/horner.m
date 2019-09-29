function b = horner(a, x0)
    b(1) = a(1);
    
    for i = 2 : length(a)
        b(i) = a(i) + b(i - 1) * x0;
    end
