function main
    A = [10 2 -1; -2 -6 -1; 1 -3 12];
    b = [5 24.42 36];
    
    x = gaussian(A, b);
    
    iter = 50;
    [X, alpha, beta] = iterative(A, b, iter);
    
    steps = 1 : iter + 1;
    for i = steps
        actual(i) = max(abs(x - X(:, i).'));
        theoretical(i) = power(inf_norm(alpha), i) * inf_norm(beta) / (1 - inf_norm(alpha));
        residual(i) = inf_norm(b.' - A * X(:, i));
    end
    
    semilogy(steps, actual, 'c');
    grid on;
    hold on;
    semilogy(steps, theoretical, 'm');
    semilogy(steps, residual, 'y');
    legend('Actual', 'Theoretical', 'Residual');
    