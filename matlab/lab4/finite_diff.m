function T = finite_diff(y, n)
    format long;
    
    for i = 1 : n
        T(i, 1) = y(i);
    end

    for j = 1 : n
        for i = 1 : n - j
            T(i, j + 1) = (T(i + 1, j) - T(i, j));
        end
    end
