function [a, b, c] = polynomial(x, y)
    sys(1, 1) = power(x(1), 2) - power(x(2), 2);
    sys(1, 2) = x(1) - x(2);
    sys(1, 3) = y(1) - y(2);
    
    sys(2, 1) = power(x(1), 2) - power(x(3), 2);
    sys(2, 2) = x(1) - x(3);
    sys(2, 3) = y(1) - y(3);

    a = (sys(1, 3) * sys(2, 2) - sys(2, 3) * sys(1, 2)) / (sys(1, 1) * sys(2, 2) - sys(2, 1) * sys(1, 2));
    b = (sys(1, 3) - sys(1, 1) * a) / sys(1, 2);
    c = y(1) - b * x(1) - a * x(1) * x(1);
