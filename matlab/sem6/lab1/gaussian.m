function b = gaussian(A, b)
    % Check first zero
    i = 1;
    while A(i, 1) == 0
        i = i + 1;
    end
    
    % Swap zero string
    if i ~= 1
        for j = 1 : length(A)
            tmp = A(1, j);
            A(1, j) = A(i, j);
            A(i, j) = tmp;
        end
    end

    % Get upper triangular matrix
    for i = 1 : length(A)
        % Dividing by first element
        b(i) = b(i) / A(i, i);
        for j = length(A) : -1 : i
            A(i, j) = A(i, j) / A(i, i);
        end
        %disp(A);
        %disp(b);
        
        % Remove first element
        for j = i + 1 : length(A)
            b(j) = b(j) - A(j, i) * b(i);
            for k = length(A) : -1 : i
                A(j, k) = A(j, k) - A(j, i) * A(i, k);
            end
        end
        %disp(A);
        %disp(b);
    end
    
    % Get identity matrix
    for i = length(A) : -1 : 2
        for j = i - 1 : -1 : 1
            b(j) = b(j) - A(j, i) * b(i);
            A(j, i) = 0;
        end
        %disp(A);
        %disp(b);
    end
    