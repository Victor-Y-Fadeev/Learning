function d = derivatives(a, x0)
    b = horner(a, x0);
    d(1) = b(length(a));

    for i = 1 : length(a) - 1
        b = horner(b, x0);
        d(1 + i) = b(length(a) - i) * factorial(i);
    end
