function y = fun_sinh(x,k)
r = mod(k,2);
switch r
    case 0
        y = sinh(x);
    case 1
        y = cosh(x);
end