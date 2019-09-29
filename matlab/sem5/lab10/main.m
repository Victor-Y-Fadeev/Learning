function main
    t = pi;
    I = integral(@(x) f(x), 0, t); % 1.1826613914901571743423257630047200661477044564621470943952717719611206126695221362811266292045400618;
    % 100 digits of integral f(x) = log(1 + sin(x)^2)
    
    N = 5 : 21;
    for i = N
        % max f'' at 0 or pi on [0, pi]
        A(i - N(1) + 1) = abs(I - rectangles(inline('f(x)'), 0, t, i));
        T(i - N(1) + 1) = abs(t * power(t / (i - 1), 2) * f_dx_2(t) / 24);
        R(i - N(1) + 1) = abs(rectangles(inline('f(x)'), 0, t, i) - rectangles(inline('f(x)'), 0, t, round(i / 2))) / 3;
        P(i - N(1) + 1) = periodic(t, i);
    end
    
    T = table(N', A', T', R', P', ...
        'VariableNames', {'N', 'Actual', 'Theoretical', 'Runge', 'Periodic'});
    disp(T);
    