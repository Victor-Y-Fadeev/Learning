function R = max_diff(y, y2)
    R = 0;
    
    for i = 1 : length(y)
        if (abs(y(i) - y2(i)) > R)
            R = abs(y(i) - y2(i));
        end
    end
