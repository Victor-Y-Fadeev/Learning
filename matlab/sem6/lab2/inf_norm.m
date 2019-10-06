function a = inf_norm(A)
    a = max(sum(abs(A), 2));
    