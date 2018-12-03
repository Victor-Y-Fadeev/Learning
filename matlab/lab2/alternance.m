function [x_a, y_a] = alternance(x, y, y2)
    quantity = 1;
    result(1) = 1;
    
    diff = abs(y2 - y);
    
    for i = 2 : length(x)
        if (abs(diff(result(1)) - diff(i)) < 0.0000000001)
            quantity = quantity + 1;
            result(quantity) = i;
        elseif (diff(result(1)) < diff(i))
            quantity = 1;
            result(1) = i;
        end
    end
    
    for i = 1 : quantity
        x_a(i) = x(result(i));
        y_a(i) = y(result(i));
    end
