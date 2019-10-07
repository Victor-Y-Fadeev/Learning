function x = recursive(alpha, beta, a, b, iter)
    % Complete computation
    if iter == 0
        x(1) = (a + b) / 2;
        return
    end
    
    % Search eigenvalues of first part
    first = signs(alpha, beta, a);
    middle = signs(alpha, beta, (a + b) / 2);    
    if first == middle || middle == 0
        x = recursive(alpha, beta, (a + b) / 2, b, iter - 1);
        return
    end
    
    x = recursive(alpha, beta, a, (a + b) / 2, iter - 1);
    
    % Search eigenvalues of second part
    last = signs(alpha, beta, b);
    if last == middle
        return
    end
    
    % Grouping values
    y = recursive(alpha, beta, (a + b) / 2, b, iter - 1);
    len = length(x);
    for i = 1 : length(y)
        x(len + i) = y(i);
    end
    