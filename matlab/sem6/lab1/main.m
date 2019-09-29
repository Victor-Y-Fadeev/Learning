function main
    A = [1 1 1; 4 2 1; 9 3 1];
    b = [0 1 3];
    
    %A(1, 1) = 0;
    x = gaussian(A, b);
    
    %disp(size(A));
    %disp(A);
    %disp(b);    
    %disp(x);
    