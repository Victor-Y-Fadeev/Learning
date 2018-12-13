function main
    L = legendre(- 1, 1, 3);
    disp("Legendre = " + L);
    
    L = - 0.4 + 0.4 * log(1.4) + log(1.4);
    a = 0;
    b = 0.4;
    N = 1 : 5;
    for i = N
        A(i - N(1) + 1) = abs(L - legendre(a, b, i));
        T(i - N(1) + 1) = f_2n_xi(a, b, i) * power(b - a, 2 * i + 1) * power(factorial(i), 4) / ((2 * i + 1) * power(factorial(2 * i), 3));
    end
    T = table(N', A', T', ...
        'VariableNames', {'N', 'Actual', 'Theoretical'});
    disp(T);
        
    I = - pi * log(2);
    a = -1;
    b = 1;
    n = 5 : 20;
    for i = n
        actual(i - n(1) + 1) = abs(I - meler(a, b, i));
        theoretical(i - n(1) + 1) = f_2n_xi(a, b, i) * pi / (factorial(2 * i) * power(2, 2 * i - 1));
    end
    
    semilogy(n, actual, 'c');
    grid on;
    hold on;
    semilogy(n, theoretical, 'm');
    legend('Actual', 'Theoretical');
