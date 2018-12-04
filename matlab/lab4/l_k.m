function l = l_k(x, k, x0)
    l = 1;
    
    for j = 1 : length(x0)
        if (j ~= k)
            l = l * (x - x0(j)) / (x0(k) - x0(j));
        end
    end
