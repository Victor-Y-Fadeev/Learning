function main
    A = [2 2 0; 2 4 2; 0 2 2];
    
    eigenvalues = [0 2 6];
    %eigenvalues = eig(A);
    
    a = -5;
    b = 10;
    iter = 50;
    
    steps = 1 : iter;
    for i = steps        
        x = bisection(A, a, b, i);
        %disp(x);
        
        actual(i) = max(abs(eigenvalues(1 : length(x)) - x));
    end
    
    semilogy(steps, actual, 'c');
    grid on;
    hold on;
    legend('Actual');
    