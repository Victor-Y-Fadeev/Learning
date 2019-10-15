function [X, A, b] = iterative(A, b, iter)
    % Counting Alpha & Beta
    for i = 1 : length(A)
        % Counting Beta
        b(i) = b(i) / A(i, i);
        X(i, 1) = b(i);
        
        % Dividing Alpha
        for j = 1 : i - 1
            A(i, j) = - A(i, j) / A(i, i);
        end      
        
        for j = i + 1 : length(A)
            A(i, j) = - A(i, j) / A(i, i);
        end
        
        A(i, i) = 0;
    end
    
    % Alpha
    %disp(A);
    
    % Beta
    %disp(b);
    
    % Zero step
    %disp(X(:, 1));
        
    % Algo steps
    for i = 1 : iter
        tmp = b.' + A * X(:, i);
        
        for j = 1 : length(A)
            X(j, i + 1) = tmp(j);
        end
        
        % Step print
        %disp(X(:, i + 1));
    end
    