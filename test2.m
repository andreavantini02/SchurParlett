clear all
close all
n_test = 1000;
n = 100;
delta = 0.1;
n_err = 0;
for i = 1:n_test
    A = randn(n)/10;
    [U,T] = schur(A,'complex');
    q = blockPattern(diag(T),delta);
    m = max(q);
    if m > 1
        L = diag(T);
        for j = 1:m
            X = L(q==j);
            Y = (L(q~=j));
            if (size(X,1) > 1)    
                TF(j) = max(min(abs(X-X.')+diag(inf(size(X,1),1)))) <= delta;
                TF1(j) = max(min(abs(X-Y.'))) > delta;
            else
                TF(j) = true;
                TF1(j) = max(min(abs(X-Y.'))) > delta;
            end
        end
        if (min(TF) == 0) || (min(TF1) == 0)
            n_err = n_err + 1;
        end
    end
end