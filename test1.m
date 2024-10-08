clear all
close all
n_test = 1000;
n = 5;
sigma = 10;
var = 1/10;
max_its = 100;
fun = @(x,k) fun_exp(x,k);
n_err = 0;
for i = 1:n_test
    T = randn(n,n);
    T = triu(T,1);
    D = sigma + randn(n,1)*var;
    T = T + diag(D);
    F = evaluateAtomicBlock(T,fun,max_its);
    F1 = funm(T,@exp);
    errAss(i) = norm(F-F1,inf);
    errRel(i) = errAss(i)/norm(F1,inf);
    if errRel(i) > 1e-10
        n_err = n_err + 1;
    end
end
