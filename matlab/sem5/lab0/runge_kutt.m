function [x, y] = runge_kutt(x0, y0, X, h)
    x = x0 : h : X;
    y(1) = y0;
    
    for i = 1 : length(x) - 1
        k1 = f(x(i), y(i)) * h;
        k2 = f(x(i) + h / 2, y(i) + k1 / 2) * h;
        k3 = f(x(i) + h / 2, y(i) + k2 / 2) * h;
        k4 = f(x(i) + h, y(i) + k3) * h;
    
        delta = (k1 + 2 * k2 + 2 * k3 + k4) / 6;
        y(i + 1) = y(i) + delta;
    end
