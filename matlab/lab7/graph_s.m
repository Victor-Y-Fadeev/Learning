function graph_s(I, a, b, from, to)
    hold off;
    
    x = from : to;
    for i = x
        actual(i - 4) = abs(I - simpson(a, b, i));
        theoretical(i - 4) = abs((b - a) * power((b - a) / (i - 1), 3) * (2 / power(1 + a, 3)) / 288);
        runge(i - 4) = abs(simpson(a, b, i) - simpson(a, b, round(i / 2))) / 15;
    end
        
    semilogy(x, actual, 'b');
    grid on;
    hold on;
    
    semilogy(x, theoretical, 'c');
    semilogy(x, runge, 'm');    
    legend('Actual error', 'Theoretical error', 'Runge error', 'Location', 'east');
    