function changing = signs(alpha, beta, gamma)
    p(1) = 1;
    p(2) = alpha(1) - gamma;
    
    for i = 1 : length(beta)
        p(i + 2) = (alpha(i + 1) - gamma) * p(i + 1) - power(beta(i), 2) * p(i);
    end
    
    changing = 0;
    for i = 1 : length(p) - 1
        if p(i) < 0 && p(i + 1) >= 0
            changing = changing + 1;
        end
                
        if p(i) >= 0 && p(i + 1) < 0
            changing = changing + 1;
        end
    end
    