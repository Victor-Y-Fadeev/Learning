function p = periodic(t, n)
    a_n = integral(@(x) (f(x) .* cos(n .* x .* 2 .* pi ./ t)), 0, t) * 2 / t;
    b_n = integral(@(x) (f(x) .* sin(n .* x .* 2 .* pi ./ t)), 0, t) * 2 / t;
    
    p = pi * power(power(a_n, 2) + power(b_n, 2), 0.5);
    