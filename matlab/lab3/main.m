function main
    T = task1(10, 10);
    O = array2table(T, ...
        'VariableNames', { 'n', 'm_1', 'm_2', 'm_3', 'm_4', 'm_5', 'm_6', 'm_7', 'm_8', 'm_9', 'm_10' }, ...
        'RowNames', { 'n = 1', 'n = 2', 'n = 3', 'n = 4', 'n = 5', 'n = 6', 'n = 7', 'n = 8', 'n = 9', 'n = 10', '2^m * e'});
    disp(O);
    
    x = [0.5 0.6 0.4 0.7 0.3];
    y = f(x);
    T2 = task2(x, y, 5);
    O2 = array2table(T2, ...
        'VariableNames', { 'n', 'm_1', 'm_2', 'm_3', 'm_4' });
    disp(O2);
    
    %f_dx_4 = T2(1, 5) * factorial(4);
    %disp("f''''(x) = " + f_dx_4);
    