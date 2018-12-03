function task1
    x = 0 : 0.00001 : 1;
    y = log(1 + x);
    size = length(x);
    
    p = plot(x, y, 'b');
    grid on;
    hold on;
    
    k = (y(1) - y(size)) / (x(1) - x(size));
    b = y(1) - k * x(1);
    
    %x0 = 1 / k - 1; % from derivative of log(1 + x)
    x0 = derivative(x, y, k);
    d = log(1 + x0) - (k * x0 + b);
    
    plot([x(1) x(size)], [y(1) y(size)], 'k--');
    plot([x(1) x(size)], [(y(1) + d) (y(size) + d)], 'k--');
    
    p2 = plot([x(1) x(size)], [(y(1) + d / 2) (y(size) + d / 2)], 'c');
    
    [x_a, y_a] = alternance(x, y, y(1) + d / 2 + (y(size) - y(1)) * (x - x(1)) / (x(size) - x(1)));
    p3 = plot(x_a, y_a, 'y*');
    
    legend([p p2 p3], 'f(x) = ln(1 + x)', 'P_{1}(x)', 'Alternance points', 'Location', 'northwest');
