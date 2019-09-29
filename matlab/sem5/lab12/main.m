function main
    X = sqrt(power(0.5 + sqrt(433 / 1728), 1 / 3) - 1 / power(864 + sqrt(433 * 1728), 1 / 3));
    Y = power(X, 3);
    
    x0 = 1;
    y0 = 1;
    
    options = optimset('TolFun', power(10, -15));
    n = 1 : 21;
    for i = n
        %x = x0 + (g(x0, y0) * f_dy(x0, y0) - g_dy(x0, y0) * f(x0, y0))...
        %    / (g_dy(x0, y0) * f_dx(x0, y0) - g_dx(x0, y0) * f_dy(x0, y0));
        %y = y0 + (g(x0, y0) * f_dx(x0, y0) - g_dx(x0, y0) * f(x0, y0))...
        %    / (g_dx(x0, y0) * f_dy(x0, y0) - g_dy(x0, y0) * f_dx(x0, y0));
        
        temp = fsolve(@(in) sys(in, x0, y0), [1;1], options);
        x = temp(1);
        y = temp(2);
    
        r(i) = sqrt(power(x - X, 2) + power(y - Y, 2));
        
        x0 = x;
        y0 = y;
    end
    
    semilogy(n, r);
    grid on;
    hold on;
    
    %solution(x, y);
    