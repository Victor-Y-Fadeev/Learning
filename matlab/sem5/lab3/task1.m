function T = task1(n, m)
    format long;
    x = 0 : 0.01 : 0.01 * n;
    
    for i = 1 : n
        T(i, 1) = f(x(i));
    end

    for j = 1 : m
        for i = 1 : n - j
            T(i, j + 1) = (T(i + 1, j) - T(i, j));
        end
    end

    e = error(15, f(x));
    T(n + 1, 1) = e;
    for i = 1 : m
        T(n + 1, i + 1) = power(2, i) * e;
    end
    