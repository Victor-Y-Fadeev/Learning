function T = task1(n, m)
    format long;
    x = 0 : 0.01 : 0.1;
    
    for i = 1 : n
        T(i, 1) = f(x(i));
    end

    for j = 1 : m
        for i = 1 : n - j
            T(i, j + 1) = (T(i + 1, j) - T(i, j));
        end
    end

    e = power(10, -15);
    T(n + 1, 1) = e;
    for i = 1 : m
        T(n + 1, i + 1) = power(2, i) * e;
    end
    