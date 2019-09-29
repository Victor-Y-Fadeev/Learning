function main
    x0 = 2;
    x1 = 3;
    x2 = 2.5;
    n = 10;
    root = 2.58763784592346;

    y = abs(root - newton(x0, n, 0));
    %y2 = abs(root - secant(x0, x1, n));
    %y3 = abs(root - direct_quadratic(x0, x1, x2, n));
    %y4 = abs(root - inverse_quadratic(x0, x1, x2, n));
    y5 = abs(root - chebyshev(x0, n, 0));
    y6 = abs(root - taylor(x0, n, 0));

    x = 1 : n;
    semilogy(x, y, 'k');
    grid on;
    hold on;
    %semilogy(x, y2, 'y');
    %semilogy(x, y3, 'm'); 
    %semilogy(x, y4, 'c');
    semilogy(x, y5, 'g');
    semilogy(x, y6, 'b');
    %legend('Newton', 'Secant', 'Direct quadratic', 'Inverse quadratic', 'Chebyshev', 'Taylor', 'Location', 'southwest');
    
    v = 0.0000001;
    yy = abs(root - newton(x0, n, v));
    yy5 = abs(root - chebyshev(x0, n, v));
    yy6 = abs(root - taylor(x0, n, v));
    semilogy(x, yy, 'k--');
    semilogy(x, yy5, 'g--'); 
    semilogy(x, yy6, 'b--');
    legend('Newton', 'Chebyshev', 'Taylor', 'Newton (~)', 'Chebyshev (~)', 'Taylor (~)');
