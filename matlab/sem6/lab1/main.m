function main
    A = [1 1 1; 4 2 1; 9 3 1];
    b = [0 1 3];
    
    x = [0.5 -0.5 0];
    %x = gaussian(A, b);
    
    c = rand(1, length(b));
    %c = rand(size(A));
    disp(c);
    
    condition = inf_norm(A) * inf_norm(inv(A));
    n = 5 : 20;
    for i = n
        alpha(i - n(1) + 1) = power(10, -i);
        
        delta_A = 0;
        delta_b = alpha(i - n(1) + 1) * c;
        
        %delta_A = alpha(i - n(1) + 1) * c;
        %delta_b = 0;
        
        actual(i - n(1) + 1) = max(abs(x - gaussian(A + delta_A, b + delta_b)));
        theoretical(i - n(1) + 1) = (condition / (1 - condition * inf_norm(delta_A) / inf_norm(A))) * (inf_norm(delta_A) / inf_norm(A) + inf_norm(delta_b) / inf_norm(b));
    end
    
    semilogy(alpha, actual, 'c');
    grid on;
    hold on;
    semilogy(alpha, theoretical, 'm');
    legend('Actual', 'Theoretical');
    