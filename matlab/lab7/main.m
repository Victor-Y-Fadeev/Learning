function main
    a = 0;
    b = 0.4;
    n = 5;
    I = 1.4 * log(1.4) - 0.4; % integral = (x + 1) * log(x + 1) - x
    
    r = rectangles(a, b, n);
    t = trapezium(a, b, n);
    s = simpson(a, b, n);
    
    % max f'' & f'''' at 0 on [0, 0.4]
    R = [I; r; abs(I - r); abs((b - a) * power((b - a) / (n - 1), 2) * (-1 / power(1 + a, 2)) / 24); (abs(r - rectangles(a, b, round(n / 2))) / 3)];
    T = [I; t; abs(I - t); abs((b - a) * power((b - a) / (n - 1), 2) * (-1 / power(1 + a, 2)) / 12); (abs(t - trapezium(a, b, round(n / 2))) / 3)];
    S = [I; s; abs(I - s); abs((b - a) * power((b - a) / (n - 1), 3) * (2 / power(1 + a, 3)) / 288); (abs(s - simpson(a, b, round(n / 2))) / 15)];
    
    T = table(R, T, S, ...
        'VariableNames', {'Rectangles', 'Trapezium', 'Simpson'}, ...
        'RowNames', {'Integral value'; 'Approximate value'; 'Actual error'; 'Theoretical error'; 'Runge error'});
    disp(T);
    
    x = 5 : 21;
    for i = x
        err_r(i - 4) = abs(I - rectangles(a, b, i));
        err_t(i - 4) = abs(I - trapezium(a, b, i));
        err_s(i - 4) = abs(I - simpson(a, b, i));
    end
    
    semilogy(x, err_r, 'b');
    grid on;
    hold on;
    
    semilogy(x, err_t, 'c');
    semilogy(x, err_s, 'm');    
    legend('Rectangles', 'Trapezium', 'Simpson');
    
    %graph_r(I, a, b, 5, 21);
    %graph_t(I, a, b, 5, 21);
    %graph_s(I, a, b, 5, 21);
    