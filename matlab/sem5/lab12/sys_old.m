function F = sys_old(in, x, y)
    F = [ f(x, y) + f_dx(x, y) * (in(1) - x) + f_dy(x, y) * (in(2) - y)
          g(x, y) + g_dx(x, y) * (in(1) - x) + g_dy(x, y) * (in(2) - y) ];
