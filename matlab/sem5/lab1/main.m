function main
    a = [5 -2 -5 -2];
    x = 1 : 0.00001 : 2;
    
    for i = 1 : length(x)
        d = derivatives(a, x(i));        
        y(i) = d(1);
        y2(i) = d(2);
        y3(i) = d(3);
        y4(i) = d(4);
    end

    plot(x, y, 'b');
    grid on;
    hold on;
    
    plot(x, y2, 'c');
    plot(x, y3, 'g');
    plot(x, y4, 'k');
    legend('P_{n}', 'P''_{n}', 'P''''_{n}', 'P''''''_{n}', 'Location', 'northwest');
  