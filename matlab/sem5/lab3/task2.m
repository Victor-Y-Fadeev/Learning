function T = task2(x, y, m)
    format long;
    n = length(x);
    
    for i = 1 : n
        T(i, 1) = y(i);
    end

    for j = 1 : m
        for i = 1 : n - j
            T(i, j + 1) = (T(i + 1, j) - T(i, j)) / (x(i + j) - x(i));
        end
    end
