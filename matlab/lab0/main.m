function main
    x0 = 0;
    y0 = 0;
    X = 1;
    h = 0.0000001;
    
    [x, y] = runge_kutt(x0, y0, X, h);
    
    [x1, y1] = runge_kutt(x0, y0, X, 0.5);
    [x2, y2] = runge_kutt(x0, y0, X, 0.25);
    [x3, y3] = runge_kutt(x0, y0, X, 0.125);
    [x4, y4] = runge_kutt(x0, y0, X, 0.0625);
    [x5, y5] = runge_kutt(x0, y0, X, 0.03125);
    
    plot(x, y, 'k');
    grid on;
    hold on;
    plot(x1, y1, 'y');
    plot(x2, y2, 'm'); 
    plot(x3, y3, 'c');
    plot(x4, y4, 'g');
    plot(x5, y5, 'b');    
    legend('High resolution', 'h = 0.5', 'h = 0.25', 'h = 0.125', 'h = 0.0625', 'h = 0.03125', 'Location', 'southeast');
    
    %{
    h_n(1) = 0.5;
    h_n(2) = 0.25;
    h_n(3) = 0.125;
    h_n(4) = 0.0625;
    h_n(5) = 0.03125;
    
    Y = y(length(y));
    actual(1) = abs(Y - y1(length(y1)));
    actual(2) = abs(Y - y2(length(y2)));
    actual(3) = abs(Y - y3(length(y3)));
    actual(4) = abs(Y - y4(length(y4)));
    actual(5) = abs(Y - y5(length(y5)));
    
    hold off;
    semilogy(h_n, actual, 'k');
    grid on;
    legend('Actual error', 'Location', 'southeast');
    %}
