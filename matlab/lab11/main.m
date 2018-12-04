function main
    x0 = 2;
    x1 = 3;
    x2 = 2.5;
    n = 10;
    root = 2.58763784592346;

    y = abs(root - newton(x0, n));
    y2 = abs(root - secant(x0, x1, n));
    y3 = abs(root - direct_quadratic(x0, x1, x2, n));
    y4 = abs(root - inverse_quadratic(x0, x1, x2, n));
    y5 = abs(root - chebyshev(x0, n));
    y6 = abs(root - taylor(x0, n));

    x = 1 : n;
    semilogy(x, y, 'k');
    grid on;
    hold on;
    semilogy(x, y2, 'y');
    semilogy(x, y3, 'm'); 
    semilogy(x, y4, 'c');
    semilogy(x, y5, 'g');
    semilogy(x, y6, 'b');
    legend('Newton', 'Secant', 'Direct quadratic', 'Inverse quadratic', 'Chebyshev', 'Taylor', 'Location', 'southwest');
