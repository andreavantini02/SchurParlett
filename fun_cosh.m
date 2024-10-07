function y = fun_cosh(x,k)
r = mod(k,2);
switch r
    case 0
        y = cosh(x);
    case 1
        y = sinh(x);
end