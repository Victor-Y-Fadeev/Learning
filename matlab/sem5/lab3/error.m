function e = error(correct, y0)
    e = floor(log10(y0(1)));

    for i = 2 : length(y0)
        if (e < floor(log10(y0(i))))
            e = floor(log10(y0(i)));
        end
    end
    
    e = power(10, e - correct + 1);
