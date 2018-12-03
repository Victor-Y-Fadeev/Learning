function F = sys(in, x, y)
    F = [ f(x, y) + f_dx(x, y) * (in(1) - x) + f_dy(x, y) * (in(2) - y) + 0.5 * f_dx_dx(x, y) * power(in(1) - x, 2) + f_dx_dy(x, y) * (in(1) - x) * (in(2) - y) + 0.5 * f_dy_dy(x, y) * power(in(2) - y, 2)
          g(x, y) + g_dx(x, y) * (in(1) - x) + g_dy(x, y) * (in(2) - y) + 0.5 * g_dx_dx(x, y) * power(in(1) - x, 2) + g_dx_dy(x, y) * (in(1) - x) * (in(2) - y) + 0.5 * g_dy_dy(x, y) * power(in(2) - y, 2) ];
