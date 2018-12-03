function graph_r(I, a, b, from, to)
    hold off;
    
    x = from : to;
    for i = x
        actual(i - 4) = abs(I - rectangles(a, b, i));
        theoretical(i - 4) = abs((b - a) * power((b - a) / (i - 1), 2) * (-1 / power(1 + a, 2)) / 24);
        runge(i - 4) = abs(rectangles(a, b, i) - rectangles(a, b, round(i / 2))) / 3;
    end
        
    semilogy(x, actual, 'b');
    grid on;
    hold on;
    
    semilogy(x, theoretical, 'c');
    semilogy(x, runge, 'm');    
    legend('Actual error', 'Theoretical error', 'Runge error', 'Location', 'east');
    