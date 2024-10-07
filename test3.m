clear all
close all
n_test = 1000;
n = 10;
fun = @(x,k) fun_exp(x,k);
n_err = 0;
for i = 1:n_test
    A = randn(n);
    F = fun_m(A,fun);
    F1 = funm(A,fun);
    errRel(i) = norm(F-F1,inf)/norm(F1,inf);
    if errRel(i) > 1e-14
        n_err = n_err + 1;
    end
end