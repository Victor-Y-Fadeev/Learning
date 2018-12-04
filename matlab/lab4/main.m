function main
    a = 0;
    b = 1;
    n = 6;
    
    x0 = a : (b - a) / (n - 1) : b;
    x = 0 : 0.001 : 1;

    y0 = f(x0);
    y = f(x);
    
    plot(x, y, 'b');
    grid on;
    hold on;
    plot(x0, y0, 'm*');
    
    %T = divided_diff(x0, y0, n);
    T2 = finite_diff(y0, n);
    for i = 1 : length(x)
        %y2(i) = lagrange(x(i), x0);
        %y2(i) = newton(x(i), x0, T);
        y2(i) = newton_2(x(i), x0, T2);
    end
    
    plot(x, y2, 'c');
    legend('f(x)', 'Interpolation points', 'Polynomial', 'Location', 'southeast');
    
    R = max_diff(y0, y);
    disp("R_n = " + R);
