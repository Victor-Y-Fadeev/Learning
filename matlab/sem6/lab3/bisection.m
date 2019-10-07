function x = bisection(A, a, b, iter)    
    alpha(1) = A(1, 1);
    for i = 2 : length(A)
        alpha(i) = A(i, i);
        beta(i - 1) = A(i, i - 1);
    end
    
    x = recursive(alpha, beta, a, b, iter);
    