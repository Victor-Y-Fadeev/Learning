function solution(x_n, y_n)
    hold off;
    
    x = -2 : 0.00001 : 2;
    for i = 1 : length(x)
        y(i) = sqrt(1 - x(i) * x(i) / 4);
        y2(i) = - y(i);
        y3(i) = x(i) * x(i) * x(i);
    end
        
    p = plot(x, y, 'b');
    grid on;
    hold on;
    
    plot(x, y2, 'b');
    p2 = plot(x, y3, 'm');
    
    p3 = plot([x_n], [y_n], 'k*');
    legend([p p2 p3], 'f(x)', 'g(x)', 'Solution', 'Location', 'northwest');
    