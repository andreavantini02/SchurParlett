function y = fun_log(x,k)
if k == 0
    y = log(x);
else
    y = (x.^(-k))*factorial(k-1)*(-1)^(k+1);
end