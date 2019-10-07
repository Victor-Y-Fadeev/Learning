function x = bisection(A, a, b, iter)
    if iter == 0
        x(1) = (a + b) / 2;
        return
    end
    
    alpha(1) = A(1, 1);
    for i = 2 : length(A)
        alpha(i) = A(i, i);
        beta(i - 1) = A(i, i - 1);
    end

    first = signs(alpha, beta, a);
    middle = signs(alpha, beta, (a + b) / 2);    
    if first == middle || middle == 0
        x = bisection(A, (a + b) / 2, b, iter - 1);
        return
    end
    
    x = bisection(A, a, (a + b) / 2, iter - 1);
    
    last = signs(alpha, beta, b);
    if last == middle
        return
    end
    
    y = bisection(A, (a + b) / 2, b, iter - 1);
    len = length(x);
    for i = 1 : length(y)
        x(len + i) = y(i);
    end
    