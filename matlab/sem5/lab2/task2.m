function task2
    x = -1 : 0.00001 : 1;
    n = 4;
    y = power(x, 4);
    
    plot(x, y, 'b');
    grid on;
    hold on;
    
    for i = 1 : length(x)
        y2(i) = chebyshev(x(i), n);
    end
    
    y3 = y - y2 / power(2, n - 1);
    
    plot(x, y3, 'c');
    plot(x, y2, 'm');
        
    [x_a, y_a] = alternance(x, y, y3);
    plot(x_a, y_a, 'y*');
    
    for i = 0 : n - 1
        x_z(i + 1) = cos(pi * (2 * i + 1) / 2 / n);
        x_e(i + 1) = cos(pi * i / n);
        y_z(i + 1) = chebyshev(x_z(i + 1), n);
        y_e(i + 1) = chebyshev(x_e(i + 1), n);
    end
    
    x_e(n + 1) = -1; % cos(pi * n / n)
    y_e(n + 1) = chebyshev(x_e(n + 1), n);
    
    plot(x_z, y_z, 'go');
    plot(x_e, y_e, 'ks');
    
    legend('f(x) = x^{n}, n = 4', 'P_{n-1}(x)', 'T_{n}(x)', 'Alternance points', 'Zero points', 'Extremum points', 'Location', 'south');
