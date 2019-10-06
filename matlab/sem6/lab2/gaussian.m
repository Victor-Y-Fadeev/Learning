function b = gaussian(A, b)
    % Get upper triangular matrix
    for i = 1 : length(A)
        % Check first zero
        if A(i, i) == 0
            % Search non-zero string
            j = i + 1;
            while A(j, i) == 0
                j = j + 1;
            end
            
            % Swap zero string
            for k = i : length(A)
                tmp = A(i, k);
                A(i, k) = A(j, k);
                A(j, k) = tmp;
            end
        end        
        
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
    